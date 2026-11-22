import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// A mini-cube with one golden corner piece glowing softly, like a light
/// bulb with rays: "here is a smart hint".
class AnimatedHintCubeIcon extends AnimatedCubeIcon {
  const AnimatedHintCubeIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 2400);

  /// Corner at full glow.
  @override
  double get restingValue => 0.25;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => HintCubePainter(progress: progress, palette: palette);
}

class HintCubePainter extends CubeIconPainter {
  HintCubePainter({required super.progress, required super.palette});

  static const _bright = Color(0xFFFFF2B3);

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    final pulse = 0.5 + 0.5 * sin(2 * pi * t);
    final gold = Color.lerp(AppColors.gold, _bright, 0.6 * pulse)!;

    final cube = MiniCube(const Rect.fromLTWH(0.1, 0.26, 0.64, 0.64));
    final corner = cube.topFrontRight + cube.offset * 0.15;

    // Halo around the corner.
    canvas.drawCircle(
      corner,
      0.12 + 0.05 * pulse,
      Paint()
        ..color = AppColors.gold.withValues(alpha: 0.35 + 0.35 * pulse)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.07),
    );

    // Rays fanning up and to the right of the corner.
    final rays = Paint()
      ..strokeWidth = 0.04
      ..strokeCap = StrokeCap.round
      ..color = AppColors.gold.withValues(alpha: 0.55 + 0.45 * pulse);
    for (var i = 0; i < 4; i++) {
      final a = -pi * 0.62 + i * pi * 0.27;
      final dir = Offset(cos(a), sin(a));
      final from = corner + dir * (0.17 + 0.01 * pulse);
      final to = corner + dir * (0.22 + 0.05 * pulse);
      canvas.drawLine(from, to, rays);
    }

    // Everything but the corner is dimmed a little so the corner pops.
    Color dim(StickerColor c) =>
        Color.lerp(sticker(c), AppColors.cubeBody, 0.2)!;
    final top = List.filled(9, dim(StickerColor.white));
    final right = List.filled(9, dim(StickerColor.red));
    final front = List.filled(9, dim(StickerColor.green));
    top[8] = gold; // Front-right sticker of the top face.
    right[0] = gold; // Top-front sticker of the right face.

    cube.paintBody(canvas);
    cube.paintTop(canvas, top, lift: 0.04);
    cube.paintSide(canvas, right, shade: 0.12);
    for (var i = 0; i < 9; i++) {
      final isCorner = i == 2;
      cube.paintTile(
        canvas,
        (i % 3).toDouble(),
        (i ~/ 3).toDouble(),
        isCorner ? gold : front[i],
        scale: isCorner ? 1 + 0.06 * pulse : 1,
        glow: isCorner ? 0.9 * pulse : 0,
      );
    }
    paintSparkle(
      canvas,
      corner + const Offset(-0.05, -0.04),
      0.035 + 0.025 * pulse,
      Colors.white.withValues(alpha: 0.5 + 0.5 * pulse),
    );
  }
}
