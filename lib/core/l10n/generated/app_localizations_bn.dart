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
  String get solveModeGuided => 'গাইডেড (৩টি স্তর)';

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
  String get phaseLblCorners => 'প্রথম স্তরের কোণ';

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
  String get crownFirst => 'প্রথম স্তর';

  @override
  String get crownSecond => 'দ্বিতীয় স্তর';

  @override
  String get crownThird => 'তৃতীয় স্তর';

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
      '৪টি সাদা কোণ তাদের মিলে যাওয়া জায়গায় বসিয়ে সাদা দিক আর পুরো প্রথম স্তর শেষ করুন।';

  @override
  String get subStepGoal21 =>
      'প্রথম স্তর না ভেঙে মাঝের স্তরের ৪টি কিনারা বসান।';

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
  String get trackBeginner => 'শুরুর 3×3: স্তর ধরে ধরে';

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
      'হলুদ উপরে আর সবুজ নিজের দিকে রাখুন। আগে চারটি সাদা কিনারা হলুদ কেন্দ্রের চারপাশে, সাদা উপরে, পাপড়ির মতো জড়ো করুন: এটাই ডেইজি। তারপর প্রতিটি পাপড়ি সাদা কেন্দ্রে নামে, তার পাশের রং পাশের কেন্দ্রের সঙ্গে মিলিয়ে।';

  @override
  String get stepCrossTop => 'উপরে থাকা কিনারা';

  @override
  String get stepCrossTopBody =>
      'উপরে সাদা-উপরে থাকা সাদা কিনারা ডেইজির একটি পাপড়ি। উপরের স্তর ঘোরান যতক্ষণ না তার পাশের রং একই রঙের কেন্দ্রের ঠিক উপরে আসে, তারপর সেই দিক দুবার (180°) ঘুরিয়ে সেটি সাদা কেন্দ্রে নামান।';

  @override
  String get stepCrossMiddle => 'মাঝে থাকা কিনারা';

  @override
  String get stepCrossMiddleBody =>
      'মাঝের স্তরে আটকে থাকা কিনারা আগে উপরে যায়: তার পাশ উপরে, উপরের স্তর সরান, পাশ ফেরত, যাতে বসানো টুকরো না নড়ে। এখন সেটি উপরে একটি পাপড়ি: মিলিয়ে দিকটি দুবার ঘোরান।';

  @override
  String get stepCornersInsert => 'জায়গার ঠিক উপরে';

  @override
  String get stepCornersInsertBody =>
      'উপরের স্তর ঘোরান যতক্ষণ না সাদা কোণ তার পাশের রঙের দুই কেন্দ্রের মাঝে নিজের জায়গার ঠিক উপরে আসে। এখানে একটি উপরের মুভ আর R U\' R\' যথেষ্ট: U কোণটি জায়গার উপরে আনে, R U\' R\' সাদা নিচে রেখে বসায়।';

  @override
  String get stepCornersRepeat => 'ট্রিগার বারবার করুন';

  @override
  String get stepCornersRepeatBody =>
      'জায়গাটি সামনে-ডানে রেখে সাদা নিচে না আসা পর্যন্ত R U R\' U\' করুন: সাদা ডানে থাকলে ১ বার, উপরে থাকলে ৩ বার, আপনার দিকে থাকলে ৫ বার। এর মাঝে উপরটা এলোমেলো দেখায়; নিজে থেকেই ঠিক হয়।';

  @override
  String get stepMiddleRight => 'ডানদিকে কিনারা';

  @override
  String get stepMiddleRightBody =>
      'উপরে হলুদ ছাড়া একটি কিনারা খুঁজুন। উপরের স্তর ঘোরান যতক্ষণ না তার সামনের রং আপনার সামনের কেন্দ্রের সঙ্গে মেলে। উপরের রং ডান কেন্দ্রের সঙ্গে মিললে ডানে পাঠান: U R U\' R\' U\' F\' U F।';

  @override
  String get stepMiddleLeft => 'বাঁদিকে কিনারা';

  @override
  String get stepMiddleLeftBody =>
      'উপরের রং বাঁ কেন্দ্রের সঙ্গে মিললে মিরর ব্যবহার করুন: U\' L\' U L U F U\' F\'। সাদা স্তর প্রতিবার পুরো ফিরে আসে।';

  @override
  String get stepYellowCross => 'একটি অ্যালগরিদম';

  @override
  String get stepYellowCrossBody =>
      'উপরে শুধু হলুদ কিনারা দেখুন। L পেছনে-বাঁয়ে আর রেখা বাঁ থেকে ডানে রেখে F R U R\' U\' F\' করুন। রেখায় ১ বার, L-এ ২ বার, বিন্দুতে ৩ বার পর্যন্ত লাগে।';

  @override
  String get stepYellowEdges => 'কিনারা মেলান';

  @override
  String get stepYellowEdgesBody =>
      'উপরের স্তর ঘোরান যতক্ষণ না দুটি কিনারা নিজেদের কেন্দ্রের সঙ্গে মেলে। একটি পেছনে আর একটি ডানে থাকলে R U R\' U R U2 R\' U সামনের আর বাঁয়ের কিনারা বদলে দেয়।';

  @override
  String get stepPlaceCorners => 'জায়গায় বসান';

  @override
  String get stepPlaceCornersBody =>
      'কোণের রং চারপাশের তিন কেন্দ্রের সঙ্গে মিললে সেটি জায়গায় আছে, মোচড়ানো হলেও। এমন কোণ সামনে-ডানে রাখুন: U R U\' L\' U R\' U\' L বাকি তিনটি ঘোরায়। চারটিই না বসা পর্যন্ত করুন।';

  @override
  String get stepTwistCorners => 'মোচড় দিন';

  @override
  String get stepTwistCornersBody =>
      'সামনে-ডানে অসমাধান কোণ রেখে হলুদ উপরে না আসা পর্যন্ত R\' D\' R D জোড়ায় জোড়ায় করুন, তারপর পরেরটি আনতে শুধু উপরের স্তর ঘোরান। শেষ কোণ পর্যন্ত নিচটা ভাঙা দেখায়: চালিয়ে যান।';

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
      '2×2 শুধু আটটি কোণ: কোনো কিনারা বা কেন্দ্র নেই। নিচে সাদা স্তর এমনভাবে বানান যাতে পাশাপাশি রং মেলে, তারপর একটিই পথে শেষ করুন: হলুদ উপরের জন্য Sune, তারপর T-perm বা Y-perm।';

  @override
  String get stepTwoCorner => 'কোণ বসান';

  @override
  String get stepTwoCornerBody =>
      '3×3-এর সাদা কোণের মতো: একটি কোণ সামনে-ডানে খালি জায়গার উপরে এনে বসান, এখানে U R U\' R\' দিয়ে বা সাদা নিচে না আসা পর্যন্ত R U R\' U\' করে। পাশের রং প্রতিবেশীর সঙ্গে মিলিয়ে নিন।';

  @override
  String get lessonTwoOll => 'উপরের দিক ঠিক করুন';

  @override
  String get lessonTwoOllDesc => 'Sune দিয়ে Ortega OLL।';

  @override
  String get stepTwoSune => 'আবার Sune';

  @override
  String get stepTwoSuneBody =>
      'উপরের দিকে থাকা হলুদ স্টিকার গুনুন। হলুদ-উপরে থাকা একমাত্র কোণটি সামনে-বাঁয়ে রেখে Sune করুন (R U R\' U R U2 R\')। আবার গুনুন আর ধরুন; বড়জোর তিনবার Sune। মাঝে শুধু উপরের স্তর ঘোরান।';

  @override
  String get lessonTwoPbl => 'দুই স্তরই সাজান';

  @override
  String get lessonTwoPblDesc => 'কোণ অদলবদল করে শেষ করুন।';

  @override
  String get stepTwoAdjacent => 'পাশাপাশি অদলবদল';

  @override
  String get stepTwoAdjacentBody =>
      'হেডলাইট মানে একপাশে উপরের দুটি একই রঙের স্টিকার। উপরের স্তর ঘোরান যতক্ষণ না হেডলাইট বাঁয়ে আসে, তাহলে বদলানোর দুটি কোণ ডানে থাকবে, তারপর T-perm করুন।';

  @override
  String get stepTwoDiagonal => 'কোণাকুণি অদলবদল';

  @override
  String get stepTwoDiagonalBody =>
      'কোনো দিকেই হেডলাইট না থাকলে দুটি কোনাকুনি কোণ বদলাতে হবে: যেকোনো দিক থেকে Y-perm করুন, তারপর সব মেলাতে উপরের স্তর ঘোরান।';

  @override
  String get lessonBigIntro => 'বড় কিউবের টুকরো';

  @override
  String get lessonBigIntroDesc => 'কেন্দ্র, উইং আর স্লাইস।';

  @override
  String get stepBigPieces => 'স্থির কেন্দ্র নেই';

  @override
  String get stepBigPiecesBody =>
      '4×4-এ প্রতিটি দিকে চারটি নড়াচড়া করা কেন্দ্রের টুকরো আছে, আর প্রতিটি কিনারা দুটি উইং। কোনো কেন্দ্র স্থির নয়, তাই একটি কোণে রঙের ক্রম দেখুন: সাদার বিপরীতে হলুদ, নীলের বিপরীতে সবুজ, লালের বিপরীতে কমলা।';

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
      'এই কমিউটেটর ঠিক তিনটি কেন্দ্রের টুকরো সরায় আর বাকি সব রেখে দেয়, তাই তৈরি কেন্দ্র তৈরিই থাকে। কোনো বিচ্ছিন্ন টুকরো বারে না জুড়লে এটি ব্যবহার করুন।';

  @override
  String get lessonBigEdges => 'কিনারা জোড়া লাগান';

  @override
  String get lessonBigEdgesDesc => 'উইং জুড়ে পুরো কিনারা বানান।';

  @override
  String get stepBigEdgePair => 'জোড়া লাগান ও ফেরান';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' দুটি মেলা উইং সারিবদ্ধ করে, R U R\' F R\' F\' R একটি জোড়াহীন কিনারা আনে, আর Uw কেন্দ্র ফিরিয়ে দেয়। খোলা স্লাইস সবসময় বন্ধ করুন।';

  @override
  String get lessonBigParity => 'প্যারিটি';

  @override
  String get lessonBigParityDesc => 'জোড় কিউবে OLL আর PLL প্যারিটি।';

  @override
  String get stepBigOllParity => 'OLL প্যারিটি';

  @override
  String get stepBigOllParityBody =>
      'একা একটি উল্টানো কিনারা 3×3-এ হতে পারে না: এটি OLL প্যারিটি, ভুল নয়। এটিকে উপরের স্তরে সামনে রেখে লম্বা অ্যালগরিদম করুন। এটি উপরের বাঁ-ডান কিনারা আর দুটি কোণও বদলায়; 3×3-এর শেষ ধাপগুলো এগুলো ঠিক করে।';

  @override
  String get stepBigPllParity => 'PLL প্যারিটি';

  @override
  String get stepBigPllParityBody =>
      'একদম শেষে দুটি কিনারা বদলানো আর কোনো 3×3 অ্যালগরিদম খাটে না? এটি PLL প্যারিটি। সেগুলো উপরের স্তরে সামনে আর পেছনে রাখুন: 2R2 U2 2R2 Uw2 2R2 2U2 সেগুলো বদলে দেয়।';

  @override
  String get introGoalHeading => 'লক্ষ্য কী?';

  @override
  String get introHowHeading => 'কীভাবে করব?';

  @override
  String get introHoldHeading => 'কীভাবে ধরবেন';

  @override
  String get introWhyHeading => 'কেন এটা কাজ করে';

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
      'নিচে এমন সাদা ক্রস বানান, যেখানে প্রতিটি সাদা কিনারা পাশের কেন্দ্রের রঙের সঙ্গেও মেলে।';

  @override
  String get introGoalCorners =>
      'চারটি সাদা কোণ বসিয়ে পুরো প্রথম স্তর শেষ করুন: সাদা দিক আর মিলে যাওয়া পাশের রং।';

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
      'একটি T-perm বা Y-perm দিয়ে শেষ কোণগুলো জায়গায় আনুন, তারপর উপরের স্তর মিলিয়ে 2×2 সমাধান করুন।';

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
      '4×4-এর যে দুটি কেস 3×3-এ কখনো হয় না সেগুলো ঠিক করুন: একটি উল্টানো কিনারা (OLL প্যারিটি) বা জায়গা বদলানো দুটি কিনারা (PLL প্যারিটি)।';

  @override
  String get introHowBasics =>
      'কেন্দ্রগুলো কখনো নড়ে না, তাই সেগুলোই প্রতিটি দিকের রং বলে দেয়।\nপ্রতিটি অক্ষর একটি দিককে ঘড়ির কাঁটার দিকে এক-চতুর্থাংশ পাক ঘোরায়।\nঅ্যাপস্ট্রফি (\') উল্টো দিকে ঘোরায়; 2 মানে দুবার।';

  @override
  String get introHoldBasics =>
      'যেভাবে খুশি: কেন্দ্র নড়ে না, তাই রংই সবসময় বলে দেয় কোন দিক কোনটি।';

  @override
  String get introWhyBasics =>
      'প্রতিটি অ্যালগরিদম এই অক্ষরগুলোর একটি সারি মাত্র, তাই এগুলো পড়তে পারা প্রথম দক্ষতা।';

  @override
  String get introHowCross =>
      'প্রতিটি সাদা কিনারা উপরে আনুন, সাদা উপরের দিকে, হলুদ কেন্দ্রের চারপাশে: এটাই ডেইজি।\nউপরের স্তর ঘোরান যতক্ষণ না কোনো পাপড়ির পাশের রং নিজের কেন্দ্রের উপরে আসে।\nসেই দিক দুবার ঘুরিয়ে সেটি নামান; চারটির জন্যই করুন।';

  @override
  String get introHoldCross =>
      'পুরো ধাপে হলুদ কেন্দ্র উপরে, সাদা কেন্দ্র নিচে। পাপড়ি মেলাতে কিউব নয়, উপরের স্তর ঘোরান।';

  @override
  String get introWhyCross =>
      'সাদা উপরে থাকলে সামনের দিক দুবার ঘোরালে কিনারা সাদা কেন্দ্রের উপর বসে, সাদা নিচে আর পাশের রং আগেই মেলানো।';

  @override
  String get introHowCorners =>
      'উপরের স্তর ঘোরান যতক্ষণ না একটি সাদা কোণ সামনে-ডানে তার খালি জায়গার উপরে আসে।\nR U R\' U\' করতে থাকুন: সাদা ডানে থাকলে ১ বার, উপরে থাকলে ৩ বার, আপনার দিকে থাকলে ৫ বার।\nবাকি তিনটি কোণেও একই কাজ করুন।';

  @override
  String get introHoldCorners =>
      'সাদা নিচে, হলুদ উপরে। কোণটি সামনে-ডানে, ঠিক তার জায়গার উপরে।';

  @override
  String get introWhyCorners =>
      'R U R\' U\' স্লট তুলে আবার বসায়: প্রতিটি রাউন্ড কোণটি একটু ঘোরায় যতক্ষণ না সাদা নিচে আসে, আর ক্রস কখনো ভাঙে না।';

  @override
  String get introHowMiddle =>
      'উপরে হলুদ ছাড়া একটি কিনারা খুঁজুন আর তার সামনের রং নিচের কেন্দ্রের সঙ্গে মেলান।\nতার উপরের রং বলে দেয় সেটি কোথায় যাবে: ডানে না বাঁয়ে।\n৮ মুভের অ্যালগরিদমে বসান; সাদা স্তর প্রতিবার ফিরে আসে।';

  @override
  String get introHoldMiddle =>
      'সাদা নিচে, হলুদ উপরে। কিনারা সামনে, তার সামনের রং নিচের কেন্দ্রের সঙ্গে মেলে।';

  @override
  String get introWhyMiddle =>
      'অ্যালগরিদম স্লট সরিয়ে কিনারা ঢুকিয়ে সাদা স্তর ফেরায়। হলুদ থাকা কিনারা উপরের, কখনো মাঝের নয়।';

  @override
  String get introHowYellowCross =>
      'উপরে শুধু হলুদ কিনারাগুলো দেখুন: বিন্দু, L বা রেখা।\nL পেছনে-বাঁয়ে আর রেখা বাঁ থেকে ডানে রেখে F R U R\' U\' F\' করুন।\nরেখায় ১ বার, L-এ ২ বার, বিন্দুতে ৩ বার পর্যন্ত লাগে।';

  @override
  String get introHoldYellowCross =>
      'সাদা নিচে, হলুদ উপরে। L পেছনে-বাঁয়ে, রেখা বাঁ থেকে ডানে; বিন্দু যেকোনোভাবে।';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' প্রথম দুই স্তর না ছুঁয়ে প্রতিবার উপরের দুটি কিনারা উল্টায়।';

  @override
  String get introHowYellowEdges =>
      'উপরের স্তর ঘোরান যতক্ষণ না দুটি কিনারা নিজেদের কেন্দ্রের সঙ্গে মেলে।\nসেগুলো পেছনে আর ডানে রেখে R U R\' U R U2 R\' U করুন।\nমেলা কিনারা দুটি মুখোমুখি থাকলে আগে যেকোনো দিক থেকে একবার করুন।';

  @override
  String get introHoldYellowEdges =>
      'হলুদ উপরে। একটি মেলা কিনারা পেছনে, অন্যটি ডানে।';

  @override
  String get introWhyYellowEdges =>
      'এই অ্যালগরিদম শুধু উপরের টুকরো সরায়, তাই প্রথম দুই স্তর সবসময় ফিরে আসে।';

  @override
  String get introHowYellowCorners =>
      'কোণের রং চারপাশের তিন কেন্দ্রের সঙ্গে মিললে সেটি জায়গায় আছে, মোচড়ানো হলেও।\nএমন একটি কোণ সামনে-ডানে রাখুন।\nU R U\' L\' U R\' U\' L বাকি তিনটি ঘুরিয়ে দেয়; সব না বসা পর্যন্ত করুন।';

  @override
  String get introHoldYellowCorners =>
      'হলুদ উপরে। জায়গায় থাকা একটি কোণ সামনে-ডানে; না থাকলে যেকোনো কোণ।';

  @override
  String get introWhyYellowCorners =>
      'এটি তিনটি কোণ বৃত্তাকারে ঘোরায় আর সামনে-ডানেরটি রেখে দেয়, তাই প্রতিবার আরও কোণ জায়গায় আসে।';

  @override
  String get introHowTwistCorners =>
      'একটি অসমাধান কোণ সামনে-ডানে ধরুন।\nতার হলুদ উপরে না আসা পর্যন্ত R\' D\' R D জোড়ায় জোড়ায় করুন।\nপরেরটির জন্য শুধু উপরের স্তর ঘোরান; নিচের অংশ শেষ কোণের সঙ্গে ফিরে আসে।';

  @override
  String get introHoldTwistCorners =>
      'হলুদ উপরে, ঘোরানোর কোণ সামনে-ডানে। কোণগুলোর মাঝে শুধু উপরের স্তর ঘোরান, পুরো কিউব কখনো নয়।';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D কোণ ঘোরায় আর নিচটা এলোমেলো করে, কিন্তু সব কোণ ঘোরানো হলে নিচ ফিরে আসে। মাঝপথে থামলে সেটি ভাঙা থাকে।';

  @override
  String get introHowCfopIntro =>
      'ক্রস: চারটি কিনারা, পর্যবেক্ষণের সময় পরিকল্পিত।\nF2L: প্রতিটি কোণ তার কিনারার সাথে একসাথে বসে।\nOLL উপরের দিক হলুদ করে, তারপর PLL টুকরোগুলো ঘরে ফেরায়।';

  @override
  String get introHoldCfopIntro =>
      'স্পিডকিউবাররা ক্রস নিচে বানান, যাতে ঘোরানোর সময়ই পরের টুকরোগুলো দেখে নিতে পারেন।';

  @override
  String get introWhyCfopIntro =>
      'কোণ আর তার কিনারা একসঙ্গে সমাধান করলে অনেক মুভ বাঁচে, আর কেস চেনা আন্দাজের জায়গা নেয়।';

  @override
  String get introHowF2l =>
      'উপরের স্তরে একটি কোণ আর তার মিলে যাওয়া কিনারা খুঁজুন।\nতাদের জায়গার উপরে সেগুলো জোড়া লাগান।\nতিন-চারটি চালে জোড়াটি নামিয়ে দিন।';

  @override
  String get introHoldF2l =>
      'ক্রস নিচে। জোড়ার স্লট সামনে-ডানে, মিরর কেসে সামনে-বাঁয়ে।';

  @override
  String get introWhyF2l =>
      'জোড়া কোণ আর কিনারা একসঙ্গে ঢোকে, তাই টুকরো টুকরো নয়, দুই স্তর একসঙ্গে বাড়ে।';

  @override
  String get introHowOll =>
      'প্রথমে F R U R\' U\' F\' দিয়ে হলুদ ক্রস।\nতারপর কোণগুলোর দিক ঠিক করুন, যেমন Sune দিয়ে।\nযে হলুদ দেখছেন তা দিয়ে অবস্থাটি চিনুন।';

  @override
  String get introHoldOll =>
      'হলুদ উপরে। Sune-এর জন্য হলুদ-উপরে থাকা একমাত্র কোণটি সামনে-বাঁয়ে থাকে।';

  @override
  String get introWhyOll =>
      'শেষ স্তরকে আগে অরিয়েন্টেশন, পরে পারমুটেশনে ভাগ করলে অ্যালগরিদম কম থাকে।';

  @override
  String get introHowPll =>
      'উপরের দিক আগেই পুরো হলুদ।\nT-perm কোণ অদলবদল করে; U-perm তিনটি কিনারা ঘোরায়।\nঅ্যালগরিদম বাছতে পাশের রংগুলো পড়ুন।';

  @override
  String get introHoldPll =>
      'হলুদ উপরে। T-perm: হেডলাইট বাঁয়ে। U-perm: সম্পূর্ণ দিক পেছনে।';

  @override
  String get introWhyPll =>
      'উপর পুরো হলুদ হলে শুধু টুকরোর জায়গা ভুল থাকে, আর কয়েকটি বদলেই কিউব শেষ।';

  @override
  String get introHowTwoFirst =>
      'একটি সাদা কোণকে নোঙর বানান, সাদা নিচের দিকে।\nপরের প্রতিটি কোণ সামনে-ডানে তার জায়গার উপরে আনুন।\nপাশের রং মিলে না বসা পর্যন্ত R U R\' U\' করুন।';

  @override
  String get introHoldTwoFirst =>
      'সাদা নিচে। খালি জায়গা সামনে-ডানে, তার কোণ ঠিক উপরে উপরের স্তরে।';

  @override
  String get introWhyTwoFirst =>
      '2×2-এ কেন্দ্র নেই: প্রথম বসানো কোণ তার প্রতিবেশীদের রং ঠিক করে, তাই শুধু সাদা নয়, পাশের রংও জরুরি।';

  @override
  String get introHowTwoOll =>
      'কতগুলো কোণের হলুদ উপরে আছে গুনুন।\nএকটি হলে সেটি সামনে-বাঁয়ে রেখে Sune করুন: R U R\' U R U2 R\'।\nআবার গুনুন আর করুন; বড়জোর তিনবার Sune।';

  @override
  String get introHoldTwoOll =>
      'সাদা নিচে, হলুদ উপরে। প্রতিটি Sune-এর আগে হলুদ-উপরে কোণটি সামনে-বাঁয়ে।';

  @override
  String get introWhyTwoOll =>
      'Sune সাদা স্তর না ভেঙে উপরের কোণ ঘোরায়; আবার গোনা বলে দেয় পরেরবার কীভাবে ধরবেন।';

  @override
  String get introHowTwoPbl =>
      'হেডলাইট খুঁজুন: একপাশে উপরের দুটি একই রঙের স্টিকার।\nএকপাশে হেডলাইট: বাঁয়ে রেখে T-perm করুন।\nহেডলাইট নেই: যেকোনো দিক থেকে Y-perm করুন, তারপর উপরটা মেলান।';

  @override
  String get introHoldTwoPbl =>
      'সাদা নিচে, হলুদ উপরে। T-perm: হেডলাইট বাঁয়ে। Y-perm: যেকোনো দিক আপনার দিকে।';

  @override
  String get introWhyTwoPbl =>
      'উপর হলুদ হলে শুধু কোণের জায়গা ভুল: T-perm দুটি পাশাপাশি, Y-perm দুটি কোনাকুনি কোণ বদলায়।';

  @override
  String get introHowBigIntro =>
      'কোনো কেন্দ্র স্থির নয়: চারটি কেন্দ্রের টুকরো মিলে প্রতিটি দিকের রং।\nRw-এর মতো ওয়াইড চাল একসাথে দুটি স্তর ঘোরায়।\n2R-এর মতো ভেতরের চাল শুধু একটি ভেতরের স্লাইস ঘোরায়।';

  @override
  String get introHoldBigIntro =>
      'শুরুতে যেভাবে খুশি: 4×4-এ কোনো কেন্দ্র স্থির নয়, তাই কোন রং কোথায় যাবে আপনি ঠিক করেন।';

  @override
  String get introWhyBigIntro =>
      'রিডাকশন কেন্দ্র আর কিনারার টুকরো একত্র করে, যাতে বড় কিউব 3×3-এর মতো সমাধান হয়।';

  @override
  String get introHowBigCenters =>
      'আগে একটি কোণে রঙের ক্রম মিলিয়ে নিন।\nদুটি বিপরীত কেন্দ্র বানান, তারপর বাকি চারটি।\nভেতরের স্লাইস কেন্দ্রের টুকরো সরায়; খোলা স্লাইস সবসময় ফিরিয়ে দিন।';

  @override
  String get introHoldBigCenters =>
      'যে দিক বানাচ্ছেন সেটি সামনে; তৈরি কেন্দ্র বাঁয়ে আর ডানে, পথ থেকে সরিয়ে।';

  @override
  String get introWhyBigCenters =>
      'স্লাইস কেন্দ্র সরায় আর ফেরালে তৈরিগুলো ফিরে আসে, তাই শুধু কাঙ্ক্ষিত টুকরোটি বদলায়।';

  @override
  String get introHowBigEdges =>
      'একই দুই রঙের দুটি উইং খুঁজুন।\nসামনে সারিবদ্ধ করে Uw\' দিয়ে জুড়ুন।\nজোড়াহীন কিনারা ভেতরে আনুন, তারপর Uw কেন্দ্রগুলো ফেরায়।';

  @override
  String get introHoldBigEdges =>
      'যে কিনারা জুড়ছেন সেটি সামনের স্তরে; তৈরি কিনারা উপরে আর নিচে রাখা।';

  @override
  String get introWhyBigEdges =>
      'Uw\' কেন্দ্র সরিয়ে দেয় যাতে দুটি উইং মেলে; Uw সেগুলো ফেরায়, আপনার কাজ অটুট থাকে।';

  @override
  String get introHowBigParity =>
      'আটকে না যাওয়া পর্যন্ত 4×4 কে 3×3-এর মতো সমাধান করুন।\nএকটি উল্টানো কিনারা: লম্বা OLL প্যারিটি অ্যালগরিদম।\nজায়গা বদলানো দুটি কিনারা: 2R2 U2 2R2 Uw2 2R2 2U2।';

  @override
  String get introHoldBigParity =>
      'শেষ স্তর উপরে। OLL প্যারিটি: উল্টানো কিনারা সামনে। PLL প্যারিটি: জায়গা বদলানো কিনারা সামনে আর পেছনে।';

  @override
  String get introWhyBigParity =>
      'উইং এমন অবস্থায় যেতে পারে যা 3×3-এ হয় না; এই অ্যালগরিদমগুলো ভেতরের স্তর ঘুরিয়ে ঠিক সেটিই উল্টে দেয়।';

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
  String get stageCrown1 => 'প্রথম স্তর (সাদা)';

  @override
  String get stageCrown2 => 'দ্বিতীয় স্তর';

  @override
  String get stageCrown3 => 'তৃতীয় স্তর (হলুদ)';

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
  String get introHoldFiveIntro =>
      'যেভাবে খুশি: 5×5-এ প্রতিটি দিকের মাঝখান কখনো নড়ে না, তাই সেটিই রং দেখায়।';

  @override
  String get introWhyFiveIntro =>
      'স্থির কেন্দ্র রঙের নকশা ঠিক করে, তাই কেন্দ্র ভুল ক্রমে বানানো যায় না।';

  @override
  String get lessonFiveCenters => '5×5-এর কেন্দ্র';

  @override
  String get lessonFiveCentersDesc => 'তিনটির বার দিয়ে প্রতিটি কেন্দ্র বানান।';

  @override
  String get introGoalFiveCenters =>
      'প্রতিটি দিকের কেন্দ্রের টুকরোর 3×3 ব্লক এক রঙে বানান।';

  @override
  String get introHowFiveCenters =>
      'স্থির মাঝের টুকরো থেকে শুরু করুন: সেটিই রং ঠিক করে।\nতিনের বার বানিয়ে ভেতরের স্লাইস দিয়ে ঢোকান।\nযে মুভ বার আনে, সেটিই তৈরি কেন্দ্র ফিরিয়ে দেয়।';

  @override
  String get introHoldFiveCenters =>
      'যে কেন্দ্র বানাচ্ছেন সেটি সামনে বা উপরে; তৈরি কেন্দ্র নিচে, বাঁয়ে বা ডানে।';

  @override
  String get introWhyFiveCenters =>
      'স্লাইস ভেতরে, উপর ঘোরান, স্লাইস ফেরত: বার আনা স্লাইস তৈরি কেন্দ্রও ফেরায়।';

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
      'সামনে প্রতিটি উইংকে তার মাঝের কিনারার সঙ্গে মেলান।\nভেতরের স্তর ঘোরান, অসমাধান কিনারা আনুন, ফিরিয়ে ঘোরান।\nশেষ কিনারাগুলোর জন্য: স্লাইস, উল্টানো, স্লাইস।';

  @override
  String get introHoldFiveEdges =>
      'যে কিনারা বানাচ্ছেন সেটি সামনে; তৈরি কিনারা উপরের আর নিচের স্তরে রাখা।';

  @override
  String get introWhyFiveEdges =>
      'ভেতরের স্তর খোলা আর বন্ধ করা উইং জোড়ে, আর কেন্দ্র ও রাখা কিনারা ফিরে আসে।';

  @override
  String get lessonFiveSolve => '5×5-কে 3×3-এর মতো সমাধান করুন';

  @override
  String get lessonFiveSolveDesc => '3×3-এর মতো স্তর ধরে ধরে শেষ করুন।';

  @override
  String get introGoalFiveSolve =>
      'রিডিউস করা 5×5 কে 3×3-এর মতো, স্তর ধরে ধরে, শুধু বাইরের মুভে সমাধান করুন।';

  @override
  String get introHowFiveSolve =>
      'এখন থেকে শুধু বাইরের মুভ, নইলে জোড়া কিনারা আলাদা হয়ে যাবে।\nসাদা ক্রস আর কোণ, মাঝের স্তর, তারপর হলুদ স্তর।\nস্থির মাঝের টুকরো প্রতিটি দিকের রং দেখায়।';

  @override
  String get introHoldFiveSolve =>
      'প্রথম স্তরের রং নিচে, ঠিক 3×3-এর মতো; বসানোর কোণ সামনে-ডানে।';

  @override
  String get introWhyFiveSolve =>
      'ভেতরের মুভ আবার কেন্দ্র আর কিনারা আলাদা করবে; বাইরের মুভ প্রতিটি ব্লককে 3×3-এর এক টুকরো হিসেবে নড়ায়।';

  @override
  String get lessonFiveParity => '5×5-এর কিনারার প্যারিটি';

  @override
  String get lessonFiveParityDesc =>
      'যে কিনারার উইং অদলবদল হয়েছে সেটি ঠিক করুন।';

  @override
  String get introGoalFiveParity =>
      'যে একটি কিনারার দুটি বাইরের উইং জায়গা বদলেছে সেটি ঠিক করুন: 5×5-এর একমাত্র প্যারিটি।';

  @override
  String get introHowFiveParity =>
      'এটি দেখা দেয় শেষ একটি কিনারা হিসেবে, যেটি উল্টানো মনে হয়।\nভেতরের স্লাইসের লম্বা সমাধান একবার করুন।\n5×5-এ কোনো PLL প্যারিটি নেই।';

  @override
  String get introHoldFiveParity =>
      'শেষ স্তর উপরে, উইং বদলানো কিনারা উপরের স্তরে সামনে।';

  @override
  String get introWhyFiveParity =>
      '5×5-এ শুধু একটি কিনারার দুটি বাইরের উইং জায়গা বদলাতে পারে, তাই একটি অ্যালগরিদমই যথেষ্ট।';

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
  String get introHoldSixIntro =>
      'শুরুতে যেভাবে খুশি: 4×4-এর মতো 6×6-এও কোনো স্থির কেন্দ্র নেই।';

  @override
  String get introWhySixIntro =>
      'আপনি 4×4 আর 5×5 সমাধান করতে পারলে 6×6 একই রিডাকশন, শুধু বড় ব্লকে।';

  @override
  String get lessonSixCenters => '6×6-এর কেন্দ্র';

  @override
  String get lessonSixCentersDesc => 'চারটির বার দিয়ে 4×4 কেন্দ্র বানান।';

  @override
  String get introGoalSixCenters =>
      'প্রতিটি দিকের 4×4 কেন্দ্রের ব্লক এক রঙে বানান।';

  @override
  String get introHowSixCenters =>
      'আগে একটি কোণে রঙের ক্রম মিলিয়ে নিন: কোনো কেন্দ্র স্থির নয়।\nচারের বার বানিয়ে একসঙ্গে জুড়ুন।\nশেষ দুই কেন্দ্রে একটি একটি টুকরো সরান: স্লাইস, উপর, ফেরত।';

  @override
  String get introHoldSixCenters =>
      'যে দিক বানাচ্ছেন সেটি সামনে; তৈরি কেন্দ্র বাঁয়ে, ডানে বা নিচে।';

  @override
  String get introWhySixCenters =>
      'বার ভেতরের স্লাইসে জোড়ে আর প্রতিটি স্লাইস ফেরানো হয়, তাই তৈরি কেন্দ্র অটুট থাকে।';

  @override
  String get lessonSixEdges => '6×6-এর কিনারা';

  @override
  String get lessonSixEdgesDesc => 'প্রতিটি কিনারার চারটি টুকরো জড়ো করুন।';

  @override
  String get introGoalSixEdges =>
      'প্রতিটি কিনারার চারটি টুকরো জড়ো করুন, যাতে 6×6-এ 12টি পরিষ্কার কিনারা থাকে।';

  @override
  String get introHowSixEdges =>
      'একটি কিনারার বাইরের আর ভেতরের উইং সামনে সারিবদ্ধ করুন।\nগভীর চওড়া স্তর কিনারাকে ভেতরে আর বাইরে নেয়।\nকোনো টুকরো ছাড়াতে তৈরি কিনারা কখনো ভাঙবেন না।';

  @override
  String get introHoldSixEdges =>
      'যে কিনারা বানাচ্ছেন সেটি সামনে; তৈরি কিনারা উপরে আর নিচে রাখা।';

  @override
  String get introWhySixEdges =>
      'গভীর চওড়া মুভ কেন্দ্র সরিয়ে দেয় যাতে উইং মেলে, তারপর সেগুলো ফেরায়।';

  @override
  String get lessonSixSolve => '6×6-কে 3×3-এর মতো সমাধান করুন';

  @override
  String get lessonSixSolveDesc => '3×3-এর মতো স্তর ধরে ধরে শেষ করুন।';

  @override
  String get introGoalSixSolve =>
      'রিডিউস করা 6×6 কে 3×3-এর মতো, স্তর ধরে ধরে, শুধু বাইরের মুভে সমাধান করুন।';

  @override
  String get introHowSixSolve =>
      'এখন থেকে শুধু বাইরের মুভ: স্লাইস কেন্দ্র বা কিনারা ভেঙে দেবে।\nআপনার বানানো কেন্দ্র প্রতিটি দিকের রং দেখায়।\nসাদা ক্রস আর কোণ, মাঝের স্তর, তারপর হলুদ স্তর।';

  @override
  String get introHoldSixSolve =>
      'প্রথম স্তরের রং নিচে, ঠিক 3×3-এর মতো; বসানোর কোণ সামনে-ডানে।';

  @override
  String get introWhySixSolve =>
      'বাইরের মুভ প্রতিটি 4×4 কেন্দ্র আর প্রতিটি কিনারাকে এক টুকরো হিসেবে নড়ায়, ঠিক 3×3-এর মতো।';

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
      'আটকে না যাওয়া পর্যন্ত 3×3-এর মতো সমাধান করুন।\nএকটি উল্টানো কিনারা: 3Rw দিয়ে লম্বা সমাধান।\nজায়গা বদলানো দুটি কিনারা: ভেতরের ডাবল মুভে ছোট সমাধান।';

  @override
  String get introHoldSixParity =>
      'শেষ স্তর উপরে। উল্টানো কিনারা সামনে; দুটি বদলানো হলে সামনে আর পেছনে।';

  @override
  String get introWhySixParity =>
      '4×4-এর মতো 6×6-ও একটি উল্টানো বা দুটি বদলানো কিনারায় শেষ হতে পারে; ভেতরের স্তরের অ্যালগরিদম এগুলো ঠিক করে আর বাকিটা রেখে দেয়।';

  @override
  String get stepFivePieces => '5×5-এর টুকরো';

  @override
  String get stepFivePiecesBody =>
      'প্রতিটি দিকের মাঝের টুকরো কখনো নড়ে না, তাই রঙের নকশা ভুল হতে পারে না। চারপাশে আটটি কেন্দ্রের টুকরো: কোণ-কেন্দ্র আর কিনারা-কেন্দ্র কখনো ধরন বদলায় না। প্রতিটি কিনারা একটি মাঝের টুকরো আর দুটি উইং।';

  @override
  String get stepFiveSlices => 'তিন ধরনের টার্ন';

  @override
  String get stepFiveSlicesBody =>
      'বাইরের টার্ন একটি দিক সরায়। ওয়াইড টার্ন একটি দিককে তার পেছনের স্তরসহ সরায়। ভেতরের স্লাইস টার্ন শুধু ভেতরের একটি স্তর সরায়: এভাবেই বাইরের অংশ না ছুঁয়ে টুকরো জায়গা বদলায়।';

  @override
  String get stepFiveCenterBar => 'কেন্দ্রের বার';

  @override
  String get stepFiveCenterBarBody =>
      'তিনটি মেলা কেন্দ্রের টুকরোর সারি বানিয়ে ভেতরের স্লাইসে ঢোকান, উপর ঘোরান আর স্লাইস ফেরান: বার আনা মুভই তৈরি কেন্দ্র ফেরায়। তিনটি বারে একটি কেন্দ্র।';

  @override
  String get stepFiveCenterSwap => 'না ভেঙে অদলবদল';

  @override
  String get stepFiveCenterSwapBody =>
      'একটি কেন্দ্রের টুকরো সরাতে: একটি ভেতরের স্লাইস ঘোরান, উপরের স্তর ঘোরান, স্লাইস ফিরিয়ে দিন, উপরের স্তর ফিরিয়ে দিন। প্রতিবারই শেষ হওয়া কেন্দ্রগুলো আগের অবস্থায় ফেরে।';

  @override
  String get stepFiveEdgePair => 'উইংকে মাঝের কিনারার সাথে জুড়ুন';

  @override
  String get stepFiveEdgePairBody =>
      'সামনে একটি উইংকে তার মাঝের কিনারার পাশে সারিবদ্ধ করুন, ভেতরের স্তর নামান, একটি ছোট ট্রিগার দিয়ে অসমাধান কিনারা আনুন, তারপর ভেতরের স্তর ফেরান।';

  @override
  String get stepFiveEdgeLast => 'শেষ কিনারাগুলো';

  @override
  String get stepFiveEdgeLastBody =>
      'বদলানোর মতো খালি কিনারা না থাকলে স্লাইস, উল্টানো, স্লাইস করুন: একটি চওড়া মুভ, ছোট ট্রিগার আর ফেরত চওড়া মুভ তৈরি কিনারা না ভেঙে শেষগুলো জোড়ে।';

  @override
  String get stepFiveAsThree => 'এখন এটি একটি 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'কেন্দ্র আর কিনারা তৈরি হলে 5×5 একটি বড় 3×3-এর মতো আচরণ করে। শুধু বাইরের মুভ, স্তর ধরে ধরে: সাদা ক্রস আর কোণ, মাঝের স্তর, তারপর হলুদ স্তর। 5×5-এ PLL প্যারিটি নেই।';

  @override
  String get stepFiveEdgeParity => 'শেষ কিনারার উইং অদলবদল করুন';

  @override
  String get stepFiveEdgeParityBody =>
      'কখনো শেষ কিনারার দুটি বাইরের উইং বদলানো থাকে, তাই সেটি উল্টানো দেখায়: 5×5-এর একমাত্র প্যারিটি। সেটি উপরের স্তরে সামনে রেখে ভেতরের স্লাইসের অ্যালগরিদম একবার করুন; বাকি সব জায়গায় ফেরে।';

  @override
  String get stepSixPieces => '6×6-এর টুকরো';

  @override
  String get stepSixPiecesBody =>
      '4×4-এর মতো 6×6-এ কোনো স্থির কেন্দ্র নেই: ষোলোটি কেন্দ্রের টুকরো প্রতিটি দিকের রং বানায়, তাই আগে একটি কোণে রঙের ক্রম দেখুন। প্রতিটি কিনারার চারটি উইং: দুটি বাইরের, দুটি ভেতরের।';

  @override
  String get stepSixSlices => 'গভীর স্তর ঘোরানো';

  @override
  String get stepSixSlicesBody =>
      'ওয়াইড টার্ন একটি দিক থেকে দুই বা তিনটি স্তর সরাতে পারে। দ্বিতীয় বা তৃতীয় স্তরের ভেতরের স্লাইসই কেন্দ্র আর কিনারার হাতিয়ার।';

  @override
  String get stepSixCenterBar => 'চারটির বার';

  @override
  String get stepSixCenterBarBody =>
      'চারটি মেলা কেন্দ্রের টুকরোর সারি বানিয়ে ভেতরের স্লাইস মুভে পাশাপাশি সরান, প্রতিটি স্লাইস ফিরিয়ে, যতক্ষণ না দিকটি এক রঙের 4×4 ব্লক হয়।';

  @override
  String get stepSixCenterSwap => 'একবারে একটি টুকরো';

  @override
  String get stepSixCenterSwapBody =>
      'তৃতীয় স্তর ঘোরান, উপর ঘোরান, ফেরান, উপর ফেরান: একটি কেন্দ্রের টুকরো সরে আর তৈরি কেন্দ্র ফিরে আসে। শেষ দুই কেন্দ্রে, যখন কোনো বার খাটে না, এটি করুন।';

  @override
  String get stepSixEdgePair => 'চারটি টুকরো, একটি কিনারা';

  @override
  String get stepSixEdgePairBody =>
      'গভীর চওড়া স্তর দিয়ে একটি কিনারার চারটি উইং সামনে জড়ো করুন, একটি ছোট ট্রিগার দিয়ে অসমাধান কিনারা আনুন, তারপর চওড়া স্তর ফেরান।';

  @override
  String get stepSixEdgeLast => 'শেষ কিনারাগুলো';

  @override
  String get stepSixEdgeLastBody =>
      'গভীর চওড়া মুভ আর তার উল্টো মুভের মাঝে একটি ছোট ট্রিগার দিয়ে শেষ কিনারা জুড়ুন, যাতে তৈরি কিনারা জোড়া থাকে। কোনো টুকরো ছাড়াতে তৈরি কিনারা কখনো ভাঙবেন না।';

  @override
  String get stepSixAsThree => 'এখন এটি একটি 3×3';

  @override
  String get stepSixAsThreeBody =>
      '4×4 কেন্দ্র আর জোড়া কিনারা নিয়ে 6×6 কে 3×3-এর মতো, স্তর ধরে ধরে, শুধু বাইরের মুভে সমাধান করুন। শেষে একটি উল্টানো বা দুটি বদলানো কিনারা প্যারিটি, ভুল নয়।';

  @override
  String get stepSixOllParity => 'একটি উল্টানো কিনারা';

  @override
  String get stepSixOllParityBody =>
      'শেষ স্তরে একা উল্টানো দেখানো কিনারা প্যারিটি। সেটি উপরের স্তরে সামনে রেখে লম্বা সমাধান করুন: এটি চারটি উইংই উল্টায়, উপরের বাঁ-ডান কিনারাও বদলায় আর প্রথম দুই স্তর ছোঁয় না।';

  @override
  String get stepSixPllParity => 'দুটি অদলবদল কিনারা';

  @override
  String get stepSixPllParityBody =>
      'একদম শেষে দুটি কিনারা বদলানো দেখালে সেগুলো উপরের স্তরে সামনে আর পেছনে রেখে ভেতরের ডাবল মুভের ছোট সমাধান করুন: দুই কিনারার চারটি উইংই জায়গা বদলায়।';

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
  String fastMoveCounter(int current, int total) {
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

  @override
  String get homeAcademy => 'অ্যাকাডেমি';

  @override
  String get homePatterns => 'দারুণ প্যাটার্ন';

  @override
  String get homePractice => 'টাইমার ও দৈনিক চ্যালেঞ্জ';

  @override
  String get scanChoiceSubtitle => 'কীভাবে শুরু করতে চান?';

  @override
  String get scanChoiceCamera => 'ক্যামেরা দিয়ে স্ক্যান';

  @override
  String get scanChoiceCameraDesc =>
      'প্রতিটি দিক ক্যামেরায় দেখান আর সমাধান পান।';

  @override
  String get scanChoice3d => '3D কিউব খুলুন';

  @override
  String get scanChoice3dDesc =>
      'ভার্চুয়াল কিউব ঘোরান, এলোমেলো করুন আর ধাপে ধাপে সমাধান করুন।';

  @override
  String get academyAllSizes => 'সব সাইজ';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$totalটির মধ্যে $doneটি পাঠ শেষ';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total শেষ';
  }

  @override
  String get lessonStageConcept => 'ধারণা';

  @override
  String get lessonStageExamples => 'উদাহরণ';

  @override
  String get lessonStagePractice => 'অনুশীলন';

  @override
  String get lessonStageNext => 'পরের / মুক্ত';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'ধাপ $index / $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'উদাহরণ $index / $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'অনুশীলন $index / $total';
  }

  @override
  String get lessonBonusCase => 'বোনাস কেস';

  @override
  String get lessonPracticeIntro =>
      'আসল স্ক্র্যাম্বল: শুধু আগের ধাপগুলো মেলানো। একটি একটি নির্দেশনা ধরে পুরো এই ধাপটি শেষ করুন।';

  @override
  String lessonContinueDesc(String lesson) {
    return 'সরাসরি $lesson-এ চলুন।';
  }

  @override
  String get lessonFreePractice => 'মুক্ত অনুশীলন';

  @override
  String get lessonFreePracticeDesc =>
      'এলোমেলো একটি 3D কিউব নিজে মেলান, শুরু থেকে এই ধাপ পর্যন্ত।';

  @override
  String freePracticeBanner(String topic) {
    return 'মুক্তভাবে অনুশীলন করুন: শুরু থেকে $topic পর্যন্ত কিউবটি মেলান!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return '$face কেন্দ্রের দিকটি তীরের দিকে ঘোরান। কেন্দ্র জায়গায় থাকে; শুধু তার চারপাশের টুকরোগুলো সরে।';
  }

  @override
  String cueTrigger(String front) {
    return 'ডান হাতের ট্রিগার, $front আপনার দিকে: ডান দিক উপরে, উপরের স্তর বাঁয়ে, ডান দিক নিচে, উপরের স্তর আবার ডানে।';
  }

  @override
  String get cueTriggerBack =>
      'পরপর ষষ্ঠ ট্রিগার কিউবকে ঠিক আগের অবস্থায় ফিরিয়ে আনে। ছয়ই জাদুর সংখ্যা!';

  @override
  String cueSliceInner(String face) {
    return '$face দিকের পাশের শুধু ভেতরের স্তরটি ঘোরান। দিকটি নিজে স্থির থাকে, তাই কেন্দ্রগুলো আলাদা হয়ে যায়।';
  }

  @override
  String cueSliceWide(String face) {
    return 'চওড়া ঘোরানো: $face দিক আর তার পাশের ভেতরের স্তর একসঙ্গে ঘোরে, একটি মোটা স্তরের মতো।';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'পুরো কিউবটি এমনভাবে ঘোরান যাতে $top কেন্দ্র উপরে আর $front কেন্দ্র আপনার দিকে থাকে।';
  }

  @override
  String get cueTurnTop =>
      'পরের অ্যালগরিদমের প্রস্তুতির জন্য তীর অনুযায়ী শুধু উপরের স্তর ঘোরান।';

  @override
  String get cueAlignTop =>
      'শেষ চাল: উপরের স্তর ঘুরিয়ে রংগুলো মিলিয়ে দিন। হয়ে গেছে!';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece কিনারা উপরের স্তরে আছে। উপরের স্তর ঘোরান যতক্ষণ না সেটি $center কেন্দ্রের ঠিক উপরে আসে, তারপর নামাতে সেই দিকটি দুবার ঘোরান।';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece কিনারা মাঝের স্তরে আটকে আছে। সেটিকে উপরে তুলুন, $center কেন্দ্রের উপরে মেলান, তারপর নামান।';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece কিনারা জায়গায় আছে কিন্তু উল্টানো: তার সাদা পাশে তাকিয়ে। সেটি বের করে সাদা উপরে রেখে উপরে তুলুন, তারপর $center কেন্দ্রের পাশে নামান।';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP ধরনে নিচের স্তরও ঘোরানো যায়। $piece কিনারা নামান আর নিচের স্তর ঘুরিয়ে সেটিকে $center কেন্দ্রের সাথে মেলান।';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'উপরের স্তর ঘোরান যতক্ষণ না $piece কোণ তার জায়গার ঠিক উপরে, $a আর $b দিকের মাঝে আসে। সঠিকভাবে ঢুকে যাওয়া পর্যন্ত ডান হাতের ট্রিগার বারবার করুন।';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece কোণ তার স্লটে আছে কিন্তু মোচড়ানো। একটি ট্রিগার সেটি বের করে আনে (তার জায়গায় একটি হলুদ কোণ ঢোকে); একই স্লটের উপরে করতে থাকুন যতক্ষণ না সেটি সাদা নিচে রেখে ফেরে। তার পিছনে কিউব ঘোরাবেন না।';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'উপরের স্তর ঘোরান যতক্ষণ না $piece কিনারা $a কেন্দ্রের সাথে মেলে, তারপর সেটিকে নিচে ডানে, $a আর $b-এর মাঝের খাঁজে পাঠান।';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'উপরের স্তর ঘোরান যতক্ষণ না $piece কিনারা $a কেন্দ্রের সাথে মেলে, তারপর সেটিকে নিচে বাঁয়ে, $a আর $b-এর মাঝের খাঁজে পাঠান।';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece কিনারা তার স্লটে আছে কিন্তু উল্টানো। সেখানে একটি হলুদ কিনারা ঢুকিয়ে সেটি উপরে ঠেলুন, তারপর $a আর $b-এর মাঝে আবার বসান।';
  }

  @override
  String cueYellowLine(String front) {
    return 'হলুদ রেখা: উপরের স্তর ঘোরান যাতে রেখাটি বাঁ থেকে ডানে যায়, $front আপনার দিকে রাখুন, তারপর হলুদ ক্রসের অ্যালগরিদম করুন।';
  }

  @override
  String cueYellowL(String front) {
    return 'হলুদ L: উপরের স্তর ঘোরান যাতে L পেছনে-বাঁয়ে নির্দেশ করে, $front আপনার দিকে রাখুন, তারপর অ্যালগরিদম করুন। এটি রেখা হয়ে যাবে।';
  }

  @override
  String cueYellowDot(String front) {
    return 'শুধু কেন্দ্র হলুদ: একটি বিন্দু। $front আপনার দিকে রেখে অ্যালগরিদম একবার করুন, L পাবেন। বিন্দুতে তিন রাউন্ড লাগতে পারে, চালিয়ে যান।';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'উপরের স্তর ঘোরান যতক্ষণ না $piece কিনারা $center কেন্দ্রের সাথে মেলে।';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'মেলানো দুটি কিনারা পেছনে আর ডানে আছে। $front আপনার দিকে রেখে অদলবদল করুন: সামনের আর বাঁয়ের কিনারা জায়গা বদলায়।';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'মেলানো কিনারাগুলো মুখোমুখি। $front আপনার দিকে রেখে একবার অদলবদল করুন; তারপর পাশাপাশি দুটি মিলবে।';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece কোণ আগেই জায়গামতো আছে। সেটিকে সামনে-ডানে রাখুন, $front আপনার দিকে, আর বাকি তিনটি কোণ চক্রাকারে বদলান।';
  }

  @override
  String cueCornersNone(String front) {
    return 'এখনও কোনো হলুদ কোণ জায়গামতো নেই। $front আপনার দিকে রেখে একবার চক্র করুন; তারপর একটি কোণ জায়গামতো আসবে।';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'সামনে-ডানের $piece কোণটি ঘোরান: তার হলুদ উপরে না আসা পর্যন্ত নিচের ট্রিগার জোড়ায় জোড়ায় করুন। নিচের স্তরগুলো এখন এলোমেলো দেখাবে; শেষ কোণের সঙ্গে ফিরে আসবে!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'এবার $piece কোণের চারটি ট্রিগার লাগবে। চালিয়ে যান: হলুদ সবসময় দুই বা চারটির পর উপরে আসে।';
  }

  @override
  String get cueTwistNext =>
      'পরের মোচড়ানো কোণটি সামনে-ডানে আনতে শুধু উপরের স্তর ঘোরান। এখন পুরো কিউব ঘোরাবেন না!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'উপরে $piece কোণকে $edge কিনারার সাথে জোড়া বানান, তারপর জোড়াটি $a আর $b-এর মাঝের খাঁজে ঢোকান।';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece কোণ ভুল কিনারার সাথে তার খাঁজে আটকে আছে। আগে সেটিকে উপরে বের করুন, তারপর জোড়া বানিয়ে ঢোকান।';
  }

  @override
  String cueOllSune(String front) {
    return '$front আপনার দিকে রেখে Sune করুন, যাতে হলুদ কোণগুলো উপরের দিকে ঘোরে।';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'এবার একটি Sune যথেষ্ট হয়নি। উপরের স্তর ঘোরান আর $front আপনার দিকে রেখে আবার Sune করুন।';
  }

  @override
  String cuePllCorners(String front) {
    return 'দুটি কোণের জায়গা বদলাতে হবে। মিলে যাওয়া জোড়া (হেডলাইট) বাঁয়ে রাখুন, $front আপনার দিকে, আর T-perm করুন।';
  }

  @override
  String cuePllEdges(String piece) {
    return 'কোণগুলো তৈরি। $piece কিনারা পেছনে রাখুন আর বাকি তিনটি কিনারা U-perm দিয়ে চক্রাকারে বদলান।';
  }

  @override
  String get cuePllNoEdge =>
      'এখনও উপরের কোনো কিনারা তার কেন্দ্রের সাথে মেলেনি। যেকোনো দিক থেকে একবার U-perm করুন; তারপর একটি মিলবে।';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'উপরের পাশাপাশি দুটি কোণের জায়গা বদলাতে হবে। মিলে যাওয়া জোড়া বাঁয়ে রাখুন, $front আপনার দিকে, আর অদলবদল করুন।';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'বদলানোর দুটি কোণ কোনাকুনি আছে। $front আপনার দিকে রেখে কোনাকুনি অদলবদল করুন।';
  }

  @override
  String cueCenterCycle(String color) {
    return 'পথ হারানো $color কেন্দ্রের টুকরোটিকে কেন্দ্রের 3-সাইকেল দিয়ে ঘরে ফেরান: স্তর, উপর, স্তর, তারপর সব আগের মতো।';
  }

  @override
  String cueCenterBar(String color) {
    return '$color কেন্দ্রের টুকরোর একটি পুরো দণ্ড ভুল দিকে আছে। ভেতরের স্তর দিয়ে সেটি তুলুন, উপরের স্তর ঘোরান, আর ঘরে ফিরিয়ে দিন।';
  }

  @override
  String cueEdgePair(String piece) {
    return '$piece কিনারার দুটি টুকরো জোড়া লাগান: সারিতে আনুন, স্তর ঘোরান, ডান হাতের চালে একটি জোড়াহীন কিনারা বদলে নিন, তারপর স্তর ফিরিয়ে দিন।';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'শেষ কিনারাগুলো: শেষ দুই কিনারার অ্যালগরিদম দিয়ে $piece কিনারা জোড়া লাগান, যা সব তৈরি কিনারা অক্ষত রাখে।';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL প্যারিটি: উপরের একটি কিনারা উল্টানো, যা 3×3-এ কখনো হয় না। সেটি সামনে রাখুন, $front আপনার দিকে, আর কোনো সাধারণ OLL-এর আগে প্যারিটি সমাধান করুন।';
  }

  @override
  String get cueParityPll =>
      'PLL প্যারিটি: উপরের দুটি কিনারা বদলানো, যা 3×3-এ কখনো হয় না। সেগুলো সামনে আর পেছনে রেখে প্যারিটি সোয়াপ করুন, তারপর উপরটা মেলান।';

  @override
  String cueParityFive(String front) {
    return 'কিনারা প্যারিটি: একটি কিনারার দুটি বাইরের উইং বদলানো, 5×5-এর একমাত্র প্যারিটি। সেই কিনারা সামনে রাখুন, $front আপনার দিকে, আর সমাধান একবার করুন।';
  }

  @override
  String get onboardingSkip => 'এড়িয়ে যান';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get onboardingStart => 'শুরু করুন';

  @override
  String get onboardingWhatTitle => 'আপনার কিউব সঙ্গী';

  @override
  String get onboardingWhatBody =>
      'CubeMentor আপনাকে 2×2 থেকে 6×6 পর্যন্ত প্রতিটি কিউব সমাধান করতে, শিখতে ও অনুশীলন করতে সাহায্য করে, পুরোপুরি অফলাইনে।';

  @override
  String get onboardingScanTitle => 'কয়েক সেকেন্ডে স্ক্যান করে সমাধান';

  @override
  String get onboardingScanBody =>
      'প্রতিটি দিক ক্যামেরায় দেখান (বা রং ট্যাপ করে দিন) এবং 3D সমাধান এক চাল করে অনুসরণ করুন।';

  @override
  String get onboardingLearnTitle => 'শিখুন আর খেলুন';

  @override
  String get onboardingLearnBody =>
      'অ্যাকাডেমিতে স্তর-ধরে-ধরে পদ্ধতি শিখুন, তারপর 3D প্লেগ্রাউন্ডে ইচ্ছেমতো ঘোরান, এলোমেলো করুন আর সমাধান করুন।';

  @override
  String get scanChoiceManualDesc =>
      'প্রতিটি দিকের রং একটি একটি স্টিকার করে ট্যাপ করে দিন।';

  @override
  String get scanTryAgain => 'আবার চেষ্টা করুন';

  @override
  String get scanEditManually => 'হাতে রং ঠিক করুন';

  @override
  String get scanLightingHint =>
      'দিকটি গ্রিডের মাঝখানে রাখুন। উজ্জ্বল, সমান আলো ব্যবহার করুন এবং ঝলক এড়িয়ে চলুন।';

  @override
  String get crownExplain =>
      'স্তর হলো কিউবের একটি অনুভূমিক ফালি: প্রথম স্তর নিচের সাদা স্তর, দ্বিতীয়টি মাঝের স্তর আর তৃতীয়টি উপরের হলুদ স্তর।';

  @override
  String get lessonObjectiveHeading => 'শেখার লক্ষ্য';

  @override
  String get dirRowTop => 'সামনের দিকের উপরের সারি';

  @override
  String get dirRowBottom => 'সামনের দিকের নিচের সারি';

  @override
  String get dirColumnRight => 'সামনের দিকের ডান কলাম';

  @override
  String get dirColumnLeft => 'সামনের দিকের বাঁ কলাম';

  @override
  String get solveChoiceTitle => 'আপনি কীভাবে সমাধান করতে চান?';

  @override
  String get solveChoiceFastDesc => 'সবচেয়ে ছোট সমাধান, এক চাল করে।';

  @override
  String get solveChoiceGuidedDesc => 'স্তর-ধরে-ধরে পদ্ধতি ধাপে ধাপে শিখুন।';

  @override
  String get guidedSolvedTitle => 'সমাধান হয়েছে!';

  @override
  String get guidedSolvedBody =>
      'আপনি প্রতিটি ধাপ অনুসরণ করে কিউব সমাধান করেছেন।';

  @override
  String get solveAgain => 'আবার সমাধান করুন';

  @override
  String get backToHome => 'হোমে ফিরে যান';

  @override
  String get dailyStatTime => 'আজকের সময়';

  @override
  String get dailyStatBest => 'ব্যক্তিগত সেরা';

  @override
  String get dailyStatStreak => 'বর্তমান ধারা';

  @override
  String get dailyStatBestStreak => 'সেরা ধারা';

  @override
  String get privacyPolicyTitle => 'গোপনীয়তা নীতি';

  @override
  String get settingsPrivacyPolicyDesc =>
      'CubeMentor কী সংরক্ষণ করে আর বিজ্ঞাপন কী ব্যবহার করে।';

  @override
  String get privacyIntro =>
      'CubeMentor কোনো অ্যাকাউন্ট ও নিজস্ব সার্ভার ছাড়াই চলে। এই পৃষ্ঠায় বলা আছে কী আপনার ডিভাইসে থাকে এবং আমাদের বিজ্ঞাপন অংশীদার কী ব্যবহার করে।';

  @override
  String get privacyDataTitle => 'আপনার ডেটা আপনার ডিভাইসেই থাকে';

  @override
  String get privacyDataBody =>
      'আপনার ভাষা, সেটিংস, পাঠের অগ্রগতি, সমাধানের সময় ও দৈনিক ধারা শুধু এই ডিভাইসে সংরক্ষিত হয়। আমাদের কোনো সার্ভার নেই, তাই আমরা কখনো এগুলো পাই না। অ্যাপ আনইনস্টল করলে এগুলো মুছে যায়।';

  @override
  String get privacyCameraTitle => 'ক্যামেরা';

  @override
  String get privacyCameraBody =>
      'ক্যামেরা শুধু কিউব স্ক্যান করার সময় ব্যবহৃত হয়। স্টিকারের রং পড়তে ছবিগুলো আপনার ডিভাইসেই বিশ্লেষণ করা হয়; কোনো ছবি বা ভিডিও সংরক্ষণ বা পাঠানো হয় না।';

  @override
  String get privacyAdsTitle => 'বিজ্ঞাপন';

  @override
  String get privacyAdsBody =>
      'অ্যাপটি Google AdMob-এর বিজ্ঞাপন দেখায়। Google-এর গোপনীয়তা নীতিতে যেমন বলা আছে, বিজ্ঞাপন দেখাতে ও পরিমাপ করতে Google ডিভাইস শনাক্তকারী ও বিজ্ঞাপনের সঙ্গে মিথস্ক্রিয়ার ডেটা ব্যবহার করতে পারে। যেখানে আইন অনুযায়ী প্রয়োজন, সেখানে আগে আপনার সম্মতি চাওয়া হয় এবং আপনি সেটিংসে তা বদলাতে পারেন।';

  @override
  String get privacyContactTitle => 'যোগাযোগ';

  @override
  String privacyContactBody(String email) {
    return 'গোপনীয়তা নিয়ে প্রশ্ন আছে? আমাদের $email-এ লিখুন।';
  }
}
