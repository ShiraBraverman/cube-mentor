import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ads/reward_gate.dart';
import '../../core/cube/cube_move.dart';
import '../../core/cube/cube_state.dart';
import '../../core/scramble/scrambler.dart';
import '../../core/settings/clock.dart';
import '../../core/settings/preferences.dart';
import '../../core/solver/cube_solver.dart';
import '../../core/solver/solve_step.dart';

/// Cube size of the daily challenge.
const int kDailySize = 3;

/// "2026-11-16": the local calendar day of [time].
String dayKey(DateTime time) =>
    '${time.year.toString().padLeft(4, '0')}-'
    '${time.month.toString().padLeft(2, '0')}-'
    '${time.day.toString().padLeft(2, '0')}';

/// Scramble seed of a day: the same scramble for everyone, fully offline.
int daySeed(DateTime time) => time.year * 10000 + time.month * 100 + time.day;

@immutable
class DailyState {
  const DailyState({
    required this.date,
    this.scramble,
    this.streak = 0,
    this.bestStreak = 0,
    this.doneToday = false,
    this.hint,
    this.hintFailed = false,
  });

  /// Today (local time, midnight).
  final DateTime date;

  /// Today's scramble; null while it is generated.
  final String? scramble;

  /// Consecutive days solved, including today once done.
  final int streak;
  final int bestStreak;
  final bool doneToday;

  /// First moves of a solution (the white cross), once asked for.
  final List<String>? hint;
  final bool hintFailed;

  /// Today's scrambled cube (white on top, green in front).
  CubeState? get cube {
    final text = scramble;
    if (text == null) return null;
    return CubeState.solved(kDailySize)
        .applyAll(MoveNotation.parseSequence(text, kDailySize));
  }

  DailyState copyWith({
    String? scramble,
    int? streak,
    int? bestStreak,
    bool? doneToday,
    List<String>? hint,
    bool? hintFailed,
  }) => DailyState(
    date: date,
    scramble: scramble ?? this.scramble,
    streak: streak ?? this.streak,
    bestStreak: bestStreak ?? this.bestStreak,
    doneToday: doneToday ?? this.doneToday,
    hint: hint ?? this.hint,
    hintFailed: hintFailed ?? this.hintFailed,
  );
}

/// One date-seeded scramble per day with a local day streak.
class DailyController extends Notifier<DailyState> {
  static const _lastKey = 'daily_last_day';
  static const _streakKey = 'daily_streak';
  static const _bestKey = 'daily_best_streak';

  @override
  DailyState build() {
    final now = ref.watch(clockProvider)();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final prefs = ref.watch(sharedPreferencesProvider);
    final last = prefs.getString(_lastKey);
    final stored = prefs.getInt(_streakKey) ?? 0;
    final alive = last == dayKey(today) || last == dayKey(yesterday);
    return DailyState(
      date: today,
      streak: alive ? stored : 0,
      bestStreak: prefs.getInt(_bestKey) ?? 0,
      doneToday: last == dayKey(today),
    );
  }

  /// Generates today's scramble (once).
  Future<void> loadScramble() async {
    if (state.scramble != null) return;
    final text = await ref
        .read(scramblerProvider)
        .scramble(kDailySize, seed: daySeed(state.date));
    if (ref.mounted) state = state.copyWith(scramble: text);
  }

  /// Records today's challenge as done and extends the streak.
  Future<void> complete() async {
    if (state.doneToday) return;
    final prefs = ref.read(sharedPreferencesProvider);
    final yesterday = DateTime(
      state.date.year,
      state.date.month,
      state.date.day - 1,
    );
    final last = prefs.getString(_lastKey);
    final streak = last == dayKey(yesterday)
        ? (prefs.getInt(_streakKey) ?? 0) + 1
        : 1;
    final best = streak > state.bestStreak ? streak : state.bestStreak;
    state = state.copyWith(streak: streak, bestStreak: best, doneToday: true);
    await prefs.setString(_lastKey, dayKey(state.date));
    await prefs.setInt(_streakKey, streak);
    await prefs.setInt(_bestKey, best);
  }

  /// Reveals how to start: the white-cross moves of the beginner's
  /// solution. Goes through the reward gate (a rewarded ad in Milestone 5).
  Future<void> requestHint() async {
    final cube = state.cube;
    if (cube == null) return;
    final gate = ref.read(rewardGateProvider);
    if (!await gate.unlock(RewardFeature.dailyHint)) return;
    try {
      final plan = await ref
          .read(cubeSolverProvider)
          .solve(cube, SolveMethod.layerByLayer);
      final moves = [
        for (final step in plan.steps)
          if (step.phaseName == 'lblOrient' || step.phaseName == 'lblCross')
            step.moveNotation,
      ];
      if (ref.mounted) state = state.copyWith(hint: moves, hintFailed: false);
    } on SolveException {
      if (ref.mounted) state = state.copyWith(hintFailed: true);
    }
  }
}

final dailyProvider = NotifierProvider<DailyController, DailyState>(
  DailyController.new,
);
