// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline => 'סרקו, פתרו ושלטו בכל קובייה מ־2×2 ועד 6×6.';

  @override
  String get chooseCubeSize => 'בחרו את הקובייה שלכם';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'מתחילים';

  @override
  String get cubeLevel3 => 'קלאסי';

  @override
  String get cubeLevel4 => 'מתקדמים';

  @override
  String get cubeLevel5 => 'מומחים';

  @override
  String get cubeLevel6 => 'אלופים';

  @override
  String get cubeComingSoon => 'קובייה חדשה בקרוב';

  @override
  String get carouselPrevious => 'הקובייה הקודמת';

  @override
  String get carouselNext => 'הקובייה הבאה';

  @override
  String get chooseMode => 'מה תרצו לעשות?';

  @override
  String get modePlayground => 'מגרש תלת־ממד';

  @override
  String get modePlaygroundDesc => 'סובבו שכבות, ערבבו והריצו מהלכים בתלת־ממד.';

  @override
  String get modeScanSolve => 'סריקה ופתרון';

  @override
  String get modeScanSolveDesc => 'סרקו את הקובייה במצלמה וקבלו פתרון.';

  @override
  String get modeAcademy => 'אקדמיה';

  @override
  String get modeAcademyDesc => 'למדו צעד אחר צעד בשיעורים אינטראקטיביים.';

  @override
  String get language => 'שפה';

  @override
  String get languageSearch => 'חיפוש שפה';

  @override
  String get languageNoResults => 'אין שפה שמתאימה לחיפוש.';

  @override
  String playgroundTitle(int size) {
    return 'מגרש $size×$size';
  }

  @override
  String get scramble => 'ערבוב';

  @override
  String get reset => 'איפוס';

  @override
  String get undo => 'ביטול';

  @override
  String get speed => 'מהירות';

  @override
  String get xray => 'רנטגן';

  @override
  String get prime => 'הפוך';

  @override
  String get wide => 'רחב';

  @override
  String layer(int index) {
    return 'שכבה $index';
  }

  @override
  String get cubeRotations => 'סיבובי קובייה';

  @override
  String get play => 'נגן';

  @override
  String get pause => 'השהה';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מהלכים',
      one: 'מהלך אחד',
      zero: 'אין מהלכים',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'פתורה';

  @override
  String get scrambled => 'מעורבבת';

  @override
  String get orbitHint =>
      'גררו שורה כדי לסובב אותה · גררו את הרקע כדי לסובב את הקובייה';

  @override
  String get notationPad => 'לוח סימונים';

  @override
  String get solve => 'פתרון';

  @override
  String get solving => 'פותר…';

  @override
  String get solveFast => 'פתרון מהיר';

  @override
  String get solveLearn => 'ללמוד צעד אחר צעד';

  @override
  String get solveModeGuided => 'מודרך (3 כתרים)';

  @override
  String get solveModeFast => 'מהיר (אופטימלי)';

  @override
  String solveUnavailable(int size) {
    return 'הפותר ל־$size×$size יגיע בעדכון הבא.';
  }

  @override
  String get solveAlreadySolved => 'הקובייה כבר פתורה.';

  @override
  String solveFailed(String reason) {
    return 'אי אפשר לפתור את הקובייה הזו ($reason).';
  }

  @override
  String get solveEngineMissing => 'מנוע הפתרון אינו זמין במכשיר הזה.';

  @override
  String get solveComplete => 'נפתרה! כל הכבוד.';

  @override
  String solveSummary(int count) {
    return '$count מהלכים';
  }

  @override
  String get nextMove => 'המהלך הבא';

  @override
  String get previousMove => 'המהלך הקודם';

  @override
  String get halfTurnHalfway =>
      'יפה, הגעתם לחצי! סובבו אותה פעם נוספת לאותו כיוון לסיבוב כפול (180°).';

  @override
  String get wideTurnInner =>
      'מצוין! עכשיו החליקו את השכבה הפנימית הסמוכה כדי להשלים את הסיבוב הרחב.';

  @override
  String get wideTurnOuter =>
      'מצוין! עכשיו החליקו את השכבה החיצונית שלידה כדי להשלים את הסיבוב הרחב.';

  @override
  String get wideTurnMore =>
      'מצוין! המשיכו להחליק את השכבות הזוהרות אחת אחת כדי להשלים את הסיבוב הרחב.';

  @override
  String get guideSwipeHint =>
      'החליקו את השכבה הזוהרת בכיוון החץ, או הקישו על הבא.';

  @override
  String get guideRotateHint =>
      'סובבו את כל הקובייה כפי שהחץ מראה: הקישו על הבא.';

  @override
  String get guideWrongMove => 'עקבו אחרי החץ המודגש';

  @override
  String get guideExit => 'יציאה מההדרכה';

  @override
  String get colorWhite => 'לבן';

  @override
  String get colorYellow => 'צהוב';

  @override
  String get colorGreen => 'ירוק';

  @override
  String get colorBlue => 'כחול';

  @override
  String get colorRed => 'אדום';

  @override
  String get colorOrange => 'כתום';

  @override
  String get phaseOptimal2x2 => 'הפתרון הקצר ביותר';

  @override
  String get phaseKociemba1 => 'שלב 1 · כיוון החלקים';

  @override
  String get phaseKociemba2 => 'שלב 2 · סיום הקובייה';

  @override
  String get phaseLblCross => 'איקס לבן מותאם למרכזים';

  @override
  String get phaseLblCorners => 'פינות הכתר הראשון';

  @override
  String get phaseLblMiddle => 'השלמת השכבה האמצעית';

  @override
  String get phaseLblYellowCross => 'איקס צהוב';

  @override
  String get phaseLblYellowEdges => 'התאמת מרכזי האיקס הצהוב';

  @override
  String get phaseLblYellowCorners => 'מיקום הפינות למקומן';

  @override
  String get phaseLblYellowCornersOrient => 'סיבוב הפינות לצבעים הנכונים';

  @override
  String get crownFirst => 'הכתר הראשון';

  @override
  String get crownSecond => 'הכתר השני';

  @override
  String get crownThird => 'הכתר השלישי';

  @override
  String get crownFirstGoal => 'הפאה הלבנה והשכבה הראשונה';

  @override
  String get crownSecondGoal => 'השכבה האמצעית';

  @override
  String get crownThirdGoal => 'הפאה הצהובה והשכבה האחרונה';

  @override
  String get subStepGoal11 =>
      'בונים איקס לבן שבו כל צלע לבנה מתאימה גם לצבע המרכז שלידה.';

  @override
  String get subStepGoal12 =>
      'מכניסים את 4 הפינות הלבנות למקומן המתאים כדי להשלים את הפאה הלבנה ואת כל הטבעת הראשונה.';

  @override
  String get subStepGoal21 =>
      'מכניסים את 4 צלעות השכבה האמצעית בלי לפרק את הכתר הראשון.';

  @override
  String get subStepGoal31 => 'בונים איקס צהוב בשכבה האחרונה.';

  @override
  String get subStepGoal32 =>
      'מחליפים את צלעות האיקס הצהוב עד שכל אחת מתאימה למרכז הצד שלה.';

  @override
  String get subStepGoal33 =>
      'מעבירים את 4 הפינות הצהובות למקום הנכון שלהן, גם אם הן עדיין מסובבות.';

  @override
  String get subStepGoal34 =>
      'מסובבים כל פינה צהובה במקומה עד שכל המדבקות מתאימות והקובייה פתורה.';

  @override
  String get explainOptimal2x2 =>
      'הפתרון הקצר ביותר האפשרי, שנמצא בחיפוש בכל מצבי ה־2×2.';

  @override
  String get explainKociemba1 =>
      'מכוונים את כל החלקים ואוספים את צלעות השכבה האמצעית אל השכבה האמצעית.';

  @override
  String get explainKociemba2 =>
      'מסיימים רק עם ⁦U⁩, ⁦D⁩ וחצאי סיבובים, ששומרים על הכיוון.';

  @override
  String get explainLblOrient =>
      'סובבו את כל הקובייה כך שהמרכז הלבן יפנה למטה.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'הורידו את הצלע $piece אל ליד המרכז הלבן, כשהצבע בצד תואם למרכז.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'הפינה $piece תקועה במקום הלא נכון. העלו אותה למעלה עם ⁦R U R\' U\'⁩.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'סובבו את השכבה העליונה עד שהפינה $piece תהיה מעל המקום שלה.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'חזרו על ⁦R U R\' U\'⁩ עד שהפינה $piece תיכנס למקומה.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'הצלע $piece בשכבה האמצעית אבל לא במקום. הוציאו אותה למעלה.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'סובבו את השכבה העליונה כך שצבע הצד של הצלע $piece יתאים למרכז.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'הכניסו את הצלע $piece ימינה: ⁦U R U\' R\' U\' F\' U F⁩.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'הכניסו את הצלע $piece שמאלה: ⁦U\' L\' U L U F U\' F\'⁩.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'סובבו את השכבה העליונה כדי למקם את הצורה הצהובה לאלגוריתם הבא.';

  @override
  String get explainLblYellowCrossAlg =>
      'בנו את האיקס הצהוב עם ⁦F R U R\' U\' F\'⁩.';

  @override
  String get explainLblYellowEdgesAlign =>
      'סובבו את השכבה העליונה כדי ליישר את הצלעות הצהובות מול המרכזים.';

  @override
  String get explainLblYellowEdgesAlg =>
      'החליפו צלעות צהובות עם ⁦R U R\' U R U2 R\' U⁩.';

  @override
  String get explainLblYellowCornersAlg =>
      'העבירו את הפינות הצהובות למקומן עם ⁦U R U\' L\' U R\' U\' L⁩.';

  @override
  String get explainLblNextCorner =>
      'סובבו את השכבה העליונה כדי להביא את הפינה הצהובה הבאה לימין־קדימה.';

  @override
  String get explainLblCornerTwist =>
      'חזרו על ⁦R\' D\' R D⁩ עד שהצהוב יפנה למעלה. התחתית תסתדר בסוף.';

  @override
  String get explainLblFinalAlign =>
      'סובבו את השכבה העליונה כדי לסיים את הקובייה.';

  @override
  String scanTitle(int size) {
    return 'סריקת $size×$size';
  }

  @override
  String get scanManualInput => 'הזנת צבעים ידנית';

  @override
  String get scanUseCamera => 'סריקה במצלמה';

  @override
  String scanFaceProgress(int current, int total) {
    return 'פאה $current מתוך $total';
  }

  @override
  String get faceUp => 'פאה עליונה';

  @override
  String get faceRight => 'פאה ימנית';

  @override
  String get faceFront => 'פאה קדמית';

  @override
  String get faceDown => 'פאה תחתונה';

  @override
  String get faceLeft => 'פאה שמאלית';

  @override
  String get faceBack => 'פאה אחורית';

  @override
  String get scanHintFront =>
      'החזיקו את הקובייה כשפאה כלשהי פונה אליכם. זו הפאה הקדמית: שמרו על אותה פאה למעלה לאורך הסריקה.';

  @override
  String get scanHintRight =>
      'מהמצב הקדמי, סובבו את כל הקובייה שמאלה פעם אחת כך שהפאה הימנית תפנה אליכם.';

  @override
  String get scanHintBack => 'מהמצב הקדמי, סובבו את כל הקובייה שמאלה פעמיים.';

  @override
  String get scanHintLeft => 'מהמצב הקדמי, סובבו את כל הקובייה ימינה פעם אחת.';

  @override
  String get scanHintUp =>
      'מהמצב הקדמי, הטו את החלק העליון אליכם כך שיפנה למצלמה.';

  @override
  String get scanHintDown =>
      'מהמצב הקדמי, הטו את החלק התחתון אליכם כך שיפנה למצלמה.';

  @override
  String get scanAlignHint => 'מלאו את הרשת בפאה ולחצו על כפתור הצילום.';

  @override
  String get scanCapture => 'צילום הפאה';

  @override
  String get scanTurnLeft => 'סובבו את כל הקובייה שמאלה';

  @override
  String get scanTurnRight => 'סובבו את כל הקובייה ימינה';

  @override
  String get scanTipTop => 'הטו את הפאה העליונה אליכם';

  @override
  String get scanTipBottom => 'הטו את הפאה התחתונה אליכם';

  @override
  String get scanGlareTip =>
      'זוהה בוהק: הטו מעט את הקובייה, או החזיקו את הטלפון מעליה כדי לחסום את האור מלמעלה.';

  @override
  String get scanDimTip => 'חשוך מדי: עברו למקום מואר יותר או הדליקו את הפנס.';

  @override
  String get scanTorch => 'פנס';

  @override
  String get scanGuideLabel =>
      'מדריך סריקה: פאות שנסרקו מוצגות בצבע. הקישו על פאה שנסרקה כדי לסרוק אותה שוב.';

  @override
  String get scanTapToRescan => 'הקישו על פאה שנסרקה כדי לסרוק אותה שוב.';

  @override
  String get scanCameraMissing => 'לא נמצאה מצלמה במכשיר.';

  @override
  String get scanCameraDenied =>
      'הגישה למצלמה נדחתה. אפשר עדיין להזין את הצבעים ידנית.';

  @override
  String get scanCameraFailed => 'לא ניתן להפעיל את המצלמה.';

  @override
  String get scanAllGood => 'כל המדבקות נראות תקינות.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מדבקות נראות שגויות',
      one: 'מדבקה אחת נראית שגויה',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'משהו לא מסתדר';

  @override
  String scanIssueColors(int count) {
    return 'כל צבע צריך להופיע בדיוק $count פעמים.';
  }

  @override
  String get scanIssueCenters => 'לשני מרכזים יש אותו צבע.';

  @override
  String get scanIssuePieces =>
      'המדבקות האלה יוצרות חלקים שלא קיימים בקובייה אמיתית.';

  @override
  String get scanIssueTwist => 'פינה אחת מסובבת. בדקו את מדבקות הפינות.';

  @override
  String get scanIssueFlip => 'שפה אחת הפוכה. בדקו את מדבקות השפות.';

  @override
  String get scanIssueParity => 'נראה ששני חלקים הוחלפו.';

  @override
  String get scanIssueUnavailable => 'בדיקת הצבעים אינה זמינה במכשיר הזה.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מדבקות היו קשות לזיהוי: כדאי להציץ בהן.',
      one: 'מדבקה אחת הייתה קשה לזיהוי: כדאי להציץ בה.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint => 'הקישו על מדבקה כדי לשנות צבע · לחיצה ארוכה לפלטה';

  @override
  String get scanRescanFace => 'סריקה חוזרת של פאה';

  @override
  String get scanCancelRescan => 'חזרה לצבעים';

  @override
  String get scanPaletteTitle => 'בחרו צבע';

  @override
  String get scanOpen3d => 'פתיחה בתלת־ממד';

  @override
  String get scanRestart => 'התחלה מחדש';

  @override
  String get modeTimer => 'טיימר מהירות';

  @override
  String get modeTimerDesc => 'ערבובים, זמן בחינה, ממוצעים ושיאים אישיים.';

  @override
  String get modeDaily => 'האתגר היומי';

  @override
  String get modeDailyDesc => 'ערבוב חדש בכל יום. שמרו על הרצף.';

  @override
  String get modePatterns => 'ספריית דוגמאות';

  @override
  String get modePatternsDesc => 'לוח שחמט, סופרפליפ ועוד – בתלת־ממד.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'רצף של $count ימים',
      one: 'רצף של יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'המשיכו ללמוד';

  @override
  String get startLearning => 'התחילו ללמוד';

  @override
  String lessonOf(int index, int total) {
    return 'שיעור $index מתוך $total';
  }

  @override
  String get academyAllDone => 'השלמתם את כל השיעורים!';

  @override
  String get academyTitle => 'אקדמיה';

  @override
  String academyProgress(int done, int total) {
    return '$done מתוך $total שיעורים הושלמו';
  }

  @override
  String get lessonAdvanced => 'מתקדם';

  @override
  String lessonPartOf(int index, int total) {
    return 'חלק $index מתוך $total';
  }

  @override
  String get lessonNext => 'הבא';

  @override
  String get lessonPrevious => 'הקודם';

  @override
  String get lessonFinish => 'סיום השיעור';

  @override
  String get lessonComplete => 'השיעור הושלם!';

  @override
  String get lessonNextLesson => 'לשיעור הבא';

  @override
  String get lessonBackToAcademy => 'חזרה לאקדמיה';

  @override
  String get lessonTryIt =>
      'תורכם: החליקו את השכבה שהחץ מראה, או הקישו על \"הבא\".';

  @override
  String get lessonLookAround =>
      'גררו את הרקע כדי להסתכל על הקובייה מכל הצדדים.';

  @override
  String get lessonDemoDone => 'יפה! הקישו \"הבא\" כדי להמשיך.';

  @override
  String holdPrompt(String top, String front) {
    return 'החזיקו את הקובייה כשהמרכז ה$top למעלה והמרכז ה$front מולכם.';
  }

  @override
  String get trackBeginner => 'מתחילים 3×3: שלושת הכתרים';

  @override
  String get trackCfop => 'מבוא ל־CFOP';

  @override
  String get trackTwoByTwo => '2×2 למתחילים ואורטגה';

  @override
  String get trackBigCubes => 'קוביות גדולות: רדוקציה ופריטי';

  @override
  String moveSentence(String layer, String direction) {
    return 'סובבו את $layer $direction';
  }

  @override
  String get moveFaceR => 'הפאה הימנית';

  @override
  String get moveFaceL => 'הפאה השמאלית';

  @override
  String get moveFaceU => 'הפאה העליונה';

  @override
  String get moveFaceD => 'הפאה התחתונה';

  @override
  String get moveFaceF => 'הפאה הקדמית';

  @override
  String get moveFaceB => 'הפאה האחורית';

  @override
  String moveLayerInner(int depth, String face) {
    return 'השכבה ה־$depth מ$face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth שכבות לעומק)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'שכבות $near–$far מ$face';
  }

  @override
  String get moveLayerMiddle => 'השכבה האמצעית';

  @override
  String get moveDirUp => 'למעלה';

  @override
  String get moveDirDown => 'למטה';

  @override
  String get moveDirLeft => 'שמאלה';

  @override
  String get moveDirRight => 'ימינה';

  @override
  String get moveDirClockwise => 'עם כיוון השעון';

  @override
  String get moveDirCounter => 'נגד כיוון השעון';

  @override
  String get moveDirBackClockwise => 'עם כיוון השעון, במבט מאחור';

  @override
  String get moveDirBackCounter => 'נגד כיוון השעון, במבט מאחור';

  @override
  String get moveDirHalf => 'חצי סיבוב (פעמיים)';

  @override
  String get moveRotateX => 'הטו את כל הקובייה: הפאה הקדמית עולה למעלה';

  @override
  String get moveRotateXPrime => 'הטו את כל הקובייה: הפאה הקדמית יורדת למטה';

  @override
  String get moveRotateX2 => 'הפכו את כל הקובייה: הפאה הקדמית עוברת לאחור';

  @override
  String get moveRotateY => 'סובבו את כל הקובייה: הפאה הקדמית זזה שמאלה';

  @override
  String get moveRotateYPrime => 'סובבו את כל הקובייה: הפאה הקדמית זזה ימינה';

  @override
  String get moveRotateY2 =>
      'סובבו את כל הקובייה חצי סיבוב: הפאה האחורית מגיעה קדימה';

  @override
  String get moveRotateZ =>
      'גלגלו את כל הקובייה עם כיוון השעון: הפאה העליונה עוברת ימינה';

  @override
  String get moveRotateZPrime =>
      'גלגלו את כל הקובייה נגד כיוון השעון: הפאה העליונה עוברת שמאלה';

  @override
  String get moveRotateZ2 => 'גלגלו את כל הקובייה: הפאה העליונה עוברת למטה';

  @override
  String get phaseReductionCenters => 'מרכזים';

  @override
  String get phaseReductionEdges => 'הצמדת צלעות';

  @override
  String get phaseReductionEdgeParity => 'פריטי צלעות';

  @override
  String get phaseReductionOllParity => 'פריטי OLL';

  @override
  String get phaseReductionPllParity => 'פריטי PLL';

  @override
  String get explainReductionCenterBlock =>
      'סיבובי פרוסה שמחזירים כמה חלקי מרכז למקומם בבת אחת.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'מביאים חלק מרכז $piece לפאה שלו במחזור של שלושה, בלי לפגוע במרכזים גמורים.';
  }

  @override
  String get explainReductionParityCenters =>
      'בונים מחדש את המרכזים שסיבוב הפרוסה הזיז.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'מצמידים את חלקי הצלע $piece במחזור של שלושה; המרכזים נשארים פתורים.';
  }

  @override
  String get explainReductionEdgeParity =>
      'את הצלעות האחרונות אי אפשר להצמיד רק במחזורים של שלושה (פריטי צלעות). סיבוב אחד של פרוסה פנימית פותר את זה.';

  @override
  String get explainReductionOllParity =>
      'פריטי OLL: צלע אחת הפוכה – דבר שלא קורה ב־3×3. האלגוריתם הזה הופך אותה בחזרה.';

  @override
  String get explainReductionPllParity =>
      'פריטי PLL: שתי צלעות מוחלפות – דבר בלתי אפשרי ב־3×3. האלגוריתם הזה מחליף אותן בחזרה.';

  @override
  String get patternsTitle => 'ספריית דוגמאות';

  @override
  String get patternsHint =>
      'הקישו על דוגמה כדי לצפות בה, ואז בצעו אותה על הקובייה שלכם.';

  @override
  String get patternCheckerboard => 'לוח שחמט';

  @override
  String get patternCubeInCube => 'קובייה בתוך קובייה';

  @override
  String get patternSuperflip => 'סופרפליפ';

  @override
  String get patternDots => 'נקודות';

  @override
  String get patternCross => 'פלוס';

  @override
  String get patternPython => 'פיתון';

  @override
  String get phasePattern => 'יוצרים את הדוגמה';

  @override
  String get explainPatternStep =>
      'בצעו כל מהלך על הקובייה שלכם. הקישו על \"פתרון\" כדי להחזיר אותה למצב רגיל.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'טיימר מהירות';

  @override
  String get timerHoldToStart => 'החזיקו ושחררו כדי להתחיל';

  @override
  String get timerReleaseToStart => 'שחררו כדי להתחיל';

  @override
  String get timerTapToStop => 'הקישו בכל מקום כדי לעצור';

  @override
  String get timerInspectionToggle => '15 שניות בחינה';

  @override
  String get timerLoadingScramble => 'יוצר ערבוב…';

  @override
  String get timerPb => 'שיא';

  @override
  String get timerSolves => 'פתרונות';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'מחיקה';

  @override
  String get timerHistory => 'היסטוריה';

  @override
  String get timerNoSolves => 'עוד אין פתרונות. ערבבו את הקובייה ויאללה!';

  @override
  String get timerNewPb => 'שיא אישי חדש!';

  @override
  String get timerClearHistory => 'ניקוי ההיסטוריה';

  @override
  String get timerScrambleHint =>
      'החזיקו את הלבן למעלה ואת הירוק מלפנים, ואז ערבבו:';

  @override
  String get dailyTitle => 'האתגר היומי';

  @override
  String dailyFor(String date) {
    return 'האתגר של $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'הרצף הארוך ביותר: $count';
  }

  @override
  String get dailyDone => 'סיימתם להיום! חזרו מחר.';

  @override
  String get dailyNotDone => 'פתרו את הערבוב של היום כדי לשמור על הרצף.';

  @override
  String get dailySolveVirtual => 'פתרו בקובייה התלת־ממדית';

  @override
  String get dailyTimeIt => 'מדדו זמן עם הקובייה שלכם';

  @override
  String get dailyHint => 'רמז';

  @override
  String dailyHintText(String moves) {
    return 'התחילו מהאיקס הלבן: $moves';
  }

  @override
  String get dailyHintFailed => 'אין רמז זמין כרגע.';

  @override
  String get lessonBasics => 'הכירו את הקובייה';

  @override
  String get lessonBasicsDesc => 'חלקים, פאות ושמות המהלכים.';

  @override
  String get stepBasicsPieces => 'שלושה סוגי חלקים';

  @override
  String get stepBasicsPiecesBody =>
      'המרכזים אף פעם לא זזים, והם קובעים את צבע הפאה. לצלעות יש שני צבעים ולפינות שלושה. לפתור פירושו להביא כל צלע וכל פינה אל המרכזים התואמים.';

  @override
  String get stepBasicsFaces => 'שש אותיות לפאות';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F ו־B הן הפאות הימנית, השמאלית, העליונה, התחתונה, הקדמית והאחורית. אות לבדה היא רבע סיבוב עם כיוון השעון, כאילו מסתכלים ישר על הפאה.';

  @override
  String get stepBasicsPrime => 'מהלכים הפוכים וכפולים';

  @override
  String get stepBasicsPrimeBody =>
      'גרש (⁦R\'⁩) מסובב לכיוון השני, נגד כיוון השעון. הספרה 2 (⁦U2⁩) היא חצי סיבוב: שני רבעי סיבוב.';

  @override
  String get stepCrossGoal => 'המטרה';

  @override
  String get stepCrossGoalBody =>
      'החזיקו את הצהוב למעלה. ארבע הצלעות הלבנות מקיפות את המרכז הלבן בתחתית, וצבע הצד של כל אחת תואם למרכז שלידה.';

  @override
  String get stepCrossTop => 'צלע למעלה';

  @override
  String get stepCrossTopBody =>
      'מצאו צלע לבנה למעלה. סובבו את הפאה העליונה עד שצבע הצד שלה מעל המרכז התואם, ואז סובבו את הפאה הזו פעמיים כדי להוריד אותה למקום.';

  @override
  String get stepCrossMiddle => 'צלע בשכבה האמצעית';

  @override
  String get stepCrossMiddleBody =>
      'צלע שתקועה בשכבה האמצעית עולה קודם למעלה: מסובבים את הצד שלה למעלה, מזיזים את הפאה העליונה ומחזירים את הצד, כדי לא לפרק את האיקס. אחר כך ממקמים אותה מלמעלה.';

  @override
  String get stepCornersInsert => 'מעל המקום שלה';

  @override
  String get stepCornersInsertBody =>
      'סובבו את הפאה העליונה עד שפינה לבנה נמצאת מעל המקום של הצבעים שלה, בקדמי־ימני. ⁦R U R\' U\'⁩ מוריד אותה פנימה.';

  @override
  String get stepCornersRepeat => 'חוזרים על הטריגר';

  @override
  String get stepCornersRepeatBody =>
      'אם הלבן פונה לכיוון הלא נכון, חזרו על ⁦R U R\' U\'⁩ מעל אותו מקום. כל פינה מסתדרת אחרי חמש חזרות לכל היותר.';

  @override
  String get stepMiddleRight => 'צלע ימינה';

  @override
  String get stepMiddleRightBody =>
      'יישרו צלע עליונה עם המרכז שלה בחזית. אם הצבע העליון שלה תואם למרכז הימני, הכניסו אותה עם ⁦U R U\' R\' U\' F\' U F⁩.';

  @override
  String get stepMiddleLeft => 'צלע שמאלה';

  @override
  String get stepMiddleLeftBody =>
      'אם הצבע העליון תואם דווקא למרכז השמאלי, השתמשו בתמונת המראה: ⁦U\' L\' U L U F U\' F\'⁩.';

  @override
  String get stepYellowCross => 'אלגוריתם אחד';

  @override
  String get stepYellowCrossBody =>
      '⁦F R U R\' U\' F\'⁩ הופך נקודה צהובה ל־L, את ה־L לקו ואת הקו לאיקס. החזיקו את ה־L מאחור משמאל ואת הקו לרוחב.';

  @override
  String get stepYellowEdges => 'מתאימים את הצלעות';

  @override
  String get stepYellowEdgesBody =>
      'סובבו את הפאה העליונה עד ששתי צלעות תואמות למרכזים. כשאחת מאחור ואחת מימין, ⁦R U R\' U R U2 R\' U⁩ מחליף בין השתיים האחרות.';

  @override
  String get stepPlaceCorners => 'ממקמים';

  @override
  String get stepPlaceCornersBody =>
      'החזיקו פינה שכבר במקומה בקדמי־ימני. ⁦U R U\' L\' U R\' U\' L⁩ מסובב את שלוש האחרות; חזרו עד שכל הארבע במקום.';

  @override
  String get stepTwistCorners => 'מסובבים';

  @override
  String get stepTwistCornersBody =>
      'כשפינה לא פתורה בקדמי־ימני, חזרו על ⁦R\' D\' R D⁩ עד שהצהוב למעלה, ואז סובבו רק את הפאה העליונה כדי להביא את הבאה. התחתית נראית הרוסה עד הסוף – המשיכו.';

  @override
  String get lessonCfopIntro => 'מה זה CFOP?';

  @override
  String get lessonCfopIntroDesc => 'פלוס, F2L,‏ OLL,‏ PLL.';

  @override
  String get stepCfopOverview => 'ארבעה שלבים';

  @override
  String get stepCfopOverviewBody =>
      'קוביסטים מהירים פותרים פלוס, מצמידים כל פינה של השכבה הראשונה לצלע האמצע שלה (F2L), מכוונים את השכבה האחרונה (OLL) ולבסוף מסדרים אותה (PLL).';

  @override
  String get stepCfopCross => 'מתכננים את הפלוס';

  @override
  String get stepCfopCrossBody =>
      'ב־CFOP מתכננים את הפלוס בזמן הבחינה ובונים אותו בתחתית בכשמונה מהלכים.';

  @override
  String get lessonF2l => 'יסודות F2L';

  @override
  String get lessonF2lDesc => 'מצמידים פינה לצלע שלה.';

  @override
  String get stepF2lRight => 'מכניסים זוג';

  @override
  String get stepF2lRightBody =>
      'כשפינה והצלע שלה צמודות למעלה, הביאו אותן מעל החריץ שלהן והכניסו יחד.';

  @override
  String get stepF2lLeft => 'זוג לשמאל';

  @override
  String get stepF2lLeftBody =>
      'אותו מקרה בצד השני הוא תמונת המראה, ⁦U\' L\' U L⁩. סיבוב הקובייה (⁦y⁩) מאפשר להשתמש ביד הנוחה.';

  @override
  String get lessonOll => 'OLL בשני מבטים';

  @override
  String get lessonOllDesc => 'צובעים את הפאה העליונה בצהוב.';

  @override
  String get stepOllCross => 'קודם הצלעות';

  @override
  String get stepOllCrossBody =>
      'OLL בשני מבטים מתחיל באלגוריתם של האיקס הצהוב שכבר מכירים.';

  @override
  String get stepOllSune => 'סון (Sune)';

  @override
  String get stepOllSuneBody =>
      'כשפינה צהובה אחת פונה למעלה בקדמי־שמאלי, סון (⁦R U R\' U R U2 R\'⁩) מכוון את שלוש האחרות. רוב שאר המקרים נפתרים בסון ובתמונת המראה שלו.';

  @override
  String get lessonPll => 'PLL בשני מבטים';

  @override
  String get lessonPllDesc => 'מסיימים את הקובייה.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'ה־T-perm מחליף שתי פינות ושתי צלעות. משתמשים בו כדי למקם פינות: החזיקו את שתי הפינות שצריך להחליף בצד ימין.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'כשהפינות מסודרות, ה־U-perm מסובב שלוש צלעות. השאירו את הצד הגמור מאחור.';

  @override
  String get lessonTwoFirst => 'השכבה הראשונה ב־2×2';

  @override
  String get lessonTwoFirstDesc => 'בונים צד אחד עם פינות תואמות.';

  @override
  String get stepTwoIntro => 'רק פינות';

  @override
  String get stepTwoIntroBody =>
      'קובייה 2×2 היא 3×3 בלי צלעות ומרכזים. בחרו צבע, בנו את הפאה בתחתית, ודאגו שצבעי הצד של פינות סמוכות יתאימו.';

  @override
  String get stepTwoCorner => 'מכניסים פינות';

  @override
  String get stepTwoCornerBody =>
      'בדיוק כמו הפינות הלבנות ב־3×3: הביאו פינה מעל המקום שלה והשתמשו ב־⁦R U R\' U\'⁩ עד שהיא נכנסת.';

  @override
  String get lessonTwoOll => 'מכוונים את הפאה העליונה';

  @override
  String get lessonTwoOllDesc => 'OLL של אורטגה עם סון.';

  @override
  String get stepTwoSune => 'שוב סון';

  @override
  String get stepTwoSuneBody =>
      'סון צובע את הפאה העליונה בצהוב גם ב־2×2. בשיטת אורטגה לומדים שבעה מקרים קצרים; סון ותמונת המראה שלו מכסים את רובם.';

  @override
  String get lessonTwoPbl => 'מסדרים את שתי השכבות';

  @override
  String get lessonTwoPblDesc => 'מחליפים פינות כדי לסיים.';

  @override
  String get stepTwoAdjacent => 'החלפה סמוכה';

  @override
  String get stepTwoAdjacentBody =>
      'כששתי פינות עליונות סמוכות צריכות להתחלף, החזיקו אותן בצד ימין והשתמשו ב־T-perm.';

  @override
  String get stepTwoDiagonal => 'החלפה אלכסונית';

  @override
  String get stepTwoDiagonalBody =>
      'שתי פינות במקומות מנוגדים מתחלפות עם ה־Y-perm.';

  @override
  String get lessonBigIntro => 'החלקים בקובייה גדולה';

  @override
  String get lessonBigIntroDesc => 'מרכזים, כנפיים ופרוסות.';

  @override
  String get stepBigPieces => 'אין מרכזים קבועים';

  @override
  String get stepBigPiecesBody =>
      'בקובייה 4×4 בכל פאה יש ארבעה חלקי מרכז שזזים, וכל צלע בנויה משתי כנפיים. ברדוקציה מקבצים אותם כך שהקובייה מתנהגת כמו 3×3.';

  @override
  String get stepBigSlices => 'סיבובים רחבים ופנימיים';

  @override
  String get stepBigSlicesBody =>
      '⁦Rw⁩ מסובב יחד את שתי השכבות הימניות. ⁦2R⁩ מסובב רק את השכבה השנייה מימין. הסיבובים האלה מזיזים מרכזים וכנפיים.';

  @override
  String get lessonBigCenters => 'מרכזים';

  @override
  String get lessonBigCentersDesc => 'מקבצים את חלקי המרכז.';

  @override
  String get stepBigCenterCycle => 'מחזור של שלושה מרכזים';

  @override
  String get stepBigCenterCycleBody =>
      'הקומוטטור הזה מזיז בדיוק שלושה חלקי מרכז ולא נוגע בשום דבר אחר, כך שמרכזים גמורים נשארים גמורים.';

  @override
  String get lessonBigEdges => 'מצמידים צלעות';

  @override
  String get lessonBigEdgesDesc => 'מחברים כנפיים לצלעות שלמות.';

  @override
  String get stepBigEdgePair => 'מצמידים ומחזירים';

  @override
  String get stepBigEdgePairBody =>
      '⁦Uw\'⁩ מיישר שתי כנפיים תואמות, ⁦R U R\' F R\' F\' R⁩ מכניס צלע שעוד לא הוצמדה, ו־⁦Uw⁩ מחזיר את המרכזים.';

  @override
  String get lessonBigParity => 'פריטי';

  @override
  String get lessonBigParityDesc => 'פריטי OLL ו־PLL בקוביות זוגיות.';

  @override
  String get stepBigOllParity => 'פריטי OLL';

  @override
  String get stepBigOllParityBody =>
      'צלע הפוכה יחידה לא יכולה לקרות ב־3×3. בקוביות זוגיות האלגוריתם הזה הופך בחזרה את הצלע העליונה־קדמית. הוא עלול לערבב את שאר השכבה העליונה, ושלבי ה־3×3 האחרונים מסדרים אותה בכל מקרה.';

  @override
  String get stepBigPllParity => 'פריטי PLL';

  @override
  String get stepBigPllParityBody =>
      'שתי צלעות מוחלפות ממש בסוף? ⁦2R2 U2 2R2 Uw2 2R2 Uw2⁩ מחליף בין הצלע העליונה־קדמית לעליונה־אחורית.';

  @override
  String get introGoalHeading => 'מה המטרה?';

  @override
  String get introHowHeading => 'איך עושים את זה?';

  @override
  String get introStart => 'הבנתי, בוא נתחיל';

  @override
  String get introDontShowAgain => 'לא להציג אוטומטית שוב';

  @override
  String get introShowGoal => 'הצגת המטרה';

  @override
  String get introStateStart => 'התחלה';

  @override
  String get introStateGoal => 'מטרה';

  @override
  String get introPlayMorph => 'הפעלה מההתחלה עד המטרה';

  @override
  String get introGoalBasics =>
      'לומדים לקרוא את הקובייה: החלקים, שש הפאות ואיך אותיות המהלכים מסובבות אותן.';

  @override
  String get introGoalCross =>
      'בונים איקס לבן שבו כל צלע לבנה מתאימה גם לצבע המרכז שלידה.';

  @override
  String get introGoalCorners =>
      'משלימים את ארבע הפינות הלבנות, וכך הכתר הראשון – כל השכבה הלבנה – גמור.';

  @override
  String get introGoalMiddle =>
      'מציבים את ארבע הצלעות של השכבה האמצעית, וכך שתי השכבות הראשונות פתורות.';

  @override
  String get introGoalYellowCross =>
      'בונים איקס צהוב למעלה; צבעי הצדדים עוד לא חייבים להתאים.';

  @override
  String get introGoalYellowEdges =>
      'מתאימים כל צלע של האיקס הצהוב לצבע המרכז שבצד שלה.';

  @override
  String get introGoalYellowCorners =>
      'מעבירים כל פינה צהובה למקום שלה, גם אם היא עדיין מסובבת.';

  @override
  String get introGoalTwistCorners =>
      'מסובבים את הפינות הצהובות לצבעים הנכונים, וכל הקובייה פתורה.';

  @override
  String get introGoalCfopIntro =>
      'מכירים את התוכנית של הספידקיובינג: איקס, שתי שכבות ראשונות, ואז השכבה האחרונה בשני מבטים.';

  @override
  String get introGoalF2l =>
      'מכניסים כל פינה לבנה יחד עם הצלע האמצעית שלה, ומסיימים שתי שכבות בבת אחת.';

  @override
  String get introGoalOll =>
      'צובעים את כל הפאה העליונה בצהוב באלגוריתם אחד או שניים.';

  @override
  String get introGoalPll =>
      'מעבירים את חלקי השכבה האחרונה למקומם ומסיימים את הקובייה.';

  @override
  String get introGoalTwoFirst => 'בונים שכבה לבנה שלמה אחת בקובייה 2×2.';

  @override
  String get introGoalTwoOll => 'צובעים את כל הפאה העליונה של ה־2×2 בצהוב.';

  @override
  String get introGoalTwoPbl =>
      'מחליפים את הפינות האחרונות למקומן ופותרים את ה־2×2.';

  @override
  String get introGoalBigIntro =>
      'מכירים את ה־4×4: מרכזים, זוגות צלעות ופינות, והמהלכים שמסובבים אותם.';

  @override
  String get introGoalBigCenters =>
      'אוספים את חלקי המרכז של כל פאה לגוש אחד בצבע אחיד.';

  @override
  String get introGoalBigEdges =>
      'מצמידים חלקי צלע תואמים, כך שכל צלע נראית כמו צלע אחת של 3×3.';

  @override
  String get introGoalBigParity =>
      'מתקנים את שני המקרים של 4×4 שאין ב־3×3: צלע הפוכה אחת או שתי צלעות מוחלפות.';

  @override
  String get introHowBasics =>
      'המרכזים לא זזים, ולכן הם קובעים את צבע כל פאה.\nכל אות מסובבת פאה אחת רבע סיבוב עם כיוון השעון.\nגרש (\') מסובב בחזרה, ו־2 מסובב פעמיים.';

  @override
  String get introHowCross =>
      'מחזיקים צהוב למעלה: האיקס הלבן נבנה למטה.\nמוצאים צלע לבנה ומיישרים את הצבע הצדדי שלה מול המרכז המתאים.\nמסובבים את הפאה הזאת פעמיים כדי להוריד את הצלע למקומה.';

  @override
  String get introHowCorners =>
      'מביאים פינה לבנה מעל המקום הריק שלה.\nחוזרים על ⁦R U R\' U\'⁩ עד שהיא נכנסת בכיוון הנכון.\nעושים אותו דבר לשלוש הפינות האחרות.';

  @override
  String get introHowMiddle =>
      'מוצאים צלע עליונה בלי צהוב ומתאימים את הצבע הקדמי שלה למרכז.\nשולחים אותה ימינה או שמאלה באלגוריתם קצר של 8 מהלכים.\nהשכבה הלבנה חוזרת שלמה בכל פעם.';

  @override
  String get introHowYellowCross =>
      'מסתכלים למעלה: נקודה, L או קו.\nמחזיקים כמו בתמונה ועושים ⁦F R U R\' U\' F\'⁩.\nחוזרים עד שמופיע האיקס הצהוב.';

  @override
  String get introHowYellowEdges =>
      'מסובבים את הפאה העליונה עד ששתי צלעות מתאימות למרכזים שלהן.\nמחזיקים אותן מאחור ומימין ועושים ⁦R U R\' U R U2 R\' U⁩.\nחוזרים עד שכל ארבע הצלעות מתאימות.';

  @override
  String get introHowYellowCorners =>
      'פינה נמצאת במקומה כשהצבעים שלה מתאימים לשלוש הפאות סביבה.\nמשאירים פינה שכבר במקום בקדמי־ימני.\n⁦U R U\' L\' U R\' U\' L⁩ מסובב את שלוש האחרות עד שכולן מתאימות.';

  @override
  String get introHowTwistCorners =>
      'מחזיקים פינה לא פתורה בקדמי־ימני.\nחוזרים על ⁦R\' D\' R D⁩ עד שהצהוב שלה פונה למעלה.\nמסובבים רק את הפאה העליונה לפינה הבאה; השכבה התחתונה מסתדרת לבד בסוף.';

  @override
  String get introHowCfopIntro =>
      'איקס: ארבע צלעות שמתכננים בזמן הבדיקה.\nF2L: כל פינה נכנסת יחד עם הצלע שלה.\nOLL צובע את הפאה העליונה בצהוב, ואז PLL מחזיר את החלקים למקום.';

  @override
  String get introHowF2l =>
      'מוצאים פינה ואת הצלע המתאימה לה בשכבה העליונה.\nמחברים אותן לזוג מעל החריץ שלהן.\nמורידים את הזוג פנימה בשלושה–ארבעה מהלכים.';

  @override
  String get introHowOll =>
      'קודם האיקס הצהוב עם ⁦F R U R\' U\' F\'⁩.\nאחר כך מסובבים את הפינות, למשל עם Sune.\nמזהים את המקרה לפי הצהוב שרואים.';

  @override
  String get introHowPll =>
      'הפאה העליונה כבר כולה צהובה.\nT-perm מחליף פינות; U-perm מסובב שלוש צלעות.\nקוראים את צבעי הצדדים כדי לבחור אלגוריתם.';

  @override
  String get introHowTwoFirst =>
      'קובייה 2×2 היא רק פינות, כמו 3×3 בלי צלעות.\nמביאים כל פינה לבנה מעל המקום שלה.\nחוזרים על ⁦R U R\' U\'⁩ עד שהיא נכנסת.';

  @override
  String get introHowTwoOll =>
      'משאירים את השכבה הלבנה למטה.\nSune ‏(⁦R U R\' U R U2 R\'⁩) מסובב את הפינות העליונות.\nחוזרים מהזווית הנכונה עד שכל הפאה העליונה צהובה.';

  @override
  String get introHowTwoPbl =>
      'מחפשים צד שבו שתי פינות כבר מתאימות.\nהחלפה סמוכה: אלגוריתם אחד בסגנון T-perm.\nהחלפה אלכסונית: אלגוריתם אחד ארוך יותר.';

  @override
  String get introHowBigIntro =>
      'אין מרכז קבוע: ארבעה חלקי מרכז יוצרים את צבע הפאה.\nמהלכים רחבים כמו ⁦Rw⁩ מסובבים שתי שכבות יחד.\nמהלכים פנימיים כמו ⁦2R⁩ מסובבים רק פרוסה פנימית אחת.';

  @override
  String get introHowBigCenters =>
      'בונים קודם שני מרכזים נגדיים.\nפרוסות פנימיות מחליפות חלקי מרכז בלי לפרק מרכזים גמורים.\nמסיימים את ארבעת המרכזים האחרונים באותה דרך.';

  @override
  String get introHowBigEdges =>
      'מוצאים שני חלקי צלע באותם צבעים.\nמיישרים אותם זה ליד זה עם פרוסה פנימית.\nמזיזים את הזוג הצידה ומחזירים את המרכזים.';

  @override
  String get introHowBigParity =>
      'פותרים את ה־4×4 כמו 3×3 עד שנתקעים.\nצלע הפוכה אחת: אלגוריתם הזוגיות הארוך של OLL.\nשתי צלעות מוחלפות: ⁦2R2 U2 2R2 Uw2 2R2 Uw2⁩.';

  @override
  String get dirFaceR => 'צד ימין';

  @override
  String get dirFaceL => 'צד שמאל';

  @override
  String get dirFaceU => 'שורה עליונה';

  @override
  String get dirFaceD => 'שורה תחתונה';

  @override
  String get dirFaceF => 'פאה קדמית';

  @override
  String get dirFaceB => 'פאה אחורית';

  @override
  String get dirMiddle => 'פרוסה אמצעית';

  @override
  String get dirWholeCube => 'כל הקובייה';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, שכבה $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth שכבות לעומק';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, שכבות $near–$far';
  }

  @override
  String get dirUp => 'למעלה';

  @override
  String get dirDown => 'למטה';

  @override
  String get dirLeft => 'שמאלה';

  @override
  String get dirRight => 'ימינה';

  @override
  String get dirClockwise => 'עם כיוון השעון';

  @override
  String get dirCounter => 'נגד כיוון השעון';

  @override
  String get dirBackClockwise => 'עם כיוון השעון, במבט מאחור';

  @override
  String get dirBackCounter => 'נגד כיוון השעון, במבט מאחור';

  @override
  String get dirHalf => 'סיבוב כפול (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'הסתרת הפרטים';

  @override
  String get solveExpand => 'הצגת הפרטים';

  @override
  String get dailyScrambleSteps => 'ערבוב צעד אחר צעד';

  @override
  String get dailyScrambleGuide => 'מדריך ערבוב בתלת־ממד';

  @override
  String get dailyShowMoves => 'הצגת המהלכים כטקסט';

  @override
  String get dailyHideMoves => 'הסתרת המהלכים בטקסט';

  @override
  String get dailyScrambleGuideTitle => 'מדריך ערבוב';

  @override
  String get phaseDailyScramble => 'מערבבים את הקובייה של היום';

  @override
  String get explainDailyScramble =>
      'מתחילים מקובייה פתורה, לבן למעלה וירוק מלפנים, ומעתיקים כל סיבוב לקובייה האמיתית.';

  @override
  String get stageCenters => 'בניית גושי המרכז';

  @override
  String get stageEdges => 'צימוד צלעות חיצוניות ופנימיות';

  @override
  String get stageParity => 'פתרון זוגיות';

  @override
  String get stageCrown1 => 'הכתר הראשון (לבן)';

  @override
  String get stageCrown2 => 'הכתר השני';

  @override
  String get stageCrown3 => 'הכתר השלישי (צהוב)';

  @override
  String get stageOrient => 'כיוון החלקים';

  @override
  String get stageFinish => 'סיום הקובייה';

  @override
  String get stageAsThree => 'פתרון כמו 3×3';

  @override
  String get stageTwoByTwo => 'פתרון ה־2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'שלב $number מתוך $total: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'כתר $crown • שלב $number מתוך $total: $title';
  }

  @override
  String get solveAllStagesDone => 'כל השלבים הושלמו. כל הכבוד!';

  @override
  String get trackFiveByFive => '5×5 קוביית הפרופסור';

  @override
  String get trackSixBySix => 'קובייה 6×6';

  @override
  String get lessonFiveIntro => 'הכירו את ה־5×5';

  @override
  String get lessonFiveIntroDesc =>
      'מרכזים קבועים, פסי מרכז, צלעות אמצעיות וכנפיים.';

  @override
  String get introGoalFiveIntro =>
      'מכירים את ה־5×5: מרכזים קבועים, פסי מרכז, צלעות אמצעיות וכנפיים.';

  @override
  String get introHowFiveIntro =>
      'החלק האמצעי בכל פאה לא זז אף פעם.\nכל צלע היא חלק אמצעי ושתי כנפיים.\nפרוסות פנימיות מזיזות חלקים בלי לגעת בחוץ.';

  @override
  String get lessonFiveCenters => 'מרכזי ה־5×5';

  @override
  String get lessonFiveCentersDesc => 'בונים כל מרכז משלושה פסים של שלושה.';

  @override
  String get introGoalFiveCenters => 'בונים בכל פאה גוש מרכז של 3×3 בצבע אחד.';

  @override
  String get introHowFiveCenters =>
      'מתחילים מהחלק האמצעי: הוא קובע את הצבע.\nבונים פסים של שלושה ומחליקים אותם פנימה בפרוסה פנימית.\nמסיימים את שני המרכזים האחרונים יחד.';

  @override
  String get lessonFiveEdges => 'צלעות ה־5×5';

  @override
  String get lessonFiveEdgesDesc => 'מחברים שתי כנפיים לצלע האמצעית שלהן.';

  @override
  String get introGoalFiveEdges =>
      'מחברים כל צלע אמצעית לשתי הכנפיים שלה, כך שכל 12 הצלעות נראות כחלק אחד.';

  @override
  String get introHowFiveEdges =>
      'מתאימים שתי כנפיים לצלע האמצעית שלהן בחזית.\nמסובבים את השכבה הפנימית, מכניסים צלע לא פתורה ומחזירים.\nמצמדים את הצלעות האחרונות בלי לפרק צלעות גמורות.';

  @override
  String get lessonFiveSolve => 'פותרים את ה־5×5 כמו 3×3';

  @override
  String get lessonFiveSolveDesc => 'מסיימים עם שלושת הכתרים.';

  @override
  String get introGoalFiveSolve =>
      'פותרים את ה־5×5 המצומצם כמו 3×3, כתר אחרי כתר.';

  @override
  String get introHowFiveSolve =>
      'מעכשיו רק סיבובים חיצוניים.\nהכתר הראשון, הכתר השני ואז הכתר הצהוב.\nהמרכזים הקבועים מראים את צבע כל פאה.';

  @override
  String get lessonFiveParity => 'זוגיות צלעות ב־5×5';

  @override
  String get lessonFiveParityDesc => 'מתקנים צלע שהכנפיים שלה מוחלפות.';

  @override
  String get introGoalFiveParity =>
      'מתקנים את הצלע היחידה ששתי הכנפיים שלה מוחלפות, ואז מסיימים.';

  @override
  String get introHowFiveParity =>
      'זה נראה כמו צלע שלא מסכימה להתחבר.\nמבצעים פעם אחת את התיקון הארוך של הפרוסות הפנימיות.\nכל השאר חוזר למקומו.';

  @override
  String get lessonSixIntro => 'הכירו את ה־6×6';

  @override
  String get lessonSixIntroDesc => 'אין מרכזים קבועים, וארבעה חלקים בכל צלע.';

  @override
  String get introGoalSixIntro =>
      'מכירים את ה־6×6: שישה־עשר חלקי מרכז בכל פאה וארבעה חלקים בכל צלע.';

  @override
  String get introHowSixIntro =>
      'אין מרכז קבוע: אתם בוחרים את הצבעים תוך כדי בנייה.\nבכל צלע יש כנפיים חיצוניות ופנימיות.\nסיבובים רחבים יכולים להזיז עד שלוש שכבות.';

  @override
  String get lessonSixCenters => 'מרכזי ה־6×6';

  @override
  String get lessonSixCentersDesc => 'בונים מרכזי 4×4 מפסים של ארבעה.';

  @override
  String get introGoalSixCenters =>
      'בונים בכל פאה גוש מרכז של 4×4 בצבע אחד אחיד.';

  @override
  String get introHowSixCenters =>
      'בונים קודם שני מרכזים נגדיים.\nיוצרים פסים של ארבעה ומחליקים אותם זה לזה.\nמזיזים חלק בודד בתרגיל פרוסה, למעלה, ביטול.';

  @override
  String get lessonSixEdges => 'צלעות ה־6×6';

  @override
  String get lessonSixEdgesDesc => 'אוספים את ארבעת החלקים של כל צלע.';

  @override
  String get introGoalSixEdges =>
      'אוספים את ארבעת החלקים של כל צלע, כך שב־6×6 יש 12 צלעות נקיות.';

  @override
  String get introHowSixEdges =>
      'מיישרים בחזית את הכנפיים החיצוניות והפנימיות.\nהשכבה הרחבה העמוקה מכניסה ומוציאה צלע.\nצלעות גמורות אף פעם לא מתפרקות.';

  @override
  String get lessonSixSolve => 'פותרים את ה־6×6 כמו 3×3';

  @override
  String get lessonSixSolveDesc => 'מסיימים עם שלושת הכתרים.';

  @override
  String get introGoalSixSolve =>
      'פותרים את ה־6×6 המצומצם כמו 3×3, כתר אחרי כתר.';

  @override
  String get introHowSixSolve =>
      'מעכשיו רק סיבובים חיצוניים.\nהמרכזים שבניתם מראים את צבע כל פאה.\nהכתר הראשון, הכתר השני ואז הכתר הצהוב.';

  @override
  String get lessonSixParity => 'זוגיות ב־6×6';

  @override
  String get lessonSixParityDesc => 'צלע הפוכה אחת או שתי צלעות מוחלפות.';

  @override
  String get introGoalSixParity =>
      'מתקנים את שני המקרים של 6×6 שאין ב־3×3: צלע הפוכה אחת או שתי צלעות מוחלפות.';

  @override
  String get introHowSixParity =>
      'פותרים כמו 3×3 עד שנתקעים.\nצלע הפוכה אחת: תיקון הזוגיות הארוך.\nשתי צלעות מוחלפות: התיקון הקצר של סיבובים כפולים.';

  @override
  String get stepFivePieces => 'החלקים של 5×5';

  @override
  String get stepFivePiecesBody =>
      'החלק האמצעי בכל פאה לא זז אף פעם, ולכן הוא עדיין קובע את צבע הפאה, כמו ב־3×3. סביבו יש עוד שמונה חלקי מרכז; בכל צלע יש חלק אמצעי ושתי כנפיים, והפינות מתנהגות כמו ב־3×3.';

  @override
  String get stepFiveSlices => 'שלושה סוגי סיבובים';

  @override
  String get stepFiveSlicesBody =>
      'סיבוב חיצוני מזיז פאה אחת. סיבוב רחב מזיז פאה יחד עם השכבה שמאחוריה. סיבוב פרוסה פנימית מזיז רק שכבה בפנים: כך חלקים מחליפים מקום בלי לגעת בחוץ.';

  @override
  String get stepFiveCenterBar => 'פסי מרכז';

  @override
  String get stepFiveCenterBarBody =>
      'בונים שורה של שלושה חלקי מרכז תואמים, ואז מחליקים אותה ליד המרכז האמצעי המתאים בסיבוב פרוסה פנימית. שלושה פסים יוצרים מרכז גמור.';

  @override
  String get stepFiveCenterSwap => 'מחליפים בלי לשבור';

  @override
  String get stepFiveCenterSwapBody =>
      'כדי להזיז חלק מרכז בודד: מסובבים פרוסה פנימית, מסובבים את הפאה העליונה, מבטלים את הפרוסה ומחזירים את העליונה. מרכזים גמורים חוזרים בכל פעם.';

  @override
  String get stepFiveEdgePair => 'מצמדים כנפיים לצלע אמצעית';

  @override
  String get stepFiveEdgePairBody =>
      'מיישרים שתי כנפיים ליד הצלע האמצעית שלהן בחזית, מורידים את השכבה הפנימית, מכניסים מלמעלה צלע לא פתורה ומחזירים את השכבה הפנימית.';

  @override
  String get stepFiveEdgeLast => 'הצלעות האחרונות';

  @override
  String get stepFiveEdgeLastBody =>
      'כשנשארו מעט צלעות, סיבוב רחב, טריגר קצר וחזרה של הסיבוב הרחב מצמדים אותן בלי לפרק צלעות גמורות.';

  @override
  String get stepFiveAsThree => 'עכשיו זו 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'כשהמרכזים והצלעות מוכנים, ה־5×5 מתנהגת כמו 3×3 גדולה. משתמשים רק בסיבובים חיצוניים ועוברים את שלושת הכתרים: איקס ופינות לבנים, השכבה האמצעית ואז השכבה הצהובה.';

  @override
  String get stepFiveEdgeParity => 'מחליפים את כנפי הצלע האחרונה';

  @override
  String get stepFiveEdgeParityBody =>
      'לפעמים בצלע האחרונה שתי הכנפיים מוחלפות. אלגוריתם ארוך של פרוסות פנימיות מחליף אותן בחזרה וכל השאר חוזר למקומו. אחר כך מסיימים כמו 3×3.';

  @override
  String get stepSixPieces => 'החלקים של 6×6';

  @override
  String get stepSixPiecesBody =>
      'כמו ב־4×4, ב־6×6 אין מרכז קבוע: שישה־עשר חלקי מרכז יוצרים את צבע הפאה. בכל צלע ארבעה חלקים: שתי כנפיים חיצוניות ושתיים פנימיות.';

  @override
  String get stepSixSlices => 'מסובבים שכבות עמוקות';

  @override
  String get stepSixSlicesBody =>
      'סיבובים רחבים יכולים להזיז שתיים או שלוש שכבות מפאה. פרוסות פנימיות בשכבה השנייה או השלישית הן הכלים למרכזים ולצלעות.';

  @override
  String get stepSixCenterBar => 'פסים של ארבעה';

  @override
  String get stepSixCenterBarBody =>
      'בונים שורות של ארבעה חלקי מרכז תואמים ומחליקים אותן זו ליד זו בסיבובי פרוסה פנימית, עד שהפאה בצבע אחד אחיד.';

  @override
  String get stepSixCenterSwap => 'מזיזים חלק אחד בכל פעם';

  @override
  String get stepSixCenterSwapBody =>
      'מסובבים את השכבה השלישית, מסובבים את העליונה, מבטלים ומחזירים: חלק מרכז אחד זז ומרכזים גמורים חוזרים.';

  @override
  String get stepSixEdgePair => 'ארבעה חלקים, צלע אחת';

  @override
  String get stepSixEdgePairBody =>
      'אוספים בחזית את ארבעת החלקים של צלע בעזרת השכבה הרחבה העמוקה, מכניסים צלע לא פתורה ומחזירים את השכבה הרחבה.';

  @override
  String get stepSixEdgeLast => 'הצלעות האחרונות';

  @override
  String get stepSixEdgeLastBody =>
      'מצמדים את הצלעות האחרונות בטריגר קצר בין סיבוב רחב עמוק לביטול שלו, כך שצלעות גמורות נשארות מחוברות.';

  @override
  String get stepSixAsThree => 'עכשיו זו 3×3';

  @override
  String get stepSixAsThreeBody =>
      'עם מרכזי 4×4 וצלעות מצומדות, פותרים את ה־6×6 כמו 3×3 בסיבובים חיצוניים ובשלושת הכתרים.';

  @override
  String get stepSixOllParity => 'צלע הפוכה אחת';

  @override
  String get stepSixOllParityBody =>
      'אם צלע אחת נראית הפוכה בזמן פתרון השכבה האחרונה, זו זוגיות. מחזיקים אותה בחזית השכבה העליונה ומבצעים את התיקון הארוך: שני הכתרים הראשונים חוזרים בלי פגע.';

  @override
  String get stepSixPllParity => 'שתי צלעות מוחלפות';

  @override
  String get stepSixPllParityBody =>
      'אם שתי צלעות נראות מוחלפות ממש בסוף, מחזיקים אותן מקדימה ומאחור בשכבה העליונה ומבצעים את התיקון הקצר של סיבובים כפולים פנימיים.';

  @override
  String get stageTwoFirstLayer => 'בונים את השכבה התחתונה';

  @override
  String get stageTwoTopColor => 'צובעים את הפאה העליונה בצבע אחד';

  @override
  String get stageTwoFinish => 'מסיימים את הפינות';

  @override
  String get explainTwoFirstLayer =>
      'משלימים את השכבה התחתונה: ארבע הפינות שלה מתאימות זו לזו ולצבעי הצדדים.';

  @override
  String get explainTwoTopColor =>
      'מסובבים עד שכל ארבע המדבקות העליונות באותו צבע, בלי לפרק את השכבה התחתונה.';

  @override
  String get explainTwoFinish =>
      'מעבירים את הפינות האחרונות למקומן ומסיימים את הקובייה.';

  @override
  String get tabSolve => 'פתרון';

  @override
  String get tabScan => 'סריקה';

  @override
  String get tabAcademy => 'אקדמיה';

  @override
  String get tabTrain => 'אימון';

  @override
  String get openCubeSolver => 'פתיחת קובייה תלת־ממדית ופותר';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'אימון';

  @override
  String get trainSubtitle => 'חדדו את הכישורים שלכם בכל יום.';

  @override
  String get settings => 'הגדרות';

  @override
  String get settingsSoundHaptics => 'צליל ורטט';

  @override
  String get settingsSoundHapticsDesc => 'קליקים ורטט כשמסובבים את הקובייה.';

  @override
  String get settingsAnimationSpeed => 'מהירות אנימציה ברירת מחדל';

  @override
  String get settingsAnimationSpeedDesc =>
      'כמה מהר הקובייה מסתובבת כשמהלכים מתנגנים.';

  @override
  String get settingsResetProgress => 'איפוס התקדמות';

  @override
  String get settingsResetProgressDesc =>
      'מחיקת השיעורים שהושלמו באקדמיה ורצף האתגר היומי.';

  @override
  String get resetProgressTitle => 'לאפס את כל ההתקדמות?';

  @override
  String get resetProgressBody =>
      'השיעורים שהשלמתם ורצף האתגר היומי יימחקו. אי אפשר לבטל את הפעולה.';

  @override
  String get resetProgressDone => 'ההתקדמות אופסה.';

  @override
  String get cancel => 'ביטול';

  @override
  String get settingsPrivacyAds => 'פרטיות ופרסומות';

  @override
  String get settingsPrivacyAdsDesc =>
      'עיון בבחירות ההסכמה לפרסומות או שינוין.';

  @override
  String get playbackPrevious => 'הקודם';

  @override
  String get playbackNext => 'הבא';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'נפתר ב־$count מהלכים!',
      two: 'נפתר בשני מהלכים!',
      one: 'נפתר במהלך אחד!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'עזרו לעצב את הגרסה הבאה';

  @override
  String get feedbackBody =>
      'רוצים להציע פיצ\'ר או להשפיע על הגרסה הבאה של CubeMentor? כתבו לנו:';

  @override
  String get feedbackEmailCopied =>
      'לא נמצאה אפליקציית דוא\"ל, אז העתקנו את הכתובת ללוח.';

  @override
  String get adWatchToUnlock => 'צפייה בפרסומת';

  @override
  String get adLoading => 'טוען סרטון קצר…';

  @override
  String get adRewardNotEarned => 'צפו בסרטון עד הסוף כדי לפתוח.';

  @override
  String get adUnavailableFreePass => 'אין סרטון זמין כרגע — נפתח בחינם הפעם.';

  @override
  String get settingsPrivacyAdsError =>
      'לא ניתן לפתוח את אפשרויות הפרטיות. נסו שוב מאוחר יותר.';

  @override
  String get nicknamePromptTitle => 'איך נקרא לכם?';

  @override
  String get nicknamePromptBody => 'נריע לכם בשמכם בכל פעם שתפתרו.';

  @override
  String get nicknameHint => 'השם או הכינוי שלכם';

  @override
  String get nicknameSave => 'שמירה';

  @override
  String get settingsNickname => 'השם שלכם';

  @override
  String get settingsNicknameNotSet => 'לא הוגדר — הקישו כדי להוסיף';

  @override
  String celebrateNamed(String name) {
    return 'כל הכבוד, ⁨$name⁩!';
  }

  @override
  String get celebrateAnon => 'כל הכבוד!';

  @override
  String get celebrateCubeSolved => 'הקובייה נפתרה!';

  @override
  String get celebrateDailyDone => 'האתגר היומי הושלם!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '⁦$count / $limit⁩ מהלכים',
      one: '⁦$count / 1⁩ מהלך',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'כל ערבוב ניתן לפתור ב־$limit מהלכים או פחות',
      one: 'כל ערבוב ניתן לפתור במהלך אחד או פחות',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'צפייה בסרטון';

  @override
  String get patternsNotNow => 'לא עכשיו';

  @override
  String get settingsColorScheme => 'ערכת הצבעים של הקובייה';

  @override
  String get colorSchemeWestern => 'מערבית';

  @override
  String get colorSchemeJapanese => 'יפנית';

  @override
  String get colorSchemeWesternDesc => 'לבן מול צהוב, כחול מול ירוק';

  @override
  String get colorSchemeJapaneseDesc => 'לבן מול כחול, צהוב מול ירוק';

  @override
  String dailyYourTime(String time) {
    return 'הזמן שלכם: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'יש לכם $seconds שניות לבחון את הקובייה. הקישו כדי להתחיל את הספירה לאחור.';
  }

  @override
  String get timerInspectTapReady => 'הקישו כשאתם מוכנים להתחיל לפתור';

  @override
  String timerInspectPlus2(int seconds) {
    return 'הבחינה עברה $seconds שניות, אז השעון התחיל לבד: קנס של ⁦+2⁩ שניות';
  }

  @override
  String timerAvgOf(int count) {
    return 'ממוצע של $count';
  }

  @override
  String get timerAvgNote => 'בממוצעים לא נספרים הזמן הטוב והגרוע ביותר';

  @override
  String get timerPbSub => 'הזמן הטוב ביותר';

  @override
  String get timerPlus2Caption => 'קנס של ⁦+2⁩ שניות';

  @override
  String get timerDnfCaption => 'לא הושלם';

  @override
  String get timerDeleteCaption => 'מחיקת הפתרון הזה';

  @override
  String get patternBullsEye => 'בול בעין';

  @override
  String get patternFramedCenter => 'מרכז ממוסגר';

  @override
  String get patternBlockCheckerboard => 'שחמט של ריבועים';

  @override
  String get patternCubeInCubeInCube => 'קובייה בתוך קובייה בתוך קובייה';

  @override
  String get patternUnionJack => 'יוניון ג\'ק';

  @override
  String get patternKilt => 'קילט';

  @override
  String get patternSixTs => 'שש צורות ⁦T⁩';

  @override
  String get patternTwinPeaks => 'פסגות תאומות';

  @override
  String get patternSpiral => 'ספירלה';

  @override
  String get patternTetris => 'טטריס';

  @override
  String get patternSpots => 'נקודות במרכז';

  @override
  String get patternStripes => 'פסים';

  @override
  String get patternAnaconda => 'אנקונדה';

  @override
  String get patternZigzag => 'זיגזג';

  @override
  String get patternFourSpots => 'ארבע נקודות';

  @override
  String get patternGreenMamba => 'ממבה ירוקה';

  @override
  String get patternPlusMinus => 'פלוס מינוס';

  @override
  String guideStepCounter(int current, int total) {
    return 'שלב $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'מהלך $current / $total';
  }

  @override
  String get dailyStep1Title => 'שלב 1: ערבבו את הקובייה';

  @override
  String get dailyStep2Title => 'שלב 2: פתרו את הקובייה';

  @override
  String dailyPersonalBest(String time) {
    return 'שיא אישי: $time';
  }

  @override
  String get dailyRecentDays => 'ימים אחרונים';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'רצף של $count ימים! אתם בוערים!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'הקובייה מעורבבת! עכשיו לכו לפתור אותה';

  @override
  String get dailyCongratsTitle => 'כל הכבוד!';

  @override
  String dailyCongratsBody(String time) {
    return 'פתרתם את האתגר של היום ב־$time.';
  }

  @override
  String get dailyCongratsDone => 'חזרה לאתגר';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count דוגמאות',
      one: 'דוגמה אחת',
    );
    return '⁦$size⁩ • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'נותרו $hours שעות',
      two: 'נותרו שעתיים',
      one: 'נותרה שעה אחת',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'נותרו $minutes דקות',
      two: 'נותרו שתי דקות',
      one: 'נותרה דקה אחת',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'נעול';

  @override
  String get unlockedLabel => 'פתוח';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'צפו בסרטון קצר אחד כדי לפתוח את הדוגמה הזו ואת המדריך שלב אחר שלב ל־$hours שעות.',
      two: 'צפו בסרטון קצר אחד כדי לפתוח את הדוגמה הזו ואת המדריך שלב אחר שלב לשעתיים.',
      one: 'צפו בסרטון קצר אחד כדי לפתוח את הדוגמה הזו ואת המדריך שלב אחר שלב לשעה אחת.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'צפו בסרטון קצר אחד כדי לפתוח את השיעור הזה כמה פעמים שתרצו ב־$hours השעות הקרובות.',
      two: 'צפו בסרטון קצר אחד כדי לפתוח את השיעור הזה כמה פעמים שתרצו בשעתיים הקרובות.',
      one: 'צפו בסרטון קצר אחד כדי לפתוח את השיעור הזה כמה פעמים שתרצו בשעה הקרובה.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'פתרון קוביות גדולות';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'הפתרון החינמי שלכם ל־⁦4×4–6×6⁩ נוצל. צפו בסרטון קצר אחד כדי לפתור קוביות גדולות ב־$hours השעות הקרובות.',
      two: 'הפתרון החינמי שלכם ל־⁦4×4–6×6⁩ נוצל. צפו בסרטון קצר אחד כדי לפתור קוביות גדולות בשעתיים הקרובות.',
      one: 'הפתרון החינמי שלכם ל־⁦4×4–6×6⁩ נוצל. צפו בסרטון קצר אחד כדי לפתור קוביות גדולות בשעה הקרובה.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'סיבוב כפול · 180°';
}
