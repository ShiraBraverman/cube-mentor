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
  String get solveModeGuided => 'လမ်းညွှန်ဖြင့် (အလွှာ ၃ ခု)';

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
      'အရမ်းကောင်းတယ်။ အလွှာနှစ်ထပ်လှည့်ခြင်း ပြီးစေရန် မြှားအတိုင်း အလွှာများကို တစ်ခုချင်း ဆက်ပွတ်ဆွဲပါ။';

  @override
  String get guideSwipeHint =>
      'မြှားပြထားသော အလွှာကို မြှားညွှန်ရာဘက် ပွတ်ဆွဲပါ၊ သို့မဟုတ် ရှေ့သို့ ကို နှိပ်ပါ။';

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
  String get phaseLblCorners => 'ပထမအလွှာ၏ ထောင့်များ';

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
  String get crownFirst => 'ပထမ အလွှာ';

  @override
  String get crownSecond => 'ဒုတိယ အလွှာ';

  @override
  String get crownThird => 'တတိယ အလွှာ';

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
      'အဖြူထောင့် ၄ ခုကို ကိုက်ညီသောနေရာများထဲ ထည့်ပြီး အဖြူမျက်နှာနှင့် ပထမအလွှာတစ်ခုလုံးကို ပြီးအောင်လုပ်ပါ။';

  @override
  String get subStepGoal21 =>
      'ပထမအလွှာကို မပျက်စေဘဲ အလယ်အလွှာ၏ အနား ၄ ခုကို ထည့်ပါ။';

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
  String explainLblDaisyPetal(String piece) {
    return 'Daisy: $piece အနားကို အဖြူ အပေါ်မူ၍ အဝါအလယ်ပတ်လည် အပေါ်သို့ တင်ပြီး ပွင့်ဖတ်တစ်ခု ဖြစ်စေပါ။';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return '$piece ပွင့်ဖတ်သည် ၎င်း၏ ဘေးအရောင်နှင့် တူသော အလယ်အပေါ်တည့်တည့် ရောက်သည်အထိ အပေါ်အလွှာကို လှည့်ပါ။';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return '$piece အနားကို အဖြူအလယ်ပေါ် ချရန် ထိုမျက်နှာကို နှစ်ကြိမ် (180°) လှည့်ပါ- အဖြူ ကြက်ခြေ၏ လက်တံတစ်ခု ထပ်ရပါပြီ။';
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
  String get trackBeginner => 'အစပြု 3×3: အလွှာလိုက်';

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
      'အဝါကို အပေါ်၊ အစိမ်းကို သင့်ဘက် ကိုင်ပါ။ ပထမ အဖြူအနား လေးခုကို အဖြူ အပေါ်မူ၍ အဝါအလယ်ပတ်လည် ပွင့်ဖတ်များကဲ့သို့ စုပါ- ၎င်းမှာ daisy ဖြစ်သည်။ ထို့နောက် ပွင့်ဖတ်တိုင်းကို အဖြူအလယ်သို့ ချပြီး ဘေးအရောင်ကို ဘေးရှိအလယ်နှင့် ကိုက်ပါ။';

  @override
  String get stepCrossTop => 'အပေါ်ရှိ အနား';

  @override
  String get stepCrossTopBody =>
      'အဖြူ အပေါ်မူသော အပေါ်ရှိ အဖြူအနားသည် daisy ၏ ပွင့်ဖတ်ဖြစ်သည်။ ၎င်း၏ ဘေးအရောင်သည် အရောင်တူအလယ် အပေါ်တည့်တည့် ရောက်သည်အထိ အပေါ်အလွှာကို လှည့်ပြီး ထိုမျက်နှာကို နှစ်ကြိမ် (180°) လှည့်၍ အဖြူအလယ်ပေါ် ချပါ။';

  @override
  String get stepCrossMiddle => 'အလယ်ရှိ အနား';

  @override
  String get stepCrossMiddleBody =>
      'အလယ်အလွှာတွင် ညပ်နေသောအနားကို အရင်အပေါ်တင်ပါ- ၎င်း၏ဘေးကို မ၊ အပေါ်ကို ဖယ်၊ ဘေးကို ပြန်ချလျှင် ထားပြီးသားအပိုင်းများ မရွေ့ပါ။ ယခု ၎င်းသည် အပေါ်ရှိ ပွင့်ဖတ်ဖြစ်၍ ညှိပြီး မျက်နှာကို နှစ်ကြိမ်လှည့်ပါ။';

  @override
  String get stepCornersInsert => 'နေရာအပေါ်တည့်တည့်';

  @override
  String get stepCornersInsertBody =>
      'အဖြူထောင့်သည် ၎င်း၏ ဘေးအရောင်တူ အလယ်နှစ်ခုကြားရှိ နေရာ အပေါ်တည့်တည့် ရောက်သည်အထိ အပေါ်အလွှာကို လှည့်ပါ။ ဤနေရာတွင် အပေါ်တစ်ချက်နှင့် R U\' R\' လုံလောက်သည်- U က ထောင့်ကို နေရာအပေါ် ယူလာပြီး R U\' R\' က အဖြူ အောက်မူ၍ ထည့်သည်။';

  @override
  String get stepCornersRepeat => 'အစီအစဉ်ကို ထပ်လုပ်';

  @override
  String get stepCornersRepeatBody =>
      'နေရာကို ရှေ့-ညာတွင်ထားပြီး အဖြူ အောက်မူသည်အထိ R U R\' U\' ထပ်လုပ်ပါ- အဖြူ ညာမူလျှင် ၁ ကြိမ်၊ အပေါ်မူလျှင် ၃ ကြိမ်၊ သင့်ဘက်မူလျှင် ၅ ကြိမ်။ ကြားတွင် အပေါ်ပိုင်း ရှုပ်နေပုံရသော်လည်း အလိုလို ပြန်ကောင်းသည်။';

  @override
  String get stepMiddleRight => 'အနားကို ညာဘက်သို့';

  @override
  String get stepMiddleRightBody =>
      'အဝါမပါသော အပေါ်အနားကို ရှာပါ။ ၎င်း၏ ရှေ့အရောင်သည် သင့်ရှေ့ရှိ အလယ်နှင့် ကိုက်သည်အထိ အပေါ်ကို လှည့်ပါ။ အပေါ်အရောင်က ညာအလယ်နှင့် ကိုက်လျှင် ညာသို့ ပို့ပါ- U R U\' R\' U\' F\' U F။';

  @override
  String get stepMiddleLeft => 'အနားကို ဘယ်ဘက်သို့';

  @override
  String get stepMiddleLeftBody =>
      'အပေါ်အရောင်က ဘယ်အလယ်နှင့် ကိုက်လျှင် ပုံရိပ်ပြောင်းကို သုံးပါ- U\' L\' U L U F U\' F\'။ အဖြူအလွှာ အမြဲ အပြည့်အစုံ ပြန်ရောက်လာသည်။';

  @override
  String get stepYellowCross => 'ဖော်မြူလာ တစ်ခု';

  @override
  String get stepYellowCrossBody =>
      'အပေါ်ရှိ အဝါအနားများကိုသာ ကြည့်ပါ။ L ကို နောက်-ဘယ်၊ မျဉ်းကို ဘယ်မှညာ ထားပြီး F R U R\' U\' F\' လုပ်ပါ။ မျဉ်း ၁ ကြိမ်၊ L ၂ ကြိမ်၊ အစက် ၃ ကြိမ်အထိ လိုသည်။';

  @override
  String get stepYellowEdges => 'အနားများကို ကိုက်ညီစေ';

  @override
  String get stepYellowEdgesBody =>
      'အနားနှစ်ခု ၎င်းတို့၏ အလယ်များနှင့် ကိုက်သည်အထိ အပေါ်ကို လှည့်ပါ။ တစ်ခု နောက်၊ တစ်ခု ညာတွင်ရှိလျှင် R U R\' U R U2 R\' U က ရှေ့နှင့်ဘယ် အနားများကို လဲပေးသည်။';

  @override
  String get stepPlaceCorners => 'နေရာချ';

  @override
  String get stepPlaceCornersBody =>
      'ထောင့်၏ အရောင်များ ပတ်လည် အလယ်သုံးခုနှင့် ကိုက်လျှင် လိမ်နေသော်လည်း နေရာမှန်ဖြစ်သည်။ ထိုထောင့်ကို ရှေ့-ညာတွင်ထားပါ- U R U\' L\' U R\' U\' L က ကျန်သုံးခုကို လည်စေသည်။ လေးခုလုံး နေရာရောက်သည်အထိ ထပ်လုပ်ပါ။';

  @override
  String get stepTwistCorners => 'လှည့်ညှိ';

  @override
  String get stepTwistCornersBody =>
      'မပြီးသေးသောထောင့် ရှေ့-ညာတွင်ရှိစဉ် အဝါ အပေါ်ရောက်သည်အထိ R\' D\' R D ကို နှစ်ကြိမ်တွဲ ထပ်လုပ်ပြီး နောက်တစ်ခုယူရန် အပေါ်အလွှာကိုသာ လှည့်ပါ။ နောက်ဆုံးထောင့်အထိ အောက်ပိုင်း ပျက်နေပုံရသည်- ဆက်လုပ်ပါ။';

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
      '2×2 တွင် ထောင့်ရှစ်ခုသာ ရှိသည်- အနားလည်း မရှိ၊ အလယ်လည်း မရှိ။ ကပ်လျက်ဘေးအရောင်များ ကိုက်အောင် အဖြူအလွှာကို အောက်တွင်ဖွဲ့ပြီး လမ်းကြောင်းတစ်ခုတည်းဖြင့် ပြီးပါ- အပေါ်အဝါအတွက် Sune၊ ထို့နောက် T-perm သို့မဟုတ် Y-perm။';

  @override
  String get stepTwoCorner => 'ထောင့်များ ထည့်';

  @override
  String get stepTwoCornerBody =>
      '3×3 ၏ အဖြူထောင့်များကဲ့သို့- ထောင့်ကို ရှေ့-ညာ နေရာလွတ်အပေါ် ယူလာပြီး ထည့်ပါ၊ ဤတွင် U R U\' R\' ဖြင့် သို့မဟုတ် အဖြူ အောက်မူသည်အထိ R U R\' U\' ထပ်လုပ်၍။ ဘေးအရောင်ကို အိမ်နီးချင်းနှင့် တိုက်စစ်ပါ။';

  @override
  String get lessonTwoOll => 'အပေါ်ကို ညှိ';

  @override
  String get lessonTwoOllDesc => 'Sune ဖြင့် Ortega OLL။';

  @override
  String get stepTwoSune => 'Sune ပြန်လာပြီ';

  @override
  String get stepTwoSuneBody =>
      'အပေါ်မူသော အဝါစတစ်ကာများကို ရေတွက်ပါ။ အဝါ အပေါ်မူသော တစ်ခုတည်းသောထောင့်ကို ရှေ့-ဘယ်တွင်ထားပြီး Sune (R U R\' U R U2 R\') လုပ်ပါ။ ပြန်ရေ၍ ပြန်ကိုင်ပါ၊ Sune အများဆုံး သုံးကြိမ်၊ ကြားတွင် အပေါ်အလွှာကိုသာ လှည့်ပါ။';

  @override
  String get lessonTwoPbl => 'အလွှာနှစ်ခုလုံးကို နေရာချ';

  @override
  String get lessonTwoPblDesc => 'အပြီးသတ်ရန် ထောင့်များကို နေရာလဲပါ။';

  @override
  String get stepTwoAdjacent => 'ကပ်လျက် နေရာလဲ';

  @override
  String get stepTwoAdjacentBody =>
      'headlights ဆိုသည်မှာ ဘေးမျက်နှာတစ်ခုအပေါ်ရှိ အရောင်တူ စတစ်ကာနှစ်ခု ဖြစ်သည်။ headlights ဘယ်ဘက်ရောက်သည်အထိ အပေါ်ကိုလှည့်လျှင် လဲမည့်ထောင့်နှစ်ခု ညာဘက်ရောက်မည်၊ ထို့နောက် T-perm လုပ်ပါ။';

  @override
  String get stepTwoDiagonal => 'ထောင့်ဖြတ် နေရာလဲ';

  @override
  String get stepTwoDiagonalBody =>
      'မည်သည့်ဘက်တွင်မှ headlights မရှိလျှင် ထောင့်ဖြတ်ထောင့်နှစ်ခုကို လဲရမည်- မည်သည့်ဘက်မှမဆို Y-perm လုပ်ပြီး အားလုံးညှိရန် အပေါ်အလွှာကို လှည့်ပါ။';

  @override
  String get lessonBigIntro => 'ကုဗကြီး၏ အပိုင်းများ';

  @override
  String get lessonBigIntroDesc => 'အလယ်များ၊ အတောင်များနှင့် အတွင်းအလွှာများ။';

  @override
  String get stepBigPieces => 'ပုံသေ အလယ် မရှိ';

  @override
  String get stepBigPiecesBody =>
      '4×4 တွင် မျက်နှာတိုင်း၌ ရွေ့နိုင်သော အလယ်အပိုင်း လေးခုရှိပြီး အနားတိုင်းသည် အတောင်နှစ်ခု ဖြစ်သည်။ မရွေ့သောအလယ် မရှိသဖြင့် ထောင့်တစ်ခုတွင် အရောင်အစီအစဉ်ကို စစ်ပါ- အဖြူနှင့် အဝါ၊ အပြာနှင့် အစိမ်း၊ အနီနှင့် လိမ္မော် ဆန့်ကျင်ဘက်။';

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
      'ဤ commutator သည် အလယ်အပိုင်း သုံးခုကိုသာ ရွှေ့ပြီး ကျန်အားလုံးကို ထိန်းထားသဖြင့် ပြီးသောအလယ်များ မပျက်ပါ။ လွင့်နေသောအပိုင်းတစ်ခု ဘားနှင့် မဆက်နိုင်လျှင် သုံးပါ။';

  @override
  String get lessonBigEdges => 'အနားများကို တွဲ';

  @override
  String get lessonBigEdgesDesc => 'အတောင်များကို အနားအပြည့်အဖြစ် ပေါင်းပါ။';

  @override
  String get stepBigEdgePair => 'တွဲပြီး ပြန်ထား';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' က ကိုက်ညီသော အတောင်နှစ်ခုကို တန်းစီပေး၊ R U R\' F R\' F\' R က မတွဲရသေးသော အနားကို လဲထည့်ပြီး Uw က အလယ်များကို ပြန်ထားပေးသည်။ ဖွင့်ထားသော အလွှာကို အမြဲ ပိတ်ပါ။';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => 'စုံကုဗများပေါ်ရှိ OLL နှင့် PLL parity။';

  @override
  String get stepBigOllParity => 'OLL parity';

  @override
  String get stepBigOllParityBody =>
      'အနားတစ်ခုတည်း လှန်နေခြင်းသည် 3×3 တွင် မဖြစ်နိုင်ပါ- ၎င်းမှာ OLL parity ဖြစ်ပြီး အမှားမဟုတ်ပါ။ အပေါ်အလွှာ၏ ရှေ့တွင်ထားပြီး ရှည်သောဖော်မြူလာကို လုပ်ပါ။ ၎င်းက အပေါ် ဘယ်-ညာ အနားများနှင့် ထောင့်နှစ်ခုကိုလည်း လဲသော်လည်း 3×3 နောက်ဆုံးအဆင့်များက ပြင်ပေးမည်။';

  @override
  String get stepBigPllParity => 'PLL parity';

  @override
  String get stepBigPllParityBody =>
      'အဆုံးတွင် အနားနှစ်ခု လဲနေပြီး မည်သည့် 3×3 ဖော်မြူလာမှ မကိုက်လျှင် ၎င်းမှာ PLL parity ဖြစ်သည်။ ၎င်းတို့ကို အပေါ်အလွှာ၏ ရှေ့နှင့်နောက်တွင် ထားပါ- 2R2 U2 2R2 Uw2 2R2 2U2 က လဲပေးသည်။';

  @override
  String get introGoalHeading => 'ပန်းတိုင်က ဘာလဲ။';

  @override
  String get introHowHeading => 'ဘယ်လို လုပ်မလဲ။';

  @override
  String get introHoldHeading => 'ကိုင်ပုံ';

  @override
  String get introWhyHeading => 'ဘာကြောင့် အလုပ်ဖြစ်သလဲ';

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
      'အောက်ခြေတွင် အဖြူကြက်ခြေ ဖွဲ့ပါ၊ အဖြူအနားတိုင်းသည် ဘေးရှိ အလယ်အရောင်နှင့်လည်း ကိုက်ရမည်။';

  @override
  String get introGoalCorners =>
      'အဖြူထောင့် လေးခုကို ထည့်၍ ပထမအလွှာတစ်ခုလုံး ပြီးစေပါ- အဖြူမျက်နှာနှင့် ကိုက်ညီသော ဘေးအရောင်များ။';

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
      'T-perm သို့မဟုတ် Y-perm တစ်ကြိမ်ဖြင့် နောက်ဆုံးထောင့်များကို နေရာပြန်ပို့ပြီး အပေါ်အလွှာကို ညှိကာ 2×2 ကို ဖြေပါ။';

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
      '3×3 တွင် ဘယ်တော့မှမဖြစ်သော 4×4 အခြေအနေ နှစ်ခုကို ပြင်ပါ- အနားတစ်ခု လှန်နေခြင်း (OLL parity) သို့မဟုတ် အနားနှစ်ခု နေရာလဲနေခြင်း (PLL parity)။';

  @override
  String get introHowBasics =>
      'အလယ်များ ဘယ်တော့မှ မရွေ့သဖြင့် မျက်နှာတစ်ခုစီ၏ အရောင်ကို ပြသည်။\nအက္ခရာတစ်လုံးစီသည် မျက်နှာတစ်ခုကို နာရီလက်တံအတိုင်း လေးပုံတစ်ပုံ လှည့်သည်။\nပုဒ်ဖြတ်အမှတ် (\') က ပြန်လှည့်ပြီး 2 က နှစ်ကြိမ်လှည့်သည်။';

  @override
  String get introHoldBasics =>
      'စိတ်ကြိုက်ကိုင်ပါ- အလယ်များ မရွေ့သဖြင့် အရောင်များက မည်သည့်မျက်နှာဖြစ်သည်ကို အမြဲပြောပြသည်။';

  @override
  String get introWhyBasics =>
      'ဖော်မြူလာတိုင်းသည် ဤအက္ခရာများ၏ အတန်းသာဖြစ်၍ ၎င်းတို့ကို ဖတ်တတ်ခြင်းသည် ပထမကျွမ်းကျင်မှု ဖြစ်သည်။';

  @override
  String get introHowCross =>
      'အဖြူအနားတိုင်းကို အဖြူ အပေါ်မူ၍ အဝါအလယ်ပတ်လည် အပေါ်သို့ တင်ပါ- ၎င်းမှာ daisy (ပန်းပွင့်) ဖြစ်သည်။\nပွင့်ဖတ်တစ်ခု၏ ဘေးအရောင်သည် တူညီသောအလယ်အပေါ် ရောက်သည်အထိ အပေါ်အလွှာကို လှည့်ပါ။\nထိုမျက်နှာကို နှစ်ကြိမ်လှည့်၍ အောက်ချပါ၊ လေးခုလုံး လုပ်ပါ။';

  @override
  String get introHoldCross =>
      'ဤအဆင့်တစ်လျှောက် အဝါအလယ် အပေါ်၊ အဖြူအလယ် အောက်။ ပွင့်ဖတ်ကို ညှိရန် ကုဗကို မဟုတ်ဘဲ အပေါ်အလွှာကို လှည့်ပါ။';

  @override
  String get introWhyCross =>
      'အဖြူ အပေါ်မူနေလျှင် ရှေ့မျက်နှာကို နှစ်ကြိမ်လှည့်ရုံဖြင့် အနားသည် အဖြူအလယ်ပေါ် အဖြူ အောက်မူ၍ ဘေးအရောင်ကိုက်ပြီးသား ကျသွားသည်။';

  @override
  String get introHowCorners =>
      'အဖြူထောင့်တစ်ခုသည် ရှေ့-ညာ နေရာလွတ်အပေါ် ရောက်သည်အထိ အပေါ်အလွှာကို လှည့်ပါ။\nR U R\' U\' ကို ထပ်လုပ်ပါ- အဖြူ ညာဘက်မူလျှင် ၁ ကြိမ်၊ အပေါ်မူလျှင် ၃ ကြိမ်၊ သင့်ဘက်မူလျှင် ၅ ကြိမ်။\nကျန်ထောင့် သုံးခုကိုလည်း အလားတူလုပ်ပါ။';

  @override
  String get introHoldCorners =>
      'အဖြူ အောက်၊ အဝါ အပေါ်။ ထောင့်သည် ရှေ့-ညာ၊ ၎င်း၏နေရာ အပေါ်တည့်တည့်တွင်။';

  @override
  String get introWhyCorners =>
      'R U R\' U\' က နေရာကို မ၍ ပြန်ချသည်- တစ်ကြိမ်လှည့်တိုင်း ထောင့် အနည်းငယ်လိမ်ပြီး အဖြူ အောက်မူသည်အထိ ဖြစ်ကာ ကြက်ခြေ ဘယ်တော့မှ မပျက်ပါ။';

  @override
  String get introHowMiddle =>
      'အဝါမပါသော အပေါ်အနားတစ်ခုကို ရှာပြီး ၎င်း၏ ရှေ့အရောင်ကို အောက်ရှိ အလယ်နှင့် ကိုက်ပါ။\n၎င်း၏ အပေါ်အရောင်က ဘယ်သွားမလဲ ပြောသည်- ညာ သို့မဟုတ် ဘယ်။\nလှည့်ကွက် ၈ ကွက်ဖြင့် ထည့်ပါ၊ အဖြူအလွှာ အမြဲ ပြန်ရောက်လာသည်။';

  @override
  String get introHoldMiddle =>
      'အဖြူ အောက်၊ အဝါ အပေါ်။ အနားသည် ရှေ့တွင်၊ ၎င်း၏ ရှေ့အရောင်သည် အောက်ရှိ အလယ်နှင့် တူသည်။';

  @override
  String get introWhyMiddle =>
      'ဖော်မြူလာက နေရာကို ဖယ်ပြီး အနားကို ထိုးသွင်းကာ အဖြူအလွှာကို ပြန်ထားသည်။ အဝါပါသောအနားသည် အပေါ်အတွက်ဖြစ်ပြီး အလယ်အတွက် ဘယ်တော့မှ မဟုတ်ပါ။';

  @override
  String get introHowYellowCross =>
      'အပေါ်ရှိ အဝါအနားများကိုသာ ကြည့်ပါ- အစက်၊ L သို့မဟုတ် မျဉ်း။\nL ကို နောက်-ဘယ်၊ မျဉ်းကို ဘယ်မှညာ ထားပြီး F R U R\' U\' F\' လုပ်ပါ။\nမျဉ်း ၁ ကြိမ်၊ L ၂ ကြိမ်၊ အစက် ၃ ကြိမ်အထိ လိုသည်။';

  @override
  String get introHoldYellowCross =>
      'အဖြူ အောက်၊ အဝါ အပေါ်။ L ကို နောက်-ဘယ်၊ မျဉ်းကို ဘယ်မှညာ၊ အစက်ကို ကြိုက်သလို။';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' သည် ပထမ အလွှာနှစ်ခုကို မထိဘဲ အပေါ်အနားနှစ်ခုစီကို လှန်ပေးသည်။';

  @override
  String get introHowYellowEdges =>
      'အနားနှစ်ခုသည် ၎င်းတို့၏ ဘေးအလယ်များနှင့် ကိုက်သည်အထိ အပေါ်အလွှာကို လှည့်ပါ။\n၎င်းတို့ကို နောက်နှင့် ညာတွင်ထားပြီး R U R\' U R U2 R\' U လုပ်ပါ။\nကိုက်သောအနားများ မျက်နှာချင်းဆိုင်နေလျှင် မည်သည့်ဘက်မှမဆို တစ်ကြိမ် အရင်လုပ်ပါ။';

  @override
  String get introHoldYellowEdges =>
      'အဝါ အပေါ်။ ကိုက်သောအနားတစ်ခု နောက်တွင်၊ နောက်တစ်ခု ညာတွင်။';

  @override
  String get introWhyYellowEdges =>
      'ဤဖော်မြူလာသည် အပေါ်အပိုင်းများကိုသာ ရွှေ့သဖြင့် ပထမ အလွှာနှစ်ခု အမြဲပြန်ရောက်လာသည်။';

  @override
  String get introHowYellowCorners =>
      'ထောင့်၏ အရောင်များသည် ပတ်လည် အလယ်သုံးခုနှင့် ကိုက်လျှင် လိမ်နေသော်လည်း နေရာမှန်ဖြစ်သည်။\nနေရာမှန်ထောင့်ကို ရှေ့-ညာတွင် ထားပါ။\nU R U\' L\' U R\' U\' L က ကျန်သုံးခုကို လည်စေသည်၊ အားလုံးကိုက်သည်အထိ ထပ်လုပ်ပါ။';

  @override
  String get introHoldYellowCorners =>
      'အဝါ အပေါ်။ နေရာမှန်ပြီးသားထောင့်ကို ရှေ့-ညာတွင်၊ မရှိလျှင် မည်သည့်ထောင့်မဆို။';

  @override
  String get introWhyYellowCorners =>
      'ထောင့်သုံးခုကို စက်ဝိုင်းလည်စေပြီး ရှေ့-ညာထောင့်ကို ထိန်းထားသဖြင့် ထပ်လုပ်တိုင်း နေရာမှန်ထောင့် ပိုများလာသည်။';

  @override
  String get introHowTwistCorners =>
      'မပြီးသေးသော ထောင့်ကို ရှေ့-ညာတွင် ကိုင်ပါ။\n၎င်း၏ အဝါ အပေါ်မူသည်အထိ R\' D\' R D ကို နှစ်ကြိမ်တွဲ ထပ်လုပ်ပါ။\nနောက်တစ်ခုအတွက် အပေါ်အလွှာကိုသာ လှည့်ပါ၊ အောက်ပိုင်းသည် နောက်ဆုံးထောင့်တွင် ပြန်ကောင်းသည်။';

  @override
  String get introHoldTwistCorners =>
      'အဝါ အပေါ်၊ လှည့်မည့်ထောင့် ရှေ့-ညာ။ ထောင့်များကြား အပေါ်အလွှာကိုသာ လှည့်ပါ၊ ကုဗတစ်ခုလုံးကို ဘယ်တော့မှ မလှည့်ပါနှင့်။';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D က ထောင့်ကိုလိမ်ပြီး အောက်ကိုရှုပ်စေသော်လည်း ထောင့်အားလုံးလှည့်ပြီးလျှင် အောက်ပိုင်း ပြန်ကောင်းသည်။ တစ်ဝက်တွင်ရပ်လျှင် ပျက်နေမည်။';

  @override
  String get introHowCfopIntro =>
      'Cross- စစ်ဆေးချိန်အတွင်း စီစဉ်ထားသော အနား လေးခု။\nF2L- ထောင့်တစ်ခုစီသည် ၎င်း၏အနားနှင့်အတူ ဝင်သည်။\nOLL က အပေါ်ကို အဝါဖြစ်စေပြီး PLL က အပိုင်းများကို နေရာပြန်ပို့သည်။';

  @override
  String get introHoldCfopIntro =>
      'speedcuber များသည် ကြက်ခြေကို အောက်တွင်ဖွဲ့ပြီး လှည့်နေစဉ် နောက်အပိုင်းများကို ကြိုမြင်သည်။';

  @override
  String get introWhyCfopIntro =>
      'ထောင့်ကို ၎င်း၏အနားနှင့်အတူ ဖြေခြင်းဖြင့် လှည့်ကွက်များစွာ သက်သာပြီး အခြေအနေကို မှတ်မိခြင်းက စမ်းသပ်မှုကို အစားထိုးသည်။';

  @override
  String get introHowF2l =>
      'အပေါ်အလွှာတွင် ထောင့်တစ်ခုနှင့် ကိုက်ညီသော ၎င်း၏အနားကို ရှာပါ။\n၎င်းတို့၏ နေရာအပေါ်တွင် တွဲပါ။\nလှုပ်ရှားမှု သုံး သို့မဟုတ် လေးကြိမ်ဖြင့် အတွဲကို ထည့်ပါ။';

  @override
  String get introHoldF2l =>
      'ကြက်ခြေ အောက်တွင်။ အတွဲ၏နေရာ ရှေ့-ညာ၊ ပုံရိပ်ပြောင်းကိစ္စတွင် ရှေ့-ဘယ်။';

  @override
  String get introWhyF2l =>
      'တွဲပြီးသော ထောင့်နှင့်အနား အတူဝင်သဖြင့် တစ်ခုချင်းမဟုတ်ဘဲ အလွှာနှစ်ခု တစ်ပြိုင်နက် တိုးလာသည်။';

  @override
  String get introHowOll =>
      'ပထမဦးစွာ F R U R\' U\' F\' ဖြင့် အဝါကြက်ခြေ။\nထို့နောက် ထောင့်များကို ညှိပါ၊ ဥပမာ Sune ဖြင့်။\nမြင်ရသော အဝါပုံစံဖြင့် အခြေအနေကို မှတ်သားပါ။';

  @override
  String get introHoldOll =>
      'အဝါ အပေါ်။ Sune အတွက် အဝါ အပေါ်မူသော တစ်ခုတည်းသောထောင့်ကို ရှေ့-ဘယ်တွင် ထားပါ။';

  @override
  String get introWhyOll =>
      'နောက်ဆုံးအလွှာကို ဦးတည်ချက်အရင်၊ နေရာနောက်မှ ခွဲခြင်းဖြင့် ဖော်မြူလာ နည်းနည်းသာ လိုသည်။';

  @override
  String get introHowPll =>
      'အပေါ်သည် အဝါအပြည့် ဖြစ်နေပြီ။\nT-perm က ထောင့်များကို နေရာလဲပြီး U-perm က အနားသုံးခုကို လည်ပတ်ရွှေ့သည်။\nဖော်မြူလာ ရွေးရန် ဘေးအရောင်များကို ဖတ်ပါ။';

  @override
  String get introHoldPll =>
      'အဝါ အပေါ်။ T-perm: headlights ဘယ်ဘက်။ U-perm: ပြီးသောဘက် နောက်တွင်။';

  @override
  String get introWhyPll =>
      'အပေါ်တစ်ခုလုံး အဝါဖြစ်ပြီးလျှင် အပိုင်းများ၏ နေရာသာ မှားနေပြီး လဲလှယ်မှု အနည်းငယ်ဖြင့် ပြီးသည်။';

  @override
  String get introHowTwoFirst =>
      'အဖြူ အောက်မူသော အဖြူထောင့်တစ်ခုကို အခြေအဖြစ် ရွေးပါ။\nနောက်ထောင့်တိုင်းကို ရှေ့-ညာရှိ ၎င်း၏နေရာအပေါ် ယူလာပါ။\nဘေးအရောင်များ ကိုက်၍ ဝင်သည်အထိ R U R\' U\' ထပ်လုပ်ပါ။';

  @override
  String get introHoldTwoFirst =>
      'အဖြူ အောက်။ နေရာလွတ် ရှေ့-ညာ၊ ၎င်း၏ထောင့် အပေါ်အလွှာတွင် တည့်တည့်အပေါ်။';

  @override
  String get introWhyTwoFirst =>
      '2×2 တွင် အလယ်မရှိ- ပထမထားသောထောင့်က အိမ်နီးချင်းများ၏ အရောင်ကို သတ်မှတ်သဖြင့် အဖြူသာမက ဘေးအရောင်လည်း အရေးကြီးသည်။';

  @override
  String get introHowTwoOll =>
      'အဝါ အပေါ်မူသော ထောင့်များကို ရေတွက်ပါ။\nတစ်ခုရှိလျှင် ရှေ့-ဘယ်တွင်ထားပြီး Sune လုပ်ပါ- R U R\' U R U2 R\'။\nပြန်ရေတွက်ပြီး ထပ်လုပ်ပါ၊ Sune အများဆုံး သုံးကြိမ်။';

  @override
  String get introHoldTwoOll =>
      'အဖြူ အောက်၊ အဝါ အပေါ်။ Sune တိုင်းမတိုင်မီ အဝါ အပေါ်မူသောထောင့် ရှေ့-ဘယ်တွင်။';

  @override
  String get introWhyTwoOll =>
      'Sune သည် အဖြူအလွှာကို မပျက်စေဘဲ အပေါ်ထောင့်များကို လိမ်ပေးသည်၊ ပြန်ရေတွက်ခြင်းက နောက်တစ်ကြိမ် ကိုင်ပုံကို ပြောပြသည်။';

  @override
  String get introHowTwoPbl =>
      'headlights ကို ရှာပါ- ဘေးမျက်နှာတစ်ခုအပေါ်ရှိ အရောင်တူ စတစ်ကာ နှစ်ခု။\nတစ်ဘက်တွင် headlights ရှိလျှင် ဘယ်ဘက်ထားပြီး T-perm လုပ်ပါ။\nheadlights မရှိလျှင် မည်သည့်ဘက်မှမဆို Y-perm လုပ်ပြီး အပေါ်ကို ညှိပါ။';

  @override
  String get introHoldTwoPbl =>
      'အဖြူ အောက်၊ အဝါ အပေါ်။ T-perm: headlights ဘယ်ဘက်။ Y-perm: မည်သည့်ဘက်မဆို သင့်ဘက်။';

  @override
  String get introWhyTwoPbl =>
      'အပေါ် အဝါဖြစ်ပြီးလျှင် ထောင့်နေရာသာ မှားသည်- T-perm က ကပ်လျက်နှစ်ခု၊ Y-perm က ထောင့်ဖြတ်နှစ်ခုကို လဲသည်။';

  @override
  String get introHowBigIntro =>
      'ပုံသေ အလယ် မရှိပါ- အလယ်အပိုင်း လေးခုက မျက်နှာအရောင်တစ်ခုစီကို ဖွဲ့သည်။\nRw ကဲ့သို့ နှစ်ထပ်လှည့်ခြင်းက အလွှာနှစ်ခုကို တစ်ပြိုင်နက် လှည့်သည်။\n2R ကဲ့သို့ အတွင်းလှည့်ခြင်းက အတွင်းအလွှာ တစ်ခုကိုသာ လှည့်သည်။';

  @override
  String get introHoldBigIntro =>
      'အစတွင် စိတ်ကြိုက်- 4×4 တွင် မရွေ့သောအလယ် မရှိသဖြင့် အရောင်တစ်ခုစီ၏နေရာကို သင်ရွေးသည်။';

  @override
  String get introWhyBigIntro =>
      'လျှော့ချနည်းက အလယ်နှင့် အနားအပိုင်းများကို စုပေးသဖြင့် ကုဗကြီးကို 3×3 ကဲ့သို့ ဖြေနိုင်သည်။';

  @override
  String get introHowBigCenters =>
      'ထောင့်တစ်ခုတွင် အရောင်အစီအစဉ်ကို အရင်စစ်ပါ။\nဆန့်ကျင်ဘက် အလယ်နှစ်ခု အရင်ဖွဲ့ပြီး ကျန်လေးခုကို ဖွဲ့ပါ။\nအတွင်းအလွှာများက အလယ်အပိုင်းများကို ရွှေ့သည်၊ ဖွင့်ထားသော အလွှာကို အမြဲ ပြန်ပိတ်ပါ။';

  @override
  String get introHoldBigCenters =>
      'ဖွဲ့နေသောမျက်နှာ ရှေ့တွင်၊ ပြီးသောအလယ်များ ဘယ်နှင့်ညာတွင် လမ်းဖယ်ထား။';

  @override
  String get introWhyBigCenters =>
      'အလွှာတစ်ခုက အလယ်များကို ရွှေ့ပြီး ပြန်လှည့်ခြင်းက ပြီးသောအလယ်များကို ပြန်ထားသဖြင့် ရည်ရွယ်သောအပိုင်းသာ ပြောင်းသည်။';

  @override
  String get introHowBigEdges =>
      'အရောင်နှစ်ရောင်တူ အတောင်နှစ်ခုကို ရှာပါ။\nရှေ့တွင် တန်းစီပြီး Uw\' ဖြင့် ဆက်ပါ။\nမတွဲရသေးသော အနားကို လဲထည့်ပြီး Uw က အလယ်များကို ပြန်ထားသည်။';

  @override
  String get introHoldBigEdges =>
      'တွဲနေသောအနား ရှေ့အလွှာများတွင်၊ ပြီးသောအနားများ အပေါ်နှင့်အောက် အလွှာတွင် ထားသည်။';

  @override
  String get introWhyBigEdges =>
      'Uw\' က အလယ်များကို ဖယ်ပေးပြီး အတောင်နှစ်ခု တွေ့စေသည်၊ Uw က ပြန်ထားသဖြင့် သင့်အလုပ် မပျက်ပါ။';

  @override
  String get introHowBigParity =>
      'ပိတ်မိသည်အထိ 4×4 ကို 3×3 ကဲ့သို့ ဖြေပါ။\nအနားတစ်ခု လှန်နေလျှင်- ရှည်သော OLL parity ဖော်မြူလာ။\nအနားနှစ်ခု နေရာလဲလျှင်- 2R2 U2 2R2 Uw2 2R2 2U2။';

  @override
  String get introHoldBigParity =>
      'နောက်ဆုံးအလွှာ အပေါ်။ OLL parity: လှန်နေသောအနား ရှေ့တွင်။ PLL parity: နေရာလဲအနားများ ရှေ့နှင့်နောက်။';

  @override
  String get introWhyBigParity =>
      'အတောင်များသည် 3×3 မရောက်နိုင်သော အခြေအနေသို့ ရောက်နိုင်သည်၊ ဤဖော်မြူလာများက အတွင်းအလွှာကိုလှည့်၍ ထိုအရာကိုသာ ပြန်ဖြေပေးသည်။';

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
  String get stageCrown1 => 'ပထမ အလွှာ (အဖြူ)';

  @override
  String get stageCrown2 => 'ဒုတိယ အလွှာ';

  @override
  String get stageCrown3 => 'တတိယ အလွှာ (အဝါ)';

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
  String get introHoldFiveIntro =>
      'စိတ်ကြိုက်ကိုင်ပါ- 5×5 တွင် မျက်နှာတိုင်း၏ အလယ်ဗဟို မရွေ့သဖြင့် ၎င်းက အရောင်ကို ပြသည်။';

  @override
  String get introWhyFiveIntro =>
      'မရွေ့သောအလယ်များက အရောင်စနစ်ကို သတ်မှတ်သဖြင့် အလယ်များကို အစီအစဉ်မှား မဖွဲ့နိုင်ပါ။';

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
      'မရွေ့သော အလယ်အပိုင်းမှ စပါ- အရောင်ကို ၎င်းက သတ်မှတ်သည်။\nသုံးခုတန်း ဘားများဖွဲ့ပြီး အတွင်းအလွှာဖြင့် ထိုးသွင်းပါ။\nဘားကို ထည့်သော လှည့်ကွက်က ပြီးသောအလယ်ကိုလည်း ပြန်ထားပေးသည်။';

  @override
  String get introHoldFiveCenters =>
      'ဖွဲ့နေသောအလယ် ရှေ့ သို့မဟုတ် အပေါ်တွင်၊ ပြီးသောအလယ်များ အောက်၊ ဘယ် သို့မဟုတ် ညာ။';

  @override
  String get introWhyFiveCenters =>
      'အလွှာဝင်၊ အပေါ်လှည့်၊ အလွှာပြန်- ဘားသွင်းသော အလွှာက ပြီးသောအလယ်များကိုလည်း ပြန်ထားသည်။';

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
      'ရှေ့တွင် အတောင်တိုင်းကို ၎င်း၏ အလယ်အနားနှင့် ကိုက်ပါ။\nအတွင်းအလွှာကို လှည့်၊ မပြီးသောအနားကို လဲထည့်၊ ပြန်လှည့်ပါ။\nနောက်ဆုံးအနားများအတွက်- အလွှာ၊ လှန်၊ အလွှာ။';

  @override
  String get introHoldFiveEdges =>
      'ဖွဲ့နေသောအနား ရှေ့တွင်၊ ပြီးသောအနားများ အပေါ်နှင့်အောက် အလွှာတွင် သိမ်းထား။';

  @override
  String get introWhyFiveEdges =>
      'အတွင်းအလွှာကို ဖွင့်ပိတ်ခြင်းက အတောင်များကို ဆက်ပေးပြီး အလယ်နှင့် သိမ်းထားသောအနားများ ပြန်ရောက်လာသည်။';

  @override
  String get lessonFiveSolve => '5×5 ကို 3×3 ကဲ့သို့ ဖြေရှင်း';

  @override
  String get lessonFiveSolveDesc => '3×3 ကဲ့သို့ အလွှာလိုက် ပြီးအောင်လုပ်ပါ။';

  @override
  String get introGoalFiveSolve =>
      'လျှော့ချပြီးသော 5×5 ကို 3×3 ကဲ့သို့ အပြင်လှည့်ကွက်များဖြင့်သာ အလွှာလိုက် ဖြေပါ။';

  @override
  String get introHowFiveSolve =>
      'ယခုမှစ၍ အပြင်လှည့်ကွက်သာ၊ မဟုတ်လျှင် တွဲပြီးအနားများ ကွဲသွားမည်။\nအဖြူကြက်ခြေနှင့် ထောင့်များ၊ အလယ်အလွှာ၊ ထို့နောက် အဝါအလွှာ။\nမရွေ့သော အလယ်များက မျက်နှာတိုင်း၏ အရောင်ကို ပြသည်။';

  @override
  String get introHoldFiveSolve =>
      'ပထမအလွှာ၏အရောင် အောက်တွင်၊ 3×3 နှင့် အတူတူ၊ ထည့်မည့်ထောင့် ရှေ့-ညာ။';

  @override
  String get introWhyFiveSolve =>
      'အတွင်းလှည့်ကွက်များက အလယ်နှင့်အနားများကို ထပ်ခွဲမည်၊ အပြင်လှည့်ကွက်များက အတုံးတိုင်းကို 3×3 အပိုင်းတစ်ခုအဖြစ် ရွှေ့သည်။';

  @override
  String get lessonFiveParity => '5×5 အနား parity';

  @override
  String get lessonFiveParityDesc => 'အတောင်များ နေရာလဲနေသော အနားကို ပြင်ပါ။';

  @override
  String get introGoalFiveParity =>
      'အပြင်အတောင်နှစ်ခု နေရာလဲနေသော အနားတစ်ခုကို ပြင်ပါ- 5×5 ၏ တစ်ခုတည်းသော parity ဖြစ်သည်။';

  @override
  String get introHowFiveParity =>
      'လှန်နေပုံရသော နောက်ဆုံးအနားတစ်ခုအဖြစ် ပေါ်လာသည်။\nအတွင်းအလွှာသုံး ရှည်သောပြင်ဆင်မှုကို တစ်ကြိမ်လုပ်ပါ။\n5×5 တွင် PLL parity မရှိပါ။';

  @override
  String get introHoldFiveParity =>
      'နောက်ဆုံးအလွှာ အပေါ်၊ အတောင်လဲနေသောအနား အပေါ်အလွှာ၏ ရှေ့တွင်။';

  @override
  String get introWhyFiveParity =>
      '5×5 တွင် အနားတစ်ခု၏ အပြင်အတောင်နှစ်ခုသာ လဲနိုင်သဖြင့် ဖော်မြူလာတစ်ခုဖြင့် လုံလောက်သည်။';

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
  String get introHoldSixIntro =>
      'အစတွင် စိတ်ကြိုက်- 4×4 ကဲ့သို့ 6×6 တွင်လည်း မရွေ့သောအလယ် မရှိ။';

  @override
  String get introWhySixIntro =>
      '4×4 နှင့် 5×5 ဖြေတတ်လျှင် 6×6 သည် အတုံးပိုကြီးသော တူညီသည့် လျှော့ချနည်းသာ ဖြစ်သည်။';

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
      'ထောင့်တစ်ခုတွင် အရောင်အစီအစဉ်ကို အရင်စစ်ပါ- မရွေ့သော အလယ် မရှိပါ။\nလေးခုတန်း ဘားများဖွဲ့ပြီး ဆက်ပါ။\nနောက်ဆုံးအလယ်နှစ်ခုတွင် တစ်ခုချင်းရွှေ့ပါ- အလွှာ၊ အပေါ်၊ ပြန်။';

  @override
  String get introHoldSixCenters =>
      'ဖွဲ့နေသောမျက်နှာ ရှေ့တွင်၊ ပြီးသောအလယ်များ ဘယ်၊ ညာ သို့မဟုတ် အောက်။';

  @override
  String get introWhySixCenters =>
      'ဘားများကို အတွင်းအလွှာဖြင့် ဆက်ပြီး အလွှာတိုင်းကို ပြန်လှည့်သဖြင့် ပြီးသောအလယ်များ မပျက်ပါ။';

  @override
  String get lessonSixEdges => '6×6 အနားများ';

  @override
  String get lessonSixEdgesDesc => 'အနားတိုင်း၏ အပိုင်း လေးခုကို စုပါ။';

  @override
  String get introGoalSixEdges =>
      '6×6 တွင် သန့်ရှင်းသော အနား ၁၂ ခု ရှိစေရန် အနားတစ်ခုစီ၏ အပိုင်း လေးခုကို စုပါ။';

  @override
  String get introHowSixEdges =>
      'အနားတစ်ခု၏ အပြင်နှင့် အတွင်း အတောင်များကို ရှေ့တွင် တန်းစီပါ။\nနက်သော ကျယ်အလွှာက အနားကို အဝင်အထွက် လုပ်ပေးသည်။\nအပိုင်းတစ်ခု ထုတ်ရန် ပြီးသောအနားကို ဘယ်တော့မှ မဖျက်ပါနှင့်။';

  @override
  String get introHoldSixEdges =>
      'ဖွဲ့နေသောအနား ရှေ့တွင်၊ ပြီးသောအနားများ အပေါ်နှင့်အောက်တွင် ထား။';

  @override
  String get introWhySixEdges =>
      'နက်သော ကျယ်လှည့်ကွက်က အလယ်များကို ဖယ်ပေးပြီး အတောင်များ တွေ့စေကာ ပြန်ထားသည်။';

  @override
  String get lessonSixSolve => '6×6 ကို 3×3 ကဲ့သို့ ဖြေရှင်း';

  @override
  String get lessonSixSolveDesc => '3×3 ကဲ့သို့ အလွှာလိုက် ပြီးအောင်လုပ်ပါ။';

  @override
  String get introGoalSixSolve =>
      'လျှော့ချပြီးသော 6×6 ကို 3×3 ကဲ့သို့ အပြင်လှည့်ကွက်များဖြင့်သာ အလွှာလိုက် ဖြေပါ။';

  @override
  String get introHowSixSolve =>
      'ယခုမှစ၍ အပြင်လှည့်ကွက်သာ- အတွင်းအလွှာက အလယ် သို့မဟုတ် အနားကို ဖျက်မည်။\nသင်ဖွဲ့ထားသော အလယ်များက မျက်နှာတိုင်း၏ အရောင်ကို ပြသည်။\nအဖြူကြက်ခြေနှင့် ထောင့်များ၊ အလယ်အလွှာ၊ ထို့နောက် အဝါအလွှာ။';

  @override
  String get introHoldSixSolve =>
      'ပထမအလွှာ၏အရောင် အောက်တွင်၊ 3×3 နှင့် အတူတူ၊ ထည့်မည့်ထောင့် ရှေ့-ညာ။';

  @override
  String get introWhySixSolve =>
      'အပြင်လှည့်ကွက်များက 4×4 အလယ်တိုင်းနှင့် အနားတိုင်းကို အပိုင်းတစ်ခုအဖြစ် ရွှေ့သည်၊ 3×3 နှင့် အတူတူ။';

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
      'ပိတ်မိသည်အထိ 3×3 ကဲ့သို့ ဖြေပါ။\nအနားတစ်ခု လှန်နေလျှင်- 3Rw သုံး ရှည်သောပြင်ဆင်မှု။\nအနားနှစ်ခု နေရာလဲလျှင်- အတွင်း နှစ်ချက်လှည့် တိုသောပြင်ဆင်မှု။';

  @override
  String get introHoldSixParity =>
      'နောက်ဆုံးအလွှာ အပေါ်။ လှန်နေသောအနား ရှေ့တွင်၊ နှစ်ခုလဲလျှင် ရှေ့နှင့်နောက်။';

  @override
  String get introWhySixParity =>
      '4×4 ကဲ့သို့ 6×6 လည်း အနားတစ်ခုလှန် သို့မဟုတ် နှစ်ခုလဲဖြင့် ပြီးနိုင်သည်၊ အတွင်းအလွှာ ဖော်မြူလာများက ၎င်းကိုသာ ပြင်ပြီး ကျန်တာကို ထိန်းထားသည်။';

  @override
  String get stepFivePieces => '5×5 ၏ အပိုင်းများ';

  @override
  String get stepFivePiecesBody =>
      'မျက်နှာတိုင်း၏ အလယ်ဗဟိုအပိုင်း မရွေ့သဖြင့် အရောင်စနစ် မှားမည်မဟုတ်ပါ။ ၎င်းပတ်လည်တွင် အလယ်အပိုင်း ရှစ်ခုရှိပြီး ထောင့်-အလယ်နှင့် အနား-အလယ်တို့ အမျိုးအစား ဘယ်တော့မှ မလဲပါ။ အနားတိုင်းသည် အလယ်အပိုင်းတစ်ခုနှင့် အတောင်နှစ်ခု ဖြစ်သည်။';

  @override
  String get stepFiveSlices => 'လှည့်ခြင်း သုံးမျိုး';

  @override
  String get stepFiveSlicesBody =>
      'အပြင်လှည့်ခြင်းက မျက်နှာတစ်ခုကို ရွှေ့သည်။ နှစ်ထပ်လှည့်ခြင်းက မျက်နှာနှင့် ၎င်းနောက်ရှိ အလွှာကို ရွှေ့သည်။ အတွင်းလှည့်ခြင်းက အတွင်းရှိ အလွှာကိုသာ ရွှေ့သည်- အပြင်ကို မထိဘဲ အပိုင်းများ နေရာပြောင်းပုံ ဖြစ်သည်။';

  @override
  String get stepFiveCenterBar => 'အလယ်တန်းများ';

  @override
  String get stepFiveCenterBarBody =>
      'အရောင်တူ အလယ်အပိုင်း သုံးခုကို တန်းစီပြီး အတွင်းအလွှာဖြင့် ထိုးသွင်း၊ အပေါ်ကိုလှည့်ကာ အလွှာကို ပြန်လှည့်ပါ- ဘားသွင်းသော လှည့်ကွက်က ပြီးသောအလယ်ကိုလည်း ပြန်ထားသည်။ ဘားသုံးခုသည် အလယ်တစ်ခု ဖြစ်သည်။';

  @override
  String get stepFiveCenterSwap => 'မပျက်စေဘဲ နေရာလဲ';

  @override
  String get stepFiveCenterSwapBody =>
      'အလယ်အပိုင်း တစ်ခုတည်းကို ရွှေ့ရန်- အတွင်းအလွှာ လှည့်၊ အပေါ်လှည့်၊ အလွှာကို နောက်ပြန်၊ အပေါ်ကို ပြန်လှည့်ပါ။ ပြီးသားအလယ်များ အမြဲ ပြန်ကောင်းသည်။';

  @override
  String get stepFiveEdgePair => 'အတောင်များကို အလယ်အနားနှင့် တွဲ';

  @override
  String get stepFiveEdgePairBody =>
      'ရှေ့တွင် အတောင်တစ်ခုကို ၎င်း၏ အလယ်အနားဘေး တန်းစီပြီး အတွင်းအလွှာကို ချ၊ trigger တိုဖြင့် မပြီးသောအနားကို လဲထည့်ကာ အတွင်းအလွှာကို ပြန်တင်ပါ။';

  @override
  String get stepFiveEdgeLast => 'နောက်ဆုံး အနားများ';

  @override
  String get stepFiveEdgeLastBody =>
      'လဲထည့်စရာ အနားလွတ် မကျန်တော့လျှင် အလွှာ၊ လှန်၊ အလွှာ ကို သုံးပါ- ကျယ်လှည့်ကွက်၊ trigger တိုနှင့် ကျယ်လှည့်ကွက်ပြန်တို့က ပြီးသောအနားများကို မဖျက်ဘဲ နောက်ဆုံးအနားများကို တွဲပေးသည်။';

  @override
  String get stepFiveAsThree => 'ယခု 3×3 ဖြစ်သွားပြီ';

  @override
  String get stepFiveAsThreeBody =>
      'အလယ်နှင့်အနားများ ပြီးလျှင် 5×5 သည် 3×3 အကြီးကဲ့သို့ ဖြစ်သည်။ အပြင်လှည့်ကွက်သာ သုံး၍ အလွှာလိုက်- အဖြူကြက်ခြေနှင့် ထောင့်များ၊ အလယ်အလွှာ၊ ထို့နောက် အဝါအလွှာ။ 5×5 တွင် PLL parity မရှိပါ။';

  @override
  String get stepFiveEdgeParity => 'နောက်ဆုံးအနား၏ အတောင်များကို နေရာလဲ';

  @override
  String get stepFiveEdgeParityBody =>
      'တခါတရံ နောက်ဆုံးအနား၏ အပြင်အတောင်နှစ်ခု လဲနေ၍ လှန်နေပုံရသည်- 5×5 ၏ တစ်ခုတည်းသော parity ဖြစ်သည်။ အပေါ်အလွှာ၏ ရှေ့တွင်ထားပြီး အတွင်းအလွှာ ဖော်မြူလာကို တစ်ကြိမ်လုပ်ပါ၊ ကျန်အားလုံး နေရာပြန်ရောက်သည်။';

  @override
  String get stepSixPieces => '6×6 ၏ အပိုင်းများ';

  @override
  String get stepSixPiecesBody =>
      '4×4 ကဲ့သို့ 6×6 တွင် မရွေ့သောအလယ် မရှိ- အလယ်အပိုင်း ဆယ့်ခြောက်ခုက မျက်နှာတိုင်း၏ အရောင်ကို ဖွဲ့သဖြင့် ထောင့်တစ်ခုတွင် အရောင်အစီအစဉ်ကို အရင်စစ်ပါ။ အနားတိုင်းတွင် အတောင်လေးခု- အပြင်နှစ်ခု၊ အတွင်းနှစ်ခု။';

  @override
  String get stepSixSlices => 'ပိုနက်သော အလွှာများကို လှည့်ခြင်း';

  @override
  String get stepSixSlicesBody =>
      'နှစ်ထပ်လှည့်ခြင်းက မျက်နှာတစ်ခုမှ အလွှာ နှစ်ခု သို့မဟုတ် သုံးခုကို ရွှေ့နိုင်သည်။ ဒုတိယ သို့မဟုတ် တတိယ အတွင်းအလွှာများသည် အလယ်နှင့် အနားများအတွက် ကိရိယာများ ဖြစ်သည်။';

  @override
  String get stepSixCenterBar => 'လေးခုတန်းများ';

  @override
  String get stepSixCenterBarBody =>
      'အရောင်တူ အလယ်အပိုင်း လေးခုစီ တန်းများဖွဲ့ပြီး အတွင်းအလွှာ လှည့်ကွက်များဖြင့် ဘေးချင်းကပ်ကာ အလွှာတိုင်းကို ပြန်လှည့်ပါ၊ မျက်နှာသည် အရောင်တစ်ရောင်တည်း 4×4 အတုံး ဖြစ်သည်အထိ။';

  @override
  String get stepSixCenterSwap => 'တစ်ကြိမ်လျှင် အပိုင်းတစ်ခု ရွှေ့';

  @override
  String get stepSixCenterSwapBody =>
      'တတိယအလွှာကို လှည့်၊ အပေါ်ကို လှည့်၊ ပြန်၊ အပေါ်ပြန်- အလယ်အပိုင်း တစ်ခုရွှေ့ပြီး ပြီးသောအလယ်များ ပြန်ရောက်သည်။ ဘားမဝင်တော့သော နောက်ဆုံးအလယ်နှစ်ခုတွင် သုံးပါ။';

  @override
  String get stepSixEdgePair => 'အပိုင်း လေးခု၊ အနား တစ်ခု';

  @override
  String get stepSixEdgePairBody =>
      'နက်သော ကျယ်အလွှာဖြင့် အနားတစ်ခု၏ အတောင်လေးခုကို ရှေ့တွင်စုပြီး trigger တိုဖြင့် မပြီးသောအနားကို လဲထည့်ကာ ကျယ်အလွှာကို ပြန်လှည့်ပါ။';

  @override
  String get stepSixEdgeLast => 'နောက်ဆုံး အနားများ';

  @override
  String get stepSixEdgeLastBody =>
      'နက်သော ကျယ်လှည့်ကွက်နှင့် ၎င်း၏ပြန်လှည့်ကွက်ကြားတွင် trigger တိုဖြင့် နောက်ဆုံးအနားများကို တွဲပါ၊ ပြီးသောအနားများ တွဲလျက်ရှိနေမည်။ အပိုင်းတစ်ခု ထုတ်ရန် ပြီးသောအနားကို ဘယ်တော့မှ မဖျက်ပါနှင့်။';

  @override
  String get stepSixAsThree => 'ယခု 3×3 ဖြစ်သွားပြီ';

  @override
  String get stepSixAsThreeBody =>
      '4×4 အလယ်များနှင့် တွဲပြီးအနားများဖြင့် 6×6 ကို 3×3 ကဲ့သို့ အပြင်လှည့်ကွက်သာဖြင့် အလွှာလိုက် ဖြေပါ။ အဆုံးတွင် အနားတစ်ခုလှန် သို့မဟုတ် နှစ်ခုလဲသည်မှာ parity ဖြစ်ပြီး အမှားမဟုတ်ပါ။';

  @override
  String get stepSixOllParity => 'အနားတစ်ခု ပြောင်းပြန်';

  @override
  String get stepSixOllParityBody =>
      'နောက်ဆုံးအလွှာတွင် လှန်နေပုံရသော အနားတစ်ခုတည်းသည် parity ဖြစ်သည်။ အပေါ်အလွှာ၏ ရှေ့တွင်ထားပြီး ရှည်သောပြင်ဆင်မှုကို လုပ်ပါ- ၎င်းက အတောင်လေးခုလုံးကို လှန်ပြီး အပေါ် ဘယ်-ညာ အနားများကိုလည်း လဲကာ ပထမ အလွှာနှစ်ခုကို မထိပါ။';

  @override
  String get stepSixPllParity => 'အနားနှစ်ခု နေရာလဲ';

  @override
  String get stepSixPllParityBody =>
      'အဆုံးတွင် အနားနှစ်ခု လဲနေပုံရလျှင် ၎င်းတို့ကို အပေါ်အလွှာ၏ ရှေ့နှင့်နောက်တွင်ထားပြီး အတွင်း နှစ်ချက်လှည့် တိုသောပြင်ဆင်မှုကို လုပ်ပါ- အနားနှစ်ခု၏ အတောင်လေးခုလုံး နေရာလဲသည်။';

  @override
  String get stepSixWingRule => 'အတောင် လေးခုလား၊ နှစ်ခုလား။';

  @override
  String get stepSixWingRuleBody =>
      '6×6 ၏ အနားတစ်ခုသည် အတောင် 4 ခုဖြင့် ဖွဲ့စည်းထားသည်။ လှန်နေပုံရသော အနားကို မပြင်မီ သေချာကြည့်ပါ- အတောင် 4 ခုလုံး လှန်နေလျှင် ပုံမှန် အလွှာ 3 ခု OLL parity ကို သုံးပါ၊ အတွင်းအတောင် 2 ခုသာ လှန်နေလျှင် အတွင်းအတောင် parity ကို သုံးပါ။ ကုဗတုံးသည် အတွင်းအတောင် အခြေအနေကို ပြထားသည်။';

  @override
  String get stepSixInnerWingParity => 'အတွင်းအတောင် နှစ်ခု လှန်နေသည်';

  @override
  String get stepSixInnerWingParityBody =>
      'ဤနေရာတွင် ရှေ့အပေါ်အနား၏ အပြင်အတောင်များ မှန်နေပြီး အတွင်းအတောင် 2 ခုသာ လှန်နေသည်။ ထိုအနားကို အပေါ်အလွှာ၏ ရှေ့တွင်ထားပြီး တတိယ အလွှာပါးများ (3R, 3L) ကိုသာ လှည့်ပါ- အတွင်းအတောင်များ ပြန်မှန်လာပြီး ကျန်ကုဗတုံး ဖြေရှင်းပြီးအတိုင်း ရှိနေမည်။';

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
  String get patternsWatchVideo => 'ဗီဒီယို ကြည့်';

  @override
  String get patternsNotNow => 'ယခု မဟုတ်သေး';

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

  @override
  String timerInspectIntro(int seconds) {
    return 'ကုဗကို ကြည့်ရှုရန် $seconds စက္ကန့် ရှိသည်။ နောက်ပြန်ရေတွက်ရန် နှိပ်ပါ။';
  }

  @override
  String get timerInspectTapReady => 'ဖြေရှင်းရန် အသင့်ဖြစ်လျှင် နှိပ်ပါ';

  @override
  String timerInspectPlus2(int seconds) {
    return 'စစ်ဆေးချိန် $seconds စက္ကန့် ကျော်သွား၍ နာရီ အလိုအလျောက် စတင်သည်- +2 စက္ကန့် ဒဏ်';
  }

  @override
  String timerAvgOf(int count) {
    return '$count ကြိမ် ပျမ်းမျှ';
  }

  @override
  String get timerAvgNote =>
      'ပျမ်းမျှတွင် အကောင်းဆုံးနှင့် အဆိုးဆုံး အချိန်ကို ဖယ်ထားသည်';

  @override
  String get timerPbSub => 'အကောင်းဆုံး တစ်ကြိမ်';

  @override
  String get timerPlus2Caption => '+2 စက္ကန့် ဒဏ်';

  @override
  String get timerDnfCaption => 'မပြီးဆုံး (DNF)';

  @override
  String get timerDeleteCaption => 'ဤဖြေရှင်းမှုကို ဖျက်ရန်';

  @override
  String get patternBullsEye => 'ပစ်မှတ်';

  @override
  String get patternFramedCenter => 'ဘောင်ခတ် အလယ်';

  @override
  String get patternBlockCheckerboard => 'အကွက်ကြီး စစ်တုရင်';

  @override
  String get patternCubeInCubeInCube => 'ကုဗထဲ ကုဗထဲ ကုဗ';

  @override
  String get patternUnionJack => 'ယူနီယံဂျက်';

  @override
  String get patternKilt => 'ကစ်လ်';

  @override
  String get patternSixTs => 'T ခြောက်ခု';

  @override
  String get patternTwinPeaks => 'အမြင့်ထိပ် နှစ်ခု';

  @override
  String get patternSpiral => 'ခရုပတ်';

  @override
  String get patternTetris => 'တက်ထရစ်';

  @override
  String get patternSpots => 'အလယ် အစက်များ';

  @override
  String get patternStripes => 'အစင်းများ';

  @override
  String get patternAnaconda => 'အနာကွန်ဒါ';

  @override
  String get patternZigzag => 'ဇစ်ဇက်';

  @override
  String get patternFourSpots => 'အစက် လေးခု';

  @override
  String get patternGreenMamba => 'မာမ်ဘာ အစိမ်း';

  @override
  String get patternPlusMinus => 'အပေါင်း အနုတ်';

  @override
  String guideStepCounter(int current, int total) {
    return 'အဆင့် $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'လှည့်ကွက် $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'လှည့်ကွက် $current / $total';
  }

  @override
  String get dailyStep1Title => 'အဆင့် 1- သင့်ကုဗကို ရောမွှေပါ';

  @override
  String get dailyStep2Title => 'အဆင့် 2- ကုဗကို ဖြေရှင်းပါ';

  @override
  String dailyPersonalBest(String time) {
    return 'ကိုယ်ပိုင် အကောင်းဆုံး: $time';
  }

  @override
  String get dailyRecentDays => 'မကြာသေးမီ ရက်များ';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ဆက်တိုက် $count ရက်! အရမ်းတော်တယ်!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'ကုဗ ရောမွှေပြီးပါပြီ! ယခု ဖြေရှင်းပါ';

  @override
  String get dailyCongratsTitle => 'ဂုဏ်ယူပါတယ်!';

  @override
  String dailyCongratsBody(String time) {
    return 'ယနေ့ စိန်ခေါ်မှုကို $time ဖြင့် ဖြေရှင်းခဲ့သည်။';
  }

  @override
  String get dailyCongratsDone => 'စိန်ခေါ်မှုသို့ ပြန်သွားရန်';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • ပုံစံ $count ခု';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '$hours နာရီ ကျန်သည်';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '$minutes မိနစ် ကျန်သည်';
  }

  @override
  String get lockedLabel => 'သော့ခတ်ထားသည်';

  @override
  String get unlockedLabel => 'သော့ဖွင့်ထားသည်';

  @override
  String patternUnlockBody(int hours) {
    return 'ဤပုံစံနှင့် အဆင့်လိုက် လမ်းညွှန်ကို $hours နာရီ ဖွင့်ရန် ဗီဒီယိုတို ၁ ခု ကြည့်ပါ';
  }

  @override
  String lessonUnlockBody(int hours) {
    return 'ဤသင်ခန်းစာကို နောက် $hours နာရီအတွင်း ကြိုက်သလောက် ဖွင့်ရန် ဗီဒီယိုတို ၁ ခု ကြည့်ပါ';
  }

  @override
  String get bigCubeUnlockTitle => 'ကုဗကြီးများ ဖြေရှင်းရန်';

  @override
  String bigCubeUnlockBody(int hours) {
    return '4×4–6×6 အခမဲ့ ဖြေရှင်းခွင့်ကို သုံးပြီးပါပြီ။ နောက် $hours နာရီအတွင်း ကုဗကြီးများ ဖြေရှင်းရန် ဗီဒီယိုတို ၁ ခု ကြည့်ပါ';
  }

  @override
  String get doubleTurnBadge => 'နှစ်ကြိမ်လှည့် · 180°';

  @override
  String get homeAcademy => 'အကယ်ဒမီ';

  @override
  String get homePatterns => 'မိုက်တဲ့ ပုံစံများ';

  @override
  String get homePractice => 'အချိန်တိုင်းနှင့် နေ့စဉ်';

  @override
  String get scanChoiceSubtitle => 'ဘယ်လို စတင်မလဲ?';

  @override
  String get scanChoiceCamera => 'ကင်မရာဖြင့် စကင်ဖတ်';

  @override
  String get scanChoiceCameraDesc =>
      'မျက်နှာတိုင်းကို ကင်မရာသို့ပြပြီး အဖြေရယူပါ။';

  @override
  String get scanChoice3d => '3D ကုဗ ဖွင့်ရန်';

  @override
  String get scanChoice3dDesc =>
      'ကုဗကို လှည့်၊ ရောမွှေပြီး တစ်ဆင့်ချင်း ဖြေရှင်းပါ။';

  @override
  String get academyAllSizes => 'အရွယ်အစား အားလုံး';

  @override
  String homeAcademyProgress(int done, int total) {
    return 'သင်ခန်းစာ $done / $total ပြီးပြီ';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total ပြီး';
  }

  @override
  String get lessonStageConcept => 'ရှင်းလင်း';

  @override
  String get lessonStageExamples => 'ဥပမာ';

  @override
  String get lessonStagePractice => 'လက်တွေ့';

  @override
  String get lessonStageNext => 'ရှေ့ / လွတ်လပ်';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'အဆင့် $index / $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'ဥပမာ $index / $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'လက်တွေ့ $index / $total';
  }

  @override
  String get lessonBonusCase => 'ဘောနပ်စ် အခြေအနေ';

  @override
  String lessonContinueDesc(String lesson) {
    return '$lesson သို့ တန်းသွားပါ။';
  }

  @override
  String get lessonFreePractice => 'လွတ်လပ်စွာ လေ့ကျင့်';

  @override
  String get lessonFreePracticeDesc =>
      'ရောထားသော 3D ကုဗကို အစမှ ဤအဆင့်အထိ ကိုယ်တိုင် ဖြေရှင်းပါ။';

  @override
  String freePracticeBanner(String topic) {
    return 'လွတ်လပ်စွာ လေ့ကျင့်ပါ: ကုဗကို အစမှ $topic အထိ ဖြေရှင်းပါ!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return '$face အလယ်ရှိသော မျက်နှာကို မြှားအတိုင်း လှည့်ပါ။ အလယ်က နေရာမပြောင်း; ပတ်လည်အပိုင်းများသာ ရွေ့သည်။';
  }

  @override
  String cueTrigger(String front) {
    return 'ညာလက် trigger, $front ကို သင့်ဘက်မူ၍: ညာမျက်နှာ အပေါ်, အပေါ်ကို ဘယ်, ညာမျက်နှာ အောက်, အပေါ်ကို ညာသို့ ပြန်။';
  }

  @override
  String get cueTriggerBack =>
      'ဆက်တိုက် ခြောက်ကြိမ်မြောက် trigger က ကုဗကို မူလအတိုင်း အတိအကျ ပြန်ဖြစ်စေသည်။ ခြောက်က မှော်ဂဏန်း!';

  @override
  String cueSliceInner(String face) {
    return '$face မျက်နှာဘေးရှိ အတွင်းအလွှာကိုသာ လှည့်ပါ။ မျက်နှာကိုယ်တိုင် မရွေ့၍ အလယ်များ ကွဲသွားသည်။';
  }

  @override
  String cueSliceWide(String face) {
    return 'ကျယ်လှည့်: $face မျက်နှာနှင့် ဘေးအတွင်းအလွှာ အထူတစ်လွှာကဲ့သို့ အတူလှည့်သည်။';
  }

  @override
  String cueTurnCube(String top, String front) {
    return '$top အလယ် အပေါ်တွင်၊ $front အလယ် သင့်ဘက်မူရန် ကုဗတစ်ခုလုံးကို လှည့်ကိုင်ပါ။';
  }

  @override
  String get cueTurnTop =>
      'နောက် algorithm အတွက် ပြင်ဆင်ရန် မြှားအတိုင်း အပေါ်အလွှာကိုသာ လှည့်ပါ။';

  @override
  String get cueAlignTop =>
      'နောက်ဆုံးလှည့်ကွက်: အရောင်များ တန်းစီရန် အပေါ်အလွှာကို လှည့်ပါ။ ပြီးပြီ!';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece အနားသည် အပေါ်အလွှာတွင် ရှိသည်။ $center အလယ်၏ အပေါ်တည့်တည့် ရောက်သည်အထိ အပေါ်ကို လှည့်ပြီး ထိုမျက်နှာကို နှစ်ကြိမ်လှည့်၍ အောက်ချပါ။';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece အနားသည် အလယ်အလွှာတွင် ညပ်နေသည်။ အပေါ်သို့ တင်၊ $center အလယ်အပေါ် တန်းစီ၊ ပြီးမှ အောက်ချပါ။';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece အနားသည် နေရာမှန်တွင်ရှိသော်လည်း လှန်နေသည်- ၎င်း၏ အဖြူ ဘေးမူနေသည်။ ထုတ်ပြီး အဖြူ အပေါ်မူ၍ အပေါ်တင်ကာ $center အလယ်ဘေးသို့ ချပါ။';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP ပုံစံတွင် အောက်ကိုလည်း လှည့်နိုင်သည်။ $piece အနားကို ချပြီး $center အလယ်နှင့် ကိုက်အောင် အောက်ကို လှည့်ပါ။';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return '$piece ထောင့်သည် $a နှင့် $b ဘက်ကြားရှိ ၎င်းနေရာ၏ အပေါ်တည့်တည့် ရောက်သည်အထိ အပေါ်ကို လှည့်ပါ။ မှန်ကန်စွာ ဝင်သည်အထိ ညာလက် trigger ကို ထပ်လုပ်ပါ။';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece ထောင့်သည် ၎င်း၏နေရာတွင် ရှိသော်လည်း လိမ်နေသည်။ trigger တစ်ကြိမ်က ၎င်းကို ထုတ်ပေးသည် (အဝါထောင့်တစ်ခု အစားဝင်သည်)၊ အဖြူ အောက်မူ၍ ပြန်ဝင်သည်အထိ နေရာတစ်ခုတည်းပေါ်တွင် ဆက်လုပ်ပါ။ ၎င်းနောက်လိုက်ရန် ကုဗကို မလှည့်ပါနှင့်။';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return '$piece အနားသည် $a အလယ်နှင့် တန်းသည်အထိ အပေါ်ကို လှည့်ပြီး $a နှင့် $b ကြားနေရာသို့ ညာဘက်အောက် ပို့ပါ။';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return '$piece အနားသည် $a အလယ်နှင့် တန်းသည်အထိ အပေါ်ကို လှည့်ပြီး $a နှင့် $b ကြားနေရာသို့ ဘယ်ဘက်အောက် ပို့ပါ။';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece အနားသည် ၎င်း၏နေရာတွင် ရှိသော်လည်း လှန်နေသည်။ ထိုနေရာသို့ အဝါအနားတစ်ခု ထည့်၍ ၎င်းကို အပေါ်တွန်းထုတ်ပြီး $a နှင့် $b ကြား ပြန်ထည့်ပါ။';
  }

  @override
  String cueYellowLine(String front) {
    return 'အဝါမျဉ်း: မျဉ်းသည် ဘယ်မှညာ ဖြစ်အောင် အပေါ်ကို လှည့်၊ $front ကို သင့်ဘက်ထားပြီး အဝါကြက်ခြေ algorithm လုပ်ပါ။';
  }

  @override
  String cueYellowL(String front) {
    return 'အဝါ L: L က နောက်-ဘယ်ကို ညွှန်အောင် အပေါ်ကို လှည့်၊ $front ကို သင့်ဘက်ထားပြီး algorithm လုပ်ပါ။ မျဉ်းဖြစ်လာမည်။';
  }

  @override
  String cueYellowDot(String front) {
    return 'အလယ်သာ အဝါဖြစ်သည်- အစက်။ $front ကို သင့်ဘက်မူ၍ ဖော်မြူလာကို တစ်ကြိမ်လုပ်လျှင် L ရမည်။ အစက်သည် သုံးကြိမ်ထိ ကြာနိုင်သဖြင့် ဆက်လုပ်ပါ။';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return '$piece အနားသည် $center အလယ်နှင့် ကိုက်သည်အထိ အပေါ်ကို လှည့်ပါ။';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'ကိုက်ပြီး အနားနှစ်ခု နောက်နှင့် ညာတွင် ရှိသည်။ $front ကို သင့်ဘက်ထား၍ လဲလှယ်ပါ: ရှေ့နှင့် ဘယ်အနား နေရာချင်း လဲသည်။';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'ကိုက်ပြီး အနားများ မျက်နှာချင်းဆိုင်နေသည်။ $front ကို သင့်ဘက်ထား၍ တစ်ကြိမ်လဲပါ; ပြီးလျှင် ကပ်လျက် နှစ်ခု ကိုက်မည်။';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece ထောင့်သည် နေရာမှန်တွင် ရှိပြီ။ ရှေ့-ညာတွင် ထား၊ $front ကို သင့်ဘက်ထားပြီး ကျန်ထောင့်သုံးခုကို လှည့်လဲပါ။';
  }

  @override
  String cueCornersNone(String front) {
    return 'အဝါထောင့် တစ်ခုမှ နေရာမမှန်သေး။ $front ကို သင့်ဘက်ထား၍ တစ်ကြိမ်လှည့်လဲပါ; ပြီးလျှင် ထောင့်တစ်ခု နေရာရမည်။';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'ရှေ့-ညာရှိ $piece ထောင့်ကို လှည့်ပါ- ၎င်း၏ အဝါ အပေါ်မူသည်အထိ အောက် trigger ကို နှစ်ကြိမ်တွဲ ထပ်လုပ်ပါ။ အောက်အလွှာများ ယခု ရှုပ်နေပုံရသော်လည်း နောက်ဆုံးထောင့်တွင် ပြန်ကောင်းမည်!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'ဤတစ်ကြိမ် $piece ထောင့်အတွက် trigger လေးကြိမ်လိုသည်။ ဆက်လုပ်ပါ: အဝါသည် နှစ် သို့ လေးကြိမ်ပြီးလျှင် အမြဲ တက်လာသည်။';
  }

  @override
  String get cueTwistNext =>
      'နောက်လိမ်နေသော ထောင့်ကို ရှေ့-ညာသို့ ယူရန် အပေါ်အလွှာကိုသာ လှည့်ပါ။ ယခု ကုဗတစ်ခုလုံး မလှည့်ပါနှင့်!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'အပေါ်တွင် $piece ထောင့်ကို $edge အနားနှင့် တွဲပြီး ထိုအတွဲကို $a နှင့် $b ကြားနေရာသို့ ထည့်ပါ။';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece ထောင့်သည် မှားသောအနားနှင့် ၎င်းနေရာတွင် ညပ်နေသည်။ အပေါ်သို့ အရင်ထုတ်ပြီး တွဲ၍ ထည့်ပါ။';
  }

  @override
  String cueOllSune(String front) {
    return '$front ကို သင့်ဘက်ထား၍ အဝါထောင့်များ အပေါ်မူစေရန် Sune လုပ်ပါ။';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'ဤတစ်ကြိမ် Sune တစ်ခု မလုံလောက်ပါ။ အပေါ်ကို လှည့်ပြီး $front ကို သင့်ဘက်ထား၍ Sune ထပ်လုပ်ပါ။';
  }

  @override
  String cuePllCorners(String front) {
    return 'ထောင့်နှစ်ခု လဲရမည်။ ကိုက်သောအတွဲ (headlights) ကို ဘယ်တွင်ထား၊ $front ကို သင့်ဘက်ထားပြီး T-perm လုပ်ပါ။';
  }

  @override
  String cuePllEdges(String piece) {
    return 'ထောင့်များ ပြီးပြီ။ $piece အနားကို နောက်တွင်ထားပြီး ကျန်အနားသုံးခုကို U-perm ဖြင့် လှည့်လဲပါ။';
  }

  @override
  String get cuePllNoEdge =>
      'အပေါ်အနား တစ်ခုမှ ၎င်းအလယ်နှင့် မကိုက်သေး။ မည်သည့်ဘက်မှမဆို U-perm တစ်ကြိမ်လုပ်ပါ; ပြီးလျှင် တစ်ခု ကိုက်မည်။';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'အပေါ်ရှိ ကပ်လျက်ထောင့်နှစ်ခု လဲရမည်။ ကိုက်သောအတွဲကို ဘယ်တွင်ထား၊ $front ကို သင့်ဘက်ထားပြီး လဲလှယ်ပါ။';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'လဲရမည့် ထောင့်နှစ်ခုသည် ထောင့်ဖြတ်တွင် ရှိသည်။ $front ကို သင့်ဘက်ထား၍ ထောင့်ဖြတ်လဲလှယ်ပါ။';
  }

  @override
  String cueCenterCycle(String color) {
    return 'လမ်းလွဲနေသော $color အလယ်အပိုင်းကို အလယ် 3-cycle ဖြင့် ပြန်ပို့ပါ: အလွှာ, အပေါ်, အလွှာ, ပြီးမှ အားလုံး ပြန်။';
  }

  @override
  String cueCenterBar(String color) {
    return '$color အလယ်အပိုင်း တစ်တန်းလုံး မှားသောမျက်နှာတွင် ရှိသည်။ အတွင်းအလွှာဖြင့် မ၊ အပေါ်ကို လှည့်ပြီး နေရာသို့ ပြန်ပို့ပါ။';
  }

  @override
  String cueEdgePair(String piece) {
    return '$piece အနား၏ အပိုင်းနှစ်ခုကို တွဲပါ: တန်းစီ၊ အလွှာလှည့်၊ ညာလက်လှည့်ကွက်ဖြင့် မတွဲရသေးသော အနားနှင့် လဲ၊ အလွှာကို ပြန်လှည့်ပါ။';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'နောက်ဆုံးအနားများ: $piece အနားကို နောက်ဆုံးအနားနှစ်ခု algorithm ဖြင့် တွဲပါ; ပြီးပြီးသားအနားများ မပျက်ပါ။';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL parity: အပေါ်အနားတစ်ခု လှန်နေသည်၊ 3×3 တွင် ဘယ်တော့မှ မဖြစ်ပါ။ $front ကို သင့်ဘက်မူ၍ ၎င်းကို ရှေ့တွင်ထားပြီး ပုံမှန် OLL မတိုင်မီ parity ပြင်ဆင်မှုကို လုပ်ပါ။';
  }

  @override
  String get cueParityPll =>
      'PLL parity: အပေါ်အနားနှစ်ခု လဲနေသည်၊ 3×3 တွင် ဘယ်တော့မှ မဖြစ်ပါ။ ၎င်းတို့ကို ရှေ့နှင့်နောက်တွင်ထားပြီး parity လဲလှယ်မှုကို လုပ်ကာ အပေါ်ကို ညှိပါ။';

  @override
  String cueParityFive(String front) {
    return 'အနား parity: အနားတစ်ခု၏ အပြင်အတောင်နှစ်ခု လဲနေသည်၊ 5×5 ၏ တစ်ခုတည်းသော parity ဖြစ်သည်။ $front ကို သင့်ဘက်မူ၍ ထိုအနားကို ရှေ့တွင်ထားပြီး ပြင်ဆင်မှုကို တစ်ကြိမ်လုပ်ပါ။';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'အတွင်းအတောင် parity: အပေါ်အနား၏ အတွင်းအတောင် 2 ခုသာ လှန်နေသည်။ $front ကို သင့်ဘက်မူ၍ ၎င်းကို ရှေ့တွင်ထားပြီး တတိယ အလွှာပါးများကိုသာ လှည့်ပါ။';
  }

  @override
  String get wingRuleAllFour => 'အတောင် 4 ခုလုံး လှန်နေသည်';

  @override
  String get wingRuleAllFourFix => 'အလွှာ 3 ခု OLL parity (3Rw)';

  @override
  String get wingRuleInnerTwo => 'အတွင်းအတောင် 2 ခုသာ လှန်နေသည်';

  @override
  String get wingRuleInnerTwoFix => 'အတွင်းအတောင် parity (3R)';

  @override
  String get onboardingSkip => 'ကျော်ရန်';

  @override
  String get onboardingNext => 'ရှေ့သို့';

  @override
  String get onboardingStart => 'စတင်မည်';

  @override
  String get onboardingWhatTitle => 'သင့်ကုဗ အဖော်';

  @override
  String get onboardingWhatBody =>
      'CubeMentor က 2×2 မှ 6×6 အထိ ကုဗတိုင်းကို အင်တာနက်မလိုဘဲ ဖြေရှင်း၊ လေ့လာ၊ လေ့ကျင့်နိုင်အောင် ကူညီပေးသည်။';

  @override
  String get onboardingScanTitle => 'စက္ကန့်ပိုင်းအတွင်း စကင်ဖတ်ပြီး ဖြေရှင်း';

  @override
  String get onboardingScanBody =>
      'မျက်နှာတစ်ခုစီကို ကင်မရာသို့ ပြပါ (သို့မဟုတ် အရောင်များကို နှိပ်ထည့်ပါ)၊ ပြီးလျှင် 3D ဖြေရှင်းချက်ကို တစ်လှည့်ချင်း လိုက်လုပ်ပါ။';

  @override
  String get onboardingLearnTitle => 'Academy တွင် လေ့လာပါ';

  @override
  String get onboardingLearnBody =>
      'အလွှာလိုက်နည်းကို သင်ခန်းစာတိုများဖြင့် ကျွမ်းကျင်အောင်လေ့လာပါ၊ လှည့်ကွက်တိုင်းကို 3D ကုဗက ပြပေးသည်။';

  @override
  String get onboardingPatternsTitle => 'မိုက်သော ပုံစံများနှင့် 3D Playground';

  @override
  String get onboardingPatternsBody =>
      '2×2 မှ 6×6 အထိ မည်သည့်ကုဗကိုမဆို လှပသော ပုံစံများအဖြစ် ပြောင်းပါ၊ သို့မဟုတ် Playground တွင် စိတ်ကြိုက် လှည့်၊ ရှုပ်ပါ။ လှည့်ရန် ကုဗကို ဆွဲပါ၊ ပြောင်းရန် အရွယ်ကို နှိပ်ပါ။';

  @override
  String get scanChoiceManualDesc =>
      'မျက်နှာတစ်ခုစီ၏ အရောင်များကို စတစ်ကာတစ်ခုချင်း နှိပ်ထည့်ပါ။';

  @override
  String get scanTryAgain => 'ထပ်စမ်းကြည့်ရန်';

  @override
  String get scanEditManually => 'အရောင်များကို လက်ဖြင့် ပြင်ရန်';

  @override
  String get scanLightingHint =>
      'မျက်နှာကို ဇယားကွက်အလယ်တွင် ထားပါ။ တောက်ပပြီး ညီညာသော အလင်းကို သုံးကာ အလင်းပြန်ခြင်းကို ရှောင်ပါ။';

  @override
  String get crownExplain =>
      'အလွှာဆိုသည်မှာ ကုဗ၏ အလျားလိုက်အပိုင်းတစ်ခုဖြစ်သည်- ပထမအလွှာမှာ အောက်ခြေရှိ အဖြူအလွှာ၊ ဒုတိယမှာ အလယ်အလွှာ၊ တတိယမှာ အပေါ်ရှိ အဝါအလွှာ ဖြစ်သည်။';

  @override
  String get lessonObjectiveHeading => 'သင်ယူမှု ရည်မှန်းချက်';

  @override
  String get dirRowTop => 'ရှေ့မျက်နှာ၏ အပေါ်တန်း';

  @override
  String get dirRowBottom => 'ရှေ့မျက်နှာ၏ အောက်တန်း';

  @override
  String get dirColumnRight => 'ရှေ့မျက်နှာ၏ ညာကော်လံ';

  @override
  String get dirColumnLeft => 'ရှေ့မျက်နှာ၏ ဘယ်ကော်လံ';

  @override
  String get solveChoiceTitle => 'ဘယ်လို ဖြေရှင်းချင်ပါသလဲ။';

  @override
  String get solveChoiceFastDesc => 'အတိုဆုံး ဖြေရှင်းချက်၊ တစ်လှည့်ချင်း။';

  @override
  String get solveChoiceGuidedDesc => 'အလွှာလိုက်နည်းကို တစ်ဆင့်ချင်း လေ့လာပါ။';

  @override
  String get guidedSolvedTitle => 'ဖြေရှင်းပြီးပါပြီ!';

  @override
  String get guidedSolvedBody =>
      'အဆင့်တိုင်းကို လိုက်လုပ်ပြီး ကုဗကို ဖြေရှင်းနိုင်ခဲ့သည်။';

  @override
  String get solveAgain => 'ထပ်ဖြေရှင်းရန်';

  @override
  String get backToHome => 'ပင်မစာမျက်နှာသို့';

  @override
  String get dailyStatTime => 'ယနေ့ အချိန်';

  @override
  String get dailyStatBest => 'ကိုယ်ပိုင် စံချိန်';

  @override
  String get dailyStatStreak => 'လက်ရှိ ဆက်တိုက်ရက်';

  @override
  String get dailyStatBestStreak => 'အကောင်းဆုံး ဆက်တိုက်ရက်';

  @override
  String get privacyPolicyTitle => 'ကိုယ်ရေးလုံခြုံမှု မူဝါဒ';

  @override
  String get settingsPrivacyPolicyDesc =>
      'CubeMentor က ဘာသိမ်းသလဲ၊ ကြော်ငြာများက ဘာသုံးသလဲ။';

  @override
  String get privacyIntro =>
      'CubeMentor သည် အကောင့်မလိုဘဲ ကိုယ်ပိုင်ဆာဗာမရှိဘဲ အလုပ်လုပ်သည်။ သင့်စက်ပေါ်တွင် ဘာကျန်ရှိသလဲ၊ ကျွန်ုပ်တို့၏ ကြော်ငြာမိတ်ဖက်က ဘာသုံးသလဲကို ဤစာမျက်နှာတွင် ရှင်းပြထားသည်။';

  @override
  String get privacyDataTitle => 'သင့်ဒေတာ သင့်စက်ပေါ်တွင်သာ ရှိသည်';

  @override
  String get privacyDataBody =>
      'သင့်ဘာသာစကား၊ ဆက်တင်များ၊ သင်ခန်းစာ တိုးတက်မှု၊ ဖြေရှင်းချိန်များနှင့် နေ့စဉ် ဆက်တိုက်ရက်တို့ကို ဤစက်ပေါ်တွင်သာ သိမ်းဆည်းသည်။ ကျွန်ုပ်တို့တွင် ဆာဗာမရှိသဖြင့် ၎င်းတို့ကို ဘယ်တော့မှ မရရှိပါ။ အက်ပ်ကို ဖြုတ်လိုက်လျှင် ၎င်းတို့ ပျက်သွားမည်။';

  @override
  String get privacyCameraTitle => 'ကင်မရာ';

  @override
  String get privacyCameraBody =>
      'ကုဗကို စကင်ဖတ်နေစဉ်သာ ကင်မရာကို သုံးသည်။ စတစ်ကာအရောင်များကို ဖတ်ရန် ပုံရိပ်များကို သင့်စက်ပေါ်တွင် ခွဲခြမ်းစိတ်ဖြာပြီး ဓာတ်ပုံ သို့မဟုတ် ဗီဒီယို တစ်ခုမှ မသိမ်းပါ၊ မပို့ပါ။';

  @override
  String get privacyAdsTitle => 'ကြော်ငြာများ';

  @override
  String get privacyAdsBody =>
      'အက်ပ်သည် Google AdMob ကြော်ငြာများကို ပြသည်။ Google ၏ ကိုယ်ရေးလုံခြုံမှုမူဝါဒတွင် ဖော်ပြထားသည့်အတိုင်း Google သည် ကြော်ငြာများ ပြသရန်နှင့် တိုင်းတာရန် စက်ကိရိယာ အမှတ်အသားများနှင့် ကြော်ငြာ တုံ့ပြန်မှုဒေတာကို သုံးနိုင်သည်။ ဥပဒေအရ လိုအပ်သည့်နေရာများတွင် သင့်ခွင့်ပြုချက်ကို ဦးစွာ တောင်းမည်ဖြစ်ပြီး ဆက်တင်များတွင် ပြောင်းနိုင်သည်။';

  @override
  String get privacyContactTitle => 'ဆက်သွယ်ရန်';

  @override
  String privacyContactBody(String email) {
    return 'ကိုယ်ရေးလုံခြုံမှုနှင့် ပတ်သက်၍ မေးစရာရှိပါသလား။ $email သို့ စာရေးပါ။';
  }
}
