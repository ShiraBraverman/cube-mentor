import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/render/cube_geometry.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/solver_3d/widgets/cube_viewport.dart';
import 'package:flutter/services.dart';
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

    // The notation pad is hidden by default and opens from the app bar.
    expect(find.text('R'), findsNothing);
    await tester.tap(find.byKey(const ValueKey('toggle-notation')));
    await _advance(tester, 6);
    await tester.tap(find.text('R'));
    // Give the 320 ms quarter-turn animation time to finish and commit.
    await _advance(tester, 10);
    expect(session().isIdle, isTrue);
    expect(session().log.map((m) => m.notation), ['R']);
    expect(find.text('Scrambled'), findsOneWidget);

    await tester.tap(find.text('Undo'));
    await _advance(tester, 10);
    expect(session().isIdle, isTrue);
    expect(find.text('Solved'), findsOneWidget);

    // Collapse the pad again; the action bar stays.
    await tester.tap(find.byKey(const ValueKey('toggle-notation')));
    await _advance(tester, 6);
    expect(find.text('R'), findsNothing);

    await tester.tap(find.text('Scramble'));
    await _advance(tester, 4);
    expect(find.text('Step 0 of 60'), findsOneWidget);
    // 60 fast scramble turns at 90 ms (135 ms for half turns) each.
    await _advance(tester, 200);
    expect(session().isIdle, isTrue);
    expect(session().cube.isSolved, isFalse);

    await tester.tap(find.text('Reset'));
    await _advance(tester, 2);
    expect(session().cube.isSolved, isTrue);
    expect(session().hasPlayback, isFalse);
  });

  group('touch gestures', () {
    late List<MethodCall> platformCalls;

    Future<ProviderContainer> openPlayground(WidgetTester tester) async {
      platformCalls = [];
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          platformCalls.add(call);
          return null;
        },
      );
      addTearDown(() => tester.binding.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null));
      await _pumpApp(tester, await _prefs());
      await tester.tap(find.byKey(const ValueKey('mode-playground')));
      await _advance(tester);
      return ProviderScope.containerOf(
        tester.element(find.byType(CubeViewport)),
      );
    }

    /// Global position of a sticker center in the viewport's default view.
    Offset stickerOnScreen(WidgetTester tester, IVec3 pos, IVec3 normal) {
      final viewport = find.byType(CubeViewport);
      final size = tester.getSize(viewport);
      final face = CubeScene.build(
        CubeFrame(cube: CubeState.solved(3), orbit: CubeOrientation.initial),
        size,
      ).firstWhere((f) => f.cubie.position == pos && f.normal == normal);
      final local = (face.quad[0] + face.quad[1] + face.quad[2] + face.quad[3]) / 4;
      return tester.getTopLeft(viewport) + local;
    }

    bool hapticClicked() => platformCalls.any(
      (c) =>
          c.method == 'HapticFeedback.vibrate' &&
          c.arguments == 'HapticFeedbackType.selectionClick',
    );

    testWidgets('dragging a sticker turns its layer and clicks on snap', (
      tester,
    ) async {
      final container = await openPlayground(tester);
      final start = stickerOnScreen(tester, (2, 0, 2), kNormalFront);
      final gesture = await tester.startGesture(start);
      for (var i = 0; i < 10; i++) {
        await gesture.moveBy(const Offset(0, -15));
        await tester.pump(const Duration(milliseconds: 16));
      }
      // Mid-drag nothing is committed yet.
      expect(container.read(cubeSessionProvider(3)).log, isEmpty);
      await gesture.up();
      await _advance(tester, 8);

      final session = container.read(cubeSessionProvider(3));
      expect(session.log.map((m) => m.notation), ['R']);
      expect(session.cube.isSolved, isFalse);
      expect(hapticClicked(), isTrue);
      expect(find.text('Scrambled'), findsOneWidget);

      // Undo works for hand-made moves too.
      await tester.tap(find.text('Undo'));
      await _advance(tester, 10);
      expect(container.read(cubeSessionProvider(3)).cube.isSolved, isTrue);
    });

    testWidgets('a short wiggle snaps back without a move', (tester) async {
      final container = await openPlayground(tester);
      final start = stickerOnScreen(tester, (0, 0, 2), kNormalFront);
      final gesture = await tester.startGesture(start);
      await gesture.moveBy(const Offset(0, -12));
      await tester.pump(const Duration(milliseconds: 16));
      await gesture.moveBy(const Offset(0, -12));
      await tester.pump(const Duration(milliseconds: 400));
      await gesture.up();
      await _advance(tester, 8);
      expect(container.read(cubeSessionProvider(3)).log, isEmpty);
      expect(container.read(cubeSessionProvider(3)).cube.isSolved, isTrue);
      expect(hapticClicked(), isFalse);
    });

    testWidgets('dragging the background orbits without turning', (
      tester,
    ) async {
      final container = await openPlayground(tester);
      final corner = tester.getTopLeft(find.byType(CubeViewport)) +
          const Offset(12, 12);
      await tester.flingFrom(corner, const Offset(200, 120), 900);
      await _advance(tester, 20);
      expect(container.read(cubeSessionProvider(3)).log, isEmpty);
      // Double-tap resets the view; still no moves.
      await tester.tapAt(corner);
      await tester.pump(const Duration(milliseconds: 50));
      await tester.tapAt(corner);
      await _advance(tester, 30);
      expect(container.read(cubeSessionProvider(3)).log, isEmpty);
      expect(hapticClicked(), isFalse);
    });
  });
}
