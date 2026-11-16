import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/l10n/move_words.dart';
import '../../../core/theme/app_colors.dart';

/// "Hold the cube with the yellow center on top and the green center facing
/// you", with a tiny top/front color swatch so it can be matched at a
/// glance.
class HoldPrompt extends StatelessWidget {
  const HoldPrompt({super.key, required this.top, required this.front});

  final StickerColor top;
  final StickerColor front;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    Widget swatch(StickerColor color, {required bool upper}) => Container(
      width: 22,
      height: upper ? 10 : 16,
      decoration: BoxDecoration(
        color: AppColors.stickers[color],
        borderRadius: BorderRadius.vertical(
          top: upper ? const Radius.circular(4) : Radius.zero,
          bottom: upper ? Radius.zero : const Radius.circular(4),
        ),
        border: Border.all(color: AppColors.cubeBody, width: 1.5),
      ),
    );
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 6, 12, 6),
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [swatch(top, upper: true), swatch(front, upper: false)],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              holdPrompt(l10n, top, front),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
