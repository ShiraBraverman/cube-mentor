import 'dart:math';

import 'cube_move.dart';

/// Integer 3D vector. Positions use "doubled" coordinates so that every
/// cubie center is an integer for both odd and even cube sizes:
/// `coord = 2 * index - (n - 1)`, i.e. in `[-(n-1), n-1]` with step 2.
typedef IVec3 = (int, int, int);

/// Sticker colors in the standard Western color scheme.
enum StickerColor { white, yellow, green, blue, red, orange }

/// Outward unit normals of the six faces, matching [CubeFace].
const IVec3 kNormalUp = (0, 1, 0);
const IVec3 kNormalDown = (0, -1, 0);
const IVec3 kNormalRight = (1, 0, 0);
const IVec3 kNormalLeft = (-1, 0, 0);
const IVec3 kNormalFront = (0, 0, 1);
const IVec3 kNormalBack = (0, 0, -1);

const List<IVec3> kFaceNormals = [
  kNormalUp,
  kNormalDown,
  kNormalRight,
  kNormalLeft,
  kNormalFront,
  kNormalBack,
];

/// Solved-state color for each outward normal.
const Map<IVec3, StickerColor> kSolvedColors = {
  kNormalUp: StickerColor.white,
  kNormalDown: StickerColor.yellow,
  kNormalFront: StickerColor.green,
  kNormalBack: StickerColor.blue,
  kNormalRight: StickerColor.red,
  kNormalLeft: StickerColor.orange,
};

int componentOf(IVec3 v, int axis) => switch (axis) {
  0 => v.$1,
  1 => v.$2,
  _ => v.$3,
};

/// Rotates [v] by `quarterTurns * 90deg` counter-clockwise around +[axis].
IVec3 rotateQuarter(IVec3 v, int axis, int quarterTurns) {
  var (x, y, z) = v;
  for (var i = 0; i < quarterTurns % 4; i++) {
    switch (axis) {
      case 0:
        (y, z) = (-z, y);
      case 1:
        (x, z) = (z, -x);
      default:
        (x, y) = (-y, x);
    }
  }
  return (x, y, z);
}

/// A single physical piece. [id] is stable across moves so that the UI can
/// track and highlight specific pieces (e.g. for pedagogical steps).
class Cubie {
  const Cubie({
    required this.id,
    required this.position,
    required this.stickers,
  });

  final int id;

  /// Center in doubled coordinates.
  final IVec3 position;

  /// Colored stickers keyed by their current outward normal. Interior cubies
  /// have none.
  final Map<IVec3, StickerColor> stickers;

  Cubie rotated(int axis, int quarterTurns) => Cubie(
    id: id,
    position: rotateQuarter(position, axis, quarterTurns),
    stickers: {
      for (final entry in stickers.entries)
        rotateQuarter(entry.key, axis, quarterTurns): entry.value,
    },
  );
}

/// Immutable n x n x n cube state.
class CubeState {
  CubeState._(this.size, this.cubies);

  /// Creates a solved cube of the given [size] (2..6 in the app, but any
  /// size >= 1 is supported by the model).
  factory CubeState.solved(int size) {
    assert(size >= 1);
    final cubies = <Cubie>[];
    final max = size - 1;
    var id = 0;
    for (var ix = 0; ix < size; ix++) {
      for (var iy = 0; iy < size; iy++) {
        for (var iz = 0; iz < size; iz++) {
          final stickers = <IVec3, StickerColor>{};
          if (ix == max) stickers[kNormalRight] = StickerColor.red;
          if (ix == 0) stickers[kNormalLeft] = StickerColor.orange;
          if (iy == max) stickers[kNormalUp] = StickerColor.white;
          if (iy == 0) stickers[kNormalDown] = StickerColor.yellow;
          if (iz == max) stickers[kNormalFront] = StickerColor.green;
          if (iz == 0) stickers[kNormalBack] = StickerColor.blue;
          cubies.add(
            Cubie(
              id: id++,
              position: (2 * ix - max, 2 * iy - max, 2 * iz - max),
              stickers: stickers,
            ),
          );
        }
      }
    }
    return CubeState._(size, List.unmodifiable(cubies));
  }

  /// A cube in its home geometry whose stickers show [faces]: for every
  /// outward normal, `size * size` colors row-major as seen from outside
  /// (the layout of [faceColors]). Used for scanned or hand-entered cubes.
  factory CubeState.fromFaceColors(
    int size,
    Map<IVec3, List<StickerColor>> faces,
  ) {
    final solved = CubeState.solved(size);
    return CubeState._(
      size,
      List.unmodifiable([
        for (final cubie in solved.cubies)
          Cubie(
            id: cubie.id,
            position: cubie.position,
            stickers: {
              for (final normal in cubie.stickers.keys)
                normal:
                    faces[normal]![solved._stickerIndex(
                      cubie.position,
                      normal,
                    )],
            },
          ),
      ]),
    );
  }

