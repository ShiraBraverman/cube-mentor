import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/features/academy/model/lesson_catalog.dart';
import 'package:cube_mentor/features/academy/model/lesson_goal.dart';
import 'package:cube_mentor/features/academy/widgets/lesson_intro.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'test_app.dart';

Future<void> _advance(WidgetTester tester, [int frames = 6]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  group('goal preview data', () {
    test('every lesson morphs from its start into its goal', () {
      for (final lesson in kLessons) {
        final data = GoalPreviewData.of(lesson);
        expect(
          data.start.applyAll(data.moves).toFacelets(),
          data.goal.toFacelets(),
          reason: lesson.id,
        );
        expect(data.focus.intersection(data.muted), isEmpty);
      }
    });

    test('every sub-step lesson shows a real before and after', () {
      for (final lesson in kLessons.where((l) => l.crown > 0)) {
        expect(GoalPreviewData.of(lesson).morphs, isTrue, reason: lesson.id);
        expect(lessonForSubStep(lesson.crown, lesson.subStep), lesson);
      }
    });

    test('the white cross glows, centers stay, the rest is gray', () {
      final cross = kLessons.firstWhere((l) => l.id == 'cross');
      final data = GoalPreviewData.of(cross);
      expect(data.focus, hasLength(4));
      for (final id in data.focus) {
        expect(pieceGroupOf(id, 3), PieceGroup.whiteEdges);
      }
      // 26 visible pieces: 4 glowing edges, 6 dimmed centers, 16 gray.
      expect(data.muted, hasLength(16));
    });

    test('big-cube centers are their own group', () {
      final centers = kLessons.firstWhere((l) => l.id == 'bigCenters');
      final data = GoalPreviewData.of(centers);
      expect(data.focus, hasLength(24));
      expect(data.muted, hasLength(32), reason: '24 edges and 8 corners');
    });
  });

  testWidgets('every lesson has a goal and two or three how-to bullets', (
    tester,
  ) async {
    await tester.pumpWidget(testApp(const SizedBox()));
    final l10n = AppLocalizations.of(tester.element(find.byType(SizedBox)));
    for (final lesson in kLessons) {
      expect(introGoalText(l10n, lesson.id), isNotEmpty, reason: lesson.id);
      final bullets = introHowText(l10n, lesson.id).split('\n');
      expect(bullets.length, inInclusiveRange(2, 3), reason: lesson.id);
    }
  });

  testWidgets('the preview loops start -> goal and can be held on either', (
    tester,
  ) async {
    var started = 0;
    final lesson = kLessons.firstWhere((l) => l.id == 'yellowCross');
    await tester.pumpWidget(
      testApp(
        Scaffold(
          body: LessonIntroCard(lesson: lesson, onStart: () => started++),
        ),
      ),
    );
    await _advance(tester);
    String phase() => tester
        .widget<Text>(
          find.descendant(
            of: find.byKey(const ValueKey('intro-phase')),
            matching: find.byType(Text),
          ),
        )
        .data!;
    Finder segment(String label) => find.descendant(
      of: find.byKey(const ValueKey('intro-view')),
      matching: find.text(label),
    );

    // The loop holds the start, plays the moves, then holds the goal.
    expect(phase(), 'Start');
    await _advance(tester, 72);
    expect(phase(), 'Goal');

    await tester.tap(segment('Start'));
    await _advance(tester);
    expect(phase(), 'Start');
    await _advance(tester, 60);
    expect(phase(), 'Start', reason: 'held on the start state');

    await tester.tap(segment('Goal'));
    await _advance(tester);
    expect(phase(), 'Goal');

    expect(find.textContaining('yellow plus sign'), findsOneWidget);
    await tester.ensureVisible(find.byKey(const ValueKey('intro-start')));
    await tester.tap(find.byKey(const ValueKey('intro-start')));
    expect(started, 1);
  });
}
