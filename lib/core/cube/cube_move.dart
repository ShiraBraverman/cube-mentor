/// Cube move notation and its geometric interpretation.
///
/// Coordinate system (shared by the model and the renderer):
/// * +x points to the Right face, +y to the Up face, +z to the Front face.
/// * Layers along an axis are indexed `0..n-1`, index 0 being the negative
///   side (L, D, B) and index `n-1` the positive side (R, U, F).
/// * A quarter turn count `q` is a rotation of `q * 90deg` counter-clockwise
///   around the positive axis (right-hand rule).
library;

/// One of the six outer faces of a cube.
enum CubeFace {
  up('U', 1, true),
  down('D', 1, false),
  right('R', 0, true),
  left('L', 0, false),
  front('F', 2, true),
  back('B', 2, false);

  const CubeFace(this.letter, this.axis, this.positive);

  /// Standard (WCA) single-letter notation.
  final String letter;

  /// Axis index: 0 = x, 1 = y, 2 = z.
  final int axis;

  /// Whether the outward normal points along the positive axis.
  final bool positive;

  static CubeFace? fromLetter(String letter) {
    for (final face in CubeFace.values) {
      if (face.letter == letter) return face;
    }
    return null;
  }
}

/// A single move expressed in notation-independent geometric terms.
///
/// Rotates every cubie whose layer index along [axis] lies in
/// `[fromLayer, toLayer]` by `quarterTurns * 90deg` around +[axis].
class CubeMove {
  const CubeMove({
    required this.axis,
    required this.fromLayer,
    required this.toLayer,
    required this.quarterTurns,
    required this.notation,
  }) : assert(axis >= 0 && axis <= 2),
       assert(fromLayer <= toLayer),
       assert(quarterTurns >= 1 && quarterTurns <= 3);

  final int axis;
  final int fromLayer;
  final int toLayer;

  /// Counter-clockwise quarter turns around +axis, normalized to 1..3.
  final int quarterTurns;

  /// Human-readable notation (e.g. `R'`, `2Rw2`, `M`, `y`).
  final String notation;

  /// Whether this move is a half turn (180deg).
  bool get isHalfTurn => quarterTurns == 2;

  /// Signed rotation angle in quarter turns, in the range -1..2. Used by the
  /// animator so a prime move visibly turns the "short way".
  int get signedQuarterTurns => quarterTurns == 3 ? -1 : quarterTurns;

  /// Whether a cubie at [layerIndex] along [axis] participates in the move.
  bool affectsLayer(int layerIndex) =>
      layerIndex >= fromLayer && layerIndex <= toLayer;

  /// The move that exactly undoes this one.
  CubeMove get inverse => CubeMove(
    axis: axis,
    fromLayer: fromLayer,
    toLayer: toLayer,
    quarterTurns: 4 - quarterTurns,
    notation: _invertNotation(notation),
  );

  static String _invertNotation(String notation) {
    if (notation.endsWith('2')) return notation;
    if (notation.endsWith("'")) {
      return notation.substring(0, notation.length - 1);
    }
    return "$notation'";
  }

  @override
  bool operator ==(Object other) =>
      other is CubeMove &&
      other.axis == axis &&
      other.fromLayer == fromLayer &&
      other.toLayer == toLayer &&
      other.quarterTurns == quarterTurns;

  @override
  int get hashCode => Object.hash(axis, fromLayer, toLayer, quarterTurns);

  @override
  String toString() => notation;
}

/// Thrown when a notation token cannot be interpreted for a cube size.
class MoveParseException implements FormatException {
  MoveParseException(this.message, [this.source]);

  @override
  final String message;

  @override
  final String? source;

  @override
  int? get offset => null;

  @override
  String toString() => 'MoveParseException: $message ($source)';
}

/// Parses WCA-style notation for an n x n x n cube.
///
/// Supported tokens:
/// * Face turns: `R`, `U'`, `F2`
/// * Wide turns: `Rw` (2 layers), `3Rw` (3 layers), lowercase `r` (= `Rw`)
/// * Single inner slices: `2R`, `3U'`
/// * Middle slices on odd cubes: `M`, `E`, `S`
/// * Whole-cube rotations: `x`, `y`, `z`
class MoveNotation {
  MoveNotation._();

