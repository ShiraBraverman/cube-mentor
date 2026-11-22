import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/render/cube_painter.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/solver_3d/widgets/cube_viewport.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';

/// Stored preferences; cubes animate at 1x because the fixed pumps below
/// are tuned to that pace (the app's default is calmer).
Future<SharedPreferences> _prefs([Map<String, Object> values = const {}]) {
  SharedPreferences.setMockInitialValues({
    'settings_animation_speed': 1.0,
    ...values,
  });
  return SharedPreferences.getInstance();
}

Future<void> _pumpApp(
  WidgetTester tester,
  SharedPreferences prefs, {
  CubeSolver? solver,
}) async {
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        cubeSolverProvider.overrideWithValue(solver ?? FakeCubeSolver()),
      ],
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
    await tester.tap(find.byKey(const ValueKey('language-button')));
    await _advance(tester, 8);
    await tester.tap(find.byKey(const ValueKey('lang-he')));
    await _advance(tester, 8);
    expect(find.text('בחרו את הקובייה שלכם'), findsOneWidget);
    expect(_directionOf(tester), TextDirection.rtl);
    expect(prefs.getString('app_locale'), 'he');
  });

  testWidgets('restores the saved Hebrew locale on launch', (tester) async {
    await _pumpApp(tester, await _prefs({'app_locale': 'he'}));
    expect(find.text('פתיחת קובייה תלת־ממדית ופותר'), findsOneWidget);
    expect(_directionOf(tester), TextDirection.rtl);
  });

  testWidgets('opens the 3D playground for the selected size and turns', (
    tester,
  ) async {
    await _pumpApp(tester, await _prefs());
    await tester.tap(find.byKey(const ValueKey('size-5')));
    await _advance(tester, 2);
    await tester.ensureVisible(find.byKey(const ValueKey('open-solver')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('open-solver')));
    await _advance(tester);

    expect(find.byType(Solver3DScreen), findsOneWidget);
    expect(find.text('5×5 Playground'), findsOneWidget);
    expect(find.text('Solved'), findsOneWidget);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(CubeViewport)),
    );
    CubeSession session() => container.read(cubeSessionProvider(5));

    // The notation pad is hidden by default and opens from the app bar as
    // a bottom sheet: the cube keeps its size.
    expect(find.text('R'), findsNothing);
    final cubeHeight = tester.getSize(find.byType(CubeViewport)).height;
    await tester.tap(find.byKey(const ValueKey('toggle-notation')));
    await _advance(tester, 6);
    expect(find.byKey(const ValueKey('notation-sheet')), findsOneWidget);
    expect(tester.getSize(find.byType(CubeViewport)).height, cubeHeight);
    expect(find.text('Speed'), findsOneWidget);
    await tester.tap(find.text('R'));
    // Give the 320 ms quarter-turn animation time to finish and commit.
    await _advance(tester, 10);
    expect(session().isIdle, isTrue);
    expect(session().log.map((m) => m.notation), ['R']);
    expect(find.text('Scrambled'), findsOneWidget);

    // Tapping above the sheet closes it; the action bar stays.
    await tester.tapAt(const Offset(20, 120));
    await _advance(tester, 8);
    expect(find.byKey(const ValueKey('notation-sheet')), findsNothing);
    expect(find.text('R'), findsNothing);

    await tester.tap(find.text('Undo'));
    await _advance(tester, 10);
    expect(session().isIdle, isTrue);
    expect(find.text('Solved'), findsOneWidget);

    await tester.tap(find.text('Scramble'));
    // 60 fast scramble turns at 90 ms (135 ms for half turns) each.
    await _advance(tester, 200);
    expect(session().isIdle, isTrue);
    expect(session().cube.isSolved, isFalse);
    expect(session().hasPlayback, isFalse);

    // Big-cube solvers arrive in Milestone 4.
    await tester.tap(find.byKey(const ValueKey('solve')));
    await _advance(tester, 4);
    expect(
      find.text('The 5×5 solver arrives in a later update.'),
      findsOneWidget,
    );
    expect(session().hasPlayback, isFalse);
    // Let the snack bar finish its entrance, time out and leave so it does
    // not cover the action bar.
    await _advance(tester, 6);
    await tester.pump(const Duration(seconds: 5));
    await _advance(tester, 6);

    await tester.tap(find.text('Reset'));
    await _advance(tester, 2);
    expect(session().cube.isSolved, isTrue);
    expect(session().hasPlayback, isFalse);
  });

  testWidgets('guided solve shows explained, highlighted steps', (
    tester,
  ) async {
    // Scramble "R U"; the canned plan undoes it with LBL metadata.
    final scrambled = CubeState.solved(3).applyAll([
      for (final t in ['R', 'U']) _parse(t),
    ]);
    final afterFirst = scrambled.apply(_parse("U'"));
    final solver = FakeCubeSolver(
      plan: SolvePlan(
        method: 'lbl',
        steps: [
          SolveStep(
            cubeState: scrambled.toFacelets(),
            phaseName: 'lblCross',
            moveNotation: "U'",
            explanationKey: 'lblCrossEdge',
            pieceColors: 'WR',
            highlightedCubies: const [(0, 2, 2)],
            crown: 1,
            subStep: 1,
          ),
          SolveStep(
            cubeState: afterFirst.toFacelets(),
            phaseName: 'lblCorners',
            moveNotation: "R'",
            explanationKey: 'lblCornerInsert',
            pieceColors: 'WRG',
            highlightedCubies: const [(2, 2, 2)],
            crown: 1,
            subStep: 2,
          ),
        ],
      ),
    );
    await _pumpApp(tester, await _prefs(), solver: solver);
    await tester.ensureVisible(find.byKey(const ValueKey('open-solver')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('open-solver')));
    await _advance(tester);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(CubeViewport)),
    );
    final controller = container.read(cubeSessionProvider(3).notifier);
    controller.turnNotation('R');
    controller.turnNotation('U');
    await _advance(tester, 16);
    expect(container.read(cubeSessionProvider(3)).isIdle, isTrue);

    // Solve defaults to the guided 3-crown method: no question asked.
    await tester.tap(find.byKey(const ValueKey('solve')));
    await _advance(tester, 8);
    expect(solver.calls, [SolveMethod.layerByLayer]);

    // The first sub-step opens with its goal card; dismiss it to play.
    expect(
      tester
          .widget<Text>(find.byKey(const ValueKey('substep-intro-title')))
          .data,
      '1.1 White cross',
    );
    expect(find.byKey(const ValueKey('intro-preview')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('intro-start')));
    await _advance(tester, 12);
    expect(find.byKey(const ValueKey('lesson-intro')), findsNothing);

    // Banner: crown tracker, sub-step, explanation and the move to make.
    // Stages, not move counts.
    expect(find.text('Crown 1 • Stage 1 of 7: White cross'), findsOneWidget);
    expect(find.textContaining('Step 1 of'), findsNothing);
    expect(find.byKey(const ValueKey('stage-progress')), findsOneWidget);
    expect(find.byKey(const ValueKey('crown-1')), findsOneWidget);
    expect(find.byKey(const ValueKey('solve-mode')), findsOneWidget);
    expect(
      find.textContaining('Bring the white-red edge down'),
      findsOneWidget,
    );
    // The move as words and an arrow, never as a notation letter.
    expect(find.text("U'"), findsNothing);
    expect(find.text('Top row'), findsOneWidget);
    expect(find.text('Right'), findsOneWidget);
    expect(find.byKey(const ValueKey('move-arrow-right')), findsOneWidget);

    // A guide replaces the free-play bar with Previous / Play / Next / Exit
    // and a single (stage) progress bar.
    expect(find.byKey(const ValueKey('guide-dock')), findsOneWidget);
    expect(find.byKey(const ValueKey('action-bar')), findsNothing);
    for (final label in ['Scramble', 'Undo', 'Reset']) {
      expect(find.text(label), findsNothing, reason: label);
    }
    expect(find.byKey(const ValueKey('solve')), findsNothing);
    expect(find.byTooltip('Replay step'), findsNothing);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // The dock sits under the cube, never over it.
    final cubeRect = tester.getRect(find.byType(CubeViewport));
    final dockRect = tester.getRect(find.byKey(const ValueKey('solve-dock')));
    expect(dockRect.top, greaterThanOrEqualTo(cubeRect.bottom));

    // Folding the details keeps the solution (and the move) on screen.
    await tester.tap(find.byKey(const ValueKey('solve-collapse')));
    await _advance(tester, 8);
    expect(find.byKey(const ValueKey('solve-details')), findsNothing);
    expect(container.read(cubeSessionProvider(3)).isGuiding, isTrue);
    expect(find.text('Top row'), findsOneWidget);
    final folded = tester.getSize(find.byType(CubeViewport)).height;
    expect(folded, greaterThan(cubeRect.height), reason: 'the cube grew');
    await tester.tap(find.byKey(const ValueKey('solve-collapse')));
    await _advance(tester, 8);
    expect(find.byKey(const ValueKey('solve-details')), findsOneWidget);
    expect(find.textContaining('Swipe the glowing layer'), findsOneWidget);
    // The piece the step talks about is highlighted.
    final viewport = tester.widget<CubeViewport>(find.byType(CubeViewport));
    final session = container.read(cubeSessionProvider(3));
    expect(viewport.highlighted, {session.cube.cubieIdAt((0, 2, 2))});
    // The step buttons spell out which way they go.
    expect(
      find.descendant(
        of: find.byKey(const ValueKey('playback-prev')),
        matching: find.text('Previous'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const ValueKey('playback-next')),
        matching: find.text('Next'),
      ),
      findsOneWidget,
    );
    // Guided solutions show stages, not a move count.
    expect(find.byKey(const ValueKey('fast-move-count')), findsNothing);

    await tester.tap(find.byKey(const ValueKey('playback-next')));
    await _advance(tester, 12);
    // A new sub-step: its goal card first.
    expect(
      tester
          .widget<Text>(find.byKey(const ValueKey('substep-intro-title')))
          .data,
      '1.2 First crown corners',
    );
    await tester.tap(find.byKey(const ValueKey('intro-start')));
    await _advance(tester, 12);
    expect(
      find.text('Crown 1 • Stage 2 of 7: First crown corners'),
      findsOneWidget,
    );

    // The flag in the banner reopens the card at any time.
    await tester.tap(find.byKey(const ValueKey('solve-intro-open')));
    await _advance(tester, 12);
    expect(find.byKey(const ValueKey('lesson-intro')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('intro-start')));
    await _advance(tester, 12);
    expect(find.byKey(const ValueKey('lesson-intro')), findsNothing);

    await tester.tap(find.byTooltip('Play'));
    await _advance(tester, 12);
    expect(container.read(cubeSessionProvider(3)).cube.isSolved, isTrue);
    // The finish is a personal celebration card (no nickname set here).
    expect(find.byKey(const ValueKey('celebration-card')), findsOneWidget);
    expect(find.text('Way to go!'), findsOneWidget);
    expect(find.text('Cube solved!'), findsOneWidget);
    expect(find.text('Solved'), findsOneWidget);

    // Stepping back replays the solution in reverse.
    await tester.tap(find.byKey(const ValueKey('playback-prev')));
    await _advance(tester, 12);
    expect(container.read(cubeSessionProvider(3)).cube.isSolved, isFalse);
    expect(
      find.text('Crown 1 • Stage 2 of 7: First crown corners'),
      findsOneWidget,
    );

    // The toggle re-solves from here with the fast solver, and remembers it.
    await tester.tap(find.byKey(const ValueKey('solve-mode-fast')));
    await _advance(tester, 8);
    expect(solver.calls, [SolveMethod.layerByLayer, SolveMethod.fast]);
    expect(container.read(cubeSessionProvider(3)).solvedWith, SolveMethod.fast);
    final prefs = container.read(sharedPreferencesProvider);
    expect(prefs.getString('solve_method'), 'fast');
    // Fast solutions headline their move count against the 3x3 bound.
    final moves = container.read(cubeSessionProvider(3)).playback.length;
    expect(find.byKey(const ValueKey('fast-move-count')), findsOneWidget);
    expect(find.text('$moves / 20 moves'), findsOneWidget);
  });

  testWidgets("the goal sheet's switch stops it opening by itself", (
    tester,
  ) async {
    final scrambled = CubeState.solved(3).applyAll([
      for (final t in ['R', 'U']) _parse(t),
    ]);
    final afterFirst = scrambled.apply(_parse("U'"));
    final solver = FakeCubeSolver(
      plan: SolvePlan(
        method: 'lbl',
        steps: [
          SolveStep(
            cubeState: scrambled.toFacelets(),
            phaseName: 'lblCross',
            moveNotation: "U'",
            explanationKey: 'lblCrossEdge',
            pieceColors: 'WR',
            crown: 1,
            subStep: 1,
          ),
          SolveStep(
            cubeState: afterFirst.toFacelets(),
            phaseName: 'lblCorners',
            moveNotation: "R'",
            explanationKey: 'lblCornerInsert',
            pieceColors: 'WRG',
            crown: 1,
            subStep: 2,
          ),
        ],
      ),
    );
    final prefs = await _prefs();
    await _pumpApp(tester, prefs, solver: solver);
    await tester.ensureVisible(find.byKey(const ValueKey('open-solver')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('open-solver')));
    await _advance(tester);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(CubeViewport)),
    );
    container.read(cubeSessionProvider(3).notifier)
      ..turnNotation('R')
      ..turnNotation('U');
    await _advance(tester, 16);
    await tester.tap(find.byKey(const ValueKey('solve')));
    await _advance(tester, 8);

    // 1.1 opens by itself; switch auto-show off from inside the sheet.
    expect(find.byKey(const ValueKey('lesson-intro')), findsOneWidget);
    await tester.ensureVisible(find.byKey(const ValueKey('intro-dont-show')));
    await tester.tap(find.byKey(const ValueKey('intro-dont-show')));
    await _advance(tester, 4);
    expect(prefs.getBool('substep_intro_auto'), isFalse);
    await tester.ensureVisible(find.byKey(const ValueKey('intro-start')));
    await tester.tap(find.byKey(const ValueKey('intro-start')));
    await _advance(tester, 12);

    // 1.2 no longer interrupts...
    await tester.tap(find.byKey(const ValueKey('playback-next')));
    await _advance(tester, 12);
    expect(container.read(cubeSessionProvider(3)).playbackIndex, 1);
    expect(find.byKey(const ValueKey('lesson-intro')), findsNothing);
    // ...but the flag still opens it.
    await tester.tap(find.byKey(const ValueKey('solve-intro-open')));
    await _advance(tester, 12);
    expect(find.byKey(const ValueKey('lesson-intro')), findsOneWidget);
  });

  testWidgets('a solved cube needs no solution', (tester) async {
    final solver = FakeCubeSolver();
    await _pumpApp(tester, await _prefs(), solver: solver);
    await tester.ensureVisible(find.byKey(const ValueKey('open-solver')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('open-solver')));
    await _advance(tester);
    await tester.tap(find.byKey(const ValueKey('solve')));
    await _advance(tester, 4);
    // A floating pill under the app bar, never a snack bar over the buttons.
    expect(find.text('The cube is already solved.'), findsOneWidget);
    expect(find.byKey(const ValueKey('solve-notice')), findsOneWidget);
    expect(find.byType(SnackBar), findsNothing);
    final notice = tester.getRect(find.byKey(const ValueKey('solve-notice')));
    final bar = tester.getRect(find.byKey(const ValueKey('action-bar')));
    expect(notice.bottom, lessThan(bar.top));
    expect(solver.calls, isEmpty);
    // It fades away by itself.
    await tester.pump(const Duration(milliseconds: 1600));
    await _advance(tester, 6);
    expect(find.byKey(const ValueKey('solve-notice')), findsNothing);
  });

  testWidgets('solver errors are reported', (tester) async {
    final solver = FakeCubeSolver();
    await _pumpApp(tester, await _prefs(), solver: solver);
    await tester.tap(find.byKey(const ValueKey('size-2')));
    await _advance(tester, 2);
    await tester.ensureVisible(find.byKey(const ValueKey('open-solver')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('open-solver')));
    await _advance(tester);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(CubeViewport)),
    );
    container.read(cubeSessionProvider(2).notifier).turnNotation('R');
    await _advance(tester, 10);
    // The 2x2 solves guided by default too (its three stages).
    await tester.tap(find.byKey(const ValueKey('solve')));
    await _advance(tester, 4);
    expect(solver.calls, [SolveMethod.layerByLayer]);
    expect(find.text("This cube can't be solved (internal)."), findsOneWidget);
    expect(container.read(cubeSessionProvider(2)).hasPlayback, isFalse);
  });

  group('touch gestures', () {
    late List<MethodCall> platformCalls;

    Future<ProviderContainer> openPlayground(
      WidgetTester tester, {
      CubeSolver? solver,
    }) async {
      platformCalls = [];
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          platformCalls.add(call);
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );
      await _pumpApp(tester, await _prefs(), solver: solver);
      await tester.ensureVisible(find.byKey(const ValueKey('open-solver')));
      await tester.pump();
      await tester.tap(find.byKey(const ValueKey('open-solver')));
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
      final local =
          (face.quad[0] + face.quad[1] + face.quad[2] + face.quad[3]) / 4;
      return tester.getTopLeft(viewport) + local;
    }

    bool haptic(String type) => platformCalls.any(
      (c) =>
          c.method == 'HapticFeedback.vibrate' &&
          c.arguments == 'HapticFeedbackType.$type',
    );

    /// A hand-made layer turn's light impact.
    bool turnTapped() => haptic('lightImpact');

    /// Drags the front-right-bottom sticker upward: an R turn.
    Future<void> swipeR(WidgetTester tester) async {
      final gesture = await tester.startGesture(
        stickerOnScreen(tester, (2, 0, 2), kNormalFront),
      );
      // About a quarter turn, whatever room the cube has.
      final step =
          tester.getSize(find.byType(CubeViewport)).shortestSide * 0.04;
      for (var i = 0; i < 10; i++) {
        await gesture.moveBy(Offset(0, -step));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await gesture.up();
      await _advance(tester, 8);
    }

    CubePainter painter(WidgetTester tester) =>
        tester
                .widgetList<CustomPaint>(
                  find.descendant(
                    of: find.byType(CubeViewport),
                    matching: find.byType(CustomPaint),
                  ),
                )
                .firstWhere((p) => p.painter is CubePainter)
                .painter!
            as CubePainter;

    testWidgets('swiping the expected move advances the guided solve', (
      tester,
    ) async {
      final solver = FakeCubeSolver();
      final container = await openPlayground(tester, solver: solver);
      final controller = container.read(cubeSessionProvider(3).notifier);
      controller.commitDirect(_parse('U').inverse);
      controller.commitDirect(_parse('R').inverse);
      final start = container.read(cubeSessionProvider(3)).cube;
      solver.plan = SolvePlan(
        method: 'kociemba',
        steps: [
          SolveStep(
            cubeState: start.toFacelets(),
            phaseName: 'kociembaPhase2',
            moveNotation: 'R',
            explanationKey: 'kociembaPhase2Explain',
          ),
          SolveStep(
            cubeState: start.apply(_parse('R')).toFacelets(),
            phaseName: 'kociembaPhase2',
            moveNotation: 'U',
            explanationKey: 'kociembaPhase2Explain',
          ),
        ],
      );
      await tester.tap(find.byKey(const ValueKey('solve')));
      await _advance(tester, 8);
      expect(find.text('Stage 2 of 2: Finish the cube'), findsOneWidget);
      // The arrow points out the expected move; its layer is in focus.
      expect(painter(tester).guide?.notation, 'R');
      expect(painter(tester).frame.focus, hasLength(9));

      platformCalls.clear();
      await swipeR(tester);
      var session = container.read(cubeSessionProvider(3));
      expect(session.playbackIndex, 1, reason: 'the swipe advanced the step');
      expect(session.steps, hasLength(2));
      // The expected move: a step-complete tick, not a plain turn.
      expect(haptic('selectionClick'), isTrue);
      expect(haptic('lightImpact'), isFalse);
      expect(painter(tester).guide?.notation, 'U');

      // Another R is the wrong move now: it springs back and is not applied.
      final before = session.cube;
      platformCalls.clear();
      await swipeR(tester);
      session = container.read(cubeSessionProvider(3));
      expect(identical(session.cube, before), isTrue);
      expect(session.playbackIndex, 1);
      expect(session.isGuiding, isTrue);
      expect(haptic('lightImpact'), isTrue);
      expect(find.text('Follow the highlighted arrow'), findsOneWidget);

      // Next animates the remaining move and the solve completes.
      await tester.tap(find.byKey(const ValueKey('playback-next')));
      await _advance(tester, 12);
      expect(container.read(cubeSessionProvider(3)).cube.isSolved, isTrue);
      expect(find.text('Cube solved!'), findsOneWidget);
      // The warm success chime's haptic.
      expect(haptic('mediumImpact'), isTrue);
      // The wrong move was a gentle double light tap (playback turns do
      // not vibrate).
      expect(
        platformCalls
            .where((c) => c.arguments == 'HapticFeedbackType.lightImpact')
            .length,
        2,
      );
      expect(painter(tester).guide, isNull);

      // Exiting the guide returns to free play (once the snack bar left).
      await tester.pump(const Duration(seconds: 3));
      await _advance(tester, 8);
      await tester.tap(find.byKey(const ValueKey('guide-exit')));
      await _advance(tester, 4);
      expect(container.read(cubeSessionProvider(3)).hasPlayback, isFalse);
      expect(find.byKey(const ValueKey('guide-dock')), findsNothing);
      expect(find.byKey(const ValueKey('action-bar')), findsOneWidget);
    });

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
      expect(turnTapped(), isTrue);
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
      expect(turnTapped(), isFalse);
    });

    testWidgets('dragging the background orbits without turning', (
      tester,
    ) async {
      final container = await openPlayground(tester);
      final corner =
          tester.getTopLeft(find.byType(CubeViewport)) + const Offset(12, 12);
      await tester.flingFrom(corner, const Offset(200, 120), 900);
      await _advance(tester, 20);
      expect(container.read(cubeSessionProvider(3)).log, isEmpty);
      // Double-tap resets the view; still no moves.
      await tester.tapAt(corner);
      await tester.pump(const Duration(milliseconds: 50));
      await tester.tapAt(corner);
      await _advance(tester, 30);
      expect(container.read(cubeSessionProvider(3)).log, isEmpty);
      expect(turnTapped(), isFalse);
    });
  });
}

CubeMove _parse(String token) => MoveNotation.parse(token, 3);
