import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/settings/preferences.dart';
import 'solve_record.dart';
import 'timer_stats.dart';

/// How long the pad must be held before releasing starts the timer.
const int kHoldMillis = 300;

/// WCA inspection: 15 s, then +2 until 17 s, then DNF.
const int kInspectionMillis = 15000;
const int kInspectionDnfMillis = 17000;

/// Solves kept per cube size (enough for ao100 and a long history).
const int kHistoryLimit = 1000;

enum TimerPhase {
  /// Waiting; shows the last result.
  idle,

  /// 15-second inspection countdown.
  inspecting,

  /// The pad is held; releasing after [kHoldMillis] starts the solve.
  holding,

  /// The solve is being timed; any touch stops it.
  running,
}

@immutable
class TimerState {
  const TimerState({
    required this.size,
    this.phase = TimerPhase.idle,
    this.inspection = false,
    this.scramble,
    this.fixedScramble = false,
    this.history = const [],
    this.startedAt = 0,
    this.holdStartedAt = 0,
    this.inspectionStartedAt = 0,
    this.holdFromInspection = false,
    this.newBest = false,
  });

  final int size;
  final TimerPhase phase;

  /// WCA inspection before each solve.
  final bool inspection;

  /// The daily challenge's fixed scramble; null in free play, which is
  /// kept distraction-free.
  final String? scramble;

  /// The scramble is given (daily challenge) and never replaced.
  final bool fixedScramble;

  /// Solves for this cube size, oldest first.
  final List<SolveRecord> history;

  /// Clock values (milliseconds) of the current phase.
  final int startedAt;
  final int holdStartedAt;
  final int inspectionStartedAt;
  final bool holdFromInspection;

  /// The last solve set a new personal best.
  final bool newBest;

  SolveRecord? get last => history.isEmpty ? null : history.last;

  /// Penalty the inspection earned if the solve started at [now].
  Penalty inspectionPenalty(int now) {
    if (!holdFromInspection) return Penalty.none;
    final used = now - inspectionStartedAt;
    if (used > kInspectionDnfMillis) return Penalty.dnf;
    if (used > kInspectionMillis) return Penalty.plus2;
    return Penalty.none;
  }

  TimerState copyWith({
    TimerPhase? phase,
    bool? inspection,
    String? scramble,
    bool clearScramble = false,
    bool? fixedScramble,
    List<SolveRecord>? history,
    int? startedAt,
    int? holdStartedAt,
    int? inspectionStartedAt,
    bool? holdFromInspection,
    bool? newBest,
  }) => TimerState(
    size: size,
    phase: phase ?? this.phase,
    inspection: inspection ?? this.inspection,
    scramble: clearScramble ? null : (scramble ?? this.scramble),
    fixedScramble: fixedScramble ?? this.fixedScramble,
    history: history ?? this.history,
    startedAt: startedAt ?? this.startedAt,
    holdStartedAt: holdStartedAt ?? this.holdStartedAt,
    inspectionStartedAt: inspectionStartedAt ?? this.inspectionStartedAt,
    holdFromInspection: holdFromInspection ?? this.holdFromInspection,
    newBest: newBest ?? this.newBest,
  );
}

/// csTimer-style speed timer for one cube size: hold-to-start, optional
/// WCA inspection with +2 / DNF penalties, local history and averages.
///
/// Times are passed in by the caller (milliseconds from any monotonic
/// clock), which keeps the state machine deterministic in tests.
class TimerController extends Notifier<TimerState> {
  TimerController(this.size);

  final int size;

  static const _inspectionKey = 'timer_inspection';
  String get _historyKey => 'timer_history_$size';

  /// The touch that stopped a solve also ends with a release: ignore it.
  bool _ignoreRelease = false;

