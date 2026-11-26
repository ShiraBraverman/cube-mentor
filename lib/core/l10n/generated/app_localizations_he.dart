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
  String get solveModeGuided => 'מודרך (3 שכבות)';

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
  String get phaseLblCross => 'צלב לבן מותאם למרכזים';

  @override
  String get phaseLblCorners => 'פינות השכבה הראשונה';

  @override
  String get phaseLblMiddle => 'השלמת השכבה האמצעית';

  @override
  String get phaseLblYellowCross => 'צלב צהוב';

  @override
  String get phaseLblYellowEdges => 'התאמת קצוות הצלב הצהוב';

  @override
  String get phaseLblYellowCorners => 'מיקום הפינות למקומן';

  @override
  String get phaseLblYellowCornersOrient => 'סיבוב הפינות לצבעים הנכונים';

  @override
  String get crownFirst => 'השכבה הראשונה';

  @override
  String get crownSecond => 'השכבה השנייה';

  @override
  String get crownThird => 'השכבה השלישית';

  @override
  String get crownFirstGoal => 'הפאה הלבנה והשכבה הראשונה';

  @override
  String get crownSecondGoal => 'השכבה האמצעית';

  @override
  String get crownThirdGoal => 'הפאה הצהובה והשכבה האחרונה';

  @override
  String get subStepGoal11 =>
      'בונים צלב לבן שבו כל קצה לבן מתאים גם לצבע המרכז שלידו.';

  @override
  String get subStepGoal12 =>
      'מכניסים את 4 הפינות הלבנות למקומות התואמים שלהן ומסיימים את הפאה הלבנה ואת כל השכבה הראשונה.';

  @override
  String get subStepGoal21 =>
      'מכניסים את 4 הקצוות של השכבה האמצעית בלי לפרק את השכבה הראשונה.';

  @override
  String get subStepGoal31 => 'בונים צלב צהוב בשכבה האחרונה.';

  @override
  String get subStepGoal32 =>
      'מחליפים את קצוות הצלב הצהוב עד שכל אחד מתאים למרכז הצד שלו.';

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
      'מכוונים את כל החלקים ואוספים את קצוות השכבה האמצעית אל השכבה האמצעית.';

  @override
  String get explainKociemba2 =>
      'מסיימים רק עם ⁦U⁩, ⁦D⁩ וחצאי סיבובים, ששומרים על הכיוון.';

  @override
  String get explainLblOrient =>
      'סובבו את כל הקובייה כך שהמרכז הלבן יפנה למטה.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'הורידו את הקצה $piece אל ליד המרכז הלבן, כשהצבע בצד תואם למרכז.';
  }

  @override
  String explainLblDaisyPetal(String piece) {
    return 'חרצית: העלו את הקצה $piece סביב המרכז הצהוב, כשהלבן פונה למעלה – עוד עלה כותרת.';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return 'סובבו את השכבה העליונה עד שעלה הכותרת $piece יעמוד בדיוק מעל המרכז בצבע הצד שלו.';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return 'סובבו את הפאה הזו פעמיים (180 מעלות) כדי להוריד את הקצה $piece אל המרכז הלבן – עוד זרוע של הצלב הלבן.';
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
    return 'הקצה $piece בשכבה האמצעית אבל לא במקום. הוציאו אותו למעלה.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'סובבו את השכבה העליונה כך שצבע הצד של הקצה $piece יתאים למרכז.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'הכניסו את הקצה $piece ימינה: ⁦U R U\' R\' U\' F\' U F⁩.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'הכניסו את הקצה $piece שמאלה: ⁦U\' L\' U L U F U\' F\'⁩.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'סובבו את השכבה העליונה כדי למקם את הצורה הצהובה לאלגוריתם הבא.';

  @override
  String get explainLblYellowCrossAlg =>
      'בנו את הצלב הצהוב עם ⁦F R U R\' U\' F\'⁩.';

  @override
  String get explainLblYellowEdgesAlign =>
      'סובבו את השכבה העליונה כדי ליישר את הקצוות הצהובים מול המרכזים.';

  @override
  String get explainLblYellowEdgesAlg =>
      'החליפו קצוות צהובים עם ⁦R U R\' U R U2 R\' U⁩.';

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
  String get trackBeginner => '3×3 למתחילים: שכבה אחרי שכבה';

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
  String get phaseReductionEdges => 'הצמדת קצוות';

  @override
  String get phaseReductionEdgeParity => 'פריטי קצוות';

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
    return 'מצמידים את חלקי הקצה $piece במחזור של שלושה; המרכזים נשארים פתורים.';
  }

  @override
  String get explainReductionEdgeParity =>
      'את הקצוות האחרונים אי אפשר להצמיד רק במחזורים של שלושה (פריטי קצוות). סיבוב אחד של פרוסה פנימית פותר את זה.';

  @override
  String get explainReductionOllParity =>
      'פריטי OLL: קצה אחד הפוך – דבר שלא קורה ב־3×3. האלגוריתם הזה הופך אותו בחזרה.';

  @override
  String get explainReductionPllParity =>
      'פריטי PLL: שני קצוות מוחלפים – דבר בלתי אפשרי ב־3×3. האלגוריתם הזה מחליף אותם בחזרה.';

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
      'המרכזים אף פעם לא זזים, והם קובעים את צבע הפאה. לקצוות יש שני צבעים ולפינות שלושה. לפתור פירושו להביא כל קצה וכל פינה אל המרכזים התואמים.';

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
      'החזיקו צהוב למעלה וירוק מולכם. קודם אוספים את ארבעת הקצוות הלבנים סביב המרכז הצהוב, הלבן כלפי מעלה, כמו עלי כותרת: זו החרצית. אחר כך כל עלה יורד אל המרכז הלבן, וצבע הצד שלו תואם את המרכז שלידו.';

  @override
  String get stepCrossTop => 'קצה למעלה';

  @override
  String get stepCrossTopBody =>
      'קצה לבן למעלה שהלבן שלו פונה למעלה הוא עלה כותרת של החרצית. סובבו את השורה העליונה עד שצבע הצד שלו בדיוק מעל המרכז באותו צבע, ואז סובבו את הפאה הזו פעמיים (180 מעלות) כדי להוריד אותו אל המרכז הלבן.';

  @override
  String get stepCrossMiddle => 'קצה בשכבה האמצעית';

  @override
  String get stepCrossMiddleBody =>
      'קצה שתקוע בשכבה האמצעית עולה קודם: מעלים את הצד שלו, מזיזים את השורה העליונה מהדרך ומחזירים את הצד, כך שחלקים שכבר במקום נשארים. עכשיו הוא עלה כותרת למעלה: מיישרים ומסובבים את הפאה פעמיים.';

  @override
  String get stepCornersInsert => 'מעל המקום שלה';

  @override
  String get stepCornersInsertBody =>
      'סובבו את השורה העליונה עד שהפינה הלבנה בדיוק מעל המקום שלה, בין שני המרכזים שתואמים את צבעי הצד שלה. כאן מספיקים סיבוב אחד למעלה ו־⁦R U\' R\'⁩: ⁦U⁩ מביא את הפינה מעל המקום ו־⁦R U\' R\'⁩ מכניס אותה, הלבן כלפי מטה.';

  @override
  String get stepCornersRepeat => 'חוזרים על הטריגר';

  @override
  String get stepCornersRepeatBody =>
      'החזיקו את המקום קדימה מימין וחזרו על ⁦R U R\' U\'⁩ עד שהלבן פונה למטה: פעם אחת אם הלבן פונה ימינה, שלוש אם הוא פונה למעלה, חמש אם הוא פונה אליכם. בינתיים החלק העליון נראה מבולגן; הוא מסתדר לבד.';

  @override
  String get stepMiddleRight => 'קצה ימינה';

  @override
  String get stepMiddleRightBody =>
      'מצאו קצה עליון בלי צהוב. סובבו את השורה העליונה עד שהצבע הקדמי שלו תואם את המרכז שמולכם. אם הצבע העליון שלו תואם את המרכז הימני, שלחו אותו ימינה: ⁦U R U\' R\' U\' F\' U F⁩.';

  @override
  String get stepMiddleLeft => 'קצה שמאלה';

  @override
  String get stepMiddleLeftBody =>
      'אם הצבע העליון שלו תואם דווקא את המרכז השמאלי, השתמשו בתמונת המראה: ⁦U\' L\' U L U F U\' F\'⁩. השכבה הלבנה חוזרת שלמה בכל פעם.';

  @override
  String get stepYellowCross => 'אלגוריתם אחד';

  @override
  String get stepYellowCrossBody =>
      'הסתכלו רק על הקצוות הצהובים למעלה. החזיקו L מאחור משמאל וקו משמאל לימין, ואז בצעו ⁦F R U R\' U\' F\'⁩. קו צריך פעם אחת, L פעמיים, נקודה עד שלוש פעמים.';

  @override
  String get stepYellowEdges => 'מתאימים את הקצוות';

  @override
  String get stepYellowEdgesBody =>
      'סובבו את השורה העליונה עד ששני קצוות תואמים את מרכזי הצד שלהם. כשאחד מאחור ואחד מימין, ⁦R U R\' U R U2 R\' U⁩ מחליף את הקצה הקדמי והשמאלי.';

  @override
  String get stepPlaceCorners => 'ממקמים';

  @override
  String get stepPlaceCornersBody =>
      'פינה נמצאת בבית כשהצבעים שלה תואמים את שלושת המרכזים סביבה, גם אם היא מסובבת. החזיקו פינה שבבית קדימה מימין: ⁦U R U\' L\' U R\' U\' L⁩ מזיז את שלוש האחרות במעגל. חזרו עד שכל הארבע בבית.';

  @override
  String get stepTwistCorners => 'מסובבים';

  @override
  String get stepTwistCornersBody =>
      'כשפינה לא פתורה קדימה מימין, חזרו על ⁦R\' D\' R D⁩ בזוגות עד שהצהוב למעלה, ואז סובבו רק את השכבה העליונה כדי להביא את הבאה. התחתית נראית שבורה עד הפינה האחרונה: המשיכו.';

  @override
  String get lessonCfopIntro => 'מה זה CFOP?';

  @override
  String get lessonCfopIntroDesc => 'פלוס, F2L,‏ OLL,‏ PLL.';

  @override
  String get stepCfopOverview => 'ארבעה שלבים';

  @override
  String get stepCfopOverviewBody =>
      'ספידקיוברים פותרים צלב, מצמידים כל פינה של השכבה הראשונה לקצה האמצעי שלה (F2L), מכוונים את השכבה האחרונה (OLL) ולבסוף ממקמים אותה (PLL).';

  @override
  String get stepCfopCross => 'מתכננים את הפלוס';

  @override
  String get stepCfopCrossBody =>
      'ב־CFOP מתכננים את הפלוס בזמן הבחינה ובונים אותו בתחתית בכשמונה מהלכים.';

  @override
  String get lessonF2l => 'יסודות F2L';

  @override
  String get lessonF2lDesc => 'מצמידים פינה לקצה שלה.';

  @override
  String get stepF2lRight => 'מכניסים זוג';

  @override
  String get stepF2lRightBody =>
      'כשפינה והקצה שלה צמודים למעלה, הביאו אותם מעל המקום שלהם והכניסו יחד.';

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
  String get stepOllCross => 'קודם הקצוות';

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
      'ה־⁦T-perm⁩ מחליף שתי פינות ושני קצוות. משתמשים בו כדי למקם פינות: החזיקו את שתי הפינות שצריך להחליף בצד ימין, והפנסים משמאל.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'כשהפינות מסודרות, ה־⁦U-perm⁩ מסובב שלושה קצוות. השאירו את הצד הגמור מאחור.';

  @override
  String get lessonTwoFirst => 'השכבה הראשונה ב־2×2';

  @override
  String get lessonTwoFirstDesc => 'בונים צד אחד עם פינות תואמות.';

  @override
  String get stepTwoIntro => 'רק פינות';

  @override
  String get stepTwoIntroBody =>
      '‏2×2 הוא רק שמונה פינות: בלי קצוות ובלי מרכזים. בונים את השכבה הלבנה למטה כך שצבעי הצד של שכנות תואמים, ואז מסיימים במסלול אחד: Sune לפאה עליונה צהובה, ואז ⁦T-perm⁩ או ⁦Y-perm⁩.';

  @override
  String get stepTwoCorner => 'מכניסים פינות';

  @override
  String get stepTwoCornerBody =>
      'כמו הפינות הלבנות ב־3×3: מביאים פינה מעל המקום הריק שלה קדימה מימין ומכניסים אותה, כאן עם ⁦U R U\' R\'⁩ או בחזרה על ⁦R U R\' U\'⁩ עד שהלבן למטה. בדקו את צבעי הצד שלה מול השכנה.';

  @override
  String get lessonTwoOll => 'מכוונים את הפאה העליונה';

  @override
  String get lessonTwoOllDesc => 'OLL של אורטגה עם סון.';

  @override
  String get stepTwoSune => 'שוב סון';

  @override
  String get stepTwoSuneBody =>
      'ספרו כמה מדבקות צהובות פונות למעלה. החזיקו את הפינה היחידה עם צהוב למעלה קדימה משמאל ובצעו Sune ‏(⁦R U R\' U R U2 R\'⁩). ספרו שוב והחזיקו מחדש; לכל היותר שלושה Sune. ביניהם מסובבים רק את השכבה העליונה.';

  @override
  String get lessonTwoPbl => 'מסדרים את שתי השכבות';

  @override
  String get lessonTwoPblDesc => 'מחליפים פינות כדי לסיים.';

  @override
  String get stepTwoAdjacent => 'החלפה סמוכה';

  @override
  String get stepTwoAdjacentBody =>
      'פנסים הם שתי מדבקות עליונות זהות בצד אחד. סובבו את השורה העליונה עד שהפנסים משמאל, כך ששתי הפינות להחלפה מימין, ובצעו ⁦T-perm⁩.';

  @override
  String get stepTwoDiagonal => 'החלפה אלכסונית';

  @override
  String get stepTwoDiagonalBody =>
      'אין פנסים בשום צד? שתי פינות אלכסוניות צריכות להתחלף: בצעו ⁦Y-perm⁩ מכל צד, ואז סובבו את השכבה העליונה כדי ליישר הכול.';

  @override
  String get lessonBigIntro => 'החלקים בקובייה גדולה';

  @override
  String get lessonBigIntroDesc => 'מרכזים, כנפיים ופרוסות.';

  @override
  String get stepBigPieces => 'אין מרכזים קבועים';

  @override
  String get stepBigPiecesBody =>
      'ב־4×4 לכל פאה יש ארבעה חלקי מרכז שזזים, וכל קצה הוא שתי כנפיים. אין מרכז קבוע, אז בדקו את סדר הצבעים לפי פינה: לבן מול צהוב, כחול מול ירוק, אדום מול כתום.';

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
      'הקומוטטור הזה מזיז בדיוק שלושה חלקי מרכז ומשאיר את כל השאר, כך שמרכזים גמורים נשארים גמורים. השתמשו בו כשחלק תועה אחד לא מצטרף לפס.';

  @override
  String get lessonBigEdges => 'מצמידים קצוות';

  @override
  String get lessonBigEdgesDesc => 'מחברים כנפיים לקצוות שלמים.';

  @override
  String get stepBigEdgePair => 'מצמידים ומחזירים';

  @override
  String get stepBigEdgePairBody =>
      '⁦Uw\'⁩ מיישר שתי כנפיים תואמות, ⁦R U R\' F R\' F\' R⁩ מכניס קצה לא מוצמד, ו־⁦Uw⁩ מחזיר את המרכזים. תמיד סוגרים פרוסה שפתחתם.';

  @override
  String get lessonBigParity => 'פריטי';

  @override
  String get lessonBigParityDesc => 'פריטי OLL ו־PLL בקוביות זוגיות.';

  @override
  String get stepBigOllParity => 'פריטי OLL';

  @override
  String get stepBigOllParityBody =>
      'קצה הפוך יחיד לא יכול לקרות ב־3×3: זה פריטי OLL, לא טעות. השאירו אותו בחזית השכבה העליונה ובצעו את האלגוריתם הארוך. הוא גם מחליף את הקצוות העליונים משמאל ומימין ושתי פינות; שלבי ה־3×3 האחרונים מתקנים אותם.';

  @override
  String get stepBigPllParity => 'פריטי PLL';

  @override
  String get stepBigPllParityBody =>
      'שני קצוות מוחלפים ממש בסוף, ואף אלגוריתם של 3×3 לא מתאים? זה פריטי PLL. החזיקו אותם בחזית ומאחור בשכבה העליונה: ⁦2R2 U2 2R2 Uw2 2R2 2U2⁩ מחליף ביניהם.';

  @override
  String get introGoalHeading => 'מה המטרה?';

  @override
  String get introHowHeading => 'איך עושים את זה?';

  @override
  String get introHoldHeading => 'איך מחזיקים';

  @override
  String get introWhyHeading => 'למה זה עובד';

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
      'בונים צלב לבן למטה שבו כל קצה לבן מתאים גם לצבע המרכז שלידו.';

  @override
  String get introGoalCorners =>
      'משלימים את ארבע הפינות הלבנות כך שכל השכבה הראשונה גמורה: פאה לבנה עם צבעי צד תואמים.';

  @override
  String get introGoalMiddle =>
      'מציבים את ארבעת הקצוות של השכבה האמצעית, וכך שתי השכבות הראשונות פתורות.';

  @override
  String get introGoalYellowCross =>
      'בונים צלב צהוב למעלה; צבעי הצדדים עוד לא חייבים להתאים.';

  @override
  String get introGoalYellowEdges =>
      'מתאימים כל קצה של הצלב הצהוב לצבע המרכז שבצד שלו.';

  @override
  String get introGoalYellowCorners =>
      'מעבירים כל פינה צהובה למקום שלה, גם אם היא עדיין מסובבת.';

  @override
  String get introGoalTwistCorners =>
      'מסובבים את הפינות הצהובות לצבעים הנכונים, וכל הקובייה פתורה.';

  @override
  String get introGoalCfopIntro =>
      'מכירים את התוכנית של הספידקיובינג: צלב, שתי שכבות ראשונות, ואז השכבה האחרונה בשני מבטים.';

  @override
  String get introGoalF2l =>
      'מכניסים כל פינה לבנה יחד עם הקצה האמצעי שלה, ומסיימים שתי שכבות בבת אחת.';

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
      'מחזירים את הפינות האחרונות הביתה עם ⁦T-perm⁩ או ⁦Y-perm⁩ אחד, ומיישרים את השכבה העליונה כדי לפתור את ה־2×2.';

  @override
  String get introGoalBigIntro =>
      'מכירים את ה־4×4: מרכזים, זוגות קצוות ופינות, והמהלכים שמסובבים אותם.';

  @override
  String get introGoalBigCenters =>
      'אוספים את חלקי המרכז של כל פאה לגוש אחד בצבע אחיד.';

  @override
  String get introGoalBigEdges =>
      'מצמידים חלקי קצה תואמים, כך שכל קצה נראה כמו קצה אחד של 3×3.';

  @override
  String get introGoalBigParity =>
      'מתקנים את שני המקרים של 4×4 שאין ב־3×3: קצה הפוך אחד (פריטי OLL) או שני קצוות מוחלפים (פריטי PLL).';

  @override
  String get introHowBasics =>
      'המרכזים לא זזים, ולכן הם קובעים את צבע כל פאה.\nכל אות מסובבת פאה אחת רבע סיבוב עם כיוון השעון.\nגרש (\') מסובב בחזרה, ו־2 מסובב פעמיים.';

  @override
  String get introHoldBasics =>
      'איך שנוח: המרכזים לא זזים, אז הצבעים תמיד אומרים איזו פאה היא איזו.';

  @override
  String get introWhyBasics =>
      'כל אלגוריתם הוא פשוט האותיות האלה ברצף, אז לקרוא אותן זו המיומנות הראשונה.';

  @override
  String get introHowCross =>
      'מעלים כל קצה לבן למעלה, הלבן כלפי מעלה, סביב המרכז הצהוב: זו החרצית.\nמסובבים את השורה העליונה עד שצבע הצד של עלה הכותרת נמצא מעל המרכז התואם.\nמסובבים את הפאה הזו פעמיים כדי להוריד אותו; חוזרים על זה לכל הארבעה.';

  @override
  String get introHoldCross =>
      'המרכז הצהוב למעלה והמרכז הלבן למטה לאורך כל השלב. מסובבים את השורה העליונה, לא את הקובייה, כדי ליישר עלה כותרת.';

  @override
  String get introWhyCross =>
      'כשהלבן פונה למעלה, שני סיבובים של הפאה הקדמית מנחיתים את הקצה על המרכז הלבן, הלבן כלפי מטה וצבע הצד כבר תואם.';

  @override
  String get introHowCorners =>
      'מסובבים את השורה העליונה עד שפינה לבנה נמצאת מעל המקום הריק שלה, במקום הקדמי־ימני.\nחוזרים על ⁦R U R\' U\'⁩: פעם אחת אם הלבן פונה ימינה, שלוש אם הוא פונה למעלה, חמש אם הוא פונה אליכם.\nעושים אותו דבר לשלוש הפינות האחרות.';

  @override
  String get introHoldCorners =>
      'לבן למטה, צהוב למעלה. הפינה נמצאת קדימה מימין, בדיוק מעל המקום שלה.';

  @override
  String get introWhyCorners =>
      '⁦R U R\' U\'⁩ מרים את המקום ומחזיר אותו: כל סיבוב מסובב מעט את הפינה עד שהלבן פונה למטה, והצלב אף פעם לא מתפרק.';

  @override
  String get introHowMiddle =>
      'מוצאים קצה עליון בלי צהוב ומתאימים את הצבע הקדמי שלו למרכז שמתחתיו.\nהצבע העליון שלו אומר לאן הוא הולך: ימינה או שמאלה.\nשולחים אותו בהכנסה של 8 מהלכים; השכבה הלבנה חוזרת שלמה בכל פעם.';

  @override
  String get introHoldMiddle =>
      'לבן למטה, צהוב למעלה. הקצה נמצא בחזית, והצבע הקדמי שלו תואם את המרכז שמתחתיו.';

  @override
  String get introWhyMiddle =>
      'ההכנסה מרימה את המקום מהדרך, מחליקה פנימה את הקצה ומחזירה את השכבה הלבנה. קצה עם צהוב שייך למעלה, אף פעם לא לאמצע.';

  @override
  String get introHowYellowCross =>
      'מסתכלים רק על הקצוות הצהובים למעלה: נקודה, L או קו.\nמחזיקים את ה־L מאחור משמאל ואת הקו משמאל לימין, ומבצעים ⁦F R U R\' U\' F\'⁩.\nקו צריך פעם אחת, L פעמיים, נקודה עד שלוש פעמים.';

  @override
  String get introHoldYellowCross =>
      'לבן למטה, צהוב למעלה. L מאחור משמאל, קו משמאל לימין; נקודה בכל כיוון.';

  @override
  String get introWhyYellowCross =>
      '⁦F R U R\' U\' F\'⁩ הופך שני קצוות עליונים בכל פעם בלי לגעת בשתי השכבות הראשונות.';

  @override
  String get introHowYellowEdges =>
      'מסובבים את השורה העליונה עד ששני קצוות מתאימים למרכזי הצד שלהם.\nמחזיקים אותם מאחור ומימין, ומבצעים ⁦R U R\' U R U2 R\' U⁩.\nאם הקצוות התואמים זה מול זה, מבצעים פעם אחת מכל צד קודם.';

  @override
  String get introHoldYellowEdges =>
      'צהוב למעלה. קצה תואם אחד מאחור והשני מימין.';

  @override
  String get introWhyYellowEdges =>
      'האלגוריתם הזה מזיז רק חלקים עליונים, ולכן שתי השכבות הראשונות תמיד חוזרות.';

  @override
  String get introHowYellowCorners =>
      'פינה נמצאת בבית כשהצבעים שלה מתאימים לשלושת המרכזים סביבה, גם אם היא מסובבת.\nמשאירים פינה שבבית במקום הקדמי־ימני.\n⁦U R U\' L\' U R\' U\' L⁩ מסובב את שלוש האחרות במעגל; חוזרים עד שכל הארבע מתאימות.';

  @override
  String get introHoldYellowCorners =>
      'צהוב למעלה. פינה שכבר בבית קדימה מימין; אם אין כזו, כל פינה.';

  @override
  String get introWhyYellowCorners =>
      'הוא מזיז שלוש פינות במעגל ומשאיר במקום את זו שקדימה מימין, כך שכל חזרה מביאה עוד פינות הביתה.';

  @override
  String get introHowTwistCorners =>
      'מחזיקים פינה לא פתורה במקום הקדמי־ימני.\nחוזרים על ⁦R\' D\' R D⁩ בזוגות עד שהצהוב שלה פונה למעלה.\nמסובבים רק את השכבה העליונה לפינה הבאה; התחתית חוזרת עם הפינה האחרונה.';

  @override
  String get introHoldTwistCorners =>
      'צהוב למעלה, הפינה לסיבוב קדימה מימין. בין פינות מסובבים רק את השכבה העליונה, אף פעם לא את כל הקובייה.';

  @override
  String get introWhyTwistCorners =>
      '⁦R\' D\' R D⁩ מסובב את הפינה ומבלגן את התחתית, אבל התחתית חוזרת ברגע שכל הפינות מסובבות. עצירה באמצע משאירה אותה שבורה.';

  @override
  String get introHowCfopIntro =>
      'צלב: ארבעה קצוות שמתכננים בזמן הבדיקה.\nF2L: כל פינה נכנסת יחד עם הקצה שלה.\nOLL צובע את הפאה העליונה בצהוב, ואז PLL מחזיר את החלקים למקום.';

  @override
  String get introHoldCfopIntro =>
      'ספידקיוברים בונים את הצלב למטה, כדי לראות מראש את החלקים הבאים בזמן שהם מסובבים.';

  @override
  String get introWhyCfopIntro =>
      'פתרון פינה והקצה שלה יחד חוסך הרבה מהלכים, וזיהוי מקרים מחליף ניסוי וטעייה.';

  @override
  String get introHowF2l =>
      'מוצאים פינה ואת הקצה המתאים לה בשכבה העליונה.\nמחברים אותם לזוג מעל המקום שלהם.\nמורידים את הזוג פנימה בשלושה–ארבעה מהלכים.';

  @override
  String get introHoldF2l =>
      'הצלב למטה. המקום של הזוג קדימה מימין, או קדימה משמאל בתמונת המראה.';

  @override
  String get introWhyF2l =>
      'פינה וקצה מוצמדים נכנסים יחד, כך ששתי שכבות גדלות בבת אחת במקום חלק אחד בכל פעם.';

  @override
  String get introHowOll =>
      'קודם הצלב הצהוב עם ⁦F R U R\' U\' F\'⁩.\nאחר כך מסובבים את הפינות, למשל עם Sune.\nמזהים את המקרה לפי הצהוב שרואים.';

  @override
  String get introHoldOll =>
      'צהוב למעלה. ב־Sune, הפינה היחידה שהצהוב שלה למעלה הולכת קדימה משמאל.';

  @override
  String get introWhyOll =>
      'פיצול השכבה האחרונה לכיוון ואז למיקום שומר על מספר קטן של אלגוריתמים.';

  @override
  String get introHowPll =>
      'הפאה העליונה כבר כולה צהובה.\n⁦T-perm⁩ מחליף פינות; ⁦U-perm⁩ מסובב שלושה קצוות.\nקוראים את צבעי הצדדים כדי לבחור אלגוריתם.';

  @override
  String get introHoldPll =>
      'צהוב למעלה. ⁦T-perm⁩: הפנסים משמאל. ⁦U-perm⁩: הצד הגמור מאחור.';

  @override
  String get introWhyPll =>
      'כשהפאה העליונה כולה צהובה, רק המקומות של החלקים לא נכונים, וכמה החלפות מסיימות את הקובייה.';

  @override
  String get introHowTwoFirst =>
      'בוחרים פינה לבנה כעוגן, הלבן כלפי מטה.\nמביאים כל פינה נוספת מעל המקום שלה, קדימה מימין.\nחוזרים על ⁦R U R\' U\'⁩ עד שהיא נכנסת עם צבעי צד תואמים.';

  @override
  String get introHoldTwoFirst =>
      'לבן למטה. המקום הריק קדימה מימין, והפינה שלו בדיוק מעליו בשכבה העליונה.';

  @override
  String get introWhyTwoFirst =>
      'ב־2×2 אין מרכזים: הפינה הראשונה שמניחים קובעת את צבעי השכנות שלה, ולכן צבעי הצד חשובים, לא רק הלבן.';

  @override
  String get introHowTwoOll =>
      'סופרים כמה פינות מראות צהוב למעלה.\nכשיש אחת, מחזיקים אותה קדימה משמאל ומבצעים Sune: ⁦R U R\' U R U2 R\'⁩.\nסופרים שוב וחוזרים; לכל היותר שלושה Sune.';

  @override
  String get introHoldTwoOll =>
      'לבן למטה, צהוב למעלה. לפני כל Sune, הפינה שהצהוב שלה למעלה קדימה משמאל.';

  @override
  String get introWhyTwoOll =>
      'Sune מסובב את הפינות העליונות בלי לשבור את השכבה הלבנה; ספירה מחדש בכל פעם אומרת איך להחזיק בפעם הבאה.';

  @override
  String get introHowTwoPbl =>
      'מחפשים פנסים: שתי מדבקות עליונות זהות בצד אחד.\nפנסים בצד אחד: מחזיקים אותם משמאל ומבצעים ⁦T-perm⁩.\nאין פנסים: מבצעים ⁦Y-perm⁩ מכל צד, ואז מיישרים את השכבה העליונה.';

  @override
  String get introHoldTwoPbl =>
      'לבן למטה, צהוב למעלה. ⁦T-perm⁩: הפנסים משמאל. ⁦Y-perm⁩: כל צד מולכם.';

  @override
  String get introWhyTwoPbl =>
      'כשהחלק העליון צהוב, רק המקומות של הפינות לא נכונים: ⁦T-perm⁩ מחליף שתי שכנות, ⁦Y-perm⁩ שתי אלכסוניות.';

  @override
  String get introHowBigIntro =>
      'אין מרכז קבוע: ארבעה חלקי מרכז יוצרים את צבע הפאה.\nמהלכים רחבים כמו ⁦Rw⁩ מסובבים שתי שכבות יחד.\nמהלכים פנימיים כמו ⁦2R⁩ מסובבים רק פרוסה פנימית אחת.';

  @override
  String get introHoldBigIntro =>
      'בהתחלה איך שנוח: ב־4×4 אין מרכז קבוע, אז אתם בוחרים איפה כל צבע.';

  @override
  String get introWhyBigIntro =>
      'הצמצום מקבץ מרכזים וחלקי קצה, כך שאפשר לפתור את הקובייה הגדולה כמו 3×3.';

  @override
  String get introHowBigCenters =>
      'קודם בודקים את סדר הצבעים לפי פינה.\nבונים שני מרכזים נגדיים, ואז את ארבעת האחרים.\nפרוסות פנימיות מזיזות חלקי מרכז; תמיד מחזירים פרוסה שפתחתם.';

  @override
  String get introHoldBigCenters =>
      'הפאה שבונים בחזית, והמרכזים הגמורים מחוץ לדרך, משמאל ומימין.';

  @override
  String get introWhyBigCenters =>
      'פרוסה מזיזה מרכזים, וביטול שלה מחזיר את הגמורים, כך שרק החלק שכיוונתם אליו משתנה.';

  @override
  String get introHowBigEdges =>
      'מוצאים את שתי הכנפיים עם אותם שני צבעים.\nמיישרים אותן בחזית ומחברים אותן עם ⁦Uw\'⁩.\nמכניסים קצה לא מוצמד, ואז ⁦Uw⁩ מחזיר את המרכזים.';

  @override
  String get introHoldBigEdges =>
      'הקצה שמצמידים בשכבות הקדמיות; קצוות גמורים חונים בשכבה העליונה ובתחתונה.';

  @override
  String get introWhyBigEdges =>
      '⁦Uw\'⁩ מזיז את המרכזים הצידה כדי ששתי כנפיים ייפגשו; ⁦Uw⁩ מחזיר את המרכזים ושומר על העבודה שלכם.';

  @override
  String get introHowBigParity =>
      'פותרים את ה־4×4 כמו 3×3 עד שנתקעים.\nקצה הפוך אחד: אלגוריתם פריטי ה־OLL הארוך.\nשני קצוות מוחלפים: ⁦2R2 U2 2R2 Uw2 2R2 2U2⁩.';

  @override
  String get introHoldBigParity =>
      'השכבה האחרונה למעלה. פריטי OLL: הקצה ההפוך בחזית. פריטי PLL: הקצוות המוחלפים בחזית ומאחור.';

  @override
  String get introWhyBigParity =>
      'כנפיים יכולות להגיע למצבים ש־3×3 לא מגיע אליהם; האלגוריתמים האלה מסובבים שכבות פנימיות כדי לבטל בדיוק את זה.';

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
  String get stageEdges => 'הצמדת קצוות חיצוניים ופנימיים';

  @override
  String get stageParity => 'פתרון זוגיות';

  @override
  String get stageCrown1 => 'השכבה הראשונה (לבנה)';

  @override
  String get stageCrown2 => 'השכבה השנייה';

  @override
  String get stageCrown3 => 'השכבה השלישית (צהובה)';

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
  String get solveAllStagesDone => 'כל השלבים הושלמו. כל הכבוד!';

  @override
  String get trackFiveByFive => '5×5 קוביית הפרופסור';

  @override
  String get trackSixBySix => 'קובייה 6×6';

  @override
  String get lessonFiveIntro => 'הכירו את ה־5×5';

  @override
  String get lessonFiveIntroDesc =>
      'מרכזים קבועים, פסי מרכז, קצוות אמצעיים וכנפיים.';

  @override
  String get introGoalFiveIntro =>
      'מכירים את ה־5×5: מרכזים קבועים, פסי מרכז, קצוות אמצעיים וכנפיים.';

  @override
  String get introHowFiveIntro =>
      'החלק האמצעי בכל פאה לא זז אף פעם.\nכל קצה הוא חלק אמצעי ושתי כנפיים.\nפרוסות פנימיות מזיזות חלקים בלי לגעת בחוץ.';

  @override
  String get introHoldFiveIntro =>
      'איך שנוח: ב־5×5 האמצע של כל פאה לא זז, אז הוא מראה את צבע הפאה.';

  @override
  String get introWhyFiveIntro =>
      'האמצעים הקבועים קובעים את סכמת הצבעים, ולכן אי אפשר לבנות את המרכזים בסדר הלא נכון.';

  @override
  String get lessonFiveCenters => 'מרכזי ה־5×5';

  @override
  String get lessonFiveCentersDesc => 'בונים כל מרכז משלושה פסים של שלושה.';

  @override
  String get introGoalFiveCenters => 'בונים בכל פאה גוש מרכז של 3×3 בצבע אחד.';

  @override
  String get introHowFiveCenters =>
      'מתחילים מחלק האמצע הקבוע: הוא קובע את הצבע.\nבונים פסים של שלושה ומחליקים אותם פנימה בפרוסה פנימית.\nהמהלך שמכניס פס גם מחזיר את המרכז הגמור.';

  @override
  String get introHoldFiveCenters =>
      'המרכז שבונים בחזית או למעלה; מרכזים גמורים למטה, משמאל או מימין, מחוץ לדרך.';

  @override
  String get introWhyFiveCenters =>
      'פרוסה פנימה, סיבוב למעלה, פרוסה חזרה: הפרוסה שמכניסה את הפס גם מחזירה את המרכזים הגמורים.';

  @override
  String get lessonFiveEdges => 'קצוות ה־5×5';

  @override
  String get lessonFiveEdgesDesc => 'מחברים שתי כנפיים לקצה האמצעי שלהן.';

  @override
  String get introGoalFiveEdges =>
      'מחברים כל קצה אמצעי לשתי הכנפיים שלו, כך שכל 12 הקצוות נראים כחלק אחד.';

  @override
  String get introHowFiveEdges =>
      'מתאימים כל כנף לקצה האמצעי שלה בחזית.\nמסובבים את השכבה הפנימית, מכניסים קצה לא פתור ומחזירים אותה.\nלקצוות האחרונים: פרוסה, היפוך, פרוסה.';

  @override
  String get introHoldFiveEdges =>
      'הקצה שבונים בחזית; קצוות גמורים שמורים בשכבה העליונה ובתחתונה.';

  @override
  String get introWhyFiveEdges =>
      'פתיחה וסגירה של הפרוסה הפנימית מחברות כנפיים, והמרכזים והקצוות השמורים חוזרים.';

  @override
  String get lessonFiveSolve => 'פותרים את ה־5×5 כמו 3×3';

  @override
  String get lessonFiveSolveDesc => 'מסיימים שכבה אחרי שכבה, כמו ב־3×3.';

  @override
  String get introGoalFiveSolve =>
      'פותרים את ה־5×5 המצומצם כמו 3×3, שכבה אחרי שכבה, רק בסיבובים חיצוניים.';

  @override
  String get introHowFiveSolve =>
      'מעכשיו רק סיבובים חיצוניים, אחרת הקצוות המוצמדים מתפרקים.\nצלב ופינות לבנים, השכבה האמצעית, ואז השכבה הצהובה.\nחלקי האמצע הקבועים מראים את צבע כל פאה.';

  @override
  String get introHoldFiveSolve =>
      'צבע השכבה הראשונה למטה, בדיוק כמו ב־3×3; הפינה להכנסה קדימה מימין.';

  @override
  String get introWhyFiveSolve =>
      'סיבובים פנימיים היו מפרקים שוב מרכזים וקצוות; סיבובים חיצוניים מתייחסים לכל גוש כחלק אחד של 3×3.';

  @override
  String get lessonFiveParity => 'פריטי קצוות ב־5×5';

  @override
  String get lessonFiveParityDesc => 'מתקנים קצה שהכנפיים שלו מוחלפות.';

  @override
  String get introGoalFiveParity =>
      'מתקנים את הקצה היחיד ששתי הכנפיים החיצוניות שלו מוחלפות: הפריטי היחיד שיש ב־5×5.';

  @override
  String get introHowFiveParity =>
      'זה נראה כמו קצה אחרון אחד שנראה הפוך.\nמבצעים פעם אחת את התיקון הארוך בפרוסות פנימיות.\nב־5×5 אין פריטי PLL.';

  @override
  String get introHoldFiveParity =>
      'השכבה האחרונה למעלה, והקצה עם הכנפיים המוחלפות בחזית השכבה העליונה.';

  @override
  String get introWhyFiveParity =>
      'ב־5×5 רק שתי הכנפיים החיצוניות של קצה אחד יכולות להתחלף, ולכן אלגוריתם אחד מכסה את זה.';

  @override
  String get lessonSixIntro => 'הכירו את ה־6×6';

  @override
  String get lessonSixIntroDesc => 'אין מרכזים קבועים, וארבעה חלקים בכל קצה.';

  @override
  String get introGoalSixIntro =>
      'מכירים את ה־6×6: שישה־עשר חלקי מרכז בכל פאה וארבעה חלקים בכל קצה.';

  @override
  String get introHowSixIntro =>
      'אין מרכז קבוע: אתם בוחרים את הצבעים תוך כדי בנייה.\nבכל קצה יש כנפיים חיצוניות ופנימיות.\nסיבובים רחבים יכולים להזיז עד שלוש שכבות.';

  @override
  String get introHoldSixIntro =>
      'בהתחלה איך שנוח: כמו ב־4×4, ב־6×6 אין מרכז קבוע.';

  @override
  String get introWhySixIntro =>
      'אם אתם פותרים 4×4 ו־5×5, ה־6×6 הוא אותו צמצום עם גושים גדולים יותר.';

  @override
  String get lessonSixCenters => 'מרכזי ה־6×6';

  @override
  String get lessonSixCentersDesc => 'בונים מרכזי 4×4 מפסים של ארבעה.';

  @override
  String get introGoalSixCenters =>
      'בונים בכל פאה גוש מרכז של 4×4 בצבע אחד אחיד.';

  @override
  String get introHowSixCenters =>
      'קודם בודקים את סדר הצבעים לפי פינה: אין מרכז קבוע.\nבונים פסים של ארבעה ומחליקים אותם יחד.\nבשני המרכזים האחרונים מזיזים חלקים בודדים: פרוסה, למעלה, ביטול.';

  @override
  String get introHoldSixCenters =>
      'הפאה שבונים בחזית, ומרכזים גמורים משמאל, מימין או למטה.';

  @override
  String get introWhySixCenters =>
      'פסים מתחברים בפרוסות פנימיות, וכל פרוסה מבוטלת, כך שהמרכזים הגמורים נשארים שלמים.';

  @override
  String get lessonSixEdges => 'קצוות ה־6×6';

  @override
  String get lessonSixEdgesDesc => 'אוספים את ארבעת החלקים של כל קצה.';

  @override
  String get introGoalSixEdges =>
      'אוספים את ארבעת החלקים של כל קצה, כך שב־6×6 יש 12 קצוות נקיים.';

  @override
  String get introHowSixEdges =>
      'מיישרים בחזית את הכנפיים החיצוניות והפנימיות של קצה אחד.\nהשכבה הרחבה העמוקה מכניסה ומוציאה קצה.\nלעולם לא מפרקים קצה גמור כדי לשחרר חלק.';

  @override
  String get introHoldSixEdges =>
      'הקצה שבונים בחזית; קצוות גמורים חונים בשכבה העליונה ובתחתונה.';

  @override
  String get introWhySixEdges =>
      'הסיבוב הרחב העמוק מזיז את המרכזים הצידה כדי שכנפיים ייפגשו, ואז מחזיר אותם.';

  @override
  String get lessonSixSolve => 'פותרים את ה־6×6 כמו 3×3';

  @override
  String get lessonSixSolveDesc => 'מסיימים שכבה אחרי שכבה, כמו ב־3×3.';

  @override
  String get introGoalSixSolve =>
      'פותרים את ה־6×6 המצומצם כמו 3×3, שכבה אחרי שכבה, רק בסיבובים חיצוניים.';

  @override
  String get introHowSixSolve =>
      'מעכשיו רק סיבובים חיצוניים: פרוסה הייתה מפרקת מרכז או קצה.\nהמרכזים שבניתם מראים את צבע כל פאה.\nצלב ופינות לבנים, השכבה האמצעית, ואז השכבה הצהובה.';

  @override
  String get introHoldSixSolve =>
      'צבע השכבה הראשונה למטה, בדיוק כמו ב־3×3; הפינה להכנסה קדימה מימין.';

  @override
  String get introWhySixSolve =>
      'סיבובים חיצוניים מזיזים כל מרכז 4×4 וכל קצה כחלק אחד, בדיוק כמו ב־3×3.';

  @override
  String get lessonSixParity => 'זוגיות ב־6×6';

  @override
  String get lessonSixParityDesc => 'קצה הפוך אחד או שני קצוות מוחלפים.';

  @override
  String get introGoalSixParity =>
      'מתקנים את שני המקרים של 6×6 שאין ב־3×3: קצה הפוך אחד או שני קצוות מוחלפים.';

  @override
  String get introHowSixParity =>
      'פותרים כמו 3×3 עד שנתקעים.\nקצה הפוך אחד: התיקון הארוך עם ⁦3Rw⁩.\nשני קצוות מוחלפים: התיקון הקצר בסיבובים פנימיים כפולים.';

  @override
  String get introHoldSixParity =>
      'השכבה האחרונה למעלה. הקצה ההפוך בחזית; לשני קצוות מוחלפים, בחזית ומאחור.';

  @override
  String get introWhySixParity =>
      'כמו ב־4×4, ב־6×6 אפשר לסיים עם קצה הפוך אחד או שני קצוות מוחלפים; אלגוריתמים של שכבות פנימיות מתקנים אותם ומשאירים את השאר.';

  @override
  String get stepFivePieces => 'החלקים של 5×5';

  @override
  String get stepFivePiecesBody =>
      'החלק האמצעי בכל פאה לא זז אף פעם, ולכן סכמת הצבעים לא יכולה לצאת שגויה. סביבו שמונה חלקי מרכז: מרכזי פינה ומרכזי קצה אף פעם לא מתחלפים ביניהם. כל קצה הוא חלק אמצעי עם שתי כנפיים.';

  @override
  String get stepFiveSlices => 'שלושה סוגי סיבובים';

  @override
  String get stepFiveSlicesBody =>
      'סיבוב חיצוני מזיז פאה אחת. סיבוב רחב מזיז פאה יחד עם השכבה שמאחוריה. סיבוב פרוסה פנימית מזיז רק שכבה בפנים: כך חלקים מחליפים מקום בלי לגעת בחוץ.';

  @override
  String get stepFiveCenterBar => 'פסי מרכז';

  @override
  String get stepFiveCenterBarBody =>
      'בנו שורה של שלושה חלקי מרכז תואמים, החליקו אותה פנימה בפרוסה פנימית, סובבו את השכבה העליונה והחזירו: המהלך שמכניס את הפס גם מחזיר את המרכז הגמור. שלושה פסים הם מרכז.';

  @override
  String get stepFiveCenterSwap => 'מחליפים בלי לשבור';

  @override
  String get stepFiveCenterSwapBody =>
      'כדי להזיז חלק מרכז בודד: מסובבים פרוסה פנימית, מסובבים את הפאה העליונה, מבטלים את הפרוסה ומחזירים את העליונה. מרכזים גמורים חוזרים בכל פעם.';

  @override
  String get stepFiveEdgePair => 'מצמידים כנפיים לקצה אמצעי';

  @override
  String get stepFiveEdgePairBody =>
      'יישרו כנף ליד הקצה האמצעי התואם שלה בחזית, הורידו את השכבה הפנימית, הכניסו קצה לא פתור בטריגר קצר, ואז החזירו את השכבה הפנימית.';

  @override
  String get stepFiveEdgeLast => 'הקצוות האחרונים';

  @override
  String get stepFiveEdgeLastBody =>
      'כשלא נשאר קצה פנוי להכניס, משתמשים בפרוסה, היפוך, פרוסה: סיבוב רחב, טריגר קצר והסיבוב הרחב חזרה מצמידים את הקצוות האחרונים בלי לשבור את הגמורים.';

  @override
  String get stepFiveAsThree => 'עכשיו זו 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'כשהמרכזים והקצוות מוכנים, ה־5×5 מתנהג כמו 3×3 גדול. משתמשים רק בסיבובים חיצוניים ומתקדמים שכבה אחרי שכבה: צלב ופינות לבנים, השכבה האמצעית, ואז השכבה הצהובה. ב־5×5 אין פריטי PLL.';

  @override
  String get stepFiveEdgeParity => 'מחליפים את כנפי הקצה האחרון';

  @override
  String get stepFiveEdgeParityBody =>
      'לפעמים לקצה האחרון שתי הכנפיים החיצוניות מוחלפות, אז הוא נראה הפוך: הפריטי היחיד של ה־5×5. החזיקו אותו בחזית השכבה העליונה ובצעו פעם אחת את אלגוריתם הפרוסות הפנימיות; כל השאר חוזר למקומו.';

  @override
  String get stepSixPieces => 'החלקים של 6×6';

  @override
  String get stepSixPiecesBody =>
      'כמו ב־4×4, ב־6×6 אין מרכז קבוע: שישה־עשר חלקי מרכז יוצרים את צבע כל פאה, אז קודם בודקים את סדר הצבעים לפי פינה. לכל קצה ארבע כנפיים: שתיים חיצוניות ושתיים פנימיות.';

  @override
  String get stepSixSlices => 'מסובבים שכבות עמוקות';

  @override
  String get stepSixSlicesBody =>
      'סיבובים רחבים יכולים להזיז שתיים או שלוש שכבות מפאה. פרוסות פנימיות בשכבה השנייה או השלישית הן הכלים למרכזים ולקצוות.';

  @override
  String get stepSixCenterBar => 'פסים של ארבעה';

  @override
  String get stepSixCenterBarBody =>
      'בנו שורות של ארבעה חלקי מרכז תואמים והחליקו אותן זו ליד זו בסיבובי פרוסה פנימיים, תוך ביטול כל פרוסה, עד שהפאה היא גוש 4×4 אחיד.';

  @override
  String get stepSixCenterSwap => 'מזיזים חלק אחד בכל פעם';

  @override
  String get stepSixCenterSwapBody =>
      'סובבו את השכבה השלישית, סובבו את השכבה העליונה, בטלו, החזירו: חלק מרכז אחד זז והמרכזים הגמורים חוזרים. השתמשו בזה לשני המרכזים האחרונים, כשאף פס לא נכנס.';

  @override
  String get stepSixEdgePair => 'ארבעה חלקים, קצה אחד';

  @override
  String get stepSixEdgePairBody =>
      'אספו את ארבע הכנפיים של קצה בחזית בעזרת השכבה הרחבה העמוקה, הכניסו קצה לא פתור בטריגר קצר, ואז החזירו את השכבה הרחבה.';

  @override
  String get stepSixEdgeLast => 'הקצוות האחרונים';

  @override
  String get stepSixEdgeLastBody =>
      'הצמידו את הקצוות האחרונים בטריגר קצר בין סיבוב רחב עמוק לביטול שלו, כך שקצוות גמורים נשארים מוצמדים. לעולם לא מפרקים קצה גמור כדי לשחרר חלק.';

  @override
  String get stepSixAsThree => 'עכשיו זו 3×3';

  @override
  String get stepSixAsThreeBody =>
      'עם מרכזי 4×4 וקצוות מוצמדים, פותרים את ה־6×6 כמו 3×3, שכבה אחרי שכבה, רק בסיבובים חיצוניים. קצה הפוך אחד או שני קצוות מוחלפים בסוף הם פריטי, לא טעות.';

  @override
  String get stepSixOllParity => 'קצה הפוך אחד';

  @override
  String get stepSixOllParityBody =>
      'קצה יחיד שנראה הפוך בשכבה האחרונה הוא פריטי. החזיקו אותו בחזית השכבה העליונה ובצעו את התיקון הארוך: הוא הופך את כל ארבע הכנפיים, מחליף גם את הקצוות העליונים משמאל ומימין, ולא נוגע בשתי השכבות הראשונות.';

  @override
  String get stepSixPllParity => 'שני קצוות מוחלפים';

  @override
  String get stepSixPllParityBody =>
      'אם שני קצוות נראים מוחלפים ממש בסוף, החזיקו אותם בחזית ומאחור בשכבה העליונה ובצעו את התיקון הקצר בסיבובים פנימיים כפולים: כל ארבע הכנפיים של שני הקצוות מתחלפות.';

  @override
  String get stepSixWingRule => 'ארבע כנפיים או שתיים?';

  @override
  String get stepSixWingRuleBody =>
      'קצה ב־6×6 בנוי מ־4 כנפיים. לפני שמתקנים קצה שנראה הפוך, הסתכלו מקרוב: אם כל 4 הכנפיים הפוכות – משתמשים בפריטי OLL הרגיל של 3 שכבות; אם רק 2 הכנפיים הפנימיות הפוכות – משתמשים בפריטי הכנפיים הפנימיות. הקובייה מראה את מקרה הכנפיים הפנימיות.';

  @override
  String get stepSixInnerWingParity => 'שתי כנפיים פנימיות הפוכות';

  @override
  String get stepSixInnerWingParityBody =>
      'כאן הכנפיים החיצוניות של הקצה העליון הקדמי תקינות, ורק 2 הכנפיים הפנימיות הפוכות. השאירו את הקצה הזה בחזית השכבה העליונה וסובבו רק את הפרוסות השלישיות (⁦3R, 3L⁩): הכנפיים הפנימיות מתהפכות בחזרה ושאר הקובייה נשארת פתורה.';

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
  String fastMoveCounter(int current, int total) {
    return 'מהלך $current מתוך $total';
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

  @override
  String get homeAcademy => 'האקדמיה';

  @override
  String get homePatterns => 'דוגמאות מגניבות';

  @override
  String get homePractice => 'טיימר ואימון';

  @override
  String get scanChoiceSubtitle => 'איך תרצו להתחיל?';

  @override
  String get scanChoiceCamera => 'סריקה במצלמה';

  @override
  String get scanChoiceCameraDesc => 'הראו למצלמה כל פאה וקבלו את הפתרון.';

  @override
  String get scanChoice3d => 'פתיחת קובייה בתלת־ממד';

  @override
  String get scanChoice3dDesc =>
      'סובבו קובייה וירטואלית, ערבבו אותה ופתרו שלב אחר שלב.';

  @override
  String get academyAllSizes => 'כל הגדלים';

  @override
  String homeAcademyProgress(int done, int total) {
    return 'הושלמו $done מתוך $total שיעורים';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total הושלמו';
  }

  @override
  String get lessonStageConcept => 'הסבר';

  @override
  String get lessonStageExamples => 'דוגמאות';

  @override
  String get lessonStagePractice => 'תרגול מעשי';

  @override
  String get lessonStageNext => 'המשך / חופשי';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'שלב $index מתוך $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'דוגמה $index מתוך $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'תרגול $index מתוך $total';
  }

  @override
  String get lessonBonusCase => 'מקרה בונוס';

  @override
  String lessonContinueDesc(String lesson) {
    return 'ממשיכים ישר אל $lesson.';
  }

  @override
  String get lessonFreePractice => 'תרגול חופשי';

  @override
  String get lessonFreePracticeDesc =>
      'פתרו לבד קובייה מעורבבת בתלת־ממד, מההתחלה ועד השלב הזה.';

  @override
  String freePracticeBanner(String topic) {
    return 'תרגלו בחופשיות: פתרו את הקובייה מההתחלה ועד $topic!';
  }

  @override
  String get pieceColorSeparator => '־';

  @override
  String cueFaceTurn(String face) {
    return 'סובבו את הפאה של המרכז ה$face לפי החץ. המרכז נשאר במקומו; רק החלקים סביבו זזים.';
  }

  @override
  String cueTrigger(String front) {
    return 'תנועת יד ימין, כשה$front מולכם: הפאה הימנית למעלה, העליונה שמאלה, הימנית למטה, העליונה חזרה ימינה.';
  }

  @override
  String get cueTriggerBack =>
      'התנועה השישית ברצף מחזירה את הקובייה בדיוק למצב שבו התחילה. שש זה המספר הקסום!';

  @override
  String cueSliceInner(String face) {
    return 'סובבו רק את השכבה הפנימית שליד הפאה של המרכז ה$face. הפאה עצמה לא זזה, ולכן המרכזים נפרדים.';
  }

  @override
  String cueSliceWide(String face) {
    return 'סיבוב רחב: הפאה של המרכז ה$face והשכבה הפנימית שלידה מסתובבות יחד, כמו שכבה עבה אחת.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'סובבו את כל הקובייה כך שהמרכז ה$top יהיה למעלה והמרכז ה$front מולכם.';
  }

  @override
  String get cueTurnTop =>
      'סובבו רק את השכבה העליונה, לפי החץ, כדי להכין את האלגוריתם הבא.';

  @override
  String get cueAlignTop =>
      'מהלך אחרון: סובבו את השכבה העליונה כדי ליישר את הצבעים. סיימתם!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'הקצה בצבעי $piece נמצא בשכבה העליונה. סובבו את השורה העליונה עד שהוא בדיוק מעל המרכז ה$center, ואז סובבו את הפאה הזו פעמיים כדי להוריד אותו.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'הקצה בצבעי $piece תקוע בשכבה האמצעית. העלו אותו למעלה, יישרו אותו מעל המרכז ה$center, ואז הורידו אותו.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'הקצה בצבעי $piece במקום שלו אבל הפוך: הלבן שלו פונה הצידה. הוציאו אותו והעלו אותו למעלה, הלבן כלפי מעלה, ואז הורידו אותו ליד המרכז ה$center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'בסגנון ⁦CFOP⁩ מותר לסובב גם את התחתית. הכניסו את הקצה בצבעי $piece וסובבו את התחתית כך שיתיישר עם המרכז ה$center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'סובבו את הפאה העליונה עד שהפינה בצבעי $piece נמצאת בדיוק מעל המקום שלה, בין הצד ה$a לצד ה$b. חזרו על תנועת יד ימין עד שהיא נכנסת, מסובבת נכון.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'הפינה בצבעי $piece במקום שלה אבל מסובבת. טריגר אחד מקפיץ אותה החוצה (פינה צהובה נכנסת במקומה); המשיכו לחזור מעל אותו מקום עד שהיא נכנסת שוב עם הלבן למטה. אל תסובבו את הקובייה כדי לרדוף אחריה.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'סובבו את השורה העליונה עד שהקצה בצבעי $piece מיושר עם המרכז ה$a, ואז שלחו אותו למטה ימינה, אל המקום שבין ה$a ל$b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'סובבו את השורה העליונה עד שהקצה בצבעי $piece מיושר עם המרכז ה$a, ואז שלחו אותו למטה שמאלה, אל המקום שבין ה$a ל$b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'הקצה בצבעי $piece במקום שלו אבל הפוך. הכניסו לשם קצה צהוב כדי לדחוף אותו למעלה, ואז הכניסו אותו שוב בין ה$a ל$b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'קו צהוב: סובבו את השורה העליונה כך שהקו יעבור משמאל לימין, השאירו את ה$front מולכם ובצעו את אלגוריתם הצלב הצהוב.';
  }

  @override
  String cueYellowL(String front) {
    return 'צורת ⁦L⁩ צהובה: סובבו את הפאה העליונה כך שה־⁦L⁩ תצביע אחורה־שמאלה, השאירו את ה$front מולכם ובצעו את האלגוריתם. היא תהפוך לקו.';
  }

  @override
  String cueYellowDot(String front) {
    return 'רק המרכז הצהוב צהוב: נקודה. בצעו את האלגוריתם פעם אחת כשה$front מולכם כדי לקבל L. נקודה יכולה לקחת שלושה סבבים, אז המשיכו.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'סובבו את השורה העליונה עד שהקצה בצבעי $piece תואם את המרכז ה$center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'שני קצוות תואמים נמצאים מאחור ומימין. כשה$front מולכם, בצעו את ההחלפה: הקצה הקדמי והשמאלי מתחלפים.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'הקצוות התואמים נמצאים זה מול זה. בצעו את ההחלפה פעם אחת כשה$front מולכם; אחר כך שני קצוות שכנים יתאימו.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'הפינה בצבעי $piece כבר במקום שלה. השאירו אותה בקדמי־ימני, כשה$front מולכם, והעבירו במחזור את שלוש הפינות האחרות.';
  }

  @override
  String cueCornersNone(String front) {
    return 'אף פינה צהובה עוד לא במקומה. בצעו מחזור אחד כשה$front מולכם; אחריו פינה אחת תהיה בבית.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'סובבו את הפינה בצבעי $piece שקדימה מימין: חזרו על הטריגר התחתון בזוגות עד שהצהוב שלה פונה למעלה. השכבות התחתונות נראות מבולגנות בינתיים; הן חוזרות עם הפינה האחרונה!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'הפינה בצבעי $piece צריכה הפעם ארבע חזרות. המשיכו: הצהוב תמיד עולה אחרי שתיים או ארבע.';
  }

  @override
  String get cueTwistNext =>
      'סובבו רק את השכבה העליונה כדי להביא את הפינה המסובבת הבאה לקדמי־ימני. לא לסובב עכשיו את כל הקובייה!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'חברו את הפינה בצבעי $piece עם הקצה בצבעי $edge למעלה, ואז הכניסו את הזוג למקום שבין ה$a ל$b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'הפינה בצבעי $piece תקועה במקום שלה עם הקצה הלא נכון. קודם הוציאו אותה למעלה, ואז חברו אותה לזוג והכניסו.';
  }

  @override
  String cueOllSune(String front) {
    return 'כשה$front מולכם, בצעו ⁦Sune⁩ כדי להפוך את הפינות הצהובות כלפי מעלה.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'הפעם ⁦Sune⁩ אחד לא הספיק. סובבו את הפאה העליונה ובצעו ⁦Sune⁩ שוב, כשה$front מולכם.';
  }

  @override
  String cuePllCorners(String front) {
    return 'שתי פינות צריכות להתחלף. השאירו את הזוג התואם (״פנסים״) משמאל, כשה$front מולכם, ובצעו ⁦T-perm⁩.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'הפינות מוכנות. השאירו את הקצה בצבעי $piece מאחור והעבירו במחזור את שלושת הקצוות האחרים עם ⁦U-perm⁩.';
  }

  @override
  String get cuePllNoEdge =>
      'אף קצה עליון עוד לא תואם את המרכז שלו. בצעו ⁦U-perm⁩ פעם אחת מכל צד שתבחרו; אחריו קצה אחד יתאים.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'שתי פינות עליונות שכנות צריכות להתחלף. השאירו את הזוג התואם משמאל, כשה$front מולכם, ובצעו את ההחלפה.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'שתי הפינות שצריך להחליף נמצאות באלכסון. בצעו את ההחלפה האלכסונית כשה$front מולכם.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'החזירו הביתה את חלק המרכז ה$color שנדד, בעזרת מחזור מרכזים: שכבה פנימית, למעלה, שכבה פנימית, ואז הכול חזרה.';
  }

  @override
  String cueCenterBar(String color) {
    return 'פס שלם של חלקי מרכז בצבע $color נמצא על הפאה הלא נכונה. הרימו אותו עם השכבה הפנימית, סובבו את הפאה העליונה והחזירו אותו הביתה.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'הצמידו את שני חלקי הקצה בצבעי $piece: יישרו אותם, סובבו שכבה פנימית, הכניסו קצה לא מוצמד בתנועות יד ימין והחזירו את השכבה.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'הקצוות האחרונים: הצמידו את הקצה בצבעי $piece באלגוריתם שני הקצוות האחרונים, ששומר על כל הקצוות הגמורים.';
  }

  @override
  String cueParityOll(String front) {
    return 'פריטי OLL: קצה עליון אחד הפוך, דבר שלא קורה ב־3×3. השאירו אותו בחזית, כשה$front מולכם, ובצעו את תיקון הפריטי לפני כל OLL רגיל.';
  }

  @override
  String get cueParityPll =>
      'פריטי PLL: שני קצוות עליונים מוחלפים, דבר שלא קורה ב־3×3. השאירו אותם בחזית ומאחור, בצעו את החלפת הפריטי, ואז יישרו את השכבה העליונה.';

  @override
  String cueParityFive(String front) {
    return 'פריטי קצוות: שתי הכנפיים החיצוניות של קצה אחד מוחלפות, הפריטי היחיד שיש ב־5×5. השאירו את הקצה בחזית, כשה$front מולכם, ובצעו את התיקון פעם אחת.';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'פריטי כנפיים פנימיות: רק 2 הכנפיים הפנימיות של הקצה העליון הפוכות. השאירו אותו בחזית, כשה$front מולכם, וסובבו רק את הפרוסות השלישיות.';
  }

  @override
  String get wingRuleAllFour => 'כל 4 הכנפיים הפוכות';

  @override
  String get wingRuleAllFourFix => 'פריטי OLL של 3 שכבות (⁦3Rw⁩)';

  @override
  String get wingRuleInnerTwo => 'רק 2 הכנפיים הפנימיות הפוכות';

  @override
  String get wingRuleInnerTwoFix => 'פריטי כנפיים פנימיות (⁦3R⁩)';

  @override
  String get onboardingSkip => 'דלגו';

  @override
  String get onboardingNext => 'הבא';

  @override
  String get onboardingStart => 'בואו נתחיל';

  @override
  String get onboardingWhatTitle => 'המלווה שלכם לקובייה';

  @override
  String get onboardingWhatBody =>
      'CubeMentor עוזרת לפתור, ללמוד ולהתאמן על כל קובייה מ־2×2 ועד 6×6, בלי חיבור לאינטרנט.';

  @override
  String get onboardingScanTitle => 'סורקים ופותרים בשניות';

  @override
  String get onboardingScanBody =>
      'הראו כל פאה למצלמה (או הקישו את הצבעים) ועקבו אחרי הפתרון בתלת־ממד מהלך אחר מהלך.';

  @override
  String get onboardingLearnTitle => 'לומדים ומשחקים';

  @override
  String get onboardingLearnBody =>
      'למדו את שיטת השכבות באקדמיה, ואז סובבו, ערבבו ופתרו בחופשיות במגרש המשחקים התלת־ממדי.';

  @override
  String get scanChoiceManualDesc => 'הקישו את צבעי כל פאה, מדבקה אחר מדבקה.';

  @override
  String get scanTryAgain => 'נסו שוב';

  @override
  String get scanEditManually => 'תיקון צבעים ידני';

  @override
  String get scanLightingHint =>
      'מרכזו את הפאה ברשת. השתמשו באור חזק ואחיד והימנעו מסנוור.';

  @override
  String get crownExplain =>
      'שכבה היא פרוסה אופקית אחת של הקובייה: השכבה הראשונה היא השכבה הלבנה למטה, השנייה היא השכבה האמצעית והשלישית היא השכבה הצהובה למעלה.';

  @override
  String get lessonObjectiveHeading => 'מטרת הלמידה';

  @override
  String get dirRowTop => 'השורה העליונה של הפאה הקדמית';

  @override
  String get dirRowBottom => 'השורה התחתונה של הפאה הקדמית';

  @override
  String get dirColumnRight => 'העמודה הימנית של הפאה הקדמית';

  @override
  String get dirColumnLeft => 'העמודה השמאלית של הפאה הקדמית';

  @override
  String get solveChoiceTitle => 'איך תרצו לפתור?';

  @override
  String get solveChoiceFastDesc => 'הפתרון הקצר ביותר, מהלך אחר מהלך.';

  @override
  String get solveChoiceGuidedDesc => 'לומדים את שיטת השכבות צעד אחר צעד.';

  @override
  String get guidedSolvedTitle => 'נפתרה!';

  @override
  String get guidedSolvedBody => 'עברתם כל שלב ופתרתם את הקובייה.';

  @override
  String get solveAgain => 'לפתור שוב';

  @override
  String get backToHome => 'חזרה למסך הבית';

  @override
  String get dailyStatTime => 'הזמן של היום';

  @override
  String get dailyStatBest => 'שיא אישי';

  @override
  String get dailyStatStreak => 'רצף נוכחי';

  @override
  String get dailyStatBestStreak => 'הרצף הארוך ביותר';

  @override
  String get privacyPolicyTitle => 'מדיניות פרטיות';

  @override
  String get settingsPrivacyPolicyDesc =>
      'מה CubeMentor שומרת ובמה הפרסומות משתמשות.';

  @override
  String get privacyIntro =>
      'CubeMentor פועלת בלי חשבון ובלי שרתים משלה. בעמוד הזה מוסבר מה נשאר במכשיר שלכם ובמה משתמש שותף הפרסום שלנו.';

  @override
  String get privacyDataTitle => 'המידע שלכם נשאר במכשיר';

  @override
  String get privacyDataBody =>
      'השפה, ההגדרות, ההתקדמות בשיעורים, זמני הפתרון והרצף היומי נשמרים רק במכשיר הזה. אין לנו שרתים, ולכן הם אף פעם לא מגיעים אלינו. הסרת האפליקציה מוחקת אותם.';

  @override
  String get privacyCameraTitle => 'מצלמה';

  @override
  String get privacyCameraBody =>
      'המצלמה פועלת רק בזמן סריקת קובייה. התמונות מנותחות במכשיר כדי לזהות את צבעי המדבקות; אף תמונה או סרטון לא נשמרים ולא נשלחים לשום מקום.';

  @override
  String get privacyAdsTitle => 'פרסומות';

  @override
  String get privacyAdsBody =>
      'האפליקציה מציגה פרסומות של Google AdMob. Google עשויה להשתמש במזהי מכשיר ובנתוני אינטראקציה עם פרסומות כדי להציג ולמדוד פרסומות, כמתואר במדיניות הפרטיות של Google. היכן שהחוק מחייב, תתבקשו קודם להסכים, ותוכלו לשנות זאת בהגדרות.';

  @override
  String get privacyContactTitle => 'יצירת קשר';

  @override
  String privacyContactBody(String email) {
    return 'שאלות על פרטיות? כתבו לנו לכתובת $email.';
  }
}
