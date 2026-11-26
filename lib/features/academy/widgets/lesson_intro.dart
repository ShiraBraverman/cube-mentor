import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/settings/intro_preference.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass.dart';
import '../../../core/theme/sticker_palette.dart';
import '../../solver_3d/interaction/eager_pan.dart';
import '../../solver_3d/render/cube_painter.dart';
import '../model/lesson.dart';
import '../model/lesson_catalog.dart';
import '../model/lesson_goal.dart';

/// What the goal preview shows.
enum GoalView {
  /// Loops start -> moves -> goal.
  morph,
  start,
  goal,
}

/// A gently swaying mini cube showing a lesson's goal: target pieces glow,
/// earlier ones are dimmed and the rest are gray. In [GoalView.morph] it
/// keeps replaying the way from the start state to the goal at a teaching
/// pace ([pace]). A finger anywhere on it turns it freely in 360 degrees.
class GoalPreview extends StatefulWidget {
  const GoalPreview({
    super.key,
    required this.data,
    this.view = GoalView.morph,
  });

  final GoalPreviewData data;
  final GoalView view;

  /// Playback speed of the demonstration against a brisk demo: about half
  /// speed, so every turn can be followed.
  static const double pace = 0.45;

  @override
  State<GoalPreview> createState() => _GoalPreviewState();
}

class _GoalPreviewState extends State<GoalPreview>
    with TickerProviderStateMixin {
  static const _holdStart = 1.4;
  static const _holdGoal = 2.2;
  static const _orbitPerPixel = 0.012;

  /// Orientation the finger set; the sway plays around it.
  CubeOrientation _orbit = CubeOrientation.initial;

  late final AnimationController _spin = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 16),
  )..repeat();
  late final AnimationController _morph = AnimationController(vsync: this);
  late List<CubeState> _states;
  late double _moveSeconds;

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  @override
  void didUpdateWidget(GoalPreview old) {
    super.didUpdateWidget(old);
    if (old.data != widget.data) _prepare();
    if (old.view != widget.view) _syncMorph();
  }

  void _prepare() {
    final moves = widget.data.moves;
    _states = [widget.data.start];
    for (final move in moves) {
      _states.add(_states.last.apply(move));
    }
    // Long algorithms play a little faster so a loop stays watchable, all
    // at the slowed teaching pace.
    _moveSeconds = moves.isEmpty
        ? 0
        : (3.6 / moves.length).clamp(0.18, 0.45) / GoalPreview.pace;
    final total = _holdStart + moves.length * _moveSeconds + _holdGoal;
    _morph.duration = Duration(milliseconds: (total * 1000).round());
    _syncMorph();
  }

  void _syncMorph() {
    if (widget.view == GoalView.morph && widget.data.morphs) {
      _morph.repeat();
    } else {
      _morph.stop();
    }
  }

  @override
  void dispose() {
    _spin.dispose();
    _morph.dispose();
    super.dispose();
  }

  /// Cube and turn at the current point of the loop.
  (CubeState, LayerTurn?, bool) _frameNow() {
    final data = widget.data;
    if (widget.view == GoalView.start) return (data.start, null, false);
    if (widget.view == GoalView.goal || !data.morphs) {
      return (data.goal, null, true);
    }
    final seconds =
        _morph.value * _morph.duration!.inMilliseconds / 1000 - _holdStart;
    if (seconds < 0) return (data.start, null, false);
    final index = (seconds / _moveSeconds).floor();
    if (index >= data.moves.length) return (data.goal, null, true);
    final progress = Curves.easeInOut.transform(
      (seconds / _moveSeconds - index).clamp(0.0, 1.0),
    );
    return (
      _states[index],
      LayerTurn.ofMove(data.moves[index], progress),
      false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return RawGestureDetector(
      key: const ValueKey('intro-orbit'),
      behavior: HitTestBehavior.opaque,
      gestures: {
        EagerPanGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<EagerPanGestureRecognizer>(
              EagerPanGestureRecognizer.new,
              (r) => r.onUpdate = (d) => setState(() {
                _orbit = _orbit.rotatedOnScreen(
                  d.delta.dx * _orbitPerPixel,
                  d.delta.dy * _orbitPerPixel,
                );
              }),
            ),
      },
      child: _paint(l10n),
    );
  }

  Widget _paint(AppLocalizations l10n) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: Listenable.merge([_spin, _morph]),
        builder: (context, _) {
          final (cube, turn, atGoal) = _frameNow();
          return Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: CubePainter(
                    palette: StickerPalette.of(context),
                    frame: CubeFrame(
                      cube: cube,
                      orbit: _orbit.rotatedOnScreen(
                        0.5 * _wave(_spin.value),
                        0,
                      ),
                      turn: turn,
                      focus: widget.data.focus,
                      muted: widget.data.muted,
                    ),
                  ),
                ),
              ),
              if (widget.data.morphs)
                PositionedDirectional(
                  top: 0,
                  start: 0,
                  child: _PhasePill(
                    key: const ValueKey('intro-phase'),
                    label: atGoal ? l10n.introStateGoal : l10n.introStateStart,
                    goal: atGoal,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  /// Gentle back-and-forth sway in [-1, 1], so the front stays readable.
  static double _wave(double t) {
    final x = (t * 4) % 4;
    return x < 2 ? x - 1 : 3 - x;
  }
}

class _PhasePill extends StatelessWidget {
  const _PhasePill({super.key, required this.label, required this.goal});

  final String label;
  final bool goal;

  @override
  Widget build(BuildContext context) {
    final color = goal ? AppColors.accentSecondary : AppColors.textSecondary;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color.withValues(alpha: 0.16),
        border: Border.all(color: color.withValues(alpha: 0.6)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium
            ?.copyWith(color: color, fontWeight: FontWeight.w700),
      ),
    );
  }
}

