import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/features/academy/model/lesson.dart';
import 'package:cube_mentor/features/academy/model/lesson_catalog.dart';
import 'package:cube_mentor/features/academy/model/lesson_goal.dart';
import 'package:cube_mentor/features/academy/model/walkthrough.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;

/// One analyzed demonstration of a lesson: an example or a walkthrough.
class _Demo {
  _Demo(this.lesson, this.name, this.setup, this.segments);

  final Lesson lesson;
  final String name;
  final String setup;
  final List<WalkSegment> segments;

  int get size => lesson.size;
}

List<_Demo> _demos() => [
  for (final lesson in kLessons) ...[
    for (final (i, step) in lesson.examples.indexed)
      _Demo(lesson, '${lesson.id} example ${i + 1}', step.setup, [
        WalkSegment(step.demo, step.cue),
      ]),
    for (final (i, walk) in lesson.practice.indexed)
      _Demo(
        lesson,
        '${lesson.id} walkthrough ${i + 1}',
        walk.setup,
        walk.segments,
      ),
  ],
];

typedef _Frame = ({
  WalkBeat beat,
  CubeState before,
  CubeState after,
  CubeState homeBefore,
  CubeState homeAfter,
});

List<_Frame> _frames(_Demo demo) {
  final size = demo.size;
  final beats = analyzeBeats(
    size: size,
    setup: demo.setup,
    segments: demo.segments,
    target: lessonGoal(demo.lesson.id).target,
  );
  final goal = demo.setup.isEmpty
      ? CubeState.solved(size)
      : CubeState.solved(size)
            .applyAll(MoveNotation.parseSequence(demo.setup, size));
  final all = [
    for (final s in demo.segments) ...MoveNotation.parseSequence(s.moves, size),
  ];
  var cube = goal.applyAll(all.reversed.map((m) => m.inverse));
  return [
    for (final beat in beats)
      () {
        final before = cube;
        cube = cube.applyAll(all.sublist(beat.start, beat.end));
        return (
          beat: beat,
          before: before,
          after: cube,
          homeBefore: homeAt(goal, all.sublist(beat.start), size),
          homeAfter: homeAt(goal, all.sublist(beat.end), size),
        );
      }(),
  ];
}

bool _sameColors(Cubie c, List<StickerColor> colors) =>
    c.stickers.length == colors.length &&
    colorsOf(c).toString() == colors.toString();

/// The piece named by the beat, where it was before the beat.
Cubie _pieceBefore(_Frame f) {
  final id = f.after.cubies.firstWhere((c) => _sameColors(c, f.beat.piece)).id;
  return f.before.cubies[id];
}

bool _atHome(Cubie c, CubeState home) =>
    c.position == home.cubies[c.id].position;

bool _oriented(Cubie c, CubeState home) => isHome(c, home);

bool isHome(Cubie c, CubeState home) =>
    _atHome(c, home) &&
    c.stickers.entries.every(
      (e) => home.cubies[c.id].stickers[e.key] == e.value,
    );

/// Leading top-layer turns of a beat, applied.
CubeState _afterLeadingTopTurns(_Frame f, int size) {
  var cube = f.before;
  for (final m in MoveNotation.parseSequence(f.beat.moves, size)) {
    if (m.axis != 1 || m.fromLayer != size - 1) break;
    cube = cube.apply(m);
  }
  return cube;
}

/// Center color of the face with [normal].
StickerColor _center(CubeState home, IVec3 normal) =>
    home.faceColors(normal)[home.size * home.size ~/ 2];

/// Sides (as normals) whose top edge matches its center.
Set<IVec3> _matchedEdges(CubeState cube, CubeState home) {
  final m = cube.size - 1;
  final result = <IVec3>{};
  for (final c in cube.cubies) {
    if (c.stickers.length != 2 || c.position.$2 != m) continue;
    for (final e in c.stickers.entries) {
      if (e.key == kNormalUp) continue;
      if (e.value == _center(home, e.key)) result.add(e.key);
    }
  }
  return result;
}

/// Positions of the top edges showing yellow on top.
int _yellowEdgesUp(CubeState cube) {
  final m = cube.size - 1;
  return cube.cubies
      .where(
        (c) =>
            c.stickers.length == 2 &&
            c.position.$2 == m &&
            c.stickers[kNormalUp] == StickerColor.yellow,
      )
      .length;
}

Cubie _at(CubeState cube, IVec3 p) =>
    cube.cubies.firstWhere((c) => c.position == p);

/// Whether the two top corners on the side [normal] show the same color
/// there (headlights).
bool _headlights(CubeState cube, IVec3 normal) {
  final colors = [
    for (final c in cube.cubies)
      if (c.stickers.length == 3 &&
          c.position.$2 == cube.size - 1 &&
          c.stickers.containsKey(normal))
        c.stickers[normal],
  ];
  return colors.length == 2 && colors[0] == colors[1];
}

