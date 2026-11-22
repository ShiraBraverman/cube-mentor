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
import 'package:cube_mentor/features/home/home_controller.dart';
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
  SharedPreferences.setMockInitialValues({...values});
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
    tester.element(find.byKey(const ValueKey('glass-dock'))),
  );
}

/// The carousel and stage animate forever: pump fixed frames.
Future<void> _advance(WidgetTester tester, [int frames = 10]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

Future<void> _openTab(WidgetTester tester, String name) async {
  await tester.tap(find.byKey(ValueKey('tab-$name')));
  await _advance(tester, 4);
}

Future<void> _openSettings(WidgetTester tester) async {
  await tester.tap(find.byKey(const ValueKey('settings-button')));
  await _advance(tester, 8);
  expect(find.byType(SettingsSheet), findsOneWidget);
}

void main() {
  group('4-tab navigation', () {
    testWidgets('the dock shows Solve, Scan, Academy and Train', (
      tester,
    ) async {
      await _pumpApp(tester, await _prefs());
      for (final label in ['Solve', 'Scan', 'Academy', 'Train']) {
        expect(
          find.descendant(
            of: find.byKey(const ValueKey('glass-dock')),
            matching: find.text(label),
          ),
          findsOneWidget,
        );
      }
      // Solve is the decluttered hero: carousel plus one call to action.
      expect(find.byKey(const ValueKey('cube-carousel')), findsOneWidget);
      expect(find.text('Open 3D Cube & Solver'), findsOneWidget);
      expect(find.byKey(const ValueKey('continue-learning')), findsNothing);
      expect(find.byKey(const ValueKey('train-daily')), findsNothing);
    });

    testWidgets('the Solve tab fits on one screen without scrolling', (
      tester,
    ) async {
      await _pumpApp(tester, await _prefs());
      final home = find.byKey(const ValueKey('open-solver'));
      expect(home, findsOneWidget);
      // The call to action sits fully above the dock.
      final button = tester.getRect(home);
      final dock = tester.getRect(find.byKey(const ValueKey('glass-dock')));
      expect(button.bottom, lessThanOrEqualTo(dock.top));
      expect(
        find.descendant(
          of: find.byType(HomeScreen),
          matching: find.byType(SingleChildScrollView),
        ),
        findsNothing,
      );
    });

    testWidgets('the call to action opens the selected cube', (tester) async {
      await _pumpApp(tester, await _prefs());
      await tester.tap(find.byKey(const ValueKey('size-4')));
      await _advance(tester, 2);
      await tester.tap(find.byKey(const ValueKey('open-solver')));
      await _advance(tester, 12);
      expect(find.byType(Solver3DScreen), findsOneWidget);
      expect(find.text('4×4 Playground'), findsOneWidget);
    });

    testWidgets('the call to action is off on the "coming soon" cube', (
      tester,
    ) async {
      await _pumpApp(tester, await _prefs());
      await tester.tap(find.byKey(const ValueKey('size-soon')));
      await _advance(tester, 12);
      final button = tester.widget<ButtonStyleButton>(
        find.byKey(const ValueKey('open-solver')),
      );
      expect(button.onPressed, isNull);
      await tester.tap(find.byKey(const ValueKey('size-2')));
      await _advance(tester, 12);
      expect(
        tester
            .widget<ButtonStyleButton>(
              find.byKey(const ValueKey('open-solver')),
            )
            .onPressed,
        isNotNull,
      );
    });

    testWidgets('Scan opens the scanner for the selected size and releases '
        'it when leaving the tab', (tester) async {
      await _pumpApp(tester, await _prefs());
      await tester.tap(find.byKey(const ValueKey('size-2')));
      await _advance(tester, 4);
      expect(find.byType(ScannerScreen), findsNothing);

      await _openTab(tester, 'scan');
      final scanner = tester.widget<ScannerScreen>(find.byType(ScannerScreen));
      expect(scanner.size, 2);
      expect(scanner.embedded, isTrue);

      // Switching away disposes the scanner (and with it the camera).
      await _openTab(tester, 'academy');
      expect(find.byType(ScannerScreen, skipOffstage: false), findsNothing);
      expect(find.byType(AcademyScreen), findsOneWidget);
    });

    testWidgets('Academy shows its progress badge and the continue hero', (
      tester,
    ) async {
      await _pumpApp(
        tester,
        await _prefs({
          'academy_completed': ['basics'],
        }),
      );
      expect(find.byKey(const ValueKey('tab-academy-badge')), findsOneWidget);
      expect(find.text('1/29'), findsOneWidget);
      await _openTab(tester, 'academy');
      final hero = tester.getRect(
        find.byKey(const ValueKey('continue-learning')),
      );
      final progress = tester.getRect(
        find.byKey(const ValueKey('academy-progress')),
      );
      expect(hero.top, lessThan(progress.top), reason: 'hero on top');
      expect(find.text('Continue learning'), findsOneWidget);
    });

    testWidgets('Train holds the daily challenge (with streak), the timer '
        'and the pattern library', (tester) async {
      await _pumpApp(
        tester,
        await _prefs({'daily_last_day': '2026-11-15', 'daily_streak': 4}),
      );
      await _openTab(tester, 'train');
      expect(find.byType(TrainScreen), findsOneWidget);
      expect(find.text('Daily challenge'), findsOneWidget);
      expect(find.text('Speed timer'), findsOneWidget);
      expect(find.text('Pattern library'), findsOneWidget);
      expect(find.byKey(const ValueKey('streak-badge')), findsOneWidget);
      expect(find.text('4-day streak'), findsOneWidget);

      Future<void> openAndBack(String key, Type screen) async {
        await tester.tap(find.byKey(ValueKey(key)));
        await _advance(tester, 12);
        expect(find.byType(screen), findsOneWidget);
        await tester.pageBack();
        await _advance(tester, 12);
        expect(find.byType(TrainScreen), findsOneWidget);
      }

      await openAndBack('train-daily', DailyScreen);
      await openAndBack('train-timer', TimerScreen);
      await openAndBack('train-patterns', PatternsScreen);
    });

    testWidgets('system back from another tab returns to Solve', (
      tester,
    ) async {
      final container = await _pumpApp(tester, await _prefs());
      await _openTab(tester, 'train');
      expect(container.read(currentTabProvider), AppTab.train);
      await tester.binding.handlePopRoute();
      await _advance(tester, 4);
      expect(container.read(currentTabProvider), AppTab.solve);
    });

    testWidgets('in Hebrew the dock runs right to left', (tester) async {
      await _pumpApp(tester, await _prefs({'app_locale': 'he'}));
      expect(find.text('פתרון'), findsOneWidget);
      expect(find.text('אימון'), findsOneWidget);
      final solve = tester.getCenter(find.byKey(const ValueKey('tab-solve')));
      final train = tester.getCenter(find.byKey(const ValueKey('tab-train')));
      expect(solve.dx, greaterThan(train.dx));
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
      expect(find.text('פתרון'), findsOneWidget);
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
      expect(find.text('2/29'), findsOneWidget);
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
      expect(find.text('0/29'), findsOneWidget);
    });
  });
}