/// "Before -> after" intro of a lesson (or of a guided solving sub-step):
/// the goal on a live mini cube, one sentence on what to reach, two or
/// three bullets on how, and a button to start step by step.
class LessonIntroCard extends StatefulWidget {
  const LessonIntroCard({
    super.key,
    required this.lesson,
    required this.onStart,
    this.previewHeight = 200,
    this.objective = false,
  });

  final Lesson lesson;
  final VoidCallback onStart;
  final double previewHeight;

  /// Inside an Academy lesson: the goal reads as a gold "Learning
  /// objective" (what you will learn), unlike the solver's "What's the
  /// goal?" card for the step being solved.
  final bool objective;

  @override
  State<LessonIntroCard> createState() => _LessonIntroCardState();
}

class _LessonIntroCardState extends State<LessonIntroCard> {
  late GoalPreviewData _data = GoalPreviewData.of(widget.lesson);
  GoalView _view = GoalView.morph;

  @override
  void didUpdateWidget(LessonIntroCard old) {
    super.didUpdateWidget(old);
    if (old.lesson.id != widget.lesson.id) {
      _data = GoalPreviewData.of(widget.lesson);
      _view = GoalView.morph;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final id = widget.lesson.id;
    final bullets = introHowText(
      l10n,
      id,
    ).split('\n').where((line) => line.trim().isNotEmpty).toList();

    // The text scrolls; the start button stays pinned below it.
    return Column(
      key: const ValueKey('lesson-intro'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                GlassCard(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: widget.previewHeight,
                        child: GoalPreview(
                          key: const ValueKey('intro-preview'),
                          data: _data,
                          view: _view,
                        ),
                      ),
                      if (_data.morphs) ...[
                        const SizedBox(height: 8),
                        SegmentedButton<GoalView>(
                          key: const ValueKey('intro-view'),
                          showSelectedIcon: false,
                          segments: [
                            ButtonSegment(
                              value: GoalView.morph,
                              icon: Tooltip(
                                message: l10n.introPlayMorph,
                                child: const Icon(
                                  Icons.autorenew_rounded,
                                  size: 18,
                                ),
                              ),
                            ),
                            ButtonSegment(
                              value: GoalView.start,
                              label: Text(l10n.introStateStart),
                            ),
                            ButtonSegment(
                              value: GoalView.goal,
                              label: Text(l10n.introStateGoal),
                            ),
                          ],
                          selected: {_view},
                          onSelectionChanged: (s) =>
                              setState(() => _view = s.first),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GlassCard(
                  key: ValueKey(
                    widget.objective ? 'intro-objective' : 'intro-goal-card',
                  ),
                  selected: widget.objective,
                  accent: widget.objective ? AppColors.gold : AppColors.accent,
                  padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 14, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Heading(
                        icon: widget.objective
                            ? Icons.school_rounded
                            : Icons.flag_rounded,
                        text: widget.objective
                            ? l10n.lessonObjectiveHeading
                            : l10n.introGoalHeading,
                        color: widget.objective ? AppColors.gold : null,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        introGoalText(l10n, id),
                        key: const ValueKey('intro-goal'),
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 14),
                      _Heading(
                        icon: Icons.pan_tool_alt_rounded,
                        text: l10n.introHoldHeading,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        introHoldText(l10n, id),
                        key: const ValueKey('intro-hold'),
                        style: textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 14),
                      _Heading(
                        icon: Icons.lightbulb_rounded,
                        text: l10n.introHowHeading,
                      ),
                      const SizedBox(height: 4),
                      for (final line in bullets)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.only(
                                  top: 7,
                                  end: 8,
                                ),
                                child: Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: AppColors.accentSecondary,
                                ),
                              ),
                              Expanded(
                                child: Text(line, style: textTheme.bodyMedium),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 14),
                      _Heading(
                        icon: Icons.psychology_alt_rounded,
                        text: l10n.introWhyHeading,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        introWhyText(l10n, id),
                        key: const ValueKey('intro-why'),
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          key: const ValueKey('intro-start'),
          onPressed: widget.onStart,
          icon: const Icon(Icons.play_arrow_rounded),
          label: Text(l10n.introStart, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({required this.icon, required this.text, this.color});

  final IconData icon;
  final String text;

  /// Defaults to the accent.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color ?? AppColors.accent),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: color ?? AppColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

/// Opens the intro of the lesson teaching a guided solver sub-step as a
/// bottom sheet; the returned future completes when it is dismissed.
Future<void> showSubStepIntro(
  BuildContext context, {
  required int crown,
  required int subStep,
}) {
  final lesson = lessonForSubStep(crown, subStep);
  if (lesson == null) return Future.value();
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final l10n = AppLocalizations.of(context);
      return SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.9,
            maxWidth: 560,
          ),
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.backgroundTop.withValues(alpha: 0.96),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  lessonTitle(l10n, lesson.id),
                  key: const ValueKey('substep-intro-title'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: LessonIntroCard(
                    lesson: lesson,
                    previewHeight: 160,
                    onStart: () => Navigator.of(context).pop(),
                  ),
                ),
                const _AutoShowSwitch(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// "Don't show automatically again": stops the solver from opening the goal
/// sheet at each new sub-step. The flag button still reopens it.
class _AutoShowSwitch extends ConsumerWidget {
  const _AutoShowSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final auto = ref.watch(subStepIntroAutoProvider);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4),
      child: Material(
        type: MaterialType.transparency,
        child: SwitchListTile(
          key: const ValueKey('intro-dont-show'),
          dense: true,
          contentPadding: const EdgeInsetsDirectional.only(start: 4),
          value: !auto,
          onChanged: (off) =>
              ref.read(subStepIntroAutoProvider.notifier).set(!off),
          title: Text(
            l10n.introDontShowAgain,
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ),
    );
  }
}
