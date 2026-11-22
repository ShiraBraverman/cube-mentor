import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// A stopwatch whose bezel is made of sticker-colored segments around a
/// mini-cube; the hand ticks around and lights the segments it passes.
class AnimatedTimerCubeIcon extends AnimatedCubeIcon {
  const AnimatedTimerCubeIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 4800);

  @override
  double get restingValue => 0.36;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => TimerCubePainter(progress: progress, palette: palette);
}

class TimerCubePainter extends CubeIconPainter {
  TimerCubePainter({required super.progress, required super.palette});

  static const _ticks = 12;
  static const _center = Offset(0.5, 0.55);
  static const _radius = 0.355;

  static const _bezel = [
    StickerColor.red,
    StickerColor.orange,
    StickerColor.yellow,
    StickerColor.green,
    StickerColor.blue,
    StickerColor.white,
  ];

  static const _w = StickerColor.white, _y = StickerColor.yellow;
  static const _g = StickerColor.green, _b = StickerColor.blue;
  static const _r = StickerColor.red, _o = StickerColor.orange;

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    // Hand: one tick per segment, each a quick eased step.
    final done = (t * _ticks).floor();
    final step = Curves.easeOutBack.transform(
      phaseOf(t * _ticks - done, 0, 0.35),
    );
    final angle = -pi / 2 + (done + step) * 2 * pi / _ticks;

    _paintCrown(canvas);

    // Dial face.
    canvas.drawCircle(
      _center,
      _radius + 0.03,
      Paint()..color = AppColors.backgroundTop,
    );

    // Bezel: one sticker-colored segment per tick, lit once passed.
    const gap = 0.12;
    const sweep = 2 * pi / _ticks;
    final rect = Rect.fromCircle(center: _center, radius: _radius);
    for (var i = 0; i < _ticks; i++) {
      final color = sticker(_bezel[i % _bezel.length]);
      final lit = i < done;
      final start = -pi / 2 + i * sweep + gap / 2;
      if (lit) {
        canvas.drawArc(
          rect,
          start,
          sweep - gap,
          false,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 0.075
            ..color = color.withValues(alpha: 0.6)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.025),
        );
      }
      canvas.drawArc(
        rect,
        start,
        sweep - gap,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.07
          ..color = lit ? color : color.withValues(alpha: 0.32),
      );
    }

    // Mini-cube in the dial.
    final cube = MiniCube(
      Rect.fromCenter(
        center: _center + const Offset(0, 0.01),
        width: 0.34,
        height: 0.34,
      ),
    );
    cube.paintBody(canvas);
    cube.paintTop(canvas, [
      for (final c in [_w, _o, _w, _b, _w, _w, _w, _g, _w]) sticker(c),
    ]);
    cube.paintSide(canvas, [
      for (final c in [_r, _r, _y, _r, _r, _r, _b, _r, _r]) sticker(c),
    ]);
    cube.paintFront(canvas, [
      for (final c in [_g, _g, _r, _g, _g, _g, _y, _g, _g]) sticker(c),
    ]);

    // The hand over everything, pivot on top.
    final tip = _center + Offset(cos(angle), sin(angle)) * (_radius - 0.07);
    canvas.drawLine(
      _center,
      tip,
      Paint()
        ..strokeWidth = 0.05
        ..strokeCap = StrokeCap.round
        ..color = AppColors.onAccent,
    );
    canvas.drawLine(
      _center,
      tip,
      Paint()
        ..strokeWidth = 0.028
        ..strokeCap = StrokeCap.round
        ..color = AppColors.danger,
    );
    canvas.drawCircle(_center, 0.04, Paint()..color = AppColors.textPrimary);
    canvas.drawCircle(_center, 0.018, Paint()..color = AppColors.danger);
  }

  /// Start button and stem on top, plus a small side pusher.
  void _paintCrown(Canvas canvas) {
    final metal = Paint()..color = AppColors.textSecondary;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0.42, 0.06, 0.16, 0.07),
        const Radius.circular(0.025),
      ),
      metal,
    );
    canvas.drawRect(const Rect.fromLTWH(0.475, 0.12, 0.05, 0.06), metal);
    canvas.save();
    canvas.translate(_center.dx, _center.dy);
    canvas.rotate(pi / 4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: const Offset(0, -_radius - 0.05),
          width: 0.07,
          height: 0.06,
        ),
        const Radius.circular(0.015),
      ),
      metal,
    );
    canvas.restore();
  }
}
