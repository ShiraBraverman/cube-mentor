import 'package:material_ui/material_ui.dart';

import '../cube/color_scheme.dart';
import '../cube/cube_state.dart';
import 'app_colors.dart';

/// Screen colors of logical sticker colors under the user's
/// [CubeColorScheme]. Installed above every route in `app.dart`; without
/// one (isolated widget tests) the Western scheme is used.
class StickerPalette extends InheritedWidget {
  const StickerPalette({super.key, required this.scheme, required super.child});

  final CubeColorScheme scheme;

  /// Screen color of every logical sticker color in [scheme].
  static Map<StickerColor, Color> colorsFor(CubeColorScheme scheme) => {
    for (final color in StickerColor.values)
      color: AppColors.stickers[scheme.shown(color)]!,
  };

  /// The scheme in effect at [context].
  static CubeColorScheme schemeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StickerPalette>()?.scheme ??
      CubeColorScheme.western;

  /// Screen colors of logical sticker colors at [context].
  static Map<StickerColor, Color> of(BuildContext context) =>
      _palettes[schemeOf(context)]!;

  static final Map<CubeColorScheme, Map<StickerColor, Color>> _palettes = {
    for (final scheme in CubeColorScheme.values) scheme: colorsFor(scheme),
  };

  @override
  bool updateShouldNotify(StickerPalette oldWidget) =>
      scheme != oldWidget.scheme;
}
