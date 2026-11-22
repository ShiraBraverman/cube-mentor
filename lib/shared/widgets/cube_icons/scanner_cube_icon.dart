import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// A mini-cube inside view-finder brackets with a glowing laser line
/// sweeping up and down across it, lighting the stickers it passes.
class AnimatedScannerCubeIcon extends AnimatedCubeIcon {
  const AnimatedScannerCubeIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 2600);

  /// Laser across the middle row.
  @override
  double get restingValue => 0.25;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => ScannerCubePainter(progress: progress, palette: palette);
}

class ScannerCubePainter extends CubeIconPainter {
  ScannerCubePainter({required super.progress, required super.palette});

  static const _laser = AppColors.accentSecondary;

  static const _w = StickerColor.white, _y = StickerColor.yellow;
  static const _g = StickerColor.green, _b = StickerColor.blue;
  static const _r = StickerColor.red, _o = StickerColor.orange;

  static const _front = [_g, _r, _w, _b, _g, _y, _o, _g, _r];
  static const _top = [_w, _y, _w, _o, _w, _b, _w, _g, _w];
  static const _side = [_r, _b, _r, _y, _r, _o, _r, _w, _r];

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    _paintBrackets(canvas, t);

    final cube = MiniCube(const Rect.fromLTWH(0.23, 0.23, 0.54, 0.54));
    cube.paintBody(canvas);
    cube.paintTop(canvas, [for (final c in _top) sticker(c)]);
    cube.paintSide(canvas, [for (final c in _side) sticker(c)]);

    // Smooth up-and-down sweep over the whole cube.
    final y = 0.24 + 0.52 * (0.5 - 0.5 * cos(2 * pi * t));
    for (var i = 0; i < 9; i++) {
      final col = (i % 3).toDouble(), row = (i ~/ 3).toDouble();
      final distance = (cube.cellCenter(col, row).dy - y).abs() / cube.cell;
      final lit = (1 - distance).clamp(0.0, 1.0);
      cube.paintTile(
        canvas,
        col,
        row,
        Color.lerp(sticker(_front[i]), Colors.white, 0.35 * lit)!,
        glow: 0.7 * lit,
        glowColor: _laser,
      );
    }

    // Soft beam band, then the bright line on top.
    const left = 0.12, right = 0.88;
    final band = Rect.fromLTRB(left, y - 0.08, right, y + 0.08);
    canvas.drawRect(
      band,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _laser.withValues(alpha: 0),
            _laser.withValues(alpha: 0.32),
            _laser.withValues(alpha: 0),
          ],
        ).createShader(band),
    );
    final line = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.035;
    canvas.drawLine(
      Offset(left, y),
      Offset(right, y),
      line
        ..color = _laser
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.025),
    );
    canvas.drawLine(
      Offset(left + 0.02, y),
      Offset(right - 0.02, y),
      Paint()
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 0.022
        ..color = Color.lerp(_laser, Colors.white, 0.55)!,
    );
  }

  /// Four L-shaped view-finder corners, breathing slightly.
  void _paintBrackets(Canvas canvas, double t) {
    final inset = 0.06 + 0.015 * sin(2 * pi * t * 2);
    const length = 0.2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.055
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = Color.lerp(_laser, Colors.white, 0.25)!;
    for (final (x, y, dx, dy) in [
      (inset, inset, 1.0, 1.0),
      (1 - inset, inset, -1.0, 1.0),
      (inset, 1 - inset, 1.0, -1.0),
      (1 - inset, 1 - inset, -1.0, -1.0),
    ]) {
      canvas.drawPath(
        Path()
          ..moveTo(x, y + dy * length)
          ..lineTo(x, y)
          ..lineTo(x + dx * length, y),
        paint,
      );
    }
  }
}
