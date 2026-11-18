// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      '2×2 से 6×6 तक हर क्यूब को स्कैन करें, हल करें और उसमें माहिर बनें।';

  @override
  String get chooseCubeSize => 'अपना क्यूब चुनें';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'शुरुआती';

  @override
  String get cubeLevel3 => 'क्लासिक';

  @override
  String get cubeLevel4 => 'एडवांस्ड';

  @override
  String get cubeLevel5 => 'विशेषज्ञ';

  @override
  String get cubeLevel6 => 'मास्टर';

  @override
  String get chooseMode => 'आप क्या करना चाहते हैं?';

  @override
  String get modePlayground => '3D प्लेग्राउंड';

  @override
  String get modePlaygroundDesc =>
      '3D में परतें घुमाएँ, क्यूब बिगाड़ें और चालें दोबारा चलाएँ।';

  @override
  String get modeScanSolve => 'स्कैन करें और हल करें';

  @override
  String get modeScanSolveDesc => 'कैमरे से अपना क्यूब स्कैन करें और हल पाएँ।';

  @override
  String get modeAcademy => 'अकादमी';

  @override
  String get modeAcademyDesc => 'इंटरैक्टिव पाठों के साथ कदम-दर-कदम सीखें।';

  @override
  String get comingSoon => 'जल्द आ रहा है';

  @override
  String get comingSoonMessage => 'यह सुविधा आने वाले अपडेट में आएगी।';

  @override
  String get language => 'भाषा';

  @override
  String get languageSearch => 'भाषा खोजें';

  @override
  String get languageNoResults => 'आपकी खोज से कोई भाषा मेल नहीं खाती।';

  @override
  String playgroundTitle(int size) {
    return '$size×$size प्लेग्राउंड';
  }

  @override
  String get scramble => 'स्क्रैम्बल';

  @override
  String get reset => 'रीसेट';

  @override
  String get undo => 'पूर्ववत करें';

  @override
  String get speed => 'गति';

  @override
  String get xray => 'एक्स-रे';

  @override
  String get prime => 'प्राइम';

  @override
  String get wide => 'वाइड';

  @override
  String layer(int index) {
    return 'परत $index';
  }

  @override
  String get cubeRotations => 'घुमाव';

  @override
  String get play => 'चलाएँ';

  @override
  String get pause => 'रोकें';

  @override
  String get nextStep => 'अगला';

  @override
  String get previousStep => 'पिछला';

  @override
  String get playbackTitle => 'प्लेबैक';

  @override
  String get playbackEmpty =>
      'हल का प्लेबैक बनाने के लिए क्यूब को स्क्रैम्बल करें।';

  @override
  String playbackProgress(int current, int total) {
    return 'चरण $current / $total';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count चालें',
      one: '1 चाल',
      zero: 'कोई चाल नहीं',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'हल हो गया';

  @override
  String get scrambled => 'बिगड़ा हुआ';

  @override
  String get orbitHint =>
      'किसी पंक्ति को घुमाने के लिए खींचें · दृश्य घुमाने के लिए पृष्ठभूमि खींचें';

  @override
  String get notationPad => 'नोटेशन पैड';

  @override
  String get solve => 'हल करें';

  @override
  String get solving => 'हल हो रहा है…';

  @override
  String get solveChooseMethod => 'आप इसे कैसे हल करना चाहते हैं?';

  @override
  String get solveFast => 'तेज़ हल';

  @override
  String get solveFastDesc => 'कोसिएम्बा का टू-फ़ेज़ एल्गोरिदम · लगभग 20 चालें';

  @override
  String get solveLearn => 'कदम-दर-कदम सीखें';

  @override
  String get solveLearnDesc => 'व्याख्या के साथ शुरुआती परत-दर-परत तरीका';

  @override
  String solveUnavailable(int size) {
    return '$size×$size सॉल्वर किसी अगले अपडेट में आएगा।';
  }

  @override
  String get solveAlreadySolved => 'क्यूब पहले से हल है।';

  @override
  String solveFailed(String reason) {
    return 'यह क्यूब हल नहीं किया जा सकता ($reason)।';
  }

  @override
  String get solveEngineMissing => 'इस डिवाइस पर सॉल्विंग इंजन उपलब्ध नहीं है।';

  @override
  String get solveComplete => 'हल हो गया! बहुत बढ़िया।';

  @override
  String solveSummary(int count) {
    return '$count चालें';
  }

  @override
  String get nextMove => 'अगली चाल';

  @override
  String get guideSwipeHint =>
      'चमकती परत को तीर की दिशा में स्वाइप करें, या अगला दबाएँ।';

  @override
  String get guideRotateHint => 'तीर के अनुसार पूरा क्यूब घुमाएँ: अगला दबाएँ।';

  @override
  String get guideWrongMove => 'हाइलाइट किए गए तीर का पालन करें';

  @override
  String get guideExit => 'गाइड से बाहर निकलें';

  @override
  String get replayStep => 'चरण दोबारा चलाएँ';

  @override
  String get colorWhite => 'सफ़ेद';

  @override
  String get colorYellow => 'पीला';

  @override
  String get colorGreen => 'हरा';

  @override
  String get colorBlue => 'नीला';

  @override
  String get colorRed => 'लाल';

  @override
  String get colorOrange => 'नारंगी';

  @override
  String get phaseOptimal2x2 => 'सबसे छोटा हल';

  @override
  String get phaseKociemba1 => 'चरण 1 · टुकड़ों की दिशा ठीक करें';

  @override
  String get phaseKociemba2 => 'चरण 2 · क्यूब पूरा करें';

  @override
  String get phaseLblOrient => 'क्यूब पकड़ें';

  @override
  String get phaseLblCross => 'सफ़ेद क्रॉस';

  @override
  String get phaseLblCorners => 'सफ़ेद कोने';

  @override
  String get phaseLblMiddle => 'बीच की परत';

  @override
  String get phaseLblYellowCross => 'पीला क्रॉस';

  @override
  String get phaseLblYellowEdges => 'पीले एज';

  @override
  String get phaseLblYellowCorners => 'पीले कोने जगह पर रखें';

  @override
  String get phaseLblYellowCornersOrient => 'पीले कोने घुमाएँ';

  @override
  String get explainOptimal2x2 =>
      'सबसे छोटा संभव हल, जो 2×2 की हर स्थिति को खोजकर मिला है।';

  @override
  String get explainKociemba1 =>
      'हर टुकड़े की दिशा ठीक करें और बीच की परत के एज को बीच की परत में इकट्ठा करें।';

  @override
  String get explainKociemba2 =>
      'सिर्फ़ U, D और आधे घुमावों से पूरा करें, जो उस दिशा को बनाए रखते हैं।';

  @override
  String get explainLblOrient =>
      'पूरे क्यूब को घुमाएँ ताकि सफ़ेद केंद्र नीचे की ओर हो।';

  @override
  String explainLblCrossEdge(String piece) {
    return '$piece एज को सफ़ेद केंद्र के पास नीचे लाएँ, ताकि उसका साइड रंग मेल खाए।';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece कोना गलत जगह फँसा है। उसे R U R\' U\' से ऊपर लाएँ।';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'ऊपरी परत घुमाएँ जब तक $piece कोना अपनी जगह के ठीक ऊपर न आ जाए।';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'R U R\' U\' दोहराएँ जब तक $piece कोना अपनी जगह पर न बैठ जाए।';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece एज बीच की परत में है, पर गलत तरीके से। उसे ऊपर निकालें।';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'ऊपरी परत घुमाएँ ताकि $piece एज का साइड रंग उसके केंद्र से मेल खाए।';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '$piece एज को दाईं ओर डालें: U R U\' R\' U\' F\' U F।';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '$piece एज को बाईं ओर डालें: U\' L\' U L U F U\' F\'।';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'अगले एल्गोरिदम के लिए पीली आकृति को सही जगह लाने हेतु ऊपरी परत घुमाएँ।';

  @override
  String get explainLblYellowCrossAlg =>
      'F R U R\' U\' F\' से पीला क्रॉस बनाएँ।';

  @override
  String get explainLblYellowEdgesAlign =>
      'पीले एज को उनके केंद्रों से मिलाने के लिए ऊपरी परत घुमाएँ।';

  @override
  String get explainLblYellowEdgesAlg =>
      'R U R\' U R U2 R\' U से पीले एज की अदला-बदली करें।';

  @override
  String get explainLblYellowCornersAlg =>
      'U R U\' L\' U R\' U\' L से पीले कोनों को उनकी जगह पर घुमाएँ।';

  @override
  String get explainLblNextCorner =>
      'अगले बिना हल हुए पीले कोने को आगे-दाईं ओर लाने के लिए ऊपरी परत घुमाएँ।';

  @override
  String get explainLblCornerTwist =>
      'R\' D\' R D दोहराएँ जब तक पीला ऊपर न आ जाए। नीचे की परत आख़िर में अपने-आप ठीक हो जाती है।';

  @override
  String get explainLblFinalAlign => 'क्यूब पूरा करने के लिए ऊपरी परत घुमाएँ।';

  @override
  String scanTitle(int size) {
    return '$size×$size स्कैन करें';
  }

  @override
  String get scanManualInput => 'रंग ख़ुद दर्ज करें';

  @override
  String get scanUseCamera => 'कैमरे से स्कैन करें';

  @override
  String scanFaceProgress(int current, int total) {
    return 'फ़ेस $current / $total';
  }

  @override
  String get faceUp => 'ऊपरी फ़ेस';

  @override
  String get faceRight => 'दायाँ फ़ेस';

  @override
  String get faceFront => 'सामने का फ़ेस';

  @override
  String get faceDown => 'निचला फ़ेस';

  @override
  String get faceLeft => 'बायाँ फ़ेस';

  @override
  String get faceBack => 'पीछे का फ़ेस';

  @override
  String get scanHintFront =>
      'क्यूब को किसी भी फ़ेस को अपनी ओर करके पकड़ें। यही आपका सामने का फ़ेस है: स्कैन करते समय ऊपर वाला फ़ेस न बदलें।';

  @override
  String get scanHintRight =>
      'सामने वाले फ़ेस से, पूरे क्यूब को एक बार बाईं ओर घुमाएँ ताकि दायाँ फ़ेस आपकी ओर हो।';

  @override
  String get scanHintBack =>
      'सामने वाले फ़ेस से, पूरे क्यूब को दो बार बाईं ओर घुमाएँ।';

  @override
  String get scanHintLeft =>
      'सामने वाले फ़ेस से, पूरे क्यूब को एक बार दाईं ओर घुमाएँ।';

  @override
  String get scanHintUp =>
      'सामने वाले फ़ेस से, ऊपरी हिस्से को अपनी ओर झुकाएँ ताकि वह कैमरे की ओर हो।';

  @override
  String get scanHintDown =>
      'सामने वाले फ़ेस से, निचले हिस्से को अपनी ओर झुकाएँ ताकि वह कैमरे की ओर हो।';

  @override
  String get scanAlignHint => 'ग्रिड को फ़ेस से भरें, फिर शटर दबाएँ।';

  @override
  String get scanCapture => 'फ़ेस कैप्चर करें';

  @override
  String get scanTurnLeft => 'पूरे क्यूब को बाईं ओर घुमाएँ';

  @override
  String get scanTurnRight => 'पूरे क्यूब को दाईं ओर घुमाएँ';

  @override
  String get scanTipTop => 'ऊपरी हिस्से को अपनी ओर झुकाएँ';

  @override
  String get scanTipBottom => 'निचले हिस्से को अपनी ओर झुकाएँ';

  @override
  String get scanGlareTip =>
      'चमक दिख रही है: क्यूब को थोड़ा झुकाएँ, या ऊपर की रोशनी रोकने के लिए फ़ोन को उसके ऊपर रखें।';

  @override
  String get scanDimTip =>
      'रोशनी बहुत कम है: ज़्यादा रोशनी वाली जगह पर जाएँ या फ़्लैशलाइट चालू करें।';

  @override
  String get scanTorch => 'फ़्लैशलाइट';

  @override
  String get scanGuideLabel =>
      'स्कैन गाइड: स्कैन किए गए फ़ेस रंग में दिखते हैं। किसी स्कैन किए गए फ़ेस को दोबारा स्कैन करने के लिए उस पर टैप करें।';

  @override
  String get scanTapToRescan =>
      'किसी स्कैन किए गए फ़ेस को दोबारा स्कैन करने के लिए उस पर टैप करें।';

  @override
  String get scanCameraMissing => 'इस डिवाइस पर कोई कैमरा नहीं मिला।';

  @override
  String get scanCameraDenied =>
      'कैमरे की अनुमति नहीं मिली। आप अब भी रंग ख़ुद दर्ज कर सकते हैं।';

  @override
  String get scanCameraFailed => 'कैमरा शुरू नहीं हो सका।';

  @override
  String get scanAllGood => 'सभी स्टिकर सही लग रहे हैं।';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count स्टिकर गलत लग रहे हैं',
      one: '1 स्टिकर गलत लग रहा है',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'कुछ ठीक नहीं बैठ रहा';

  @override
  String scanIssueColors(int count) {
    return 'हर रंग ठीक $count बार दिखना चाहिए।';
  }

  @override
  String get scanIssueCenters => 'दो केंद्रों का रंग एक जैसा है।';

  @override
  String get scanIssuePieces =>
      'ये स्टिकर ऐसे टुकड़े बनाते हैं जो असली क्यूब में होते ही नहीं।';

  @override
  String get scanIssueTwist => 'एक कोना मुड़ा हुआ है। कोनों के स्टिकर जाँचें।';

  @override
  String get scanIssueFlip => 'एक एज उलटा है। एज के स्टिकर जाँचें।';

  @override
  String get scanIssueParity => 'लगता है दो टुकड़े आपस में बदल गए हैं।';

  @override
  String get scanIssueUnavailable => 'इस डिवाइस पर रंग जाँच उपलब्ध नहीं है।';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count स्टिकर पढ़ना मुश्किल था: उन्हें एक बार देख लें।',
      one: '1 स्टिकर पढ़ना मुश्किल था: उसे एक बार देख लें।',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'रंग बदलने के लिए स्टिकर पर टैप करें · पैलेट के लिए देर तक दबाएँ';

  @override
  String get scanRescanFace => 'कोई फ़ेस दोबारा स्कैन करें';

  @override
  String get scanCancelRescan => 'रंगों पर वापस जाएँ';

  @override
  String get scanPaletteTitle => 'रंग चुनें';

  @override
  String get scanOpen3d => '3D में खोलें';

  @override
  String get scanRestart => 'फिर से शुरू करें';

  @override
  String get modeTimer => 'स्पीड टाइमर';

  @override
  String get modeTimerDesc => 'स्क्रैम्बल, इंस्पेक्शन, औसत और पर्सनल बेस्ट।';

  @override
  String get modeDaily => 'डेली चैलेंज';

  @override
  String get modeDailyDesc =>
      'हर दिन एक नया स्क्रैम्बल। अपनी स्ट्रीक बनाए रखें।';

  @override
  String get modePatterns => 'पैटर्न लाइब्रेरी';

  @override
  String get modePatternsDesc =>
      'चेकरबोर्ड, सुपरफ़्लिप और भी बहुत कुछ, 3D में।';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन की स्ट्रीक',
      one: '1 दिन की स्ट्रीक',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'सीखना जारी रखें';

  @override
  String get startLearning => 'सीखना शुरू करें';

  @override
  String lessonOf(int index, int total) {
    return 'पाठ $index / $total';
  }

  @override
  String get academyAllDone => 'सभी पाठ पूरे हो गए!';

  @override
  String get academyTitle => 'अकादमी';

  @override
  String academyProgress(int done, int total) {
    return '$total में से $done पाठ पूरे';
  }

  @override
  String get lessonAdvanced => 'एडवांस्ड';

  @override
  String get lessonDone => 'पूरा';

  @override
  String lessonPartOf(int index, int total) {
    return 'भाग $index / $total';
  }

  @override
  String get lessonBack => 'वापस';

  @override
  String get lessonNext => 'आगे';

  @override
  String get lessonFinish => 'पाठ पूरा करें';

  @override
  String get lessonComplete => 'पाठ पूरा हुआ!';

  @override
  String get lessonNextLesson => 'अगला पाठ';

  @override
  String get lessonBackToAcademy => 'अकादमी पर वापस जाएँ';

  @override
  String get lessonShowMe => 'मुझे दिखाएँ';

  @override
  String get lessonTryIt =>
      'अब आपकी बारी: तीर जो परत दिखा रहा है उसे स्वाइप करें, या मुझे दिखाएँ दबाएँ।';

  @override
  String get lessonLookAround =>
      'क्यूब को हर तरफ़ से देखने के लिए पृष्ठभूमि खींचें।';

  @override
  String get lessonDemoDone => 'बढ़िया! जारी रखने के लिए आगे दबाएँ।';

  @override
  String holdPrompt(String top, String front) {
    return 'क्यूब को ऐसे पकड़ें कि $top केंद्र ऊपर हो और $front केंद्र आपकी ओर हो।';
  }

  @override
  String get trackBeginner => 'शुरुआती 3×3 (परत-दर-परत)';

  @override
  String get trackCfop => 'CFOP का परिचय';

  @override
  String get trackTwoByTwo => '2×2 शुरुआती और Ortega';

  @override
  String get trackBigCubes => 'बड़े क्यूब: रिडक्शन और पैरिटी';

  @override
  String moveSentence(String layer, String direction) {
    return '$layer को $direction घुमाएँ';
  }

  @override
  String get moveFaceR => 'दाएँ फ़ेस';

  @override
  String get moveFaceL => 'बाएँ फ़ेस';

  @override
  String get moveFaceU => 'ऊपरी फ़ेस';

  @override
  String get moveFaceD => 'निचले फ़ेस';

  @override
  String get moveFaceF => 'सामने के फ़ेस';

  @override
  String get moveFaceB => 'पीछे के फ़ेस';

  @override
  String moveLayerInner(int depth, String face) {
    return '$face से परत $depth';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth परतें गहराई तक)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '$face से परतें $near–$far';
  }

  @override
  String get moveLayerMiddle => 'बीच की परत';

  @override
  String get moveDirUp => 'ऊपर की ओर';

  @override
  String get moveDirDown => 'नीचे की ओर';

  @override
  String get moveDirLeft => 'बाईं ओर';

  @override
  String get moveDirRight => 'दाईं ओर';

  @override
  String get moveDirClockwise => 'घड़ी की दिशा में';

  @override
  String get moveDirCounter => 'घड़ी की उलटी दिशा में';

  @override
  String get moveDirBackClockwise => 'घड़ी की दिशा में, पीछे से देखने पर';

  @override
  String get moveDirBackCounter => 'घड़ी की उलटी दिशा में, पीछे से देखने पर';

  @override
  String get moveDirHalf => 'आधा चक्कर (दो बार)';

  @override
  String get moveRotateX =>
      'पूरे क्यूब को झुकाएँ: सामने वाला हिस्सा ऊपर जाता है';

  @override
  String get moveRotateXPrime =>
      'पूरे क्यूब को झुकाएँ: सामने वाला हिस्सा नीचे जाता है';

  @override
  String get moveRotateX2 =>
      'पूरे क्यूब को पलटें: सामने वाला हिस्सा पीछे जाता है';

  @override
  String get moveRotateY =>
      'पूरे क्यूब को घुमाएँ: सामने वाला हिस्सा बाईं ओर जाता है';

  @override
  String get moveRotateYPrime =>
      'पूरे क्यूब को घुमाएँ: सामने वाला हिस्सा दाईं ओर जाता है';

  @override
  String get moveRotateY2 =>
      'पूरे क्यूब को आधा घुमाएँ: पीछे वाला हिस्सा सामने आता है';

  @override
  String get moveRotateZ =>
      'पूरे क्यूब को घड़ी की दिशा में लुढ़काएँ: ऊपरी हिस्सा दाईं ओर जाता है';

  @override
  String get moveRotateZPrime =>
      'पूरे क्यूब को घड़ी की उलटी दिशा में लुढ़काएँ: ऊपरी हिस्सा बाईं ओर जाता है';

  @override
  String get moveRotateZ2 =>
      'पूरे क्यूब को उलटा करें: ऊपरी हिस्सा नीचे जाता है';

  @override
  String get phaseReductionCenters => 'केंद्र';

  @override
  String get phaseReductionEdges => 'एज जोड़ें';

  @override
  String get phaseReductionEdgeParity => 'एज पैरिटी';

  @override
  String get phaseReductionOllParity => 'OLL पैरिटी';

  @override
  String get phaseReductionPllParity => 'PLL पैरिटी';

  @override
  String get explainReductionCenterBlock =>
      'स्लाइस घुमाव जो कई केंद्र टुकड़ों को एक साथ उनकी जगह पहुँचाते हैं।';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'एक $piece केंद्र टुकड़े को 3-साइकिल से उसके फ़ेस पर लाएँ, जिससे पूरे हो चुके केंद्र नहीं बिगड़ते।';
  }

  @override
  String get explainReductionParityCenters =>
      'पैरिटी स्लाइस घुमाव से हिले केंद्रों को फिर से बनाएँ।';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '$piece एज के टुकड़ों को 3-साइकिल से जोड़ें; केंद्र हल ही रहते हैं।';
  }

  @override
  String get explainReductionEdgeParity =>
      'आख़िरी एज सिर्फ़ 3-साइकिल से नहीं जुड़ सकते (एज पैरिटी)। एक अंदरूनी स्लाइस घुमाव इसे ठीक कर देता है।';

  @override
  String get explainReductionOllParity =>
      'OLL पैरिटी: एक एज उलटा है, जो 3×3 पर असंभव है। यह एल्गोरिदम उसे वापस पलट देता है।';

  @override
  String get explainReductionPllParity =>
      'PLL पैरिटी: दो एज आपस में बदले हुए हैं, जो 3×3 पर असंभव है। यह एल्गोरिदम उन्हें वापस बदल देता है।';

  @override
  String get solveFastBigDesc => 'रिडक्शन: केंद्र, एज और पैरिटी, फिर कोसिएम्बा';

  @override
  String get solveLearnBigDesc =>
      'रिडक्शन, फिर शुरुआती परत-दर-परत तरीके से पूरा';

  @override
  String get patternsTitle => 'पैटर्न लाइब्रेरी';

  @override
  String get patternsHint =>
      'कोई पैटर्न देखने के लिए उस पर टैप करें, फिर अपने क्यूब पर साथ-साथ बनाएँ।';

  @override
  String get patternCheckerboard => 'चेकरबोर्ड';

  @override
  String get patternCubeInCube => 'क्यूब के अंदर क्यूब';

  @override
  String get patternSuperflip => 'सुपरफ़्लिप';

  @override
  String get patternDots => 'बिंदु';

  @override
  String get patternCross => 'क्रॉस';

  @override
  String get patternPython => 'अजगर';

  @override
  String get phasePattern => 'पैटर्न बनाएँ';

  @override
  String get explainPatternStep =>
      'हर चाल अपने क्यूब पर करें। उसे सामान्य करने के लिए हल करें दबाएँ।';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'स्पीड टाइमर';

  @override
  String get timerHoldToStart => 'दबाए रखें, फिर शुरू करने के लिए छोड़ें';

  @override
  String get timerReleaseToStart => 'शुरू करने के लिए छोड़ें';

  @override
  String get timerTapToStop => 'रोकने के लिए कहीं भी टैप करें';

  @override
  String get timerInspecting =>
      'इंस्पेक्शन: दबाए रखें, फिर शुरू करने के लिए छोड़ें';

  @override
  String get timerTapToInspect =>
      '15 सेकंड का इंस्पेक्शन शुरू करने के लिए टैप करें';

  @override
  String get timerInspectionToggle => '15 से. इंस्पेक्शन';

  @override
  String get timerNewScramble => 'नया स्क्रैम्बल';

  @override
  String get timerLoadingScramble => 'स्क्रैम्बल बन रहा है…';

  @override
  String get timerPb => 'बेस्ट';

  @override
  String get timerSolves => 'सॉल्व';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'हटाएँ';

  @override
  String get timerHistory => 'इतिहास';

  @override
  String get timerNoSolves =>
      'अभी तक कोई सॉल्व नहीं। अपना क्यूब स्क्रैम्बल करें और शुरू हो जाएँ!';

  @override
  String get timerNewPb => 'नया पर्सनल बेस्ट!';

  @override
  String get timerClearHistory => 'इतिहास साफ़ करें';

  @override
  String get timerScrambleHint =>
      'सफ़ेद ऊपर और हरा सामने रखें, फिर स्क्रैम्बल करें:';

  @override
  String get dailyTitle => 'डेली चैलेंज';

  @override
  String dailyFor(String date) {
    return '$date का चैलेंज';
  }

  @override
  String dailyBestStreak(int count) {
    return 'सबसे लंबी स्ट्रीक: $count';
  }

  @override
  String get dailyDone => 'आज का काम पूरा! कल फिर आएँ।';

  @override
  String get dailyNotDone =>
      'अपनी स्ट्रीक बनाए रखने के लिए आज का स्क्रैम्बल हल करें।';

  @override
  String get dailySolveVirtual => '3D क्यूब पर हल करें';

  @override
  String get dailyTimeIt => 'अपने क्यूब पर समय मापें';

  @override
  String get dailyHint => 'संकेत';

  @override
  String dailyHintText(String moves) {
    return 'सफ़ेद क्रॉस से शुरू करें: $moves';
  }

  @override
  String get dailyHintFailed => 'अभी कोई संकेत उपलब्ध नहीं है।';

  @override
  String get lessonBasics => 'क्यूब से मिलिए';

  @override
  String get lessonBasicsDesc => 'टुकड़े, फ़ेस और चालों के नाम।';

  @override
  String get stepBasicsPieces => 'तीन तरह के टुकड़े';

  @override
  String get stepBasicsPiecesBody =>
      'केंद्र कभी नहीं हिलते और हर फ़ेस को उसका रंग देते हैं। एज के दो रंग होते हैं, कोनों के तीन। हल करने का मतलब है हर एज और हर कोने को उनके रंगों वाले केंद्रों के पास पहुँचाना।';

  @override
  String get stepBasicsFaces => 'फ़ेस के छह अक्षर';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F और B का मतलब है दायाँ, बायाँ, ऊपरी, निचला, सामने का और पीछे का फ़ेस। सिर्फ़ अक्षर का मतलब है घड़ी की दिशा में चौथाई घुमाव, जैसे आप उसी फ़ेस को सीधे देख रहे हों।';

  @override
  String get stepBasicsPrime => 'प्राइम और दोहरे घुमाव';

  @override
  String get stepBasicsPrimeBody =>
      'एपॉस्ट्रॉफ़ी (R\') का मतलब है उलटी दिशा में, यानी घड़ी की उलटी दिशा में घुमाना। 2 (U2) का मतलब है आधा घुमाव: दो चौथाई घुमाव।';

  @override
  String get lessonCross => 'सफ़ेद क्रॉस';

  @override
  String get lessonCrossDesc => 'नीचे एक सफ़ेद क्रॉस बनाएँ।';

  @override
  String get stepCrossGoal => 'लक्ष्य';

  @override
  String get stepCrossGoalBody =>
      'पीला ऊपर रखें। चारों सफ़ेद एज नीचे सफ़ेद केंद्र के चारों ओर होते हैं, और हर एक का साइड रंग बगल वाले केंद्र से मेल खाता है।';

  @override
  String get stepCrossTop => 'ऊपर वाला एज';

  @override
  String get stepCrossTopBody =>
      'ऊपर कोई सफ़ेद एज ढूँढें। ऊपरी परत घुमाएँ जब तक उसका साइड रंग मेल खाने वाले केंद्र के ऊपर न आ जाए, फिर उस फ़ेस को दो बार घुमाकर एज को नीचे ले आएँ।';

  @override
  String get stepCrossMiddle => 'बीच वाला एज';

  @override
  String get stepCrossMiddleBody =>
      'बीच की परत में फँसा एज पहले ऊपर जाता है: उसकी साइड को ऊपर घुमाएँ, ऊपरी परत को रास्ते से हटाएँ और साइड को वापस घुमाएँ, ताकि क्रॉस न टूटे। फिर उसे ऊपर से रखें।';

  @override
  String get lessonCorners => 'सफ़ेद कोने';

  @override
  String get lessonCornersDesc => 'पहली परत पूरी करें।';

  @override
  String get stepCornersInsert => 'अपनी जगह के ऊपर';

  @override
  String get stepCornersInsertBody =>
      'ऊपरी परत घुमाएँ जब तक कोई सफ़ेद कोना आगे-दाईं ओर अपने रंगों की जगह के ऊपर न आ जाए। R U R\' U\' उसे अंदर डाल देता है।';

  @override
  String get stepCornersRepeat => 'ट्रिगर दोहराएँ';

  @override
  String get stepCornersRepeatBody =>
      'अगर सफ़ेद गलत दिशा में है, तो उसी जगह पर R U R\' U\' दोहराते रहें। हर कोना ज़्यादा से ज़्यादा पाँच बार में हल हो जाता है।';

  @override
  String get lessonMiddle => 'बीच की परत';

  @override
  String get lessonMiddleDesc => 'बीच के चारों एज डालें।';

  @override
  String get stepMiddleRight => 'एज दाईं ओर';

  @override
  String get stepMiddleRightBody =>
      'ऊपर के किसी एज को सामने उसके केंद्र से मिलाएँ। अगर उसका ऊपरी रंग दाएँ केंद्र से मेल खाता है, तो उसे U R U\' R\' U\' F\' U F से डालें।';

  @override
  String get stepMiddleLeft => 'एज बाईं ओर';

  @override
  String get stepMiddleLeftBody =>
      'अगर उसका ऊपरी रंग बाएँ केंद्र से मेल खाता है, तो उलटा रूप इस्तेमाल करें: U\' L\' U L U F U\' F\'।';

  @override
  String get lessonLastLayer => 'पीला क्रॉस और एज';

  @override
  String get lessonLastLayerDesc => 'ऊपर क्रॉस बनाएँ और उसके एज मिलाएँ।';

  @override
  String get stepYellowCross => 'एक ही एल्गोरिदम';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' पीले बिंदु को L में, L को रेखा में और रेखा को क्रॉस में बदलता है। L को पीछे-बाईं ओर और रेखा को आड़ा पकड़ें।';

  @override
  String get stepYellowEdges => 'एज मिलाएँ';

  @override
  String get stepYellowEdgesBody =>
      'ऊपरी परत घुमाएँ जब तक दो एज अपने केंद्रों से मेल न खाएँ। एक पीछे और एक दाईं ओर हो, तो R U R\' U R U2 R\' U बाकी दो की अदला-बदली कर देता है।';

  @override
  String get lessonLastCorners => 'पीले कोने';

  @override
  String get lessonLastCornersDesc => 'आख़िरी कोनों को जगह पर रखें और घुमाएँ।';

  @override
  String get stepPlaceCorners => 'जगह पर रखें';

  @override
  String get stepPlaceCornersBody =>
      'जो कोना पहले से अपनी जगह पर है, उसे आगे-दाईं ओर रखें। U R U\' L\' U R\' U\' L बाकी तीन को घुमाता है; तब तक दोहराएँ जब तक चारों अपनी जगह न आ जाएँ।';

  @override
  String get stepTwistCorners => 'घुमाएँ';

  @override
  String get stepTwistCornersBody =>
      'बिना हल हुए कोने को आगे-दाईं ओर रखकर R\' D\' R D दोहराएँ जब तक पीला ऊपर न आ जाए, फिर अगला कोना लाने के लिए सिर्फ़ ऊपरी परत घुमाएँ। नीचे की परत बिल्कुल आख़िर तक बिगड़ी दिखती है: बस जारी रखें।';

  @override
  String get lessonCfopIntro => 'CFOP क्या है?';

  @override
  String get lessonCfopIntroDesc => 'क्रॉस, F2L, OLL, PLL।';

  @override
  String get stepCfopOverview => 'चार चरण';

  @override
  String get stepCfopOverviewBody =>
      'स्पीडक्यूबर पहले क्रॉस हल करते हैं, फिर पहली परत के हर कोने को उसके बीच वाले एज के साथ जोड़ते हैं (F2L), आख़िरी परत की दिशा ठीक करते हैं (OLL) और अंत में उसके टुकड़ों को सही जगह लगाते हैं (PLL)।';

  @override
  String get stepCfopCross => 'क्रॉस की योजना बनाएँ';

  @override
  String get stepCfopCrossBody =>
      'CFOP में क्रॉस की योजना इंस्पेक्शन के दौरान बनती है और लगभग आठ चालों में नीचे बनाया जाता है।';

  @override
  String get lessonF2l => 'F2L की बुनियाद';

  @override
  String get lessonF2lDesc => 'कोने को उसके एज से जोड़ें।';

  @override
  String get stepF2lRight => 'जोड़ी डालें';

  @override
  String get stepF2lRightBody =>
      'जब कोई कोना और उसका एज ऊपर अगल-बगल हों, तो उन्हें उनके स्लॉट के ऊपर लाएँ और एक साथ डालें।';

  @override
  String get stepF2lLeft => 'बाईं ओर की जोड़ी';

  @override
  String get stepF2lLeftBody =>
      'दूसरी तरफ़ वही स्थिति उलटा रूप है, U\' L\' U L। क्यूब घुमाकर (y) आप जो हाथ आसान लगे उसका इस्तेमाल कर सकते हैं।';

  @override
  String get lessonOll => 'टू-लुक OLL';

  @override
  String get lessonOllDesc => 'ऊपर का हिस्सा पीला करें।';

  @override
  String get stepOllCross => 'पहले एज';

  @override
  String get stepOllCrossBody =>
      'टू-लुक OLL उसी पीले क्रॉस एल्गोरिदम से शुरू होता है जो आप पहले से जानते हैं।';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'जब एक पीला कोना आगे-बाईं ओर ऊपर की तरफ़ हो, तो Sune (R U R\' U R U2 R\') बाकी तीन की दिशा ठीक करता है। ज़्यादातर दूसरी स्थितियाँ Sune और उसके उलटे रूप से हल होती हैं।';

  @override
  String get lessonPll => 'टू-लुक PLL';

  @override
  String get lessonPllDesc => 'क्यूब पूरा करें।';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm दो कोनों और दो एज की अदला-बदली करता है। इससे कोने सही जगह लगाएँ: जिन दो कोनों को बदलना है, उन्हें दाईं ओर रखें।';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'कोने पूरे होने के बाद U-perm तीन एज को घुमाता है। पूरी हो चुकी साइड को पीछे रखें।';

  @override
  String get lessonTwoFirst => '2×2 की पहली परत';

  @override
  String get lessonTwoFirstDesc => 'मेल खाते कोनों से एक फ़ेस बनाएँ।';

  @override
  String get stepTwoIntro => 'सिर्फ़ कोने';

  @override
  String get stepTwoIntroBody =>
      '2×2 असल में बिना एज और केंद्रों वाला 3×3 है। एक रंग चुनें, उस फ़ेस को नीचे बनाएँ और पास-पास के कोनों के साइड रंग मिलाएँ।';

  @override
  String get stepTwoCorner => 'कोने डालें';

  @override
  String get stepTwoCornerBody =>
      'बिल्कुल 3×3 के सफ़ेद कोनों जैसा: कोने को उसकी जगह के ऊपर लाएँ और R U R\' U\' करते रहें जब तक वह बैठ न जाए।';

  @override
  String get lessonTwoOll => 'ऊपर की दिशा ठीक करें';

  @override
  String get lessonTwoOllDesc => 'Sune के साथ Ortega OLL।';

  @override
  String get stepTwoSune => 'फिर से Sune';

  @override
  String get stepTwoSuneBody =>
      'Sune 2×2 पर भी ऊपर का हिस्सा पीला कर देता है। Ortega में सात छोटी स्थितियाँ सीखी जाती हैं; उनमें से ज़्यादातर Sune और उसके उलटे रूप से हो जाती हैं।';

  @override
  String get lessonTwoPbl => 'दोनों परतें सही करें';

  @override
  String get lessonTwoPblDesc => 'पूरा करने के लिए कोने बदलें।';

  @override
  String get stepTwoAdjacent => 'पास-पास की अदला-बदली';

  @override
  String get stepTwoAdjacentBody =>
      'जब ऊपर के दो पास-पास वाले कोनों को बदलना हो, तो उन्हें दाईं ओर रखें और T-perm करें।';

  @override
  String get stepTwoDiagonal => 'तिरछी अदला-बदली';

  @override
  String get stepTwoDiagonalBody =>
      'आमने-सामने की जगहों वाले दो कोने Y-perm से बदलते हैं।';

  @override
  String get lessonBigIntro => 'बड़े क्यूब के टुकड़े';

  @override
  String get lessonBigIntroDesc => 'केंद्र, विंग और स्लाइस।';

  @override
  String get stepBigPieces => 'स्थिर केंद्र नहीं';

  @override
  String get stepBigPiecesBody =>
      '4×4 पर हर फ़ेस में चार हिलने वाले केंद्र टुकड़े होते हैं, और हर एज दो विंग से बनता है। रिडक्शन इन्हें इकट्ठा करता है ताकि क्यूब 3×3 जैसा बर्ताव करे।';

  @override
  String get stepBigSlices => 'वाइड और अंदरूनी घुमाव';

  @override
  String get stepBigSlicesBody =>
      'Rw दाईं ओर की दो परतों को साथ घुमाता है। 2R सिर्फ़ दाईं ओर से दूसरी परत घुमाता है। ये घुमाव केंद्रों और विंग को हिलाते हैं।';

  @override
  String get lessonBigCenters => 'केंद्र';

  @override
  String get lessonBigCentersDesc => 'केंद्र टुकड़ों को इकट्ठा करें।';

  @override
  String get stepBigCenterCycle => 'केंद्रों का 3-साइकिल';

  @override
  String get stepBigCenterCycleBody =>
      'यह कम्यूटेटर ठीक तीन केंद्र टुकड़ों को हिलाता है और बाकी सब वैसा ही छोड़ देता है, इसलिए पूरे हो चुके केंद्र पूरे ही रहते हैं।';

  @override
  String get lessonBigEdges => 'एज जोड़ें';

  @override
  String get lessonBigEdgesDesc => 'विंग को जोड़कर पूरे एज बनाएँ।';

  @override
  String get stepBigEdgePair => 'जोड़ें और वापस लाएँ';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' दो मेल खाते विंग को सीध में लाता है, R U R\' F R\' F\' R बिना जोड़े एज को अंदर लाता है, और Uw केंद्रों को वापस रखता है।';

  @override
  String get lessonBigParity => 'पैरिटी';

  @override
  String get lessonBigParityDesc => 'सम क्यूब पर OLL और PLL पैरिटी।';

  @override
  String get stepBigOllParity => 'OLL पैरिटी';

  @override
  String get stepBigOllParityBody =>
      '3×3 पर अकेला उलटा एज हो ही नहीं सकता। सम क्यूब पर यह एल्गोरिदम ऊपर-सामने वाले एज को वापस पलट देता है। इससे ऊपरी परत का बाकी हिस्सा बिगड़ सकता है, जिसे 3×3 के आख़िरी चरण वैसे भी ठीक कर देते हैं।';

  @override
  String get stepBigPllParity => 'PLL पैरिटी';

  @override
  String get stepBigPllParityBody =>
      'बिल्कुल आख़िर में दो एज बदले हुए हैं? 2R2 U2 2R2 Uw2 2R2 Uw2 ऊपर के सामने और पीछे वाले एज की अदला-बदली करता है।';
}
