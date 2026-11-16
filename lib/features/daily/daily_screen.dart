import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../timer/timer_screen.dart';
import 'daily_controller.dart';

/// Today's scramble, the streak, and two ways to complete it: on the 3D
/// cube or timed on a real cube.
class DailyScreen extends ConsumerStatefulWidget {
  const DailyScreen({super.key});

  @override
  ConsumerState<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends ConsumerState<DailyScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) ref.read(dailyProvider.notifier).loadScramble();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(dailyProvider);
    final controller = ref.read(dailyProvider.notifier);
    final date = MaterialLocalizations.of(context).formatMediumDate(state.date);
    final cube = state.cube;
    final hint = state.hint;

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.dailyTitle)),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: ListView(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 24),
                children: [
                  GlassCard(
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          size: 44,
                          color: state.streak > 0
                              ? AppColors.accentWarm
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.dailyFor(date),
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                l10n.streakDays(state.streak),
                                key: const ValueKey('daily-streak'),
                                style: textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                l10n.dailyBestStreak(state.bestStreak),
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.doneToday ? l10n.dailyDone : l10n.dailyNotDone,
                          key: const ValueKey('daily-status'),
                          style: textTheme.titleMedium?.copyWith(
                            color: state.doneToday
                                ? AppColors.accentSecondary
                                : AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.timerScrambleHint,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.scramble ?? l10n.timerLoadingScramble,
                          key: const ValueKey('daily-scramble'),
                          textDirection: TextDirection.ltr,
                          style: textTheme.titleMedium?.copyWith(height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    key: const ValueKey('daily-virtual'),
                    onPressed: cube == null
                        ? null
                        : () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => Solver3DScreen(
                                size: kDailySize,
                                initialCube: cube,
                                title: l10n.dailyTitle,
                                onSolved: controller.complete,
                              ),
                            ),
                          ),
                    icon: const Icon(Icons.view_in_ar_rounded),
                    label: Text(l10n.dailySolveVirtual),
                  ),
                  const SizedBox(height: 8),
                  FilledButton.tonalIcon(
                    key: const ValueKey('daily-timer'),
                    onPressed: state.scramble == null
                        ? null
                        : () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => TimerScreen(
                                size: kDailySize,
                                scramble: state.scramble,
                                onSolved: (_) => controller.complete(),
                              ),
                            ),
                          ),
                    icon: const Icon(Icons.timer_outlined),
                    label: Text(l10n.dailyTimeIt),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    key: const ValueKey('daily-hint'),
                    onPressed: cube == null || hint != null
                        ? null
                        : controller.requestHint,
                    icon: const Icon(Icons.lightbulb_outline_rounded),
                    label: Text(l10n.dailyHint),
                  ),
                  if (hint != null || state.hintFailed) ...[
                    const SizedBox(height: 8),
                    GlassCard(
                      child: Text(
                        hint == null
                            ? l10n.dailyHintFailed
                            // Notation reads left to right in any locale.
                            : l10n.dailyHintText(
                                '\u2066${hint.join(' ')}\u2069',
                              ),
                        key: const ValueKey('daily-hint-text'),
                      ),
                    ),
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
