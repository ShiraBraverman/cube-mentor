import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/sticker_palette.dart';

/// Paints one frame of an animated cube icon.
///
/// Subclasses draw in a unit square (0..1 on both axes) via [paintIcon];
/// the base class centers and scales that square into the widget so every
/// icon stays crisp from 22 px dock glyphs up to 60 px card tiles.
abstract class CubeIconPainter extends CustomPainter {
  CubeIconPainter({
    required this.progress,
    required this.palette,
    this.textDirection = TextDirection.ltr,
  }) : super(repaint: progress);

  /// Animation phase in 0..1; repaints the icon without a rebuild.
  final Animation<double> progress;

  /// Screen color of every logical sticker color (see [StickerPalette]).
  final Map<StickerColor, Color> palette;

  /// Reading direction, for icons that show a progression.
  final TextDirection textDirection;

  /// Screen color of logical sticker [color].
  Color sticker(StickerColor color) => palette[color]!;

  @override
  void paint(Canvas canvas, Size size) {
    final side = size.shortestSide;
    if (side <= 0) return;
    canvas.save();
    canvas.translate((size.width - side) / 2, (size.height - side) / 2);
    canvas.scale(side);
    paintIcon(canvas, progress.value, side);
    canvas.restore();
  }

  /// Draws the frame at phase [t] in unit coordinates; [side] is the size
  /// in logical pixels, for the rare part (text) drawn unscaled.
  void paintIcon(Canvas canvas, double t, double side);

  @override
  bool shouldRepaint(covariant CubeIconPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.palette != palette ||
      oldDelegate.textDirection != textDirection;
}

/// Base of every animated mini-cube icon.
///
/// The animation loops only while it can be seen and is wanted: [animate]
/// is true, the platform does not ask for reduced motion, the enclosing
/// route is the current one and the subtree is not muted by [TickerMode]
/// (hidden tabs). Otherwise the icon rests on a representative still frame.
///
/// Placed in a tight box (e.g. [CubeIconTile]) the icon fills it;
/// otherwise it is [size] logical pixels square.
abstract class AnimatedCubeIcon extends StatefulWidget {
  const AnimatedCubeIcon({
    super.key,
    this.size = 28,
    this.animate = true,
    this.semanticLabel,
  });

  final double size;

  /// Whether the icon loops; false shows the resting frame.
  final bool animate;

  /// Optional accessibility label; icons are decorative without one.
  final String? semanticLabel;

  /// Length of one animation loop.
  Duration get period;

  /// Phase shown when the icon does not animate.
  double get restingValue;

  /// Painter for one frame.
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  );

  @override
  State<AnimatedCubeIcon> createState() => _AnimatedCubeIconState();
}

class _AnimatedCubeIconState extends State<AnimatedCubeIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.period,
    value: widget.restingValue,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(AnimatedCubeIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.period != widget.period) {
      _controller.duration = widget.period;
    }
    _sync();
  }

  void _sync() {
    final reducedMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    // A covered route keeps its widgets alive; pause their loops.
    final onTop = ModalRoute.isCurrentOf(context) ?? true;
    final run = widget.animate && !reducedMotion && onTop;
    if (run && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!run && _controller.isAnimating) {
      _controller.stop();
      _controller.value = widget.restingValue;
    } else if (!run) {
      _controller.value = widget.restingValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = RepaintBoundary(
      child: CustomPaint(
        size: Size.square(widget.size),
        painter: widget.createPainter(
          _controller,
          StickerPalette.of(context),
          Directionality.maybeOf(context) ?? TextDirection.ltr,
        ),
      ),
    );
    final label = widget.semanticLabel;
    return label == null
        ? ExcludeSemantics(child: icon)
        : Semantics(label: label, image: true, child: icon);
  }
}

/// Rounded glass tile behind a cube icon on cards, styled like `AccentIcon`
/// (accent gradient, accent border, optional glow).
class CubeIconTile extends StatelessWidget {
  const CubeIconTile({
    super.key,
    required this.child,
    this.accent = AppColors.accent,
    this.size = 52,
    this.glow = false,
  });

  /// The icon; it fills the tile's inner area.
  final Widget child;
  final Color accent;
  final double size;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.32),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accent.withValues(alpha: 0.30),
            accent.withValues(alpha: 0.10),
          ],
        ),
        border: Border.all(color: accent.withValues(alpha: 0.45)),
        boxShadow: glow
            ? [
                BoxShadow(
                  color: accent.withValues(alpha: 0.35),
                  blurRadius: 18,
                  spreadRadius: -4,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}

/// Progress of [t] through the window [start]..[end], clamped to 0..1.
double phaseOf(double t, double start, double end) =>
    ((t - start) / (end - start)).clamp(0.0, 1.0);

/// Smooth ease in and out.
double easeInOut(double x) => Curves.easeInOutCubic.transform(x.clamp(0, 1));

/// 0..1..0 bump, peaking at x = 0.5.
double bump(double x) => sin(pi * x.clamp(0, 1));

/// Four-point sparkle star.
void paintSparkle(Canvas canvas, Offset c, double r, Color color) {
  final k = r * 0.28;
  canvas.drawPath(
    Path()
      ..moveTo(c.dx, c.dy - r)
      ..quadraticBezierTo(c.dx + k, c.dy - k, c.dx + r, c.dy)
      ..quadraticBezierTo(c.dx + k, c.dy + k, c.dx, c.dy + r)
      ..quadraticBezierTo(c.dx - k, c.dy + k, c.dx - r, c.dy)
      ..quadraticBezierTo(c.dx - k, c.dy - k, c.dx, c.dy - r)
      ..close(),
    Paint()..color = color,
  );
}
