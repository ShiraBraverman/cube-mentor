import 'dart:async';

import 'package:cube_mentor/features/daily/leaderboard/daily_leaderboard.dart';
import 'package:cube_mentor/features/daily/leaderboard/leaderboard_service.dart';

/// In-memory live leaderboard: no Firebase, no network. Behaves like the
/// Firestore service (best time per player, fastest first, live updates)
/// and can be switched offline.
class FakeLeaderboardService implements LeaderboardService {
  FakeLeaderboardService({
    this.uid = 'me',
    Map<String, List<LeaderboardRecord>>? days,
    this.online = true,
    this.topLimit,
  }) : _days = {
         for (final e in (days ?? const {}).entries)
           e.key: {for (final r in e.value) r.uid: r},
       };

  final String uid;
  bool online;

  /// Mimics the Firestore page size (null: every record is in the page).
  final int? topLimit;

  final Map<String, Map<String, LeaderboardRecord>> _days;
  final _changes = StreamController<String>.broadcast();
  final submissions = <LeaderboardSubmission>[];

  /// [count] rivals with times spread from [fastest] in [step] increments.
  static List<LeaderboardRecord> rivals(
    int count, {
    int fastest = 9000,
    int step = 37,
  }) => [
    for (var i = 0; i < count; i++)
      LeaderboardRecord(
        uid: 'rival$i',
        nickname: i % 7 == 3 ? '' : 'Player $i',
        millis: fastest + i * step,
        moves: 50 + i % 30,
      ),
  ];

  List<LeaderboardRecord> records(String day) =>
      (_days[day]?.values.toList() ?? <LeaderboardRecord>[])
        ..sort((a, b) => a.millis.compareTo(b.millis));

  /// Adds (or improves) [record] on [day], like another player solving.
  void put(String day, LeaderboardRecord record) {
    final board = _days.putIfAbsent(day, () => {});
    final old = board[record.uid];
    if (old == null || record.millis < old.millis) board[record.uid] = record;
    _changes.add(day);
  }

  /// Goes offline or back online; open boards follow.
  void setOnline(bool value) {
    online = value;
    for (final day in _days.keys.toList()) {
      _changes.add(day);
    }
    _changes.add('');
  }

  @override
  bool get isAvailable => true;

  @override
  Future<String> ensureSignedIn() async {
    if (!online) throw const LeaderboardUnavailableException('offline');
    return uid;
  }

  @override
  Future<void> submit(LeaderboardSubmission submission) async {
    if (!online) throw const LeaderboardUnavailableException('offline');
    submissions.add(submission);
    put(
      submission.dayKey,
      LeaderboardRecord(
        uid: uid,
        nickname: submission.nickname,
        millis: submission.millis,
        moves: submission.moves,
      ),
    );
  }

  LeaderboardPage page(String day) {
    final all = records(day);
    final limit = topLimit;
    final top = limit == null || all.length <= limit
        ? all
        : all.sublist(0, limit);
    final index = all.indexWhere((r) => r.uid == uid);
    final beyond = index >= top.length;
    final start = beyond ? (index - 15).clamp(0, all.length) : 0;
    return LeaderboardPage(
      top: top,
      solverCount: all.length,
      averageMillis: averageMillisOf(all),
      userUid: uid,
      userRank: beyond ? index + 1 : null,
      around: beyond
          ? all.sublist(start, (index + 16).clamp(0, all.length))
          : const [],
      aroundStartRank: start + 1,
    );
  }

  @override
  Stream<LeaderboardPage> watch(String dayKey) async* {
    if (!online) {
      yield* Stream.error(const LeaderboardUnavailableException('offline'));
    } else {
      yield page(dayKey);
    }
    await for (final day in _changes.stream) {
      if (day != dayKey && day.isNotEmpty) continue;
      if (online) {
        yield page(dayKey);
      } else {
        yield* Stream.error(const LeaderboardUnavailableException('offline'));
      }
    }
  }
}
