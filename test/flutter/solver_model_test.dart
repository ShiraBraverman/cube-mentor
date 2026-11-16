import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/render/cube_geometry.dart';
import 'package:cube_mentor/features/solver_3d/render/move_arrow.dart';
import 'package:flutter/painting.dart';
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

  group('move arrow', () {
    const size = Size(400, 600);
    final frame = CubeFrame(
      cube: CubeState.solved(3),
      orbit: CubeOrientation.initial,
    );
    List<Offset> arrow(String move) =>
        MoveArrow.path(frame, size, MoveNotation.parse(move, 3));

    test('a prime move points the opposite way along the same arc', () {
      final cw = arrow('R');
      final ccw = arrow("R'");
      expect(cw, hasLength(41));
      expect((cw.first - ccw.last).distance, lessThan(1e-6));
      expect((cw.last - ccw.first).distance, lessThan(1e-6));
    });

    test('the arrow sits beside its layer and half turns are longer', () {
      // R is drawn on the right of the screen, L on the left.
      double meanX(List<Offset> p) =>
          p.map((o) => o.dx).reduce((a, b) => a + b) / p.length;
      expect(meanX(arrow('R')), greaterThan(meanX(arrow('L'))));
      double length(List<Offset> p) => [
        for (var i = 1; i < p.length; i++) (p[i] - p[i - 1]).distance,
      ].reduce((a, b) => a + b);
      expect(length(arrow('U2')), greaterThan(length(arrow('U')) * 1.5));
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

    /// Loads [moves] as the solution after scrambling with their inverse.
    Future<void> guide(List<String> moves) async {
      final sub = container.listen(cubeSessionProvider(3), (_, _) {});
      addTearDown(sub.close);
      for (final m in moves.reversed) {
        controller().commitDirect(MoveNotation.parse(m, 3).inverse);
      }
      final cube = session().cube;
      solver.plan = SolvePlan(
        method: 'kociemba',
        steps: [
          for (final (i, m) in moves.indexed)
            SolveStep(
              cubeState: cube
                  .applyAll(moves.take(i).map((t) => MoveNotation.parse(t, 3)))
                  .toFacelets(),
              phaseName: 'kociembaPhase2',
              moveNotation: m,
              explanationKey: 'kociembaPhase2Explain',
            ),
        ],
      );
      await controller().solve(SolveMethod.fast);
      expect(session().isGuiding, isTrue);
    }

    void drain() {
      while (session().queue.isNotEmpty) {
        controller().commitHead();
      }
    }

    test('the expected hand move advances the guided solution', () async {
      await guide(['R', 'U']);
      expect(session().guideMove?.notation, 'R');
      expect(controller().judge(MoveNotation.parse('R', 3)), GuidedMove.expected);
      controller().commitDirect(MoveNotation.parse('R', 3));
      expect(session().playbackIndex, 1);
      expect(session().steps, hasLength(2));
      expect(session().currentStep?.moveNotation, 'U');
      expect(session().guideMove?.notation, 'U');
      // The recorded state of the next step matches the cube.
      expect(session().currentStep?.cubeState, session().cube.toFacelets());

      controller().commitDirect(MoveNotation.parse('U', 3));
      expect(session().cube.isSolved, isTrue);
      expect(session().isComplete, isTrue);
      expect(session().guideMove, isNull);
      expect(session().steps, hasLength(2), reason: 'celebration stays up');
    });

    test('a wrong move is rejected and the solution is kept', () async {
      await guide(['R', 'U']);
      final before = session().cube;
      expect(controller().judge(MoveNotation.parse("R'", 3)), GuidedMove.wrong);
      controller().commitDirect(MoveNotation.parse("R'", 3));
      controller().turnNotation('L');
      expect(session().rejectedMoves, 2);
      expect(identical(session().cube, before), isTrue);
      expect(session().queue, isEmpty);
      expect(session().playbackIndex, 0);
      expect(session().isGuiding, isTrue);

      // The notation pad follows the solution too, animated.
      controller().turnNotation('R');
      expect(session().playbackIndex, 1);
      expect(session().currentStep?.moveNotation, 'R');
      drain();
      expect(session().currentStep?.moveNotation, 'U');
    });

    test('a half turn can be made as two quarter turns', () async {
      await guide(['R2', 'U']);
      final quarter = MoveNotation.parse("R'", 3);
      expect(controller().judge(quarter), GuidedMove.partial);
      controller().commitDirect(quarter);
      expect(session().playback.map((m) => m.notation), ["R'", "R'", 'U']);
      expect(session().playbackIndex, 1);
      expect(session().currentStep?.cubeState, session().cube.toFacelets());
      // The second quarter must go the same way.
      expect(controller().judge(MoveNotation.parse('R', 3)), GuidedMove.wrong);
      controller().commitDirect(quarter);
      controller().commitDirect(MoveNotation.parse('U', 3));
      expect(session().cube.isSolved, isTrue);

      // Stepping back retraces the split steps exactly.
      for (var i = 0; i < 3; i++) {
        controller().stepBack();
        drain();
      }
      expect(session().playbackIndex, 0);
      expect(session().cube.toFacelets(), session().steps.first.cubeState);
    });

    test('undo steps back through the solution', () async {
      await guide(['R', 'U']);
      expect(session().log, isNotEmpty);
      controller().undo();
      expect(session().queue, isEmpty, reason: 'nothing to step back yet');
      controller().stepForward();
      drain();
      controller().undo();
      drain();
      expect(session().playbackIndex, 0);
      expect(session().isGuiding, isTrue);
      expect(session().cube.toFacelets(), session().steps.first.cubeState);
    });

    test('replay shows the step without changing anything', () async {
      await guide(['R', 'U']);
      final before = session().cube.toFacelets();
      controller().replayStep();
      expect(session().queue, hasLength(2));
      expect(session().isPreviewing, isTrue);
      expect(session().currentStep?.moveNotation, 'R');
      // Other controls wait for the preview.
      controller().stepForward();
      expect(session().queue, hasLength(2));
      drain();
      expect(session().cube.toFacelets(), before);
      expect(session().playbackIndex, 0);

      // Once solved, replay redoes the last move.
      controller().stepForward();
      controller().stepForward();
      drain();
      controller().replayStep();
      expect(session().currentStep?.moveNotation, 'U');
      drain();
      expect(session().cube.isSolved, isTrue);
      expect(session().playbackIndex, 2);
    });

    test('a hand turn pauses playback and blocks the controls', () async {
      await guide(['R', 'U', 'F']);
      controller().play();
      expect(session().isPlaying, isTrue);
      expect(session().guideMove, isNull, reason: 'no arrow while playing');
      drain();
      expect(session().cube.isSolved, isTrue);

      controller().stepBack();
      drain();
      controller().beginHandTurn();
      expect(session().guideMove, isNull);
      controller().stepForward();
      controller().stepBack();
      controller().play();
      controller().undo();
      controller().scramble();
      expect(session().queue, isEmpty);
      expect(session().isPlaying, isFalse);
      controller().endHandTurn();
      expect(session().guideMove?.notation, 'F');
    });

    test('free play resumes after the solve or on exit', () async {
      await guide(['R']);
      controller().clearSolution();
      expect(session().hasPlayback, isFalse);
      expect(controller().judge(MoveNotation.parse('U', 3)), GuidedMove.free);
      controller().commitDirect(MoveNotation.parse('R', 3));
      expect(session().cube.isSolved, isTrue);

      await guide(['U']);
      controller().commitDirect(MoveNotation.parse('U', 3));
      expect(session().isComplete, isTrue);
      controller().commitDirect(MoveNotation.parse('F', 3));
      expect(session().hasPlayback, isFalse);
      expect(session().log.map((m) => m.notation), ['F']);
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
