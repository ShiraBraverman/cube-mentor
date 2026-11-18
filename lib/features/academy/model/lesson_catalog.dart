// Lesson catalogue (texts live in the ARB files so every lesson is fully
// localized). The beginner track follows the 3-crown / 7-sub-step
// syllabus, one lesson per sub-step, matching the guided solver.
import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/crown_words.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import 'lesson.dart';

/// Every lesson, in teaching order.
const List<Lesson> kLessons = [
  Lesson(
    id: 'basics',
    track: LessonTrack.beginner,
    size: 3,
    steps: [
      LessonStep(
        'basicsPieces',
        top: StickerColor.white,
        front: StickerColor.green,
      ),
      LessonStep(
        'basicsFaces',
        demo: "R R' U U' F F'",
        top: StickerColor.white,
        front: StickerColor.green,
      ),
      LessonStep(
        'basicsPrime',
        demo: "R' U2",
        top: StickerColor.white,
        front: StickerColor.green,
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
      LessonStep(
        'crossGoal',
        setup: "z2",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'crossTop',
        setup: "z2",
        demo: "U F2",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'crossMiddle',
        setup: "z2",
        demo: "R U R' F2",
        top: StickerColor.yellow,
        front: StickerColor.green,
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
      LessonStep(
        'cornersInsert',
        setup: "z2",
        demo: "U R U' R'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'cornersRepeat',
        setup: "z2",
        demo: "R U R' U' R U R' U' R U R' U'",
        top: StickerColor.yellow,
        front: StickerColor.green,
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
      LessonStep(
        'middleRight',
        setup: "z2",
        demo: "U R U' R' U' F' U F",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'middleLeft',
        setup: "z2",
        demo: "U' L' U L U F U' F'",
        top: StickerColor.yellow,
        front: StickerColor.green,
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
      LessonStep(
        'yellowCross',
        setup: "z2",
        demo: "F R U R' U' F'",
        top: StickerColor.yellow,
        front: StickerColor.green,
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
      LessonStep(
        'yellowEdges',
        setup: "z2",
        demo: "R U R' U R U2 R' U",
        top: StickerColor.yellow,
        front: StickerColor.green,
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
      LessonStep(
        'placeCorners',
        setup: "z2",
        demo: "U R U' L' U R' U' L",
        top: StickerColor.yellow,
        front: StickerColor.green,
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
      LessonStep(
        'twistCorners',
        setup: "z2",
        demo:
            "R' D' R D R' D' R D U R' D' R D R' D' R D R' D' R D R' D' R D U'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'cfopIntro',
    track: LessonTrack.cfop,
    size: 3,
    steps: [
      LessonStep(
        'cfopOverview',
        setup: "z2",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'cfopCross',
        setup: "z2",
        demo: "R2 D F2",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'f2l',
    track: LessonTrack.cfop,
    size: 3,
    advanced: true,
    steps: [
      LessonStep(
        'f2lRight',
        setup: "z2",
        demo: "U R U' R'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'f2lLeft',
        setup: "z2",
        demo: "y' U' L' U L y",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'oll',
    track: LessonTrack.cfop,
    size: 3,
    advanced: true,
    steps: [
      LessonStep(
        'ollCross',
        setup: "z2",
        demo: "F R U R' U' F'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'ollSune',
        setup: "z2",
        demo: "R U R' U R U2 R'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'pll',
    track: LessonTrack.cfop,
    size: 3,
    advanced: true,
    steps: [
      LessonStep(
        'pllT',
        setup: "z2",
        demo: "R U R' U' R' F R2 U' R' U' R U R' F'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'pllU',
        setup: "z2",
        demo: "R U' R U R U R U' R' U' R2",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'twoFirst',
    track: LessonTrack.twoByTwo,
    size: 2,
    steps: [
      LessonStep(
        'twoIntro',
        top: StickerColor.white,
        front: StickerColor.green,
      ),
      LessonStep(
        'twoCorner',
        setup: "z2",
        demo: "U R U' R'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'twoOll',
    track: LessonTrack.twoByTwo,
    size: 2,
    steps: [
      LessonStep(
        'twoSune',
        setup: "z2",
        demo: "R U R' U R U2 R'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'twoPbl',
    track: LessonTrack.twoByTwo,
    size: 2,
    advanced: true,
    steps: [
      LessonStep(
        'twoAdjacent',
        setup: "z2",
        demo: "R U R' U' R' F R2 U' R' U' R U R' F'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
      LessonStep(
        'twoDiagonal',
        setup: "z2",
        demo: "F R U' R' U' R U R' F' R U R' U' R' F R F'",
        top: StickerColor.yellow,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'bigIntro',
    track: LessonTrack.bigCubes,
    size: 4,
    steps: [
      LessonStep(
        'bigPieces',
        top: StickerColor.white,
        front: StickerColor.green,
      ),
      LessonStep(
        'bigSlices',
        demo: "Rw Rw' 2R 2R'",
        top: StickerColor.white,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'bigCenters',
    track: LessonTrack.bigCubes,
    size: 4,
    advanced: true,
    steps: [
      LessonStep(
        'bigCenterCycle',
        demo: "2R U' 2L' U 2R' U' 2L U",
        top: StickerColor.white,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'bigEdges',
    track: LessonTrack.bigCubes,
    size: 4,
    advanced: true,
    steps: [
      LessonStep(
        'bigEdgePair',
        demo: "Uw' R U R' F R' F' R Uw",
        top: StickerColor.white,
        front: StickerColor.green,
      ),
    ],
  ),
  Lesson(
    id: 'bigParity',
    track: LessonTrack.bigCubes,
    size: 4,
    advanced: true,
    steps: [
      LessonStep(
        'bigOllParity',
        demo: "Rw U2 x Rw U2 Rw U2 Rw' U2 Lw U2 Rw' U2 Rw U2 Rw' U2 Rw'",
        top: StickerColor.white,
        front: StickerColor.green,
      ),
      LessonStep(
        'bigPllParity',
        demo: "2R2 U2 2R2 Uw2 2R2 Uw2",
        top: StickerColor.white,
        front: StickerColor.green,
      ),
    ],
  ),
];

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
  _ => id,
};

/// Localized name of a track.
String trackTitle(AppLocalizations l10n, LessonTrack track) => switch (track) {
  LessonTrack.beginner => l10n.trackBeginner,
  LessonTrack.cfop => l10n.trackCfop,
  LessonTrack.twoByTwo => l10n.trackTwoByTwo,
  LessonTrack.bigCubes => l10n.trackBigCubes,
};
