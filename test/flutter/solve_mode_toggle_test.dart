import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'test_app.dart';

Future<void> _advance(WidgetTester tester, [int frames = 10]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

/// Opens the 3D solver on a scrambled [size] cube, taps Solve and returns
/// the methods the solver was asked for.
Future<List<SolveMethod>> _solve(
  WidgetTester tester,
  int size, {
  String? savedMode,
}) async {
  SharedPreferences.setMockInitialValues({'solve_method': ?savedMode});
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
  final solver = FakeCubeSolver(
    bigCubes: true,
    plan: const SolvePlan(
      method: 'test',
      steps: [
        SolveStep(
          cubeState: '',
          phaseName: 'kociembaPhase2',
          moveNotation: "U'",
          explanationKey: 'kociembaPhase2Explain',
        ),
        SolveStep(
          cubeState: '',
          phaseName: 'kociembaPhase2',
          moveNotation: "R'",
          explanationKey: 'kociembaPhase2Explain',
        ),
      ],
    ),
  );
  await tester.pumpWidget(
    ProviderScope(
      key: UniqueKey(),
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        cubeSolverProvider.overrideWithValue(solver),
      ],
      child: testApp(
        Solver3DScreen(
          size: size,
          initialCube: CubeState.solved(size)
              .applyAll(MoveNotation.parseSequence('R U', size)),
        ),
      ),
    ),
  );
  await _advance(tester, 4);
  await tester.tap(find.byKey(const ValueKey('solve')));
  await _advance(tester);
  return solver.calls;
}

void main() {
  test('only the 2x2 and 3x3 offer a fast solve', () {
    for (final size in [2, 3]) {
      expect(solveMethodOffered(size, SolveMethod.fast), isTrue);
      expect(solveMethodOffered(size, SolveMethod.layerByLayer), isTrue);
    }
    for (final size in [4, 5, 6]) {
      expect(solveMethodOffered(size, SolveMethod.fast), isFalse);
      expect(solveMethodOffered(size, SolveMethod.layerByLayer), isTrue);
    }
    expect(solveMethodOffered(7, SolveMethod.layerByLayer), isFalse);
  });

  for (final size in [2, 3]) {
    testWidgets('$size×$size shows the Guided / Fast toggle', (tester) async {
      final calls = await _solve(tester, size);
      expect(calls, [SolveMethod.layerByLayer], reason: 'guided by default');
      expect(find.byKey(const ValueKey('solve-mode')), findsOneWidget);
      expect(find.byKey(const ValueKey('solve-mode-fast')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  for (final size in [4, 5, 6]) {
    testWidgets('$size×$size hides the toggle and solves guided', (
      tester,
    ) async {
      // Even a remembered "fast" choice does not apply to big cubes.
      final calls = await _solve(tester, size, savedMode: 'fast');
      expect(calls, [SolveMethod.layerByLayer]);
      expect(find.byKey(const ValueKey('solve-dock')), findsOneWidget);
      expect(find.byKey(const ValueKey('solve-mode')), findsNothing);
      expect(find.byKey(const ValueKey('solve-mode-fast')), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('a remembered fast choice still applies on the 3x3', (
    tester,
  ) async {
    final calls = await _solve(tester, 3, savedMode: 'fast');
    expect(calls, [SolveMethod.fast]);
    expect(find.byKey(const ValueKey('solve-mode')), findsOneWidget);
  });
}
