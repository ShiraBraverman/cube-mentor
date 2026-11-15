import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_he.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('he'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CubeMentor'**
  String get appTitle;

  /// No description provided for @homeTagline.
  ///
  /// In en, this message translates to:
  /// **'Scan, solve and master every cube from 2×2 to 6×6.'**
  String get homeTagline;

  /// No description provided for @chooseCubeSize.
  ///
  /// In en, this message translates to:
  /// **'Choose your cube'**
  String get chooseCubeSize;

  /// No description provided for @cubeSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'{size}×{size}'**
  String cubeSizeLabel(int size);

  /// No description provided for @cubeLevel2.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get cubeLevel2;

  /// No description provided for @cubeLevel3.
  ///
  /// In en, this message translates to:
  /// **'Classic'**
  String get cubeLevel3;

  /// No description provided for @cubeLevel4.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get cubeLevel4;

  /// No description provided for @cubeLevel5.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get cubeLevel5;

  /// No description provided for @cubeLevel6.
  ///
  /// In en, this message translates to:
  /// **'Master'**
  String get cubeLevel6;

  /// No description provided for @chooseMode.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get chooseMode;

  /// No description provided for @modePlayground.
  ///
  /// In en, this message translates to:
  /// **'3D Playground'**
  String get modePlayground;

  /// No description provided for @modePlaygroundDesc.
  ///
  /// In en, this message translates to:
  /// **'Turn layers, scramble and replay moves in 3D.'**
  String get modePlaygroundDesc;

  /// No description provided for @modeScanSolve.
  ///
  /// In en, this message translates to:
  /// **'Scan & Solve'**
  String get modeScanSolve;

  /// No description provided for @modeScanSolveDesc.
  ///
  /// In en, this message translates to:
  /// **'Scan your cube with the camera and get a solution.'**
  String get modeScanSolveDesc;

  /// No description provided for @modeAcademy.
  ///
  /// In en, this message translates to:
  /// **'Academy'**
  String get modeAcademy;

  /// No description provided for @modeAcademyDesc.
  ///
  /// In en, this message translates to:
  /// **'Learn step by step with interactive lessons.'**
  String get modeAcademyDesc;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @comingSoonMessage.
  ///
  /// In en, this message translates to:
  /// **'This feature is on its way in an upcoming update.'**
  String get comingSoonMessage;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageHebrew.
  ///
  /// In en, this message translates to:
  /// **'עברית'**
  String get languageHebrew;

  /// No description provided for @playgroundTitle.
  ///
  /// In en, this message translates to:
  /// **'{size}×{size} Playground'**
  String playgroundTitle(int size);

  /// No description provided for @scramble.
  ///
  /// In en, this message translates to:
  /// **'Scramble'**
  String get scramble;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @speed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get speed;

  /// No description provided for @xray.
  ///
  /// In en, this message translates to:
  /// **'X-ray'**
  String get xray;

  /// No description provided for @prime.
  ///
  /// In en, this message translates to:
  /// **'Prime'**
  String get prime;

  /// No description provided for @wide.
  ///
  /// In en, this message translates to:
  /// **'Wide'**
  String get wide;

  /// No description provided for @layer.
  ///
  /// In en, this message translates to:
  /// **'Layer {index}'**
  String layer(int index);

  /// No description provided for @cubeRotations.
  ///
  /// In en, this message translates to:
  /// **'Rotations'**
  String get cubeRotations;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @nextStep.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextStep;

  /// No description provided for @previousStep.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previousStep;

  /// No description provided for @playbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Playback'**
  String get playbackTitle;

  /// No description provided for @playbackEmpty.
  ///
  /// In en, this message translates to:
  /// **'Scramble the cube to build a solving playback.'**
  String get playbackEmpty;

  /// No description provided for @playbackProgress.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String playbackProgress(int current, int total);

  /// No description provided for @moveCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No moves} =1{1 move} other{{count} moves}}'**
  String moveCount(int count);

  /// No description provided for @solved.
  ///
  /// In en, this message translates to:
  /// **'Solved'**
  String get solved;

  /// No description provided for @scrambled.
  ///
  /// In en, this message translates to:
  /// **'Scrambled'**
  String get scrambled;

  /// No description provided for @orbitHint.
  ///
  /// In en, this message translates to:
  /// **'Drag a row to turn it · Drag the background to orbit'**
  String get orbitHint;

  /// No description provided for @notationPad.
  ///
  /// In en, this message translates to:
  /// **'Notation pad'**
  String get notationPad;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'he'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'he':
      return AppLocalizationsHe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
