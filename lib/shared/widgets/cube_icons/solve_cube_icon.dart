import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// A scrambled mini-cube whose stickers flip one by one into a solved,
/// glowing cube, crowned by sparkles and a checkmark badge.
class AnimatedSolveCubeIcon extends AnimatedCubeIcon {
  const AnimatedSolveCubeIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 3600);

  /// Solved, with the check showing.
  @override
  double get restingValue => 0.82;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => SolveCubePainter(progress: progress, palette: palette);
}

class SolveCubePainter extends CubeIconPainter {
  SolveCubePainter({required super.progress, required super.palette});

  static const _w = StickerColor.white, _y = StickerColor.yellow;
  static const _g = StickerColor.green, _b = StickerColor.blue;
  static const _r = StickerColor.red, _o = StickerColor.orange;

  static const _front = [_w, _g, _r, _b, _g, _o, _y, _r, _g];
  static const _top = [_o, _w, _g, _w, _w, _b, _r, _y, _w];
  static const _side = [_g, _r, _y, _b, _r, _w, _r, _o, _r];

  /// Stagger order of the flips: a diagonal wave from the top-left.
  static const _order = [0, 1, 3, 2, 4, 6, 5, 7, 8];

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    // Loop: scrambled (0-0.22) -> flips (0.22-0.6) -> celebrate (0.6-0.9)
    // -> blend back to scrambled (0.9-1).
    final back = easeInOut(phaseOf(t, 0.9, 1));
    final celebrate = phaseOf(t, 0.6, 0.72) * (1 - back);
    final faces = phaseOf(t, 0.3, 0.6);

    final cube = MiniCube(const Rect.fromLTWH(0.14, 0.18, 0.64, 0.64));

    // Aura behind the solved cube.
    if (celebrate > 0) {
      canvas.drawPath(
        cube.silhouette,
        Paint()
          ..color = AppColors.accentSecondary.withValues(
            alpha: 0.75 * celebrate,
          )
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.06),
      );
    }

    cube.paintBody(canvas);
    Color blend(StickerColor from, StickerColor to, double x) =>
        Color.lerp(sticker(from), sticker(to), x * (1 - back))!;
    cube.paintTop(canvas, [for (final c in _top) blend(c, _w, faces)]);
    cube.paintSide(canvas, [for (final c in _side) blend(c, _r, faces)]);

    for (final (k, i) in _order.indexed) {
      final start = 0.22 + k * 0.035;
      final p = phaseOf(t, start, start + 0.1);
      final flipped = p >= 0.5;
      final color = back > 0
          ? Color.lerp(sticker(_g), sticker(_front[i]), back)!
          : sticker(flipped ? _g : _front[i]);
      cube.paintTile(
        canvas,
        (i % 3).toDouble(),
        (i ~/ 3).toDouble(),
        color,
        scaleX: max(0.08, cos(pi * p).abs()),
        glow: 0.6 * celebrate,
        glowColor: AppColors.accentSecondary,
      );
    }

    if (celebrate > 0) {
      _paintSparkles(canvas, t, celebrate);
      _paintCheck(canvas, celebrate, phaseOf(t, 0.62, 0.74));
    }
  }

  void _paintSparkles(Canvas canvas, double t, double opacity) {
    const spots = [
      (Offset(0.12, 0.16), 0.07, 0.0),
      (Offset(0.9, 0.1), 0.055, 0.33),
      (Offset(0.08, 0.86), 0.05, 0.66),
    ];
    for (final (center, radius, delay) in spots) {
      final twinkle = 0.55 + 0.45 * sin(2 * pi * (t * 3 + delay));
      paintSparkle(
        canvas,
        center,
        radius * twinkle,
        AppColors.gold.withValues(alpha: opacity),
      );
    }
  }

  void _paintCheck(Canvas canvas, double opacity, double draw) {
    const center = Offset(0.8, 0.8);
    const radius = 0.15;
    canvas.drawCircle(
      center,
      radius + 0.02,
      Paint()
        ..color = AppColors.accentSecondary.withValues(alpha: 0.6 * opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.03),
    );
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = AppColors.accentSecondary.withValues(alpha: opacity),
    );
    // The check is drawn stroke by stroke.
    const a = Offset(0.73, 0.8), b = Offset(0.785, 0.855);
    const c = Offset(0.875, 0.745);
    final first = (draw * 2).clamp(0.0, 1.0);
    final second = (draw * 2 - 1).clamp(0.0, 1.0);
    final path = Path()..moveTo(a.dx, a.dy);
    final mid = Offset.lerp(a, b, first)!;
    path.lineTo(mid.dx, mid.dy);
    if (second > 0) {
      final end = Offset.lerp(b, c, second)!;
      path.lineTo(end.dx, end.dy);
    }
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.045
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = AppColors.onAccent.withValues(alpha: opacity),
    );
  }
}
