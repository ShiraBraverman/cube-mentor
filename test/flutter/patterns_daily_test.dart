import 'package:cube_mentor/core/celebration/celebration.dart';
import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/features/daily/daily_controller.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/features/patterns/patterns.dart';
import 'package:cube_mentor/features/patterns/patterns_screen.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'fake_scrambler.dart';
import 'test_app.dart';

/// Rows of face [face] (URFDLB order) of [cube].
List<String> _face(CubeState cube, int face) {
  final n = cube.size;
  final f = cube.toFacelets();
  return [
    for (var r = 0; r < n; r++)
      f.substring(face * n * n + r * n, face * n * n + r * n + n),
  ];
}

bool _isCorner(int n, int r, int c) =>
    (r == 0 || r == n - 1) && (c == 0 || c == n - 1);

bool _isBorder(int n, int r, int c) =>
    r == 0 || c == 0 || r == n - 1 || c == n - 1;

Future<void> _advance(WidgetTester tester, [int frames = 12]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  group('patterns look like their names', () {
    CubePattern pattern(String id) => kPatterns.firstWhere((p) => p.id == id);

    test('checkerboard alternates two colors on every face', () {
      for (final n in [3, 5]) {
        final cube = pattern('checkerboard').stateFor(n);
        for (var face = 0; face < 6; face++) {
          final rows = _face(cube, face);
          final a = rows[0][0];
          final b = rows[0][1];
          expect(a, isNot(b));
          for (var r = 0; r < n; r++) {
            for (var c = 0; c < n; c++) {
              expect(rows[r][c], (r + c).isEven ? a : b, reason: '${n}x$n');
            }
          }
        }
      }
    });

    test('dots: one color around a center block of another', () {
      for (final n in [3, 4, 5, 6]) {
        final cube = pattern('dots').stateFor(n);
        for (var face = 0; face < 6; face++) {
          final rows = _face(cube, face);
          final border = rows[0][0];
          final inside = rows[1][1];
          expect(border, isNot(inside));
          for (var r = 0; r < n; r++) {
            for (var c = 0; c < n; c++) {
              expect(
                rows[r][c],
                _isBorder(n, r, c) ? border : inside,
                reason: '${n}x$n face $face',
              );
            }
          }
        }
      }
    });

    test('cross: corners differ, everything else matches the face', () {
      for (final n in [3, 4, 5, 6]) {
        final cube = pattern('cross').stateFor(n);
        for (var face = 0; face < 6; face++) {
          final rows = _face(cube, face);
          final own = rows[n ~/ 2][n ~/ 2];
          for (var r = 0; r < n; r++) {
            for (var c = 0; c < n; c++) {
              if (_isCorner(n, r, c)) {
                expect(rows[r][c], isNot(own));
              } else {
                expect(rows[r][c], own, reason: '${n}x$n face $face');
              }
            }
          }
        }
      }
    });

    test('superflip: corners and centers home, every edge flipped', () {
      for (final n in [3, 4, 5, 6]) {
        final cube = pattern('superflip').stateFor(n);
        for (var face = 0; face < 6; face++) {
          final rows = _face(cube, face);
          final own = rows[n ~/ 2][n ~/ 2];
          for (var r = 0; r < n; r++) {
            for (var c = 0; c < n; c++) {
              final edge = _isBorder(n, r, c) && !_isCorner(n, r, c);
              expect(
                rows[r][c] == own,
                !edge,
                reason: '${n}x$n face $face ($r, $c)',
              );
            }
          }
        }
      }
    });

    test('every pattern parses for its sizes and changes the cube', () {
      for (final p in kPatterns) {
        for (final size in p.moves.keys) {
          expect(p.stateFor(size).isSolved, isFalse, reason: '${p.id} $size');
        }
      }
      expect(kPatterns.where((p) => p.supports(2)), isNotEmpty);
      expect(kPatterns.where((p) => p.supports(6)).length, greaterThan(3));
    });
  });

  testWidgets('pattern gallery opens a guided pattern on the 3D cube', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
        ],
        child: testApp(const PatternsScreen()),
      ),
    );
    await tester.pump();
    expect(find.text('Checkerboard'), findsOneWidget);
    expect(find.text('Superflip'), findsOneWidget);

    // Opens on the 3x3.
    ChoiceChip chip(int size) =>
        tester.widget<ChoiceChip>(find.byKey(ValueKey('patterns-size-$size')));
    expect(chip(3).selected, isTrue);

    // Swiping sideways moves to the next size and its chip.
    await tester.fling(
      find.byKey(const ValueKey('patterns-pages')),
      const Offset(-300, 0),
      1000,
    );
    await _advance(tester, 30);
    expect(chip(4).selected, isTrue);
    expect(chip(3).selected, isFalse);
    expect(find.text('Checkerboard'), findsNothing);
    expect(find.text('Dots'), findsOneWidget);

    // Back to 3x3 by swipe, then to 4x4 again by chip.
    await tester.fling(
      find.byKey(const ValueKey('patterns-pages')),
      const Offset(300, 0),
      1000,
    );
    await _advance(tester, 30);
    expect(chip(3).selected, isTrue);
    expect(find.text('Checkerboard'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('patterns-size-4')));
    await _advance(tester, 30);
    expect(chip(4).selected, isTrue);
    expect(find.text('Checkerboard'), findsNothing);
    expect(find.text('Dots'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('pattern-dots')));
    await _advance(tester);
    expect(find.byType(Solver3DScreen), findsOneWidget);
    expect(find.text('Dots · 4×4'), findsOneWidget);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Solver3DScreen)),
    );
    final session = container.read(cubeSessionProvider(4));
    expect(session.playback, hasLength(8));
    expect(session.cube.isSolved, isTrue);
    expect(find.text('Make the pattern'), findsOneWidget);
    expect(find.text('Top row'), findsOneWidget);
    expect(find.text('Left'), findsOneWidget);
  });

  group('daily challenge', () {
    test('day keys and seeds', () {
      expect(dayKey(DateTime(2026, 3, 7, 23, 59)), '2026-03-07');
      expect(daySeed(DateTime(2026, 11, 16)), 20261116);
    });

    Future<ProviderContainer> container(
      DateTime now,
      Map<String, Object> values, {
      CubeSolver? solver,
    }) async {
      SharedPreferences.setMockInitialValues(values);
      final prefs = await SharedPreferences.getInstance();
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          scramblerProvider.overrideWithValue(FakeScrambler()),
          clockProvider.overrideWithValue(() => now),
          if (solver != null) cubeSolverProvider.overrideWithValue(solver),
        ],
      );
      addTearDown(c.dispose);
      return c;
    }

    test('streak grows on consecutive days and resets after a gap', () async {
      final today = DateTime(2026, 11, 16, 8);
      var c = await container(today, {
        'daily_last_day': '2026-11-15',
        'daily_streak': 4,
        'daily_best_streak': 4,
      });
      expect(c.read(dailyProvider).streak, 4);
      expect(c.read(dailyProvider).doneToday, isFalse);
      await c.read(dailyProvider.notifier).complete();
      expect(c.read(dailyProvider).streak, 5);
      expect(c.read(dailyProvider).bestStreak, 5);
      await c.read(dailyProvider.notifier).complete();
      expect(c.read(dailyProvider).streak, 5, reason: 'once per day');

      // Two days missed: the streak is gone and restarts at 1.
      c = await container(today, {
        'daily_last_day': '2026-11-13',
        'daily_streak': 9,
        'daily_best_streak': 9,
      });
      expect(c.read(dailyProvider).streak, 0);
      await c.read(dailyProvider.notifier).complete();
      expect(c.read(dailyProvider).streak, 1);
      expect(c.read(dailyProvider).bestStreak, 9);
    });

    test('the scramble is seeded by the date; the hint is the cross', () async {
      final solver = FakeCubeSolver(
        plan: const SolvePlan(
          method: 'lbl',
          steps: [
            SolveStep(
              cubeState: '',
              phaseName: 'lblCross',
              moveNotation: 'x2',
              explanationKey: 'lblOrientExplain',
            ),
            SolveStep(
              cubeState: '',
              phaseName: 'lblCross',
              moveNotation: "F'",
              explanationKey: 'lblCrossEdge',
            ),
            SolveStep(
              cubeState: '',
              phaseName: 'lblCorners',
              moveNotation: 'R',
              explanationKey: 'lblCornerInsert',
            ),
          ],
        ),
      );
      final c = await container(
        DateTime(2026, 11, 16, 8),
        const {},
        solver: solver,
      );
      await c.read(dailyProvider.notifier).loadScramble();
      final state = c.read(dailyProvider);
      expect(state.scramble, FakeScrambler.daily);
      final fake = c.read(scramblerProvider) as FakeScrambler;
      expect(fake.calls.single, (size: 3, seed: 20261116));
      expect(
        state.cube!.toFacelets(),
        CubeState.solved(3)
            .applyAll(MoveNotation.parseSequence(FakeScrambler.daily, 3))
            .toFacelets(),
      );
      await c.read(dailyProvider.notifier).requestHint();
      expect(c.read(dailyProvider).hint, ['x2', "F'"]);
      expect(solver.calls, [SolveMethod.layerByLayer]);
    });
  });

  testWidgets('daily screen: solving on the 3D cube extends the streak', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'daily_last_day': '2026-11-15',
      'daily_streak': 2,
    });
    final prefs = await SharedPreferences.getInstance();
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          scramblerProvider.overrideWithValue(FakeScrambler()),
          cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
          clockProvider.overrideWithValue(() => DateTime(2026, 11, 16, 8)),
        ],
        child: testApp(const DailyScreen()),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('2-day streak'), findsOneWidget);
    // The scramble as numbered arrow steps, not letters, folded away by
    // default so every action fits on screen.
    expect(find.text(FakeScrambler.daily), findsNothing);
    final scramble = MoveNotation.parseSequence(FakeScrambler.daily, 3);
    expect(find.byKey(const ValueKey('daily-step-0')), findsNothing);
    expect(find.text('Show text moves'), findsOneWidget);
    for (final key in [
      'daily-scramble-guide',
      'daily-virtual',
      'daily-timer',
    ]) {
      final rect = tester.getRect(find.byKey(ValueKey(key)));
      expect(rect.bottom, lessThan(tester.view.physicalSize.height / 2.75));
    }
    await tester.tap(find.byKey(const ValueKey('daily-moves-toggle')));
    await _advance(tester, 6);
    expect(find.byKey(const ValueKey('daily-step-0')), findsOneWidget);
    expect(find.text('Front face — Clockwise'), findsWidgets);
    expect(find.text('Hide text moves'), findsOneWidget);

    // The 3D scramble guide starts from a solved cube and plays today's
    // scramble step by step with the solver's dock and arrows.
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('daily-scramble-guide')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('daily-scramble-guide')));
    await _advance(tester);
    final guide = ProviderScope.containerOf(
      tester.element(find.byType(Solver3DScreen)),
    ).read(cubeSessionProvider(3));
    expect(guide.cube.isSolved, isTrue);
    expect(guide.playback, scramble);
    expect(find.text('Scramble guide'), findsOneWidget);
    expect(find.text("Scramble today's cube"), findsOneWidget);
    expect(find.byKey(const ValueKey('solve-dock')), findsOneWidget);
    // Guide-only playback: Previous / Play / Next / Exit, no free-play bar.
    expect(find.byKey(const ValueKey('guide-dock')), findsOneWidget);
    expect(find.byKey(const ValueKey('action-bar')), findsNothing);
    await tester.pageBack();
    await _advance(tester);
    expect(
      find.text("Solve today's scramble to keep your streak."),
      findsOneWidget,
    );

    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('daily-virtual')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('daily-virtual')));
    await _advance(tester);
    expect(find.byType(Solver3DScreen), findsOneWidget);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Solver3DScreen)),
    );
    // Undo the scramble move by move, as a user would.
    final moves = MoveNotation.parseSequence(FakeScrambler.daily, 3);
    final controller = container.read(cubeSessionProvider(3).notifier);
    for (final move in moves.reversed) {
      controller.turn(move.inverse);
    }
    // 11 animated turns of 320-480 ms each.
    await _advance(tester, 160);
    expect(container.read(cubeSessionProvider(3)).isIdle, isTrue);
    expect(container.read(cubeSessionProvider(3)).cube.isSolved, isTrue);
    // A celebration card floats in over the page, then slides away.
    expect(find.byKey(const ValueKey('celebration-toast')), findsOneWidget);
    expect(find.text('Daily challenge complete!'), findsOneWidget);
    expect(find.text('Way to go!'), findsOneWidget);
    await tester.pump(kCelebrationDuration);
    await _advance(tester, 4);
    expect(find.byKey(const ValueKey('celebration-toast')), findsNothing);

    await tester.pageBack();
    await _advance(tester);
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('daily-streak')),
      -200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump();
    expect(find.text('3-day streak'), findsOneWidget);
    expect(find.text('Done for today! Come back tomorrow.'), findsOneWidget);
    expect(prefs.getString('daily_last_day'), '2026-11-16');
  });
}
