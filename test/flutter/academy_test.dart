import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/l10n/crown_words.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/l10n/move_words.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/features/academy/model/academy_progress.dart';
import 'package:cube_mentor/features/academy/model/lesson.dart';
import 'package:cube_mentor/features/academy/model/lesson_catalog.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_cube_solver.dart';

final _en = lookupAppLocalizations(const Locale('en'));
final _he = lookupAppLocalizations(const Locale('he'));

Future<void> _advance(WidgetTester tester, [int frames = 12]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  group('lesson catalogue', () {
    test('every demonstration parses and ends on a solved cube', () {
      expect(kLessons, hasLength(29));
      final ids = <String>{};
      for (final lesson in kLessons) {
        expect(ids.add(lesson.id), isTrue, reason: 'duplicate ${lesson.id}');
        expect(lesson.steps, isNotEmpty);
        for (final step in lesson.steps) {
          final start = step.startCube(lesson.size);
          final end = start.applyAll(step.demoMoves(lesson.size));
          // Setups only re-orient the cube, so the end is always solved.
          expect(end.isSolved, isTrue, reason: step.id);
          // Notation drills (R R' ...) start and end solved; every other
          // demonstration starts from a position it fixes.
          final drill = const {
            'basicsFaces',
            'bigSlices',
            'fiveSlices',
            'sixSlices',
          }.contains(step.id);
          if (step.demo.isNotEmpty && !drill) {
            expect(start.isSolved, isFalse, reason: step.id);
          }
        }
      }
    });

    test('the beginner track is the 3-crown, 7-sub-step syllabus', () {
      final beginner = [
        for (final lesson in kLessons)
          if (lesson.crown > 0) (lesson.crown, lesson.subStep),
      ];
      // One lesson per sub-step, in the solver's order.
      expect(beginner, [for (final s in kLblSubSteps) (s.crown, s.subStep)]);
      expect(
        kLessons.where((l) => l.track == LessonTrack.beginner).map((l) => l.id),
        [
          'basics',
          'cross',
          'corners',
          'middle',
          'yellowCross',
          'yellowEdges',
          'yellowCorners',
          'twistCorners',
        ],
      );
      expect(
        lessonTitle(_en, 'yellowCorners'),
        '3.3 Position the yellow corners',
      );
      expect(
        lessonTitle(_he, 'twistCorners'),
        '3.4 סיבוב הפינות לצבעים הנכונים',
      );
      expect(lessonTitle(_he, 'corners'), '1.2 פינות הכתר הראשון');
      expect(lessonTitle(_he, 'middle'), '2.1 השלמת השכבה האמצעית');
      expect(lessonTitle(_he, 'yellowEdges'), '3.2 התאמת מרכזי האיקס הצהוב');
      expect(crownName(_he, 1), 'הכתר הראשון');
      expect(crownName(_he, 2), 'הכתר השני');
      expect(crownName(_he, 3), 'הכתר השלישי');
      expect(
        lessonDescription(_en, 'middle'),
        'Insert the 4 middle-layer edges without disturbing the first crown.',
      );
    });

    test('covers every track, with advanced lessons marked', () {
      for (final track in LessonTrack.values) {
        expect(kLessons.where((l) => l.track == track), isNotEmpty);
      }
      expect(
        kLessons.where((l) => l.advanced).map((l) => l.id),
        containsAll(['f2l', 'oll', 'pll', 'twoPbl', 'bigParity']),
      );
      expect(kLessons.firstWhere((l) => l.id == 'bigParity').size, 4);
      expect(kLessons.firstWhere((l) => l.id == 'twoOll').size, 2);
    });

    test('every lesson and step is translated in English and Hebrew', () {
      for (final l10n in [_en, _he]) {
        for (final lesson in kLessons) {
          expect(lessonTitle(l10n, lesson.id), isNot(lesson.id));
          expect(lessonDescription(l10n, lesson.id), isNot(lesson.id));
          for (final step in lesson.steps) {
            expect(lessonStepTitle(l10n, step.id), isNot(step.id));
            expect(lessonStepBody(l10n, step.id), isNot(step.id));
          }
        }
        for (final track in LessonTrack.values) {
          expect(trackTitle(l10n, track), isNotEmpty);
        }
      }
    });

    test('5x5 and 6x6 have full tracks, in solving order', () {
      List<String> track(LessonTrack t) => [
        for (final l in kLessons)
          if (l.track == t) l.id,
      ];
      expect(track(LessonTrack.fiveByFive), [
        'fiveIntro',
        'fiveCenters',
        'fiveEdges',
        'fiveSolve',
        'fiveParity',
      ]);
      expect(track(LessonTrack.sixBySix), [
        'sixIntro',
        'sixCenters',
        'sixEdges',
        'sixSolve',
        'sixParity',
      ]);
      for (final lesson in kLessons.where((l) => l.size >= 5)) {
        expect(lesson.size, lesson.id.startsWith('five') ? 5 : 6);
        // Plain words in the lessons: no notation letters in the texts.
        for (final step in lesson.steps) {
          expect(
            lessonStepBody(_en, step.id),
            isNot(matches(RegExp(r"\b[RLUDFB]w?['2]?\b"))),
            reason: step.id,
          );
        }
      }
    });

    test('the big-cube demos do what the lessons say', () {
      // A pure center 3-cycle: at most three stickers change (two of the
      // three may share a color), and only center stickers.
      final cycle = MoveNotation.parseSequence("2R U' 2L' U 2R' U' 2L U", 4);
      final after = CubeState.solved(4).applyAll(cycle).toFacelets();
      final before = CubeState.solved(4).toFacelets();
      final moved = [
        for (var i = 0; i < before.length; i++)
          if (before[i] != after[i]) i,
      ];
      expect(moved.length, inInclusiveRange(2, 3));
      for (final i in moved) {
        final row = (i % 16) ~/ 4;
        final col = i % 4;
        expect(row > 0 && row < 3 && col > 0 && col < 3, isTrue);
      }
      // OLL parity flips the top-front dedge and touches nothing below the
      // top layer (centers and the first three layers stay solved).
      final oll = kLessons
          .firstWhere((l) => l.id == 'bigParity')
          .steps
          .first
          .demoMoves(4);
      final flipped = CubeState.solved(4).applyAll(oll).toFacelets();
      final solved = CubeState.solved(4).toFacelets();
      for (var i = 0; i < solved.length; i++) {
        if (solved[i] == flipped[i]) continue;
        final face = i ~/ 16;
        final row = (i % 16) ~/ 4;
        final topLayer = face == 0 || (face != 3 && row == 0);
        expect(topLayer, isTrue, reason: 'sticker $i');
      }
      // The two front wings of the top layer now show green on top.
      expect(flipped.substring(13, 15), 'GG');
    });
  });

  group('plain-language moves', () {
    String say(String token, [int size = 3]) =>
        describeMove(_en, MoveNotation.parse(token, size), size);

    test('face turns say which way the front stickers go', () {
      expect(say('R'), 'Turn the right face up');
      expect(say("R'"), 'Turn the right face down');
      expect(say('L'), 'Turn the left face down');
      expect(say('U'), 'Turn the top face to the left');
      expect(say("D'"), 'Turn the bottom face to the left');
      expect(say('F'), 'Turn the front face clockwise');
      expect(say('B'), 'Turn the back face clockwise, as seen from the back');
      expect(say('F2'), 'Turn the front face half a turn (twice)');
    });

    test('slices, wide turns, blocks and rotations', () {
      expect(say('M'), 'Turn the middle layer down');
      expect(say('2R', 4), 'Turn layer 2 from the right face up');
      expect(say('3Rw', 6), 'Turn the right face (3 layers deep) up');
      expect(say("2-3Lw'", 6), 'Turn layers 2–3 from the left face up');
      expect(say('x'), 'Tilt the whole cube: the front goes up to the top');
      expect(say("y'"), 'Spin the whole cube: the front goes to the right');
      expect(
        say('z2'),
        'Roll the whole cube upside down: the top goes to the bottom',
      );
      expect(
        describeMove(_he, MoveNotation.parse('R', 3), 3),
        'סובבו את הפאה הימנית למעלה',
      );
    });

    test('hold prompts name the centers', () {
      expect(
        holdPrompt(_en, StickerColor.yellow, StickerColor.green),
        'Hold the cube with the yellow center on top and the green center '
        'facing you.',
      );
    });
  });

  group('progress', () {
    test('completing lessons moves the continue hook forward', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final c = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );
      addTearDown(c.dispose);
      expect(c.read(academyProgressProvider).nextLesson!.id, 'basics');
      await c.read(academyProgressProvider.notifier).complete('basics');
      expect(c.read(academyProgressProvider).nextLesson!.id, 'cross');
      // Opening a later lesson continues from there.
      await c.read(academyProgressProvider.notifier).open('oll');
      expect(c.read(academyProgressProvider).nextLesson!.id, 'oll');
      expect(prefs.getStringList('academy_completed'), ['basics']);

      final again = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );
      addTearDown(again.dispose);
      expect(again.read(academyProgressProvider).completedCount, 1);
      expect(again.read(academyProgressProvider).lastLesson, 'oll');
    });
  });

  testWidgets('home → continue learning → lesson with 3D demo → done', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
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
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Start learning'), findsOneWidget);
    expect(find.text('Meet the cube'), findsOneWidget);
    expect(find.text('Lesson 1 of 29'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('continue-learning')));
    await _advance(tester);

    // The lesson opens on its goal card: live preview, goal and how-to.
    expect(find.byKey(const ValueKey('lesson-intro')), findsOneWidget);
    expect(find.byKey(const ValueKey('intro-preview')), findsOneWidget);
    expect(find.text("What's the goal?"), findsOneWidget);
    expect(find.textContaining('Learn to read the cube'), findsOneWidget);
    expect(find.textContaining('Centers never move'), findsOneWidget);
    expect(find.text('Part 1 of 3'), findsNothing);
    expect(find.byKey(const ValueKey('lesson-intro-open')), findsNothing);
    await tester.tap(find.byKey(const ValueKey('intro-start')));
    await _advance(tester);
    expect(find.byKey(const ValueKey('lesson-intro')), findsNothing);
    expect(find.text('Part 1 of 3'), findsOneWidget);

    // The flag in the header reopens it mid-lesson.
    await tester.tap(find.byKey(const ValueKey('lesson-intro-open')));
    await _advance(tester);
    expect(find.byKey(const ValueKey('lesson-intro')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('intro-start')));
    await _advance(tester);
    expect(find.text('Part 1 of 3'), findsOneWidget);
    expect(find.text('Three kinds of pieces'), findsOneWidget);
    expect(
      find.textContaining('the white center on top and the green center'),
      findsOneWidget,
    );

    // Part 2 demonstrates R R' U U' F F' with plain-language subtitles.
    await tester.tap(find.byKey(const ValueKey('lesson-next')));
    await _advance(tester, 4);
    expect(find.text('Six face letters'), findsOneWidget);
    expect(find.text('Right side'), findsOneWidget);
    expect(find.text('Up'), findsOneWidget);
    expect(find.byKey(const ValueKey('move-arrow-up')), findsOneWidget);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Scaffold).last),
    );
    expect(container.read(cubeSessionProvider(3)).playback, hasLength(6));

    // No auto-play in lessons: the learner steps one move at a time.
    expect(find.byKey(const ValueKey('lesson-show')), findsNothing);
    expect(find.byTooltip('Play'), findsNothing);
    CubeSession session() => container.read(cubeSessionProvider(3));
    await tester.tap(find.byKey(const ValueKey('lesson-next-move')));
    await _advance(tester, 12);
    expect(session().playbackIndex, 1);
    expect(session().isPlaying, isFalse, reason: 'one move, then it waits');
    await tester.tap(find.byKey(const ValueKey('lesson-prev-move')));
    await _advance(tester, 12);
    expect(session().playbackIndex, 0);
    expect(session().cube.isSolved, isTrue);
    for (var i = 0; i < 6; i++) {
      await tester.tap(find.byKey(const ValueKey('lesson-next-move')));
      await _advance(tester, 12);
    }
    expect(session().isComplete, isTrue);
    expect(find.text('Nice! Tap Next to continue.'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('lesson-next')));
    await _advance(tester, 4);
    expect(find.text('Finish lesson'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('lesson-next')));
    await _advance(tester, 4);
    expect(find.text('Lesson complete!'), findsOneWidget);
    expect(prefs.getStringList('academy_completed'), ['basics']);

    await tester.tap(find.byKey(const ValueKey('lesson-back-academy')));
    await _advance(tester);
    expect(find.text('Continue learning'), findsOneWidget);
    // The next lesson is named after its sub-step, like the solver.
    expect(find.text('1.1 White cross'), findsOneWidget);
    expect(find.text('Lesson 2 of 29'), findsOneWidget);
  });

  testWidgets('the Academy lists every track in Hebrew, right to left', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({'app_locale': 'he'});
    final prefs = await SharedPreferences.getInstance();
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: const CubeMentorApp(),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('mode-academy')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('mode-academy')));
    await _advance(tester);
    expect(find.text('אקדמיה'), findsOneWidget);
    expect(find.text('0 מתוך 29 שיעורים הושלמו'), findsOneWidget);
    expect(find.text('מתחילים 3×3: שלושת הכתרים'), findsOneWidget);
    expect(find.text('1.1 איקס לבן מותאם למרכזים'), findsOneWidget);
    expect(find.byKey(const ValueKey('academy-crown-1')), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.text('אקדמיה'))),
      TextDirection.rtl,
    );
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('lesson-bigParity')),
      300,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('מתקדם'), findsWidgets);
  });
}
