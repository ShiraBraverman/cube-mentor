import 'dart:math' as math;

import 'package:flutter/foundation.dart';

/// Live global daily leaderboard: pure models and ranking logic. The
/// records come from a [LeaderboardService] (Cloud Firestore in the app,
/// an in-memory fake in tests); nothing here touches the network.

/// Fastest time accepted on the board (milliseconds). Mirrors the
/// `timeMs >= 2000` check of `firestore.rules`.
const int kLeaderboardMinMillis = 2000;

/// Longest nickname stored on the board (Unicode code points). Mirrors the
/// `nickname.size() <= 24` check of `firestore.rules`.
const int kLeaderboardNicknameMax = 24;

/// One player's record on a day's board, as stored at
/// `daily_challenges/{day}/entries/{uid}`.
@immutable
class LeaderboardRecord {
  const LeaderboardRecord({
    required this.uid,
    required this.millis,
    this.nickname = '',
    this.moves = 0,
  });

  final String uid;

  /// The player's nickname; empty when they skipped it (shown as a
  /// localized "Anonymous").
  final String nickname;

  /// Best solve time of the day (milliseconds).
  final int millis;

  /// Moves of that solve; 0 when unknown (e.g. a physical cube on the timer).
  final int moves;
}

/// What a [LeaderboardService] reports about one day, fastest first.
@immutable
class LeaderboardPage {
  const LeaderboardPage({
    required this.top,
    required this.solverCount,
    required this.averageMillis,
    this.userUid,
    this.userRank,
    this.around = const [],
    this.aroundStartRank = 0,
    this.fromCache = false,
  });

  /// The fastest records (all of them when [isComplete]).
  final List<LeaderboardRecord> top;

  /// Players who solved the day so far (all of them, not only [top]).
  final int solverCount;

  /// Mean time of all [solverCount] players (milliseconds).
  final int averageMillis;

  /// The signed-in player, when known.
  final String? userUid;

  /// The player's rank when their record is beyond [top].
  final int? userRank;

  /// Records around the player when they are beyond [top], fastest first;
  /// the first one has rank [aroundStartRank].
  final List<LeaderboardRecord> around;
  final int aroundStartRank;

  /// Served from the device cache (offline); the server may know more.
  final bool fromCache;

  /// [top] holds every record of the day.
  bool get isComplete => top.length >= solverCount;
}

/// One row of the ranked list.
@immutable
class LeaderboardRow {
  const LeaderboardRow({
    required this.rank,
    required this.record,
    this.isUser = false,
    this.pending = false,
  });

  final int rank;
  final LeaderboardRecord record;
  final bool isUser;

  /// The user's local time, not confirmed by the server yet.
  final bool pending;

  int get millis => record.millis;
}

/// The ranked board as shown: the fastest rows, then (when the user ranks
/// beyond them) a gap and the rows around the user.
@immutable
class DailyLeaderboard {
  const DailyLeaderboard._({
    required this.rows,
    required this.solverCount,
    required this.averageMillis,
    required this.userIndex,
    required this.fromCache,
  });

  /// Builds the board from [page], adding the user's local time
  /// [localMillis] when the server does not have it (yet), or has a slower
  /// one: offline solves are ranked at once, marked pending.
  factory DailyLeaderboard.fromPage(
    LeaderboardPage page, {
    int? localMillis,
    String localNickname = '',
  }) {
    final uid = page.userUid;
    var top = [...page.top];
    var around = [...page.around];
    var count = page.solverCount;
    var average = page.averageMillis;
    LeaderboardRecord? mine;

    final inTop = uid == null ? -1 : top.indexWhere((r) => r.uid == uid);
    final inAround = uid == null ? -1 : around.indexWhere((r) => r.uid == uid);
    final serverMillis = inTop >= 0
        ? top[inTop].millis
        : (inAround >= 0 ? around[inAround].millis : null);
    final local = localMillis != null && localMillis >= kLeaderboardMinMillis
        ? localMillis
        : null;

    if (local != null && (serverMillis == null || local < serverMillis)) {
      final record = LeaderboardRecord(
        uid: uid ?? '',
        nickname: localNickname,
        millis: local,
      );
      final fitsTop =
          page.isComplete || (top.isNotEmpty && local < top.last.millis);
      if (fitsTop) {
        if (serverMillis != null) {
          // A faster solve than the one on the server.
          if (inTop >= 0) top.removeAt(inTop);
          around = const [];
          if (count > 0) {
            average = (average + (local - serverMillis) / count).round();
          }
        } else {
          // A newcomer to the field.
          average = ((average * count + local) / (count + 1)).round();
          count += 1;
        }
        mine = record;
        top.insert(lowerBound(top, local), record);
        if (top.length > count) count = top.length;
      }
    }

    final rows = <LeaderboardRow?>[];
    int? userIndex;
    var rank = 0;
    for (var i = 0; i < top.length; i++) {
      // Equal times share the better rank.
      if (i == 0 || top[i].millis != top[i - 1].millis) rank = i + 1;
      final pending = mine != null && identical(top[i], mine);
      final isUser = pending || (uid != null && top[i].uid == uid);
      if (isUser) userIndex = rows.length;
      rows.add(
        LeaderboardRow(
          rank: rank,
          record: top[i],
          isUser: isUser,
          pending: pending,
        ),
      );
    }
    if (userIndex == null && around.isNotEmpty && uid != null) {
      if (page.aroundStartRank > top.length + 1) rows.add(null);
      for (var j = 0; j < around.length; j++) {
        final record = around[j];
        final isUser = record.uid == uid;
        if (isUser) userIndex = rows.length;
        rows.add(
          LeaderboardRow(
            rank: isUser
                ? (page.userRank ?? page.aroundStartRank + j)
                : page.aroundStartRank + j,
            record: record,
            isUser: isUser,
          ),
        );
      }
    }
    return DailyLeaderboard._(
      rows: List.unmodifiable(rows),
      solverCount: count,
      averageMillis: average,
      userIndex: userIndex,
      fromCache: page.fromCache,
    );
  }

  /// Rows fastest first; null marks a gap between the top rows and the
  /// rows around the user.
  final List<LeaderboardRow?> rows;

  /// Players who solved it today (the user included once ranked).
  final int solverCount;

  /// Mean solve time of all players (milliseconds).
  final int averageMillis;

  /// The user's row in [rows], or null when they are not ranked.
  final int? userIndex;

  /// Served from the device cache while offline.
  final bool fromCache;

  LeaderboardRow? get user => userIndex == null ? null : rows[userIndex!];

  /// The user's 1-based rank, or null when they are not ranked.
  int? get userRank => user?.rank;

  /// Everyone who solved it today.
  int get total => solverCount;

  bool get isEmpty => solverCount == 0;

  /// Index of the first record not faster than [millis] in a sorted list
  /// (ties go to the newcomer: they share the better rank).
  @visibleForTesting
  static int lowerBound(List<LeaderboardRecord> sorted, int millis) {
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

/// Mean time of [records] (milliseconds), 0 when empty.
int averageMillisOf(Iterable<LeaderboardRecord> records) {
  var total = 0;
  var n = 0;
  for (final r in records) {
    total += r.millis;
    n++;
  }
  return n == 0 ? 0 : (total / n).round();
}

/// [nickname] trimmed to what the board stores (24 code points).
String leaderboardNickname(String? nickname) {
  final value = nickname?.trim() ?? '';
  final runes = value.runes;
  return runes.length <= kLeaderboardNicknameMax
      ? value
      : String.fromCharCodes(runes.take(kLeaderboardNicknameMax)).trim();
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
