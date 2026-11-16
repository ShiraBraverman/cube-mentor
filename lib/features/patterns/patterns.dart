import 'package:flutter/foundation.dart';

import '../../core/cube/cube_move.dart';
import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';

/// A classic "pretty pattern": move sequences that turn a solved cube into
/// it, per cube size.
@immutable
class CubePattern {
  const CubePattern(this.id, this.moves);

  final String id;

  /// Move sequence for each supported cube size.
  final Map<int, String> moves;

  bool supports(int size) => moves.containsKey(size);

  List<CubeMove> movesFor(int size) =>
      MoveNotation.parseSequence(moves[size]!, size);

  /// The pattern on a cube of [size].
  CubeState stateFor(int size) =>
      CubeState.solved(size).applyAll(movesFor(size));
}

const String _cubeInCube = "F L F U' R U F2 L2 U' L' B D' B' L2 U";
const String _cubeInCubeWide =
    "Fw Lw Fw Uw' Rw Uw Fw2 Lw2 Uw' Lw' Bw Dw' Bw' Lw2 Uw";
const String _cubeInCubeWide3 =
    "3Fw 3Lw 3Fw 3Uw' 3Rw 3Uw 3Fw2 3Lw2 3Uw' 3Lw' 3Bw 3Dw' 3Bw' 3Lw2 3Uw";
const String _superflip = "U R2 F B R B2 R U2 L B2 R U' D' R2 F R' L B2 U2 F2";
const String _dots = "U D' R L' F B' U D'";
const String _cross = "R2 L' D F2 R' D' R' L U' D R D B2 R' U D2";

/// The pattern library, checked by tests against each pattern's shape.
const List<CubePattern> kPatterns = [
  CubePattern('checkerboard', {3: 'M2 E2 S2', 5: '2R2 2L2 2U2 2D2 2F2 2B2'}),
  CubePattern('cubeInCube', {
    2: _cubeInCube,
    3: _cubeInCube,
    4: _cubeInCubeWide,
    5: '$_cubeInCube $_cubeInCubeWide',
    6: '$_cubeInCube $_cubeInCubeWide $_cubeInCubeWide3',
  }),
  CubePattern('superflip', {
    3: _superflip,
    4: _superflip,
    5: _superflip,
    6: _superflip,
  }),
  CubePattern('dots', {3: _dots, 4: _dots, 5: _dots, 6: _dots}),
  CubePattern('cross', {3: _cross, 4: _cross, 5: _cross, 6: _cross}),
  CubePattern('python', {3: "F2 R' B' U R' L F' L F' B D' R B L2"}),
];

/// Localized name of a pattern.
String patternName(AppLocalizations l10n, String id) => switch (id) {
  'checkerboard' => l10n.patternCheckerboard,
  'cubeInCube' => l10n.patternCubeInCube,
  'superflip' => l10n.patternSuperflip,
  'dots' => l10n.patternDots,
  'cross' => l10n.patternCross,
  'python' => l10n.patternPython,
  _ => id,
};
