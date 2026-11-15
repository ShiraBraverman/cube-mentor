import 'dart:ui' as ui;

import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/features/solver_3d/render/cube_painter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

void main() {
  void paintFrame(CubeFrame frame, [Size size = const Size(400, 400)]) {
    final recorder = ui.PictureRecorder();
    CubePainter(frame: frame).paint(Canvas(recorder), size);
    recorder.endRecording().dispose();
  }

  test('default view shows the U, F and R faces', () {
    final view = CubeProjection.viewMatrix(OrbitAngles.initial);
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
        final view = CubeProjection.viewMatrix(OrbitAngles(yaw: yaw, pitch: pitch));
        for (final c in [
          for (final x in [-1.0, 1.0])
            for (final y in [-1.0, 1.0])
              for (final z in [-1.0, 1.0]) Vector3(x, y, z),
        ]) {
          final p = CubeProjection.project(view.transformed(c), size, focal);
          expect(p.dx, inInclusiveRange(0, size.width));
          expect(p.dy, inInclusiveRange(0, size.height));
        }
      }
    }
  });

  test('a full move animation ends where the committed move starts', () {
    final move = MoveNotation.parse("R'", 3);
    final rotation = CubeProjection.moveRotation(move, 1);
    // At progress 1 the animated rotation must equal the model's quarter
    // turn, otherwise pieces would jump when the move is committed.
    final rotated = rotation.transformed(Vector3(0, 1, 0));
    final expected = rotateQuarter((0, 1, 0), move.axis, move.quarterTurns);
    expect(rotated.x, closeTo(expected.$1.toDouble(), 1e-9));
    expect(rotated.y, closeTo(expected.$2.toDouble(), 1e-9));
    expect(rotated.z, closeTo(expected.$3.toDouble(), 1e-9));
  });

  for (final n in [2, 3, 4, 5, 6]) {
    test('paints ${n}x$n idle, mid-move, highlighted and in x-ray', () {
      final cube = CubeState.solved(n);
      final moves = [
        MoveNotation.parse('R', n),
        if (n >= 4) MoveNotation.parse('2U', n),
        if (n >= 3) MoveNotation.parse('Rw2', n),
        MoveNotation.parse("y'", n),
      ];
      paintFrame(CubeFrame(cube: cube, orbit: OrbitAngles.initial));
      for (final move in moves) {
        for (final progress in [0.0, 0.33, 0.5, 1.0]) {
          paintFrame(CubeFrame(
            cube: cube,
            orbit: const OrbitAngles(yaw: 2.4, pitch: -0.8),
            activeMove: move,
            progress: progress,
          ));
        }
      }
      paintFrame(CubeFrame(
        cube: cube,
        orbit: OrbitAngles.initial,
        highlighted: {0, 1, 2},
        xray: true,
        activeMove: moves.first,
        progress: 0.4,
      ));
      paintFrame(CubeFrame(cube: cube, orbit: OrbitAngles.initial), Size.zero);
    });
  }
}
