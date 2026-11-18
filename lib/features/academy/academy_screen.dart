import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads/reward_gate.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import 'lesson_screen.dart';
import 'model/academy_progress.dart';
import 'model/lesson.dart';
import 'model/lesson_catalog.dart';
import '../../core/l10n/crown_words.dart';
import '../solver_3d/widgets/crown_tracker.dart';

/// Opens [lesson], first asking the reward gate when it is advanced.
Future<void> openLesson(
  BuildContext context,
  WidgetRef ref,
  Lesson lesson, {
  bool replace = false,
}) async {
  final gate = ref.read(rewardGateProvider);
  if (lesson.advanced &&
      !gate.isUnlocked(RewardFeature.advancedLesson, item: lesson.id) &&
      !await gate.unlock(RewardFeature.advancedLesson, item: lesson.id)) {
    return;
  }
  if (!context.mounted) return;
  final route = MaterialPageRoute<void>(
    builder: (_) => LessonScreen(lesson: lesson),
  );
  final navigator = Navigator.of(context);
  if (replace) {
    await navigator.pushReplacement(route);
  } else {
    await navigator.push(route);
  }
}

/// Lessons grouped by track, with overall progress.
class AcademyScreen extends ConsumerWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final progress = ref.watch(academyProgressProvider);
    final done = progress.completedCount;

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.academyTitle)),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: ListView(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 24),
                children: [
                  GlassCard(
                    key: const ValueKey('academy-progress'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.academyProgress(done, kLessons.length),
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: done / kLessons.length,
                            minHeight: 6,
                            backgroundColor: AppColors.glassBorder,
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (final track in LessonTrack.values) ...[
                    const SizedBox(height: 20),
                    Text(trackTitle(l10n, track), style: textTheme.titleLarge),
                    const SizedBox(height: 8),
                    for (final lesson in kLessons.where(
                      (l) => l.track == track,
                    )) ...[
                      // A header opens each crown of the beginner's method.
                      if (lesson.crown > 0 && lesson.subStep == 1)
                        _CrownSectionHeader(crown: lesson.crown),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 8),
                        child: _LessonTile(
                          lesson: lesson,
                          number: lessonIndex(lesson.id) + 1,
                          done: progress.isDone(lesson.id),
                        ),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LessonTile extends ConsumerWidget {
  const _LessonTile({
    required this.lesson,
    required this.number,
    required this.done,
  });

  final Lesson lesson;
  final int number;
  final bool done;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final accent = done ? AppColors.accentSecondary : AppColors.accent;
    return GlassCard(
      key: ValueKey('lesson-${lesson.id}'),
      onTap: () => openLesson(context, ref, lesson),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: 0.16),
              border: Border.all(color: accent.withValues(alpha: 0.6)),
            ),
            child: done
                ? Icon(Icons.check_rounded, color: accent, size: 22)
                : Text(
                    '$number',
                    style: TextStyle(
                      color: accent,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        lessonTitle(l10n, lesson.id),
                        style: textTheme.titleMedium,
                      ),
                    ),
                    if (lesson.advanced) ...[
                      const SizedBox(width: 8),
                      _Badge(
                        label: l10n.lessonAdvanced,
                        color: AppColors.accentWarm,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${lessonDescription(l10n, lesson.id)} · '
                  '${l10n.cubeSizeLabel(lesson.size)}',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(999),
      color: color.withValues(alpha: 0.16),
      border: Border.all(color: color.withValues(alpha: 0.5)),
    ),
    child: Text(
      label,
      style: Theme.of(context).textTheme.labelSmall
          ?.copyWith(color: color, fontWeight: FontWeight.w700),
    ),
  );
}

/// "First crown · White face and first layer" above that crown's lessons.
class _CrownSectionHeader extends StatelessWidget {
  const _CrownSectionHeader({required this.crown});

  final int crown;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      key: ValueKey('academy-crown-$crown'),
      padding: const EdgeInsetsDirectional.fromSTEB(4, 6, 4, 6),
      child: Row(
        children: [
          CrownTracker(active: crown),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: crownName(l10n, crown),
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' · ${crownGoal(l10n, crown)}',
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
