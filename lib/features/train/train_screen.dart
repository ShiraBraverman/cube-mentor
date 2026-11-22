import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../../shared/widgets/cube_icons/cube_icons.dart';
import '../daily/daily_controller.dart';
import '../daily/daily_screen.dart';
import '../home/home_controller.dart';
import '../patterns/patterns_screen.dart';
import '../timer/timer_screen.dart';

/// The Train tab: daily challenge, speed timer and pattern library as three
/// roomy cards.
class TrainScreen extends ConsumerWidget {
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = ref.watch(selectedCubeSizeProvider);
    final daily = ref.watch(dailyProvider);

    void open(Widget screen) =>
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (_) => screen));

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.trainTitle)),
        body: SafeArea(
          top: false,
          bottom: false,
          child: PageFrame(
            child: ListView(
              padding: kPagePadding,
              children: [
                Text(
                  l10n.trainSubtitle,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpace.lg),
                _TrainCard(
                  key: const ValueKey('train-daily'),
                  icon: const AnimatedStreakStepIcon(),
                  title: l10n.modeDaily,
                  description: l10n.modeDailyDesc,
                  accent: AppColors.accentWarm,
                  badge: daily.streak > 0
                      ? l10n.streakDays(daily.streak)
                      : null,
                  done: daily.doneToday,
                  onTap: () => open(const DailyScreen()),
                ),
                const SizedBox(height: AppSpace.md),
                _TrainCard(
                  key: const ValueKey('train-timer'),
                  icon: const AnimatedTimerCubeIcon(),
                  title: l10n.modeTimer,
                  description: l10n.modeTimerDesc,
                  accent: AppColors.danger,
                  onTap: () => open(TimerScreen(size: size)),
                ),
                const SizedBox(height: AppSpace.md),
                _TrainCard(
                  key: const ValueKey('train-patterns'),
                  icon: const AnimatedPatternCubeIcon(),
                  title: l10n.modePatterns,
                  description: l10n.modePatternsDesc,
                  accent: AppColors.accent,
                  onTap: () => open(const PatternsScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TrainCard extends StatelessWidget {
  const _TrainCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.accent,
    required this.onTap,
    this.badge,
    this.done = false,
  });

  /// Animated mini-cube icon, shown on an accent tile.
  final Widget icon;
  final String title;
  final String description;
  final Color accent;
  final VoidCallback onTap;

  /// Streak pill shown next to the title.
  final String? badge;

  /// Today's challenge is finished: a check joins the streak.
  final bool done;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      onTap: onTap,
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.lg - 4,
        AppSpace.lg,
        AppSpace.md,
        AppSpace.lg,
      ),
      child: Row(
        children: [
          CubeIconTile(accent: accent, size: 60, glow: true, child: icon),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleLarge),
                const SizedBox(height: AppSpace.xxs),
                Text(description, style: textTheme.bodyMedium),
                if (badge != null) ...[
                  const SizedBox(height: AppSpace.sm),
                  AppPill(
                    key: const ValueKey('streak-badge'),
                    label: badge!,
                    color: AppColors.accentWarm,
                    icon: done
                        ? Icons.check_circle_rounded
                        : Icons.local_fire_department_rounded,
                  ),
                ],
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
