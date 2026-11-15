// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Scan, solve and master every cube from 2×2 to 6×6.';

  @override
  String get chooseCubeSize => 'Choose your cube';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Beginner';

  @override
  String get cubeLevel3 => 'Classic';

  @override
  String get cubeLevel4 => 'Advanced';

  @override
  String get cubeLevel5 => 'Expert';

  @override
  String get cubeLevel6 => 'Master';

  @override
  String get chooseMode => 'What do you want to do?';

  @override
  String get modePlayground => '3D Playground';

  @override
  String get modePlaygroundDesc =>
      'Turn layers, scramble and replay moves in 3D.';

  @override
  String get modeScanSolve => 'Scan & Solve';

  @override
  String get modeScanSolveDesc =>
      'Scan your cube with the camera and get a solution.';

  @override
  String get modeAcademy => 'Academy';

  @override
  String get modeAcademyDesc => 'Learn step by step with interactive lessons.';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get comingSoonMessage =>
      'This feature is on its way in an upcoming update.';

  @override
  String get language => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageHebrew => 'עברית';

  @override
  String playgroundTitle(int size) {
    return '$size×$size Playground';
  }

  @override
  String get scramble => 'Scramble';

  @override
  String get reset => 'Reset';

  @override
  String get undo => 'Undo';

  @override
  String get speed => 'Speed';

  @override
  String get xray => 'X-ray';

  @override
  String get prime => 'Prime';

  @override
  String get wide => 'Wide';

  @override
  String layer(int index) {
    return 'Layer $index';
  }

  @override
  String get cubeRotations => 'Rotations';

  @override
  String get play => 'Play';

  @override
  String get pause => 'Pause';

  @override
  String get nextStep => 'Next';

  @override
  String get previousStep => 'Previous';

  @override
  String get playbackTitle => 'Playback';

  @override
  String get playbackEmpty => 'Scramble the cube to build a solving playback.';

  @override
  String playbackProgress(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count moves',
      one: '1 move',
      zero: 'No moves',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Solved';

  @override
  String get scrambled => 'Scrambled';

  @override
  String get orbitHint => 'Drag to orbit · Double-tap to reset view';
}
