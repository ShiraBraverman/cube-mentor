import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:material_ui/material_ui.dart';
import 'package:vector_math/vector_math_64.dart' show Matrix3, Vector3;

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';

/// Camera orientation around the cube, in radians.
@immutable
class OrbitAngles {
  const OrbitAngles({required this.yaw, required this.pitch});

  /// Default three-quarter view showing the U, F and R faces.
  static const OrbitAngles initial = OrbitAngles(yaw: -0.62, pitch: 0.5);

  static const double maxPitch = 1.45;

  final double yaw;
  final double pitch;

  OrbitAngles rotatedBy(double dYaw, double dPitch) => OrbitAngles(
    yaw: yaw + dYaw,
    pitch: (pitch + dPitch).clamp(-maxPitch, maxPitch),
  );

  @override
  bool operator ==(Object other) =>
      other is OrbitAngles && other.yaw == yaw && other.pitch == pitch;

  @override
  int get hashCode => Object.hash(yaw, pitch);
}

/// Everything needed to draw a single frame of the cube.
@immutable
class CubeFrame {
  const CubeFrame({
    required this.cube,
    required this.orbit,
    this.activeMove,
    this.progress = 0,
    this.highlighted = const {},
    this.xray = false,
  });

  final CubeState cube;
  final OrbitAngles orbit;

  /// Move currently being animated (already-committed state is [cube]).
  final CubeMove? activeMove;

  /// Eased animation progress of [activeMove] in `[0, 1]`.
  final double progress;

  /// Cubie ids to emphasize (pedagogical highlighting).
  final Set<int> highlighted;

  /// Semi-transparent rendering that reveals hidden faces.
  final bool xray;
}

/// Pure geometry helpers shared by the painter and its tests.
abstract final class CubeProjection {
  /// Distance from the camera to the cube center, in normalized units where
  /// the cube spans `[-1, 1]` on each axis.
  static const double cameraDistance = 5.2;

  static const double _boundingRadius = 1.7320508; // sqrt(3)

  /// View rotation: yaw around +y, then pitch around +x. vector_math rotation
  /// matrices are counter-clockwise around +axis, like the model's turns.
  static Matrix3 viewMatrix(OrbitAngles orbit) =>
      Matrix3.rotationX(orbit.pitch).multiplied(Matrix3.rotationY(orbit.yaw));

  /// Rotation matrix for a partially animated move.
  static Matrix3 moveRotation(CubeMove move, double progress) {
    final angle = move.signedQuarterTurns * math.pi / 2 * progress;
    return switch (move.axis) {
      0 => Matrix3.rotationX(angle),
      1 => Matrix3.rotationY(angle),
      _ => Matrix3.rotationZ(angle),
    };
  }

  /// Focal length so the cube's bounding sphere fits the shortest side.
  static double focalLength(Size size) {
    final fit = math.min(size.width, size.height) * 0.5 * 0.94;
    return fit * (cameraDistance - _boundingRadius) / _boundingRadius;
  }

  /// Perspective projection of a view-space point.
  static Offset project(Vector3 p, Size size, double focal) {
    final scale = focal / (cameraDistance - p.z);
    return Offset(
      size.width / 2 + p.x * scale,
      size.height / 2 - p.y * scale,
    );
  }
}

/// Paints an n x n x n cube with smooth layer-turn animations.
///
/// Depth ordering: cubies are split into up to three slabs along the turning
/// axis (below, turning, above). The slabs are separated by planes, so drawing
/// the slab farthest from the camera first is always correct. Inside a slab
/// cubies are rigid and grid-aligned, so sorting by distance is sufficient,
/// and each cubie is convex, so its front-facing faces never overlap.
class CubePainter extends CustomPainter {
  CubePainter({required this.frame, super.repaint});

  final CubeFrame frame;

  static const double _stickerInset = 0.86;
  static const double _cornerRound = 0.2;
  static final Vector3 _lightDir = Vector3(-0.35, 0.75, 0.6)..normalize();

  final Paint _fill = Paint()..isAntiAlias = true;
  final Paint _stroke = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;
    final cube = frame.cube;
    final n = cube.size;
    final focal = CubeProjection.focalLength(size);
    final view = CubeProjection.viewMatrix(frame.orbit);
    final move = frame.activeMove;
    final moveRot = move == null
        ? Matrix3.identity()
        : CubeProjection.moveRotation(move, frame.progress);
    final animViewRot = view.multiplied(moveRot);
    final cameraView = Vector3(0, 0, CubeProjection.cameraDistance);

