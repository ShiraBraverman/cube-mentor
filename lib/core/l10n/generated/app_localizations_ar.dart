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
  String get solveModeGuided => 'موجَّه (3 طبقات)';

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
  String get phaseLblCorners => 'زوايا الطبقة الأولى';

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
  String get crownFirst => 'الطبقة الأولى';

  @override
  String get crownSecond => 'الطبقة الثانية';

  @override
  String get crownThird => 'الطبقة الثالثة';

  @override
  String get crownFirstGoal => 'الوجه الأبيض والطبقة الأولى';

  @override
  String get crownSecondGoal => 'الطبقة الوسطى';

  @override
  String get crownThirdGoal => 'الوجه الأصفر والطبقة الأخيرة';

  @override
  String get subStepGoal11 =>
      'كوّن صليبًا أبيض تطابق فيه كل حافة بيضاء أيضًا لون المركز المجاور لها.';

  @override
  String get subStepGoal12 =>
      'أدخِل الزوايا البيضاء الأربع في أماكنها المطابقة لتُكمل الوجه الأبيض والطبقة الأولى كلها.';

  @override
  String get subStepGoal21 =>
      'أدخِل حواف الطبقة الوسطى الأربع دون أن تُفسد الطبقة الأولى.';

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
  String explainLblDaisyPetal(String piece) {
    return 'زهرة الأقحوان: اصعد بالحافة ($piece) حول المركز الأصفر والأبيض للأعلى، لتصبح بتلة.';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return 'أدر الطبقة العليا حتى تصبح البتلة ($piece) فوق مركز لونها الجانبي تمامًا.';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return 'أدر ذلك الوجه مرتين (180°) لتنزل الحافة ($piece) على المركز الأبيض: ذراع أخرى من الصليب الأبيض.';
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
  String lessonPartOf(int index, int total) {
    return 'الجزء $index من $total';
  }

  @override
  String get lessonNext => 'التالي';

  @override
  String get lessonPrevious => 'السابق';

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
      'دورك: اسحب الطبقة التي يشير إليها السهم، أو اضغط التالي.';

  @override
  String get lessonLookAround => 'اسحب الخلفية لرؤية المكعب من كل الجهات.';

  @override
  String get lessonDemoDone => 'أحسنت! اضغط التالي للمتابعة.';

  @override
  String holdPrompt(String top, String front) {
    return 'أمسك المكعب بحيث يكون المركز $top في الأعلى والمركز $front مواجهًا لك.';
  }

  @override
  String get trackBeginner => '3×3 للمبتدئين: طبقة بعد طبقة';

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
  String get timerInspectionToggle => 'فحص 15 ث';

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
      'أمسك الأصفر في الأعلى والأخضر مواجهًا لك. اجمع أولًا الحواف البيضاء الأربع حول المركز الأصفر، والأبيض للأعلى، كالبتلات: هذه زهرة الأقحوان. ثم تنزل كل بتلة إلى المركز الأبيض ولونها الجانبي يطابق المركز المجاور.';

  @override
  String get stepCrossTop => 'حافة في الأعلى';

  @override
  String get stepCrossTopBody =>
      'الحافة البيضاء في الأعلى التي يتجه أبيضها للأعلى هي بتلة في زهرة الأقحوان. أدر الطبقة العليا حتى يصبح لونها الجانبي فوق المركز ذي اللون نفسه، ثم أدر ذلك الوجه 180° لتنزل على المركز الأبيض.';

  @override
  String get stepCrossMiddle => 'حافة في الوسط';

  @override
  String get stepCrossMiddleBody =>
      'الحافة العالقة في الطبقة الوسطى تصعد أولًا: ارفع جانبها، وأزِح الطبقة العليا، وأعِد الجانب، فتبقى القطع الموضوعة مكانها. صارت الآن بتلة في الأعلى: حاذِها وأدر ذلك الوجه 180°.';

  @override
  String get stepCornersInsert => 'فوق مكانها';

  @override
  String get stepCornersInsertBody =>
      'أدر الطبقة العليا حتى تصبح الزاوية البيضاء فوق مكانها، بين المركزين المطابقين لألوانها الجانبية. هنا تكفي دورة علوية و⁦R U\' R\'⁩: ⁦U⁩ تضع الزاوية فوق مكانها و⁦R U\' R\'⁩ تُدخلها والأبيض للأسفل.';

  @override
  String get stepCornersRepeat => 'كرّر الحركة';

  @override
  String get stepCornersRepeatBody =>
      'أمسك المكان في الأمام يمينًا وكرر ⁦R U R\' U\'⁩ حتى يتجه الأبيض للأسفل: مرة إن كان الأبيض لليمين، وثلاثًا إن كان للأعلى، وخمسًا إن كان نحوك. يبدو الأعلى مبعثرًا في الأثناء ثم يترتب وحده.';

  @override
  String get stepMiddleRight => 'حافة إلى اليمين';

  @override
  String get stepMiddleRightBody =>
      'ابحث عن حافة علوية بلا أصفر. أدر الطبقة العليا حتى يطابق لونها الأمامي المركز المواجه لك. إن طابق لونها العلوي المركز الأيمن، أرسلها يمينًا: ⁦U R U\' R\' U\' F\' U F⁩.';

  @override
  String get stepMiddleLeft => 'حافة إلى اليسار';

  @override
  String get stepMiddleLeftBody =>
      'وإن طابق لونها العلوي المركز الأيسر، استخدم المعكوسة: ⁦U\' L\' U L U F U\' F\'⁩. تعود الطبقة البيضاء كاملة كل مرة.';

  @override
  String get stepYellowCross => 'خوارزمية واحدة';

  @override
  String get stepYellowCrossBody =>
      'انظر فقط إلى الحواف الصفراء في الأعلى. أمسك الـL في الخلف يسارًا والخط من اليسار إلى اليمين، ثم نفّذ ⁦F R U R\' U\' F\'⁩. الخط يحتاجها مرة، والـL مرتين، والنقطة حتى ثلاث مرات.';

  @override
  String get stepYellowEdges => 'طابق الحواف';

  @override
  String get stepYellowEdgesBody =>
      'أدر الطبقة العليا حتى تطابق حافتان مركزيهما الجانبيين. حين تكون واحدة في الخلف وأخرى على اليمين، تبادل ⁦R U R\' U R U2 R\' U⁩ الحافتين الأمامية واليسرى.';

  @override
  String get stepPlaceCorners => 'رتّبها';

  @override
  String get stepPlaceCornersBody =>
      'تكون الزاوية في مكانها حين تطابق ألوانها المراكز الثلاثة حولها، حتى لو كانت ملتوية. أمسك زاوية في مكانها في الأمام يمينًا: ⁦U R U\' L\' U R\' U\' L⁩ تدوّر الثلاث الأخرى. كرر حتى تستقر الأربع.';

  @override
  String get stepTwistCorners => 'دوّرها';

  @override
  String get stepTwistCornersBody =>
      'مع زاوية غير محلولة في الأمام يمينًا، كرر ⁦R\' D\' R D⁩ أزواجًا حتى يصبح الأصفر في الأعلى، ثم أدر الطبقة العليا فقط لتأتي بالتالية. يبدو الأسفل مكسورًا حتى آخر زاوية: استمر.';

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
      'المكعب 2×2 مجرد ثماني زوايا: بلا حواف ولا مراكز. ابنِ الطبقة البيضاء في الأسفل بحيث تتطابق الألوان الجانبية المتجاورة، ثم أكمِل بمسار واحد: ⁦Sune⁩ لأعلى أصفر، ثم ⁦T-perm⁩ أو ⁦Y-perm⁩.';

  @override
  String get stepTwoCorner => 'أدخل الزوايا';

  @override
  String get stepTwoCornerBody =>
      'مثل الزوايا البيضاء في 3×3: أحضر زاوية فوق مكانها الفارغ في الأمام يمينًا وأدخلها، هنا بـ⁦U R U\' R\'⁩ أو بتكرار ⁦R U R\' U\'⁩ حتى يتجه الأبيض للأسفل. قارن ألوانها الجانبية بجارتها.';

  @override
  String get lessonTwoOll => 'وجّه الوجه العلوي';

  @override
  String get lessonTwoOllDesc => 'OLL بطريقة Ortega مع Sune.';

  @override
  String get stepTwoSune => 'Sune مرة أخرى';

  @override
  String get stepTwoSuneBody =>
      'عُدّ الملصقات الصفراء المتجهة للأعلى. أمسك الزاوية الوحيدة ذات الأصفر العلوي في الأمام يسارًا ونفّذ ⁦Sune⁩ ‏(⁦R U R\' U R U2 R\'⁩). عُدّ وأعِد الإمساك؛ ثلاث مرات على الأكثر. بينها أدر الطبقة العليا فقط.';

  @override
  String get lessonTwoPbl => 'رتّب الطبقتين';

  @override
  String get lessonTwoPblDesc => 'بدّل الزوايا لإنهاء الحل.';

  @override
  String get stepTwoAdjacent => 'تبديل متجاور';

  @override
  String get stepTwoAdjacentBody =>
      'المصابيح الأمامية ملصقان علويان متطابقان في جانب واحد. أدر الطبقة العليا حتى تصبح المصابيح على اليسار، فتكون الزاويتان المراد تبديلهما على اليمين، ثم نفّذ ⁦T-perm⁩.';

  @override
  String get stepTwoDiagonal => 'تبديل قطري';

  @override
  String get stepTwoDiagonalBody =>
      'عدم وجود مصابيح في أي جانب يعني أن زاويتين قطريتين يجب أن تتبادلا: نفّذ ⁦Y-perm⁩ من أي جهة، ثم أدر الطبقة العليا لتحاذي كل شيء.';

  @override
  String get lessonBigIntro => 'قطع المكعبات الكبيرة';

  @override
  String get lessonBigIntroDesc => 'المراكز والأجنحة والشرائح.';

  @override
  String get stepBigPieces => 'لا مراكز ثابتة';

  @override
  String get stepBigPiecesBody =>
      'في 4×4 لكل وجه أربع قطع مركزية تتحرك، وكل حافة جناحان. لا يوجد مركز ثابت، فتحقق من ترتيب الألوان على زاوية: الأبيض مقابل الأصفر، والأزرق مقابل الأخضر، والأحمر مقابل البرتقالي.';

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
      'هذا المبدِّل يحرك ثلاث قطع مركزية بالضبط ويترك كل شيء آخر، فتبقى المراكز المكتملة مكتملة. استخدمه حين لا تنضم قطعة شاردة إلى شريط.';

  @override
  String get lessonBigEdges => 'إقران الحواف';

  @override
  String get lessonBigEdgesDesc => 'اجمع الأجنحة في حواف كاملة.';

  @override
  String get stepBigEdgePair => 'اقرن واستعد';

  @override
  String get stepBigEdgePairBody =>
      '⁦Uw\'⁩ تحاذي جناحين متطابقين، و⁦R U R\' F R\' F\' R⁩ تُدخل حافة غير مقترنة، و⁦Uw⁩ تعيد المراكز. أغلِق دائمًا كل شريحة فتحتها.';

  @override
  String get lessonBigParity => 'التكافؤ';

  @override
  String get lessonBigParityDesc => 'تكافؤ OLL وPLL في المكعبات الزوجية.';

  @override
  String get stepBigOllParity => 'تكافؤ OLL';

  @override
  String get stepBigOllParityBody =>
      'الحافة المقلوبة وحدها لا تحدث في 3×3: إنها تكافؤ OLL وليست خطأ. أبقِها في أمام الطبقة العليا ونفّذ الخوارزمية الطويلة. إنها تبادل أيضًا الحافتين العلويتين اليمنى واليسرى وزاويتين؛ وتصلحها خطوات 3×3 الأخيرة.';

  @override
  String get stepBigPllParity => 'تكافؤ PLL';

  @override
  String get stepBigPllParityBody =>
      'حافتان متبادلتان في النهاية تمامًا ولا تناسبهما أي خوارزمية 3×3؟ هذا تكافؤ PLL. أمسكهما في أمام الطبقة العليا وخلفها: ⁦2R2 U2 2R2 Uw2 2R2 2U2⁩ تبادلهما.';

  @override
  String get introGoalHeading => 'ما الهدف؟';

  @override
  String get introHowHeading => 'كيف نفعل ذلك؟';

  @override
  String get introHoldHeading => 'كيف تمسكه';

  @override
  String get introWhyHeading => 'لماذا ينجح';

  @override
  String get introStart => 'فهمت، لنبدأ خطوة بخطوة';

  @override
  String get introDontShowAgain => 'لا تعرض هذا تلقائيًا مرة أخرى';

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
      'كوّن صليبًا أبيض في الأسفل تطابق فيه كل حافة بيضاء لون المركز المجاور لها.';

  @override
  String get introGoalCorners =>
      'أكمِل الزوايا البيضاء الأربع لتنتهي الطبقة الأولى كلها: وجه أبيض بألوان جانبية متطابقة.';

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
      'أعِد الزوايا الأخيرة إلى أماكنها بـ⁦T-perm⁩ أو ⁦Y-perm⁩ واحدة، ثم حاذِ الطبقة العليا لحل المكعب 2×2.';

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
      'أصلِح الحالتين اللتين لا تحدثان في 3×3: حافة واحدة مقلوبة (تكافؤ OLL) أو حافتان متبادلتان (تكافؤ PLL).';

  @override
  String get introHowBasics =>
      'المراكز لا تتحرك أبدًا، لذا فهي تحدد لون كل وجه.\nكل حرف يدير وجهًا واحدًا ربع دورة باتجاه عقارب الساعة.\nالفاصلة العليا (⁦\'⁩) تدير بالعكس، والرقم 2 يدير مرتين.';

  @override
  String get introHoldBasics =>
      'كما تشاء: المراكز لا تتحرك، لذا تخبرك الألوان دائمًا أي وجه هو أي وجه.';

  @override
  String get introWhyBasics =>
      'كل خوارزمية مجرد هذه الحروف متتالية، لذا فقراءتها هي المهارة الأولى.';

  @override
  String get introHowCross =>
      'اصعد بكل حافة بيضاء إلى الأعلى، والأبيض للأعلى، حول المركز الأصفر: هذه زهرة الأقحوان.\nأدر الطبقة العليا حتى يصبح لون جانب البتلة فوق مركزه المطابق.\nأدر ذلك الوجه 180° لتنزل، وكرر ذلك للأربع.';

  @override
  String get introHoldCross =>
      'المركز الأصفر في الأعلى والأبيض في الأسفل طوال الخطوة. أدر الطبقة العليا، لا المكعب، لتحاذي البتلة.';

  @override
  String get introWhyCross =>
      'حين يتجه الأبيض للأعلى، تُنزل دورتان للوجه الأمامي الحافة على المركز الأبيض، والأبيض للأسفل ولون الجانب مطابق مسبقًا.';

  @override
  String get introHowCorners =>
      'أدر الطبقة العليا حتى تصبح زاوية بيضاء فوق مكانها الفارغ، والمكان في الأمام يمينًا.\nكرر ⁦R U R\' U\'⁩: مرة إن كان الأبيض لليمين، وثلاثًا إن كان للأعلى، وخمسًا إن كان نحوك.\nافعل الشيء نفسه مع الزوايا الثلاث الأخرى.';

  @override
  String get introHoldCorners =>
      'الأبيض في الأسفل والأصفر في الأعلى. الزاوية في الأمام يمينًا، فوق مكانها مباشرة.';

  @override
  String get introWhyCorners =>
      '⁦R U R\' U\'⁩ ترفع المكان ثم تعيده: كل دورة تلوي الزاوية قليلًا حتى يتجه الأبيض للأسفل، والصليب لا ينكسر أبدًا.';

  @override
  String get introHowMiddle =>
      'ابحث عن حافة علوية بلا أصفر وطابِق لونها الأمامي مع المركز تحتها.\nلونها العلوي يحدد وجهتها: يمينًا أو يسارًا.\nأرسلها بخوارزمية الإدخال ذات الثماني حركات؛ تعود الطبقة البيضاء كاملة كل مرة.';

  @override
  String get introHoldMiddle =>
      'الأبيض في الأسفل والأصفر في الأعلى. الحافة في الأمام، ولونها الأمامي يطابق المركز تحتها.';

  @override
  String get introWhyMiddle =>
      'الإدخال يرفع المكان جانبًا، ويُدخل الحافة، ويعيد الطبقة البيضاء. الحافة التي فيها أصفر مكانها الأعلى، لا الوسط.';

  @override
  String get introHowYellowCross =>
      'انظر فقط إلى الحواف الصفراء في الأعلى: نقطة أو L أو خط.\nأمسك الـL في الخلف يسارًا والخط من اليسار إلى اليمين، ونفّذ ⁦F R U R\' U\' F\'⁩.\nالخط يحتاجها مرة، والـL مرتين، والنقطة حتى ثلاث مرات.';

  @override
  String get introHoldYellowCross =>
      'الأبيض في الأسفل والأصفر في الأعلى. الـL في الخلف يسارًا، والخط من اليسار إلى اليمين؛ والنقطة بأي اتجاه.';

  @override
  String get introWhyYellowCross =>
      '⁦F R U R\' U\' F\'⁩ تقلب حافتين علويتين في كل مرة دون أن تلمس الطبقتين الأوليين.';

  @override
  String get introHowYellowEdges =>
      'أدر الطبقة العليا حتى تطابق حافتان مركزيهما الجانبيين.\nأمسكهما في الخلف وعلى اليمين، ثم نفّذ ⁦R U R\' U R U2 R\' U⁩.\nإن كانت الحافتان المتطابقتان متقابلتين، نفّذها مرة من أي جهة أولًا.';

  @override
  String get introHoldYellowEdges =>
      'الأصفر في الأعلى. حافة متطابقة في الخلف والأخرى على اليمين.';

  @override
  String get introWhyYellowEdges =>
      'هذه الخوارزمية تحرك القطع العلوية فقط، لذا تعود الطبقتان الأوليان دائمًا.';

  @override
  String get introHowYellowCorners =>
      'تكون الزاوية في مكانها حين تطابق ألوانها المراكز الثلاثة حولها، حتى لو كانت ملتوية.\nأبقِ زاوية في مكانها في الأمام يمينًا.\n⁦U R U\' L\' U R\' U\' L⁩ تدوّر الثلاث الأخرى؛ كرر حتى تستقر الأربع.';

  @override
  String get introHoldYellowCorners =>
      'الأصفر في الأعلى. زاوية في مكانها الصحيح في الأمام يمينًا؛ وإن لم توجد، فأي زاوية.';

  @override
  String get introWhyYellowCorners =>
      'تدوّر ثلاث زوايا في دائرة وتترك زاوية الأمام يمينًا في مكانها، فكل تكرار يعيد زوايا أكثر.';

  @override
  String get introHowTwistCorners =>
      'أمسك زاوية غير محلولة في الأمام يمينًا.\nكرر ⁦R\' D\' R D⁩ أزواجًا حتى يتجه أصفرها للأعلى.\nأدر الطبقة العليا فقط للزاوية التالية؛ يعود الأسفل مع آخر زاوية.';

  @override
  String get introHoldTwistCorners =>
      'الأصفر في الأعلى، والزاوية المراد تدويرها في الأمام يمينًا. بين الزوايا أدر الطبقة العليا فقط، لا المكعب كله.';

  @override
  String get introWhyTwistCorners =>
      '⁦R\' D\' R D⁩ تلوي الزاوية وتبعثر الأسفل، لكن الأسفل يعود بعد تدوير كل الزوايا. التوقف في المنتصف يتركه مكسورًا.';

  @override
  String get introHowCfopIntro =>
      'الصليب: أربع حواف تُخطط لها أثناء الفحص.\nF2L: تدخل كل زاوية مع حافتها معًا.\nOLL يجعل الوجه العلوي أصفر، ثم PLL يعيد القطع إلى أماكنها.';

  @override
  String get introHoldCfopIntro =>
      'يبني محترفو السرعة الصليب في الأسفل، ليروا القطع التالية مسبقًا أثناء الإدارة.';

  @override
  String get introWhyCfopIntro =>
      'حل الزاوية مع حافتها معًا يوفر حركات كثيرة، والتعرف على الحالات يغني عن التجربة والخطأ.';

  @override
  String get introHowF2l =>
      'ابحث عن زاوية والحافة المطابقة لها في الطبقة العليا.\nاجمعهما زوجًا فوق خانتهما.\nأدخل الزوج بثلاث أو أربع حركات.';

  @override
  String get introHoldF2l =>
      'الصليب في الأسفل. مكان الزوج في الأمام يمينًا، أو في الأمام يسارًا للحالة المعكوسة.';

  @override
  String get introWhyF2l =>
      'الزاوية والحافة المقترنتان تدخلان معًا، فتنمو طبقتان في آن واحد بدل قطعة واحدة كل مرة.';

  @override
  String get introHowOll =>
      'أولًا الصليب الأصفر بـ ⁦F R U R\' U\' F\'⁩.\nثم وجّه الزوايا، مثلًا بخوارزمية Sune.\nتعرّف على الحالة من شكل الأصفر الذي تراه.';

  @override
  String get introHoldOll =>
      'الأصفر في الأعلى. في ⁦Sune⁩، الزاوية الوحيدة التي أصفرها للأعلى تكون في الأمام يسارًا.';

  @override
  String get introWhyOll =>
      'تقسيم الطبقة الأخيرة إلى توجيه ثم تبديل يُبقي عدد الخوارزميات قليلًا.';

  @override
  String get introHowPll =>
      'الوجه العلوي أصفر بالكامل بالفعل.\nT-perm يبدّل الزوايا، وU-perm يدوّر ثلاث حواف.\nاقرأ الألوان الجانبية لتختار الخوارزمية.';

  @override
  String get introHoldPll =>
      'الأصفر في الأعلى. ⁦T-perm⁩: المصابيح على اليسار. ⁦U-perm⁩: الجانب المكتمل في الخلف.';

  @override
  String get introWhyPll =>
      'حين يصبح الأعلى أصفر بالكامل، تكون أماكن القطع فقط خاطئة، وبضع تبديلات تُنهي المكعب.';

  @override
  String get introHowTwoFirst =>
      'اختر زاوية بيضاء كمرساة، والأبيض للأسفل.\nأحضر كل زاوية تالية فوق مكانها في الأمام يمينًا.\nكرر ⁦R U R\' U\'⁩ حتى تدخل بألوان جانبية متطابقة.';

  @override
  String get introHoldTwoFirst =>
      'الأبيض في الأسفل. المكان الفارغ في الأمام يمينًا، وزاويته فوقه مباشرة في الطبقة العليا.';

  @override
  String get introWhyTwoFirst =>
      'لا مراكز في 2×2: أول زاوية تضعها تحدد ألوان جاراتها، لذا تهم الألوان الجانبية لا الأبيض وحده.';

  @override
  String get introHowTwoOll =>
      'عُدّ الزوايا التي يتجه أصفرها للأعلى.\nإن كانت واحدة، أمسكها في الأمام يسارًا ونفّذ ⁦Sune⁩: ⁦R U R\' U R U2 R\'⁩.\nعُدّ من جديد وكرر؛ ثلاث مرات ⁦Sune⁩ على الأكثر.';

  @override
  String get introHoldTwoOll =>
      'الأبيض في الأسفل والأصفر في الأعلى. قبل كل ⁦Sune⁩ تكون الزاوية ذات الأصفر العلوي في الأمام يسارًا.';

  @override
  String get introWhyTwoOll =>
      '⁦Sune⁩ تلوي الزوايا العلوية دون كسر الطبقة البيضاء؛ والعدّ من جديد يخبرك كيف تمسكه في المرة التالية.';

  @override
  String get introHowTwoPbl =>
      'ابحث عن المصابيح الأمامية: ملصقان علويان متطابقان في جانب واحد.\nمصابيح في جانب واحد: ضعها على اليسار ونفّذ ⁦T-perm⁩.\nلا مصابيح: نفّذ ⁦Y-perm⁩ من أي جهة، ثم حاذِ الطبقة العليا.';

  @override
  String get introHoldTwoPbl =>
      'الأبيض في الأسفل والأصفر في الأعلى. ⁦T-perm⁩: المصابيح على اليسار. ⁦Y-perm⁩: أي جانب مواجه لك.';

  @override
  String get introWhyTwoPbl =>
      'حين يصبح الأعلى أصفر، تكون أماكن الزوايا فقط خاطئة: ⁦T-perm⁩ تبادل جارتين و⁦Y-perm⁩ قطريتين.';

  @override
  String get introHowBigIntro =>
      'لا يوجد مركز ثابت: أربع قطع مركزية تكوّن لون كل وجه.\nالحركات العريضة مثل ⁦Rw⁩ تدير طبقتين معًا.\nالحركات الداخلية مثل ⁦2R⁩ تدير شريحة داخلية واحدة فقط.';

  @override
  String get introHoldBigIntro =>
      'كما تشاء في البداية: لا يوجد مركز ثابت في 4×4، فأنت تختار مكان كل لون.';

  @override
  String get introWhyBigIntro =>
      'التبسيط يجمع المراكز وقطع الحواف ليُحل المكعب الكبير مثل 3×3.';

  @override
  String get introHowBigCenters =>
      'تحقق أولًا من ترتيب الألوان على زاوية.\nابنِ مركزين متقابلين، ثم الأربعة الأخرى.\nالشرائح الداخلية تنقل قطع المركز؛ أعِد دائمًا كل شريحة فتحتها.';

  @override
  String get introHoldBigCenters =>
      'الوجه الذي تبنيه في الأمام، والمراكز المكتملة بعيدًا على اليسار واليمين.';

  @override
  String get introWhyBigCenters =>
      'الشريحة تنقل المراكز، والتراجع عنها يعيد المكتملة، فلا يتغير إلا الجزء الذي قصدته.';

  @override
  String get introHowBigEdges =>
      'ابحث عن الجناحين اللذين لهما اللونان نفسهما.\nحاذِهما في الأمام واجمعهما بـ⁦Uw\'⁩.\nأدخِل حافة غير مقترنة، ثم تعيد ⁦Uw⁩ المراكز.';

  @override
  String get introHoldBigEdges =>
      'الحافة التي تقرنها في الطبقات الأمامية؛ والحواف المكتملة مركونة في الطبقتين العليا والسفلى.';

  @override
  String get introWhyBigEdges =>
      '⁦Uw\'⁩ تزيح المراكز ليلتقي الجناحان، و⁦Uw⁩ تعيدها فيبقى عملك سليمًا.';

  @override
  String get introHowBigParity =>
      'حُلّ 4×4 مثل 3×3 حتى تتعثر.\nحافة واحدة مقلوبة: خوارزمية تكافؤ OLL الطويلة.\nحافتان متبادلتان: ⁦2R2 U2 2R2 Uw2 2R2 2U2⁩.';

  @override
  String get introHoldBigParity =>
      'الطبقة الأخيرة في الأعلى. تكافؤ OLL: الحافة المقلوبة في الأمام. تكافؤ PLL: الحافتان المتبادلتان في الأمام والخلف.';

  @override
  String get introWhyBigParity =>
      'قد تصل أجنحة الحواف إلى حالات لا يصلها 3×3؛ وهذه الخوارزميات تدير طبقات داخلية لتُبطل ذلك بالضبط.';

  @override
  String get dirFaceR => 'الجانب الأيمن';

  @override
  String get dirFaceL => 'الجانب الأيسر';

  @override
  String get dirFaceU => 'الصف العلوي';

  @override
  String get dirFaceD => 'الصف السفلي';

  @override
  String get dirFaceF => 'الوجه الأمامي';

  @override
  String get dirFaceB => 'الوجه الخلفي';

  @override
  String get dirMiddle => 'الشريحة الوسطى';

  @override
  String get dirWholeCube => 'المكعب كله';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face، الطبقة $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face، بعمق $depth';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face، الطبقات $near–$far';
  }

  @override
  String get dirUp => 'لأعلى';

  @override
  String get dirDown => 'لأسفل';

  @override
  String get dirLeft => 'لليسار';

  @override
  String get dirRight => 'لليمين';

  @override
  String get dirClockwise => 'مع عقارب الساعة';

  @override
  String get dirCounter => 'عكس عقارب الساعة';

  @override
  String get dirBackClockwise => 'مع عقارب الساعة، من الخلف';

  @override
  String get dirBackCounter => 'عكس عقارب الساعة، من الخلف';

  @override
  String get dirHalf => 'دورة مزدوجة (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'إخفاء التفاصيل';

  @override
  String get solveExpand => 'إظهار التفاصيل';

  @override
  String get dailyScrambleSteps => 'الخلط خطوة بخطوة';

  @override
  String get dailyScrambleGuide => 'دليل الخلط ثلاثي الأبعاد';

  @override
  String get dailyShowMoves => 'عرض الحركات نصيًا';

  @override
  String get dailyHideMoves => 'إخفاء الحركات النصية';

  @override
  String get dailyScrambleGuideTitle => 'دليل الخلط';

  @override
  String get phaseDailyScramble => 'اخلط مكعب اليوم';

  @override
  String get explainDailyScramble =>
      'ابدأ بمكعب محلول، الأبيض في الأعلى والأخضر في الأمام، وكرّر كل دورة على مكعبك الحقيقي.';

  @override
  String get stageCenters => 'بناء كتل المراكز';

  @override
  String get stageEdges => 'إقران الحواف الخارجية والداخلية';

  @override
  String get stageParity => 'حل التكافؤ';

  @override
  String get stageCrown1 => 'الطبقة الأولى (البيضاء)';

  @override
  String get stageCrown2 => 'الطبقة الثانية';

  @override
  String get stageCrown3 => 'الطبقة الثالثة (الصفراء)';

  @override
  String get stageOrient => 'توجيه القطع';

  @override
  String get stageFinish => 'إنهاء المكعب';

  @override
  String get stageAsThree => 'الحل كمكعب 3×3';

  @override
  String get stageTwoByTwo => 'حل مكعب 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'المرحلة $number من $total: $title';
  }

  @override
  String get solveAllStagesDone => 'اكتملت كل المراحل. أحسنت!';

  @override
  String get trackFiveByFive => '5×5 مكعب البروفيسور';

  @override
  String get trackSixBySix => 'مكعب 6×6';

  @override
  String get lessonFiveIntro => 'تعرّف على 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'مراكز ثابتة، أشرطة مركزية، حواف وسطى وأجنحة.';

  @override
  String get introGoalFiveIntro =>
      'تعرّف على 5×5: مراكز ثابتة، أشرطة مركزية، حواف وسطى وأجنحة.';

  @override
  String get introHowFiveIntro =>
      'القطعة الوسطى في كل وجه لا تتحرك أبدًا.\nكل حافة قطعة وسطى مع جناحين.\nالشرائح الداخلية تحرك القطع دون لمس الخارج.';

  @override
  String get introHoldFiveIntro =>
      'كما تشاء: في 5×5 لا تتحرك القطعة الوسطى لكل وجه، فهي تُظهر لونه.';

  @override
  String get introWhyFiveIntro =>
      'القطع الوسطى الثابتة تحدد نظام الألوان، فلا يمكن بناء المراكز بترتيب خاطئ.';

  @override
  String get lessonFiveCenters => 'مراكز 5×5';

  @override
  String get lessonFiveCentersDesc => 'ابنِ كل مركز من أشرطة ثلاثية.';

  @override
  String get introGoalFiveCenters => 'ابنِ في كل وجه كتلة مركز 3×3 بلون واحد.';

  @override
  String get introHowFiveCenters =>
      'ابدأ من القطعة الوسطى الثابتة: هي التي تحدد اللون.\nابنِ أشرطة من ثلاث قطع وأدخلها بشريحة داخلية.\nالحركة التي تُدخل الشريط تعيد أيضًا المركز المكتمل.';

  @override
  String get introHoldFiveCenters =>
      'المركز الذي تبنيه في الأمام أو الأعلى؛ والمراكز المكتملة في الأسفل أو اليسار أو اليمين، بعيدًا.';

  @override
  String get introWhyFiveCenters =>
      'شريحة للداخل، دورة للأعلى، شريحة للخلف: الشريحة التي تُدخل الشريط تعيد أيضًا المراكز المكتملة.';

  @override
  String get lessonFiveEdges => 'حواف 5×5';

  @override
  String get lessonFiveEdgesDesc => 'اجمع جناحين مع حافتهما الوسطى.';

  @override
  String get introGoalFiveEdges =>
      'اجمع كل حافة وسطى مع جناحيها لتبدو الحواف الاثنتا عشرة قطعًا واحدة.';

  @override
  String get introHowFiveEdges =>
      'طابِق كل جناح مع حافته الوسطى في الأمام.\nأدر الطبقة الداخلية، أدخِل حافة غير محلولة، ثم أعِدها.\nللحواف الأخيرة: شريحة، قلب، شريحة.';

  @override
  String get introHoldFiveEdges =>
      'الحافة التي تبنيها في الأمام؛ والحواف المكتملة محفوظة في الطبقتين العليا والسفلى.';

  @override
  String get introWhyFiveEdges =>
      'فتح الشريحة الداخلية وإغلاقها يجمعان الأجنحة، وتعود المراكز والحواف المحفوظة.';

  @override
  String get lessonFiveSolve => 'حل 5×5 كمكعب 3×3';

  @override
  String get lessonFiveSolveDesc => 'أكمِل طبقة بعد طبقة، مثل 3×3.';

  @override
  String get introGoalFiveSolve =>
      'حُلّ المكعب 5×5 بعد التبسيط مثل 3×3، طبقة بعد طبقة، بالأوجه الخارجية فقط.';

  @override
  String get introHowFiveSolve =>
      'من الآن الأوجه الخارجية فقط، وإلا انفصلت الحواف المقترنة.\nالصليب والزوايا البيضاء، ثم الطبقة الوسطى، ثم الطبقة الصفراء.\nالقطع الوسطى الثابتة تُظهر لون كل وجه.';

  @override
  String get introHoldFiveSolve =>
      'لون الطبقة الأولى في الأسفل كما في 3×3 تمامًا؛ والزاوية المراد إدخالها في الأمام يمينًا.';

  @override
  String get introWhyFiveSolve =>
      'الدورات الداخلية ستفكك المراكز والحواف من جديد؛ أما الخارجية فتعامل كل كتلة كقطعة واحدة من 3×3.';

  @override
  String get lessonFiveParity => 'تكافؤ حواف 5×5';

  @override
  String get lessonFiveParityDesc => 'أصلح الحافة ذات الجناحين المتبادلين.';

  @override
  String get introGoalFiveParity =>
      'أصلِح الحافة الوحيدة التي تبادل جناحاها الخارجيان: هذا هو التكافؤ الوحيد في 5×5.';

  @override
  String get introHowFiveParity =>
      'تظهر كحافة أخيرة واحدة تبدو مقلوبة.\nنفّذ الإصلاح الطويل بالشرائح الداخلية مرة واحدة.\nلا يوجد تكافؤ PLL في 5×5.';

  @override
  String get introHoldFiveParity =>
      'الطبقة الأخيرة في الأعلى، والحافة ذات الجناحين المتبادلين في أمام الطبقة العليا.';

  @override
  String get introWhyFiveParity =>
      'في 5×5 لا يتبادل إلا الجناحان الخارجيان لحافة واحدة، لذا تكفي خوارزمية واحدة.';

  @override
  String get lessonSixIntro => 'تعرّف على 6×6';

  @override
  String get lessonSixIntroDesc => 'لا مراكز ثابتة، وأربع قطع في كل حافة.';

  @override
  String get introGoalSixIntro =>
      'تعرّف على 6×6: ست عشرة قطعة مركزية في كل وجه وأربع قطع في كل حافة.';

  @override
  String get introHowSixIntro =>
      'لا يوجد مركز ثابت: أنت تختار الألوان أثناء البناء.\nلكل حافة أجنحة خارجية وداخلية.\nالدورات العريضة تحرك حتى ثلاث طبقات.';

  @override
  String get introHoldSixIntro =>
      'كما تشاء في البداية: مثل 4×4، لا يوجد مركز ثابت في 6×6.';

  @override
  String get introWhySixIntro =>
      'إن كنت تحل 4×4 و5×5، فإن 6×6 هو التبسيط نفسه بكتل أكبر.';

  @override
  String get lessonSixCenters => 'مراكز 6×6';

  @override
  String get lessonSixCentersDesc => 'ابنِ مراكز 4×4 من أشرطة رباعية.';

  @override
  String get introGoalSixCenters => 'ابنِ في كل وجه كتلة مركز 4×4 بلون واحد.';

  @override
  String get introHowSixCenters =>
      'تحقق أولًا من ترتيب الألوان على زاوية: لا يوجد مركز ثابت.\nابنِ أشرطة من أربع قطع واجمعها معًا.\nفي آخر مركزين انقل القطع واحدة واحدة: شريحة، أعلى، تراجع.';

  @override
  String get introHoldSixCenters =>
      'الوجه الذي تبنيه في الأمام، والمراكز المكتملة على اليسار أو اليمين أو في الأسفل.';

  @override
  String get introWhySixCenters =>
      'تلتحم الأشرطة بشرائح داخلية، وكل شريحة يُتراجع عنها، فتبقى المراكز المكتملة سليمة.';

  @override
  String get lessonSixEdges => 'حواف 6×6';

  @override
  String get lessonSixEdgesDesc => 'اجمع القطع الأربع لكل حافة.';

  @override
  String get introGoalSixEdges =>
      'اجمع القطع الأربع لكل حافة ليصبح في 6×6 اثنتا عشرة حافة نظيفة.';

  @override
  String get introHowSixEdges =>
      'حاذِ الأجنحة الخارجية والداخلية لحافة واحدة في الأمام.\nالطبقة العريضة العميقة تُدخل الحافة وتُخرجها.\nلا تكسر حافة مكتملة أبدًا لتحرير قطعة.';

  @override
  String get introHoldSixEdges =>
      'الحافة التي تبنيها في الأمام؛ والحواف المكتملة مركونة في الطبقتين العليا والسفلى.';

  @override
  String get introWhySixEdges =>
      'الدورة العريضة العميقة تزيح المراكز ليلتقي الجناحان، ثم تعيدها.';

  @override
  String get lessonSixSolve => 'حل 6×6 كمكعب 3×3';

  @override
  String get lessonSixSolveDesc => 'أكمِل طبقة بعد طبقة، مثل 3×3.';

  @override
  String get introGoalSixSolve =>
      'حُلّ المكعب 6×6 بعد التبسيط مثل 3×3، طبقة بعد طبقة، بالأوجه الخارجية فقط.';

  @override
  String get introHowSixSolve =>
      'من الآن الأوجه الخارجية فقط: الشريحة ستفكك مركزًا أو حافة.\nالمراكز التي بنيتها تُظهر لون كل وجه.\nالصليب والزوايا البيضاء، ثم الطبقة الوسطى، ثم الطبقة الصفراء.';

  @override
  String get introHoldSixSolve =>
      'لون الطبقة الأولى في الأسفل كما في 3×3 تمامًا؛ والزاوية المراد إدخالها في الأمام يمينًا.';

  @override
  String get introWhySixSolve =>
      'الدورات الخارجية تحرك كل مركز 4×4 وكل حافة كقطعة واحدة، تمامًا كما في 3×3.';

  @override
  String get lessonSixParity => 'تكافؤ 6×6';

  @override
  String get lessonSixParityDesc => 'حافة مقلوبة واحدة أو حافتان متبادلتان.';

  @override
  String get introGoalSixParity =>
      'أصلح حالتي 6×6 اللتين لا تحدثان في 3×3: حافة مقلوبة واحدة أو حافتان متبادلتان.';

  @override
  String get introHowSixParity =>
      'حُلّ مثل 3×3 حتى تتعثر.\nحافة واحدة مقلوبة: الإصلاح الطويل بـ⁦3Rw⁩.\nحافتان متبادلتان: الإصلاح القصير بدورات داخلية مزدوجة.';

  @override
  String get introHoldSixParity =>
      'الطبقة الأخيرة في الأعلى. الحافة المقلوبة في الأمام؛ ولحافتين متبادلتين، الأمام والخلف.';

  @override
  String get introWhySixParity =>
      'مثل 4×4، قد ينتهي 6×6 بحافة مقلوبة أو حافتين متبادلتين؛ وخوارزميات الطبقات الداخلية تصلحها وتترك الباقي.';

  @override
  String get stepFivePieces => 'قطع 5×5';

  @override
  String get stepFivePiecesBody =>
      'القطعة الوسطى في كل وجه لا تتحرك أبدًا، لذا لا يمكن أن يخرج نظام الألوان خاطئًا. حولها ثماني قطع مركزية: مراكز الزوايا ومراكز الحواف لا تتبادل أنواعها أبدًا. وكل حافة قطعة وسطى بجناحين.';

  @override
  String get stepFiveSlices => 'ثلاثة أنواع من الدورات';

  @override
  String get stepFiveSlicesBody =>
      'الدورة الخارجية تدير وجهًا واحدًا. الدورة العريضة تدير الوجه مع الطبقة التي خلفه. دورة الشريحة الداخلية تدير طبقة داخلية فقط: هكذا تتبادل القطع أماكنها دون لمس الخارج.';

  @override
  String get stepFiveCenterBar => 'الأشرطة المركزية';

  @override
  String get stepFiveCenterBarBody =>
      'ابنِ صفًا من ثلاث قطع مركزية متطابقة، أدخله بشريحة داخلية، أدر الأعلى ثم أعِد الشريحة: الحركة التي تُدخل الشريط تعيد أيضًا المركز المكتمل. ثلاثة أشرطة تصنع مركزًا.';

  @override
  String get stepFiveCenterSwap => 'بدّل دون إفساد';

  @override
  String get stepFiveCenterSwapBody =>
      'لتحريك قطعة مركزية واحدة: أدر شريحة داخلية، أدر الوجه العلوي، تراجع عن الشريحة، ثم أعد الوجه العلوي. تعود المراكز المكتملة في كل مرة.';

  @override
  String get stepFiveEdgePair => 'اقرن الأجنحة بالحافة الوسطى';

  @override
  String get stepFiveEdgePairBody =>
      'حاذِ جناحًا بجوار حافته الوسطى المطابقة في الأمام، أنزل الطبقة الداخلية، أدخل حافة غير محلولة بمحفّز قصير، ثم أعِد الطبقة الداخلية.';

  @override
  String get stepFiveEdgeLast => 'الحواف الأخيرة';

  @override
  String get stepFiveEdgeLastBody =>
      'حين لا تبقى حافة حرة لإدخالها، استخدم شريحة ثم قلب ثم شريحة: دورة عريضة ومحفّز قصير ثم الدورة العريضة للخلف تقرن الحواف الأخيرة دون كسر المكتملة.';

  @override
  String get stepFiveAsThree => 'أصبح الآن 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'بعد اكتمال المراكز والحواف يتصرف 5×5 مثل 3×3 كبير. استخدم الأوجه الخارجية فقط وتقدّم طبقة بعد طبقة: الصليب والزوايا البيضاء، ثم الطبقة الوسطى، ثم الطبقة الصفراء. لا يوجد تكافؤ PLL في 5×5.';

  @override
  String get stepFiveEdgeParity => 'بدّل جناحي الحافة الأخيرة';

  @override
  String get stepFiveEdgeParityBody =>
      'أحيانًا يتبادل الجناحان الخارجيان للحافة الأخيرة، فتبدو مقلوبة: إنه التكافؤ الوحيد في 5×5. أمسكها في أمام الطبقة العليا ونفّذ خوارزمية الشرائح الداخلية مرة واحدة؛ ويعود كل شيء آخر إلى مكانه.';

  @override
  String get stepSixPieces => 'قطع 6×6';

  @override
  String get stepSixPiecesBody =>
      'مثل 4×4، لا يوجد مركز ثابت في 6×6: ست عشرة قطعة مركزية تصنع لون كل وجه، فتحقق أولًا من ترتيب الألوان على زاوية. لكل حافة أربعة أجنحة: اثنان خارجيان واثنان داخليان.';

  @override
  String get stepSixSlices => 'تدوير طبقات أعمق';

  @override
  String get stepSixSlicesBody =>
      'الدورات العريضة تحرك طبقتين أو ثلاثًا من وجه واحد. الشرائح الداخلية في الطبقة الثانية أو الثالثة هي أدوات المراكز والحواف.';

  @override
  String get stepSixCenterBar => 'أشرطة رباعية';

  @override
  String get stepSixCenterBarBody =>
      'ابنِ صفوفًا من أربع قطع مركزية متطابقة وضعها جنبًا إلى جنب بدورات الشرائح الداخلية، متراجعًا عن كل شريحة، حتى يصبح الوجه كتلة 4×4 واحدة.';

  @override
  String get stepSixCenterSwap => 'قطعة واحدة في كل مرة';

  @override
  String get stepSixCenterSwapBody =>
      'أدر الطبقة الثالثة، أدر الأعلى، تراجع، ثم أعِد: تتحرك قطعة مركزية واحدة وتعود المراكز المكتملة. استخدمه لآخر مركزين حين لا يناسب أي شريط.';

  @override
  String get stepSixEdgePair => 'أربع قطع، حافة واحدة';

  @override
  String get stepSixEdgePairBody =>
      'اجمع الأجنحة الأربعة لحافة في الأمام بالطبقة العريضة العميقة، أدخل حافة غير محلولة بمحفّز قصير، ثم أعِد الطبقة العريضة.';

  @override
  String get stepSixEdgeLast => 'الحواف الأخيرة';

  @override
  String get stepSixEdgeLastBody =>
      'اقرن الحواف الأخيرة بمحفّز قصير بين دورة عريضة عميقة والتراجع عنها، فتبقى الحواف المكتملة مقترنة. لا تكسر حافة مكتملة أبدًا لتحرير قطعة.';

  @override
  String get stepSixAsThree => 'أصبح الآن 3×3';

  @override
  String get stepSixAsThreeBody =>
      'مع مراكز 4×4 وحواف مقترنة، حُلّ 6×6 مثل 3×3، طبقة بعد طبقة، بالأوجه الخارجية فقط. حافة مقلوبة أو حافتان متبادلتان في النهاية تكافؤ، لا خطأ.';

  @override
  String get stepSixOllParity => 'حافة مقلوبة واحدة';

  @override
  String get stepSixOllParityBody =>
      'الحافة الوحيدة التي تبدو مقلوبة في الطبقة الأخيرة تكافؤ. أمسكها في أمام الطبقة العليا ونفّذ الإصلاح الطويل: يقلب أجنحتها الأربعة، ويبادل أيضًا الحافتين العلويتين اليمنى واليسرى، ولا يلمس الطبقتين الأوليين.';

  @override
  String get stepSixPllParity => 'حافتان متبادلتان';

  @override
  String get stepSixPllParityBody =>
      'إن بدت حافتان متبادلتين في النهاية تمامًا، أمسكهما في أمام الطبقة العليا وخلفها ونفّذ الإصلاح القصير بدورات داخلية مزدوجة: تتبادل الأجنحة الأربعة لكلتا الحافتين.';

  @override
  String get stepSixWingRule => 'أربعة أجنحة أم اثنان؟';

  @override
  String get stepSixWingRuleBody =>
      'تتكون حافة المكعب 6×6 من 4 أجنحة. قبل إصلاح حافة تبدو مقلوبة، انظر جيدًا: إذا كانت الأجنحة الأربعة كلها مقلوبة فاستخدم تكافؤ OLL المعتاد بثلاث طبقات، وإذا كان الجناحان الداخليان فقط مقلوبين فاستخدم تكافؤ الأجنحة الداخلية. يعرض المكعب حالة الجناحين الداخليين.';

  @override
  String get stepSixInnerWingParity => 'جناحان داخليان مقلوبان';

  @override
  String get stepSixInnerWingParityBody =>
      'هنا الجناحان الخارجيان للحافة العلوية الأمامية سليمان، والجناحان الداخليان فقط مقلوبان. أبقِ هذه الحافة في أمام الطبقة العليا وأدر الشرائح الثالثة فقط (⁦3R, 3L⁩): يعود الجناحان الداخليان إلى وضعهما ويبقى باقي المكعب محلولًا.';

  @override
  String get stageTwoFirstLayer => 'ابنِ الطبقة السفلى';

  @override
  String get stageTwoTopColor => 'اجعل الوجه العلوي بلون واحد';

  @override
  String get stageTwoFinish => 'أكمل الزوايا';

  @override
  String get explainTwoFirstLayer =>
      'أكمل الطبقة السفلى: زواياها الأربع متطابقة فيما بينها ومع ألوان الجوانب.';

  @override
  String get explainTwoTopColor =>
      'أدر حتى تصبح الملصقات العلوية الأربعة بلون واحد، دون إفساد الطبقة السفلى.';

  @override
  String get explainTwoFinish =>
      'انقل الزوايا الأخيرة إلى أماكنها لتنهي المكعب.';

  @override
  String get tabSolve => 'الحل';

  @override
  String get tabScan => 'المسح';

  @override
  String get tabAcademy => 'الأكاديمية';

  @override
  String get tabTrain => 'التدريب';

  @override
  String get openCubeSolver => 'افتح المكعب ثلاثي الأبعاد والحلّال';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'التدريب';

  @override
  String get trainSubtitle => 'طوّر مهاراتك كل يوم.';

  @override
  String get settings => 'الإعدادات';

  @override
  String get settingsSoundHaptics => 'الصوت والاهتزاز';

  @override
  String get settingsSoundHapticsDesc => 'نقرات واهتزازات عند تدوير المكعب.';

  @override
  String get settingsAnimationSpeed => 'سرعة الحركة الافتراضية';

  @override
  String get settingsAnimationSpeedDesc =>
      'مدى سرعة دوران المكعب عند تشغيل الحركات.';

  @override
  String get settingsResetProgress => 'إعادة ضبط التقدّم';

  @override
  String get settingsResetProgressDesc =>
      'يمحو دروس الأكاديمية المكتملة وسلسلتك اليومية.';

  @override
  String get resetProgressTitle => 'إعادة ضبط كل التقدّم؟';

  @override
  String get resetProgressBody =>
      'ستُمحى دروسك المكتملة وسلسلتك اليومية. لا يمكن التراجع عن ذلك.';

  @override
  String get resetProgressDone => 'تمت إعادة ضبط التقدّم.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get settingsPrivacyAds => 'الخصوصية والإعلانات';

  @override
  String get settingsPrivacyAdsDesc =>
      'راجع خيارات موافقتك على الإعلانات أو غيّرها.';

  @override
  String get playbackPrevious => 'السابق';

  @override
  String get playbackNext => 'التالي';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حُلّ في $count حركة!',
      many: 'حُلّ في $count حركة!',
      few: 'حُلّ في $count حركات!',
      two: 'حُلّ بحركتين!',
      one: 'حُلّ بحركة واحدة!',
      zero: 'حُلّ دون أي حركة!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'ساهم في تشكيل الإصدار القادم';

  @override
  String get feedbackBody =>
      'هل تريد اقتراح ميزة أو التأثير في الإصدار القادم من CubeMentor؟ راسلنا على:';

  @override
  String get feedbackEmailCopied =>
      'لم يُعثر على تطبيق بريد، لذا نسخنا العنوان إلى الحافظة.';

  @override
  String get adWatchToUnlock => 'شاهد إعلانًا';

  @override
  String get adLoading => 'جارٍ تحميل فيديو قصير…';

  @override
  String get adRewardNotEarned => 'شاهد الفيديو كاملًا لفتح القفل.';

  @override
  String get adUnavailableFreePass =>
      'لا يتوفر فيديو حاليًا — تم الفتح مجانًا هذه المرة.';

  @override
  String get settingsPrivacyAdsError =>
      'تعذّر فتح خيارات الخصوصية. حاول مرة أخرى لاحقًا.';

  @override
  String get nicknamePromptTitle => 'بماذا نناديك؟';

  @override
  String get nicknamePromptBody => 'سنشجّعك باسمك في كل مرة تحل فيها المكعب.';

  @override
  String get nicknameHint => 'اسمك أو لقبك';

  @override
  String get nicknameSave => 'حفظ';

  @override
  String get settingsNickname => 'اسمك';

  @override
  String get settingsNicknameNotSet => 'غير محدد — اضغط للإضافة';

  @override
  String celebrateNamed(String name) {
    return 'أحسنت يا ⁨$name⁩!';
  }

  @override
  String get celebrateAnon => 'أحسنت!';

  @override
  String get celebrateCubeSolved => 'تم حل المكعب!';

  @override
  String get celebrateDailyDone => 'اكتمل التحدي اليومي!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '⁦$count / $limit⁩ حركة',
      many: '⁦$count / $limit⁩ حركة',
      few: '⁦$count / $limit⁩ حركات',
      two: '⁦$count / $limit⁩ حركة',
      one: '⁦$count / $limit⁩ حركة',
      zero: '⁦$count / $limit⁩ حركة',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'يمكن حل أي خلطة في $limit حركة أو أقل',
      many: 'يمكن حل أي خلطة في $limit حركة أو أقل',
      few: 'يمكن حل أي خلطة في $limit حركات أو أقل',
      two: 'يمكن حل أي خلطة بحركتين أو أقل',
      one: 'يمكن حل أي خلطة بحركة واحدة أو أقل',
      zero: 'يمكن حل أي خلطة دون أي حركة',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'شاهد الفيديو';

  @override
  String get patternsNotNow => 'ليس الآن';

  @override
  String get settingsColorScheme => 'نظام ألوان المكعب';

  @override
  String get colorSchemeWestern => 'غربي';

  @override
  String get colorSchemeJapanese => 'ياباني';

  @override
  String get colorSchemeWesternDesc =>
      'الأبيض مقابل الأصفر، والأزرق مقابل الأخضر';

  @override
  String get colorSchemeJapaneseDesc =>
      'الأبيض مقابل الأزرق، والأصفر مقابل الأخضر';

  @override
  String dailyYourTime(String time) {
    return 'وقتك: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'لديك $seconds ثانية لفحص المكعب. اضغط لبدء العد التنازلي.';
  }

  @override
  String get timerInspectTapReady => 'اضغط عندما تكون مستعدًا لبدء الحل';

  @override
  String timerInspectPlus2(int seconds) {
    return 'تجاوز الفحص $seconds ثانية فبدأت الساعة تلقائيًا: عقوبة ⁦+2⁩ ثانية';
  }

  @override
  String timerAvgOf(int count) {
    return 'متوسط $count';
  }

  @override
  String get timerAvgNote => 'تُستبعد أفضل وأسوأ الأوقات من المتوسطات';

  @override
  String get timerPbSub => 'أفضل وقت';

  @override
  String get timerPlus2Caption => 'عقوبة ⁦+2⁩ ثانية';

  @override
  String get timerDnfCaption => 'لم يكتمل (DNF)';

  @override
  String get timerDeleteCaption => 'احذف هذا الحل';

  @override
  String get patternBullsEye => 'عين الثور';

  @override
  String get patternFramedCenter => 'مركز بإطار';

  @override
  String get patternBlockCheckerboard => 'شطرنج المربعات';

  @override
  String get patternCubeInCubeInCube => 'مكعب داخل مكعب داخل مكعب';

  @override
  String get patternUnionJack => 'علم الاتحاد';

  @override
  String get patternKilt => 'الكلت';

  @override
  String get patternSixTs => 'ستة أشكال ⁦T⁩';

  @override
  String get patternTwinPeaks => 'القمتان التوأمان';

  @override
  String get patternSpiral => 'الحلزون';

  @override
  String get patternTetris => 'تتريس';

  @override
  String get patternSpots => 'نقاط المركز';

  @override
  String get patternStripes => 'خطوط';

  @override
  String get patternAnaconda => 'أناكوندا';

  @override
  String get patternZigzag => 'متعرج';

  @override
  String get patternFourSpots => 'أربع نقاط';

  @override
  String get patternGreenMamba => 'المامبا الخضراء';

  @override
  String get patternPlusMinus => 'زائد وناقص';

  @override
  String guideStepCounter(int current, int total) {
    return 'الخطوة $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'الحركة $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'الحركة $current من $total';
  }

  @override
  String get dailyStep1Title => 'الخطوة 1: اخلط مكعبك';

  @override
  String get dailyStep2Title => 'الخطوة 2: حل المكعب';

  @override
  String dailyPersonalBest(String time) {
    return 'أفضل رقم شخصي: $time';
  }

  @override
  String get dailyRecentDays => 'الأيام الأخيرة';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سلسلة $count يوم! أنت متألق!',
      many: 'سلسلة $count يومًا! أنت متألق!',
      few: 'سلسلة $count أيام! أنت متألق!',
      two: 'سلسلة يومين! أنت متألق!',
      one: 'سلسلة يوم واحد! أنت متألق!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'تم خلط المكعب! والآن حلّه';

  @override
  String get dailyCongratsTitle => 'تهانينا!';

  @override
  String dailyCongratsBody(String time) {
    return 'لقد حللت تحدي اليوم في $time.';
  }

  @override
  String get dailyCongratsDone => 'العودة إلى التحدي';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نمطًا',
      many: '$count نمطًا',
      few: '$count أنماط',
      two: 'نمطان',
      one: 'نمط واحد',
      zero: '$count نمطًا',
    );
    return '⁦$size⁩ • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'تبقّت $hours ساعة',
      many: 'تبقّت $hours ساعة',
      few: 'تبقّت $hours ساعات',
      two: 'تبقّت ساعتان',
      one: 'تبقّت ساعة واحدة',
      zero: 'تبقّت $hours ساعة',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'تبقّت $minutes دقيقة',
      many: 'تبقّت $minutes دقيقة',
      few: 'تبقّت $minutes دقائق',
      two: 'تبقّت دقيقتان',
      one: 'تبقّت دقيقة واحدة',
      zero: 'تبقّت $minutes دقيقة',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'مقفل';

  @override
  String get unlockedLabel => 'مفتوح';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا النمط ودليله خطوة بخطوة لمدة $hours ساعة.',
      many:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا النمط ودليله خطوة بخطوة لمدة $hours ساعة.',
      few:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا النمط ودليله خطوة بخطوة لمدة $hours ساعات.',
      two: 'شاهد فيديو قصيرًا واحدًا لفتح هذا النمط ودليله خطوة بخطوة لمدة ساعتين.',
      one: 'شاهد فيديو قصيرًا واحدًا لفتح هذا النمط ودليله خطوة بخطوة لمدة ساعة واحدة.',
      zero:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا النمط ودليله خطوة بخطوة لمدة $hours ساعة.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا الدرس متى شئت خلال الـ$hours ساعة القادمة.',
      many:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا الدرس متى شئت خلال الـ$hours ساعة القادمة.',
      few:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا الدرس متى شئت خلال الـ$hours ساعات القادمة.',
      two: 'شاهد فيديو قصيرًا واحدًا لفتح هذا الدرس متى شئت خلال الساعتين القادمتين.',
      one: 'شاهد فيديو قصيرًا واحدًا لفتح هذا الدرس متى شئت خلال الساعة القادمة.',
      zero:
          'شاهد فيديو قصيرًا واحدًا لفتح هذا الدرس متى شئت خلال الـ$hours ساعة القادمة.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'حلّ المكعبات الكبيرة';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'لقد استخدمت حلّك المجاني لمكعبات ⁦4×4–6×6⁩. شاهد فيديو قصيرًا واحدًا لحلّ المكعبات الكبيرة خلال الـ$hours ساعة القادمة.',
      many:
          'لقد استخدمت حلّك المجاني لمكعبات ⁦4×4–6×6⁩. شاهد فيديو قصيرًا واحدًا لحلّ المكعبات الكبيرة خلال الـ$hours ساعة القادمة.',
      few:
          'لقد استخدمت حلّك المجاني لمكعبات ⁦4×4–6×6⁩. شاهد فيديو قصيرًا واحدًا لحلّ المكعبات الكبيرة خلال الـ$hours ساعات القادمة.',
      two: 'لقد استخدمت حلّك المجاني لمكعبات ⁦4×4–6×6⁩. شاهد فيديو قصيرًا واحدًا لحلّ المكعبات الكبيرة خلال الساعتين القادمتين.',
      one: 'لقد استخدمت حلّك المجاني لمكعبات ⁦4×4–6×6⁩. شاهد فيديو قصيرًا واحدًا لحلّ المكعبات الكبيرة خلال الساعة القادمة.',
      zero:
          'لقد استخدمت حلّك المجاني لمكعبات ⁦4×4–6×6⁩. شاهد فيديو قصيرًا واحدًا لحلّ المكعبات الكبيرة خلال الـ$hours ساعة القادمة.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'دوران مزدوج · 180°';

  @override
  String get homeAcademy => 'الأكاديمية';

  @override
  String get homePatterns => 'أنماط رائعة';

  @override
  String get homePractice => 'المؤقت والتحدي اليومي';

  @override
  String get scanChoiceSubtitle => 'كيف تريد أن تبدأ؟';

  @override
  String get scanChoiceCamera => 'المسح بالكاميرا';

  @override
  String get scanChoiceCameraDesc => 'اعرض كل وجه على الكاميرا واحصل على الحل.';

  @override
  String get scanChoice3d => 'فتح المكعب ثلاثي الأبعاد';

  @override
  String get scanChoice3dDesc =>
      'دوّر مكعبًا افتراضيًا، وبعثره، ثم حُلّه خطوة بخطوة.';

  @override
  String get academyAllSizes => 'كل الأحجام';

  @override
  String homeAcademyProgress(int done, int total) {
    return 'اكتمل $done من $total دروس';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • اكتمل $done / $total';
  }

  @override
  String get lessonStageConcept => 'الشرح';

  @override
  String get lessonStageExamples => 'أمثلة';

  @override
  String get lessonStagePractice => 'تدريب عملي';

  @override
  String get lessonStageNext => 'التالي / حر';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'المرحلة $index من $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'المثال $index من $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'التدريب $index من $total';
  }

  @override
  String get lessonBonusCase => 'حالة إضافية';

  @override
  String lessonContinueDesc(String lesson) {
    return 'انتقل مباشرة إلى $lesson.';
  }

  @override
  String get lessonFreePractice => 'تدريب حر';

  @override
  String get lessonFreePracticeDesc =>
      'حل مكعبًا مخلوطًا ثلاثي الأبعاد بنفسك، من البداية حتى هذه الخطوة.';

  @override
  String freePracticeBanner(String topic) {
    return 'تدرّب بحرية: حل المكعب من البداية حتى $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'أدر وجه المركز $face كما يشير السهم. المركز يبقى في مكانه؛ القطع حوله فقط هي التي تتحرك.';
  }

  @override
  String cueTrigger(String front) {
    return 'حركة اليد اليمنى، والمركز $front مواجه لك: الوجه الأيمن للأعلى، العلوي لليسار، الأيمن للأسفل، العلوي عائدًا لليمين.';
  }

  @override
  String get cueTriggerBack =>
      'الحركة السادسة على التوالي تعيد المكعب تمامًا كما كان. ستة هو الرقم السحري!';

  @override
  String cueSliceInner(String face) {
    return 'أدر الشريحة الداخلية المجاورة لوجه المركز $face فقط. الوجه نفسه يبقى ثابتًا، فتنفصل المراكز.';
  }

  @override
  String cueSliceWide(String face) {
    return 'دوران عريض: وجه المركز $face والشريحة المجاورة له يدوران معًا، كطبقة سميكة واحدة.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'أدر المكعب كله بحيث يكون المركز $top في الأعلى والمركز $front مواجهًا لك.';
  }

  @override
  String get cueTurnTop =>
      'أدر الطبقة العليا فقط، كما يشير السهم، لتجهيز الخوارزمية التالية.';

  @override
  String get cueAlignTop =>
      'الحركة الأخيرة: أدر الطبقة العليا لتصطف ألوانها. انتهيت!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'الحافة ذات الألوان $piece في الطبقة العليا. أدر الطبقة العليا حتى تصبح فوق المركز $center مباشرة، ثم أدر ذلك الوجه مرتين لإنزالها.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'الحافة ذات الألوان $piece عالقة في الطبقة الوسطى. ارفعها إلى الأعلى، وحاذها فوق المركز $center، ثم أنزلها.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'الحافة $piece في مكانها لكنها مقلوبة: أبيضها متجه إلى الجانب. أخرجها وارفعها إلى الأعلى والأبيض للأعلى، ثم أنزلها بجوار المركز $center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'على طريقة ⁦CFOP⁩ يمكن إدارة الأسفل أيضًا. أدخل الحافة ذات الألوان $piece وأدر الأسفل لتصطف مع المركز $center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'أدر الطبقة العليا حتى تصبح الزاوية ذات الألوان $piece فوق مكانها مباشرة، بين الجانب $a والجانب $b. كرر حركة اليد اليمنى حتى تنزل في مكانها بالاتجاه الصحيح.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'الزاوية $piece في مكانها لكنها ملتوية. حركة واحدة تُخرجها (وتحل محلها زاوية صفراء)؛ استمر بالتكرار فوق المكان نفسه حتى تعود والأبيض للأسفل. لا تُدِر المكعب لتلاحقها.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'أدر الطبقة العليا حتى تصطف الحافة ذات الألوان $piece مع المركز $a، ثم أنزلها إلى اليمين، في الفراغ بين $a و$b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'أدر الطبقة العليا حتى تصطف الحافة ذات الألوان $piece مع المركز $a، ثم أنزلها إلى اليسار، في الفراغ بين $a و$b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'الحافة $piece في مكانها لكنها مقلوبة. أدخِل حافة صفراء هناك لتدفعها إلى الأعلى، ثم أدخلها من جديد بين $a و$b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'خط أصفر: أدر الطبقة العليا ليمتد الخط من اليسار إلى اليمين، وأبقِ المركز $front مواجهًا لك، ثم طبّق خوارزمية الصليب الأصفر.';
  }

  @override
  String cueYellowL(String front) {
    return 'شكل ⁦L⁩ أصفر: أدر الطبقة العليا ليشير شكل ⁦L⁩ إلى الخلف يسارًا، وأبقِ المركز $front مواجهًا لك، ثم طبّق الخوارزمية. سيصبح خطًا.';
  }

  @override
  String cueYellowDot(String front) {
    return 'المركز الأصفر وحده أصفر: نقطة. نفّذ الخوارزمية مرة والمركز $front مواجه لك لتحصل على L. قد تحتاج النقطة إلى ثلاث جولات، فاستمر.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'أدر الطبقة العليا حتى تطابق الحافة ذات الألوان $piece المركز $center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'حافتان متطابقتان في الخلف وعلى اليمين. والمركز $front مواجه لك، طبّق التبديل: تتبادل الحافتان الأمامية واليسرى مكانيهما.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'الحافتان المتطابقتان متقابلتان. طبّق التبديل مرة واحدة والمركز $front مواجه لك؛ بعدها تتطابق حافتان متجاورتان.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'الزاوية ذات الألوان $piece في مكانها بالفعل. أبقها في الأمام يمينًا، والمركز $front مواجه لك، وبدّل الزوايا الثلاث الأخرى دوريًا.';
  }

  @override
  String cueCornersNone(String front) {
    return 'لا توجد زاوية صفراء في مكانها بعد. نفّذ دورة واحدة والمركز $front مواجه لك؛ بعدها تصبح زاوية واحدة في مكانها.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'أدِر الزاوية $piece في الأمام يمينًا: كرر الحركة السفلية أزواجًا حتى يتجه أصفرها للأعلى. ستبدو الطبقات السفلى مبعثرة الآن؛ وتعود مع آخر زاوية!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'الزاوية ذات الألوان $piece تحتاج هذه المرة إلى أربع حركات. واصل: الأصفر يصعد دائمًا بعد حركتين أو أربع.';
  }

  @override
  String get cueTwistNext =>
      'أدر الطبقة العليا فقط لتجلب الزاوية الملتوية التالية إلى الأمام يمينًا. لا تدر المكعب كله الآن!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'اجمع الزاوية ذات الألوان $piece مع الحافة ذات الألوان $edge في الأعلى، ثم أدخل الزوج في الفراغ بين $a و$b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'الزاوية ذات الألوان $piece عالقة في مكانها مع الحافة الخطأ. أخرجها إلى الأعلى أولًا، ثم كوّن الزوج وأدخله.';
  }

  @override
  String cueOllSune(String front) {
    return 'والمركز $front مواجه لك، طبّق ⁦Sune⁩ لتوجيه الزوايا الصفراء للأعلى.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'لم تكفِ ⁦Sune⁩ واحدة هذه المرة. أدر الطبقة العليا وطبّق ⁦Sune⁩ مرة أخرى، والمركز $front مواجه لك.';
  }

  @override
  String cuePllCorners(String front) {
    return 'زاويتان تحتاجان إلى التبادل. أبقِ الزوج المتطابق (المصابيح) على اليسار، والمركز $front مواجه لك، وطبّق ⁦T-perm⁩.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'الزوايا جاهزة. أبقِ الحافة ذات الألوان $piece في الخلف وبدّل الحواف الثلاث الأخرى دوريًا باستخدام ⁦U-perm⁩.';
  }

  @override
  String get cuePllNoEdge =>
      'لا توجد حافة علوية تطابق مركزها بعد. طبّق ⁦U-perm⁩ مرة واحدة من أي جهة؛ بعدها تتطابق حافة واحدة.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'زاويتان علويتان متجاورتان تحتاجان إلى التبادل. أبقِ الزوج المتطابق على اليسار، واللون $front مواجه لك، وطبّق التبديل.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'الزاويتان المطلوب تبديلهما متقابلتان قطريًا. طبّق التبديل القطري واللون $front مواجه لك.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'أعد قطعة المركز $color الشاردة إلى مكانها بدورة المراكز الثلاثية: شريحة، الأعلى، شريحة، ثم أرجع كل شيء.';
  }

  @override
  String cueCenterBar(String color) {
    return 'شريط كامل من قطع المركز $color على الوجه الخطأ. ارفعه بالشريحة، وأدر الطبقة العليا، وأعده إلى مكانه.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'اجمع قطعتي الحافة ذات الألوان $piece: حاذهما، أدر الشريحة، أدخل حافة غير مقترنة بحركات اليد اليمنى، ثم أعد الشريحة.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'الحواف الأخيرة: اجمع الحافة ذات الألوان $piece بخوارزمية آخر حافتين، التي تحافظ على كل الحواف المكتملة.';
  }

  @override
  String cueParityOll(String front) {
    return 'تكافؤ OLL: حافة علوية واحدة مقلوبة، وهذا لا يحدث في 3×3. أبقِها في الأمام والمركز $front مواجه لك، ونفّذ إصلاح التكافؤ قبل أي OLL عادية.';
  }

  @override
  String get cueParityPll =>
      'تكافؤ PLL: حافتان علويتان متبادلتان، وهذا لا يحدث في 3×3. أبقِهما في الأمام والخلف، ونفّذ تبديل التكافؤ، ثم حاذِ الطبقة العليا.';

  @override
  String cueParityFive(String front) {
    return 'تكافؤ الحواف: الجناحان الخارجيان لحافة واحدة متبادلان، وهو التكافؤ الوحيد في 5×5. أبقِ تلك الحافة في الأمام والمركز $front مواجه لك، ونفّذ الإصلاح مرة واحدة.';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'تكافؤ الأجنحة الداخلية: الجناحان الداخليان فقط للحافة العلوية مقلوبان. أبقِها في الأمام والمركز $front مواجه لك، وأدر الشرائح الثالثة فقط.';
  }

  @override
  String get wingRuleAllFour => 'الأجنحة الأربعة كلها مقلوبة';

  @override
  String get wingRuleAllFourFix => 'تكافؤ OLL بثلاث طبقات (⁦3Rw⁩)';

  @override
  String get wingRuleInnerTwo => 'الجناحان الداخليان فقط مقلوبان';

  @override
  String get wingRuleInnerTwoFix => 'تكافؤ الأجنحة الداخلية (⁦3R⁩)';

  @override
  String get onboardingSkip => 'تخطٍّ';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingStart => 'لنبدأ';

  @override
  String get onboardingWhatTitle => 'رفيقك في المكعبات';

  @override
  String get onboardingWhatBody =>
      'يساعدك CubeMentor على حل كل مكعب من 2×2 إلى 6×6 وتعلّمه والتدرّب عليه، دون اتصال بالإنترنت.';

  @override
  String get onboardingScanTitle => 'امسح وحُلّ في ثوانٍ';

  @override
  String get onboardingScanBody =>
      'اعرض كل وجه على الكاميرا (أو أدخل الألوان) واتبع الحل ثلاثي الأبعاد حركةً بحركة.';

  @override
  String get onboardingLearnTitle => 'تعلّم والعب';

  @override
  String get onboardingLearnBody =>
      'أتقِن طريقة الطبقات في الأكاديمية، ثم أدِر واخلط وحُلّ بحرية في ساحة اللعب ثلاثية الأبعاد.';

  @override
  String get scanChoiceManualDesc => 'أدخل ألوان كل وجه، ملصقًا بعد ملصق.';

  @override
  String get scanTryAgain => 'حاول مرة أخرى';

  @override
  String get scanEditManually => 'تصحيح الألوان يدويًا';

  @override
  String get scanLightingHint =>
      'ضع الوجه في منتصف الشبكة. استخدم إضاءة قوية ومتساوية وتجنّب الوهج.';

  @override
  String get crownExplain =>
      'الطبقة شريحة أفقية واحدة من المكعب: الطبقة الأولى هي الطبقة البيضاء في الأسفل، والثانية هي الطبقة الوسطى، والثالثة هي الطبقة الصفراء في الأعلى.';

  @override
  String get lessonObjectiveHeading => 'هدف التعلّم';

  @override
  String get dirRowTop => 'الصف العلوي من الوجه الأمامي';

  @override
  String get dirRowBottom => 'الصف السفلي من الوجه الأمامي';

  @override
  String get dirColumnRight => 'العمود الأيمن من الوجه الأمامي';

  @override
  String get dirColumnLeft => 'العمود الأيسر من الوجه الأمامي';

  @override
  String get solveChoiceTitle => 'كيف تريد حلّه؟';

  @override
  String get solveChoiceFastDesc => 'أقصر حل، حركةً بحركة.';

  @override
  String get solveChoiceGuidedDesc => 'تعلّم طريقة الطبقات خطوة بخطوة.';

  @override
  String get guidedSolvedTitle => 'تم الحل!';

  @override
  String get guidedSolvedBody => 'اتبعت كل الخطوات وحللت المكعب.';

  @override
  String get solveAgain => 'حُلّ مرة أخرى';

  @override
  String get backToHome => 'العودة إلى الرئيسية';

  @override
  String get dailyStatTime => 'وقت اليوم';

  @override
  String get dailyStatBest => 'الرقم القياسي الشخصي';

  @override
  String get dailyStatStreak => 'السلسلة الحالية';

  @override
  String get dailyStatBestStreak => 'أفضل سلسلة';

  @override
  String get privacyPolicyTitle => 'سياسة الخصوصية';

  @override
  String get settingsPrivacyPolicyDesc =>
      'ما الذي يحفظه CubeMentor وما الذي تستخدمه الإعلانات.';

  @override
  String get privacyIntro =>
      'يعمل CubeMentor دون حساب ودون خوادم خاصة به. توضح هذه الصفحة ما يبقى على جهازك وما يستخدمه شريكنا الإعلاني.';

  @override
  String get privacyDataTitle => 'بياناتك تبقى على جهازك';

  @override
  String get privacyDataBody =>
      'تُحفظ لغتك وإعداداتك وتقدّمك في الدروس وأوقات الحل وسلسلتك اليومية على هذا الجهاز فقط. ليست لدينا خوادم، لذلك لا تصلنا أبدًا. حذف التطبيق يمحوها.';

  @override
  String get privacyCameraTitle => 'الكاميرا';

  @override
  String get privacyCameraBody =>
      'تُستخدم الكاميرا فقط أثناء مسح المكعب. تُحلَّل الصور على جهازك لقراءة ألوان الملصقات، ولا تُحفظ أي صورة أو فيديو ولا تُرسل إلى أي مكان.';

  @override
  String get privacyAdsTitle => 'الإعلانات';

  @override
  String get privacyAdsBody =>
      'يعرض التطبيق إعلانات من Google AdMob. قد تستخدم Google معرّفات الجهاز وبيانات التفاعل مع الإعلانات لعرض الإعلانات وقياسها، كما هو موضّح في سياسة خصوصية Google. حيث يفرض القانون ذلك، تُطلب موافقتك أولًا ويمكنك تغييرها من الإعدادات.';

  @override
  String get privacyContactTitle => 'تواصل معنا';

  @override
  String privacyContactBody(String email) {
    return 'لديك أسئلة عن الخصوصية؟ راسلنا على $email.';
  }
}
