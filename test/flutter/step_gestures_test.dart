import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/model/guide_script.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';
import 'test_app.dart';

Future<void> _advance(WidgetTester tester, [int frames = 8]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

/// Opens a guided [moves] sequence on an [size] cube that ends solved, and
/// returns its controller. Swipes reach the controller exactly as the
/// viewport commits them once a layer snaps.
Future<CubeSessionController> _guide(
  WidgetTester tester,
  int size,
  List<String> moves,
) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
  final parsed = [for (final m in moves) MoveNotation.parse(m, size)];
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
      ],
      child: testApp(
        Solver3DScreen(
          size: size,
          guide: GuideScript(
            start: CubeState.solved(size)
                .applyAll(parsed.reversed.map((m) => m.inverse)),
            moves: parsed,
            phase: 'pattern',
            explanation: 'patternStep',
          ),
        ),
      ),
    ),
  );
  await _advance(tester);
  return ProviderScope.containerOf(tester.element(find.byType(Solver3DScreen)))
      .read(cubeSessionProvider(size).notifier);
}

/// Step of the guided solution the session is on.
int _index(WidgetTester tester, int size) =>
    ProviderScope.containerOf(tester.element(find.byType(Solver3DScreen)))
        .read(cubeSessionProvider(size))
        .playbackIndex;

void main() {
  testWidgets('R2 takes two quarter swipes and counts as one step', (
    tester,
  ) async {
    final controller = await _guide(tester, 3, ['R2', 'U']);
    int index() => _index(tester, 3);
    expect(index(), 0);

    controller.commitDirect(MoveNotation.parse('R', 3));
    await _advance(tester);
    expect(
      find.text(
        'Nice, halfway there! Turn it once more for a double turn (180°).',
      ),
      findsOneWidget,
    );
    expect(index(), 0, reason: 'not advanced');

    // Turning back instead is refused; the prompt stays up.
    controller.commitDirect(MoveNotation.parse("R'", 3));
    await _advance(tester);
    expect(find.byKey(const ValueKey('step-hint-halfway')), findsOneWidget);

    controller.commitDirect(MoveNotation.parse('R', 3));
    await _advance(tester);
    expect(find.byKey(const ValueKey('step-hint-halfway')), findsNothing);
    expect(index(), 1);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a 4x4 Rw is completed slice by slice as one step', (
    tester,
  ) async {
    final controller = await _guide(tester, 4, ['Rw', 'U']);
    int index() => _index(tester, 4);
    controller.commitDirect(MoveNotation.parse('R', 4));
    await _advance(tester);
    expect(
      find.text(
        'Great! Now swipe the inner adjacent layer to complete the wide turn.',
      ),
      findsOneWidget,
    );
    expect(index(), 0);

    controller.commitDirect(MoveNotation.parse('2R', 4));
    await _advance(tester);
    expect(find.byKey(const ValueKey('step-hint-wideInner')), findsNothing);
    expect(index(), 1);

    // Previous move takes the whole wide turn back.
    await tester.tap(find.byKey(const ValueKey('playback-prev')));
    await _advance(tester, 16);
    expect(index(), 0);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the inner slice first asks for the outer layer', (tester) async {
    final controller = await _guide(tester, 4, ['Lw']);
    controller.commitDirect(MoveNotation.parse('2L', 4));
    await _advance(tester);
    expect(
      find.text(
        'Great! Now swipe the outer layer next to it to complete the wide turn.',
      ),
      findsOneWidget,
    );
    controller.commitDirect(MoveNotation.parse('L', 4));
    await _advance(tester);
    expect(find.byKey(const ValueKey('solve-complete')), findsOneWidget);
  });
}
