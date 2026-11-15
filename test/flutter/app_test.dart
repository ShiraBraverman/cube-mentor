import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/solver_3d/widgets/cube_viewport.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs([Map<String, Object> values = const {}]) {
  SharedPreferences.setMockInitialValues(values);
  return SharedPreferences.getInstance();
}

Future<void> _pumpApp(WidgetTester tester, SharedPreferences prefs) async {
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const CubeMentorApp(),
    ),
  );
  // The hero preview spins forever, so settle with fixed pumps.
  await tester.pump(const Duration(milliseconds: 100));
}

/// Pumps long enough for route transitions (the cube previews never settle).
Future<void> _advance(WidgetTester tester, [int frames = 12]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

TextDirection _directionOf(WidgetTester tester) =>
    Directionality.of(tester.element(find.byType(Scaffold).first));

void main() {
  testWidgets('home shows every cube size in English, LTR', (tester) async {
    await _pumpApp(tester, await _prefs());
    expect(find.text('CubeMentor'), findsOneWidget);
    expect(find.text('Choose your cube'), findsOneWidget);
    for (final n in [2, 3, 4, 5, 6]) {
      expect(find.byKey(ValueKey('size-$n')), findsOneWidget);
    }
    expect(_directionOf(tester), TextDirection.ltr);
  });

  testWidgets('switching to Hebrew flips layout to RTL and persists', (
    tester,
  ) async {
    final prefs = await _prefs();
    await _pumpApp(tester, prefs);
    await tester.tap(find.byKey(const ValueKey('lang-he')));
    await _advance(tester, 4);
    expect(find.text('בחרו את הקובייה שלכם'), findsOneWidget);
    expect(_directionOf(tester), TextDirection.rtl);
    expect(prefs.getString('app_locale'), 'he');
  });

  testWidgets('restores the saved Hebrew locale on launch', (tester) async {
    await _pumpApp(tester, await _prefs({'app_locale': 'he'}));
    expect(find.text('מגרש תלת־ממד'), findsOneWidget);
    expect(_directionOf(tester), TextDirection.rtl);
  });

  testWidgets('opens the 3D playground for the selected size and turns', (
    tester,
  ) async {
    await _pumpApp(tester, await _prefs());
    await tester.tap(find.byKey(const ValueKey('size-5')));
    await _advance(tester, 2);
    await tester.tap(find.byKey(const ValueKey('mode-playground')));
    await _advance(tester);

    expect(find.byType(Solver3DScreen), findsOneWidget);
    expect(find.text('5×5 Playground'), findsOneWidget);
    expect(find.text('Solved'), findsOneWidget);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(CubeViewport)),
    );
    CubeSession session() => container.read(cubeSessionProvider(5));

    await tester.tap(find.text('R'));
    // Give the 320 ms quarter-turn animation time to finish and commit.
    await _advance(tester, 10);
    expect(session().isIdle, isTrue);
    expect(find.text('1 move'), findsOneWidget);
    expect(find.text('Scrambled'), findsOneWidget);

    await tester.tap(find.text('Undo'));
    await _advance(tester, 10);
    expect(session().isIdle, isTrue);
    expect(find.text('Solved'), findsOneWidget);

    await tester.tap(find.text('Scramble'));
    await _advance(tester, 4);
    expect(find.text('Step 0 of 60'), findsOneWidget);
    // 60 fast scramble turns at 90 ms (135 ms for half turns) each.
    await _advance(tester, 200);
    expect(session().isIdle, isTrue);
    expect(session().cube.isSolved, isFalse);

    // Orbit drag with inertia, then double-tap to reset the view.
    await tester.fling(find.byType(CubeViewport), const Offset(120, 40), 800);
    await _advance(tester, 4);
    await tester.tap(find.byType(CubeViewport));
    await tester.pump(const Duration(milliseconds: 50));
    await tester.tap(find.byType(CubeViewport));
    await _advance(tester, 30);
  });
}
