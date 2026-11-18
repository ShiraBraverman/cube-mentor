import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads/reward_gate.dart';
import '../../core/l10n/crown_words.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../solver_3d/widgets/crown_tracker.dart';
import 'lesson_screen.dart';
import 'model/academy_progress.dart';
import 'model/lesson.dart';
import 'model/lesson_catalog.dart';

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

/// Lessons grouped by track, with overall progress and crowns earned.
class AcademyScreen extends ConsumerWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final progress = ref.watch(academyProgressProvider);
    final nextId = progress.nextLesson?.id;

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.academyTitle)),
        body: SafeArea(
          top: false,
          child: PageFrame(
            child: ListView(
              padding: kPagePadding,
              children: [
                _ProgressHero(progress: progress),
                for (final track in LessonTrack.values) ...[
                  SectionHeader(title: trackTitle(l10n, track)),
                  for (final lesson in kLessons.where(
                    (l) => l.track == track,
                  )) ...[
                    // A header opens each crown of the beginner's method.
                    if (lesson.crown > 0 && lesson.subStep == 1)
                      _CrownSectionHeader(crown: lesson.crown),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: AppSpace.sm,
                      ),
                      child: _LessonTile(
                        lesson: lesson,
                        number: lessonIndex(lesson.id) + 1,
                        done: progress.isDone(lesson.id),
                        next: lesson.id == nextId,
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The first crown whose beginner lessons are not all done (1-3), or one
/// past the last once every crown is earned.
int _activeCrown(AcademyProgress progress) {
  for (var crown = 1; crown <= kCrowns; crown++) {
    final lessons = kLessons.where((l) => l.crown == crown);
    if (lessons.isEmpty || !lessons.every((l) => progress.isDone(l.id))) {
      return crown;
    }
  }
  return kCrowns + 1;
}

class _ProgressHero extends StatelessWidget {
  const _ProgressHero({required this.progress});

  final AcademyProgress progress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final done = progress.completedCount;
    final total = kLessons.length;
    return GlassCard(
      key: const ValueKey('academy-progress'),
      selected: true,
      accent: AppColors.gold,
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.all(AppSpace.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AccentIcon(
                icon: Icons.emoji_events_rounded,
                color: AppColors.gold,
                size: 56,
                glow: true,
              ),
              const SizedBox(width: AppSpace.md),
              Expanded(
                child: Text(
                  l10n.academyProgress(done, total),
                  style: textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.lg),
          GlowProgressBar(value: done / total, color: AppColors.gold),
          const SizedBox(height: AppSpace.md),
          CrownTracker(active: _activeCrown(progress)),
        ],
      ),
    );
  }
}

class _LessonTile extends ConsumerWidget {
  const _LessonTile({
    required this.lesson,
    required this.number,
    required this.done,
    required this.next,
  });

  final Lesson lesson;
  final int number;
  final bool done;

  /// The lesson to continue with: lit so the path forward is obvious.
  final bool next;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final accent = done
        ? AppColors.accentSecondary
        : (next ? AppColors.accent : AppColors.textTertiary);
    return GlassCard(
      key: ValueKey('lesson-${lesson.id}'),
      selected: next,
      onTap: () => openLesson(context, ref, lesson),
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.md,
        AppSpace.sm,
        AppSpace.md,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: done ? accent : accent.withValues(alpha: 0.14),
              border: Border.all(color: accent.withValues(alpha: 0.7)),
            ),
            child: done
                ? const Icon(
                    Icons.check_rounded,
                    color: AppColors.onAccent,
                    size: 24,
                  )
                : Text(
                    '$number',
                    style: TextStyle(
                      color: next ? AppColors.textPrimary : accent,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
          ),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lessonTitle(l10n, lesson.id),
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  lessonDescription(l10n, lesson.id),
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpace.xs),
                Wrap(
                  spacing: AppSpace.xs,
                  runSpacing: AppSpace.xxs,
                  children: [
                    AppPill(
                      label: l10n.cubeSizeLabel(lesson.size),
                      icon: Icons.view_in_ar_rounded,
                    ),
                    if (lesson.advanced)
                      AppPill(
                        label: l10n.lessonAdvanced,
                        color: AppColors.accentWarm,
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          Icon(
            next ? Icons.play_circle_fill_rounded : Icons.chevron_right_rounded,
            color: next ? AppColors.accent : AppColors.textTertiary,
            size: next ? 32 : 24,
          ),
        ],
      ),
    );
  }
}

/// The crown badges, the crown's name and its goal above its lessons.
class _CrownSectionHeader extends StatelessWidget {
  const _CrownSectionHeader({required this.crown});

  final int crown;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      key: ValueKey('academy-crown-$crown'),
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.xxs,
        AppSpace.xs,
        AppSpace.xxs,
        AppSpace.sm,
      ),
      child: Row(
        children: [
          CrownTracker(active: crown),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crownName(l10n, crown),
                  style: textTheme.titleSmall?.copyWith(color: AppColors.gold),
                ),
                Text(crownGoal(l10n, crown), style: textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
