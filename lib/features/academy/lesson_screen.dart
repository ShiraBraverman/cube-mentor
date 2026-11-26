import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/celebration/celebration.dart';
import '../../core/cube/cube_move.dart';
import '../../core/cube/cube_state.dart';
import '../../core/feedback/feedback_service.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/move_words.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/sticker_palette.dart';
import '../../core/theme/ui_kit.dart';
import '../solver_3d/model/cube_session.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../solver_3d/widgets/cube_viewport.dart';
import '../solver_3d/widgets/double_turn_badge.dart';
import '../solver_3d/widgets/move_instruction.dart';
import '../solver_3d/widgets/solve_banner.dart';
import 'academy_screen.dart';
import 'model/academy_progress.dart';
import 'model/cue_text.dart';
import 'model/lesson.dart';
import 'model/lesson_catalog.dart';
import 'model/lesson_goal.dart';
import 'model/walkthrough.dart';
import 'widgets/hold_prompt.dart';
import 'widgets/lesson_intro.dart';
import 'widgets/wing_parity_rule.dart';

/// The four stages of every lesson, shown as pills at the top.
enum LessonStage {
  /// The goal card and the explanations without a demonstration.
  concept,

  /// Guided examples with color-specific callouts.
  examples,

  /// Realistic walkthroughs of the whole step, with bonus cases.
  practice,

  /// Lesson complete: the next lesson or free practice.
  next,
}

/// One screen of a lesson. Lessons are a flat list of pages grouped into
/// the four [LessonStage]s; Previous / Next walk through them (and through
/// the moves of each demonstration), the stage pills jump between stages.
@immutable
class _Page {
  const _Page(
    this.stage, {
    this.step,
    this.walk,
    this.index = 0,
    this.count = 0,
  });

  final LessonStage stage;

  /// A concept or example part.
  final LessonStep? step;

  /// A stage-3 walkthrough.
  final Walkthrough? walk;

  /// Position among the pages of the same kind.
  final int index;
  final int count;

  bool get isIntro => stage == LessonStage.concept && step == null;
  bool get isDone => stage == LessonStage.next;
  bool get hasDemo => walk != null || (step?.isExample ?? false);
}

List<_Page> _pagesOf(Lesson lesson) {
  final concepts = lesson.concepts;
  final examples = lesson.examples;
  final walks = lesson.practice;
  return [
    const _Page(LessonStage.concept),
    for (final (i, step) in concepts.indexed)
      _Page(LessonStage.concept, step: step, index: i, count: concepts.length),
    for (final (i, step) in examples.indexed)
      _Page(LessonStage.examples, step: step, index: i, count: examples.length),
    for (final (i, walk) in walks.indexed)
      _Page(LessonStage.practice, walk: walk, index: i, count: walks.length),
    const _Page(LessonStage.next),
  ];
}

