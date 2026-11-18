import 'dart:ui';

import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Full-screen obsidian backdrop with two faint accent glows behind the
/// glass panels. Kept dim on purpose: the cube is the only bright thing.
class GlassBackground extends StatelessWidget {
  const GlassBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
        ),
      ),
      child: Stack(
        children: [
          const _Glow(
            alignment: AlignmentDirectional(-1.1, -1.0),
            color: AppColors.accent,
            strength: 0.16,
          ),
          const _Glow(
            alignment: AlignmentDirectional(1.2, 0.35),
            color: AppColors.accentSecondary,
            strength: 0.07,
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({
    required this.alignment,
    required this.color,
    required this.strength,
  });

  final AlignmentDirectional alignment;
  final Color color;
  final double strength;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: alignment.resolve(Directionality.of(context)),
              radius: 1.0,
              colors: [
                color.withValues(alpha: strength),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Frosted-glass panel: blurred backdrop, translucent fill and a hairline
/// border. [selected] lights it with [accent] (border plus a soft outer
/// glow), which is how active steps and chosen options read across the app.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsetsDirectional.all(AppSpace.md + 2),
    this.borderRadius = AppRadius.md,
    this.onTap,
    this.selected = false,
    this.accent = AppColors.accent,
    this.blur = 18,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool selected;
  final Color accent;
  final double blur;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: selected
            ? [
                BoxShadow(
                  color: accent.withValues(alpha: 0.28),
                  blurRadius: 24,
                  spreadRadius: -4,
                ),
              ]
            : const [],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              borderRadius: radius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: selected
                    ? [
                        accent.withValues(alpha: 0.22),
                        accent.withValues(alpha: 0.06),
                      ]
                    : const [
                        AppColors.glassFillStrong,
                        AppColors.glassHighlight,
                      ],
              ),
              border: Border.all(
                color: selected
                    ? accent.withValues(alpha: 0.9)
                    : AppColors.glassBorder,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onTap,
                borderRadius: radius,
                child: Padding(padding: padding, child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
