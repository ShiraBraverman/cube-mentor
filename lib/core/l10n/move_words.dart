import '../cube/cube_move.dart';
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

/// Localized color name ("white", "לבן").
String colorName(AppLocalizations l10n, StickerColor color) => switch (color) {
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
  StickerColor front,
) => l10n.holdPrompt(colorName(l10n, top), colorName(l10n, front));
