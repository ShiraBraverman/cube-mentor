import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_cube_solver.dart';

void main() {
  group('facelets', () {
    test('solved cube serializes face by face in URFDLB order', () {
      expect(
        CubeState.solved(3).toFacelets(),
        '${'W' * 9}${'R' * 9}${'G' * 9}${'Y' * 9}${'O' * 9}${'B' * 9}',
      );
      expect(CubeState.solved(2).toFacelets(), hasLength(24));
      expect(CubeState.solved(6).toFacelets(), hasLength(216));
    });

    test('R brings the front colors up the right column of U', () {
      final f = CubeState.solved(3).apply(MoveNotation.parse('R', 3)).toFacelets();
      // Same expectation as the C++ notation test.
      expect([f[2], f[5], f[8]], ['G', 'G', 'G']);
      expect([f[20], f[26]], ['Y', 'Y']);
    });

    test('letters round-trip and cubies are found by position', () {
      for (final color in StickerColor.values) {
        expect(stickerColorOf(stickerLetter(color)), color);
      }
      final cube = CubeState.solved(3);
      expect(cube.cubieIdAt((2, 2, 2)), isNotNull);
      expect(cube.cubieIdAt((3, 0, 0)), isNull);
    });
  });

  group('SolvePlan JSON', () {
    test('parses steps with metadata', () {
      final plan = SolvePlan.fromJson(
        '{"ok":true,"method":"lbl","millis":1.5,"steps":[{"move":"R\'",'
        '"state":"abc","phase":"lblCross","explanation":"lblCrossEdge",'
        '"piece":"WR","highlight":[[2,-2,0]]}]}',
      );
      expect(plan.method, 'lbl');
      expect(plan.millis, 1.5);
      final step = plan.steps.single;
      expect(step.moveNotation, "R'");
      expect(step.cubeState, 'abc');
      expect(step.phaseName, 'lblCross');
      expect(step.explanationKey, 'lblCrossEdge');
      expect(step.pieceColors, 'WR');
      expect(step.highlightedCubies, [(2, -2, 0)]);
    });

    test('error results throw a SolveException', () {
      expect(
        () => SolvePlan.fromJson('{"ok":false,"error":"parity"}'),
        throwsA(isA<SolveException>().having((e) => e.code, 'code', 'parity')),
      );
    });
  });

  group('CubeSessionController.solve', () {
    late FakeCubeSolver solver;
    late ProviderContainer container;

    setUp(() {
      solver = FakeCubeSolver();
      container = ProviderContainer(
        overrides: [cubeSolverProvider.overrideWithValue(solver)],
      );
      addTearDown(container.dispose);
    });

    CubeSessionController controller() =>
        container.read(cubeSessionProvider(3).notifier);
    CubeSession session() => container.read(cubeSessionProvider(3));

    SolveStep step(String move) => SolveStep(
      cubeState: '',
      phaseName: 'kociembaPhase2',
      moveNotation: move,
      explanationKey: 'kociembaPhase2Explain',
    );

    test('loads the plan into the playback controls', () async {
      final sub = container.listen(cubeSessionProvider(3), (_, _) {});
      addTearDown(sub.close);
      controller().commitDirect(MoveNotation.parse('R', 3));
      solver.plan = SolvePlan(method: 'kociemba', steps: [step("R'")]);
      final pending = controller().solve(SolveMethod.fast);
      expect(session().isSolving, isTrue);
      await pending;
      expect(session().isSolving, isFalse);
      expect(session().playback.map((m) => m.notation), ["R'"]);
      expect(session().steps, hasLength(1));
      expect(session().currentStep?.moveNotation, "R'");

      // Playing it through solves the cube; a new move clears the plan.
      controller().stepForward();
      controller().commitHead();
      expect(session().cube.isSolved, isTrue);
      expect(session().currentStep, isNull);
      controller().turnNotation('U');
      expect(session().steps, isEmpty);
      expect(session().hasPlayback, isFalse);
    });

    test('drops a plan computed for a cube that changed meanwhile', () async {
      final sub = container.listen(cubeSessionProvider(3), (_, _) {});
      addTearDown(sub.close);
      controller().commitDirect(MoveNotation.parse('R', 3));
      solver.plan = SolvePlan(method: 'kociemba', steps: [step("R'")]);
      final pending = controller().solve(SolveMethod.fast);
      controller().reset();
      await pending;
      expect(session().hasPlayback, isFalse);
      expect(session().isSolving, isFalse);
    });

    test('records solver errors', () async {
      final sub = container.listen(cubeSessionProvider(3), (_, _) {});
      addTearDown(sub.close);
      controller().commitDirect(MoveNotation.parse('R', 3));
      await controller().solve(SolveMethod.layerByLayer);
      expect(session().solveError, 'internal');
      controller().clearSolveError();
      expect(session().solveError, isNull);
    });

    test('scrambling no longer creates a placeholder playback', () {
      final sub = container.listen(cubeSessionProvider(3), (_, _) {});
      addTearDown(sub.close);
      controller().scramble();
      expect(session().hasPlayback, isFalse);
      expect(session().queue, isNotEmpty);
    });
  });
}
