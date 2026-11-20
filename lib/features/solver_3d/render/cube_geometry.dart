import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:vector_math/vector_math_64.dart' show Matrix3, Quaternion, Vector3;

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';

/// Free (unclamped) orientation of the cube relative to the camera, stored as
/// a unit quaternion so the cube can be tumbled any number of full turns in
/// any direction without gimbal limits.
@immutable
class CubeOrientation {
  const CubeOrientation._(this._x, this._y, this._z, this._w);

  factory CubeOrientation._of(Quaternion q) {
    final n = q.normalized();
    return CubeOrientation._(n.x, n.y, n.z, n.w);
  }

  /// Turntable-style construction: [yaw] around +y, then [pitch] around +x.
  factory CubeOrientation.fromYawPitch({
    required double yaw,
    required double pitch,
  }) => CubeOrientation._of(
    Quaternion.axisAngle(Vector3(1, 0, 0), pitch) *
        Quaternion.axisAngle(Vector3(0, 1, 0), yaw),
  );

  /// Default three-quarter view showing the U, F and R faces.
  static final CubeOrientation initial = CubeOrientation.fromYawPitch(
    yaw: -0.62,
    pitch: 0.5,
  );

  final double _x;
  final double _y;
  final double _z;
  final double _w;

  Quaternion get _quaternion => Quaternion(_x, _y, _z, _w);

  /// Model-to-view rotation.
  Matrix3 get matrix => _quaternion.asRotationMatrix();

  /// Trackball rotation in screen space: horizontal finger travel spins the
  /// cube around the screen's vertical axis, vertical travel around the
  /// screen's horizontal axis. Angles in radians; no limits.
  CubeOrientation rotatedOnScreen(double dx, double dy) => CubeOrientation._of(
    Quaternion.axisAngle(Vector3(1, 0, 0), dy) *
        Quaternion.axisAngle(Vector3(0, 1, 0), dx) *
        _quaternion,
  );

  /// Interpolates along the shortest arc toward [target] (normalized lerp,
  /// which is plenty for short UI animations).
  CubeOrientation lerpTo(CubeOrientation target, double t) {
    final sign = _dot(target) < 0 ? -1.0 : 1.0;
    return CubeOrientation._of(Quaternion(
      _x + (target._x * sign - _x) * t,
      _y + (target._y * sign - _y) * t,
      _z + (target._z * sign - _z) * t,
      _w + (target._w * sign - _w) * t,
    ));
  }

  /// Rotation angle (radians) separating this orientation from [other].
  double angleTo(CubeOrientation other) =>
      2 * math.acos(_dot(other).abs().clamp(0.0, 1.0));

  double _dot(CubeOrientation o) => _x * o._x + _y * o._y + _z * o._z + _w * o._w;

  @override
  bool operator ==(Object other) =>
      other is CubeOrientation &&
      other._x == _x &&
      other._y == _y &&
      other._z == _z &&
      other._w == _w;

  @override
  int get hashCode => Object.hash(_x, _y, _z, _w);
}

/// A block of layers rotated by an arbitrary angle: either an animated move
/// or a layer the user is dragging with a finger.
@immutable
class LayerTurn {
  const LayerTurn({
    required this.axis,
    required this.fromLayer,
    required this.toLayer,
    required this.angle,
  });

  /// Partially animated [move] at eased [progress] in `[0, 1]`.
  factory LayerTurn.ofMove(CubeMove move, double progress) => LayerTurn(
    axis: move.axis,
    fromLayer: move.fromLayer,
    toLayer: move.toLayer,
    angle: move.signedQuarterTurns * math.pi / 2 * progress,
  );

  final int axis;
  final int fromLayer;
  final int toLayer;

  /// Counter-clockwise angle around +[axis], in radians.
  final double angle;

  bool affectsLayer(int layer) => layer >= fromLayer && layer <= toLayer;

  @override
  bool operator ==(Object other) =>
      other is LayerTurn &&
      other.axis == axis &&
      other.fromLayer == fromLayer &&
      other.toLayer == toLayer &&
      other.angle == angle;

  @override
  int get hashCode => Object.hash(axis, fromLayer, toLayer, angle);
}

/// Everything needed to draw a single frame of the cube.
@immutable
class CubeFrame {
  const CubeFrame({
    required this.cube,
    required this.orbit,
    this.turn,
    this.highlighted = const {},
    this.focus = const {},
    this.muted = const {},
    this.xray = false,
  });

