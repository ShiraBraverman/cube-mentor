import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/features/daily/daily_controller.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/features/daily/leaderboard/daily_leaderboard.dart';
import 'package:cube_mentor/features/daily/leaderboard/leaderboard_screen.dart';
import 'package:cube_mentor/features/daily/leaderboard/leaderboard_service.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/timer/model/timer_stats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'fake_leaderboard_service.dart';
import 'fake_scrambler.dart';
import 'test_app.dart';

const _day = '2026-11-16';

/// A moment of the challenge day [_day] (UTC), whatever the test zone.
DateTime _at(int hour, [int minute = 0]) =>
    DateTime.utc(2026, 11, 16, hour, minute);

LeaderboardRecord _rec(String uid, int millis, [String nickname = '']) =>
    LeaderboardRecord(uid: uid, millis: millis, nickname: nickname);

Future<void> _advance(WidgetTester tester, [int frames = 12]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

String _grouped(int v) =>
    v.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');

void main() {
  group('ranked board', () {
    test('ranks fastest first; equal times share the better rank', () {
      final board = DailyLeaderboard.fromPage(
        LeaderboardPage(
          top: [
            _rec('a', 9000),
            _rec('me', 12000),
            _rec('b', 12000),
            _rec('c', 15000),
          ],
          solverCount: 4,
          averageMillis: 12000,
          userUid: 'me',
        ),
      );
      expect([for (final r in board.rows) r!.rank], [1, 2, 2, 4]);
      expect(board.userIndex, 1);
      expect(board.userRank, 2);
      expect(board.total, 4);
      expect(board.user!.pending, isFalse);
    });

    test('a local solve the server lacks is ranked at once, pending', () {
      final board = DailyLeaderboard.fromPage(
        LeaderboardPage(
          top: [_rec('a', 9000), _rec('b', 20000)],
          solverCount: 2,
          averageMillis: 14500,
          userUid: 'me',
        ),
        localMillis: 11000,
        localNickname: 'Shira',
      );
      expect(board.userRank, 2);
      expect(board.total, 3);
      expect(board.averageMillis, 13333);
      expect(board.user!.pending, isTrue);
      expect(board.user!.record.nickname, 'Shira');
      // A faster local time replaces the slower server record.
      final faster = DailyLeaderboard.fromPage(
        LeaderboardPage(
          top: [_rec('a', 9000), _rec('me', 30000)],
          solverCount: 2,
          averageMillis: 19500,
          userUid: 'me',
        ),
        localMillis: 8000,
      );
      expect(faster.userRank, 1);
      expect(faster.total, 2);
      expect(faster.rows.where((r) => r!.isUser), hasLength(1));
      // A slower local time than the server's keeps the server record.
      final slower = DailyLeaderboard.fromPage(
        LeaderboardPage(
          top: [_rec('me', 9000), _rec('a', 20000)],
          solverCount: 2,
          averageMillis: 14500,
          userUid: 'me',
        ),
        localMillis: 15000,
      );
      expect(slower.userRank, 1);
      expect(slower.user!.pending, isFalse);
      expect(slower.user!.millis, 9000);
      // Impossible times never reach the board.
      final tooFast = DailyLeaderboard.fromPage(
        const LeaderboardPage(top: [], solverCount: 0, averageMillis: 0),
        localMillis: 1500,
      );
      expect(tooFast.userRank, isNull);
      expect(tooFast.isEmpty, isTrue);
    });

    test('a user beyond the top rows gets a gap and their neighbors', () {
      final board = DailyLeaderboard.fromPage(
        LeaderboardPage(
          top: [for (var i = 0; i < 3; i++) _rec('t$i', 9000 + i)],
          solverCount: 900,
          averageMillis: 40000,
          userUid: 'me',
          userRank: 412,
          around: [_rec('x', 41000), _rec('me', 41200), _rec('y', 41300)],
          aroundStartRank: 411,
        ),
      );
      expect(board.rows, hasLength(7));
      expect(board.rows[3], isNull, reason: 'gap after the top rows');
      expect(board.userIndex, 5);
      expect(board.userRank, 412);
      expect(board.rows[4]!.rank, 411);
      expect(board.rows[6]!.rank, 413);
      // Offline, a local time beyond an incomplete top is not guessed.
      final unsynced = DailyLeaderboard.fromPage(
        LeaderboardPage(
          top: [for (var i = 0; i < 3; i++) _rec('t$i', 9000 + i)],
          solverCount: 900,
          averageMillis: 40000,
          userUid: 'me',
        ),
        localMillis: 50000,
      );
      expect(unsynced.userRank, isNull);
    });

    test('nicknames fit the rules; centering stays in range', () {
      expect(leaderboardNickname(null), '');
      expect(leaderboardNickname('  Shira '), 'Shira');
      expect(leaderboardNickname('x' * 30).runes.length, 24);
      expect(leaderboardNickname('🧊' * 30).runes.length, 24);
      expect(
        centeredOffset(
          index: 100,
          rowExtent: 50,
          viewport: 500,
          rowCount: 1000,
        ),
        100 * 50 - 225,
      );
      expect(
        centeredOffset(index: 0, rowExtent: 50, viewport: 500, rowCount: 1000),
        0,
      );
      expect(
        centeredOffset(
          index: 999,
          rowExtent: 50,
          viewport: 500,
          rowCount: 1000,
        ),
        1000 * 50 - 500,
      );
    });

    test('the challenge day is the UTC date', () {
      expect(dayKey(challengeDay(DateTime.utc(2026, 11, 16, 23, 59))), _day);
      expect(
        dayKey(challengeDay(DateTime.utc(2026, 11, 17, 0, 1))),
        '2026-11-17',
      );
    });
  });

  group('upload queue', () {
    Future<(ProviderContainer, SharedPreferences)> containerWith(
      FakeLeaderboardService service, {
      Map<String, Object> prefs = const {},
    }) async {
      SharedPreferences.setMockInitialValues(prefs);
      final stored = await SharedPreferences.getInstance();
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(stored),
          clockProvider.overrideWithValue(() => _at(8)),
          leaderboardServiceProvider.overrideWithValue(service),
        ],
      );
      addTearDown(c.dispose);
      return (c, stored);
    }

    test('the day\'s best time is uploaded with the nickname', () async {
      final service = FakeLeaderboardService();
      final (c, _) = await containerWith(
        service,
        prefs: {'user_nickname': 'Shira', 'nickname_prompted': true},
      );
      final daily = c.read(dailyProvider.notifier);
      await daily.complete(millis: 52000, moves: 61);
      await daily.complete(millis: 61000);
      await daily.complete(millis: 47000, moves: 55);
      await pumpEventQueue();
      expect(c.read(dailyProvider).todayMillis, 47000);
      expect([for (final s in service.submissions) s.millis], [52000, 47000]);
      expect(service.submissions.last.dayKey, _day);
      expect(service.submissions.last.nickname, 'Shira');
      expect(service.submissions.last.moves, 55);
      expect(service.records(_day).single.millis, 47000);
      expect(c.read(leaderboardSyncProvider), isNull);
    });

    test('offline solves wait on the device and sync later', () async {
      final service = FakeLeaderboardService(online: false);
      final (c, prefs) = await containerWith(service);
      await c.read(dailyProvider.notifier).complete(millis: 45000);
      await pumpEventQueue();
      expect(service.submissions, isEmpty);
      final pending = c.read(leaderboardSyncProvider)!;
      expect(pending.millis, 45000);
      expect(pending.nickname, '', reason: 'skipped: shown as Anonymous');
      expect(prefs.getString('leaderboard_pending'), contains('45000'));

      // An app restart still has it, and uploads it once online.
      final again = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          clockProvider.overrideWithValue(() => _at(9)),
          leaderboardServiceProvider.overrideWithValue(service),
        ],
      );
      addTearDown(again.dispose);
      expect(again.read(leaderboardSyncProvider)?.millis, 45000);
      service.online = true;
      expect(await again.read(leaderboardSyncProvider.notifier).sync(), isTrue);
      expect(service.records(_day).single.millis, 45000);
      expect(again.read(leaderboardSyncProvider), isNull);
      expect(prefs.getString('leaderboard_pending'), isNull);
    });

    test('impossible times and a missing backend upload nothing', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          clockProvider.overrideWithValue(() => _at(8)),
        ],
      );
      addTearDown(c.dispose);
      final sync = c.read(leaderboardSyncProvider.notifier);
      expect(await sync.submit(dayKey: _day, millis: 1999), isFalse);
      expect(c.read(leaderboardSyncProvider), isNull);
      // Without Firebase the solve stays queued.
      expect(await sync.submit(dayKey: _day, millis: 30000), isFalse);
      expect(c.read(leaderboardSyncProvider)?.millis, 30000);
    });
  });

  Future<SharedPreferences> prefsWith(Map<String, Object> values) async {
    SharedPreferences.setMockInitialValues(values);
    return SharedPreferences.getInstance();
  }

  void phone(WidgetTester tester) {
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
  }

  Widget scope({
    required SharedPreferences prefs,
    required LeaderboardService service,
    required DateTime Function() clock,
    required Widget child,
  }) => ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      clockProvider.overrideWithValue(clock),
      leaderboardServiceProvider.overrideWithValue(service),
      scramblerProvider.overrideWithValue(FakeScrambler()),
      cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
    ],
    child: testApp(child),
  );

  const solvedPrefs = <String, Object>{
    'daily_last_day': _day,
    'daily_streak': 1,
    'daily_time_day': _day,
    'daily_time_ms': 44870,
    'user_nickname': 'Shira',
    'nickname_prompted': true,
  };

  testWidgets('leaderboard opens centered on the user, scrolls to #1', (
    tester,
  ) async {
    phone(tester);
    final rivals = FakeLeaderboardService.rivals(1200);
    final service = FakeLeaderboardService(
      days: {
        _day: [...rivals, _rec('me', 44870, 'Shira')],
      },
    );
    await tester.pumpWidget(
      scope(
        prefs: await prefsWith(solvedPrefs),
        service: service,
        clock: () => _at(15, 20),
        child: const DailyLeaderboardScreen(),
      ),
    );
    await _advance(tester, 2);
    final rank = rivals.where((r) => r.millis < 44870).length + 1;
    expect(rank, greaterThan(900), reason: 'deep in the list');
    expect(find.text('#${_grouped(rank)} of 1,201'), findsOneWidget);
    expect(find.text('Your time: 44.87'), findsOneWidget);
    expect(
      find.text(
        '1,201 players solved it today • Avg time: '
        '${formatTime(averageMillisOf(service.records(_day)))}',
      ),
      findsOneWidget,
    );
    expect(find.byKey(const ValueKey('leaderboard-live')), findsOneWidget);
    expect(find.byKey(const ValueKey('leaderboard-notice')), findsNothing);

    // The user's row is on screen, centered in the list, with neighbors
    // above and below.
    final me = find.byKey(const ValueKey('leaderboard-me'));
    expect(me, findsOneWidget);
    expect(
      find.descendant(of: me, matching: find.text('Shira')),
      findsOneWidget,
    );
    final list = tester.getRect(find.byKey(const ValueKey('leaderboard-list')));
    final row = tester.getRect(me);
    expect((row.center.dy - list.center.dy).abs(), lessThan(2));
    expect(find.text('#${_grouped(rank - 1)}'), findsOneWidget);
    expect(find.text('#${_grouped(rank + 1)}'), findsOneWidget);

    // All the way up to the champion...
    final scroll = tester
        .widget<ListView>(find.byKey(const ValueKey('leaderboard-list')))
        .controller!;
    scroll.jumpTo(0);
    await tester.pump();
    expect(find.text('#1'), findsOneWidget);
    expect(find.text('Player 0'), findsOneWidget);
    // Skipped nicknames read "Anonymous".
    expect(find.text('Anonymous'), findsWidgets);
    expect(me, findsNothing);
    // ...and back with "Jump to my rank".
    await tester.tap(find.byKey(const ValueKey('leaderboard-jump')));
    await tester.pumpAndSettle();
    expect(me, findsOneWidget);
    // ...and down to the last place.
    scroll.jumpTo(scroll.position.maxScrollExtent);
    await tester.pump();
    expect(find.text('#1,201'), findsOneWidget);

    // Live: a faster player joins and the user's rank drops by one.
    service.put(_day, _rec('newcomer', 9001, 'Rapid'));
    await _advance(tester, 2);
    expect(find.text('#${_grouped(rank + 1)} of 1,202'), findsOneWidget);
  });

  testWidgets('a user beyond the top rows sees a gap, centered on them', (
    tester,
  ) async {
    phone(tester);
    final service = FakeLeaderboardService(
      topLimit: 50,
      days: {
        _day: [
          // The user lands mid-field, far beyond the 50 top rows.
          ...FakeLeaderboardService.rivals(400, fastest: 30000, step: 80),
          _rec('me', 44870, 'Shira'),
        ],
      },
    );
    await tester.pumpWidget(
      scope(
        prefs: await prefsWith(solvedPrefs),
        service: service,
        clock: () => _at(12),
        child: const DailyLeaderboardScreen(),
      ),
    );
    await _advance(tester, 2);
    final rank = service.records(_day).indexWhere((r) => r.uid == 'me') + 1;
    expect(rank, greaterThan(50));
    expect(find.text('#${_grouped(rank)} of 401'), findsOneWidget);
    final me = find.byKey(const ValueKey('leaderboard-me'));
    expect(me, findsOneWidget);
    final list = tester.getRect(find.byKey(const ValueKey('leaderboard-list')));
    expect((tester.getRect(me).center.dy - list.center.dy).abs(), lessThan(2));
    // The gap sits between the 50 top rows and the user's neighbors.
    tester
        .widget<ListView>(find.byKey(const ValueKey('leaderboard-list')))
        .controller!
        .jumpTo(48 * kLeaderboardRowExtent);
    await tester.pump();
    expect(find.byKey(const ValueKey('leaderboard-gap')), findsOneWidget);
    expect(find.text('#50'), findsOneWidget);
  });

  testWidgets('without a solve the board is unranked and starts at #1', (
    tester,
  ) async {
    phone(tester);
    final service = FakeLeaderboardService(
      days: {_day: FakeLeaderboardService.rivals(40)},
    );
    await tester.pumpWidget(
      scope(
        prefs: await prefsWith({}),
        service: service,
        clock: () => _at(8),
        child: const DailyLeaderboardScreen(),
      ),
    );
    await _advance(tester, 2);
    expect(find.byKey(const ValueKey('leaderboard-unranked')), findsOneWidget);
    expect(find.byKey(const ValueKey('leaderboard-me')), findsNothing);
    expect(find.byKey(const ValueKey('leaderboard-jump')), findsNothing);
    expect(find.text('#1'), findsOneWidget);
  });

  testWidgets('offline: a clean notice, then the live board on reconnect', (
    tester,
  ) async {
    phone(tester);
    final service = FakeLeaderboardService(
      online: false,
      days: {_day: FakeLeaderboardService.rivals(30)},
    );
    await tester.pumpWidget(
      scope(
        prefs: await prefsWith({}),
        service: service,
        clock: () => _at(8),
        child: const DailyLeaderboardScreen(),
      ),
    );
    await _advance(tester, 2);
    expect(find.byKey(const ValueKey('leaderboard-offline')), findsOneWidget);
    expect(
      find.text(
        "You're offline. Live rankings will appear when you reconnect.",
      ),
      findsOneWidget,
    );
    expect(find.byKey(const ValueKey('leaderboard-list')), findsNothing);
    service.setOnline(true);
    await tester.tap(find.byKey(const ValueKey('leaderboard-retry')));
    await _advance(tester, 2);
    expect(find.byKey(const ValueKey('leaderboard-offline')), findsNothing);
    expect(find.byKey(const ValueKey('leaderboard-list')), findsOneWidget);
    expect(find.text('#1'), findsOneWidget);
  });

  testWidgets('an empty day invites the user to be first', (tester) async {
    phone(tester);
    await tester.pumpWidget(
      scope(
        prefs: await prefsWith({'nickname_prompted': true}),
        service: FakeLeaderboardService(),
        clock: () => _at(0, 5),
        child: const DailyScreen(),
      ),
    );
    await _advance(tester, 2);
    expect(
      find.text("No one has solved today's challenge yet. Be the first!"),
      findsOneWidget,
    );
  });

  testWidgets('daily page: live banner, then a timed solve ranks the user', (
    tester,
  ) async {
    phone(tester);
    final service = FakeLeaderboardService(
      days: {_day: FakeLeaderboardService.rivals(238, fastest: 21000)},
    );
    var now = _at(10);
    await tester.pumpWidget(
      scope(
        prefs: await prefsWith({'nickname_prompted': true}),
        service: service,
        clock: () => now,
        child: const DailyScreen(),
      ),
    );
    await _advance(tester, 2);
    expect(
      find.text("You haven't solved today's challenge yet!"),
      findsOneWidget,
    );
    String field() => tester
        .widget<Text>(find.byKey(const ValueKey('leaderboard-status-field')))
        .data!;
    expect(
      field(),
      '238 players solved it today • Avg time: '
      '${formatTime(averageMillisOf(service.records(_day)))}',
    );

    // Live: another player solves and the banner follows at once.
    service.put(_day, _rec('late', 60000, 'Late'));
    await _advance(tester, 2);
    expect(field(), startsWith('239 players solved it today'));

    // Solve on the 3D cube in 42.5 s; back on the daily page the board
    // opens on the user's fresh rank, uploaded to the server.
    await tester.tap(find.byKey(const ValueKey('daily-virtual')));
    await _advance(tester);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Solver3DScreen)),
    );
    now = now.add(const Duration(milliseconds: 42500));
    final controller = container.read(cubeSessionProvider(3).notifier);
    final moves = MoveNotation.parseSequence(FakeScrambler.daily, 3);
    for (final move in moves.reversed) {
      controller.turn(move.inverse);
    }
    await _advance(tester, 160);
    expect(container.read(dailyProvider).todayMillis, 42500);
    expect(service.submissions.single.millis, 42500);
    expect(service.submissions.single.moves, moves.length);
    expect(service.submissions.single.dayKey, _day);
    await tester.pump(const Duration(seconds: 5));
    await tester.pageBack();
    await _advance(tester, 20);
    expect(find.byType(DailyLeaderboardScreen), findsOneWidget);
    expect(find.byKey(const ValueKey('leaderboard-me')), findsOneWidget);
    expect(find.text('You'), findsOneWidget);
    expect(find.text('Your time: 42.50'), findsOneWidget);
    final rank =
        service.records(_day).where((r) => r.millis < 42500).length + 1;
    expect(find.text('#$rank of 240'), findsOneWidget);

    // The daily page now shows the rank instead of the reminder.
    await tester.pageBack();
    await _advance(tester, 20);
    expect(
      find.text("You haven't solved today's challenge yet!"),
      findsNothing,
    );
    expect(
      tester
          .widget<Text>(find.byKey(const ValueKey('leaderboard-status-title')))
          .data,
      '#$rank of 240',
    );
  });

  testWidgets('offline solve: ranked locally, queued with a notice', (
    tester,
  ) async {
    phone(tester);
    final service = FakeLeaderboardService(
      online: false,
      days: {_day: FakeLeaderboardService.rivals(30)},
    );
    final prefs = await prefsWith({
      ...solvedPrefs,
      'leaderboard_pending':
          '{"day":"$_day","ms":44870,"moves":0,"nick":"Shira"}',
    });
    await tester.pumpWidget(
      scope(
        prefs: prefs,
        service: service,
        clock: () => _at(9),
        child: const DailyScreen(),
      ),
    );
    await _advance(tester, 2);
    expect(find.text('Your time: 44.87'), findsOneWidget);
    expect(
      find.text(
        "Your time is saved and will be ranked once you're back online.",
      ),
      findsOneWidget,
    );
    // Back online: the queued solve goes up and the rank appears.
    service.setOnline(true);
    await tester.runAsync(
      () =>
          ProviderScope.containerOf(tester.element(find.byType(DailyScreen)))
              .read(leaderboardSyncProvider.notifier)
              .sync(),
    );
    await _advance(tester, 2);
    expect(service.records(_day).any((r) => r.uid == 'me'), isTrue);
    expect(
      tester
          .widget<Text>(find.byKey(const ValueKey('leaderboard-status-title')))
          .data,
      '#31 of 31',
    );
    expect(prefs.getString('leaderboard_pending'), isNull);
  });
}
