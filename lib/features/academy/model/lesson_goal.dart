import 'package:flutter/foundation.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/cube/facelets.dart';
import 'lesson.dart';

/// Groups of pieces, named by their solved place (white is the first
/// layer, yellow the last), so they follow the pieces through any turn.
enum PieceGroup {
  centers,
  whiteEdges,
  whiteCorners,
  middleEdges,
  yellowEdges,
  yellowCorners,
}

const _firstLayer = {
  PieceGroup.centers,
  PieceGroup.whiteEdges,
  PieceGroup.whiteCorners,
};
const _twoLayers = {..._firstLayer, PieceGroup.middleEdges};
const _lastLayer = {PieceGroup.yellowEdges, PieceGroup.yellowCorners};

/// What a lesson builds: the pieces it brings home ([target], drawn
/// brightly), those already solved before it ([done], dimmed) and the rest
/// (gray). An empty [target] shows the whole cube in color.
@immutable
class LessonGoal {
  const LessonGoal({this.target = const {}, this.done = const {}});

  final Set<PieceGroup> target;
  final Set<PieceGroup> done;
}

const Map<String, LessonGoal> _goals = {
  'cross': LessonGoal(
    target: {PieceGroup.whiteEdges},
    done: {PieceGroup.centers},
  ),
  'corners': LessonGoal(
    target: {PieceGroup.whiteCorners},
    done: {PieceGroup.centers, PieceGroup.whiteEdges},
  ),
  'middle': LessonGoal(target: {PieceGroup.middleEdges}, done: _firstLayer),
  'yellowCross': LessonGoal(target: {PieceGroup.yellowEdges}, done: _twoLayers),
  'yellowEdges': LessonGoal(target: {PieceGroup.yellowEdges}, done: _twoLayers),
  'yellowCorners': LessonGoal(
    target: {PieceGroup.yellowCorners},
    done: {..._twoLayers, PieceGroup.yellowEdges},
  ),
  'twistCorners': LessonGoal(
    target: {PieceGroup.yellowCorners},
    done: {..._twoLayers, PieceGroup.yellowEdges},
  ),
  'f2l': LessonGoal(
    target: {PieceGroup.whiteCorners, PieceGroup.middleEdges},
    done: {PieceGroup.centers, PieceGroup.whiteEdges},
  ),
  'oll': LessonGoal(target: _lastLayer, done: _twoLayers),
  'pll': LessonGoal(target: _lastLayer, done: _twoLayers),
  'twoFirst': LessonGoal(target: {PieceGroup.whiteCorners}),
  'twoOll': LessonGoal(
    target: {PieceGroup.yellowCorners},
    done: {PieceGroup.whiteCorners},
  ),
  'bigCenters': LessonGoal(target: {PieceGroup.centers}),
  'bigEdges': LessonGoal(
    target: {
      PieceGroup.whiteEdges,
      PieceGroup.middleEdges,
      PieceGroup.yellowEdges,
    },
    done: {PieceGroup.centers},
  ),
  'bigParity': LessonGoal(
    target: {
      PieceGroup.whiteEdges,
      PieceGroup.middleEdges,
      PieceGroup.yellowEdges,
    },
    done: {
      PieceGroup.centers,
      PieceGroup.whiteCorners,
      PieceGroup.yellowCorners,
    },
  ),
};

/// The goal of lesson [id]; lessons about the whole cube show it all.
LessonGoal lessonGoal(String id) => _goals[id] ?? const LessonGoal();

/// Group of the piece with [id] on a cube of [size], from its solved place;
/// null for hidden inner pieces.
PieceGroup? pieceGroupOf(int id, int size) {
  final max = size - 1;
  final ix = id ~/ (size * size);
  final iy = (id ~/ size) % size;
  final iz = id % size;
  bool outer(int i) => i == 0 || i == max;
  final faces = [ix, iy, iz].where(outer).length;
  if (faces == 0) return null;
  if (faces == 1) return PieceGroup.centers;
  // White is the solved top layer (+y), yellow the bottom.
  final white = iy == max;
  final yellow = iy == 0;
  if (faces == 3) {
    return white ? PieceGroup.whiteCorners : PieceGroup.yellowCorners;
  }
  if (white) return PieceGroup.whiteEdges;
  if (yellow) return PieceGroup.yellowEdges;
  return PieceGroup.middleEdges;
}

/// Everything the intro card needs to show a lesson's goal: the cube before
/// and after, the moves morphing one into the other, and how to color each
/// piece.
@immutable
class GoalPreviewData {
  const GoalPreviewData({
    required this.start,
    required this.goal,
    required this.moves,
    required this.focus,
    required this.muted,
  });

  /// Builds the preview of [lesson]: its demonstrations played back to back
  /// lead from the start state to the goal.
  factory GoalPreviewData.of(Lesson lesson) {
    final size = lesson.size;
    // Demonstrations sharing the first demo's hold, e.g. yellow on top.
    final first = lesson.steps.firstWhere(
      (s) => s.demo.isNotEmpty,
      orElse: () => lesson.steps.first,
    );
    final moves = [
      for (final step in lesson.steps)
        if (step.setup == first.setup) ...step.demoMoves(size),
    ];
    var goal = CubeState.solved(size);
    if (first.setup.isNotEmpty) {
      goal = goal.applyAll(MoveNotation.parseSequence(first.setup, size));
    }
    final start = goal.applyAll(moves.reversed.map((m) => m.inverse));

    final spec = lessonGoal(lesson.id);
    final focus = <int>{};
    final muted = <int>{};
    if (spec.target.isNotEmpty) {
      for (final cubie in goal.cubies) {
        final group = pieceGroupOf(cubie.id, size);
        if (group == null) continue;
        if (spec.target.contains(group)) {
          focus.add(cubie.id);
        } else if (!spec.done.contains(group)) {
          muted.add(cubie.id);
        }
      }
    }
    return GoalPreviewData(
      start: start,
      goal: goal,
      moves: List.unmodifiable(moves),
      focus: Set.unmodifiable(focus),
      muted: Set.unmodifiable(muted),
    );
  }

  final CubeState start;
  final CubeState goal;
  final List<CubeMove> moves;

  /// Target pieces, drawn at full brightness.
  final Set<int> focus;

  /// Pieces that do not matter yet, drawn gray.
  final Set<int> muted;

  /// Whether start and goal look different (a morph is worth showing).
  bool get morphs => start.toFacelets() != goal.toFacelets();
}
