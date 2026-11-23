import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../../shared/widgets/cube_icons/cube_icons.dart';
import '../daily/daily_controller.dart';
import '../daily/daily_screen.dart';
import '../timer/timer_screen.dart';

/// The Timer & Daily Challenge hub opened from the home screen: the speed
/// timer (on the cube [size] selected at home) and today's challenge as
/// two roomy cards.
class TrainScreen extends ConsumerWidget {
  const TrainScreen({super.key, this.size = 3});

  /// Cube size the speed timer opens on.
  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final daily = ref.watch(dailyProvider);

    void open(Widget screen) =>
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (_) => screen));

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.homePractice)),
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
                  key: const ValueKey('train-timer'),
                  icon: const AnimatedTimerCubeIcon(),
                  title: l10n.modeTimer,
                  description: l10n.modeTimerDesc,
                  accent: AppColors.danger,
                  badge: l10n.cubeSizeLabel(size),
                  badgeIcon: Icons.view_in_ar_rounded,
                  onTap: () => open(TimerScreen(size: size)),
                ),
                const SizedBox(height: AppSpace.md),
                _TrainCard(
                  key: const ValueKey('train-daily'),
                  icon: const AnimatedStreakStepIcon(),
                  title: l10n.modeDaily,
                  description: l10n.modeDailyDesc,
                  accent: AppColors.accentWarm,
                  badge: daily.streak > 0
                      ? l10n.streakDays(daily.streak)
                      : null,
                  badgeKey: const ValueKey('streak-badge'),
                  badgeIcon: daily.doneToday
                      ? Icons.check_circle_rounded
                      : Icons.local_fire_department_rounded,
                  onTap: () => open(const DailyScreen()),
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
    this.badgeKey,
    this.badgeIcon,
  });

  /// Animated mini-cube icon, shown on an accent tile.
  final Widget icon;
  final String title;
  final String description;
  final Color accent;
  final VoidCallback onTap;

  /// Pill under the description (the timer's size, the daily streak).
  final String? badge;
  final Key? badgeKey;
  final IconData? badgeIcon;

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
                    key: badgeKey,
                    label: badge!,
                    color: accent,
                    icon: badgeIcon,
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
