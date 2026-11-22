import 'package:material_ui/material_ui.dart';

import '../../../core/theme/app_colors.dart';

/// A 2.5D 3x3 mini-cube for icons: a square front face with the top and
/// right faces sheared behind it. The big front face keeps stickers legible
/// at small sizes, the slanted faces read as "cube".
///
/// Sticker lists are 9 colors in row-major order: front and right faces
/// top-left first; the top face back-left first.
class MiniCube {
  MiniCube(Rect box, {double depth = 0.3})
    : front = Rect.fromLTWH(
        box.left,
        box.top + box.width / (1 + depth) * depth,
        box.width / (1 + depth),
        box.width / (1 + depth),
      ),
      offset = Offset(
        box.width / (1 + depth) * depth,
        -box.width / (1 + depth) * depth,
      );

  /// The front face.
  final Rect front;

  /// Shift from the front face to the back face (up and right).
  final Offset offset;

  /// Side of one front sticker cell.
  double get cell => front.width / 3;

  static const double _inset = 0.11;

  /// Outline of the whole cube.
  Path get silhouette => Path()
    ..moveTo(front.left, front.top)
    ..lineTo(front.left + offset.dx, front.top + offset.dy)
    ..lineTo(front.right + offset.dx, front.top + offset.dy)
    ..lineTo(front.right + offset.dx, front.bottom + offset.dy)
    ..lineTo(front.right, front.bottom)
    ..lineTo(front.left, front.bottom)
    ..close();

  /// Center of front cell ([col], [row]); fractional values move between
  /// cells.
  Offset cellCenter(double col, double row) =>
      front.topLeft + Offset((col + 0.5) * cell, (row + 0.5) * cell);

  /// The corner where front, top and right faces meet.
  Offset get topFrontRight => front.topRight;

  /// Dark plastic body with a faint rim so it reads on the dark canvas.
  void paintBody(Canvas canvas, {double opacity = 1}) {
    final path = silhouette;
    canvas.drawPath(
      path,
      Paint()..color = AppColors.cubeBody.withValues(alpha: opacity),
    );
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = cell * 0.08
        ..strokeJoin = StrokeJoin.round
        ..color = Colors.white.withValues(alpha: 0.22 * opacity),
    );
  }

  /// Top face stickers, lit from above.
  void paintTop(Canvas canvas, List<Color> colors, {double lift = 0.10}) {
    final w = Offset(front.width, 0);
    Offset at(double u, double v) => front.topLeft + w * u + offset * (1 - v);
    _paintFace(canvas, colors, at, (c) => Color.lerp(c, Colors.white, lift)!);
  }

  /// Right face stickers, in shade.
  void paintSide(Canvas canvas, List<Color> colors, {double shade = 0.30}) {
    final h = Offset(0, front.height);
    Offset at(double u, double v) => front.topRight + offset * u + h * v;
    _paintFace(canvas, colors, at, (c) => Color.lerp(c, Colors.black, shade)!);
  }

  void _paintFace(
    Canvas canvas,
    List<Color> colors,
    Offset Function(double u, double v) at,
    Color Function(Color) tone,
  ) {
    final paint = Paint();
    for (var row = 0; row < 3; row++) {
      for (var col = 0; col < 3; col++) {
        double u(double x) => (col + x) / 3;
        double v(double y) => (row + y) / 3;
        const a = _inset, b = 1 - _inset;
        final p0 = at(u(a), v(a));
        final p1 = at(u(b), v(a));
        final p2 = at(u(b), v(b));
        final p3 = at(u(a), v(b));
        canvas.drawPath(
          Path()
            ..moveTo(p0.dx, p0.dy)
            ..lineTo(p1.dx, p1.dy)
            ..lineTo(p2.dx, p2.dy)
            ..lineTo(p3.dx, p3.dy)
            ..close(),
          paint..color = tone(colors[row * 3 + col]),
        );
      }
    }
  }

  /// All nine front stickers in place.
  void paintFront(Canvas canvas, List<Color> colors) {
    for (var i = 0; i < 9; i++) {
      paintTile(canvas, (i % 3).toDouble(), (i ~/ 3).toDouble(), colors[i]);
    }
  }

  /// One front sticker centered on cell ([col], [row]). [scaleX] flips it
  /// edge-on, [glow] adds a soft halo of [glowColor] (default: its color).
  void paintTile(
    Canvas canvas,
    double col,
    double row,
    Color color, {
    double scale = 1,
    double scaleX = 1,
    double glow = 0,
    Color? glowColor,
    bool shadow = false,
  }) {
    final center = cellCenter(col, row);
    final side = cell * (1 - 2 * _inset) * scale;
    final rect = Rect.fromCenter(
      center: center,
      width: side * scaleX.abs(),
      height: side,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(side * 0.2));
    if (shadow) {
      canvas.drawRRect(
        rrect.shift(Offset(0, cell * 0.12)),
        Paint()
          ..color = Colors.black.withValues(alpha: 0.45)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, cell * 0.12),
      );
    }
    if (glow > 0) {
      canvas.drawRRect(
        rrect.inflate(cell * 0.08),
        Paint()
          ..color = (glowColor ?? color).withValues(alpha: 0.85 * glow)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, cell * 0.22),
      );
    }
    canvas.drawRRect(rrect, Paint()..color = color);
    // Glossy top edge so stickers look like plastic, not flat squares.
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          rect.left + side * 0.14 * scaleX.abs(),
          rect.top + side * 0.12,
          rect.width * 0.72,
          side * 0.16,
        ),
        Radius.circular(side * 0.08),
      ),
      Paint()..color = Colors.white.withValues(alpha: 0.22),
    );
  }
}