  static final RegExp _token = RegExp(
    r"^(\d+)?([UDLRFBudlrfbMESxyz])(w)?(2'|2|')?$",
  );

  /// Parses a whitespace-separated move sequence.
  static List<CubeMove> parseSequence(String sequence, int size) => sequence
      .trim()
      .split(RegExp(r'\s+'))
      .where((t) => t.isNotEmpty)
      .map((t) => parse(t, size))
      .toList(growable: false);

  /// Parses a single move token for a cube of [size].
  static CubeMove parse(String token, int size) {
    final match = _token.firstMatch(token);
    if (match == null) throw MoveParseException('Unknown move', token);

    final prefix = match.group(1);
    final letter = match.group(2)!;
    final isWide = match.group(3) != null;
    final suffix = match.group(4) ?? '';

    // Clockwise turns count as one quarter turn in the face's own frame.
    final turnsInFaceFrame = switch (suffix) {
      "'" => 3,
      '2' || "2'" => 2,
      _ => 1,
    };
    final depthPrefix = prefix == null ? null : int.parse(prefix);

    // Whole-cube rotations follow R (x), U (y) and F (z).
    if (letter == 'x' || letter == 'y' || letter == 'z') {
      if (depthPrefix != null || isWide) {
        throw MoveParseException('Rotations take no prefix', token);
      }
      final face = switch (letter) {
        'x' => CubeFace.right,
        'y' => CubeFace.up,
        _ => CubeFace.front,
      };
      return _build(face, 0, size - 1, turnsInFaceFrame, token, size,
          rangeIsAbsolute: true);
    }

    // Middle slices follow L (M), D (E) and F (S); odd cubes only.
    if (letter == 'M' || letter == 'E' || letter == 'S') {
      if (size.isEven || size < 3) {
        throw MoveParseException('Slice moves need an odd cube', token);
      }
      if (depthPrefix != null || isWide) {
        throw MoveParseException('Slice moves take no prefix', token);
      }
      final face = switch (letter) {
        'M' => CubeFace.left,
        'E' => CubeFace.down,
        _ => CubeFace.front,
      };
      final middle = size ~/ 2;
      return _build(face, middle, middle, turnsInFaceFrame, token, size,
          rangeIsAbsolute: true);
    }

    final isLowercaseWide = letter.toLowerCase() == letter;
    final face = CubeFace.fromLetter(letter.toUpperCase())!;
    final wide = isWide || isLowercaseWide;
    if (isWide && isLowercaseWide) {
      throw MoveParseException('Use either "w" or lowercase', token);
    }

    // Depths are 1-based counts measured from the face inward.
    int nearDepth;
    int farDepth;
    if (wide) {
      nearDepth = 1;
      farDepth = depthPrefix ?? 2;
    } else {
      nearDepth = depthPrefix ?? 1;
      farDepth = nearDepth;
    }
    if (nearDepth < 1 || farDepth > size || (wide && farDepth < 2)) {
      throw MoveParseException('Layer depth out of range for ${size}x$size',
          token);
    }
    return _build(face, nearDepth - 1, farDepth - 1, turnsInFaceFrame, token,
        size);
  }

  /// Builds a move for [face]. When [rangeIsAbsolute] is false, `near`/`far`
  /// are 0-based depths from the face; otherwise they are absolute indices.
  static CubeMove _build(
    CubeFace face,
    int near,
    int far,
    int turnsInFaceFrame,
    String notation,
    int size, {
    bool rangeIsAbsolute = false,
  }) {
    int from;
    int to;
    if (rangeIsAbsolute) {
      from = near;
      to = far;
    } else if (face.positive) {
      from = size - 1 - far;
      to = size - 1 - near;
    } else {
      from = near;
      to = far;
    }
    // A clockwise turn seen from outside the face is a negative rotation
    // around its outward normal.
    final ccwAroundPositiveAxis = face.positive
        ? (4 - turnsInFaceFrame) % 4
        : turnsInFaceFrame % 4;
    return CubeMove(
      axis: face.axis,
      fromLayer: from,
      toLayer: to,
      quarterTurns: ccwAroundPositiveAxis,
      notation: notation,
    );
  }
}
