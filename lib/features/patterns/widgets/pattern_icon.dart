import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';

/// Tile showing a tiny isometric 3x3 cube in the checkerboard pattern, so
/// the Pattern Library card says at a glance what "patterns" are. Styled
/// like `AccentIcon` (glass gradient, accent border, optional glow).
class PatternIcon extends StatelessWidget {
  const PatternIcon({
    super.key,
    this.color = AppColors.accent,
    this.size = 52,
    this.glow = false,
  });

  final Color color;
  final double size;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('pattern-icon'),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.32),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.30),
            color.withValues(alpha: 0.10),
          ],
        ),
        border: Border.all(color: color.withValues(alpha: 0.45)),
        boxShadow: glow
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.35),
                  blurRadius: 18,
                  spreadRadius: -4,
                ),
              ]
            : null,
      ),
      padding: EdgeInsets.all(size * 0.14),
      child: const CustomPaint(painter: CheckerboardCubePainter()),
    );
  }
}

/// Paints an isometric 3x3 cube whose three visible faces show the
/// checkerboard pattern (each face alternates with its opposite color).
class CheckerboardCubePainter extends CustomPainter {
  const CheckerboardCubePainter();

  static const _faces = [
    // Top, left (front) and right faces: own color, opposite color, and how
    // much the face is shaded (light from above).
    (StickerColor.white, StickerColor.yellow, 0.0),
    (StickerColor.green, StickerColor.blue, 0.12),
    (StickerColor.red, StickerColor.orange, 0.24),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final edge = min(size.width / (2 * cos(pi / 6)), size.height / 2);
    final center = Offset(size.width / 2, size.height / 2);
    final u = Offset(cos(pi / 6), sin(pi / 6)) * edge; // right, down
    final v = Offset(-cos(pi / 6), sin(pi / 6)) * edge; // left, down
    final w = Offset(0, edge); // straight down
    final top = center - w;

    // Dark cube body behind the stickers, like the plastic.
    final body = Path()
      ..moveTo(top.dx, top.dy)
      ..lineTo((top + u).dx, (top + u).dy)
      ..lineTo((top + u + w).dx, (top + u + w).dy)
      ..lineTo((center + w).dx, (center + w).dy)
      ..lineTo((top + v + w).dx, (top + v + w).dy)
      ..lineTo((top + v).dx, (top + v).dy)
      ..close();
    canvas.drawPath(body, Paint()..color = AppColors.cubeBody);

    final origins = [(top, u, v), (top + v, u, w), (center, u, w)];
    for (final (f, (origin, a, b)) in origins.indexed) {
      final (own, opposite, shade) = _faces[f];
      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          final base = AppColors.stickers[(i + j).isEven ? own : opposite]!;
          final color = Color.lerp(base, Colors.black, shade)!;
          canvas.drawPath(
            _sticker(origin, a / 3, b / 3, i, j),
            Paint()..color = color,
          );
        }
      }
    }
  }

  /// Sticker (i, j) of a face spanned by [a] and [b] (one sticker each),
  /// shrunk toward its middle to leave a thin black gap.
  Path _sticker(Offset origin, Offset a, Offset b, int i, int j) {
    const inset = 0.12;
    final corner = origin + a * i.toDouble() + b * j.toDouble();
    Offset at(double x, double y) => corner + a * x + b * y;
    final p0 = at(inset, inset);
    final p1 = at(1 - inset, inset);
    final p2 = at(1 - inset, 1 - inset);
    final p3 = at(inset, 1 - inset);
    return Path()
      ..moveTo(p0.dx, p0.dy)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..close();
  }

  @override
  bool shouldRepaint(CheckerboardCubePainter oldDelegate) => false;
}
