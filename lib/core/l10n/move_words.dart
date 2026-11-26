import '../cube/cube_move.dart';
import '../cube/color_scheme.dart';
import '../cube/cube_state.dart';
import 'generated/app_localizations.dart';

/// Plain-language subtitle for a move, e.g. "Turn the right face up" for
/// `R`, so beginners never have to decode notation.
String describeMove(AppLocalizations l10n, CubeMove move, int size) {
  final q = move.quarterTurns % 4;
  final half = q == 2;
  if (move.fromLayer == 0 && move.toLayer == size - 1) {
    // Rotations follow R (x), U (y) and F (z): clockwise is q == 3.
    final clockwise = q == 3;
    return switch (move.axis) {
      0 =>
        half
            ? l10n.moveRotateX2
            : (clockwise ? l10n.moveRotateX : l10n.moveRotateXPrime),
      1 =>
        half
            ? l10n.moveRotateY2
            : (clockwise ? l10n.moveRotateY : l10n.moveRotateYPrime),
      _ =>
        half
            ? l10n.moveRotateZ2
            : (clockwise ? l10n.moveRotateZ : l10n.moveRotateZPrime),
    };
  }
  final middle =
      size.isOdd && move.fromLayer == size ~/ 2 && move.toLayer == size ~/ 2;
  // M follows L, E follows D, S follows F; other layers are named from the
  // nearer face.
  final positive = middle
      ? move.axis == 2
      : move.fromLayer + move.toLayer >= size - 1;
  final letter = positive ? 'RUF'[move.axis] : 'LDB'[move.axis];
  final face = _faceName(l10n, letter);
  final String layer;
  if (middle) {
    layer = l10n.moveLayerMiddle;
  } else if (move.fromLayer == move.toLayer) {
    final depth = positive ? size - move.fromLayer : move.fromLayer + 1;
    layer = depth == 1 ? face : l10n.moveLayerInner(depth, face);
  } else if (move.toLayer == size - 1 || move.fromLayer == 0) {
    final depth = positive ? size - move.fromLayer : move.toLayer + 1;
    layer = l10n.moveLayerWide(depth, face);
  } else {
    final near = positive ? size - move.toLayer : move.fromLayer + 1;
    final far = positive ? size - move.fromLayer : move.toLayer + 1;
    layer = l10n.moveLayerBlock(near, far, face);
  }
  final clockwise = positive ? q == 3 : q == 1;
  final direction = half
      ? l10n.moveDirHalf
      : switch (letter) {
          'R' => clockwise ? l10n.moveDirUp : l10n.moveDirDown,
          'L' => clockwise ? l10n.moveDirDown : l10n.moveDirUp,
          'U' => clockwise ? l10n.moveDirLeft : l10n.moveDirRight,
          'D' => clockwise ? l10n.moveDirRight : l10n.moveDirLeft,
          'F' => clockwise ? l10n.moveDirClockwise : l10n.moveDirCounter,
          _ => clockwise ? l10n.moveDirBackClockwise : l10n.moveDirBackCounter,
        };
  return l10n.moveSentence(layer, direction);
}

String _faceName(AppLocalizations l10n, String letter) => switch (letter) {
  'R' => l10n.moveFaceR,
  'L' => l10n.moveFaceL,
  'U' => l10n.moveFaceU,
  'D' => l10n.moveFaceD,
  'F' => l10n.moveFaceF,
  _ => l10n.moveFaceB,
};

/// Localized name of the color a [logical] sticker shows on the user's
/// cube ("white", "לבן"); see [CubeColorScheme].
String colorName(
  AppLocalizations l10n,
  StickerColor logical, {
  CubeColorScheme scheme = CubeColorScheme.western,
}) => switch (scheme.shown(logical)) {
  StickerColor.white => l10n.colorWhite,
  StickerColor.yellow => l10n.colorYellow,
  StickerColor.green => l10n.colorGreen,
  StickerColor.blue => l10n.colorBlue,
  StickerColor.red => l10n.colorRed,
  StickerColor.orange => l10n.colorOrange,
};

/// "Hold the cube with the white center on top and the green center facing
/// you."
String holdPrompt(
  AppLocalizations l10n,
  StickerColor top,
  StickerColor front, {
  CubeColorScheme scheme = CubeColorScheme.western,
}) => l10n.holdPrompt(
  colorName(l10n, top, scheme: scheme),
  colorName(l10n, front, scheme: scheme),
);

/// Arrow shown with a move instruction, as the move looks from the front.
enum MoveArrow { up, down, left, right, clockwise, counterClockwise }

