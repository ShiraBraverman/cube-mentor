import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../cube/cube_state.dart';

/// Solving strategies offered by the native core.
enum SolveMethod {
  /// Optimal 2x2 search, the Kociemba two-phase 3x3 algorithm, or the
  /// reduction method (4x4 to 6x6) finished with Kociemba.
  fast(1),

  /// Pedagogical layer-by-layer (beginner's method) 3x3 solver; on big cubes
  /// the reduction method finished layer by layer.
  layerByLayer(2);

  const SolveMethod(this.code);

  /// Method id of the C API (`CM_METHOD_*`).
  final int code;
}

/// One move of a solution with the pedagogical metadata used by the
/// playback banner, the Academy and a future AI Coach.
@immutable
class SolveStep {
  const SolveStep({
    required this.cubeState,
    required this.phaseName,
    required this.moveNotation,
    required this.explanationKey,
    this.highlightedCubies = const [],
    this.pieceColors = '',
    this.crown = 0,
    this.subStep = 0,
  });

  factory SolveStep.fromJson(Map<String, dynamic> json) => SolveStep(
    cubeState: json['state'] as String,
    phaseName: json['phase'] as String,
    moveNotation: json['move'] as String,
    explanationKey: json['explanation'] as String,
    pieceColors: (json['piece'] as String?) ?? '',
    crown: (json['crown'] as int?) ?? 0,
    subStep: (json['subStep'] as int?) ?? 0,
    highlightedCubies: [
      for (final p in (json['highlight'] as List<dynamic>? ?? const []))
        _vec(p as List<dynamic>),
    ],
  );

  /// Facelets (U R F D L B order) before [moveNotation] is applied.
  final String cubeState;

  /// Phase key, e.g. `lblCross` or `kociembaPhase1`.
  final String phaseName;

  /// The move of this step, e.g. `R'`.
  final String moveNotation;

  /// Explanation key of the sub-goal, e.g. `lblCrossEdge`.
  final String explanationKey;

  /// Positions (doubled coordinates) of the pieces to highlight before the
  /// move is applied.
  final List<IVec3> highlightedCubies;

  /// Color letters of the piece the explanation talks about (may be empty).
  final String pieceColors;

  /// Beginner's-method stage: crown 1..3 (first layer, middle layer, last
  /// layer) and the sub-step within it, so `(3, 3)` is "3.3 Position the
  /// yellow corners". Zero for steps of other methods.
  final int crown;
  final int subStep;

  /// Whether this step belongs to the 3-crown beginner's method.
  bool get hasCrown => crown > 0;

  /// Sub-step label such as `2.1`, or empty.
  String get subStepLabel => hasCrown ? '$crown.$subStep' : '';

  Map<String, Object> toJson() => {
    'state': cubeState,
    'phase': phaseName,
    'move': moveNotation,
    'explanation': explanationKey,
    'piece': pieceColors,
    if (hasCrown) ...{'crown': crown, 'subStep': subStep},
    'highlight': [
      for (final (x, y, z) in highlightedCubies) [x, y, z],
    ],
  };

  static IVec3 _vec(List<dynamic> v) => (v[0] as int, v[1] as int, v[2] as int);
}

/// A complete solution.
@immutable
class SolvePlan {
  const SolvePlan({required this.method, required this.steps, this.millis = 0});

  /// Parses the JSON produced by `cm_solve`; throws [SolveException] for
  /// error results.
  factory SolvePlan.fromJson(String source) {
    final json = jsonDecode(source) as Map<String, dynamic>;
    if (json['ok'] != true) {
      throw SolveException((json['error'] as String?) ?? 'unknown');
    }
    return SolvePlan(
      method: json['method'] as String,
      millis: (json['millis'] as num?)?.toDouble() ?? 0,
      steps: List.unmodifiable([
        for (final step in json['steps'] as List<dynamic>)
          SolveStep.fromJson(step as Map<String, dynamic>),
      ]),
    );
  }

  /// `optimal2x2`, `kociemba`, `lbl`, `reduction` or `reductionLbl`.
  final String method;
  final List<SolveStep> steps;

  /// Native solve time.
  final double millis;
}

/// A cube that cannot be solved (invalid state) or an unsupported request.
class SolveException implements Exception {
  const SolveException(this.code);

  /// Error key: `unsupported`, `badColors`, `badPieces`, `twist`, `flip`,
  /// `parity`, `unavailable`, `internal`...
  final String code;

  @override
  String toString() => 'SolveException($code)';
}
