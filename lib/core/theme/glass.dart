import 'dart:ui';

import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Full-screen gradient backdrop with soft color glows behind glass panels.
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
            alignment: AlignmentDirectional(-1.2, -0.9),
            color: AppColors.accent,
          ),
          const _Glow(
            alignment: AlignmentDirectional(1.3, 0.2),
            color: AppColors.accentSecondary,
          ),
          const _Glow(
            alignment: AlignmentDirectional(-0.6, 1.2),
            color: AppColors.accentWarm,
            strength: 0.10,
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
    this.strength = 0.18,
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
              radius: 0.9,
              colors: [color.withValues(alpha: strength), Colors.transparent],
            ),
          ),
        ),
      ),
    );
  }
}

/// Frosted-glass panel: blurred backdrop, translucent fill and hairline border.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsetsDirectional.all(16),
    this.borderRadius = 20,
    this.onTap,
    this.selected = false,
    this.blur = 18,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool selected;
  final double blur;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    return ClipRRect(
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
                      AppColors.accent.withValues(alpha: 0.32),
                      AppColors.accentSecondary.withValues(alpha: 0.14),
                    ]
                  : const [AppColors.glassFillStrong, AppColors.glassHighlight],
            ),
            border: Border.all(
              color: selected
                  ? AppColors.accent.withValues(alpha: 0.85)
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
    );
  }
}
