// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'امسح المكعب وحلّه وأتقن كل المكعبات من 2×2 إلى 6×6.';

  @override
  String get chooseCubeSize => 'اختر مكعبك';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'مبتدئ';

  @override
  String get cubeLevel3 => 'كلاسيكي';

  @override
  String get cubeLevel4 => 'متقدم';

  @override
  String get cubeLevel5 => 'خبير';

  @override
  String get cubeLevel6 => 'محترف';

  @override
  String get cubeComingSoon => 'مكعب جديد قريبًا';

  @override
  String get carouselPrevious => 'المكعب السابق';

  @override
  String get carouselNext => 'المكعب التالي';

  @override
  String get chooseMode => 'ماذا تريد أن تفعل؟';

  @override
  String get modePlayground => 'ساحة ثلاثية الأبعاد';

  @override
  String get modePlaygroundDesc =>
      'أدر الطبقات، وابعثر المكعب، وأعد تشغيل الحركات بتقنية ثلاثية الأبعاد.';

  @override
  String get modeScanSolve => 'امسح وحُلّ';

  @override
  String get modeScanSolveDesc => 'امسح مكعبك بالكاميرا واحصل على الحل.';

  @override
  String get modeAcademy => 'الأكاديمية';

  @override
  String get modeAcademyDesc => 'تعلّم خطوة بخطوة من خلال دروس تفاعلية.';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get comingSoonMessage => 'هذه الميزة قادمة في تحديث قريب.';

  @override
  String get language => 'اللغة';

  @override
  String get languageSearch => 'ابحث عن لغة';

  @override
  String get languageNoResults => 'لا توجد لغة تطابق بحثك.';

  @override
  String playgroundTitle(int size) {
    return 'ساحة $size×$size';
  }

  @override
  String get scramble => 'بعثرة';

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get undo => 'تراجع';

  @override
  String get speed => 'السرعة';

  @override
  String get xray => 'أشعة سينية';

  @override
  String get prime => 'عكسي';

  @override
  String get wide => 'عريض';

  @override
  String layer(int index) {
    return 'الطبقة $index';
  }

  @override
  String get cubeRotations => 'تدويرات';

  @override
  String get play => 'تشغيل';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get playbackTitle => 'التشغيل';

  @override
  String get playbackEmpty => 'ابعثر المكعب لإنشاء تشغيل للحل.';

  @override
  String playbackProgress(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حركة',
      many: '$count حركة',
      few: '$count حركات',
      two: 'حركتان',
      one: 'حركة واحدة',
      zero: 'لا توجد حركات',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'محلول';

  @override
  String get scrambled => 'مبعثر';

  @override
  String get orbitHint => 'اسحب صفًا لتدويره · اسحب الخلفية لتدوير العرض';

  @override
  String get notationPad => 'لوحة الرموز';

  @override
  String get solve => 'حُلّ';

  @override
  String get solving => 'جارٍ الحل…';

  @override
  String get solveFast => 'حل سريع';

  @override
  String get solveLearn => 'تعلّم خطوة بخطوة';

  @override
  String get solveModeGuided => 'موجَّه (3 تيجان)';

  @override
  String get solveModeFast => 'سريع (الأمثل)';

  @override
  String solveUnavailable(int size) {
    return 'سيصل حلّال $size×$size في تحديث لاحق.';
  }

  @override
  String get solveAlreadySolved => 'المكعب محلول بالفعل.';

  @override
  String solveFailed(String reason) {
    return 'لا يمكن حل هذا المكعب ($reason).';
  }

  @override
  String get solveEngineMissing => 'محرك الحل غير متاح على هذا الجهاز.';

  @override
  String get solveComplete => 'تم الحل! عمل رائع.';

  @override
  String solveSummary(int count) {
    return 'عدد الحركات: $count';
  }

  @override
  String get nextMove => 'الحركة التالية';

  @override
  String get previousMove => 'الحركة السابقة';

  @override
  String get halfTurnHalfway =>
      'أحسنت، وصلت إلى المنتصف! أدرها مرة أخرى في الاتجاه نفسه لإكمال الدورة المزدوجة (180°).';

  @override
  String get wideTurnInner =>
      'رائع! الآن اسحب الطبقة الداخلية المجاورة لإكمال الدورة العريضة.';

  @override
  String get wideTurnOuter =>
      'رائع! الآن اسحب الطبقة الخارجية المجاورة لإكمال الدورة العريضة.';

  @override
  String get wideTurnMore =>
      'رائع! واصل سحب الطبقات المضيئة واحدة تلو الأخرى لإكمال الدورة العريضة.';

  @override
  String get guideSwipeHint =>
      'اسحب الطبقة المضيئة في اتجاه السهم، أو اضغط التالي.';

  @override
  String get guideRotateHint => 'أدر المكعب كله كما يوضح السهم: اضغط التالي.';

  @override
  String get guideWrongMove => 'اتبع السهم المميّز';

  @override
  String get guideExit => 'الخروج من الدليل';

  @override
  String get replayStep => 'إعادة الخطوة';

  @override
  String get colorWhite => 'الأبيض';

  @override
  String get colorYellow => 'الأصفر';

  @override
  String get colorGreen => 'الأخضر';

  @override
  String get colorBlue => 'الأزرق';

  @override
  String get colorRed => 'الأحمر';

  @override
  String get colorOrange => 'البرتقالي';

  @override
  String get phaseOptimal2x2 => 'الحل الأمثل';

  @override
  String get phaseKociemba1 => 'المرحلة 1 · توجيه القطع';

  @override
  String get phaseKociemba2 => 'المرحلة 2 · إنهاء المكعب';

  @override
  String get phaseLblCross => 'الصليب الأبيض';

  @override
  String get phaseLblCorners => 'زوايا التاج الأول';

  @override
  String get phaseLblMiddle => 'حواف الطبقة الوسطى';

  @override
  String get phaseLblYellowCross => 'الصليب الأصفر';

  @override
  String get phaseLblYellowEdges => 'محاذاة حواف الصليب الأصفر';

  @override
  String get phaseLblYellowCorners => 'وضع الزوايا الصفراء في أماكنها';

  @override
  String get phaseLblYellowCornersOrient => 'توجيه الزوايا الصفراء';

  @override
  String get crownFirst => 'التاج الأول';

  @override
  String get crownSecond => 'التاج الثاني';

  @override
  String get crownThird => 'التاج الثالث';

  @override
  String get crownFirstGoal => 'الوجه الأبيض والطبقة الأولى';

  @override
  String get crownSecondGoal => 'الطبقة الوسطى';

  @override
  String get crownThirdGoal => 'الوجه الأصفر والطبقة الأخيرة';

  @override
  String crownProgress(int current, int total) {
    return 'التاج $current من $total';
  }

  @override
  String get subStepGoal11 =>
      'كوّن صليبًا أبيض تطابق فيه كل حافة بيضاء أيضًا لون المركز المجاور لها.';

  @override
  String get subStepGoal12 =>
      'أدخل الزوايا البيضاء الأربع في أماكنها لإكمال الوجه الأبيض والحلقة الأولى كلها.';

  @override
  String get subStepGoal21 =>
      'أدخل حواف الطبقة الوسطى الأربع دون إفساد التاج الأول.';

  @override
  String get subStepGoal31 => 'كوّن صليبًا أصفر في الطبقة الأخيرة.';

  @override
  String get subStepGoal32 =>
      'بدّل حواف الصليب الأصفر حتى تطابق كل منها مركز جانبها.';

  @override
  String get subStepGoal33 =>
      'انقل الزوايا الصفراء الأربع إلى أماكنها الصحيحة حتى لو كانت ما زالت ملتوية.';

  @override
  String get subStepGoal34 =>
      'دوّر كل زاوية صفراء في مكانها حتى تتطابق كل الملصقات ويُحل المكعب.';

  @override
  String get explainOptimal2x2 =>
      'أقصر حل ممكن، تم إيجاده بالبحث في كل أوضاع مكعب 2×2.';

  @override
  String get explainKociemba1 =>
      'وجّه كل القطع واجمع حواف الطبقة الوسطى في الطبقة الوسطى.';

  @override
  String get explainKociemba2 =>
      'أنهِ الحل باستخدام ⁦U⁩ و⁦D⁩ وأنصاف الدورات فقط، فهي تحافظ على ذلك التوجيه.';

  @override
  String get explainLblOrient =>
      'أدر المكعب كله بحيث يتجه المركز الأبيض إلى الأسفل.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'أنزل الحافة ($piece) بجانب المركز الأبيض بحيث يطابق لونها الجانبي.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'الزاوية ($piece) عالقة في المكان الخطأ. ارفعها إلى الأعلى باستخدام ⁦R U R\' U\'⁩.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'أدر الطبقة العليا حتى تصبح الزاوية ($piece) فوق مكانها.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'كرّر ⁦R U R\' U\'⁩ حتى تستقر الزاوية ($piece) في مكانها.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'الحافة ($piece) في الطبقة الوسطى لكنها في غير مكانها. أخرجها إلى الأعلى.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'أدر الطبقة العليا حتى يطابق اللون الجانبي للحافة ($piece) مركزها.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'أدخل الحافة ($piece) إلى اليمين: ⁦U R U\' R\' U\' F\' U F⁩.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'أدخل الحافة ($piece) إلى اليسار: ⁦U\' L\' U L U F U\' F\'⁩.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'أدر الطبقة العليا لوضع الشكل الأصفر في موضعه قبل الخوارزمية التالية.';

  @override
  String get explainLblYellowCrossAlg =>
      'كوّن الصليب الأصفر باستخدام ⁦F R U R\' U\' F\'⁩.';

  @override
  String get explainLblYellowEdgesAlign =>
      'أدر الطبقة العليا لمحاذاة الحواف الصفراء مع مراكزها.';

  @override
  String get explainLblYellowEdgesAlg =>
      'بدّل الحواف الصفراء باستخدام ⁦R U R\' U R U2 R\' U⁩.';

  @override
  String get explainLblYellowCornersAlg =>
      'انقل الزوايا الصفراء إلى أماكنها باستخدام ⁦U R U\' L\' U R\' U\' L⁩.';

  @override
  String get explainLblNextCorner =>
      'أدر الطبقة العليا لإحضار الزاوية الصفراء التالية غير المحلولة إلى الأمام يمينًا.';

  @override
  String get explainLblCornerTwist =>
      'كرّر ⁦R\' D\' R D⁩ حتى يتجه الأصفر إلى الأعلى. ستُصلح الطبقة السفلى نفسها في النهاية.';

  @override
  String get explainLblFinalAlign => 'أدر الطبقة العليا لإنهاء المكعب.';

  @override
  String scanTitle(int size) {
    return 'مسح $size×$size';
  }

  @override
  String get scanManualInput => 'إدخال الألوان يدويًا';

  @override
  String get scanUseCamera => 'المسح بالكاميرا';

  @override
  String scanFaceProgress(int current, int total) {
    return 'الوجه $current من $total';
  }

  @override
  String get faceUp => 'الوجه العلوي';

  @override
  String get faceRight => 'الوجه الأيمن';

  @override
  String get faceFront => 'الوجه الأمامي';

  @override
  String get faceDown => 'الوجه السفلي';

  @override
  String get faceLeft => 'الوجه الأيسر';

  @override
  String get faceBack => 'الوجه الخلفي';

  @override
  String get scanHintFront =>
      'أمسك المكعب بحيث يواجهك أي وجه. هذا هو الوجه الأمامي: أبقِ الوجه العلوي نفسه في الأعلى أثناء المسح.';

  @override
  String get scanHintRight =>
      'من الوجه الأمامي، أدر المكعب كله مرة واحدة إلى اليسار ليواجهك الوجه الأيمن.';

  @override
  String get scanHintBack =>
      'من الوجه الأمامي، أدر المكعب كله مرتين إلى اليسار.';

  @override
  String get scanHintLeft =>
      'من الوجه الأمامي، أدر المكعب كله مرة واحدة إلى اليمين.';

  @override
  String get scanHintUp =>
      'من الوجه الأمامي، أمِل الجزء العلوي نحوك ليواجه الكاميرا.';

  @override
  String get scanHintDown =>
      'من الوجه الأمامي، أمِل الجزء السفلي نحوك ليواجه الكاميرا.';

  @override
  String get scanAlignHint => 'املأ الشبكة بالوجه، ثم اضغط زر الالتقاط.';

  @override
  String get scanCapture => 'التقاط الوجه';

  @override
  String get scanTurnLeft => 'أدر المكعب كله إلى اليسار';

  @override
  String get scanTurnRight => 'أدر المكعب كله إلى اليمين';

  @override
  String get scanTipTop => 'أمِل الجزء العلوي نحوك';

  @override
  String get scanTipBottom => 'أمِل الجزء السفلي نحوك';

  @override
  String get scanGlareTip =>
      'تم رصد وهج: أمِل المكعب قليلًا، أو أمسك هاتفك فوقه لحجب الضوء العلوي.';

  @override
  String get scanDimTip =>
      'الإضاءة خافتة جدًا: انتقل إلى مكان أكثر إضاءة أو شغّل الكشاف.';

  @override
  String get scanTorch => 'الكشاف';

  @override
  String get scanGuideLabel =>
      'دليل المسح: الأوجه الممسوحة تظهر بألوانها. اضغط على وجه ممسوح لمسحه مرة أخرى.';

  @override
  String get scanTapToRescan => 'اضغط على وجه ممسوح لمسحه مرة أخرى.';

  @override
  String get scanCameraMissing => 'لم يتم العثور على كاميرا في هذا الجهاز.';

  @override
  String get scanCameraDenied =>
      'تم رفض الوصول إلى الكاميرا. لا يزال بإمكانك إدخال الألوان يدويًا.';

  @override
  String get scanCameraFailed => 'تعذّر تشغيل الكاميرا.';

  @override
  String get scanAllGood => 'تبدو كل الملصقات صحيحة.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملصق تبدو خاطئة',
      many: '$count ملصقًا تبدو خاطئة',
      few: '$count ملصقات تبدو خاطئة',
      two: 'ملصقان يبدوان خاطئين',
      one: 'ملصق واحد يبدو خاطئًا',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'هناك شيء غير منطقي';

  @override
  String scanIssueColors(int count) {
    return 'يجب أن يظهر كل لون $count مرة بالضبط.';
  }

  @override
  String get scanIssueCenters => 'مركزان لهما اللون نفسه.';

  @override
  String get scanIssuePieces =>
      'هذه الملصقات تكوّن قطعًا غير موجودة في مكعب حقيقي.';

  @override
  String get scanIssueTwist => 'إحدى الزوايا ملتوية. تحقق من ملصقات الزوايا.';

  @override
  String get scanIssueFlip => 'إحدى الحواف مقلوبة. تحقق من ملصقات الحواف.';

  @override
  String get scanIssueParity => 'يبدو أن قطعتين متبادلتان.';

  @override
  String get scanIssueUnavailable => 'فحص الألوان غير متاح على هذا الجهاز.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'كان من الصعب قراءة $count ملصق: ألقِ عليها نظرة سريعة.',
      many: 'كان من الصعب قراءة $count ملصقًا: ألقِ عليها نظرة سريعة.',
      few: 'كان من الصعب قراءة $count ملصقات: ألقِ عليها نظرة سريعة.',
      two: 'كان من الصعب قراءة ملصقين: ألقِ عليهما نظرة سريعة.',
      one: 'كان من الصعب قراءة ملصق واحد: ألقِ عليه نظرة سريعة.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'اضغط على ملصق لتغيير لونه · اضغط مطولًا لعرض لوحة الألوان';

  @override
  String get scanRescanFace => 'إعادة مسح وجه';

  @override
  String get scanCancelRescan => 'العودة إلى الألوان';

  @override
  String get scanPaletteTitle => 'اختر لونًا';

  @override
  String get scanOpen3d => 'فتح بالعرض ثلاثي الأبعاد';

  @override
  String get scanRestart => 'البدء من جديد';

  @override
  String get modeTimer => 'مؤقت السرعة';

  @override
  String get modeTimerDesc => 'بعثرات، وفحص، ومتوسطات، وأرقام قياسية شخصية.';

  @override
  String get modeDaily => 'التحدي اليومي';

  @override
  String get modeDailyDesc => 'بعثرة جديدة كل يوم. حافظ على سلسلتك.';

  @override
  String get modePatterns => 'مكتبة الأنماط';

  @override
  String get modePatternsDesc =>
      'رقعة الشطرنج والسوبرفليب والمزيد، بالعرض ثلاثي الأبعاد.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سلسلة $count يوم',
      many: 'سلسلة $count يومًا',
      few: 'سلسلة $count أيام',
      two: 'سلسلة يومين',
      one: 'سلسلة يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'تابع التعلّم';

  @override
  String get startLearning => 'ابدأ التعلّم';

  @override
  String lessonOf(int index, int total) {
    return 'الدرس $index من $total';
  }

  @override
  String get academyAllDone => 'اكتملت كل الدروس!';

  @override
  String get academyTitle => 'الأكاديمية';

  @override
  String academyProgress(int done, int total) {
    return 'اكتمل $done من $total دروس';
  }

  @override
  String get lessonAdvanced => 'متقدم';

  @override
  String get lessonDone => 'مكتمل';

  @override
  String lessonPartOf(int index, int total) {
    return 'الجزء $index من $total';
  }

  @override
  String get lessonBack => 'رجوع';

  @override
  String get lessonNext => 'التالي';

  @override
  String get lessonFinish => 'إنهاء الدرس';

  @override
  String get lessonComplete => 'اكتمل الدرس!';

  @override
  String get lessonNextLesson => 'الدرس التالي';

  @override
  String get lessonBackToAcademy => 'العودة إلى الأكاديمية';

  @override
  String get lessonTryIt =>
      'دورك: اسحب الطبقة التي يشير إليها السهم، أو اضغط الحركة التالية.';

  @override
  String get lessonLookAround => 'اسحب الخلفية لرؤية المكعب من كل الجهات.';

  @override
  String get lessonDemoDone => 'أحسنت! اضغط التالي للمتابعة.';

  @override
  String holdPrompt(String top, String front) {
    return 'أمسك المكعب بحيث يكون المركز $top في الأعلى والمركز $front مواجهًا لك.';
  }

  @override
  String get trackBeginner => '3×3 للمبتدئين: التيجان الثلاثة';

  @override
  String get trackCfop => 'مقدمة إلى CFOP';

  @override
  String get trackTwoByTwo => '2×2 للمبتدئين وطريقة Ortega';

  @override
  String get trackBigCubes => 'المكعبات الكبيرة: الاختزال والتكافؤ';

  @override
  String moveSentence(String layer, String direction) {
    return 'أدر $layer $direction';
  }

  @override
  String get moveFaceR => 'الوجه الأيمن';

  @override
  String get moveFaceL => 'الوجه الأيسر';

  @override
  String get moveFaceU => 'الوجه العلوي';

  @override
  String get moveFaceD => 'الوجه السفلي';

  @override
  String get moveFaceF => 'الوجه الأمامي';

  @override
  String get moveFaceB => 'الوجه الخلفي';

  @override
  String moveLayerInner(int depth, String face) {
    return 'الطبقة $depth بدءًا من $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face (بعمق $depth طبقات)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'الطبقات $near–$far بدءًا من $face';
  }

  @override
  String get moveLayerMiddle => 'الطبقة الوسطى';

  @override
  String get moveDirUp => 'إلى الأعلى';

  @override
  String get moveDirDown => 'إلى الأسفل';

  @override
  String get moveDirLeft => 'إلى اليسار';

  @override
  String get moveDirRight => 'إلى اليمين';

  @override
  String get moveDirClockwise => 'باتجاه عقارب الساعة';

  @override
  String get moveDirCounter => 'عكس اتجاه عقارب الساعة';

  @override
  String get moveDirBackClockwise => 'باتجاه عقارب الساعة، كما يُرى من الخلف';

  @override
  String get moveDirBackCounter => 'عكس اتجاه عقارب الساعة، كما يُرى من الخلف';

  @override
  String get moveDirHalf => 'نصف دورة (مرتين)';

  @override
  String get moveRotateX => 'أمِل المكعب كله: يصعد الوجه الأمامي إلى الأعلى';

  @override
  String get moveRotateXPrime =>
      'أمِل المكعب كله: ينزل الوجه الأمامي إلى الأسفل';

  @override
  String get moveRotateX2 => 'اقلب المكعب كله: ينتقل الوجه الأمامي إلى الخلف';

  @override
  String get moveRotateY => 'أدر المكعب كله: ينتقل الوجه الأمامي إلى اليسار';

  @override
  String get moveRotateYPrime =>
      'أدر المكعب كله: ينتقل الوجه الأمامي إلى اليمين';

  @override
  String get moveRotateY2 =>
      'أدر المكعب كله نصف دورة: يأتي الوجه الخلفي إلى الأمام';

  @override
  String get moveRotateZ =>
      'دحرج المكعب كله باتجاه عقارب الساعة: ينتقل الأعلى إلى اليمين';

  @override
  String get moveRotateZPrime =>
      'دحرج المكعب كله عكس اتجاه عقارب الساعة: ينتقل الأعلى إلى اليسار';

  @override
  String get moveRotateZ2 =>
      'اقلب المكعب كله رأسًا على عقب: ينتقل الأعلى إلى الأسفل';

  @override
  String get phaseReductionCenters => 'المراكز';

  @override
  String get phaseReductionEdges => 'إقران الحواف';

  @override
  String get phaseReductionEdgeParity => 'تكافؤ الحواف';

  @override
  String get phaseReductionOllParity => 'تكافؤ OLL';

  @override
  String get phaseReductionPllParity => 'تكافؤ PLL';

  @override
  String get explainReductionCenterBlock =>
      'دورات شرائح تعيد عدة قطع مركزية إلى مكانها دفعة واحدة.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'انقل قطعة مركزية ($piece) إلى وجهها بدورة ثلاثية لا تمس المراكز المكتملة.';
  }

  @override
  String get explainReductionParityCenters =>
      'أعد بناء المراكز التي حرّكتها دورة التكافؤ.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'اجمع قطع الحافة ($piece) بدورة ثلاثية؛ تبقى المراكز محلولة.';
  }

  @override
  String get explainReductionEdgeParity =>
      'لا يمكن إقران آخر الحواف بالدورات الثلاثية وحدها (تكافؤ الحواف). دورة واحدة لشريحة داخلية تصلح ذلك.';

  @override
  String get explainReductionOllParity =>
      'تكافؤ OLL: هناك حافة مقلوبة، وهذا مستحيل في مكعب 3×3. هذه الخوارزمية تعيد قلبها.';

  @override
  String get explainReductionPllParity =>
      'تكافؤ PLL: هناك حافتان متبادلتان، وهذا مستحيل في مكعب 3×3. هذه الخوارزمية تعيدهما إلى مكانيهما.';

  @override
  String get patternsTitle => 'مكتبة الأنماط';

  @override
  String get patternsHint => 'اضغط على نمط لمشاهدته، ثم طبّقه على مكعبك.';

  @override
  String get patternCheckerboard => 'رقعة الشطرنج';

  @override
  String get patternCubeInCube => 'مكعب داخل مكعب';

  @override
  String get patternSuperflip => 'سوبرفليب';

  @override
  String get patternDots => 'النقاط';

  @override
  String get patternCross => 'الصليب';

  @override
  String get patternPython => 'الثعبان';

  @override
  String get phasePattern => 'كوّن النمط';

  @override
  String get explainPatternStep =>
      'طبّق كل حركة على مكعبك. اضغط حُلّ لإعادته إلى حالته الطبيعية.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'مؤقت السرعة';

  @override
  String get timerHoldToStart => 'اضغط مطولًا ثم ارفع إصبعك للبدء';

  @override
  String get timerReleaseToStart => 'ارفع إصبعك للبدء';

  @override
  String get timerTapToStop => 'اضغط في أي مكان للإيقاف';

  @override
  String get timerInspecting => 'الفحص: اضغط مطولًا ثم ارفع إصبعك للبدء';

  @override
  String get timerTapToInspect => 'اضغط لبدء فحص مدته 15 ثانية';

  @override
  String get timerInspectionToggle => 'فحص 15 ث';

  @override
  String get timerNewScramble => 'بعثرة جديدة';

  @override
  String get timerLoadingScramble => 'جارٍ إنشاء بعثرة…';

  @override
  String get timerPb => 'الأفضل';

  @override
  String get timerSolves => 'الحلول';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'حذف';

  @override
  String get timerHistory => 'السجل';

  @override
  String get timerNoSolves => 'لا توجد حلول بعد. ابعثر مكعبك وانطلق!';

  @override
  String get timerNewPb => 'رقم قياسي شخصي جديد!';

  @override
  String get timerClearHistory => 'مسح السجل';

  @override
  String get timerScrambleHint =>
      'اجعل الأبيض في الأعلى والأخضر في الأمام، ثم ابعثر:';

  @override
  String get dailyTitle => 'التحدي اليومي';

  @override
  String dailyFor(String date) {
    return 'تحدي $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'أفضل سلسلة: $count';
  }

  @override
  String get dailyDone => 'أنجزت تحدي اليوم! عُد غدًا.';

  @override
  String get dailyNotDone => 'حُلّ بعثرة اليوم للحفاظ على سلسلتك.';

  @override
  String get dailySolveVirtual => 'الحل على المكعب ثلاثي الأبعاد';

  @override
  String get dailyTimeIt => 'احسب الوقت على مكعبك';

  @override
  String get dailyHint => 'تلميح';

  @override
  String dailyHintText(String moves) {
    return 'ابدأ بالصليب الأبيض: $moves';
  }

  @override
  String get dailyHintFailed => 'لا يتوفر تلميح الآن.';

  @override
  String get lessonBasics => 'تعرّف على المكعب';

  @override
  String get lessonBasicsDesc => 'القطع والأوجه وأسماء الحركات.';

  @override
  String get stepBasicsPieces => 'ثلاثة أنواع من القطع';

  @override
  String get stepBasicsPiecesBody =>
      'المراكز لا تتحرك أبدًا وهي التي تحدد لون كل وجه. للحواف لونان، وللزوايا ثلاثة ألوان. الحل يعني نقل كل حافة وكل زاوية بجانب المراكز المطابقة لألوانها.';

  @override
  String get stepBasicsFaces => 'ستة أحرف للأوجه';

  @override
  String get stepBasicsFacesBody =>
      '⁦R⁩ و⁦L⁩ و⁦U⁩ و⁦D⁩ و⁦F⁩ و⁦B⁩ هي الأوجه: الأيمن والأيسر والعلوي والسفلي والأمامي والخلفي. الحرف وحده يعني ربع دورة باتجاه عقارب الساعة، كما لو كنت تنظر إلى ذلك الوجه مباشرة.';

  @override
  String get stepBasicsPrime => 'الدورات العكسية والمزدوجة';

  @override
  String get stepBasicsPrimeBody =>
      'الفاصلة العليا (⁦R\'⁩) تعني الدوران في الاتجاه الآخر، عكس عقارب الساعة. والرقم 2 (⁦U2⁩) يعني نصف دورة: ربعا دورة.';

  @override
  String get stepCrossGoal => 'الهدف';

  @override
  String get stepCrossGoalBody =>
      'اجعل الأصفر في الأعلى. تحيط الحواف البيضاء الأربع بالمركز الأبيض في الأسفل، ويطابق اللون الجانبي لكل منها المركز المجاور لها.';

  @override
  String get stepCrossTop => 'حافة في الأعلى';

  @override
  String get stepCrossTopBody =>
      'ابحث عن حافة بيضاء في الأعلى. أدر الطبقة العليا حتى يصبح لونها الجانبي فوق المركز المطابق، ثم أدر ذلك الوجه مرتين لإنزالها.';

  @override
  String get stepCrossMiddle => 'حافة في الوسط';

  @override
  String get stepCrossMiddleBody =>
      'الحافة العالقة في الطبقة الوسطى تُرفع أولًا: أدر وجهها الجانبي إلى الأعلى، وأبعد الطبقة العليا عن الطريق، ثم أعد الوجه الجانبي حتى يبقى الصليب سليمًا. بعد ذلك ضعها من الأعلى.';

  @override
  String get stepCornersInsert => 'فوق مكانها';

  @override
  String get stepCornersInsertBody =>
      'أدر الطبقة العليا حتى تصبح زاوية بيضاء فوق المكان الذي تنتمي إليه ألوانها، في الأمام يمينًا. الخوارزمية ⁦R U R\' U\'⁩ تُنزلها إلى مكانها.';

  @override
  String get stepCornersRepeat => 'كرّر الحركة';

  @override
  String get stepCornersRepeatBody =>
      'إذا كان الأبيض متجهًا إلى الجهة الخطأ، فاستمر في تكرار ⁦R U R\' U\'⁩ فوق المكان نفسه. تُحل كل زاوية بخمس تكرارات على الأكثر.';

  @override
  String get stepMiddleRight => 'حافة إلى اليمين';

  @override
  String get stepMiddleRightBody =>
      'حاذِ حافة علوية مع مركزها في الوجه الأمامي. إذا طابق لونها العلوي المركز الأيمن، فأدخلها باستخدام ⁦U R U\' R\' U\' F\' U F⁩.';

  @override
  String get stepMiddleLeft => 'حافة إلى اليسار';

  @override
  String get stepMiddleLeftBody =>
      'إذا طابق لونها العلوي المركز الأيسر بدلًا من ذلك، فاستخدم الخوارزمية المعكوسة: ⁦U\' L\' U L U F U\' F\'⁩.';

  @override
  String get stepYellowCross => 'خوارزمية واحدة';

  @override
  String get stepYellowCrossBody =>
      'الخوارزمية ⁦F R U R\' U\' F\'⁩ تحوّل النقطة الصفراء إلى شكل ⁦L⁩، وشكل ⁦L⁩ إلى خط، والخط إلى صليب. أمسك شكل ⁦L⁩ في الخلف يسارًا، والخط أفقيًا.';

  @override
  String get stepYellowEdges => 'طابق الحواف';

  @override
  String get stepYellowEdgesBody =>
      'أدر الطبقة العليا حتى تطابق حافتان مركزيهما. عندما تكون إحداهما في الخلف والأخرى على اليمين، تبدّل ⁦R U R\' U R U2 R\' U⁩ الحافتين الأخريين.';

  @override
  String get stepPlaceCorners => 'رتّبها';

  @override
  String get stepPlaceCornersBody =>
      'أمسك زاوية موجودة في مكانها الصحيح في الأمام يمينًا. الخوارزمية ⁦U R U\' L\' U R\' U\' L⁩ تنقل الزوايا الثلاث الأخرى؛ كرّرها حتى تستقر الزوايا الأربع في أماكنها.';

  @override
  String get stepTwistCorners => 'دوّرها';

  @override
  String get stepTwistCornersBody =>
      'بوجود زاوية غير محلولة في الأمام يمينًا، كرّر ⁦R\' D\' R D⁩ حتى يصبح الأصفر في الأعلى، ثم أدر الطبقة العليا فقط لإحضار الزاوية التالية. ستبدو الطبقة السفلى مبعثرة حتى النهاية تمامًا: استمر.';

  @override
  String get lessonCfopIntro => 'ما هي طريقة CFOP؟';

  @override
  String get lessonCfopIntroDesc => 'الصليب، F2L، OLL، PLL.';

  @override
  String get stepCfopOverview => 'أربع مراحل';

  @override
  String get stepCfopOverviewBody =>
      'يحل لاعبو السرعة الصليب أولًا، ثم يقرنون كل زاوية من الطبقة الأولى بحافتها الوسطى (F2L)، ثم يوجّهون الطبقة الأخيرة (OLL)، وأخيرًا يرتّبون قطعها (PLL).';

  @override
  String get stepCfopCross => 'خطّط للصليب';

  @override
  String get stepCfopCrossBody =>
      'في طريقة CFOP يُخطَّط للصليب أثناء الفحص ويُبنى في الأسفل في نحو ثماني حركات.';

  @override
  String get lessonF2l => 'أساسيات F2L';

  @override
  String get lessonF2lDesc => 'اقرن زاوية بحافتها.';

  @override
  String get stepF2lRight => 'أدخل زوجًا';

  @override
  String get stepF2lRightBody =>
      'عندما تكون زاوية وحافتها متجاورتين في الأعلى، أحضرهما فوق موضعهما وأدخلهما معًا.';

  @override
  String get stepF2lLeft => 'زوج على اليسار';

  @override
  String get stepF2lLeftBody =>
      'الحالة نفسها على الجهة الأخرى هي الصورة المعكوسة، ⁦U\' L\' U L⁩. تدوير المكعب (⁦y⁩) يتيح لك استخدام اليد الأسهل.';

  @override
  String get lessonOll => 'OLL على مرحلتين';

  @override
  String get lessonOllDesc => 'اجعل الوجه العلوي أصفر.';

  @override
  String get stepOllCross => 'الحواف أولًا';

  @override
  String get stepOllCrossBody =>
      'تبدأ طريقة OLL على مرحلتين بخوارزمية الصليب الأصفر التي تعرفها بالفعل.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'عندما تكون زاوية صفراء واحدة متجهة إلى الأعلى في الأمام يسارًا، توجّه خوارزمية Sune (⁦R U R\' U R U2 R\'⁩) الزوايا الثلاث الأخرى. معظم الحالات الأخرى تستخدم Sune وصورتها المعكوسة.';

  @override
  String get lessonPll => 'PLL على مرحلتين';

  @override
  String get lessonPllDesc => 'أنهِ المكعب.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'خوارزمية T-perm تبدّل زاويتين وحافتين. استخدمها لترتيب الزوايا: أمسك الزاويتين اللتين يجب تبديلهما على اليمين.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'بعد ترتيب الزوايا، تنقل خوارزمية U-perm ثلاث حواف دوريًا. أبقِ الجانب المكتمل في الخلف.';

  @override
  String get lessonTwoFirst => 'الطبقة الأولى في 2×2';

  @override
  String get lessonTwoFirstDesc => 'كوّن وجهًا بزوايا متطابقة.';

  @override
  String get stepTwoIntro => 'زوايا فقط';

  @override
  String get stepTwoIntroBody =>
      'مكعب 2×2 هو مكعب 3×3 بلا حواف ولا مراكز. اختر لونًا، وكوّن ذلك الوجه في الأسفل، واجعل الألوان الجانبية للزوايا المتجاورة متطابقة.';

  @override
  String get stepTwoCorner => 'أدخل الزوايا';

  @override
  String get stepTwoCornerBody =>
      'تمامًا مثل الزوايا البيضاء في 3×3: أحضر الزاوية فوق مكانها واستخدم ⁦R U R\' U\'⁩ حتى تستقر.';

  @override
  String get lessonTwoOll => 'وجّه الوجه العلوي';

  @override
  String get lessonTwoOllDesc => 'OLL بطريقة Ortega مع Sune.';

  @override
  String get stepTwoSune => 'Sune مرة أخرى';

  @override
  String get stepTwoSuneBody =>
      'خوارزمية Sune تجعل الوجه العلوي أصفر في 2×2 أيضًا. من يستخدم طريقة Ortega يتعلم سبع حالات قصيرة؛ وتغطي Sune وصورتها المعكوسة معظمها.';

  @override
  String get lessonTwoPbl => 'رتّب الطبقتين';

  @override
  String get lessonTwoPblDesc => 'بدّل الزوايا لإنهاء الحل.';

  @override
  String get stepTwoAdjacent => 'تبديل متجاور';

  @override
  String get stepTwoAdjacentBody =>
      'عندما يجب تبديل زاويتين علويتين متجاورتين، أمسكهما على اليمين واستخدم T-perm.';

  @override
  String get stepTwoDiagonal => 'تبديل قطري';

  @override
  String get stepTwoDiagonalBody =>
      'تُبدَّل زاويتان في موضعين متقابلين باستخدام Y-perm.';

  @override
  String get lessonBigIntro => 'قطع المكعبات الكبيرة';

  @override
  String get lessonBigIntroDesc => 'المراكز والأجنحة والشرائح.';

  @override
  String get stepBigPieces => 'لا مراكز ثابتة';

  @override
  String get stepBigPiecesBody =>
      'في مكعب 4×4 لكل وجه أربع قطع مركزية متحركة، وكل حافة مكوّنة من جناحين. يجمعها الاختزال حتى يتصرف المكعب كمكعب 3×3.';

  @override
  String get stepBigSlices => 'الدورات العريضة والداخلية';

  @override
  String get stepBigSlicesBody =>
      '⁦Rw⁩ تدير الطبقتين اليمنيين معًا. ⁦2R⁩ تدير الطبقة الثانية من اليمين فقط. هذه الدورات تحرّك المراكز والأجنحة.';

  @override
  String get lessonBigCenters => 'المراكز';

  @override
  String get lessonBigCentersDesc => 'اجمع القطع المركزية.';

  @override
  String get stepBigCenterCycle => 'دورة ثلاثية للمراكز';

  @override
  String get stepBigCenterCycleBody =>
      'هذا المبادل يحرّك ثلاث قطع مركزية بالضبط ولا يمس أي شيء آخر، لذا تبقى المراكز المكتملة مكتملة.';

  @override
  String get lessonBigEdges => 'إقران الحواف';

  @override
  String get lessonBigEdgesDesc => 'اجمع الأجنحة في حواف كاملة.';

  @override
  String get stepBigEdgePair => 'اقرن واستعد';

  @override
  String get stepBigEdgePairBody =>
      '⁦Uw\'⁩ تحاذي جناحين متطابقين، و⁦R U R\' F R\' F\' R⁩ تُدخل حافة غير مقترنة، و⁦Uw⁩ تعيد المراكز إلى مكانها.';

  @override
  String get lessonBigParity => 'التكافؤ';

  @override
  String get lessonBigParityDesc => 'تكافؤ OLL وPLL في المكعبات الزوجية.';

  @override
  String get stepBigOllParity => 'تكافؤ OLL';

  @override
  String get stepBigOllParityBody =>
      'حافة واحدة مقلوبة أمر مستحيل في مكعب 3×3. في المكعبات الزوجية تعيد هذه الخوارزمية قلب الحافة العلوية الأمامية. قد تبعثر بقية الطبقة العليا، وهو ما تصلحه خطوات 3×3 الأخيرة على أي حال.';

  @override
  String get stepBigPllParity => 'تكافؤ PLL';

  @override
  String get stepBigPllParityBody =>
      'حافتان متبادلتان في النهاية تمامًا؟ الخوارزمية ⁦2R2 U2 2R2 Uw2 2R2 Uw2⁩ تبدّل الحافتين العلويتين الأمامية والخلفية.';

  @override
  String get introGoalHeading => 'ما الهدف؟';

  @override
  String get introHowHeading => 'كيف نفعل ذلك؟';

  @override
  String get introStart => 'فهمت، لنبدأ خطوة بخطوة';

  @override
  String get introShowGoal => 'عرض الهدف';

  @override
  String get introStateStart => 'البداية';

  @override
  String get introStateGoal => 'الهدف';

  @override
  String get introPlayMorph => 'تشغيل من البداية إلى الهدف';

  @override
  String get introGoalBasics =>
      'تعلّم قراءة المكعب: قطعه ووجوهه الستة وكيف تديرها حروف الحركات.';

  @override
  String get introGoalCross =>
      'كوّن صليبًا أبيض تطابق فيه كل حافة بيضاء أيضًا لون المركز المجاور لها.';

  @override
  String get introGoalCorners =>
      'أكمل الزوايا البيضاء الأربع ليكتمل التاج الأول، أي الطبقة البيضاء كلها.';

  @override
  String get introGoalMiddle =>
      'ضع حواف الطبقة الوسطى الأربع لتُحل الطبقتان الأوليان.';

  @override
  String get introGoalYellowCross =>
      'كوّن صليبًا أصفر في الأعلى؛ لا يلزم أن تتطابق الألوان الجانبية بعد.';

  @override
  String get introGoalYellowEdges =>
      'حاذِ كل حافة من حواف الصليب الأصفر مع لون المركز على جانبها.';

  @override
  String get introGoalYellowCorners =>
      'انقل كل زاوية صفراء إلى مكانها، حتى لو كانت ما تزال ملتوية.';

  @override
  String get introGoalTwistCorners =>
      'أدر الزوايا الصفراء إلى ألوانها الصحيحة ليُحل المكعب كله.';

  @override
  String get introGoalCfopIntro =>
      'تعرّف على خطة الحل السريع: الصليب، ثم الطبقتان الأوليان، ثم الطبقة الأخيرة على مرحلتين.';

  @override
  String get introGoalF2l =>
      'أدخل كل زاوية بيضاء مع حافتها الوسطى لتنهي طبقتين دفعة واحدة.';

  @override
  String get introGoalOll => 'اجعل الوجه العلوي كله أصفر بخوارزمية أو اثنتين.';

  @override
  String get introGoalPll =>
      'انقل قطع الطبقة الأخيرة إلى أماكنها لتنهي المكعب.';

  @override
  String get introGoalTwoFirst => 'ابنِ طبقة بيضاء كاملة على مكعب 2×2.';

  @override
  String get introGoalTwoOll => 'اجعل الوجه العلوي لمكعب 2×2 أصفر بالكامل.';

  @override
  String get introGoalTwoPbl =>
      'بدّل الزوايا الأخيرة إلى أماكنها لتحل مكعب 2×2.';

  @override
  String get introGoalBigIntro =>
      'تعرّف على مكعب 4×4: المراكز وأزواج الحواف والزوايا، والحركات التي تديرها.';

  @override
  String get introGoalBigCenters =>
      'اجمع القطع المركزية لكل وجه في كتلة واحدة من لون واحد.';

  @override
  String get introGoalBigEdges =>
      'اجمع قطع الحواف المتطابقة أزواجًا لتبدو كل حافة مثل حافة واحدة في 3×3.';

  @override
  String get introGoalBigParity =>
      'أصلح حالتي 4×4 اللتين لا تحدثان في 3×3: حافة مقلوبة واحدة أو حافتان متبادلتان.';

  @override
  String get introHowBasics =>
      'المراكز لا تتحرك أبدًا، لذا فهي تحدد لون كل وجه.\nكل حرف يدير وجهًا واحدًا ربع دورة باتجاه عقارب الساعة.\nالفاصلة العليا (⁦\'⁩) تدير بالعكس، والرقم 2 يدير مرتين.';

  @override
  String get introHowCross =>
      'أمسك المكعب والأصفر في الأعلى: الصليب الأبيض يُبنى في الأسفل.\nابحث عن حافة بيضاء وحاذِ لونها الجانبي مع المركز المناسب.\nأدر ذلك الوجه مرتين لتنزل الحافة إلى مكانها.';

  @override
  String get introHowCorners =>
      'أحضر زاوية بيضاء فوق مكانها الفارغ.\nكرّر ⁦R U R\' U\'⁩ حتى تدخل في الاتجاه الصحيح.\nافعل الشيء نفسه مع الزوايا الثلاث الأخرى.';

  @override
  String get introHowMiddle =>
      'ابحث عن حافة علوية بلا أصفر وطابق لونها الأمامي مع مركز.\nأرسلها يمينًا أو يسارًا بخوارزمية قصيرة من 8 حركات.\nتعود الطبقة البيضاء سليمة في كل مرة.';

  @override
  String get introHowYellowCross =>
      'انظر إلى الأعلى: نقطة أو شكل L أو خط.\nأمسكه كما في الصورة ونفّذ ⁦F R U R\' U\' F\'⁩.\nكرّر حتى يظهر الصليب الأصفر.';

  @override
  String get introHowYellowEdges =>
      'أدر الطبقة العليا حتى تطابق حافتان مركزيهما.\nضعهما في الخلف واليمين ثم نفّذ ⁦R U R\' U R U2 R\' U⁩.\nكرّر حتى تتطابق الحواف الأربع.';

  @override
  String get introHowYellowCorners =>
      'تكون الزاوية في مكانها عندما تطابق ألوانها الوجوه الثلاثة حولها.\nاترك زاوية صحيحة المكان في الأمام يمينًا.\nالخوارزمية ⁦U R U\' L\' U R\' U\' L⁩ تدوّر الزوايا الثلاث الأخرى حتى تستقر كلها.';

  @override
  String get introHowTwistCorners =>
      'أمسك زاوية غير محلولة في الأمام يمينًا.\nكرّر ⁦R\' D\' R D⁩ حتى يصبح لونها الأصفر في الأعلى.\nأدر الطبقة العليا فقط للزاوية التالية؛ الطبقة السفلى تُصلح نفسها في النهاية.';

  @override
  String get introHowCfopIntro =>
      'الصليب: أربع حواف تُخطط لها أثناء الفحص.\nF2L: تدخل كل زاوية مع حافتها معًا.\nOLL يجعل الوجه العلوي أصفر، ثم PLL يعيد القطع إلى أماكنها.';

  @override
  String get introHowF2l =>
      'ابحث عن زاوية والحافة المطابقة لها في الطبقة العليا.\nاجمعهما زوجًا فوق خانتهما.\nأدخل الزوج بثلاث أو أربع حركات.';

  @override
  String get introHowOll =>
      'أولًا الصليب الأصفر بـ ⁦F R U R\' U\' F\'⁩.\nثم وجّه الزوايا، مثلًا بخوارزمية Sune.\nتعرّف على الحالة من شكل الأصفر الذي تراه.';

  @override
  String get introHowPll =>
      'الوجه العلوي أصفر بالكامل بالفعل.\nT-perm يبدّل الزوايا، وU-perm يدوّر ثلاث حواف.\nاقرأ الألوان الجانبية لتختار الخوارزمية.';

  @override
  String get introHowTwoFirst =>
      'مكعب 2×2 زوايا فقط، مثل 3×3 بلا حواف.\nأحضر كل زاوية بيضاء فوق مكانها.\nكرّر ⁦R U R\' U\'⁩ حتى تدخل.';

  @override
  String get introHowTwoOll =>
      'أبقِ الطبقة البيضاء في الأسفل.\nخوارزمية Sune ‏(⁦R U R\' U R U2 R\'⁩) تدير الزوايا العلوية.\nكرّر من الزاوية الصحيحة حتى يصبح الأعلى كله أصفر.';

  @override
  String get introHowTwoPbl =>
      'ابحث عن جانب فيه زاويتان متطابقتان بالفعل.\nتبديل متجاور: خوارزمية واحدة على نمط T-perm.\nتبديل قطري: خوارزمية واحدة أطول قليلًا.';

  @override
  String get introHowBigIntro =>
      'لا يوجد مركز ثابت: أربع قطع مركزية تكوّن لون كل وجه.\nالحركات العريضة مثل ⁦Rw⁩ تدير طبقتين معًا.\nالحركات الداخلية مثل ⁦2R⁩ تدير شريحة داخلية واحدة فقط.';

  @override
  String get introHowBigCenters =>
      'ابنِ مركزين متقابلين أولًا.\nالشرائح الداخلية تبدّل القطع المركزية دون إفساد المراكز المكتملة.\nأكمل المراكز الأربعة الأخيرة بالطريقة نفسها.';

  @override
  String get introHowBigEdges =>
      'ابحث عن قطعتي حافة بالألوان نفسها.\nحاذِهما جنبًا إلى جنب بشريحة داخلية.\nأبعد الزوج جانبًا وأعد المراكز.';

  @override
  String get introHowBigParity =>
      'حل مكعب 4×4 مثل 3×3 حتى تتوقف.\nحافة مقلوبة واحدة: خوارزمية تكافؤ OLL الطويلة.\nحافتان متبادلتان: ⁦2R2 U2 2R2 Uw2 2R2 Uw2⁩.';
}
