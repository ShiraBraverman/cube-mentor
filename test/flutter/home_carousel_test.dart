import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/theme/ui_kit.dart';
import 'package:cube_mentor/features/home/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';

Future<ProviderContainer> _pumpHome(
  WidgetTester tester, {
  String? locale,
}) async {
  SharedPreferences.setMockInitialValues({
    'app_locale': ?locale,
    'onboarding_done': true,
  });
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
      ],
      child: const CubeMentorApp(),
    ),
  );
  await _advance(tester, 2);
  return ProviderScope.containerOf(
    tester.element(find.byKey(const ValueKey('cube-carousel'))),
  );
}

/// The carousel and stage animate forever: pump fixed frames.
Future<void> _advance(WidgetTester tester, [int frames = 10]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

String _heroSize(WidgetTester tester) =>
    tester.widget<Text>(find.byKey(const ValueKey('hero-size'))).data!;

void main() {
  testWidgets('the chevrons loop 2x2 -> ... -> 6x6 -> ? -> 2x2 both ways', (
    tester,
  ) async {
    final container = await _pumpHome(tester);
    int selected() => container.read(selectedCubeSizeProvider);
    expect(_heroSize(tester), '3×3');

    final next = find.byKey(const ValueKey('carousel-next'));
    final prev = find.byKey(const ValueKey('carousel-prev'));
    for (final size in [4, 5, 6]) {
      await tester.tap(next);
      await _advance(tester);
      expect(_heroSize(tester), '$size×$size');
      expect(selected(), size);
    }

    // The mystery cube: frosted silhouette, "?" and the coming-soon label.
    await tester.tap(next);
    await _advance(tester);
    expect(_heroSize(tester), '?');
    expect(find.text('New cube coming soon'), findsOneWidget);
    expect(find.byKey(const ValueKey('carousel-mystery')), findsOneWidget);
    expect(selected(), 6, reason: 'modes keep the last real cube');

    // ...and around again.
    await tester.tap(next);
    await _advance(tester);
    expect(_heroSize(tester), '2×2');
    expect(selected(), 2);

    // Backwards across the seam too.
    await tester.tap(prev);
    await _advance(tester);
    expect(_heroSize(tester), '?');
    await tester.tap(prev);
    await _advance(tester);
    expect(_heroSize(tester), '6×6');
    expect(selected(), 6);
  });

  testWidgets('a sideways swipe anywhere on the hero switches cubes', (
    tester,
  ) async {
    final container = await _pumpHome(tester);
    final hero = find.byKey(const ValueKey('cube-carousel'));
    // Swipe left from beside the cube: next cube.
    await tester.dragFrom(
      tester.getTopLeft(hero) + const Offset(30, 40),
      const Offset(-220, 0),
    );
    await _advance(tester);
    expect(_heroSize(tester), '4×4');
    expect(container.read(selectedCubeSizeProvider), 4);

    // A quick flick back from the cube's center: previous cube.
    await tester.flingFrom(tester.getCenter(hero), const Offset(120, 0), 1200);
    await _advance(tester);
    expect(_heroSize(tester), '3×3');

    // A short, slow nudge springs back to the same cube.
    await tester.dragFrom(tester.getCenter(hero), const Offset(-40, 0));
    await _advance(tester);
    expect(_heroSize(tester), '3×3');
  });

  testWidgets('dragging up, down or diagonally orbits instead of scrolling', (
    tester,
  ) async {
    await _pumpHome(tester);
    final hero = find.byKey(const ValueKey('cube-carousel'));
    final scroll = tester.state<ScrollableState>(find.byType(Scrollable).first);
    final before = scroll.position.pixels;

    final gesture = await tester.startGesture(tester.getCenter(hero));
    for (var i = 0; i < 10; i++) {
      await gesture.moveBy(const Offset(14, -20));
      await tester.pump(const Duration(milliseconds: 16));
    }
    // Once orbiting, sideways travel keeps turning the cube.
    for (var i = 0; i < 10; i++) {
      await gesture.moveBy(const Offset(-30, 0));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await gesture.up();
    await _advance(tester);

    expect(_heroSize(tester), '3×3', reason: 'no page change');
    expect(scroll.position.pixels, before, reason: 'the page did not scroll');
    expect(tester.takeException(), isNull);
  });

  testWidgets('the glowing ring under the cube keeps turning', (tester) async {
    await _pumpHome(tester);
    double rotation() => tester
        .widget<CubeStage>(find.byKey(const ValueKey('cube-stage')))
        .rotation;
    final first = rotation();
    await _advance(tester, 20);
    final second = rotation();
    expect(second, isNot(first));
    await _advance(tester, 20);
    expect(rotation(), isNot(second));
  });

  testWidgets('in Hebrew the loop runs right to left with its own label', (
    tester,
  ) async {
    final container = await _pumpHome(tester, locale: 'he');
    final hero = find.byKey(const ValueKey('cube-carousel'));
    // In RTL the next cube comes in from the left: swipe right.
    await tester.dragFrom(tester.getCenter(hero), const Offset(220, 0));
    await _advance(tester);
    expect(container.read(selectedCubeSizeProvider), 4);

    await tester.tap(find.byKey(const ValueKey('size-soon')));
    await _advance(tester, 14);
    expect(find.text('קובייה חדשה בקרוב'), findsOneWidget);
    expect(container.read(selectedCubeSizeProvider), 4);
  });
}
