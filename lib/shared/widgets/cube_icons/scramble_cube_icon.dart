import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// A mixed-up mini-cube whose front stickers keep swapping places along
/// curved paths, between two curved motion arrows: a cube being scrambled.
class AnimatedScrambleCubeIcon extends AnimatedCubeIcon {
  const AnimatedScrambleCubeIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 4800);

  @override
  double get restingValue => 0.06;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => ScrambleCubePainter(progress: progress, palette: palette);
}

class ScrambleCubePainter extends CubeIconPainter {
  ScrambleCubePainter({required super.progress, required super.palette});

  static const _w = StickerColor.white, _y = StickerColor.yellow;
  static const _g = StickerColor.green, _b = StickerColor.blue;
  static const _r = StickerColor.red, _o = StickerColor.orange;

  static const _front = [_r, _g, _w, _y, _g, _b, _o, _w, _r];
  static const _top = [_g, _w, _o, _b, _w, _y, _w, _r, _g];
  static const _side = [_y, _b, _w, _r, _r, _g, _o, _y, _b];

  /// Opposite tiles orbit the center; each pair swaps twice per loop, so
  /// the face returns to its start and the loop is seamless.
  static const _swaps = [(0, 8), (2, 6), (1, 7), (3, 5)];

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    _paintArrows(canvas, t);

    final cube = MiniCube(const Rect.fromLTWH(0.2, 0.2, 0.6, 0.6));
    cube.paintBody(canvas);
    cube.paintTop(canvas, [for (final c in _top) sticker(c)]);
    cube.paintSide(canvas, [for (final c in _side) sticker(c)]);

    final steps = _swaps.length * 2;
    final step = min((t * steps).floor(), steps - 1);
    final local = t * steps - step;

    // Colors after the swaps already done this loop.
    final faces = [for (final c in _front) sticker(c)];
    for (var s = 0; s < step; s++) {
      final (a, b) = _swaps[s % _swaps.length];
      final tmp = faces[a];
      faces[a] = faces[b];
      faces[b] = tmp;
    }

    final (a, b) = _swaps[step % _swaps.length];
    for (var i = 0; i < 9; i++) {
      if (i == a || i == b) continue;
      cube.paintTile(canvas, (i % 3).toDouble(), (i ~/ 3).toDouble(), faces[i]);
    }

    // The swapping pair lifts off and travels on opposite arcs.
    final e = easeInOut(phaseOf(local, 0.12, 0.88));
    final lift = bump(e);
    Offset cellOf(int i) => Offset((i % 3).toDouble(), (i ~/ 3).toDouble());
    final from = cellOf(a), to = cellOf(b);
    final dir = to - from;
    final normal = Offset(-dir.dy, dir.dx) / dir.distance;
    for (final (start, end, color, sign) in [
      (from, to, faces[a], 1.0),
      (to, from, faces[b], -1.0),
    ]) {
      final p = Offset.lerp(start, end, e)! + normal * (sign * 0.75 * lift);
      cube.paintTile(
        canvas,
        p.dx,
        p.dy,
        color,
        scale: 1 + 0.16 * lift,
        shadow: lift > 0.05,
      );
    }
  }

  /// Two curved arrows in the cube's free corners, chasing each other.
  void _paintArrows(Canvas canvas, double t) {
    const center = Offset(0.5, 0.5);
    const radius = 0.44;
    const span = 1.15;
    final wobble = 0.14 * sin(2 * pi * t * 2);
    for (final (mid, color) in [
      (-3 * pi / 4, AppColors.accentSecondary),
      (pi / 4, AppColors.gold),
    ]) {
      final start = mid - span / 2 + wobble;
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.06
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        span,
        false,
        paint,
      );
      final end = start + span;
      final tip = center + Offset(cos(end), sin(end)) * radius;
      final tangent = Offset(-sin(end), cos(end));
      final normal = Offset(cos(end), sin(end));
      canvas.drawPath(
        Path()
          ..moveTo((tip + tangent * 0.09).dx, (tip + tangent * 0.09).dy)
          ..lineTo((tip + normal * 0.07).dx, (tip + normal * 0.07).dy)
          ..lineTo((tip - normal * 0.07).dx, (tip - normal * 0.07).dy)
          ..close(),
        Paint()..color = color,
      );
    }
  }
}
