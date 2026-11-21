import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/features/solver_3d/interaction/layer_drag.dart';
import 'package:cube_mentor/features/solver_3d/render/cube_painter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:vector_math/vector_math_64.dart' show Matrix3, Vector3;

const _viewport = Size(400, 400);

/// Screen center of the visible sticker with outward [normal] on the cubie
/// at [position] (doubled coordinates).
Offset stickerCenter(CubeFrame frame, IVec3 position, IVec3 normal) {
  final face = CubeScene.build(
    frame,
    _viewport,
  ).firstWhere((f) => f.cubie.position == position && f.normal == normal);
  return (face.quad[0] + face.quad[1] + face.quad[2] + face.quad[3]) / 4;
}

/// Simulates grabbing a sticker and dragging by [delta]; returns the move
/// committed after snapping, if any.
CubeMove? dragMove(
  CubeFrame frame,
  IVec3 position,
  IVec3 normal,
  Offset delta,
) {
  final start = stickerCenter(frame, position, normal);
  final hit = CubeScene.hitTest(frame, _viewport, start)!;
  expect(hit.cubie.position, position);
  expect(hit.normal, normal);
  final drag = LayerGrab.fromFace(hit, frame, _viewport).resolve(delta)!;
  final angle = drag.angleFor(delta);
  return drag.moveFor(drag.snapQuarterTurns(angle, Offset.zero));
}