  final int size;
  final List<Cubie> cubies;

  /// Row-major index of the sticker at [position] on the face [normal].
  int _stickerIndex(IVec3 position, IVec3 normal) {
    final (right, down) = _faceFrame(normal);
    return layerIndexOf(_dot(position, down)) * size +
        layerIndexOf(_dot(position, right));
  }

  /// Converts a doubled coordinate to a 0-based layer index.
  int layerIndexOf(int doubledCoord) => (doubledCoord + size - 1) ~/ 2;

  /// Whether [cubie] lies within the layers turned by [move].
  bool isAffected(Cubie cubie, CubeMove move) =>
      move.affectsLayer(layerIndexOf(componentOf(cubie.position, move.axis)));

  /// Whether [cubie] has at least one visible face.
  bool isSurface(Cubie cubie) {
    final max = size - 1;
    final (x, y, z) = cubie.position;
    return x.abs() == max || y.abs() == max || z.abs() == max;
  }

  CubeState apply(CubeMove move) {
    if (move.toLayer >= size) {
      throw ArgumentError('Move $move does not fit a ${size}x$size cube');
    }
    return CubeState._(
      size,
      List.unmodifiable([
        for (final cubie in cubies)
          isAffected(cubie, move)
              ? cubie.rotated(move.axis, move.quarterTurns)
              : cubie,
      ]),
    );
  }

  CubeState applyAll(Iterable<CubeMove> moves) =>
      moves.fold(this, (state, move) => state.apply(move));

  /// Colors of the face with outward [normal], row-major as seen from outside
  /// the face (top-left first, using U/F as "up" reference conventions).
  List<StickerColor> faceColors(IVec3 normal) {
    final colors = <({int row, int col, StickerColor color})>[];
    final axis = normal.$1 != 0 ? 0 : (normal.$2 != 0 ? 1 : 2);
    final (right, down) = _faceFrame(normal);
    for (final cubie in cubies) {
      final color = cubie.stickers[normal];
      if (color == null) continue;
      final p = cubie.position;
      assert(componentOf(p, axis) * componentOf(normal, axis) > 0);
      colors.add((
        row: layerIndexOf(_dot(p, down)),
        col: layerIndexOf(_dot(p, right)),
        color: color,
      ));
    }
    colors.sort(
      (a, b) =>
          a.row != b.row ? a.row.compareTo(b.row) : a.col.compareTo(b.col),
    );
    return [for (final c in colors) c.color];
  }

  /// A face is solved when all of its stickers share one color; the cube is
  /// solved when every face is (whole-cube orientation does not matter).
  bool get isSolved => kFaceNormals.every((normal) {
    final colors = faceColors(normal);
    return colors.length == size * size &&
        colors.every((c) => c == colors.first);
  });

  /// Generates a random scramble of [length] moves that avoids turning the
  /// same axis twice in a row (no cancelling or merging moves).
  static List<CubeMove> randomScramble(
    int size, {
    int? length,
    Random? random,
  }) {
    final rng = random ?? Random();
    final count = length ?? _defaultScrambleLength(size);
    final faces = ['U', 'D', 'R', 'L', 'F', 'B'];
    const suffixes = ['', "'", '2'];
    final maxWideDepth = size ~/ 2;
    final moves = <CubeMove>[];
    int? lastAxis;
    while (moves.length < count) {
      final face = faces[rng.nextInt(faces.length)];
      final move = () {
        final suffix = suffixes[rng.nextInt(suffixes.length)];
        if (size >= 4 && rng.nextInt(3) == 0) {
          final depth = 2 + rng.nextInt(maxWideDepth - 1);
          final prefix = depth == 2 ? '' : '$depth';
          return MoveNotation.parse('$prefix${face}w$suffix', size);
        }
        return MoveNotation.parse('$face$suffix', size);
      }();
      if (move.axis == lastAxis) continue;
      lastAxis = move.axis;
      moves.add(move);
    }
    return moves;
  }

  static int _defaultScrambleLength(int size) => switch (size) {
    2 => 11,
    3 => 20,
    4 => 40,
    5 => 60,
    _ => 80,
  };

  static int _dot(IVec3 a, IVec3 b) => a.$1 * b.$1 + a.$2 * b.$2 + a.$3 * b.$3;

  /// Screen-space "right" and "down" directions for a face seen from outside.
  static (IVec3, IVec3) _faceFrame(IVec3 normal) => switch (normal) {
    kNormalFront => ((1, 0, 0), (0, -1, 0)),
    kNormalBack => ((-1, 0, 0), (0, -1, 0)),
    kNormalRight => ((0, 0, -1), (0, -1, 0)),
    kNormalLeft => ((0, 0, 1), (0, -1, 0)),
    kNormalUp => ((1, 0, 0), (0, 0, 1)),
    _ => ((1, 0, 0), (0, 0, -1)),
  };
}
