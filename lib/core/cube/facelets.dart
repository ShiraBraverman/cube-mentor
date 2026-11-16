import 'cube_state.dart';

/// Face order of the facelet format shared with the native solvers.
const List<IVec3> kFaceletFaceOrder = [
  kNormalUp,
  kNormalRight,
  kNormalFront,
  kNormalDown,
  kNormalLeft,
  kNormalBack,
];

/// Single-letter code of each sticker color in the facelet format.
String stickerLetter(StickerColor color) => switch (color) {
  StickerColor.white => 'W',
  StickerColor.yellow => 'Y',
  StickerColor.green => 'G',
  StickerColor.blue => 'B',
  StickerColor.red => 'R',
  StickerColor.orange => 'O',
};

/// Inverse of [stickerLetter], or null for an unknown letter.
StickerColor? stickerColorOf(String letter) {
  for (final color in StickerColor.values) {
    if (stickerLetter(color) == letter) return color;
  }
  return null;
}

extension CubeFacelets on CubeState {
  /// Sticker colors as a `6 * size^2` string in U R F D L B face order, each
  /// face row-major as seen from outside (standard cube net). This is the
  /// input format of the native solvers (src/cpp/ffi_bridge.h).
  String toFacelets() => [
    for (final normal in kFaceletFaceOrder)
      for (final color in faceColors(normal)) stickerLetter(color),
  ].join();

  /// Id of the cubie whose center is at [position], or null.
  int? cubieIdAt(IVec3 position) {
    for (final cubie in cubies) {
      if (cubie.position == position) return cubie.id;
    }
    return null;
  }
}
