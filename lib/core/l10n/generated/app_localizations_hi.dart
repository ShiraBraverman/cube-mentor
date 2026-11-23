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
  String get cubeComingSoon => 'नया क्यूब जल्द आ रहा है';

  @override
  String get carouselPrevious => 'पिछला क्यूब';

  @override
  String get carouselNext => 'अगला क्यूब';

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
  String get solveFast => 'तेज़ हल';

  @override
  String get solveLearn => 'कदम-दर-कदम सीखें';

  @override
  String get solveModeGuided => 'गाइडेड (3 मुकुट)';

  @override
  String get solveModeFast => 'तेज़ (ऑप्टिमल)';

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
  String get previousMove => 'पिछली चाल';

  @override
  String get halfTurnHalfway =>
      'बढ़िया, आधा हो गया! डबल टर्न (180°) के लिए इसे उसी दिशा में एक बार और घुमाएँ।';

  @override
  String get wideTurnInner =>
      'शानदार! अब वाइड घुमाव पूरा करने के लिए बगल वाली अंदरूनी परत स्वाइप करें।';

  @override
  String get wideTurnOuter =>
      'शानदार! अब वाइड घुमाव पूरा करने के लिए बगल वाली बाहरी परत स्वाइप करें।';

  @override
  String get wideTurnMore =>
      'शानदार! वाइड घुमाव पूरा करने के लिए चमकती परतों को एक-एक करके स्वाइप करते रहें।';

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
  String get phaseLblCross => 'सफ़ेद क्रॉस';

  @override
  String get phaseLblCorners => 'पहले मुकुट के कोने';

  @override
  String get phaseLblMiddle => 'बीच की परत के एज';

  @override
  String get phaseLblYellowCross => 'पीला क्रॉस';

  @override
  String get phaseLblYellowEdges => 'पीले क्रॉस के एज मिलाएँ';

  @override
  String get phaseLblYellowCorners => 'पीले कोनों को सही जगह रखें';

  @override
  String get phaseLblYellowCornersOrient => 'पीले कोनों की दिशा ठीक करें';

  @override
  String get crownFirst => 'पहला मुकुट';

  @override
  String get crownSecond => 'दूसरा मुकुट';

  @override
  String get crownThird => 'तीसरा मुकुट';

  @override
  String get crownFirstGoal => 'सफ़ेद फ़ेस और पहली परत';

  @override
  String get crownSecondGoal => 'बीच की परत';

  @override
  String get crownThirdGoal => 'पीला फ़ेस और आख़िरी परत';

  @override
  String get subStepGoal11 =>
      'ऐसा सफ़ेद क्रॉस बनाएँ जिसमें हर सफ़ेद एज बगल वाले केंद्र के रंग से भी मेल खाए।';

  @override
  String get subStepGoal12 =>
      'सफ़ेद फ़ेस और पूरी पहली परत पूरी करने के लिए 4 सफ़ेद कोनों को उनकी सही जगह डालें।';

  @override
  String get subStepGoal21 =>
      'पहले मुकुट को बिगाड़े बिना बीच की परत के 4 एज डालें।';

  @override
  String get subStepGoal31 => 'आख़िरी परत पर पीला क्रॉस बनाएँ।';

  @override
  String get subStepGoal32 =>
      'पीले क्रॉस के एज तब तक बदलें जब तक हर एज अपने साइड के केंद्र से मेल न खाए।';

  @override
  String get subStepGoal33 =>
      '4 पीले कोनों को उनकी सही जगह पर लाएँ, भले ही वे अभी मुड़े हुए हों।';

  @override
  String get subStepGoal34 =>
      'हर पीले कोने को उसी जगह घुमाएँ जब तक सारे स्टिकर मेल न खाएँ और क्यूब हल न हो जाए।';

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
  String lessonPartOf(int index, int total) {
    return 'भाग $index / $total';
  }

  @override
  String get lessonNext => 'आगे';

  @override
  String get lessonPrevious => 'पिछला';

  @override
  String get lessonFinish => 'पाठ पूरा करें';

  @override
  String get lessonComplete => 'पाठ पूरा हुआ!';

  @override
  String get lessonNextLesson => 'अगला पाठ';

  @override
  String get lessonBackToAcademy => 'अकादमी पर वापस जाएँ';

  @override
  String get lessonTryIt =>
      'अब आपकी बारी: तीर जो परत दिखा रहा है उसे स्वाइप करें, या आगे दबाएँ।';

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
  String get trackBeginner => 'शुरुआती 3×3: 3 मुकुट';

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
  String get timerInspectionToggle => '15 से. इंस्पेक्शन';

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

  @override
  String get introGoalHeading => 'लक्ष्य क्या है?';

  @override
  String get introHowHeading => 'यह कैसे करें?';

  @override
  String get introStart => 'समझ गया, कदम-दर-कदम शुरू करें';

  @override
  String get introDontShowAgain => 'इसे फिर अपने-आप न दिखाएँ';

  @override
  String get introShowGoal => 'लक्ष्य दिखाएँ';

  @override
  String get introStateStart => 'शुरुआत';

  @override
  String get introStateGoal => 'लक्ष्य';

  @override
  String get introPlayMorph => 'शुरुआत से लक्ष्य तक चलाएँ';

  @override
  String get introGoalBasics =>
      'क्यूब को पढ़ना सीखें: उसके टुकड़े, छह फलक और चालों के अक्षर उन्हें कैसे घुमाते हैं।';

  @override
  String get introGoalCross =>
      'ऐसा सफ़ेद क्रॉस बनाएँ जिसमें हर सफ़ेद एज बगल वाले केंद्र के रंग से भी मेल खाए।';

  @override
  String get introGoalCorners =>
      'चारों सफ़ेद कोने भरें, ताकि पहला क्राउन यानी पूरी सफ़ेद परत पूरी हो जाए।';

  @override
  String get introGoalMiddle =>
      'बीच की परत के चारों एज रखें, ताकि पहली दो परतें हल हो जाएँ।';

  @override
  String get introGoalYellowCross =>
      'ऊपर पीला क्रॉस बनाएँ; साइड के रंग अभी मिलने ज़रूरी नहीं।';

  @override
  String get introGoalYellowEdges =>
      'पीले क्रॉस के हर एज को उसकी तरफ़ वाले केंद्र के रंग से मिलाएँ।';

  @override
  String get introGoalYellowCorners =>
      'हर पीले कोने को उसकी अपनी जगह पर लाएँ, भले ही वह अभी मुड़ा हो।';

  @override
  String get introGoalTwistCorners =>
      'पीले कोनों को सही रंग की ओर घुमाएँ, ताकि पूरा क्यूब हल हो जाए।';

  @override
  String get introGoalCfopIntro =>
      'स्पीडक्यूबिंग की योजना देखें: क्रॉस, पहली दो परतें, फिर आख़िरी परत दो चरणों में।';

  @override
  String get introGoalF2l =>
      'हर सफ़ेद कोने को उसके बीच वाले एज के साथ डालें और दो परतें एक साथ पूरी करें।';

  @override
  String get introGoalOll => 'एक या दो एल्गोरिदम से पूरा ऊपरी फलक पीला करें।';

  @override
  String get introGoalPll =>
      'आख़िरी परत के टुकड़ों को उनकी जगह पहुँचाकर क्यूब पूरा करें।';

  @override
  String get introGoalTwoFirst => '2×2 पर एक पूरी सफ़ेद परत बनाएँ।';

  @override
  String get introGoalTwoOll => '2×2 का पूरा ऊपरी फलक पीला करें।';

  @override
  String get introGoalTwoPbl => 'आख़िरी कोनों को उनकी जगह बदलकर 2×2 हल करें।';

  @override
  String get introGoalBigIntro =>
      '4×4 से मिलें: केंद्र, एज की जोड़ियाँ और कोने, और उन्हें घुमाने वाली चालें।';

  @override
  String get introGoalBigCenters =>
      'हर फलक के केंद्र टुकड़ों को एक ही रंग के ठोस ब्लॉक में इकट्ठा करें।';

  @override
  String get introGoalBigEdges =>
      'मेल खाते एज टुकड़ों की जोड़ी बनाएँ, ताकि हर एज 3×3 के एक एज जैसा दिखे।';

  @override
  String get introGoalBigParity =>
      '4×4 के वे दो केस ठीक करें जो 3×3 में कभी नहीं होते: एक उल्टा एज या दो बदले हुए एज।';

  @override
  String get introHowBasics =>
      'केंद्र कभी नहीं हिलते, इसलिए वे हर फलक का रंग बताते हैं।\nहर अक्षर एक फलक को घड़ी की दिशा में चौथाई घुमाता है।\nएपॉस्ट्रॉफ़ी (\') उल्टा घुमाता है; 2 दो बार घुमाता है।';

  @override
  String get introHowCross =>
      'पीला ऊपर रखें: सफ़ेद क्रॉस नीचे बनता है।\nएक सफ़ेद एज ढूँढें और उसका साइड रंग सही केंद्र से मिलाएँ।\nउस फलक को दो बार घुमाकर एज को उसकी जगह उतारें।';

  @override
  String get introHowCorners =>
      'एक सफ़ेद कोने को उसकी खाली जगह के ऊपर लाएँ।\nR U R\' U\' तब तक दोहराएँ जब तक वह सही दिशा में न बैठ जाए।\nबाकी तीन कोनों के साथ भी यही करें।';

  @override
  String get introHowMiddle =>
      'ऊपर का ऐसा एज ढूँढें जिसमें पीला न हो, और उसका सामने वाला रंग केंद्र से मिलाएँ।\n8 चालों के छोटे एल्गोरिदम से उसे दाएँ या बाएँ भेजें।\nसफ़ेद परत हर बार ठीक वापस आ जाती है।';

  @override
  String get introHowYellowCross =>
      'ऊपर देखें: एक बिंदु, एक L या एक रेखा।\nजैसा दिखाया है वैसे पकड़ें और F R U R\' U\' F\' करें।\nपीला क्रॉस आने तक दोहराएँ।';

  @override
  String get introHowYellowEdges =>
      'ऊपरी परत तब तक घुमाएँ जब तक दो एज अपने केंद्रों से न मिल जाएँ।\nउन्हें पीछे और दाईं ओर रखें, फिर R U R\' U R U2 R\' U करें।\nचारों एज मिलने तक दोहराएँ।';

  @override
  String get introHowYellowCorners =>
      'कोना अपनी जगह पर तब है जब उसके रंग आसपास के तीनों फलकों से मेल खाएँ।\nसही जगह वाले एक कोने को आगे-दाईं ओर रखें।\nU R U\' L\' U R\' U\' L बाकी तीन को घुमाता है, जब तक सब फ़िट न हो जाएँ।';

  @override
  String get introHowTwistCorners =>
      'एक अनसुलझा कोना आगे-दाईं ओर रखें।\nR\' D\' R D तब तक दोहराएँ जब तक उसका पीला ऊपर न आ जाए।\nअगले कोने के लिए सिर्फ़ ऊपरी परत घुमाएँ; नीचे की परत आख़िर में अपने-आप ठीक हो जाती है।';

  @override
  String get introHowCfopIntro =>
      'क्रॉस: चार एज, जिनकी योजना इंस्पेक्शन में बनती है।\nF2L: हर कोना अपने एज के साथ अंदर जाता है।\nOLL ऊपर को पीला करता है, फिर PLL टुकड़ों को उनकी जगह पहुँचाता है।';

  @override
  String get introHowF2l =>
      'ऊपरी परत में एक कोना और उसका मेल खाता एज ढूँढें।\nउन्हें उनके स्लॉट के ऊपर जोड़ी बनाएँ।\nतीन-चार चालों में जोड़ी को अंदर डालें।';

  @override
  String get introHowOll =>
      'पहले F R U R\' U\' F\' से पीला क्रॉस।\nफिर कोनों को घुमाएँ, जैसे Sune से।\nदिखने वाले पीले पैटर्न से केस पहचानें।';

  @override
  String get introHowPll =>
      'ऊपरी फलक पहले से पूरा पीला है।\nT-perm कोने बदलता है; U-perm तीन एज घुमाता है।\nएल्गोरिदम चुनने के लिए साइड के रंग पढ़ें।';

  @override
  String get introHowTwoFirst =>
      '2×2 में सिर्फ़ कोने होते हैं, जैसे बिना एज का 3×3।\nहर सफ़ेद कोने को उसकी जगह के ऊपर लाएँ।\nR U R\' U\' तब तक दोहराएँ जब तक वह अंदर न बैठ जाए।';

  @override
  String get introHowTwoOll =>
      'सफ़ेद परत नीचे रखें।\nSune (R U R\' U R U2 R\') ऊपर के कोनों को घुमाता है।\nसही कोण से तब तक दोहराएँ जब तक ऊपर पूरा पीला न हो जाए।';

  @override
  String get introHowTwoPbl =>
      'ऐसी साइड ढूँढें जहाँ दो कोने पहले से मेल खाते हों।\nपास-पास अदला-बदली: T-perm जैसा एक एल्गोरिदम।\nतिरछी अदला-बदली: थोड़ा लंबा एक एल्गोरिदम।';

  @override
  String get introHowBigIntro =>
      'कोई केंद्र स्थिर नहीं: चार केंद्र टुकड़े मिलकर फलक का रंग बनाते हैं।\nRw जैसी वाइड चालें दो परतें एक साथ घुमाती हैं।\n2R जैसी अंदरूनी चालें सिर्फ़ एक अंदरूनी परत घुमाती हैं।';

  @override
  String get introHowBigCenters =>
      'पहले दो आमने-सामने के केंद्र बनाएँ।\nअंदरूनी परतें बने हुए केंद्र तोड़े बिना केंद्र टुकड़े बदलती हैं।\nआख़िरी चार केंद्र इसी तरह पूरे करें।';

  @override
  String get introHowBigEdges =>
      'एक जैसे रंगों वाले दो एज टुकड़े ढूँढें।\nअंदरूनी परत से उन्हें अगल-बगल लाएँ।\nजोड़ी को हटाकर रखें और केंद्र वापस लाएँ।';

  @override
  String get introHowBigParity =>
      '4×4 को 3×3 की तरह हल करें, जब तक अटक न जाएँ।\nएक उल्टा एज: OLL पैरिटी का लंबा एल्गोरिदम।\nदो बदले हुए एज: 2R2 U2 2R2 Uw2 2R2 Uw2।';

  @override
  String get dirFaceR => 'दायाँ हिस्सा';

  @override
  String get dirFaceL => 'बायाँ हिस्सा';

  @override
  String get dirFaceU => 'ऊपरी पंक्ति';

  @override
  String get dirFaceD => 'निचली पंक्ति';

  @override
  String get dirFaceF => 'सामने का फलक';

  @override
  String get dirFaceB => 'पीछे का फलक';

  @override
  String get dirMiddle => 'बीच की परत';

  @override
  String get dirWholeCube => 'पूरा क्यूब';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, परत $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth परतें गहरा';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, परतें $near–$far';
  }

  @override
  String get dirUp => 'ऊपर';

  @override
  String get dirDown => 'नीचे';

  @override
  String get dirLeft => 'बाएँ';

  @override
  String get dirRight => 'दाएँ';

  @override
  String get dirClockwise => 'घड़ी की दिशा में';

  @override
  String get dirCounter => 'घड़ी की उल्टी दिशा में';

  @override
  String get dirBackClockwise => 'घड़ी की दिशा में, पीछे से देखने पर';

  @override
  String get dirBackCounter => 'घड़ी की उल्टी दिशा में, पीछे से देखने पर';

  @override
  String get dirHalf => 'डबल टर्न (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'विवरण छिपाएँ';

  @override
  String get solveExpand => 'विवरण दिखाएँ';

  @override
  String get dailyScrambleSteps => 'कदम-दर-कदम मिलाएँ';

  @override
  String get dailyScrambleGuide => '3D मिलाने की गाइड';

  @override
  String get dailyShowMoves => 'चालें टेक्स्ट में दिखाएँ';

  @override
  String get dailyHideMoves => 'टेक्स्ट चालें छिपाएँ';

  @override
  String get dailyScrambleGuideTitle => 'मिलाने की गाइड';

  @override
  String get phaseDailyScramble => 'आज का क्यूब मिलाएँ';

  @override
  String get explainDailyScramble =>
      'हल किए हुए क्यूब से शुरू करें, सफ़ेद ऊपर और हरा सामने, और हर घुमाव अपने असली क्यूब पर दोहराएँ।';

  @override
  String get stageCenters => 'केंद्र ब्लॉक बनाएँ';

  @override
  String get stageEdges => 'बाहरी और अंदरूनी एज जोड़ें';

  @override
  String get stageParity => 'पैरिटी ठीक करें';

  @override
  String get stageCrown1 => 'पहला क्राउन (सफ़ेद)';

  @override
  String get stageCrown2 => 'दूसरा क्राउन';

  @override
  String get stageCrown3 => 'तीसरा क्राउन (पीला)';

  @override
  String get stageOrient => 'टुकड़ों की दिशा ठीक करें';

  @override
  String get stageFinish => 'क्यूब पूरा करें';

  @override
  String get stageAsThree => '3×3 की तरह हल करें';

  @override
  String get stageTwoByTwo => '2×2 हल करें';

  @override
  String stageHeader(int number, int total, String title) {
    return 'चरण $number/$total: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'क्राउन $crown • चरण $number/$total: $title';
  }

  @override
  String get solveAllStagesDone => 'सभी चरण पूरे हुए। शाबाश!';

  @override
  String get trackFiveByFive => '5×5 प्रोफ़ेसर क्यूब';

  @override
  String get trackSixBySix => '6×6 क्यूब';

  @override
  String get lessonFiveIntro => '5×5 से मिलें';

  @override
  String get lessonFiveIntroDesc =>
      'स्थिर बीच के टुकड़े, केंद्र पट्टियाँ, बीच के एज और विंग।';

  @override
  String get introGoalFiveIntro =>
      '5×5 को जानें: स्थिर बीच के टुकड़े, केंद्र पट्टियाँ, बीच के एज और विंग।';

  @override
  String get introHowFiveIntro =>
      'हर फलक का बिल्कुल बीच वाला टुकड़ा कभी नहीं हिलता।\nहर एज एक बीच का टुकड़ा और दो विंग है।\nअंदरूनी परतें बाहर को छुए बिना टुकड़े हिलाती हैं।';

  @override
  String get lessonFiveCenters => '5×5 के केंद्र';

  @override
  String get lessonFiveCentersDesc => 'हर केंद्र तीन-तीन की पट्टियों से बनाएँ।';

  @override
  String get introGoalFiveCenters =>
      'हर फलक पर एक रंग का 3×3 केंद्र ब्लॉक बनाएँ।';

  @override
  String get introHowFiveCenters =>
      'बीच वाले टुकड़े से शुरू करें: वही रंग बताता है।\nतीन की पट्टियाँ बनाएँ और अंदरूनी परत से अंदर सरकाएँ।\nआख़िरी दो केंद्र साथ में पूरे करें।';

  @override
  String get lessonFiveEdges => '5×5 के एज';

  @override
  String get lessonFiveEdgesDesc => 'दो विंग को उनके बीच वाले एज से जोड़ें।';

  @override
  String get introGoalFiveEdges =>
      'हर बीच वाले एज को उसके दो विंग से जोड़ें, ताकि सभी 12 एज एक टुकड़े जैसे दिखें।';

  @override
  String get introHowFiveEdges =>
      'सामने दो विंग को उनके बीच वाले एज से मिलाएँ।\nअंदरूनी परत घुमाएँ, अधूरा एज लाएँ और वापस घुमाएँ।\nआख़िरी एज बने हुए एज तोड़े बिना जोड़ें।';

  @override
  String get lessonFiveSolve => '5×5 को 3×3 की तरह हल करें';

  @override
  String get lessonFiveSolveDesc => 'तीन क्राउन से पूरा करें।';

  @override
  String get introGoalFiveSolve =>
      'छोटे किए गए 5×5 को 3×3 की तरह, क्राउन दर क्राउन हल करें।';

  @override
  String get introHowFiveSolve =>
      'अब से सिर्फ़ बाहरी घुमाव।\nपहला क्राउन, दूसरा क्राउन, फिर पीला क्राउन।\nस्थिर बीच के टुकड़े हर फलक का रंग दिखाते हैं।';

  @override
  String get lessonFiveParity => '5×5 एज पैरिटी';

  @override
  String get lessonFiveParityDesc => 'वह एज ठीक करें जिसके विंग बदले हुए हैं।';

  @override
  String get introGoalFiveParity =>
      'उस एक एज को ठीक करें जिसके दोनों विंग बदले हुए हैं, फिर पूरा करें।';

  @override
  String get introHowFiveParity =>
      'यह ऐसे एज के रूप में दिखता है जो जुड़ता ही नहीं।\nअंदरूनी परतों वाला लंबा सुधार एक बार करें।\nबाक़ी सब अपनी जगह लौट आता है।';

  @override
  String get lessonSixIntro => '6×6 से मिलें';

  @override
  String get lessonSixIntroDesc =>
      'कोई स्थिर केंद्र नहीं और हर एज में चार टुकड़े।';

  @override
  String get introGoalSixIntro =>
      '6×6 को जानें: हर फलक पर सोलह केंद्र टुकड़े और हर एज में चार टुकड़े।';

  @override
  String get introHowSixIntro =>
      'कोई केंद्र स्थिर नहीं: बनाते समय आप रंग चुनते हैं।\nहर एज में बाहरी और अंदरूनी विंग होते हैं।\nवाइड घुमाव तीन परतों तक हिला सकते हैं।';

  @override
  String get lessonSixCenters => '6×6 के केंद्र';

  @override
  String get lessonSixCentersDesc => 'चार-चार की पट्टियों से 4×4 केंद्र बनाएँ।';

  @override
  String get introGoalSixCenters =>
      'हर फलक पर एक ही रंग का 4×4 केंद्र ब्लॉक बनाएँ।';

  @override
  String get introHowSixCenters =>
      'पहले दो आमने-सामने के केंद्र बनाएँ।\nचार की पट्टियाँ बनाकर उन्हें जोड़ें।\nपरत, ऊपर, वापस वाली तरकीब से एक-एक टुकड़ा हिलाएँ।';

  @override
  String get lessonSixEdges => '6×6 के एज';

  @override
  String get lessonSixEdgesDesc => 'हर एज के चारों टुकड़े इकट्ठा करें।';

  @override
  String get introGoalSixEdges =>
      'हर एज के चारों टुकड़े इकट्ठा करें ताकि 6×6 में 12 साफ़ एज हों।';

  @override
  String get introHowSixEdges =>
      'सामने बाहरी और अंदरूनी विंग एक लाइन में लाएँ।\nगहरी वाइड परत एज को अंदर-बाहर लाती है।\nबने हुए एज कभी नहीं टूटते।';

  @override
  String get lessonSixSolve => '6×6 को 3×3 की तरह हल करें';

  @override
  String get lessonSixSolveDesc => 'तीन क्राउन से पूरा करें।';

  @override
  String get introGoalSixSolve =>
      'छोटे किए गए 6×6 को 3×3 की तरह, क्राउन दर क्राउन हल करें।';

  @override
  String get introHowSixSolve =>
      'अब से सिर्फ़ बाहरी घुमाव।\nआपके बनाए केंद्र हर फलक का रंग दिखाते हैं।\nपहला क्राउन, दूसरा क्राउन, फिर पीला क्राउन।';

  @override
  String get lessonSixParity => '6×6 पैरिटी';

  @override
  String get lessonSixParityDesc => 'एक उल्टा एज या दो बदले हुए एज।';

  @override
  String get introGoalSixParity =>
      '6×6 के वे दो केस ठीक करें जो 3×3 में नहीं होते: एक उल्टा एज या दो बदले हुए एज।';

  @override
  String get introHowSixParity =>
      '3×3 की तरह हल करें, जब तक अटक न जाएँ।\nएक उल्टा एज: लंबा पैरिटी सुधार।\nदो बदले हुए एज: डबल घुमावों वाला छोटा सुधार।';

  @override
  String get stepFivePieces => '5×5 के टुकड़े';

  @override
  String get stepFivePiecesBody =>
      'हर फलक का बीच वाला टुकड़ा कभी नहीं हिलता, इसलिए 3×3 की तरह वही फलक का रंग बताता है। उसके चारों ओर आठ और केंद्र टुकड़े हैं; हर एज में एक बीच का टुकड़ा और दो विंग हैं, और कोने 3×3 जैसे ही हैं।';

  @override
  String get stepFiveSlices => 'तीन तरह के घुमाव';

  @override
  String get stepFiveSlicesBody =>
      'बाहरी घुमाव एक फलक घुमाता है। वाइड घुमाव फलक को पीछे वाली परत के साथ घुमाता है। अंदरूनी परत का घुमाव सिर्फ़ अंदर की एक परत घुमाता है: इसी से टुकड़े बाहर को छुए बिना जगह बदलते हैं।';

  @override
  String get stepFiveCenterBar => 'केंद्र पट्टियाँ';

  @override
  String get stepFiveCenterBarBody =>
      'तीन एक जैसे केंद्र टुकड़ों की पंक्ति बनाएँ, फिर अंदरूनी परत के घुमाव से उसे मेल खाते बीच वाले टुकड़े के पास सरकाएँ। तीन पट्टियाँ एक पूरा केंद्र बनाती हैं।';

  @override
  String get stepFiveCenterSwap => 'बिना तोड़े बदलें';

  @override
  String get stepFiveCenterSwapBody =>
      'एक केंद्र टुकड़ा हिलाने के लिए: अंदरूनी परत घुमाएँ, ऊपरी फलक घुमाएँ, परत वापस करें और ऊपरी फलक लौटाएँ। बने हुए केंद्र हर बार लौट आते हैं।';

  @override
  String get stepFiveEdgePair => 'विंग को बीच वाले एज से जोड़ें';

  @override
  String get stepFiveEdgePairBody =>
      'सामने दो विंग को उनके बीच वाले एज के पास लाएँ, अंदरूनी परत नीचे घुमाएँ, ऊपर से अधूरा एज लाएँ और अंदरूनी परत वापस घुमाएँ।';

  @override
  String get stepFiveEdgeLast => 'आख़िरी एज';

  @override
  String get stepFiveEdgeLastBody =>
      'जब कुछ ही एज बचें, तो वाइड घुमाव, छोटा ट्रिगर और वाइड घुमाव वापस उन्हें बने हुए एज तोड़े बिना जोड़ देते हैं।';

  @override
  String get stepFiveAsThree => 'अब यह 3×3 है';

  @override
  String get stepFiveAsThreeBody =>
      'केंद्र और एज बनने के बाद 5×5 एक बड़े 3×3 जैसा है। सिर्फ़ बाहरी घुमाव इस्तेमाल करें और तीन क्राउन अपनाएँ: सफ़ेद क्रॉस और कोने, बीच की परत, फिर पीली परत।';

  @override
  String get stepFiveEdgeParity => 'आख़िरी एज के विंग बदलें';

  @override
  String get stepFiveEdgeParityBody =>
      'कभी-कभी आख़िरी एज के दोनों विंग बदले होते हैं। अंदरूनी परतों का लंबा एल्गोरिदम उन्हें वापस बदल देता है और बाक़ी सब अपनी जगह लौट आता है। फिर 3×3 की तरह पूरा करें।';

  @override
  String get stepSixPieces => '6×6 के टुकड़े';

  @override
  String get stepSixPiecesBody =>
      '4×4 की तरह 6×6 में कोई स्थिर केंद्र नहीं: सोलह केंद्र टुकड़े हर फलक का रंग बनाते हैं। हर एज में चार टुकड़े हैं: दो बाहरी और दो अंदरूनी विंग।';

  @override
  String get stepSixSlices => 'गहरी परतें घुमाना';

  @override
  String get stepSixSlicesBody =>
      'वाइड घुमाव एक फलक से दो या तीन परतें हिला सकते हैं। दूसरी या तीसरी अंदरूनी परत केंद्रों और एज के औज़ार हैं।';

  @override
  String get stepSixCenterBar => 'चार की पट्टियाँ';

  @override
  String get stepSixCenterBarBody =>
      'चार एक जैसे केंद्र टुकड़ों की पंक्तियाँ बनाएँ और अंदरूनी परत के घुमावों से उन्हें पास-पास सरकाएँ, जब तक फलक एक रंग का न हो जाए।';

  @override
  String get stepSixCenterSwap => 'एक बार में एक टुकड़ा';

  @override
  String get stepSixCenterSwapBody =>
      'तीसरी परत घुमाएँ, ऊपर घुमाएँ, वापस करें, लौटाएँ: एक केंद्र टुकड़ा हिलता है और बने हुए केंद्र लौट आते हैं।';

  @override
  String get stepSixEdgePair => 'चार टुकड़े, एक एज';

  @override
  String get stepSixEdgePairBody =>
      'गहरी वाइड परत से सामने एक एज के चारों टुकड़े इकट्ठा करें, अधूरा एज लाएँ और वाइड परत वापस घुमाएँ।';

  @override
  String get stepSixEdgeLast => 'आख़िरी एज';

  @override
  String get stepSixEdgeLastBody =>
      'गहरे वाइड घुमाव और उसकी वापसी के बीच छोटे ट्रिगर से आख़िरी एज जोड़ें, ताकि बने हुए एज जुड़े रहें।';

  @override
  String get stepSixAsThree => 'अब यह 3×3 है';

  @override
  String get stepSixAsThreeBody =>
      '4×4 केंद्रों और जुड़े एज के साथ 6×6 को बाहरी घुमावों और तीन क्राउन से 3×3 की तरह हल करें।';

  @override
  String get stepSixOllParity => 'एक उल्टा एज';

  @override
  String get stepSixOllParityBody =>
      'अगर आख़िरी परत हल करते समय एक ही एज उल्टा लगे, तो यह पैरिटी है। उसे ऊपरी परत में सामने रखें और लंबा सुधार करें: पहले दो क्राउन बिना बिगड़े लौट आते हैं।';

  @override
  String get stepSixPllParity => 'दो बदले हुए एज';

  @override
  String get stepSixPllParityBody =>
      'अगर बिल्कुल आख़िर में दो एज बदले लगें, तो उन्हें ऊपरी परत में आगे और पीछे रखें और अंदरूनी डबल घुमावों वाला छोटा सुधार करें।';

  @override
  String get stageTwoFirstLayer => 'निचली परत बनाएँ';

  @override
  String get stageTwoTopColor => 'ऊपर को एक रंग का करें';

  @override
  String get stageTwoFinish => 'कोने पूरे करें';

  @override
  String get explainTwoFirstLayer =>
      'निचली परत पूरी करें: उसके चारों कोने आपस में और साइड के रंगों से मेल खाएँ।';

  @override
  String get explainTwoTopColor =>
      'तब तक घुमाएँ जब तक ऊपर के चारों स्टिकर एक रंग के न हो जाएँ, निचली परत बिगाड़े बिना।';

  @override
  String get explainTwoFinish =>
      'आख़िरी कोनों को उनकी जगह पहुँचाकर क्यूब पूरा करें।';

  @override
  String get tabSolve => 'हल करें';

  @override
  String get tabScan => 'स्कैन';

  @override
  String get tabAcademy => 'अकादमी';

  @override
  String get tabTrain => 'अभ्यास';

  @override
  String get openCubeSolver => '3D क्यूब और सॉल्वर खोलें';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'अभ्यास';

  @override
  String get trainSubtitle => 'हर दिन अपने कौशल निखारें।';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get settingsSoundHaptics => 'ध्वनि और कंपन';

  @override
  String get settingsSoundHapticsDesc => 'क्यूब घुमाने पर क्लिक और कंपन।';

  @override
  String get settingsAnimationSpeed => 'डिफ़ॉल्ट एनिमेशन गति';

  @override
  String get settingsAnimationSpeedDesc =>
      'चालें चलने पर क्यूब कितनी तेज़ी से घूमता है।';

  @override
  String get settingsResetProgress => 'प्रगति रीसेट करें';

  @override
  String get settingsResetProgressDesc =>
      'अकादमी के पूरे पाठ और आपकी दैनिक स्ट्रीक मिटाएँ।';

  @override
  String get resetProgressTitle => 'सारी प्रगति रीसेट करें?';

  @override
  String get resetProgressBody =>
      'आपके पूरे किए गए पाठ और दैनिक स्ट्रीक मिट जाएँगे। इसे पूर्ववत नहीं किया जा सकता।';

  @override
  String get resetProgressDone => 'प्रगति रीसेट हो गई।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get settingsPrivacyAds => 'गोपनीयता और विज्ञापन';

  @override
  String get settingsPrivacyAdsDesc =>
      'विज्ञापन सहमति के अपने विकल्प देखें या बदलें।';

  @override
  String get playbackPrevious => 'पिछला';

  @override
  String get playbackNext => 'अगला';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count चालों में हल!',
      one: '1 चाल में हल!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'अगला संस्करण मिलकर बनाएँ';

  @override
  String get feedbackBody =>
      'कोई फ़ीचर सुझाना चाहते हैं या CubeMentor के अगले संस्करण को आकार देना चाहते हैं? हमें यहाँ लिखें:';

  @override
  String get feedbackEmailCopied =>
      'कोई ईमेल ऐप नहीं मिला, इसलिए पता क्लिपबोर्ड पर कॉपी कर दिया गया।';

  @override
  String get adWatchToUnlock => 'विज्ञापन देखें';

  @override
  String get adLoading => 'एक छोटा वीडियो लोड हो रहा है…';

  @override
  String get adRewardNotEarned => 'अनलॉक करने के लिए पूरा वीडियो देखें।';

  @override
  String get adUnavailableFreePass =>
      'अभी कोई वीडियो उपलब्ध नहीं है — इस बार मुफ़्त में अनलॉक किया गया।';

  @override
  String get settingsPrivacyAdsError =>
      'निजता विकल्प नहीं खुल सके। बाद में फिर कोशिश करें।';

  @override
  String get nicknamePromptTitle => 'हम आपको क्या कहकर बुलाएँ?';

  @override
  String get nicknamePromptBody =>
      'हर बार हल करने पर हम आपका नाम लेकर हौसला बढ़ाएँगे।';

  @override
  String get nicknameHint => 'आपका नाम या उपनाम';

  @override
  String get nicknameSave => 'सहेजें';

  @override
  String get settingsNickname => 'आपका नाम';

  @override
  String get settingsNicknameNotSet => 'सेट नहीं है — जोड़ने के लिए टैप करें';

  @override
  String celebrateNamed(String name) {
    return 'शाबाश, $name!';
  }

  @override
  String get celebrateAnon => 'शाबाश!';

  @override
  String get celebrateCubeSolved => 'क्यूब हल हो गया!';

  @override
  String get celebrateDailyDone => 'आज की चुनौती पूरी हुई!';

  @override
  String fastSolveRatio(int count, int limit) {
    return '$count / $limit चालें';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    return 'हर स्क्रैम्बल $limit या उससे कम चालों में हल हो सकता है';
  }

  @override
  String get patternsWatchVideo => 'वीडियो देखें';

  @override
  String get patternsNotNow => 'अभी नहीं';

  @override
  String get settingsColorScheme => 'क्यूब की रंग योजना';

  @override
  String get colorSchemeWestern => 'पश्चिमी';

  @override
  String get colorSchemeJapanese => 'जापानी';

  @override
  String get colorSchemeWesternDesc => 'सफ़ेद के सामने पीला, नीले के सामने हरा';

  @override
  String get colorSchemeJapaneseDesc =>
      'सफ़ेद के सामने नीला, पीले के सामने हरा';

  @override
  String dailyYourTime(String time) {
    return 'आपका समय: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'क्यूब देखने के लिए आपके पास $seconds सेकंड हैं। उल्टी गिनती शुरू करने के लिए टैप करें।';
  }

  @override
  String get timerInspectTapReady =>
      'हल करना शुरू करने के लिए तैयार हों तो टैप करें';

  @override
  String timerInspectPlus2(int seconds) {
    return 'इंस्पेक्शन $seconds सेकंड से ज़्यादा चला, इसलिए घड़ी अपने-आप शुरू हुई: +2 सेकंड पेनल्टी';
  }

  @override
  String timerAvgOf(int count) {
    return '$count का औसत';
  }

  @override
  String get timerAvgNote =>
      'औसत में सबसे अच्छा और सबसे खराब समय हटाया जाता है';

  @override
  String get timerPbSub => 'सबसे अच्छा समय';

  @override
  String get timerPlus2Caption => '+2 सेकंड पेनल्टी';

  @override
  String get timerDnfCaption => 'पूरा नहीं हुआ (DNF)';

  @override
  String get timerDeleteCaption => 'यह सॉल्व हटाएँ';

  @override
  String get patternBullsEye => 'बुल्स-आई';

  @override
  String get patternFramedCenter => 'फ्रेम वाला केंद्र';

  @override
  String get patternBlockCheckerboard => 'ब्लॉक चेकरबोर्ड';

  @override
  String get patternCubeInCubeInCube => 'क्यूब में क्यूब में क्यूब';

  @override
  String get patternUnionJack => 'यूनियन जैक';

  @override
  String get patternKilt => 'किल्ट';

  @override
  String get patternSixTs => 'छह T';

  @override
  String get patternTwinPeaks => 'जुड़वाँ चोटियाँ';

  @override
  String get patternSpiral => 'स्पाइरल';

  @override
  String get patternTetris => 'टेट्रिस';

  @override
  String get patternSpots => 'बीच के धब्बे';

  @override
  String get patternStripes => 'धारियाँ';

  @override
  String get patternAnaconda => 'एनाकोंडा';

  @override
  String get patternZigzag => 'ज़िगज़ैग';

  @override
  String get patternFourSpots => 'चार धब्बे';

  @override
  String get patternGreenMamba => 'हरा मांबा';

  @override
  String get patternPlusMinus => 'प्लस माइनस';

  @override
  String guideStepCounter(int current, int total) {
    return 'चरण $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'चाल $current / $total';
  }

  @override
  String get dailyStep1Title => 'चरण 1: अपना क्यूब मिलाएँ';

  @override
  String get dailyStep2Title => 'चरण 2: क्यूब हल करें';

  @override
  String dailyPersonalBest(String time) {
    return 'पर्सनल बेस्ट: $time';
  }

  @override
  String get dailyRecentDays => 'हाल के दिन';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन की स्ट्रीक! कमाल कर रहे हैं!',
      one: '1 दिन की स्ट्रीक! कमाल कर रहे हैं!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'क्यूब मिल गया! अब इसे हल करें';

  @override
  String get dailyCongratsTitle => 'बधाई हो!';

  @override
  String dailyCongratsBody(String time) {
    return 'आपने आज का चैलेंज $time में हल किया।';
  }

  @override
  String get dailyCongratsDone => 'चैलेंज पर वापस जाएँ';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $count पैटर्न';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours घंटे बाकी',
      one: '1 घंटा बाकी',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes मिनट बाकी',
      one: '1 मिनट बाकी',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'लॉक है';

  @override
  String get unlockedLabel => 'अनलॉक है';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'यह पैटर्न और इसकी स्टेप-बाय-स्टेप गाइड $hours घंटे के लिए अनलॉक करने हेतु 1 छोटा वीडियो देखें।',
      one: 'यह पैटर्न और इसकी स्टेप-बाय-स्टेप गाइड 1 घंटे के लिए अनलॉक करने हेतु 1 छोटा वीडियो देखें।',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'यह पाठ अगले $hours घंटों तक जितनी बार चाहें खोलने के लिए 1 छोटा वीडियो देखें।',
      one: 'यह पाठ अगले 1 घंटे तक जितनी बार चाहें खोलने के लिए 1 छोटा वीडियो देखें।',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'बड़े क्यूब हल करें';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          '4×4–6×6 का आपका मुफ़्त हल इस्तेमाल हो चुका है। अगले $hours घंटों तक बड़े क्यूब हल करने के लिए 1 छोटा वीडियो देखें।',
      one: '4×4–6×6 का आपका मुफ़्त हल इस्तेमाल हो चुका है। अगले 1 घंटे तक बड़े क्यूब हल करने के लिए 1 छोटा वीडियो देखें।',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'डबल टर्न · 180°';

  @override
  String get homeAcademy => 'अकादमी';

  @override
  String get homePatterns => 'शानदार पैटर्न';

  @override
  String get homePractice => 'टाइमर और डेली चैलेंज';

  @override
  String get scanChoiceSubtitle => 'आप कैसे शुरू करना चाहेंगे?';

  @override
  String get scanChoiceCamera => 'कैमरे से स्कैन करें';

  @override
  String get scanChoiceCameraDesc => 'हर फ़ेस कैमरे को दिखाएँ और हल पाएँ।';

  @override
  String get scanChoice3d => '3D क्यूब खोलें';

  @override
  String get scanChoice3dDesc =>
      'वर्चुअल क्यूब घुमाएँ, स्क्रैम्बल करें और स्टेप-बाय-स्टेप हल करें।';

  @override
  String get academyAllSizes => 'सभी साइज़';
}
