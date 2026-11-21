import 'dart:math' as math;

import 'package:flutter/foundation.dart';

/// Offline daily leaderboard. CubeMentor has no backend, so the field of
/// rivals is simulated on the device: a deterministic generator seeded by
/// the challenge day ("YYYY-MM-DD") yields the same rivals, join order and
/// solve times on every device, and more of them "join" as the UTC day
/// goes by. The user's own record is the only real entry; the screen says
/// so in a footnote.

/// Rivals already on the board at 00:00 UTC.
const int kLeaderboardMinPlayers = 3000;

/// The fewest and the most rivals a day ends with (seeded per day).
const int kLeaderboardDayEndMin = 11000;
const int kLeaderboardDayEndMax = 13500;

/// Fastest and slowest simulated solve (milliseconds).
const int kRivalFastestMillis = 8200;
const int kRivalSlowestMillis = 118000;

/// 32-bit hash of a day key ("2026-11-21"), the seed of that day's field.
int leaderboardSeed(String dayKey) {
  var h = 0x811C9DC5;
  for (final unit in dayKey.codeUnits) {
    h ^= unit;
    h = (h * 0x01000193) & 0xFFFFFFFF;
  }
  return h;
}

/// A small, fully deterministic 32-bit generator (mulberry32), so every
/// platform derives the same field from the same seed.
class _Rng {
  _Rng(int seed) : _state = seed & 0xFFFFFFFF;

  int _state;

  int nextUint32() {
    _state = (_state + 0x6D2B79F5) & 0xFFFFFFFF;
    var t = _state;
    t = _imul(t ^ (t >> 15), t | 1);
    t ^= (t + _imul(t ^ (t >> 7), t | 61)) & 0xFFFFFFFF;
    return (t ^ (t >> 14)) & 0xFFFFFFFF;
  }

  /// Uniform in [0, 1).
  double nextDouble() => nextUint32() / 4294967296.0;

  int nextInt(int max) => nextUint32() % max;

  static int _imul(int a, int b) => (a * b) & 0xFFFFFFFF;
}

/// Mixes a day seed and a rival index into an independent stream seed.
int _mix(int seed, int index) {
  var h = (seed ^ (index * 0x9E3779B1)) & 0xFFFFFFFF;
  h = ((h ^ (h >> 16)) * 0x85EBCA6B) & 0xFFFFFFFF;
  h = ((h ^ (h >> 13)) * 0xC2B2AE35) & 0xFFFFFFFF;
  return (h ^ (h >> 16)) & 0xFFFFFFFF;
}

/// Fraction of the UTC day elapsed at [now], in [0, 1).
double utcDayProgress(DateTime now) {
  final utc = now.toUtc();
  final millis =
      ((utc.hour * 60 + utc.minute) * 60 + utc.second) * 1000 + utc.millisecond;
  return millis / Duration.millisecondsPerDay;
}

/// Rivals on the board of the day [seed] at day progress [progress]: from
/// [kLeaderboardMinPlayers] at midnight to the seeded day-end total, faster
/// in the (UTC) afternoon and slower at night, never decreasing.
int rivalCountAt(int seed, double progress) {
  final p = progress.clamp(0.0, 1.0);
  final end =
      kLeaderboardDayEndMin +
      _Rng(seed).nextInt(kLeaderboardDayEndMax - kLeaderboardDayEndMin + 1);
  // Monotonic: d/dp = 1 - 0.45 cos(2 pi p) > 0.
  final shaped = p - 0.45 * math.sin(2 * math.pi * p) / (2 * math.pi);
  return kLeaderboardMinPlayers +
      ((end - kLeaderboardMinPlayers) * shaped).floor();
}

