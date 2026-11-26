import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/cube/color_scheme.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/settings/app_settings.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/theme/app_colors.dart';
import 'package:cube_mentor/core/theme/sticker_palette.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/academy/academy_screen.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/features/home/home_screen.dart';
import 'package:cube_mentor/features/home/language_sheet.dart';
import 'package:cube_mentor/features/home/settings_sheet.dart';
import 'package:cube_mentor/features/patterns/patterns_screen.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/timer/timer_screen.dart';
import 'package:cube_mentor/features/train/train_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';

Future<SharedPreferences> _prefs([Map<String, Object> values = const {}]) {
  SharedPreferences.setMockInitialValues({'onboarding_done': true, ...values});
  return SharedPreferences.getInstance();
}

/// Pumps the whole app on a phone and returns its provider container.
Future<ProviderContainer> _pumpApp(
  WidgetTester tester,
  SharedPreferences prefs, {
  List<Override> overrides = const [],
}) async {
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
        scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
        clockProvider.overrideWithValue(() => DateTime(2026, 11, 16, 8)),
        ...overrides,
      ],
      child: const CubeMentorApp(),
    ),
  );
  await _advance(tester, 2);
  return ProviderScope.containerOf(
    tester.element(find.byKey(const ValueKey('root-shell'))),
  );
}

