import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/sticker_palette.dart';
import '../model/scan_session.dart';

/// Cell (column, row) of every face in the unfolded cross:
///
///        U
///     L  F  R  B
///        D
const Map<int, (int, int)> kNetCells = {
  kFaceU: (1, 0),
  kFaceL: (0, 1),
  kFaceF: (1, 1),
  kFaceR: (2, 1),
  kFaceB: (3, 1),
  kFaceD: (1, 2),
};

/// The cube unfolded as a cross, in the facelet layout of the scanner and
/// the solvers. A spatial map, so it never mirrors in right-to-left
/// locales.
class CubeNet extends StatefulWidget {
  const CubeNet({
    super.key,
    required this.size,
    required this.stickers,
    this.invalid = const {},
    this.uncertain = const {},
    this.currentFace,
    this.onStickerTap,
    this.onStickerLongPress,
    this.onFaceTap,
    this.stickerKeyPrefix,
    this.faceKeyPrefix,
  });

  final int size;

  /// `6 * size^2` colors in facelet order; null for a face not captured yet.
  final List<StickerColor?> stickers;

  /// Stickers flagged by the validator: they pulse.
  final Set<int> invalid;

  /// Stickers the classifier was unsure about: outlined.
  final Set<int> uncertain;

  /// Face to frame with the accent color (the one being captured).
  final int? currentFace;

  final ValueChanged<int>? onStickerTap;
  final ValueChanged<int>? onStickerLongPress;
  final ValueChanged<int>? onFaceTap;

  /// Widget key prefixes (`<prefix>-<index>`) for tests and accessibility.
  final String? stickerKeyPrefix;
  final String? faceKeyPrefix;

  @override
  State<CubeNet> createState() => _CubeNetState();
}

class _CubeNetState extends State<CubeNet> with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  @override
  void initState() {
    super.initState();
    _syncPulse();
  }

  @override
  void didUpdateWidget(CubeNet oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncPulse();
  }

  void _syncPulse() {
    if (widget.invalid.isEmpty) {
      _pulse
        ..stop()
        ..value = 0;
    } else if (!_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final face = math.min(
              constraints.maxWidth / 4,
              constraints.maxHeight / 3,
            );
            return Stack(
              children: [
                for (final entry in kNetCells.entries)
                  Positioned(
                    left: entry.value.$1 * face,
                    top: entry.value.$2 * face,
                    width: face,
                    height: face,
                    child: _face(entry.key, face),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _face(int face, double extent) {
    final n = widget.size;
    final current = widget.currentFace == face;
    final gap = extent > 60 ? 2.0 : 1.0;
    Widget grid = Container(
      margin: EdgeInsets.all(gap),
      padding: EdgeInsets.all(gap),
      decoration: BoxDecoration(
        color: AppColors.cubeBody,
        borderRadius: BorderRadius.circular(extent * 0.08),
        border: Border.all(
          color: current ? AppColors.accent : AppColors.glassBorder,
          width: current ? 2.5 : 1,
        ),
      ),
      child: Column(
        children: [
          for (var row = 0; row < n; row++)
            Expanded(
              child: Row(
                children: [
                  for (var col = 0; col < n; col++)
                    Expanded(
                      child: _sticker(face * n * n + row * n + col, extent / n),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
    final onFaceTap = widget.onFaceTap;
    if (onFaceTap != null) {
      grid = GestureDetector(
        key: widget.faceKeyPrefix == null
            ? null
            : ValueKey('${widget.faceKeyPrefix}-$face'),
        behavior: HitTestBehavior.opaque,
        onTap: () => onFaceTap(face),
        child: grid,
      );
    }
    return grid;
  }

  Widget _sticker(int index, double extent) {
    final color = widget.stickers[index];
    final invalid = widget.invalid.contains(index);
    final uncertain = !invalid && widget.uncertain.contains(index);
    final radius = BorderRadius.circular(extent * 0.18);
    final fill = color == null
        ? AppColors.glassFill
        : StickerPalette.of(context)[color]!;
    Widget tile = AnimatedBuilder(
      animation: _pulse,
      builder: (context, _) {
        final t = invalid ? Curves.easeInOut.transform(_pulse.value) : 0.0;
        return Transform.scale(
          scale: 1 - 0.12 * t,
          child: Container(
            margin: EdgeInsets.all(extent > 20 ? 1.5 : 0.75),
            decoration: BoxDecoration(
              color: fill,
              borderRadius: radius,
              border: invalid
                  ? Border.all(
                      color: Color.lerp(AppColors.danger, Colors.white, t)!,
                      width: math.max(2, extent * 0.1),
                    )
                  : uncertain
                  ? Border.all(
                      color: AppColors.accentWarm,
                      width: math.max(1.5, extent * 0.06),
                    )
                  : null,
              boxShadow: invalid
                  ? [
                      BoxShadow(
                        color: AppColors.danger.withValues(alpha: 0.6 * t),
                        blurRadius: 10,
                      ),
                    ]
                  : null,
            ),
          ),
        );
      },
    );
    final onTap = widget.onStickerTap;
    final onLongPress = widget.onStickerLongPress;
    if (onTap != null || onLongPress != null) {
      tile = GestureDetector(
        key: widget.stickerKeyPrefix == null
            ? null
            : ValueKey('${widget.stickerKeyPrefix}-$index'),
        behavior: HitTestBehavior.opaque,
        onTap: onTap == null ? null : () => onTap(index),
        onLongPress: onLongPress == null ? null : () => onLongPress(index),
        child: tile,
      );
    }
    return tile;
  }
}
