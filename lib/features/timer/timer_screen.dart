import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads/app_banner_ad.dart';
import '../../core/celebration/celebration.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/feedback/feedback_service.dart';
import '../../core/settings/clock.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../home/home_controller.dart';
import 'model/solve_record.dart';
import 'model/timer_controller.dart';
import 'model/timer_stats.dart';

/// Speed timer: hold-to-start pad, optional inspection, penalties and
/// ao5 / ao12 / ao100 / best statistics per cube size. Free play is kept
/// distraction-free (no scramble text); only the daily challenge passes a
/// fixed [scramble], which is shown above the pad.
class TimerScreen extends ConsumerStatefulWidget {
  const TimerScreen({
    super.key,
    required this.size,
    this.scramble,
    this.onSolved,
  });

  final int size;

  /// A fixed scramble (daily challenge); hides the size picker.
  final String? scramble;

  /// Called after every finished (recorded) solve.
  final ValueChanged<SolveRecord>? onSolved;

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen>
    with SingleTickerProviderStateMixin {
  late int _size = widget.size;
  late final Ticker _ticker = createTicker((_) {
    // Runs out the 15-second inspection (then the clock starts with +2).
    ref.read(timerProvider(_size).notifier).tick(_now());
    setState(() {});
  });

  int _now() => ref.read(clockProvider)().millisecondsSinceEpoch;

  @override
  void initState() {
    super.initState();
    final scramble = widget.scramble;
    if (scramble != null) {
      Future.microtask(() {
        if (!mounted) return;
        ref.read(timerProvider(_size).notifier).useScramble(scramble);
      });
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _syncTicker(TimerPhase phase) {
    final animate = phase != TimerPhase.idle;
    if (animate && !_ticker.isActive) {
      _ticker.start();
    } else if (!animate && _ticker.isActive) {
      _ticker.stop();
    }
  }

  void _press() {
    final notifier = ref.read(timerProvider(_size).notifier);
    final before = ref.read(timerProvider(_size)).phase;
    notifier.press(_now());
    if (before == TimerPhase.running) {
      // Stopping the clock: a firm tick (a new PB chimes once recorded).
      final feedback = ref.read(feedbackProvider);
      if (ref.read(timerProvider(_size)).newBest) {
        feedback.success();
        showCelebration(
          context,
          message: AppLocalizations.of(context).timerNewPb,
          icon: Icons.emoji_events_rounded,
          accent: AppColors.gold,
        );
      } else {
        feedback.step();
      }
    }
  }

  void _release() {
    final notifier = ref.read(timerProvider(_size).notifier);
    final before = ref.read(timerProvider(_size)).phase;
    notifier.release(_now());
    if (before == TimerPhase.holding &&
        ref.read(timerProvider(_size)).phase == TimerPhase.running) {
      ref.read(feedbackProvider).turn();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(timerProvider(_size));
    final notifier = ref.read(timerProvider(_size).notifier);
    final busy = state.phase == TimerPhase.running;
    _syncTicker(state.phase);

    ref.listen(timerProvider(_size).select((s) => s.history.length), (
      previous,
      next,
    ) {
      final last = ref.read(timerProvider(_size)).last;
      if (previous != null && next == previous + 1 && last != null) {
        widget.onSolved?.call(last);
      }
    });

    return GlassBackground(
      child: Scaffold(
        appBar: busy
            ? null
            : AppBar(
                title: Text(l10n.timerTitle),
                actions: [
                  IconButton(
                    key: const ValueKey('timer-inspection'),
                    tooltip: l10n.timerInspectionToggle,
                    isSelected: state.inspection,
                    icon: const InspectionBadge(active: false),
                    selectedIcon: const InspectionBadge(active: true),
                    onPressed: notifier.toggleInspection,
                  ),
                  IconButton(
                    key: const ValueKey('timer-history'),
                    tooltip: l10n.timerHistory,
                    icon: const Icon(Icons.history_rounded),
                    onPressed: () => showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) => _HistorySheet(size: _size),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
        // No ad while inspecting or timing: the whole screen is the pad.
        bottomNavigationBar: SafeArea(
          top: false,
          child: AppBannerAd(visible: state.phase == TimerPhase.idle),
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  AppSpace.gutter,
                  AppSpace.xxs,
                  AppSpace.gutter,
                  AppSpace.md,
                ),
                child: Column(
                  children: [
                    if (!busy && widget.scramble == null)
                      _SizePicker(
                        selected: _size,
                        onSelect: (size) => setState(() => _size = size),
                      ),
                    // Daily challenge only: its fixed scramble.
                    if (!busy && widget.scramble != null) ...[
                      const SizedBox(height: AppSpace.md),
                      _ScrambleCard(state: state),
                    ],
                    Expanded(
                      child: Listener(
                        key: const ValueKey('timer-pad'),
                        behavior: HitTestBehavior.opaque,
                        onPointerDown: (_) => _press(),
                        onPointerUp: (_) => _release(),
                        child: _TimeDisplay(
                          state: state,
                          now: _now(),
                          ready: notifier.isReady(_now()),
                        ),
                      ),
                    ),
                    if (!busy) ...[
                      _StatsRow(history: state.history),
                      const SizedBox(height: AppSpace.sm),
                      if (state.last != null)
                        _LastSolveActions(size: _size, state: state),
                    ],
                    if (busy)
                      Text(
                        l10n.timerTapToStop,
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
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

class _SizePicker extends StatelessWidget {
  const _SizePicker({required this.selected, required this.onSelect});

  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: AppSpace.xs,
      runSpacing: AppSpace.xs,
      alignment: WrapAlignment.center,
      children: [
        for (final size in kCubeSizes)
          ChoiceChip(
            key: ValueKey('timer-size-$size'),
            label: Text(l10n.cubeSizeLabel(size)),
            selected: size == selected,
            onSelected: (_) => onSelect(size),
          ),
      ],
    );
  }
}

class _ScrambleCard extends StatelessWidget {
  const _ScrambleCard({required this.state});

  final TimerState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final scramble = state.scramble;
    return GlassCard(
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md + 2,
        AppSpace.md,
        AppSpace.xs,
        AppSpace.md,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.timerScrambleHint, style: textTheme.bodySmall),
                const SizedBox(height: AppSpace.xs),
                Text(
                  scramble ?? l10n.timerLoadingScramble,
                  key: const ValueKey('timer-scramble'),
                  // Notation always reads left to right.
                  textDirection: TextDirection.ltr,
                  style: textTheme.titleMedium?.copyWith(
                    fontFeatures: const [FontFeature.tabularFigures()],
                    letterSpacing: 0.5,
                    height: 1.5,
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

class _TimeDisplay extends StatelessWidget {
  const _TimeDisplay({
    required this.state,
    required this.now,
    required this.ready,
  });

  final TimerState state;
  final int now;
  final bool ready;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    String time;
    String hint;
    String? note;
    var color = AppColors.textPrimary;
    const seconds = kInspectionMillis ~/ 1000;
    final secondsLeft =
        ((kInspectionMillis - (now - state.inspectionStartedAt)) / 1000)
            .ceil()
            .clamp(0, seconds);
    final plus2 =
        state.phase == TimerPhase.running &&
        state.inspectionPenalty(state.startedAt) == Penalty.plus2;
    switch (state.phase) {
      case TimerPhase.running:
        time = formatTime(now - state.startedAt);
        hint = '';
        if (plus2) note = l10n.timerInspectPlus2(seconds);
      case TimerPhase.inspecting:
        time = '$secondsLeft';
        color = AppColors.accentWarm;
        hint = l10n.timerInspectTapReady;
      case TimerPhase.holding when state.holdFromInspection:
        time = _countdown(now - state.inspectionStartedAt);
        color = AppColors.accentSecondary;
        hint = l10n.timerReleaseToStart;
      case TimerPhase.holding when state.inspection:
        // Lifting the finger starts the countdown.
        time = '$seconds';
        color = AppColors.accentWarm;
        hint = l10n.timerInspectIntro(seconds);
      case TimerPhase.holding:
        time = formatTime(0);
        color = ready ? AppColors.accentSecondary : AppColors.danger;
        hint = ready ? l10n.timerReleaseToStart : l10n.timerHoldToStart;
      case TimerPhase.idle:
        final last = state.last;
        time = last == null ? formatTime(0) : formatSolve(last);
        hint = state.inspection
            ? l10n.timerInspectIntro(seconds)
            : l10n.timerHoldToStart;
    }
    final column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (state.phase == TimerPhase.idle && state.newBest)
          AppPill(
            key: const ValueKey('timer-new-pb'),
            label: l10n.timerNewPb,
            color: AppColors.gold,
            icon: Icons.emoji_events_rounded,
          ),
        // The inspection ran out: the clock started on its own with +2.
        if (plus2)
          AppPill(
            key: const ValueKey('timer-inspection-plus2'),
            label: l10n.timerPlus2,
            color: AppColors.accentWarm,
            icon: Icons.timer_outlined,
          ),
        const SizedBox(height: AppSpace.xs),
        FittedBox(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 160),
            style: textTheme.displayLarge!.copyWith(
              fontSize: 96,
              color: color,
              fontFeatures: const [FontFeature.tabularFigures()],
              shadows: [
                Shadow(
                  color:
                      (color == AppColors.textPrimary
                              ? AppColors.accent
                              : color)
                          .withValues(alpha: 0.45),
                  blurRadius: 32,
                ),
              ],
            ),
            child: Text(
              time,
              key: const ValueKey('timer-display'),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
        const SizedBox(height: AppSpace.sm),
        if (hint.isNotEmpty)
          Text(
            hint,
            key: const ValueKey('timer-hint'),
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        if (note != null)
          Text(
            note,
            key: const ValueKey('timer-plus2-note'),
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: AppColors.accentWarm),
          ),
      ],
    );
    // On short screens (long hints, small phones) the whole block shrinks
    // to fit the pad instead of overflowing.
    return LayoutBuilder(
      builder: (context, constraints) => Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(width: constraints.maxWidth, child: column),
        ),
      ),
    );
  }

  static String _countdown(int used) {
    if (used > kInspectionDnfMillis) return 'DNF';
    if (used > kInspectionMillis) return '+2';
    return '${((kInspectionMillis - used) / 1000).ceil()}';
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.history});

  final List<SolveRecord> history;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final best = bestSingle(history);
    final textTheme = Theme.of(context).textTheme;
    final tiny = textTheme.labelSmall?.copyWith(
      fontSize: 10,
      height: 1.2,
      color: AppColors.textTertiary,
    );
    Widget stat(String key, String label, String value, String? sub) =>
        Expanded(
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  label,
                  maxLines: 1,
                  style: textTheme.labelSmall?.copyWith(
                    color: key == 'pb'
                        ? AppColors.gold
                        : AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpace.xxs),
              FittedBox(
                child: Text(
                  value,
                  key: ValueKey('timer-stat-$key'),
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ),
              // What the stat means, in tiny muted words.
              if (sub != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    sub,
                    key: ValueKey('timer-stat-$key-sub'),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: tiny,
                  ),
                ),
            ],
          ),
        );
    return GlassCard(
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.xs,
        AppSpace.md,
        AppSpace.xs,
        AppSpace.sm,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              stat(
                'pb',
                l10n.timerPb,
                best == null ? '–' : formatTime(best),
                l10n.timerPbSub,
              ),
              stat(
                'ao5',
                'ao5',
                formatAverage(averageOf(history, 5)),
                l10n.timerAvgOf(5),
              ),
              stat(
                'ao12',
                'ao12',
                formatAverage(averageOf(history, 12)),
                l10n.timerAvgOf(12),
              ),
              stat(
                'ao100',
                'ao100',
                formatAverage(averageOf(history, 100)),
                l10n.timerAvgOf(100),
              ),
              stat('count', l10n.timerSolves, '${history.length}', null),
            ],
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            l10n.timerAvgNote,
            key: const ValueKey('timer-avg-note'),
            textAlign: TextAlign.center,
            style: tiny,
          ),
        ],
      ),
    );
  }
}

class _LastSolveActions extends ConsumerWidget {
  const _LastSolveActions({required this.size, required this.state});

  final int size;
  final TimerState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(timerProvider(size).notifier);
    final index = state.history.length - 1;
    final penalty = state.history[index].penalty;
    Penalty toggle(Penalty p) => penalty == p ? Penalty.none : p;
    final caption = Theme.of(context).textTheme.labelSmall
        ?.copyWith(fontSize: 10, height: 1.2, color: AppColors.textTertiary);
    // Each button with a tiny caption saying what it does.
    Widget labeled(String key, Widget button, String text) => SizedBox(
      width: 108,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          button,
          Text(
            text,
            key: ValueKey('$key-caption'),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: caption,
          ),
        ],
      ),
    );
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: AppSpace.xs,
      children: [
        labeled(
          'timer-plus2',
          FilterChip(
            key: const ValueKey('timer-plus2'),
            label: Text(l10n.timerPlus2),
            selected: penalty == Penalty.plus2,
            onSelected: (_) =>
                notifier.setPenalty(index, toggle(Penalty.plus2)),
          ),
          l10n.timerPlus2Caption,
        ),
        labeled(
          'timer-dnf',
          FilterChip(
            key: const ValueKey('timer-dnf'),
            label: Text(l10n.timerDnf),
            selected: penalty == Penalty.dnf,
            onSelected: (_) => notifier.setPenalty(index, toggle(Penalty.dnf)),
          ),
          l10n.timerDnfCaption,
        ),
        labeled(
          'timer-delete',
          ActionChip(
            key: const ValueKey('timer-delete'),
            avatar: const Icon(Icons.delete_outline_rounded, size: 18),
            label: Text(l10n.timerDelete),
            onPressed: () => notifier.delete(index),
          ),
          l10n.timerDeleteCaption,
        ),
      ],
    );
  }
}

