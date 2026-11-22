// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      '2×2 থেকে 6×6 পর্যন্ত যেকোনো কিউব স্ক্যান করুন, সমাধান করুন আর আয়ত্ত করুন।';

  @override
  String get chooseCubeSize => 'আপনার কিউব বেছে নিন';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'শিক্ষানবিশ';

  @override
  String get cubeLevel3 => 'ক্লাসিক';

  @override
  String get cubeLevel4 => 'উন্নত';

  @override
  String get cubeLevel5 => 'দক্ষ';

  @override
  String get cubeLevel6 => 'মাস্টার';

  @override
  String get cubeComingSoon => 'নতুন কিউব শিগগিরই আসছে';

  @override
  String get carouselPrevious => 'আগের কিউব';

  @override
  String get carouselNext => 'পরের কিউব';

  @override
  String get chooseMode => 'আপনি কী করতে চান?';

  @override
  String get modePlayground => '3D প্লেগ্রাউন্ড';

  @override
  String get modePlaygroundDesc =>
      '3D-তে স্তর ঘোরান, এলোমেলো করুন আর চালগুলো আবার দেখুন।';

  @override
  String get modeScanSolve => 'স্ক্যান ও সমাধান';

  @override
  String get modeScanSolveDesc => 'ক্যামেরা দিয়ে কিউব স্ক্যান করে সমাধান পান।';

  @override
  String get modeAcademy => 'অ্যাকাডেমি';

  @override
  String get modeAcademyDesc => 'ইন্টারঅ্যাক্টিভ পাঠে ধাপে ধাপে শিখুন।';

  @override
  String get language => 'ভাষা';

  @override
  String get languageSearch => 'ভাষা খুঁজুন';

  @override
  String get languageNoResults => 'আপনার খোঁজের সাথে কোনো ভাষা মেলেনি।';

  @override
  String playgroundTitle(int size) {
    return '$size×$size প্লেগ্রাউন্ড';
  }

  @override
  String get scramble => 'এলোমেলো';

  @override
  String get reset => 'রিসেট';

  @override
  String get undo => 'পূর্বাবস্থা';

  @override
  String get speed => 'গতি';

  @override
  String get xray => 'এক্স-রে';

  @override
  String get prime => 'প্রাইম';

  @override
  String get wide => 'ওয়াইড';

  @override
  String layer(int index) {
    return 'স্তর $index';
  }

  @override
  String get cubeRotations => 'ঘূর্ণন';

  @override
  String get play => 'চালান';

  @override
  String get pause => 'থামান';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি চাল',
      one: '1টি চাল',
      zero: 'কোনো চাল নেই',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'সমাধান হয়েছে';

  @override
  String get scrambled => 'এলোমেলো';

  @override
  String get orbitHint => 'সারি টেনে ঘোরান · পটভূমি টেনে কিউব ঘুরিয়ে দেখুন';

  @override
  String get notationPad => 'নোটেশন প্যাড';

  @override
  String get solve => 'সমাধান';

  @override
  String get solving => 'সমাধান হচ্ছে…';

  @override
  String get solveFast => 'দ্রুত সমাধান';

  @override
  String get solveLearn => 'ধাপে ধাপে শিখুন';

  @override
  String get solveModeGuided => 'নির্দেশিত (৩ মুকুট)';

  @override
  String get solveModeFast => 'দ্রুত (সর্বোত্তম)';

  @override
  String solveUnavailable(int size) {
    return '$size×$size সমাধানকারী পরের আপডেটে আসবে।';
  }

  @override
  String get solveAlreadySolved => 'কিউবটি আগেই সমাধান করা আছে।';

  @override
  String solveFailed(String reason) {
    return 'এই কিউবটির সমাধান সম্ভব নয় ($reason)।';
  }

  @override
  String get solveEngineMissing => 'এই ডিভাইসে সমাধান ইঞ্জিন উপলভ্য নয়।';

  @override
  String get solveComplete => 'সমাধান হয়েছে! দারুণ কাজ।';

  @override
  String solveSummary(int count) {
    return '$countটি চাল';
  }

  @override
  String get nextMove => 'পরের চাল';

  @override
  String get previousMove => 'আগের চাল';

  @override
  String get halfTurnHalfway =>
      'চমৎকার, অর্ধেক হয়ে গেছে! ডাবল টার্নের (180°) জন্য আরও একবার ঘোরান।';

  @override
  String get wideTurnInner =>
      'দারুণ! এবার ওয়াইড টার্ন শেষ করতে পাশের ভেতরের স্তরটি সোয়াইপ করুন।';

  @override
  String get wideTurnOuter =>
      'দারুণ! এবার ওয়াইড টার্ন শেষ করতে পাশের বাইরের স্তরটি সোয়াইপ করুন।';

  @override
  String get wideTurnMore =>
      'দারুণ! ওয়াইড টার্ন শেষ করতে উজ্জ্বল স্তরগুলো একে একে সোয়াইপ করতে থাকুন।';

  @override
  String get guideSwipeHint =>
      'তীর যেদিকে দেখাচ্ছে, উজ্জ্বল স্তরটি সেদিকে সোয়াইপ করুন, অথবা পরবর্তী চাপুন।';

  @override
  String get guideRotateHint => 'তীরের মতো পুরো কিউবটি ঘোরান: পরবর্তী চাপুন।';

  @override
  String get guideWrongMove => 'চিহ্নিত তীরটি অনুসরণ করুন';

  @override
  String get guideExit => 'গাইড বন্ধ করুন';

  @override
  String get colorWhite => 'সাদা';

  @override
  String get colorYellow => 'হলুদ';

  @override
  String get colorGreen => 'সবুজ';

  @override
  String get colorBlue => 'নীল';

  @override
  String get colorRed => 'লাল';

  @override
  String get colorOrange => 'কমলা';

  @override
  String get phaseOptimal2x2 => 'সর্বোত্তম সমাধান';

  @override
  String get phaseKociemba1 => 'পর্ব 1 · টুকরোগুলোর দিক ঠিক করুন';

  @override
  String get phaseKociemba2 => 'পর্ব 2 · কিউবটি শেষ করুন';

  @override
  String get phaseLblCross => 'সাদা ক্রস';

  @override
  String get phaseLblCorners => 'প্রথম মুকুটের কোণ';

  @override
  String get phaseLblMiddle => 'মাঝের স্তরের কিনারা';

  @override
  String get phaseLblYellowCross => 'হলুদ ক্রস';

  @override
  String get phaseLblYellowEdges => 'হলুদ ক্রসের কিনারা মেলান';

  @override
  String get phaseLblYellowCorners => 'হলুদ কোণগুলো জায়গামতো বসান';

  @override
  String get phaseLblYellowCornersOrient => 'হলুদ কোণগুলোর দিক ঠিক করুন';

  @override
  String get crownFirst => 'প্রথম মুকুট';

  @override
  String get crownSecond => 'দ্বিতীয় মুকুট';

  @override
  String get crownThird => 'তৃতীয় মুকুট';

  @override
  String get crownFirstGoal => 'সাদা দিক ও প্রথম স্তর';

  @override
  String get crownSecondGoal => 'মাঝের স্তর';

  @override
  String get crownThirdGoal => 'হলুদ দিক ও শেষ স্তর';

  @override
  String get subStepGoal11 =>
      'এমন একটি সাদা ক্রস বানান যেখানে প্রতিটি সাদা কিনারা পাশের কেন্দ্রের রঙের সাথেও মেলে।';

  @override
  String get subStepGoal12 =>
      '৪টি সাদা কোণ নিজ নিজ জায়গায় বসিয়ে সাদা দিক আর পুরো প্রথম বলয়টি শেষ করুন।';

  @override
  String get subStepGoal21 =>
      'প্রথম মুকুট না ভেঙে মাঝের স্তরের ৪টি কিনারা বসান।';

  @override
  String get subStepGoal31 => 'শেষ স্তরে একটি হলুদ ক্রস বানান।';

  @override
  String get subStepGoal32 =>
      'হলুদ ক্রসের কিনারাগুলো অদলবদল করুন, যতক্ষণ না প্রতিটি নিজের পাশের কেন্দ্রের সাথে মেলে।';

  @override
  String get subStepGoal33 =>
      '৪টি হলুদ কোণ সঠিক জায়গায় নিন, এখনও মোচড়ানো থাকলেও চলবে।';

  @override
  String get subStepGoal34 =>
      'প্রতিটি হলুদ কোণ জায়গায় রেখেই মোচড়ান, যতক্ষণ না সব স্টিকার মেলে আর কিউবটি সমাধান হয়।';

  @override
  String get explainOptimal2x2 =>
      'সম্ভাব্য সবচেয়ে ছোট সমাধান, 2×2-এর প্রতিটি অবস্থান খুঁজে পাওয়া।';

  @override
  String get explainKociemba1 =>
      'প্রতিটি টুকরোর দিক ঠিক করুন আর মাঝের স্তরের কিনারাগুলো মাঝের স্তরে জড়ো করুন।';

  @override
  String get explainKociemba2 =>
      'শুধু U, D আর হাফ টার্ন দিয়ে শেষ করুন, এগুলো সেই দিক বজায় রাখে।';

  @override
  String get explainLblOrient =>
      'পুরো কিউবটি এমনভাবে ঘোরান যাতে সাদা কেন্দ্র নিচের দিকে থাকে।';

  @override
  String explainLblCrossEdge(String piece) {
    return '$piece কিনারাটি সাদা কেন্দ্রের পাশে নিচে আনুন, যাতে তার পাশের রং মেলে।';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece কোণটি ভুল জায়গায় আটকে আছে। R U R\' U\' দিয়ে সেটিকে উপরে তুলুন।';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'উপরের স্তর ঘোরান, যতক্ষণ না $piece কোণটি তার জায়গার ঠিক উপরে আসে।';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '$piece কোণটি জায়গায় না বসা পর্যন্ত R U R\' U\' বারবার করুন।';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece কিনারাটি মাঝের স্তরে আছে কিন্তু ভুলভাবে। সেটিকে উপরে বের করে আনুন।';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'উপরের স্তর ঘোরান যাতে $piece কিনারার পাশের রং তার কেন্দ্রের সাথে মেলে।';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '$piece কিনারাটি ডানদিকে বসান: U R U\' R\' U\' F\' U F।';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '$piece কিনারাটি বাঁদিকে বসান: U\' L\' U L U F U\' F\'।';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'পরের অ্যালগরিদমের জন্য হলুদ আকৃতিটি সাজাতে উপরের স্তর ঘোরান।';

  @override
  String get explainLblYellowCrossAlg =>
      'F R U R\' U\' F\' দিয়ে হলুদ ক্রস বানান।';

  @override
  String get explainLblYellowEdgesAlign =>
      'হলুদ কিনারাগুলো তাদের কেন্দ্রের সাথে মেলাতে উপরের স্তর ঘোরান।';

  @override
  String get explainLblYellowEdgesAlg =>
      'R U R\' U R U2 R\' U দিয়ে হলুদ কিনারা অদলবদল করুন।';

  @override
  String get explainLblYellowCornersAlg =>
      'U R U\' L\' U R\' U\' L দিয়ে হলুদ কোণগুলো ঘুরিয়ে নিজ জায়গায় আনুন।';

  @override
  String get explainLblNextCorner =>
      'পরের অসমাধিত হলুদ কোণটি সামনে-ডানে আনতে উপরের স্তর ঘোরান।';

  @override
  String get explainLblCornerTwist =>
      'হলুদ উপরের দিকে না আসা পর্যন্ত R\' D\' R D বারবার করুন। শেষে নিচের অংশ নিজেই ঠিক হয়ে যায়।';

  @override
  String get explainLblFinalAlign => 'কিউবটি শেষ করতে উপরের স্তর ঘোরান।';

  @override
  String scanTitle(int size) {
    return '$size×$size স্ক্যান';
  }

  @override
  String get scanManualInput => 'হাতে রং লিখুন';

  @override
  String get scanUseCamera => 'ক্যামেরা দিয়ে স্ক্যান করুন';

  @override
  String scanFaceProgress(int current, int total) {
    return 'দিক $current / $total';
  }

  @override
  String get faceUp => 'উপরের দিক';

  @override
  String get faceRight => 'ডান দিক';

  @override
  String get faceFront => 'সামনের দিক';

  @override
  String get faceDown => 'নিচের দিক';

  @override
  String get faceLeft => 'বাম দিক';

  @override
  String get faceBack => 'পেছনের দিক';

  @override
  String get scanHintFront =>
      'যেকোনো একটি দিক নিজের দিকে রেখে কিউবটি ধরুন। এটিই আপনার সামনের দিক: স্ক্যানের সময় উপরের দিকটি একই রাখুন।';

  @override
  String get scanHintRight =>
      'সামনের অবস্থান থেকে পুরো কিউবটি একবার বাঁদিকে ঘোরান, যাতে ডান দিকটি আপনার দিকে আসে।';

  @override
  String get scanHintBack =>
      'সামনের অবস্থান থেকে পুরো কিউবটি দুবার বাঁদিকে ঘোরান।';

  @override
  String get scanHintLeft =>
      'সামনের অবস্থান থেকে পুরো কিউবটি একবার ডানদিকে ঘোরান।';

  @override
  String get scanHintUp =>
      'সামনের অবস্থান থেকে উপরের দিকটি নিজের দিকে কাত করুন, যাতে সেটি ক্যামেরার দিকে থাকে।';

  @override
  String get scanHintDown =>
      'সামনের অবস্থান থেকে নিচের দিকটি নিজের দিকে কাত করুন, যাতে সেটি ক্যামেরার দিকে থাকে।';

  @override
  String get scanAlignHint =>
      'গ্রিডটি দিকটি দিয়ে ভরিয়ে তুলুন, তারপর শাটার চাপুন।';

  @override
  String get scanCapture => 'দিক ক্যাপচার করুন';

  @override
  String get scanTurnLeft => 'পুরো কিউবটি বাঁদিকে ঘোরান';

  @override
  String get scanTurnRight => 'পুরো কিউবটি ডানদিকে ঘোরান';

  @override
  String get scanTipTop => 'উপরের দিকটি নিজের দিকে কাত করুন';

  @override
  String get scanTipBottom => 'নিচের দিকটি নিজের দিকে কাত করুন';

  @override
  String get scanGlareTip =>
      'ঝলক ধরা পড়েছে: কিউবটি একটু কাত করুন, অথবা উপরের আলো আটকাতে ফোনটি তার উপরে ধরুন।';

  @override
  String get scanDimTip =>
      'আলো খুব কম: উজ্জ্বল আলোয় যান বা ফ্ল্যাশলাইট চালু করুন।';

  @override
  String get scanTorch => 'ফ্ল্যাশলাইট';

  @override
  String get scanGuideLabel =>
      'স্ক্যান গাইড: স্ক্যান করা দিকগুলো রঙিন। আবার স্ক্যান করতে কোনো স্ক্যান করা দিকে ট্যাপ করুন।';

  @override
  String get scanTapToRescan =>
      'আবার স্ক্যান করতে কোনো স্ক্যান করা দিকে ট্যাপ করুন।';

  @override
  String get scanCameraMissing => 'এই ডিভাইসে কোনো ক্যামেরা পাওয়া যায়নি।';

  @override
  String get scanCameraDenied =>
      'ক্যামেরার অনুমতি দেওয়া হয়নি। তবু আপনি হাতে রং লিখতে পারেন।';

  @override
  String get scanCameraFailed => 'ক্যামেরা চালু করা যায়নি।';

  @override
  String get scanAllGood => 'সব স্টিকার ঠিক দেখাচ্ছে।';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি স্টিকার ভুল মনে হচ্ছে',
      one: '1টি স্টিকার ভুল মনে হচ্ছে',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'কিছু একটা মিলছে না';

  @override
  String scanIssueColors(int count) {
    return 'প্রতিটি রং ঠিক $count বার থাকতে হবে।';
  }

  @override
  String get scanIssueCenters => 'দুটি কেন্দ্রের রং একই।';

  @override
  String get scanIssuePieces =>
      'এই স্টিকারগুলো এমন টুকরো বানাচ্ছে যা আসল কিউবে নেই।';

  @override
  String get scanIssueTwist => 'একটি কোণ মোচড়ানো। কোণের স্টিকারগুলো দেখুন।';

  @override
  String get scanIssueFlip => 'একটি কিনারা উল্টানো। কিনারার স্টিকারগুলো দেখুন।';

  @override
  String get scanIssueParity => 'দুটি টুকরো অদলবদল হয়ে আছে বলে মনে হচ্ছে।';

  @override
  String get scanIssueUnavailable => 'এই ডিভাইসে রং যাচাই উপলভ্য নয়।';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি স্টিকার পড়তে কষ্ট হয়েছে: একবার দেখে নিন।',
      one: '1টি স্টিকার পড়তে কষ্ট হয়েছে: একবার দেখে নিন।',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'রং বদলাতে স্টিকারে ট্যাপ করুন · প্যালেটের জন্য চেপে ধরে রাখুন';

  @override
  String get scanRescanFace => 'একটি দিক আবার স্ক্যান করুন';

  @override
  String get scanCancelRescan => 'রঙে ফিরে যান';

  @override
  String get scanPaletteTitle => 'একটি রং বাছুন';

  @override
  String get scanOpen3d => '3D-তে খুলুন';

  @override
  String get scanRestart => 'আবার শুরু করুন';

  @override
  String get modeTimer => 'স্পিড টাইমার';

  @override
  String get modeTimerDesc =>
      'স্ক্র্যাম্বল, পর্যবেক্ষণ, গড় আর ব্যক্তিগত সেরা।';

  @override
  String get modeDaily => 'দৈনিক চ্যালেঞ্জ';

  @override
  String get modeDailyDesc =>
      'প্রতিদিন নতুন স্ক্র্যাম্বল। ধারাবাহিকতা বজায় রাখুন।';

  @override
  String get modePatterns => 'প্যাটার্ন লাইব্রেরি';

  @override
  String get modePatternsDesc =>
      'চেকারবোর্ড, সুপারফ্লিপ আর আরও অনেক কিছু, 3D-তে।';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count দিনের ধারা',
      one: '1 দিনের ধারা',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'শেখা চালিয়ে যান';

  @override
  String get startLearning => 'শেখা শুরু করুন';

  @override
  String lessonOf(int index, int total) {
    return 'পাঠ $index / $total';
  }

  @override
  String get academyAllDone => 'সব পাঠ শেষ!';

  @override
  String get academyTitle => 'অ্যাকাডেমি';

  @override
  String academyProgress(int done, int total) {
    return '$totalটির মধ্যে $doneটি পাঠ শেষ';
  }

  @override
  String get lessonAdvanced => 'উন্নত';

  @override
  String lessonPartOf(int index, int total) {
    return 'অংশ $index / $total';
  }

  @override
  String get lessonNext => 'পরবর্তী';

  @override
  String get lessonPrevious => 'পূর্ববর্তী';

  @override
  String get lessonFinish => 'পাঠ শেষ করুন';

  @override
  String get lessonComplete => 'পাঠ শেষ!';

  @override
  String get lessonNextLesson => 'পরের পাঠ';

  @override
  String get lessonBackToAcademy => 'অ্যাকাডেমিতে ফিরে যান';

  @override
  String get lessonTryIt =>
      'আপনার পালা: তীর যে স্তর দেখাচ্ছে সেটি সোয়াইপ করুন, অথবা পরবর্তী চাপুন।';

  @override
  String get lessonLookAround => 'পটভূমি টেনে কিউবটি সব দিক থেকে দেখুন।';

  @override
  String get lessonDemoDone => 'চমৎকার! চালিয়ে যেতে পরবর্তী চাপুন।';

  @override
  String holdPrompt(String top, String front) {
    return 'কিউবটি এমনভাবে ধরুন যাতে $top কেন্দ্র উপরে আর $front কেন্দ্র আপনার দিকে থাকে।';
  }

  @override
  String get trackBeginner => 'শিক্ষানবিশ 3×3: ৩টি মুকুট';

  @override
  String get trackCfop => 'CFOP পরিচিতি';

  @override
  String get trackTwoByTwo => '2×2 শিক্ষানবিশ ও Ortega';

  @override
  String get trackBigCubes => 'বড় কিউব: রিডাকশন ও প্যারিটি';

  @override
  String moveSentence(String layer, String direction) {
    return '$layer $direction ঘোরান';
  }

  @override
  String get moveFaceR => 'ডান দিকটি';

  @override
  String get moveFaceL => 'বাম দিকটি';

  @override
  String get moveFaceU => 'উপরের দিকটি';

  @override
  String get moveFaceD => 'নিচের দিকটি';

  @override
  String get moveFaceF => 'সামনের দিকটি';

  @override
  String get moveFaceB => 'পেছনের দিকটি';

  @override
  String moveLayerInner(int depth, String face) {
    return '$face থেকে $depth নম্বর স্তর';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth স্তর গভীর)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '$face থেকে $near–$far স্তর';
  }

  @override
  String get moveLayerMiddle => 'মাঝের স্তরটি';

  @override
  String get moveDirUp => 'উপরের দিকে';

  @override
  String get moveDirDown => 'নিচের দিকে';

  @override
  String get moveDirLeft => 'বাঁদিকে';

  @override
  String get moveDirRight => 'ডানদিকে';

  @override
  String get moveDirClockwise => 'ঘড়ির কাঁটার দিকে';

  @override
  String get moveDirCounter => 'ঘড়ির কাঁটার উল্টো দিকে';

  @override
  String get moveDirBackClockwise => 'পেছন থেকে দেখলে ঘড়ির কাঁটার দিকে';

  @override
  String get moveDirBackCounter => 'পেছন থেকে দেখলে ঘড়ির কাঁটার উল্টো দিকে';

  @override
  String get moveDirHalf => 'অর্ধেক পাক (দুবার)';

  @override
  String get moveRotateX => 'পুরো কিউবটি কাত করুন: সামনের দিক উপরে যায়';

  @override
  String get moveRotateXPrime => 'পুরো কিউবটি কাত করুন: সামনের দিক নিচে যায়';

  @override
  String get moveRotateX2 => 'পুরো কিউবটি উল্টে দিন: সামনের দিক পেছনে যায়';

  @override
  String get moveRotateY => 'পুরো কিউবটি ঘোরান: সামনের দিক বাঁদিকে যায়';

  @override
  String get moveRotateYPrime => 'পুরো কিউবটি ঘোরান: সামনের দিক ডানদিকে যায়';

  @override
  String get moveRotateY2 =>
      'পুরো কিউবটি অর্ধেক পাক ঘোরান: পেছনের দিক সামনে আসে';

  @override
  String get moveRotateZ =>
      'পুরো কিউবটি ঘড়ির কাঁটার দিকে গড়ান: উপরের দিক ডানে যায়';

  @override
  String get moveRotateZPrime =>
      'পুরো কিউবটি ঘড়ির কাঁটার উল্টো দিকে গড়ান: উপরের দিক বাঁয়ে যায়';

  @override
  String get moveRotateZ2 => 'পুরো কিউবটি উল্টো করে গড়ান: উপরের দিক নিচে যায়';

  @override
  String get phaseReductionCenters => 'কেন্দ্র';

  @override
  String get phaseReductionEdges => 'কিনারা জোড়া লাগান';

  @override
  String get phaseReductionEdgeParity => 'কিনারার প্যারিটি';

  @override
  String get phaseReductionOllParity => 'OLL প্যারিটি';

  @override
  String get phaseReductionPllParity => 'PLL প্যারিটি';

  @override
  String get explainReductionCenterBlock =>
      'স্লাইস টার্ন, যা একসাথে কয়েকটি কেন্দ্রের টুকরো ঘরে ফেরায়।';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'একটি 3-সাইকেল দিয়ে $piece কেন্দ্রের টুকরোটি তার দিকে আনুন, শেষ হওয়া কেন্দ্রগুলো অক্ষত থাকে।';
  }

  @override
  String get explainReductionParityCenters =>
      'প্যারিটির স্লাইস টার্নে সরে যাওয়া কেন্দ্রগুলো আবার গড়ুন।';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'একটি 3-সাইকেল দিয়ে $piece কিনারার টুকরোগুলো জোড়া লাগান; কেন্দ্রগুলো সমাধানই থাকে।';
  }

  @override
  String get explainReductionEdgeParity =>
      'শেষ কিনারাগুলো শুধু 3-সাইকেল দিয়ে জোড়া লাগানো যায় না (কিনারার প্যারিটি)। একটি ভেতরের স্লাইস টার্ন এটা ঠিক করে।';

  @override
  String get explainReductionOllParity =>
      'OLL প্যারিটি: একটি কিনারা উল্টানো, যা 3×3-এ হতে পারে না। এই অ্যালগরিদম সেটিকে আবার সোজা করে।';

  @override
  String get explainReductionPllParity =>
      'PLL প্যারিটি: দুটি কিনারা অদলবদল হয়েছে, যা 3×3-এ অসম্ভব। এই অ্যালগরিদম সেগুলো আবার অদলবদল করে।';

  @override
  String get patternsTitle => 'প্যাটার্ন লাইব্রেরি';

  @override
  String get patternsHint =>
      'দেখতে একটি প্যাটার্নে ট্যাপ করুন, তারপর নিজের কিউবে অনুসরণ করুন।';

  @override
  String get patternCheckerboard => 'চেকারবোর্ড';

  @override
  String get patternCubeInCube => 'কিউবের ভেতর কিউব';

  @override
  String get patternSuperflip => 'সুপারফ্লিপ';

  @override
  String get patternDots => 'বিন্দু';

  @override
  String get patternCross => 'ক্রস';

  @override
  String get patternPython => 'পাইথন';

  @override
  String get phasePattern => 'প্যাটার্নটি বানান';

  @override
  String get explainPatternStep =>
      'নিজের কিউবে প্রতিটি চাল অনুসরণ করুন। স্বাভাবিক অবস্থায় ফেরাতে সমাধান চাপুন।';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'স্পিড টাইমার';

  @override
  String get timerHoldToStart => 'চেপে ধরুন, তারপর ছেড়ে দিয়ে শুরু করুন';

  @override
  String get timerReleaseToStart => 'শুরু করতে ছেড়ে দিন';

  @override
  String get timerTapToStop => 'থামাতে যেকোনো জায়গায় ট্যাপ করুন';

  @override
  String get timerInspectionToggle => '15 সে. পর্যবেক্ষণ';

  @override
  String get timerLoadingScramble => 'স্ক্র্যাম্বল তৈরি হচ্ছে…';

  @override
  String get timerPb => 'সেরা';

  @override
  String get timerSolves => 'সমাধান';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'মুছুন';

  @override
  String get timerHistory => 'ইতিহাস';

  @override
  String get timerNoSolves =>
      'এখনও কোনো সমাধান নেই। কিউব এলোমেলো করে শুরু করুন!';

  @override
  String get timerNewPb => 'নতুন ব্যক্তিগত সেরা!';

  @override
  String get timerClearHistory => 'ইতিহাস মুছুন';

  @override
  String get timerScrambleHint =>
      'সাদা উপরে আর সবুজ সামনে রেখে ধরুন, তারপর এলোমেলো করুন:';

  @override
  String get dailyTitle => 'দৈনিক চ্যালেঞ্জ';

  @override
  String dailyFor(String date) {
    return '$date-এর চ্যালেঞ্জ';
  }

  @override
  String dailyBestStreak(int count) {
    return 'সেরা ধারা: $count';
  }

  @override
  String get dailyDone => 'আজকের মতো শেষ! কাল আবার আসুন।';

  @override
  String get dailyNotDone =>
      'ধারা বজায় রাখতে আজকের স্ক্র্যাম্বলটি সমাধান করুন।';

  @override
  String get dailySolveVirtual => '3D কিউবে সমাধান করুন';

  @override
  String get dailyTimeIt => 'নিজের কিউবে সময় মাপুন';

  @override
  String get dailyHint => 'ইঙ্গিত';

  @override
  String dailyHintText(String moves) {
    return 'সাদা ক্রস দিয়ে শুরু করুন: $moves';
  }

  @override
  String get dailyHintFailed => 'এই মুহূর্তে কোনো ইঙ্গিত নেই।';

  @override
  String get lessonBasics => 'কিউবের সাথে পরিচয়';

  @override
  String get lessonBasicsDesc => 'টুকরো, দিক আর চালের নাম।';

  @override
  String get stepBasicsPieces => 'তিন ধরনের টুকরো';

  @override
  String get stepBasicsPiecesBody =>
      'কেন্দ্রগুলো কখনো নড়ে না, আর প্রতিটি দিককে তার রং দেয়। কিনারায় দুটি রং, কোণে তিনটি। সমাধান মানে প্রতিটি কিনারা আর কোণকে মিলে যাওয়া কেন্দ্রগুলোর পাশে নিয়ে যাওয়া।';

  @override
  String get stepBasicsFaces => 'ছয়টি দিকের অক্ষর';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F আর B হলো ডান, বাম, উপর, নিচ, সামনে আর পেছনের দিক। শুধু অক্ষর মানে ঘড়ির কাঁটার দিকে এক-চতুর্থাংশ পাক, যেন আপনি সোজা সেই দিকটির দিকে তাকিয়ে আছেন।';

  @override
  String get stepBasicsPrime => 'প্রাইম আর ডাবল টার্ন';

  @override
  String get stepBasicsPrimeBody =>
      'অ্যাপস্ট্রফি (R\') উল্টো দিকে, ঘড়ির কাঁটার বিপরীতে ঘোরায়। 2 (U2) মানে অর্ধেক পাক: দুটি এক-চতুর্থাংশ পাক।';

  @override
  String get stepCrossGoal => 'লক্ষ্য';

  @override
  String get stepCrossGoalBody =>
      'হলুদ উপরে রাখুন। চারটি সাদা কিনারা নিচের সাদা কেন্দ্রের চারপাশে বসে, প্রতিটির পাশের রং পাশের কেন্দ্রের সাথে মেলে।';

  @override
  String get stepCrossTop => 'উপরে থাকা কিনারা';

  @override
  String get stepCrossTopBody =>
      'উপরে একটি সাদা কিনারা খুঁজুন। উপরের স্তর ঘোরান যতক্ষণ না তার পাশের রং মিলে যাওয়া কেন্দ্রের উপরে আসে, তারপর সেই দিকটি দুবার ঘুরিয়ে নিচে নামান।';

  @override
  String get stepCrossMiddle => 'মাঝে থাকা কিনারা';

  @override
  String get stepCrossMiddleBody =>
      'মাঝের স্তরে আটকে থাকা কিনারা আগে উপরে যায়: তার পাশটি উপরে ঘোরান, উপরের স্তর সরিয়ে দিন আর পাশটি ফিরিয়ে দিন, যাতে ক্রস অক্ষত থাকে। তারপর উপর থেকে বসান।';

  @override
  String get stepCornersInsert => 'জায়গার ঠিক উপরে';

  @override
  String get stepCornersInsertBody =>
      'উপরের স্তর ঘোরান যতক্ষণ না একটি সাদা কোণ সামনে-ডানে তার রঙের জায়গার উপরে আসে। তারপর R U R\' U\' সেটিকে নামিয়ে দেয়।';

  @override
  String get stepCornersRepeat => 'ট্রিগার বারবার করুন';

  @override
  String get stepCornersRepeatBody =>
      'সাদা ভুল দিকে থাকলে একই জায়গার উপরে R U R\' U\' বারবার করতে থাকুন। সর্বোচ্চ পাঁচবারেই প্রতিটি কোণ সমাধান হয়।';

  @override
  String get stepMiddleRight => 'ডানদিকে কিনারা';

  @override
  String get stepMiddleRightBody =>
      'উপরের একটি কিনারাকে সামনে তার কেন্দ্রের সাথে মেলান। তার উপরের রং ডান কেন্দ্রের সাথে মিললে U R U\' R\' U\' F\' U F দিয়ে বসান।';

  @override
  String get stepMiddleLeft => 'বাঁদিকে কিনারা';

  @override
  String get stepMiddleLeftBody =>
      'উপরের রং বাম কেন্দ্রের সাথে মিললে আয়না-প্রতিবিম্ব ব্যবহার করুন: U\' L\' U L U F U\' F\'।';

  @override
  String get stepYellowCross => 'একটি অ্যালগরিদম';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' হলুদ বিন্দুকে L-এ, L-কে রেখায় আর রেখাকে ক্রসে পরিণত করে। L-টিকে পেছন-বামে আর রেখাটিকে আড়াআড়ি ধরুন।';

  @override
  String get stepYellowEdges => 'কিনারা মেলান';

  @override
  String get stepYellowEdgesBody =>
      'উপরের স্তর ঘোরান যতক্ষণ না দুটি কিনারা তাদের কেন্দ্রের সাথে মেলে। একটি পেছনে আর একটি ডানে রেখে R U R\' U R U2 R\' U বাকি দুটি অদলবদল করে।';

  @override
  String get stepPlaceCorners => 'জায়গায় বসান';

  @override
  String get stepPlaceCornersBody =>
      'যে কোণটি আগেই নিজের জায়গায় আছে সেটি সামনে-ডানে ধরুন। U R U\' L\' U R\' U\' L বাকি তিনটি ঘোরায়; চারটিই ঘরে না ফেরা পর্যন্ত বারবার করুন।';

  @override
  String get stepTwistCorners => 'মোচড় দিন';

  @override
  String get stepTwistCornersBody =>
      'একটি অসমাধিত কোণ সামনে-ডানে রেখে হলুদ উপরে না আসা পর্যন্ত R\' D\' R D বারবার করুন, তারপর পরেরটি আনতে শুধু উপরের স্তর ঘোরান। একদম শেষ পর্যন্ত নিচের অংশ ভাঙা দেখাবে: চালিয়ে যান।';

  @override
  String get lessonCfopIntro => 'CFOP কী?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL।';

  @override
  String get stepCfopOverview => 'চারটি ধাপ';

  @override
  String get stepCfopOverviewBody =>
      'স্পিডকিউবাররা প্রথমে ক্রস বানান, তারপর প্রথম স্তরের প্রতিটি কোণকে তার মাঝের কিনারার সাথে জোড়া লাগান (F2L), শেষ স্তরের দিক ঠিক করেন (OLL) আর অবশেষে জায়গামতো বসান (PLL)।';

  @override
  String get stepCfopCross => 'ক্রসের পরিকল্পনা';

  @override
  String get stepCfopCrossBody =>
      'CFOP-এ ক্রসের পরিকল্পনা পর্যবেক্ষণের সময়েই হয়, আর প্রায় আটটি চালে নিচে বানানো হয়।';

  @override
  String get lessonF2l => 'F2L-এর মূল কথা';

  @override
  String get lessonF2lDesc => 'একটি কোণকে তার কিনারার সাথে জোড়া লাগান।';

  @override
  String get stepF2lRight => 'জোড়া বসান';

  @override
  String get stepF2lRightBody =>
      'যখন একটি কোণ আর তার কিনারা উপরে পাশাপাশি থাকে, তাদের জায়গার উপরে এনে একসাথে বসান।';

  @override
  String get stepF2lLeft => 'বাঁ হাতের জোড়া';

  @override
  String get stepF2lLeftBody =>
      'অন্য পাশের একই অবস্থা হলো আয়না-প্রতিবিম্ব, U\' L\' U L। কিউব ঘুরিয়ে (y) যে হাতে সুবিধা সেটি ব্যবহার করতে পারেন।';

  @override
  String get lessonOll => 'টু-লুক OLL';

  @override
  String get lessonOllDesc => 'উপরের দিক হলুদ করুন।';

  @override
  String get stepOllCross => 'আগে কিনারা';

  @override
  String get stepOllCrossBody =>
      'টু-লুক OLL শুরু হয় আপনার জানা হলুদ ক্রসের অ্যালগরিদম দিয়ে।';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'সামনে-বামে একটি হলুদ কোণ উপরের দিকে থাকলে Sune (R U R\' U R U2 R\') বাকি তিনটির দিক ঠিক করে। অন্য বেশিরভাগ অবস্থায় Sune আর তার আয়না-প্রতিবিম্ব কাজে লাগে।';

  @override
  String get lessonPll => 'টু-লুক PLL';

  @override
  String get lessonPllDesc => 'কিউবটি শেষ করুন।';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm দুটি কোণ আর দুটি কিনারা অদলবদল করে। কোণ বসাতে এটি ব্যবহার করুন: যে দুটি কোণ অদলবদল হবে সেগুলো ডানে ধরুন।';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'কোণ হয়ে গেলে U-perm তিনটি কিনারা ঘোরায়। শেষ হওয়া পাশটি পেছনে রাখুন।';

  @override
  String get lessonTwoFirst => '2×2-এর প্রথম স্তর';

  @override
  String get lessonTwoFirstDesc => 'মিলে যাওয়া কোণ দিয়ে একটি দিক বানান।';

  @override
  String get stepTwoIntro => 'শুধু কোণ';

  @override
  String get stepTwoIntroBody =>
      '2×2 হলো কিনারা আর কেন্দ্র ছাড়া একটি 3×3। একটি রং বেছে নিন, সেই দিকটি নিচে বানান, আর পাশের কোণগুলোর পাশের রং মিলিয়ে দিন।';

  @override
  String get stepTwoCorner => 'কোণ বসান';

  @override
  String get stepTwoCornerBody =>
      'ঠিক 3×3-এর সাদা কোণের মতো: একটি কোণ তার জায়গার উপরে আনুন আর বসে না যাওয়া পর্যন্ত R U R\' U\' করুন।';

  @override
  String get lessonTwoOll => 'উপরের দিক ঠিক করুন';

  @override
  String get lessonTwoOllDesc => 'Sune দিয়ে Ortega OLL।';

  @override
  String get stepTwoSune => 'আবার Sune';

  @override
  String get stepTwoSuneBody =>
      '2×2-তেও Sune উপরের দিক হলুদ করে। Ortega সমাধানকারীরা সাতটি ছোট অবস্থা শেখেন; Sune আর তার আয়না-প্রতিবিম্বেই বেশিরভাগ হয়ে যায়।';

  @override
  String get lessonTwoPbl => 'দুই স্তরই সাজান';

  @override
  String get lessonTwoPblDesc => 'কোণ অদলবদল করে শেষ করুন।';

  @override
  String get stepTwoAdjacent => 'পাশাপাশি অদলবদল';

  @override
  String get stepTwoAdjacentBody =>
      'উপরের দুটি পাশাপাশি কোণ অদলবদল করতে হলে সেগুলো ডানে ধরে T-perm ব্যবহার করুন।';

  @override
  String get stepTwoDiagonal => 'কোণাকুণি অদলবদল';

  @override
  String get stepTwoDiagonalBody =>
      'বিপরীত জায়গার দুটি কোণ Y-perm দিয়ে অদলবদল হয়।';

  @override
  String get lessonBigIntro => 'বড় কিউবের টুকরো';

  @override
  String get lessonBigIntroDesc => 'কেন্দ্র, উইং আর স্লাইস।';

  @override
  String get stepBigPieces => 'স্থির কেন্দ্র নেই';

  @override
  String get stepBigPiecesBody =>
      '4×4-এ প্রতিটি দিকে চারটি কেন্দ্রের টুকরো থাকে যা নড়াচড়া করে, আর প্রতিটি কিনারা দুটি উইং দিয়ে তৈরি। রিডাকশন এগুলোকে জড়ো করে, যাতে কিউবটি 3×3-এর মতো আচরণ করে।';

  @override
  String get stepBigSlices => 'ওয়াইড আর ভেতরের টার্ন';

  @override
  String get stepBigSlicesBody =>
      'Rw ডানের দুটি স্তর একসাথে ঘোরায়। 2R শুধু ডান থেকে দ্বিতীয় স্তরটি ঘোরায়। এই টার্নগুলো কেন্দ্র আর উইং সরায়।';

  @override
  String get lessonBigCenters => 'কেন্দ্র';

  @override
  String get lessonBigCentersDesc => 'কেন্দ্রের টুকরোগুলো জড়ো করুন।';

  @override
  String get stepBigCenterCycle => 'কেন্দ্রের 3-সাইকেল';

  @override
  String get stepBigCenterCycleBody =>
      'এই কমিউটেটর ঠিক তিনটি কেন্দ্রের টুকরো সরায় আর বাকি সব অক্ষত রাখে, তাই শেষ হওয়া কেন্দ্র শেষই থাকে।';

  @override
  String get lessonBigEdges => 'কিনারা জোড়া লাগান';

  @override
  String get lessonBigEdgesDesc => 'উইং জুড়ে পুরো কিনারা বানান।';

  @override
  String get stepBigEdgePair => 'জোড়া লাগান ও ফেরান';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' দুটি মিলে যাওয়া উইং সারিবদ্ধ করে, R U R\' F R\' F\' R একটি জোড়াহীন কিনারা ভেতরে আনে, আর Uw কেন্দ্রগুলো ফিরিয়ে দেয়।';

  @override
  String get lessonBigParity => 'প্যারিটি';

  @override
  String get lessonBigParityDesc => 'জোড় কিউবে OLL আর PLL প্যারিটি।';

  @override
  String get stepBigOllParity => 'OLL প্যারিটি';

  @override
  String get stepBigOllParityBody =>
      'একটিমাত্র উল্টানো কিনারা 3×3-এ হতে পারে না। জোড় কিউবে এই অ্যালগরিদম উপর-সামনের কিনারাটি আবার সোজা করে। এটি উপরের স্তরের বাকিটা এলোমেলো করতে পারে, যা 3×3-এর শেষ ধাপগুলো এমনিতেই ঠিক করে।';

  @override
  String get stepBigPllParity => 'PLL প্যারিটি';

  @override
  String get stepBigPllParityBody =>
      'একদম শেষে দুটি কিনারা অদলবদল? 2R2 U2 2R2 Uw2 2R2 Uw2 সামনে আর পেছনের উপরের কিনারা অদলবদল করে।';

  @override
  String get introGoalHeading => 'লক্ষ্য কী?';

  @override
  String get introHowHeading => 'কীভাবে করব?';

  @override
  String get introStart => 'বুঝেছি, ধাপে ধাপে শুরু করুন';

  @override
  String get introDontShowAgain => 'আর স্বয়ংক্রিয়ভাবে দেখাবেন না';

  @override
  String get introShowGoal => 'লক্ষ্য দেখান';

  @override
  String get introStateStart => 'শুরু';

  @override
  String get introStateGoal => 'লক্ষ্য';

  @override
  String get introPlayMorph => 'শুরু থেকে লক্ষ্য পর্যন্ত চালান';

  @override
  String get introGoalBasics =>
      'কিউব পড়তে শিখুন: এর টুকরো, ছয়টি দিক আর চালের অক্ষরগুলো কীভাবে সেগুলো ঘোরায়।';

  @override
  String get introGoalCross =>
      'এমন একটি সাদা যোগচিহ্ন বানান যেখানে প্রতিটি সাদা কিনারা পাশের কেন্দ্রের রঙের সাথেও মেলে।';

  @override
  String get introGoalCorners =>
      'চারটি সাদা কোণ বসান, যাতে প্রথম মুকুট, পুরো সাদা স্তরটি, সম্পূর্ণ হয়।';

  @override
  String get introGoalMiddle =>
      'মাঝের স্তরের চারটি কিনারা বসান, যাতে প্রথম দুই স্তর সমাধান হয়।';

  @override
  String get introGoalYellowCross =>
      'উপরে একটি হলুদ যোগচিহ্ন বানান; পাশের রং এখনই মেলার দরকার নেই।';

  @override
  String get introGoalYellowEdges =>
      'হলুদ ক্রসের প্রতিটি কিনারা তার পাশের কেন্দ্রের রঙের সাথে মেলান।';

  @override
  String get introGoalYellowCorners =>
      'প্রতিটি হলুদ কোণ নিজের জায়গায় নিন, এখনও মোচড়ানো থাকলেও।';

  @override
  String get introGoalTwistCorners =>
      'হলুদ কোণগুলো সঠিক দিকে মোচড়ান, যাতে পুরো কিউবটি সমাধান হয়।';

  @override
  String get introGoalCfopIntro =>
      'স্পিডকিউবিংয়ের পরিকল্পনা দেখুন: ক্রস, প্রথম দুই স্তর, তারপর দুই ধাপে শেষ স্তর।';

  @override
  String get introGoalF2l =>
      'প্রতিটি সাদা কোণ তার মাঝের কিনারার সাথে একসাথে বসান, এক সাথে দুই স্তর শেষ করে।';

  @override
  String get introGoalOll => 'এক বা দুটি অ্যালগরিদমে পুরো উপরের দিক হলুদ করুন।';

  @override
  String get introGoalPll =>
      'কিউব শেষ করতে শেষ স্তরের টুকরোগুলো তাদের জায়গায় নিন।';

  @override
  String get introGoalTwoFirst => '2×2-এ একটি সম্পূর্ণ সাদা স্তর বানান।';

  @override
  String get introGoalTwoOll => '2×2-এর উপরের দিক পুরো হলুদ করুন।';

  @override
  String get introGoalTwoPbl =>
      '2×2 সমাধান করতে শেষ কোণগুলো অদলবদল করে জায়গায় বসান।';

  @override
  String get introGoalBigIntro =>
      '4×4-এর সাথে পরিচিত হন: কেন্দ্র, কিনারার জোড়া আর কোণ, এবং যে চালগুলো সেগুলো ঘোরায়।';

  @override
  String get introGoalBigCenters =>
      'প্রতিটি দিকের কেন্দ্রের টুকরোগুলো এক রঙের একটি ব্লকে জড়ো করুন।';

  @override
  String get introGoalBigEdges =>
      'মিলে যাওয়া কিনারার টুকরোগুলো জোড়া লাগান, যাতে প্রতিটি কিনারা 3×3-এর একটি কিনারার মতো দেখায়।';

  @override
  String get introGoalBigParity =>
      '4×4-এর যে দুটি অবস্থা 3×3-এ কখনো হয় না সেগুলো ঠিক করুন: একটি উল্টানো কিনারা বা দুটি অদলবদল কিনারা।';

  @override
  String get introHowBasics =>
      'কেন্দ্রগুলো কখনো নড়ে না, তাই সেগুলোই প্রতিটি দিকের রং বলে দেয়।\nপ্রতিটি অক্ষর একটি দিককে ঘড়ির কাঁটার দিকে এক-চতুর্থাংশ পাক ঘোরায়।\nঅ্যাপস্ট্রফি (\') উল্টো দিকে ঘোরায়; 2 মানে দুবার।';

  @override
  String get introHowCross =>
      'হলুদ উপরে রাখুন: সাদা ক্রস নিচে বানানো হয়।\nএকটি সাদা কিনারা খুঁজে তার পাশের রং মিলে যাওয়া কেন্দ্রের সাথে সারিবদ্ধ করুন।\nকিনারাটি জায়গায় নামাতে সেই দিকটি দুবার ঘোরান।';

  @override
  String get introHowCorners =>
      'একটি সাদা কোণ তার খালি জায়গার উপরে আনুন।\nসঠিকভাবে না বসা পর্যন্ত R U R\' U\' বারবার করুন।\nবাকি তিনটি কোণেও একই কাজ করুন।';

  @override
  String get introHowMiddle =>
      'হলুদ ছাড়া উপরের একটি কিনারা খুঁজে তার সামনের রং একটি কেন্দ্রের সাথে মেলান।\nছোট 8-চালের অ্যালগরিদমে সেটিকে ডানে বা বাঁয়ে পাঠান।\nপ্রতিবারই সাদা স্তরটি অক্ষত ফিরে আসে।';

  @override
  String get introHowYellowCross =>
      'উপরে দেখুন: একটি বিন্দু, একটি L বা একটি রেখা।\nদেখানো মতো ধরে F R U R\' U\' F\' করুন।\nহলুদ ক্রস না আসা পর্যন্ত বারবার করুন।';

  @override
  String get introHowYellowEdges =>
      'উপরের স্তর ঘোরান যতক্ষণ না দুটি কিনারা তাদের কেন্দ্রের সাথে মেলে।\nসেগুলো পেছনে আর ডানে ধরে R U R\' U R U2 R\' U করুন।\nচারটি কিনারাই না মেলা পর্যন্ত বারবার করুন।';

  @override
  String get introHowYellowCorners =>
      'কোণ নিজের জায়গায় আছে যখন তার রংগুলো চারপাশের তিনটি দিকের সাথে মেলে।\nজায়গায় থাকা একটি কোণ সামনে-ডানে রাখুন।\nU R U\' L\' U R\' U\' L বাকি তিনটি ঘোরায়, যতক্ষণ না সব ঠিক বসে।';

  @override
  String get introHowTwistCorners =>
      'একটি অসমাধিত কোণ সামনে-ডানে ধরুন।\nতার হলুদ উপরে না আসা পর্যন্ত R\' D\' R D বারবার করুন।\nপরেরটির জন্য শুধু উপরের স্তর ঘোরান; শেষে নিচের অংশ নিজেই ঠিক হয়।';

  @override
  String get introHowCfopIntro =>
      'ক্রস: চারটি কিনারা, পর্যবেক্ষণের সময় পরিকল্পিত।\nF2L: প্রতিটি কোণ তার কিনারার সাথে একসাথে বসে।\nOLL উপরের দিক হলুদ করে, তারপর PLL টুকরোগুলো ঘরে ফেরায়।';

  @override
  String get introHowF2l =>
      'উপরের স্তরে একটি কোণ আর তার মিলে যাওয়া কিনারা খুঁজুন।\nতাদের জায়গার উপরে সেগুলো জোড়া লাগান।\nতিন-চারটি চালে জোড়াটি নামিয়ে দিন।';

  @override
  String get introHowOll =>
      'প্রথমে F R U R\' U\' F\' দিয়ে হলুদ ক্রস।\nতারপর কোণগুলোর দিক ঠিক করুন, যেমন Sune দিয়ে।\nযে হলুদ দেখছেন তা দিয়ে অবস্থাটি চিনুন।';

  @override
  String get introHowPll =>
      'উপরের দিক আগেই পুরো হলুদ।\nT-perm কোণ অদলবদল করে; U-perm তিনটি কিনারা ঘোরায়।\nঅ্যালগরিদম বাছতে পাশের রংগুলো পড়ুন।';

  @override
  String get introHowTwoFirst =>
      '2×2-এ শুধু কোণ থাকে, কিনারা ছাড়া 3×3-এর মতো।\nপ্রতিটি সাদা কোণ তার জায়গার উপরে আনুন।\nবসে না যাওয়া পর্যন্ত R U R\' U\' বারবার করুন।';

  @override
  String get introHowTwoOll =>
      'সাদা স্তরটি নিচে রাখুন।\nSune (R U R\' U R U2 R\') উপরের কোণগুলো মোচড়ায়।\nউপরের দিক পুরো হলুদ না হওয়া পর্যন্ত সঠিক কোণ থেকে বারবার করুন।';

  @override
  String get introHowTwoPbl =>
      'এমন একটি পাশ খুঁজুন যেখানে দুটি কোণ আগেই মেলে।\nপাশাপাশি অদলবদল: T-perm ধরনের একটি অ্যালগরিদম।\nকোণাকুণি অদলবদল: একটি লম্বা অ্যালগরিদম।';

  @override
  String get introHowBigIntro =>
      'কোনো কেন্দ্র স্থির নয়: চারটি কেন্দ্রের টুকরো মিলে প্রতিটি দিকের রং।\nRw-এর মতো ওয়াইড চাল একসাথে দুটি স্তর ঘোরায়।\n2R-এর মতো ভেতরের চাল শুধু একটি ভেতরের স্লাইস ঘোরায়।';

  @override
  String get introHowBigCenters =>
      'প্রথমে দুটি বিপরীত কেন্দ্র বানান।\nভেতরের স্লাইস শেষ হওয়া কেন্দ্র না ভেঙে কেন্দ্রের টুকরো অদলবদল করে।\nবাকি চারটি কেন্দ্রও একইভাবে শেষ করুন।';

  @override
  String get introHowBigEdges =>
      'একই রঙের দুটি কিনারার টুকরো খুঁজুন।\nএকটি ভেতরের স্লাইস দিয়ে সেগুলো পাশাপাশি সারিবদ্ধ করুন।\nজোড়াটি সরিয়ে রেখে কেন্দ্রগুলো ফিরিয়ে আনুন।';

  @override
  String get introHowBigParity =>
      'আটকে না যাওয়া পর্যন্ত 4×4-কে 3×3-এর মতো সমাধান করুন।\nএকটি উল্টানো কিনারা: লম্বা OLL প্যারিটি অ্যালগরিদম।\nদুটি অদলবদল কিনারা: 2R2 U2 2R2 Uw2 2R2 Uw2।';

  @override
  String get dirFaceR => 'ডান পাশ';

  @override
  String get dirFaceL => 'বাম পাশ';

  @override
  String get dirFaceU => 'উপরের সারি';

  @override
  String get dirFaceD => 'নিচের সারি';

  @override
  String get dirFaceF => 'সামনের দিক';

  @override
  String get dirFaceB => 'পেছনের দিক';

  @override
  String get dirMiddle => 'মাঝের স্লাইস';

  @override
  String get dirWholeCube => 'পুরো কিউব';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, স্তর $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth স্তর গভীর';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, স্তর $near–$far';
  }

  @override
  String get dirUp => 'উপরে';

  @override
  String get dirDown => 'নিচে';

  @override
  String get dirLeft => 'বাঁয়ে';

  @override
  String get dirRight => 'ডানে';

  @override
  String get dirClockwise => 'ঘড়ির কাঁটার দিকে';

  @override
  String get dirCounter => 'ঘড়ির কাঁটার উল্টো দিকে';

  @override
  String get dirBackClockwise => 'পেছন থেকে দেখলে ঘড়ির কাঁটার দিকে';

  @override
  String get dirBackCounter => 'পেছন থেকে দেখলে ঘড়ির কাঁটার উল্টো দিকে';

  @override
  String get dirHalf => 'ডাবল টার্ন (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'বিস্তারিত লুকান';

  @override
  String get solveExpand => 'বিস্তারিত দেখান';

  @override
  String get dailyScrambleSteps => 'ধাপে ধাপে এলোমেলো করুন';

  @override
  String get dailyScrambleGuide => '3D স্ক্র্যাম্বল গাইড';

  @override
  String get dailyShowMoves => 'লেখা চাল দেখান';

  @override
  String get dailyHideMoves => 'লেখা চাল লুকান';

  @override
  String get dailyScrambleGuideTitle => 'স্ক্র্যাম্বল গাইড';

  @override
  String get phaseDailyScramble => 'আজকের কিউব এলোমেলো করুন';

  @override
  String get explainDailyScramble =>
      'একটি সমাধান করা কিউব থেকে শুরু করুন, সাদা উপরে আর সবুজ সামনে, আর প্রতিটি চাল নিজের আসল কিউবে নকল করুন।';

  @override
  String get stageCenters => 'কেন্দ্রের ব্লক বানান';

  @override
  String get stageEdges => 'বাইরের ও ভেতরের কিনারা জোড়া লাগান';

  @override
  String get stageParity => 'প্যারিটি সমাধান';

  @override
  String get stageCrown1 => 'প্রথম মুকুট (সাদা)';

  @override
  String get stageCrown2 => 'দ্বিতীয় মুকুট';

  @override
  String get stageCrown3 => 'তৃতীয় মুকুট (হলুদ)';

  @override
  String get stageOrient => 'টুকরোগুলোর দিক ঠিক করুন';

  @override
  String get stageFinish => 'কিউবটি শেষ করুন';

  @override
  String get stageAsThree => '3×3-এর মতো সমাধান করুন';

  @override
  String get stageTwoByTwo => '2×2 সমাধান করুন';

  @override
  String stageHeader(int number, int total, String title) {
    return 'ধাপ $number/$total: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'মুকুট $crown • ধাপ $number/$total: $title';
  }

  @override
  String get solveAllStagesDone => 'সব ধাপ শেষ। খুব ভালো!';

  @override
  String get trackFiveByFive => '5×5 Professor\'s Cube';

  @override
  String get trackSixBySix => '6×6 কিউব';

  @override
  String get lessonFiveIntro => '5×5-এর সাথে পরিচয়';

  @override
  String get lessonFiveIntroDesc =>
      'স্থির মাঝখান, কেন্দ্রের বার, মাঝের কিনারা আর উইং।';

  @override
  String get introGoalFiveIntro =>
      '5×5-কে চিনুন: স্থির মাঝখান, কেন্দ্রের বার, মাঝের কিনারা আর উইং।';

  @override
  String get introHowFiveIntro =>
      'প্রতিটি দিকের একদম মাঝখানটি কখনো নড়ে না।\nপ্রতিটি কিনারা একটি মাঝের টুকরো আর দুটি উইং।\nভেতরের স্লাইস বাইরের অংশ না ছুঁয়ে টুকরো সরায়।';

  @override
  String get lessonFiveCenters => '5×5-এর কেন্দ্র';

  @override
  String get lessonFiveCentersDesc => 'তিনটির বার দিয়ে প্রতিটি কেন্দ্র বানান।';

  @override
  String get introGoalFiveCenters =>
      'প্রতিটি দিকের কেন্দ্রের টুকরোর 3×3 ব্লক এক রঙে বানান।';

  @override
  String get introHowFiveCenters =>
      'মাঝের টুকরো থেকে শুরু করুন: সেটিই রং বলে দেয়।\nতিনটির বার বানিয়ে একটি ভেতরের স্লাইসে সেগুলো ঢুকিয়ে দিন।\nশেষ দুটি কেন্দ্র একসাথে শেষ করুন।';

  @override
  String get lessonFiveEdges => '5×5-এর কিনারা';

  @override
  String get lessonFiveEdgesDesc =>
      'দুটি উইংকে তাদের মাঝের কিনারার সাথে জুড়ুন।';

  @override
  String get introGoalFiveEdges =>
      'প্রতিটি মাঝের কিনারাকে তার দুটি উইংয়ের সাথে জুড়ুন, যাতে 12টি কিনারাই একক টুকরোর মতো দেখায়।';

  @override
  String get introHowFiveEdges =>
      'সামনে দুটি উইংকে তাদের মাঝের কিনারার সাথে মেলান।\nভেতরের স্তর ঘুরিয়ে একটি অসমাধিত কিনারা ঢুকিয়ে আবার ফিরিয়ে দিন।\nশেষ হওয়া কিনারা না ভেঙে শেষ কিনারাগুলো জোড়া লাগান।';

  @override
  String get lessonFiveSolve => '5×5-কে 3×3-এর মতো সমাধান করুন';

  @override
  String get lessonFiveSolveDesc => 'তিনটি মুকুট দিয়ে শেষ করুন।';

  @override
  String get introGoalFiveSolve =>
      'রিডিউস করা 5×5-কে 3×3-এর মতো, মুকুট ধরে ধরে সমাধান করুন।';

  @override
  String get introHowFiveSolve =>
      'এখন থেকে শুধু বাইরের টার্ন।\nপ্রথম মুকুট, দ্বিতীয় মুকুট, তারপর হলুদ মুকুট।\nস্থির মাঝখানগুলো প্রতিটি দিকের রং দেখায়।';

  @override
  String get lessonFiveParity => '5×5-এর কিনারার প্যারিটি';

  @override
  String get lessonFiveParityDesc =>
      'যে কিনারার উইং অদলবদল হয়েছে সেটি ঠিক করুন।';

  @override
  String get introGoalFiveParity =>
      'যে কিনারার দুটি উইং অদলবদল হয়েছে সেটি ঠিক করুন, তারপর শেষ করুন।';

  @override
  String get introHowFiveParity =>
      'এটি এমন একটি কিনারা হিসেবে দেখা দেয় যা জোড়া লাগে না।\nলম্বা ভেতরের-স্লাইসের সমাধানটি একবার চালান।\nবাকি সব নিজের জায়গায় ফিরে আসে।';

  @override
  String get lessonSixIntro => '6×6-এর সাথে পরিচয়';

  @override
  String get lessonSixIntroDesc =>
      'স্থির কেন্দ্র নেই আর প্রতিটি কিনারায় চারটি টুকরো।';

  @override
  String get introGoalSixIntro =>
      '6×6-কে চিনুন: প্রতিটি দিকে ষোলোটি কেন্দ্রের টুকরো আর প্রতিটি কিনারায় চারটি টুকরো।';

  @override
  String get introHowSixIntro =>
      'কোনো কেন্দ্র স্থির নয়: বানানোর সময় আপনিই রং বাছেন।\nপ্রতিটি কিনারায় বাইরের আর ভেতরের উইং আছে।\nওয়াইড টার্ন তিনটি পর্যন্ত স্তর সরাতে পারে।';

  @override
  String get lessonSixCenters => '6×6-এর কেন্দ্র';

  @override
  String get lessonSixCentersDesc => 'চারটির বার দিয়ে 4×4 কেন্দ্র বানান।';

  @override
  String get introGoalSixCenters =>
      'প্রতিটি দিকের 4×4 কেন্দ্রের ব্লক এক রঙে বানান।';

  @override
  String get introHowSixCenters =>
      'প্রথমে দুটি বিপরীত কেন্দ্র বানান।\nচারটির বার বানিয়ে সেগুলো পাশাপাশি জুড়ে দিন।\nস্লাইস, উপর, ফেরানোর কৌশলে একটি করে টুকরো সরান।';

  @override
  String get lessonSixEdges => '6×6-এর কিনারা';

  @override
  String get lessonSixEdgesDesc => 'প্রতিটি কিনারার চারটি টুকরো জড়ো করুন।';

  @override
  String get introGoalSixEdges =>
      'প্রতিটি কিনারার চারটি টুকরো জড়ো করুন, যাতে 6×6-এ 12টি পরিষ্কার কিনারা থাকে।';

  @override
  String get introHowSixEdges =>
      'সামনে বাইরের আর ভেতরের উইং সারিবদ্ধ করুন।\nগভীর ওয়াইড স্তর একটি কিনারা ভেতরে আনে ও বের করে।\nশেষ হওয়া কিনারা কখনো ভাঙে না।';

  @override
  String get lessonSixSolve => '6×6-কে 3×3-এর মতো সমাধান করুন';

  @override
  String get lessonSixSolveDesc => 'তিনটি মুকুট দিয়ে শেষ করুন।';

  @override
  String get introGoalSixSolve =>
      'রিডিউস করা 6×6-কে 3×3-এর মতো, মুকুট ধরে ধরে সমাধান করুন।';

  @override
  String get introHowSixSolve =>
      'এখন থেকে শুধু বাইরের টার্ন।\nআপনার বানানো কেন্দ্রগুলো প্রতিটি দিকের রং দেখায়।\nপ্রথম মুকুট, দ্বিতীয় মুকুট, তারপর হলুদ মুকুট।';

  @override
  String get lessonSixParity => '6×6-এর প্যারিটি';

  @override
  String get lessonSixParityDesc =>
      'একটি উল্টানো কিনারা বা দুটি অদলবদল কিনারা।';

  @override
  String get introGoalSixParity =>
      '6×6-এর যে দুটি অবস্থা 3×3-এ কখনো হয় না সেগুলো ঠিক করুন: একটি উল্টানো কিনারা বা দুটি অদলবদল কিনারা।';

  @override
  String get introHowSixParity =>
      'আটকে না যাওয়া পর্যন্ত 3×3-এর মতো সমাধান করুন।\nএকটি উল্টানো কিনারা: লম্বা প্যারিটি সমাধান।\nদুটি অদলবদল কিনারা: ছোট ডাবল-টার্ন সমাধান।';

  @override
  String get stepFivePieces => '5×5-এর টুকরো';

  @override
  String get stepFivePiecesBody =>
      'প্রতিটি দিকের একদম মাঝের টুকরোটি কখনো নড়ে না, তাই 3×3-এর মতোই সেটি দিকের রং বলে দেয়। তার চারপাশে আরও আটটি কেন্দ্রের টুকরো; প্রতিটি কিনারায় একটি মাঝের টুকরো আর দুটি উইং, আর কোণগুলো 3×3-এর মতোই কাজ করে।';

  @override
  String get stepFiveSlices => 'তিন ধরনের টার্ন';

  @override
  String get stepFiveSlicesBody =>
      'বাইরের টার্ন একটি দিক সরায়। ওয়াইড টার্ন একটি দিককে তার পেছনের স্তরসহ সরায়। ভেতরের স্লাইস টার্ন শুধু ভেতরের একটি স্তর সরায়: এভাবেই বাইরের অংশ না ছুঁয়ে টুকরো জায়গা বদলায়।';

  @override
  String get stepFiveCenterBar => 'কেন্দ্রের বার';

  @override
  String get stepFiveCenterBarBody =>
      'মিলে যাওয়া তিনটি কেন্দ্রের টুকরোর একটি সারি বানান, তারপর ভেতরের স্লাইস টার্নে সেটিকে মিলে যাওয়া মাঝখানের পাশে ঢুকিয়ে দিন। তিনটি বারে একটি কেন্দ্র শেষ হয়।';

  @override
  String get stepFiveCenterSwap => 'না ভেঙে অদলবদল';

  @override
  String get stepFiveCenterSwapBody =>
      'একটি কেন্দ্রের টুকরো সরাতে: একটি ভেতরের স্লাইস ঘোরান, উপরের স্তর ঘোরান, স্লাইস ফিরিয়ে দিন, উপরের স্তর ফিরিয়ে দিন। প্রতিবারই শেষ হওয়া কেন্দ্রগুলো আগের অবস্থায় ফেরে।';

  @override
  String get stepFiveEdgePair => 'উইংকে মাঝের কিনারার সাথে জুড়ুন';

  @override
  String get stepFiveEdgePairBody =>
      'সামনে দুটি উইংকে তাদের মিলে যাওয়া মাঝের কিনারার পাশে সারিবদ্ধ করুন, ভেতরের স্তর নিচে ঘোরান, উপর থেকে একটি অসমাধিত কিনারা আনুন, তারপর ভেতরের স্তর ফিরিয়ে দিন।';

  @override
  String get stepFiveEdgeLast => 'শেষ কিনারাগুলো';

  @override
  String get stepFiveEdgeLastBody =>
      'অল্প কয়েকটি কিনারা বাকি থাকলে একটি ওয়াইড টার্ন, একটি ছোট ট্রিগার আর ওয়াইড টার্ন ফেরানো দিয়ে শেষ হওয়া কিনারা না ভেঙে সেগুলো জোড়া লাগে।';

  @override
  String get stepFiveAsThree => 'এখন এটি একটি 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'কেন্দ্র আর কিনারা হয়ে গেলে 5×5 একটি বড় 3×3-এর মতো আচরণ করে। শুধু বাইরের টার্ন ব্যবহার করে তিনটি মুকুট অনুসরণ করুন: সাদা ক্রস আর কোণ, মাঝের স্তর, তারপর হলুদ স্তর।';

  @override
  String get stepFiveEdgeParity => 'শেষ কিনারার উইং অদলবদল করুন';

  @override
  String get stepFiveEdgeParityBody =>
      'কখনো কখনো শেষ কিনারার দুটি উইং অদলবদল হয়ে থাকে। একটি লম্বা ভেতরের-স্লাইস অ্যালগরিদম সেগুলো আবার অদলবদল করে, আর বাকি সব নিজের জায়গায় ফেরে। তারপর 3×3-এর মতো শেষ করুন।';

  @override
  String get stepSixPieces => '6×6-এর টুকরো';

  @override
  String get stepSixPiecesBody =>
      '4×4-এর মতো 6×6-এরও কোনো স্থির কেন্দ্র নেই: ষোলোটি কেন্দ্রের টুকরো মিলে প্রতিটি দিকের রং। প্রতিটি কিনারায় চারটি টুকরো: দুটি বাইরের উইং আর দুটি ভেতরের উইং।';

  @override
  String get stepSixSlices => 'গভীর স্তর ঘোরানো';

  @override
  String get stepSixSlicesBody =>
      'ওয়াইড টার্ন একটি দিক থেকে দুই বা তিনটি স্তর সরাতে পারে। দ্বিতীয় বা তৃতীয় স্তরের ভেতরের স্লাইসই কেন্দ্র আর কিনারার হাতিয়ার।';

  @override
  String get stepSixCenterBar => 'চারটির বার';

  @override
  String get stepSixCenterBarBody =>
      'মিলে যাওয়া চারটি কেন্দ্রের টুকরোর সারি বানান আর ভেতরের স্লাইস টার্নে সেগুলো পাশাপাশি ঢুকিয়ে দিন, যতক্ষণ না দিকটি পুরো এক রঙের হয়।';

  @override
  String get stepSixCenterSwap => 'একবারে একটি টুকরো';

  @override
  String get stepSixCenterSwapBody =>
      'তৃতীয় স্তর ঘোরান, উপরের স্তর ঘোরান, ফিরিয়ে দিন, আবার ফিরিয়ে দিন: একটি কেন্দ্রের টুকরো সরে আর শেষ হওয়া কেন্দ্রগুলো ফিরে আসে।';

  @override
  String get stepSixEdgePair => 'চারটি টুকরো, একটি কিনারা';

  @override
  String get stepSixEdgePairBody =>
      'গভীর ওয়াইড স্তর দিয়ে একটি কিনারার চারটি টুকরো সামনে জড়ো করুন, তারপর একটি অসমাধিত কিনারা এনে ওয়াইড স্তর ফিরিয়ে দিন।';

  @override
  String get stepSixEdgeLast => 'শেষ কিনারাগুলো';

  @override
  String get stepSixEdgeLastBody =>
      'একটি গভীর ওয়াইড টার্ন আর তার ফেরানোর মাঝে একটি ছোট ট্রিগার দিয়ে শেষ কিনারাগুলো জোড়া লাগান, যাতে শেষ হওয়া কিনারা জোড়াই থাকে।';

  @override
  String get stepSixAsThree => 'এখন এটি একটি 3×3';

  @override
  String get stepSixAsThreeBody =>
      '4×4 কেন্দ্র আর জোড়া লাগানো কিনারা হয়ে গেলে 6×6-কে বাইরের টার্ন আর তিনটি মুকুট দিয়ে 3×3-এর মতো সমাধান করুন।';

  @override
  String get stepSixOllParity => 'একটি উল্টানো কিনারা';

  @override
  String get stepSixOllParityBody =>
      'শেষ স্তর সমাধানের সময় একটিমাত্র কিনারা উল্টানো মনে হলে সেটি প্যারিটি। সেটিকে উপরের স্তরের সামনে ধরে লম্বা সমাধানটি চালান: প্রথম দুটি মুকুট অক্ষত ফিরে আসে।';

  @override
  String get stepSixPllParity => 'দুটি অদলবদল কিনারা';

  @override
  String get stepSixPllParityBody =>
      'একদম শেষে দুটি কিনারা অদলবদল মনে হলে সেগুলো উপরের স্তরের সামনে আর পেছনে ধরে ভেতরের ডাবল টার্নের ছোট সমাধানটি চালান।';

  @override
  String get stageTwoFirstLayer => 'নিচের স্তর বানান';

  @override
  String get stageTwoTopColor => 'উপরের দিক এক রঙের করুন';

  @override
  String get stageTwoFinish => 'কোণগুলো শেষ করুন';

  @override
  String get explainTwoFirstLayer =>
      'নিচের স্তর সম্পূর্ণ করুন: এর চারটি কোণ পরস্পরের সাথে আর পাশের রঙের সাথে মেলে।';

  @override
  String get explainTwoTopColor =>
      'নিচের স্তর অক্ষত রেখে উপরের স্তর ঘোরান, যতক্ষণ না উপরের চারটি স্টিকার একই রং দেখায়।';

  @override
  String get explainTwoFinish => 'কিউব শেষ করতে শেষ কোণগুলো জায়গায় নিন।';

  @override
  String get tabSolve => 'সমাধান';

  @override
  String get tabScan => 'স্ক্যান';

  @override
  String get tabAcademy => 'অ্যাকাডেমি';

  @override
  String get tabTrain => 'অনুশীলন';

  @override
  String get openCubeSolver => '3D কিউব ও সমাধানকারী খুলুন';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'অনুশীলন';

  @override
  String get trainSubtitle => 'প্রতিদিন আপনার দক্ষতা শাণিত করুন।';

  @override
  String get settings => 'সেটিংস';

  @override
  String get settingsSoundHaptics => 'শব্দ ও কম্পন';

  @override
  String get settingsSoundHapticsDesc => 'কিউব ঘোরানোর সময় ক্লিক আর কম্পন।';

  @override
  String get settingsAnimationSpeed => 'ডিফল্ট অ্যানিমেশন গতি';

  @override
  String get settingsAnimationSpeedDesc => 'চাল চলার সময় কিউব কত দ্রুত ঘোরে।';

  @override
  String get settingsResetProgress => 'অগ্রগতি রিসেট করুন';

  @override
  String get settingsResetProgressDesc =>
      'শেষ করা অ্যাকাডেমি পাঠ আর দৈনিক ধারা মুছে ফেলুন।';

  @override
  String get resetProgressTitle => 'সব অগ্রগতি রিসেট করবেন?';

  @override
  String get resetProgressBody =>
      'আপনার শেষ করা পাঠ আর দৈনিক ধারা মুছে যাবে। এটি আর ফেরানো যাবে না।';

  @override
  String get resetProgressDone => 'অগ্রগতি রিসেট হয়েছে।';

  @override
  String get cancel => 'বাতিল';

  @override
  String get settingsPrivacyAds => 'গোপনীয়তা ও বিজ্ঞাপন';

  @override
  String get settingsPrivacyAdsDesc =>
      'বিজ্ঞাপনের সম্মতির পছন্দগুলো দেখুন বা বদলান।';

  @override
  String get playbackPrevious => 'পূর্ববর্তী';

  @override
  String get playbackNext => 'পরবর্তী';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি চালে সমাধান!',
      one: '1টি চালে সমাধান!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'পরের সংস্করণ গড়ে তুলুন';

  @override
  String get feedbackBody =>
      'কোনো ফিচারের পরামর্শ দিতে চান বা CubeMentor-এর পরের সংস্করণে প্রভাব রাখতে চান? আমাদের লিখুন:';

  @override
  String get feedbackEmailCopied =>
      'কোনো ইমেইল অ্যাপ পাওয়া যায়নি, তাই ঠিকানাটি ক্লিপবোর্ডে কপি করা হয়েছে।';

  @override
  String get adWatchToUnlock => 'বিজ্ঞাপন দেখুন';

  @override
  String get adLoading => 'একটি ছোট ভিডিও লোড হচ্ছে…';

  @override
  String get adRewardNotEarned => 'আনলক করতে পুরো ভিডিওটি দেখুন।';

  @override
  String get adUnavailableFreePass =>
      'এখন কোনো ভিডিও নেই — এবার বিনামূল্যে আনলক হলো।';

  @override
  String get settingsPrivacyAdsError =>
      'গোপনীয়তার বিকল্পগুলো খোলা যায়নি। পরে আবার চেষ্টা করুন।';

  @override
  String get nicknamePromptTitle => 'আপনাকে কী নামে ডাকব?';

  @override
  String get nicknamePromptBody =>
      'প্রতিবার সমাধান করলে আমরা আপনার নাম ধরে উৎসাহ দেব।';

  @override
  String get nicknameHint => 'আপনার নাম বা ডাকনাম';

  @override
  String get nicknameSave => 'সংরক্ষণ করুন';

  @override
  String get settingsNickname => 'আপনার নাম';

  @override
  String get settingsNicknameNotSet => 'সেট করা নেই — যোগ করতে ট্যাপ করুন';

  @override
  String celebrateNamed(String name) {
    return 'দারুণ, $name!';
  }

  @override
  String get celebrateAnon => 'দারুণ!';

  @override
  String get celebrateCubeSolved => 'কিউব সমাধান হয়েছে!';

  @override
  String get celebrateDailyDone => 'আজকের চ্যালেঞ্জ সম্পূর্ণ!';

  @override
  String fastSolveRatio(int count, int limit) {
    return '$count / $limitটি চাল';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    return 'যেকোনো স্ক্র্যাম্বল $limitটি বা তার কম চালে সমাধান করা যায়';
  }

  @override
  String get patternsWatchVideo => 'ভিডিও দেখুন';

  @override
  String get patternsNotNow => 'এখন নয়';

  @override
  String get settingsColorScheme => 'কিউবের রঙের বিন্যাস';

  @override
  String get colorSchemeWestern => 'পশ্চিমা';

  @override
  String get colorSchemeJapanese => 'জাপানি';

  @override
  String get colorSchemeWesternDesc => 'সাদার বিপরীতে হলুদ, নীলের বিপরীতে সবুজ';

  @override
  String get colorSchemeJapaneseDesc =>
      'সাদার বিপরীতে নীল, হলুদের বিপরীতে সবুজ';

  @override
  String dailyYourTime(String time) {
    return 'আপনার সময়: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'কিউবটি দেখার জন্য আপনার হাতে $seconds সেকেন্ড আছে। কাউন্টডাউন শুরু করতে ট্যাপ করুন।';
  }

  @override
  String get timerInspectTapReady => 'সমাধান শুরু করতে প্রস্তুত হলে ট্যাপ করুন';

  @override
  String timerInspectPlus2(int seconds) {
    return 'পর্যবেক্ষণ $seconds সেকেন্ড পেরিয়ে যাওয়ায় ঘড়ি নিজেই চালু হয়েছে: +2 সেকেন্ড জরিমানা';
  }

  @override
  String timerAvgOf(int count) {
    return '$countটির গড়';
  }

  @override
  String get timerAvgNote => 'গড়ে সেরা ও সবচেয়ে খারাপ সময় বাদ দেওয়া হয়';

  @override
  String get timerPbSub => 'সেরা একক সময়';

  @override
  String get timerPlus2Caption => '+2 সেকেন্ড জরিমানা';

  @override
  String get timerDnfCaption => 'শেষ হয়নি (DNF)';

  @override
  String get timerDeleteCaption => 'এই সমাধানটি মুছুন';

  @override
  String get patternBullsEye => 'বুলস-আই';

  @override
  String get patternFramedCenter => 'ফ্রেম করা কেন্দ্র';

  @override
  String get patternBlockCheckerboard => 'ব্লক চেকারবোর্ড';

  @override
  String get patternCubeInCubeInCube => 'কিউবের ভেতর কিউবের ভেতর কিউব';

  @override
  String get patternUnionJack => 'ইউনিয়ন জ্যাক';

  @override
  String get patternKilt => 'কিল্ট';

  @override
  String get patternSixTs => 'ছয়টি T';

  @override
  String get patternTwinPeaks => 'যমজ চূড়া';

  @override
  String get patternSpiral => 'সর্পিল';

  @override
  String get patternTetris => 'টেট্রিস';

  @override
  String get patternSpots => 'কেন্দ্রের বিন্দু';

  @override
  String get patternStripes => 'ডোরা';

  @override
  String get patternAnaconda => 'অ্যানাকোন্ডা';

  @override
  String get patternZigzag => 'আঁকাবাঁকা';

  @override
  String get patternFourSpots => 'চারটি বিন্দু';

  @override
  String get patternGreenMamba => 'সবুজ মাম্বা';

  @override
  String get patternPlusMinus => 'প্লাস মাইনাস';

  @override
  String guideStepCounter(int current, int total) {
    return 'ধাপ $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'চাল $current / $total';
  }

  @override
  String get dailyStep1Title => 'ধাপ 1: আপনার কিউব এলোমেলো করুন';

  @override
  String get dailyStep2Title => 'ধাপ 2: কিউবটি সমাধান করুন';

  @override
  String dailyPersonalBest(String time) {
    return 'ব্যক্তিগত সেরা: $time';
  }

  @override
  String get dailyRecentDays => 'সাম্প্রতিক দিনগুলো';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count দিনের ধারা! দারুণ চলছে!',
      one: '1 দিনের ধারা! দারুণ চলছে!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'কিউব এলোমেলো হয়েছে! এবার সমাধান করুন';

  @override
  String get dailyCongratsTitle => 'অভিনন্দন!';

  @override
  String dailyCongratsBody(String time) {
    return 'আপনি আজকের চ্যালেঞ্জ $time-এ সমাধান করেছেন।';
  }

  @override
  String get dailyCongratsDone => 'চ্যালেঞ্জে ফিরে যান';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $countটি প্যাটার্ন';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '$hours ঘণ্টা বাকি';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '$minutes মিনিট বাকি';
  }

  @override
  String get lockedLabel => 'লক করা';

  @override
  String get unlockedLabel => 'আনলক করা';

  @override
  String patternUnlockBody(int hours) {
    return 'এই প্যাটার্ন ও এর ধাপে ধাপে গাইড $hours ঘণ্টার জন্য আনলক করতে 1টি ছোট ভিডিও দেখুন।';
  }

  @override
  String lessonUnlockBody(int hours) {
    return 'পরের $hours ঘণ্টা এই পাঠ যতবার খুশি খুলতে 1টি ছোট ভিডিও দেখুন।';
  }

  @override
  String get bigCubeUnlockTitle => 'বড় কিউব সমাধান করুন';

  @override
  String bigCubeUnlockBody(int hours) {
    return '4×4–6×6-এর বিনামূল্যের সমাধানটি ব্যবহার হয়ে গেছে। পরের $hours ঘণ্টা বড় কিউব সমাধান করতে 1টি ছোট ভিডিও দেখুন।';
  }

  @override
  String get doubleTurnBadge => 'ডাবল টার্ন · 180°';
}
