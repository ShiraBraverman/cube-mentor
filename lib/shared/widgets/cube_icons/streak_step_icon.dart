import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// Daily streak badge: a glowing flame over a tiny cube, and a `1 -> 2 -> 3`
/// row of day steps where a checkmark hops from day to day. The steps run
/// in the reading direction (right to left in RTL).
class AnimatedStreakStepIcon extends AnimatedCubeIcon {
  const AnimatedStreakStepIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 3600);

  /// Check on day 1.
  @override
  double get restingValue => 0.08;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => StreakStepPainter(
    progress: progress,
    palette: palette,
    textDirection: textDirection,
  );
}

class StreakStepPainter extends CubeIconPainter {
  StreakStepPainter({
    required super.progress,
    required super.palette,
    super.textDirection,
  });

  static const _rowY = 0.8;
  static const _dot = 0.105;

  /// Loop: on day 1, hop, day 2, hop, day 3 (celebrate), fade, restart.
  static const _hop1 = (0.18, 0.32);
  static const _hop2 = (0.48, 0.62);
  static const _fadeOut = (0.88, 0.94);

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    final rtl = textDirection == TextDirection.rtl;
    double xOf(double step) => rtl ? 0.8 - step * 0.3 : 0.2 + step * 0.3;

    final h1 = easeInOut(phaseOf(t, _hop1.$1, _hop1.$2));
    final h2 = easeInOut(phaseOf(t, _hop2.$1, _hop2.$2));
    final fade = phaseOf(t, _fadeOut.$1, _fadeOut.$2);
    final fadeIn = phaseOf(t, 0.94, 1);
    final restart = fadeIn > 0;
    // Badge position along the row: 0, 1 or 2 (fractional mid-hop).
    final position = restart ? 0.0 : h1 + h2;
    final celebrate = t > _hop2.$2 && !restart
        ? bump(phaseOf(t, 0.62, 0.86))
        : 0.0;

    _paintFlame(canvas, t, celebrate);

