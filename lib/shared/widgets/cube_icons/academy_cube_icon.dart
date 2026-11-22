import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// A mini-cube wearing a golden graduation cap, the white cross on its
/// front face pulsing gently: the first thing every learner builds.
class AnimatedAcademyCubeIcon extends AnimatedCubeIcon {
  const AnimatedAcademyCubeIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 2800);

  /// Cross at full glow.
  @override
  double get restingValue => 0.25;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => AcademyCubePainter(progress: progress, palette: palette);
}

class AcademyCubePainter extends CubeIconPainter {
  AcademyCubePainter({required super.progress, required super.palette});

  static const _w = StickerColor.white, _y = StickerColor.yellow;
  static const _g = StickerColor.green, _b = StickerColor.blue;
  static const _r = StickerColor.red, _o = StickerColor.orange;

  /// White cross on the front; mixed corners.
  static const _front = [_g, _w, _r, _w, _w, _w, _b, _w, _o];
  static const _top = [_y, _b, _g, _o, _b, _y, _r, _b, _g];
  static const _side = [_r, _r, _y, _r, _r, _g, _r, _r, _b];
  static const _cross = {1, 3, 4, 5, 7};

  static const _capDark = Color(0xFFC79A2E);

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    final pulse = 0.5 + 0.5 * sin(2 * pi * t);

    final cube = MiniCube(const Rect.fromLTWH(0.18, 0.34, 0.6, 0.6));
    cube.paintBody(canvas);
    cube.paintTop(canvas, [for (final c in _top) sticker(c)]);
    cube.paintSide(canvas, [for (final c in _side) sticker(c)]);
    for (var i = 0; i < 9; i++) {
      final inCross = _cross.contains(i);
      cube.paintTile(
        canvas,
        (i % 3).toDouble(),
        (i ~/ 3).toDouble(),
        sticker(_front[i]),
        scale: inCross ? 1 + 0.07 * pulse : 1,
        glow: inCross ? 0.75 * pulse : 0,
        glowColor: Color.lerp(sticker(_w), AppColors.gold, 0.35),
      );
    }

    _paintCap(canvas, t);
  }

  /// Mortarboard resting on the cube, bobbing; its tassel swings.
  void _paintCap(Canvas canvas, double t) {
    final bob = -0.012 * sin(2 * pi * t);
    canvas.save();
    canvas.translate(0, bob);

    const cx = 0.52, cy = 0.2;
    // Glow under the cap.
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(cx, cy), width: 0.6, height: 0.2),
      Paint()
        ..color = AppColors.gold.withValues(alpha: 0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.05),
    );
    // Skull band below the board.
    canvas.drawPath(
      Path()
        ..moveTo(cx - 0.16, cy + 0.03)
        ..lineTo(cx + 0.16, cy + 0.03)
        ..lineTo(cx + 0.14, cy + 0.15)
        ..quadraticBezierTo(cx, cy + 0.19, cx - 0.14, cy + 0.15)
        ..close(),
      Paint()..color = _capDark,
    );
    // The board.
    final board = Path()
      ..moveTo(cx, cy - 0.11)
      ..lineTo(cx + 0.32, cy)
      ..lineTo(cx, cy + 0.11)
      ..lineTo(cx - 0.32, cy)
      ..close();
    canvas.drawPath(
      board,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFE89A), AppColors.gold],
        ).createShader(const Rect.fromLTWH(cx - 0.32, cy - 0.11, 0.64, 0.22)),
    );
    // Tassel: from the button to the edge, then hanging and swinging.
    final swing = 0.035 * sin(2 * pi * t + pi / 3);
    const edge = Offset(cx + 0.26, cy + 0.02);
    final end = Offset(edge.dx + swing, edge.dy + 0.15);
    final cord = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.025
      ..strokeCap = StrokeCap.round
      ..color = AppColors.accentWarm;
    canvas.drawPath(
      Path()
        ..moveTo(cx, cy)
        ..lineTo(edge.dx, edge.dy)
        ..quadraticBezierTo(
          edge.dx + swing * 0.3,
          edge.dy + 0.08,
          end.dx,
          end.dy,
        ),
      cord,
    );
    canvas.drawCircle(end, 0.03, Paint()..color = AppColors.accentWarm);
    canvas.drawCircle(const Offset(cx, cy), 0.025, Paint()..color = _capDark);
    canvas.restore();
  }
}
