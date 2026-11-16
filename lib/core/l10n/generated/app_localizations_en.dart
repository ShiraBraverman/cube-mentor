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
  String get languageEnglish => 'English';

  @override
  String get languageHebrew => 'עברית';

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
  String get nextStep => 'Next';

  @override
  String get previousStep => 'Previous';

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
  String get solveChooseMethod => 'How do you want to solve it?';

  @override
  String get solveFast => 'Fast solve';

  @override
  String get solveFastDesc => 'Kociemba two-phase algorithm · about 20 moves';

  @override
  String get solveLearn => 'Learn step by step';

  @override
  String get solveLearnDesc =>
      'Beginner\'s layer-by-layer method with explanations';

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
  String get phaseLblOrient => 'Hold the cube';

  @override
  String get phaseLblCross => 'White cross';

  @override
  String get phaseLblCorners => 'White corners';

  @override
  String get phaseLblMiddle => 'Middle layer';

  @override
  String get phaseLblYellowCross => 'Yellow cross';

  @override
  String get phaseLblYellowEdges => 'Yellow edges';

  @override
  String get phaseLblYellowCorners => 'Place the yellow corners';

  @override
  String get phaseLblYellowCornersOrient => 'Twist the yellow corners';

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
  String get scanTapToRescan => 'Tap a scanned face to scan it again.';

  @override
  String get scanTooDark => 'Too dark: move to brighter light.';

  @override
  String get scanGlare => 'Glare: tilt the cube away from the light.';

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
}
