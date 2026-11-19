import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_move.dart';
import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/move_words.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../solver_3d/model/guide_script.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../solver_3d/widgets/move_instruction.dart';
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
    final scramble = state.scramble == null
        ? null
        : MoveNotation.parseSequence(state.scramble!, kDailySize);
    final lit = state.streak > 0;

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.dailyTitle)),
        body: SafeArea(
          top: false,
          child: PageFrame(
            child: ListView(
              padding: kPagePadding,
              children: [
                // Streak hero.
                GlassCard(
                  selected: lit,
                  accent: AppColors.accentWarm,
                  borderRadius: AppRadius.lg,
                  padding: const EdgeInsetsDirectional.all(AppSpace.lg),
                  child: Row(
                    children: [
                      AccentIcon(
                        icon: Icons.local_fire_department_rounded,
                        color: lit
                            ? AppColors.accentWarm
                            : AppColors.textTertiary,
                        size: 64,
                        glow: lit,
                      ),
                      const SizedBox(width: AppSpace.md + 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.dailyFor(date),
                              style: textTheme.bodySmall,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              l10n.streakDays(state.streak),
                              key: const ValueKey('daily-streak'),
                              style: textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              l10n.dailyBestStreak(state.bestStreak),
                              style: textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpace.md),
                // Today's scramble and whether it is done.
                GlassCard(
                  padding: const EdgeInsetsDirectional.all(AppSpace.lg - 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            state.doneToday
                                ? Icons.check_circle_rounded
                                : Icons.radio_button_unchecked_rounded,
                            color: state.doneToday
                                ? AppColors.accentSecondary
                                : AppColors.textTertiary,
                          ),
                          const SizedBox(width: AppSpace.xs),
                          Expanded(
                            child: Text(
                              state.doneToday
                                  ? l10n.dailyDone
                                  : l10n.dailyNotDone,
                              key: const ValueKey('daily-status'),
                              style: textTheme.titleMedium?.copyWith(
                                color: state.doneToday
                                    ? AppColors.accentSecondary
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpace.md),
                      Text(
                        l10n.dailyScrambleSteps,
                        style: textTheme.titleSmall?.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(l10n.timerScrambleHint, style: textTheme.bodySmall),
                      const SizedBox(height: AppSpace.sm),
                      if (scramble == null)
                        Text(
                          l10n.timerLoadingScramble,
                          key: const ValueKey('daily-scramble'),
                        )
                      else
                        _ScrambleSteps(
                          key: const ValueKey('daily-scramble'),
                          moves: scramble,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpace.lg),
                // Turn by turn on the 3D cube, with arrows, to scramble a
                // solved real cube into today's challenge.
                FilledButton.tonalIcon(
                  key: const ValueKey('daily-scramble-guide'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accent.withValues(alpha: 0.2),
                    foregroundColor: AppColors.textPrimary,
                  ),
                  onPressed: scramble == null
                      ? null
                      : () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => Solver3DScreen(
                              size: kDailySize,
                              title: l10n.dailyScrambleGuideTitle,
                              guide: GuideScript(
                                start: CubeState.solved(kDailySize),
                                moves: scramble,
                                phase: 'dailyScramble',
                                explanation: 'dailyScrambleStep',
                              ),
                            ),
                          ),
                        ),
                  icon: const Icon(Icons.shuffle_rounded),
                  label: Text(l10n.dailyScrambleGuide),
                ),
                const SizedBox(height: AppSpace.sm),
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
                const SizedBox(height: AppSpace.sm),
                FilledButton.tonalIcon(
                  key: const ValueKey('daily-timer'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.glassFillStrong,
                    foregroundColor: AppColors.textPrimary,
                  ),
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
                const SizedBox(height: AppSpace.sm),
                OutlinedButton.icon(
                  key: const ValueKey('daily-hint'),
                  onPressed: cube == null || hint != null
                      ? null
                      : controller.requestHint,
                  icon: const Icon(Icons.lightbulb_outline_rounded),
                  label: Text(l10n.dailyHint),
                ),
                if (hint != null || state.hintFailed) ...[
                  const SizedBox(height: AppSpace.md),
                  GlassCard(
                    selected: hint != null,
                    accent: AppColors.gold,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          hint == null
                              ? Icons.info_outline_rounded
                              : Icons.lightbulb_rounded,
                          color: hint == null
                              ? AppColors.textSecondary
                              : AppColors.gold,
                        ),
                        const SizedBox(width: AppSpace.sm),
                        Expanded(
                          child: Text(
                            hint == null
                                ? l10n.dailyHintFailed
                                // Notation reads left to right in any locale.
                                // Plain words, no notation letters.
                                : l10n.dailyHintText(
                                    hint
                                        .map(
                                          (m) => moveInstruction(
                                            l10n,
                                            MoveNotation.parse(m, kDailySize),
                                            kDailySize,
                                          ).text(l10n),
                                        )
                                        .join(' · '),
                                  ),
                            key: const ValueKey('daily-hint-text'),
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Today's scramble as numbered steps: an arrow and plain words each.
class _ScrambleSteps extends StatelessWidget {
  const _ScrambleSteps({super.key, required this.moves});

  final List<CubeMove> moves;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        for (final (i, move) in moves.indexed)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: MoveInstructionTile(
              key: ValueKey('daily-step-$i'),
              move: move,
              size: kDailySize,
              badgeSize: 34,
              dense: true,
              leading: SizedBox(
                width: 28,
                child: Text(
                  '${i + 1}',
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
