import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/features/daily/daily_controller.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/features/daily/leaderboard/daily_leaderboard.dart';
import 'package:cube_mentor/features/daily/leaderboard/leaderboard_screen.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'fake_scrambler.dart';
import 'test_app.dart';

const _day = '2026-11-16';

Future<void> _advance(WidgetTester tester, [int frames = 12]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  group('seeded daily field', () {
    test('the same day gives the same rivals everywhere', () {
      final seed = leaderboardSeed(_day);
      expect(leaderboardSeed(_day), seed);
      expect(leaderboardSeed('2026-11-17'), isNot(seed));
      for (var i = 0; i < 50; i++) {
        expect(rivalMillis(seed, i), rivalMillis(seed, i));
        expect(rivalName(seed, i), rivalName(seed, i));
      }
      final other = leaderboardSeed('2026-11-17');
      final same = [
        for (var i = 0; i < 200; i++)
          rivalMillis(seed, i) == rivalMillis(other, i),
      ].where((s) => s).length;
      expect(same, lessThan(20), reason: 'another day, another field');
      final names = {for (var i = 0; i < 500; i++) rivalName(seed, i)};
      expect(names.length, greaterThan(400), reason: 'diverse names');
    });

    test('players join through the UTC day, never leaving', () {
      final seed = leaderboardSeed(_day);
      expect(rivalCountAt(seed, 0), kLeaderboardMinPlayers);
      var previous = 0;
      for (var minute = 0; minute < 24 * 60; minute += 5) {
        final count = rivalCountAt(seed, minute / (24 * 60));
        expect(count, greaterThanOrEqualTo(previous));
        previous = count;
      }
      expect(previous, greaterThan(kLeaderboardDayEndMin - 200));
      expect(previous, lessThanOrEqualTo(kLeaderboardDayEndMax));
      // A few minutes later, new rivals have joined.
      expect(
        rivalCountAt(seed, (14 * 60 + 5) / (24 * 60)),
        greaterThan(rivalCountAt(seed, 14 * 60 / (24 * 60))),
      );
      // Day progress follows UTC, whatever the local zone.
      expect(utcDayProgress(DateTime.utc(2026, 11, 16, 12)), 0.5);
      expect(utcDayProgress(DateTime.utc(2026, 11, 16)), 0);
    });

    test('solve times form a realistic bell curve', () {
      final board = DailyLeaderboard.build(
        dayKey: _day,
        now: DateTime.utc(2026, 11, 16, 23, 59),
      );
      final times = [for (final e in board.entries) e.millis];
      expect(times.length, board.rivalCount);
      expect(board.rivalCount, greaterThan(10000));
      for (var i = 1; i < times.length; i++) {
        expect(times[i], greaterThanOrEqualTo(times[i - 1]));
      }
      expect(board.averageMillis, inInclusiveRange(38000, 48000));
      final median = times[times.length ~/ 2];
      expect(median, inInclusiveRange(38000, 46000));
      expect(times.first, lessThan(12000), reason: 'speedcubers on top');
      expect(times.last, greaterThan(90000), reason: 'casual solvers');
      expect(times.where((t) => t < 12000).length, greaterThan(50));
      expect(times.first, greaterThanOrEqualTo(kRivalFastestMillis));
      expect(times.last, lessThanOrEqualTo(kRivalSlowestMillis));
    });

    test('the user ranks among the rivals by their real time', () {
      final now = DateTime.utc(2026, 11, 16, 9, 30);
      final field = DailyLeaderboard.build(dayKey: _day, now: now);
      final board = DailyLeaderboard.build(
        dayKey: _day,
        now: now,
        userMillis: 41200,
      );
      final faster = field.entries.where((e) => e.millis < 41200).length;
      expect(board.userRank, faster + 1);
      expect(board.total, field.total + 1);
      expect(board.entries[board.userIndex!].isUser, isTrue);
      expect(board.userMillis, 41200);
      expect(board.entries.where((e) => e.isUser), hasLength(1));
      // A world record tops the board; a slow solve lands at the bottom.
      expect(
        DailyLeaderboard.build(
          dayKey: _day,
          now: now,
          userMillis: 3000,
        ).userRank,
        1,
      );
      expect(
        DailyLeaderboard.build(
          dayKey: _day,
          now: now,
          userMillis: 600000,
        ).userRank,
        field.total + 1,
      );
      // Not solved yet: no rank.
      expect(field.userRank, isNull);
    });

    test('centering offsets stay within the scroll range', () {
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
  });

  group('daily time record', () {
    test('keeps the best time of the day', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          clockProvider.overrideWithValue(() => DateTime(2026, 11, 16, 8)),
        ],
      );
      addTearDown(c.dispose);
      await c.read(dailyProvider.notifier).complete(millis: 52000);
      expect(c.read(dailyProvider).todayMillis, 52000);
      await c.read(dailyProvider.notifier).complete(millis: 61000);
      expect(c.read(dailyProvider).todayMillis, 52000);
      await c.read(dailyProvider.notifier).complete(millis: 47000);
      expect(c.read(dailyProvider).todayMillis, 47000);
      expect(c.read(dailyProvider).streak, 1);
      expect(prefs.getInt('daily_time_ms'), 47000);
      // A new container (app restart) restores today's time.
      final again = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          clockProvider.overrideWithValue(() => DateTime(2026, 11, 16, 20)),
        ],
      );
      addTearDown(again.dispose);
      expect(again.read(dailyProvider).todayMillis, 47000);
      // Tomorrow it is gone.
      final tomorrow = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          clockProvider.overrideWithValue(() => DateTime(2026, 11, 17, 8)),
        ],
      );
      addTearDown(tomorrow.dispose);
      expect(tomorrow.read(dailyProvider).todayMillis, isNull);
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

  testWidgets('leaderboard opens centered on the user, scrolls to #1', (
    tester,
  ) async {
    phone(tester);
    final now = DateTime(2026, 11, 16, 15, 20);
    final prefs = await prefsWith({
      'daily_last_day': _day,
      'daily_streak': 1,
      'daily_time_day': _day,
      'daily_time_ms': 44870,
      'user_nickname': 'Shira',
      'nickname_prompted': true,
    });
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          clockProvider.overrideWithValue(() => now),
        ],
        child: testApp(const DailyLeaderboardScreen()),
      ),
    );
    await tester.pump();
    final board = DailyLeaderboard.build(
      dayKey: _day,
      now: now,
      userMillis: 44870,
    );
    final rank = board.userRank!;
    expect(rank, greaterThan(1000), reason: 'deep in the list');

    String grouped(int v) => v.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );
    expect(
      find.text('#${grouped(rank)} of ${grouped(board.total)}'),
      findsOneWidget,
    );
    expect(find.text('Your time: 44.87'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('leaderboard-disclosure')),
      findsOneWidget,
    );

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
    expect(find.text('#${grouped(rank - 1)}'), findsOneWidget);
    expect(find.text('#${grouped(rank + 1)}'), findsOneWidget);

    // All the way up to the champion...
    await tester.fling(
      find.byKey(const ValueKey('leaderboard-list')),
      const Offset(0, 20000),
      20000,
    );
    await tester.pumpAndSettle();
    final scroll = tester
        .widget<ListView>(find.byKey(const ValueKey('leaderboard-list')))
        .controller!;
    scroll.jumpTo(0);
    await tester.pump();
    expect(find.text('#1'), findsOneWidget);
    expect(me, findsNothing);
    // ...and back with "Jump to my rank".
    await tester.tap(find.byKey(const ValueKey('leaderboard-jump')));
    await tester.pumpAndSettle();
    expect(me, findsOneWidget);
    // ...and down to the last place.
    scroll.jumpTo(scroll.position.maxScrollExtent);
    await tester.pump();
    expect(find.text('#${grouped(board.total)}'), findsOneWidget);
  });

  testWidgets('without a solve the board is unranked and starts at #1', (
    tester,
  ) async {
    phone(tester);
    final prefs = await prefsWith({});
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          clockProvider.overrideWithValue(() => DateTime(2026, 11, 16, 8)),
        ],
        child: testApp(const DailyLeaderboardScreen()),
      ),
    );
    await tester.pump();
    expect(find.byKey(const ValueKey('leaderboard-unranked')), findsOneWidget);
    expect(find.byKey(const ValueKey('leaderboard-me')), findsNothing);
    expect(find.byKey(const ValueKey('leaderboard-jump')), findsNothing);
    expect(find.text('#1'), findsOneWidget);
  });

  testWidgets('daily page: live reminder, then a timed solve ranks the user', (
    tester,
  ) async {
    phone(tester);
    final prefs = await prefsWith({'nickname_prompted': true});
    var now = DateTime(2026, 11, 16, 10);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          scramblerProvider.overrideWithValue(FakeScrambler()),
          cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
          clockProvider.overrideWithValue(() => now),
        ],
        child: testApp(const DailyScreen()),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(
      find.text("You haven't solved today's challenge yet!"),
      findsOneWidget,
    );
    final field = tester
        .widget<Text>(find.byKey(const ValueKey('leaderboard-status-field')))
        .data!;
    expect(
      field,
      matches(
        RegExp(r'^[\d,]+ players solved it today • Avg time: \d+\.\d\d$'),
      ),
    );

    // Live: a few minutes later the count has grown.
    int countIn(String text) =>
        int.parse(RegExp(r'^[\d,]+').stringMatch(text)!.replaceAll(',', ''));
    final before = countIn(field);
    now = now.add(const Duration(minutes: 1));
    await tester.pump(const Duration(minutes: 1));
    final after = countIn(
      tester
          .widget<Text>(find.byKey(const ValueKey('leaderboard-status-field')))
          .data!,
    );
    expect(after, greaterThan(before));

    // Solve on the 3D cube in 42.5 s; back on the daily page the board
    // opens on the user's fresh rank.
    await tester.tap(find.byKey(const ValueKey('daily-virtual')));
    await _advance(tester);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Solver3DScreen)),
    );
    now = now.add(const Duration(milliseconds: 42500));
    final controller = container.read(cubeSessionProvider(3).notifier);
    for (final move in MoveNotation.parseSequence(
      FakeScrambler.daily,
      3,
    ).reversed) {
      controller.turn(move.inverse);
    }
    await _advance(tester, 160);
    expect(container.read(dailyProvider).todayMillis, 42500);
    await tester.pump(const Duration(seconds: 5));
    await tester.pageBack();
    await _advance(tester, 20);
    expect(find.byType(DailyLeaderboardScreen), findsOneWidget);
    expect(find.byKey(const ValueKey('leaderboard-me')), findsOneWidget);
    expect(find.text('You'), findsOneWidget);
    expect(find.text('Your time: 42.50'), findsOneWidget);

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
      startsWith('#'),
    );
  });
}
