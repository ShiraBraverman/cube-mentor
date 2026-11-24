import 'package:flutter/foundation.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import 'lesson_goal.dart';

/// What a stretch of a demonstration does, as one color-specific
/// sentence. The colors are read from the cube (see [WalkBeat]), so a cue
/// always names the very piece and centers on screen.
enum WalkCue {
  // Basics and notation.
  faceTurn,
  trigger,
  triggerBack,
  sliceInner,
  sliceWide,

  // Shared moves.
  turnCube,
  turnTop,
  alignTop,

  // 1.1 White cross (and the CFOP cross).
  crossTop,
  crossMiddle,
  crossFlipped,
  crossBottom,

  // 1.2 First-crown corners (also 2x2 and big cubes solved as a 3x3).
  cornerTop,
  cornerTwisted,

  // 2.1 Middle layer.
  middleRight,
  middleLeft,
  middleFlipped,

  // 3.1 Yellow cross.
  yellowLine,
  yellowL,
  yellowDot,

  // 3.2 Yellow cross edges.
  edgesMatch,
  edgesSwap,
  edgesOpposite,

  // 3.3 Yellow corners.
  cornersCycle,
  cornersNone,

  // 3.4 Twist the yellow corners.
  twistCorner,
  twistFour,
  twistNext,

  // CFOP.
  f2lPair,
  f2lStuck,
  ollSune,
  ollSuneAgain,
  pllCorners,
  pllEdges,
  pllNoEdge,

  // 2x2.
  twoSwapAdjacent,
  twoSwapDiagonal,

  // Big cubes.
  centerCycle,
  centerBar,
  edgePair,
  edgeLast,
  parityOll,
  parityPll,
  parityFive,
}

/// One stretch of a demonstration: its moves and what they do.
@immutable
class WalkSegment {
  const WalkSegment(this.moves, this.cue, {this.bonus = false});

  final String moves;
  final WalkCue? cue;

  /// An edge case that basic examples rarely show, labeled "Bonus case".
  final bool bonus;
}

/// Stage 3 of a lesson: a realistic cube where only the earlier lessons'
/// steps are solved, finished all the way through this lesson's step, one
/// called-out stretch at a time.
///
/// Like a `LessonStep` it is built backwards: [setup] applied to a solved
/// cube gives the cube *after* the walkthrough (this step and every earlier
/// one solved, the rest scrambled), and the walkthrough starts from that
/// goal undone by its segments, so playing them always ends exactly there.
@immutable
class Walkthrough {
  const Walkthrough({this.setup = '', required this.segments});

  final String setup;
  final List<WalkSegment> segments;

  /// Every move of the walkthrough, in order.
  List<CubeMove> demoMoves(int size) => [
    for (final segment in segments)
      ...MoveNotation.parseSequence(segment.moves, size),
  ];

  /// The cube once every segment is played.
  CubeState goalCube(int size) => setup.isEmpty
      ? CubeState.solved(size)
      : CubeState.solved(size)
            .applyAll(MoveNotation.parseSequence(setup, size));

  /// The cube the walkthrough starts from.
  CubeState startCube(int size) =>
      goalCube(size).applyAll(demoMoves(size).reversed.map((m) => m.inverse));

  bool get hasBonus => segments.any((s) => s.bonus);
}

/// A stretch of a demonstration, analyzed on the actual cube: where it
/// starts in the move list, how the cube is held, and the pieces it brings
/// home (by their colors).
@immutable
class WalkBeat {
  const WalkBeat({
    required this.start,
    required this.end,
    required this.moves,
    required this.cue,
    required this.bonus,
    required this.top,
    required this.front,
    required this.nextTop,
    required this.nextFront,
    this.piece = const [],
    this.edge = const [],
    this.face,
    this.frontRight = const [],
    this.backEdge = const [],
  });

  /// Index of the first move of this beat in the demonstration, and one
  /// past its last move.
  final int start;
  final int end;

  /// The beat's moves, e.g. `R U R' U'`.
  final String moves;
  final WalkCue? cue;
  final bool bonus;

  /// Center colors on top and in front when the beat starts, and once it
  /// is done (they differ after a whole-cube turn).
  final StickerColor top;
  final StickerColor front;
  final StickerColor nextTop;
  final StickerColor nextFront;

  /// Colors of a piece the beat brings home (a corner before an edge
  /// before a center), white or yellow first; empty when none.
  final List<StickerColor> piece;

  /// For a corner-edge pair: the edge's colors.
  final List<StickerColor> edge;

  /// Center color of the face the beat's first move turns.
  final StickerColor? face;

  /// Colors of the top front-right corner, and of the top back edge (odd
  /// sizes), when the beat starts.
  final List<StickerColor> frontRight;
  final List<StickerColor> backEdge;

  /// The side colors of [piece] (not white or yellow), the one facing the
  /// learner first: the centers a corner or middle edge goes between.
  List<StickerColor> get sides {
    final rest = [
      for (final c in piece)
        if (c != StickerColor.white && c != StickerColor.yellow) c,
    ];
    if (rest.remove(front)) rest.insert(0, front);
    return rest;
  }

  bool contains(int moveIndex) => moveIndex >= start && moveIndex < end;
}

/// Whether [move] turns the whole cube.
bool isRotation(CubeMove move, int size) =>
    move.fromLayer == 0 && move.toLayer == size - 1;

