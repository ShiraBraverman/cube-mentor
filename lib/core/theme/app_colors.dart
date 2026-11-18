import 'package:material_ui/material_ui.dart';

import '../cube/cube_state.dart';

/// Central palette of the "gamer academy" look: an obsidian/slate canvas,
/// low-alpha glass surfaces and accents taken from the cube's own sticker
/// families (cobalt = blue, mint = green, ember = orange, gold = yellow,
/// signal = red) so the UI never fights the stickers on screen.
abstract final class AppColors {
  // Canvas.
  static const Color backgroundTop = Color(0xFF0C1120);
  static const Color backgroundBottom = Color(0xFF05070D);
  static const Color surface = Color(0xFF111728);
  static const Color surfaceRaised = Color(0xFF182036);

  // Accents.
  static const Color accent = Color(0xFF6E8BFF);
  static const Color accentSecondary = Color(0xFF3EE6B0);
  static const Color accentWarm = Color(0xFFFF9A4D);
  static const Color gold = Color(0xFFFFD15C);
  static const Color danger = Color(0xFFFF5D6C);

  /// Dark ink used on top of bright accent fills.
  static const Color onAccent = Color(0xFF070A14);

  // Text.
  static const Color textPrimary = Color(0xFFF1F4FB);
  static const Color textSecondary = Color(0xFF98A2BC);
  static const Color textTertiary = Color(0xFF6B7591);

  // Glass.
  static const Color glassFill = Color(0x0FFFFFFF);
  static const Color glassFillStrong = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x1FFFFFFF);
  static const Color glassHighlight = Color(0x08FFFFFF);

  /// Plastic body color of the cube.
  static const Color cubeBody = Color(0xFF111318);

  /// Sticker colors tuned to look vivid on a dark background.
  static const Map<StickerColor, Color> stickers = {
    StickerColor.white: Color(0xFFF5F7FA),
    StickerColor.yellow: Color(0xFFFFD43B),
    StickerColor.green: Color(0xFF2ECC71),
    StickerColor.blue: Color(0xFF3B82F6),
    StickerColor.red: Color(0xFFEF4444),
    StickerColor.orange: Color(0xFFFF8C1A),
  };
}

/// Spacing scale (4 pt grid). Screens use these instead of ad-hoc numbers.
abstract final class AppSpace {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Horizontal page gutter.
  static const double gutter = 20;

  /// Max content width on tablets and desktop.
  static const double maxWidth = 680;

  /// Minimum height of primary touch targets.
  static const double touch = 56;
}

/// Corner radii by hierarchy: chips < cards < hero panels.
abstract final class AppRadius {
  static const double sm = 14;
  static const double md = 20;
  static const double lg = 28;
  static const double pill = 999;
}