void main() {
  final solved3 = CubeFrame(
    cube: CubeState.solved(3),
    orbit: CubeOrientation.initial,
  );

  void paintFrame(CubeFrame frame, [Size size = _viewport]) {
    final recorder = ui.PictureRecorder();
    CubePainter(frame: frame).paint(Canvas(recorder), size);
    recorder.endRecording().dispose();
  }

  group('free orientation', () {
    Set<IVec3> visibleFaces(CubeOrientation orbit) => CubeScene.build(
      CubeFrame(cube: CubeState.solved(3), orbit: orbit),
      _viewport,
    ).map((f) => f.normal).toSet();

    test('matches the classic yaw/pitch view matrix', () {
      final m = CubeProjection.viewMatrix(CubeOrientation.initial);
      final expected = Matrix3Ref.yawPitch(-0.62, 0.5);
      for (var i = 0; i < 9; i++) {
        expect(m.storage[i], closeTo(expected.storage[i], 1e-9));
      }
    });

    test('rolls vertically without limit and comes back after 360 degrees', () {
      for (final turns in [1, 3]) {
        var o = CubeOrientation.initial;
        final steps = 90 * turns;
        for (var i = 0; i < steps; i++) {
          o = o.rotatedOnScreen(0, 2 * math.pi * turns / steps);
        }
        expect(o.angleTo(CubeOrientation.initial), lessThan(1e-6));
      }
      // A long chain of drags stays a pure rotation (no skew or scaling).
      var o = CubeOrientation.initial;
      for (var i = 0; i < 5000; i++) {
        o = o.rotatedOnScreen(0.031, -0.047);
      }
      final m = o.matrix;
      expect(m.determinant(), closeTo(1, 1e-9));
      final mt = m.transposed()..multiply(m);
      for (var i = 0; i < 9; i++) {
        expect(mt.storage[i], closeTo(Matrix3.identity().storage[i], 1e-9));
      }
    });

    test('tumbling over the top reveals the bottom face', () {
      expect(
        visibleFaces(CubeOrientation.initial),
        isNot(contains(kNormalDown)),
      );
      final flipped = CubeOrientation.initial.rotatedOnScreen(0, math.pi);
      expect(visibleFaces(flipped), contains(kNormalDown));
    });

    test('reset interpolation takes the shortest arc and converges', () {
      var o = CubeOrientation.initial.rotatedOnScreen(2.0, 5.0);
      final start = o.angleTo(CubeOrientation.initial);
      expect(start, lessThanOrEqualTo(math.pi + 1e-9));
      for (var i = 0; i < 60; i++) {
        o = o.lerpTo(CubeOrientation.initial, 0.25);
      }
      expect(o.angleTo(CubeOrientation.initial), lessThan(1e-3));
    });
  });

  group('projection', () {
    test('default view shows the U, F and R faces', () {
      final view = CubeProjection.viewMatrix(CubeOrientation.initial);
      final camera = view.transposed().transformed(
        Vector3(0, 0, CubeProjection.cameraDistance),
      );
      expect(camera.x, greaterThan(0));
      expect(camera.y, greaterThan(0));
      expect(camera.z, greaterThan(0));
    });

    test('the cube fits inside the viewport from any angle', () {
      const size = Size(300, 500);
      final focal = CubeProjection.focalLength(size);
      for (var yaw = 0.0; yaw < 6.3; yaw += 0.7) {
        for (var pitch = -1.4; pitch <= 1.4; pitch += 0.7) {
          final view = CubeProjection.viewMatrix(
            CubeOrientation.fromYawPitch(yaw: yaw, pitch: pitch),
          );
          for (final x in [-1.0, 1.0]) {
            for (final y in [-1.0, 1.0]) {
              for (final z in [-1.0, 1.0]) {
                final p = CubeProjection.project(
                  view.transformed(Vector3(x, y, z)),
                  size,
                  focal,
                );
                expect(p.dx, inInclusiveRange(0, size.width));
                expect(p.dy, inInclusiveRange(0, size.height));
              }
            }
          }
        }
      }
    });

    test('a finished move animation equals the committed quarter turn', () {
      // Otherwise pieces would jump when the move is committed.
      for (final token in ["R'", 'U', 'F2', 'x']) {
        final move = MoveNotation.parse(token, 3);
        final turn = LayerTurn.ofMove(move, 1);
        final rotated = CubeProjection.axisRotation(
          turn.axis,
          turn.angle,
        ).transformed(Vector3(0, 1, 1));
        final expected = rotateQuarter((0, 1, 1), move.axis, move.quarterTurns);
        expect(rotated.x, closeTo(expected.$1.toDouble(), 1e-9), reason: token);
        expect(rotated.y, closeTo(expected.$2.toDouble(), 1e-9), reason: token);
        expect(rotated.z, closeTo(expected.$3.toDouble(), 1e-9), reason: token);
      }
    });
  });

  group('scene', () {
    test('an idle solved cube shows exactly three faces of stickers', () {
      for (final n in [2, 3, 4, 5, 6]) {
        final faces = CubeScene.build(
          CubeFrame(cube: CubeState.solved(n), orbit: CubeOrientation.initial),
          _viewport,
        );
        expect(faces.where((f) => f.color != null), hasLength(3 * n * n));
        expect(faces.map((f) => f.normal).toSet(), {
          kNormalUp,
          kNormalFront,
          kNormalRight,
        });
      }
    });

    test('x-ray includes every sticker', () {
      final faces = CubeScene.build(solved3.copyWith(xray: true), _viewport);
      expect(faces, hasLength(54));
    });
  });

  group('hit testing', () {
    test('finds the sticker under the finger on each visible face', () {
      for (final (pos, normal) in [
        ((0, 0, 2), kNormalFront),
        ((2, 2, 2), kNormalUp),
        ((2, -2, 0), kNormalRight),
        ((-2, 2, -2), kNormalUp),
      ]) {
        final point = stickerCenter(solved3, pos, normal);
        final hit = CubeScene.hitTest(solved3, _viewport, point);
        expect(hit?.cubie.position, pos);
        expect(hit?.normal, normal);
      }
    });

    test('misses on the background', () {
      expect(CubeScene.hitTest(solved3, _viewport, const Offset(5, 5)), isNull);
      expect(
        CubeScene.hitTest(solved3, _viewport, const Offset(395, 395)),
        isNull,
      );
    });

    test('ignores x-ray mode so hidden stickers cannot be grabbed', () {
      final xray = solved3.copyWith(xray: true);
      final point = stickerCenter(solved3, (0, 0, 2), kNormalFront);
      expect(CubeScene.hitTest(xray, _viewport, point)?.normal, kNormalFront);
    });
  });

  group('drag to turn (3x3, default view)', () {
    const up = Offset(0, -120);
    const down = Offset(0, 120);
    const left = Offset(-120, 0);

    test('front right column dragged up is R', () {
      expect(dragMove(solved3, (2, 0, 2), kNormalFront, up)?.notation, 'R');
      expect(dragMove(solved3, (2, 2, 2), kNormalFront, down)?.notation, "R'");
    });

    test('front left column dragged up is L\'', () {
      expect(dragMove(solved3, (-2, 0, 2), kNormalFront, up)?.notation, "L'");
    });

    test('front middle column dragged up is M\'', () {
      expect(dragMove(solved3, (0, 0, 2), kNormalFront, up)?.notation, "M'");
    });

    test('front top row dragged left is U', () {
      expect(dragMove(solved3, (0, 2, 2), kNormalFront, left)?.notation, 'U');
      expect(dragMove(solved3, (0, -2, 2), kNormalFront, left)?.notation, "D'");
    });

    test('dragging on the top face turns R or F', () {
      // Top face, right column, dragged toward the back (screen up-right).
      final rightCol = dragMove(solved3, (2, 2, 0), kNormalUp, up);
      expect(rightCol?.axis, 0);
      expect(rightCol?.fromLayer, 2);
    });

    test('a tiny drag does not lock a direction', () {
      final point = stickerCenter(solved3, (0, 0, 2), kNormalFront);
      final hit = CubeScene.hitTest(solved3, _viewport, point)!;
      final grab = LayerGrab.fromFace(hit, solved3, _viewport);
      expect(grab.resolve(const Offset(3, 4)), isNull);
    });

    test('a short drag snaps back with no move, a fling completes it', () {
      final point = stickerCenter(solved3, (2, 0, 2), kNormalFront);
      final hit = CubeScene.hitTest(solved3, _viewport, point)!;
      final drag = LayerGrab.fromFace(
        hit,
        solved3,
        _viewport,
      ).resolve(const Offset(0, -15))!;
      final angle = drag.angleFor(const Offset(0, -15));
      expect(angle.abs(), lessThan(math.pi / 4));
      expect(drag.moveFor(drag.snapQuarterTurns(angle, Offset.zero)), isNull);
      final flung = drag.snapQuarterTurns(angle, const Offset(0, -2500));
      expect(drag.moveFor(flung)?.notation, 'R');
    });
  });

  test('drag works on every cube size and inner layers', () {
    for (final n in [2, 4, 5, 6]) {
      final frame = CubeFrame(
        cube: CubeState.solved(n),
        orbit: CubeOrientation.initial,
      );
      final max = n - 1;
      // Second column from the right on the front face (first for 2x2).
      final x = n == 2 ? max : max - 2;
      final move = dragMove(
        frame,
        (x, max, max),
        kNormalFront,
        const Offset(0, -150),
      );
      expect(move, isNotNull, reason: '${n}x$n');
      expect(move!.axis, 0);
      expect(move.fromLayer, (x + max) ~/ 2);
      expect(move.quarterTurns, 3, reason: '${n}x$n ${move.notation}');
    }
  });

  for (final n in [2, 3, 4, 5, 6]) {
    test('paints ${n}x$n idle, mid-turn, highlighted and in x-ray', () {
      final cube = CubeState.solved(n);
      final moves = [
        MoveNotation.parse('R', n),
        if (n >= 4) MoveNotation.parse('2U', n),
        if (n >= 3) MoveNotation.parse('Rw2', n),
        MoveNotation.parse("y'", n),
      ];
      paintFrame(CubeFrame(cube: cube, orbit: CubeOrientation.initial));
      for (final move in moves) {
        for (final progress in [0.0, 0.33, 0.5, 1.0]) {
          paintFrame(
            CubeFrame(
              cube: cube,
              orbit: CubeOrientation.fromYawPitch(yaw: 2.4, pitch: -0.8),
              turn: LayerTurn.ofMove(move, progress),
            ),
          );
        }
      }
      paintFrame(
        CubeFrame(
          cube: cube,
          orbit: CubeOrientation.initial,
          highlighted: const {0, 1, 2},
          xray: true,
          turn: LayerTurn.ofMove(moves.first, 0.4),
        ),
      );
      paintFrame(
        CubeFrame(cube: cube, orbit: CubeOrientation.initial),
        Size.zero,
      );
    });
  }
}

/// Reference turntable matrix (yaw around +y, then pitch around +x).
abstract final class Matrix3Ref {
  static Matrix3 yawPitch(double yaw, double pitch) =>
      Matrix3.rotationX(pitch).multiplied(Matrix3.rotationY(yaw));
}
