import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/sticker_palette.dart';

/// A tiny top/front color swatch showing how to hold the cube ("yellow on
/// top, green facing you") at a glance. The full sentence is `holdPrompt`.
class HoldSwatch extends StatelessWidget {
  const HoldSwatch({super.key, required this.top, required this.front});

  final StickerColor top;
  final StickerColor front;

  @override
  Widget build(BuildContext context) {
    final palette = StickerPalette.of(context);
    Widget swatch(StickerColor color, {required bool upper}) => Container(
      width: 22,
      height: upper ? 10 : 16,
      decoration: BoxDecoration(
        color: palette[color],
        borderRadius: BorderRadius.vertical(
          top: upper ? const Radius.circular(4) : Radius.zero,
          bottom: upper ? Radius.zero : const Radius.circular(4),
        ),
        border: Border.all(color: AppColors.cubeBody, width: 1.5),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [swatch(top, upper: true), swatch(front, upper: false)],
    );
  }
}