/// Where every piece belongs while [remaining] moves are still to play
/// toward [goal]: the goal, turned back by the whole-cube turns still to
/// come (face turns do not move a piece that is already home).
CubeState homeAt(CubeState goal, List<CubeMove> remaining, int size) =>
    goal.applyAll(
      remaining.reversed
          .where((m) => isRotation(m, size))
          .map((m) => m.inverse),
    );

/// Surface pieces of [cube] by position.
Map<IVec3, Cubie> piecesByPosition(CubeState cube) => {
  for (final c in cube.cubies)
    if (c.stickers.isNotEmpty) c.position: c,
};

/// Whether the piece at [position] shows the colors [home] has there. Pieces
/// of the same colors (big-cube centers and edge wings) are interchangeable.
bool looksHome(
  Map<IVec3, Cubie> pieces,
  Map<IVec3, Cubie> home,
  IVec3 position,
) => mapEquals(pieces[position]?.stickers, home[position]?.stickers);

List<StickerColor> colorsOf(Cubie cubie) =>
    cubie.stickers.values.toList()..sort((a, b) => a.index.compareTo(b.index));

/// The color showing on the face with [normal] of a cube that has only
/// been turned as a whole.
StickerColor _faceColor(CubeState shadow, IVec3 normal) {
  for (final cubie in shadow.cubies) {
    final color = cubie.stickers[normal];
    if (color != null) return color;
  }
  return StickerColor.white;
}

IVec3 _normalOf(CubeMove move, int size) {
  // The side of the cube the turned layers are closer to.
  final positive = move.fromLayer + move.toLayer > size - 1;
  return switch (move.axis) {
    0 => positive ? kNormalRight : kNormalLeft,
    1 => positive ? kNormalUp : kNormalDown,
    _ => positive ? kNormalFront : kNormalBack,
  };
}

/// Splits a demonstration into [WalkBeat]s.
///
/// [setup] applied to a solved cube gives the cube after every segment;
/// [target] are the piece groups the lesson brings home (empty: any).
List<WalkBeat> analyzeBeats({
  required int size,
  required String setup,
  required List<WalkSegment> segments,
  Set<PieceGroup> target = const {},
}) {
  final setupMoves = setup.isEmpty
      ? const <CubeMove>[]
      : MoveNotation.parseSequence(setup, size);
  final goal = CubeState.solved(size).applyAll(setupMoves);
  final parsed = [
    for (final s in segments) MoveNotation.parseSequence(s.moves, size),
  ];
  final all = [for (final p in parsed) ...p];
  final inverse = all.reversed.map((m) => m.inverse).toList();
  var cube = goal.applyAll(inverse);
  // A solved cube that only follows whole-cube turns tells which center
  // color is where, on every cube size.
  var shadow = CubeState.solved(size).applyAll([
    ...setupMoves.where((m) => isRotation(m, size)),
    ...inverse.where((m) => isRotation(m, size)),
  ]);
  final max = size - 1;
  final groups = {for (final c in goal.cubies) c.id: pieceGroupOf(c.id, size)};

  final beats = <WalkBeat>[];
  var index = 0;
  for (var i = 0; i < segments.length; i++) {
    final moves = parsed[i];
    final before = cube;
    final after = before.applyAll(moves);
    final homeBefore = piecesByPosition(homeAt(goal, all.sublist(index), size));
    final homeAfter = piecesByPosition(
      homeAt(goal, all.sublist(index + moves.length), size),
    );
    final was = piecesByPosition(before);
    final now = piecesByPosition(after);
    final fixed = <Cubie>[];
    for (final MapEntry(key: position, value: cubie) in now.entries) {
      final group = groups[cubie.id];
      if (group == null) continue;
      if (target.isNotEmpty && !target.contains(group)) continue;
      if (!looksHome(was, homeBefore, position) &&
          looksHome(now, homeAfter, position)) {
        fixed.add(cubie);
      }
    }
    fixed.sort((a, b) => b.stickers.length.compareTo(a.stickers.length));
    final pair = fixed.length > 1 && fixed[0].stickers.length == 3
        ? fixed.where((c) => c.stickers.length == 2).firstOrNull
        : null;
    final first = moves.isEmpty ? null : moves.first;
    final nextShadow = shadow.applyAll(moves.where((m) => isRotation(m, size)));
    final frontRight = was[(max, max, max)];
    final backEdge = size.isOdd ? was[(0, max, -max)] : null;
    beats.add(
      WalkBeat(
        start: index,
        end: index + moves.length,
        moves: segments[i].moves,
        cue: segments[i].cue,
        bonus: segments[i].bonus,
        top: _faceColor(shadow, kNormalUp),
        front: _faceColor(shadow, kNormalFront),
        nextTop: _faceColor(nextShadow, kNormalUp),
        nextFront: _faceColor(nextShadow, kNormalFront),
        piece: fixed.isEmpty ? const [] : colorsOf(fixed[0]),
        edge: pair == null ? const [] : colorsOf(pair),
        face: first == null || isRotation(first, size)
            ? null
            : _faceColor(shadow, _normalOf(first, size)),
        frontRight: frontRight == null ? const [] : colorsOf(frontRight),
        backEdge: backEdge == null ? const [] : colorsOf(backEdge),
      ),
    );
    index += moves.length;
    cube = after;
    shadow = nextShadow;
  }
  return beats;
}
