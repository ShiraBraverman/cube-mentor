import 'dart:math' as math;
import 'dart:ui';

import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import '../render/cube_geometry.dart';

/// A finger resting on a sticker, before the drag direction is known.
///
/// Holds the screen-space direction of the two model axes lying in the
/// touched face's plane, so a swipe can be projected onto them.
class LayerGrab {
  LayerGrab._({
    required this.size,
    required this.position,
    required this.normalAxis,
    required this.normalSign,
    required this.tangentPixels,
  });

  /// Builds a grab from a hit-tested [face] of an idle (unturned) [frame]
  /// drawn into a viewport of [viewport] size.
  factory LayerGrab.fromFace(
    ProjectedFace face,
    CubeFrame frame,
    Size viewport,
  ) {
    final n = frame.cube.size;
    final view = CubeProjection.viewMatrix(frame.orbit);
    final focal = CubeProjection.focalLength(viewport);
    final (x, y, z) = face.cubie.position;
    final center =
        Vector3(x.toDouble(), y.toDouble(), z.toDouble()) / n.toDouble() +
        CubeProjection.unit(face.axis) * (face.sign / n);
    final origin = CubeProjection.project(view.transformed(center), viewport, focal);
    const step = 0.01;
    final tangents = <int, Offset>{};
    for (var axis = 0; axis < 3; axis++) {
      if (axis == face.axis) continue;
      final moved = CubeProjection.project(
        view.transformed(center + CubeProjection.unit(axis) * step),
        viewport,
        focal,
      );
      tangents[axis] = (moved - origin) / step;
    }
    return LayerGrab._(
      size: n,
      position: face.cubie.position,
      normalAxis: face.axis,
      normalSign: face.sign,
      tangentPixels: tangents,
    );
  }

  /// Cube size.
  final int size;

  /// Grabbed cubie position (doubled coordinates).
  final IVec3 position;
  final int normalAxis;
  final int normalSign;

  /// Screen displacement (pixels) per normalized unit along each in-plane
  /// model axis. The cube spans 2 units edge to edge.
  final Map<int, Offset> tangentPixels;

  /// Locks the drag onto a layer once the finger has moved far enough, or
  /// returns null while the direction is still ambiguous.
  LayerDrag? resolve(Offset totalDelta, {double threshold = 10}) {
    if (totalDelta.distance < threshold) return null;
    int? bestAxis;
    var bestScore = -1.0;
    for (final MapEntry(key: axis, value: px) in tangentPixels.entries) {
      final length = px.distance;
      // Faces seen edge-on cannot be dragged along their collapsed axis.
      if (length < 1e-3) continue;
      final score = (totalDelta.dx * px.dx + totalDelta.dy * px.dy).abs() / length;
      if (score > bestScore) {
        bestScore = score;
        bestAxis = axis;
      }
    }
    if (bestAxis == null) return null;

    // Moving the sticker along +t is a positive rotation around n x t.
    final rotationAxis = 3 - normalAxis - bestAxis;
    final cyclic = (bestAxis - normalAxis + 3) % 3 == 1;
    final orientation = normalSign * (cyclic ? 1 : -1);
    final layer = (componentOf(position, rotationAxis) + size - 1) ~/ 2;
    return LayerDrag(
      size: size,
      axis: rotationAxis,
      layer: layer,
      orientation: orientation,
      tangentPixels: tangentPixels[bestAxis]!,
    );
  }
}

/// A drag locked onto one layer; converts finger travel into an angle.
class LayerDrag {
  LayerDrag({
    required this.size,
    required this.axis,
    required this.layer,
    required this.orientation,
    required this.tangentPixels,
  });

  final int size;

  /// Rotation axis and layer index along it.
  final int axis;
  final int layer;

  /// +1 or -1: how finger travel along the tangent maps to rotation around
  /// the positive [axis].
  final int orientation;

  /// Screen pixels per normalized unit along the drag tangent.
  final Offset tangentPixels;

  /// Rotation (radians, counter-clockwise around +axis) for a total finger
  /// displacement. A sticker on the face is about one unit from the axis, so
  /// one unit of travel along the face is roughly one radian.
  double angleFor(Offset delta) {
    final lengthSq = tangentPixels.distanceSquared;
    if (lengthSq < 1e-6) return 0;
    final units =
        (delta.dx * tangentPixels.dx + delta.dy * tangentPixels.dy) / lengthSq;
    return orientation * units;
  }

  /// Quarter turns to snap to on release. A flick carries the layer at most
  /// one quarter turn further, however fast it is.
  int snapQuarterTurns(double angle, Offset velocity) {
    const quarter = math.pi / 2;
    final momentum = (angleFor(velocity) * 0.12).clamp(
      -quarter * 0.9,
      quarter * 0.9,
    );
    return ((angle + momentum) / quarter).round();
  }

  LayerTurn turnAt(double angle) =>
      LayerTurn(axis: axis, fromLayer: layer, toLayer: layer, angle: angle);

  /// The committed move for [quarterTurns] (any integer), or null for a
  /// whole number of full turns.
  CubeMove? moveFor(int quarterTurns) {
    final q = quarterTurns % 4;
    if (q == 0) return null;
    return MoveNotation.describe(
      axis: axis,
      fromLayer: layer,
      toLayer: layer,
      quarterTurns: q,
      size: size,
    );
  }
}