/// A move as plain words and an arrow ("Right side — Up", "Top row —
/// Left"), so the main UI never needs the notation letters.
class MoveInstruction {
  const MoveInstruction({
    required this.layer,
    required this.direction,
    required this.arrow,
    required this.half,
  });

  /// Which part turns: "Right side", "Top row", "Whole cube"...
  final String layer;

  /// Which way: "Up", "Clockwise", "Double turn (180°)"...
  final String direction;

  /// Way the arrow points; for a half turn, either way works.
  final MoveArrow arrow;

  /// A 180-degree turn.
  final bool half;

  /// "Right side — Up".
  String text(AppLocalizations l10n) => l10n.moveInstruction(layer, direction);
}

/// The short instruction and arrow for [move] on a cube of [size].
MoveInstruction moveInstruction(
  AppLocalizations l10n,
  CubeMove move,
  int size,
) {
  final q = move.quarterTurns % 4;
  final half = q == 2;
  final wholeCube = move.fromLayer == 0 && move.toLayer == size - 1;
  final middle =
      !wholeCube &&
      size.isOdd &&
      move.fromLayer == size ~/ 2 &&
      move.toLayer == size ~/ 2;
  // Rotations follow R, U and F; M follows L, E follows D, S follows F.
  final positive = wholeCube
      ? true
      : middle
      ? move.axis == 2
      : move.fromLayer + move.toLayer >= size - 1;
  final letter = positive ? 'RUF'[move.axis] : 'LDB'[move.axis];
  final face = _shortFace(l10n, letter);

  final String layer;
  if (wholeCube) {
    layer = l10n.dirWholeCube;
  } else if (middle) {
    layer = l10n.dirMiddle;
  } else if (move.fromLayer == move.toLayer) {
    final depth = positive ? size - move.fromLayer : move.fromLayer + 1;
    // An outer layer says exactly which row or column of the front face
    // moves ("Top row of the front face"); deeper layers count from it.
    layer = depth == 1
        ? _outerLayer(l10n, letter)
        : l10n.dirLayerInner(depth, face);
  } else if (move.toLayer == size - 1 || move.fromLayer == 0) {
    final depth = positive ? size - move.fromLayer : move.toLayer + 1;
    layer = l10n.dirLayerWide(depth, face);
  } else {
    final near = positive ? size - move.toLayer : move.fromLayer + 1;
    final far = positive ? size - move.fromLayer : move.toLayer + 1;
    layer = l10n.dirLayerBlock(near, far, face);
  }

  // A half turn shows the clockwise way; either way gets there.
  final clockwise = half || (positive ? q == 3 : q == 1);
  final (arrow, word) = switch (letter) {
    'R' =>
      clockwise ? (MoveArrow.up, l10n.dirUp) : (MoveArrow.down, l10n.dirDown),
    'L' =>
      clockwise ? (MoveArrow.down, l10n.dirDown) : (MoveArrow.up, l10n.dirUp),
    'U' =>
      clockwise
          ? (MoveArrow.left, l10n.dirLeft)
          : (MoveArrow.right, l10n.dirRight),
    'D' =>
      clockwise
          ? (MoveArrow.right, l10n.dirRight)
          : (MoveArrow.left, l10n.dirLeft),
    'F' =>
      clockwise
          ? (MoveArrow.clockwise, l10n.dirClockwise)
          : (MoveArrow.counterClockwise, l10n.dirCounter),
    _ =>
      clockwise
          ? (MoveArrow.counterClockwise, l10n.dirBackClockwise)
          : (MoveArrow.clockwise, l10n.dirBackCounter),
  };
  return MoveInstruction(
    layer: layer,
    direction: half ? l10n.dirHalf : word,
    arrow: arrow,
    half: half,
  );
}

/// One outer layer as seen on the front face: a row, a column, or the
/// front / back face itself.
String _outerLayer(AppLocalizations l10n, String letter) => switch (letter) {
  'R' => l10n.dirColumnRight,
  'L' => l10n.dirColumnLeft,
  'U' => l10n.dirRowTop,
  'D' => l10n.dirRowBottom,
  'F' => l10n.dirFaceF,
  _ => l10n.dirFaceB,
};

String _shortFace(AppLocalizations l10n, String letter) => switch (letter) {
  'R' => l10n.dirFaceR,
  'L' => l10n.dirFaceL,
  'U' => l10n.dirFaceU,
  'D' => l10n.dirFaceD,
  'F' => l10n.dirFaceF,
  _ => l10n.dirFaceB,
};
