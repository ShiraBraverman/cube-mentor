import 'dart:ui';

import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../camera/frame_sampler.dart';

/// Small glass pill over the camera preview with a lighting tip: glare on
/// the stickers, or too little light (with a flashlight toggle when the
/// camera has one).
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
    return ClipRRect(
      key: ValueKey('scan-lighting-${hint.name}'),
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.42),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.accentWarm.withValues(alpha: 0.7),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Illustration(glare: glare),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  glare ? l10n.scanGlareTip : l10n.scanDimTip,
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    height: 1.25,
                  ),
                ),
              ),
              if (!glare && onTorch != null) ...[
                const SizedBox(width: 8),
                FilledButton.tonalIcon(
                  key: const ValueKey('scan-torch'),
                  onPressed: onTorch,
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  icon: Icon(
                    torchOn
                        ? Icons.flashlight_off_rounded
                        : Icons.flashlight_on_rounded,
                    size: 18,
                  ),
                  label: Text(l10n.scanTorch),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Glare: a light source with a tilted phone; dim: a moon.
class _Illustration extends StatelessWidget {
  const _Illustration({required this.glare});

  final bool glare;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.accentWarm.withValues(alpha: 0.22),
      ),
      child: glare
          ? const Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 4,
                  left: 5,
                  child: Icon(
                    Icons.flare_rounded,
                    size: 18,
                    color: AppColors.accentWarm,
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 6,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(-0.08),
                    child: Icon(
                      Icons.smartphone_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : const Icon(
              Icons.nights_stay_rounded,
              size: 22,
              color: AppColors.accentWarm,
            ),
    );
  }
}
