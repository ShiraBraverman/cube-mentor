import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/daily/daily_controller.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/features/home/privacy_policy_screen.dart';
import 'package:cube_mentor/features/home/root_shell.dart';
import 'package:cube_mentor/features/scanner/camera/camera_scan_view.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';
import 'fake_scrambler.dart';
import 'scanner_test.dart' show faceSamples, scrambledFacelets;
import 'test_app.dart';

Future<void> _advance(WidgetTester tester, [int frames = 10]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

Future<SharedPreferences> _phone(
  WidgetTester tester, [
  Map<String, Object> values = const {},
]) async {
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
  SharedPreferences.setMockInitialValues(values);
  return SharedPreferences.getInstance();
}

Widget _scope(SharedPreferences prefs, Widget child) => ProviderScope(
  overrides: [
    sharedPreferencesProvider.overrideWithValue(prefs),
    cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
    scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
    scramblerProvider.overrideWithValue(FakeScrambler()),
    clockProvider.overrideWithValue(() => DateTime.utc(2026, 11, 16, 8)),
  ],
  child: child,
);

void main() {
  testWidgets('first launch shows the 3-page intro once; Skip opens home', (
    tester,
  ) async {
    final prefs = await _phone(tester);
    await tester.pumpWidget(_scope(prefs, const CubeMentorApp()));
    await _advance(tester);
    expect(find.byKey(const ValueKey('onboarding')), findsOneWidget);
    expect(find.byKey(const ValueKey('root-shell')), findsNothing);
    await tester.tap(find.byKey(const ValueKey('onboarding-next')));
    await _advance(tester, 12);
    expect(find.byKey(const ValueKey('onboarding-page-1')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('onboarding-skip')));
    await _advance(tester, 12);
    expect(find.byKey(const ValueKey('root-shell')), findsOneWidget);
    expect(prefs.getBool('onboarding_done'), isTrue);
  });

  testWidgets('home: Playground pill and the manual entry choice', (
    tester,
  ) async {
    final prefs = await _phone(tester, {'onboarding_done': true});
    await tester.pumpWidget(_scope(prefs, testApp(const RootShell())));
    await _advance(tester);
    await tester.tap(find.byKey(const ValueKey('home-playground')));
    await _advance(tester, 12);
    expect(find.byType(Solver3DScreen), findsOneWidget);
    // Every pushed screen has a visible back arrow.
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await _advance(tester, 12);

    await tester.tap(find.byKey(const ValueKey('home-scan-solve')));
    await _advance(tester, 8);
    expect(find.byKey(const ValueKey('scan-choice-camera')), findsOneWidget);
    expect(find.byKey(const ValueKey('scan-choice-3d')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('scan-choice-manual')));
    await _advance(tester, 12);
    final scanner = ProviderScope.containerOf(
      tester.element(find.byType(ScannerScreen)),
    );
    final session = scanner.read(scanSessionProvider(3));
    expect(session.manual, isTrue);
    expect(session.phase, ScanPhase.review);
  });

  testWidgets('camera problems offer Try again and manual entry', (
    tester,
  ) async {
    var retried = 0;
    var manual = 0;
    final prefs = await _phone(tester);
    await tester.pumpWidget(
      _scope(
        prefs,
        testApp(
          Scaffold(
            body: CameraProblemView(
              problem: CameraProblem.denied,
              onManual: () => manual++,
              onRetry: () => retried++,
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const ValueKey('scan-camera-retry')));
    await tester.tap(find.byKey(const ValueKey('scan-camera-manual')));
    expect((retried, manual), (1, 1));
  });

  testWidgets('an invalid camera scan offers scan again or fix by hand', (
    tester,
  ) async {
    final prefs = await _phone(tester);
    await tester.pumpWidget(
      _scope(
        prefs,
        testApp(const ScannerScreen(size: 3, cameraOverride: false)),
      ),
    );
    await _advance(tester);
    final scope = ProviderScope.containerOf(
      tester.element(find.byType(ScannerScreen)),
    );
    final scan = scope.read(scanSessionProvider(3).notifier)..restart();
    // The same face six times: far too many stickers of each color.
    final truth = scrambledFacelets(3, 6);
    for (var i = 0; i < 6; i++) {
      scan.capture(faceSamples(truth, 3, kFaceF));
    }
    await _advance(tester, 20);
    expect(scope.read(scanSessionProvider(3)).isValid, isFalse);
    expect(find.byKey(const ValueKey('scan-status-again')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('scan-status-manual')));
    await _advance(tester);
    final session = scope.read(scanSessionProvider(3));
    expect(session.manual, isTrue);
    // The scanned colors stay, ready to be fixed by hand.
    expect(session.samples, hasLength(6));
    expect(find.byKey(const ValueKey('scan-status-again')), findsNothing);
  });

  testWidgets('finishing the daily challenge opens its summary page', (
    tester,
  ) async {
    final prefs = await _phone(tester, {
      'daily_streak': 4,
      'daily_last_day': '2026-11-15',
      'daily_best_streak': 9,
      'daily_best_time_ms': 61000,
    });
    await tester.pumpWidget(_scope(prefs, testApp(const DailyScreen())));
    await _advance(tester);
    final scope = ProviderScope.containerOf(
      tester.element(find.byType(DailyScreen)),
    );
    await scope.read(dailyProvider.notifier).complete(millis: 52300);
    await _advance(tester, 12);
    expect(find.byType(DailyCompleteScreen), findsOneWidget);
    expect(find.text('5-day streak'), findsOneWidget);
    expect(find.text('9-day streak'), findsOneWidget);
    // Today's time is also the new personal best.
    expect(find.text('52.30'), findsNWidgets(2));
    expect(find.byKey(const ValueKey('daily-congrats-pb')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('daily-congrats-done')));
    await _advance(tester, 12);
    expect(find.byType(DailyCompleteScreen), findsNothing);
    expect(find.byType(DailyScreen), findsOneWidget);
  });

  testWidgets('Settings opens the in-app privacy policy', (tester) async {
    final prefs = await _phone(tester, {'onboarding_done': true});
    await tester.pumpWidget(_scope(prefs, testApp(const RootShell())));
    await _advance(tester);
    await tester.tap(find.byKey(const ValueKey('settings-button')));
    await _advance(tester, 8);
    final entry = find.byKey(const ValueKey('settings-privacy-policy'));
    await tester.ensureVisible(entry);
    await tester.pump();
    await tester.tap(entry);
    await _advance(tester, 12);
    expect(find.byType(PrivacyPolicyScreen), findsOneWidget);
    expect(find.text('Your data stays on your device'), findsOneWidget);
    final contact = find.textContaining('MyCubeMentor@gmail.com');
    await tester.scrollUntilVisible(
      contact,
      200,
      scrollable: find
          .descendant(
            of: find.byType(PrivacyPolicyScreen),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(contact, findsOneWidget);
  });
}
