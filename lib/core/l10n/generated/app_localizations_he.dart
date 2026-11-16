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
  String get languageEnglish => 'English';

  @override
  String get languageHebrew => 'עברית';

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
  String get scanTapToRescan => 'הקישו על פאה שנסרקה כדי לסרוק אותה שוב.';

  @override
  String get scanTooDark => 'חשוך מדי: עברו למקום מואר יותר.';

  @override
  String get scanGlare => 'יש סנוור: הטו את הקובייה הרחק מהאור.';

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
}