  final CubeState cube;
  final CubeOrientation orbit;

  /// Layers currently rotated away from their committed position.
  final LayerTurn? turn;

  /// Cubie ids to emphasize (pedagogical highlighting).
  final Set<int> highlighted;

  /// Cubie ids of the layer the user should turn next; shown at full
  /// brightness (without an outline) while other cubies are dimmed.
  final Set<int> focus;

  /// Cubie ids drawn in plain gray: pieces that do not matter for a goal.
  final Set<int> muted;

  /// Semi-transparent rendering that reveals hidden faces.
  final bool xray;

  CubeFrame copyWith({LayerTurn? turn, bool clearTurn = false, bool? xray}) =>
      CubeFrame(
        cube: cube,
        orbit: orbit,
        turn: clearTurn ? null : (turn ?? this.turn),
        highlighted: highlighted,
        focus: focus,
        muted: muted,
        xray: xray ?? this.xray,
      );

  @override
  bool operator ==(Object other) =>
      other is CubeFrame &&
      identical(other.cube, cube) &&
      other.orbit == orbit &&
      other.turn == turn &&
      setEquals(other.highlighted, highlighted) &&
      setEquals(other.focus, focus) &&
      setEquals(other.muted, muted) &&
      other.xray == xray;

  @override
  int get hashCode => Object.hash(cube, orbit, turn, xray);
}

/// Camera and projection math shared by rendering and touch handling.
abstract final class CubeProjection {
  /// Distance from the camera to the cube center, in normalized units where
  /// the cube spans `[-1, 1]` on each axis.
  static const double cameraDistance = 5.2;

  static const double _boundingRadius = 1.7320508; // sqrt(3)

  /// Model-to-view rotation. vector_math rotation matrices are
  /// counter-clockwise around +axis, like the model's quarter turns.
  static Matrix3 viewMatrix(CubeOrientation orbit) => orbit.matrix;

  /// Counter-clockwise rotation by [angle] around +[axis].
  static Matrix3 axisRotation(int axis, double angle) => switch (axis) {
    0 => Matrix3.rotationX(angle),
    1 => Matrix3.rotationY(angle),
    _ => Matrix3.rotationZ(angle),
  };

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

  /// Unit vector along a model axis.
  static Vector3 unit(int axis) => Vector3(
    axis == 0 ? 1 : 0,
    axis == 1 ? 1 : 0,
    axis == 2 ? 1 : 0,
  );
}

/// One projected cubie face, in back-to-front draw order.
class ProjectedFace {
  ProjectedFace({
    required this.cubie,
    required this.axis,
    required this.sign,
    required this.quad,
    required this.shade,
    required this.color,
    required this.frontFacing,
  });

  final Cubie cubie;

  /// Face normal in model space (before any in-progress [LayerTurn]).
  final int axis;
  final int sign;

  /// Screen-space corners, in order around the face.
  final List<Offset> quad;

  /// Lambert lighting factor in `[0, 1]`.
  final double shade;

  /// Sticker color, or null for a bare plastic face.
  final StickerColor? color;
  final bool frontFacing;

  IVec3 get normal => switch (axis) {
    0 => (sign, 0, 0),
    1 => (0, sign, 0),
    _ => (0, 0, sign),
  };

  /// Whether [point] lies inside the (convex) projected quad.
  bool contains(Offset point) {
    var positive = false;
    var negative = false;
    for (var i = 0; i < 4; i++) {
      final a = quad[i];
      final b = quad[(i + 1) % 4];
      final cross =
          (b.dx - a.dx) * (point.dy - a.dy) - (b.dy - a.dy) * (point.dx - a.dx);
      if (cross > 0) positive = true;
      if (cross < 0) negative = true;
      if (positive && negative) return false;
    }
    return true;
  }
}

/// Builds the projected face list for a frame.
///
/// Depth ordering: cubies are split into up to three slabs along the turning
/// axis (below, turning, above). The slabs are separated by planes, so drawing
/// the slab farthest from the camera first is always correct. Inside a slab
/// cubies are rigid and grid-aligned, so sorting by distance is sufficient,
/// and each cubie is convex, so its front-facing faces never overlap.
abstract final class CubeScene {
  static final Vector3 _lightDir = Vector3(-0.35, 0.75, 0.6)..normalize();