/// The inspection toggle: a stopwatch with "15" (seconds), lit when on.
class InspectionBadge extends StatelessWidget {
  const InspectionBadge({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.accentSecondary : AppColors.textSecondary;
    return Container(
      key: ValueKey(active ? 'inspection-badge-on' : 'inspection-badge-off'),
      padding: const EdgeInsetsDirectional.fromSTEB(4, 2, 6, 2),
      decoration: BoxDecoration(
        color: active ? color.withValues(alpha: 0.18) : null,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: color.withValues(alpha: 0.8), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.ltr,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: color),
          const SizedBox(width: 2),
          Text(
            '${kInspectionMillis ~/ 1000}',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: color,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

class _HistorySheet extends ConsumerWidget {
  const _HistorySheet({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(timerProvider(size));
    final notifier = ref.read(timerProvider(size).notifier);
    final history = state.history;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.7,
          ),
          child: GlassCard(
            blur: 28,
            borderRadius: AppRadius.lg,
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppSpace.gutter,
              AppSpace.gutter,
              AppSpace.xs,
              AppSpace.sm,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${l10n.timerHistory} · ${l10n.cubeSizeLabel(size)}',
                        style: textTheme.titleLarge,
                      ),
                    ),
                    if (history.isNotEmpty)
                      TextButton(
                        key: const ValueKey('timer-clear'),
                        onPressed: notifier.clearHistory,
                        child: Text(l10n.timerClearHistory),
                      ),
                  ],
                ),
                if (history.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(l10n.timerNoSolves),
                  )
                else
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: history.length,
                      itemBuilder: (context, i) {
                        final index = history.length - 1 - i;
                        final solve = history[index];
                        final date = MaterialLocalizations.of(context)
                            .formatShortDate(solve.at);
                        return ListTile(
                          dense: true,
                          leading: Text('${index + 1}.'),
                          title: Text(
                            formatSolve(solve),
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: solve.scramble.isEmpty
                              ? null
                              : Text(
                                  solve.scramble,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.ltr,
                                ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(date, style: textTheme.bodySmall),
                              IconButton(
                                tooltip: l10n.timerDelete,
                                icon: const Icon(Icons.close_rounded, size: 18),
                                onPressed: () => notifier.delete(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
