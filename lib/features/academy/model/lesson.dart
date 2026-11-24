import 'package:flutter/foundation.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import 'walkthrough.dart';

/// Groups of lessons shown together in the Academy.
enum LessonTrack { beginner, cfop, twoByTwo, bigCubes, fiveByFive, sixBySix }

/// One part of a lesson: a short explanation paired with a live 3D
/// demonstration. Parts without a demonstration explain the concept
/// (stage 1); the others are the guided examples (stage 2).
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
    this.cue,
    this.extra = false,
  });

  /// Text key (see `lessonStepTitle` / `lessonStepBody`).
  final String id;

  /// The color-specific callout of the demonstration (which piece goes
  /// where), read from the cube.
  final WalkCue? cue;

  /// A second example of the step before it (same text, another case):
  /// left out of the goal preview.
  final bool extra;

  /// Whether this part is a guided example rather than a concept.
  bool get isExample => demo.isNotEmpty;

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
    this.crown = 0,
    this.subStep = 0,
    this.practice = const [],
  });

  final String id;
  final LessonTrack track;

  /// Cube size used for the demonstrations.
  final int size;
  final List<LessonStep> steps;

  /// Advanced lessons can later be unlocked with a rewarded ad
  /// (see `RewardGate`).
  final bool advanced;

  /// Beginner's-method stage this lesson teaches, matching the solver's
  /// tags: crown 1..3 and sub-step (e.g. 3.3). Zero for other lessons.
  final int crown;
  final int subStep;

  /// Stage 3: realistic walkthroughs of the whole step, with bonus cases.
  final List<Walkthrough> practice;

  /// Stage 1 parts (explanations without a demonstration).
  List<LessonStep> get concepts => [
    for (final step in steps)
      if (!step.isExample) step,
  ];

  /// Stage 2 parts (guided examples).
  List<LessonStep> get examples => [
    for (final step in steps)
      if (step.isExample) step,
  ];

  /// `1.1` .. `3.4`, or empty.
  String get subStepLabel => crown > 0 ? '$crown.$subStep' : '';
}