/// Solve time of rival [index] of the day [seed]: a log-normal bell around
/// ~43 s for most players plus a small cluster of sub-15 s speedcubers.
int rivalMillis(int seed, int index) {
  final rng = _Rng(_mix(seed, index));
  final speedcuber = rng.nextDouble() < 0.035;
  // Box-Muller: a standard normal sample.
  final u1 = math.max(rng.nextDouble(), 1e-9);
  final u2 = rng.nextDouble();
  final z = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2);
  final seconds = speedcuber ? 13.0 + 2.4 * z : 43.0 * math.exp(0.34 * z);
  return (seconds * 1000).round().clamp(
    kRivalFastestMillis,
    kRivalSlowestMillis,
  );
}

const _firstNames = [
  // Latin America and Iberia.
  'Mateo', 'Sofía', 'Santiago', 'Valentina', 'Lucas', 'Camila', 'Diego',
  'Isabela', 'Gabriel', 'Lucía', 'Thiago', 'Mariana', 'Joaquín', 'Inês',
  // Europe.
  'Liam', 'Emma', 'Noah', 'Olivia', 'Jonas', 'Léa', 'Luca', 'Giulia',
  'Finn', 'Mia', 'Hugo', 'Chloé', 'Matteo', 'Elena', 'Jakub', 'Zuzanna',
  'Mikhail', 'Anya', 'Dmitri', 'Katya', 'Emre', 'Elif', 'Lars', 'Freya',
  // Middle East and Africa.
  'Omar', 'Layla', 'Yusuf', 'Noor', 'Amir', 'Yasmin', 'Noam', 'Tamar',
  'Ariel', 'Shira', 'Kwame', 'Amara', 'Tunde', 'Zainab', 'Karim', 'Salma',
  // South and Southeast Asia.
  'Arjun', 'Priya', 'Rohan', 'Ananya', 'Vihaan', 'Diya', 'Rahim', 'Nusrat',
  'Budi', 'Putri', 'Rizky', 'Ayu', 'Minh', 'Linh', 'Khoa', 'Thảo', 'Aung',
  'Thiri', 'Jose', 'Maria', 'Paolo', 'Angel',
  // East Asia.
  'Haruto', 'Yui', 'Sota', 'Hina', 'Ren', 'Sakura', 'Minjun', 'Seoyeon',
  'Jiho', 'Haeun', 'Wei', 'Mei', 'Hao', 'Xin', 'Jun', 'Ling', 'Tzu-Yu',
  // North America and Oceania.
  'Ethan', 'Ava', 'Mason', 'Harper', 'Logan', 'Zoe', 'Caleb', 'Ruby',
  'Kai', 'Aria', 'Leo', 'Isla', 'Max', 'Nina', 'Alex', 'Sam',
];

const _handles = [
  'Cuber',
  'Cubes',
  'Twist',
  'Turns',
  'Solves',
  'Speed',
  'OLL',
  'PLL',
  'Layer',
  'Corner',
  'Edge',
  'Swift',
  'Rubix',
  'Spin',
  'Flip',
  'Cross',
];

const _prefixes = ['x', 'the', 'mr', 'its', 'lil', 'pro', 'iam', 'cube'];

/// Display name of rival [index] of the day [seed]: a mix of first names,
/// initials, numbered tags and cubing handles from around the world.
String rivalName(int seed, int index) {
  final rng = _Rng(_mix(seed ^ 0x5BD1E995, index));
  final first = _firstNames[rng.nextInt(_firstNames.length)];
  final handle = _handles[rng.nextInt(_handles.length)];
  final number = rng.nextInt(1000);
  final initial = String.fromCharCode(65 + rng.nextInt(26));
  return switch (rng.nextInt(9)) {
    0 || 1 => first,
    2 => '$first $initial.',
    3 => '${first}_$number',
    4 => '$first$handle',
    5 => '${_prefixes[rng.nextInt(_prefixes.length)]}$first',
    6 => '${handle}_${first.toLowerCase()}',
    7 => '$first${number % 100}',
    _ => '$handle$first',
  };
}

/// One row of the ranked list. [rival] is -1 for the user's own row.
@immutable
class LeaderboardEntry {
  const LeaderboardEntry({required this.millis, required this.rival});

  final int millis;
  final int rival;