/// The carousel and stage animate forever: pump fixed frames.
Future<void> _advance(WidgetTester tester, [int frames = 10]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

/// Taps the home action card [name] and lets its route open.
Future<void> _openCard(WidgetTester tester, String name) async {
  await tester.tap(find.byKey(ValueKey('home-$name')));
  await _advance(tester, 12);
}

Future<void> _openSettings(WidgetTester tester) async {
  await tester.tap(find.byKey(const ValueKey('settings-button')));
  await _advance(tester, 8);
  expect(find.byType(SettingsSheet), findsOneWidget);
}

void main() {
  group('home action cards', () {
    testWidgets('home shows the carousel and the four action cards', (
      tester,
    ) async {
      await _pumpApp(tester, await _prefs());
      expect(find.byKey(const ValueKey('cube-carousel')), findsOneWidget);
      for (final label in [
        'Scan & Solve',
        'Academy',
        'Cool Patterns',
        'Timer & Daily Challenge',
      ]) {
        expect(find.text(label), findsOneWidget);
      }
      // No dock and no single call to action any more.
      expect(find.byKey(const ValueKey('glass-dock')), findsNothing);
      expect(find.byKey(const ValueKey('open-solver')), findsNothing);
    });

    testWidgets('home fits on one screen in a balanced 2x2 grid', (
      tester,
    ) async {
      await _pumpApp(tester, await _prefs());
      expect(
        find.descendant(
          of: find.byType(HomeScreen),
          matching: find.byType(SingleChildScrollView),
        ),
        findsNothing,
      );
      final screen = tester.getRect(find.byType(HomeScreen));
      Rect card(String name) =>
          tester.getRect(find.byKey(ValueKey('home-$name')));
      final scan = card('scan-solve');
      final academy = card('academy');
      final patterns = card('patterns');
      final practice = card('practice');
      expect(practice.bottom, lessThanOrEqualTo(screen.bottom));
      expect(scan.top, academy.top);
      expect(patterns.top, practice.top);
      expect(scan.height, academy.height);
      expect(scan.width, closeTo(academy.width, 0.5));
      expect(scan.left, lessThan(academy.left));
      expect(patterns.top, greaterThan(scan.bottom));
      // The cards sit below the carousel.
      final carousel = tester.getRect(
        find.byKey(const ValueKey('cube-carousel')),
      );
      expect(scan.top, greaterThan(carousel.bottom));
    });

    testWidgets('every card shows the selected size', (tester) async {
      await _pumpApp(tester, await _prefs());
      for (final name in ['scan-solve', 'academy', 'patterns', 'practice']) {
        expect(
          find.descendant(
            of: find.byKey(ValueKey('home-$name')),
            matching: find.text('3×3'),
          ),
          findsOneWidget,
        );
      }
      await tester.tap(find.byKey(const ValueKey('size-5')));
      await _advance(tester, 12);
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('home-academy')),
          matching: find.text('5×5'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Scan & Solve offers the camera or the 3D cube for the '
        'selected size', (tester) async {
      await _pumpApp(tester, await _prefs());
      await tester.tap(find.byKey(const ValueKey('size-4')));
      await _advance(tester, 12);
      await _openCard(tester, 'scan-solve');
      expect(find.byKey(const ValueKey('scan-solve-sheet')), findsOneWidget);
      expect(find.text('Scan with camera'), findsOneWidget);
      expect(find.text('Open 3D cube'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('scan-choice-3d')));
      await _advance(tester, 12);
      expect(find.byKey(const ValueKey('scan-solve-sheet')), findsNothing);
      expect(find.byType(Solver3DScreen), findsOneWidget);
      expect(find.text('4×4 Playground'), findsOneWidget);
      await tester.pageBack();
      await _advance(tester, 12);

      await tester.tap(find.byKey(const ValueKey('size-2')));
      await _advance(tester, 12);
      await _openCard(tester, 'scan-solve');
      await tester.tap(find.byKey(const ValueKey('scan-choice-camera')));
      await _advance(tester, 12);
      final scanner = tester.widget<ScannerScreen>(find.byType(ScannerScreen));
      expect(scanner.size, 2);
      expect(scanner.embedded, isFalse);
    });

    testWidgets('Scan & Solve is off on the "coming soon" cube', (
      tester,
    ) async {
      await _pumpApp(tester, await _prefs());
      await tester.tap(find.byKey(const ValueKey('size-soon')));
      await _advance(tester, 12);
      await tester.tap(find.byKey(const ValueKey('home-scan-solve')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('scan-solve-sheet')), findsNothing);
      await tester.tap(find.byKey(const ValueKey('size-2')));
      await _advance(tester, 12);
      await _openCard(tester, 'scan-solve');
      expect(find.byKey(const ValueKey('scan-solve-sheet')), findsOneWidget);
    });

    testWidgets('Academy opens filtered to the selected size and can switch', (
      tester,
    ) async {
      await _pumpApp(
        tester,
        await _prefs({
          'academy_completed': ['basics'],
        }),
      );
      await tester.tap(find.byKey(const ValueKey('size-2')));
      await _advance(tester, 12);
      await _openCard(tester, 'academy');
      expect(find.byType(AcademyScreen), findsOneWidget);
      final hero = tester.getRect(
        find.byKey(const ValueKey('continue-learning')),
      );
      final progress = tester.getRect(
        find.byKey(const ValueKey('academy-progress')),
      );
      expect(hero.top, lessThan(progress.top), reason: 'hero on top');
      expect(find.text('Continue learning'), findsOneWidget);
      bool selected(String key) =>
          tester.widget<ChoiceChip>(find.byKey(ValueKey(key))).selected;
      expect(selected('academy-size-2'), isTrue);
      // Only the 2x2 lessons are listed.
      const beginner = 'Beginner 3×3: the 3 crowns';
      expect(find.text(beginner, skipOffstage: false), findsNothing);

      await tester.tap(find.byKey(const ValueKey('academy-size-all')));
      await _advance(tester, 4);
      expect(selected('academy-size-2'), isFalse);
      expect(selected('academy-size-all'), isTrue);
      expect(find.text(beginner, skipOffstage: false), findsOneWidget);
    });

    testWidgets('Cool Patterns opens on the selected size', (tester) async {
      await _pumpApp(tester, await _prefs());
      await tester.tap(find.byKey(const ValueKey('size-5')));
      await _advance(tester, 12);
      await _openCard(tester, 'patterns');
      final screen = tester.widget<PatternsScreen>(find.byType(PatternsScreen));
      expect(screen.initialSize, 5);
      expect(
        tester
            .widget<ChoiceChip>(find.byKey(const ValueKey('patterns-size-5')))
            .selected,
        isTrue,
      );
    });

    testWidgets('Timer & Daily Challenge holds the timer (on the selected '
        'size) and the daily challenge with its streak', (tester) async {
      await _pumpApp(
        tester,
        await _prefs({'daily_last_day': '2026-11-15', 'daily_streak': 4}),
      );
      await tester.tap(find.byKey(const ValueKey('size-4')));
      await _advance(tester, 12);
      await _openCard(tester, 'practice');
      expect(find.byType(TrainScreen), findsOneWidget);
      expect(find.text('Daily challenge'), findsOneWidget);
      expect(find.text('Speed timer'), findsOneWidget);
      expect(find.byKey(const ValueKey('streak-badge')), findsOneWidget);
      expect(find.text('4-day streak'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('train-timer')));
      await _advance(tester, 12);
      expect(tester.widget<TimerScreen>(find.byType(TimerScreen)).size, 4);
      await tester.pageBack();
      await _advance(tester, 12);
      expect(find.byType(TrainScreen), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('train-daily')));
      await _advance(tester, 12);
      expect(find.byType(DailyScreen), findsOneWidget);
    });

    testWidgets('in Hebrew the cards read right to left', (tester) async {
      await _pumpApp(tester, await _prefs({'app_locale': 'he'}));
      expect(find.text('סריקה ופתרון'), findsOneWidget);
      expect(find.text('האקדמיה'), findsOneWidget);
      expect(find.text('דוגמאות מגניבות'), findsOneWidget);
      expect(find.text('טיימר ואימון'), findsOneWidget);
      final scan = tester.getCenter(
        find.byKey(const ValueKey('home-scan-solve')),
      );
      final academy = tester.getCenter(
        find.byKey(const ValueKey('home-academy')),
      );
      expect(scan.dx, greaterThan(academy.dx));
    });
  });

  group('settings sheet', () {
    testWidgets('the gear sits next to the language button', (tester) async {
      await _pumpApp(tester, await _prefs());
      final gear = tester.getRect(
        find.byKey(const ValueKey('settings-button')),
      );
      final language = tester.getRect(
        find.byKey(const ValueKey('language-button')),
      );
      expect((gear.center.dy - language.center.dy).abs(), lessThan(2));
      await _openSettings(tester);
      for (final text in [
        'Settings',
        'Language',
        'Sound & haptics',
        'Default animation speed',
        'Reset progress',
      ]) {
        expect(find.text(text), findsOneWidget, reason: text);
      }
      // Without ads (desktop, tests) there are no consent choices to show;
      // ads_test.dart covers the entry where consent requires it.
      expect(find.text('Privacy & ads'), findsNothing);
      expect(find.text('Coming soon'), findsNothing);
    });

    testWidgets('the language row opens the language sheet', (tester) async {
      await _pumpApp(tester, await _prefs());
      await _openSettings(tester);
      await tester.tap(find.byKey(const ValueKey('settings-language')));
      await _advance(tester, 12);
      expect(find.byType(SettingsSheet), findsNothing);
      expect(find.byType(LanguageSheet), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('lang-he')));
      await _advance(tester, 8);
      expect(find.text('סריקה ופתרון'), findsOneWidget);
    });

    testWidgets('sound & haptics and the default speed persist and apply', (
      tester,
    ) async {
      final prefs = await _prefs();
      final container = await _pumpApp(tester, prefs);
      await _openSettings(tester);

      await tester.tap(find.byKey(const ValueKey('settings-haptics')));
      await _advance(tester, 2);
      expect(container.read(appSettingsProvider).soundHaptics, isFalse);
      expect(prefs.getBool('settings_sound_haptics'), isFalse);

      // Drag the slider all the way to its fastest end.
      final slider = find.byKey(const ValueKey('settings-speed'));
      await tester.ensureVisible(slider);
      await _advance(tester, 2);
      await tester.drag(slider, const Offset(1000, 0));
      await _advance(tester, 2);
      expect(container.read(appSettingsProvider).animationSpeed, 3);
      expect(prefs.getDouble('settings_animation_speed'), 3);
      expect(find.text('3.00×'), findsOneWidget);
      // A new 3D cube starts at the chosen speed.
      expect(container.read(cubeSessionProvider(5)).speed, 3);
    });

    testWidgets('the color scheme toggle persists and repaints stickers', (
      tester,
    ) async {
      final prefs = await _prefs();
      final container = await _pumpApp(tester, prefs);
      StickerPalette palette() =>
          tester.widget<StickerPalette>(find.byType(StickerPalette));
      expect(palette().scheme, CubeColorScheme.western);
      await _openSettings(tester);

      final row = find.byKey(const ValueKey('settings-color-scheme'));
      await tester.scrollUntilVisible(
        row,
        100,
        scrollable: find.descendant(
          of: find.byKey(const ValueKey('settings-sheet')),
          matching: find.byType(Scrollable),
        ),
      );
      expect(
        find.text('White opposite yellow, blue opposite green'),
        findsOneWidget,
      );
      await tester.tap(find.byKey(const ValueKey('color-scheme-japanese')));
      await _advance(tester, 2);

      expect(
        container.read(appSettingsProvider).colorScheme,
        CubeColorScheme.japanese,
      );
      expect(prefs.getString('settings_color_scheme'), 'japanese');
      expect(
        find.text('White opposite blue, yellow opposite green'),
        findsOneWidget,
      );
      // Every route now paints logical yellow as blue and vice versa.
      expect(palette().scheme, CubeColorScheme.japanese);
      final colors = StickerPalette.colorsFor(CubeColorScheme.japanese);
      expect(
        colors[StickerColor.yellow],
        AppColors.stickers[StickerColor.blue],
      );
      expect(
        colors[StickerColor.blue],
        AppColors.stickers[StickerColor.yellow],
      );
    });

    testWidgets('a saved Japanese scheme is restored on launch', (
      tester,
    ) async {
      final prefs = await _prefs({'settings_color_scheme': 'japanese'});
      final container = await _pumpApp(tester, prefs);
      expect(container.read(cubeColorSchemeProvider), CubeColorScheme.japanese);
      expect(
        tester.widget<StickerPalette>(find.byType(StickerPalette)).scheme,
        CubeColorScheme.japanese,
      );
    });

    testWidgets('the feedback card opens an email draft to the team', (
      tester,
    ) async {
      final opened = <Uri>[];
      await _pumpApp(
        tester,
        await _prefs(),
        overrides: [
          emailLauncherProvider.overrideWithValue((uri) async {
            opened.add(uri);
            return true;
          }),
        ],
      );
      await _openSettings(tester);
      final card = find.byKey(const ValueKey('settings-feedback'));
      await tester.ensureVisible(card);
      await _advance(tester, 2);
      expect(find.text('Shape the Next Version'), findsOneWidget);
      expect(find.text('MyCubeMentor@gmail.com'), findsOneWidget);
      await tester.tap(card);
      await _advance(tester, 2);
      expect(opened, hasLength(1));
      expect(opened.single.scheme, 'mailto');
      expect(opened.single.path, 'MyCubeMentor@gmail.com');
      expect(opened.single.queryParameters['subject'], 'CubeMentor Feedback');
      expect(find.byKey(const ValueKey('feedback-copied')), findsNothing);
    });

    testWidgets('without an email app the address is copied instead', (
      tester,
    ) async {
      String? copied;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.setData') {
            copied = (call.arguments as Map)['text'] as String?;
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );
      await _pumpApp(
        tester,
        await _prefs(),
        overrides: [
          emailLauncherProvider.overrideWithValue((_) async => false),
        ],
      );
      await _openSettings(tester);
      final card = find.byKey(const ValueKey('settings-feedback'));
      await tester.ensureVisible(card);
      await _advance(tester, 2);
      await tester.tap(card);
      await _advance(tester, 4);
      expect(copied, 'MyCubeMentor@gmail.com');
      expect(find.byKey(const ValueKey('feedback-copied')), findsOneWidget);
    });

    testWidgets('reset asks first; cancel keeps, confirm clears progress', (
      tester,
    ) async {
      final prefs = await _prefs({
        'academy_completed': ['basics', 'cross'],
        'academy_last': 'cross',
        'daily_last_day': '2026-11-16',
        'daily_streak': 5,
        'daily_best_streak': 7,
      });
      await _pumpApp(tester, prefs);
      await _openSettings(tester);

      await tester.ensureVisible(find.byKey(const ValueKey('settings-reset')));
      await _advance(tester, 2);
      await tester.tap(find.byKey(const ValueKey('settings-reset')));
      await _advance(tester, 8);
      expect(find.text('Reset all progress?'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('reset-cancel')));
      await _advance(tester, 8);
      expect(prefs.getInt('daily_streak'), 5);
      expect(prefs.getStringList('academy_completed'), hasLength(2));

      await tester.ensureVisible(find.byKey(const ValueKey('settings-reset')));
      await _advance(tester, 2);
      await tester.tap(find.byKey(const ValueKey('settings-reset')));
      await _advance(tester, 8);
      await tester.tap(find.byKey(const ValueKey('reset-confirm')));
      await _advance(tester, 8);
      expect(prefs.getStringList('academy_completed'), isNull);
      expect(prefs.getString('academy_last'), isNull);
      expect(prefs.getInt('daily_streak'), isNull);
      expect(prefs.getInt('daily_best_streak'), isNull);
      expect(find.text('Progress reset.'), findsOneWidget);
    });
  });
}
