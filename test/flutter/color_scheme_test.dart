import 'package:cube_mentor/core/cube/color_scheme.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/l10n/move_words.dart';
import 'package:cube_mentor/core/settings/app_settings.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/core/theme/app_colors.dart';
import 'package:cube_mentor/core/theme/sticker_palette.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/academy/widgets/hold_prompt.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/solver_3d/widgets/solve_banner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'fake_scan_analyzer.dart';
import 'scanner_test.dart' show faceSamples, scrambledFacelets;

/// [facelets] as a Japanese-scheme cube shows them: blue and yellow swapped.
String _japanesePhysical(String facelets) => facelets
    .split('')
    .map(
      (c) => switch (c) {
        'Y' => 'B',
        'B' => 'Y',
        _ => c,
      },
    )
    .join();

void main() {
  final en = lookupAppLocalizations(const Locale('en'));

  group('color scheme model', () {
    test('Western shows every logical color as itself', () {
      for (final color in StickerColor.values) {
        expect(CubeColorScheme.western.shown(color), color);
      }
    });

    test('Japanese swaps blue and yellow, so white faces blue', () {
      const jp = CubeColorScheme.japanese;
      expect(jp.shown(StickerColor.yellow), StickerColor.blue);
      expect(jp.shown(StickerColor.blue), StickerColor.yellow);
      for (final color in [
        StickerColor.white,
        StickerColor.green,
        StickerColor.red,
        StickerColor.orange,
      ]) {
        expect(jp.shown(color), color);
      }
      // Opposite pairs on the solved cube, as the user sees them.
      StickerColor seen(IVec3 normal) => jp.shown(kSolvedColors[normal]!);
      expect(seen(kNormalUp), StickerColor.white);
      expect(seen(kNormalDown), StickerColor.blue);
      expect(seen(kNormalFront), StickerColor.green);
      expect(seen(kNormalBack), StickerColor.yellow);
      // Reading the scanner's colors back is the inverse mapping.
      for (final color in StickerColor.values) {
        expect(jp.logicalOf(jp.shown(color)), color);
      }
    });

    test('unknown stored names fall back to Western', () {
      expect(CubeColorScheme.fromName('japanese'), CubeColorScheme.japanese);
      expect(CubeColorScheme.fromName(null), CubeColorScheme.western);
      expect(CubeColorScheme.fromName('bogus'), CubeColorScheme.western);
    });
  });

  group('names follow the scheme', () {
    test('color, piece and hold-prompt names', () {
      const jp = CubeColorScheme.japanese;
      expect(colorName(en, StickerColor.yellow), 'yellow');
      expect(colorName(en, StickerColor.yellow, scheme: jp), 'blue');
      expect(pieceName(en, 'WB'), 'white-blue');
      expect(pieceName(en, 'WB', scheme: jp), 'white-yellow');
      expect(
        holdPrompt(en, StickerColor.yellow, StickerColor.green, scheme: jp),
        en.holdPrompt('blue', 'green'),
      );
      const step = SolveStep(
        cubeState: '',
        phaseName: 'lblCross',
        moveNotation: 'F2',
        explanationKey: 'lblCrossEdge',
        pieceColors: 'WB',
      );
      expect(solveExplanation(en, step, scheme: jp), contains('white-yellow'));
    });
  });

  group('sticker palette', () {
    testWidgets('widgets paint logical colors in the scheme in effect', (
      tester,
    ) async {
      Future<Color?> swatchTop(CubeColorScheme scheme) async {
        await tester.pumpWidget(
          StickerPalette(
            scheme: scheme,
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: HoldSwatch(
                top: StickerColor.yellow,
                front: StickerColor.green,
              ),
            ),
          ),
        );
        final box = tester.widgetList<Container>(find.byType(Container)).first;
        return (box.decoration! as BoxDecoration).color;
      }

      expect(
        await swatchTop(CubeColorScheme.western),
        AppColors.stickers[StickerColor.yellow],
      );
      expect(
        await swatchTop(CubeColorScheme.japanese),
        AppColors.stickers[StickerColor.blue],
      );
    });

    testWidgets('without a palette above, Western is used', (tester) async {
      late CubeColorScheme scheme;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            scheme = StickerPalette.schemeOf(context);
            return const SizedBox();
          },
        ),
      );
      expect(scheme, CubeColorScheme.western);
    });
  });

  group('scanner color mapping', () {
    ProviderContainer containerFor(
      CubeColorScheme scheme,
      FakeScanAnalyzer analyzer,
    ) {
      final c = ProviderContainer(
        overrides: [
          scanAnalyzerProvider.overrideWithValue(analyzer),
          cubeColorSchemeProvider.overrideWithValue(scheme),
        ],
      );
      addTearDown(c.dispose);
      return c;
    }

    void captureAll(ProviderContainer c, int size, String physical) {
      final sub = c.listen(scanSessionProvider(size), (_, _) {});
      addTearDown(sub.close);
      final ctrl = c.read(scanSessionProvider(size).notifier);
      for (var i = 0; i < 6; i++) {
        final face = c.read(scanSessionProvider(size)).face;
        ctrl.capture(faceSamples(physical, size, face));
      }
    }

    test('a Japanese-scheme cube is read back as logical colors', () {
      for (final size in [2, 3, 4]) {
        final logical = scrambledFacelets(size, 40 + size);
        final analyzer = FakeScanAnalyzer();
        final c = containerFor(CubeColorScheme.japanese, analyzer);
        captureAll(c, size, _japanesePhysical(logical));
        final session = c.read(scanSessionProvider(size));
        expect(session.phase, ScanPhase.review, reason: '$size');
        expect(session.facelets, logical, reason: '$size');
        expect(session.cube!.toFacelets(), logical, reason: '$size');
        expect(session.isValid, isTrue, reason: '$size');
        // The logical colors are validated again after the swap.
        expect(analyzer.validatedConfidence.length, greaterThanOrEqualTo(2));
      }
    });

    test('the Western scheme keeps the classified colors as they are', () {
      final logical = scrambledFacelets(3, 7);
      final c = containerFor(CubeColorScheme.western, FakeScanAnalyzer());
      captureAll(c, 3, logical);
      expect(c.read(scanSessionProvider(3)).facelets, logical);
    });
  });
}
