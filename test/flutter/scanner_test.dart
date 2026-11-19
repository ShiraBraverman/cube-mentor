import 'dart:math';
import 'dart:typed_data';

import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/core/vision/color_science.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/scanner/camera/frame_sampler.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';

String scrambledFacelets(int size, int seed) =>
    CubeState.solved(size)
        .applyAll(CubeState.randomScramble(size, random: Random(seed)))
        .toFacelets();

/// Samples the fake analyzer decodes back to [facelets] for one face.
List<Rgb> faceSamples(String facelets, int size, int face) => [
  for (var i = face * size * size; i < (face + 1) * size * size; i++)
    FakeScanAnalyzer.encode(facelets[i]),
];

void main() {
  group('facelets', () {
    test('cubeFromFacelets round-trips scrambled cubes of every size', () {
      for (var size = 2; size <= 6; size++) {
        final facelets = scrambledFacelets(size, size);
        expect(cubeFromFacelets(size, facelets).toFacelets(), facelets);
      }
      expect(
        cubeFromFacelets(3, CubeState.solved(3).toFacelets()).isSolved,
        isTrue,
      );
      expect(() => cubeFromFacelets(3, 'WWW'), throwsFormatException);
    });
  });

  group('scan session', () {
    late ProviderContainer container;
    late FakeScanAnalyzer analyzer;

    setUp(() {
      analyzer = FakeScanAnalyzer();
      container = ProviderContainer(
        overrides: [scanAnalyzerProvider.overrideWithValue(analyzer)],
      );
    });
    tearDown(() => container.dispose());

    ScanSessionController ctrl(int size) =>
        container.read(scanSessionProvider(size).notifier);
    ScanSession read(int size) => container.read(scanSessionProvider(size));

    void captureAll(int size, String facelets) {
      for (var i = 0; i < 6; i++) {
        ctrl(size).capture(faceSamples(facelets, size, read(size).face));
      }
    }

    test('walks the faces in scan order, then classifies all six', () {
      final sub = container.listen(scanSessionProvider(3), (_, _) {});
      final truth = scrambledFacelets(3, 1);
      expect(read(3).phase, ScanPhase.capture);
      for (var step = 0; step < 6; step++) {
        expect(read(3).face, kScanOrder[step]);
        expect(read(3).captureStep, step + 1);
        ctrl(3).capture(faceSamples(truth, 3, read(3).face));
      }
      expect(read(3).phase, ScanPhase.review);
      expect(analyzer.classified, hasLength(1));
      // Samples reach the classifier in facelet order (URFDLB).
      expect(
        analyzer.classified.single
            .map((s) => FakeScanAnalyzer.letters[s.r])
            .join(),
        truth,
      );
      expect(read(3).facelets, truth);
      expect(read(3).isValid, isTrue);
      expect(read(3).cube!.toFacelets(), truth);
      sub.close();
    });

    test('a capture with the wrong number of cells is ignored', () {
      final sub = container.listen(scanSessionProvider(2), (_, _) {});
      ctrl(2).capture(faceSamples(scrambledFacelets(3, 2), 3, 0));
      expect(read(2).samples, isEmpty);
      expect(read(2).face, kFaceF);
      sub.close();
    });

    test('rescanning one face keeps the others and hand edits elsewhere', () {
      final sub = container.listen(scanSessionProvider(3), (_, _) {});
      final truth = scrambledFacelets(3, 3);
      captureAll(3, truth);
      // Hand edits on the U face (index 0) and on the R face (index 9).
      ctrl(3)
        ..setSticker(0, StickerColor.white)
        ..setSticker(9, StickerColor.blue);
      expect(read(3).edited, {0, 9});

      ctrl(3).rescanFace(kFaceR);
      expect(read(3).phase, ScanPhase.capture);
      expect(read(3).face, kFaceR);
      expect(read(3).samples, hasLength(6));

      ctrl(3).capture(faceSamples(truth, 3, kFaceR));
      expect(read(3).phase, ScanPhase.review);
      expect(analyzer.classified, hasLength(2));
      // The R face edit is replaced by the new scan; the U edit stays.
      expect(read(3).edited, {0});
      expect(read(3).stickers[0], StickerColor.white);
      expect(read(3).stickers[9], stickerColorOf(truth[9]));
      sub.close();
    });

    test('cancelling a rescan returns to the review untouched', () {
      final sub = container.listen(scanSessionProvider(2), (_, _) {});
      final truth = scrambledFacelets(2, 4);
      captureAll(2, truth);
      ctrl(2)
        ..rescanFace(kFaceD)
        ..cancelRescan();
      expect(read(2).phase, ScanPhase.review);
      expect(read(2).facelets, truth);
      sub.close();
    });

    test('manual entry: tap-to-fix cycles colors and revalidates', () {
      final sub = container.listen(scanSessionProvider(3), (_, _) {});
      ctrl(3).startManual();
      expect(read(3).phase, ScanPhase.review);
      expect(read(3).manual, isTrue);
      expect(read(3).isValid, isTrue);
      expect(read(3).cube!.isSolved, isTrue);

      ctrl(3).cycleSticker(0); // white -> yellow
      expect(read(3).stickers[0], StickerColor.yellow);
      expect(read(3).isValid, isFalse);
      expect(read(3).invalid, contains(0));
      expect(read(3).cube, isNull);
      // Hand-entered colors carry no confidence.
      expect(analyzer.validatedConfidence.last, isNull);

      ctrl(3).setSticker(0, StickerColor.white);
      expect(read(3).isValid, isTrue);
      expect(read(3).invalid, isEmpty);
      sub.close();
    });

    test('edited stickers count as fully confident', () {
      final sub = container.listen(scanSessionProvider(2), (_, _) {});
      captureAll(2, scrambledFacelets(2, 5));
      ctrl(2).cycleSticker(3);
      final confidence = analyzer.validatedConfidence.last!;
      expect(confidence[3], 1.0);
      expect(confidence[2], 0.9);
      sub.close();
    });
  });

  group('frame sampler', () {
    test('maps upright preview points to sensor coordinates', () {
      const p = Offset(0.2, 0.7);
      expect(displayToSensor(p, 0), p);
      expect(displayToSensor(p, 90), const Offset(0.7, 0.8));
      expect(displayToSensor(p, 180).dx, closeTo(0.8, 1e-9));
      expect(displayToSensor(p, 270).dy, closeTo(0.2, 1e-9));
    });

    test('grid is a centered square', () {
      final r = gridRect(const Size(300, 400));
      expect(r.width * 300, closeTo(240, 1e-9));
      expect(r.height * 400, closeTo(240, 1e-9));
      expect(r.left, closeTo(0.1, 1e-9));
    });

    /// A 2x2 checkerboard of colors filling the whole BGRA frame.
    CameraFrame quadrants(int w, int h, List<Rgb> colors) {
      final bytes = Uint8List(w * h * 4);
      for (var y = 0; y < h; y++) {
        for (var x = 0; x < w; x++) {
          final c = colors[(y * 2 ~/ h) * 2 + (x * 2 ~/ w)];
          final i = (y * w + x) * 4;
          bytes
            ..[i] = c.b
            ..[i + 1] = c.g
            ..[i + 2] = c.r
            ..[i + 3] = 255;
        }
      }
      return CameraFrame(
        width: w,
        height: h,
        format: FrameFormat.bgra8888,
        planes: [FramePlane(bytes: bytes, rowStride: w * 4)],
      );
    }

    const red = (r: 200, g: 20, b: 40);
    const green = (r: 10, g: 160, b: 70);
    const blue = (r: 0, g: 60, b: 180);
    const yellow = (r: 250, g: 210, b: 10);

    test('averages every cell, upright and rotated sensors', () {
      final frame = quadrants(80, 80, [red, green, blue, yellow]);
      const whole = Rect.fromLTWH(0, 0, 1, 1);
      final upright = sampleGrid(frame, 2, whole, sensorOrientation: 0);
      expect([for (final c in upright) c.color], [red, green, blue, yellow]);
      // A sensor mounted 90 degrees clockwise: the top-left of the screen
      // is the bottom-left of the sensor image.
      final rotated = sampleGrid(frame, 2, whole, sensorOrientation: 90);
      expect([for (final c in rotated) c.color], [blue, red, yellow, green]);
    });

    test('decodes YUV 4:2:0 planes', () {
      // Mid gray: Y = 128, U = V = 128.
      final frame = CameraFrame(
        width: 4,
        height: 4,
        format: FrameFormat.yuv420,
        planes: [
          FramePlane(bytes: Uint8List(16)..fillRange(0, 16, 128), rowStride: 4),
          FramePlane(bytes: Uint8List(4)..fillRange(0, 4, 128), rowStride: 2),
          FramePlane(bytes: Uint8List(4)..fillRange(0, 4, 128), rowStride: 2),
        ],
      );
      expect(frame.pixel(1, 2), (r: 128, g: 128, b: 128));
    });

    test('warns about dark frames and glare', () {
      CellSample cell(int v, [double glare = 0]) =>
          (color: (r: v, g: v, b: v), glare: glare);
      expect(assessLighting([cell(120), cell(200)]), LightingHint.ok);
      expect(assessLighting([cell(20), cell(30)]), LightingHint.tooDark);
      expect(assessLighting([cell(255, 0.8), cell(90)]), LightingHint.glare);
      expect(glareCells([cell(255, 0.8), cell(90), cell(250, 0.3)]), {0, 2});
    });

    test('live preview guesses standard colors', () {
      for (final entry in kReferenceStickerRgb.entries) {
        expect(nearestStickerColor(entry.value), entry.key);
      }
      // A dim, warm white still reads as white rather than yellow.
      expect(nearestStickerColor((r: 150, g: 140, b: 120)), StickerColor.white);
    });
  });

  group('scanner screen', () {
    Future<ProviderContainer> pumpScanner(
      WidgetTester tester, {
      required int size,
      FakeScanAnalyzer? analyzer,
      FakeCubeSolver? solver,
    }) async {
      tester.view.physicalSize = const Size(1080, 2340);
      tester.view.devicePixelRatio = 2.75;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            scanAnalyzerProvider.overrideWithValue(
              analyzer ?? FakeScanAnalyzer(),
            ),
            cubeSolverProvider.overrideWithValue(solver ?? FakeCubeSolver()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: ScannerScreen(size: size, cameraOverride: false),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      return ProviderScope.containerOf(
        tester.element(find.byType(ScannerScreen)),
      );
    }

    Future<void> advance(WidgetTester tester, [int frames = 12]) async {
      for (var i = 0; i < frames; i++) {
        await tester.pump(const Duration(milliseconds: 50));
      }
    }

    bool solveEnabled(WidgetTester tester) => tester
        .widget<ButtonStyleButton>(find.byKey(const ValueKey('scan-solve')))
        .enabled;

    testWidgets('without a camera, opens the manual net editor', (
      tester,
    ) async {
      await pumpScanner(tester, size: 3);
      expect(find.text('Scan 3×3'), findsOneWidget);
      expect(find.byKey(const ValueKey('scan-sticker-0')), findsOneWidget);
      expect(find.byKey(const ValueKey('scan-sticker-53')), findsOneWidget);
      expect(find.text('All stickers look right.'), findsOneWidget);
      expect(solveEnabled(tester), isTrue);
    });

    testWidgets('tap-to-fix flags a bad sticker, the palette fixes it', (
      tester,
    ) async {
      final container = await pumpScanner(tester, size: 2);
      await tester.tap(find.byKey(const ValueKey('scan-sticker-0')));
      await tester.pump();
      expect(
        container.read(scanSessionProvider(2)).stickers[0],
        StickerColor.yellow,
      );
      expect(find.text('5 stickers look wrong'), findsOneWidget);
      expect(
        find.text('Each color must appear exactly 4 times.'),
        findsOneWidget,
      );
      expect(solveEnabled(tester), isFalse);

      await tester.longPress(find.byKey(const ValueKey('scan-sticker-0')));
      await advance(tester);
      await tester.tap(find.byKey(const ValueKey('scan-palette-white')));
      await advance(tester);
      expect(find.text('All stickers look right.'), findsOneWidget);
      expect(solveEnabled(tester), isTrue);
    });

    testWidgets('a valid scan loads into the 3D viewport and solves', (
      tester,
    ) async {
      final truth = scrambledFacelets(3, 8);
      final solver = FakeCubeSolver(
        plan: const SolvePlan(
          method: 'test',
          steps: [
            SolveStep(
              cubeState: '',
              phaseName: 'kociembaPhase2',
              moveNotation: 'R',
              explanationKey: 'kociembaPhase2Explain',
            ),
          ],
        ),
      );
      final analyzer = FakeScanAnalyzer();
      final container = await pumpScanner(
        tester,
        size: 3,
        analyzer: analyzer,
        solver: solver,
      );
      // Switch from manual entry to a (simulated) camera scan.
      container.read(scanSessionProvider(3).notifier).restart();
      for (var i = 0; i < 6; i++) {
        final face = container.read(scanSessionProvider(3)).face;
        container
            .read(scanSessionProvider(3).notifier)
            .capture(faceSamples(truth, 3, face));
      }
      await tester.pump();
      expect(find.byKey(const ValueKey('scan-rescan-$kFaceU')), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('scan-solve')));
      await advance(tester, 20);
      expect(find.byType(Solver3DScreen), findsOneWidget);
      final viewport = ProviderScope.containerOf(
        tester.element(find.byType(Solver3DScreen)),
      );
      expect(viewport.read(cubeSessionProvider(3)).cube.toFacelets(), truth);
      // Straight into the stage-by-stage guided solve.
      expect(solver.calls, [SolveMethod.layerByLayer]);
      expect(viewport.read(cubeSessionProvider(3)).hasPlayback, isTrue);
    });

    testWidgets('rescan a face from the review, then go back', (tester) async {
      final container = await pumpScanner(tester, size: 2);
      final controller = container.read(scanSessionProvider(2).notifier)
        ..restart();
      final truth = scrambledFacelets(2, 9);
      for (var i = 0; i < 6; i++) {
        controller.capture(
          faceSamples(truth, 2, container.read(scanSessionProvider(2)).face),
        );
      }
      await tester.pump();
      await tester.tap(find.byKey(const ValueKey('scan-rescan-$kFaceB')));
      await tester.pump();
      // The face name also appears on its pill.
      expect(find.text('Back face'), findsNWidgets(2));
      expect(find.text('Face 3 of 6'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('scan-cancel-rescan')));
      await tester.pump();
      expect(find.byKey(const ValueKey('scan-status')), findsOneWidget);
      expect(container.read(scanSessionProvider(2)).facelets, truth);
    });
  });
}
