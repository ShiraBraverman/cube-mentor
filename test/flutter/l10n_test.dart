import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/core/settings/locale_controller.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/features/academy/academy_screen.dart';
import 'package:cube_mentor/features/academy/lesson_screen.dart';
import 'package:cube_mentor/features/academy/model/lesson.dart';
import 'package:cube_mentor/features/academy/model/lesson_catalog.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/features/home/home_screen.dart';
import 'package:cube_mentor/features/patterns/patterns_screen.dart';
import 'package:cube_mentor/features/scanner/camera/frame_sampler.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/scanner/widgets/lighting_tip.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/model/guide_script.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/timer/timer_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';
import 'fake_scrambler.dart';
import 'scanner_test.dart' show faceSamples, scrambledFacelets;
import 'test_app.dart';

Future<void> _advance(WidgetTester tester, [int frames = 12]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

TextDirection _directionOf(WidgetTester tester) =>
    Directionality.of(tester.element(find.byType(Scaffold).first));

/// A small phone (360 x 740 dp), where long translations overflow first.
void _smallPhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(1080, 2220);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

void main() {
  group('supported languages', () {
    test('fourteen languages, English first, every one fully loadable', () {
      expect(kAppLanguages.first.tag, 'en');
      expect(kAppLanguages.map((l) => l.locale.languageCode).toSet(), {
        'en', 'he', 'es', 'pt', 'id', 'hi', 'fil', //
        'ar', 'fr', 'de', 'ru', 'ja', 'ko', 'zh',
      });
      expect(kAppLanguages.map((l) => l.tag), containsAll(['pt', 'pt_BR']));
      for (final language in kAppLanguages) {
        expect(
          AppLocalizations.delegate.isSupported(language.locale),
          isTrue,
          reason: language.tag,
        );
        // Material/Cupertino widgets (dialogs, text fields) must also have
        // their own strings for every app language.
        expect(
          GlobalMaterialLocalizations.delegate.isSupported(language.locale),
          isTrue,
          reason: language.tag,
        );
        final l10n = lookupAppLocalizations(language.locale);
        expect(l10n.localeName, startsWith(language.locale.languageCode));
      }
    });

    test('every lesson, track and step is translated in every language', () {
      final en = lookupAppLocalizations(const Locale('en'));
      for (final language in kAppLanguages.skip(1)) {
        final l10n = lookupAppLocalizations(language.locale);
        expect(l10n.chooseCubeSize, isNot(en.chooseCubeSize));
        for (final lesson in kLessons) {
          expect(lessonTitle(l10n, lesson.id), isNot(lesson.id));
          for (final step in lesson.steps) {
            expect(lessonStepBody(l10n, step.id), isNot(step.id));
          }
        }
        for (final track in LessonTrack.values) {
          expect(trackTitle(l10n, track), isNotEmpty);
        }
      }
    });

    test('Brazilian and European Portuguese differ', () {
      final br = lookupAppLocalizations(const Locale('pt', 'BR'));
      final pt = lookupAppLocalizations(const Locale('pt'));
      expect(br.scanUseCamera, 'Escanear com a câmera');
      expect(pt.scanUseCamera, 'Digitalizar com a câmara');
    });

    test('plurals follow each language', () {
      final ru = lookupAppLocalizations(const Locale('ru'));
      expect(ru.moveCount(1), '1 ход');
      expect(ru.moveCount(3), '3 хода');
      expect(ru.moveCount(5), '5 ходов');
      final ar = lookupAppLocalizations(const Locale('ar'));
      expect(ar.moveCount(2), 'حركتان');
      expect(ar.moveCount(3), '3 حركات');
    });

    test('device locales map to a shipped language', () {
      String? tag(Locale l) => matchDeviceLocale(l)?.tag;
      expect(tag(const Locale('pt', 'BR')), 'pt_BR');
      expect(tag(const Locale('pt', 'PT')), 'pt');
      expect(tag(const Locale('pt')), 'pt_BR');
      expect(tag(const Locale('es', 'MX')), 'es');
      expect(tag(const Locale('tl', 'PH')), 'fil');
      expect(tag(const Locale('iw')), 'he');
      expect(tag(const Locale('in')), 'id');
      expect(tag(const Locale('zh', 'CN')), 'zh');
      expect(tag(const Locale('sv')), isNull);
    });
  });

  group('locale controller', () {
    Future<ProviderContainer> container(
      Map<String, Object> saved,
      List<Locale> device,
    ) async {
      SharedPreferences.setMockInitialValues(saved);
      final prefs = await SharedPreferences.getInstance();
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          deviceLocalesProvider.overrideWithValue(device),
        ],
      );
      addTearDown(c.dispose);
      return c;
    }

    test('first launch follows a supported device language', () async {
      final c = await container({}, const [Locale('de', 'AT')]);
      expect(c.read(localeProvider), const Locale('de'));
    });

    test('falls back through the device list, then to English', () async {
      final c = await container({}, const [Locale('sv'), Locale('ja')]);
      expect(c.read(localeProvider), const Locale('ja'));
      final d = await container({}, const [Locale('sv'), Locale('fi')]);
      expect(d.read(localeProvider), const Locale('en'));
    });

    test('a saved choice wins over the device and persists', () async {
      final c = await container({'app_locale': 'pt_BR'}, const [Locale('fr')]);
      expect(c.read(localeProvider), const Locale('pt', 'BR'));
      await c.read(localeProvider.notifier).setLocale(const Locale('ko'));
      final prefs = c.read(sharedPreferencesProvider);
      expect(prefs.getString('app_locale'), 'ko');
    });
  });

  testWidgets('language sheet: search, pick Arabic, flip to RTL', (
    tester,
  ) async {
    _smallPhone(tester);
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          deviceLocalesProvider.overrideWithValue(const [Locale('en', 'US')]),
          cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
        ],
        child: const CubeMentorApp(),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('EN'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('language-button')));
    await _advance(tester, 8);
    // Languages are listed in their own script; the list scrolls.
    expect(find.text('עברית'), findsOneWidget);
    expect(find.byKey(const ValueKey('lang-en')), findsOneWidget);
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('lang-zh')),
      200,
      scrollable: find.descendant(
        of: find.byKey(const ValueKey('language-list')),
        matching: find.byType(Scrollable),
      ),
    );
    expect(find.text('简体中文'), findsOneWidget);

    await tester.enterText(
      find.byKey(const ValueKey('language-search')),
      'arab',
    );
    await tester.pump();
    expect(find.text('العربية'), findsOneWidget);
    expect(find.text('עברית'), findsNothing);

    await tester.enterText(find.byKey(const ValueKey('language-search')), 'xx');
    await tester.pump();
    expect(find.text('No language matches your search.'), findsOneWidget);

    await tester.enterText(
      find.byKey(const ValueKey('language-search')),
      'ara',
    );
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('lang-ar')));
    await _advance(tester, 8);
    expect(find.text('اختر مكعبك'), findsOneWidget);
    expect(_directionOf(tester), TextDirection.rtl);
    expect(prefs.getString('app_locale'), 'ar');
    expect(find.text('AR'), findsOneWidget);
  });

  // Overflow and missing-string errors surface as test failures, so every
  // main screen is rendered on a small phone in every language.
  for (final language in kAppLanguages) {
    testWidgets('screens lay out without overflow in ${language.tag}', (
      tester,
    ) async {
      _smallPhone(tester);
      SharedPreferences.setMockInitialValues({'app_locale': language.tag});
      final prefs = await SharedPreferences.getInstance();

      // A guided (3-crown) plan for the playground banner.
      final guided = FakeCubeSolver(
        plan: const SolvePlan(
          method: 'lbl',
          steps: [
            SolveStep(
              cubeState: '',
              phaseName: 'lblYellowCorners',
              moveNotation: "U'",
              explanationKey: 'lblYellowCornersAlg',
              crown: 3,
              subStep: 3,
            ),
            SolveStep(
              cubeState: '',
              phaseName: 'lblYellowCornersOrient',
              moveNotation: "R'",
              explanationKey: 'lblCornerTwist',
              crown: 3,
              subStep: 4,
            ),
          ],
        ),
      );

      Future<void> show(Widget screen, {bool scroll = true}) async {
        await tester.pumpWidget(
          ProviderScope(
            // A fresh scope (and screen state) for every screen.
            key: UniqueKey(),
            overrides: [
              sharedPreferencesProvider.overrideWithValue(prefs),
              scramblerProvider.overrideWithValue(FakeScrambler()),
              cubeSolverProvider.overrideWithValue(guided),
              clockProvider.overrideWithValue(() => DateTime(2026, 11, 16, 8)),
              scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
            ],
            child: testApp(screen, locale: language.locale),
          ),
        );
        await _advance(tester, 4);
        // Scroll through long screens so every row gets laid out.
        final scrollables = find.byType(Scrollable);
        if (scroll && scrollables.evaluate().isNotEmpty) {
          for (var i = 0; i < 6; i++) {
            await tester.drag(scrollables.first, const Offset(0, -500));
            await tester.pump(const Duration(milliseconds: 50));
          }
        }
        expect(tester.takeException(), isNull, reason: '$screen');
      }

      await show(const HomeScreen());
      // The carousel's "coming soon" cube and its label.
      await show(const HomeScreen(), scroll: false);
      await tester.tap(find.byKey(const ValueKey('size-soon')));
      await _advance(tester, 10);
      expect(find.byKey(const ValueKey('carousel-mystery')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'coming soon cube');
      await show(const AcademyScreen());
      // Lessons open on their goal card, then the lesson itself.
      for (final id in ['bigParity', 'twistCorners']) {
        await show(
          LessonScreen(lesson: kLessons.firstWhere((l) => l.id == id)),
        );
        expect(find.byKey(const ValueKey('lesson-intro')), findsOneWidget);
        await tester.ensureVisible(find.byKey(const ValueKey('intro-start')));
        await tester.tap(find.byKey(const ValueKey('intro-start')));
        await _advance(tester, 4);
        expect(find.byKey(const ValueKey('lesson-part')), findsOneWidget);
        expect(tester.takeException(), isNull, reason: 'lesson $id');
      }
      await show(const TimerScreen(size: 3));
      await show(const DailyScreen());
      // The daily scramble's text moves, unfolded.
      await tester.ensureVisible(
        find.byKey(const ValueKey('daily-moves-toggle')),
      );
      await tester.tap(find.byKey(const ValueKey('daily-moves-toggle')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('daily-step-0')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'daily text moves');
      await show(const PatternsScreen());

      // The scanner while capturing: guide, two-step turn prompt, pills.
      await show(const ScannerScreen(size: 3, cameraOverride: false));
      final scanner = ProviderScope.containerOf(
        tester.element(find.byType(ScannerScreen)),
      );
      final scan = scanner.read(scanSessionProvider(3).notifier)..restart();
      final truth = scrambledFacelets(3, 6);
      for (final face in [kFaceF, kFaceR, kFaceB, kFaceL]) {
        scan.capture(faceSamples(truth, 3, face));
      }
      await _advance(tester, 40);
      expect(tester.takeException(), isNull, reason: 'scanner capture');

      // Lighting tips inside a preview-sized box.
      for (final hint in [LightingHint.glare, LightingHint.tooDark]) {
        await show(
          Scaffold(
            body: Center(
              child: SizedBox(
                width: 328,
                child: LightingTip(hint: hint, onTorch: () {}),
              ),
            ),
          ),
          scroll: false,
        );
        expect(tester.takeException(), isNull, reason: hint.name);
      }

      // The playground, then a guided solve: crown tracker, stage title
      // with its progress bar, and the Guided / Fast toggle.
      await show(Solver3DScreen(size: 4, initialCube: CubeState.solved(4)));
      // The notation pad bottom sheet (layer chips on a 4x4).
      await tester.tap(find.byKey(const ValueKey('toggle-notation')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('notation-sheet')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'notation sheet');
      await show(
        Solver3DScreen(
          size: 3,
          initialCube: CubeState.solved(3)
              .applyAll(MoveNotation.parseSequence('R U', 3)),
        ),
        scroll: false,
      );
      await tester.tap(find.byKey(const ValueKey('solve')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('stage-title')), findsOneWidget);
      expect(find.byKey(const ValueKey('solve-mode')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'guided banner');

      // A big cube's crown stage: "Stage 6 of 6: …" plus its sub-step line.
      await show(
        Solver3DScreen(
          size: 4,
          initialCube: CubeState.solved(4)
              .applyAll(MoveNotation.parseSequence('R U', 4)),
        ),
        scroll: false,
      );
      // The fake solver only claims 3x3: load its guided plan directly.
      await ProviderScope.containerOf(
        tester.element(find.byType(Solver3DScreen)),
      ).read(cubeSessionProvider(4).notifier).solve(SolveMethod.layerByLayer);
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('stage-substep')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'big-cube stage');

      // Mid-move prompts on a 4x4: a wide turn half swiped (Rw after R),
      // then a double turn half swiped (R2 after R).
      final wide = [
        for (final m in ['Rw', 'R2']) MoveNotation.parse(m, 4),
      ];
      await show(
        Solver3DScreen(
          size: 4,
          guide: GuideScript(
            start: CubeState.solved(4)
                .applyAll(wide.reversed.map((m) => m.inverse)),
            moves: wide,
            phase: 'pattern',
            explanation: 'patternStep',
          ),
        ),
        scroll: false,
      );
      final big = ProviderScope.containerOf(
        tester.element(find.byType(Solver3DScreen)),
      ).read(cubeSessionProvider(4).notifier);
      big.commitDirect(MoveNotation.parse('R', 4));
      await _advance(tester, 4);
      expect(find.byKey(const ValueKey('step-hint-wideInner')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'wide turn hint');
      big
        ..commitDirect(MoveNotation.parse('2R', 4))
        ..commitDirect(MoveNotation.parse('R', 4));
      await _advance(tester, 4);
      expect(find.byKey(const ValueKey('step-hint-halfway')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'double turn hint');

      // The language sheet itself.
      await show(const HomeScreen(), scroll: false);
      await tester.tap(find.byKey(const ValueKey('language-button')));
      await _advance(tester, 8);
      expect(find.byKey(ValueKey('lang-${language.tag}')), findsOneWidget);
      await tester.enterText(
        find.byKey(const ValueKey('language-search')),
        'zzz',
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  }
}
