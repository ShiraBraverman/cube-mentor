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
  String get solveModeGuided => 'Guided (3 layers)';

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
  String get phaseLblCorners => 'First layer corners';

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
  String get crownFirst => 'First layer';

  @override
  String get crownSecond => 'Second layer';

  @override
  String get crownThird => 'Third layer';

  @override
  String get crownFirstGoal => 'White face and first layer';

  @override
  String get crownSecondGoal => 'Middle layer';

  @override
  String get crownThirdGoal => 'Yellow face and last layer';

  @override
  String get subStepGoal11 =>
      'Form a white cross where every white edge also matches the center color beside it.';

  @override
  String get subStepGoal12 =>
      'Insert the 4 white corners into their matching slots to finish the white face and the whole first layer.';

  @override
  String get subStepGoal21 =>
      'Insert the 4 middle-layer edges without disturbing the first layer.';

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
  String explainLblDaisyPetal(String piece) {
    return 'Daisy: bring the $piece edge up around the yellow center, white facing up, as a petal.';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return 'Turn the top layer until the $piece petal sits right above the center of its side color.';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return 'Turn that face twice (180°) to drop the $piece edge onto the white center: one more arm of the white cross.';
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
  String lessonPartOf(int index, int total) {
    return 'Part $index of $total';
  }

  @override
  String get lessonNext => 'Next';

  @override
  String get lessonPrevious => 'Previous';

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
      'Your turn: swipe the layer the arrow shows, or tap Next.';

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
  String get trackBeginner => 'Beginner 3×3: layer by layer';

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
  String get timerInspectionToggle => '15 s inspection';

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
      'Hold yellow on top and green facing you. First gather the four white edges around the yellow center, white facing up, like petals: that\'s the daisy. Then each petal goes down to the white center, its side color matching the center beside it.';

  @override
  String get stepCrossTop => 'Edge on top';

  @override
  String get stepCrossTopBody =>
      'A white edge on top with white facing up is a daisy petal. Turn the top until its side color sits right above the center of the same color, then turn that face twice (180°) to drop it onto the white center.';

  @override
  String get stepCrossMiddle => 'Edge in the middle';

  @override
  String get stepCrossMiddleBody =>
      'An edge stuck in the middle layer goes up first: turn its side up, move the top out of the way and turn the side back, so placed pieces stay put. Now it\'s a petal on top: line it up and turn that face twice.';

  @override
  String get stepCornersInsert => 'Above its spot';

  @override
  String get stepCornersInsertBody =>
      'Turn the top until the white corner sits right above its slot, between the two centers that match its side colors. Here one top turn and R U\' R\' are enough: U brings the corner over its slot and R U\' R\' tucks it in, white facing down.';

  @override
  String get stepCornersRepeat => 'Repeat the trigger';

  @override
  String get stepCornersRepeatBody =>
      'Hold the slot at the front right and repeat R U R\' U\' until white faces down: once if white faces right, three times if it faces up, five times if it faces you. The top looks messy meanwhile; it sorts itself out.';

  @override
  String get stepMiddleRight => 'Edge to the right';

  @override
  String get stepMiddleRightBody =>
      'Find a top edge with no yellow on it. Turn the top until its front color matches the center facing you. If its top color matches the right center, send it right: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Edge to the left';

  @override
  String get stepMiddleLeftBody =>
      'If its top color matches the left center instead, use the mirror: U\' L\' U L U F U\' F\'. The white layer comes back whole every time.';

  @override
  String get stepYellowCross => 'One algorithm';

  @override
  String get stepYellowCrossBody =>
      'Look only at the yellow edges on top. Hold an L at the back left and a line from left to right, then do F R U R\' U\' F\'. A line needs it once, an L twice, a dot up to three times.';

  @override
  String get stepYellowEdges => 'Match the edges';

  @override
  String get stepYellowEdgesBody =>
      'Turn the top until two edges match their side centers. With one at the back and one on the right, R U R\' U R U2 R\' U swaps the front and left edges.';

  @override
  String get stepPlaceCorners => 'Place them';

  @override
  String get stepPlaceCornersBody =>
      'A corner is home when its colors match the three centers around it, even if it\'s twisted. Hold a home corner at the front right: U R U\' L\' U R\' U\' L moves the other three around. Repeat until all four are home.';

  @override
  String get stepTwistCorners => 'Twist them';

  @override
  String get stepTwistCornersBody =>
      'With an unsolved corner at the front right, repeat R\' D\' R D in pairs until yellow is on top, then turn only the top to bring the next one. The bottom looks broken until the very last corner: keep going.';

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
      'A 2×2 is only eight corners: no edges, no centers. Build the white layer on the bottom so neighbouring side colors match, then finish on one route: Sune for a yellow top, then the T-perm or Y-perm.';

  @override
  String get stepTwoCorner => 'Insert corners';

  @override
  String get stepTwoCornerBody =>
      'Like the 3×3 white corners: bring a corner above its empty slot at the front right and tuck it in, with U R U\' R\' here or by repeating R U R\' U\' until white faces down. Check its side colors against its neighbour.';

  @override
  String get lessonTwoOll => 'Orient the top';

  @override
  String get lessonTwoOllDesc => 'Ortega OLL with Sune.';

  @override
  String get stepTwoSune => 'Sune again';

  @override
  String get stepTwoSuneBody =>
      'Count the yellow stickers facing up. Hold the one yellow-up corner at the front left and do Sune (R U R\' U R U2 R\'). Count again and re-hold; it takes three Sunes at most. Turn only the top between them.';

  @override
  String get lessonTwoPbl => 'Permute both layers';

  @override
  String get lessonTwoPblDesc => 'Swap corners to finish.';

  @override
  String get stepTwoAdjacent => 'Adjacent swap';

  @override
  String get stepTwoAdjacentBody =>
      'Headlights are two matching top stickers on one side. Turn the top until the headlights are on the left, so the two corners to swap are on the right, then do the T-perm.';

  @override
  String get stepTwoDiagonal => 'Diagonal swap';

  @override
  String get stepTwoDiagonalBody =>
      'No headlights anywhere means two diagonal corners must swap: do the Y-perm from any side, then turn the top to line everything up.';

  @override
  String get lessonBigIntro => 'Big cube pieces';

  @override
  String get lessonBigIntroDesc => 'Centers, wings and slices.';

  @override
  String get stepBigPieces => 'No fixed centers';

  @override
  String get stepBigPiecesBody =>
      'On a 4×4 each face has four center pieces that move around, and every edge is two wings. No center is fixed, so check the color order on a corner: white opposite yellow, blue opposite green, red opposite orange.';

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
      'This commutator moves exactly three center pieces and leaves everything else alone, so finished centers stay finished. Use it when one stray piece won\'t join a bar.';

  @override
  String get lessonBigEdges => 'Pair the edges';

  @override
  String get lessonBigEdgesDesc => 'Join wings into full edges.';

  @override
  String get stepBigEdgePair => 'Pair and restore';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' lines up two matching wings, R U R\' F R\' F\' R swaps in an unpaired edge, and Uw brings the centers back. Always close a slice you opened.';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => 'OLL and PLL parity on even cubes.';

  @override
  String get stepBigOllParity => 'OLL parity';

  @override
  String get stepBigOllParityBody =>
      'A single flipped edge can\'t happen on a 3×3: it\'s OLL parity, not a mistake. Keep it at the front of the top layer and play the long algorithm. It also swaps the left and right top edges and two corners; the last 3×3 steps fix those.';

  @override
  String get stepBigPllParity => 'PLL parity';

  @override
  String get stepBigPllParityBody =>
      'Two swapped edges at the very end, and no 3×3 algorithm fits? That\'s PLL parity. Hold them at the front and back of the top layer: 2R2 U2 2R2 Uw2 2R2 2U2 swaps them.';

  @override
  String get introGoalHeading => 'What\'s the goal?';

  @override
  String get introHowHeading => 'How do we do it?';

  @override
  String get introHoldHeading => 'How to hold it';

  @override
  String get introWhyHeading => 'Why it works';

  @override
  String get introStart => 'Got it, start step by step';

  @override
  String get introDontShowAgain => 'Don\'t show automatically again';

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
      'Make a white plus sign on the bottom where every white edge also matches the center color beside it.';

  @override
  String get introGoalCorners =>
      'Fill in the four white corners so the whole first layer is done: a white face with matching side colors.';

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
      'Put the last corners home with one T-perm or Y-perm, then line up the top to solve the 2×2.';

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
      'Fix the two 4×4 cases a 3×3 never has: one flipped edge (OLL parity) or two swapped edges (PLL parity).';

  @override
  String get introHowBasics =>
      'Centers never move, so they tell you each face\'s color.\nEach letter turns one face a quarter turn clockwise.\nAn apostrophe (\') turns it back; a 2 turns it twice.';

  @override
  String get introHoldBasics =>
      'Any way you like: the centers stay in place, so the colors always tell you which face is which.';

  @override
  String get introWhyBasics =>
      'Every algorithm is just these letters in a row, so reading them is the first skill.';

  @override
  String get introHowCross =>
      'Bring each white edge to the top, white facing up, around the yellow center: that\'s the daisy.\nTurn the top until a petal\'s side color sits above its matching center.\nTurn that face twice to drop it down; repeat for all four.';

  @override
  String get introHoldCross =>
      'Yellow center on top, white center on the bottom, for the whole step. Turn the top layer, not the cube, to line up a petal.';

  @override
  String get introWhyCross =>
      'With white facing up on top, two turns of the front face land the edge on the white center, white facing down, already matching its side.';

  @override
  String get introHowCorners =>
      'Turn the top until a white corner sits above its empty slot, and hold that slot at the front right.\nRepeat R U R\' U\': once if white faces right, three times if it faces up, five if it faces you.\nDo the same for the other three corners.';

  @override
  String get introHoldCorners =>
      'White on the bottom, yellow on top. The corner sits at the front right, directly above its slot.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' lifts the slot and puts it back: each round twists the corner a little until white faces down, and the cross is never broken.';

  @override
  String get introHowMiddle =>
      'Find a top edge with no yellow on it and match its front color to the center below.\nIts top color says where it goes: right or left.\nSend it with the 8-move insert; the white layer comes back every time.';

  @override
  String get introHoldMiddle =>
      'White on the bottom, yellow on top. The edge sits on the front, its front color matching the center below it.';

  @override
  String get introWhyMiddle =>
      'The insert lifts the slot out of the way, slides the edge in and brings the white layer back. An edge with yellow belongs on top, never in the middle.';

  @override
  String get introHowYellowCross =>
      'Look only at the yellow edges on top: a dot, an L or a line.\nHold the L at the back left, the line from left to right, and do F R U R\' U\' F\'.\nA line needs it once, an L twice, a dot up to three times.';

  @override
  String get introHoldYellowCross =>
      'White on the bottom, yellow on top. An L at the back left, a line from left to right; a dot any way.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' flips two top edges up at a time without touching the first two layers.';

  @override
  String get introHowYellowEdges =>
      'Turn the top until two edges match their side centers.\nHold them at the back and on the right, then do R U R\' U R U2 R\' U.\nIf the matched edges are opposite, do it once from any side first.';

  @override
  String get introHoldYellowEdges =>
      'Yellow on top. One matched edge at the back and the other on the right.';

  @override
  String get introWhyYellowEdges =>
      'This algorithm only moves top pieces, so the first two layers always come back.';

  @override
  String get introHowYellowCorners =>
      'A corner is home when its colors match the three centers around it, even if twisted.\nKeep a home corner at the front right.\nU R U\' L\' U R\' U\' L cycles the other three; repeat until all four fit.';

  @override
  String get introHoldYellowCorners =>
      'Yellow on top. A corner that is already home at the front right; if none is, any corner.';

  @override
  String get introWhyYellowCorners =>
      'It moves three corners in a circle and leaves the one at the front right in place, so every repeat brings more corners home.';

  @override
  String get introHowTwistCorners =>
      'Hold an unsolved corner at the front right.\nRepeat R\' D\' R D in pairs until its yellow faces up.\nTurn only the top for the next one; the bottom comes back with the last corner.';

  @override
  String get introHoldTwistCorners =>
      'Yellow on top, the corner to twist at the front right. Between corners turn only the top, never the whole cube.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D twists the corner and scrambles the bottom, but the bottom returns once every corner is twisted. Stopping halfway leaves it broken.';

  @override
  String get introHowCfopIntro =>
      'Cross: four edges, planned during inspection.\nF2L: each corner goes in together with its edge.\nOLL makes the top yellow, then PLL moves the pieces home.';

  @override
  String get introHoldCfopIntro =>
      'Speedcubers build the cross on the bottom, so they can look ahead at the next pieces while they turn.';

  @override
  String get introWhyCfopIntro =>
      'Solving a corner and its edge together saves many moves, and recognizing cases replaces trial and error.';

  @override
  String get introHowF2l =>
      'Find a corner and its matching edge in the top layer.\nPair them up above their slot.\nDrop the pair in with three or four moves.';

  @override
  String get introHoldF2l =>
      'Cross on the bottom. The pair\'s slot at the front right, or the front left for the mirror.';

  @override
  String get introWhyF2l =>
      'A paired corner and edge drop in together, so two layers grow at once instead of one piece at a time.';

  @override
  String get introHowOll =>
      'First the yellow cross with F R U R\' U\' F\'.\nThen orient the corners, for example with Sune.\nRecognize the case by the yellow you see.';

  @override
  String get introHoldOll =>
      'Yellow on top. For Sune, the one corner with yellow facing up goes at the front left.';

  @override
  String get introWhyOll =>
      'Splitting the last layer into orient first, then permute keeps the number of algorithms small.';

  @override
  String get introHowPll =>
      'The top is already all yellow.\nThe T-perm swaps corners; the U-perm cycles three edges.\nRead the side colors to choose the algorithm.';

  @override
  String get introHoldPll =>
      'Yellow on top. T-perm: headlights on the left. U-perm: the finished side at the back.';

  @override
  String get introWhyPll =>
      'Once the top is all yellow, only the pieces\' places are wrong, and a few swaps finish the cube.';

  @override
  String get introHowTwoFirst =>
      'Pick a white corner as your anchor, white facing down.\nBring each next corner above its slot at the front right.\nRepeat R U R\' U\' until it drops in with matching side colors.';

  @override
  String get introHoldTwoFirst =>
      'White on the bottom. The empty slot at the front right, its corner right above it on the top layer.';

  @override
  String get introWhyTwoFirst =>
      'A 2×2 has no centers: the first corner you place sets the colors of its neighbours, so side colors matter, not only white.';

  @override
  String get introHowTwoOll =>
      'Count the corners with yellow facing up.\nWith one up, hold it at the front left and do Sune: R U R\' U R U2 R\'.\nCount again and repeat; three Sunes at most.';

  @override
  String get introHoldTwoOll =>
      'White on the bottom, yellow on top. The corner with yellow up at the front left before each Sune.';

  @override
  String get introWhyTwoOll =>
      'Sune twists the top corners without breaking the white layer; recounting each time tells you how to hold it next.';

  @override
  String get introHowTwoPbl =>
      'Look for headlights: two matching top stickers on one side.\nHeadlights on one side: hold them on the left and do the T-perm.\nNo headlights: do the Y-perm from any side, then line up the top.';

  @override
  String get introHoldTwoPbl =>
      'White on the bottom, yellow on top. T-perm: headlights on the left. Y-perm: any side facing you.';

  @override
  String get introWhyTwoPbl =>
      'With the top yellow, only the corners\' places are wrong: the T-perm swaps two neighbours, the Y-perm two diagonals.';

  @override
  String get introHowBigIntro =>
      'No center is fixed: four center pieces make up each face color.\nWide moves like Rw turn two layers at once.\nInner moves like 2R turn just one inner slice.';

  @override
  String get introHoldBigIntro =>
      'Any way you like at first: on a 4×4 no center is fixed, so you choose where each color goes.';

  @override
  String get introWhyBigIntro =>
      'Reduction groups centers and edge pieces so the big cube can be solved like a 3×3.';

  @override
  String get introHowBigCenters =>
      'Check the color order from a corner first.\nBuild two opposite centers, then the other four.\nInner slices move center pieces; always undo a slice you opened.';

  @override
  String get introHoldBigCenters =>
      'The face you are building in front, finished centers out of the way on the left and right.';

  @override
  String get introWhyBigCenters =>
      'A slice moves centers, and undoing it restores the finished ones, so only the piece you aimed for changes.';

  @override
  String get introHowBigEdges =>
      'Find the two wings with the same two colors.\nLine them up on the front and join them with Uw\'.\nSwap in an unpaired edge, then Uw brings the centers back.';

  @override
  String get introHoldBigEdges =>
      'The edge you are pairing in the front layers; finished edges parked in the top and bottom layers.';

  @override
  String get introWhyBigEdges =>
      'Uw\' moves the centers aside so two wings can meet; Uw puts the centers back, keeping your work.';

  @override
  String get introHowBigParity =>
      'Solve the 4×4 like a 3×3 until it gets stuck.\nOne flipped edge: the long OLL parity algorithm.\nTwo swapped edges: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'The last layer on top. OLL parity: the flipped edge at the front. PLL parity: the swapped edges at the front and back.';

  @override
  String get introWhyBigParity =>
      'Edge wings can end up in states a 3×3 can\'t reach; these algorithms turn inner layers to undo exactly that.';

  @override
  String get dirFaceR => 'Right side';

  @override
  String get dirFaceL => 'Left side';

  @override
  String get dirFaceU => 'Top row';

  @override
  String get dirFaceD => 'Bottom row';

  @override
  String get dirFaceF => 'Front face';

  @override
  String get dirFaceB => 'Back face';

  @override
  String get dirMiddle => 'Middle slice';

  @override
  String get dirWholeCube => 'Whole cube';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, layer $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth layers deep';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, layers $near–$far';
  }

  @override
  String get dirUp => 'Up';

  @override
  String get dirDown => 'Down';

  @override
  String get dirLeft => 'Left';

  @override
  String get dirRight => 'Right';

  @override
  String get dirClockwise => 'Clockwise';

  @override
  String get dirCounter => 'Counter-clockwise';

  @override
  String get dirBackClockwise => 'Clockwise, seen from behind';

  @override
  String get dirBackCounter => 'Counter-clockwise, seen from behind';

  @override
  String get dirHalf => 'Double turn (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Hide details';

  @override
  String get solveExpand => 'Show details';

  @override
  String get dailyScrambleSteps => 'Scramble step by step';

  @override
  String get dailyScrambleGuide => '3D scramble guide';

  @override
  String get dailyShowMoves => 'Show text moves';

  @override
  String get dailyHideMoves => 'Hide text moves';

  @override
  String get dailyScrambleGuideTitle => 'Scramble guide';

  @override
  String get phaseDailyScramble => 'Scramble today\'s cube';

  @override
  String get explainDailyScramble =>
      'Start from a solved cube, white on top and green in front, and copy each turn on your real cube.';

  @override
  String get stageCenters => 'Build center blocks';

  @override
  String get stageEdges => 'Pair outer & inner edges';

  @override
  String get stageParity => 'Parity resolution';

  @override
  String get stageCrown1 => 'First layer (white)';

  @override
  String get stageCrown2 => 'Second layer';

  @override
  String get stageCrown3 => 'Third layer (yellow)';

  @override
  String get stageOrient => 'Orient the pieces';

  @override
  String get stageFinish => 'Finish the cube';

  @override
  String get stageAsThree => 'Solve as a 3×3';

  @override
  String get stageTwoByTwo => 'Solve the 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Stage $number of $total: $title';
  }

  @override
  String get solveAllStagesDone => 'Every stage complete. Well done!';

  @override
  String get trackFiveByFive => '5×5 Professor\'s Cube';

  @override
  String get trackSixBySix => '6×6 cube';

  @override
  String get lessonFiveIntro => 'Meet the 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Fixed middles, center bars, middle edges and wings.';

  @override
  String get introGoalFiveIntro =>
      'Get to know the 5×5: fixed middles, center bars, middle edges and wings.';

  @override
  String get introHowFiveIntro =>
      'The very middle of each face never moves.\nEach edge is a middle piece with two wings.\nInner slices move pieces without touching the outside.';

  @override
  String get introHoldFiveIntro =>
      'Any way you like: on a 5×5 the very middle of each face never moves, so it shows that face\'s color.';

  @override
  String get introWhyFiveIntro =>
      'Fixed middles set the color scheme, so the centers can\'t be built in the wrong order.';

  @override
  String get lessonFiveCenters => '5×5 centers';

  @override
  String get lessonFiveCentersDesc => 'Build each center from bars of three.';

  @override
  String get introGoalFiveCenters =>
      'Build every face\'s 3×3 block of center pieces in one color.';

  @override
  String get introHowFiveCenters =>
      'Start from the fixed middle piece: it sets the color.\nBuild bars of three and slide them in with an inner slice.\nThe move that brings a bar in also restores the finished center.';

  @override
  String get introHoldFiveCenters =>
      'The center you are building in front or on top; finished centers on the bottom, left or right, out of the way.';

  @override
  String get introWhyFiveCenters =>
      'Slice in, turn the top, slice back: the slice that brings the bar in also restores the finished centers.';

  @override
  String get lessonFiveEdges => '5×5 edges';

  @override
  String get lessonFiveEdgesDesc => 'Join two wings to their middle edge.';

  @override
  String get introGoalFiveEdges =>
      'Join each middle edge with its two wings so all 12 edges look like single pieces.';

  @override
  String get introHowFiveEdges =>
      'Match each wing to its middle edge on the front.\nTurn the inner layer, swap in an unsolved edge, turn it back.\nFor the last edges, use slice, flip, slice.';

  @override
  String get introHoldFiveEdges =>
      'The edge you are building at the front; finished edges stored in the top and bottom layers.';

  @override
  String get introWhyFiveEdges =>
      'Opening and closing the inner slice joins wings while centers and stored edges come back.';

  @override
  String get lessonFiveSolve => 'Solve the 5×5 as a 3×3';

  @override
  String get lessonFiveSolveDesc => 'Finish layer by layer, like a 3×3.';

  @override
  String get introGoalFiveSolve =>
      'Solve the reduced 5×5 like a 3×3, layer by layer, with outer turns only.';

  @override
  String get introHowFiveSolve =>
      'Only outer turns from now on, or paired edges split apart.\nWhite cross and corners, the middle layer, then the yellow layer.\nThe fixed middles show each face\'s color.';

  @override
  String get introHoldFiveSolve =>
      'The first layer\'s color on the bottom, exactly as on a 3×3; the corner to insert at the front right.';

  @override
  String get introWhyFiveSolve =>
      'Inner turns would split centers and edges again; outer turns treat each block as one 3×3 piece.';

  @override
  String get lessonFiveParity => '5×5 edge parity';

  @override
  String get lessonFiveParityDesc => 'Fix the edge whose wings are swapped.';

  @override
  String get introGoalFiveParity =>
      'Fix the one edge whose two outer wings are swapped: the only parity a 5×5 has.';

  @override
  String get introHowFiveParity =>
      'It shows up as one last edge that looks flipped.\nPlay the long inner-slice fix once.\nThere is no PLL parity on a 5×5.';

  @override
  String get introHoldFiveParity =>
      'The last layer on top, the edge with swapped wings at the front of the top layer.';

  @override
  String get introWhyFiveParity =>
      'Only the two outer wings of one edge can swap on a 5×5, so a single algorithm covers it.';

  @override
  String get lessonSixIntro => 'Meet the 6×6';

  @override
  String get lessonSixIntroDesc =>
      'No fixed centers and four pieces in every edge.';

  @override
  String get introGoalSixIntro =>
      'Get to know the 6×6: sixteen center pieces per face and four pieces per edge.';

  @override
  String get introHowSixIntro =>
      'No center is fixed: you choose the colors as you build.\nEach edge has outer and inner wings.\nWide turns can move up to three layers.';

  @override
  String get introHoldSixIntro =>
      'Any way you like at first: like a 4×4, a 6×6 has no fixed center.';

  @override
  String get introWhySixIntro =>
      'If you can solve a 4×4 and a 5×5, the 6×6 is the same reduction with bigger blocks.';

  @override
  String get lessonSixCenters => '6×6 centers';

  @override
  String get lessonSixCentersDesc => 'Build 4×4 centers from bars of four.';

  @override
  String get introGoalSixCenters =>
      'Build every face\'s 4×4 center block in one solid color.';

  @override
  String get introHowSixCenters =>
      'Check the color order from a corner first: no center is fixed.\nBuild bars of four and slide them together.\nFor the last two centers, move single pieces with slice, top, undo.';

  @override
  String get introHoldSixCenters =>
      'The face you are building in front, finished centers on the left, right or bottom.';

  @override
  String get introWhySixCenters =>
      'Bars join with inner slices, and every slice is undone, so finished centers stay whole.';

  @override
  String get lessonSixEdges => '6×6 edges';

  @override
  String get lessonSixEdgesDesc => 'Gather the four pieces of every edge.';

  @override
  String get introGoalSixEdges =>
      'Gather the four pieces of each edge so the 6×6 has 12 clean edges.';

  @override
  String get introHowSixEdges =>
      'Line up the outer and inner wings of one edge on the front.\nThe deep wide layer brings an edge in and out.\nNever break a finished edge to free a piece.';

  @override
  String get introHoldSixEdges =>
      'The edge you are building at the front; finished edges parked in the top and bottom layers.';

  @override
  String get introWhySixEdges =>
      'The deep wide turn moves centers aside so wings can meet, then brings them back.';

  @override
  String get lessonSixSolve => 'Solve the 6×6 as a 3×3';

  @override
  String get lessonSixSolveDesc => 'Finish layer by layer, like a 3×3.';

  @override
  String get introGoalSixSolve =>
      'Solve the reduced 6×6 like a 3×3, layer by layer, with outer turns only.';

  @override
  String get introHowSixSolve =>
      'Only outer turns from now on: a slice would split a center or an edge.\nThe centers you built show each face\'s color.\nWhite cross and corners, the middle layer, then the yellow layer.';

  @override
  String get introHoldSixSolve =>
      'The first layer\'s color on the bottom, exactly as on a 3×3; the corner to insert at the front right.';

  @override
  String get introWhySixSolve =>
      'Outer turns move each 4×4 center and each edge as one piece, just like on a 3×3.';

  @override
  String get lessonSixParity => '6×6 parity';

  @override
  String get lessonSixParityDesc => 'One flipped edge or two swapped edges.';

  @override
  String get introGoalSixParity =>
      'Fix the two 6×6 cases a 3×3 never has: one flipped edge or two swapped edges.';

  @override
  String get introHowSixParity =>
      'Solve like a 3×3 until it gets stuck.\nOne flipped edge: the long parity fix with 3Rw.\nTwo swapped edges: the short fix of inner double turns.';

  @override
  String get introHoldSixParity =>
      'The last layer on top. The flipped edge at the front; for two swapped edges, the front and back.';

  @override
  String get introWhySixParity =>
      'Like a 4×4, a 6×6 can end with one flipped or two swapped edges; inner-layer algorithms fix them and leave the rest alone.';

  @override
  String get stepFivePieces => 'The pieces of a 5×5';

  @override
  String get stepFivePiecesBody =>
      'The very middle piece of each face never moves, so the color scheme can\'t come out wrong. Around it sit eight center pieces: corner centers and edge centers never swap types. Each edge is a middle piece with two wings.';

  @override
  String get stepFiveSlices => 'Three kinds of turns';

  @override
  String get stepFiveSlicesBody =>
      'Outer turns move one face. Wide turns move a face with the layer behind it. Inner slice turns move only a layer inside: that is how pieces change place without touching the outside.';

  @override
  String get stepFiveCenterBar => 'Center bars';

  @override
  String get stepFiveCenterBarBody =>
      'Build a row of three matching center pieces, slide it in with an inner slice, turn the top and slide back: the move that brings the bar in also restores the finished center. Three bars make a center.';

  @override
  String get stepFiveCenterSwap => 'Swap without breaking';

  @override
  String get stepFiveCenterSwapBody =>
      'To move a single center piece: turn an inner slice, turn the top, undo the slice, turn the top back. Finished centers are restored every time.';

  @override
  String get stepFiveEdgePair => 'Pair wings with a middle edge';

  @override
  String get stepFiveEdgePairBody =>
      'Line up a wing beside its matching middle edge on the front, turn the inner layer down, swap in an unsolved edge with a short trigger, then turn the inner layer back.';

  @override
  String get stepFiveEdgeLast => 'The last edges';

  @override
  String get stepFiveEdgeLastBody =>
      'With no free edge left to swap in, use slice, flip, slice: a wide turn, a short trigger and the wide turn back pair the last edges without breaking finished ones.';

  @override
  String get stepFiveAsThree => 'Now it is a 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'With centers and edges done, the 5×5 behaves like a big 3×3. Use only outer turns and go layer by layer: white cross and corners, the middle layer, then the yellow layer. A 5×5 has no PLL parity.';

  @override
  String get stepFiveEdgeParity => 'Swap the last edge\'s wings';

  @override
  String get stepFiveEdgeParityBody =>
      'Sometimes the last edge has its two outer wings swapped, so it looks flipped: the 5×5\'s only parity. Hold it at the front of the top layer and play the inner-slice algorithm once; everything else returns to its place.';

  @override
  String get stepSixPieces => 'The pieces of a 6×6';

  @override
  String get stepSixPiecesBody =>
      'Like a 4×4, a 6×6 has no fixed center: sixteen center pieces make up each face color, so check the color order on a corner first. Each edge has four wings: two outer and two inner.';

  @override
  String get stepSixSlices => 'Turning deeper layers';

  @override
  String get stepSixSlicesBody =>
      'Wide turns can move two or three layers from a face. Inner slices on the second or third layer are the tools for centers and edges.';

  @override
  String get stepSixCenterBar => 'Bars of four';

  @override
  String get stepSixCenterBarBody =>
      'Build rows of four matching center pieces and slide them next to each other with inner slice turns, undoing each slice, until the face is one solid 4×4 block.';

  @override
  String get stepSixCenterSwap => 'Move one piece at a time';

  @override
  String get stepSixCenterSwapBody =>
      'Turn the third layer, turn the top, undo, turn back: one center piece moves while finished centers come back. Use it for the last two centers, when no bar fits.';

  @override
  String get stepSixEdgePair => 'Four pieces, one edge';

  @override
  String get stepSixEdgePairBody =>
      'Collect the four wings of an edge on the front with the deep wide layer, swap in an unsolved edge with a short trigger, then turn the wide layer back.';

  @override
  String get stepSixEdgeLast => 'The last edges';

  @override
  String get stepSixEdgeLastBody =>
      'Pair the final edges with a short trigger between a deep wide turn and its undo, so finished edges stay paired. Never break a finished edge to free a piece.';

  @override
  String get stepSixAsThree => 'Now it is a 3×3';

  @override
  String get stepSixAsThreeBody =>
      'With 4×4 centers and paired edges, solve the 6×6 like a 3×3, layer by layer, with outer turns only. One flipped or two swapped edges at the end is parity, not a mistake.';

  @override
  String get stepSixOllParity => 'One flipped edge';

  @override
  String get stepSixOllParityBody =>
      'A single edge that looks flipped in the last layer is parity. Hold it at the front of the top layer and play the long fix: it flips all four wings, also swaps the left and right top edges, and leaves the first two layers untouched.';

  @override
  String get stepSixPllParity => 'Two swapped edges';

  @override
  String get stepSixPllParityBody =>
      'If two edges look swapped at the very end, hold them at the front and back of the top layer and play the short fix of inner double turns: all four wings of both edges trade places.';

  @override
  String get stepSixWingRule => 'Four wings or two?';

  @override
  String get stepSixWingRuleBody =>
      'A 6×6 edge is made of 4 wings. Before fixing an edge that looks flipped, look closely: if all 4 wings are flipped, use the standard 3-layer OLL parity; if only the 2 inner wings are flipped, use inner-wing parity. The cube shows the inner-wing case.';

  @override
  String get stepSixInnerWingParity => 'Two inner wings flipped';

  @override
  String get stepSixInnerWingParityBody =>
      'Here the outer wings of the front top edge are fine and only the 2 inner wings are flipped. Keep that edge at the front of the top layer and turn only the third slices (3R, 3L): the inner wings flip back and the rest of the cube stays solved.';

  @override
  String get stageTwoFirstLayer => 'Build the bottom layer';

  @override
  String get stageTwoTopColor => 'Make the top one color';

  @override
  String get stageTwoFinish => 'Finish the corners';

  @override
  String get explainTwoFirstLayer =>
      'Complete the bottom layer: its four corners match each other and the side colors.';

  @override
  String get explainTwoTopColor =>
      'Turn the top until all four top stickers show the same color, keeping the bottom layer.';

  @override
  String get explainTwoFinish =>
      'Move the last corners into place to finish the cube.';

  @override
  String get tabSolve => 'Solve';

  @override
  String get tabScan => 'Scan';

  @override
  String get tabAcademy => 'Academy';

  @override
  String get tabTrain => 'Train';

  @override
  String get openCubeSolver => 'Open 3D Cube & Solver';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Training';

  @override
  String get trainSubtitle => 'Sharpen your skills every day.';

  @override
  String get settings => 'Settings';

  @override
  String get settingsSoundHaptics => 'Sound & haptics';

  @override
  String get settingsSoundHapticsDesc =>
      'Clicks and vibrations when you turn the cube.';

  @override
  String get settingsAnimationSpeed => 'Default animation speed';

  @override
  String get settingsAnimationSpeedDesc =>
      'How fast the cube turns when moves play.';

  @override
  String get settingsResetProgress => 'Reset progress';

  @override
  String get settingsResetProgressDesc =>
      'Clear finished Academy lessons and your daily streak.';

  @override
  String get resetProgressTitle => 'Reset all progress?';

  @override
  String get resetProgressBody =>
      'Your finished lessons and your daily streak will be erased. This cannot be undone.';

  @override
  String get resetProgressDone => 'Progress reset.';

  @override
  String get cancel => 'Cancel';

  @override
  String get settingsPrivacyAds => 'Privacy & ads';

  @override
  String get settingsPrivacyAdsDesc =>
      'Review or change your ad consent choices.';

  @override
  String get playbackPrevious => 'Previous';

  @override
  String get playbackNext => 'Next';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Solved in $count moves!',
      one: 'Solved in 1 move!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Shape the Next Version';

  @override
  String get feedbackBody =>
      'Want to suggest a feature or influence the next version of CubeMentor? Write to us at:';

  @override
  String get feedbackEmailCopied =>
      'No email app found, so we copied the address to your clipboard.';

  @override
  String get adWatchToUnlock => 'Watch ad';

  @override
  String get adLoading => 'Loading a short video…';

  @override
  String get adRewardNotEarned => 'Watch the whole video to unlock it.';

  @override
  String get adUnavailableFreePass =>
      'No video available right now — unlocked for free this time.';

  @override
  String get settingsPrivacyAdsError =>
      'Couldn\'t open the privacy options. Try again later.';

  @override
  String get nicknamePromptTitle => 'What should we call you?';

  @override
  String get nicknamePromptBody =>
      'We\'ll cheer you on by name every time you solve.';

  @override
  String get nicknameHint => 'Your name or nickname';

  @override
  String get nicknameSave => 'Save';

  @override
  String get settingsNickname => 'Your name';

  @override
  String get settingsNicknameNotSet => 'Not set — tap to add one';

  @override
  String celebrateNamed(String name) {
    return 'Way to go, $name!';
  }

  @override
  String get celebrateAnon => 'Way to go!';

  @override
  String get celebrateCubeSolved => 'Cube solved!';

  @override
  String get celebrateDailyDone => 'Daily challenge complete!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit moves',
      one: '$count / 1 move',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Any scramble can be solved in $limit moves or fewer',
      one: 'Any scramble can be solved in 1 move or fewer',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Watch Video';

  @override
  String get patternsNotNow => 'Not Now';

  @override
  String get settingsColorScheme => 'Cube color scheme';

  @override
  String get colorSchemeWestern => 'Western';

  @override
  String get colorSchemeJapanese => 'Japanese';

  @override
  String get colorSchemeWesternDesc =>
      'White opposite yellow, blue opposite green';

  @override
  String get colorSchemeJapaneseDesc =>
      'White opposite blue, yellow opposite green';

  @override
  String dailyYourTime(String time) {
    return 'Your time: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'You have $seconds seconds to inspect the cube. Tap to start the countdown.';
  }

  @override
  String get timerInspectTapReady => 'Tap when ready to start solving';

  @override
  String timerInspectPlus2(int seconds) {
    return 'Inspection passed $seconds s, so the clock started on its own: +2 s penalty';
  }

  @override
  String timerAvgOf(int count) {
    return 'Avg of $count';
  }

  @override
  String get timerAvgNote => 'Averages drop the best and worst times';

  @override
  String get timerPbSub => 'Best single';

  @override
  String get timerPlus2Caption => '+2 s penalty';

  @override
  String get timerDnfCaption => 'Did Not Finish';

  @override
  String get timerDeleteCaption => 'Remove this solve';

  @override
  String get patternBullsEye => 'Bull\'s-eye';

  @override
  String get patternFramedCenter => 'Framed center';

  @override
  String get patternBlockCheckerboard => 'Block checkerboard';

  @override
  String get patternCubeInCubeInCube => 'Cube in a cube in a cube';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Six T\'s';

  @override
  String get patternTwinPeaks => 'Twin peaks';

  @override
  String get patternSpiral => 'Spiral';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Center spots';

  @override
  String get patternStripes => 'Stripes';

  @override
  String get patternAnaconda => 'Anaconda';

  @override
  String get patternZigzag => 'Zigzag';

  @override
  String get patternFourSpots => 'Four spots';

  @override
  String get patternGreenMamba => 'Green mamba';

  @override
  String get patternPlusMinus => 'Plus minus';

  @override
  String guideStepCounter(int current, int total) {
    return 'Step $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Move $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Move $current / $total';
  }

  @override
  String get dailyStep1Title => 'Step 1: Scramble your cube';

  @override
  String get dailyStep2Title => 'Step 2: Solve the cube';

  @override
  String dailyPersonalBest(String time) {
    return 'Personal best: $time';
  }

  @override
  String get dailyRecentDays => 'Recent days';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-day streak! You\'re on fire!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Cube scrambled! Now go solve it';

  @override
  String get dailyCongratsTitle => 'Congratulations!';

  @override
  String dailyCongratsBody(String time) {
    return 'You solved today\'s challenge in $time.';
  }

  @override
  String get dailyCongratsDone => 'Back to the challenge';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count patterns',
      one: '1 pattern',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours left',
      one: '1 hour left',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes left',
      one: '1 minute left',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'Locked';

  @override
  String get unlockedLabel => 'Unlocked';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Watch 1 short video to unlock this pattern and its step-by-step guide for $hours hours.',
      one: 'Watch 1 short video to unlock this pattern and its step-by-step guide for 1 hour.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Watch 1 short video to open this lesson as often as you like for the next $hours hours.',
      one: 'Watch 1 short video to open this lesson as often as you like for the next hour.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'Solve big cubes';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Your free 4×4–6×6 solve is used. Watch 1 short video to solve big cubes for the next $hours hours.',
      one: 'Your free 4×4–6×6 solve is used. Watch 1 short video to solve big cubes for the next hour.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Double turn · 180°';

  @override
  String get homeAcademy => 'Academy';

  @override
  String get homePatterns => 'Cool Patterns';

  @override
  String get homePractice => 'Timer & Daily Challenge';

  @override
  String get scanChoiceSubtitle => 'How would you like to start?';

  @override
  String get scanChoiceCamera => 'Scan with camera';

  @override
  String get scanChoiceCameraDesc =>
      'Show each face to the camera and get the solution.';

  @override
  String get scanChoice3d => 'Open 3D cube';

  @override
  String get scanChoice3dDesc =>
      'Turn a virtual cube, scramble it and solve it step by step.';

  @override
  String get academyAllSizes => 'All sizes';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total lessons completed';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total completed';
  }

  @override
  String get lessonStageConcept => 'Concept';

  @override
  String get lessonStageExamples => 'Examples';

  @override
  String get lessonStagePractice => 'Practice';

  @override
  String get lessonStageNext => 'Next / free';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Stage $index of $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Example $index of $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Walkthrough $index of $total';
  }

  @override
  String get lessonBonusCase => 'Bonus case';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Go straight on to $lesson.';
  }

  @override
  String get lessonFreePractice => 'Free practice';

  @override
  String get lessonFreePracticeDesc =>
      'Solve a scrambled 3D cube on your own, from the start through this step.';

  @override
  String freePracticeBanner(String topic) {
    return 'Practice freely: solve the cube from the start up through $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Turn the $face face the way the arrow shows. Its center stays put; only the pieces around it travel.';
  }

  @override
  String cueTrigger(String front) {
    return 'Right-hand trigger, $front facing you: right face up, top to the left, right face down, top back to the right.';
  }

  @override
  String get cueTriggerBack =>
      'The sixth trigger in a row brings the cube back exactly as it was. Six is the magic number!';

  @override
  String cueSliceInner(String face) {
    return 'Turn only the inner slice next to the $face face. The $face face itself stays still, so the centers split apart.';
  }

  @override
  String cueSliceWide(String face) {
    return 'A wide turn: the $face face and the slice next to it turn together, like one thick layer.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Turn the whole cube so the $top center is on top and the $front center faces you.';
  }

  @override
  String get cueTurnTop =>
      'Turn only the top layer, as the arrow shows, to set up the next algorithm.';

  @override
  String get cueAlignTop =>
      'Last move: turn the top layer to line up its colors. Done!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'The $piece edge is in the top layer. Turn the top until it sits right above the $center center, then turn that face twice to bring it down.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'The $piece edge is stuck in the middle layer. Lift it to the top, line it up above the $center center, then bring it down.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'The $piece edge is in its spot but flipped: its white faces sideways. Take it out and lift it to the top, white facing up, then bring it down next to the $center center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP style: the bottom may turn too. Drop the $piece edge in and turn the bottom so it lines up with the $center center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Turn the top so the $piece corner sits right above its slot, between the $a and $b sides. Repeat the right-hand trigger until it drops in, correctly turned.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'The $piece corner is in its slot but twisted. One trigger pops it out (a yellow corner takes its place); keep repeating over the same slot until it drops back in with white down. Don\'t turn the cube to chase it.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Turn the top until the $piece edge lines up with the $a center, then send it down to the right, into the slot between $a and $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Turn the top until the $piece edge lines up with the $a center, then send it down to the left, into the slot between $a and $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'The $piece edge is in its slot but flipped. Insert a yellow edge there to push it out to the top, then insert it again between $a and $b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'A yellow line: turn the top so it runs from left to right, keep $front facing you, then apply the yellow-cross algorithm.';
  }

  @override
  String cueYellowL(String front) {
    return 'A yellow L: turn the top so the L points to the back left, keep $front facing you, then apply the algorithm. It becomes a line.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Only the yellow center is yellow: a dot. Apply the algorithm once with $front facing you to get an L. A dot can take three rounds, so keep going.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Turn the top until the $piece edge matches the $center center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Two matched edges sit at the back and on the right. With $front facing you, apply the swap: the front and left edges trade places.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'The matched edges sit opposite each other. Apply the swap once with $front facing you; afterwards two neighbors match.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'The $piece corner is already in its spot. Keep it at the front right, $front facing you, and cycle the other three corners.';
  }

  @override
  String cueCornersNone(String front) {
    return 'No yellow corner is in its spot yet. Cycle once with $front facing you; afterwards one corner is home.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Twist the $piece corner at the front right: repeat the down-trigger in pairs until its yellow faces up. The lower layers look messy for now; they come back with the last corner!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'The $piece corner needs four triggers this time. Keep going: yellow always comes up after two or four.';
  }

  @override
  String get cueTwistNext =>
      'Turn only the top layer to bring the next twisted corner to the front right. Don\'t turn the whole cube now!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Pair the $piece corner with the $edge edge on top, then insert the pair into the slot between $a and $b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'The $piece corner is stuck in its slot with the wrong edge. Take it out to the top first, then pair it up and insert it.';
  }

  @override
  String cueOllSune(String front) {
    return 'With $front facing you, apply Sune to turn the yellow corners up.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'One Sune was not enough this time. Turn the top and apply Sune again, $front facing you.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Two corners need to swap. Keep the matching pair (headlights) on the left, $front facing you, and apply the T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'The corners are done. Keep the $piece edge at the back and cycle the other three edges with the U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'No top edge matches its center yet. Apply the U-perm once from any side; afterwards one edge does.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Two neighboring top corners need to swap. Keep the matching pair on the left, $front facing you, and apply the swap.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'The two corners to swap sit diagonally. Apply the diagonal swap with $front facing you.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Bring the stray $color center piece home with the center 3-cycle: slice, top, slice, then everything back.';
  }

  @override
  String cueCenterBar(String color) {
    return 'A whole bar of $color center pieces sits on the wrong face. Lift it with the slice, turn the top, and bring it back home.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Pair both $piece edge pieces: line them up, slice, swap in an unpaired edge with the right-hand moves, then slice back.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'The last edges: pair the $piece edge with the last-two-edges algorithm, which keeps every finished edge intact.';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL parity: one top edge is flipped, which never happens on a 3×3. Keep it at the front, $front facing you, and apply the parity fix before any normal OLL.';
  }

  @override
  String get cueParityPll =>
      'PLL parity: two top edges are swapped, which never happens on a 3×3. Keep them at the front and back, apply the parity swap, then line up the top.';

  @override
  String cueParityFive(String front) {
    return 'Edge parity: the two outer wings of one edge are swapped, the only parity a 5×5 has. Keep that edge at the front, $front facing you, and apply the fix once.';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'Inner-wing parity: only the 2 inner wings of the top edge are flipped. Keep it at the front, $front facing you, and turn only the third slices.';
  }

  @override
  String get wingRuleAllFour => 'All 4 wings flipped';

  @override
  String get wingRuleAllFourFix => '3-layer OLL parity (3Rw)';

  @override
  String get wingRuleInnerTwo => 'Only the 2 inner wings flipped';

  @override
  String get wingRuleInnerTwoFix => 'Inner-wing parity (3R)';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingStart => 'Get started';

  @override
  String get onboardingWhatTitle => 'Your cube companion';

  @override
  String get onboardingWhatBody =>
      'CubeMentor helps you solve, learn and practice every cube from 2×2 to 6×6, fully offline.';

  @override
  String get onboardingScanTitle => 'Scan & solve in seconds';

  @override
  String get onboardingScanBody =>
      'Show each face to the camera (or tap in the colors) and follow the 3D solution move by move.';

  @override
  String get onboardingLearnTitle => 'Learn and play';

  @override
  String get onboardingLearnBody =>
      'Master the layer-by-layer method in the Academy, then twist, scramble and solve freely in the 3D Playground.';

  @override
  String get scanChoiceManualDesc =>
      'Tap in the colors of each face, sticker by sticker.';

  @override
  String get scanTryAgain => 'Try again';

  @override
  String get scanEditManually => 'Fix colors by hand';

  @override
  String get scanLightingHint =>
      'Center the face in the grid. Use bright, even light and avoid glare.';

  @override
  String get crownExplain =>
      'A layer is one horizontal slice of the cube: the first layer is the white layer at the bottom, the second is the middle layer and the third is the yellow layer on top.';

  @override
  String get lessonObjectiveHeading => 'Learning objective';

  @override
  String get dirRowTop => 'Top row of the front face';

  @override
  String get dirRowBottom => 'Bottom row of the front face';

  @override
  String get dirColumnRight => 'Right column of the front face';

  @override
  String get dirColumnLeft => 'Left column of the front face';

  @override
  String get solveChoiceTitle => 'How do you want to solve it?';

  @override
  String get solveChoiceFastDesc =>
      'The shortest solution, played move by move.';

  @override
  String get solveChoiceGuidedDesc =>
      'Learn the layer-by-layer method one step at a time.';

  @override
  String get guidedSolvedTitle => 'Solved!';

  @override
  String get guidedSolvedBody => 'You followed every step and solved the cube.';

  @override
  String get solveAgain => 'Solve again';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get dailyStatTime => 'Today\'s time';

  @override
  String get dailyStatBest => 'Personal best';

  @override
  String get dailyStatStreak => 'Current streak';

  @override
  String get dailyStatBestStreak => 'Best streak';

  @override
  String get privacyPolicyTitle => 'Privacy policy';

  @override
  String get settingsPrivacyPolicyDesc =>
      'What CubeMentor stores and what the ads use.';

  @override
  String get privacyIntro =>
      'CubeMentor works without an account and without servers of its own. This page explains what stays on your device and what our ad partner uses.';

  @override
  String get privacyDataTitle => 'Your data stays on your device';

  @override
  String get privacyDataBody =>
      'Your language, settings, lesson progress, solve times and daily streak are saved only on this device. We have no servers, so we never receive them. Uninstalling the app deletes them.';

  @override
  String get privacyCameraTitle => 'Camera';

  @override
  String get privacyCameraBody =>
      'The camera is used only while you scan a cube. Frames are analyzed on your device to read the sticker colors; no photo or video is saved or sent anywhere.';

  @override
  String get privacyAdsTitle => 'Ads';

  @override
  String get privacyAdsBody =>
      'The app shows ads from Google AdMob. Google may use device identifiers and ad interaction data to show and measure ads, as described in Google\'s privacy policy. Where the law requires it, you are asked for consent first and can change it in Settings.';

  @override
  String get privacyContactTitle => 'Contact';

  @override
  String privacyContactBody(String email) {
    return 'Questions about privacy? Write to us at $email.';
  }
}
