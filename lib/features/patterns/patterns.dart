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

/// Patterns of each size page that are always open (the first one, the
/// most striking), so every size can be tried right away.
const int kFreePatterns = 1;

/// Whether the pattern at [index] of the [size] page needs its own 24-hour
/// rewarded unlock (every size, the 2x2 and 3x3 included).
bool patternNeedsUnlock(int size, int index) => index >= kFreePatterns;

const String _cubeInCube = "F L F U' R U F2 L2 U' L' B D' B' L2 U";
const String _cubeInCubeWide =
    "Fw Lw Fw Uw' Rw Uw Fw2 Lw2 Uw' Lw' Bw Dw' Bw' Lw2 Uw";
const String _cubeInCubeWide3 =
    "3Fw 3Lw 3Fw 3Uw' 3Rw 3Uw 3Fw2 3Lw2 3Uw' 3Lw' 3Bw 3Dw' 3Bw' 3Lw2 3Uw";
const String _superflip = "U R2 F B R B2 R U2 L B2 R U' D' R2 F R' L B2 U2 F2";
const String _dots = "U D' R L' F B' U D'";
const String _dotsWide = "Uw Dw' Rw Lw' Fw Bw' Uw Dw'";
const String _cross = "R2 L' D F2 R' D' R' L U' D R D B2 R' U D2";
const String _cubeInCubeInCube =
    "U' L' U' F' R2 B' R F U B2 U B' L U' F U R F'";
const String _kilt = "U' R2 L2 F2 B2 U' R L F B' U F2 D2 R2 L2 F2 U2 F2 U' F2";
const String _twinPeaks = "F2 R2 D R2 U D F2 D' R' D' F L2 F' D R U'";
const String _spiral = "L' B' D U R U' R' D2 R2 D L D' L' R' F U";
const String _tetris = "L R F B U' D' L' R'";
const String _anaconda = "L U B' U' R L' B R' F B' D R D' F'";
const String _zigzag = "R L F B R L F B R L F B";
const String _fourSpots = "F2 B2 U D' R2 L2 U D'";
const String _stripes = "F U F R L2 B D' R D2 L D' B R2 L F U F";

/// Face turns only: the same look scales from the 3x3 to every big cube.
Map<int, String> _allSizes(String moves) => {
  3: moves,
  4: moves,
  5: moves,
  6: moves,
};

/// The pattern library, checked by tests against each pattern's shape.
final List<CubePattern> kPatterns = [
  const CubePattern('checkerboard', {
    3: 'M2 E2 S2',
    5: '2R2 2L2 2U2 2D2 2F2 2B2',
  }),
  // Concentric rings: two nested center blocks, each from another face.
  const CubePattern('bullsEye', {
    5: '$_dots $_dotsWide',
    6: '$_dots $_dotsWide',
  }),
  // A frame of the opposite color around the center block.
  const CubePattern('framedCenter', {4: '2R2 2L2 2U2 2D2 2F2 2B2'}),
  const CubePattern('blockCheckerboard', {6: '3R2 3L2 3U2 3D2 3F2 3B2'}),
  const CubePattern('cubeInCube', {
    2: _cubeInCube,
    3: _cubeInCube,
    4: _cubeInCubeWide,
    5: '$_cubeInCube $_cubeInCubeWide',
    6: '$_cubeInCube $_cubeInCubeWide $_cubeInCubeWide3',
  }),
  CubePattern('cubeInCubeInCube', _allSizes(_cubeInCubeInCube)),
  const CubePattern('unionJack', {3: "U F B' L2 U2 L2 F' B U2 L2 U"}),
  CubePattern('kilt', _allSizes(_kilt)),
  const CubePattern('sixTs', {3: "F2 R2 U2 F' B D2 L2 F B"}),
  CubePattern('twinPeaks', _allSizes(_twinPeaks)),
  CubePattern('spiral', _allSizes(_spiral)),
  CubePattern('tetris', _allSizes(_tetris)),
  // A small spot in the middle of every face.
  const CubePattern('spots', {5: _dotsWide, 6: _dotsWide}),
  const CubePattern('stripes', {
    2: 'R2 F2 R2',
    3: _stripes,
    4: '2R2 L2 2U2 D2 2F2 B2',
    5: _stripes,
    6: '2R2 4R2 L2 2U2 4U2 D2 2F2 4F2 B2',
  }),
  CubePattern('anaconda', _allSizes(_anaconda)),
  CubePattern('zigzag', _allSizes(_zigzag)),
  CubePattern('fourSpots', _allSizes(_fourSpots)),
  CubePattern('dots', _allSizes(_dots)),
  CubePattern('cross', _allSizes(_cross)),
  CubePattern('superflip', _allSizes(_superflip)),
  const CubePattern('python', {3: "F2 R' B' U R' L F' L F' B D' R B L2"}),
  const CubePattern('greenMamba', {3: "R D R F R' F' B D R' U' B' U D2"}),
  const CubePattern('plusMinus', {3: 'U2 R2 L2 U2 R2 L2'}),
];

