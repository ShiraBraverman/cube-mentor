import 'dart:ui' as ui;

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_geometry.dart';
import 'move_arrow.dart';

export 'cube_geometry.dart';

/// Paints an n x n x n cube frame produced by [CubeScene].
class CubePainter extends CustomPainter {
  CubePainter({
    required this.frame,
    this.guide,
    this.guidePhase = 0,
    Map<StickerColor, Color>? palette,
    super.repaint,
  }) : palette = palette ?? AppColors.stickers;

  final CubeFrame frame;

  /// Move to point out with a curved arrow, if any.
  final CubeMove? guide;

  /// Animation phase of the guide arrow, in `[0, 1)`.
  final double guidePhase;

  /// Screen color of each logical sticker color (see [StickerPalette]).
  final Map<StickerColor, Color> palette;

  static const double _stickerInset = 0.86;
  static const Color _mutedSticker = Color(0xFF3A3F4B);
  static const double _cornerRound = 0.2;

  final Paint _fill = Paint()..isAntiAlias = true;
  final Paint _stroke = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;
    _paintShadow(canvas, size);
    final faces = CubeScene.build(frame, size);
    if (frame.xray) {
      _paintXray(canvas, faces);
    } else {
      _paintOpaque(canvas, faces);
    }
    final guide = this.guide;
    if (guide != null) {
      MoveArrow.paint(canvas, size, frame, guide, guidePhase);
    }
  }

  void _paintOpaque(Canvas canvas, List<ProjectedFace> faces) {
    final hasTargets = frame.highlighted.isNotEmpty;
    final hasHighlights = hasTargets || frame.focus.isNotEmpty;
    for (final face in faces) {
      _fill.color = _shaded(AppColors.cubeBody, face.shade);
      canvas.drawPath(_polygon(face.quad), _fill);

      final color = face.color;
      if (color == null) continue;
      final id = face.cubie.id;
      final isHighlighted = frame.highlighted.contains(id);
      final inFocus = frame.focus.contains(id);
      final muted = frame.muted.contains(id);
      var stickerColor = _shaded(
        muted ? _mutedSticker : palette[color]!,
        face.shade,
      );
      // Gray pieces stay flat: neither dimmed further nor outlined.
      if (!muted && hasHighlights && !isHighlighted) {
        if (!inFocus) {
          // Not relevant right now: washed out and stepped back, still
          // readable as its color.
          stickerColor = Color.lerp(
            _desaturated(stickerColor, 0.55),
            AppColors.cubeBody,
            0.5,
          )!;
        } else if (hasTargets) {
          // The layer to turn stays clear, a notch under the targets.
          stickerColor = _desaturated(stickerColor, 0.2);
        }
      }
      final stickerPath = _roundedSticker(face.quad);
      if (hasTargets && isHighlighted && face.frontFacing) {
        // A soft halo behind the target piece.
        _glow.color = AppColors.gold.withValues(alpha: 0.55);
        canvas.drawPath(stickerPath, _glow);
      }
      _fill.color = stickerColor;
      canvas.drawPath(stickerPath, _fill);
      if (hasTargets && isHighlighted) {
        _stroke
          ..color = Colors.white.withValues(alpha: 0.95)
          ..strokeWidth = 2;
        canvas.drawPath(stickerPath, _stroke);
      }
    }
  }

  final Paint _glow = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 6
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

  /// [color] moved [amount] of the way toward its own gray.
  static Color _desaturated(Color color, double amount) {
    final luma = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
    final gray = Color.from(alpha: color.a, red: luma, green: luma, blue: luma);
    return Color.lerp(color, gray, amount)!;
  }

  void _paintXray(Canvas canvas, List<ProjectedFace> faces) {
    for (final face in faces) {
      final path = _roundedSticker(face.quad);
      _fill.color = _shaded(
        palette[face.color]!,
        face.shade,
      ).withValues(alpha: face.frontFacing ? 0.55 : 0.35);
      canvas.drawPath(path, _fill);
      _stroke
        ..color = Colors.white.withValues(alpha: face.frontFacing ? 0.35 : 0.15)
        ..strokeWidth = 1;
      canvas.drawPath(path, _stroke);
    }
  }

  void _paintShadow(Canvas canvas, Size size) {
    final scale =
        CubeProjection.focalLength(size) / CubeProjection.cameraDistance;
    final center = Offset(size.width / 2, size.height / 2 + scale * 1.55);
    final width = scale * 2.6;
    final height = scale * 0.5;
    final shadow = Paint()
      ..shader = ui.Gradient.radial(center, width / 2, [
        Colors.black.withValues(alpha: 0.45),
        Colors.transparent,
      ]);
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(1, height / width);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawCircle(center, width / 2, shadow);
    canvas.restore();
  }

  static Color _shaded(Color color, double shade) => Color.from(
    alpha: color.a,
    red: color.r * shade,
    green: color.g * shade,
    blue: color.b * shade,
  );

  static Path _polygon(List<Offset> pts) => Path()
    ..moveTo(pts[0].dx, pts[0].dy)
    ..lineTo(pts[1].dx, pts[1].dy)
    ..lineTo(pts[2].dx, pts[2].dy)
    ..lineTo(pts[3].dx, pts[3].dy)
    ..close();

  /// Inset quad with rounded corners (approximated with quadratic curves so
  /// it stays correct under perspective).
  static Path _roundedSticker(List<Offset> quad) {
    final center = (quad[0] + quad[1] + quad[2] + quad[3]) / 4;
    final p = [for (final q in quad) center + (q - center) * _stickerInset];
    final path = Path();
    for (var i = 0; i < 4; i++) {
      final corner = p[i];
      final a = Offset.lerp(corner, p[(i + 3) % 4], _cornerRound)!;
      final b = Offset.lerp(corner, p[(i + 1) % 4], _cornerRound)!;
      if (i == 0) {
        path.moveTo(a.dx, a.dy);
      } else {
        path.lineTo(a.dx, a.dy);
      }
      path.quadraticBezierTo(corner.dx, corner.dy, b.dx, b.dy);
    }
    return path..close();
  }

  @override
  bool shouldRepaint(CubePainter oldDelegate) =>
      oldDelegate.frame != frame ||
      oldDelegate.guide != guide ||
      oldDelegate.guidePhase != guidePhase ||
      oldDelegate.palette != palette;
}
