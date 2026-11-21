import 'dart:async';

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
import 'leaderboard/leaderboard_service.dart';

/// Cube size of the daily challenge.
const int kDailySize = 3;

/// "2026-11-16": the calendar day of [time] (its own fields, no zone shift).
String dayKey(DateTime time) =>
    '${time.year.toString().padLeft(4, '0')}-'
    '${time.month.toString().padLeft(2, '0')}-'
    '${time.day.toString().padLeft(2, '0')}';

/// The challenge day at [now]: its UTC calendar date. The daily scramble,
/// streak and global leaderboard all roll over at 00:00 UTC.
DateTime challengeDay(DateTime now) {
  final utc = now.toUtc();
  return DateTime(utc.year, utc.month, utc.day);
}

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
    this.todayMillis,
  });

  /// Today's challenge day: the UTC calendar day (as a date without a
  /// zone), so every player worldwide shares one scramble and one board.
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

  /// The user's best time on today's challenge (milliseconds), once solved
  /// with a clock running; ranks them on the daily leaderboard.
  final int? todayMillis;

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
    int? todayMillis,
  }) => DailyState(
    date: date,
    scramble: scramble ?? this.scramble,
    streak: streak ?? this.streak,
    bestStreak: bestStreak ?? this.bestStreak,
    doneToday: doneToday ?? this.doneToday,
    hint: hint ?? this.hint,
    hintFailed: hintFailed ?? this.hintFailed,
    todayMillis: todayMillis ?? this.todayMillis,
  );
}

/// One date-seeded scramble per day with a local day streak.
class DailyController extends Notifier<DailyState> {
  static const _lastKey = 'daily_last_day';
  static const _streakKey = 'daily_streak';
  static const _bestKey = 'daily_best_streak';
  static const _timeDayKey = 'daily_time_day';
  static const _timeKey = 'daily_time_ms';

  @override
  DailyState build() {
    final today = challengeDay(ref.watch(clockProvider)());
    final yesterday = DateTime(today.year, today.month, today.day - 1);
    final prefs = ref.watch(sharedPreferencesProvider);
    final last = prefs.getString(_lastKey);
    final stored = prefs.getInt(_streakKey) ?? 0;
    final alive = last == dayKey(today) || last == dayKey(yesterday);
    return DailyState(
      date: today,
      streak: alive ? stored : 0,
      bestStreak: prefs.getInt(_bestKey) ?? 0,
      doneToday: last == dayKey(today),
      todayMillis: prefs.getString(_timeDayKey) == dayKey(today)
          ? prefs.getInt(_timeKey)
          : null,
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

  /// Records today's challenge as done and extends the streak. [millis] is
  /// the solve time when a clock ran; the best one of the day is kept and
  /// sent to the live leaderboard ([moves] when known).
  Future<void> complete({int? millis, int moves = 0}) async {
    final prefs = ref.read(sharedPreferencesProvider);
    if (millis != null && millis > 0) {
      final best = state.todayMillis;
      if (best == null || millis < best) {
        state = state.copyWith(todayMillis: millis);
        await prefs.setString(_timeDayKey, dayKey(state.date));
        await prefs.setInt(_timeKey, millis);
        unawaited(
          ref
              .read(leaderboardSyncProvider.notifier)
              .submit(dayKey: dayKey(state.date), millis: millis, moves: moves),
        );
      }
    }
    if (state.doneToday) return;
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

  /// Clears the streak, the best streak and today's completion.
  Future<void> resetStreak() async {
    state = DailyState(date: state.date, scramble: state.scramble);
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(_timeDayKey);
    await prefs.remove(_timeKey);
    await prefs.remove(_lastKey);
    await prefs.remove(_streakKey);
    await prefs.remove(_bestKey);
  }

  /// Reveals how to start: the white-cross moves of the beginner's
  /// solution. Goes through the reward gate (a rewarded ad).
  Future<void> requestHint() async {
    final cube = state.cube;
    if (cube == null) return;
    final gate = ref.read(rewardGateProvider.notifier);
    if (!(await gate.unlock(RewardFeature.dailyHint)).granted) return;
    try {
      final plan = await ref
          .read(cubeSolverProvider)
          .solve(cube, SolveMethod.layerByLayer);
      final moves = [
        for (final step in plan.steps)
          if (step.phaseName == 'lblCross') step.moveNotation,
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
