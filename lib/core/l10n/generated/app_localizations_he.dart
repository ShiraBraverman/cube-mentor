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
}
