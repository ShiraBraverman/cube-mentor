import 'dart:ui';

import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../camera/frame_sampler.dart';

/// Compact translucent pill under the scan grid with a lighting tip: glare
/// on the stickers, or too little light (with a flashlight toggle when the
/// camera has one). It is advice only: the glare pill ignores touches and
/// never blocks or disables a capture.
class LightingTip extends StatelessWidget {
  const LightingTip({
    super.key,
    required this.hint,
    this.torchOn = false,
    this.onTorch,
  });

  final LightingHint hint;
  final bool torchOn;

  /// Toggles the flashlight; null hides the button.
  final VoidCallback? onTorch;

  @override
  Widget build(BuildContext context) {
    if (hint == LightingHint.ok) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final glare = hint == LightingHint.glare;
    final pill = ClipRRect(
      key: ValueKey('scan-lighting-${hint.name}'),
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 10, 4),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentWarm.withValues(alpha: 0.6),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Illustration(glare: glare),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  glare ? l10n.scanGlareTip : l10n.scanDimTip,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
              if (!glare && onTorch != null) ...[
                const SizedBox(width: 6),
                IconButton(
                  key: const ValueKey('scan-torch'),
                  tooltip: l10n.scanTorch,
                  onPressed: onTorch,
                  visualDensity: VisualDensity.compact,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.accentWarm.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  icon: Icon(
                    torchOn
                        ? Icons.flashlight_off_rounded
                        : Icons.flashlight_on_rounded,
                    size: 18,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
    // Glare advice has nothing to tap: let touches pass straight through.
    return glare ? IgnorePointer(child: pill) : pill;
  }
}

/// Glare: a light source with a tilted phone; dim: a moon.
class _Illustration extends StatelessWidget {
  const _Illustration({required this.glare});

  final bool glare;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.accentWarm.withValues(alpha: 0.22),
      ),
      child: glare
          ? const Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 2,
                  left: 3,
                  child: Icon(
                    Icons.flare_rounded,
                    size: 13,
                    color: AppColors.accentWarm,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 4,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(-0.08),
                    child: Icon(
                      Icons.smartphone_rounded,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : const Icon(
              Icons.nights_stay_rounded,
              size: 16,
              color: AppColors.accentWarm,
            ),
    );
  }
}
