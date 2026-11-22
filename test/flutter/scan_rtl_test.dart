import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/theme/app_colors.dart';
import 'package:cube_mentor/core/theme/sticker_palette.dart';
import 'package:cube_mentor/core/vision/color_science.dart';
import 'package:cube_mentor/features/scanner/camera/camera_scan_view.dart';
import 'package:cube_mentor/features/scanner/widgets/cube_net.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'test_app.dart';

/// White, yellow, orange: the top row of a face as held, left to right.
const List<Rgb> _topRow = [
  (r: 250, g: 250, b: 250),
  (r: 255, g: 213, b: 0),
  (r: 255, g: 88, b: 0),
];

/// The fill of the first colored box under [finder] that matches [where].
Color _fillUnder(
  WidgetTester tester,
  Finder finder,
  bool Function(BoxDecoration) where,
) {
  final boxes = tester.widgetList<Container>(
    find.descendant(of: finder, matching: find.byType(Container)),
  );
  for (final box in boxes) {
    final decoration = box.decoration;
    if (decoration is BoxDecoration &&
        decoration.color != null &&
        where(decoration)) {
      return decoration.color!;
    }
  }
  throw StateError('no colored box under $finder');
}

/// [home] in Hebrew, inside an explicit right-to-left [Directionality].
Widget _rtl(Widget home) => testApp(
  Directionality(textDirection: TextDirection.rtl, child: home),
  locale: const Locale('he'),
);

void main() {
  testWidgets('the live scan grid keeps physical left-to-right order in RTL', (
    tester,
  ) async {
    final colors = [..._topRow, for (var i = 3; i < 9; i++) _topRow[0]];
    await tester.pumpWidget(
      _rtl(
        Center(
          child: SizedBox.square(
            dimension: 300,
            child: ScanGridOverlay(n: 3, colors: colors),
          ),
        ),
      ),
    );
    expect(
      Directionality.of(tester.element(find.byType(ScanGridOverlay))),
      TextDirection.rtl,
    );

    Finder cell(int i) => find.byKey(ValueKey('scan-cell-$i'));
    final xs = [for (var i = 0; i < 3; i++) tester.getCenter(cell(i)).dx];
    // Cell 0 (the leftmost sample) is drawn on the left, not mirrored.
    expect(xs[0], lessThan(xs[1]));
    expect(xs[1], lessThan(xs[2]));

    final guesses = [
      for (var i = 0; i < 3; i++)
        _fillUnder(tester, cell(i), (d) => d.shape == BoxShape.circle),
    ];
    expect(guesses, [
      AppColors.stickers[StickerColor.white],
      AppColors.stickers[StickerColor.yellow],
      AppColors.stickers[StickerColor.orange],
    ]);
  });

  testWidgets('the captured face grid keeps physical left-to-right order in '
      'RTL', (tester) async {
    final stickers = <StickerColor?>[
      StickerColor.white,
      StickerColor.yellow,
      StickerColor.orange,
      for (var i = 3; i < 6 * 9; i++) StickerColor.green,
    ];
    await tester.pumpWidget(
      _rtl(
        Center(
          child: SizedBox(
            width: 360,
            child: CubeNet(
              size: 3,
              stickers: stickers,
              stickerKeyPrefix: 'net',
              onStickerTap: (_) {},
            ),
          ),
        ),
      ),
    );

    Finder sticker(int i) => find.byKey(ValueKey('net-$i'));
    final xs = [for (var i = 0; i < 3; i++) tester.getCenter(sticker(i)).dx];
    expect(xs[0], lessThan(xs[1]));
    expect(xs[1], lessThan(xs[2]));

    final palette = StickerPalette.of(tester.element(sticker(0)));
    final fills = [
      for (var i = 0; i < 3; i++) _fillUnder(tester, sticker(i), (_) => true),
    ];
    expect(fills, [
      palette[StickerColor.white],
      palette[StickerColor.yellow],
      palette[StickerColor.orange],
    ]);
  });
}