/// Plays one lesson in four stages: the concept (goal card and
/// explanations), guided examples, realistic walkthroughs of the whole
/// step, and the choice between the next lesson and free practice.
///
/// Every demonstration runs on the live 3D cube one move at a time (no
/// auto-play, so learners never rush), with arrows for each move, a
/// color-specific callout for each stretch and a `×2` pill on half turns.
class LessonScreen extends ConsumerStatefulWidget {
  const LessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen> {
  late final List<_Page> _pages = _pagesOf(widget.lesson);
  final Map<int, List<WalkBeat>> _beats = {};
  int _page = 0;

  Lesson get _lesson => widget.lesson;
  _Page get _current => _pages[_page];

  @override
  void initState() {
    super.initState();
    // Providers cannot change while the tree builds: load right after.
    Future.microtask(() {
      if (!mounted) return;
      ref.read(academyProgressProvider.notifier).open(_lesson.id);
    });
  }

  /// The analyzed stretches of page [index]'s demonstration.
  List<WalkBeat> _beatsOf(int index) => _beats.putIfAbsent(index, () {
    final page = _pages[index];
    final target = lessonGoal(_lesson.id).target;
    final walk = page.walk;
    if (walk != null) {
      return analyzeBeats(
        size: _lesson.size,
        setup: walk.setup,
        segments: walk.segments,
        target: target,
      );
    }
    final step = page.step;
    if (step == null || !step.isExample) return const [];
    return analyzeBeats(
      size: _lesson.size,
      setup: step.setup,
      segments: [WalkSegment(step.demo, step.cue)],
      target: target,
    );
  });

  void _load(_Page page) {
    final size = _lesson.size;
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final walk = page.walk;
    final step = page.step;
    if (walk != null) {
      controller.loadGuide(
        walk.startCube(size),
        walk.demoMoves(size),
        phase: _lesson.id,
        explanation: 'walkthrough${page.index + 1}',
      );
    } else if (step != null) {
      final moves = step.demoMoves(size);
      if (moves.isEmpty) {
        controller.load(step.startCube(size));
      } else {
        controller.loadGuide(
          step.startCube(size),
          moves,
          phase: _lesson.id,
          explanation: step.id,
        );
      }
    }
  }

  void _goTo(int index) {
    if (index == _page) return;
    setState(() => _page = index);
    final page = _pages[index];
    _load(page);
    if (page.isDone) _complete();
  }

  /// Jumps to the first page of [stage].
  void _openStage(LessonStage stage) {
    ref.read(feedbackProvider).step();
    _goTo(_pages.indexWhere((p) => p.stage == stage));
  }

  Future<void> _complete() async {
    ref.read(feedbackProvider).success();
    await ref.read(academyProgressProvider.notifier).complete(_lesson.id);
  }

  /// [action] preceded by the soft step-complete tick.
  VoidCallback _ticked(VoidCallback action) => () {
    ref.read(feedbackProvider).step();
    action();
  };

  /// Previous move of this page's demo, else the previous page.
  VoidCallback? _previous(CubeSession session) {
    if (session.isHandTurning || session.isPreviewing) return null;
    if (_current.hasDemo && session.hasPlayback && session.canStepBack) {
      return _ticked(
        ref.read(cubeSessionProvider(_lesson.size).notifier).stepBack,
      );
    }
    return _page > 0 ? _ticked(() => _goTo(_page - 1)) : null;
  }

  /// Next move of this page's demo, else the next page.
  VoidCallback? _next(CubeSession session) {
    if (session.isHandTurning || session.isPreviewing) return null;
    if (_current.hasDemo && session.hasPlayback && session.canStepForward) {
      return _ticked(
        ref.read(cubeSessionProvider(_lesson.size).notifier).stepForward,
      );
    }
    return _page + 1 < _pages.length ? _ticked(() => _goTo(_page + 1)) : null;
  }

  String _pageLabel(AppLocalizations l10n, _Page page) => switch (page.stage) {
    LessonStage.examples => l10n.lessonExampleOf(page.index + 1, page.count),
    LessonStage.practice => l10n.lessonWalkthroughOf(
      page.index + 1,
      page.count,
    ),
    _ => l10n.lessonPartOf(page.index + 1, page.count),
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = _lesson.size;
    final session = ref.watch(cubeSessionProvider(size));
    final page = _current;
    final beats = _beatsOf(_page);
    final beat = _beatAt(beats, session);

    final Widget body;
    if (page.isIntro) {
      body = LessonIntroCard(
        lesson: _lesson,
        objective: true,
        onStart: _ticked(() => _goTo(1)),
      );
    } else if (page.isDone) {
      body = _NextStage(lesson: _lesson);
    } else {
      body = Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _pageLabel(l10n, page),
                  key: const ValueKey('lesson-part'),
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColors.accent,
                  ),
                ),
              ),
              if (beat?.bonus ?? false)
                AppPill(
                  key: const ValueKey('lesson-bonus'),
                  label: l10n.lessonBonusCase,
                  icon: Icons.auto_awesome_rounded,
                  color: AppColors.gold,
                  filled: true,
                ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                const Positioned.fill(child: CubeStage(intensity: 0.7)),
                Positioned.fill(
                  child: CubeViewport(
                    size: size,
                    // The pieces the current callout talks about glow; the
                    // rest of the cube steps back.
                    highlighted: {
                      ...solveHighlights(session),
                      ...?beat?.targets,
                    },
                    focus: solveFocus(session),
                  ),
                ),
                PositionedDirectional(
                  top: AppSpace.xs,
                  start: 0,
                  end: 0,
                  child: Center(child: DoubleTurnBadge(size: size)),
                ),
              ],
            ),
          ),
          // Under the cube, never over it.
          _Explanation(lesson: _lesson, page: page, beat: beat),
          SizedBox(height: isBigCube(size) ? 4 : 8),
          _LessonNav(
            onPrevious: _previous(session),
            onNext: _next(session),
            stepsMove:
                page.hasDemo && session.hasPlayback && session.canStepForward,
            last: _pages[_page + 1].isDone,
          ),
        ],
      );
    }

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(lessonTitle(l10n, _lesson.id))),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  AppSpace.md,
                  AppSpace.xxs,
                  AppSpace.md,
                  AppSpace.md,
                ),
                child: Column(
                  children: [
                    LessonStageBar(active: page.stage, onSelect: _openStage),
                    const SizedBox(height: AppSpace.xs),
                    Expanded(child: body),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The beat on screen: the one holding the next move, or the last one
/// once the demonstration is done.
WalkBeat? _beatAt(List<WalkBeat> beats, CubeSession session) {
  if (beats.isEmpty) return null;
  final index = session.currentStepIndex;
  for (final beat in beats) {
    if (beat.contains(index)) return beat;
  }
  return beats.last;
}

/// The four stage pills; the active one is lit, earlier ones are checked,
/// and any of them can be tapped to jump there.
class LessonStageBar extends StatelessWidget {
  const LessonStageBar({
    super.key,
    required this.active,
    required this.onSelect,
  });

  final LessonStage active;
  final ValueChanged<LessonStage> onSelect;

  static String nameOf(AppLocalizations l10n, LessonStage stage) =>
      switch (stage) {
        LessonStage.concept => l10n.lessonStageConcept,
        LessonStage.examples => l10n.lessonStageExamples,
        LessonStage.practice => l10n.lessonStagePractice,
        LessonStage.next => l10n.lessonStageNext,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    const stages = LessonStage.values;
    return IntrinsicHeight(
      child: Row(
        key: const ValueKey('lesson-stages'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final stage in stages) ...[
            if (stage.index > 0) const SizedBox(width: 6),
            Expanded(
              child: () {
                final selected = stage == active;
                final done = stage.index < active.index;
                final color = selected
                    ? AppColors.accent
                    : (done
                          ? AppColors.accentSecondary
                          : AppColors.textTertiary);
                final name = nameOf(l10n, stage);
                return Semantics(
                  button: true,
                  selected: selected,
                  label: l10n.lessonStageOf(
                    stage.index + 1,
                    stages.length,
                    name,
                  ),
                  excludeSemantics: true,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      key: ValueKey('lesson-stage-${stage.index}'),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      onTap: () => onSelect(stage),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        constraints: const BoxConstraints(minHeight: 44),
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          6,
                          6,
                          6,
                          6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          color: selected
                              ? color.withValues(alpha: 0.22)
                              : color.withValues(alpha: 0.08),
                          border: Border.all(
                            color: color.withValues(
                              alpha: selected ? 0.9 : 0.35,
                            ),
                            width: selected ? 1.5 : 1,
                          ),
                        ),
                        // Number above the name: the full pill width is
                        // left for the word, so it never breaks mid-word
                        // on a 360 dp phone.
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selected || done
                                    ? color
                                    : color.withValues(alpha: 0.2),
                              ),
                              child: done
                                  ? const Icon(
                                      Icons.check_rounded,
                                      size: 13,
                                      color: AppColors.onAccent,
                                    )
                                  : Text(
                                      '${stage.index + 1}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        height: 1,
                                        fontWeight: FontWeight.w800,
                                        color: selected
                                            ? AppColors.onAccent
                                            : AppColors.textSecondary,
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 3),
                            Flexible(
                              child: Text(
                                name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: textTheme.labelSmall?.copyWith(
                                  color: selected
                                      ? AppColors.textPrimary
                                      : AppColors.textSecondary,
                                  fontWeight: selected
                                      ? FontWeight.w800
                                      : FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }(),
            ),
          ],
        ],
      ),
    );
  }
}

/// The lesson's single Previous / Next row.
class _LessonNav extends StatelessWidget {
  const _LessonNav({
    required this.onPrevious,
    required this.onNext,
    required this.stepsMove,
    required this.last,
  });

  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  /// Next plays a demo move (rather than opening the next page).
  final bool stepsMove;

  /// The next page is the lesson's last stage.
  final bool last;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final finish = last && !stepsMove;
    Widget label(String text) =>
        FittedBox(fit: BoxFit.scaleDown, child: Text(text, maxLines: 1));
    return Row(
      children: [
        Expanded(
          child: FilledButton.tonalIcon(
            key: const ValueKey('lesson-prev'),
            style: FilledButton.styleFrom(minimumSize: const Size(0, 48)),
            onPressed: onPrevious,
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: label(l10n.lessonPrevious),
          ),
        ),
        const SizedBox(width: AppSpace.sm),
        Expanded(
          child: FilledButton.icon(
            key: const ValueKey('lesson-next'),
            style: FilledButton.styleFrom(minimumSize: const Size(0, 48)),
            onPressed: onNext,
            icon: Icon(
              finish
                  ? Icons.check_rounded
                  : (stepsMove
                        ? Icons.skip_next_rounded
                        : Icons.arrow_forward_rounded),
              size: 18,
            ),
            label: label(finish ? l10n.lessonFinish : l10n.lessonNext),
          ),
        ),
      ],
    );
  }
}

/// The move on screen as an arrow and plain words, always visible, over
/// the stretch's color-specific callout and the part's explanation, which
/// fold away so the cube keeps its room.
class _Explanation extends ConsumerStatefulWidget {
  const _Explanation({
    required this.lesson,
    required this.page,
    required this.beat,
  });

  final Lesson lesson;
  final _Page page;
  final WalkBeat? beat;

  @override
  ConsumerState<_Explanation> createState() => _ExplanationState();
}

class _ExplanationState extends ConsumerState<_Explanation> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final scheme = StickerPalette.schemeOf(context);
    final size = widget.lesson.size;
    // Big cubes: a tighter card, so the cube gets the room its small
    // stickers need.
    final compact = isBigCube(size);
    final page = widget.page;
    final step = page.step;
    final beat = widget.beat;
    final session = ref.watch(cubeSessionProvider(size));
    final current = session.currentStep;
    final secondary = textTheme.bodySmall?.copyWith(
      color: AppColors.textSecondary,
    );
    final body = compact ? textTheme.bodySmall : textTheme.bodyMedium;
    // How to hold the cube: as the current stretch starts (walkthroughs
    // turn the whole cube between slots), else as the part says.
    final top = beat?.top ?? step?.top ?? StickerColor.white;
    final front = beat?.front ?? step?.front ?? StickerColor.green;
    final hold = holdPrompt(l10n, top, front, scheme: scheme);
    final cue = beat == null ? '' : cueText(l10n, beat, scheme: scheme);

    final Widget move;
    if (!session.hasPlayback || current == null) {
      move = Text(
        session.hasPlayback ? l10n.lessonDemoDone : l10n.lessonLookAround,
        key: const ValueKey('lesson-move-words'),
        style: textTheme.bodyMedium?.copyWith(
          color: AppColors.accentSecondary,
          fontWeight: FontWeight.w600,
        ),
      );
    } else {
      // Half made by hand: what is left of the move.
      final shown =
          session.guideMove ?? session.playback[session.currentStepIndex];
      move = MoveInstructionTile(
        key: ValueKey('lesson-move-${session.currentStepIndex}'),
        move: shown,
        size: size,
        badgeSize: compact ? 38 : 44,
      );
    }

    return GlassCard(
      key: const ValueKey('lesson-explanation'),
      padding: compact
          ? const EdgeInsetsDirectional.fromSTEB(10, 3, 4, 3)
          : const EdgeInsetsDirectional.fromSTEB(12, 8, 4, 8),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // How to hold the cube, at a glance; the sentence is in the
                // details below.
                Tooltip(
                  message: hold,
                  child: HoldSwatch(
                    key: const ValueKey('lesson-hold'),
                    top: top,
                    front: front,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 180),
                    child: move,
                  ),
                ),
                IconButton(
                  key: const ValueKey('lesson-collapse'),
                  tooltip: _expanded ? l10n.solveCollapse : l10n.solveExpand,
                  visualDensity: VisualDensity.compact,
                  onPressed: () => setState(() => _expanded = !_expanded),
                  icon: Icon(
                    _expanded
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                  ),
                ),
              ],
            ),
            if (session.stepHint case final hint?)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 4, end: 8),
                child: StepHintText(hint: hint),
              ),
            if (_expanded)
              // Long translations scroll inside the card instead of
              // squeezing the cube away.
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight:
                      MediaQuery.sizeOf(context).height *
                      (compact ? 0.15 : 0.22),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsetsDirectional.only(
                    top: compact ? 4 : 8,
                    end: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (cue.isNotEmpty) ...[
                        _CueCallout(
                          text: cue,
                          moves: beat!.moves,
                          size: size,
                          bonus: beat.bonus,
                          compact: compact,
                        ),
                        SizedBox(height: compact ? 4 : 8),
                      ],
                      Text(
                        hold,
                        key: const ValueKey('lesson-hold-text'),
                        style: secondary,
                      ),
                      const SizedBox(height: 6),
                      if (step != null) ...[
                        Text(
                          lessonStepTitle(l10n, step.id),
                          key: const ValueKey('lesson-step-title'),
                          style: compact
                              ? textTheme.titleSmall
                              : textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(lessonStepBody(l10n, step.id), style: body),
                        if (step.id == 'sixWingRule') ...[
                          const SizedBox(height: 8),
                          const WingParityRule(),
                        ],
                      ] else
                        // Stage 3 goes straight to the coaching: how this
                        // step is solved, in the lesson's own words.
                        Text(
                          introHowText(l10n, widget.lesson.id),
                          key: const ValueKey('lesson-practice-coach'),
                          style: body,
                        ),
                      if (session.guideMove != null &&
                          session.stepHint == null) ...[
                        const SizedBox(height: 6),
                        Text(l10n.lessonTryIt, style: secondary),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// The color-specific callout of the current stretch, with its moves in
/// notation (always left to right).
class _CueCallout extends StatelessWidget {
  const _CueCallout({
    required this.text,
    required this.moves,
    required this.size,
    required this.bonus,
    this.compact = false,
  });

  final String text;
  final String moves;
  final int size;
  final bool bonus;

  /// Big cubes: tighter padding and smaller text.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = bonus ? AppColors.gold : AppColors.accentSecondary;
    // Only whole-notation moves are shown; a parse failure would be a
    // catalogue bug, caught by the tests.
    final count = MoveNotation.parseSequence(moves, size).length;
    return Container(
      key: const ValueKey('lesson-cue'),
      width: double.infinity,
      padding: compact
          ? const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 5)
          : const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        color: accent.withValues(alpha: 0.1),
        border: BorderDirectional(start: BorderSide(color: accent, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: (compact ? textTheme.bodySmall : textTheme.bodyMedium)
                ?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          if (count > 0) ...[
            SizedBox(height: compact ? 3 : 6),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                moves,
                key: const ValueKey('lesson-cue-moves'),
                style: textTheme.labelLarge?.copyWith(
                  color: accent,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Stage 4: the lesson is complete; go on to the next lesson or practice
/// freely on a scrambled cube.
class _NextStage extends ConsumerWidget {
  const _NextStage({required this.lesson});

  final Lesson lesson;

  void _freePractice(BuildContext context, AppLocalizations l10n) {
    final size = lesson.size;
    final scrambled = CubeState.solved(size)
        .applyAll(CubeState.randomScramble(size));
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => Solver3DScreen(
          size: size,
          initialCube: scrambled,
          title: l10n.lessonFreePractice,
          practiceBanner: l10n.freePracticeBanner(lessonTitle(l10n, lesson.id)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final index = lessonIndex(lesson.id);
    final next = index + 1 < kLessons.length ? kLessons[index + 1] : null;
    return SingleChildScrollView(
      key: const ValueKey('lesson-complete'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CelebrationCard(
            message: l10n.lessonComplete,
            icon: Icons.school_rounded,
          ),
          const SizedBox(height: 8),
          Text(
            lessonTitle(l10n, lesson.id),
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpace.md),
          if (next != null) ...[
            _ChoiceCard(
              key: const ValueKey('lesson-next-lesson'),
              icon: Icons.arrow_forward_rounded,
              accent: AppColors.accent,
              title: l10n.lessonNextLesson,
              description: l10n.lessonContinueDesc(lessonTitle(l10n, next.id)),
              onTap: () => openLesson(context, ref, next, replace: true),
            ),
            const SizedBox(height: AppSpace.sm),
          ],
          _ChoiceCard(
            key: const ValueKey('lesson-free-practice'),
            icon: Icons.view_in_ar_rounded,
            accent: AppColors.accentSecondary,
            title: l10n.lessonFreePractice,
            description: l10n.lessonFreePracticeDesc,
            onTap: () => _freePractice(context, l10n),
          ),
          const SizedBox(height: AppSpace.xs),
          TextButton(
            key: const ValueKey('lesson-back-academy'),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.lessonBackToAcademy),
          ),
        ],
      ),
    );
  }
}

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({
    super.key,
    required this.icon,
    required this.accent,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final Color accent;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      onTap: onTap,
      selected: true,
      accent: accent,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.md,
        AppSpace.sm,
        AppSpace.md,
      ),
      child: Row(
        children: [
          AccentIcon(icon: icon, color: accent, size: 48, glow: true),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(description, style: textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          // Mirrors automatically in RTL (matchTextDirection).
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textTertiary,
          ),
        ],
      ),
    );
  }
}
