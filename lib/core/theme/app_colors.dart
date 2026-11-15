import 'package:material_ui/material_ui.dart';

import '../cube/cube_state.dart';

/// Central color palette for the dark glassmorphic design.
abstract final class AppColors {
  static const Color backgroundTop = Color(0xFF0B1024);
  static const Color backgroundBottom = Color(0xFF05060F);
  static const Color accent = Color(0xFF7C9CFF);
  static const Color accentSecondary = Color(0xFF4FE3C1);
  static const Color accentWarm = Color(0xFFFF8A65);
  static const Color textPrimary = Color(0xFFF2F4FF);
  static const Color textSecondary = Color(0xFFA9B0CC);

  static const Color glassFill = Color(0x1AFFFFFF);
  static const Color glassFillStrong = Color(0x29FFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color glassHighlight = Color(0x0FFFFFFF);

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
