// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'I-scan, lutasin, at masterin ang bawat cube mula 2×2 hanggang 6×6.';

  @override
  String get chooseCubeSize => 'Piliin ang iyong cube';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Baguhan';

  @override
  String get cubeLevel3 => 'Klasiko';

  @override
  String get cubeLevel4 => 'Advanced';

  @override
  String get cubeLevel5 => 'Eksperto';

  @override
  String get cubeLevel6 => 'Master';

  @override
  String get cubeComingSoon => 'Bagong cube, malapit na';

  @override
  String get carouselPrevious => 'Nakaraang cube';

  @override
  String get carouselNext => 'Susunod na cube';

  @override
  String get chooseMode => 'Ano ang gusto mong gawin?';

  @override
  String get modePlayground => '3D Playground';

  @override
  String get modePlaygroundDesc =>
      'Paikutin ang mga layer, i-scramble, at ulitin ang mga galaw sa 3D.';

  @override
  String get modeScanSolve => 'I-scan at Lutasin';

  @override
  String get modeScanSolveDesc =>
      'I-scan ang cube mo gamit ang camera at kumuha ng solusyon.';

  @override
  String get modeAcademy => 'Akademya';

  @override
  String get modeAcademyDesc =>
      'Matuto nang hakbang-hakbang sa mga interactive na aralin.';

  @override
  String get comingSoon => 'Malapit na';

  @override
  String get comingSoonMessage =>
      'Darating ang feature na ito sa susunod na update.';

  @override
  String get language => 'Wika';

  @override
  String get languageSearch => 'Maghanap ng wika';

  @override
  String get languageNoResults => 'Walang wikang tumugma sa hinanap mo.';

  @override
  String playgroundTitle(int size) {
    return '$size×$size Playground';
  }

  @override
  String get scramble => 'I-scramble';

  @override
  String get reset => 'I-reset';

  @override
  String get undo => 'I-undo';

  @override
  String get speed => 'Bilis';

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
  String get cubeRotations => 'Mga pag-ikot';

  @override
  String get play => 'I-play';

  @override
  String get pause => 'I-pause';

  @override
  String get playbackTitle => 'Playback';

  @override
  String get playbackEmpty =>
      'I-scramble ang cube para makagawa ng playback ng solusyon.';

  @override
  String playbackProgress(int current, int total) {
    return 'Hakbang $current ng $total';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count galaw',
      one: '1 galaw',
      zero: 'Walang galaw',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Lutas na';

  @override
  String get scrambled => 'Gulo';

  @override
  String get orbitHint =>
      'I-drag ang isang hilera para paikutin · I-drag ang background para iikot ang view';

  @override
  String get notationPad => 'Notation pad';

  @override
  String get solve => 'Lutasin';

  @override
  String get solving => 'Nilulutas…';

  @override
  String get solveFast => 'Mabilis na solusyon';

  @override
  String get solveLearn => 'Matuto nang hakbang-hakbang';

  @override
  String get solveModeGuided => 'May gabay (3 korona)';

  @override
  String get solveModeFast => 'Mabilis (optimal)';

  @override
  String solveUnavailable(int size) {
    return 'Darating ang $size×$size solver sa susunod na update.';
  }

  @override
  String get solveAlreadySolved => 'Lutas na ang cube.';

  @override
  String solveFailed(String reason) {
    return 'Hindi malulutas ang cube na ito ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'Hindi available ang solving engine sa device na ito.';

  @override
  String get solveComplete => 'Lutas na! Ang galing mo.';

  @override
  String solveSummary(int count) {
    return '$count galaw';
  }

  @override
  String get nextMove => 'Susunod na galaw';

  @override
  String get previousMove => 'Nakaraang galaw';

  @override
  String get halfTurnHalfway =>
      'Ayos, kalahati na! Iikot pa ito nang isang beses sa parehong direksyon para sa double turn (180°).';

  @override
  String get wideTurnInner =>
      'Galing! Ngayon, i-swipe ang katabing inner layer para makumpleto ang wide turn.';

  @override
  String get wideTurnOuter =>
      'Galing! Ngayon, i-swipe ang katabing outer layer para makumpleto ang wide turn.';

  @override
  String get wideTurnMore =>
      'Galing! Ituloy ang pag-swipe sa mga umiilaw na layer, isa-isa, para makumpleto ang wide turn.';

  @override
  String get guideSwipeHint =>
      'I-swipe ang umiilaw na layer ayon sa direksyon ng arrow, o i-tap ang Susunod.';

  @override
  String get guideRotateHint =>
      'Paikutin ang buong cube gaya ng ipinapakita ng arrow: i-tap ang Susunod.';

  @override
  String get guideWrongMove => 'Sundan ang naka-highlight na arrow';

  @override
  String get guideExit => 'Lumabas sa gabay';

  @override
  String get replayStep => 'Ulitin ang hakbang';

  @override
  String get colorWhite => 'puti';

  @override
  String get colorYellow => 'dilaw';

  @override
  String get colorGreen => 'berde';

  @override
  String get colorBlue => 'asul';

  @override
  String get colorRed => 'pula';

  @override
  String get colorOrange => 'orange';

  @override
  String get phaseOptimal2x2 => 'Pinakamaikling solusyon';

  @override
  String get phaseKociemba1 => 'Phase 1 · Iayos ang oryentasyon';

  @override
  String get phaseKociemba2 => 'Phase 2 · Tapusin ang cube';

  @override
  String get phaseLblCross => 'Puting cross';

  @override
  String get phaseLblCorners => 'Mga kanto ng unang korona';

  @override
  String get phaseLblMiddle => 'Mga edge ng gitnang layer';

  @override
  String get phaseLblYellowCross => 'Dilaw na cross';

  @override
  String get phaseLblYellowEdges => 'Itugma ang mga edge ng dilaw na cross';

  @override
  String get phaseLblYellowCorners =>
      'Ilagay sa puwesto ang mga dilaw na kanto';

  @override
  String get phaseLblYellowCornersOrient => 'Pihitin ang mga dilaw na kanto';

  @override
  String get crownFirst => 'Unang korona';

  @override
  String get crownSecond => 'Ikalawang korona';

  @override
  String get crownThird => 'Ikatlong korona';

  @override
  String get crownFirstGoal => 'Puting mukha at unang layer';

  @override
  String get crownSecondGoal => 'Gitnang layer';

  @override
  String get crownThirdGoal => 'Dilaw na mukha at huling layer';

  @override
  String crownProgress(int current, int total) {
    return 'Korona $current ng $total';
  }

  @override
  String get subStepGoal11 =>
      'Bumuo ng puting cross kung saan tugma rin ang bawat puting edge sa kulay ng center na katabi nito.';

  @override
  String get subStepGoal12 =>
      'Ipasok ang 4 na puting kanto sa kanilang puwesto para makumpleto ang puting mukha at ang buong unang singsing.';

  @override
  String get subStepGoal21 =>
      'Ipasok ang 4 na edge ng gitnang layer nang hindi sinisira ang unang korona.';

  @override
  String get subStepGoal31 => 'Bumuo ng dilaw na cross sa huling layer.';

  @override
  String get subStepGoal32 =>
      'Pagpalitin ang mga edge ng dilaw na cross hanggang tumugma ang bawat isa sa center ng gilid nito.';

  @override
  String get subStepGoal33 =>
      'Ilipat ang 4 na dilaw na kanto sa tamang puwesto, kahit nakapihit pa sila.';

  @override
  String get subStepGoal34 =>
      'Pihitin sa puwesto ang bawat dilaw na kanto hanggang tumugma ang lahat ng sticker at malutas ang cube.';

  @override
  String get explainOptimal2x2 =>
      'Ang pinakamaikling posibleng solusyon, nahanap sa pagsuri sa bawat posisyon ng 2×2.';

  @override
  String get explainKociemba1 =>
      'Iayos ang oryentasyon ng bawat piraso at tipunin ang mga edge ng gitnang layer sa gitnang layer.';

  @override
  String get explainKociemba2 =>
      'Tapusin gamit lang ang U, D, at kalahating ikot, na hindi sumisira sa oryentasyong iyon.';

  @override
  String get explainLblOrient =>
      'Paikutin ang buong cube para nakaharap sa ibaba ang puting center.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Ibaba ang $piece na edge sa tabi ng puting center, katugma ang kulay sa gilid.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'Naipit sa maling puwesto ang $piece na kanto. Iangat ito gamit ang R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Paikutin ang itaas na layer hanggang mapunta ang $piece na kanto sa ibabaw ng puwesto nito.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Ulitin ang R U R\' U\' hanggang pumasok sa puwesto ang $piece na kanto.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'Nasa gitnang layer ang $piece na edge pero mali. Ilabas ito pataas.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Paikutin ang itaas na layer para tumugma sa center ang kulay sa gilid ng $piece na edge.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Ipasok ang $piece na edge sa kanan: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Ipasok ang $piece na edge sa kaliwa: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Paikutin ang itaas na layer para maihanda ang dilaw na hugis para sa susunod na algorithm.';

  @override
  String get explainLblYellowCrossAlg =>
      'Buuin ang dilaw na cross gamit ang F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Paikutin ang itaas na layer para ihanay ang mga dilaw na edge sa kanilang mga center.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Pagpalitin ang mga dilaw na edge gamit ang R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Iikot ang mga dilaw na kanto papunta sa kanilang puwesto gamit ang U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Paikutin ang itaas na layer para dalhin sa harap-kanan ang susunod na hindi pa lutas na dilaw na kanto.';

  @override
  String get explainLblCornerTwist =>
      'Ulitin ang R\' D\' R D hanggang nakaharap pataas ang dilaw. Kusang maaayos ang ibaba sa dulo.';

  @override
  String get explainLblFinalAlign =>
      'Paikutin ang itaas na layer para tapusin ang cube.';

  @override
  String scanTitle(int size) {
    return 'I-scan ang $size×$size';
  }

  @override
  String get scanManualInput => 'Ilagay ang mga kulay nang mano-mano';

  @override
  String get scanUseCamera => 'I-scan gamit ang camera';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Mukha $current ng $total';
  }

  @override
  String get faceUp => 'Itaas na mukha';

  @override
  String get faceRight => 'Kanang mukha';

  @override
  String get faceFront => 'Harap na mukha';

  @override
  String get faceDown => 'Ibabang mukha';

  @override
  String get faceLeft => 'Kaliwang mukha';

  @override
  String get faceBack => 'Likod na mukha';

  @override
  String get scanHintFront =>
      'Hawakan ang cube nang nakaharap sa iyo ang kahit anong mukha. Iyan ang harap mo: panatilihing pareho ang mukha sa itaas habang nag-i-scan.';

  @override
  String get scanHintRight =>
      'Mula sa harap, paikutin ang buong cube pakaliwa nang isang beses para humarap sa iyo ang kanang mukha.';

  @override
  String get scanHintBack =>
      'Mula sa harap, paikutin ang buong cube pakaliwa nang dalawang beses.';

  @override
  String get scanHintLeft =>
      'Mula sa harap, paikutin ang buong cube pakanan nang isang beses.';

  @override
  String get scanHintUp =>
      'Mula sa harap, ikiling ang itaas papunta sa iyo para humarap ito sa camera.';

  @override
  String get scanHintDown =>
      'Mula sa harap, ikiling ang ibaba papunta sa iyo para humarap ito sa camera.';

  @override
  String get scanAlignHint =>
      'Punuin ang grid ng mukha ng cube, saka i-tap ang shutter.';

  @override
  String get scanCapture => 'Kunan ang mukha';

  @override
  String get scanTurnLeft => 'Paikutin pakaliwa ang buong cube';

  @override
  String get scanTurnRight => 'Paikutin pakanan ang buong cube';

  @override
  String get scanTipTop => 'Ikiling ang itaas papunta sa iyo';

  @override
  String get scanTipBottom => 'Ikiling ang ibaba papunta sa iyo';

  @override
  String get scanGlareTip =>
      'May silaw: ikiling nang kaunti ang cube, o itapat ang phone sa ibabaw nito para matakpan ang ilaw sa itaas.';

  @override
  String get scanDimTip =>
      'Masyadong madilim: lumipat sa mas maliwanag na lugar o buksan ang flashlight.';

  @override
  String get scanTorch => 'Flashlight';

  @override
  String get scanGuideLabel =>
      'Gabay sa pag-scan: may kulay ang mga na-scan na mukha. I-tap ang na-scan na mukha para i-scan ito ulit.';

  @override
  String get scanTapToRescan => 'I-tap ang na-scan na mukha para i-scan ulit.';

  @override
  String get scanCameraMissing => 'Walang nakitang camera sa device na ito.';

  @override
  String get scanCameraDenied =>
      'Hindi pinayagan ang access sa camera. Puwede mo pa ring ilagay ang mga kulay nang mano-mano.';

  @override
  String get scanCameraFailed => 'Hindi mabuksan ang camera.';

  @override
  String get scanAllGood => 'Mukhang tama ang lahat ng sticker.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'May $count sticker na mukhang mali',
      one: 'May 1 sticker na mukhang mali',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'May hindi tugma';

  @override
  String scanIssueColors(int count) {
    return 'Dapat lumabas ang bawat kulay nang eksaktong $count beses.';
  }

  @override
  String get scanIssueCenters => 'Magkapareho ang kulay ng dalawang center.';

  @override
  String get scanIssuePieces =>
      'Bumubuo ang mga sticker na ito ng mga pirasong wala sa totoong cube.';

  @override
  String get scanIssueTwist =>
      'May isang kantong napihit. Suriin ang mga sticker ng kanto.';

  @override
  String get scanIssueFlip =>
      'May isang edge na baligtad. Suriin ang mga sticker ng edge.';

  @override
  String get scanIssueParity => 'Mukhang nagkapalit ang dalawang piraso.';

  @override
  String get scanIssueUnavailable =>
      'Hindi available ang pagsusuri ng kulay sa device na ito.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'May $count sticker na mahirap basahin: silipin ang mga ito saglit.',
      one: 'May 1 sticker na mahirap basahin: silipin ito saglit.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'I-tap ang sticker para palitan ang kulay · Pindutin nang matagal para sa palette';

  @override
  String get scanRescanFace => 'I-scan ulit ang isang mukha';

  @override
  String get scanCancelRescan => 'Bumalik sa mga kulay';

  @override
  String get scanPaletteTitle => 'Pumili ng kulay';

  @override
  String get scanOpen3d => 'Buksan sa 3D';

  @override
  String get scanRestart => 'Magsimula ulit';

  @override
  String get modeTimer => 'Speed timer';

  @override
  String get modeTimerDesc =>
      'Mga scramble, inspection, average, at personal best.';

  @override
  String get modeDaily => 'Pang-araw-araw na hamon';

  @override
  String get modeDailyDesc =>
      'Bagong scramble araw-araw. Panatilihin ang iyong streak.';

  @override
  String get modePatterns => 'Library ng pattern';

  @override
  String get modePatternsDesc => 'Checkerboard, superflip, at iba pa, sa 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count araw na streak',
      one: '1 araw na streak',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Ituloy ang pag-aaral';

  @override
  String get startLearning => 'Simulan ang pag-aaral';

  @override
  String lessonOf(int index, int total) {
    return 'Aralin $index ng $total';
  }

  @override
  String get academyAllDone => 'Tapos na ang lahat ng aralin!';

  @override
  String get academyTitle => 'Akademya';

  @override
  String academyProgress(int done, int total) {
    return '$done sa $total aralin ang natapos';
  }

  @override
  String get lessonAdvanced => 'Advanced';

  @override
  String get lessonDone => 'Tapos';

  @override
  String lessonPartOf(int index, int total) {
    return 'Bahagi $index ng $total';
  }

  @override
  String get lessonBack => 'Bumalik';

  @override
  String get lessonNext => 'Susunod';

  @override
  String get lessonFinish => 'Tapusin ang aralin';

  @override
  String get lessonComplete => 'Tapos na ang aralin!';

  @override
  String get lessonNextLesson => 'Susunod na aralin';

  @override
  String get lessonBackToAcademy => 'Bumalik sa Akademya';

  @override
  String get lessonTryIt =>
      'Ikaw naman: i-swipe ang layer na itinuturo ng arrow, o i-tap ang Susunod na galaw.';

  @override
  String get lessonLookAround =>
      'I-drag ang background para makita ang cube mula sa lahat ng panig.';

  @override
  String get lessonDemoDone => 'Ayos! I-tap ang Susunod para magpatuloy.';

  @override
  String holdPrompt(String top, String front) {
    return 'Hawakan ang cube nang nasa itaas ang $top na center at nakaharap sa iyo ang $front na center.';
  }

  @override
  String get trackBeginner => '3×3 pambaguhan: ang 3 korona';

  @override
  String get trackCfop => 'Panimula sa CFOP';

  @override
  String get trackTwoByTwo => '2×2 pambaguhan at Ortega';

  @override
  String get trackBigCubes => 'Malalaking cube: reduction at parity';

  @override
  String moveSentence(String layer, String direction) {
    return 'Paikutin ang $layer $direction';
  }

  @override
  String get moveFaceR => 'kanang mukha';

  @override
  String get moveFaceL => 'kaliwang mukha';

  @override
  String get moveFaceU => 'itaas na mukha';

  @override
  String get moveFaceD => 'ibabang mukha';

  @override
  String get moveFaceF => 'harap na mukha';

  @override
  String get moveFaceB => 'likod na mukha';

  @override
  String moveLayerInner(int depth, String face) {
    return 'ika-$depth na layer mula sa $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth layer ang lalim)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'mga layer $near–$far mula sa $face';
  }

  @override
  String get moveLayerMiddle => 'gitnang layer';

  @override
  String get moveDirUp => 'pataas';

  @override
  String get moveDirDown => 'pababa';

  @override
  String get moveDirLeft => 'pakaliwa';

  @override
  String get moveDirRight => 'pakanan';

  @override
  String get moveDirClockwise => 'nang clockwise';

  @override
  String get moveDirCounter => 'nang counter-clockwise';

  @override
  String get moveDirBackClockwise =>
      'nang clockwise, kung titingnan mula sa likod';

  @override
  String get moveDirBackCounter =>
      'nang counter-clockwise, kung titingnan mula sa likod';

  @override
  String get moveDirHalf => 'nang kalahating ikot (dalawang beses)';

  @override
  String get moveRotateX => 'Ikiling ang buong cube: aakyat sa itaas ang harap';

  @override
  String get moveRotateXPrime =>
      'Ikiling ang buong cube: bababa sa ilalim ang harap';

  @override
  String get moveRotateX2 =>
      'Baligtarin ang buong cube: mapupunta sa likod ang harap';

  @override
  String get moveRotateY =>
      'Paikutin ang buong cube: mapupunta sa kaliwa ang harap';

  @override
  String get moveRotateYPrime =>
      'Paikutin ang buong cube: mapupunta sa kanan ang harap';

  @override
  String get moveRotateY2 =>
      'Paikutin nang kalahati ang buong cube: mapupunta sa harap ang likod';

  @override
  String get moveRotateZ =>
      'Igulong nang clockwise ang buong cube: mapupunta sa kanan ang itaas';

  @override
  String get moveRotateZPrime =>
      'Igulong nang counter-clockwise ang buong cube: mapupunta sa kaliwa ang itaas';

  @override
  String get moveRotateZ2 =>
      'Itaob ang buong cube: mapupunta sa ibaba ang itaas';

  @override
  String get phaseReductionCenters => 'Mga center';

  @override
  String get phaseReductionEdges => 'Ipares ang mga edge';

  @override
  String get phaseReductionEdgeParity => 'Edge parity';

  @override
  String get phaseReductionOllParity => 'OLL parity';

  @override
  String get phaseReductionPllParity => 'PLL parity';

  @override
  String get explainReductionCenterBlock =>
      'Mga slice turn na sabay-sabay na nag-uuwi ng ilang center piece.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Dalhin ang isang $piece na center piece sa mukha nito gamit ang 3-cycle na hindi gumagalaw sa mga tapos nang center.';
  }

  @override
  String get explainReductionParityCenters =>
      'Buuin ulit ang mga center na nagalaw ng parity slice turn.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Pagdugtungin ang mga piraso ng $piece na edge gamit ang 3-cycle; lutas pa rin ang mga center.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Hindi maipapares ang mga huling edge gamit lang ang 3-cycle (edge parity). Isang inner-slice turn ang aayos dito.';

  @override
  String get explainReductionOllParity =>
      'OLL parity: may isang edge na baligtad, na imposible sa 3×3. Babaligtarin ito pabalik ng algorithm na ito.';

  @override
  String get explainReductionPllParity =>
      'PLL parity: may dalawang edge na nagkapalit, na imposible sa 3×3. Ibabalik sila ng algorithm na ito.';

  @override
  String get patternsTitle => 'Library ng pattern';

  @override
  String get patternsHint =>
      'I-tap ang isang pattern para panoorin ito, saka gayahin sa sarili mong cube.';

  @override
  String get patternCheckerboard => 'Checkerboard';

  @override
  String get patternCubeInCube => 'Cube sa loob ng cube';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Mga tuldok';

  @override
  String get patternCross => 'Krus';

  @override
  String get patternPython => 'Sawa';

  @override
  String get phasePattern => 'Buuin ang pattern';

  @override
  String get explainPatternStep =>
      'Sundan ang bawat galaw sa sarili mong cube. I-tap ang Lutasin para ibalik ito sa dati.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Speed timer';

  @override
  String get timerHoldToStart =>
      'Pindutin nang matagal, saka bitawan para magsimula';

  @override
  String get timerReleaseToStart => 'Bitawan para magsimula';

  @override
  String get timerTapToStop => 'I-tap kahit saan para huminto';

  @override
  String get timerInspecting =>
      'Inspection: pindutin nang matagal, saka bitawan para magsimula';

  @override
  String get timerTapToInspect =>
      'I-tap para simulan ang 15 segundong inspection';

  @override
  String get timerInspectionToggle => '15 s na inspection';

  @override
  String get timerNewScramble => 'Bagong scramble';

  @override
  String get timerLoadingScramble => 'Gumagawa ng scramble…';

  @override
  String get timerPb => 'Best';

  @override
  String get timerSolves => 'Mga solve';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Burahin';

  @override
  String get timerHistory => 'Kasaysayan';

  @override
  String get timerNoSolves =>
      'Wala pang solve. I-scramble ang cube mo at simulan na!';

  @override
  String get timerNewPb => 'Bagong personal best!';

  @override
  String get timerClearHistory => 'Burahin ang kasaysayan';

  @override
  String get timerScrambleHint =>
      'Hawakan nang puti sa itaas at berde sa harap, saka i-scramble:';

  @override
  String get dailyTitle => 'Pang-araw-araw na hamon';

  @override
  String dailyFor(String date) {
    return 'Hamon para sa $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Pinakamahabang streak: $count';
  }

  @override
  String get dailyDone => 'Tapos na para ngayong araw! Bumalik bukas.';

  @override
  String get dailyNotDone =>
      'Lutasin ang scramble ngayong araw para mapanatili ang streak mo.';

  @override
  String get dailySolveVirtual => 'Lutasin sa 3D cube';

  @override
  String get dailyTimeIt => 'I-time sa sarili mong cube';

  @override
  String get dailyHint => 'Pahiwatig';

  @override
  String dailyHintText(String moves) {
    return 'Magsimula sa puting cross: $moves';
  }

  @override
  String get dailyHintFailed => 'Walang available na pahiwatig sa ngayon.';

  @override
  String get lessonBasics => 'Kilalanin ang cube';

  @override
  String get lessonBasicsDesc => 'Mga piraso, mukha, at pangalan ng galaw.';

  @override
  String get stepBasicsPieces => 'Tatlong uri ng piraso';

  @override
  String get stepBasicsPiecesBody =>
      'Hindi gumagalaw ang mga center at sila ang nagbibigay ng kulay sa bawat mukha. Dalawa ang kulay ng mga edge, tatlo naman ang sa mga kanto. Ang paglutas ay ang paglipat ng bawat edge at kanto sa tabi ng mga center na kakulay nila.';

  @override
  String get stepBasicsFaces => 'Anim na letra ng mukha';

  @override
  String get stepBasicsFacesBody =>
      'Ang R, L, U, D, F, at B ay ang kanan, kaliwa, itaas, ibaba, harap, at likod na mukha. Ang letra lang ay nangangahulugang quarter turn nang clockwise, na para bang diretso kang nakatingin sa mukhang iyon.';

  @override
  String get stepBasicsPrime => 'Prime at dobleng ikot';

  @override
  String get stepBasicsPrimeBody =>
      'Ang apostrophe (R\') ay ikot sa kabilang direksyon, counter-clockwise. Ang 2 (U2) ay kalahating ikot: dalawang quarter turn.';

  @override
  String get stepCrossGoal => 'Ang layunin';

  @override
  String get stepCrossGoalBody =>
      'Hawakan nang dilaw sa itaas. Nakapalibot sa puting center sa ibaba ang apat na puting edge, at tugma ang kulay sa gilid ng bawat isa sa katabing center.';

  @override
  String get stepCrossTop => 'Edge sa itaas';

  @override
  String get stepCrossTopBody =>
      'Maghanap ng puting edge sa itaas. Paikutin ang itaas hanggang mapunta ang kulay sa gilid nito sa ibabaw ng katugmang center, saka paikutin nang dalawang beses ang mukhang iyon para maibaba ito.';

  @override
  String get stepCrossMiddle => 'Edge sa gitna';

  @override
  String get stepCrossMiddleBody =>
      'Ang edge na naipit sa gitnang layer ay iangat muna: iikot pataas ang gilid nito, iusog ang itaas, at ibalik ang gilid para buo pa rin ang cross. Saka ito ilagay mula sa itaas.';

  @override
  String get stepCornersInsert => 'Sa ibabaw ng puwesto nito';

  @override
  String get stepCornersInsertBody =>
      'Paikutin ang itaas hanggang mapunta ang isang puting kanto sa ibabaw ng puwesto ng mga kulay nito, sa harap-kanan. Ibababa ito ng R U R\' U\'.';

  @override
  String get stepCornersRepeat => 'Ulitin ang trigger';

  @override
  String get stepCornersRepeatBody =>
      'Kung mali ang harap ng puti, ulit-ulitin lang ang R U R\' U\' sa parehong puwesto. Lulutas ang bawat kanto sa hindi hihigit sa limang ulit.';

  @override
  String get stepMiddleRight => 'Edge pakanan';

  @override
  String get stepMiddleRightBody =>
      'Ihanay ang isang edge sa itaas sa center nito sa harap. Kung tugma ang kulay nito sa itaas sa kanang center, ipasok ito gamit ang U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Edge pakaliwa';

  @override
  String get stepMiddleLeftBody =>
      'Kung sa kaliwang center naman tugma ang kulay nito sa itaas, gamitin ang mirror: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Isang algorithm';

  @override
  String get stepYellowCrossBody =>
      'Ginagawa ng F R U R\' U\' F\' na L ang dilaw na tuldok, linya ang L, at cross ang linya. Hawakan ang L sa likod-kaliwa at ang linya nang pahalang.';

  @override
  String get stepYellowEdges => 'Itugma ang mga edge';

  @override
  String get stepYellowEdgesBody =>
      'Paikutin ang itaas hanggang tumugma ang dalawang edge sa kanilang center. Kapag nasa likod ang isa at nasa kanan ang isa, pagpapalitin ng R U R\' U R U2 R\' U ang dalawa pa.';

  @override
  String get stepPlaceCorners => 'Ilagay ang mga ito';

  @override
  String get stepPlaceCornersBody =>
      'Hawakan sa harap-kanan ang kantong nasa tamang puwesto na. Ililipat ng U R U\' L\' U R\' U\' L ang tatlo pa; ulitin hanggang nasa puwesto na ang apat.';

  @override
  String get stepTwistCorners => 'Pihitin ang mga ito';

  @override
  String get stepTwistCornersBody =>
      'Kapag nasa harap-kanan ang kantong hindi pa lutas, ulitin ang R\' D\' R D hanggang nasa itaas ang dilaw, saka paikutin lang ang itaas para dalhin ang susunod. Mukhang sira ang ibaba hanggang sa pinakadulo: tuloy lang.';

  @override
  String get lessonCfopIntro => 'Ano ang CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Apat na yugto';

  @override
  String get stepCfopOverviewBody =>
      'Nilulutas ng mga speedcuber ang cross, ipinapares ang bawat kanto ng unang layer sa gitnang edge nito (F2L), inaayos ang oryentasyon ng huling layer (OLL), at saka ang permutation nito (PLL).';

  @override
  String get stepCfopCross => 'Planuhin ang cross';

  @override
  String get stepCfopCrossBody =>
      'Sa CFOP, pinaplano ang cross habang nag-i-inspection at binubuo sa ibaba sa mga walong galaw.';

  @override
  String get lessonF2l => 'Mga batayan ng F2L';

  @override
  String get lessonF2lDesc => 'Ipares ang kanto sa edge nito.';

  @override
  String get stepF2lRight => 'Magpasok ng pares';

  @override
  String get stepF2lRightBody =>
      'Kapag magkatabi sa itaas ang isang kanto at ang edge nito, dalhin sila sa ibabaw ng slot nila at sabay na ipasok.';

  @override
  String get stepF2lLeft => 'Pares sa kaliwa';

  @override
  String get stepF2lLeftBody =>
      'Ang parehong kaso sa kabilang panig ay ang mirror, U\' L\' U L. Sa pag-ikot ng cube (y), magagamit mo ang kamay na mas komportable sa iyo.';

  @override
  String get lessonOll => 'Two-look OLL';

  @override
  String get lessonOllDesc => 'Gawing dilaw ang buong itaas.';

  @override
  String get stepOllCross => 'Una ang mga edge';

  @override
  String get stepOllCrossBody =>
      'Nagsisimula ang two-look OLL sa algorithm ng dilaw na cross na alam mo na.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Kapag may isang dilaw na kantong nakaharap pataas sa harap-kaliwa, inaayos ng Sune (R U R\' U R U2 R\') ang tatlo pa. Sune at ang mirror nito ang ginagamit sa karamihan ng ibang kaso.';

  @override
  String get lessonPll => 'Two-look PLL';

  @override
  String get lessonPllDesc => 'Tapusin ang cube.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'Pinagpapalit ng T-perm ang dalawang kanto at dalawang edge. Gamitin ito sa paglagay ng mga kanto: hawakan sa kanan ang dalawang kantong kailangang magpalit.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Kapag tapos na ang mga kanto, iniikot ng U-perm ang tatlong edge. Ilagay sa likod ang tapos nang panig.';

  @override
  String get lessonTwoFirst => 'Unang layer ng 2×2';

  @override
  String get lessonTwoFirstDesc =>
      'Bumuo ng isang mukha na may magkakatugmang kanto.';

  @override
  String get stepTwoIntro => 'Mga kanto lang';

  @override
  String get stepTwoIntroBody =>
      'Ang 2×2 ay 3×3 na walang edge at center. Pumili ng kulay, buuin ang mukhang iyon sa ibaba, at itugma ang mga kulay sa gilid ng magkakatabing kanto.';

  @override
  String get stepTwoCorner => 'Ipasok ang mga kanto';

  @override
  String get stepTwoCornerBody =>
      'Katulad ng mga puting kanto sa 3×3: dalhin ang kanto sa ibabaw ng puwesto nito at gamitin ang R U R\' U\' hanggang pumasok ito.';

  @override
  String get lessonTwoOll => 'Ayusin ang itaas';

  @override
  String get lessonTwoOllDesc => 'Ortega OLL gamit ang Sune.';

  @override
  String get stepTwoSune => 'Sune ulit';

  @override
  String get stepTwoSuneBody =>
      'Ginagawa ring dilaw ng Sune ang itaas ng 2×2. Pitong maiikling kaso ang pinag-aaralan sa Ortega; sakop ng Sune at ng mirror nito ang karamihan.';

  @override
  String get lessonTwoPbl => 'I-permute ang dalawang layer';

  @override
  String get lessonTwoPblDesc => 'Pagpalitin ang mga kanto para matapos.';

  @override
  String get stepTwoAdjacent => 'Magkatabing palitan';

  @override
  String get stepTwoAdjacentBody =>
      'Kapag kailangang magpalit ang dalawang magkatabing kanto sa itaas, hawakan sila sa kanan at gamitin ang T-perm.';

  @override
  String get stepTwoDiagonal => 'Pahilis na palitan';

  @override
  String get stepTwoDiagonalBody =>
      'Nagpapalit gamit ang Y-perm ang dalawang kantong magkatapat.';

  @override
  String get lessonBigIntro => 'Mga piraso ng malalaking cube';

  @override
  String get lessonBigIntroDesc => 'Mga center, wing, at slice.';

  @override
  String get stepBigPieces => 'Walang nakapirming center';

  @override
  String get stepBigPiecesBody =>
      'Sa 4×4, may apat na gumagalaw na center piece ang bawat mukha, at gawa sa dalawang wing ang bawat edge. Pinagsasama-sama sila ng reduction para kumilos ang cube na parang 3×3.';

  @override
  String get stepBigSlices => 'Wide at inner turn';

  @override
  String get stepBigSlicesBody =>
      'Sabay na pinapaikot ng Rw ang dalawang kanang layer. Ang ikalawang layer lang mula sa kanan ang pinapaikot ng 2R. Ginagalaw ng mga ikot na ito ang mga center at wing.';

  @override
  String get lessonBigCenters => 'Mga center';

  @override
  String get lessonBigCentersDesc => 'Pagsama-samahin ang mga center piece.';

  @override
  String get stepBigCenterCycle => 'Center 3-cycle';

  @override
  String get stepBigCenterCycleBody =>
      'Eksaktong tatlong center piece ang ginagalaw ng commutator na ito at wala nang iba, kaya nananatiling tapos ang mga tapos nang center.';

  @override
  String get lessonBigEdges => 'Ipares ang mga edge';

  @override
  String get lessonBigEdgesDesc =>
      'Pagdugtungin ang mga wing para maging buong edge.';

  @override
  String get stepBigEdgePair => 'Ipares at ibalik';

  @override
  String get stepBigEdgePairBody =>
      'Inihahanay ng Uw\' ang dalawang magkatugmang wing, ipinapasok ng R U R\' F R\' F\' R ang edge na hindi pa nakapares, at ibinabalik ng Uw ang mga center.';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => 'OLL at PLL parity sa even na cube.';

  @override
  String get stepBigOllParity => 'OLL parity';

  @override
  String get stepBigOllParityBody =>
      'Imposible sa 3×3 ang iisang baligtad na edge. Sa even na cube, babaligtarin pabalik ng algorithm na ito ang edge sa itaas-harap. Maaaring magulo nito ang natitirang bahagi ng itaas na layer, na aayusin din naman ng mga huling hakbang ng 3×3.';

  @override
  String get stepBigPllParity => 'PLL parity';

  @override
  String get stepBigPllParityBody =>
      'Dalawang edge na nagkapalit sa pinakadulo? Pinagpapalit ng 2R2 U2 2R2 Uw2 2R2 Uw2 ang edge sa itaas-harap at itaas-likod.';

  @override
  String get introGoalHeading => 'Ano ang layunin?';

  @override
  String get introHowHeading => 'Paano ito gagawin?';

  @override
  String get introStart => 'Gets ko, simulan nang paisa-isa';

  @override
  String get introShowGoal => 'Ipakita ang layunin';

  @override
  String get introStateStart => 'Simula';

  @override
  String get introStateGoal => 'Layunin';

  @override
  String get introPlayMorph => 'I-play mula simula hanggang layunin';

  @override
  String get introGoalBasics =>
      'Matutong basahin ang cube: ang mga piraso, ang anim na mukha, at kung paano sila iniikot ng mga letra ng galaw.';

  @override
  String get introGoalCross =>
      'Bumuo ng puting cross kung saan tugma rin ang bawat puting edge sa kulay ng center na katabi nito.';

  @override
  String get introGoalCorners =>
      'Punan ang apat na puting kanto para buo na ang unang korona, ang buong puting layer.';

  @override
  String get introGoalMiddle =>
      'Ilagay ang apat na edge ng gitnang layer para tapos na ang unang dalawang layer.';

  @override
  String get introGoalYellowCross =>
      'Bumuo ng dilaw na cross sa itaas; hindi pa kailangang tumugma ang mga kulay sa gilid.';

  @override
  String get introGoalYellowEdges =>
      'Itugma ang bawat edge ng dilaw na cross sa kulay ng center sa gilid nito.';

  @override
  String get introGoalYellowCorners =>
      'Ilipat ang bawat dilaw na kanto sa sarili nitong puwesto, kahit nakapihit pa.';

  @override
  String get introGoalTwistCorners =>
      'Pihitin ang mga dilaw na kanto sa tamang kulay para buo na ang cube.';

  @override
  String get introGoalCfopIntro =>
      'Kilalanin ang plano ng speedcubing: cross, unang dalawang layer, at huling layer sa dalawang tingin.';

  @override
  String get introGoalF2l =>
      'Ipasok ang bawat puting kanto kasama ang edge nito sa gitna para matapos ang dalawang layer nang sabay.';

  @override
  String get introGoalOll =>
      'Padilawin ang buong itaas na mukha gamit ang isa o dalawang algorithm.';

  @override
  String get introGoalPll =>
      'Ilipat ang mga piraso ng huling layer sa puwesto nila para matapos ang cube.';

  @override
  String get introGoalTwoFirst => 'Bumuo ng isang buong puting layer sa 2×2.';

  @override
  String get introGoalTwoOll => 'Padilawin ang buong itaas na mukha ng 2×2.';

  @override
  String get introGoalTwoPbl =>
      'Ipagpalit ang huling mga kanto sa puwesto nila para malutas ang 2×2.';

  @override
  String get introGoalBigIntro =>
      'Kilalanin ang 4×4: mga center, pares ng edge at kanto, at ang mga galaw na umiikot sa kanila.';

  @override
  String get introGoalBigCenters =>
      'Tipunin ang mga center piece ng bawat mukha sa iisang bloke ng kulay.';

  @override
  String get introGoalBigEdges =>
      'Pagpares-parisin ang magkakatugmang edge piece para magmukhang iisang 3×3 edge ang bawat edge.';

  @override
  String get introGoalBigParity =>
      'Ayusin ang dalawang kaso ng 4×4 na wala sa 3×3: isang baligtad na edge o dalawang nagpalit na edge.';

  @override
  String get introHowBasics =>
      'Hindi gumagalaw ang mga center, kaya sila ang nagsasabi ng kulay ng bawat mukha.\nAng bawat letra ay umiikot ng isang mukha nang quarter turn pakanan.\nAng apostrophe (\') ay pabalik; ang 2 ay dalawang beses.';

  @override
  String get introHowCross =>
      'Hawakan nang dilaw sa itaas: sa ibaba binubuo ang puting cross.\nMaghanap ng puting edge at ihanay ang kulay sa gilid nito sa tamang center.\nIikot nang dalawang beses ang mukhang iyon para ibaba ang edge sa puwesto.';

  @override
  String get introHowCorners =>
      'Dalhin ang isang puting kanto sa itaas ng bakanteng puwesto nito.\nUlitin ang R U R\' U\' hanggang pumasok ito nang tama ang harap.\nGanoon din sa tatlo pang kanto.';

  @override
  String get introHowMiddle =>
      'Maghanap ng edge sa itaas na walang dilaw at itugma ang harap na kulay nito sa center.\nIpadala ito pakanan o pakaliwa gamit ang maikling algorithm na may 8 galaw.\nBumabalik nang buo ang puting layer sa bawat beses.';

  @override
  String get introHowYellowCross =>
      'Tingnan ang itaas: tuldok, hugis-L, o linya.\nHawakan gaya ng nasa larawan at gawin ang F R U R\' U\' F\'.\nUlitin hanggang lumabas ang dilaw na cross.';

  @override
  String get introHowYellowEdges =>
      'Iikot ang itaas hanggang tumugma ang dalawang edge sa center nila.\nIlagay sila sa likod at kanan, saka gawin ang R U R\' U R U2 R\' U.\nUlitin hanggang tumugma ang apat.';

  @override
  String get introHowYellowCorners =>
      'Nasa puwesto ang kanto kapag tugma ang mga kulay nito sa tatlong mukhang nakapaligid.\nIlagay sa harap-kanan ang isang kantong nasa puwesto na.\nPinapaikot ng U R U\' L\' U R\' U\' L ang tatlo pa hanggang magkasya lahat.';

  @override
  String get introHowTwistCorners =>
      'Hawakan sa harap-kanan ang isang kantong hindi pa tapos.\nUlitin ang R\' D\' R D hanggang nakaharap sa itaas ang dilaw nito.\nItaas lang ang iikot para sa susunod; kusang aayos ang ibaba sa dulo.';

  @override
  String get introHowCfopIntro =>
      'Cross: apat na edge na pinaplano habang nag-i-inspect.\nF2L: magkasamang pumapasok ang bawat kanto at ang edge nito.\nPinadidilaw ng OLL ang itaas, saka ibinabalik ng PLL ang mga piraso.';

  @override
  String get introHowF2l =>
      'Maghanap ng kanto at ng katugmang edge nito sa itaas na layer.\nPagpares-parisin sila sa itaas ng slot nila.\nIpasok ang pares sa tatlo o apat na galaw.';

  @override
  String get introHowOll =>
      'Una ang dilaw na cross gamit ang F R U R\' U\' F\'.\nSaka i-orient ang mga kanto, halimbawa gamit ang Sune.\nKilalanin ang kaso mula sa dilaw na nakikita mo.';

  @override
  String get introHowPll =>
      'Dilaw na lahat ang itaas.\nNagpapalit ng kanto ang T-perm; nagpapaikot ng tatlong edge ang U-perm.\nBasahin ang mga kulay sa gilid para pumili ng algorithm.';

  @override
  String get introHowTwoFirst =>
      'Puro kanto lang ang 2×2, parang 3×3 na walang edge.\nDalhin ang bawat puting kanto sa itaas ng puwesto nito.\nUlitin ang R U R\' U\' hanggang pumasok ito.';

  @override
  String get introHowTwoOll =>
      'Panatilihin sa ibaba ang puting layer.\nPinipihit ng Sune (R U R\' U R U2 R\') ang mga kanto sa itaas.\nUlitin mula sa tamang anggulo hanggang dilaw na lahat ang itaas.';

  @override
  String get introHowTwoPbl =>
      'Maghanap ng gilid na may dalawang kantong tugma na.\nMagkatabing palitan: isang algorithm na parang T-perm.\nPahilis na palitan: isang mas mahabang algorithm.';

  @override
  String get introHowBigIntro =>
      'Walang nakapirming center: apat na center piece ang bumubuo sa kulay ng mukha.\nAng mga wide na galaw tulad ng Rw ay umiikot ng dalawang layer nang sabay.\nAng mga inner na galaw tulad ng 2R ay umiikot ng isang inner slice lang.';

  @override
  String get introHowBigCenters =>
      'Buuin muna ang dalawang magkatapat na center.\nNagpapalit ng center piece ang mga inner slice nang hindi sinisira ang tapos na.\nTapusin ang huling apat na center sa parehong paraan.';

  @override
  String get introHowBigEdges =>
      'Maghanap ng dalawang edge piece na pareho ang kulay.\nIhanay sila nang magkatabi gamit ang inner slice.\nItabi ang pares at ibalik ang mga center.';

  @override
  String get introHowBigParity =>
      'Lutasin ang 4×4 na parang 3×3 hanggang maipit.\nIsang baligtad na edge: ang mahabang OLL parity algorithm.\nDalawang nagpalit na edge: 2R2 U2 2R2 Uw2 2R2 Uw2.';
}