  static List<ProjectedFace> build(CubeFrame frame, Size size) {
    if (size.isEmpty) return const [];
    final cube = frame.cube;
    final n = cube.size;
    final focal = CubeProjection.focalLength(size);
    final view = CubeProjection.viewMatrix(frame.orbit);
    final turn = frame.turn;
    final turnedView = turn == null
        ? view
        : view.multiplied(CubeProjection.axisRotation(turn.axis, turn.angle));
    final cameraView = Vector3(0, 0, CubeProjection.cameraDistance);
    final half = 1.0 / n;

    // Interior cubies only become visible while a layer is turned.
    final drawInterior = turn != null && !frame.xray;
    final items = <_CubieItem>[];
    for (final cubie in cube.cubies) {
      if (!drawInterior && !cube.isSurface(cubie)) continue;
      var slab = 0;
      var rotation = view;
      if (turn != null) {
        final layer =
            cube.layerIndexOf(componentOf(cubie.position, turn.axis));
        slab = layer < turn.fromLayer ? 0 : (layer > turn.toLayer ? 2 : 1);
        if (slab == 1) rotation = turnedView;
      }
      final (x, y, z) = cubie.position;
      final center = rotation.transformed(
        Vector3(x.toDouble(), y.toDouble(), z.toDouble()) / n.toDouble(),
      );
      items.add(_CubieItem(
        cubie: cubie,
        rotation: rotation,
        center: center,
        slab: slab,
        distanceSq: center.distanceToSquared(cameraView),
      ));
    }

    // Camera position in model space decides which slab is farthest.
    var lowSlabFirst = true;
    if (turn != null) {
      final cameraModel = view.transposed().transformed(cameraView);
      lowSlabFirst = cameraModel[turn.axis] > 0;
    }
    items.sort((a, b) {
      if (a.slab != b.slab) {
        return lowSlabFirst ? a.slab - b.slab : b.slab - a.slab;
      }
      return b.distanceSq.compareTo(a.distanceSq);
    });

    final faces = <ProjectedFace>[];
    final depths = <ProjectedFace, double>{};
    for (final item in items) {
      final axes = [
        for (var a = 0; a < 3; a++)
          item.rotation.transformed(CubeProjection.unit(a)),
      ];
      for (var axis = 0; axis < 3; axis++) {
        for (final sign in const [1, -1]) {
          final normalVec = axes[axis] * sign.toDouble();
          final faceCenter = item.center + normalVec * half;
          final front = normalVec.dot(cameraView - faceCenter) > 0;
          final key = switch (axis) {
            0 => (sign, 0, 0),
            1 => (0, sign, 0),
            _ => (0, 0, sign),
          };
          final color = item.cubie.stickers[key];
          // Opaque mode draws visible faces only; x-ray draws every sticker.
          if (frame.xray ? color == null : !front) continue;
          final u = axes[(axis + 1) % 3] * half;
          final v = axes[(axis + 2) % 3] * half;
          final face = ProjectedFace(
            cubie: item.cubie,
            axis: axis,
            sign: sign,
            quad: [
              for (final c in [
                faceCenter + u + v,
                faceCenter - u + v,
                faceCenter - u - v,
                faceCenter + u - v,
              ])
                CubeProjection.project(c, size, focal),
            ],
            shade: 0.62 + 0.38 * math.max(0.0, normalVec.dot(_lightDir)),
            color: color,
            frontFacing: front,
          );
          faces.add(face);
          if (frame.xray) {
            depths[face] = faceCenter.distanceToSquared(cameraView);
          }
        }
      }
    }
    if (frame.xray) {
      faces.sort((a, b) => depths[b]!.compareTo(depths[a]!));
    }
    return faces;
  }

  /// The topmost sticker under [point], or null when the touch misses the
  /// cube (or lands on a bare plastic face). Always tests the opaque scene,
  /// so x-ray mode does not let touches reach hidden stickers.
  static ProjectedFace? hitTest(CubeFrame frame, Size size, Offset point) {
    final faces = build(frame.copyWith(xray: false), size);
    for (var i = faces.length - 1; i >= 0; i--) {
      if (faces[i].contains(point)) {
        return faces[i].color == null ? null : faces[i];
      }
    }
    return null;
  }
}

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
