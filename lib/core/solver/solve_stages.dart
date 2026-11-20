import 'package:flutter/foundation.dart';

import 'solve_step.dart';

/// A high-level part of a solution the learner can relate to ("Build center
/// blocks", "1.1 White cross"), used instead of raw move counts.
enum StageKind {
  /// 3x3 beginner's method: one of the seven sub-steps (see [SolveStage]).
  subStep,

  /// Big cubes: build the center blocks.
  centers,

  /// Big cubes: pair the edge pieces (including the slice that fixes an
  /// odd edge orbit).
  edges,

  /// Even big cubes: OLL / PLL parity of the reduced cube.
  parity,

  /// Big cubes solved as a 3x3 with the beginner's method: one crown.
  crown,

  /// Fast 3x3: orient the pieces (Kociemba phase 1).
  orient,

  /// Fast 3x3: finish the cube (Kociemba phase 2).
  finish,

  /// Fast big cube: the reduced cube solved as a 3x3.
  asThree,

  /// 2x2 fast: the whole (short, optimal) solution.
  twoByTwo,

  /// 2x2 guided: the bottom layer.
  twoFirstLayer,

  /// 2x2 guided: the top face one color.
  twoTopColor,

  /// 2x2 guided: the remaining corners.
  twoFinish,
}

/// One stage of a solution and where it sits in the plan.
@immutable
class SolveStage {
  const SolveStage({
    required this.kind,
    required this.number,
    required this.total,
    required this.first,
    required this.last,
    this.crown = 0,
    this.subStep = 0,
  });

  final StageKind kind;

  /// 1-based position among the stages of this kind of solve, and how many
  /// there are (stages a solution happens to skip still count).
  final int number;
  final int total;

  /// Step indexes (inclusive) the stage covers in the plan.
  final int first;
  final int last;

  /// Crown 1..3 for [StageKind.crown] and [StageKind.subStep].
  final int crown;

  /// Sub-step 1..4 for [StageKind.subStep].
  final int subStep;

  /// Fraction of this stage done when [index] is the next step to play.
  double progressAt(int index) {
    final length = last - first + 1;
    return ((index - first) / length).clamp(0.0, 1.0);
  }
}

/// The stages of a solution, step by step. Empty for scripted sequences
/// (patterns, lessons, scramble guides): they have no stages.
@immutable
class StagePlan {
  const StagePlan._(this._ofStep, this.stages);

  static const StagePlan none = StagePlan._([], []);

  /// Stage of every step (null for a step outside any stage).
  final List<SolveStage?> _ofStep;

  /// Stages present in the solution, in order.
  final List<SolveStage> stages;

  bool get isEmpty => stages.isEmpty;

  static final Expando<Map<int, StagePlan>> _cache = Expando('stagePlan');

  /// [StagePlan.of], remembered per (unmodifiable) step list and cube size.
  static StagePlan forSteps(List<SolveStep> steps, int size) {
    if (steps.isEmpty) return none;
    final bySize = _cache[steps] ??= {};
    return bySize[size] ??= StagePlan.of(steps, size);
  }

  /// Stage of step [index]; past the end, the last stage.
  SolveStage? stageAt(int index) {
    if (_ofStep.isEmpty) return null;
    return _ofStep[index.clamp(0, _ofStep.length - 1)];
  }

  /// Groups [steps] of a solution for a cube of [size].
  factory StagePlan.of(List<SolveStep> steps, int size) {
    if (steps.isEmpty) return none;
    final keys = [for (final s in steps) _key(s, size)];
    if (keys.any((k) => k == null)) return none;
    final order = _orderFor(keys.cast<String>(), size);

    final stages = <String, SolveStage>{};
    for (var i = 0; i < steps.length; i++) {
      final key = keys[i]!;
      final known = stages[key];
      if (known != null) {
        stages[key] = SolveStage(
          kind: known.kind,
          number: known.number,
          total: known.total,
          first: known.first,
          last: i,
          crown: known.crown,
          subStep: known.subStep,
        );
        continue;
      }
      final step = steps[i];
      stages[key] = SolveStage(
        kind: _kindOf(key),
        number: order.indexOf(key) + 1,
        total: order.length,
        first: i,
        last: i,
        crown: step.crown,
        subStep: size == 3 ? step.subStep : 0,
      );
    }
    return StagePlan._(
      List.unmodifiable([for (final k in keys) stages[k]]),
      List.unmodifiable(stages.values),
    );
  }

  /// Stage key of a step, or null for steps that are not solver output.
  static String? _key(SolveStep s, int size) {
    if (s.crown > 0) {
      return size == 3 ? 'sub${s.crown}.${s.subStep}' : 'crown${s.crown}';
    }
    return switch (s.phaseName) {
      'reductionCenters' => 'centers',
      'reductionEdges' || 'reductionEdgeParity' => 'edges',
      'reductionOllParity' || 'reductionPllParity' => 'parity',
      'kociembaPhase1' => size == 3 ? 'orient' : 'asThree',
      'kociembaPhase2' => size == 3 ? 'finish' : 'asThree',
      'optimal2x2' => 'twoByTwo',
      'twoFirstLayer' || 'twoTopColor' || 'twoFinish' => s.phaseName,
      _ => null,
    };
  }

  /// Every stage this kind of solve has, in order, so "Stage 3 of 6" means
  /// the same thing on every solve of a size.
  static List<String> _orderFor(List<String> keys, int size) {
    if (size == 2) {
      return keys.contains('twoByTwo')
          ? const ['twoByTwo']
          : const ['twoFirstLayer', 'twoTopColor', 'twoFinish'];
    }
    final guided = keys.any(
      (k) => k.startsWith('sub') || k.startsWith('crown'),
    );
    if (size == 3) {
      return guided
          ? const [
              'sub1.1',
              'sub1.2',
              'sub2.1',
              'sub3.1',
              'sub3.2',
              'sub3.3',
              'sub3.4',
            ]
          : const ['orient', 'finish'];
    }
    return [
      'centers',
      'edges',
      // Odd cubes have fixed centers: never OLL / PLL parity.
      if (size.isEven) 'parity',
      if (guided) ...['crown1', 'crown2', 'crown3'] else 'asThree',
    ];
  }

  static StageKind _kindOf(String key) => switch (key) {
    'centers' => StageKind.centers,
    'edges' => StageKind.edges,
    'parity' => StageKind.parity,
    'orient' => StageKind.orient,
    'finish' => StageKind.finish,
    'asThree' => StageKind.asThree,
    'twoByTwo' => StageKind.twoByTwo,
    'twoFirstLayer' => StageKind.twoFirstLayer,
    'twoTopColor' => StageKind.twoTopColor,
    'twoFinish' => StageKind.twoFinish,
    _ when key.startsWith('crown') => StageKind.crown,
    _ => StageKind.subStep,
  };
}
