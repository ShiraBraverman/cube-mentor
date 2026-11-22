import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads/reward_gate.dart';
import '../../core/ads/reward_prompt.dart';
import '../../core/celebration/celebration.dart';
import '../../core/cube/cube_move.dart';
import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/move_words.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../../shared/widgets/cube_icons/cube_icons.dart';
import '../solver_3d/model/guide_script.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../solver_3d/widgets/move_instruction.dart';
import '../timer/model/timer_stats.dart';
import '../timer/timer_screen.dart';
import 'daily_controller.dart';

/// Today's challenge on one screen: a stats card (streak, personal best,
/// recent days), then two clear steps. Step 1 scrambles a real cube (3D
/// scramble guide, or the moves written out, folded by default); Step 2
/// solves it (timed on the real cube, or on the 3D cube). The hint sits
/// below.
class DailyScreen extends ConsumerStatefulWidget {
  const DailyScreen({super.key});

  @override
  ConsumerState<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends ConsumerState<DailyScreen> {
  bool _showMoves = false;

  /// A 3D solve is being reported: its congratulations dialog replaces the
  /// celebration toast.
  bool _dialogPending = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) ref.read(dailyProvider.notifier).loadScramble();
    });
  }

  /// Opens a page for today's challenge; [replace] swaps it for the page
  /// on top (the scramble guide's "now solve it").
  void _open(WidgetBuilder builder, {bool replace = false}) {
    final route = MaterialPageRoute<void>(builder: builder);
    final navigator = Navigator.of(context);
    if (replace) {
      navigator.pushReplacement(route);
    } else {
      navigator.push(route);
    }
  }

  void _openScrambleGuide(List<CubeMove> scramble) {
    final l10n = AppLocalizations.of(context);
    _open(
      (_) => Solver3DScreen(
        size: kDailySize,
        title: l10n.dailyScrambleGuideTitle,
        guide: GuideScript(
          start: CubeState.solved(kDailySize),
          moves: scramble,
          phase: 'dailyScramble',
          explanation: 'dailyScrambleStep',
        ),
        guideDoneAction: _SolveNextButtons(
          onTimer: () => _openTimer(replace: true),
          onVirtual: () => _openVirtual(replace: true),
        ),
      ),
    );
  }

  void _openTimer({bool replace = false}) {
    final state = ref.read(dailyProvider);
    final controller = ref.read(dailyProvider.notifier);
    if (state.scramble == null) return;
    _open(
      (_) => TimerScreen(
        size: kDailySize,
        scramble: state.scramble,
        onSolved: (solve) => controller.complete(millis: solve.result),
      ),
      replace: replace,
    );
  }

  void _openVirtual({bool replace = false}) {
    final l10n = AppLocalizations.of(context);
    final cube = ref.read(dailyProvider).cube;
    if (cube == null) return;
    _open(
      (_) => Solver3DScreen(
        size: kDailySize,
        initialCube: cube,
        title: l10n.dailyTitle,
        challenge: true,
        onTimedSolve: _reportVirtualSolve,
      ),
      replace: replace,
    );
  }

  /// A 3D solve finished in [millis]: records it, then congratulates.
  Future<void> _reportVirtualSolve(int millis) async {
    final previousBest = ref.read(dailyProvider).bestMillis;
    _dialogPending = true;
    await ref.read(dailyProvider.notifier).complete(millis: millis);
    _dialogPending = false;
    if (!mounted) return;
    final state = ref.read(dailyProvider);
    final daily = ModalRoute.of(context);
    await showDialog<void>(
      context: context,
      builder: (_) => DailyCongratsDialog(
        millis: millis,
        streak: state.streak,
        newBest: previousBest != null && millis < previousBest,
      ),
    );
    // Back to the challenge page.
    if (mounted && daily != null) {
      Navigator.of(context).popUntil((route) => route == daily);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(dailyProvider);
    final controller = ref.read(dailyProvider.notifier);
    final cube = state.cube;
    final hint = state.hint;
    final scramble = state.scramble == null
        ? null
        : MoveNotation.parseSequence(state.scramble!, kDailySize);

    // Finishing today's challenge on the timer celebrates over whatever
    // page is open (a 3D solve gets its own dialog instead); every fifth
    // streak day gets a milestone message.
    ref.listen(dailyProvider.select((s) => s.doneToday), (previous, done) {
      if (previous == false && done && !_dialogPending) {
        final streak = ref.read(dailyProvider).streak;
        showCelebration(
          context,
          message: isStreakMilestone(streak)
              ? l10n.dailyMilestone(streak)
              : l10n.celebrateDailyDone,
          icon: Icons.local_fire_department_rounded,
          accent: AppColors.accentWarm,
        );
      }
    });

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.dailyTitle)),
        body: SafeArea(
          top: false,
          child: PageFrame(
            child: ListView(
              padding: kPagePadding,
              children: [
                _StatsCard(state: state),
                const SizedBox(height: AppSpace.md),
                // Step 1: scramble a real (solved) cube into today's
                // challenge.
                _StepCard(
                  key: const ValueKey('daily-step1'),
                  icon: const AnimatedScrambleCubeIcon(),
                  title: l10n.dailyStep1Title,
                  children: [
                    FilledButton.tonalIcon(
                      key: const ValueKey('daily-scramble-guide'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: AppColors.accentSecondary.withValues(
                          alpha: 0.22,
                        ),
                        foregroundColor: AppColors.textPrimary,
                      ),
                      onPressed: scramble == null
                          ? null
                          : () => _openScrambleGuide(scramble),
                      icon: _ButtonCube(
                        enabled: scramble != null,
                        icon: AnimatedScrambleCubeIcon.new,
                      ),
                      label: Text(l10n.dailyScrambleGuide),
                    ),
                    const SizedBox(height: AppSpace.xxs),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: TextButton.icon(
                        key: const ValueKey('daily-moves-toggle'),
                        onPressed: () =>
                            setState(() => _showMoves = !_showMoves),
                        icon: Icon(
                          _showMoves
                              ? Icons.expand_less_rounded
                              : Icons.expand_more_rounded,
                        ),
                        label: Text(
                          _showMoves
                              ? l10n.dailyHideMoves
                              : l10n.dailyShowMoves,
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      alignment: Alignment.topCenter,
                      child: !_showMoves
                          ? const SizedBox(width: double.infinity)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.timerScrambleHint,
                                  style: textTheme.bodySmall,
                                ),
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
                  ],
                ),
                const SizedBox(height: AppSpace.md),
                // Step 2: solve it, timed on the real cube or on the 3D one.
                _StepCard(
                  key: const ValueKey('daily-step2'),
                  icon: const AnimatedSolveCubeIcon(),
                  title: l10n.dailyStep2Title,
                  children: [
                    FilledButton.icon(
                      key: const ValueKey('daily-timer'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: state.scramble == null ? null : _openTimer,
                      icon: _ButtonCube(
                        enabled: state.scramble != null,
                        icon: AnimatedTimerCubeIcon.new,
                      ),
                      label: Text(l10n.dailyTimeIt),
                    ),
                    const SizedBox(height: AppSpace.sm),
                    FilledButton.tonalIcon(
                      key: const ValueKey('daily-virtual'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: AppColors.glassFillStrong,
                        foregroundColor: AppColors.textPrimary,
                      ),
                      onPressed: cube == null ? null : _openVirtual,
                      icon: _ButtonCube(
                        enabled: cube != null,
                        icon: AnimatedSolveCubeIcon.new,
                      ),
                      label: Text(l10n.dailySolveVirtual),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpace.md),
                OutlinedButton.icon(
                  key: const ValueKey('daily-hint'),
                  onPressed: cube == null || hint != null
                      ? null
                      : () async {
                          // A rewarded ad unlocks today's hints.
                          if (await unlockWithFeedback(
                            context,
                            ref,
                            RewardFeature.dailyHint,
                          )) {
                            await controller.requestHint();
                          }
                        },
                  icon: _ButtonCube(
                    enabled: cube != null && hint == null,
                    icon: AnimatedHintCubeIcon.new,
                  ),
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
                        if (hint == null)
                          const Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.textSecondary,
                          )
                        else
                          const AnimatedHintCubeIcon(size: 28),
                        const SizedBox(width: AppSpace.sm),
                        Expanded(
                          child: Text(
                            hint == null
                                ? l10n.dailyHintFailed
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

/// Streak, best streak, personal best time, today's status, a milestone
/// cheer every fifth day and the recent solved days.
class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.state});

  final DailyState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final material = MaterialLocalizations.of(context);
    final date = material.formatMediumDate(state.date);
    final lit = state.streak > 0;
    final recent = state.log.reversed.take(7).toList();
    return GlassCard(
      selected: lit,
      accent: AppColors.accentWarm,
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.all(AppSpace.md + 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CubeIconTile(
                accent: lit ? AppColors.accentWarm : AppColors.textTertiary,
                size: 56,
                glow: lit,
                child: AnimatedStreakStepIcon(animate: lit),
              ),
              const SizedBox(width: AppSpace.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.dailyFor(date), style: textTheme.bodySmall),
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
          if (isStreakMilestone(state.streak)) ...[
            const SizedBox(height: AppSpace.sm),
            AppPill(
              key: const ValueKey('daily-milestone'),
              label: l10n.dailyMilestone(state.streak),
              color: AppColors.gold,
              icon: Icons.celebration_rounded,
            ),
          ],
          const SizedBox(height: AppSpace.sm),
          Wrap(
            spacing: AppSpace.md,
            runSpacing: 2,
            children: [
              if (state.bestMillis != null)
                Text(
                  l10n.dailyPersonalBest(formatTime(state.bestMillis)),
                  key: const ValueKey('daily-personal-best'),
                  style: textTheme.titleSmall?.copyWith(color: AppColors.gold),
                ),
              // The user's best time on today's challenge.
              if (state.todayMillis != null)
                Text(
                  l10n.dailyYourTime(formatTime(state.todayMillis)),
                  key: const ValueKey('daily-best-time'),
                  style: textTheme.titleSmall,
                ),
            ],
          ),
          const SizedBox(height: AppSpace.xs),
          Row(
            children: [
              Icon(
                state.doneToday
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                size: 20,
                color: state.doneToday
                    ? AppColors.accentSecondary
                    : AppColors.textTertiary,
              ),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: Text(
                  state.doneToday ? l10n.dailyDone : l10n.dailyNotDone,
                  key: const ValueKey('daily-status'),
                  style: textTheme.bodyMedium?.copyWith(
                    color: state.doneToday
                        ? AppColors.accentSecondary
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          if (recent.isNotEmpty) ...[
            const SizedBox(height: AppSpace.sm),
            Text(
              l10n.dailyRecentDays,
              style: textTheme.labelMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpace.xxs),
            Wrap(
              key: const ValueKey('daily-log'),
              spacing: AppSpace.xs,
              runSpacing: AppSpace.xs,
              children: [
                for (final entry in recent)
                  _LogChip(
                    date: material.formatShortMonthDay(entry.date),
                    time: entry.millis == null
                        ? null
                        : formatTime(entry.millis),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// One solved day: its date and best time (a check when untimed).
class _LogChip extends StatelessWidget {
  const _LogChip({required this.date, required this.time});

  final String date;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            date,
            style: textTheme.labelSmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          if (time == null)
            const Icon(
              Icons.check_rounded,
              size: 16,
              color: AppColors.accentSecondary,
            )
          else
            Text(
              time!,
              textDirection: TextDirection.ltr,
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
        ],
      ),
    );
  }
}

/// A numbered step of the challenge: icon, title and its actions.
class _StepCard extends StatelessWidget {
  const _StepCard({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  /// Animated mini-cube icon of the step.
  final Widget icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsetsDirectional.all(AppSpace.md + 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CubeIconTile(size: 44, child: icon),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          ...children,
        ],
      ),
    );
  }
}

/// Under the finished scramble guide: go solve it, timed on the real cube
/// or on the 3D cube.
class _SolveNextButtons extends StatelessWidget {
  const _SolveNextButtons({required this.onTimer, required this.onVirtual});

  final VoidCallback onTimer;
  final VoidCallback onVirtual;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    Widget label(String text) => Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            key: const ValueKey('scrambled-timer'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
            ),
            onPressed: onTimer,
            icon: const AnimatedTimerCubeIcon(size: 22),
            label: label(l10n.dailyTimeIt),
          ),
        ),
        const SizedBox(width: AppSpace.xs),
        Expanded(
          child: FilledButton.tonalIcon(
            key: const ValueKey('scrambled-virtual'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
            ),
            onPressed: onVirtual,
            icon: const AnimatedSolveCubeIcon(size: 22),
            label: label(l10n.dailySolveVirtual),
          ),
        ),
      ],
    );
  }
}

/// "Congratulations!" after solving today's challenge on the 3D cube: the
/// time, the streak, a new personal best and every fifth-day milestone.
class DailyCongratsDialog extends StatelessWidget {
  const DailyCongratsDialog({
    super.key,
    required this.millis,
    required this.streak,
    required this.newBest,
  });

  final int millis;
  final int streak;
  final bool newBest;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Dialog(
      key: const ValueKey('daily-congrats'),
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSpace.gutter,
        vertical: AppSpace.lg,
      ),
      child: GlassCard(
        blur: 28,
        selected: true,
        accent: AppColors.gold,
        borderRadius: AppRadius.lg,
        padding: const EdgeInsetsDirectional.fromSTEB(
          AppSpace.gutter,
          AppSpace.lg,
          AppSpace.gutter,
          AppSpace.sm,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: AccentIcon(
                  icon: Icons.emoji_events_rounded,
                  color: AppColors.gold,
                  size: 60,
                  glow: true,
                ),
              ),
              const SizedBox(height: AppSpace.md),
              Text(
                l10n.dailyCongratsTitle,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpace.xs),
              Text(
                l10n.dailyCongratsBody(formatTime(millis)),
                key: const ValueKey('daily-congrats-time'),
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpace.md),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: AppSpace.xs,
                runSpacing: AppSpace.xs,
                children: [
                  AppPill(
                    label: l10n.streakDays(streak),
                    color: AppColors.accentWarm,
                    icon: Icons.local_fire_department_rounded,
                  ),
                  if (newBest)
                    AppPill(
                      key: const ValueKey('daily-congrats-pb'),
                      label: l10n.timerNewPb,
                      color: AppColors.gold,
                      icon: Icons.emoji_events_rounded,
                    ),
                ],
              ),
              if (isStreakMilestone(streak)) ...[
                const SizedBox(height: AppSpace.sm),
                Text(
                  l10n.dailyMilestone(streak),
                  key: const ValueKey('daily-congrats-milestone'),
                  textAlign: TextAlign.center,
                  style: textTheme.titleSmall?.copyWith(color: AppColors.gold),
                ),
              ],
              const SizedBox(height: AppSpace.lg),
              FilledButton(
                key: const ValueKey('daily-congrats-done'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.dailyCongratsDone),
              ),
            ],
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

/// A mini-cube icon sized for a full-width button; it rests (and dims)
/// while the button is disabled.
class _ButtonCube extends StatelessWidget {
  const _ButtonCube({required this.enabled, required this.icon});

  final bool enabled;
  final AnimatedCubeIcon Function({
    Key? key,
    double size,
    bool animate,
    String? semanticLabel,
  })
  icon;

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: enabled ? 1 : 0.4,
    child: icon(size: 26, animate: enabled),
  );
}
