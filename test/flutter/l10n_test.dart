import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/ads/reward_prompt.dart';
import 'package:cube_mentor/core/celebration/celebration.dart';
import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/l10n/app_delegates.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/core/settings/locale_controller.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/core/theme/app_theme.dart';
import 'package:cube_mentor/features/academy/academy_screen.dart';
import 'package:cube_mentor/features/academy/lesson_screen.dart';
import 'package:cube_mentor/features/academy/model/lesson.dart';
import 'package:cube_mentor/features/academy/model/lesson_catalog.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/features/home/home_screen.dart';
import 'package:cube_mentor/features/home/nickname_prompt.dart';
import 'package:cube_mentor/features/home/onboarding_screen.dart';
import 'package:cube_mentor/features/home/privacy_policy_screen.dart';
import 'package:cube_mentor/features/home/root_shell.dart';
import 'package:cube_mentor/features/home/settings_sheet.dart';
import 'package:cube_mentor/features/patterns/patterns_screen.dart';
import 'package:cube_mentor/features/scanner/camera/camera_scan_view.dart';
import 'package:cube_mentor/features/scanner/camera/frame_sampler.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/scanner/widgets/lighting_tip.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/model/guide_script.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/solver_3d/widgets/solve_dialogs.dart';
import 'package:cube_mentor/features/timer/timer_screen.dart';
import 'package:cube_mentor/features/train/train_screen.dart';
import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_ad_service.dart';
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
    test('twenty-two languages, English first, every one fully loadable', () {
      expect(kAppLanguages.first.tag, 'en');
      expect(kAppLanguages, hasLength(22));
      expect(kAppLanguages.map((l) => l.locale.languageCode).toSet(), {
        'en', 'he', 'es', 'pt', 'id', 'hi', 'fil', 'ar', 'fr', //
        'de', 'ru', 'pl', 'tr', 'ja', 'ko', 'zh', 'vi', 'my', 'bn', 'tt',
      });
      expect(
        kAppLanguages.map((l) => l.tag),
        containsAll(['pt', 'pt_BR', 'zh', 'zh_TW']),
      );
      for (final language in kAppLanguages) {
        expect(
          AppLocalizations.delegate.isSupported(language.locale),
          isTrue,
          reason: language.tag,
        );
        // Material/Cupertino widgets (dialogs, text fields) must also have
        // strings for every app language (English for Tatar).
        for (final type in [MaterialLocalizations, CupertinoLocalizations]) {
          expect(
            appDelegatesSupport(type, language.locale),
            isTrue,
            reason: '${language.tag} $type',
          );
        }
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

    test(
      'Tatar falls back to English Material strings, Bengali has its own',
      () async {
        expect(
          GlobalMaterialLocalizations.delegate.isSupported(const Locale('tt')),
          isFalse,
        );
        final tt = await const FallbackMaterialLocalizationsDelegate().load(
          const Locale('tt'),
        );
        expect(tt.okButtonLabel, 'OK');
        expect(
          const FallbackMaterialLocalizationsDelegate().isSupported(
            const Locale('bn'),
          ),
          isFalse,
        );
        expect(lookupAppLocalizations(const Locale('bn')).language, 'ভাষা');
        expect(lookupAppLocalizations(const Locale('tt')).language, 'Тел');
        expect(
          lookupAppLocalizations(const Locale('tt')).moveCount(3),
          '3 хәрәкәт',
        );
        expect(
          lookupAppLocalizations(const Locale('bn')).moveCount(3),
          '3টি চাল',
        );
      },
    );

    test('Simplified and Traditional Chinese differ', () {
      final hans = lookupAppLocalizations(const Locale('zh'));
      final hant = lookupAppLocalizations(const Locale('zh', 'TW'));
      expect(hans.language, '语言');
      expect(hant.language, '語言');
      expect(hant.localeName, 'zh_TW');
    });

    test('new languages speak their own words', () {
      expect(lookupAppLocalizations(const Locale('vi')).language, 'Ngôn ngữ');
      expect(lookupAppLocalizations(const Locale('my')).language, 'ဘာသာစကား');
      expect(lookupAppLocalizations(const Locale('pl')).language, 'Język');
      expect(lookupAppLocalizations(const Locale('tr')).language, 'Dil');
      expect(
        lookupAppLocalizations(const Locale('tr')).moveCount(3),
        '3 hamle',
      );
      expect(lookupAppLocalizations(const Locale('vi')).moveCount(3), '3 nước');
    });

    test('Burmese and Vietnamese get extra line height', () {
      expect(AppTheme.minLineHeightFor('my'), AppTheme.burmeseMinHeight);
      expect(AppTheme.minLineHeightFor('vi'), AppTheme.tallScriptMinHeight);
      expect(AppTheme.minLineHeightFor('hi'), AppTheme.tallScriptMinHeight);
      expect(AppTheme.minLineHeightFor('en'), isNull);
      final body = AppTheme.dark(languageCode: 'my').textTheme.bodyMedium!;
      expect(body.height, greaterThanOrEqualTo(AppTheme.burmeseMinHeight));
      expect(body.leadingDistribution, TextLeadingDistribution.even);
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
      final pl = lookupAppLocalizations(const Locale('pl'));
      expect(pl.moveCount(1), '1 ruch');
      expect(pl.moveCount(3), '3 ruchy');
      expect(pl.moveCount(5), '5 ruchów');
      expect(pl.moveCount(22), '22 ruchy');
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
      expect(tag(const Locale('zh')), 'zh');
      expect(tag(const Locale('zh', 'TW')), 'zh_TW');
      expect(tag(const Locale('zh', 'HK')), 'zh_TW');
      expect(
        tag(const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')),
        'zh_TW',
      );
      expect(tag(const Locale('vi', 'VN')), 'vi');
      expect(tag(const Locale('my', 'MM')), 'my');
      expect(tag(const Locale('pl', 'PL')), 'pl');
      expect(tag(const Locale('tr', 'TR')), 'tr');
      expect(tag(const Locale('sv')), isNull);
      expect(tag(const Locale('bn', 'BD')), 'bn');
      expect(tag(const Locale('tt', 'RU')), 'tt');
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
    SharedPreferences.setMockInitialValues({'onboarding_done': true});
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
      SharedPreferences.setMockInitialValues({
        'app_locale': language.tag,
        // A long name for the celebration cards.
        'user_nickname': 'Maximiliana Alexandra',
      });
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
              clockProvider.overrideWithValue(
                () => DateTime.utc(2026, 11, 16, 8),
              ),
              scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
              // Banners, "Watch ad" badges and the privacy entry on.
              ...adsOnOverrides(),
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
      await show(const AcademyScreen(initialSize: 2));
      await show(const TrainScreen());
      // The root shell: the home cards and the Scan & Solve choice sheet.
      await show(const RootShell(), scroll: false);
      await tester.tap(find.byKey(const ValueKey('home-scan-solve')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('scan-solve-sheet')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'scan & solve sheet');
      // Lessons open on their goal card, then the lesson itself.
      for (final id in ['bigParity', 'twistCorners', 'f2l', 'corners']) {
        await show(
          LessonScreen(lesson: kLessons.firstWhere((l) => l.id == id)),
        );
        expect(find.byKey(const ValueKey('lesson-intro')), findsOneWidget);
        expect(find.byKey(const ValueKey('lesson-stages')), findsOneWidget);
        await tester.ensureVisible(find.byKey(const ValueKey('intro-start')));
        await tester.tap(find.byKey(const ValueKey('intro-start')));
        await _advance(tester, 4);
        expect(find.byKey(const ValueKey('lesson-part')), findsOneWidget);
        expect(find.byKey(const ValueKey('lesson-cue')), findsOneWidget);
        expect(tester.takeException(), isNull, reason: 'lesson $id');
        // Stage 3 (a walkthrough with a bonus case) and stage 4.
        await tester.tap(find.byKey(const ValueKey('lesson-stage-2')));
        await _advance(tester, 4);
        await tester.tap(find.byKey(const ValueKey('lesson-next')));
        await _advance(tester, 12);
        expect(find.byKey(const ValueKey('lesson-cue')), findsOneWidget);
        expect(tester.takeException(), isNull, reason: 'walkthrough $id');
        await tester.tap(find.byKey(const ValueKey('lesson-stage-3')));
        await _advance(tester, 4);
        expect(find.byKey(const ValueKey('lesson-complete')), findsOneWidget);
        expect(tester.takeException(), isNull, reason: 'complete $id');
      }
      // Free practice from a finished lesson, with its goal banner.
      final practice = lookupAppLocalizations(language.locale);
      await show(
        Solver3DScreen(
          size: 3,
          initialCube: CubeState.solved(3)
              .applyAll(MoveNotation.parseSequence("R U R' U'", 3)),
          title: practice.lessonFreePractice,
          practiceBanner: practice.freePracticeBanner(
            lessonTitle(practice, 'yellowCorners'),
          ),
        ),
        scroll: false,
      );
      expect(find.byKey(const ValueKey('practice-banner')), findsOneWidget);
      // The timer with a recorded solve: stat captions, the +2 / DNF /
      // Delete captions, and the inspection intro.
      await prefs.setString(
        'timer_history_3',
        '[{"ms":12345,"s":"","at":0,"p":0}]',
      );
      await prefs.setBool('timer_inspection', true);
      await show(const TimerScreen(size: 3));
      expect(find.byKey(const ValueKey('timer-dnf-caption')), findsOneWidget);
      expect(find.byKey(const ValueKey('timer-stat-ao5-sub')), findsOneWidget);
      // The 15-second countdown after a tap.
      await tester.tap(find.byKey(const ValueKey('timer-pad')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('15'), findsWidgets);
      expect(tester.takeException(), isNull, reason: 'inspection countdown');
      await prefs.remove('timer_history_3');
      await prefs.remove('timer_inspection');
      await show(const DailyScreen());
      // The daily scramble's text moves, unfolded.
      await tester.ensureVisible(
        find.byKey(const ValueKey('daily-moves-toggle')),
      );
      await tester.tap(find.byKey(const ValueKey('daily-moves-toggle')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('daily-step-0')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'daily text moves');
      // After timed solves: today's best time, the personal best, a
      // 10-day milestone and the log of recent days on the stats card.
      await prefs.setString('daily_last_day', '2026-11-16');
      await prefs.setInt('daily_streak', 10);
      await prefs.setString('daily_time_day', '2026-11-16');
      await prefs.setInt('daily_time_ms', 44870);
      await prefs.setInt('daily_best_time_ms', 38420);
      await prefs.setString(
        'daily_log',
        [
          for (var d = 7; d <= 16; d++)
            '{"d":"2026-11-${d.toString().padLeft(2, '0')}","t":${40000 + d}}',
        ].toString(),
      );
      await show(const DailyScreen(), scroll: false);
      expect(find.byKey(const ValueKey('daily-best-time')), findsOneWidget);
      expect(find.byKey(const ValueKey('daily-personal-best')), findsOneWidget);
      expect(find.byKey(const ValueKey('daily-milestone')), findsOneWidget);
      expect(find.byKey(const ValueKey('daily-log')), findsOneWidget);
      await show(const DailyScreen());
      for (final key in [
        'daily_last_day',
        'daily_streak',
        'daily_time_day',
        'daily_time_ms',
        'daily_best_time_ms',
        'daily_log',
      ]) {
        await prefs.remove(key);
      }
      // The completion summary after today's challenge.
      await show(
        const DailyCompleteScreen(
          millis: 62350,
          streak: 15,
          bestStreak: 115,
          bestMillis: 58410,
          newBest: true,
        ),
      );
      expect(find.byKey(const ValueKey('daily-congrats')), findsOneWidget);
      // The first-launch intro, every page.
      await show(const OnboardingScreen(), scroll: false);
      for (var page = 1; page < 3; page++) {
        await tester.tap(find.byKey(const ValueKey('onboarding-next')));
        await _advance(tester, 10);
        expect(find.byKey(ValueKey('onboarding-page-$page')), findsOneWidget);
        expect(tester.takeException(), isNull, reason: 'onboarding $page');
      }
      // The privacy policy, the Playground's solve choice and the end of a
      // guided solve.
      await show(const PrivacyPolicyScreen());
      await show(
        const Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SolveChoiceSheet(),
          ),
        ),
        scroll: false,
      );
      await show(const Scaffold(body: GuidedSolvedDialog()), scroll: false);
      // The camera recovery state, with Try again and manual entry.
      await show(
        Scaffold(
          body: CameraProblemView(
            problem: CameraProblem.denied,
            onManual: () {},
            onRetry: () {},
          ),
        ),
        scroll: false,
      );
      // Solving the daily scramble on the 3D cube: clock, Undo and Reset.
      await show(
        Solver3DScreen(
          size: 3,
          initialCube: CubeState.solved(3)
              .applyAll(MoveNotation.parseSequence('R U', 3)),
          challenge: true,
        ),
        scroll: false,
      );
      expect(find.byKey(const ValueKey('challenge-bar')), findsOneWidget);
      expect(find.byKey(const ValueKey('challenge-clock')), findsOneWidget);
      // The end of the scramble guide: scrambled, with the next steps.
      await show(
        Solver3DScreen(
          size: 3,
          guide: GuideScript(
            start: CubeState.solved(3),
            moves: MoveNotation.parseSequence('R', 3),
            phase: 'dailyScramble',
            explanation: 'dailyScrambleStep',
          ),
          guideDoneAction: Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: Builder(
                    builder: (context) => Text(
                      AppLocalizations.of(context).dailyTimeIt,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        scroll: false,
      );
      expect(find.byKey(const ValueKey('guide-counter')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('playback-next')));
      await _advance(tester, 16);
      expect(
        find.byKey(const ValueKey('guide-complete-title')),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull, reason: 'scrambled card');
      await show(const PatternsScreen());
      // A 4x4 page: size chips with counts, open and locked padlocks, then
      // the 3D preview + "watch a video" sheet from a locked pattern.
      await show(const PatternsScreen(initialSize: 4), scroll: false);
      await tester.ensureVisible(
        find.byKey(const ValueKey('pattern-cubeInCube')),
      );
      await tester.pump();
      await tester.tap(find.byKey(const ValueKey('pattern-cubeInCube')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('reward-unlock-sheet')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'pattern unlock sheet');
      // The big-cube and lesson unlock sheets (longest bodies).
      for (final big in [true, false]) {
        await show(
          Scaffold(
            body: Align(
              alignment: Alignment.bottomCenter,
              child: Builder(
                builder: (context) {
                  final l10n = AppLocalizations.of(context);
                  return RewardUnlockSheet(
                    title: big
                        ? l10n.bigCubeUnlockTitle
                        : lessonTitle(l10n, 'yellowCorners'),
                    body: big
                        ? l10n.bigCubeUnlockBody(24)
                        : l10n.lessonUnlockBody(24),
                  );
                },
              ),
            ),
          ),
          scroll: false,
        );
      }
      // The double-turn pill above the cube, on a guided R2.
      await show(
        Solver3DScreen(
          size: 3,
          guide: GuideScript(
            start: CubeState.solved(3),
            moves: MoveNotation.parseSequence('R2', 3),
            phase: 'pattern',
            explanation: 'patternStep',
          ),
        ),
        scroll: false,
      );
      expect(find.byKey(const ValueKey('double-turn-badge')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'double-turn badge');
      // The Settings nickname dialog.
      await show(const Scaffold(body: NicknameDialog()), scroll: false);
      expect(find.byKey(const ValueKey('nickname-prompt')), findsOneWidget);
      // Celebration cards with a long name, full size and compact.
      for (final compact in [false, true]) {
        await show(
          Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => CelebrationCard(
                  compact: compact,
                  message: AppLocalizations.of(context).celebrateDailyDone,
                ),
              ),
            ),
          ),
          scroll: false,
        );
        expect(find.byKey(const ValueKey('celebration-card')), findsOneWidget);
      }
      // Settings, with the feedback card, on a small phone.
      await show(const Scaffold(body: SettingsSheet()));

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
      // Solve on a solved cube: the floating "already solved" pill.
      await tester.tap(find.byKey(const ValueKey('solve')));
      await _advance(tester, 4);
      expect(find.byKey(const ValueKey('solve-notice')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'solved notice');
      await tester.pump(const Duration(seconds: 2));
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
      // Fast or guided: the choice sheet, then the guided solve.
      expect(find.byKey(const ValueKey('solve-choice-sheet')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('solve-choice-guided')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('stage-title')), findsOneWidget);
      expect(find.byKey(const ValueKey('solve-mode')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'guided banner');
      // Fast mode: the move-count headline (past the 1.1 goal card).
      if (find.byKey(const ValueKey('intro-start')).evaluate().isNotEmpty) {
        await tester.ensureVisible(find.byKey(const ValueKey('intro-start')));
        await tester.tap(find.byKey(const ValueKey('intro-start')));
        await _advance(tester, 8);
      }
      await tester.tap(find.byKey(const ValueKey('solve-mode-fast')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('fast-move-count')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'fast move count');

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

      // The settings sheet and its reset confirmation.
      await show(const HomeScreen(), scroll: false);
      await tester.tap(find.byKey(const ValueKey('settings-button')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('settings-sheet')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'settings sheet');
      await tester.ensureVisible(find.byKey(const ValueKey('settings-reset')));
      await tester.pump();
      await tester.tap(find.byKey(const ValueKey('settings-reset')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('reset-dialog')), findsOneWidget);
      expect(tester.takeException(), isNull, reason: 'reset dialog');

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
