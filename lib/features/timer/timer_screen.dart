import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/clock.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../home/home_controller.dart';
import 'model/solve_record.dart';
import 'model/timer_controller.dart';
import 'model/timer_stats.dart';

/// Speed timer: scramble, hold-to-start pad, optional inspection, penalties
/// and ao5 / ao12 / ao100 / best statistics per cube size.
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
  late final Ticker _ticker = createTicker((_) => setState(() {}));

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
    if (before == TimerPhase.running) HapticFeedback.mediumImpact();
  }

  void _release() {
    final notifier = ref.read(timerProvider(_size).notifier);
    final before = ref.read(timerProvider(_size)).phase;
    notifier.release(_now());
    if (before == TimerPhase.holding &&
        ref.read(timerProvider(_size)).phase == TimerPhase.running) {
      HapticFeedback.lightImpact();
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
                    icon: const Icon(Icons.hourglass_empty_rounded),
                    selectedIcon: const Icon(
                      Icons.hourglass_bottom_rounded,
                      color: AppColors.accentSecondary,
                    ),
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
                    if (!busy) ...[
                      const SizedBox(height: AppSpace.md),
                      _ScrambleCard(
                        state: state,
                        onRefresh: notifier.newScramble,
                      ),
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
  const _ScrambleCard({required this.state, required this.onRefresh});

  final TimerState state;
  final VoidCallback onRefresh;

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
          if (!state.fixedScramble)
            IconButton(
              key: const ValueKey('timer-new-scramble'),
              tooltip: l10n.timerNewScramble,
              onPressed: scramble == null ? null : onRefresh,
              icon: const Icon(Icons.refresh_rounded),
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
    var color = AppColors.textPrimary;
    switch (state.phase) {
      case TimerPhase.running:
        time = formatTime(now - state.startedAt);
        hint = '';
      case TimerPhase.inspecting:
        time = _countdown(now - state.inspectionStartedAt);
        color = AppColors.accentWarm;
        hint = l10n.timerInspecting;
      case TimerPhase.holding:
        time = state.holdFromInspection
            ? _countdown(now - state.inspectionStartedAt)
            : formatTime(0);
        color = ready ? AppColors.accentSecondary : AppColors.danger;
        hint = ready ? l10n.timerReleaseToStart : l10n.timerHoldToStart;
      case TimerPhase.idle:
        final last = state.last;
        time = last == null ? formatTime(0) : formatSolve(last);
        hint = state.inspection
            ? l10n.timerTapToInspect
            : l10n.timerHoldToStart;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.phase == TimerPhase.idle && state.newBest)
          AppPill(
            key: const ValueKey('timer-new-pb'),
            label: l10n.timerNewPb,
            color: AppColors.gold,
            icon: Icons.emoji_events_rounded,
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
        Text(
          hint,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
        ),
      ],
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
    Widget stat(String key, String label, String value) => Expanded(
      child: Column(
        children: [
          FittedBox(
            child: Text(
              label,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: key == 'pb' ? AppColors.gold : AppColors.textSecondary,
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
        ],
      ),
    );
    return GlassCard(
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.xs,
        AppSpace.md,
        AppSpace.xs,
        AppSpace.md,
      ),
      child: Row(
        children: [
          stat('pb', l10n.timerPb, best == null ? '–' : formatTime(best)),
          stat('ao5', 'ao5', formatAverage(averageOf(history, 5))),
          stat('ao12', 'ao12', formatAverage(averageOf(history, 12))),
          stat('ao100', 'ao100', formatAverage(averageOf(history, 100))),
          stat('count', l10n.timerSolves, '${history.length}'),
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
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: AppSpace.xs,
      children: [
        FilterChip(
          key: const ValueKey('timer-plus2'),
          label: Text(l10n.timerPlus2),
          selected: penalty == Penalty.plus2,
          onSelected: (_) => notifier.setPenalty(index, toggle(Penalty.plus2)),
        ),
        const SizedBox(width: 8),
        FilterChip(
          key: const ValueKey('timer-dnf'),
          label: Text(l10n.timerDnf),
          selected: penalty == Penalty.dnf,
          onSelected: (_) => notifier.setPenalty(index, toggle(Penalty.dnf)),
        ),
        const SizedBox(width: 8),
        ActionChip(
          key: const ValueKey('timer-delete'),
          avatar: const Icon(Icons.delete_outline_rounded, size: 18),
          label: Text(l10n.timerDelete),
          onPressed: () => notifier.delete(index),
        ),
      ],
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
                          subtitle: Text(
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
