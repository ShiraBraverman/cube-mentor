import 'package:vector_math/vector_math_64.dart' show Matrix3, Quaternion;

import 'scan_session.dart';

/// One quarter turn of the whole physical cube between two scanned faces.
enum ScanTurn {
  /// Turn the cube to the left: the right face comes to the front.
  left,

  /// Turn the cube to the right: the left face comes to the front.
  right,

  /// Tip the top toward you: the top face comes to the front.
  tipTop,

  /// Tip the bottom toward you: the bottom face comes to the front.
  tipBottom,
}

/// Integer direction in cube or view coordinates.
typedef ScanVec = ({int x, int y, int z});

/// How each face is seen while it is scanned, in cube coordinates (x = R,
/// y = U, z = F): its outward normal, the direction shown at the top of the
/// camera image and the one shown on the right. Matches the facelet layout
/// (sides with U up, U with B up, D with F up).
class ScanFaceFrame {
  const ScanFaceFrame(this.normal, this.up, this.right);

  final ScanVec normal;
  final ScanVec up;
  final ScanVec right;
}

const Map<int, ScanFaceFrame> kScanFaceFrames = {
  kFaceU: ScanFaceFrame((x: 0, y: 1, z: 0), (x: 0, y: 0, z: -1), (
    x: 1,
    y: 0,
    z: 0,
  )),
  kFaceR: ScanFaceFrame((x: 1, y: 0, z: 0), (x: 0, y: 1, z: 0), (
    x: 0,
    y: 0,
    z: -1,
  )),
  kFaceF: ScanFaceFrame((x: 0, y: 0, z: 1), (x: 0, y: 1, z: 0), (
    x: 1,
    y: 0,
    z: 0,
  )),
  kFaceD: ScanFaceFrame((x: 0, y: -1, z: 0), (x: 0, y: 0, z: 1), (
    x: 1,
    y: 0,
    z: 0,
  )),
  kFaceL: ScanFaceFrame((x: -1, y: 0, z: 0), (x: 0, y: 1, z: 0), (
    x: 0,
    y: 0,
    z: 1,
  )),
  kFaceB: ScanFaceFrame((x: 0, y: 0, z: -1), (x: 0, y: 1, z: 0), (
    x: -1,
    y: 0,
    z: 0,
  )),
};

int _dot(ScanVec a, ScanVec b) => a.x * b.x + a.y * b.y + a.z * b.z;

/// [v] (cube coordinates) as seen while [face] is in front: x right,
/// y up, z toward the viewer.
ScanVec _inView(int face, ScanVec v) {
  final f = kScanFaceFrames[face]!;
  return (x: _dot(f.right, v), y: _dot(f.up, v), z: _dot(f.normal, v));
}

/// Screen-space effect of each turn on a view-space direction.
ScanVec _apply(ScanTurn turn, ScanVec v) => switch (turn) {
  ScanTurn.left => (x: -v.z, y: v.y, z: v.x),
  ScanTurn.right => (x: v.z, y: v.y, z: -v.x),
  ScanTurn.tipTop => (x: v.x, y: -v.z, z: v.y),
  ScanTurn.tipBottom => (x: v.x, y: v.z, z: -v.y),
};

/// The single quarter turn from [from] to [to], if one exists that also
/// leaves [to] the right way up.
ScanTurn? _quarterTurn(int from, int to) {
  final target = kScanFaceFrames[to]!;
  final normal = _inView(from, target.normal);
  final up = _inView(from, target.up);
  for (final turn in ScanTurn.values) {
    final n = _apply(turn, normal);
    final u = _apply(turn, up);
    if (n == (x: 0, y: 0, z: 1) && u == (x: 0, y: 1, z: 0)) return turn;
  }
  return null;
}

/// Shortest list of quarter turns of the whole cube that brings [to] in
/// front (the right way up) when [from] is in front. Prefers going through
/// the front face, the one the user started from.
List<({ScanTurn turn, int face})> scanTurns(int from, int to) {
  if (from == to) return const [];
  const order = [kFaceF, kFaceR, kFaceB, kFaceL, kFaceU, kFaceD];
  final previous = <int, ({ScanTurn turn, int face})>{};
  final queue = [from];
  final seen = {from};
  while (queue.isNotEmpty) {
    final face = queue.removeAt(0);
    if (face == to) break;
    for (final next in order) {
      if (seen.contains(next)) continue;
      final turn = _quarterTurn(face, next);
      if (turn == null) continue;
      seen.add(next);
      previous[next] = (turn: turn, face: face);
      queue.add(next);
    }
  }
  final path = <({ScanTurn turn, int face})>[];
  for (var face = to; face != from;) {
    final step = previous[face]!;
    path.insert(0, (turn: step.turn, face: face));
    face = step.face;
  }
  return path;
}

/// Rotation from cube coordinates to the view with [face] in front.
Quaternion scanFaceOrientation(int face) {
  final f = kScanFaceFrames[face]!;
  // Rows: right, up, normal (column-major constructor).
  final m = Matrix3(
    f.right.x.toDouble(),
    f.up.x.toDouble(),
    f.normal.x.toDouble(), //
    f.right.y.toDouble(),
    f.up.y.toDouble(),
    f.normal.y.toDouble(),
    f.right.z.toDouble(),
    f.up.z.toDouble(),
    f.normal.z.toDouble(),
  );
  return Quaternion.fromRotation(m)..normalize();
}
