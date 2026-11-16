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

  /// No description provided for @solve.
  ///
  /// In en, this message translates to:
  /// **'Solve'**
  String get solve;

  /// No description provided for @solving.
  ///
  /// In en, this message translates to:
  /// **'Solving…'**
  String get solving;

  /// No description provided for @solveChooseMethod.
  ///
  /// In en, this message translates to:
  /// **'How do you want to solve it?'**
  String get solveChooseMethod;

  /// No description provided for @solveFast.
  ///
  /// In en, this message translates to:
  /// **'Fast solve'**
  String get solveFast;

  /// No description provided for @solveFastDesc.
  ///
  /// In en, this message translates to:
  /// **'Kociemba two-phase algorithm · about 20 moves'**
  String get solveFastDesc;

  /// No description provided for @solveLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn step by step'**
  String get solveLearn;

  /// No description provided for @solveLearnDesc.
  ///
  /// In en, this message translates to:
  /// **'Beginner\'s layer-by-layer method with explanations'**
  String get solveLearnDesc;

  /// No description provided for @solveUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The {size}×{size} solver arrives in a later update.'**
  String solveUnavailable(int size);

  /// No description provided for @solveAlreadySolved.
  ///
  /// In en, this message translates to:
  /// **'The cube is already solved.'**
  String get solveAlreadySolved;

  /// No description provided for @solveFailed.
  ///
  /// In en, this message translates to:
  /// **'This cube can\'t be solved ({reason}).'**
  String solveFailed(String reason);

  /// No description provided for @solveEngineMissing.
  ///
  /// In en, this message translates to:
  /// **'The solving engine isn\'t available on this device.'**
  String get solveEngineMissing;

  /// No description provided for @solveComplete.
  ///
  /// In en, this message translates to:
  /// **'Solved! Great job.'**
  String get solveComplete;

  /// No description provided for @solveSummary.
  ///
  /// In en, this message translates to:
  /// **'{count} moves'**
  String solveSummary(int count);

  /// No description provided for @nextMove.
  ///
  /// In en, this message translates to:
  /// **'Next move'**
  String get nextMove;

  /// No description provided for @guideSwipeHint.
  ///
  /// In en, this message translates to:
  /// **'Swipe the glowing layer the way the arrow points, or tap Next.'**
  String get guideSwipeHint;

  /// No description provided for @guideRotateHint.
  ///
  /// In en, this message translates to:
  /// **'Turn the whole cube as the arrow shows: tap Next.'**
  String get guideRotateHint;

  /// No description provided for @guideWrongMove.
  ///
  /// In en, this message translates to:
  /// **'Follow the highlighted arrow'**
  String get guideWrongMove;

  /// No description provided for @guideExit.
  ///
  /// In en, this message translates to:
  /// **'Exit guide'**
  String get guideExit;

  /// No description provided for @replayStep.
  ///
  /// In en, this message translates to:
  /// **'Replay step'**
  String get replayStep;

  /// No description provided for @colorWhite.
  ///
  /// In en, this message translates to:
  /// **'white'**
  String get colorWhite;

  /// No description provided for @colorYellow.
  ///
  /// In en, this message translates to:
  /// **'yellow'**
  String get colorYellow;

  /// No description provided for @colorGreen.
  ///
  /// In en, this message translates to:
  /// **'green'**
  String get colorGreen;

  /// No description provided for @colorBlue.
  ///
  /// In en, this message translates to:
  /// **'blue'**
  String get colorBlue;

  /// No description provided for @colorRed.
  ///
  /// In en, this message translates to:
  /// **'red'**
  String get colorRed;

  /// No description provided for @colorOrange.
  ///
  /// In en, this message translates to:
  /// **'orange'**
  String get colorOrange;

  /// No description provided for @phaseOptimal2x2.
  ///
  /// In en, this message translates to:
  /// **'Optimal solution'**
  String get phaseOptimal2x2;

  /// No description provided for @phaseKociemba1.
  ///
  /// In en, this message translates to:
  /// **'Phase 1 · Orient the pieces'**
  String get phaseKociemba1;

  /// No description provided for @phaseKociemba2.
  ///
  /// In en, this message translates to:
  /// **'Phase 2 · Finish the cube'**
  String get phaseKociemba2;

  /// No description provided for @phaseLblOrient.
  ///
  /// In en, this message translates to:
  /// **'Hold the cube'**
  String get phaseLblOrient;

  /// No description provided for @phaseLblCross.
  ///
  /// In en, this message translates to:
  /// **'White cross'**
  String get phaseLblCross;

  /// No description provided for @phaseLblCorners.
  ///
  /// In en, this message translates to:
  /// **'White corners'**
  String get phaseLblCorners;

  /// No description provided for @phaseLblMiddle.
  ///
  /// In en, this message translates to:
  /// **'Middle layer'**
  String get phaseLblMiddle;

  /// No description provided for @phaseLblYellowCross.
  ///
  /// In en, this message translates to:
  /// **'Yellow cross'**
  String get phaseLblYellowCross;

  /// No description provided for @phaseLblYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Yellow edges'**
  String get phaseLblYellowEdges;

  /// No description provided for @phaseLblYellowCorners.
  ///
  /// In en, this message translates to:
  /// **'Place the yellow corners'**
  String get phaseLblYellowCorners;

  /// No description provided for @phaseLblYellowCornersOrient.
  ///
  /// In en, this message translates to:
  /// **'Twist the yellow corners'**
  String get phaseLblYellowCornersOrient;

  /// No description provided for @explainOptimal2x2.
  ///
  /// In en, this message translates to:
  /// **'The shortest possible solution, found by searching every 2×2 position.'**
  String get explainOptimal2x2;

  /// No description provided for @explainKociemba1.
  ///
  /// In en, this message translates to:
  /// **'Orient every piece and gather the middle-layer edges into the middle layer.'**
  String get explainKociemba1;

  /// No description provided for @explainKociemba2.
  ///
  /// In en, this message translates to:
  /// **'Finish with U, D and half turns only, which keep that orientation.'**
  String get explainKociemba2;

  /// No description provided for @explainLblOrient.
  ///
  /// In en, this message translates to:
  /// **'Turn the whole cube so the white center points down.'**
  String get explainLblOrient;

  /// No description provided for @explainLblCrossEdge.
  ///
  /// In en, this message translates to:
  /// **'Bring the {piece} edge down next to the white center, matching its side color.'**
  String explainLblCrossEdge(String piece);

  /// No description provided for @explainLblCornerExtract.
  ///
  /// In en, this message translates to:
  /// **'The {piece} corner is stuck in the wrong spot. Lift it to the top with R U R\' U\'.'**
  String explainLblCornerExtract(String piece);

  /// No description provided for @explainLblCornerAlign.
  ///
  /// In en, this message translates to:
  /// **'Turn the top layer until the {piece} corner sits above its slot.'**
  String explainLblCornerAlign(String piece);

  /// No description provided for @explainLblCornerInsert.
  ///
  /// In en, this message translates to:
  /// **'Repeat R U R\' U\' until the {piece} corner drops into place.'**
  String explainLblCornerInsert(String piece);

  /// No description provided for @explainLblMiddleExtract.
  ///
  /// In en, this message translates to:
  /// **'The {piece} edge is in the middle layer but wrong. Pop it out to the top.'**
  String explainLblMiddleExtract(String piece);

  /// No description provided for @explainLblMiddleAlign.
  ///
  /// In en, this message translates to:
  /// **'Turn the top layer so the {piece} edge\'s side color matches its center.'**
  String explainLblMiddleAlign(String piece);

  /// No description provided for @explainLblMiddleRight.
  ///
  /// In en, this message translates to:
  /// **'Insert the {piece} edge to the right: U R U\' R\' U\' F\' U F.'**
  String explainLblMiddleRight(String piece);

  /// No description provided for @explainLblMiddleLeft.
  ///
  /// In en, this message translates to:
  /// **'Insert the {piece} edge to the left: U\' L\' U L U F U\' F\'.'**
  String explainLblMiddleLeft(String piece);

  /// No description provided for @explainLblYellowCrossAlign.
  ///
  /// In en, this message translates to:
  /// **'Turn the top layer to place the yellow shape for the next algorithm.'**
  String get explainLblYellowCrossAlign;

  /// No description provided for @explainLblYellowCrossAlg.
  ///
  /// In en, this message translates to:
  /// **'Build the yellow cross with F R U R\' U\' F\'.'**
  String get explainLblYellowCrossAlg;

  /// No description provided for @explainLblYellowEdgesAlign.
  ///
  /// In en, this message translates to:
  /// **'Turn the top layer to line the yellow edges up with their centers.'**
  String get explainLblYellowEdgesAlign;

  /// No description provided for @explainLblYellowEdgesAlg.
  ///
  /// In en, this message translates to:
  /// **'Swap yellow edges with R U R\' U R U2 R\' U.'**
  String get explainLblYellowEdgesAlg;

  /// No description provided for @explainLblYellowCornersAlg.
  ///
  /// In en, this message translates to:
  /// **'Cycle the yellow corners into their spots with U R U\' L\' U R\' U\' L.'**
  String get explainLblYellowCornersAlg;

  /// No description provided for @explainLblNextCorner.
  ///
  /// In en, this message translates to:
  /// **'Turn the top layer to bring the next unsolved yellow corner to the front-right.'**
  String get explainLblNextCorner;

  /// No description provided for @explainLblCornerTwist.
  ///
  /// In en, this message translates to:
  /// **'Repeat R\' D\' R D until yellow faces up. The bottom fixes itself at the end.'**
  String get explainLblCornerTwist;

  /// No description provided for @explainLblFinalAlign.
  ///
  /// In en, this message translates to:
  /// **'Turn the top layer to finish the cube.'**
  String get explainLblFinalAlign;
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