void main() {
  final demos = _demos();

  test('every lesson has guided examples and two walkthroughs', () {
    for (final lesson in kLessons) {
      expect(
        lesson.examples.length,
        greaterThanOrEqualTo(2),
        reason: lesson.id,
      );
      expect(lesson.practice, hasLength(2), reason: lesson.id);
      for (final step in lesson.examples) {
        expect(step.cue, isNotNull, reason: step.id);
      }
    }
    // Bonus cases are labeled in every lesson past the notation intros.
    const intros = {'bigIntro', 'fiveIntro', 'sixIntro'};
    for (final lesson in kLessons.where((l) => !intros.contains(l.id))) {
      expect(lesson.practice.any((w) => w.hasBonus), isTrue, reason: lesson.id);
    }
  });

  test('walkthroughs start with only the earlier steps solved', () {
    for (final demo in demos.where((d) => d.name.contains('walkthrough'))) {
      final goal = lessonGoal(demo.lesson.id);
      final frames = _frames(demo);
      final first = frames.first;
      final now = piecesByPosition(first.before);
      final home = piecesByPosition(first.homeBefore);
      var unsolved = 0;
      for (final c in first.before.cubies) {
        final group = pieceGroupOf(c.id, demo.size);
        if (group == null || c.stickers.isEmpty) continue;
        final ok = looksHome(now, home, c.position);
        if (goal.done.contains(group)) {
          expect(ok, isTrue, reason: '${demo.name}: ${group.name} broken');
        }
        if (goal.target.contains(group) && !ok) unsolved++;
      }
      if (goal.target.isNotEmpty) {
        expect(unsolved, greaterThan(0), reason: demo.name);
      }
    }
  });

  test('every callout tells the truth about the cube', () {
    final failures = <String>[];
    void expect(Object? actual, Object? matcher, {String? reason}) {
      try {
        flutter_test.expect(actual, matcher, reason: reason);
      } on flutter_test.TestFailure catch (e) {
        failures.add('$reason: ${e.message?.split('\n').take(2).join(' ')}');
      }
    }

    for (final demo in demos) {
      final size = demo.size;
      final max = size - 1;
      for (final f in _frames(demo)) {
        final beat = f.beat;
        final why = '${demo.name} [${beat.moves}] ${beat.cue}';
        bool topLayer(Cubie c) => c.position.$2 == max;
        switch (beat.cue) {
          case WalkCue.crossTop ||
              WalkCue.cornerTop ||
              WalkCue.middleRight ||
              WalkCue.middleLeft ||
              WalkCue.f2lPair:
            expect(beat.piece, isNotEmpty, reason: why);
            final piece = _pieceBefore(f);
            // On top, or already lined up below it for the white-on-top
            // big-cube examples.
            expect(
              topLayer(piece) || piece.position.$2 == -max,
              isTrue,
              reason: why,
            );
            if (beat.cue == WalkCue.f2lPair) {
              expect(beat.edge, isNotEmpty, reason: why);
            }
          case WalkCue.crossMiddle:
            final piece = _pieceBefore(f);
            expect(piece.position.$2.abs() < max, isTrue, reason: why);
          case WalkCue.crossFlipped ||
              WalkCue.cornerTwisted ||
              WalkCue.middleFlipped:
            final piece = _pieceBefore(f);
            expect(_atHome(piece, f.homeBefore), isTrue, reason: why);
            expect(_oriented(piece, f.homeBefore), isFalse, reason: why);
          case WalkCue.f2lStuck:
            expect(_atHome(_pieceBefore(f), f.homeBefore), isTrue, reason: why);
          case WalkCue.crossBottom ||
              WalkCue.edgesMatch ||
              WalkCue.centerCycle ||
              WalkCue.centerBar ||
              WalkCue.edgePair ||
              WalkCue.edgeLast:
            expect(beat.piece, isNotEmpty, reason: why);
          case WalkCue.yellowLine:
            final cube = _afterLeadingTopTurns(f, size);
            expect(_yellowEdgesUp(cube), 2, reason: why);
            expect(
              _at(cube, (max, max, 0)).stickers[kNormalUp],
              StickerColor.yellow,
              reason: '$why: the line runs left to right',
            );
          case WalkCue.yellowL:
            final cube = _afterLeadingTopTurns(f, size);
            expect(_yellowEdgesUp(cube), 2, reason: why);
            expect(
              _at(cube, (-max, max, 0)).stickers[kNormalUp],
              StickerColor.yellow,
              reason: '$why: L at the back left',
            );
            expect(
              _at(cube, (0, max, -max)).stickers[kNormalUp],
              StickerColor.yellow,
              reason: '$why: L at the back left',
            );
          case WalkCue.yellowDot:
            expect(_yellowEdgesUp(f.before), 0, reason: why);
          case WalkCue.edgesSwap:
            final cube = _afterLeadingTopTurns(f, size);
            expect(_matchedEdges(cube, f.homeBefore), {
              kNormalBack,
              kNormalRight,
            }, reason: why);
          case WalkCue.edgesOpposite:
            var cube = f.before;
            var opposite = false;
            for (var k = 0; k < 4; k++) {
              final matched = _matchedEdges(cube, f.homeBefore);
              expect(matched.length, isNot(4), reason: why);
              if (matched.length == 2) {
                final [a, b] = matched.toList();
                expect(
                  a.$1 + b.$1 == 0 && a.$3 + b.$3 == 0,
                  isTrue,
                  reason: '$why: matched edges are opposite',
                );
                opposite = true;
              }
              cube = cube.apply(MoveNotation.parse('U', size));
            }
            expect(opposite, isTrue, reason: why);
          case WalkCue.cornersCycle:
            final corner = _at(f.before, (max, max, max));
            expect(_atHome(corner, f.homeBefore), isTrue, reason: why);
            expect(beat.frontRight, isNotEmpty, reason: why);
          case WalkCue.cornersNone:
            for (final c in f.before.cubies) {
              if (c.stickers.length == 3 && topLayer(c)) {
                expect(_atHome(c, f.homeBefore), isFalse, reason: why);
              }
            }
          case WalkCue.twistCorner || WalkCue.twistFour:
            // The top may be turned while twisting: no position check.
            final corner = _at(f.before, (max, max, max));
            expect(
              corner.stickers[kNormalUp],
              isNot(StickerColor.yellow),
              reason: why,
            );
            // After this beat the corner shows yellow on top.
            final now = f.after.cubies[corner.id];
            expect(now.stickers[kNormalUp], StickerColor.yellow, reason: why);
          case WalkCue.pllCorners || WalkCue.twoSwapAdjacent:
            final cube = _afterLeadingTopTurns(f, size);
            expect(_headlights(cube, kNormalLeft), isTrue, reason: why);
          case WalkCue.twoSwapDiagonal:
            for (final side in [
              kNormalFront,
              kNormalBack,
              kNormalLeft,
              kNormalRight,
            ]) {
              expect(_headlights(f.before, side), isFalse, reason: why);
            }
          case WalkCue.pllEdges:
            // The back is one finished block: corners and edge match.
            final back = [
              for (final c in f.before.cubies)
                if (topLayer(c) && c.stickers.containsKey(kNormalBack))
                  c.stickers[kNormalBack],
            ];
            expect(back.toSet(), hasLength(1), reason: why);
            expect(beat.backEdge, isNotEmpty, reason: why);
          case WalkCue.pllNoEdge:
            expect(_matchedEdges(f.before, f.homeBefore), isEmpty, reason: why);
          case WalkCue.turnCube:
            expect(
              beat.top != beat.nextTop || beat.front != beat.nextFront,
              isTrue,
              reason: why,
            );
          case WalkCue.faceTurn || WalkCue.sliceInner || WalkCue.sliceWide:
            expect(beat.face, isNotNull, reason: why);
          case WalkCue.triggerBack:
            expect(f.after.isSolved, isTrue, reason: why);
          case WalkCue.alignTop:
            expect(
              f.after.isSolved || demo.lesson.id == 'yellowCorners',
              isTrue,
              reason: why,
            );
          case WalkCue.trigger ||
              WalkCue.turnTop ||
              WalkCue.twistNext ||
              WalkCue.ollSune ||
              WalkCue.ollSuneAgain ||
              WalkCue.parityOll ||
              WalkCue.parityPll ||
              WalkCue.parityFive ||
              null:
            break;
        }
      }
    }
    flutter_test.expect(failures, isEmpty, reason: failures.join('\n'));
  });

  test('beats follow the hold and name the pieces by color', () {
    final corners = kLessons.firstWhere((l) => l.id == 'corners');
    final frames = _frames(
      _Demo(
        corners,
        'corners',
        corners.practice.first.setup,
        corners.practice.first.segments,
      ),
    );
    final first = frames.first.beat;
    expect(first.top, StickerColor.yellow);
    expect(first.front, StickerColor.green);
    expect(first.piece, [
      StickerColor.white,
      StickerColor.green,
      StickerColor.orange,
    ]);
    expect(first.sides, [StickerColor.green, StickerColor.orange]);
    // After one whole-cube turn the orange center faces the learner.
    expect(frames[2].beat.front, StickerColor.orange);
    expect(frames[2].beat.sides.first, StickerColor.orange);
  });
}
