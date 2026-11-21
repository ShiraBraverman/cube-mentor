import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/scanner/camera/frame_sampler.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/scanner/widgets/lighting_tip.dart';
import 'package:cube_mentor/features/scanner/widgets/scan_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';
import 'test_app.dart';

void main() {
  group('full-screen preview mapping', () {
    test('cover crops the overflowing side, centered', () {
      // A 3:4 preview on a tall 360 x 780 phone: height decides the scale.
      final r = coverRect(const Size(360, 780), const Size(480, 640));
      expect(r.height, closeTo(780, 1e-9));
      expect(r.width, closeTo(585, 1e-9));
      expect(r.left, closeTo(-112.5, 1e-9));
      expect(r.top, closeTo(0, 1e-9));
    });

    test('the on-screen grid maps to the preview pixels under it', () {
      const viewport = Size(360, 780);
      const preview = Size(480, 640);
      final grid = Rect.fromCenter(
        center: const Offset(180, 390),
        width: 260,
        height: 260,
      );
      final n = previewGridRect(
        viewport: viewport,
        grid: grid,
        preview: preview,
      );
      // Back to screen coordinates through the same cover transform.
      final shown = coverRect(viewport, preview);
      final back = Rect.fromLTWH(
        shown.left + n.left * shown.width,
        shown.top + n.top * shown.height,
        n.width * shown.width,
        n.height * shown.height,
      );
      expect(back.left, closeTo(grid.left, 1e-9));
      expect(back.top, closeTo(grid.top, 1e-9));
      expect(back.width, closeTo(grid.width, 1e-9));
      // Square on screen stays square in preview pixels.
      expect(n.width * preview.width, closeTo(n.height * preview.height, 1e-9));
      expect(n.center.dx, closeTo(0.5, 1e-9));
      expect(n.center.dy, closeTo(0.5, 1e-9));
    });
  });

  group('scan layout', () {
    Future<void> pumpLayout(
      WidgetTester tester, {
      Widget? tip,
      VoidCallback? onGridTap,
      void Function(Rect, Size)? onGridRect,
    }) async {
      tester.view.physicalSize = const Size(1080, 2340);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        testApp(
          Scaffold(
            body: ScanLayout(
              background: const ColoredBox(color: Colors.black),
              header: const SizedBox(height: 120, key: ValueKey('header')),
              footer: const SizedBox(height: 140, key: ValueKey('footer')),
              grid: GestureDetector(
                key: const ValueKey('grid'),
                behavior: HitTestBehavior.opaque,
                onTap: onGridTap,
              ),
              tip: tip,
              onGridRect: onGridRect,
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
    }

    testWidgets('the grid is a big centered square between the overlays', (
      tester,
    ) async {
      Rect? reported;
      await pumpLayout(tester, onGridRect: (rect, _) => reported = rect);
      final grid = tester.getRect(find.byKey(const ValueKey('grid')));
      final header = tester.getRect(find.byKey(const ValueKey('header')));
      final footer = tester.getRect(find.byKey(const ValueKey('footer')));
      expect(grid.width, closeTo(grid.height, 0.01));
      expect(grid.width / 360, inInclusiveRange(0.65, 0.75));
      expect(grid.center.dx, closeTo(180, 0.01));
      expect(grid.top, greaterThanOrEqualTo(header.bottom));
      expect(grid.bottom, lessThanOrEqualTo(footer.top));
      expect(header.top, 0);
      expect(footer.bottom, 780);
      expect(reported, grid);
    });

    testWidgets('the glare pill sits under the grid and lets taps through', (
      tester,
    ) async {
      var taps = 0;
      await pumpLayout(
        tester,
        tip: const LightingTip(hint: LightingHint.glare),
        onGridTap: () => taps++,
      );
      final grid = tester.getRect(find.byKey(const ValueKey('grid')));
      final pill = tester.getRect(
        find.byKey(const ValueKey('scan-lighting-glare')),
      );
      final footer = tester.getRect(find.byKey(const ValueKey('footer')));
      expect(pill.overlaps(grid), isFalse);
      expect(pill.top, greaterThanOrEqualTo(grid.bottom));
      expect(pill.bottom, lessThanOrEqualTo(footer.top));
      // Compact: well under the grid's own size.
      expect(pill.height, lessThan(grid.height / 3));
      expect(
        find.ancestor(
          of: find.byKey(const ValueKey('scan-lighting-glare')),
          matching: find.byType(IgnorePointer),
        ),
        findsWidgets,
      );
      await tester.tap(find.byKey(const ValueKey('grid')));
      expect(taps, 1);
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('capture is full screen with the overlays on the edges', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
          cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ScannerScreen(size: 3, cameraOverride: false),
        ),
      ),
    );
    await tester.pump();
    ProviderScope.containerOf(tester.element(find.byType(ScannerScreen)))
        .read(scanSessionProvider(3).notifier)
        .restart();
    await tester.pump();

    // No app bar: the face indicator and the manual button float on top.
    expect(find.byType(AppBar), findsNothing);
    expect(find.byType(ScanLayout), findsOneWidget);
    final step = tester.getRect(find.byKey(const ValueKey('scan-step')));
    final manual = tester.getRect(find.byKey(const ValueKey('scan-manual')));
    expect(step.top, lessThan(80));
    expect(manual.bottom, greaterThan(700));
    expect(tester.takeException(), isNull);

    await tester.tap(find.byKey(const ValueKey('scan-manual')));
    await tester.pump();
    expect(find.byKey(const ValueKey('scan-status')), findsOneWidget);
  });
}
