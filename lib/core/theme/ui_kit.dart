import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../cube/cube_state.dart';
import 'app_colors.dart';

/// Shared building blocks so every screen uses the same header, badge,
/// progress bar and page frame.

/// Centered, width-capped page body with the standard gutter.
class PageFrame extends StatelessWidget {
  const PageFrame({super.key, required this.child, this.maxWidth});

  final Widget child;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? AppSpace.maxWidth),
        child: child,
      ),
    );
  }
}

/// Standard list padding for scrolling pages.
const EdgeInsetsDirectional kPagePadding = EdgeInsetsDirectional.fromSTEB(
  AppSpace.gutter,
  AppSpace.xs,
  AppSpace.gutter,
  AppSpace.xxl,
);

/// A section title with optional supporting line, spaced for a new block.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.top = AppSpace.xl,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final double top;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsetsDirectional.only(top: top, bottom: AppSpace.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleLarge),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!, style: textTheme.bodySmall),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AppSpace.sm),
            trailing!,
          ],
        ],
      ),
    );
  }
}

/// Rounded square holding an icon in an accent tint.
class AccentIcon extends StatelessWidget {
  const AccentIcon({
    super.key,
    required this.icon,
    required this.color,
    this.size = 52,
    this.glow = false,
  });

  final IconData icon;
  final Color color;
  final double size;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Icon(icon, color: color, size: size * 0.48),
    );
  }
}

/// Small rounded label, e.g. "Advanced" or a streak count.
class AppPill extends StatelessWidget {
  const AppPill({
    super.key,
    required this.label,
    this.color = AppColors.textSecondary,
    this.icon,
    this.filled = false,
  });

  final String label;
  final Color color;
  final IconData? icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final ink = filled ? AppColors.onAccent : color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        color: filled ? color : color.withValues(alpha: 0.14),
        border: Border.all(color: color.withValues(alpha: filled ? 1 : 0.4)),
      ),
      // Flexible in bounded space (wraps, cards); capped in unbounded rows
      // such as app bar actions. Long translations ellipsize either way.
      child: LayoutBuilder(
        builder: (context, constraints) {
          final text = Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium
                ?.copyWith(color: ink, fontWeight: FontWeight.w700),
          );
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 14, color: ink),
                const SizedBox(width: 4),
              ],
              if (constraints.hasBoundedWidth)
                Flexible(child: text)
              else
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: text,
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Thick rounded progress bar with a glowing accent fill.
class GlowProgressBar extends StatelessWidget {
  const GlowProgressBar({
    super.key,
    required this.value,
    this.color = AppColors.accent,
    this.height = 10,
  });

  final double value;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    final v = value.clamp(0.0, 1.0);
    return Semantics(
      value: '${(v * 100).round()}%',
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.glassFillStrong,
          borderRadius: BorderRadius.circular(height),
        ),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: v),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (context, t, _) => FractionallySizedBox(
              widthFactor: t,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height),
                  gradient: LinearGradient(
                    colors: [color.withValues(alpha: 0.75), color],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.5),
                      blurRadius: 10,
                      spreadRadius: -2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The lit floor the 3D cube stands on: an elliptical glow plus a thin
/// ring split into the six sticker colors. Drawn behind the cube on Home
/// and in the solver so the cube always reads as the hero of the screen.
class CubeStage extends StatelessWidget {
  const CubeStage({super.key, this.intensity = 1});

  final double intensity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _StagePainter(intensity),
        size: Size.infinite,
      ),
    );
  }
}

class _StagePainter extends CustomPainter {
  _StagePainter(this.intensity);

  final double intensity;

  static const _order = [
    StickerColor.blue,
    StickerColor.green,
    StickerColor.yellow,
    StickerColor.orange,
    StickerColor.red,
    StickerColor.white,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.80);
    final w = math.min(size.width * 0.82, size.height * 1.3);
    final floor = Rect.fromCenter(center: center, width: w, height: w * 0.24);

    // Soft pool of light.
    canvas.drawOval(
      floor.inflate(w * 0.06),
      Paint()
        ..shader = RadialGradient(
          colors: [
            AppColors.accent.withValues(alpha: 0.30 * intensity),
            AppColors.accent.withValues(alpha: 0),
          ],
        ).createShader(floor.inflate(w * 0.06))
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
    );

    // Six-color ring.
    const gap = 0.05;
    const sweep = (2 * math.pi) / 6;
    for (var i = 0; i < 6; i++) {
      final color = AppColors.stickers[_order[i]]!;
      canvas.drawArc(
        floor,
        i * sweep + gap / 2,
        sweep - gap,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..strokeCap = StrokeCap.round
          ..color = color.withValues(alpha: 0.55 * intensity),
      );
    }
  }

  @override
  bool shouldRepaint(_StagePainter old) => old.intensity != intensity;
}
