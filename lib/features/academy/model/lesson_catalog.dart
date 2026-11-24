// Lesson catalogue (texts live in the ARB files so every lesson is fully
// localized). The beginner track follows the 3-crown / 7-sub-step
// syllabus, one lesson per sub-step, matching the guided solver.
//
// Every lesson has four stages: the concept (goal card and explanations),
// guided examples with color-specific callouts, realistic walkthroughs of
// the whole step (with bonus cases) and the choice of what comes next.
import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/crown_words.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import 'lesson.dart';
import 'walkthrough.dart';

// Algorithms shared by several lessons.
const _sexy = "R U R' U'";
const _sexy3 = "$_sexy $_sexy $_sexy";
const _middleRight = "U R U' R' U' F' U F";
const _middleLeft = "U' L' U L U F U' F'";
const _yellowCross = "F R U R' U' F'";
const _sune = "R U R' U R U2 R'";
const _edgeSwap = "R U R' U R U2 R' U";
const _cornerCycle = "U R U' L' U R' U' L";
const _twist2 = "R' D' R D R' D' R D";
const _twist4 = "$_twist2 $_twist2";
const _tPerm = "R U R' U' R' F R2 U' R' U' R U R' F'";
const _uPerm = "R U' R U R U R U' R' U' R2";
const _diagonalSwap = "F R U' R' U' R U R' F' R U R' U' R' F R F'";
const _centerCycle = "2R U' 2L' U 2R' U' 2L U";
const _edgePair = "Uw' R U R' F R' F' R Uw";
const _edgeLast = "Dw R F' U R' F Dw'";

// Scrambles of everything a step has not reached yet. Each keeps the
// earlier steps solved: the cross (conjugated top turns), the first layer
// (middle-layer inserts), the first two layers (last-layer algorithms),
// the yellow cross (edge-preserving algorithms) or the centers (outer
// turns).
const _keepCross1 = "R U R' F' U2 F L U' L' B U2 B' R' U' R";
const _keepCross2 = "L U L' B U' B' R U2 R' F' U F";
const _keepFirstLayer =
    "U R U' R' U' F' U F U2 L' U L U F U' F' U' B U' B' U' R' U R";
const _keepTwoLayers =
    "$_sune U2 R U R' U' R' F R2 U' R' U' R U R' F' U $_yellowCross U'";
const _keepYellowCross = "$_sune U2 $_tPerm U R U2 R' U' R U' R' U";
const _keepYellowEdges = "$_cornerCycle $_twist2 U $_twist4 U'";
const _keepOll = "$_tPerm U2 $_uPerm";
const _keepCenters = "R U F' L2 D B' R2 U' F2 L' D2 B";

const _y = WalkCue.turnCube;

const _yellow = StickerColor.yellow;
const _white = StickerColor.white;
const _green = StickerColor.green;

/// The first layer's corners, one slot after another (a `y` turn brings
/// the next slot to the front right).
const List<WalkSegment> _cornerSlots = [
  WalkSegment("U R U' R'", WalkCue.cornerTop),
  WalkSegment('y', _y),
  WalkSegment("U2 $_sexy", WalkCue.cornerTop),
  WalkSegment('y', _y),
  WalkSegment(_sexy3, WalkCue.cornerTop),
  WalkSegment('y', _y),
  WalkSegment("U' $_sexy", WalkCue.cornerTop),
];

/// The same with a corner twisted in its own slot (bonus case).
const List<WalkSegment> _cornerSlotsTwisted = [
  WalkSegment("U' $_sexy", WalkCue.cornerTop),
  WalkSegment('y', _y),
  WalkSegment("$_sexy $_sexy", WalkCue.cornerTwisted, bonus: true),
  WalkSegment('y', _y),
  WalkSegment("U2 $_sexy3", WalkCue.cornerTop),
  WalkSegment('y', _y),
  WalkSegment("U R U' R'", WalkCue.cornerTop),
];

LessonStep _example(
  String id,
  String demo,
  WalkCue cue, {
  String setup = "z2",
  bool extra = false,
}) => LessonStep(
  id,
  setup: setup,
  demo: demo,
  top: setup == "z2" ? _yellow : _white,
  front: _green,
  cue: cue,
  extra: extra,
);

