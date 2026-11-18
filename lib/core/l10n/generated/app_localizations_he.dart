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
  String get comingSoon => 'בקרוב';

  @override
  String get comingSoonMessage => 'התכונה הזו תגיע בעדכון הקרוב.';

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
  String get nextStep => 'הבא';

  @override
  String get previousStep => 'הקודם';

  @override
  String get playbackTitle => 'הפעלה';

  @override
  String get playbackEmpty => 'ערבבו את הקובייה כדי לבנות רצף פתרון.';

  @override
  String playbackProgress(int current, int total) {
    return 'צעד $current מתוך $total';
  }

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
  String get solveChooseMethod => 'איך תרצו לפתור?';

  @override
  String get solveFast => 'פתרון מהיר';

  @override
  String get solveFastDesc => 'אלגוריתם קוצ\'יאמבה דו־שלבי · כ־20 מהלכים';

  @override
  String get solveLearn => 'ללמוד צעד אחר צעד';

  @override
  String get solveLearnDesc => 'שיטת המתחילים שכבה אחר שכבה, עם הסברים';

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
  String get replayStep => 'הצגת הצעד שוב';

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
  String get phaseLblOrient => 'אחיזת הקובייה';

  @override
  String get phaseLblCross => 'צלב לבן';

  @override
  String get phaseLblCorners => 'פינות לבנות';

  @override
  String get phaseLblMiddle => 'השכבה האמצעית';

  @override
  String get phaseLblYellowCross => 'צלב צהוב';

  @override
  String get phaseLblYellowEdges => 'צלעות צהובות';

  @override
  String get phaseLblYellowCorners => 'מיקום הפינות הצהובות';

  @override
  String get phaseLblYellowCornersOrient => 'סיבוב הפינות הצהובות';

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
      'בנו את הצלב הצהוב עם ⁦F R U R\' U\' F\'⁩.';

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
  String get lessonDone => 'הושלם';

  @override
  String lessonPartOf(int index, int total) {
    return 'חלק $index מתוך $total';
  }

  @override
  String get lessonBack => 'הקודם';

  @override
  String get lessonNext => 'הבא';

  @override
  String get lessonFinish => 'סיום השיעור';

  @override
  String get lessonComplete => 'השיעור הושלם!';

  @override
  String get lessonNextLesson => 'לשיעור הבא';

  @override
  String get lessonBackToAcademy => 'חזרה לאקדמיה';

  @override
  String get lessonShowMe => 'הראו לי';

  @override
  String get lessonTryIt =>
      'תורכם: החליקו את השכבה שהחץ מראה, או הקישו על \"הראו לי\".';

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
  String get trackBeginner => 'מתחילים 3×3 (שכבה אחר שכבה)';

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
  String get solveFastBigDesc => 'רדוקציה: מרכזים, צלעות ופריטי, ואז קוציאמבה';

  @override
  String get solveLearnBigDesc =>
      'רדוקציה שמסתיימת בשיטת המתחילים, שכבה אחר שכבה';

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
  String get patternCross => 'צלב';

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
  String get timerInspecting => 'זמן בחינה: החזיקו ושחררו כדי להתחיל';

  @override
  String get timerTapToInspect => 'הקישו כדי להתחיל 15 שניות של בחינה';

  @override
  String get timerInspectionToggle => '15 שניות בחינה';

  @override
  String get timerNewScramble => 'ערבוב חדש';

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
    return 'התחילו מהצלב הלבן: $moves';
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
  String get lessonCross => 'הצלב הלבן';

  @override
  String get lessonCrossDesc => 'בונים צלב לבן בתחתית.';

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
      'צלע שתקועה בשכבה האמצעית עולה קודם למעלה: מסובבים את הצד שלה למעלה, מזיזים את הפאה העליונה ומחזירים את הצד, כדי לא לפרק את הצלב. אחר כך ממקמים אותה מלמעלה.';

  @override
  String get lessonCorners => 'הפינות הלבנות';

  @override
  String get lessonCornersDesc => 'מסיימים את השכבה הראשונה.';

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
  String get lessonMiddle => 'השכבה האמצעית';

  @override
  String get lessonMiddleDesc => 'מכניסים את ארבע צלעות האמצע.';

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
  String get lessonLastLayer => 'הצלב הצהוב והצלעות';

  @override
  String get lessonLastLayerDesc => 'יוצרים צלב למעלה ומתאימים את הצלעות.';

  @override
  String get stepYellowCross => 'אלגוריתם אחד';

  @override
  String get stepYellowCrossBody =>
      '⁦F R U R\' U\' F\'⁩ הופך נקודה צהובה ל־L, את ה־L לקו ואת הקו לצלב. החזיקו את ה־L מאחור משמאל ואת הקו לרוחב.';

  @override
  String get stepYellowEdges => 'מתאימים את הצלעות';

  @override
  String get stepYellowEdgesBody =>
      'סובבו את הפאה העליונה עד ששתי צלעות תואמות למרכזים. כשאחת מאחור ואחת מימין, ⁦R U R\' U R U2 R\' U⁩ מחליף בין השתיים האחרות.';

  @override
  String get lessonLastCorners => 'הפינות הצהובות';

  @override
  String get lessonLastCornersDesc => 'ממקמים ומסובבים את הפינות האחרונות.';

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
  String get lessonCfopIntroDesc => 'צלב, F2L,‏ OLL,‏ PLL.';

  @override
  String get stepCfopOverview => 'ארבעה שלבים';

  @override
  String get stepCfopOverviewBody =>
      'קוביסטים מהירים פותרים צלב, מצמידים כל פינה של השכבה הראשונה לצלע האמצע שלה (F2L), מכוונים את השכבה האחרונה (OLL) ולבסוף מסדרים אותה (PLL).';

  @override
  String get stepCfopCross => 'מתכננים את הצלב';

  @override
  String get stepCfopCrossBody =>
      'ב־CFOP מתכננים את הצלב בזמן הבחינה ובונים אותו בתחתית בכשמונה מהלכים.';

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
      'OLL בשני מבטים מתחיל באלגוריתם של הצלב הצהוב שכבר מכירים.';

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
}