    _paintShadow(canvas, size, focal);

    // Interior cubies only become visible while a layer is turning.
    final drawInterior = move != null && !frame.xray;
    final items = <_CubieItem>[];
    for (final cubie in cube.cubies) {
      if (!drawInterior && !cube.isSurface(cubie)) continue;
      final affected = move != null && cube.isAffected(cubie, move);
      final rot = affected ? animViewRot : view;
      final center = rot.transformed(_toVector(cubie.position) / n.toDouble());
      var slab = 0;
      if (move != null) {
        final layer = cube.layerIndexOf(componentOf(cubie.position, move.axis));
        slab = layer < move.fromLayer ? 0 : (layer > move.toLayer ? 2 : 1);
      }
      items.add(_CubieItem(
        cubie: cubie,
        rotation: rot,
        center: center,
        slab: slab,
        distanceSq: center.distanceToSquared(cameraView),
      ));
    }

    // Camera position in cube space decides which slab is farthest.
    var slabFarFirst = true;
    if (move != null) {
      final cameraCube = view.transposed().transformed(cameraView);
      slabFarFirst = cameraCube[move.axis] > 0;
    }

    final half = 1.0 / n;
    if (frame.xray) {
      _paintXray(canvas, size, focal, items, half, cameraView);
      return;
    }

    items.sort((a, b) {
      if (a.slab != b.slab) {
        return slabFarFirst ? a.slab - b.slab : b.slab - a.slab;
      }
      return b.distanceSq.compareTo(a.distanceSq);
    });

