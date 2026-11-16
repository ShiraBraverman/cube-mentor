import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/features/timer/model/solve_record.dart';
import 'package:cube_mentor/features/timer/model/timer_controller.dart';
import 'package:cube_mentor/features/timer/model/timer_stats.dart';
import 'package:cube_mentor/features/timer/timer_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_scrambler.dart';
import 'test_app.dart';

SolveRecord _solve(int millis, [Penalty penalty = Penalty.none]) => SolveRecord(
  millis: millis,
  scramble: 'R U',
  at: DateTime(2026, 11, 16),
  penalty: penalty,
);

Future<ProviderContainer> _container([
  Map<String, Object> prefs = const {},
]) async {
  SharedPreferences.setMockInitialValues(prefs);
  final instance = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(instance),
      scramblerProvider.overrideWithValue(FakeScrambler()),
    ],
  );
  addTearDown(container.dispose);
  // Timers are auto-disposed: keep them alive as the screen would.
  for (final size in [2, 3, 4]) {
    container.listen(timerProvider(size), (_, _) {});
  }
  return container;
}

void main() {
  group('statistics', () {
    test('ao5 drops the best and the worst', () {
      final solves = [
        for (final t in [10000, 12000, 11000, 30000, 9000]) _solve(t),
      ];
      expect(averageOf(solves, 5), (dnf: false, millis: 11000));
      expect(averageOf(solves.sublist(1), 5), isNull);
    });

    test('one DNF counts as the worst; two make the average a DNF', () {
      final one = [
        _solve(10000),
        _solve(12000),
        _solve(11000, Penalty.dnf),
        _solve(13000),
        _solve(9000),
      ];
      expect(averageOf(one, 5), (dnf: false, millis: 11667));
      final two = [...one.sublist(0, 4), _solve(9000, Penalty.dnf)];
      expect(averageOf(two, 5)!.dnf, isTrue);
    });

    test('+2 counts, ao12 trims one each side, ao100 trims five', () {
      expect(_solve(10000, Penalty.plus2).result, 12000);
      final twelve = [for (var i = 1; i <= 12; i++) _solve(i * 1000)];
      // Drops 1 s and 12 s: mean of 2..11 s.
      expect(averageOf(twelve, 12)!.millis, 6500);
      final hundred = [for (var i = 1; i <= 100; i++) _solve(i * 100)];
      // Drops 0.1-0.5 s and 9.6-10.0 s: mean of 0.6..9.5 s.
      expect(averageOf(hundred, 100)!.millis, 5050);
      expect(bestSingle(twelve), 1000);
      expect(bestAverage(twelve, 5)!.millis, 3000);
    });

    test('formats times like a speedcubing timer', () {
      expect(formatTime(9876), '9.87');
      expect(formatTime(65200), '1:05.20');
      expect(formatTime(null), 'DNF');
      expect(formatSolve(_solve(10000, Penalty.plus2)), '12.00+');
      expect(formatAverage(null), '–');
    });
  });

  group('TimerController', () {
    test('hold, release, run and stop records a solve', () async {
      final c = await _container();
      final timer = c.read(timerProvider(3).notifier);
      await Future<void>.delayed(Duration.zero);
      expect(c.read(timerProvider(3)).scramble, FakeScrambler.random[0]);

      // A short tap does nothing without inspection.
      timer.press(1000);
      expect(c.read(timerProvider(3)).phase, TimerPhase.holding);
      timer.release(1100);
      expect(c.read(timerProvider(3)).phase, TimerPhase.idle);

      timer.press(2000);
      expect(timer.isReady(2200), isFalse);
      expect(timer.isReady(2300), isTrue);
      timer.release(2400);
      expect(c.read(timerProvider(3)).phase, TimerPhase.running);

      timer.press(14740);
      timer.release(14800); // the stopping touch lifts: ignored
      final state = c.read(timerProvider(3));
      expect(state.phase, TimerPhase.idle);
      expect(state.history.single.millis, 12340);
      expect(state.history.single.scramble, FakeScrambler.random[0]);
      await Future<void>.delayed(Duration.zero);
      expect(c.read(timerProvider(3)).scramble, FakeScrambler.random[1]);
    });

    test('inspection adds +2 after 15 s and DNF after 17 s', () async {
      final c = await _container();
      final timer = c.read(timerProvider(3).notifier);
      await timer.toggleInspection();

      Future<Penalty> attempt(int start, int inspect) async {
        timer.press(start);
        timer.release(start + 50); // tap: inspection starts
        expect(c.read(timerProvider(3)).phase, TimerPhase.inspecting);
        timer.press(start + inspect - 400);
        timer.release(start + inspect);
        expect(c.read(timerProvider(3)).phase, TimerPhase.running);
        timer.press(start + inspect + 9000);
        timer.release(start + inspect + 9050);
        return c.read(timerProvider(3)).last!.penalty;
      }

      expect(await attempt(0, 10000), Penalty.none);
      expect(await attempt(100000, 16000), Penalty.plus2);
      expect(await attempt(200000, 18000), Penalty.dnf);
    });

    test('penalties, deletion and history survive a restart', () async {
      final c = await _container();
      final timer = c.read(timerProvider(4).notifier);
      for (final t in [11000, 9000, 10000]) {
        timer.press(0);
        timer.release(400);
        timer.press(400 + t);
        timer.release(500 + t);
      }
      expect(c.read(timerProvider(4)).newBest, isFalse);
      timer.setPenalty(1, Penalty.plus2);
      timer.delete(0);
      final history = c.read(timerProvider(4)).history;
      expect(history.map((s) => s.result), [11000, 10000]);

      final prefs = c.read(sharedPreferencesProvider);
      final again = await _container({
        'timer_history_4': prefs.getString('timer_history_4')!,
      });
      expect(again.read(timerProvider(4)).history.map((s) => s.result), [
        11000,
        10000,
      ]);
      expect(again.read(timerProvider(3)).history, isEmpty);
    });

    test('a faster solve is flagged as a new personal best', () async {
      final c = await _container();
      final timer = c.read(timerProvider(2).notifier);
      for (final t in [5000, 4000]) {
        timer.press(0);
        timer.release(400);
        timer.press(400 + t);
        timer.release(500 + t);
      }
      expect(c.read(timerProvider(2)).newBest, isTrue);
    });
  });

  testWidgets('timer screen: hold-to-start pad, stats and penalties', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    var now = DateTime(2026, 11, 16, 9);
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
    final solved = <SolveRecord>[];
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          scramblerProvider.overrideWithValue(FakeScrambler()),
          clockProvider.overrideWithValue(() => now),
        ],
        child: testApp(TimerScreen(size: 3, onSolved: solved.add)),
      ),
    );
    await tester.pump();
    expect(find.text(FakeScrambler.random[0]), findsOneWidget);
    expect(find.text('0.00'), findsOneWidget);

    final pad = tester.getCenter(find.byKey(const ValueKey('timer-pad')));
    final gesture = await tester.startGesture(pad);
    await tester.pump();
    expect(find.text('Hold, then release to start'), findsOneWidget);
    now = now.add(const Duration(milliseconds: 400));
    await tester.pump(const Duration(milliseconds: 16));
    expect(find.text('Release to start'), findsOneWidget);
    await gesture.up();
    await tester.pump();
    expect(find.text('Tap anywhere to stop'), findsOneWidget);
    // Focus mode: the scramble and stats are hidden while timing.
    expect(find.byKey(const ValueKey('timer-scramble')), findsNothing);

    now = now.add(const Duration(milliseconds: 8420));
    await tester.pump(const Duration(milliseconds: 16));
    expect(find.text('8.42'), findsOneWidget);
    final stop = await tester.startGesture(pad);
    await stop.up();
    await tester.pump();
    expect(solved.single.millis, 8420);
    expect(find.text('8.42'), findsWidgets);
    expect(find.text(FakeScrambler.random[1]), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('timer-plus2')));
    await tester.pump();
    expect(find.text('10.42+'), findsOneWidget);
    expect(
      tester.widget<Text>(find.byKey(const ValueKey('timer-stat-pb'))).data,
      '10.42',
    );
    await tester.tap(find.byKey(const ValueKey('timer-delete')));
    await tester.pump();
    expect(
      tester.widget<Text>(find.byKey(const ValueKey('timer-stat-count'))).data,
      '0',
    );
  });
}