/// Pattern order of each size page: the most visually striking first (the
/// first one is open without an ad).
const Map<int, List<String>> kPatternOrder = {
  2: ['cubeInCube', 'stripes'],
  3: [
    'checkerboard',
    'cubeInCubeInCube',
    'unionJack',
    'kilt',
    'sixTs',
    'cubeInCube',
    'twinPeaks',
    'spiral',
    'tetris',
    'anaconda',
    'zigzag',
    'stripes',
    'fourSpots',
    'dots',
    'cross',
    'superflip',
    'python',
    'greenMamba',
    'plusMinus',
  ],
  4: [
    'framedCenter',
    'cubeInCube',
    'kilt',
    'stripes',
    'twinPeaks',
    'tetris',
    'cubeInCubeInCube',
    'spiral',
    'anaconda',
    'fourSpots',
    'zigzag',
    'dots',
    'cross',
    'superflip',
  ],
  5: [
    'bullsEye',
    'checkerboard',
    'cubeInCube',
    'kilt',
    'spots',
    'twinPeaks',
    'tetris',
    'spiral',
    'cubeInCubeInCube',
    'fourSpots',
    'stripes',
    'anaconda',
    'zigzag',
    'dots',
    'cross',
    'superflip',
  ],
  6: [
    'bullsEye',
    'blockCheckerboard',
    'cubeInCube',
    'kilt',
    'stripes',
    'twinPeaks',
    'tetris',
    'spiral',
    'spots',
    'cubeInCubeInCube',
    'fourSpots',
    'anaconda',
    'zigzag',
    'dots',
    'cross',
    'superflip',
  ],
};

/// The patterns of the [size] page, in display order.
List<CubePattern> patternsFor(int size) => [
  for (final id in kPatternOrder[size] ?? const <String>[])
    kPatterns.firstWhere((p) => p.id == id),
];

/// Localized name of a pattern.
String patternName(AppLocalizations l10n, String id) => switch (id) {
  'checkerboard' => l10n.patternCheckerboard,
  'cubeInCube' => l10n.patternCubeInCube,
  'superflip' => l10n.patternSuperflip,
  'dots' => l10n.patternDots,
  'cross' => l10n.patternCross,
  'python' => l10n.patternPython,
  'bullsEye' => l10n.patternBullsEye,
  'framedCenter' => l10n.patternFramedCenter,
  'blockCheckerboard' => l10n.patternBlockCheckerboard,
  'cubeInCubeInCube' => l10n.patternCubeInCubeInCube,
  'unionJack' => l10n.patternUnionJack,
  'kilt' => l10n.patternKilt,
  'sixTs' => l10n.patternSixTs,
  'twinPeaks' => l10n.patternTwinPeaks,
  'spiral' => l10n.patternSpiral,
  'tetris' => l10n.patternTetris,
  'spots' => l10n.patternSpots,
  'stripes' => l10n.patternStripes,
  'anaconda' => l10n.patternAnaconda,
  'zigzag' => l10n.patternZigzag,
  'fourSpots' => l10n.patternFourSpots,
  'greenMamba' => l10n.patternGreenMamba,
  'plusMinus' => l10n.patternPlusMinus,
  _ => id,
};
