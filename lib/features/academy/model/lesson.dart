import 'package:flutter/foundation.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';

/// Groups of lessons shown together in the Academy.
enum LessonTrack { beginner, cfop, twoByTwo, bigCubes }

/// One part of a lesson: a short explanation paired with a live 3D
/// demonstration.
///
/// The cube starts at `solved + setup + inverse(demo)`, so playing [demo]
/// always ends on a solved (or merely re-oriented) cube: the demonstration
/// shows exactly what the algorithm fixes.
@immutable
class LessonStep {
  const LessonStep(
    this.id, {
    this.setup = '',
    this.demo = '',
    required this.top,
    required this.front,
  });

  /// Text key (see `lessonStepTitle` / `lessonStepBody`).
  final String id;

  /// Moves applied instantly first, e.g. `z2` to hold yellow on top.
  final String setup;

  /// The moves demonstrated on the cube.
  final String demo;

  /// Center colors the learner should hold on top and facing them.
  final StickerColor top;
  final StickerColor front;

  List<CubeMove> demoMoves(int size) =>
      demo.isEmpty ? const [] : MoveNotation.parseSequence(demo, size);

  /// The cube before the demonstration.
  CubeState startCube(int size) {
    var cube = CubeState.solved(size);
    if (setup.isNotEmpty) {
      cube = cube.applyAll(MoveNotation.parseSequence(setup, size));
    }
    return cube.applyAll(demoMoves(size).reversed.map((m) => m.inverse));
  }
}

@immutable
class Lesson {
  const Lesson({
    required this.id,
    required this.track,
    required this.size,
    required this.steps,
    this.advanced = false,
  });

  final String id;
  final LessonTrack track;

  /// Cube size used for the demonstrations.
  final int size;
  final List<LessonStep> steps;

  /// Advanced lessons can later be unlocked with a rewarded ad
  /// (see `RewardGate`).
  final bool advanced;
}
