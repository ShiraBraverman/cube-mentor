import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

/// Share of the screen width taken by the square scan grid.
const double kScanGridWidthFactor = 0.72;

/// Height kept free under the grid for the lighting pill, so the grid does
/// not jump when a tip appears.
const double kScanTipReserve = 44;

/// Full-screen scanner frame: [background] fills everything (the camera
/// preview, cover-fitted), [header] and [footer] float as compact overlays
/// along the top and bottom edges, the square [grid] is centered in the
/// space between them and [tip] sits just under the grid, never over it.
///
/// [onGridRect] reports where the grid landed (in this widget's
/// coordinates) together with the full size, so the camera can sample
/// exactly the pixels under it. It runs during layout: callers must only
/// store the values, never rebuild from them.
class ScanLayout extends StatelessWidget {
  const ScanLayout({
    super.key,
    required this.background,
    required this.header,
    required this.footer,
    required this.grid,
    this.tip,
    this.fillCenter = false,
    this.onGridRect,
  });

  final Widget background;
  final Widget header;
  final Widget footer;

  /// The scan grid, laid out as a square; with [fillCenter] it gets the
  /// whole space between the header and the footer instead (camera
  /// problem messages).
  final Widget grid;
  final Widget? tip;
  final bool fillCenter;
  final void Function(Rect grid, Size viewport)? onGridRect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // The camera preview is physical space: never mirrored in RTL.
        Positioned.fill(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: background,
          ),
        ),
        CustomMultiChildLayout(
          delegate: _ScanLayoutDelegate(
            fillCenter: fillCenter,
            onGridRect: onGridRect,
          ),
          children: [
            LayoutId(id: _Slot.grid, child: grid),
            if (tip != null) LayoutId(id: _Slot.tip, child: tip!),
            LayoutId(id: _Slot.header, child: header),
            LayoutId(id: _Slot.footer, child: footer),
          ],
        ),
      ],
    );
  }
}

enum _Slot { header, footer, grid, tip }

/// Square grid side for a [width]-wide screen with [height] free between
/// the overlays (and the tip slot already taken out).
double scanGridSide(double width, double height) =>
    math.max(0, math.min(kScanGridWidthFactor * width, height - 16));

class _ScanLayoutDelegate extends MultiChildLayoutDelegate {
  _ScanLayoutDelegate({required this.fillCenter, this.onGridRect});

  final bool fillCenter;
  final void Function(Rect grid, Size viewport)? onGridRect;

  @override
  void performLayout(Size size) {
    final loose = BoxConstraints.loose(size);
    final width = BoxConstraints(maxWidth: size.width, maxHeight: size.height);
    final top = layoutChild(
      _Slot.header,
      width.copyWith(minWidth: size.width),
    ).height;
    positionChild(_Slot.header, Offset.zero);
    final bottomSize = layoutChild(
      _Slot.footer,
      width.copyWith(minWidth: size.width),
    );
    final bottom = size.height - bottomSize.height;
    positionChild(_Slot.footer, Offset(0, bottom));
    final free = math.max(0.0, bottom - top);

    if (fillCenter) {
      final gutter = math.min(16.0, size.width / 20);
      final box = layoutChild(
        _Slot.grid,
        BoxConstraints.tight(Size(size.width - 2 * gutter, free)),
      );
      positionChild(_Slot.grid, Offset(gutter, top));
      if (hasChild(_Slot.tip)) {
        layoutChild(_Slot.tip, const BoxConstraints.tightFor(width: 0));
        positionChild(_Slot.tip, Offset.zero);
      }
      onGridRect?.call(Offset(gutter, top) & box, size);
      return;
    }

    var tipSize = Size.zero;
    if (hasChild(_Slot.tip)) {
      final tipWidth = math.min(size.width - 24, 420.0);
      tipSize = layoutChild(_Slot.tip, loose.copyWith(maxWidth: tipWidth));
    }
    final reserve = math.max(kScanTipReserve, tipSize.height + 8);
    final side = scanGridSide(size.width, free - reserve);
    layoutChild(_Slot.grid, BoxConstraints.tight(Size.square(side)));
    // Center the grid and its tip slot together between the overlays.
    final gridTop = top + math.max(0, (free - side - reserve) / 2);
    final grid = Rect.fromLTWH((size.width - side) / 2, gridTop, side, side);
    positionChild(_Slot.grid, grid.topLeft);
    if (hasChild(_Slot.tip)) {
      positionChild(
        _Slot.tip,
        Offset((size.width - tipSize.width) / 2, grid.bottom + 8),
      );
    }
    onGridRect?.call(grid, size);
  }

  @override
  bool shouldRelayout(_ScanLayoutDelegate oldDelegate) =>
      fillCenter != oldDelegate.fillCenter;
}

/// Translucent strip behind the header or footer: dark at the screen edge,
/// fading toward the grid so the camera stays visible.
class ScanOverlayBar extends StatelessWidget {
  const ScanOverlayBar({super.key, required this.child, this.top = true});

  final Widget child;

  /// Along the top edge (fades downward) or the bottom edge.
  final bool top;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: top ? Alignment.topCenter : Alignment.bottomCenter,
          end: top ? Alignment.bottomCenter : Alignment.topCenter,
          colors: [
            Colors.black.withValues(alpha: 0.62),
            Colors.black.withValues(alpha: 0.38),
          ],
        ),
      ),
      child: SafeArea(top: top, bottom: !top, child: child),
    );
  }
}
