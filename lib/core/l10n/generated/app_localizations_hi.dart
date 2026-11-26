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
  String get solveModeGuided => 'गाइडेड (3 परतें)';

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
  String get phaseLblCorners => 'पहली परत के कोने';

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
  String get crownFirst => 'पहली परत';

  @override
  String get crownSecond => 'दूसरी परत';

  @override
  String get crownThird => 'तीसरी परत';

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
      '4 सफ़ेद कोनों को उनकी सही जगह पर डालें, ताकि सफ़ेद फ़ेस और पूरी पहली परत पूरी हो जाए।';

  @override
  String get subStepGoal21 =>
      'पहली परत को बिगाड़े बिना बीच की परत के 4 एज डालें।';

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
  String explainLblDaisyPetal(String piece) {
    return 'डेज़ी: $piece एज को पीले केंद्र के चारों ओर ऊपर लाएँ, सफ़ेद ऊपर की ओर, एक पंखुड़ी की तरह।';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return 'ऊपरी परत घुमाएँ जब तक $piece पंखुड़ी अपने साइड रंग वाले केंद्र के ठीक ऊपर न आ जाए।';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return 'उस फ़ेस को दो बार (180°) घुमाकर $piece एज को सफ़ेद केंद्र पर उतारें: सफ़ेद क्रॉस की एक और भुजा।';
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
  String get trackBeginner => 'शुरुआती 3×3: परत दर परत';

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
      'पीला ऊपर और हरा अपनी ओर रखें। पहले चारों सफ़ेद एज को पीले केंद्र के चारों ओर, सफ़ेद ऊपर, पंखुड़ियों की तरह इकट्ठा करें: यही डेज़ी है। फिर हर पंखुड़ी सफ़ेद केंद्र पर उतरती है, उसका साइड रंग बगल के केंद्र से मिलता हुआ।';

  @override
  String get stepCrossTop => 'ऊपर वाला एज';

  @override
  String get stepCrossTopBody =>
      'ऊपर सफ़ेद-ऊपर वाला सफ़ेद एज डेज़ी की एक पंखुड़ी है। ऊपरी परत घुमाएँ जब तक उसका साइड रंग उसी रंग के केंद्र के ठीक ऊपर न आ जाए, फिर उस फ़ेस को दो बार (180°) घुमाकर उसे सफ़ेद केंद्र पर उतारें।';

  @override
  String get stepCrossMiddle => 'बीच वाला एज';

  @override
  String get stepCrossMiddleBody =>
      'बीच की परत में फँसा एज पहले ऊपर आता है: उसकी साइड ऊपर, ऊपरी परत हटाएँ, साइड वापस, ताकि लगे हुए टुकड़े न हिलें। अब वह ऊपर एक पंखुड़ी है: सीध में लाएँ और फ़ेस दो बार घुमाएँ।';

  @override
  String get stepCornersInsert => 'अपनी जगह के ऊपर';

  @override
  String get stepCornersInsertBody =>
      'ऊपरी परत घुमाएँ जब तक सफ़ेद कोना अपने साइड रंगों वाले दो केंद्रों के बीच अपनी जगह के ठीक ऊपर न आ जाए। यहाँ एक ऊपरी मूव और R U\' R\' काफ़ी है: U कोने को जगह के ऊपर लाता है, R U\' R\' उसे सफ़ेद नीचे करके डालता है।';

  @override
  String get stepCornersRepeat => 'ट्रिगर दोहराएँ';

  @override
  String get stepCornersRepeatBody =>
      'जगह को आगे-दाएँ रखें और R U R\' U\' दोहराएँ जब तक सफ़ेद नीचे न आ जाए: दाएँ हो तो 1 बार, ऊपर हो तो 3 बार, आपकी ओर हो तो 5 बार। इस बीच ऊपर बिखरा दिखता है; वह अपने आप ठीक हो जाता है।';

  @override
  String get stepMiddleRight => 'एज दाईं ओर';

  @override
  String get stepMiddleRightBody =>
      'ऊपर बिना पीले वाला एज ढूँढ़ें। ऊपरी परत घुमाएँ जब तक उसका सामने का रंग आपके सामने वाले केंद्र से न मिले। अगर उसका ऊपरी रंग दाएँ केंद्र से मिलता है, तो दाएँ भेजें: U R U\' R\' U\' F\' U F।';

  @override
  String get stepMiddleLeft => 'एज बाईं ओर';

  @override
  String get stepMiddleLeftBody =>
      'अगर ऊपरी रंग बाएँ केंद्र से मिलता है, तो मिरर इस्तेमाल करें: U\' L\' U L U F U\' F\'। सफ़ेद परत हर बार पूरी लौट आती है।';

  @override
  String get stepYellowCross => 'एक ही एल्गोरिदम';

  @override
  String get stepYellowCrossBody =>
      'ऊपर सिर्फ़ पीले एज देखें। L को पीछे-बाएँ और रेखा को बाएँ से दाएँ रखें, फिर F R U R\' U\' F\' करें। रेखा को 1 बार, L को 2 बार, बिंदु को 3 बार तक चाहिए।';

  @override
  String get stepYellowEdges => 'एज मिलाएँ';

  @override
  String get stepYellowEdgesBody =>
      'ऊपरी परत घुमाएँ जब तक दो एज अपने केंद्रों से न मिल जाएँ। एक पीछे और एक दाएँ होने पर R U R\' U R U2 R\' U सामने और बाएँ एज को बदल देता है।';

  @override
  String get stepPlaceCorners => 'जगह पर रखें';

  @override
  String get stepPlaceCornersBody =>
      'कोना अपनी जगह पर है जब उसके रंग आसपास के तीन केंद्रों से मिलें, भले वह मुड़ा हो। ऐसे कोने को आगे-दाएँ रखें: U R U\' L\' U R\' U\' L बाकी तीन को घुमाता है। चारों जगह पर आने तक दोहराएँ।';

  @override
  String get stepTwistCorners => 'घुमाएँ';

  @override
  String get stepTwistCornersBody =>
      'आगे-दाएँ अधूरे कोने के साथ R\' D\' R D जोड़ों में दोहराएँ जब तक पीला ऊपर न आ जाए, फिर अगला लाने के लिए सिर्फ़ ऊपरी परत घुमाएँ। आख़िरी कोने तक नीचे टूटा दिखता है: करते रहें।';

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
      '2×2 में सिर्फ़ आठ कोने हैं: न एज, न केंद्र। नीचे सफ़ेद परत ऐसे बनाएँ कि पड़ोसी साइड रंग मिलें, फिर एक ही रास्ते से पूरा करें: पीले ऊपर के लिए Sune, फिर T-perm या Y-perm।';

  @override
  String get stepTwoCorner => 'कोने डालें';

  @override
  String get stepTwoCornerBody =>
      '3×3 के सफ़ेद कोनों की तरह: कोने को आगे-दाएँ खाली जगह के ऊपर लाएँ और डालें, यहाँ U R U\' R\' से या R U R\' U\' दोहराकर जब तक सफ़ेद नीचे न आए। उसके साइड रंग पड़ोसी से मिलाएँ।';

  @override
  String get lessonTwoOll => 'ऊपर की दिशा ठीक करें';

  @override
  String get lessonTwoOllDesc => 'Sune के साथ Ortega OLL।';

  @override
  String get stepTwoSune => 'फिर से Sune';

  @override
  String get stepTwoSuneBody =>
      'ऊपर की ओर वाले पीले स्टिकर गिनें। पीले-ऊपर वाले अकेले कोने को आगे-बाएँ रखें और Sune करें (R U R\' U R U2 R\')। फिर गिनें और दोबारा पकड़ें; ज़्यादा से ज़्यादा तीन Sune। बीच में सिर्फ़ ऊपरी परत घुमाएँ।';

  @override
  String get lessonTwoPbl => 'दोनों परतें सही करें';

  @override
  String get lessonTwoPblDesc => 'पूरा करने के लिए कोने बदलें।';

  @override
  String get stepTwoAdjacent => 'पास-पास की अदला-बदली';

  @override
  String get stepTwoAdjacentBody =>
      'हेडलाइट्स यानी एक साइड पर ऊपर के दो एक-जैसे स्टिकर। ऊपरी परत घुमाएँ जब तक हेडलाइट्स बाएँ न आ जाएँ, ताकि बदलने वाले दो कोने दाएँ हों, फिर T-perm करें।';

  @override
  String get stepTwoDiagonal => 'तिरछी अदला-बदली';

  @override
  String get stepTwoDiagonalBody =>
      'किसी भी साइड पर हेडलाइट्स नहीं, तो दो तिरछे कोने बदलने हैं: किसी भी तरफ़ से Y-perm करें, फिर सब सीधा करने के लिए ऊपरी परत घुमाएँ।';

  @override
  String get lessonBigIntro => 'बड़े क्यूब के टुकड़े';

  @override
  String get lessonBigIntroDesc => 'केंद्र, विंग और स्लाइस।';

  @override
  String get stepBigPieces => 'स्थिर केंद्र नहीं';

  @override
  String get stepBigPiecesBody =>
      '4×4 में हर फ़ेस पर चार हिलने वाले केंद्र टुकड़े हैं, और हर एज दो विंग से बना है। कोई केंद्र स्थिर नहीं, इसलिए किसी कोने पर रंगों का क्रम जाँचें: सफ़ेद के सामने पीला, नीले के सामने हरा, लाल के सामने नारंगी।';

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
      'यह कम्यूटेटर ठीक तीन केंद्र टुकड़े हिलाता है और बाकी सब छोड़ देता है, इसलिए बने केंद्र बने रहते हैं। जब कोई भटका टुकड़ा पट्टी में न जुड़े, तब इसका इस्तेमाल करें।';

  @override
  String get lessonBigEdges => 'एज जोड़ें';

  @override
  String get lessonBigEdgesDesc => 'विंग को जोड़कर पूरे एज बनाएँ।';

  @override
  String get stepBigEdgePair => 'जोड़ें और वापस लाएँ';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' दो मिलते विंग सीध में लाता है, R U R\' F R\' F\' R बिना जोड़ा एज अंदर लाता है, और Uw केंद्र वापस रखता है। खोली गई स्लाइस हमेशा बंद करें।';

  @override
  String get lessonBigParity => 'पैरिटी';

  @override
  String get lessonBigParityDesc => 'सम क्यूब पर OLL और PLL पैरिटी।';

  @override
  String get stepBigOllParity => 'OLL पैरिटी';

  @override
  String get stepBigOllParityBody =>
      'अकेला पलटा एज 3×3 में नहीं हो सकता: यह OLL पैरिटी है, गलती नहीं। उसे ऊपरी परत में सामने रखें और लंबा एल्गोरिदम करें। यह ऊपर के बाएँ-दाएँ एज और दो कोने भी बदलता है; 3×3 के आख़िरी स्टेप इन्हें ठीक करते हैं।';

  @override
  String get stepBigPllParity => 'PLL पैरिटी';

  @override
  String get stepBigPllParityBody =>
      'बिल्कुल आख़िर में दो एज बदले हुए हैं और कोई 3×3 एल्गोरिदम फ़िट नहीं होता? यह PLL पैरिटी है। उन्हें ऊपरी परत में आगे और पीछे रखें: 2R2 U2 2R2 Uw2 2R2 2U2 उन्हें बदल देता है।';

  @override
  String get introGoalHeading => 'लक्ष्य क्या है?';

  @override
  String get introHowHeading => 'यह कैसे करें?';

  @override
  String get introHoldHeading => 'कैसे पकड़ें';

  @override
  String get introWhyHeading => 'यह क्यों काम करता है';

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
      'नीचे ऐसा सफ़ेद क्रॉस बनाएँ जिसमें हर सफ़ेद एज बगल वाले केंद्र के रंग से भी मिले।';

  @override
  String get introGoalCorners =>
      'चारों सफ़ेद कोने लगाएँ ताकि पूरी पहली परत बन जाए: सफ़ेद फ़ेस और मिलते हुए साइड रंग।';

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
  String get introGoalTwoPbl =>
      'एक T-perm या Y-perm से आख़िरी कोनों को उनकी जगह पहुँचाएँ, फिर ऊपरी परत सीधी करके 2×2 हल करें।';

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
      '4×4 के वे दो केस ठीक करें जो 3×3 में कभी नहीं आते: एक पलटा हुआ एज (OLL पैरिटी) या आपस में बदले हुए दो एज (PLL पैरिटी)।';

  @override
  String get introHowBasics =>
      'केंद्र कभी नहीं हिलते, इसलिए वे हर फलक का रंग बताते हैं।\nहर अक्षर एक फलक को घड़ी की दिशा में चौथाई घुमाता है।\nएपॉस्ट्रॉफ़ी (\') उल्टा घुमाता है; 2 दो बार घुमाता है।';

  @override
  String get introHoldBasics =>
      'जैसे चाहें: केंद्र नहीं हिलते, इसलिए रंग हमेशा बताते हैं कि कौन-सा फ़ेस कौन-सा है।';

  @override
  String get introWhyBasics =>
      'हर एल्गोरिदम बस इन्हीं अक्षरों की एक कतार है, इसलिए इन्हें पढ़ना पहला हुनर है।';

  @override
  String get introHowCross =>
      'हर सफ़ेद एज को ऊपर लाएँ, सफ़ेद ऊपर की ओर, पीले केंद्र के चारों ओर: यही डेज़ी है।\nऊपरी परत घुमाएँ जब तक किसी पंखुड़ी का साइड रंग अपने केंद्र के ऊपर न आ जाए।\nउस फ़ेस को दो बार घुमाकर उसे नीचे भेजें; चारों के साथ यही करें।';

  @override
  String get introHoldCross =>
      'पूरे स्टेप में पीला केंद्र ऊपर और सफ़ेद केंद्र नीचे। पंखुड़ी सीधी करने के लिए क्यूब नहीं, ऊपरी परत घुमाएँ।';

  @override
  String get introWhyCross =>
      'सफ़ेद ऊपर होने पर सामने के फ़ेस के दो मूव एज को सफ़ेद केंद्र पर रख देते हैं, सफ़ेद नीचे और साइड रंग पहले से मिला हुआ।';

  @override
  String get introHowCorners =>
      'ऊपरी परत घुमाएँ जब तक सफ़ेद कोना आगे-दाएँ अपनी खाली जगह के ऊपर न आ जाए।\nR U R\' U\' दोहराएँ: सफ़ेद दाएँ हो तो 1 बार, ऊपर हो तो 3 बार, आपकी ओर हो तो 5 बार।\nबाकी तीन कोनों के साथ भी यही करें।';

  @override
  String get introHoldCorners =>
      'सफ़ेद नीचे, पीला ऊपर। कोना आगे-दाएँ, ठीक अपनी जगह के ऊपर।';

  @override
  String get introWhyCorners =>
      'R U R\' U\' स्लॉट को उठाकर वापस रखता है: हर राउंड कोने को थोड़ा घुमाता है जब तक सफ़ेद नीचे न आए, और क्रॉस कभी नहीं टूटता।';

  @override
  String get introHowMiddle =>
      'ऊपर ऐसा एज ढूँढ़ें जिसमें पीला न हो, और उसका सामने वाला रंग नीचे के केंद्र से मिलाएँ।\nउसका ऊपरी रंग बताता है कि वह कहाँ जाएगा: दाएँ या बाएँ।\n8 मूव वाले एल्गोरिदम से डालें; सफ़ेद परत हर बार वापस आती है।';

  @override
  String get introHoldMiddle =>
      'सफ़ेद नीचे, पीला ऊपर। एज सामने, उसका सामने वाला रंग नीचे के केंद्र से मिलता हुआ।';

  @override
  String get introWhyMiddle =>
      'एल्गोरिदम स्लॉट को हटाता है, एज अंदर सरकाता है और सफ़ेद परत वापस लाता है। पीले वाला एज ऊपर का है, बीच का कभी नहीं।';

  @override
  String get introHowYellowCross =>
      'ऊपर सिर्फ़ पीले एज देखें: बिंदु, L या रेखा।\nL को पीछे-बाएँ और रेखा को बाएँ से दाएँ रखें, फिर F R U R\' U\' F\' करें।\nरेखा को 1 बार, L को 2 बार, बिंदु को 3 बार तक चाहिए।';

  @override
  String get introHoldYellowCross =>
      'सफ़ेद नीचे, पीला ऊपर। L पीछे-बाएँ, रेखा बाएँ से दाएँ; बिंदु किसी भी तरह।';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' पहली दो परतों को छुए बिना हर बार दो ऊपरी एज पलटता है।';

  @override
  String get introHowYellowEdges =>
      'ऊपरी परत घुमाएँ जब तक दो एज अपने केंद्रों से न मिल जाएँ।\nउन्हें पीछे और दाएँ रखें, फिर R U R\' U R U2 R\' U करें।\nअगर मिले हुए एज आमने-सामने हों, तो पहले किसी भी तरफ़ से एक बार करें।';

  @override
  String get introHoldYellowEdges =>
      'पीला ऊपर। एक मिला हुआ एज पीछे, दूसरा दाएँ।';

  @override
  String get introWhyYellowEdges =>
      'यह एल्गोरिदम सिर्फ़ ऊपरी टुकड़े हिलाता है, इसलिए पहली दो परतें हमेशा लौट आती हैं।';

  @override
  String get introHowYellowCorners =>
      'कोना अपनी जगह पर है जब उसके रंग आसपास के तीन केंद्रों से मिलते हों, भले वह मुड़ा हो।\nऐसे कोने को आगे-दाएँ रखें।\nU R U\' L\' U R\' U\' L बाकी तीन को घुमाता है; सब फ़िट होने तक दोहराएँ।';

  @override
  String get introHoldYellowCorners =>
      'पीला ऊपर। जगह पर बैठा कोना आगे-दाएँ; न हो तो कोई भी कोना।';

  @override
  String get introWhyYellowCorners =>
      'यह तीन कोनों को गोल घुमाता है और आगे-दाएँ वाले को वहीं छोड़ता है, इसलिए हर बार और कोने जगह पर आते हैं।';

  @override
  String get introHowTwistCorners =>
      'एक अधूरे कोने को आगे-दाएँ पकड़ें।\nR\' D\' R D जोड़ों में दोहराएँ जब तक उसका पीला ऊपर न आ जाए।\nअगले के लिए सिर्फ़ ऊपरी परत घुमाएँ; नीचे का हिस्सा आख़िरी कोने के साथ लौटता है।';

  @override
  String get introHoldTwistCorners =>
      'पीला ऊपर, घुमाने वाला कोना आगे-दाएँ। कोनों के बीच सिर्फ़ ऊपरी परत घुमाएँ, पूरा क्यूब कभी नहीं।';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D कोना घुमाता है और नीचे बिखेरता है, पर सारे कोने घूमने पर नीचे लौट आता है। बीच में रुकने से वह बिगड़ा रह जाता है।';

  @override
  String get introHowCfopIntro =>
      'क्रॉस: चार एज, जिनकी योजना इंस्पेक्शन में बनती है।\nF2L: हर कोना अपने एज के साथ अंदर जाता है।\nOLL ऊपर को पीला करता है, फिर PLL टुकड़ों को उनकी जगह पहुँचाता है।';

  @override
  String get introHoldCfopIntro =>
      'स्पीडक्यूबर क्रॉस नीचे बनाते हैं, ताकि घुमाते समय अगले टुकड़े पहले से देख सकें।';

  @override
  String get introWhyCfopIntro =>
      'कोने को उसके एज के साथ हल करने से बहुत मूव बचते हैं, और केस पहचानना अंदाज़े की जगह लेता है।';

  @override
  String get introHowF2l =>
      'ऊपरी परत में एक कोना और उसका मेल खाता एज ढूँढें।\nउन्हें उनके स्लॉट के ऊपर जोड़ी बनाएँ।\nतीन-चार चालों में जोड़ी को अंदर डालें।';

  @override
  String get introHoldF2l =>
      'क्रॉस नीचे। जोड़ी का स्लॉट आगे-दाएँ, मिरर केस में आगे-बाएँ।';

  @override
  String get introWhyF2l =>
      'जुड़ा कोना और एज साथ अंदर जाते हैं, इसलिए एक-एक टुकड़े की जगह दो परतें एक साथ बढ़ती हैं।';

  @override
  String get introHowOll =>
      'पहले F R U R\' U\' F\' से पीला क्रॉस।\nफिर कोनों को घुमाएँ, जैसे Sune से।\nदिखने वाले पीले पैटर्न से केस पहचानें।';

  @override
  String get introHoldOll =>
      'पीला ऊपर। Sune के लिए, जिस अकेले कोने का पीला ऊपर है वह आगे-बाएँ रहता है।';

  @override
  String get introWhyOll =>
      'आख़िरी परत को पहले ओरिएंटेशन, फिर परम्यूटेशन में बाँटने से एल्गोरिदम कम रहते हैं।';

  @override
  String get introHowPll =>
      'ऊपरी फलक पहले से पूरा पीला है।\nT-perm कोने बदलता है; U-perm तीन एज घुमाता है।\nएल्गोरिदम चुनने के लिए साइड के रंग पढ़ें।';

  @override
  String get introHoldPll =>
      'पीला ऊपर। T-perm: हेडलाइट्स बाएँ। U-perm: पूरा साइड पीछे।';

  @override
  String get introWhyPll =>
      'ऊपर पूरा पीला होने पर सिर्फ़ टुकड़ों की जगहें गलत रहती हैं, और कुछ अदला-बदली से क्यूब पूरा हो जाता है।';

  @override
  String get introHowTwoFirst =>
      'एक सफ़ेद कोने को एंकर चुनें, सफ़ेद नीचे की ओर।\nहर अगले कोने को आगे-दाएँ उसकी जगह के ऊपर लाएँ।\nR U R\' U\' दोहराएँ जब तक वह मिलते साइड रंगों के साथ न बैठ जाए।';

  @override
  String get introHoldTwoFirst =>
      'सफ़ेद नीचे। खाली जगह आगे-दाएँ, उसका कोना ठीक ऊपर ऊपरी परत में।';

  @override
  String get introWhyTwoFirst =>
      '2×2 में केंद्र नहीं होते: पहला कोना अपने पड़ोसियों के रंग तय करता है, इसलिए सिर्फ़ सफ़ेद नहीं, साइड रंग भी मायने रखते हैं।';

  @override
  String get introHowTwoOll =>
      'गिनें कि कितने कोनों का पीला ऊपर है।\nएक हो तो उसे आगे-बाएँ रखें और Sune करें: R U R\' U R U2 R\'।\nफिर गिनें और दोहराएँ; ज़्यादा से ज़्यादा तीन Sune।';

  @override
  String get introHoldTwoOll =>
      'सफ़ेद नीचे, पीला ऊपर। हर Sune से पहले पीले-ऊपर वाला कोना आगे-बाएँ।';

  @override
  String get introWhyTwoOll =>
      'Sune सफ़ेद परत तोड़े बिना ऊपरी कोने घुमाता है; दोबारा गिनना बताता है कि अगली बार कैसे पकड़ें।';

  @override
  String get introHowTwoPbl =>
      'हेडलाइट्स ढूँढ़ें: एक साइड पर ऊपर के दो एक-जैसे स्टिकर।\nएक साइड पर हेडलाइट्स: उन्हें बाएँ रखें और T-perm करें।\nहेडलाइट्स नहीं: किसी भी तरफ़ से Y-perm करें, फिर ऊपर सीधा करें।';

  @override
  String get introHoldTwoPbl =>
      'सफ़ेद नीचे, पीला ऊपर। T-perm: हेडलाइट्स बाएँ। Y-perm: कोई भी साइड आपकी ओर।';

  @override
  String get introWhyTwoPbl =>
      'ऊपर पीला होने पर सिर्फ़ कोनों की जगहें गलत हैं: T-perm दो पड़ोसी, Y-perm दो तिरछे कोने बदलता है।';

  @override
  String get introHowBigIntro =>
      'कोई केंद्र स्थिर नहीं: चार केंद्र टुकड़े मिलकर फलक का रंग बनाते हैं।\nRw जैसी वाइड चालें दो परतें एक साथ घुमाती हैं।\n2R जैसी अंदरूनी चालें सिर्फ़ एक अंदरूनी परत घुमाती हैं।';

  @override
  String get introHoldBigIntro =>
      'शुरू में जैसे चाहें: 4×4 में कोई केंद्र स्थिर नहीं, इसलिए हर रंग कहाँ जाए यह आप चुनते हैं।';

  @override
  String get introWhyBigIntro =>
      'रिडक्शन केंद्रों और एज के टुकड़ों को जोड़ता है, ताकि बड़ा क्यूब 3×3 की तरह हल हो।';

  @override
  String get introHowBigCenters =>
      'पहले किसी कोने पर रंगों का क्रम जाँचें।\nदो आमने-सामने के केंद्र बनाएँ, फिर बाकी चार।\nअंदरूनी स्लाइस केंद्र के टुकड़े हिलाते हैं; खोली गई स्लाइस हमेशा वापस करें।';

  @override
  String get introHoldBigCenters =>
      'जो फ़ेस बना रहे हैं वह सामने; बने हुए केंद्र बाएँ और दाएँ, रास्ते से हटकर।';

  @override
  String get introWhyBigCenters =>
      'स्लाइस केंद्र हिलाती है और उसे वापस करने से बने हुए लौट आते हैं, इसलिए सिर्फ़ चाहा हुआ टुकड़ा बदलता है।';

  @override
  String get introHowBigEdges =>
      'एक जैसे दो रंगों वाले दो विंग ढूँढ़ें।\nउन्हें सामने सीध में लाएँ और Uw\' से जोड़ें।\nबिना जोड़ा एज अंदर लाएँ, फिर Uw केंद्र वापस रखता है।';

  @override
  String get introHoldBigEdges =>
      'जो एज जोड़ रहे हैं वह आगे की परतों में; बने हुए एज ऊपर और नीचे पार्क।';

  @override
  String get introWhyBigEdges =>
      'Uw\' केंद्रों को हटाता है ताकि दो विंग मिल सकें; Uw उन्हें लौटाता है और आपका काम बचा रहता है।';

  @override
  String get introHowBigParity =>
      '4×4 को 3×3 की तरह हल करें जब तक अटक न जाएँ।\nएक पलटा एज: लंबा OLL पैरिटी एल्गोरिदम।\nदो बदले हुए एज: 2R2 U2 2R2 Uw2 2R2 2U2।';

  @override
  String get introHoldBigParity =>
      'आख़िरी परत ऊपर। OLL पैरिटी: पलटा एज सामने। PLL पैरिटी: बदले हुए एज आगे और पीछे।';

  @override
  String get introWhyBigParity =>
      'विंग ऐसी हालत में पहुँच सकते हैं जो 3×3 में नहीं होती; ये एल्गोरिदम अंदरूनी परतें घुमाकर ठीक वही उलटते हैं।';

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
  String get stageCrown1 => 'पहली परत (सफ़ेद)';

  @override
  String get stageCrown2 => 'दूसरी परत';

  @override
  String get stageCrown3 => 'तीसरी परत (पीली)';

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
  String get introHoldFiveIntro =>
      'जैसे चाहें: 5×5 में हर फ़ेस का बीच कभी नहीं हिलता, इसलिए वही उसका रंग दिखाता है।';

  @override
  String get introWhyFiveIntro =>
      'स्थिर केंद्र रंग-योजना तय करते हैं, इसलिए केंद्र गलत क्रम में नहीं बन सकते।';

  @override
  String get lessonFiveCenters => '5×5 के केंद्र';

  @override
  String get lessonFiveCentersDesc => 'हर केंद्र तीन-तीन की पट्टियों से बनाएँ।';

  @override
  String get introGoalFiveCenters =>
      'हर फलक पर एक रंग का 3×3 केंद्र ब्लॉक बनाएँ।';

  @override
  String get introHowFiveCenters =>
      'स्थिर बीच वाले टुकड़े से शुरू करें: वही रंग तय करता है।\nतीन की पट्टियाँ बनाएँ और अंदरूनी स्लाइस से अंदर सरकाएँ।\nजो मूव पट्टी लाता है, वही बने हुए केंद्र को भी लौटाता है।';

  @override
  String get introHoldFiveCenters =>
      'जो केंद्र बना रहे हैं वह सामने या ऊपर; बने हुए केंद्र नीचे, बाएँ या दाएँ।';

  @override
  String get introWhyFiveCenters =>
      'स्लाइस अंदर, ऊपर घुमाएँ, स्लाइस वापस: पट्टी लाने वाली स्लाइस बने केंद्र भी लौटाती है।';

  @override
  String get lessonFiveEdges => '5×5 के एज';

  @override
  String get lessonFiveEdgesDesc => 'दो विंग को उनके बीच वाले एज से जोड़ें।';

  @override
  String get introGoalFiveEdges =>
      'हर बीच वाले एज को उसके दो विंग से जोड़ें, ताकि सभी 12 एज एक टुकड़े जैसे दिखें।';

  @override
  String get introHowFiveEdges =>
      'सामने हर विंग को उसके बीच वाले एज से मिलाएँ।\nअंदरूनी परत घुमाएँ, अधूरा एज अंदर लाएँ, वापस घुमाएँ।\nआख़िरी एज के लिए: स्लाइस, पलटें, स्लाइस।';

  @override
  String get introHoldFiveEdges =>
      'जो एज बना रहे हैं वह सामने; बने हुए एज ऊपरी और निचली परत में रखे हुए।';

  @override
  String get introWhyFiveEdges =>
      'अंदरूनी परत खोलना और बंद करना विंग जोड़ता है, और केंद्र व रखे हुए एज लौट आते हैं।';

  @override
  String get lessonFiveSolve => '5×5 को 3×3 की तरह हल करें';

  @override
  String get lessonFiveSolveDesc => '3×3 की तरह परत दर परत पूरा करें।';

  @override
  String get introGoalFiveSolve =>
      'रिड्यूस किए हुए 5×5 को 3×3 की तरह, परत दर परत, सिर्फ़ बाहरी मूव्स से हल करें।';

  @override
  String get introHowFiveSolve =>
      'अब से सिर्फ़ बाहरी मूव्स, वरना जुड़े एज अलग हो जाएँगे।\nसफ़ेद क्रॉस और कोने, बीच की परत, फिर पीली परत।\nस्थिर बीच वाले टुकड़े हर फ़ेस का रंग दिखाते हैं।';

  @override
  String get introHoldFiveSolve =>
      'पहली परत का रंग नीचे, बिल्कुल 3×3 की तरह; डालने वाला कोना आगे-दाएँ।';

  @override
  String get introWhyFiveSolve =>
      'अंदरूनी मूव केंद्र और एज फिर अलग कर देंगे; बाहरी मूव हर ब्लॉक को 3×3 के एक टुकड़े की तरह चलाते हैं।';

  @override
  String get lessonFiveParity => '5×5 एज पैरिटी';

  @override
  String get lessonFiveParityDesc => 'वह एज ठीक करें जिसके विंग बदले हुए हैं।';

  @override
  String get introGoalFiveParity =>
      'उस एक एज को ठीक करें जिसके दोनों बाहरी विंग आपस में बदले हुए हैं: 5×5 की इकलौती पैरिटी।';

  @override
  String get introHowFiveParity =>
      'यह आख़िरी एज के रूप में दिखती है जो पलटा हुआ लगता है।\nअंदरूनी स्लाइस वाला लंबा सुधार एक बार करें।\n5×5 में कोई PLL पैरिटी नहीं होती।';

  @override
  String get introHoldFiveParity =>
      'आख़िरी परत ऊपर, बदले विंग वाला एज ऊपरी परत में सामने।';

  @override
  String get introWhyFiveParity =>
      '5×5 में सिर्फ़ एक एज के दो बाहरी विंग बदल सकते हैं, इसलिए एक एल्गोरिदम काफ़ी है।';

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
  String get introHoldSixIntro =>
      'शुरू में जैसे चाहें: 4×4 की तरह 6×6 में भी कोई स्थिर केंद्र नहीं।';

  @override
  String get introWhySixIntro =>
      'अगर आप 4×4 और 5×5 हल कर लेते हैं, तो 6×6 वही रिडक्शन है, बस बड़े ब्लॉक के साथ।';

  @override
  String get lessonSixCenters => '6×6 के केंद्र';

  @override
  String get lessonSixCentersDesc => 'चार-चार की पट्टियों से 4×4 केंद्र बनाएँ।';

  @override
  String get introGoalSixCenters =>
      'हर फलक पर एक ही रंग का 4×4 केंद्र ब्लॉक बनाएँ।';

  @override
  String get introHowSixCenters =>
      'पहले किसी कोने पर रंगों का क्रम जाँचें: कोई केंद्र स्थिर नहीं है।\nचार की पट्टियाँ बनाएँ और उन्हें जोड़ें।\nआख़िरी दो केंद्रों में एक-एक टुकड़ा हिलाएँ: स्लाइस, ऊपर, वापस।';

  @override
  String get introHoldSixCenters =>
      'जो फ़ेस बना रहे हैं वह सामने; बने हुए केंद्र बाएँ, दाएँ या नीचे।';

  @override
  String get introWhySixCenters =>
      'पट्टियाँ अंदरूनी स्लाइस से जुड़ती हैं और हर स्लाइस वापस होती है, इसलिए बने केंद्र साबुत रहते हैं।';

  @override
  String get lessonSixEdges => '6×6 के एज';

  @override
  String get lessonSixEdgesDesc => 'हर एज के चारों टुकड़े इकट्ठा करें।';

  @override
  String get introGoalSixEdges =>
      'हर एज के चारों टुकड़े इकट्ठा करें ताकि 6×6 में 12 साफ़ एज हों।';

  @override
  String get introHowSixEdges =>
      'एक एज के बाहरी और अंदरूनी विंग सामने सीध में लाएँ।\nगहरी चौड़ी परत एज को अंदर-बाहर ले जाती है।\nकोई टुकड़ा छुड़ाने के लिए बना हुआ एज कभी न तोड़ें।';

  @override
  String get introHoldSixEdges =>
      'जो एज बना रहे हैं वह सामने; बने हुए एज ऊपर और नीचे पार्क।';

  @override
  String get introWhySixEdges =>
      'गहरा चौड़ा मूव केंद्रों को हटाता है ताकि विंग मिलें, फिर उन्हें लौटाता है।';

  @override
  String get lessonSixSolve => '6×6 को 3×3 की तरह हल करें';

  @override
  String get lessonSixSolveDesc => '3×3 की तरह परत दर परत पूरा करें।';

  @override
  String get introGoalSixSolve =>
      'रिड्यूस किए हुए 6×6 को 3×3 की तरह, परत दर परत, सिर्फ़ बाहरी मूव्स से हल करें।';

  @override
  String get introHowSixSolve =>
      'अब से सिर्फ़ बाहरी मूव्स: स्लाइस से केंद्र या एज टूट जाएगा।\nआपके बनाए केंद्र हर फ़ेस का रंग दिखाते हैं।\nसफ़ेद क्रॉस और कोने, बीच की परत, फिर पीली परत।';

  @override
  String get introHoldSixSolve =>
      'पहली परत का रंग नीचे, बिल्कुल 3×3 की तरह; डालने वाला कोना आगे-दाएँ।';

  @override
  String get introWhySixSolve =>
      'बाहरी मूव हर 4×4 केंद्र और हर एज को एक टुकड़े की तरह चलाते हैं, बिल्कुल 3×3 की तरह।';

  @override
  String get lessonSixParity => '6×6 पैरिटी';

  @override
  String get lessonSixParityDesc => 'एक उल्टा एज या दो बदले हुए एज।';

  @override
  String get introGoalSixParity =>
      '6×6 के वे दो केस ठीक करें जो 3×3 में नहीं होते: एक उल्टा एज या दो बदले हुए एज।';

  @override
  String get introHowSixParity =>
      '3×3 की तरह हल करें जब तक अटक न जाएँ।\nएक पलटा एज: 3Rw वाला लंबा सुधार।\nदो बदले हुए एज: अंदरूनी डबल मूव्स वाला छोटा सुधार।';

  @override
  String get introHoldSixParity =>
      'आख़िरी परत ऊपर। पलटा एज सामने; दो बदले एज हों तो आगे और पीछे।';

  @override
  String get introWhySixParity =>
      '4×4 की तरह 6×6 भी एक पलटे या दो बदले एज पर ख़त्म हो सकता है; अंदरूनी परत वाले एल्गोरिदम इन्हें ठीक करते हैं और बाकी को छोड़ देते हैं।';

  @override
  String get stepFivePieces => '5×5 के टुकड़े';

  @override
  String get stepFivePiecesBody =>
      'हर फ़ेस का बीच वाला टुकड़ा कभी नहीं हिलता, इसलिए रंग-योजना गलत नहीं हो सकती। उसके चारों ओर आठ केंद्र टुकड़े हैं: कोने-केंद्र और एज-केंद्र कभी अपनी क़िस्म नहीं बदलते। हर एज एक बीच वाला टुकड़ा और दो विंग है।';

  @override
  String get stepFiveSlices => 'तीन तरह के घुमाव';

  @override
  String get stepFiveSlicesBody =>
      'बाहरी घुमाव एक फलक घुमाता है। वाइड घुमाव फलक को पीछे वाली परत के साथ घुमाता है। अंदरूनी परत का घुमाव सिर्फ़ अंदर की एक परत घुमाता है: इसी से टुकड़े बाहर को छुए बिना जगह बदलते हैं।';

  @override
  String get stepFiveCenterBar => 'केंद्र पट्टियाँ';

  @override
  String get stepFiveCenterBarBody =>
      'तीन मिलते केंद्र टुकड़ों की पंक्ति बनाएँ, अंदरूनी स्लाइस से अंदर लाएँ, ऊपर घुमाएँ और स्लाइस वापस करें: पट्टी लाने वाला मूव बना केंद्र भी लौटाता है। तीन पट्टियों से एक केंद्र बनता है।';

  @override
  String get stepFiveCenterSwap => 'बिना तोड़े बदलें';

  @override
  String get stepFiveCenterSwapBody =>
      'एक केंद्र टुकड़ा हिलाने के लिए: अंदरूनी परत घुमाएँ, ऊपरी फलक घुमाएँ, परत वापस करें और ऊपरी फलक लौटाएँ। बने हुए केंद्र हर बार लौट आते हैं।';

  @override
  String get stepFiveEdgePair => 'विंग को बीच वाले एज से जोड़ें';

  @override
  String get stepFiveEdgePairBody =>
      'सामने एक विंग को उसके बीच वाले एज के बगल में सीध में लाएँ, अंदरूनी परत नीचे करें, एक छोटे ट्रिगर से अधूरा एज अंदर लाएँ, फिर अंदरूनी परत वापस करें।';

  @override
  String get stepFiveEdgeLast => 'आख़िरी एज';

  @override
  String get stepFiveEdgeLastBody =>
      'जब बदलने के लिए कोई खाली एज न बचे, तो स्लाइस, पलटें, स्लाइस करें: एक चौड़ा मूव, छोटा ट्रिगर और वापस चौड़ा मूव बने एज तोड़े बिना आख़िरी एज जोड़ देते हैं।';

  @override
  String get stepFiveAsThree => 'अब यह 3×3 है';

  @override
  String get stepFiveAsThreeBody =>
      'केंद्र और एज तैयार होने पर 5×5 एक बड़े 3×3 जैसा बर्ताव करता है। सिर्फ़ बाहरी मूव्स, परत दर परत: सफ़ेद क्रॉस और कोने, बीच की परत, फिर पीली परत। 5×5 में PLL पैरिटी नहीं होती।';

  @override
  String get stepFiveEdgeParity => 'आख़िरी एज के विंग बदलें';

  @override
  String get stepFiveEdgeParityBody =>
      'कभी-कभी आख़िरी एज के दोनों बाहरी विंग बदले होते हैं, इसलिए वह पलटा दिखता है: 5×5 की इकलौती पैरिटी। उसे ऊपरी परत में सामने रखें और अंदरूनी स्लाइस वाला एल्गोरिदम एक बार करें; बाकी सब अपनी जगह लौट आता है।';

  @override
  String get stepSixPieces => '6×6 के टुकड़े';

  @override
  String get stepSixPiecesBody =>
      '4×4 की तरह 6×6 में कोई स्थिर केंद्र नहीं: सोलह केंद्र टुकड़े हर फ़ेस का रंग बनाते हैं, इसलिए पहले किसी कोने पर रंगों का क्रम जाँचें। हर एज के चार विंग हैं: दो बाहरी और दो अंदरूनी।';

  @override
  String get stepSixSlices => 'गहरी परतें घुमाना';

  @override
  String get stepSixSlicesBody =>
      'वाइड घुमाव एक फलक से दो या तीन परतें हिला सकते हैं। दूसरी या तीसरी अंदरूनी परत केंद्रों और एज के औज़ार हैं।';

  @override
  String get stepSixCenterBar => 'चार की पट्टियाँ';

  @override
  String get stepSixCenterBarBody =>
      'चार मिलते केंद्र टुकड़ों की पंक्तियाँ बनाएँ और अंदरूनी स्लाइस मूव्स से उन्हें पास-पास सरकाएँ, हर स्लाइस वापस करते हुए, जब तक फ़ेस एक रंग का 4×4 ब्लॉक न बन जाए।';

  @override
  String get stepSixCenterSwap => 'एक बार में एक टुकड़ा';

  @override
  String get stepSixCenterSwapBody =>
      'तीसरी परत घुमाएँ, ऊपर घुमाएँ, वापस करें, ऊपर वापस: एक केंद्र टुकड़ा हिलता है और बने केंद्र लौट आते हैं। आख़िरी दो केंद्रों में, जब कोई पट्टी फ़िट न हो, यह करें।';

  @override
  String get stepSixEdgePair => 'चार टुकड़े, एक एज';

  @override
  String get stepSixEdgePairBody =>
      'गहरी चौड़ी परत से एक एज के चारों विंग सामने इकट्ठा करें, एक छोटे ट्रिगर से अधूरा एज अंदर लाएँ, फिर चौड़ी परत वापस घुमाएँ।';

  @override
  String get stepSixEdgeLast => 'आख़िरी एज';

  @override
  String get stepSixEdgeLastBody =>
      'आख़िरी एज को गहरे चौड़े मूव और उसके उलटे मूव के बीच एक छोटे ट्रिगर से जोड़ें, ताकि बने एज जुड़े रहें। कोई टुकड़ा छुड़ाने के लिए बना एज कभी न तोड़ें।';

  @override
  String get stepSixAsThree => 'अब यह 3×3 है';

  @override
  String get stepSixAsThreeBody =>
      '4×4 केंद्रों और जुड़े एज के साथ 6×6 को 3×3 की तरह, परत दर परत, सिर्फ़ बाहरी मूव्स से हल करें। आख़िर में एक पलटा या दो बदले एज पैरिटी है, गलती नहीं।';

  @override
  String get stepSixOllParity => 'एक उल्टा एज';

  @override
  String get stepSixOllParityBody =>
      'आख़िरी परत में अकेला पलटा दिखता एज पैरिटी है। उसे ऊपरी परत में सामने रखें और लंबा सुधार करें: यह चारों विंग पलटता है, ऊपर के बाएँ-दाएँ एज भी बदलता है और पहली दो परतों को नहीं छूता।';

  @override
  String get stepSixPllParity => 'दो बदले हुए एज';

  @override
  String get stepSixPllParityBody =>
      'अगर बिल्कुल आख़िर में दो एज बदले दिखें, तो उन्हें ऊपरी परत में आगे और पीछे रखें और अंदरूनी डबल मूव्स वाला छोटा सुधार करें: दोनों एज के चारों विंग जगह बदल लेते हैं।';

  @override
  String get stepSixWingRule => 'चार विंग या दो?';

  @override
  String get stepSixWingRuleBody =>
      '6×6 का एज 4 विंग से बनता है। पलटे दिखते एज को ठीक करने से पहले ध्यान से देखें: अगर चारों विंग पलटे हैं, तो सामान्य 3-परत OLL पैरिटी लगाएँ; अगर सिर्फ़ 2 अंदरूनी विंग पलटे हैं, तो अंदरूनी-विंग पैरिटी लगाएँ। क्यूब अंदरूनी विंग वाला केस दिखा रहा है।';

  @override
  String get stepSixInnerWingParity => 'दो अंदरूनी विंग पलटे';

  @override
  String get stepSixInnerWingParityBody =>
      'यहाँ सामने वाले ऊपरी एज के बाहरी विंग ठीक हैं और सिर्फ़ 2 अंदरूनी विंग पलटे हैं। उस एज को ऊपरी परत में सामने रखें और सिर्फ़ तीसरी स्लाइस (3R, 3L) घुमाएँ: अंदरूनी विंग वापस पलट जाते हैं और बाकी क्यूब हल रहता है।';

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
  String fastMoveCounter(int current, int total) {
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

  @override
  String homeAcademyProgress(int done, int total) {
    return '$total में से $done पाठ पूरे';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total पूरे';
  }

  @override
  String get lessonStageConcept => 'समझ';

  @override
  String get lessonStageExamples => 'उदाहरण';

  @override
  String get lessonStagePractice => 'अभ्यास';

  @override
  String get lessonStageNext => 'आगे / खुला';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'चरण $index / $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'उदाहरण $index / $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'अभ्यास $index / $total';
  }

  @override
  String get lessonBonusCase => 'बोनस केस';

  @override
  String lessonContinueDesc(String lesson) {
    return 'सीधे $lesson पर जाएँ।';
  }

  @override
  String get lessonFreePractice => 'खुला अभ्यास';

  @override
  String get lessonFreePracticeDesc =>
      'मिले-जुले 3D क्यूब को खुद हल करें, शुरुआत से इस स्टेप तक।';

  @override
  String freePracticeBanner(String topic) {
    return 'खुलकर अभ्यास करें: क्यूब को शुरुआत से $topic तक हल करें!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return '$face केंद्र वाली फ़ेस को तीर की दिशा में घुमाएँ। केंद्र अपनी जगह रहता है; सिर्फ़ उसके आसपास के टुकड़े चलते हैं।';
  }

  @override
  String cueTrigger(String front) {
    return 'दाएँ हाथ का ट्रिगर, $front आपकी ओर: दायाँ फ़ेस ऊपर, ऊपरी परत बाएँ, दायाँ फ़ेस नीचे, ऊपरी परत वापस दाएँ।';
  }

  @override
  String get cueTriggerBack =>
      'लगातार छठा ट्रिगर क्यूब को ठीक पहले जैसा कर देता है। छह जादुई संख्या है!';

  @override
  String cueSliceInner(String face) {
    return '$face फ़ेस के बगल वाली सिर्फ़ अंदरूनी परत घुमाएँ। फ़ेस खुद नहीं हिलता, इसलिए केंद्र अलग हो जाते हैं।';
  }

  @override
  String cueSliceWide(String face) {
    return 'चौड़ी चाल: $face फ़ेस और उसके बगल की अंदरूनी परत एक मोटी परत की तरह साथ घूमती हैं।';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'पूरे क्यूब को ऐसे घुमाएँ कि $top केंद्र ऊपर हो और $front केंद्र आपकी ओर हो।';
  }

  @override
  String get cueTurnTop =>
      'अगले एल्गोरिद्म की तैयारी के लिए तीर के अनुसार सिर्फ़ ऊपरी परत घुमाएँ।';

  @override
  String get cueAlignTop => 'आख़िरी चाल: ऊपरी परत घुमाकर रंग मिला दें। हो गया!';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece एज ऊपरी परत में है। ऊपरी परत घुमाएँ जब तक वह $center केंद्र के ठीक ऊपर न आ जाए, फिर उसे नीचे लाने के लिए वह फ़ेस दो बार घुमाएँ।';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece एज बीच की परत में फँसा है। उसे ऊपर लाएँ, $center केंद्र के ऊपर मिलाएँ, फिर नीचे लाएँ।';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece एज अपनी जगह पर है पर पलटा हुआ है: उसका सफ़ेद साइड की ओर है। उसे निकालें और सफ़ेद ऊपर करके ऊपर ले जाएँ, फिर $center केंद्र के बगल में उतारें।';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP तरीके में नीचे की परत भी घुमा सकते हैं। $piece एज नीचे लाएँ और नीचे की परत घुमाकर उसे $center केंद्र से मिलाएँ।';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'ऊपरी परत घुमाएँ जब तक $piece कोना अपनी जगह के ठीक ऊपर, $a और $b साइड के बीच, न आ जाए। दाएँ हाथ का ट्रिगर दोहराएँ जब तक वह सही घूमकर अंदर न बैठ जाए।';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece कोना अपनी जगह पर है पर मुड़ा हुआ है। एक ट्रिगर उसे बाहर निकालता है (उसकी जगह पीला कोना आता है); उसी जगह के ऊपर दोहराते रहें जब तक वह सफ़ेद नीचे करके वापस न बैठे। उसके पीछे क्यूब न घुमाएँ।';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'ऊपरी परत घुमाएँ जब तक $piece एज $a केंद्र से न मिल जाए, फिर उसे नीचे दाईं ओर, $a और $b के बीच की जगह में भेजें।';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'ऊपरी परत घुमाएँ जब तक $piece एज $a केंद्र से न मिल जाए, फिर उसे नीचे बाईं ओर, $a और $b के बीच की जगह में भेजें।';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece एज अपनी जगह पर है पर पलटा हुआ है। वहाँ एक पीला एज डालकर उसे ऊपर धकेलें, फिर उसे $a और $b के बीच दोबारा डालें।';
  }

  @override
  String cueYellowLine(String front) {
    return 'पीली रेखा: ऊपरी परत घुमाएँ ताकि रेखा बाएँ से दाएँ जाए, $front को अपनी ओर रखें, फिर पीले क्रॉस का एल्गोरिद्म करें।';
  }

  @override
  String cueYellowL(String front) {
    return 'पीला L: ऊपरी परत घुमाएँ ताकि L पीछे-बाईं ओर इशारा करे, $front को अपनी ओर रखें, फिर एल्गोरिद्म करें। यह रेखा बन जाता है।';
  }

  @override
  String cueYellowDot(String front) {
    return 'सिर्फ़ केंद्र पीला है: बिंदु। $front को अपनी ओर रखकर एल्गोरिदम एक बार करें, L बनेगा। बिंदु में तीन राउंड लग सकते हैं, करते रहें।';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'ऊपरी परत घुमाएँ जब तक $piece एज $center केंद्र से न मिल जाए।';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'मिले हुए दो एज पीछे और दाईं ओर हैं। $front को अपनी ओर रखकर अदला-बदली करें: सामने और बाएँ वाले एज जगह बदलते हैं।';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'मिले हुए एज आमने-सामने हैं। $front को अपनी ओर रखकर अदला-बदली एक बार करें; उसके बाद दो पड़ोसी एज मिल जाएँगे।';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece कोना पहले से अपनी जगह पर है। उसे आगे-दाईं ओर रखें, $front आपकी ओर, और बाकी तीन कोनों को घुमाकर बदलें।';
  }

  @override
  String cueCornersNone(String front) {
    return 'अभी कोई पीला कोना अपनी जगह पर नहीं है। $front को अपनी ओर रखकर एक बार चक्र करें; उसके बाद एक कोना अपनी जगह पर होगा।';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'आगे-दाएँ $piece कोना घुमाएँ: नीचे वाला ट्रिगर जोड़ों में दोहराएँ जब तक उसका पीला ऊपर न आए। निचली परतें अभी बिखरी दिखेंगी; आख़िरी कोने के साथ लौट आएँगी!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'इस बार $piece कोने को चार ट्रिगर चाहिए। जारी रखें: पीला रंग हमेशा दो या चार के बाद ऊपर आता है।';
  }

  @override
  String get cueTwistNext =>
      'अगले मुड़े हुए कोने को आगे-दाईं ओर लाने के लिए सिर्फ़ ऊपरी परत घुमाएँ। अभी पूरा क्यूब न घुमाएँ!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'ऊपर $piece कोने को $edge एज के साथ जोड़ें, फिर जोड़ी को $a और $b के बीच की जगह में डालें।';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece कोना गलत एज के साथ अपनी जगह में फँसा है। पहले उसे ऊपर निकालें, फिर जोड़ी बनाकर डालें।';
  }

  @override
  String cueOllSune(String front) {
    return '$front को अपनी ओर रखकर Sune करें, ताकि पीले कोने ऊपर की ओर हो जाएँ।';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'इस बार एक Sune काफ़ी नहीं था। ऊपरी परत घुमाएँ और $front को अपनी ओर रखकर फिर से Sune करें।';
  }

  @override
  String cuePllCorners(String front) {
    return 'दो कोनों को अदला-बदली करनी है। मिलती हुई जोड़ी (हेडलाइट्स) को बाईं ओर रखें, $front आपकी ओर, और T-perm करें।';
  }

  @override
  String cuePllEdges(String piece) {
    return 'कोने तैयार हैं। $piece एज को पीछे रखें और बाकी तीन एज को U-perm से घुमाकर बदलें।';
  }

  @override
  String get cuePllNoEdge =>
      'अभी कोई ऊपरी एज अपने केंद्र से नहीं मिलता। किसी भी ओर से एक बार U-perm करें; उसके बाद एक एज मिल जाएगा।';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'ऊपर के दो पड़ोसी कोनों को अदला-बदली करनी है। मिलती जोड़ी को बाईं ओर रखें, $front आपकी ओर, और अदला-बदली करें।';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'बदलने वाले दो कोने तिरछे आमने-सामने हैं। $front को अपनी ओर रखकर तिरछी अदला-बदली करें।';
  }

  @override
  String cueCenterCycle(String color) {
    return 'भटके हुए $color केंद्र टुकड़े को केंद्रों के 3-साइकिल से घर लाएँ: परत, ऊपर, परत, फिर सब वापस।';
  }

  @override
  String cueCenterBar(String color) {
    return '$color केंद्र टुकड़ों की पूरी पट्टी गलत फ़ेस पर है। उसे अंदरूनी परत से उठाएँ, ऊपरी परत घुमाएँ और घर वापस लाएँ।';
  }

  @override
  String cueEdgePair(String piece) {
    return '$piece एज के दोनों टुकड़े जोड़ें: उन्हें सीध में लाएँ, परत घुमाएँ, दाएँ हाथ की चालों से एक बिना जोड़ी वाला एज बदलें और परत वापस घुमाएँ।';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'आख़िरी एज: $piece एज को आख़िरी दो एज वाले एल्गोरिद्म से जोड़ें, जो तैयार सभी एज को बरकरार रखता है।';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL पैरिटी: ऊपर का एक एज पलटा है, जो 3×3 में कभी नहीं होता। उसे सामने रखें, $front आपकी ओर, और किसी भी सामान्य OLL से पहले पैरिटी सुधार करें।';
  }

  @override
  String get cueParityPll =>
      'PLL पैरिटी: ऊपर के दो एज बदले हुए हैं, जो 3×3 में कभी नहीं होता। उन्हें आगे और पीछे रखें, पैरिटी स्वैप करें, फिर ऊपर सीधा करें।';

  @override
  String cueParityFive(String front) {
    return 'एज पैरिटी: एक एज के दोनों बाहरी विंग बदले हुए हैं, 5×5 की इकलौती पैरिटी। उस एज को सामने रखें, $front आपकी ओर, और सुधार एक बार करें।';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'अंदरूनी-विंग पैरिटी: ऊपरी एज के सिर्फ़ 2 अंदरूनी विंग पलटे हैं। उसे सामने रखें, $front आपकी ओर, और सिर्फ़ तीसरी स्लाइस घुमाएँ।';
  }

  @override
  String get wingRuleAllFour => 'चारों विंग पलटे';

  @override
  String get wingRuleAllFourFix => '3-परत OLL पैरिटी (3Rw)';

  @override
  String get wingRuleInnerTwo => 'सिर्फ़ 2 अंदरूनी विंग पलटे';

  @override
  String get wingRuleInnerTwoFix => 'अंदरूनी-विंग पैरिटी (3R)';

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingNext => 'आगे';

  @override
  String get onboardingStart => 'शुरू करें';

  @override
  String get onboardingWhatTitle => 'आपका क्यूब साथी';

  @override
  String get onboardingWhatBody =>
      'CubeMentor आपको 2×2 से 6×6 तक हर क्यूब हल करने, सीखने और अभ्यास करने में मदद करता है, पूरी तरह ऑफ़लाइन।';

  @override
  String get onboardingScanTitle => 'सेकंडों में स्कैन करें और हल करें';

  @override
  String get onboardingScanBody =>
      'हर फलक कैमरे को दिखाएँ (या रंग टैप करें) और 3D हल को एक-एक चाल करके फ़ॉलो करें।';

  @override
  String get onboardingLearnTitle => 'सीखें और खेलें';

  @override
  String get onboardingLearnBody =>
      'अकादमी में परत-दर-परत तरीका सीखें, फिर 3D प्लेग्राउंड में खुलकर घुमाएँ, मिलाएँ और हल करें।';

  @override
  String get scanChoiceManualDesc =>
      'हर फलक के रंग एक-एक स्टिकर करके टैप करें।';

  @override
  String get scanTryAgain => 'फिर से कोशिश करें';

  @override
  String get scanEditManually => 'रंग ख़ुद ठीक करें';

  @override
  String get scanLightingHint =>
      'फलक को ग्रिड के बीच में रखें। तेज़, समान रोशनी इस्तेमाल करें और चमक से बचें।';

  @override
  String get crownExplain =>
      'परत क्यूब की एक क्षैतिज पट्टी है: पहली परत नीचे की सफ़ेद परत है, दूसरी बीच की परत और तीसरी ऊपर की पीली परत।';

  @override
  String get lessonObjectiveHeading => 'सीखने का लक्ष्य';

  @override
  String get dirRowTop => 'सामने के फलक की ऊपरी पंक्ति';

  @override
  String get dirRowBottom => 'सामने के फलक की निचली पंक्ति';

  @override
  String get dirColumnRight => 'सामने के फलक का दायाँ कॉलम';

  @override
  String get dirColumnLeft => 'सामने के फलक का बायाँ कॉलम';

  @override
  String get solveChoiceTitle => 'आप इसे कैसे हल करना चाहते हैं?';

  @override
  String get solveChoiceFastDesc => 'सबसे छोटा हल, एक-एक चाल करके।';

  @override
  String get solveChoiceGuidedDesc => 'परत-दर-परत तरीका एक-एक कदम सीखें।';

  @override
  String get guidedSolvedTitle => 'हल हो गया!';

  @override
  String get guidedSolvedBody => 'आपने हर कदम पूरा किया और क्यूब हल कर दिया।';

  @override
  String get solveAgain => 'फिर से हल करें';

  @override
  String get backToHome => 'होम पर वापस जाएँ';

  @override
  String get dailyStatTime => 'आज का समय';

  @override
  String get dailyStatBest => 'पर्सनल बेस्ट';

  @override
  String get dailyStatStreak => 'मौजूदा स्ट्रीक';

  @override
  String get dailyStatBestStreak => 'सबसे लंबी स्ट्रीक';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get settingsPrivacyPolicyDesc =>
      'CubeMentor क्या सहेजता है और विज्ञापन क्या इस्तेमाल करते हैं।';

  @override
  String get privacyIntro =>
      'CubeMentor बिना खाते और बिना अपने सर्वर के काम करता है। यह पेज बताता है कि आपके डिवाइस पर क्या रहता है और हमारा विज्ञापन पार्टनर क्या इस्तेमाल करता है।';

  @override
  String get privacyDataTitle => 'आपका डेटा आपके डिवाइस पर रहता है';

  @override
  String get privacyDataBody =>
      'आपकी भाषा, सेटिंग्स, पाठों की प्रगति, हल करने के समय और डेली स्ट्रीक सिर्फ़ इसी डिवाइस पर सहेजे जाते हैं। हमारे पास कोई सर्वर नहीं है, इसलिए वे हमें कभी नहीं मिलते। ऐप अनइंस्टॉल करने पर वे मिट जाते हैं।';

  @override
  String get privacyCameraTitle => 'कैमरा';

  @override
  String get privacyCameraBody =>
      'कैमरा सिर्फ़ तब इस्तेमाल होता है जब आप क्यूब स्कैन करते हैं। स्टिकर के रंग पढ़ने के लिए तस्वीरों का विश्लेषण आपके डिवाइस पर होता है; कोई फ़ोटो या वीडियो सहेजा या कहीं भेजा नहीं जाता।';

  @override
  String get privacyAdsTitle => 'विज्ञापन';

  @override
  String get privacyAdsBody =>
      'ऐप Google AdMob के विज्ञापन दिखाता है। Google विज्ञापन दिखाने और मापने के लिए डिवाइस आइडेंटिफ़ायर और विज्ञापन इंटरैक्शन डेटा का इस्तेमाल कर सकता है, जैसा Google की गोपनीयता नीति में बताया गया है। जहाँ क़ानून ज़रूरी बनाता है, वहाँ पहले आपकी सहमति माँगी जाती है और आप उसे सेटिंग्स में बदल सकते हैं।';

  @override
  String get privacyContactTitle => 'संपर्क';

  @override
  String privacyContactBody(String email) {
    return 'गोपनीयता के बारे में सवाल हैं? हमें $email पर लिखें।';
  }
}
