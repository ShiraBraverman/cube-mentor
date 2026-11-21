import 'cube_state.dart';

/// Which colors sit opposite each other on the user's physical cube.
///
/// The cube model, solvers and lessons always work in *logical* colors,
/// laid out like the Western scheme (white opposite yellow, green opposite
/// blue). A scheme maps those logical colors to the colors the user's cube
/// actually shows, so rendering, color names and the scanner match the
/// cube in their hands.
enum CubeColorScheme {
  /// White opposite yellow, green opposite blue (the default).
  western,

  /// White opposite blue, yellow opposite green: Western with blue and
  /// yellow swapped.
  japanese;

  /// The color a sticker of [logical] color shows on a cube in this scheme.
  StickerColor shown(StickerColor logical) => switch (this) {
    western => logical,
    japanese => switch (logical) {
      StickerColor.yellow => StickerColor.blue,
      StickerColor.blue => StickerColor.yellow,
      final other => other,
    },
  };

  /// The logical color of a sticker that physically shows [physical]
  /// (e.g. as classified by the scanner). Both schemes are involutions,
  /// so this is the same swap as [shown].
  StickerColor logicalOf(StickerColor physical) => shown(physical);

  /// Stable storage name; unknown names fall back to [western].
  static CubeColorScheme fromName(String? name) => CubeColorScheme.values
      .firstWhere((s) => s.name == name, orElse: () => western);
}
