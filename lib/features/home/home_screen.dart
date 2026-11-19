import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../academy/academy_screen.dart';
import '../academy/model/academy_progress.dart';
import '../academy/model/lesson_catalog.dart';
import '../daily/daily_controller.dart';
import '../daily/daily_screen.dart';
import '../patterns/patterns_screen.dart';
import '../scanner/scanner_screen.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../timer/timer_screen.dart';
import 'cube_carousel.dart';
import 'home_controller.dart';
import 'language_sheet.dart';

/// Landing screen: the endless cube carousel as the hero, the Academy hook
/// and the modes.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final selected = ref.watch(selectedCubeSizeProvider);
    final streak = ref.watch(dailyProvider.select((s) => s.streak));

    void open(Widget screen) =>
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (_) => screen));

    return GlassBackground(
      child: Scaffold(
        body: SafeArea(
          child: PageFrame(
            // Short page: built eagerly so every tile exists for tests and a11y.
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.fromSTEB(
                AppSpace.gutter,
                AppSpace.md,
                AppSpace.gutter,
                AppSpace.xxl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.appTitle,
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      const LanguageButton(),
                    ],
                  ),
                  const SizedBox(height: AppSpace.xxs),
                  Text(
                    l10n.homeTagline,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SectionHeader(title: l10n.chooseCubeSize, top: AppSpace.lg),
                  const CubeCarousel(),
                  const SizedBox(height: AppSpace.md),
                  const _ContinueLearningCard(),
                  SectionHeader(title: l10n.chooseMode),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _PrimaryModeTile(
                            key: const ValueKey('mode-playground'),
                            icon: Icons.view_in_ar_rounded,
                            title: l10n.modePlayground,
                            description: l10n.modePlaygroundDesc,
                            accent: AppColors.accent,
                            onTap: () => open(Solver3DScreen(size: selected)),
                          ),
                        ),
                        const SizedBox(width: AppSpace.sm),
                        Expanded(
                          child: _PrimaryModeTile(
                            key: const ValueKey('mode-scan'),
                            icon: Icons.photo_camera_rounded,
                            title: l10n.modeScanSolve,
                            description: l10n.modeScanSolveDesc,
                            accent: AppColors.accentSecondary,
                            onTap: () => open(ScannerScreen(size: selected)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  _ModeRow(
                    key: const ValueKey('mode-academy'),
                    icon: Icons.school_rounded,
                    title: l10n.modeAcademy,
                    description: l10n.modeAcademyDesc,
                    accent: AppColors.gold,
                    onTap: () => open(const AcademyScreen()),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  _ModeRow(
                    key: const ValueKey('mode-daily'),
                    icon: Icons.local_fire_department_rounded,
                    title: l10n.modeDaily,
                    description: l10n.modeDailyDesc,
                    accent: AppColors.accentWarm,
                    badge: streak > 0 ? l10n.streakDays(streak) : null,
                    onTap: () => open(const DailyScreen()),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  _ModeRow(
                    key: const ValueKey('mode-timer'),
                    icon: Icons.timer_outlined,
                    title: l10n.modeTimer,
                    description: l10n.modeTimerDesc,
                    accent: AppColors.danger,
                    onTap: () => open(TimerScreen(size: selected)),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  _ModeRow(
                    key: const ValueKey('mode-patterns'),
                    icon: Icons.grid_view_rounded,
                    title: l10n.modePatterns,
                    description: l10n.modePatternsDesc,
                    accent: AppColors.textPrimary,
                    onTap: () => open(PatternsScreen(initialSize: selected)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Large tile for the two main ways in: the 3D cube and the scanner.
class _PrimaryModeTile extends StatelessWidget {
  const _PrimaryModeTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.accent,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      onTap: onTap,
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.all(AppSpace.md + 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccentIcon(icon: icon, color: accent, glow: true),
          const SizedBox(height: AppSpace.md),
          Text(title, style: textTheme.titleMedium),
          const SizedBox(height: AppSpace.xxs),
          Text(description, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}

/// Compact row for the training modes.
class _ModeRow extends StatelessWidget {
  const _ModeRow({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.accent,
    required this.onTap,
    this.badge,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color accent;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.md,
        AppSpace.sm,
        AppSpace.md,
      ),
      child: Row(
        children: [
          AccentIcon(icon: icon, color: accent, size: 48),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: AppSpace.xs,
                  runSpacing: AppSpace.xxs,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(title, style: textTheme.titleMedium),
                    if (badge != null)
                      AppPill(
                        label: badge!,
                        color: AppColors.accentWarm,
                        icon: Icons.local_fire_department_rounded,
                      ),
                  ],
                ),
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

/// "Continue learning" hook: the next Academy lesson and overall progress.
class _ContinueLearningCard extends ConsumerWidget {
  const _ContinueLearningCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final progress = ref.watch(academyProgressProvider);
    final next = progress.nextLesson;
    final done = progress.completedCount;
    final total = kLessons.length;
    return GlassCard(
      key: const ValueKey('continue-learning'),
      selected: true,
      accent: AppColors.gold,
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.all(AppSpace.lg - 4),
      onTap: () => next == null
          ? Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const AcademyScreen()),
            )
          : openLesson(context, ref, next),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AccentIcon(
                icon: Icons.emoji_events_rounded,
                color: AppColors.gold,
                glow: true,
              ),
              const SizedBox(width: AppSpace.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      done == 0 ? l10n.startLearning : l10n.continueLearning,
                      style: textTheme.labelLarge?.copyWith(
                        color: AppColors.gold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      next == null
                          ? l10n.academyAllDone
                          : lessonTitle(l10n, next.id),
                      style: textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              const Icon(
                Icons.play_circle_fill_rounded,
                color: AppColors.gold,
                size: 36,
              ),
            ],
          ),
          const SizedBox(height: AppSpace.md),
          GlowProgressBar(value: done / total, color: AppColors.gold),
          if (next != null) ...[
            const SizedBox(height: AppSpace.xs),
            Text(
              l10n.lessonOf(lessonIndex(next.id) + 1, total),
              style: textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}