  bool get isUser => rival < 0;
}

/// The ranked board of one day at one moment.
@immutable
class DailyLeaderboard {
  const DailyLeaderboard._({
    required this.seed,
    required this.entries,
    required this.rivalCount,
    required this.averageMillis,
    required this.userIndex,
  });

  /// Builds the board of [dayKey] as it stands at [now]; [userMillis] is
  /// the user's own time today, or null before they solved it.
  factory DailyLeaderboard.build({
    required String dayKey,
    required DateTime now,
    int? userMillis,
  }) {
    final seed = leaderboardSeed(dayKey);
    final count = rivalCountAt(seed, utcDayProgress(now));
    final entries = <LeaderboardEntry>[
      for (var i = 0; i < count; i++)
        LeaderboardEntry(millis: rivalMillis(seed, i), rival: i),
    ];
    var total = 0;
    for (final e in entries) {
      total += e.millis;
    }
    // Equal times: the earlier joiner ranks first.
    entries.sort((a, b) {
      final byTime = a.millis.compareTo(b.millis);
      return byTime != 0 ? byTime : a.rival.compareTo(b.rival);
    });
    int? userIndex;
    if (userMillis != null) {
      // Ties go to the user (they share the better rank).
      userIndex = lowerBound(entries, userMillis);
      entries.insert(
        userIndex,
        LeaderboardEntry(millis: userMillis, rival: -1),
      );
    }
    return DailyLeaderboard._(
      seed: seed,
      entries: List.unmodifiable(entries),
      rivalCount: count,
      averageMillis: count == 0 ? 0 : (total / count).round(),
      userIndex: userIndex,
    );
  }

  static DailyLeaderboard? _last;
  static String? _lastDay;

  /// [DailyLeaderboard.build], reusing the last board while nobody new
  /// joined and the user's time is unchanged (screens rebuild often).
  static DailyLeaderboard cached({
    required String dayKey,
    required DateTime now,
    int? userMillis,
  }) {
    final last = _last;
    final count = rivalCountAt(leaderboardSeed(dayKey), utcDayProgress(now));
    if (last != null &&
        _lastDay == dayKey &&
        last.rivalCount == count &&
        last.userMillis == userMillis) {
      return last;
    }
    _lastDay = dayKey;
    return _last = DailyLeaderboard.build(
      dayKey: dayKey,
      now: now,
      userMillis: userMillis,
    );
  }

  final int seed;

  int? get userMillis => userIndex == null ? null : entries[userIndex!].millis;

  /// Everyone on the board, fastest first (the user included once ranked).
  final List<LeaderboardEntry> entries;

  /// Simulated rivals who solved it so far today.
  final int rivalCount;

  /// Mean rival time (milliseconds).
  final int averageMillis;

  /// The user's row in [entries], or null before they solved it.
  final int? userIndex;

  /// The user's 1-based rank, or null before they solved it.
  int? get userRank => userIndex == null ? null : userIndex! + 1;

  /// Everyone on the board.
  int get total => entries.length;

  /// Display name of a rival row (the user's row is named by the screen).
  String nameOf(LeaderboardEntry entry) => rivalName(seed, entry.rival);

  /// Index of the first entry not faster than [millis] in a sorted list.
  @visibleForTesting
  static int lowerBound(List<LeaderboardEntry> sorted, int millis) {
    var lo = 0;
    var hi = sorted.length;
    while (lo < hi) {
      final mid = (lo + hi) >> 1;
      if (sorted[mid].millis < millis) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }
}

/// Scroll offset that centers row [index] (of height [rowExtent]) in a
/// viewport of [viewport] height, clamped to the list's scroll range.
double centeredOffset({
  required int index,
  required double rowExtent,
  required double viewport,
  required int rowCount,
  double leading = 0,
}) {
  final max = math.max(0.0, leading + rowCount * rowExtent - viewport);
  final target = leading + index * rowExtent - (viewport - rowExtent) / 2;
  return target.clamp(0.0, max);
}
