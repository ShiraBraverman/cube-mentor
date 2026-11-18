import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/move_words.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../solver_3d/model/cube_session.dart';
import '../solver_3d/widgets/cube_viewport.dart';
import '../solver_3d/widgets/solve_banner.dart';
import 'academy_screen.dart';
import 'model/academy_progress.dart';
import 'model/lesson.dart';
import 'model/lesson_catalog.dart';
import 'widgets/hold_prompt.dart';

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
        appBar: AppBar(title: Text(lessonTitle(l10n, _lesson.id))),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(14, 4, 14, 12),
                child: _finished
                    ? _Completed(lesson: _lesson)
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: (_step + 1) / steps,
                                    minHeight: 4,
                                    backgroundColor: AppColors.glassBorder,
                                  ),
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
                            child: CubeViewport(
                              size: size,
                              highlighted: solveHighlights(session),
                              focus: solveFocus(session),
                            ),
                          ),
                          // Long translations scroll inside the card
                          // instead of squeezing the cube away.
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.sizeOf(context).height * 0.4,
                            ),
                            child: _Explanation(lesson: _lesson, step: step),
                          ),
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
                              const SizedBox(width: 8),
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

/// The step's explanation plus a plain-language subtitle of the move on
/// screen (or a hint when there is nothing to play).
class _Explanation extends ConsumerWidget {
  const _Explanation({required this.lesson, required this.step});

  final Lesson lesson;
  final LessonStep step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = lesson.size;
    final session = ref.watch(cubeSessionProvider(size));
    final current = session.currentStep;
    final String subtitle;
    String? notation;
    if (!session.hasPlayback) {
      subtitle = l10n.lessonLookAround;
    } else if (current == null) {
      subtitle = l10n.lessonDemoDone;
    } else {
      final move = session.playback[session.currentStepIndex];
      notation = move.notation;
      subtitle = describeMove(l10n, move, size);
    }
    return GlassCard(
      padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 14, 12),
      child: SingleChildScrollView(
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
            Text(lessonStepBody(l10n, step.id), style: textTheme.bodyMedium),
            const SizedBox(height: 10),
            Row(
              children: [
                if (notation != null) ...[
                  Container(
                    constraints: const BoxConstraints(minWidth: 44),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accent.withValues(alpha: 0.18),
                      border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.6),
                      ),
                    ),
                    child: Text(
                      notation,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        key: const ValueKey('lesson-move-words'),
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.accentSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (session.stepHint case final hint?)
                        StepHintText(hint: hint)
                      else if (session.guideMove != null)
                        Text(
                          l10n.lessonTryIt,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
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
