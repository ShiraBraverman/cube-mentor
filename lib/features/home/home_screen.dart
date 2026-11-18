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
import '../solver_3d/widgets/cube_preview.dart';
import '../timer/timer_screen.dart';
import 'home_controller.dart';
import 'language_sheet.dart';

/// Landing screen: the selected cube as the hero, the size selector, the
/// Academy hook and the modes.
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
                  const SizedBox(height: AppSpace.lg),
                  _Hero(size: selected),
                  SectionHeader(title: l10n.chooseCubeSize, top: AppSpace.lg),
                  _SizeSelector(
                    selected: selected,
                    onSelect: (size) => ref
                        .read(selectedCubeSizeProvider.notifier)
                        .select(size),
                  ),
                  const SizedBox(height: AppSpace.lg),
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

/// The spinning selected cube on its lit stage, with its name.
class _Hero extends StatelessWidget {
  const _Hero({required this.size});

  final int size;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          const Positioned.fill(child: CubeStage()),
          Positioned.fill(
            top: AppSpace.xl,
            bottom: AppSpace.md,
            child: CubePreview(size: size, spin: true),
          ),
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  l10n.cubeSizeLabel(size),
                  textDirection: TextDirection.ltr,
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(width: AppSpace.sm),
                Flexible(
                  child: Text(
                    _levelName(l10n, size),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One glass track with a segment per cube size.
class _SizeSelector extends StatelessWidget {
  const _SizeSelector({required this.selected, required this.onSelect});

  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpace.xxs),
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          for (final size in kCubeSizes)
            Expanded(
              child: Semantics(
                button: true,
                selected: size == selected,
                label: '${l10n.cubeSizeLabel(size)} ${_levelName(l10n, size)}',
                child: _SizeSegment(
                  key: ValueKey('size-$size'),
                  label: l10n.cubeSizeLabel(size),
                  selected: size == selected,
                  onTap: () => onSelect(size),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SizeSegment extends StatelessWidget {
  const _SizeSegment({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.sm);
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          height: AppSpace.touch - AppSpace.xxs,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: radius,
            color: selected ? AppColors.accent : Colors.transparent,
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.45),
                      blurRadius: 16,
                      spreadRadius: -4,
                    ),
                  ]
                : null,
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.xxs),
              child: Text(
                label,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: selected
                      ? AppColors.onAccent
                      : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _levelName(AppLocalizations l10n, int size) => switch (size) {
  2 => l10n.cubeLevel2,
  3 => l10n.cubeLevel3,
  4 => l10n.cubeLevel4,
  5 => l10n.cubeLevel5,
  _ => l10n.cubeLevel6,
};

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
