import 'dart:typed_data';

import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/scanner/camera/frame_sampler.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/scanner/model/scan_turns.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/scanner/widgets/lighting_tip.dart';
import 'package:cube_mentor/features/scanner/widgets/mini_cube.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';
import 'scanner_test.dart' show faceSamples, scrambledFacelets;
import 'test_app.dart';

List<ScanTurn> _turns(int from, int to) => [
  for (final step in scanTurns(from, to)) step.turn,
];

void main() {
  group('scan turns', () {
    test('the scan order is one quarter turn at a time', () {
      expect(_turns(kFaceF, kFaceR), [ScanTurn.left]);
      expect(_turns(kFaceR, kFaceB), [ScanTurn.left]);
      expect(_turns(kFaceB, kFaceL), [ScanTurn.left]);
      // Back to the front, then the top comes toward you.
      expect(_turns(kFaceL, kFaceU), [ScanTurn.left, ScanTurn.tipTop]);
      expect(_turns(kFaceU, kFaceD), [ScanTurn.tipBottom, ScanTurn.tipBottom]);
    });

    test('every face reaches every other one, the right way up', () {
      for (var from = 0; from < 6; from++) {
        for (var to = 0; to < 6; to++) {
          final path = scanTurns(from, to);
          expect(path.length, from == to ? 0 : lessThanOrEqualTo(3));
          if (path.isNotEmpty) expect(path.last.face, to);
        }
      }
      expect(_turns(kFaceF, kFaceL), [ScanTurn.right]);
      expect(_turns(kFaceF, kFaceD), [ScanTurn.tipBottom]);
    });

    test('face orientations put that face in front', () {
      for (var face = 0; face < 6; face++) {
        final scene = MiniCubeScene(
          size: 3,
          stickers: List.filled(54, null),
          orientation: scanFaceOrientation(face),
          highlight: face,
        );
        final faces = scene.project(const Size(200, 200));
        // Front plus the two faces the tilt reveals; the front is nearest.
        expect(faces, hasLength(3));
        expect(faces.last.face, face);
        expect(
          scene.faceAt(const Offset(100, 100), const Size(200, 200)),
          face,
        );
      }
    });
  });

  group('lighting', () {
    test(
      'specular pixels are bright and colorless, white stickers are not',
      () {
        expect(isSpecular((r: 255, g: 255, b: 255)), isTrue);
        expect(isSpecular((r: 246, g: 245, b: 242)), isTrue);
        // A normally lit white sticker and a bright yellow one.
        expect(isSpecular((r: 205, g: 203, b: 198)), isFalse);
        expect(isSpecular((r: 250, g: 230, b: 40)), isFalse);
      },
    );

    test('a highlight on one sticker is reported for that cell', () {
      // 4x4 BGRA frame: the top-left quarter is blown out.
      final bytes = Uint8List(40 * 40 * 4);
      for (var y = 0; y < 40; y++) {
        for (var x = 0; x < 40; x++) {
          final glare = x < 20 && y < 20;
          final i = (y * 40 + x) * 4;
          bytes
            ..[i] = glare ? 255 : 40
            ..[i + 1] = glare ? 255 : 30
            ..[i + 2] = glare ? 255 : 200
            ..[i + 3] = 255;
        }
      }
      final frame = CameraFrame(
        width: 40,
        height: 40,
        format: FrameFormat.bgra8888,
        planes: [FramePlane(bytes: bytes, rowStride: 160)],
      );
      final cells = sampleGrid(
        frame,
        2,
        const Rect.fromLTWH(0, 0, 1, 1),
        sensorOrientation: 0,
      );
      expect(glareCells(cells), {0});
      expect(assessLighting(cells), LightingHint.glare);
    });

    test('the monitor ignores blips and clears only after steady light', () {
      final monitor = LightingMonitor();
      expect(monitor.add(LightingHint.glare), LightingHint.ok);
      expect(monitor.add(LightingHint.ok), LightingHint.ok);
      for (var i = 0; i < 2; i++) {
        expect(monitor.add(LightingHint.tooDark), LightingHint.ok);
      }
      expect(monitor.add(LightingHint.tooDark), LightingHint.tooDark);
      for (var i = 0; i < 5; i++) {
        expect(monitor.add(LightingHint.ok), LightingHint.tooDark);
      }
      expect(monitor.add(LightingHint.ok), LightingHint.ok);
    });

    testWidgets('tips: glare advice, dim light with a flashlight toggle', (
      tester,
    ) async {
      var toggles = 0;
      Future<void> show(LightingHint hint) => tester.pumpWidget(
        testApp(
          Scaffold(
            body: Center(
              child: LightingTip(hint: hint, onTorch: () => toggles++),
            ),
          ),
        ),
      );
      await show(LightingHint.glare);
      expect(find.textContaining('Glare detected'), findsOneWidget);
      expect(find.byKey(const ValueKey('scan-torch')), findsNothing);

      await show(LightingHint.tooDark);
      expect(find.textContaining('Too dim'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('scan-torch')));
      expect(toggles, 1);

      await show(LightingHint.ok);
      expect(find.byType(Text), findsNothing);
    });
  });

  group('scan guide on the scanner screen', () {
    Future<ProviderContainer> pumpCapture(WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2340);
      tester.view.devicePixelRatio = 2.75;
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
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ScannerScreen)),
      );
      container.read(scanSessionProvider(3).notifier).restart();
      await tester.pump();
      return container;
    }

    List<StickerColor?> miniCubeStickers(WidgetTester tester) => tester
        .widget<MiniCube>(find.byKey(const ValueKey('scan-minicube')))
        .stickers;

    testWidgets('faces fill in and the guide turns to the next face', (
      tester,
    ) async {
      final container = await pumpCapture(tester);
      final controller = container.read(scanSessionProvider(3).notifier);
      final truth = scrambledFacelets(3, 4);

      // Nothing scanned: every sticker is blank, the front hint shows.
      expect(miniCubeStickers(tester).every((c) => c == null), isTrue);
      expect(
        find.text(lookupAppLocalizations(const Locale('en')).scanHintFront),
        findsOneWidget,
      );

      controller.capture(faceSamples(truth, 3, kFaceF));
      await tester.pump();
      final stickers = miniCubeStickers(tester);
      for (var i = 0; i < 54; i++) {
        final front = i ~/ 9 == kFaceF;
        expect(stickers[i] != null, front, reason: 'sticker $i');
      }
      expect(find.text('Right face'), findsWidgets);
      expect(find.text('Turn the whole cube to the left'), findsOneWidget);
      final guide = tester.widget<MiniCube>(
        find.byKey(const ValueKey('scan-minicube')),
      );
      expect((guide.turnFrom, guide.face), (kFaceF, kFaceR));
      // Let the quarter turn play out.
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Around the cube to the left face, then the top: two steps.
      for (final face in [kFaceR, kFaceB, kFaceL]) {
        controller.capture(faceSamples(truth, 3, face));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));
      }
      expect(find.text('Turn the whole cube to the left'), findsOneWidget);
      expect(find.text('Tip the top toward you'), findsOneWidget);
      expect(find.byKey(const ValueKey('scan-turn-1')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a face pill or a face on the cube starts a rescan', (
      tester,
    ) async {
      final container = await pumpCapture(tester);
      final controller = container.read(scanSessionProvider(3).notifier);
      final truth = scrambledFacelets(3, 5);
      for (final face in [kFaceF, kFaceR, kFaceB]) {
        controller.capture(faceSamples(truth, 3, face));
      }
      await tester.pump();
      await tester.pump(const Duration(seconds: 2));
      expect(container.read(scanSessionProvider(3)).face, kFaceL);

      // Unscanned pills do nothing.
      await tester.tap(find.byKey(const ValueKey('scan-pill-$kFaceU')));
      await tester.pump();
      expect(container.read(scanSessionProvider(3)).face, kFaceL);

      await tester.tap(find.byKey(const ValueKey('scan-pill-$kFaceR')));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final session = container.read(scanSessionProvider(3));
      expect((session.face, session.turnFrom), (kFaceR, null));
      expect(find.text('Face 2 of 6'), findsOneWidget);

      // After the rescan the guide turns from R to L (two quarter turns to
      // the right, through the front), then F can be tapped on its side.
      controller.capture(faceSamples(truth, 3, kFaceR));
      await tester.pump();
      await tester.pump(const Duration(seconds: 2));
      expect(container.read(scanSessionProvider(3)).face, kFaceL);
      final box = tester.getRect(find.byKey(const ValueKey('scan-minicube')));
      final scene = MiniCubeScene(
        size: 3,
        stickers: List.filled(54, null),
        orientation: scanFaceOrientation(kFaceL),
        highlight: kFaceL,
      );
      // With L in front, F shows on the right side of the guide.
      Offset? target;
      for (var y = 0.0; y < box.height && target == null; y += 4) {
        for (var x = 0.0; x < box.width; x += 4) {
          if (scene.faceAt(Offset(x, y), box.size) == kFaceF) {
            target = Offset(x, y);
            break;
          }
        }
      }
      expect(target, isNotNull);
      await tester.tapAt(box.topLeft + target!);
      await tester.pump();
      expect(container.read(scanSessionProvider(3)).face, kFaceF);
    });
  });
}
