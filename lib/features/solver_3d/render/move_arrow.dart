import 'dart:math' as math;
import 'dart:ui';

import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../../../core/cube/cube_move.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_geometry.dart';

/// Draws a curved 3D arrow around the layers of [move], on the side facing
/// the camera, pointing the way the layers turn.
///
/// The arrow is a ring segment centred on the turning layers' axis, so it
/// follows the cube's perspective from any orbit angle. [phase] in `[0, 1)`
/// drives a light pulse travelling along the arrow.
abstract final class MoveArrow {
  /// Ring radius, in model units (the cube spans `[-1, 1]`).
  static const double _radius = 1.5;

  static void paint(
    Canvas canvas,
    Size size,
    CubeFrame frame,
    CubeMove move,
    double phase,
  ) {
    final points = path(frame, size, move);
    if (points.length < 2) return;
    final unit = math.min(size.width, size.height) / 360;

    final arc = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      arc.lineTo(p.dx, p.dy);
    }

    // Soft glow, then a crisp core.
    final pulse = 0.75 + 0.25 * math.sin(phase * 2 * math.pi);
    canvas.drawPath(
      arc,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 11 * unit
        ..color = AppColors.accent.withValues(alpha: 0.35 * pulse)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4 * unit),
    );
    final core = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 4.5 * unit
      ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.95);
    canvas.drawPath(arc, core);

    // Arrowhead along the final tangent.
    final tip = points.last;
    final back = points[points.length - 3];
    final dir = tip - back;
    if (dir.distance > 0) {
      final forward = dir / dir.distance;
      final side = Offset(-forward.dy, forward.dx);
      final length = 16 * unit;
      final head = Path()
        ..moveTo(
          tip.dx + forward.dx * length * 0.55,
          tip.dy + forward.dy * length * 0.55,
        )
        ..lineTo(
          tip.dx - forward.dx * length * 0.45 + side.dx * length * 0.6,
          tip.dy - forward.dy * length * 0.45 + side.dy * length * 0.6,
        )
        ..lineTo(
          tip.dx - forward.dx * length * 0.45 - side.dx * length * 0.6,
          tip.dy - forward.dy * length * 0.45 - side.dy * length * 0.6,
        )
        ..close();
      canvas.drawPath(
        head,
        Paint()
          ..color = AppColors.accent.withValues(alpha: 0.5 * pulse)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3 * unit),
      );
      canvas.drawPath(head, Paint()..color = const Color(0xFFFFFFFF));
    }

    // A bright bead running along the arrow shows the motion.
    final bead = points[(phase * (points.length - 1)).floor()];
    canvas.drawCircle(
      bead,
      5 * unit,
      Paint()
        ..color = AppColors.accent
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.5 * unit),
    );
  }

  /// Screen points of the arrow, tail first.
  static List<Offset> path(CubeFrame frame, Size size, CubeMove move) {
    if (size.isEmpty) return const [];
    final n = frame.cube.size;
    final view = CubeProjection.viewMatrix(frame.orbit);
    final focal = CubeProjection.focalLength(size);
    final axis = move.axis;
    final e0 = CubeProjection.unit(axis);
    final e1 = CubeProjection.unit((axis + 1) % 3);
    final e2 = CubeProjection.unit((axis + 2) % 3);
    // Center of the turning layers along the axis, in model units.
    final offset = (move.fromLayer + move.toLayer - (n - 1)) / n;

    // Center the arc on the side of the ring closest to the camera.
    final camera = view.transposed().transformed(
      Vector3(0, 0, CubeProjection.cameraDistance),
    );
    final facing = math.atan2(camera.dot(e2), camera.dot(e1));
    final turns = move.signedQuarterTurns;
    final span = turns.abs() == 2 ? math.pi * 0.85 : math.pi * 0.4;
    final direction = turns.sign.toDouble();
    final start = facing - direction * span / 2;

    const samples = 40;
    return [
      for (var i = 0; i <= samples; i++)
        () {
          final theta = start + direction * span * i / samples;
          final p =
              e0 * offset +
              (e1 * math.cos(theta) + e2 * math.sin(theta)) * _radius;
          return CubeProjection.project(view.transformed(p), size, focal);
        }(),
    ];
  }
}