    final hasHighlights = frame.highlighted.isNotEmpty;
    for (final item in items) {
      final axes = _axes(item.rotation);
      for (var axis = 0; axis < 3; axis++) {
        for (final sign in const [1, -1]) {
          final normal = axes[axis] * sign.toDouble();
          final faceCenter = item.center + normal * half;
          if (normal.dot(cameraView - faceCenter) <= 0) continue;
          final corners = _faceCorners(faceCenter, axes, axis, half);
          final pts = [
            for (final c in corners) CubeProjection.project(c, size, focal),
          ];
          final shade = _shade(normal);

          _fill.color = _shaded(AppColors.cubeBody, shade);
          canvas.drawPath(_polygon(pts), _fill);

          final color = item.cubie.stickers[_normalKey(axis, sign)];
          if (color == null) continue;
          final isHighlighted = frame.highlighted.contains(item.cubie.id);
          var stickerColor = _shaded(AppColors.stickers[color]!, shade);
          if (hasHighlights && !isHighlighted) {
            stickerColor = Color.lerp(stickerColor, AppColors.cubeBody, 0.6)!;
          }
          final stickerPath = _roundedSticker(pts);
          _fill.color = stickerColor;
          canvas.drawPath(stickerPath, _fill);
          if (hasHighlights && isHighlighted) {
            _stroke
              ..color = Colors.white.withValues(alpha: 0.95)
              ..strokeWidth = 2;
            canvas.drawPath(stickerPath, _stroke);
          }
        }
      }
    }
  }

  void _paintXray(
    Canvas canvas,
    Size size,
    double focal,
    List<_CubieItem> items,
    double half,
    Vector3 cameraView,
  ) {
    final faces = <_XrayFace>[];
    for (final item in items) {
      final axes = _axes(item.rotation);
      for (var axis = 0; axis < 3; axis++) {
        for (final sign in const [1, -1]) {
          // Only outer (stickered) faces are drawn to keep the view readable.
          final color = item.cubie.stickers[_normalKey(axis, sign)];
          if (color == null) continue;
          final normal = axes[axis] * sign.toDouble();
          final faceCenter = item.center + normal * half;
          final corners = _faceCorners(faceCenter, axes, axis, half);
          faces.add((
            pts: [
              for (final c in corners) CubeProjection.project(c, size, focal),
            ],
            depth: faceCenter.distanceToSquared(cameraView),
            color: AppColors.stickers[color]!,
            shade: _shade(normal),
            front: normal.dot(cameraView - faceCenter) > 0,
          ));
        }
      }
    }
    faces.sort((a, b) => b.depth.compareTo(a.depth));
    for (final face in faces) {
      final path = _roundedSticker(face.pts);
      _fill.color = _shaded(face.color, face.shade)
          .withValues(alpha: face.front ? 0.55 : 0.35);
      canvas.drawPath(path, _fill);
      _stroke
        ..color = Colors.white.withValues(alpha: face.front ? 0.35 : 0.15)
        ..strokeWidth = 1;
      canvas.drawPath(path, _stroke);
    }
  }

  void _paintShadow(Canvas canvas, Size size, double focal) {
    final scale = focal / CubeProjection.cameraDistance;
    final center = Offset(size.width / 2, size.height / 2 + scale * 1.55);
    final rect = Rect.fromCenter(
      center: center,
      width: scale * 2.6,
      height: scale * 0.5,
    );
    final shadow = Paint()
      ..shader = ui.Gradient.radial(
        center,
        rect.width / 2,
        [Colors.black.withValues(alpha: 0.45), Colors.transparent],
      );
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(1, rect.height / rect.width);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawCircle(center, rect.width / 2, shadow);
    canvas.restore();
  }

  static Vector3 _toVector(IVec3 v) =>
      Vector3(v.$1.toDouble(), v.$2.toDouble(), v.$3.toDouble());

  /// View-space directions of the cubie's local x, y and z axes.
  static List<Vector3> _axes(Matrix3 rotation) => [
    rotation.transformed(Vector3(1, 0, 0)),
    rotation.transformed(Vector3(0, 1, 0)),
    rotation.transformed(Vector3(0, 0, 1)),
  ];

  static IVec3 _normalKey(int axis, int sign) => switch (axis) {
    0 => (sign, 0, 0),
    1 => (0, sign, 0),
    _ => (0, 0, sign),
  };

  static List<Vector3> _faceCorners(
    Vector3 faceCenter,
    List<Vector3> axes,
    int axis,
    double half,
  ) {
    final u = axes[(axis + 1) % 3] * half;
    final v = axes[(axis + 2) % 3] * half;
    return [
      faceCenter + u + v,
      faceCenter - u + v,
      faceCenter - u - v,
      faceCenter + u - v,
    ];
  }

  static double _shade(Vector3 normal) =>
      0.62 + 0.38 * math.max(0.0, normal.dot(_lightDir));

  static Color _shaded(Color color, double shade) => Color.from(
    alpha: color.a,
    red: color.r * shade,
    green: color.g * shade,
    blue: color.b * shade,
  );

  static Path _polygon(List<Offset> pts) => Path()
    ..moveTo(pts[0].dx, pts[0].dy)
    ..lineTo(pts[1].dx, pts[1].dy)
    ..lineTo(pts[2].dx, pts[2].dy)
    ..lineTo(pts[3].dx, pts[3].dy)
    ..close();

  /// Inset quad with rounded corners (approximated with quadratic curves so
  /// it stays correct under perspective).
  static Path _roundedSticker(List<Offset> quad) {
    final center = (quad[0] + quad[1] + quad[2] + quad[3]) / 4;
    final p = [for (final q in quad) center + (q - center) * _stickerInset];
    final path = Path();
    for (var i = 0; i < 4; i++) {
      final corner = p[i];
      final prev = p[(i + 3) % 4];
      final next = p[(i + 1) % 4];
      final a = Offset.lerp(corner, prev, _cornerRound)!;
      final b = Offset.lerp(corner, next, _cornerRound)!;
      if (i == 0) {
        path.moveTo(a.dx, a.dy);
      } else {
        path.lineTo(a.dx, a.dy);
      }
      path.quadraticBezierTo(corner.dx, corner.dy, b.dx, b.dy);
    }
    return path..close();
  }

  @override
  bool shouldRepaint(CubePainter oldDelegate) =>
      oldDelegate.frame != frame;
}

typedef _XrayFace = ({
  List<Offset> pts,
  double depth,
  Color color,
  double shade,
  bool front,
});

class _CubieItem {
  _CubieItem({
    required this.cubie,
    required this.rotation,
    required this.center,
    required this.slab,
    required this.distanceSq,
  });

  final Cubie cubie;
  final Matrix3 rotation;
  final Vector3 center;
  final int slab;
  final double distanceSq;
}