/// Every lesson, in teaching order.
final List<Lesson> kLessons = List.unmodifiable([
  Lesson(
    id: 'basics',
    track: LessonTrack.beginner,
    size: 3,
    steps: [
      const LessonStep('basicsPieces', top: _white, front: _green),
      _example('basicsFaces', "R R' U U' F F'", WalkCue.faceTurn, setup: ''),
      _example('basicsPrime', "R' U2", WalkCue.faceTurn, setup: ''),
    ],
    practice: const [
      Walkthrough(
        segments: [
          WalkSegment('R', WalkCue.faceTurn),
          WalkSegment('U', WalkCue.faceTurn),
          WalkSegment('F', WalkCue.faceTurn),
          WalkSegment("L'", WalkCue.faceTurn),
        ],
      ),
      Walkthrough(
        segments: [
          WalkSegment(_sexy, WalkCue.trigger),
          WalkSegment(_sexy, WalkCue.trigger),
          WalkSegment(_sexy, WalkCue.trigger),
          WalkSegment(_sexy, WalkCue.trigger),
          WalkSegment(_sexy, WalkCue.trigger),
          WalkSegment(_sexy, WalkCue.triggerBack, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'cross',
    track: LessonTrack.beginner,
    size: 3,
    crown: 1,
    subStep: 1,
    steps: [
      const LessonStep('crossGoal', setup: "z2", top: _yellow, front: _green),
      _example('crossTop', "U F2", WalkCue.crossTop),
      _example('crossMiddle', "R U R' F2", WalkCue.crossMiddle),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepCross1",
        segments: [
          WalkSegment("U F2", WalkCue.crossTop),
          WalkSegment("F U' F' R2", WalkCue.crossMiddle),
          WalkSegment("L2", WalkCue.crossTop),
          WalkSegment("U' B2", WalkCue.crossTop),
        ],
      ),
      Walkthrough(
        setup: "z2 $_keepCross2",
        segments: [
          WalkSegment("R U R' U2 B2", WalkCue.crossMiddle),
          WalkSegment("U2 R2", WalkCue.crossTop),
          WalkSegment("U L2", WalkCue.crossTop),
          WalkSegment("F' R U R' F2", WalkCue.crossFlipped, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'corners',
    track: LessonTrack.beginner,
    size: 3,
    crown: 1,
    subStep: 2,
    steps: [
      _example('cornersInsert', "U R U' R'", WalkCue.cornerTop),
      _example('cornersRepeat', _sexy3, WalkCue.cornerTop),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepFirstLayer $_keepTwoLayers y'",
        segments: _cornerSlots,
      ),
      Walkthrough(
        setup: "z2 $_keepTwoLayers $_keepFirstLayer y'",
        segments: _cornerSlotsTwisted,
      ),
    ],
  ),
  Lesson(
    id: 'middle',
    track: LessonTrack.beginner,
    size: 3,
    crown: 2,
    subStep: 1,
    steps: [
      _example('middleRight', _middleRight, WalkCue.middleRight),
      _example('middleLeft', _middleLeft, WalkCue.middleLeft),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepTwoLayers y2",
        segments: [
          WalkSegment(_middleRight, WalkCue.middleRight),
          WalkSegment("L' U L U F U' F'", WalkCue.middleLeft),
          WalkSegment('y2', _y),
          WalkSegment("U' R U' R' U' F' U F", WalkCue.middleRight),
          WalkSegment(_middleLeft, WalkCue.middleLeft),
        ],
      ),
      Walkthrough(
        setup: "z2 $_keepTwoLayers U y2",
        segments: [
          WalkSegment("R U' R' U' F' U F", WalkCue.middleRight),
          WalkSegment(
            "L' U L U F U' F' U L' U L U F U' F'",
            WalkCue.middleFlipped,
            bonus: true,
          ),
          WalkSegment('y2', _y),
          WalkSegment(_middleRight, WalkCue.middleRight),
          WalkSegment("L' U L U F U' F'", WalkCue.middleLeft),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'yellowCross',
    track: LessonTrack.beginner,
    size: 3,
    crown: 3,
    subStep: 1,
    steps: [
      _example('yellowCross', _yellowCross, WalkCue.yellowLine),
      _example(
        'yellowCross',
        "U $_yellowCross",
        WalkCue.yellowLine,
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepYellowCross",
        segments: [
          WalkSegment("U $_yellowCross", WalkCue.yellowL),
          WalkSegment(_yellowCross, WalkCue.yellowLine),
        ],
      ),
      Walkthrough(
        setup: "z2 $_keepYellowCross U",
        segments: [
          WalkSegment(_yellowCross, WalkCue.yellowDot, bonus: true),
          WalkSegment("U2 $_yellowCross", WalkCue.yellowL),
          WalkSegment(_yellowCross, WalkCue.yellowLine),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'yellowEdges',
    track: LessonTrack.beginner,
    size: 3,
    crown: 3,
    subStep: 2,
    steps: [
      _example('yellowEdges', _edgeSwap, WalkCue.edgesSwap),
      _example('yellowEdges', "U2 $_edgeSwap", WalkCue.edgesSwap, extra: true),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepYellowEdges",
        segments: [
          WalkSegment("U'", WalkCue.edgesMatch),
          WalkSegment(_edgeSwap, WalkCue.edgesSwap),
        ],
      ),
      Walkthrough(
        setup: "z2 $_keepYellowEdges",
        segments: [
          WalkSegment(_edgeSwap, WalkCue.edgesOpposite, bonus: true),
          WalkSegment('U2', WalkCue.edgesMatch),
          WalkSegment(_edgeSwap, WalkCue.edgesSwap),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'yellowCorners',
    track: LessonTrack.beginner,
    size: 3,
    crown: 3,
    subStep: 3,
    steps: [
      _example('placeCorners', _cornerCycle, WalkCue.cornersCycle),
      _example(
        'placeCorners',
        "$_cornerCycle $_cornerCycle",
        WalkCue.cornersCycle,
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_twist2 U $_twist4 U'",
        segments: [
          WalkSegment(_cornerCycle, WalkCue.cornersCycle),
          WalkSegment(_cornerCycle, WalkCue.cornersCycle),
        ],
      ),
      Walkthrough(
        setup: "z2 $_twist2 U2 $_twist4 U2 y",
        segments: [
          WalkSegment(_cornerCycle, WalkCue.cornersNone, bonus: true),
          WalkSegment('y', _y),
          WalkSegment(_cornerCycle, WalkCue.cornersCycle),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'twistCorners',
    track: LessonTrack.beginner,
    size: 3,
    crown: 3,
    subStep: 4,
    steps: [
      _example('twistCorners', "$_twist2 U $_twist4 U'", WalkCue.twistCorner),
      _example(
        'twistCorners',
        "$_twist4 U2 $_twist2 U2",
        WalkCue.twistFour,
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        setup: "z2",
        segments: [
          WalkSegment(_twist2, WalkCue.twistCorner),
          WalkSegment('U', WalkCue.twistNext),
          WalkSegment(_twist2, WalkCue.twistCorner),
          WalkSegment('U', WalkCue.twistNext),
          WalkSegment(_twist2, WalkCue.twistCorner),
          WalkSegment('U2', WalkCue.alignTop),
        ],
      ),
      Walkthrough(
        setup: "z2",
        segments: [
          WalkSegment(_twist4, WalkCue.twistFour, bonus: true),
          WalkSegment('U2', WalkCue.twistNext),
          WalkSegment(_twist2, WalkCue.twistCorner),
          WalkSegment('U2', WalkCue.alignTop),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'cfopIntro',
    track: LessonTrack.cfop,
    size: 3,
    steps: [
      const LessonStep(
        'cfopOverview',
        setup: "z2",
        top: _yellow,
        front: _green,
      ),
      _example('cfopCross', "R2 D F2", WalkCue.crossBottom),
      _example('cfopCross', "L2 D'", WalkCue.crossBottom, extra: true),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepCross2",
        segments: [
          WalkSegment("R2 D", WalkCue.crossBottom),
          WalkSegment("U F2", WalkCue.crossTop),
        ],
      ),
      Walkthrough(
        setup: "z2 $_keepCross1",
        segments: [
          WalkSegment("L2 D'", WalkCue.crossBottom),
          WalkSegment("U' B2", WalkCue.crossTop),
          WalkSegment("F' R U R' F2", WalkCue.crossFlipped, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'f2l',
    track: LessonTrack.cfop,
    size: 3,
    advanced: true,
    steps: [
      _example('f2lRight', "U R U' R'", WalkCue.f2lPair),
      _example('f2lLeft', "y' U' L' U L y", WalkCue.f2lPair),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepTwoLayers y'",
        segments: [
          WalkSegment("U R U' R'", WalkCue.f2lPair),
          WalkSegment('y', _y),
          WalkSegment("U' F' U F", WalkCue.f2lPair),
          WalkSegment('y', _y),
          WalkSegment("R U R'", WalkCue.f2lPair),
          WalkSegment('y', _y),
          WalkSegment("U R U' R'", WalkCue.f2lPair),
        ],
      ),
      Walkthrough(
        setup: "z2 $_keepTwoLayers y'",
        segments: [
          WalkSegment("R U' R' U R U' R'", WalkCue.f2lStuck, bonus: true),
          WalkSegment('y', _y),
          WalkSegment("U' R U R'", WalkCue.f2lPair),
          WalkSegment('y', _y),
          WalkSegment("F' U' F", WalkCue.f2lPair),
          WalkSegment('y', _y),
          WalkSegment("U R U' R'", WalkCue.f2lPair),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'oll',
    track: LessonTrack.cfop,
    size: 3,
    advanced: true,
    steps: [
      _example('ollCross', _yellowCross, WalkCue.yellowLine),
      _example('ollSune', _sune, WalkCue.ollSune),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_keepOll",
        segments: [
          WalkSegment("U $_yellowCross", WalkCue.yellowLine),
          WalkSegment("U $_sune", WalkCue.ollSune),
        ],
      ),
      Walkthrough(
        setup: "z2 $_keepOll U",
        segments: [
          WalkSegment("U2 $_yellowCross", WalkCue.yellowL),
          WalkSegment(_yellowCross, WalkCue.yellowLine),
          WalkSegment(_sune, WalkCue.ollSune),
          WalkSegment("U2 $_sune", WalkCue.ollSuneAgain, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'pll',
    track: LessonTrack.cfop,
    size: 3,
    advanced: true,
    steps: [
      _example('pllT', _tPerm, WalkCue.pllCorners),
      _example('pllU', _uPerm, WalkCue.pllEdges),
    ],
    practice: const [
      Walkthrough(
        setup: "z2",
        segments: [
          WalkSegment('U', WalkCue.turnTop),
          WalkSegment(_tPerm, WalkCue.pllCorners),
          WalkSegment('U2', WalkCue.turnTop),
          WalkSegment(_uPerm, WalkCue.pllEdges),
          WalkSegment('U', WalkCue.alignTop),
        ],
      ),
      Walkthrough(
        setup: "z2",
        segments: [
          WalkSegment(_uPerm, WalkCue.pllNoEdge, bonus: true),
          WalkSegment('U', WalkCue.turnTop),
          WalkSegment(_uPerm, WalkCue.pllEdges),
          WalkSegment("U'", WalkCue.alignTop),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'twoFirst',
    track: LessonTrack.twoByTwo,
    size: 2,
    steps: [
      const LessonStep('twoIntro', top: _white, front: _green),
      _example('twoCorner', "U R U' R'", WalkCue.cornerTop),
      _example('twoCorner', _sexy3, WalkCue.cornerTop, extra: true),
    ],
    practice: const [
      Walkthrough(setup: "z2 $_sune U $_tPerm y'", segments: _cornerSlots),
      Walkthrough(
        setup: "z2 $_sune $_yellowCross y'",
        segments: _cornerSlotsTwisted,
      ),
    ],
  ),
  Lesson(
    id: 'twoOll',
    track: LessonTrack.twoByTwo,
    size: 2,
    steps: [
      _example('twoSune', _sune, WalkCue.ollSune),
      _example('twoSune', "U2 $_sune", WalkCue.ollSune, extra: true),
    ],
    practice: const [
      Walkthrough(
        setup: "z2 $_tPerm",
        segments: [WalkSegment("U $_sune", WalkCue.ollSune)],
      ),
      Walkthrough(
        setup: "z2 $_tPerm",
        segments: [
          WalkSegment(_sune, WalkCue.ollSune),
          WalkSegment("U2 $_sune", WalkCue.ollSuneAgain, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'twoPbl',
    track: LessonTrack.twoByTwo,
    size: 2,
    advanced: true,
    steps: [
      _example('twoAdjacent', _tPerm, WalkCue.twoSwapAdjacent),
      _example('twoDiagonal', _diagonalSwap, WalkCue.twoSwapDiagonal),
    ],
    practice: const [
      Walkthrough(
        setup: "z2",
        segments: [
          WalkSegment('U', WalkCue.turnTop),
          WalkSegment(_tPerm, WalkCue.twoSwapAdjacent),
          WalkSegment('U', WalkCue.alignTop),
        ],
      ),
      Walkthrough(
        setup: "z2",
        segments: [
          WalkSegment(_diagonalSwap, WalkCue.twoSwapDiagonal, bonus: true),
          WalkSegment('U2', WalkCue.alignTop),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'bigIntro',
    track: LessonTrack.bigCubes,
    size: 4,
    steps: [
      const LessonStep('bigPieces', top: _white, front: _green),
      _example('bigSlices', "Rw Rw' 2R 2R'", WalkCue.sliceWide, setup: ''),
      _example(
        'bigSlices',
        "2R 2R' 2U 2U'",
        WalkCue.sliceInner,
        setup: '',
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        segments: [
          WalkSegment('2R', WalkCue.sliceInner),
          WalkSegment('Uw', WalkCue.sliceWide),
          WalkSegment("2R'", WalkCue.sliceInner),
          WalkSegment("Uw'", WalkCue.sliceWide),
        ],
      ),
      Walkthrough(
        segments: [
          WalkSegment('Rw', WalkCue.sliceWide),
          WalkSegment('U', WalkCue.faceTurn),
          WalkSegment("Rw'", WalkCue.sliceWide),
          WalkSegment("2F'", WalkCue.sliceInner),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'bigCenters',
    track: LessonTrack.bigCubes,
    size: 4,
    advanced: true,
    steps: [
      _example('bigCenterCycle', _centerCycle, WalkCue.centerCycle, setup: ''),
      _example(
        'bigCenterCycle',
        "2R U2 2R'",
        WalkCue.centerBar,
        setup: '',
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        setup: "$_keepCenters y",
        segments: [
          WalkSegment(_centerCycle, WalkCue.centerCycle),
          WalkSegment('y', _y),
          WalkSegment(_centerCycle, WalkCue.centerCycle),
        ],
      ),
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment("2R U2 2R'", WalkCue.centerBar, bonus: true),
          WalkSegment(_centerCycle, WalkCue.centerCycle),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'bigEdges',
    track: LessonTrack.bigCubes,
    size: 4,
    advanced: true,
    steps: [
      _example('bigEdgePair', _edgePair, WalkCue.edgePair, setup: ''),
      _example(
        'bigEdgePair',
        _edgeLast,
        WalkCue.edgeLast,
        setup: '',
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        setup: "$_keepCenters y",
        segments: [
          WalkSegment(_edgePair, WalkCue.edgePair),
          WalkSegment('y', _y),
          WalkSegment(_edgePair, WalkCue.edgePair),
        ],
      ),
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment(_edgePair, WalkCue.edgePair),
          WalkSegment(_edgeLast, WalkCue.edgeLast, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'bigParity',
    track: LessonTrack.bigCubes,
    size: 4,
    advanced: true,
    steps: [
      _example('bigOllParity', _bigOllParity, WalkCue.parityOll, setup: ''),
      _example('bigPllParity', _bigPllParity, WalkCue.parityPll, setup: ''),
    ],
    practice: const [
      Walkthrough(
        setup: _keepCenters,
        segments: [WalkSegment(_fiveParity, WalkCue.parityOll)],
      ),
      Walkthrough(
        setup: "$_keepCenters U2",
        segments: [WalkSegment(_bigPllParity, WalkCue.parityPll, bonus: true)],
      ),
    ],
  ),
  Lesson(
    id: 'fiveIntro',
    track: LessonTrack.fiveByFive,
    size: 5,
    steps: [
      const LessonStep('fivePieces', top: _white, front: _green),
      _example(
        'fiveSlices',
        "Rw Rw' 2R 2R' 3R 3R'",
        WalkCue.sliceWide,
        setup: '',
      ),
      _example(
        'fiveSlices',
        "3R 3R' 3U 3U'",
        WalkCue.sliceInner,
        setup: '',
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        segments: [
          WalkSegment('2R', WalkCue.sliceInner),
          WalkSegment('3U', WalkCue.sliceInner),
          WalkSegment("2R'", WalkCue.sliceInner),
          WalkSegment("3U'", WalkCue.sliceInner),
        ],
      ),
      Walkthrough(
        segments: [
          WalkSegment('Rw', WalkCue.sliceWide),
          WalkSegment('U', WalkCue.faceTurn),
          WalkSegment("Rw'", WalkCue.sliceWide),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'fiveCenters',
    track: LessonTrack.fiveByFive,
    size: 5,
    advanced: true,
    steps: [
      _example('fiveCenterBar', "2R U 2R'", WalkCue.centerBar, setup: ''),
      _example('fiveCenterSwap', _centerCycle, WalkCue.centerCycle, setup: ''),
    ],
    practice: const [
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment("2R U 2R'", WalkCue.centerBar),
          WalkSegment(_centerCycle, WalkCue.centerCycle),
        ],
      ),
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment(_centerCycle, WalkCue.centerCycle),
          WalkSegment("2R U2 2R'", WalkCue.centerBar, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'fiveEdges',
    track: LessonTrack.fiveByFive,
    size: 5,
    advanced: true,
    steps: [
      _example('fiveEdgePair', _edgePair, WalkCue.edgePair, setup: ''),
      _example('fiveEdgeLast', _edgeLast, WalkCue.edgeLast, setup: ''),
    ],
    practice: const [
      Walkthrough(
        setup: "$_keepCenters y",
        segments: [
          WalkSegment(_edgePair, WalkCue.edgePair),
          WalkSegment('y', _y),
          WalkSegment(_edgePair, WalkCue.edgePair),
        ],
      ),
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment(_edgePair, WalkCue.edgePair),
          WalkSegment(_edgeLast, WalkCue.edgeLast, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'fiveSolve',
    track: LessonTrack.fiveByFive,
    size: 5,
    advanced: true,
    steps: [
      _example('fiveAsThree', "U R U' R'", WalkCue.cornerTop, setup: ''),
      _example(
        'fiveAsThree',
        _sexy3,
        WalkCue.cornerTop,
        setup: '',
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(setup: "z2 $_keepFirstLayer y'", segments: _cornerSlots),
      Walkthrough(
        setup: "z2 $_keepFirstLayer y'",
        segments: _cornerSlotsTwisted,
      ),
    ],
  ),
  Lesson(
    id: 'fiveParity',
    track: LessonTrack.fiveByFive,
    size: 5,
    advanced: true,
    steps: [
      _example('fiveEdgeParity', _fiveParity, WalkCue.parityFive, setup: ''),
      _example(
        'fiveEdgeParity',
        "U2 $_fiveParity U2",
        WalkCue.parityFive,
        setup: '',
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        setup: _keepCenters,
        segments: [WalkSegment(_fiveParity, WalkCue.parityFive)],
      ),
      Walkthrough(
        setup: "$_keepCenters U2",
        segments: [WalkSegment(_fiveParity, WalkCue.parityFive, bonus: true)],
      ),
    ],
  ),
  Lesson(
    id: 'sixIntro',
    track: LessonTrack.sixBySix,
    size: 6,
    steps: [
      const LessonStep('sixPieces', top: _white, front: _green),
      _example(
        'sixSlices',
        "3Rw 3Rw' 2R 2R' 3R 3R'",
        WalkCue.sliceWide,
        setup: '',
      ),
      _example(
        'sixSlices',
        "3R 3R' 2U 2U'",
        WalkCue.sliceInner,
        setup: '',
        extra: true,
      ),
    ],
    practice: const [
      Walkthrough(
        segments: [
          WalkSegment('3R', WalkCue.sliceInner),
          WalkSegment('2U', WalkCue.sliceInner),
          WalkSegment("3R'", WalkCue.sliceInner),
          WalkSegment("2U'", WalkCue.sliceInner),
        ],
      ),
      Walkthrough(
        segments: [
          WalkSegment('3Rw', WalkCue.sliceWide),
          WalkSegment('U', WalkCue.faceTurn),
          WalkSegment("3Rw'", WalkCue.sliceWide),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'sixCenters',
    track: LessonTrack.sixBySix,
    size: 6,
    advanced: true,
    steps: [
      _example('sixCenterBar', "2-3Rw U 2-3Rw'", WalkCue.centerBar, setup: ''),
      _example(
        'sixCenterSwap',
        _sixCenterCycle,
        WalkCue.centerCycle,
        setup: '',
      ),
    ],
    practice: const [
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment("2-3Rw U 2-3Rw'", WalkCue.centerBar),
          WalkSegment(_sixCenterCycle, WalkCue.centerCycle),
        ],
      ),
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment(_sixCenterCycle, WalkCue.centerCycle),
          WalkSegment("3R U2 3R'", WalkCue.centerBar, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'sixEdges',
    track: LessonTrack.sixBySix,
    size: 6,
    advanced: true,
    steps: [
      _example('sixEdgePair', _sixEdgePair, WalkCue.edgePair, setup: ''),
      _example('sixEdgeLast', _sixEdgeLast, WalkCue.edgeLast, setup: ''),
    ],
    practice: const [
      Walkthrough(
        setup: "$_keepCenters y",
        segments: [
          WalkSegment(_sixEdgePair, WalkCue.edgePair),
          WalkSegment('y', _y),
          WalkSegment(_sixEdgePair, WalkCue.edgePair),
        ],
      ),
      Walkthrough(
        setup: _keepCenters,
        segments: [
          WalkSegment(_sixEdgePair, WalkCue.edgePair),
          WalkSegment(_sixEdgeLast, WalkCue.edgeLast, bonus: true),
        ],
      ),
    ],
  ),
  Lesson(
    id: 'sixSolve',
    track: LessonTrack.sixBySix,
    size: 6,
    advanced: true,
    steps: [
      _example('sixAsThree', "U R U' R'", WalkCue.cornerTop, setup: ''),
      _example('sixAsThree', _sexy3, WalkCue.cornerTop, setup: '', extra: true),
    ],
    practice: const [
      Walkthrough(setup: "z2 $_keepFirstLayer y'", segments: _cornerSlots),
      Walkthrough(
        setup: "z2 $_keepFirstLayer y'",
        segments: _cornerSlotsTwisted,
      ),
    ],
  ),
  Lesson(
    id: 'sixParity',
    track: LessonTrack.sixBySix,
    size: 6,
    advanced: true,
    steps: [
      _example('sixOllParity', _sixOllParity, WalkCue.parityOll, setup: ''),
      _example('sixPllParity', _sixPllParity, WalkCue.parityPll, setup: ''),
    ],
    practice: const [
      Walkthrough(
        setup: _keepCenters,
        segments: [WalkSegment(_sixPureParity, WalkCue.parityOll)],
      ),
      Walkthrough(
        setup: "$_keepCenters U2",
        segments: [WalkSegment(_sixPllParity, WalkCue.parityPll, bonus: true)],
      ),
    ],
  ),
]);

const _bigOllParity =
    "Rw U2 x Rw U2 Rw U2 Rw' U2 Lw U2 Rw' U2 Rw U2 Rw' U2 Rw'";
const _bigPllParity = "2R2 U2 2R2 Uw2 2R2 2U2";

/// Edge parity with inner slices only (also the 4x4 OLL parity without
/// whole-cube turns).
const _fiveParity = "2R2 B2 U2 2L U2 2R' U2 2R U2 F2 2R F2 2L' B2 2R2";
const _sixCenterCycle = "3R U' 3L' U 3R' U' 3L U";
const _sixEdgePair = "3Uw' R U R' F R' F' R 3Uw";
const _sixEdgeLast = "3Dw R F' U R' F 3Dw'";
const _sixOllParity =
    "3Rw U2 x 3Rw U2 3Rw U2 3Rw' U2 3Lw U2 3Rw' U2 3Rw U2 3Rw' U2 3Rw'";
const _sixPllParity = "2-3Rw2 U2 2-3Rw2 3Uw2 2-3Rw2 2-3Uw2";

/// OLL parity without whole-cube turns (inner slices only), for the
/// walkthroughs: the cube stays in hand the whole time.
const _sixPureParity =
    "2-3Rw2 B2 U2 2-3Lw U2 2-3Rw' U2 2-3Rw U2 F2 2-3Rw F2 2-3Lw' B2 2-3Rw2";

Lesson? _lessonById(String id) {
  for (final lesson in kLessons) {
    if (lesson.id == id) return lesson;
  }
  return null;
}

/// The beginner lesson teaching sub-step [crown].[subStep], if any.
Lesson? lessonForSubStep(int crown, int subStep) {
  for (final lesson in kLessons) {
    if (lesson.crown == crown && lesson.subStep == subStep) return lesson;
  }
  return null;
}

/// One plain sentence on what the cube looks like after a lesson.
String introGoalText(AppLocalizations l10n, String id) => switch (id) {
  'basics' => l10n.introGoalBasics,
  'cross' => l10n.introGoalCross,
  'corners' => l10n.introGoalCorners,
  'middle' => l10n.introGoalMiddle,
  'yellowCross' => l10n.introGoalYellowCross,
  'yellowEdges' => l10n.introGoalYellowEdges,
  'yellowCorners' => l10n.introGoalYellowCorners,
  'twistCorners' => l10n.introGoalTwistCorners,
  'cfopIntro' => l10n.introGoalCfopIntro,
  'f2l' => l10n.introGoalF2l,
  'oll' => l10n.introGoalOll,
  'pll' => l10n.introGoalPll,
  'twoFirst' => l10n.introGoalTwoFirst,
  'twoOll' => l10n.introGoalTwoOll,
  'twoPbl' => l10n.introGoalTwoPbl,
  'bigIntro' => l10n.introGoalBigIntro,
  'bigCenters' => l10n.introGoalBigCenters,
  'bigEdges' => l10n.introGoalBigEdges,
  'bigParity' => l10n.introGoalBigParity,
  'fiveIntro' => l10n.introGoalFiveIntro,
  'fiveCenters' => l10n.introGoalFiveCenters,
  'fiveEdges' => l10n.introGoalFiveEdges,
  'fiveSolve' => l10n.introGoalFiveSolve,
  'fiveParity' => l10n.introGoalFiveParity,
  'sixIntro' => l10n.introGoalSixIntro,
  'sixCenters' => l10n.introGoalSixCenters,
  'sixEdges' => l10n.introGoalSixEdges,
  'sixSolve' => l10n.introGoalSixSolve,
  'sixParity' => l10n.introGoalSixParity,
  _ => '',
};

/// Two or three short lines (one per bullet) on how a lesson gets there.
String introHowText(AppLocalizations l10n, String id) => switch (id) {
  'basics' => l10n.introHowBasics,
  'cross' => l10n.introHowCross,
  'corners' => l10n.introHowCorners,
  'middle' => l10n.introHowMiddle,
  'yellowCross' => l10n.introHowYellowCross,
  'yellowEdges' => l10n.introHowYellowEdges,
  'yellowCorners' => l10n.introHowYellowCorners,
  'twistCorners' => l10n.introHowTwistCorners,
  'cfopIntro' => l10n.introHowCfopIntro,
  'f2l' => l10n.introHowF2l,
  'oll' => l10n.introHowOll,
  'pll' => l10n.introHowPll,
  'twoFirst' => l10n.introHowTwoFirst,
  'twoOll' => l10n.introHowTwoOll,
  'twoPbl' => l10n.introHowTwoPbl,
  'bigIntro' => l10n.introHowBigIntro,
  'bigCenters' => l10n.introHowBigCenters,
  'bigEdges' => l10n.introHowBigEdges,
  'bigParity' => l10n.introHowBigParity,
  'fiveIntro' => l10n.introHowFiveIntro,
  'fiveCenters' => l10n.introHowFiveCenters,
  'fiveEdges' => l10n.introHowFiveEdges,
  'fiveSolve' => l10n.introHowFiveSolve,
  'fiveParity' => l10n.introHowFiveParity,
  'sixIntro' => l10n.introHowSixIntro,
  'sixCenters' => l10n.introHowSixCenters,
  'sixEdges' => l10n.introHowSixEdges,
  'sixSolve' => l10n.introHowSixSolve,
  'sixParity' => l10n.introHowSixParity,
  _ => '',
};

/// Localized title of a lesson. Beginner's-method lessons are named after
/// their sub-step, exactly as the guided solver shows it ("3.3 ...").
String lessonTitle(AppLocalizations l10n, String id) {
  final lesson = _lessonById(id);
  if (lesson != null && lesson.crown > 0) {
    return '${lesson.subStepLabel} '
        '${subStepTitle(l10n, lesson.crown, lesson.subStep)}';
  }
  return _lessonTitle(l10n, id);
}

String _lessonTitle(AppLocalizations l10n, String id) => switch (id) {
  'basics' => l10n.lessonBasics,
  'cfopIntro' => l10n.lessonCfopIntro,
  'f2l' => l10n.lessonF2l,
  'oll' => l10n.lessonOll,
  'pll' => l10n.lessonPll,
  'twoFirst' => l10n.lessonTwoFirst,
  'twoOll' => l10n.lessonTwoOll,
  'twoPbl' => l10n.lessonTwoPbl,
  'bigIntro' => l10n.lessonBigIntro,
  'bigCenters' => l10n.lessonBigCenters,
  'bigEdges' => l10n.lessonBigEdges,
  'bigParity' => l10n.lessonBigParity,
  'fiveIntro' => l10n.lessonFiveIntro,
  'fiveCenters' => l10n.lessonFiveCenters,
  'fiveEdges' => l10n.lessonFiveEdges,
  'fiveSolve' => l10n.lessonFiveSolve,
  'fiveParity' => l10n.lessonFiveParity,
  'sixIntro' => l10n.lessonSixIntro,
  'sixCenters' => l10n.lessonSixCenters,
  'sixEdges' => l10n.lessonSixEdges,
  'sixSolve' => l10n.lessonSixSolve,
  'sixParity' => l10n.lessonSixParity,
  _ => id,
};

/// Localized one-line summary of a lesson (a sub-step's goal for the
/// beginner's method).
String lessonDescription(AppLocalizations l10n, String id) {
  final lesson = _lessonById(id);
  if (lesson != null && lesson.crown > 0) {
    return subStepGoal(l10n, lesson.crown, lesson.subStep);
  }
  return _lessonDescription(l10n, id);
}

String _lessonDescription(AppLocalizations l10n, String id) => switch (id) {
  'basics' => l10n.lessonBasicsDesc,
  'cfopIntro' => l10n.lessonCfopIntroDesc,
  'f2l' => l10n.lessonF2lDesc,
  'oll' => l10n.lessonOllDesc,
  'pll' => l10n.lessonPllDesc,
  'twoFirst' => l10n.lessonTwoFirstDesc,
  'twoOll' => l10n.lessonTwoOllDesc,
  'twoPbl' => l10n.lessonTwoPblDesc,
  'bigIntro' => l10n.lessonBigIntroDesc,
  'bigCenters' => l10n.lessonBigCentersDesc,
  'bigEdges' => l10n.lessonBigEdgesDesc,
  'bigParity' => l10n.lessonBigParityDesc,
  'fiveIntro' => l10n.lessonFiveIntroDesc,
  'fiveCenters' => l10n.lessonFiveCentersDesc,
  'fiveEdges' => l10n.lessonFiveEdgesDesc,
  'fiveSolve' => l10n.lessonFiveSolveDesc,
  'fiveParity' => l10n.lessonFiveParityDesc,
  'sixIntro' => l10n.lessonSixIntroDesc,
  'sixCenters' => l10n.lessonSixCentersDesc,
  'sixEdges' => l10n.lessonSixEdgesDesc,
  'sixSolve' => l10n.lessonSixSolveDesc,
  'sixParity' => l10n.lessonSixParityDesc,
  _ => id,
};

/// Localized title of a lesson step.
String lessonStepTitle(AppLocalizations l10n, String id) => switch (id) {
  'basicsPieces' => l10n.stepBasicsPieces,
  'basicsFaces' => l10n.stepBasicsFaces,
  'basicsPrime' => l10n.stepBasicsPrime,
  'crossGoal' => l10n.stepCrossGoal,
  'crossTop' => l10n.stepCrossTop,
  'crossMiddle' => l10n.stepCrossMiddle,
  'cornersInsert' => l10n.stepCornersInsert,
  'cornersRepeat' => l10n.stepCornersRepeat,
  'middleRight' => l10n.stepMiddleRight,
  'middleLeft' => l10n.stepMiddleLeft,
  'yellowCross' => l10n.stepYellowCross,
  'yellowEdges' => l10n.stepYellowEdges,
  'placeCorners' => l10n.stepPlaceCorners,
  'twistCorners' => l10n.stepTwistCorners,
  'cfopOverview' => l10n.stepCfopOverview,
  'cfopCross' => l10n.stepCfopCross,
  'f2lRight' => l10n.stepF2lRight,
  'f2lLeft' => l10n.stepF2lLeft,
  'ollCross' => l10n.stepOllCross,
  'ollSune' => l10n.stepOllSune,
  'pllT' => l10n.stepPllT,
  'pllU' => l10n.stepPllU,
  'twoIntro' => l10n.stepTwoIntro,
  'twoCorner' => l10n.stepTwoCorner,
  'twoSune' => l10n.stepTwoSune,
  'twoAdjacent' => l10n.stepTwoAdjacent,
  'twoDiagonal' => l10n.stepTwoDiagonal,
  'bigPieces' => l10n.stepBigPieces,
  'bigSlices' => l10n.stepBigSlices,
  'bigCenterCycle' => l10n.stepBigCenterCycle,
  'bigEdgePair' => l10n.stepBigEdgePair,
  'bigOllParity' => l10n.stepBigOllParity,
  'bigPllParity' => l10n.stepBigPllParity,
  'fivePieces' => l10n.stepFivePieces,
  'fiveSlices' => l10n.stepFiveSlices,
  'fiveCenterBar' => l10n.stepFiveCenterBar,
  'fiveCenterSwap' => l10n.stepFiveCenterSwap,
  'fiveEdgePair' => l10n.stepFiveEdgePair,
  'fiveEdgeLast' => l10n.stepFiveEdgeLast,
  'fiveAsThree' => l10n.stepFiveAsThree,
  'fiveEdgeParity' => l10n.stepFiveEdgeParity,
  'sixPieces' => l10n.stepSixPieces,
  'sixSlices' => l10n.stepSixSlices,
  'sixCenterBar' => l10n.stepSixCenterBar,
  'sixCenterSwap' => l10n.stepSixCenterSwap,
  'sixEdgePair' => l10n.stepSixEdgePair,
  'sixEdgeLast' => l10n.stepSixEdgeLast,
  'sixAsThree' => l10n.stepSixAsThree,
  'sixOllParity' => l10n.stepSixOllParity,
  'sixPllParity' => l10n.stepSixPllParity,
  _ => id,
};

/// Localized explanation of a lesson step.
String lessonStepBody(AppLocalizations l10n, String id) => switch (id) {
  'basicsPieces' => l10n.stepBasicsPiecesBody,
  'basicsFaces' => l10n.stepBasicsFacesBody,
  'basicsPrime' => l10n.stepBasicsPrimeBody,
  'crossGoal' => l10n.stepCrossGoalBody,
  'crossTop' => l10n.stepCrossTopBody,
  'crossMiddle' => l10n.stepCrossMiddleBody,
  'cornersInsert' => l10n.stepCornersInsertBody,
  'cornersRepeat' => l10n.stepCornersRepeatBody,
  'middleRight' => l10n.stepMiddleRightBody,
  'middleLeft' => l10n.stepMiddleLeftBody,
  'yellowCross' => l10n.stepYellowCrossBody,
  'yellowEdges' => l10n.stepYellowEdgesBody,
  'placeCorners' => l10n.stepPlaceCornersBody,
  'twistCorners' => l10n.stepTwistCornersBody,
  'cfopOverview' => l10n.stepCfopOverviewBody,
  'cfopCross' => l10n.stepCfopCrossBody,
  'f2lRight' => l10n.stepF2lRightBody,
  'f2lLeft' => l10n.stepF2lLeftBody,
  'ollCross' => l10n.stepOllCrossBody,
  'ollSune' => l10n.stepOllSuneBody,
  'pllT' => l10n.stepPllTBody,
  'pllU' => l10n.stepPllUBody,
  'twoIntro' => l10n.stepTwoIntroBody,
  'twoCorner' => l10n.stepTwoCornerBody,
  'twoSune' => l10n.stepTwoSuneBody,
  'twoAdjacent' => l10n.stepTwoAdjacentBody,
  'twoDiagonal' => l10n.stepTwoDiagonalBody,
  'bigPieces' => l10n.stepBigPiecesBody,
  'bigSlices' => l10n.stepBigSlicesBody,
  'bigCenterCycle' => l10n.stepBigCenterCycleBody,
  'bigEdgePair' => l10n.stepBigEdgePairBody,
  'bigOllParity' => l10n.stepBigOllParityBody,
  'bigPllParity' => l10n.stepBigPllParityBody,
  'fivePieces' => l10n.stepFivePiecesBody,
  'fiveSlices' => l10n.stepFiveSlicesBody,
  'fiveCenterBar' => l10n.stepFiveCenterBarBody,
  'fiveCenterSwap' => l10n.stepFiveCenterSwapBody,
  'fiveEdgePair' => l10n.stepFiveEdgePairBody,
  'fiveEdgeLast' => l10n.stepFiveEdgeLastBody,
  'fiveAsThree' => l10n.stepFiveAsThreeBody,
  'fiveEdgeParity' => l10n.stepFiveEdgeParityBody,
  'sixPieces' => l10n.stepSixPiecesBody,
  'sixSlices' => l10n.stepSixSlicesBody,
  'sixCenterBar' => l10n.stepSixCenterBarBody,
  'sixCenterSwap' => l10n.stepSixCenterSwapBody,
  'sixEdgePair' => l10n.stepSixEdgePairBody,
  'sixEdgeLast' => l10n.stepSixEdgeLastBody,
  'sixAsThree' => l10n.stepSixAsThreeBody,
  'sixOllParity' => l10n.stepSixOllParityBody,
  'sixPllParity' => l10n.stepSixPllParityBody,
  _ => id,
};

/// Localized name of a track.
String trackTitle(AppLocalizations l10n, LessonTrack track) => switch (track) {
  LessonTrack.beginner => l10n.trackBeginner,
  LessonTrack.cfop => l10n.trackCfop,
  LessonTrack.twoByTwo => l10n.trackTwoByTwo,
  LessonTrack.bigCubes => l10n.trackBigCubes,
  LessonTrack.fiveByFive => l10n.trackFiveByFive,
  LessonTrack.sixBySix => l10n.trackSixBySix,
};
