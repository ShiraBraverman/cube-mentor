// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Scan, solve and master every cube from 2×2 to 6×6.';

  @override
  String get chooseCubeSize => 'Choose your cube';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Beginner';

  @override
  String get cubeLevel3 => 'Classic';

  @override
  String get cubeLevel4 => 'Advanced';

  @override
  String get cubeLevel5 => 'Expert';

  @override
  String get cubeLevel6 => 'Master';

  @override
  String get cubeComingSoon => 'New cube coming soon';

  @override
  String get carouselPrevious => 'Previous cube';

  @override
  String get carouselNext => 'Next cube';

  @override
  String get chooseMode => 'What do you want to do?';

  @override
  String get modePlayground => '3D Playground';

  @override
  String get modePlaygroundDesc =>
      'Turn layers, scramble and replay moves in 3D.';

  @override
  String get modeScanSolve => 'Scan & Solve';

  @override
  String get modeScanSolveDesc =>
      'Scan your cube with the camera and get a solution.';

  @override
  String get modeAcademy => 'Academy';

  @override
  String get modeAcademyDesc => 'Learn step by step with interactive lessons.';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get comingSoonMessage =>
      'This feature is on its way in an upcoming update.';

  @override
  String get language => 'Language';

  @override
  String get languageSearch => 'Search languages';

  @override
  String get languageNoResults => 'No language matches your search.';

  @override
  String playgroundTitle(int size) {
    return '$size×$size Playground';
  }

  @override
  String get scramble => 'Scramble';

  @override
  String get reset => 'Reset';

  @override
  String get undo => 'Undo';

  @override
  String get speed => 'Speed';

  @override
  String get xray => 'X-ray';

  @override
  String get prime => 'Prime';

  @override
  String get wide => 'Wide';

  @override
  String layer(int index) {
    return 'Layer $index';
  }

  @override
  String get cubeRotations => 'Rotations';

  @override
  String get play => 'Play';

  @override
  String get pause => 'Pause';

  @override
  String get playbackTitle => 'Playback';

  @override
  String get playbackEmpty => 'Scramble the cube to build a solving playback.';

  @override
  String playbackProgress(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count moves',
      one: '1 move',
      zero: 'No moves',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Solved';

  @override
  String get scrambled => 'Scrambled';

  @override
  String get orbitHint =>
      'Drag a row to turn it · Drag the background to orbit';

  @override
  String get notationPad => 'Notation pad';

  @override
  String get solve => 'Solve';

  @override
  String get solving => 'Solving…';

  @override
  String get solveFast => 'Fast solve';

  @override
  String get solveLearn => 'Learn step by step';

  @override
  String get solveModeGuided => 'Guided (3 crowns)';

  @override
  String get solveModeFast => 'Fast (optimal)';

  @override
  String solveUnavailable(int size) {
    return 'The $size×$size solver arrives in a later update.';
  }

  @override
  String get solveAlreadySolved => 'The cube is already solved.';

  @override
  String solveFailed(String reason) {
    return 'This cube can\'t be solved ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'The solving engine isn\'t available on this device.';

  @override
  String get solveComplete => 'Solved! Great job.';

  @override
  String solveSummary(int count) {
    return '$count moves';
  }

  @override
  String get nextMove => 'Next move';

  @override
  String get previousMove => 'Previous move';

  @override
  String get halfTurnHalfway =>
      'Nice, halfway there! Turn it once more for a double turn (180°).';

  @override
  String get wideTurnInner =>
      'Great! Now swipe the inner adjacent layer to complete the wide turn.';

  @override
  String get wideTurnOuter =>
      'Great! Now swipe the outer layer next to it to complete the wide turn.';

  @override
  String get wideTurnMore =>
      'Great! Keep swiping the glowing layers one at a time to complete the wide turn.';

  @override
  String get guideSwipeHint =>
      'Swipe the glowing layer the way the arrow points, or tap Next.';

  @override
  String get guideRotateHint =>
      'Turn the whole cube as the arrow shows: tap Next.';

  @override
  String get guideWrongMove => 'Follow the highlighted arrow';

  @override
  String get guideExit => 'Exit guide';

  @override
  String get replayStep => 'Replay step';

  @override
  String get colorWhite => 'white';

  @override
  String get colorYellow => 'yellow';

  @override
  String get colorGreen => 'green';

  @override
  String get colorBlue => 'blue';

  @override
  String get colorRed => 'red';

  @override
  String get colorOrange => 'orange';

  @override
  String get phaseOptimal2x2 => 'Optimal solution';

  @override
  String get phaseKociemba1 => 'Phase 1 · Orient the pieces';

  @override
  String get phaseKociemba2 => 'Phase 2 · Finish the cube';

  @override
  String get phaseLblCross => 'White cross';

  @override
  String get phaseLblCorners => 'First crown corners';

  @override
  String get phaseLblMiddle => 'Middle layer edges';

  @override
  String get phaseLblYellowCross => 'Yellow cross';

  @override
  String get phaseLblYellowEdges => 'Align the yellow cross edges';

  @override
  String get phaseLblYellowCorners => 'Position the yellow corners';

  @override
  String get phaseLblYellowCornersOrient => 'Orient the yellow corners';

  @override
  String get crownFirst => 'First crown';

  @override
  String get crownSecond => 'Second crown';

  @override
  String get crownThird => 'Third crown';

  @override
  String get crownFirstGoal => 'White face and first layer';

  @override
  String get crownSecondGoal => 'Middle layer';

  @override
  String get crownThirdGoal => 'Yellow face and last layer';

  @override
  String crownProgress(int current, int total) {
    return 'Crown $current of $total';
  }

  @override
  String get subStepGoal11 =>
      'Form a white cross where every white edge also matches the center color beside it.';

  @override
  String get subStepGoal12 =>
      'Insert the 4 white corners into their matching slots to finish the white face and the whole first ring.';

  @override
  String get subStepGoal21 =>
      'Insert the 4 middle-layer edges without disturbing the first crown.';

  @override
  String get subStepGoal31 => 'Form a yellow cross on the last layer.';

  @override
  String get subStepGoal32 =>
      'Swap the yellow cross edges until each one matches its side center.';

  @override
  String get subStepGoal33 =>
      'Move the 4 yellow corners to their correct places, even if they are still twisted.';

  @override
  String get subStepGoal34 =>
      'Twist each yellow corner in place until every sticker matches and the cube is solved.';

  @override
  String get explainOptimal2x2 =>
      'The shortest possible solution, found by searching every 2×2 position.';

  @override
  String get explainKociemba1 =>
      'Orient every piece and gather the middle-layer edges into the middle layer.';

  @override
  String get explainKociemba2 =>
      'Finish with U, D and half turns only, which keep that orientation.';

  @override
  String get explainLblOrient =>
      'Turn the whole cube so the white center points down.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Bring the $piece edge down next to the white center, matching its side color.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'The $piece corner is stuck in the wrong spot. Lift it to the top with R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Turn the top layer until the $piece corner sits above its slot.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Repeat R U R\' U\' until the $piece corner drops into place.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'The $piece edge is in the middle layer but wrong. Pop it out to the top.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Turn the top layer so the $piece edge\'s side color matches its center.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Insert the $piece edge to the right: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Insert the $piece edge to the left: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Turn the top layer to place the yellow shape for the next algorithm.';

  @override
  String get explainLblYellowCrossAlg =>
      'Build the yellow cross with F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Turn the top layer to line the yellow edges up with their centers.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Swap yellow edges with R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Cycle the yellow corners into their spots with U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Turn the top layer to bring the next unsolved yellow corner to the front-right.';

  @override
  String get explainLblCornerTwist =>
      'Repeat R\' D\' R D until yellow faces up. The bottom fixes itself at the end.';

  @override
  String get explainLblFinalAlign => 'Turn the top layer to finish the cube.';

  @override
  String scanTitle(int size) {
    return 'Scan $size×$size';
  }

  @override
  String get scanManualInput => 'Enter colors by hand';

  @override
  String get scanUseCamera => 'Scan with the camera';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Face $current of $total';
  }

  @override
  String get faceUp => 'Top face';

  @override
  String get faceRight => 'Right face';

  @override
  String get faceFront => 'Front face';

  @override
  String get faceDown => 'Bottom face';

  @override
  String get faceLeft => 'Left face';

  @override
  String get faceBack => 'Back face';

  @override
  String get scanHintFront =>
      'Hold the cube with any face toward you. That is your front: keep the same face on top while you scan.';

  @override
  String get scanHintRight =>
      'From the front, turn the whole cube left once so the right face looks at you.';

  @override
  String get scanHintBack => 'From the front, turn the whole cube left twice.';

  @override
  String get scanHintLeft => 'From the front, turn the whole cube right once.';

  @override
  String get scanHintUp =>
      'From the front, tip the top toward you so it faces the camera.';

  @override
  String get scanHintDown =>
      'From the front, tip the bottom toward you so it faces the camera.';

  @override
  String get scanAlignHint =>
      'Fill the grid with the face, then tap the shutter.';

  @override
  String get scanCapture => 'Capture face';

  @override
  String get scanTurnLeft => 'Turn the whole cube to the left';

  @override
  String get scanTurnRight => 'Turn the whole cube to the right';

  @override
  String get scanTipTop => 'Tip the top toward you';

  @override
  String get scanTipBottom => 'Tip the bottom toward you';

  @override
  String get scanGlareTip =>
      'Glare detected: tilt the cube slightly, or hold your phone over it to block the overhead light.';

  @override
  String get scanDimTip =>
      'Too dim: move to brighter light or turn on the flashlight.';

  @override
  String get scanTorch => 'Flashlight';

  @override
  String get scanGuideLabel =>
      'Scan guide: scanned faces in color. Tap a scanned face to scan it again.';

  @override
  String get scanTapToRescan => 'Tap a scanned face to scan it again.';

  @override
  String get scanCameraMissing => 'No camera found on this device.';

  @override
  String get scanCameraDenied =>
      'Camera access was denied. You can still enter the colors by hand.';

  @override
  String get scanCameraFailed => 'The camera could not start.';

  @override
  String get scanAllGood => 'All stickers look right.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stickers look wrong',
      one: '1 sticker looks wrong',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Something doesn\'t add up';

  @override
  String scanIssueColors(int count) {
    return 'Each color must appear exactly $count times.';
  }

  @override
  String get scanIssueCenters => 'Two centers have the same color.';

  @override
  String get scanIssuePieces =>
      'These stickers form pieces that don\'t exist on a real cube.';

  @override
  String get scanIssueTwist =>
      'One corner is twisted. Check the corner stickers.';

  @override
  String get scanIssueFlip => 'One edge is flipped. Check the edge stickers.';

  @override
  String get scanIssueParity => 'Two pieces look swapped.';

  @override
  String get scanIssueUnavailable =>
      'Color checking isn\'t available on this device.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stickers were hard to read: give them a quick look.',
      one: '1 sticker was hard to read: give it a quick look.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Tap a sticker to change its color · Long-press for the palette';

  @override
  String get scanRescanFace => 'Rescan a face';

  @override
  String get scanCancelRescan => 'Back to the colors';

  @override
  String get scanPaletteTitle => 'Pick a color';

  @override
  String get scanOpen3d => 'Open in 3D';

  @override
  String get scanRestart => 'Start over';

  @override
  String get modeTimer => 'Speed timer';

  @override
  String get modeTimerDesc =>
      'Scrambles, inspection, averages and personal bests.';

  @override
  String get modeDaily => 'Daily challenge';

  @override
  String get modeDailyDesc =>
      'A new scramble every day. Keep your streak alive.';

  @override
  String get modePatterns => 'Pattern library';

  @override
  String get modePatternsDesc =>
      'Checkerboards, superflip and more, played in 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-day streak',
      one: '1-day streak',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Continue learning';

  @override
  String get startLearning => 'Start learning';

  @override
  String lessonOf(int index, int total) {
    return 'Lesson $index of $total';
  }

  @override
  String get academyAllDone => 'Every lesson completed!';

  @override
  String get academyTitle => 'Academy';

  @override
  String academyProgress(int done, int total) {
    return '$done of $total lessons completed';
  }

  @override
  String get lessonAdvanced => 'Advanced';

  @override
  String get lessonDone => 'Done';

  @override
  String lessonPartOf(int index, int total) {
    return 'Part $index of $total';
  }

  @override
  String get lessonBack => 'Back';

  @override
  String get lessonNext => 'Next';

  @override
  String get lessonFinish => 'Finish lesson';

  @override
  String get lessonComplete => 'Lesson complete!';

  @override
  String get lessonNextLesson => 'Next lesson';

  @override
  String get lessonBackToAcademy => 'Back to the Academy';

  @override
  String get lessonTryIt =>
      'Your turn: swipe the layer the arrow shows, or tap Next move.';

  @override
  String get lessonLookAround =>
      'Drag the background to look at the cube from every side.';

  @override
  String get lessonDemoDone => 'Nice! Tap Next to continue.';

  @override
  String holdPrompt(String top, String front) {
    return 'Hold the cube with the $top center on top and the $front center facing you.';
  }

  @override
  String get trackBeginner => 'Beginner 3×3: the 3 crowns';

  @override
  String get trackCfop => 'Intro to CFOP';

  @override
  String get trackTwoByTwo => '2×2 beginner & Ortega';

  @override
  String get trackBigCubes => 'Big cubes: reduction & parity';

  @override
  String moveSentence(String layer, String direction) {
    return 'Turn $layer $direction';
  }

  @override
  String get moveFaceR => 'the right face';

  @override
  String get moveFaceL => 'the left face';

  @override
  String get moveFaceU => 'the top face';

  @override
  String get moveFaceD => 'the bottom face';

  @override
  String get moveFaceF => 'the front face';

  @override
  String get moveFaceB => 'the back face';

  @override
  String moveLayerInner(int depth, String face) {
    return 'layer $depth from $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth layers deep)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'layers $near–$far from $face';
  }

  @override
  String get moveLayerMiddle => 'the middle layer';

  @override
  String get moveDirUp => 'up';

  @override
  String get moveDirDown => 'down';

  @override
  String get moveDirLeft => 'to the left';

  @override
  String get moveDirRight => 'to the right';

  @override
  String get moveDirClockwise => 'clockwise';

  @override
  String get moveDirCounter => 'counter-clockwise';

  @override
  String get moveDirBackClockwise => 'clockwise, as seen from the back';

  @override
  String get moveDirBackCounter => 'counter-clockwise, as seen from the back';

  @override
  String get moveDirHalf => 'half a turn (twice)';

  @override
  String get moveRotateX => 'Tilt the whole cube: the front goes up to the top';

  @override
  String get moveRotateXPrime =>
      'Tilt the whole cube: the front goes down to the bottom';

  @override
  String get moveRotateX2 =>
      'Flip the whole cube over: the front goes to the back';

  @override
  String get moveRotateY => 'Spin the whole cube: the front goes to the left';

  @override
  String get moveRotateYPrime =>
      'Spin the whole cube: the front goes to the right';

  @override
  String get moveRotateY2 =>
      'Spin the whole cube half a turn: the back comes to the front';

  @override
  String get moveRotateZ =>
      'Roll the whole cube clockwise: the top goes to the right';

  @override
  String get moveRotateZPrime =>
      'Roll the whole cube counter-clockwise: the top goes to the left';

  @override
  String get moveRotateZ2 =>
      'Roll the whole cube upside down: the top goes to the bottom';

  @override
  String get phaseReductionCenters => 'Centers';

  @override
  String get phaseReductionEdges => 'Pair the edges';

  @override
  String get phaseReductionEdgeParity => 'Edge parity';

  @override
  String get phaseReductionOllParity => 'OLL parity';

  @override
  String get phaseReductionPllParity => 'PLL parity';

  @override
  String get explainReductionCenterBlock =>
      'Slice turns that bring several center pieces home at once.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Bring a $piece center piece to its face with a 3-cycle that leaves finished centers alone.';
  }

  @override
  String get explainReductionParityCenters =>
      'Rebuild the centers that the parity slice turn moved.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Join the $piece edge pieces with a 3-cycle; the centers stay solved.';
  }

  @override
  String get explainReductionEdgeParity =>
      'The last edges can\'t be paired with 3-cycles alone (edge parity). One inner-slice turn fixes that.';

  @override
  String get explainReductionOllParity =>
      'OLL parity: one edge is flipped, which can\'t happen on a 3×3. This algorithm flips it back.';

  @override
  String get explainReductionPllParity =>
      'PLL parity: two edges are swapped, impossible on a 3×3. This algorithm swaps them back.';

  @override
  String get patternsTitle => 'Pattern library';

  @override
  String get patternsHint =>
      'Tap a pattern to watch it, then follow along on your own cube.';

  @override
  String get patternCheckerboard => 'Checkerboard';

  @override
  String get patternCubeInCube => 'Cube in a cube';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Dots';

  @override
  String get patternCross => 'Cross';

  @override
  String get patternPython => 'Python';

  @override
  String get phasePattern => 'Make the pattern';

  @override
  String get explainPatternStep =>
      'Follow each move on your own cube. Tap Solve to bring it back to normal.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Speed timer';

  @override
  String get timerHoldToStart => 'Hold, then release to start';

  @override
  String get timerReleaseToStart => 'Release to start';

  @override
  String get timerTapToStop => 'Tap anywhere to stop';

  @override
  String get timerInspecting => 'Inspection: hold, then release to start';

  @override
  String get timerTapToInspect => 'Tap to start the 15-second inspection';

  @override
  String get timerInspectionToggle => '15 s inspection';

  @override
  String get timerNewScramble => 'New scramble';

  @override
  String get timerLoadingScramble => 'Generating a scramble…';

  @override
  String get timerPb => 'Best';

  @override
  String get timerSolves => 'Solves';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Delete';

  @override
  String get timerHistory => 'History';

  @override
  String get timerNoSolves => 'No solves yet. Scramble your cube and go!';

  @override
  String get timerNewPb => 'New personal best!';

  @override
  String get timerClearHistory => 'Clear history';

  @override
  String get timerScrambleHint =>
      'Hold white on top and green in front, then scramble:';

  @override
  String get dailyTitle => 'Daily challenge';

  @override
  String dailyFor(String date) {
    return 'Challenge for $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Best streak: $count';
  }

  @override
  String get dailyDone => 'Done for today! Come back tomorrow.';

  @override
  String get dailyNotDone => 'Solve today\'s scramble to keep your streak.';

  @override
  String get dailySolveVirtual => 'Solve on the 3D cube';

  @override
  String get dailyTimeIt => 'Time it on your cube';

  @override
  String get dailyHint => 'Hint';

  @override
  String dailyHintText(String moves) {
    return 'Start with the white cross: $moves';
  }

  @override
  String get dailyHintFailed => 'No hint is available right now.';

  @override
  String get lessonBasics => 'Meet the cube';

  @override
  String get lessonBasicsDesc => 'Pieces, faces and move names.';

  @override
  String get stepBasicsPieces => 'Three kinds of pieces';

  @override
  String get stepBasicsPiecesBody =>
      'Centers never move and give each face its color. Edges have two colors, corners have three. Solving means moving every edge and corner next to the centers that match.';

  @override
  String get stepBasicsFaces => 'Six face letters';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F and B are the right, left, up, down, front and back faces. A letter alone means a clockwise quarter turn, as if you looked straight at that face.';

  @override
  String get stepBasicsPrime => 'Prime and double turns';

  @override
  String get stepBasicsPrimeBody =>
      'An apostrophe (R\') turns the other way, counter-clockwise. A 2 (U2) is a half turn: two quarter turns.';

  @override
  String get stepCrossGoal => 'The goal';

  @override
  String get stepCrossGoalBody =>
      'Hold yellow on top. The four white edges go around the white center on the bottom, each side color matching the center next to it.';

  @override
  String get stepCrossTop => 'Edge on top';

  @override
  String get stepCrossTopBody =>
      'Find a white edge on top. Turn the top until its side color sits above the matching center, then turn that face twice to drop it in.';

  @override
  String get stepCrossMiddle => 'Edge in the middle';

  @override
  String get stepCrossMiddleBody =>
      'An edge stuck in the middle layer goes up first: turn its side up, move the top out of the way and turn the side back, so the cross stays intact. Then place it from the top.';

  @override
  String get stepCornersInsert => 'Above its spot';

  @override
  String get stepCornersInsertBody =>
      'Turn the top until a white corner sits above the spot where its colors belong, at the front right. R U R\' U\' then drops it in.';

  @override
  String get stepCornersRepeat => 'Repeat the trigger';

  @override
  String get stepCornersRepeatBody =>
      'If white faces the wrong way, keep repeating R U R\' U\' over the same spot. Every corner is solved after at most five repeats.';

  @override
  String get stepMiddleRight => 'Edge to the right';

  @override
  String get stepMiddleRightBody =>
      'Line up a top edge with its center on the front. If its top color matches the right center, insert it with U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Edge to the left';

  @override
  String get stepMiddleLeftBody =>
      'If its top color matches the left center instead, use the mirror: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'One algorithm';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' turns a yellow dot into an L, an L into a line and a line into the cross. Hold the L at the back left and the line sideways.';

  @override
  String get stepYellowEdges => 'Match the edges';

  @override
  String get stepYellowEdgesBody =>
      'Turn the top until two edges match their centers. With one at the back and one on the right, R U R\' U R U2 R\' U swaps the other two.';

  @override
  String get stepPlaceCorners => 'Place them';

  @override
  String get stepPlaceCornersBody =>
      'Hold a corner that is already in its spot at the front right. U R U\' L\' U R\' U\' L moves the other three around; repeat until all four are home.';

  @override
  String get stepTwistCorners => 'Twist them';

  @override
  String get stepTwistCornersBody =>
      'With an unsolved corner at the front right, repeat R\' D\' R D until yellow is on top, then turn only the top to bring the next one. The bottom looks broken until the very end: keep going.';

  @override
  String get lessonCfopIntro => 'What is CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Four stages';

  @override
  String get stepCfopOverviewBody =>
      'Speedcubers solve the cross, then pair each first-layer corner with its middle edge (F2L), orient the last layer (OLL) and finally permute it (PLL).';

  @override
  String get stepCfopCross => 'Plan the cross';

  @override
  String get stepCfopCrossBody =>
      'In CFOP the cross is planned during inspection and built on the bottom in about eight moves.';

  @override
  String get lessonF2l => 'F2L basics';

  @override
  String get lessonF2lDesc => 'Pair a corner with its edge.';

  @override
  String get stepF2lRight => 'Insert a pair';

  @override
  String get stepF2lRightBody =>
      'When a corner and its edge sit side by side on top, bring them above their slot and insert them together.';

  @override
  String get stepF2lLeft => 'Left-hand pair';

  @override
  String get stepF2lLeftBody =>
      'The same case on the other side is the mirror, U\' L\' U L. Rotating the cube (y) lets you use whichever hand is easier.';

  @override
  String get lessonOll => 'Two-look OLL';

  @override
  String get lessonOllDesc => 'Make the top yellow.';

  @override
  String get stepOllCross => 'Edges first';

  @override
  String get stepOllCrossBody =>
      'Two-look OLL starts with the yellow-cross algorithm you already know.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'With one yellow corner facing up at the front left, Sune (R U R\' U R U2 R\') orients the other three. Most other cases use Sune and its mirror.';

  @override
  String get lessonPll => 'Two-look PLL';

  @override
  String get lessonPllDesc => 'Finish the cube.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'The T-perm swaps two corners and two edges. Use it to place the corners: hold the two corners that must swap on the right.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'With the corners done, the U-perm cycles three edges. Keep the finished side at the back.';

  @override
  String get lessonTwoFirst => '2×2 first layer';

  @override
  String get lessonTwoFirstDesc => 'Build one side with matching corners.';

  @override
  String get stepTwoIntro => 'Only corners';

  @override
  String get stepTwoIntroBody =>
      'A 2×2 is a 3×3 without edges and centers. Pick a color, build that face on the bottom, and make the side colors of neighbouring corners match.';

  @override
  String get stepTwoCorner => 'Insert corners';

  @override
  String get stepTwoCornerBody =>
      'Exactly like the 3×3 white corners: bring a corner above its spot and use R U R\' U\' until it fits.';

  @override
  String get lessonTwoOll => 'Orient the top';

  @override
  String get lessonTwoOllDesc => 'Ortega OLL with Sune.';

  @override
  String get stepTwoSune => 'Sune again';

  @override
  String get stepTwoSuneBody =>
      'Sune turns the top yellow on a 2×2 too. Ortega solvers learn seven short cases; Sune and its mirror cover most of them.';

  @override
  String get lessonTwoPbl => 'Permute both layers';

  @override
  String get lessonTwoPblDesc => 'Swap corners to finish.';

  @override
  String get stepTwoAdjacent => 'Adjacent swap';

  @override
  String get stepTwoAdjacentBody =>
      'When two neighbouring top corners must swap, hold them on the right and use the T-perm.';

  @override
  String get stepTwoDiagonal => 'Diagonal swap';

  @override
  String get stepTwoDiagonalBody =>
      'Two corners in opposite spots swap with the Y-perm.';

  @override
  String get lessonBigIntro => 'Big cube pieces';

  @override
  String get lessonBigIntroDesc => 'Centers, wings and slices.';

  @override
  String get stepBigPieces => 'No fixed centers';

  @override
  String get stepBigPiecesBody =>
      'On a 4×4 each face has four center pieces that move around, and every edge is made of two wings. Reduction groups them so the cube behaves like a 3×3.';

  @override
  String get stepBigSlices => 'Wide and inner turns';

  @override
  String get stepBigSlicesBody =>
      'Rw turns the two right layers together. 2R turns only the second layer from the right. These turns move centers and wings.';

  @override
  String get lessonBigCenters => 'Centers';

  @override
  String get lessonBigCentersDesc => 'Group the center pieces.';

  @override
  String get stepBigCenterCycle => 'A center 3-cycle';

  @override
  String get stepBigCenterCycleBody =>
      'This commutator moves exactly three center pieces and leaves everything else alone, so finished centers stay finished.';

  @override
  String get lessonBigEdges => 'Pair the edges';

  @override
  String get lessonBigEdgesDesc => 'Join wings into full edges.';

  @override
  String get stepBigEdgePair => 'Pair and restore';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' lines two matching wings up, R U R\' F R\' F\' R swaps in an unpaired edge, and Uw puts the centers back.';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => 'OLL and PLL parity on even cubes.';

  @override
  String get stepBigOllParity => 'OLL parity';

  @override
  String get stepBigOllParityBody =>
      'A single flipped edge can\'t happen on a 3×3. On even cubes this algorithm flips the top-front edge back. It may shuffle the rest of the top layer, which the last 3×3 steps fix anyway.';

  @override
  String get stepBigPllParity => 'PLL parity';

  @override
  String get stepBigPllParityBody =>
      'Two swapped edges at the very end? 2R2 U2 2R2 Uw2 2R2 Uw2 swaps the front and back top edges.';

  @override
  String get introGoalHeading => 'What\'s the goal?';

  @override
  String get introHowHeading => 'How do we do it?';

  @override
  String get introStart => 'Got it, start step by step';

  @override
  String get introShowGoal => 'Show the goal';

  @override
  String get introStateStart => 'Start';

  @override
  String get introStateGoal => 'Goal';

  @override
  String get introPlayMorph => 'Play from start to goal';

  @override
  String get introGoalBasics =>
      'Learn to read the cube: its pieces, its six faces and how the move letters turn them.';

  @override
  String get introGoalCross =>
      'Make a white plus sign where every white edge also matches the center color beside it.';

  @override
  String get introGoalCorners =>
      'Fill in the four white corners so the first crown, the whole white layer, is complete.';

  @override
  String get introGoalMiddle =>
      'Place the four middle-layer edges so the first two layers are solved.';

  @override
  String get introGoalYellowCross =>
      'Make a yellow plus sign on top; the side colors don\'t need to match yet.';

  @override
  String get introGoalYellowEdges =>
      'Line up every yellow cross edge with the center color on its side.';

  @override
  String get introGoalYellowCorners =>
      'Move every yellow corner to its own spot, even if it is still twisted.';

  @override
  String get introGoalTwistCorners =>
      'Twist the yellow corners the right way so the whole cube is solved.';

  @override
  String get introGoalCfopIntro =>
      'See the speedcubing plan: cross, first two layers, then the last layer in two looks.';

  @override
  String get introGoalF2l =>
      'Insert each white corner together with its middle edge, finishing two layers at once.';

  @override
  String get introGoalOll =>
      'Make the whole top face yellow with one or two algorithms.';

  @override
  String get introGoalPll =>
      'Move the last-layer pieces to their spots to finish the cube.';

  @override
  String get introGoalTwoFirst => 'Build one complete white layer on the 2×2.';

  @override
  String get introGoalTwoOll => 'Make the top face of the 2×2 all yellow.';

  @override
  String get introGoalTwoPbl =>
      'Swap the last corners into place to solve the 2×2.';

  @override
  String get introGoalBigIntro =>
      'Meet the 4×4: centers, edge pairs and corners, and the moves that turn them.';

  @override
  String get introGoalBigCenters =>
      'Gather each face\'s center pieces into one solid block of color.';

  @override
  String get introGoalBigEdges =>
      'Pair up matching edge pieces so every edge looks like a single 3×3 edge.';

  @override
  String get introGoalBigParity =>
      'Fix the two 4×4 cases a 3×3 never has: one flipped edge or two swapped edges.';

  @override
  String get introHowBasics =>
      'Centers never move, so they tell you each face\'s color.\nEach letter turns one face a quarter turn clockwise.\nAn apostrophe (\') turns it back; a 2 turns it twice.';

  @override
  String get introHowCross =>
      'Hold yellow on top: the white cross is built on the bottom.\nFind a white edge and line its side color up with the matching center.\nTurn that face twice to drop the edge into place.';

  @override
  String get introHowCorners =>
      'Bring a white corner above its empty spot.\nRepeat R U R\' U\' until it drops in the right way round.\nDo the same for the other three corners.';

  @override
  String get introHowMiddle =>
      'Find a top edge without yellow and match its front color to a center.\nSend it right or left with a short 8-move algorithm.\nThe white layer comes back intact every time.';

  @override
  String get introHowYellowCross =>
      'Look at the top: a dot, an L or a line.\nHold it as shown and do F R U R\' U\' F\'.\nRepeat until the yellow cross appears.';

  @override
  String get introHowYellowEdges =>
      'Turn the top until two edges match their centers.\nHold them at the back and right, then do R U R\' U R U2 R\' U.\nRepeat until all four edges match.';

  @override
  String get introHowYellowCorners =>
      'A corner is in its spot when its colors match the three faces around it.\nKeep a placed corner at the front right.\nU R U\' L\' U R\' U\' L cycles the other three until they all fit.';

  @override
  String get introHowTwistCorners =>
      'Hold an unsolved corner at the front right.\nRepeat R\' D\' R D until its yellow faces up.\nTurn only the top for the next one; the bottom fixes itself at the end.';

  @override
  String get introHowCfopIntro =>
      'Cross: four edges, planned during inspection.\nF2L: each corner goes in together with its edge.\nOLL makes the top yellow, then PLL moves the pieces home.';

  @override
  String get introHowF2l =>
      'Find a corner and its matching edge in the top layer.\nPair them up above their slot.\nDrop the pair in with three or four moves.';

  @override
  String get introHowOll =>
      'First the yellow cross with F R U R\' U\' F\'.\nThen orient the corners, for example with Sune.\nRecognize the case by the yellow you see.';

  @override
  String get introHowPll =>
      'The top is already all yellow.\nThe T-perm swaps corners; the U-perm cycles three edges.\nRead the side colors to choose the algorithm.';

  @override
  String get introHowTwoFirst =>
      'A 2×2 is only corners, like a 3×3 without edges.\nBring each white corner above its spot.\nRepeat R U R\' U\' until it drops in.';

  @override
  String get introHowTwoOll =>
      'Keep the white layer at the bottom.\nSune (R U R\' U R U2 R\') twists the top corners.\nRepeat from the right angle until the top is all yellow.';

  @override
  String get introHowTwoPbl =>
      'Look for a side where two corners already match.\nAdjacent swap: one T-perm style algorithm.\nDiagonal swap: one longer algorithm.';

  @override
  String get introHowBigIntro =>
      'No center is fixed: four center pieces make up each face color.\nWide moves like Rw turn two layers at once.\nInner moves like 2R turn just one inner slice.';

  @override
  String get introHowBigCenters =>
      'Build two opposite centers first.\nInner slices swap center pieces without breaking finished ones.\nFinish the last four centers the same way.';

  @override
  String get introHowBigEdges =>
      'Find two edge pieces with the same colors.\nLine them up side by side with an inner slice.\nPut the pair away and bring the centers back.';

  @override
  String get introHowBigParity =>
      'Solve the 4×4 like a 3×3 until it gets stuck.\nOne flipped edge: the long OLL parity algorithm.\nTwo swapped edges: 2R2 U2 2R2 Uw2 2R2 Uw2.';
}
