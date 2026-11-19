import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../solver_3d/model/cube_session.dart';
import '../solver_3d/widgets/cube_viewport.dart';
import '../solver_3d/widgets/move_instruction.dart';
import '../solver_3d/widgets/solve_banner.dart';
import 'academy_screen.dart';
import 'model/academy_progress.dart';
import 'model/lesson.dart';
import 'model/lesson_catalog.dart';
import 'widgets/hold_prompt.dart';
import 'widgets/lesson_intro.dart';

/// Plays one lesson: each part pairs a plain-language explanation and an
/// orientation prompt with a live 3D demonstration the learner steps
/// through one move at a time (Previous move / Next move) or follows with
/// their own swipes (arrows guide every move).
class LessonScreen extends ConsumerStatefulWidget {
  const LessonScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen> {
  int _step = 0;
  bool _finished = false;

  /// The "before -> after" goal card shows first, and again on request.
  bool _showIntro = true;

  Lesson get _lesson => widget.lesson;
  LessonStep get _current => _lesson.steps[_step];

  @override
  void initState() {
    super.initState();
    // Providers cannot change while the tree builds: load right after.
    Future.microtask(() {
      if (!mounted) return;
      ref.read(academyProgressProvider.notifier).open(_lesson.id);
      _loadStep();
    });
  }

  void _loadStep() {
    final step = _current;
    final size = _lesson.size;
    final controller = ref.read(cubeSessionProvider(size).notifier);
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

  void _goTo(int step) {
    setState(() => _step = step);
    _loadStep();
  }

  Future<void> _finish() async {
    await ref.read(academyProgressProvider.notifier).complete(_lesson.id);
    if (mounted) setState(() => _finished = true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = _lesson.size;
    final session = ref.watch(cubeSessionProvider(size));
    final steps = _lesson.steps.length;
    final step = _current;

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(lessonTitle(l10n, _lesson.id)),
          actions: [
            if (!_finished && !_showIntro)
              IconButton(
                key: const ValueKey('lesson-intro-open'),
                tooltip: l10n.introShowGoal,
                onPressed: () => setState(() => _showIntro = true),
                icon: const Icon(Icons.flag_circle_outlined),
              ),
          ],
        ),
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
                child: _finished
                    ? _Completed(lesson: _lesson)
                    : _showIntro
                    ? LessonIntroCard(
                        lesson: _lesson,
                        onStart: () => setState(() => _showIntro = false),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                l10n.lessonPartOf(_step + 1, steps),
                                key: const ValueKey('lesson-part'),
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.accent,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: GlowProgressBar(
                                  value: (_step + 1) / steps,
                                  height: 6,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          HoldPrompt(
                            key: const ValueKey('lesson-hold'),
                            top: step.top,
                            front: step.front,
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                const Positioned.fill(
                                  child: CubeStage(intensity: 0.7),
                                ),
                                Positioned.fill(
                                  child: CubeViewport(
                                    size: size,
                                    highlighted: solveHighlights(session),
                                    focus: solveFocus(session),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Under the cube, never over it.
                          _Explanation(lesson: _lesson, step: step),
                          // One move at a time: no auto-play in lessons, so
                          // learners never rush through a demonstration.
                          if (session.hasPlayback) ...[
                            const SizedBox(height: 8),
                            _MoveStepper(size: size),
                          ],
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton.icon(
                                  key: const ValueKey('lesson-back'),
                                  onPressed: _step > 0
                                      ? () => _goTo(_step - 1)
                                      : null,
                                  icon: const Icon(
                                    Icons.arrow_back_rounded,
                                    size: 18,
                                  ),
                                  label: Text(l10n.lessonBack),
                                ),
                              ),
                              const SizedBox(width: AppSpace.sm),
                              Expanded(
                                child: FilledButton.icon(
                                  key: const ValueKey('lesson-next'),
                                  onPressed: _step + 1 < steps
                                      ? () => _goTo(_step + 1)
                                      : _finish,
                                  icon: Icon(
                                    _step + 1 < steps
                                        ? Icons.arrow_forward_rounded
                                        : Icons.check_rounded,
                                    size: 18,
                                  ),
                                  label: FittedBox(
                                    child: Text(
                                      _step + 1 < steps
                                          ? l10n.lessonNext
                                          : l10n.lessonFinish,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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

/// Previous move / Next move through the part's demonstration.
class _MoveStepper extends ConsumerWidget {
  const _MoveStepper({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final free = !session.isHandTurning && !session.isPreviewing;
    Widget label(String text) =>
        FittedBox(fit: BoxFit.scaleDown, child: Text(text, maxLines: 1));
    return Row(
      children: [
        Expanded(
          child: FilledButton.tonalIcon(
            key: const ValueKey('lesson-prev-move'),
            onPressed: free && session.canStepBack ? controller.stepBack : null,
            icon: const Icon(Icons.skip_previous_rounded, size: 18),
            label: label(l10n.previousMove),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton.tonalIcon(
            key: const ValueKey('lesson-next-move'),
            onPressed: free && session.canStepForward
                ? controller.stepForward
                : null,
            icon: const Icon(Icons.skip_next_rounded, size: 18),
            label: label(l10n.nextMove),
          ),
        ),
      ],
    );
  }
}

/// The move on screen as an arrow and plain words, always visible, over the
/// part's explanation, which folds away so the cube keeps its room.
class _Explanation extends ConsumerStatefulWidget {
  const _Explanation({required this.lesson, required this.step});

  final Lesson lesson;
  final LessonStep step;

  @override
  ConsumerState<_Explanation> createState() => _ExplanationState();
}

class _ExplanationState extends ConsumerState<_Explanation> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = widget.lesson.size;
    final step = widget.step;
    final session = ref.watch(cubeSessionProvider(size));
    final current = session.currentStep;
    final secondary = textTheme.bodySmall?.copyWith(
      color: AppColors.textSecondary,
    );

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
        badgeSize: 44,
      );
    }

    return GlassCard(
      key: const ValueKey('lesson-explanation'),
      padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 4, 8),
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
                  maxHeight: MediaQuery.sizeOf(context).height * 0.2,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.only(top: 8, end: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        lessonStepTitle(l10n, step.id),
                        key: const ValueKey('lesson-step-title'),
                        style: textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        lessonStepBody(l10n, step.id),
                        style: textTheme.bodyMedium,
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

class _Completed extends ConsumerWidget {
  const _Completed({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final index = lessonIndex(lesson.id);
    final next = index + 1 < kLessons.length ? kLessons[index + 1] : null;
    return Center(
      child: GlassCard(
        key: const ValueKey('lesson-complete'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.celebration_rounded,
              size: 48,
              color: AppColors.accentSecondary,
            ),
            const SizedBox(height: 12),
            Text(l10n.lessonComplete, style: textTheme.headlineSmall),
            const SizedBox(height: 4),
            Text(
              lessonTitle(l10n, lesson.id),
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            if (next != null)
              FilledButton.icon(
                key: const ValueKey('lesson-next-lesson'),
                onPressed: () => openLesson(context, ref, next, replace: true),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: Text(
                  '${l10n.lessonNextLesson}: ${lessonTitle(l10n, next.id)}',
                ),
              ),
            const SizedBox(height: 8),
            TextButton(
              key: const ValueKey('lesson-back-academy'),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.lessonBackToAcademy),
            ),
          ],
        ),
      ),
    );
  }
}