  @override
  TimerState build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final raw = prefs.getString(_historyKey);
    var history = const <SolveRecord>[];
    if (raw != null) {
      try {
        history = List.unmodifiable([
          for (final item in jsonDecode(raw) as List<dynamic>)
            SolveRecord.fromJson(item as Map<String, dynamic>),
        ]);
      } on FormatException {
        history = const [];
      }
    }
    return TimerState(
      size: size,
      inspection: prefs.getBool(_inspectionKey) ?? false,
      history: history,
    );
  }

  /// Uses [scramble] for every solve (daily challenge).
  void useScramble(String scramble) =>
      state = state.copyWith(scramble: scramble, fixedScramble: true);

  /// A finger touched the pad at [now].
  void press(int now) {
    switch (state.phase) {
      case TimerPhase.running:
        _stop(now);
      case TimerPhase.idle:
        state = state.copyWith(
          phase: TimerPhase.holding,
          holdStartedAt: now,
          holdFromInspection: false,
        );
      case TimerPhase.inspecting:
        state = state.copyWith(
          phase: TimerPhase.holding,
          holdStartedAt: now,
          holdFromInspection: true,
        );
      case TimerPhase.holding:
        break;
    }
  }

  /// The finger left the pad at [now].
  void release(int now) {
    if (_ignoreRelease) {
      _ignoreRelease = false;
      return;
    }
    if (state.phase != TimerPhase.holding) return;
    final fromInspection = state.holdFromInspection;
    if (now - state.holdStartedAt >= kHoldMillis) {
      state = state.copyWith(phase: TimerPhase.running, startedAt: now);
      return;
    }
    // A short tap: starts the inspection when enabled, else nothing.
    if (fromInspection) {
      state = state.copyWith(phase: TimerPhase.inspecting);
    } else if (state.inspection) {
      state = state.copyWith(
        phase: TimerPhase.inspecting,
        inspectionStartedAt: now,
        holdFromInspection: true,
      );
    } else {
      state = state.copyWith(phase: TimerPhase.idle);
    }
  }

  /// Whether the pad has been held long enough to start at [now].
  bool isReady(int now) =>
      state.phase == TimerPhase.holding &&
      now - state.holdStartedAt >= kHoldMillis;

  void _stop(int now) {
    _ignoreRelease = true;
    final record = SolveRecord(
      millis: now - state.startedAt,
      scramble: state.scramble ?? '',
      at: DateTime.now(),
      penalty: state.inspectionPenalty(state.startedAt),
    );
    final previousBest = bestSingle(state.history);
    final result = record.result;
    final history = [...state.history, record];
    _commit(
      history,
      newBest:
          result != null &&
          state.history.isNotEmpty &&
          (previousBest == null || result < previousBest),
    );
    state = state.copyWith(phase: TimerPhase.idle, holdFromInspection: false);
  }

  /// Abandons the current attempt without recording it.
  void cancel() {
    _ignoreRelease = false;
    state = state.copyWith(phase: TimerPhase.idle, holdFromInspection: false);
  }

  void setPenalty(int index, Penalty penalty) {
    final history = [...state.history];
    history[index] = history[index].withPenalty(penalty);
    _commit(history, newBest: false);
  }

  void delete(int index) {
    final history = [...state.history]..removeAt(index);
    _commit(history, newBest: false);
  }

  void clearHistory() => _commit(const [], newBest: false);

  Future<void> toggleInspection() async {
    state = state.copyWith(inspection: !state.inspection);
    await ref
        .read(sharedPreferencesProvider)
        .setBool(_inspectionKey, state.inspection);
  }

  void _commit(List<SolveRecord> history, {required bool newBest}) {
    final kept = history.length > kHistoryLimit
        ? history.sublist(history.length - kHistoryLimit)
        : history;
    state = state.copyWith(history: List.unmodifiable(kept), newBest: newBest);
    ref
        .read(sharedPreferencesProvider)
        .setString(_historyKey, jsonEncode([for (final s in kept) s.toJson()]));
  }
}

final timerProvider = NotifierProvider.autoDispose
    .family<TimerController, TimerState, int>(TimerController.new);