    // Track between the days, filled up to the badge.
    final track = Paint()
      ..strokeWidth = 0.035
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(xOf(0), _rowY),
      Offset(xOf(2), _rowY),
      track..color = AppColors.textTertiary.withValues(alpha: 0.6),
    );
    if (position > 0 && fade < 1) {
      canvas.drawLine(
        Offset(xOf(0), _rowY),
        Offset(xOf(position), _rowY),
        track..color = AppColors.accentSecondary.withValues(alpha: 1 - fade),
      );
    }

    // Day steps; reached ones fill green (day 3 gold).
    for (var day = 0; day < 3; day++) {
      final reached =
          day == 0 || (!restart && position >= day - 0.001 && fade < 1);
      final fill = day == 2 ? AppColors.gold : AppColors.accentSecondary;
      final center = Offset(xOf(day.toDouble()), _rowY);
      final radius = _dot * (day == 2 ? 1 + 0.12 * celebrate : 1);
      if (reached && day == 2) {
        canvas.drawCircle(
          center,
          radius + 0.03,
          Paint()
            ..color = AppColors.gold.withValues(alpha: 0.4 + 0.4 * celebrate)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.04),
        );
      }
      canvas.drawCircle(
        center,
        radius,
        Paint()..color = reached ? fill : AppColors.surfaceRaised,
      );
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.02
          ..color = reached ? fill : AppColors.textTertiary,
      );
      _paintDigit(
        canvas,
        side,
        '${day + 1}',
        center,
        reached ? AppColors.onAccent : AppColors.textSecondary,
      );
    }

    // The hopping check, on a parabola above the row.
    final opacity = restart ? fadeIn : 1 - fade;
    if (opacity > 0) {
      final hop = bump(position - position.floorToDouble());
      final x = xOf(position);
      final y = _rowY - 0.2 - 0.16 * hop;
      final gold = position > 1.5;
      _paintCheckBadge(
        canvas,
        Offset(x, y),
        gold,
        opacity,
        1 + 0.15 * celebrate,
      );
    }
  }

  void _paintCheckBadge(
    Canvas canvas,
    Offset c,
    bool gold,
    double opacity,
    double scale,
  ) {
    final color = gold ? AppColors.gold : AppColors.accentSecondary;
    final r = 0.072 * scale;
    canvas.drawCircle(
      c,
      r + 0.02,
      Paint()
        ..color = color.withValues(alpha: 0.5 * opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.03),
    );
    canvas.drawCircle(c, r, Paint()..color = color.withValues(alpha: opacity));
    canvas.drawPath(
      Path()
        ..moveTo(c.dx - r * 0.45, c.dy + r * 0.02)
        ..lineTo(c.dx - r * 0.1, c.dy + r * 0.38)
        ..lineTo(c.dx + r * 0.48, c.dy - r * 0.32),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = r * 0.32
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = AppColors.onAccent.withValues(alpha: opacity),
    );
  }

  /// Flickering flame with a tiny cube at its heart.
  void _paintFlame(Canvas canvas, double t, double celebrate) {
    final flicker = 1 + 0.05 * sin(2 * pi * t * 3) + 0.08 * celebrate;
    const c = Offset(0.5, 0.3);
    canvas.drawCircle(
      c + const Offset(0, 0.04),
      0.17 * flicker,
      Paint()
        ..color = AppColors.accentWarm.withValues(alpha: 0.45 + 0.3 * celebrate)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.07),
    );
    final outer = _flame(c, 0.34 * flicker, 0.44 * flicker);
    canvas.drawPath(
      outer,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gold, AppColors.accentWarm, AppColors.danger],
        ).createShader(Rect.fromCenter(center: c, width: 0.36, height: 0.46)),
    );
    final inner = _flame(c + const Offset(0, 0.08), 0.2, 0.26 * flicker);
    canvas.drawPath(inner, Paint()..color = const Color(0xFFFFF0B0));

    final cube = MiniCube(
      Rect.fromCenter(
        center: c + const Offset(0, 0.12),
        width: 0.13,
        height: 0.13,
      ),
      depth: 0.25,
    );
    cube.paintBody(canvas);
    cube.paintTop(canvas, List.filled(9, sticker(StickerColor.white)));
    cube.paintSide(canvas, List.filled(9, sticker(StickerColor.red)));
    cube.paintFront(canvas, List.filled(9, sticker(StickerColor.green)));
  }

  static Path _flame(Offset c, double w, double h) => Path()
    ..moveTo(c.dx, c.dy - h / 2)
    ..cubicTo(
      c.dx + w * 0.12,
      c.dy - h * 0.22,
      c.dx + w / 2,
      c.dy - h * 0.08,
      c.dx + w / 2,
      c.dy + h * 0.18,
    )
    ..cubicTo(
      c.dx + w / 2,
      c.dy + h * 0.4,
      c.dx + w * 0.26,
      c.dy + h / 2,
      c.dx,
      c.dy + h / 2,
    )
    ..cubicTo(
      c.dx - w * 0.26,
      c.dy + h / 2,
      c.dx - w / 2,
      c.dy + h * 0.4,
      c.dx - w / 2,
      c.dy + h * 0.18,
    )
    ..cubicTo(
      c.dx - w / 2,
      c.dy - h * 0.02,
      c.dx - w * 0.22,
      c.dy - h * 0.1,
      c.dx - w * 0.1,
      c.dy - h * 0.28,
    )
    ..cubicTo(
      c.dx - w * 0.04,
      c.dy - h * 0.36,
      c.dx - w * 0.01,
      c.dy - h * 0.44,
      c.dx,
      c.dy - h / 2,
    )
    ..close();

  /// Day number, laid out at the real pixel size so it stays sharp.
  void _paintDigit(
    Canvas canvas,
    double side,
    String digit,
    Offset center,
    Color color,
  ) {
    if (side < 26) return; // Too small to read: the dots speak alone.
    final painter = TextPainter(
      text: TextSpan(
        text: digit,
        style: TextStyle(
          color: color,
          fontSize: side * 0.13,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    canvas.save();
    canvas.scale(1 / side);
    painter.paint(
      canvas,
      center * side - Offset(painter.width / 2, painter.height / 2),
    );
    canvas.restore();
    painter.dispose();
  }
}
