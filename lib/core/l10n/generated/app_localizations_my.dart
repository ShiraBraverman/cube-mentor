// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      '2×2 မှ 6×6 အထိ ကုဗတိုင်းကို စကင်ဖတ်၊ ဖြေရှင်းပြီး ကျွမ်းကျင်အောင် လေ့ကျင့်ပါ။';

  @override
  String get chooseCubeSize => 'သင့်ကုဗကို ရွေးပါ';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'အခြေခံ';

  @override
  String get cubeLevel3 => 'ဂန္ထဝင်';

  @override
  String get cubeLevel4 => 'အဆင့်မြင့်';

  @override
  String get cubeLevel5 => 'ကျွမ်းကျင်သူ';

  @override
  String get cubeLevel6 => 'ဆရာကြီး';

  @override
  String get cubeComingSoon => 'ကုဗအသစ် မကြာမီ လာမည်';

  @override
  String get carouselPrevious => 'ယခင်ကုဗ';

  @override
  String get carouselNext => 'နောက်ကုဗ';

  @override
  String get chooseMode => 'ဘာလုပ်ချင်ပါသလဲ။';

  @override
  String get modePlayground => '3D ကစားကွင်း';

  @override
  String get modePlaygroundDesc =>
      '3D တွင် အလွှာများကို လှည့်၊ ရောမွှေပြီး လှုပ်ရှားမှုများကို ပြန်ဖွင့်ပါ။';

  @override
  String get modeScanSolve => 'စကင်ဖတ်ပြီး ဖြေရှင်း';

  @override
  String get modeScanSolveDesc => 'ကင်မရာဖြင့် ကုဗကို စကင်ဖတ်ပြီး အဖြေရယူပါ။';

  @override
  String get modeAcademy => 'အကယ်ဒမီ';

  @override
  String get modeAcademyDesc =>
      'အပြန်အလှန် သင်ခန်းစာများဖြင့် တစ်ဆင့်ချင်း လေ့လာပါ။';

  @override
  String get language => 'ဘာသာစကား';

  @override
  String get languageSearch => 'ဘာသာစကား ရှာရန်';

  @override
  String get languageNoResults => 'ရှာဖွေမှုနှင့် ကိုက်ညီသော ဘာသာစကား မရှိပါ။';

  @override
  String playgroundTitle(int size) {
    return '$size×$size ကစားကွင်း';
  }

  @override
  String get scramble => 'ရောမွှေ';

  @override
  String get reset => 'ပြန်စ';

  @override
  String get undo => 'နောက်ပြန်';

  @override
  String get speed => 'အမြန်နှုန်း';

  @override
  String get xray => 'ဖောက်မြင်';

  @override
  String get prime => 'ပြောင်းပြန်';

  @override
  String get wide => 'အလွှာနှစ်ထပ်';

  @override
  String layer(int index) {
    return 'အလွှာ $index';
  }

  @override
  String get cubeRotations => 'ကုဗတစ်ခုလုံး လှည့်ခြင်း';

  @override
  String get play => 'ဖွင့်';

  @override
  String get pause => 'ခဏရပ်';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'လှုပ်ရှားမှု $count ကြိမ်',
      zero: 'လှုပ်ရှားမှု မရှိ',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'ဖြေရှင်းပြီး';

  @override
  String get scrambled => 'ရောမွှေထား';

  @override
  String get orbitHint =>
      'လှည့်ရန် အတန်းကို ဆွဲပါ · မြင်ကွင်းလှည့်ရန် နောက်ခံကို ဆွဲပါ';

  @override
  String get notationPad => 'သင်္ကေတ ခလုတ်ခုံ';

  @override
  String get solve => 'ဖြေရှင်း';

  @override
  String get solving => 'ဖြေရှင်းနေသည်…';

  @override
  String get solveFast => 'အမြန်ဖြေရှင်း';

  @override
  String get solveLearn => 'တစ်ဆင့်ချင်း လေ့လာ';

  @override
  String get solveModeGuided => 'လမ်းညွှန်ဖြင့် (သရဖူ ၃ ခု)';

  @override
  String get solveModeFast => 'အမြန် (အကောင်းဆုံး)';

  @override
  String solveUnavailable(int size) {
    return '$size×$size ဖြေရှင်းစနစ်ကို နောက်ထပ် အပ်ဒိတ်တွင် ထည့်ပေးပါမည်။';
  }

  @override
  String get solveAlreadySolved => 'ကုဗကို ဖြေရှင်းပြီးသားဖြစ်သည်။';

  @override
  String solveFailed(String reason) {
    return 'ဤကုဗကို ဖြေရှင်း၍ မရပါ ($reason)။';
  }

  @override
  String get solveEngineMissing => 'ဤစက်တွင် ဖြေရှင်းစနစ် မရနိုင်ပါ။';

  @override
  String get solveComplete => 'ဖြေရှင်းပြီးပါပြီ။ တော်လိုက်တာ။';

  @override
  String solveSummary(int count) {
    return 'လှုပ်ရှားမှု $count ကြိမ်';
  }

  @override
  String get nextMove => 'နောက်လှုပ်ရှားမှု';

  @override
  String get previousMove => 'ယခင်လှုပ်ရှားမှု';

  @override
  String get halfTurnHalfway =>
      'ကောင်းတယ်၊ တစ်ဝက်ရောက်ပြီ။ နှစ်ဆလှည့် (180°) ဖြစ်ရန် နောက်တစ်ကြိမ် လှည့်ပါ။';

  @override
  String get wideTurnInner =>
      'အရမ်းကောင်းတယ်။ အလွှာနှစ်ထပ်လှည့်ခြင်း ပြီးစေရန် ကပ်လျက်ရှိ အတွင်းအလွှာကို ပွတ်ဆွဲပါ။';

  @override
  String get wideTurnOuter =>
      'အရမ်းကောင်းတယ်။ အလွှာနှစ်ထပ်လှည့်ခြင်း ပြီးစေရန် ဘေးရှိ အပြင်အလွှာကို ပွတ်ဆွဲပါ။';

  @override
  String get wideTurnMore =>
      'အရမ်းကောင်းတယ်။ အလွှာနှစ်ထပ်လှည့်ခြင်း ပြီးစေရန် လင်းနေသော အလွှာများကို တစ်ခုချင်း ဆက်ပွတ်ဆွဲပါ။';

  @override
  String get guideSwipeHint =>
      'လင်းနေသော အလွှာကို မြှားညွှန်ရာဘက် ပွတ်ဆွဲပါ၊ သို့မဟုတ် ရှေ့သို့ ကို နှိပ်ပါ။';

  @override
  String get guideRotateHint =>
      'မြှားပြသည့်အတိုင်း ကုဗတစ်ခုလုံးကို လှည့်ပါ- ရှေ့သို့ ကို နှိပ်ပါ။';

  @override
  String get guideWrongMove => 'အရောင်တောက်ထားသော မြှားအတိုင်း လုပ်ပါ';

  @override
  String get guideExit => 'လမ်းညွှန်မှ ထွက်ရန်';

  @override
  String get colorWhite => 'အဖြူ';

  @override
  String get colorYellow => 'အဝါ';

  @override
  String get colorGreen => 'အစိမ်း';

  @override
  String get colorBlue => 'အပြာ';

  @override
  String get colorRed => 'အနီ';

  @override
  String get colorOrange => 'လိမ္မော်';

  @override
  String get phaseOptimal2x2 => 'အကောင်းဆုံး အဖြေ';

  @override
  String get phaseKociemba1 => 'အဆင့် ၁ · အပိုင်းများ၏ ဦးတည်ရာ ညှိ';

  @override
  String get phaseKociemba2 => 'အဆင့် ၂ · ကုဗကို အပြီးသတ်';

  @override
  String get phaseLblCross => 'အဖြူ ကြက်ခြေ';

  @override
  String get phaseLblCorners => 'ပထမသရဖူ၏ ထောင့်များ';

  @override
  String get phaseLblMiddle => 'အလယ်အလွှာ၏ အနားများ';

  @override
  String get phaseLblYellowCross => 'အဝါ ကြက်ခြေ';

  @override
  String get phaseLblYellowEdges => 'အဝါကြက်ခြေ၏ အနားများကို ညှိ';

  @override
  String get phaseLblYellowCorners => 'အဝါထောင့်များကို နေရာချ';

  @override
  String get phaseLblYellowCornersOrient => 'အဝါထောင့်များကို လှည့်ညှိ';

  @override
  String get crownFirst => 'ပထမ သရဖူ';

  @override
  String get crownSecond => 'ဒုတိယ သရဖူ';

  @override
  String get crownThird => 'တတိယ သရဖူ';

  @override
  String get crownFirstGoal => 'အဖြူမျက်နှာနှင့် ပထမအလွှာ';

  @override
  String get crownSecondGoal => 'အလယ်အလွှာ';

  @override
  String get crownThirdGoal => 'အဝါမျက်နှာနှင့် နောက်ဆုံးအလွှာ';

  @override
  String get subStepGoal11 =>
      'အဖြူအနားတိုင်းသည် ဘေးရှိ အလယ်အရောင်နှင့်ပါ ကိုက်ညီသော အဖြူကြက်ခြေကို ဖွဲ့ပါ။';

  @override
  String get subStepGoal12 =>
      'အဖြူမျက်နှာနှင့် ပထမကွင်းတစ်ခုလုံး ပြီးစေရန် အဖြူထောင့် ၄ ခုကို ၎င်းတို့နေရာတွင် ထည့်ပါ။';

  @override
  String get subStepGoal21 =>
      'ပထမသရဖူကို မပျက်စေဘဲ အလယ်အလွှာ အနား ၄ ခုကို ထည့်ပါ။';

  @override
  String get subStepGoal31 => 'နောက်ဆုံးအလွှာတွင် အဝါကြက်ခြေ ဖွဲ့ပါ။';

  @override
  String get subStepGoal32 =>
      'အနားတစ်ခုစီသည် ဘေးအလယ်နှင့် ကိုက်ညီသည်အထိ အဝါကြက်ခြေ၏ အနားများကို နေရာလဲပါ။';

  @override
  String get subStepGoal33 =>
      'အဝါထောင့် ၄ ခုကို လှည့်နေသေးလျှင်ပင် ၎င်းတို့၏ မှန်ကန်သောနေရာသို့ ရွှေ့ပါ။';

  @override
  String get subStepGoal34 =>
      'စတစ်ကာတိုင်း ကိုက်ညီပြီး ကုဗ ဖြေရှင်းပြီးသည်အထိ အဝါထောင့်တစ်ခုစီကို နေရာတွင်ပင် လှည့်ပါ။';

  @override
  String get explainOptimal2x2 =>
      '2×2 အနေအထားအားလုံးကို ရှာဖွေ၍ တွေ့ရှိသော အတိုဆုံး အဖြေ။';

  @override
  String get explainKociemba1 =>
      'အပိုင်းတိုင်း၏ ဦးတည်ရာကို ညှိပြီး အလယ်အလွှာ အနားများကို အလယ်အလွှာထဲ စုပါ။';

  @override
  String get explainKociemba2 =>
      'ထိုဦးတည်ရာကို ထိန်းထားသော U၊ D နှင့် တစ်ဝက်လှည့်ခြင်းများဖြင့်သာ အပြီးသတ်ပါ။';

  @override
  String get explainLblOrient =>
      'အဖြူအလယ် အောက်ဘက်သို့ မျက်နှာမူစေရန် ကုဗတစ်ခုလုံးကို လှည့်ပါ။';

  @override
  String explainLblCrossEdge(String piece) {
    return '$piece အနားကို ဘေးအရောင် ကိုက်ညီအောင် အဖြူအလယ်ဘေးသို့ ချပါ။';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece ထောင့်သည် မှားသောနေရာတွင် ပိတ်မိနေသည်။ R U R\' U\' ဖြင့် အပေါ်သို့ ထုတ်ပါ။';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return '$piece ထောင့်သည် ၎င်း၏နေရာ အပေါ်တည့်တည့် ရောက်သည်အထိ အပေါ်အလွှာကို လှည့်ပါ။';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '$piece ထောင့် နေရာကျသည်အထိ R U R\' U\' ကို ထပ်လုပ်ပါ။';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece အနားသည် အလယ်အလွှာတွင် ရှိသော်လည်း မှားနေသည်။ အပေါ်သို့ ထုတ်ပါ။';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return '$piece အနား၏ ဘေးအရောင်သည် ၎င်း၏အလယ်နှင့် ကိုက်ညီစေရန် အပေါ်အလွှာကို လှည့်ပါ။';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '$piece အနားကို ညာဘက်သို့ ထည့်ပါ- U R U\' R\' U\' F\' U F။';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '$piece အနားကို ဘယ်ဘက်သို့ ထည့်ပါ- U\' L\' U L U F U\' F\'။';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'နောက်ဖော်မြူလာအတွက် အဝါပုံသဏ္ဌာန်ကို နေရာချရန် အပေါ်အလွှာကို လှည့်ပါ။';

  @override
  String get explainLblYellowCrossAlg =>
      'F R U R\' U\' F\' ဖြင့် အဝါကြက်ခြေကို ဖွဲ့ပါ။';

  @override
  String get explainLblYellowEdgesAlign =>
      'အဝါအနားများကို ၎င်းတို့၏ အလယ်များနှင့် တန်းစီရန် အပေါ်အလွှာကို လှည့်ပါ။';

  @override
  String get explainLblYellowEdgesAlg =>
      'R U R\' U R U2 R\' U ဖြင့် အဝါအနားများကို နေရာလဲပါ။';

  @override
  String get explainLblYellowCornersAlg =>
      'U R U\' L\' U R\' U\' L ဖြင့် အဝါထောင့်များကို ၎င်းတို့နေရာသို့ လည်ပတ်ရွှေ့ပါ။';

  @override
  String get explainLblNextCorner =>
      'မဖြေရှင်းရသေးသော နောက်အဝါထောင့်ကို ရှေ့ညာသို့ ယူလာရန် အပေါ်အလွှာကို လှည့်ပါ။';

  @override
  String get explainLblCornerTwist =>
      'အဝါ အပေါ်သို့ မျက်နှာမူသည်အထိ R\' D\' R D ကို ထပ်လုပ်ပါ။ အောက်အလွှာသည် နောက်ဆုံးတွင် အလိုလို ပြန်ကောင်းသွားမည်။';

  @override
  String get explainLblFinalAlign =>
      'ကုဗကို အပြီးသတ်ရန် အပေါ်အလွှာကို လှည့်ပါ။';

  @override
  String scanTitle(int size) {
    return '$size×$size စကင်ဖတ်';
  }

  @override
  String get scanManualInput => 'အရောင်များကို လက်ဖြင့် ထည့်ပါ';

  @override
  String get scanUseCamera => 'ကင်မရာဖြင့် စကင်ဖတ်ပါ';

  @override
  String scanFaceProgress(int current, int total) {
    return 'မျက်နှာ $current / $total';
  }

  @override
  String get faceUp => 'အပေါ်မျက်နှာ';

  @override
  String get faceRight => 'ညာမျက်နှာ';

  @override
  String get faceFront => 'ရှေ့မျက်နှာ';

  @override
  String get faceDown => 'အောက်မျက်နှာ';

  @override
  String get faceLeft => 'ဘယ်မျက်နှာ';

  @override
  String get faceBack => 'နောက်မျက်နှာ';

  @override
  String get scanHintFront =>
      'မည်သည့်မျက်နှာမဆို သင့်ဘက်သို့ မူ၍ ကုဗကို ကိုင်ပါ။ ၎င်းသည် ရှေ့မျက်နှာဖြစ်သည်- စကင်ဖတ်နေစဉ် အပေါ်မျက်နှာကို မပြောင်းပါနှင့်။';

  @override
  String get scanHintRight =>
      'ရှေ့မျက်နှာမှစ၍ ညာမျက်နှာ သင့်ဘက်လှည့်လာစေရန် ကုဗတစ်ခုလုံးကို ဘယ်ဘက်သို့ တစ်ကြိမ် လှည့်ပါ။';

  @override
  String get scanHintBack =>
      'ရှေ့မျက်နှာမှစ၍ ကုဗတစ်ခုလုံးကို ဘယ်ဘက်သို့ နှစ်ကြိမ် လှည့်ပါ။';

  @override
  String get scanHintLeft =>
      'ရှေ့မျက်နှာမှစ၍ ကုဗတစ်ခုလုံးကို ညာဘက်သို့ တစ်ကြိမ် လှည့်ပါ။';

  @override
  String get scanHintUp =>
      'ရှေ့မျက်နှာမှစ၍ အပေါ်မျက်နှာ ကင်မရာဘက် မူလာစေရန် သင့်ဘက်သို့ ငဲ့ပါ။';

  @override
  String get scanHintDown =>
      'ရှေ့မျက်နှာမှစ၍ အောက်မျက်နှာ ကင်မရာဘက် မူလာစေရန် သင့်ဘက်သို့ ငဲ့ပါ။';

  @override
  String get scanAlignHint =>
      'ဇယားကွက်ကို မျက်နှာဖြင့် ပြည့်အောင်ထားပြီး ရိုက်ခလုတ်ကို နှိပ်ပါ။';

  @override
  String get scanCapture => 'မျက်နှာကို ရိုက်ယူ';

  @override
  String get scanTurnLeft => 'ကုဗတစ်ခုလုံးကို ဘယ်ဘက်သို့ လှည့်ပါ';

  @override
  String get scanTurnRight => 'ကုဗတစ်ခုလုံးကို ညာဘက်သို့ လှည့်ပါ';

  @override
  String get scanTipTop => 'အပေါ်ဘက်ကို သင့်ဘက်သို့ ငဲ့ပါ';

  @override
  String get scanTipBottom => 'အောက်ဘက်ကို သင့်ဘက်သို့ ငဲ့ပါ';

  @override
  String get scanGlareTip =>
      'အလင်းပြန်မှု တွေ့ရသည်- ကုဗကို အနည်းငယ် စောင်းပါ၊ သို့မဟုတ် အပေါ်မီးကို ဖုန်းဖြင့် ကွယ်ပါ။';

  @override
  String get scanDimTip =>
      'မှောင်လွန်းသည်- ပိုလင်းသောနေရာသို့ ရွှေ့ပါ၊ သို့မဟုတ် ဓာတ်မီး ဖွင့်ပါ။';

  @override
  String get scanTorch => 'ဓာတ်မီး';

  @override
  String get scanGuideLabel =>
      'စကင်ဖတ်လမ်းညွှန်- စကင်ဖတ်ပြီးသော မျက်နှာများကို အရောင်ဖြင့် ပြထားသည်။ ပြန်စကင်ဖတ်ရန် ၎င်းကို နှိပ်ပါ။';

  @override
  String get scanTapToRescan =>
      'ပြန်စကင်ဖတ်ရန် စကင်ဖတ်ပြီးသော မျက်နှာကို နှိပ်ပါ။';

  @override
  String get scanCameraMissing => 'ဤစက်တွင် ကင်မရာ မတွေ့ပါ။';

  @override
  String get scanCameraDenied =>
      'ကင်မရာ အသုံးပြုခွင့်ကို ငြင်းထားသည်။ အရောင်များကို လက်ဖြင့် ထည့်နိုင်ပါသေးသည်။';

  @override
  String get scanCameraFailed => 'ကင်မရာ စတင်၍ မရပါ။';

  @override
  String get scanAllGood => 'စတစ်ကာအားလုံး မှန်ပုံရသည်။';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'စတစ်ကာ $count ခု မှားပုံရသည်',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'တစ်ခုခု မကိုက်ညီပါ';

  @override
  String scanIssueColors(int count) {
    return 'အရောင်တစ်ခုစီသည် $count ကြိမ် အတိအကျ ပါရမည်။';
  }

  @override
  String get scanIssueCenters => 'အလယ်နှစ်ခု အရောင်တူနေသည်။';

  @override
  String get scanIssuePieces =>
      'ဤစတစ်ကာများသည် တကယ့်ကုဗတွင် မရှိသော အပိုင်းများကို ဖြစ်စေသည်။';

  @override
  String get scanIssueTwist =>
      'ထောင့်တစ်ခု လှည့်နေသည်။ ထောင့်စတစ်ကာများကို စစ်ပါ။';

  @override
  String get scanIssueFlip =>
      'အနားတစ်ခု ပြောင်းပြန်ဖြစ်နေသည်။ အနားစတစ်ကာများကို စစ်ပါ။';

  @override
  String get scanIssueParity => 'အပိုင်းနှစ်ခု နေရာလဲနေပုံရသည်။';

  @override
  String get scanIssueUnavailable => 'ဤစက်တွင် အရောင်စစ်ဆေးခြင်း မရနိုင်ပါ။';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'စတစ်ကာ $count ခုကို ဖတ်ရခက်ခဲ့သည်- အမြန် တစ်ချက်ကြည့်ပေးပါ။',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'အရောင်ပြောင်းရန် စတစ်ကာကို နှိပ်ပါ · အရောင်စာရင်းအတွက် ဖိထားပါ';

  @override
  String get scanRescanFace => 'မျက်နှာတစ်ခု ပြန်စကင်ဖတ်';

  @override
  String get scanCancelRescan => 'အရောင်များသို့ ပြန်သွား';

  @override
  String get scanPaletteTitle => 'အရောင်ရွေးပါ';

  @override
  String get scanOpen3d => '3D တွင် ဖွင့်';

  @override
  String get scanRestart => 'အစမှ ပြန်စ';

  @override
  String get modeTimer => 'အမြန်ဖြေ အချိန်တိုင်းကိရိယာ';

  @override
  String get modeTimerDesc =>
      'ရောမွှေမှုများ၊ စစ်ဆေးချိန်၊ ပျမ်းမျှနှင့် ကိုယ်ပိုင်အကောင်းဆုံးများ။';

  @override
  String get modeDaily => 'နေ့စဉ် စိန်ခေါ်မှု';

  @override
  String get modeDailyDesc =>
      'နေ့တိုင်း ရောမွှေမှုအသစ်။ ဆက်တိုက်ရက်ကို မပြတ်စေပါနှင့်။';

  @override
  String get modePatterns => 'ပုံစံ စာကြည့်တိုက်';

  @override
  String get modePatternsDesc =>
      'စစ်တုရင်ကွက်၊ superflip နှင့် အခြားများကို 3D တွင် ပြသည်။';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ဆက်တိုက် $count ရက်',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'ဆက်လေ့လာရန်';

  @override
  String get startLearning => 'စလေ့လာရန်';

  @override
  String lessonOf(int index, int total) {
    return 'သင်ခန်းစာ $index / $total';
  }

  @override
  String get academyAllDone => 'သင်ခန်းစာအားလုံး ပြီးပါပြီ။';

  @override
  String get academyTitle => 'အကယ်ဒမီ';

  @override
  String academyProgress(int done, int total) {
    return 'သင်ခန်းစာ $total ခုအနက် $done ခု ပြီးပြီ';
  }

  @override
  String get lessonAdvanced => 'အဆင့်မြင့်';

  @override
  String lessonPartOf(int index, int total) {
    return 'အပိုင်း $index / $total';
  }

  @override
  String get lessonNext => 'ရှေ့သို့';

  @override
  String get lessonPrevious => 'နောက်သို့';

  @override
  String get lessonFinish => 'သင်ခန်းစာ အဆုံးသတ်';

  @override
  String get lessonComplete => 'သင်ခန်းစာ ပြီးပါပြီ။';

  @override
  String get lessonNextLesson => 'နောက်သင်ခန်းစာ';

  @override
  String get lessonBackToAcademy => 'အကယ်ဒမီသို့ ပြန်သွား';

  @override
  String get lessonTryIt =>
      'သင့်အလှည့်- မြှားပြသော အလွှာကို ပွတ်ဆွဲပါ၊ သို့မဟုတ် ရှေ့သို့ ကို နှိပ်ပါ။';

  @override
  String get lessonLookAround =>
      'ကုဗကို ဘက်ပေါင်းစုံမှ ကြည့်ရန် နောက်ခံကို ဆွဲပါ။';

  @override
  String get lessonDemoDone => 'ကောင်းတယ်။ ဆက်ရန် ရှေ့သို့ ကို နှိပ်ပါ။';

  @override
  String holdPrompt(String top, String front) {
    return '$top အလယ်ကို အပေါ်တွင်၊ $front အလယ်ကို သင့်ဘက်သို့ မူ၍ ကုဗကို ကိုင်ပါ။';
  }

  @override
  String get trackBeginner => '3×3 အခြေခံ- သရဖူ ၃ ခု';

  @override
  String get trackCfop => 'CFOP မိတ်ဆက်';

  @override
  String get trackTwoByTwo => '2×2 အခြေခံနှင့် Ortega';

  @override
  String get trackBigCubes => 'ကုဗကြီးများ- လျှော့ချနည်းနှင့် parity';

  @override
  String moveSentence(String layer, String direction) {
    return '$layerကို $direction လှည့်ပါ';
  }

  @override
  String get moveFaceR => 'ညာမျက်နှာ';

  @override
  String get moveFaceL => 'ဘယ်မျက်နှာ';

  @override
  String get moveFaceU => 'အပေါ်မျက်နှာ';

  @override
  String get moveFaceD => 'အောက်မျက်နှာ';

  @override
  String get moveFaceF => 'ရှေ့မျက်နှာ';

  @override
  String get moveFaceB => 'နောက်မျက်နှာ';

  @override
  String moveLayerInner(int depth, String face) {
    return '$faceမှ $depth ခုမြောက် အလွှာ';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face (အလွှာ $depth ထပ်)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '$faceမှ အလွှာ $near–$far';
  }

  @override
  String get moveLayerMiddle => 'အလယ်အလွှာ';

  @override
  String get moveDirUp => 'အပေါ်သို့';

  @override
  String get moveDirDown => 'အောက်သို့';

  @override
  String get moveDirLeft => 'ဘယ်ဘက်သို့';

  @override
  String get moveDirRight => 'ညာဘက်သို့';

  @override
  String get moveDirClockwise => 'နာရီလက်တံအတိုင်း';

  @override
  String get moveDirCounter => 'နာရီလက်တံ ပြောင်းပြန်';

  @override
  String get moveDirBackClockwise => 'နောက်ဘက်မှကြည့်လျှင် နာရီလက်တံအတိုင်း';

  @override
  String get moveDirBackCounter => 'နောက်ဘက်မှကြည့်လျှင် နာရီလက်တံ ပြောင်းပြန်';

  @override
  String get moveDirHalf => 'တစ်ဝက်ပတ် (နှစ်ကြိမ်)';

  @override
  String get moveRotateX =>
      'ကုဗတစ်ခုလုံးကို ငဲ့ပါ- ရှေ့မျက်နှာ အပေါ်သို့ ရောက်သည်';

  @override
  String get moveRotateXPrime =>
      'ကုဗတစ်ခုလုံးကို ငဲ့ပါ- ရှေ့မျက်နှာ အောက်သို့ ရောက်သည်';

  @override
  String get moveRotateX2 =>
      'ကုဗတစ်ခုလုံးကို လှန်ပါ- ရှေ့မျက်နှာ နောက်သို့ ရောက်သည်';

  @override
  String get moveRotateY =>
      'ကုဗတစ်ခုလုံးကို လှည့်ပါ- ရှေ့မျက်နှာ ဘယ်သို့ ရောက်သည်';

  @override
  String get moveRotateYPrime =>
      'ကုဗတစ်ခုလုံးကို လှည့်ပါ- ရှေ့မျက်နှာ ညာသို့ ရောက်သည်';

  @override
  String get moveRotateY2 =>
      'ကုဗတစ်ခုလုံးကို တစ်ဝက်ပတ် လှည့်ပါ- နောက်မျက်နှာ ရှေ့သို့ ရောက်လာသည်';

  @override
  String get moveRotateZ =>
      'ကုဗတစ်ခုလုံးကို နာရီလက်တံအတိုင်း လှိမ့်ပါ- အပေါ်မျက်နှာ ညာသို့ ရောက်သည်';

  @override
  String get moveRotateZPrime =>
      'ကုဗတစ်ခုလုံးကို နာရီလက်တံ ပြောင်းပြန် လှိမ့်ပါ- အပေါ်မျက်နှာ ဘယ်သို့ ရောက်သည်';

  @override
  String get moveRotateZ2 =>
      'ကုဗတစ်ခုလုံးကို ဇောက်ထိုး လှန်ပါ- အပေါ်မျက်နှာ အောက်သို့ ရောက်သည်';

  @override
  String get phaseReductionCenters => 'အလယ်များ';

  @override
  String get phaseReductionEdges => 'အနားများကို တွဲ';

  @override
  String get phaseReductionEdgeParity => 'အနား parity';

  @override
  String get phaseReductionOllParity => 'OLL parity';

  @override
  String get phaseReductionPllParity => 'PLL parity';

  @override
  String get explainReductionCenterBlock =>
      'အလယ်အပိုင်း အများအပြားကို တစ်ပြိုင်နက် နေရာပြန်ပို့သော အတွင်းအလွှာ လှည့်ခြင်းများ။';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'ပြီးသားအလယ်များကို မထိဘဲ 3-cycle ဖြင့် $piece အလယ်အပိုင်းကို ၎င်း၏မျက်နှာသို့ ပို့ပါ။';
  }

  @override
  String get explainReductionParityCenters =>
      'parity လှည့်ခြင်းကြောင့် ရွေ့သွားသော အလယ်များကို ပြန်ဖွဲ့ပါ။';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '$piece အနားအပိုင်းများကို 3-cycle ဖြင့် ပေါင်းပါ- အလယ်များ မပျက်ပါ။';
  }

  @override
  String get explainReductionEdgeParity =>
      'နောက်ဆုံးအနားများကို 3-cycle သက်သက်ဖြင့် တွဲ၍မရပါ (အနား parity)။ အတွင်းအလွှာ လှည့်ခြင်း တစ်ကြိမ်က ပြင်ပေးသည်။';

  @override
  String get explainReductionOllParity =>
      'OLL parity- အနားတစ်ခု ပြောင်းပြန်ဖြစ်နေသည်၊ 3×3 တွင် မဖြစ်နိုင်ပါ။ ဤဖော်မြူလာက ပြန်လှန်ပေးသည်။';

  @override
  String get explainReductionPllParity =>
      'PLL parity- အနားနှစ်ခု နေရာလဲနေသည်၊ 3×3 တွင် မဖြစ်နိုင်ပါ။ ဤဖော်မြူလာက ပြန်လဲပေးသည်။';

  @override
  String get patternsTitle => 'ပုံစံ စာကြည့်တိုက်';

  @override
  String get patternsHint =>
      'ကြည့်ရန် ပုံစံတစ်ခုကို နှိပ်ပြီး သင့်ကုဗပေါ်တွင် လိုက်လုပ်ပါ။';

  @override
  String get patternCheckerboard => 'စစ်တုရင်ကွက်';

  @override
  String get patternCubeInCube => 'ကုဗထဲက ကုဗ';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'အစက်များ';

  @override
  String get patternCross => 'ကြက်ခြေ';

  @override
  String get patternPython => 'စပါးကြီးမြွေ';

  @override
  String get phasePattern => 'ပုံစံ ဖန်တီး';

  @override
  String get explainPatternStep =>
      'လှုပ်ရှားမှုတိုင်းကို သင့်ကုဗပေါ်တွင် လိုက်လုပ်ပါ။ ပုံမှန်ပြန်ဖြစ်ရန် ဖြေရှင်း ကို နှိပ်ပါ။';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'အမြန်ဖြေ အချိန်တိုင်းကိရိယာ';

  @override
  String get timerHoldToStart => 'ဖိထားပြီး စတင်ရန် လွှတ်ပါ';

  @override
  String get timerReleaseToStart => 'စတင်ရန် လွှတ်ပါ';

  @override
  String get timerTapToStop => 'ရပ်ရန် မည်သည့်နေရာမဆို နှိပ်ပါ';

  @override
  String get timerInspecting => 'စစ်ဆေးချိန်- ဖိထားပြီး စတင်ရန် လွှတ်ပါ';

  @override
  String get timerTapToInspect => '၁၅ စက္ကန့် စစ်ဆေးချိန် စတင်ရန် နှိပ်ပါ';

  @override
  String get timerInspectionToggle => '၁၅ စက္ကန့် စစ်ဆေးချိန်';

  @override
  String get timerLoadingScramble => 'ရောမွှေမှု ဖန်တီးနေသည်…';

  @override
  String get timerPb => 'အကောင်းဆုံး';

  @override
  String get timerSolves => 'ဖြေရှင်းမှုများ';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'ဖျက်';

  @override
  String get timerHistory => 'မှတ်တမ်း';

  @override
  String get timerNoSolves =>
      'ဖြေရှင်းမှု မရှိသေးပါ။ ကုဗကို ရောမွှေပြီး စလိုက်ပါ။';

  @override
  String get timerNewPb => 'ကိုယ်ပိုင် စံချိန်သစ်။';

  @override
  String get timerClearHistory => 'မှတ်တမ်း ရှင်းလင်း';

  @override
  String get timerScrambleHint =>
      'အဖြူကို အပေါ်၊ အစိမ်းကို ရှေ့တွင်ထား၍ ရောမွှေပါ-';

  @override
  String get dailyTitle => 'နေ့စဉ် စိန်ခေါ်မှု';

  @override
  String dailyFor(String date) {
    return '$date အတွက် စိန်ခေါ်မှု';
  }

  @override
  String dailyBestStreak(int count) {
    return 'အကောင်းဆုံး ဆက်တိုက်ရက်- $count';
  }

  @override
  String get dailyDone => 'ဒီနေ့အတွက် ပြီးပါပြီ။ မနက်ဖြန် ပြန်လာခဲ့ပါ။';

  @override
  String get dailyNotDone =>
      'ဆက်တိုက်ရက် မပြတ်စေရန် ဒီနေ့ ရောမွှေမှုကို ဖြေရှင်းပါ။';

  @override
  String get dailySolveVirtual => '3D ကုဗပေါ်တွင် ဖြေရှင်း';

  @override
  String get dailyTimeIt => 'သင့်ကုဗပေါ်တွင် အချိန်တိုင်း';

  @override
  String get dailyHint => 'အရိပ်အမြွက်';

  @override
  String dailyHintText(String moves) {
    return 'အဖြူကြက်ခြေဖြင့် စပါ- $moves';
  }

  @override
  String get dailyHintFailed => 'ယခု အရိပ်အမြွက် မရနိုင်ပါ။';

  @override
  String get lessonBasics => 'ကုဗနှင့် မိတ်ဆက်';

  @override
  String get lessonBasicsDesc =>
      'အပိုင်းများ၊ မျက်နှာများနှင့် လှုပ်ရှားမှု အမည်များ။';

  @override
  String get stepBasicsPieces => 'အပိုင်း သုံးမျိုး';

  @override
  String get stepBasicsPiecesBody =>
      'အလယ်များသည် ဘယ်တော့မှ မရွေ့ဘဲ မျက်နှာတစ်ခုစီ၏ အရောင်ကို သတ်မှတ်သည်။ အနားများတွင် အရောင်နှစ်ရောင်၊ ထောင့်များတွင် သုံးရောင် ရှိသည်။ ဖြေရှင်းခြင်းဆိုသည်မှာ အနားနှင့် ထောင့်တိုင်းကို ကိုက်ညီသော အလယ်များဘေးသို့ ရွှေ့ခြင်းဖြစ်သည်။';

  @override
  String get stepBasicsFaces => 'မျက်နှာ အက္ခရာ ခြောက်လုံး';

  @override
  String get stepBasicsFacesBody =>
      'R၊ L၊ U၊ D၊ F နှင့် B တို့သည် ညာ၊ ဘယ်၊ အပေါ်၊ အောက်၊ ရှေ့နှင့် နောက် မျက်နှာများ ဖြစ်သည်။ အက္ခရာတစ်လုံးတည်းဆိုလျှင် ထိုမျက်နှာကို တည့်တည့်ကြည့်နေသကဲ့သို့ နာရီလက်တံအတိုင်း လေးပုံတစ်ပုံ လှည့်ခြင်းဖြစ်သည်။';

  @override
  String get stepBasicsPrime => 'ပြောင်းပြန်နှင့် နှစ်ဆလှည့်ခြင်း';

  @override
  String get stepBasicsPrimeBody =>
      'ပုဒ်ဖြတ်အမှတ် (R\') သည် အခြားဘက်၊ နာရီလက်တံ ပြောင်းပြန် လှည့်ခြင်းဖြစ်သည်။ 2 (U2) သည် တစ်ဝက်ပတ်- လေးပုံတစ်ပုံ နှစ်ကြိမ် ဖြစ်သည်။';

  @override
  String get stepCrossGoal => 'ပန်းတိုင်';

  @override
  String get stepCrossGoalBody =>
      'အဝါကို အပေါ်တွင် ထားပါ။ အဖြူအနား လေးခုသည် အောက်ရှိ အဖြူအလယ်ကို ဝိုင်းထားပြီး တစ်ခုစီ၏ ဘေးအရောင်သည် ဘေးရှိ အလယ်နှင့် ကိုက်ညီသည်။';

  @override
  String get stepCrossTop => 'အပေါ်ရှိ အနား';

  @override
  String get stepCrossTopBody =>
      'အပေါ်တွင် အဖြူအနားတစ်ခု ရှာပါ။ ၎င်း၏ဘေးအရောင်သည် ကိုက်ညီသော အလယ်အပေါ် ရောက်သည်အထိ အပေါ်ကို လှည့်ပြီး ထိုမျက်နှာကို နှစ်ကြိမ်လှည့်၍ ချပါ။';

  @override
  String get stepCrossMiddle => 'အလယ်ရှိ အနား';

  @override
  String get stepCrossMiddleBody =>
      'အလယ်အလွှာတွင် ပိတ်မိနေသော အနားကို အရင် အပေါ်တင်ပါ- ၎င်း၏ဘေးမျက်နှာကို အပေါ်လှည့်၊ အပေါ်ကို ဖယ်ပြီး ဘေးမျက်နှာကို ပြန်လှည့်ပါ၊ ကြက်ခြေ မပျက်ပါ။ ထို့နောက် အပေါ်မှ နေရာချပါ။';

  @override
  String get stepCornersInsert => 'နေရာအပေါ်တည့်တည့်';

  @override
  String get stepCornersInsertBody =>
      'အဖြူထောင့်တစ်ခုသည် ၎င်း၏အရောင်များ နေရာ (ရှေ့ညာ) အပေါ် ရောက်သည်အထိ အပေါ်ကို လှည့်ပါ။ R U R\' U\' က ၎င်းကို အောက်သို့ ချပေးသည်။';

  @override
  String get stepCornersRepeat => 'အစီအစဉ်ကို ထပ်လုပ်';

  @override
  String get stepCornersRepeatBody =>
      'အဖြူ မှားသောဘက် မူနေလျှင် နေရာတစ်ခုတည်းပေါ်တွင် R U R\' U\' ကို ဆက်ထပ်လုပ်ပါ။ ထောင့်တိုင်းသည် အများဆုံး ငါးကြိမ်အတွင်း ပြီးသည်။';

  @override
  String get stepMiddleRight => 'အနားကို ညာဘက်သို့';

  @override
  String get stepMiddleRightBody =>
      'အပေါ်အနားတစ်ခုကို ရှေ့ရှိ ၎င်း၏အလယ်နှင့် တန်းစီပါ။ ၎င်း၏ အပေါ်အရောင်သည် ညာအလယ်နှင့် ကိုက်ညီလျှင် U R U\' R\' U\' F\' U F ဖြင့် ထည့်ပါ။';

  @override
  String get stepMiddleLeft => 'အနားကို ဘယ်ဘက်သို့';

  @override
  String get stepMiddleLeftBody =>
      '၎င်း၏ အပေါ်အရောင်သည် ဘယ်အလယ်နှင့် ကိုက်ညီလျှင် ကြေးမုံပုံစံကို သုံးပါ- U\' L\' U L U F U\' F\'။';

  @override
  String get stepYellowCross => 'ဖော်မြူလာ တစ်ခု';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' သည် အဝါအစက်ကို L ပုံ၊ L ကို မျဉ်း၊ မျဉ်းကို ကြက်ခြေ အဖြစ် ပြောင်းပေးသည်။ L ကို နောက်ဘယ်တွင်၊ မျဉ်းကို အလျားလိုက် ထားပါ။';

  @override
  String get stepYellowEdges => 'အနားများကို ကိုက်ညီစေ';

  @override
  String get stepYellowEdgesBody =>
      'အနားနှစ်ခု ၎င်းတို့၏ အလယ်များနှင့် ကိုက်ညီသည်အထိ အပေါ်ကို လှည့်ပါ။ တစ်ခု နောက်ဘက်၊ တစ်ခု ညာဘက်တွင် ရှိလျှင် R U R\' U R U2 R\' U က ကျန်နှစ်ခုကို နေရာလဲပေးသည်။';

  @override
  String get stepPlaceCorners => 'နေရာချ';

  @override
  String get stepPlaceCornersBody =>
      'နေရာမှန်ပြီးသား ထောင့်တစ်ခုကို ရှေ့ညာတွင် ထားပါ။ U R U\' L\' U R\' U\' L က ကျန်သုံးခုကို ရွှေ့ပေးသည်- လေးခုလုံး နေရာကျသည်အထိ ထပ်လုပ်ပါ။';

  @override
  String get stepTwistCorners => 'လှည့်ညှိ';

  @override
  String get stepTwistCornersBody =>
      'မဖြေရှင်းရသေးသော ထောင့်ကို ရှေ့ညာတွင်ထား၍ အဝါ အပေါ်ရောက်သည်အထိ R\' D\' R D ကို ထပ်လုပ်ပြီး နောက်တစ်ခုကို ယူလာရန် အပေါ်ကိုသာ လှည့်ပါ။ အောက်ပိုင်းသည် အဆုံးထိ ပျက်နေသလို မြင်ရမည်- ဆက်လုပ်ပါ။';

  @override
  String get lessonCfopIntro => 'CFOP ဆိုတာ ဘာလဲ။';

  @override
  String get lessonCfopIntroDesc => 'Cross၊ F2L၊ OLL၊ PLL။';

  @override
  String get stepCfopOverview => 'အဆင့် လေးဆင့်';

  @override
  String get stepCfopOverviewBody =>
      'Speedcuber များသည် ကြက်ခြေကို ဖြေရှင်းပြီး ပထမအလွှာ ထောင့်တစ်ခုစီကို ၎င်း၏ အလယ်အနားနှင့် တွဲကာ (F2L)၊ နောက်ဆုံးအလွှာ၏ ဦးတည်ရာကို ညှိ (OLL) ပြီး နောက်ဆုံးတွင် နေရာချ (PLL) သည်။';

  @override
  String get stepCfopCross => 'ကြက်ခြေကို စီစဉ်';

  @override
  String get stepCfopCrossBody =>
      'CFOP တွင် ကြက်ခြေကို စစ်ဆေးချိန်အတွင်း စီစဉ်ပြီး အောက်ဘက်တွင် လှုပ်ရှားမှု ရှစ်ကြိမ်ခန့်ဖြင့် ဖွဲ့သည်။';

  @override
  String get lessonF2l => 'F2L အခြေခံ';

  @override
  String get lessonF2lDesc => 'ထောင့်တစ်ခုကို ၎င်း၏အနားနှင့် တွဲပါ။';

  @override
  String get stepF2lRight => 'အတွဲတစ်ခု ထည့်';

  @override
  String get stepF2lRightBody =>
      'ထောင့်နှင့် ၎င်း၏အနား အပေါ်တွင် ဘေးချင်းကပ်လျက်ရှိလျှင် ၎င်းတို့၏နေရာအပေါ် ယူလာပြီး အတူတကွ ထည့်ပါ။';

  @override
  String get stepF2lLeft => 'ဘယ်လက် အတွဲ';

  @override
  String get stepF2lLeftBody =>
      'အခြားဘက်ရှိ တူညီသော အခြေအနေသည် ကြေးမုံပုံစံ U\' L\' U L ဖြစ်သည်။ ကုဗကို လှည့်ခြင်း (y) ဖြင့် လွယ်ကူသောလက်ကို သုံးနိုင်သည်။';

  @override
  String get lessonOll => 'နှစ်ကြိမ်ကြည့် OLL';

  @override
  String get lessonOllDesc => 'အပေါ်ကို အဝါဖြစ်စေပါ။';

  @override
  String get stepOllCross => 'အနားများ အရင်';

  @override
  String get stepOllCrossBody =>
      'နှစ်ကြိမ်ကြည့် OLL သည် သင်သိပြီးသား အဝါကြက်ခြေ ဖော်မြူလာဖြင့် စသည်။';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'ရှေ့ဘယ်တွင် အဝါထောင့်တစ်ခု အပေါ်မူနေလျှင် Sune (R U R\' U R U2 R\') က ကျန်သုံးခုကို ညှိပေးသည်။ အခြားအခြေအနေ အများစုသည် Sune နှင့် ၎င်း၏ ကြေးမုံပုံစံကို သုံးသည်။';

  @override
  String get lessonPll => 'နှစ်ကြိမ်ကြည့် PLL';

  @override
  String get lessonPllDesc => 'ကုဗကို အပြီးသတ်ပါ။';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm သည် ထောင့်နှစ်ခုနှင့် အနားနှစ်ခုကို နေရာလဲသည်။ ထောင့်များ နေရာချရန် သုံးပါ- နေရာလဲရမည့် ထောင့်နှစ်ခုကို ညာဘက်တွင် ထားပါ။';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'ထောင့်များ ပြီးလျှင် U-perm က အနားသုံးခုကို လည်ပတ်ရွှေ့သည်။ ပြီးသားဘက်ကို နောက်တွင် ထားပါ။';

  @override
  String get lessonTwoFirst => '2×2 ပထမအလွှာ';

  @override
  String get lessonTwoFirstDesc =>
      'ကိုက်ညီသော ထောင့်များဖြင့် ဘက်တစ်ဘက် ဖွဲ့ပါ။';

  @override
  String get stepTwoIntro => 'ထောင့်များသာ';

  @override
  String get stepTwoIntroBody =>
      '2×2 သည် အနားနှင့် အလယ်မပါသော 3×3 ဖြစ်သည်။ အရောင်တစ်ခု ရွေးပြီး ထိုမျက်နှာကို အောက်တွင် ဖွဲ့ကာ ကပ်လျက်ထောင့်များ၏ ဘေးအရောင်များကို ကိုက်ညီစေပါ။';

  @override
  String get stepTwoCorner => 'ထောင့်များ ထည့်';

  @override
  String get stepTwoCornerBody =>
      '3×3 ၏ အဖြူထောင့်များအတိုင်း- ထောင့်ကို ၎င်း၏နေရာအပေါ် ယူလာပြီး ကိုက်သည်အထိ R U R\' U\' ကို သုံးပါ။';

  @override
  String get lessonTwoOll => 'အပေါ်ကို ညှိ';

  @override
  String get lessonTwoOllDesc => 'Sune ဖြင့် Ortega OLL။';

  @override
  String get stepTwoSune => 'Sune ပြန်လာပြီ';

  @override
  String get stepTwoSuneBody =>
      'Sune သည် 2×2 ၏ အပေါ်ကိုလည်း အဝါဖြစ်စေသည်။ Ortega ဖြေရှင်းသူများသည် တိုတောင်းသော အခြေအနေ ခုနစ်ခုကို သင်ယူကြပြီး Sune နှင့် ၎င်း၏ ကြေးမုံပုံစံက အများစုကို လွှမ်းခြုံသည်။';

  @override
  String get lessonTwoPbl => 'အလွှာနှစ်ခုလုံးကို နေရာချ';

  @override
  String get lessonTwoPblDesc => 'အပြီးသတ်ရန် ထောင့်များကို နေရာလဲပါ။';

  @override
  String get stepTwoAdjacent => 'ကပ်လျက် နေရာလဲ';

  @override
  String get stepTwoAdjacentBody =>
      'ကပ်လျက်ရှိ အပေါ်ထောင့်နှစ်ခုကို နေရာလဲရမည်ဆိုလျှင် ၎င်းတို့ကို ညာဘက်တွင်ထား၍ T-perm ကို သုံးပါ။';

  @override
  String get stepTwoDiagonal => 'ထောင့်ဖြတ် နေရာလဲ';

  @override
  String get stepTwoDiagonalBody =>
      'ဆန့်ကျင်ဘက်နေရာရှိ ထောင့်နှစ်ခုကို Y-perm ဖြင့် နေရာလဲပါ။';

  @override
  String get lessonBigIntro => 'ကုဗကြီး၏ အပိုင်းများ';

  @override
  String get lessonBigIntroDesc => 'အလယ်များ၊ အတောင်များနှင့် အတွင်းအလွှာများ။';

  @override
  String get stepBigPieces => 'ပုံသေ အလယ် မရှိ';

  @override
  String get stepBigPiecesBody =>
      '4×4 တွင် မျက်နှာတစ်ခုစီ၌ ရွေ့လျားနိုင်သော အလယ်အပိုင်း လေးခု ရှိပြီး အနားတစ်ခုစီသည် အတောင်နှစ်ခုဖြင့် ဖွဲ့စည်းထားသည်။ လျှော့ချနည်းက ၎င်းတို့ကို စုစည်းပေး၍ ကုဗသည် 3×3 ကဲ့သို့ ပြုမူသည်။';

  @override
  String get stepBigSlices => 'နှစ်ထပ်နှင့် အတွင်း လှည့်ခြင်း';

  @override
  String get stepBigSlicesBody =>
      'Rw သည် ညာဘက် အလွှာနှစ်ခုကို အတူလှည့်သည်။ 2R သည် ညာမှ ဒုတိယအလွှာကိုသာ လှည့်သည်။ ဤလှည့်ခြင်းများက အလယ်နှင့် အတောင်များကို ရွှေ့သည်။';

  @override
  String get lessonBigCenters => 'အလယ်များ';

  @override
  String get lessonBigCentersDesc => 'အလယ်အပိုင်းများကို စုစည်းပါ။';

  @override
  String get stepBigCenterCycle => 'အလယ် 3-cycle';

  @override
  String get stepBigCenterCycleBody =>
      'ဤ commutator သည် အလယ်အပိုင်း သုံးခုကိုသာ ရွှေ့ပြီး ကျန်အားလုံးကို မထိသဖြင့် ပြီးသားအလယ်များ မပျက်ပါ။';

  @override
  String get lessonBigEdges => 'အနားများကို တွဲ';

  @override
  String get lessonBigEdgesDesc => 'အတောင်များကို အနားအပြည့်အဖြစ် ပေါင်းပါ။';

  @override
  String get stepBigEdgePair => 'တွဲပြီး ပြန်ထား';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' က ကိုက်ညီသော အတောင်နှစ်ခုကို တန်းစီပေး၊ R U R\' F R\' F\' R က မတွဲရသေးသော အနားကို လဲထည့်ပြီး Uw က အလယ်များကို ပြန်ထားပေးသည်။';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => 'စုံကုဗများပေါ်ရှိ OLL နှင့် PLL parity။';

  @override
  String get stepBigOllParity => 'OLL parity';

  @override
  String get stepBigOllParityBody =>
      '3×3 တွင် အနားတစ်ခုတည်း ပြောင်းပြန်ဖြစ်ခြင်း မဖြစ်နိုင်ပါ။ စုံကုဗများတွင် ဤဖော်မြူလာက အပေါ်-ရှေ့ အနားကို ပြန်လှန်ပေးသည်။ အပေါ်အလွှာ၏ ကျန်ပိုင်းကို ရောသွားစေနိုင်သော်လည်း နောက်ဆုံး 3×3 အဆင့်များက ပြင်ပေးမည်ဖြစ်သည်။';

  @override
  String get stepBigPllParity => 'PLL parity';

  @override
  String get stepBigPllParityBody =>
      'အဆုံးတွင် အနားနှစ်ခု နေရာလဲနေသလား။ 2R2 U2 2R2 Uw2 2R2 Uw2 က အပေါ်ရှိ ရှေ့နှင့် နောက် အနားများကို နေရာလဲပေးသည်။';

  @override
  String get introGoalHeading => 'ပန်းတိုင်က ဘာလဲ။';

  @override
  String get introHowHeading => 'ဘယ်လို လုပ်မလဲ။';

  @override
  String get introStart => 'နားလည်ပြီ၊ တစ်ဆင့်ချင်း စမည်';

  @override
  String get introDontShowAgain => 'အလိုအလျောက် ထပ်မပြပါနှင့်';

  @override
  String get introShowGoal => 'ပန်းတိုင်ကို ပြ';

  @override
  String get introStateStart => 'အစ';

  @override
  String get introStateGoal => 'ပန်းတိုင်';

  @override
  String get introPlayMorph => 'အစမှ ပန်းတိုင်အထိ ဖွင့်ပြ';

  @override
  String get introGoalBasics =>
      'ကုဗကို ဖတ်တတ်အောင် သင်ယူပါ- ၎င်း၏အပိုင်းများ၊ မျက်နှာ ခြောက်ခုနှင့် လှုပ်ရှားမှု အက္ခရာများက ၎င်းတို့ကို မည်သို့လှည့်သည်ကို။';

  @override
  String get introGoalCross =>
      'အဖြူအနားတိုင်းသည် ဘေးရှိ အလယ်အရောင်နှင့်ပါ ကိုက်ညီသော အဖြူအပေါင်းလက္ခဏာကို ဖွဲ့ပါ။';

  @override
  String get introGoalCorners =>
      'ပထမသရဖူ၊ အဖြူအလွှာတစ်ခုလုံး ပြီးစေရန် အဖြူထောင့် လေးခုကို ဖြည့်ပါ။';

  @override
  String get introGoalMiddle =>
      'ပထမအလွှာနှစ်ခု ပြီးစေရန် အလယ်အလွှာ အနား လေးခုကို နေရာချပါ။';

  @override
  String get introGoalYellowCross =>
      'အပေါ်တွင် အဝါအပေါင်းလက္ခဏာ ဖွဲ့ပါ- ဘေးအရောင်များ ကိုက်ညီရန် မလိုသေးပါ။';

  @override
  String get introGoalYellowEdges =>
      'အဝါကြက်ခြေ အနားတိုင်းကို ၎င်း၏ဘေးရှိ အလယ်အရောင်နှင့် တန်းစီပါ။';

  @override
  String get introGoalYellowCorners =>
      'အဝါထောင့်တိုင်းကို လှည့်နေသေးလျှင်ပင် ၎င်း၏ကိုယ်ပိုင်နေရာသို့ ရွှေ့ပါ။';

  @override
  String get introGoalTwistCorners =>
      'ကုဗတစ်ခုလုံး ဖြေရှင်းပြီးစေရန် အဝါထောင့်များကို မှန်ကန်သောဘက်သို့ လှည့်ပါ။';

  @override
  String get introGoalCfopIntro =>
      'Speedcubing အစီအစဉ်ကို ကြည့်ပါ- ကြက်ခြေ၊ ပထမအလွှာနှစ်ခု၊ ထို့နောက် နောက်ဆုံးအလွှာကို နှစ်ကြိမ်ကြည့်ဖြင့်။';

  @override
  String get introGoalF2l =>
      'အဖြူထောင့်တစ်ခုစီကို ၎င်း၏ အလယ်အနားနှင့်အတူ ထည့်၍ အလွှာနှစ်ခုကို တစ်ပြိုင်နက် ပြီးစေပါ။';

  @override
  String get introGoalOll =>
      'ဖော်မြူလာ တစ်ခု သို့မဟုတ် နှစ်ခုဖြင့် အပေါ်မျက်နှာတစ်ခုလုံးကို အဝါဖြစ်စေပါ။';

  @override
  String get introGoalPll =>
      'ကုဗကို အပြီးသတ်ရန် နောက်ဆုံးအလွှာ အပိုင်းများကို ၎င်းတို့နေရာသို့ ရွှေ့ပါ။';

  @override
  String get introGoalTwoFirst =>
      '2×2 ပေါ်တွင် ပြည့်စုံသော အဖြူအလွှာ တစ်ခု ဖွဲ့ပါ။';

  @override
  String get introGoalTwoOll => '2×2 ၏ အပေါ်မျက်နှာကို အဝါအပြည့် ဖြစ်စေပါ။';

  @override
  String get introGoalTwoPbl =>
      '2×2 ကို ဖြေရှင်းရန် နောက်ဆုံးထောင့်များကို နေရာလဲပါ။';

  @override
  String get introGoalBigIntro =>
      '4×4 နှင့် မိတ်ဆက်ပါ- အလယ်များ၊ အနားတွဲများ၊ ထောင့်များနှင့် ၎င်းတို့ကို လှည့်သော လှုပ်ရှားမှုများ။';

  @override
  String get introGoalBigCenters =>
      'မျက်နှာတစ်ခုစီ၏ အလယ်အပိုင်းများကို အရောင်တစ်မျိုးတည်း အကွက်တစ်ခုအဖြစ် စုပါ။';

  @override
  String get introGoalBigEdges =>
      'အနားတိုင်းသည် 3×3 အနားတစ်ခုတည်းကဲ့သို့ မြင်ရစေရန် ကိုက်ညီသော အနားအပိုင်းများကို တွဲပါ။';

  @override
  String get introGoalBigParity =>
      '3×3 တွင် ဘယ်တော့မှ မရှိသော 4×4 အခြေအနေ နှစ်ခုကို ပြင်ပါ- အနားတစ်ခု ပြောင်းပြန် သို့မဟုတ် အနားနှစ်ခု နေရာလဲ။';

  @override
  String get introHowBasics =>
      'အလယ်များ ဘယ်တော့မှ မရွေ့သဖြင့် မျက်နှာတစ်ခုစီ၏ အရောင်ကို ပြသည်။\nအက္ခရာတစ်လုံးစီသည် မျက်နှာတစ်ခုကို နာရီလက်တံအတိုင်း လေးပုံတစ်ပုံ လှည့်သည်။\nပုဒ်ဖြတ်အမှတ် (\') က ပြန်လှည့်ပြီး 2 က နှစ်ကြိမ်လှည့်သည်။';

  @override
  String get introHowCross =>
      'အဝါကို အပေါ်တွင် ထားပါ- အဖြူကြက်ခြေကို အောက်တွင် ဖွဲ့သည်။\nအဖြူအနားတစ်ခု ရှာပြီး ၎င်း၏ ဘေးအရောင်ကို ကိုက်ညီသော အလယ်နှင့် တန်းစီပါ။\nအနားကို နေရာချရန် ထိုမျက်နှာကို နှစ်ကြိမ် လှည့်ပါ။';

  @override
  String get introHowCorners =>
      'အဖြူထောင့်တစ်ခုကို ၎င်း၏ နေရာလွတ်အပေါ်သို့ ယူလာပါ။\nမှန်ကန်စွာ နေရာကျသည်အထိ R U R\' U\' ကို ထပ်လုပ်ပါ။\nကျန်ထောင့် သုံးခုကိုလည်း အလားတူလုပ်ပါ။';

  @override
  String get introHowMiddle =>
      'အဝါမပါသော အပေါ်အနားတစ်ခု ရှာပြီး ၎င်း၏ ရှေ့အရောင်ကို အလယ်နှင့် ကိုက်ညီစေပါ။\nလှုပ်ရှားမှု ၈ ကြိမ်ပါ ဖော်မြူလာတိုဖြင့် ညာ သို့မဟုတ် ဘယ်သို့ ပို့ပါ။\nအဖြူအလွှာသည် အမြဲ မပျက်ဘဲ ပြန်လာသည်။';

  @override
  String get introHowYellowCross =>
      'အပေါ်ကို ကြည့်ပါ- အစက်၊ L ပုံ သို့မဟုတ် မျဉ်း။\nပြထားသည့်အတိုင်း ကိုင်ပြီး F R U R\' U\' F\' လုပ်ပါ။\nအဝါကြက်ခြေ ပေါ်လာသည်အထိ ထပ်လုပ်ပါ။';

  @override
  String get introHowYellowEdges =>
      'အနားနှစ်ခု ၎င်းတို့၏ အလယ်များနှင့် ကိုက်ညီသည်အထိ အပေါ်ကို လှည့်ပါ။\n၎င်းတို့ကို နောက်နှင့် ညာတွင်ထား၍ R U R\' U R U2 R\' U လုပ်ပါ။\nအနား လေးခုလုံး ကိုက်ညီသည်အထိ ထပ်လုပ်ပါ။';

  @override
  String get introHowYellowCorners =>
      'ထောင့်တစ်ခု၏ အရောင်များသည် ပတ်လည်ရှိ မျက်နှာသုံးခုနှင့် ကိုက်ညီလျှင် နေရာမှန်သည်။\nနေရာမှန်ပြီးသား ထောင့်ကို ရှေ့ညာတွင် ထားပါ။\nU R U\' L\' U R\' U\' L က ကျန်သုံးခုကို အားလုံး ကိုက်သည်အထိ လည်ပတ်ရွှေ့သည်။';

  @override
  String get introHowTwistCorners =>
      'မဖြေရှင်းရသေးသော ထောင့်ကို ရှေ့ညာတွင် ထားပါ။\n၎င်း၏ အဝါ အပေါ်မူသည်အထိ R\' D\' R D ကို ထပ်လုပ်ပါ။\nနောက်တစ်ခုအတွက် အပေါ်ကိုသာ လှည့်ပါ- အောက်ပိုင်းသည် နောက်ဆုံးတွင် အလိုလို ပြန်ကောင်းသည်။';

  @override
  String get introHowCfopIntro =>
      'Cross- စစ်ဆေးချိန်အတွင်း စီစဉ်ထားသော အနား လေးခု။\nF2L- ထောင့်တစ်ခုစီသည် ၎င်း၏အနားနှင့်အတူ ဝင်သည်။\nOLL က အပေါ်ကို အဝါဖြစ်စေပြီး PLL က အပိုင်းများကို နေရာပြန်ပို့သည်။';

  @override
  String get introHowF2l =>
      'အပေါ်အလွှာတွင် ထောင့်တစ်ခုနှင့် ကိုက်ညီသော ၎င်း၏အနားကို ရှာပါ။\n၎င်းတို့၏ နေရာအပေါ်တွင် တွဲပါ။\nလှုပ်ရှားမှု သုံး သို့မဟုတ် လေးကြိမ်ဖြင့် အတွဲကို ထည့်ပါ။';

  @override
  String get introHowOll =>
      'ပထမဦးစွာ F R U R\' U\' F\' ဖြင့် အဝါကြက်ခြေ။\nထို့နောက် ထောင့်များကို ညှိပါ၊ ဥပမာ Sune ဖြင့်။\nမြင်ရသော အဝါပုံစံဖြင့် အခြေအနေကို မှတ်သားပါ။';

  @override
  String get introHowPll =>
      'အပေါ်သည် အဝါအပြည့် ဖြစ်နေပြီ။\nT-perm က ထောင့်များကို နေရာလဲပြီး U-perm က အနားသုံးခုကို လည်ပတ်ရွှေ့သည်။\nဖော်မြူလာ ရွေးရန် ဘေးအရောင်များကို ဖတ်ပါ။';

  @override
  String get introHowTwoFirst =>
      '2×2 သည် ထောင့်များသာ ရှိပြီး အနားမပါသော 3×3 နှင့် တူသည်။\nအဖြူထောင့်တစ်ခုစီကို ၎င်း၏နေရာအပေါ် ယူလာပါ။\nနေရာကျသည်အထိ R U R\' U\' ကို ထပ်လုပ်ပါ။';

  @override
  String get introHowTwoOll =>
      'အဖြူအလွှာကို အောက်တွင် ထားပါ။\nSune (R U R\' U R U2 R\') က အပေါ်ထောင့်များကို လှည့်သည်။\nအပေါ် အဝါအပြည့် ဖြစ်သည်အထိ မှန်ကန်သော ထောင့်မှ ထပ်လုပ်ပါ။';

  @override
  String get introHowTwoPbl =>
      'ထောင့်နှစ်ခု ကိုက်ညီပြီးသား ဘေးတစ်ဘက်ကို ရှာပါ။\nကပ်လျက် နေရာလဲ- T-perm ပုံစံ ဖော်မြူလာ တစ်ခု။\nထောင့်ဖြတ် နေရာလဲ- ပိုရှည်သော ဖော်မြူလာ တစ်ခု။';

  @override
  String get introHowBigIntro =>
      'ပုံသေ အလယ် မရှိပါ- အလယ်အပိုင်း လေးခုက မျက်နှာအရောင်တစ်ခုစီကို ဖွဲ့သည်။\nRw ကဲ့သို့ နှစ်ထပ်လှည့်ခြင်းက အလွှာနှစ်ခုကို တစ်ပြိုင်နက် လှည့်သည်။\n2R ကဲ့သို့ အတွင်းလှည့်ခြင်းက အတွင်းအလွှာ တစ်ခုကိုသာ လှည့်သည်။';

  @override
  String get introHowBigCenters =>
      'ဆန့်ကျင်ဘက် အလယ်နှစ်ခုကို အရင် ဖွဲ့ပါ။\nအတွင်းအလွှာများက ပြီးသားအလယ်များကို မပျက်စေဘဲ အလယ်အပိုင်းများကို နေရာလဲသည်။\nနောက်ဆုံး အလယ် လေးခုကို အလားတူ ပြီးအောင်လုပ်ပါ။';

  @override
  String get introHowBigEdges =>
      'အရောင်တူ အနားအပိုင်း နှစ်ခုကို ရှာပါ။\nအတွင်းအလွှာဖြင့် ၎င်းတို့ကို ဘေးချင်းကပ် တန်းစီပါ။\nအတွဲကို ဘေးဖယ်ထားပြီး အလယ်များကို ပြန်ထားပါ။';

  @override
  String get introHowBigParity =>
      'ပိတ်မိသည်အထိ 4×4 ကို 3×3 ကဲ့သို့ ဖြေရှင်းပါ။\nအနားတစ်ခု ပြောင်းပြန်- OLL parity ဖော်မြူလာ အရှည်။\nအနားနှစ်ခု နေရာလဲ- 2R2 U2 2R2 Uw2 2R2 Uw2။';

  @override
  String get dirFaceR => 'ညာဘက်';

  @override
  String get dirFaceL => 'ဘယ်ဘက်';

  @override
  String get dirFaceU => 'အပေါ်တန်း';

  @override
  String get dirFaceD => 'အောက်တန်း';

  @override
  String get dirFaceF => 'ရှေ့မျက်နှာ';

  @override
  String get dirFaceB => 'နောက်မျက်နှာ';

  @override
  String get dirMiddle => 'အလယ်အလွှာ';

  @override
  String get dirWholeCube => 'ကုဗတစ်ခုလုံး';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face၊ အလွှာ $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face၊ အလွှာ $depth ထပ်';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face၊ အလွှာ $near–$far';
  }

  @override
  String get dirUp => 'အပေါ်';

  @override
  String get dirDown => 'အောက်';

  @override
  String get dirLeft => 'ဘယ်';

  @override
  String get dirRight => 'ညာ';

  @override
  String get dirClockwise => 'နာရီလက်တံအတိုင်း';

  @override
  String get dirCounter => 'နာရီလက်တံ ပြောင်းပြန်';

  @override
  String get dirBackClockwise => 'နောက်မှကြည့်လျှင် နာရီလက်တံအတိုင်း';

  @override
  String get dirBackCounter => 'နောက်မှကြည့်လျှင် နာရီလက်တံ ပြောင်းပြန်';

  @override
  String get dirHalf => 'နှစ်ဆလှည့် (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'အသေးစိတ် ဖျောက်';

  @override
  String get solveExpand => 'အသေးစိတ် ပြ';

  @override
  String get dailyScrambleSteps => 'တစ်ဆင့်ချင်း ရောမွှေ';

  @override
  String get dailyScrambleGuide => '3D ရောမွှေ လမ်းညွှန်';

  @override
  String get dailyShowMoves => 'စာသား လှုပ်ရှားမှုများ ပြ';

  @override
  String get dailyHideMoves => 'စာသား လှုပ်ရှားမှုများ ဖျောက်';

  @override
  String get dailyScrambleGuideTitle => 'ရောမွှေ လမ်းညွှန်';

  @override
  String get phaseDailyScramble => 'ဒီနေ့ ကုဗကို ရောမွှေ';

  @override
  String get explainDailyScramble =>
      'ဖြေရှင်းပြီးသား ကုဗမှ စပါ၊ အဖြူ အပေါ်၊ အစိမ်း ရှေ့တွင်ထားပြီး လှည့်ခြင်းတိုင်းကို သင့်ကုဗအစစ်ပေါ်တွင် လိုက်လုပ်ပါ။';

  @override
  String get stageCenters => 'အလယ်အကွက်များ ဖွဲ့';

  @override
  String get stageEdges => 'အပြင်နှင့် အတွင်း အနားများ တွဲ';

  @override
  String get stageParity => 'Parity ဖြေရှင်းခြင်း';

  @override
  String get stageCrown1 => 'ပထမသရဖူ (အဖြူ)';

  @override
  String get stageCrown2 => 'ဒုတိယသရဖူ';

  @override
  String get stageCrown3 => 'တတိယသရဖူ (အဝါ)';

  @override
  String get stageOrient => 'အပိုင်းများ ညှိ';

  @override
  String get stageFinish => 'ကုဗကို အပြီးသတ်';

  @override
  String get stageAsThree => '3×3 ကဲ့သို့ ဖြေရှင်း';

  @override
  String get stageTwoByTwo => '2×2 ကို ဖြေရှင်း';

  @override
  String stageHeader(int number, int total, String title) {
    return 'အဆင့် $number / $total- $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'သရဖူ $crown • အဆင့် $number / $total- $title';
  }

  @override
  String get solveAllStagesDone => 'အဆင့်အားလုံး ပြီးပါပြီ။ တော်လိုက်တာ။';

  @override
  String get trackFiveByFive => '5×5 Professor\'s Cube';

  @override
  String get trackSixBySix => '6×6 ကုဗ';

  @override
  String get lessonFiveIntro => '5×5 နှင့် မိတ်ဆက်';

  @override
  String get lessonFiveIntroDesc =>
      'ပုံသေအလယ်များ၊ အလယ်တန်းများ၊ အလယ်အနားများနှင့် အတောင်များ။';

  @override
  String get introGoalFiveIntro =>
      '5×5 ကို သိကျွမ်းပါ- ပုံသေအလယ်များ၊ အလယ်တန်းများ၊ အလယ်အနားများနှင့် အတောင်များ။';

  @override
  String get introHowFiveIntro =>
      'မျက်နှာတစ်ခုစီ၏ အလယ်ဗဟိုသည် ဘယ်တော့မှ မရွေ့ပါ။\nအနားတစ်ခုစီသည် အလယ်အပိုင်း တစ်ခုနှင့် အတောင် နှစ်ခု ဖြစ်သည်။\nအတွင်းအလွှာများက အပြင်ကို မထိဘဲ အပိုင်းများကို ရွှေ့သည်။';

  @override
  String get lessonFiveCenters => '5×5 အလယ်များ';

  @override
  String get lessonFiveCentersDesc =>
      'အလယ်တစ်ခုစီကို သုံးခုတန်းများဖြင့် ဖွဲ့ပါ။';

  @override
  String get introGoalFiveCenters =>
      'မျက်နှာတိုင်း၏ 3×3 အလယ်အကွက်ကို အရောင်တစ်မျိုးတည်းဖြင့် ဖွဲ့ပါ။';

  @override
  String get introHowFiveCenters =>
      'အလယ်ဗဟိုအပိုင်းမှ စပါ- ၎င်းက အရောင်ကို ပြသည်။\nသုံးခုတန်းများ ဖွဲ့ပြီး အတွင်းအလွှာဖြင့် ထိုးသွင်းပါ။\nနောက်ဆုံး အလယ်နှစ်ခုကို အတူ ပြီးအောင်လုပ်ပါ။';

  @override
  String get lessonFiveEdges => '5×5 အနားများ';

  @override
  String get lessonFiveEdgesDesc =>
      'အတောင်နှစ်ခုကို ၎င်းတို့၏ အလယ်အနားနှင့် ပေါင်းပါ။';

  @override
  String get introGoalFiveEdges =>
      'အနား ၁၂ ခုလုံး အပိုင်းတစ်ခုတည်းကဲ့သို့ မြင်ရစေရန် အလယ်အနားတစ်ခုစီကို ၎င်း၏ အတောင်နှစ်ခုနှင့် ပေါင်းပါ။';

  @override
  String get introHowFiveEdges =>
      'ရှေ့တွင် အတောင်နှစ်ခုကို ၎င်းတို့၏ အလယ်အနားနှင့် ကိုက်ညီစေပါ။\nအတွင်းအလွှာကို လှည့်၊ မဖြေရှင်းရသေးသော အနားကို လဲထည့်၊ ပြန်လှည့်ပါ။\nပြီးသားအနားများကို မပျက်စေဘဲ နောက်ဆုံးအနားများကို တွဲပါ။';

  @override
  String get lessonFiveSolve => '5×5 ကို 3×3 ကဲ့သို့ ဖြေရှင်း';

  @override
  String get lessonFiveSolveDesc => 'သရဖူ သုံးခုဖြင့် အပြီးသတ်ပါ။';

  @override
  String get introGoalFiveSolve =>
      'လျှော့ချပြီးသော 5×5 ကို 3×3 ကဲ့သို့ သရဖူတစ်ခုချင်း ဖြေရှင်းပါ။';

  @override
  String get introHowFiveSolve =>
      'ယခုမှစ၍ အပြင်လှည့်ခြင်းများသာ။\nပထမသရဖူ၊ ဒုတိယသရဖူ၊ ထို့နောက် အဝါသရဖူ။\nပုံသေအလယ်များက မျက်နှာတစ်ခုစီ၏ အရောင်ကို ပြသည်။';

  @override
  String get lessonFiveParity => '5×5 အနား parity';

  @override
  String get lessonFiveParityDesc => 'အတောင်များ နေရာလဲနေသော အနားကို ပြင်ပါ။';

  @override
  String get introGoalFiveParity =>
      'အတောင်နှစ်ခု နေရာလဲနေသော အနားတစ်ခုကို ပြင်ပြီး အပြီးသတ်ပါ။';

  @override
  String get introHowFiveParity =>
      'တွဲ၍မရသော အနားအဖြစ် ပေါ်လာသည်။\nအတွင်းအလွှာ ပြင်ဆင်မှု အရှည်ကို တစ်ကြိမ် လုပ်ပါ။\nကျန်အားလုံး ၎င်းတို့နေရာသို့ ပြန်ရောက်သည်။';

  @override
  String get lessonSixIntro => '6×6 နှင့် မိတ်ဆက်';

  @override
  String get lessonSixIntroDesc =>
      'ပုံသေ အလယ်မရှိဘဲ အနားတိုင်းတွင် အပိုင်း လေးခု။';

  @override
  String get introGoalSixIntro =>
      '6×6 ကို သိကျွမ်းပါ- မျက်နှာတစ်ခုလျှင် အလယ်အပိုင်း ဆယ့်ခြောက်ခုနှင့် အနားတစ်ခုလျှင် အပိုင်း လေးခု။';

  @override
  String get introHowSixIntro =>
      'ပုံသေ အလယ် မရှိပါ- ဖွဲ့ရင်း အရောင်များကို သင်ရွေးသည်။\nအနားတစ်ခုစီတွင် အပြင်နှင့် အတွင်း အတောင်များ ရှိသည်။\nနှစ်ထပ်လှည့်ခြင်းက အလွှာ သုံးခုအထိ ရွှေ့နိုင်သည်။';

  @override
  String get lessonSixCenters => '6×6 အလယ်များ';

  @override
  String get lessonSixCentersDesc =>
      'လေးခုတန်းများဖြင့် 4×4 အလယ်များကို ဖွဲ့ပါ။';

  @override
  String get introGoalSixCenters =>
      'မျက်နှာတိုင်း၏ 4×4 အလယ်အကွက်ကို အရောင်တစ်မျိုးတည်းဖြင့် ဖွဲ့ပါ။';

  @override
  String get introHowSixCenters =>
      'ဆန့်ကျင်ဘက် အလယ်နှစ်ခုကို အရင် ဖွဲ့ပါ။\nလေးခုတန်းများ ဖွဲ့ပြီး အတူ ထိုးကပ်ပါ။\nအပိုင်းတစ်ခုချင်းကို အလွှာ၊ အပေါ်၊ နောက်ပြန် နည်းဖြင့် ရွှေ့ပါ။';

  @override
  String get lessonSixEdges => '6×6 အနားများ';

  @override
  String get lessonSixEdgesDesc => 'အနားတိုင်း၏ အပိုင်း လေးခုကို စုပါ။';

  @override
  String get introGoalSixEdges =>
      '6×6 တွင် သန့်ရှင်းသော အနား ၁၂ ခု ရှိစေရန် အနားတစ်ခုစီ၏ အပိုင်း လေးခုကို စုပါ။';

  @override
  String get introHowSixEdges =>
      'ရှေ့တွင် အပြင်နှင့် အတွင်း အတောင်များကို တန်းစီပါ။\nနက်ရှိုင်းသော နှစ်ထပ်အလွှာက အနားကို အဝင်အထွက် လုပ်ပေးသည်။\nပြီးသားအနားများ ဘယ်တော့မှ မပျက်ပါ။';

  @override
  String get lessonSixSolve => '6×6 ကို 3×3 ကဲ့သို့ ဖြေရှင်း';

  @override
  String get lessonSixSolveDesc => 'သရဖူ သုံးခုဖြင့် အပြီးသတ်ပါ။';

  @override
  String get introGoalSixSolve =>
      'လျှော့ချပြီးသော 6×6 ကို 3×3 ကဲ့သို့ သရဖူတစ်ခုချင်း ဖြေရှင်းပါ။';

  @override
  String get introHowSixSolve =>
      'ယခုမှစ၍ အပြင်လှည့်ခြင်းများသာ။\nသင်ဖွဲ့ခဲ့သော အလယ်များက မျက်နှာတစ်ခုစီ၏ အရောင်ကို ပြသည်။\nပထမသရဖူ၊ ဒုတိယသရဖူ၊ ထို့နောက် အဝါသရဖူ။';

  @override
  String get lessonSixParity => '6×6 parity';

  @override
  String get lessonSixParityDesc =>
      'အနားတစ်ခု ပြောင်းပြန် သို့မဟုတ် အနားနှစ်ခု နေရာလဲ။';

  @override
  String get introGoalSixParity =>
      '3×3 တွင် ဘယ်တော့မှ မရှိသော 6×6 အခြေအနေ နှစ်ခုကို ပြင်ပါ- အနားတစ်ခု ပြောင်းပြန် သို့မဟုတ် အနားနှစ်ခု နေရာလဲ။';

  @override
  String get introHowSixParity =>
      'ပိတ်မိသည်အထိ 3×3 ကဲ့သို့ ဖြေရှင်းပါ။\nအနားတစ်ခု ပြောင်းပြန်- parity ပြင်ဆင်မှု အရှည်။\nအနားနှစ်ခု နေရာလဲ- နှစ်ဆလှည့် ပြင်ဆင်မှု အတို။';

  @override
  String get stepFivePieces => '5×5 ၏ အပိုင်းများ';

  @override
  String get stepFivePiecesBody =>
      'မျက်နှာတစ်ခုစီ၏ အလယ်ဗဟိုအပိုင်းသည် ဘယ်တော့မှ မရွေ့သဖြင့် 3×3 ကဲ့သို့ပင် မျက်နှာ၏ အရောင်ကို ပြနေဆဲ ဖြစ်သည်။ ၎င်းပတ်လည်တွင် အလယ်အပိုင်း ရှစ်ခု ထပ်ရှိသည်- အနားတစ်ခုစီတွင် အလယ်အပိုင်း တစ်ခုနှင့် အတောင် နှစ်ခု ရှိပြီး ထောင့်များသည် 3×3 ကဲ့သို့ပင် အလုပ်လုပ်သည်။';

  @override
  String get stepFiveSlices => 'လှည့်ခြင်း သုံးမျိုး';

  @override
  String get stepFiveSlicesBody =>
      'အပြင်လှည့်ခြင်းက မျက်နှာတစ်ခုကို ရွှေ့သည်။ နှစ်ထပ်လှည့်ခြင်းက မျက်နှာနှင့် ၎င်းနောက်ရှိ အလွှာကို ရွှေ့သည်။ အတွင်းလှည့်ခြင်းက အတွင်းရှိ အလွှာကိုသာ ရွှေ့သည်- အပြင်ကို မထိဘဲ အပိုင်းများ နေရာပြောင်းပုံ ဖြစ်သည်။';

  @override
  String get stepFiveCenterBar => 'အလယ်တန်းများ';

  @override
  String get stepFiveCenterBarBody =>
      'ကိုက်ညီသော အလယ်အပိုင်း သုံးခုကို တန်းစီဖွဲ့ပြီး အတွင်းလှည့်ခြင်းဖြင့် ကိုက်ညီသော အလယ်ဗဟိုဘေးသို့ ထိုးသွင်းပါ။ တန်း သုံးခုက ပြီးပြည့်စုံသော အလယ်ကို ဖွဲ့သည်။';

  @override
  String get stepFiveCenterSwap => 'မပျက်စေဘဲ နေရာလဲ';

  @override
  String get stepFiveCenterSwapBody =>
      'အလယ်အပိုင်း တစ်ခုတည်းကို ရွှေ့ရန်- အတွင်းအလွှာ လှည့်၊ အပေါ်လှည့်၊ အလွှာကို နောက်ပြန်၊ အပေါ်ကို ပြန်လှည့်ပါ။ ပြီးသားအလယ်များ အမြဲ ပြန်ကောင်းသည်။';

  @override
  String get stepFiveEdgePair => 'အတောင်များကို အလယ်အနားနှင့် တွဲ';

  @override
  String get stepFiveEdgePairBody =>
      'ရှေ့တွင် အတောင်နှစ်ခုကို ကိုက်ညီသော အလယ်အနားဘေး တန်းစီပြီး အတွင်းအလွှာကို အောက်လှည့်၊ အပေါ်မှ မဖြေရှင်းရသေးသော အနားကို ယူလာ၊ ထို့နောက် အတွင်းအလွှာကို ပြန်လှည့်ပါ။';

  @override
  String get stepFiveEdgeLast => 'နောက်ဆုံး အနားများ';

  @override
  String get stepFiveEdgeLastBody =>
      'အနား အနည်းငယ်သာ ကျန်လျှင် နှစ်ထပ်လှည့်ခြင်း၊ အစီအစဉ်တို တစ်ခုနှင့် နှစ်ထပ်ကို ပြန်လှည့်ခြင်းက ပြီးသားအနားများကို မပျက်စေဘဲ ၎င်းတို့ကို တွဲပေးသည်။';

  @override
  String get stepFiveAsThree => 'ယခု 3×3 ဖြစ်သွားပြီ';

  @override
  String get stepFiveAsThreeBody =>
      'အလယ်နှင့် အနားများ ပြီးလျှင် 5×5 သည် 3×3 အကြီးကဲ့သို့ ပြုမူသည်။ အပြင်လှည့်ခြင်းများသာ သုံးပြီး သရဖူသုံးခုအတိုင်း လိုက်ပါ- အဖြူကြက်ခြေနှင့် ထောင့်များ၊ အလယ်အလွှာ၊ ထို့နောက် အဝါအလွှာ။';

  @override
  String get stepFiveEdgeParity => 'နောက်ဆုံးအနား၏ အတောင်များကို နေရာလဲ';

  @override
  String get stepFiveEdgeParityBody =>
      'တစ်ခါတစ်ရံ နောက်ဆုံးအနား၏ အတောင်နှစ်ခု နေရာလဲနေတတ်သည်။ ပိုရှည်သော အတွင်းအလွှာ ဖော်မြူလာက ၎င်းတို့ကို ပြန်လဲပေးပြီး ကျန်အားလုံး နေရာပြန်ရောက်သည်။ ထို့နောက် 3×3 ကဲ့သို့ အပြီးသတ်ပါ။';

  @override
  String get stepSixPieces => '6×6 ၏ အပိုင်းများ';

  @override
  String get stepSixPiecesBody =>
      '4×4 ကဲ့သို့ 6×6 တွင် ပုံသေ အလယ်မရှိပါ- အလယ်အပိုင်း ဆယ့်ခြောက်ခုက မျက်နှာအရောင်တစ်ခုစီကို ဖွဲ့သည်။ အနားတစ်ခုစီတွင် အပိုင်း လေးခု ရှိသည်- အပြင်အတောင် နှစ်ခုနှင့် အတွင်းအတောင် နှစ်ခု။';

  @override
  String get stepSixSlices => 'ပိုနက်သော အလွှာများကို လှည့်ခြင်း';

  @override
  String get stepSixSlicesBody =>
      'နှစ်ထပ်လှည့်ခြင်းက မျက်နှာတစ်ခုမှ အလွှာ နှစ်ခု သို့မဟုတ် သုံးခုကို ရွှေ့နိုင်သည်။ ဒုတိယ သို့မဟုတ် တတိယ အတွင်းအလွှာများသည် အလယ်နှင့် အနားများအတွက် ကိရိယာများ ဖြစ်သည်။';

  @override
  String get stepSixCenterBar => 'လေးခုတန်းများ';

  @override
  String get stepSixCenterBarBody =>
      'ကိုက်ညီသော အလယ်အပိုင်း လေးခုစီ တန်းများ ဖွဲ့ပြီး မျက်နှာ အရောင်တစ်မျိုးတည်း ဖြစ်သည်အထိ အတွင်းလှည့်ခြင်းများဖြင့် ဘေးချင်းကပ် ထိုးပါ။';

  @override
  String get stepSixCenterSwap => 'တစ်ကြိမ်လျှင် အပိုင်းတစ်ခု ရွှေ့';

  @override
  String get stepSixCenterSwapBody =>
      'တတိယအလွှာ လှည့်၊ အပေါ်လှည့်၊ နောက်ပြန်၊ ပြန်လှည့်ပါ- အလယ်အပိုင်း တစ်ခု ရွှေ့သွားပြီး ပြီးသားအလယ်များ ပြန်ရောက်လာသည်။';

  @override
  String get stepSixEdgePair => 'အပိုင်း လေးခု၊ အနား တစ်ခု';

  @override
  String get stepSixEdgePairBody =>
      'နက်ရှိုင်းသော နှစ်ထပ်အလွှာဖြင့် အနားတစ်ခု၏ အပိုင်း လေးခုကို ရှေ့တွင် စုပြီး မဖြေရှင်းရသေးသော အနားကို ယူလာကာ နှစ်ထပ်အလွှာကို ပြန်လှည့်ပါ။';

  @override
  String get stepSixEdgeLast => 'နောက်ဆုံး အနားများ';

  @override
  String get stepSixEdgeLastBody =>
      'ပြီးသားအနားများ တွဲလျက် ရှိနေစေရန် နက်ရှိုင်းသော နှစ်ထပ်လှည့်ခြင်းနှင့် ၎င်း၏ နောက်ပြန်ကြားတွင် အစီအစဉ်တိုဖြင့် နောက်ဆုံးအနားများကို တွဲပါ။';

  @override
  String get stepSixAsThree => 'ယခု 3×3 ဖြစ်သွားပြီ';

  @override
  String get stepSixAsThreeBody =>
      '4×4 အလယ်များနှင့် တွဲပြီးသော အနားများဖြင့် 6×6 ကို အပြင်လှည့်ခြင်းများနှင့် သရဖူ သုံးခုဖြင့် 3×3 ကဲ့သို့ ဖြေရှင်းပါ။';

  @override
  String get stepSixOllParity => 'အနားတစ်ခု ပြောင်းပြန်';

  @override
  String get stepSixOllParityBody =>
      'နောက်ဆုံးအလွှာကို ဖြေရှင်းနေစဉ် အနားတစ်ခုတည်း ပြောင်းပြန်ဖြစ်နေပုံရလျှင် ၎င်းသည် parity ဖြစ်သည်။ ၎င်းကို အပေါ်အလွှာ၏ ရှေ့တွင်ထားပြီး ပြင်ဆင်မှု အရှည်ကို လုပ်ပါ- ပထမသရဖူ နှစ်ခု မထိခိုက်ဘဲ ပြန်လာသည်။';

  @override
  String get stepSixPllParity => 'အနားနှစ်ခု နေရာလဲ';

  @override
  String get stepSixPllParityBody =>
      'အဆုံးတွင် အနားနှစ်ခု နေရာလဲနေပုံရလျှင် ၎င်းတို့ကို အပေါ်အလွှာ၏ ရှေ့နှင့် နောက်တွင်ထားပြီး အတွင်းအလွှာ နှစ်ဆလှည့်ခြင်းများပါ ပြင်ဆင်မှု အတိုကို လုပ်ပါ။';

  @override
  String get stageTwoFirstLayer => 'အောက်အလွှာကို ဖွဲ့';

  @override
  String get stageTwoTopColor => 'အပေါ်ကို အရောင်တစ်မျိုးတည်း ဖြစ်စေ';

  @override
  String get stageTwoFinish => 'ထောင့်များကို အပြီးသတ်';

  @override
  String get explainTwoFirstLayer =>
      'အောက်အလွှာကို ပြီးအောင်လုပ်ပါ- ၎င်း၏ထောင့် လေးခုသည် အချင်းချင်းနှင့် ဘေးအရောင်များနှင့် ကိုက်ညီရမည်။';

  @override
  String get explainTwoTopColor =>
      'အောက်အလွှာကို ထိန်းထားရင်း အပေါ်စတစ်ကာ လေးခုလုံး အရောင်တူသည်အထိ အပေါ်ကို လှည့်ပါ။';

  @override
  String get explainTwoFinish =>
      'ကုဗကို အပြီးသတ်ရန် နောက်ဆုံးထောင့်များကို နေရာချပါ။';

  @override
  String get tabSolve => 'ဖြေရှင်း';

  @override
  String get tabScan => 'စကင်ဖတ်';

  @override
  String get tabAcademy => 'အကယ်ဒမီ';

  @override
  String get tabTrain => 'လေ့ကျင့်';

  @override
  String get openCubeSolver => '3D ကုဗနှင့် ဖြေရှင်းစနစ် ဖွင့်';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'လေ့ကျင့်ရေး';

  @override
  String get trainSubtitle => 'နေ့တိုင်း သင့်စွမ်းရည်ကို သွေးပါ။';

  @override
  String get settings => 'ဆက်တင်များ';

  @override
  String get settingsSoundHaptics => 'အသံနှင့် တုန်ခါမှု';

  @override
  String get settingsSoundHapticsDesc =>
      'ကုဗကို လှည့်သည့်အခါ ကလစ်သံနှင့် တုန်ခါမှု။';

  @override
  String get settingsAnimationSpeed => 'မူလ ကာတွန်းအမြန်နှုန်း';

  @override
  String get settingsAnimationSpeedDesc =>
      'လှုပ်ရှားမှုများ ဖွင့်သည့်အခါ ကုဗ လှည့်ပုံ အမြန်နှုန်း။';

  @override
  String get settingsResetProgress => 'တိုးတက်မှုကို ပြန်စ';

  @override
  String get settingsResetProgressDesc =>
      'ပြီးသော အကယ်ဒမီ သင်ခန်းစာများနှင့် နေ့စဉ် ဆက်တိုက်ရက်ကို ဖျက်ပါ။';

  @override
  String get resetProgressTitle => 'တိုးတက်မှုအားလုံးကို ပြန်စမလား။';

  @override
  String get resetProgressBody =>
      'ပြီးသော သင်ခန်းစာများနှင့် နေ့စဉ် ဆက်တိုက်ရက်ကို ဖျက်ပါမည်။ ပြန်ပြင်၍ မရပါ။';

  @override
  String get resetProgressDone => 'တိုးတက်မှုကို ပြန်စပြီးပါပြီ။';

  @override
  String get cancel => 'မလုပ်တော့';

  @override
  String get settingsPrivacyAds => 'ကိုယ်ရေးလုံခြုံမှုနှင့် ကြော်ငြာ';

  @override
  String get settingsPrivacyAdsDesc =>
      'ကြော်ငြာ သဘောတူညီချက် ရွေးချယ်မှုများကို ပြန်ကြည့် သို့မဟုတ် ပြောင်းပါ။';

  @override
  String get playbackPrevious => 'နောက်သို့';

  @override
  String get playbackNext => 'ရှေ့သို့';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'လှုပ်ရှားမှု $count ကြိမ်ဖြင့် ဖြေရှင်းပြီး။',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'နောက်ဗားရှင်းကို အတူ ပုံဖော်ကြစို့';

  @override
  String get feedbackBody =>
      'လုပ်ဆောင်ချက်တစ်ခု အကြံပြုချင်သလား၊ CubeMentor ၏ နောက်ဗားရှင်းကို လွှမ်းမိုးချင်သလား။ ဤလိပ်စာသို့ ရေးပို့ပါ-';

  @override
  String get feedbackEmailCopied =>
      'အီးမေးလ်အက်ပ် မတွေ့သဖြင့် လိပ်စာကို ကလစ်ဘုတ်သို့ ကူးထားပေးပါပြီ။';

  @override
  String get adWatchToUnlock => 'ကြော်ငြာ ကြည့်';

  @override
  String get adLoading => 'ဗီဒီယိုတို ဖွင့်နေသည်…';

  @override
  String get adRewardNotEarned => 'ဖွင့်ရန် ဗီဒီယိုကို အဆုံးထိ ကြည့်ပါ။';

  @override
  String get adUnavailableFreePass =>
      'ယခု ဗီဒီယို မရှိပါ — ဤတစ်ကြိမ် အခမဲ့ ဖွင့်ပေးလိုက်ပါပြီ။';

  @override
  String get settingsPrivacyAdsError =>
      'ကိုယ်ရေးလုံခြုံမှု ရွေးချယ်စရာများကို ဖွင့်၍ မရပါ။ နောက်မှ ထပ်စမ်းပါ။';

  @override
  String get nicknamePromptTitle => 'သင့်ကို ဘယ်လို ခေါ်ရမလဲ။';

  @override
  String get nicknamePromptBody => 'ဖြေရှင်းတိုင်း သင့်နာမည်ဖြင့် အားပေးပါမည်။';

  @override
  String get nicknameHint => 'သင့်နာမည် သို့မဟုတ် အမည်ပြောင်';

  @override
  String get nicknameSave => 'သိမ်း';

  @override
  String get settingsNickname => 'သင့်နာမည်';

  @override
  String get settingsNicknameNotSet => 'မသတ်မှတ်ရသေး — ထည့်ရန် နှိပ်ပါ';

  @override
  String celebrateNamed(String name) {
    return 'တော်လိုက်တာ $name။';
  }

  @override
  String get celebrateAnon => 'တော်လိုက်တာ။';

  @override
  String get celebrateCubeSolved => 'ကုဗ ဖြေရှင်းပြီးပါပြီ။';

  @override
  String get celebrateDailyDone => 'နေ့စဉ် စိန်ခေါ်မှု ပြီးပါပြီ။';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit ကြိမ်',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other:
          'မည်သည့် ရောမွှေမှုကိုမဆို လှုပ်ရှားမှု $limit ကြိမ် သို့မဟုတ် ထိုထက်နည်း၍ ဖြေရှင်းနိုင်သည်',
    );
    return '$_temp0';
  }

  @override
  String get patternsUnlockTitle => 'ပုံစံအားလုံးကို ဖွင့်';

  @override
  String patternsUnlockPrompt(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'ပုံစံအားလုံးကို $minutes မိနစ် ဖွင့်ရန် ဗီဒီယိုတို ၁ ခု ကြည့်ပါ',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'ဗီဒီယို ကြည့်';

  @override
  String get patternsNotNow => 'ယခု မဟုတ်သေး';

  @override
  String patternsUnlockedLeft(String time) {
    return 'ဖွင့်ထားသည် • $time ကျန်';
  }

  @override
  String get patternsExpiredTitle => 'အစမ်းကြည့်ချိန် ကုန်ပါပြီ';

  @override
  String patternsExpiredBody(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'ပုံစံအားလုံးကို နောက်ထပ် $minutes မိနစ် ဖွင့်ထားရန် ဗီဒီယို ၁ ခု ကြည့်ပါ။',
    );
    return '$_temp0';
  }

  @override
  String get patternsFreeSample => 'အခမဲ့';

  @override
  String get settingsColorScheme => 'ကုဗ အရောင်စနစ်';

  @override
  String get colorSchemeWestern => 'အနောက်တိုင်း';

  @override
  String get colorSchemeJapanese => 'ဂျပန်';

  @override
  String get colorSchemeWesternDesc =>
      'အဖြူနှင့် အဝါ ဆန့်ကျင်ဘက်၊ အပြာနှင့် အစိမ်း ဆန့်ကျင်ဘက်';

  @override
  String get colorSchemeJapaneseDesc =>
      'အဖြူနှင့် အပြာ ဆန့်ကျင်ဘက်၊ အဝါနှင့် အစိမ်း ဆန့်ကျင်ဘက်';

  @override
  String dailyYourTime(String time) {
    return 'သင့်အချိန်: $time';
  }
}
