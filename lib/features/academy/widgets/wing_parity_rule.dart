import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/sticker_palette.dart';

/// The 6x6 rule of thumb for a flipped-looking edge, as two pictures of the
/// front top edge (its 4 wings, top stickers over front stickers):
/// all 4 wings flipped takes the 3-layer OLL parity, only the 2 inner
/// wings flipped takes the inner-wing parity.
class WingParityRule extends StatelessWidget {
  const WingParityRule({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      key: const ValueKey('wing-parity-rule'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _RuleRow(
          key: const ValueKey('wing-rule-all'),
          flipped: const [true, true, true, true],
          title: l10n.wingRuleAllFour,
          fix: l10n.wingRuleAllFourFix,
          accent: AppColors.accent,
        ),
        const SizedBox(height: 6),
        _RuleRow(
          key: const ValueKey('wing-rule-inner'),
          flipped: const [false, true, true, false],
          title: l10n.wingRuleInnerTwo,
          fix: l10n.wingRuleInnerTwoFix,
          accent: AppColors.gold,
        ),
      ],
    );
  }
}

class _RuleRow extends StatelessWidget {
  const _RuleRow({
    super.key,
    required this.flipped,
    required this.title,
    required this.fix,
    required this.accent,
  });

  /// Which of the 4 wings (left to right) are flipped.
  final List<bool> flipped;
  final String title;
  final String fix;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = StickerPalette.of(context);
    final up = palette[StickerColor.white]!;
    final front = palette[StickerColor.green]!;
    Widget sticker(Color color, bool marked) => Container(
      width: 14,
      height: 14,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
        border: marked ? Border.all(color: accent, width: 1.5) : null,
      ),
    );
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 6, 8, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        color: accent.withValues(alpha: 0.1),
        border: BorderDirectional(start: BorderSide(color: accent, width: 3)),
      ),
      child: Row(
        children: [
          // The edge reads left to right on the cube in every language.
          Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.cubeBody,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final f in flipped) sticker(f ? front : up, f),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final f in flipped) sticker(f ? up : front, f),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  fix,
                  style: textTheme.bodySmall?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
