import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

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
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fil'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('zh'),
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

  /// No description provided for @cubeComingSoon.
  ///
  /// In en, this message translates to:
  /// **'New cube coming soon'**
  String get cubeComingSoon;

  /// No description provided for @carouselPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous cube'**
  String get carouselPrevious;

  /// No description provided for @carouselNext.
  ///
  /// In en, this message translates to:
  /// **'Next cube'**
  String get carouselNext;

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

  /// No description provided for @languageSearch.
  ///
  /// In en, this message translates to:
  /// **'Search languages'**
  String get languageSearch;

  /// No description provided for @languageNoResults.
  ///
  /// In en, this message translates to:
  /// **'No language matches your search.'**
  String get languageNoResults;

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

  /// No description provided for @solveFast.
  ///
  /// In en, this message translates to:
  /// **'Fast solve'**
  String get solveFast;

  /// No description provided for @solveLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn step by step'**
  String get solveLearn;

  /// No description provided for @solveModeGuided.
  ///
  /// In en, this message translates to:
  /// **'Guided (3 crowns)'**
  String get solveModeGuided;

  /// No description provided for @solveModeFast.
  ///
  /// In en, this message translates to:
  /// **'Fast (optimal)'**
  String get solveModeFast;

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

  /// No description provided for @previousMove.
  ///
  /// In en, this message translates to:
  /// **'Previous move'**
  String get previousMove;

  /// No description provided for @halfTurnHalfway.
  ///
  /// In en, this message translates to:
  /// **'Nice, halfway there! Turn it once more for a double turn (180°).'**
  String get halfTurnHalfway;

  /// No description provided for @wideTurnInner.
  ///
  /// In en, this message translates to:
  /// **'Great! Now swipe the inner adjacent layer to complete the wide turn.'**
  String get wideTurnInner;

  /// No description provided for @wideTurnOuter.
  ///
  /// In en, this message translates to:
  /// **'Great! Now swipe the outer layer next to it to complete the wide turn.'**
  String get wideTurnOuter;

  /// No description provided for @wideTurnMore.
  ///
  /// In en, this message translates to:
  /// **'Great! Keep swiping the glowing layers one at a time to complete the wide turn.'**
  String get wideTurnMore;

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

  /// No description provided for @phaseLblCross.
  ///
  /// In en, this message translates to:
  /// **'White cross'**
  String get phaseLblCross;

  /// No description provided for @phaseLblCorners.
  ///
  /// In en, this message translates to:
  /// **'First crown corners'**
  String get phaseLblCorners;

  /// No description provided for @phaseLblMiddle.
  ///
  /// In en, this message translates to:
  /// **'Middle layer edges'**
  String get phaseLblMiddle;

  /// No description provided for @phaseLblYellowCross.
  ///
  /// In en, this message translates to:
  /// **'Yellow cross'**
  String get phaseLblYellowCross;

  /// No description provided for @phaseLblYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Align the yellow cross edges'**
  String get phaseLblYellowEdges;

  /// No description provided for @phaseLblYellowCorners.
  ///
  /// In en, this message translates to:
  /// **'Position the yellow corners'**
  String get phaseLblYellowCorners;

  /// No description provided for @phaseLblYellowCornersOrient.
  ///
  /// In en, this message translates to:
  /// **'Orient the yellow corners'**
  String get phaseLblYellowCornersOrient;

  /// No description provided for @crownFirst.
  ///
  /// In en, this message translates to:
  /// **'First crown'**
  String get crownFirst;

  /// No description provided for @crownSecond.
  ///
  /// In en, this message translates to:
  /// **'Second crown'**
  String get crownSecond;

  /// No description provided for @crownThird.
  ///
  /// In en, this message translates to:
  /// **'Third crown'**
  String get crownThird;

  /// No description provided for @crownFirstGoal.
  ///
  /// In en, this message translates to:
  /// **'White face and first layer'**
  String get crownFirstGoal;

  /// No description provided for @crownSecondGoal.
  ///
  /// In en, this message translates to:
  /// **'Middle layer'**
  String get crownSecondGoal;

  /// No description provided for @crownThirdGoal.
  ///
  /// In en, this message translates to:
  /// **'Yellow face and last layer'**
  String get crownThirdGoal;

  /// No description provided for @crownProgress.
  ///
  /// In en, this message translates to:
  /// **'Crown {current} of {total}'**
  String crownProgress(int current, int total);

  /// No description provided for @subStepGoal11.
  ///
  /// In en, this message translates to:
  /// **'Form a white cross where every white edge also matches the center color beside it.'**
  String get subStepGoal11;

  /// No description provided for @subStepGoal12.
  ///
  /// In en, this message translates to:
  /// **'Insert the 4 white corners into their matching slots to finish the white face and the whole first ring.'**
  String get subStepGoal12;

  /// No description provided for @subStepGoal21.
  ///
  /// In en, this message translates to:
  /// **'Insert the 4 middle-layer edges without disturbing the first crown.'**
  String get subStepGoal21;

  /// No description provided for @subStepGoal31.
  ///
  /// In en, this message translates to:
  /// **'Form a yellow cross on the last layer.'**
  String get subStepGoal31;

  /// No description provided for @subStepGoal32.
  ///
  /// In en, this message translates to:
  /// **'Swap the yellow cross edges until each one matches its side center.'**
  String get subStepGoal32;

  /// No description provided for @subStepGoal33.
  ///
  /// In en, this message translates to:
  /// **'Move the 4 yellow corners to their correct places, even if they are still twisted.'**
  String get subStepGoal33;

  /// No description provided for @subStepGoal34.
  ///
  /// In en, this message translates to:
  /// **'Twist each yellow corner in place until every sticker matches and the cube is solved.'**
  String get subStepGoal34;

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

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan {size}×{size}'**
  String scanTitle(int size);

  /// No description provided for @scanManualInput.
  ///
  /// In en, this message translates to:
  /// **'Enter colors by hand'**
  String get scanManualInput;

  /// No description provided for @scanUseCamera.
  ///
  /// In en, this message translates to:
  /// **'Scan with the camera'**
  String get scanUseCamera;

  /// No description provided for @scanFaceProgress.
  ///
  /// In en, this message translates to:
  /// **'Face {current} of {total}'**
  String scanFaceProgress(int current, int total);

  /// No description provided for @faceUp.
  ///
  /// In en, this message translates to:
  /// **'Top face'**
  String get faceUp;

  /// No description provided for @faceRight.
  ///
  /// In en, this message translates to:
  /// **'Right face'**
  String get faceRight;

  /// No description provided for @faceFront.
  ///
  /// In en, this message translates to:
  /// **'Front face'**
  String get faceFront;

  /// No description provided for @faceDown.
  ///
  /// In en, this message translates to:
  /// **'Bottom face'**
  String get faceDown;

  /// No description provided for @faceLeft.
  ///
  /// In en, this message translates to:
  /// **'Left face'**
  String get faceLeft;

  /// No description provided for @faceBack.
  ///
  /// In en, this message translates to:
  /// **'Back face'**
  String get faceBack;

  /// No description provided for @scanHintFront.
  ///
  /// In en, this message translates to:
  /// **'Hold the cube with any face toward you. That is your front: keep the same face on top while you scan.'**
  String get scanHintFront;

  /// No description provided for @scanHintRight.
  ///
  /// In en, this message translates to:
  /// **'From the front, turn the whole cube left once so the right face looks at you.'**
  String get scanHintRight;

  /// No description provided for @scanHintBack.
  ///
  /// In en, this message translates to:
  /// **'From the front, turn the whole cube left twice.'**
  String get scanHintBack;

  /// No description provided for @scanHintLeft.
  ///
  /// In en, this message translates to:
  /// **'From the front, turn the whole cube right once.'**
  String get scanHintLeft;

  /// No description provided for @scanHintUp.
  ///
  /// In en, this message translates to:
  /// **'From the front, tip the top toward you so it faces the camera.'**
  String get scanHintUp;

  /// No description provided for @scanHintDown.
  ///
  /// In en, this message translates to:
  /// **'From the front, tip the bottom toward you so it faces the camera.'**
  String get scanHintDown;

  /// No description provided for @scanAlignHint.
  ///
  /// In en, this message translates to:
  /// **'Fill the grid with the face, then tap the shutter.'**
  String get scanAlignHint;

  /// No description provided for @scanCapture.
  ///
  /// In en, this message translates to:
  /// **'Capture face'**
  String get scanCapture;

  /// No description provided for @scanTurnLeft.
  ///
  /// In en, this message translates to:
  /// **'Turn the whole cube to the left'**
  String get scanTurnLeft;

  /// No description provided for @scanTurnRight.
  ///
  /// In en, this message translates to:
  /// **'Turn the whole cube to the right'**
  String get scanTurnRight;

  /// No description provided for @scanTipTop.
  ///
  /// In en, this message translates to:
  /// **'Tip the top toward you'**
  String get scanTipTop;

  /// No description provided for @scanTipBottom.
  ///
  /// In en, this message translates to:
  /// **'Tip the bottom toward you'**
  String get scanTipBottom;

  /// No description provided for @scanGlareTip.
  ///
  /// In en, this message translates to:
  /// **'Glare detected: tilt the cube slightly, or hold your phone over it to block the overhead light.'**
  String get scanGlareTip;

  /// No description provided for @scanDimTip.
  ///
  /// In en, this message translates to:
  /// **'Too dim: move to brighter light or turn on the flashlight.'**
  String get scanDimTip;

  /// No description provided for @scanTorch.
  ///
  /// In en, this message translates to:
  /// **'Flashlight'**
  String get scanTorch;

  /// No description provided for @scanGuideLabel.
  ///
  /// In en, this message translates to:
  /// **'Scan guide: scanned faces in color. Tap a scanned face to scan it again.'**
  String get scanGuideLabel;

  /// No description provided for @scanTapToRescan.
  ///
  /// In en, this message translates to:
  /// **'Tap a scanned face to scan it again.'**
  String get scanTapToRescan;

  /// No description provided for @scanCameraMissing.
  ///
  /// In en, this message translates to:
  /// **'No camera found on this device.'**
  String get scanCameraMissing;

  /// No description provided for @scanCameraDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access was denied. You can still enter the colors by hand.'**
  String get scanCameraDenied;

  /// No description provided for @scanCameraFailed.
  ///
  /// In en, this message translates to:
  /// **'The camera could not start.'**
  String get scanCameraFailed;

  /// No description provided for @scanAllGood.
  ///
  /// In en, this message translates to:
  /// **'All stickers look right.'**
  String get scanAllGood;

  /// No description provided for @scanStickersWrong.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 sticker looks wrong} other{{count} stickers look wrong}}'**
  String scanStickersWrong(int count);

  /// No description provided for @scanCheckCube.
  ///
  /// In en, this message translates to:
  /// **'Something doesn\'t add up'**
  String get scanCheckCube;

  /// No description provided for @scanIssueColors.
  ///
  /// In en, this message translates to:
  /// **'Each color must appear exactly {count} times.'**
  String scanIssueColors(int count);

  /// No description provided for @scanIssueCenters.
  ///
  /// In en, this message translates to:
  /// **'Two centers have the same color.'**
  String get scanIssueCenters;

  /// No description provided for @scanIssuePieces.
  ///
  /// In en, this message translates to:
  /// **'These stickers form pieces that don\'t exist on a real cube.'**
  String get scanIssuePieces;

  /// No description provided for @scanIssueTwist.
  ///
  /// In en, this message translates to:
  /// **'One corner is twisted. Check the corner stickers.'**
  String get scanIssueTwist;

  /// No description provided for @scanIssueFlip.
  ///
  /// In en, this message translates to:
  /// **'One edge is flipped. Check the edge stickers.'**
  String get scanIssueFlip;

  /// No description provided for @scanIssueParity.
  ///
  /// In en, this message translates to:
  /// **'Two pieces look swapped.'**
  String get scanIssueParity;

  /// No description provided for @scanIssueUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Color checking isn\'t available on this device.'**
  String get scanIssueUnavailable;

  /// No description provided for @scanUncertain.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 sticker was hard to read: give it a quick look.} other{{count} stickers were hard to read: give them a quick look.}}'**
  String scanUncertain(int count);

  /// No description provided for @scanEditHint.
  ///
  /// In en, this message translates to:
  /// **'Tap a sticker to change its color · Long-press for the palette'**
  String get scanEditHint;

  /// No description provided for @scanRescanFace.
  ///
  /// In en, this message translates to:
  /// **'Rescan a face'**
  String get scanRescanFace;

  /// No description provided for @scanCancelRescan.
  ///
  /// In en, this message translates to:
  /// **'Back to the colors'**
  String get scanCancelRescan;

  /// No description provided for @scanPaletteTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a color'**
  String get scanPaletteTitle;

  /// No description provided for @scanOpen3d.
  ///
  /// In en, this message translates to:
  /// **'Open in 3D'**
  String get scanOpen3d;

  /// No description provided for @scanRestart.
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get scanRestart;

  /// No description provided for @modeTimer.
  ///
  /// In en, this message translates to:
  /// **'Speed timer'**
  String get modeTimer;

  /// No description provided for @modeTimerDesc.
  ///
  /// In en, this message translates to:
  /// **'Scrambles, inspection, averages and personal bests.'**
  String get modeTimerDesc;

  /// No description provided for @modeDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily challenge'**
  String get modeDaily;

  /// No description provided for @modeDailyDesc.
  ///
  /// In en, this message translates to:
  /// **'A new scramble every day. Keep your streak alive.'**
  String get modeDailyDesc;

  /// No description provided for @modePatterns.
  ///
  /// In en, this message translates to:
  /// **'Pattern library'**
  String get modePatterns;

  /// No description provided for @modePatternsDesc.
  ///
  /// In en, this message translates to:
  /// **'Checkerboards, superflip and more, played in 3D.'**
  String get modePatternsDesc;

  /// No description provided for @streakDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1-day streak} other{{count}-day streak}}'**
  String streakDays(int count);

  /// No description provided for @continueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue learning'**
  String get continueLearning;

  /// No description provided for @startLearning.
  ///
  /// In en, this message translates to:
  /// **'Start learning'**
  String get startLearning;

  /// No description provided for @lessonOf.
  ///
  /// In en, this message translates to:
  /// **'Lesson {index} of {total}'**
  String lessonOf(int index, int total);

  /// No description provided for @academyAllDone.
  ///
  /// In en, this message translates to:
  /// **'Every lesson completed!'**
  String get academyAllDone;

  /// No description provided for @academyTitle.
  ///
  /// In en, this message translates to:
  /// **'Academy'**
  String get academyTitle;

  /// No description provided for @academyProgress.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} lessons completed'**
  String academyProgress(int done, int total);

  /// No description provided for @lessonAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get lessonAdvanced;

  /// No description provided for @lessonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get lessonDone;

  /// No description provided for @lessonPartOf.
  ///
  /// In en, this message translates to:
  /// **'Part {index} of {total}'**
  String lessonPartOf(int index, int total);

  /// No description provided for @lessonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get lessonBack;

  /// No description provided for @lessonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get lessonNext;

  /// No description provided for @lessonFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish lesson'**
  String get lessonFinish;

  /// No description provided for @lessonComplete.
  ///
  /// In en, this message translates to:
  /// **'Lesson complete!'**
  String get lessonComplete;

  /// No description provided for @lessonNextLesson.
  ///
  /// In en, this message translates to:
  /// **'Next lesson'**
  String get lessonNextLesson;

  /// No description provided for @lessonBackToAcademy.
  ///
  /// In en, this message translates to:
  /// **'Back to the Academy'**
  String get lessonBackToAcademy;

  /// No description provided for @lessonTryIt.
  ///
  /// In en, this message translates to:
  /// **'Your turn: swipe the layer the arrow shows, or tap Next move.'**
  String get lessonTryIt;

  /// No description provided for @lessonLookAround.
  ///
  /// In en, this message translates to:
  /// **'Drag the background to look at the cube from every side.'**
  String get lessonLookAround;

  /// No description provided for @lessonDemoDone.
  ///
  /// In en, this message translates to:
  /// **'Nice! Tap Next to continue.'**
  String get lessonDemoDone;

  /// No description provided for @holdPrompt.
  ///
  /// In en, this message translates to:
  /// **'Hold the cube with the {top} center on top and the {front} center facing you.'**
  String holdPrompt(String top, String front);

  /// No description provided for @trackBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner 3×3: the 3 crowns'**
  String get trackBeginner;

  /// No description provided for @trackCfop.
  ///
  /// In en, this message translates to:
  /// **'Intro to CFOP'**
  String get trackCfop;

  /// No description provided for @trackTwoByTwo.
  ///
  /// In en, this message translates to:
  /// **'2×2 beginner & Ortega'**
  String get trackTwoByTwo;

  /// No description provided for @trackBigCubes.
  ///
  /// In en, this message translates to:
  /// **'Big cubes: reduction & parity'**
  String get trackBigCubes;

  /// No description provided for @moveSentence.
  ///
  /// In en, this message translates to:
  /// **'Turn {layer} {direction}'**
  String moveSentence(String layer, String direction);

  /// No description provided for @moveFaceR.
  ///
  /// In en, this message translates to:
  /// **'the right face'**
  String get moveFaceR;

  /// No description provided for @moveFaceL.
  ///
  /// In en, this message translates to:
  /// **'the left face'**
  String get moveFaceL;

  /// No description provided for @moveFaceU.
  ///
  /// In en, this message translates to:
  /// **'the top face'**
  String get moveFaceU;

  /// No description provided for @moveFaceD.
  ///
  /// In en, this message translates to:
  /// **'the bottom face'**
  String get moveFaceD;

  /// No description provided for @moveFaceF.
  ///
  /// In en, this message translates to:
  /// **'the front face'**
  String get moveFaceF;

  /// No description provided for @moveFaceB.
  ///
  /// In en, this message translates to:
  /// **'the back face'**
  String get moveFaceB;

  /// No description provided for @moveLayerInner.
  ///
  /// In en, this message translates to:
  /// **'layer {depth} from {face}'**
  String moveLayerInner(int depth, String face);

  /// No description provided for @moveLayerWide.
  ///
  /// In en, this message translates to:
  /// **'{face} ({depth} layers deep)'**
  String moveLayerWide(int depth, String face);

  /// No description provided for @moveLayerBlock.
  ///
  /// In en, this message translates to:
  /// **'layers {near}–{far} from {face}'**
  String moveLayerBlock(int near, int far, String face);

  /// No description provided for @moveLayerMiddle.
  ///
  /// In en, this message translates to:
  /// **'the middle layer'**
  String get moveLayerMiddle;

  /// No description provided for @moveDirUp.
  ///
  /// In en, this message translates to:
  /// **'up'**
  String get moveDirUp;

  /// No description provided for @moveDirDown.
  ///
  /// In en, this message translates to:
  /// **'down'**
  String get moveDirDown;

  /// No description provided for @moveDirLeft.
  ///
  /// In en, this message translates to:
  /// **'to the left'**
  String get moveDirLeft;

  /// No description provided for @moveDirRight.
  ///
  /// In en, this message translates to:
  /// **'to the right'**
  String get moveDirRight;

  /// No description provided for @moveDirClockwise.
  ///
  /// In en, this message translates to:
  /// **'clockwise'**
  String get moveDirClockwise;

  /// No description provided for @moveDirCounter.
  ///
  /// In en, this message translates to:
  /// **'counter-clockwise'**
  String get moveDirCounter;

  /// No description provided for @moveDirBackClockwise.
  ///
  /// In en, this message translates to:
  /// **'clockwise, as seen from the back'**
  String get moveDirBackClockwise;

  /// No description provided for @moveDirBackCounter.
  ///
  /// In en, this message translates to:
  /// **'counter-clockwise, as seen from the back'**
  String get moveDirBackCounter;

  /// No description provided for @moveDirHalf.
  ///
  /// In en, this message translates to:
  /// **'half a turn (twice)'**
  String get moveDirHalf;

  /// No description provided for @moveRotateX.
  ///
  /// In en, this message translates to:
  /// **'Tilt the whole cube: the front goes up to the top'**
  String get moveRotateX;

  /// No description provided for @moveRotateXPrime.
  ///
  /// In en, this message translates to:
  /// **'Tilt the whole cube: the front goes down to the bottom'**
  String get moveRotateXPrime;

  /// No description provided for @moveRotateX2.
  ///
  /// In en, this message translates to:
  /// **'Flip the whole cube over: the front goes to the back'**
  String get moveRotateX2;

  /// No description provided for @moveRotateY.
  ///
  /// In en, this message translates to:
  /// **'Spin the whole cube: the front goes to the left'**
  String get moveRotateY;

  /// No description provided for @moveRotateYPrime.
  ///
  /// In en, this message translates to:
  /// **'Spin the whole cube: the front goes to the right'**
  String get moveRotateYPrime;

  /// No description provided for @moveRotateY2.
  ///
  /// In en, this message translates to:
  /// **'Spin the whole cube half a turn: the back comes to the front'**
  String get moveRotateY2;

  /// No description provided for @moveRotateZ.
  ///
  /// In en, this message translates to:
  /// **'Roll the whole cube clockwise: the top goes to the right'**
  String get moveRotateZ;

  /// No description provided for @moveRotateZPrime.
  ///
  /// In en, this message translates to:
  /// **'Roll the whole cube counter-clockwise: the top goes to the left'**
  String get moveRotateZPrime;

  /// No description provided for @moveRotateZ2.
  ///
  /// In en, this message translates to:
  /// **'Roll the whole cube upside down: the top goes to the bottom'**
  String get moveRotateZ2;

  /// No description provided for @phaseReductionCenters.
  ///
  /// In en, this message translates to:
  /// **'Centers'**
  String get phaseReductionCenters;

  /// No description provided for @phaseReductionEdges.
  ///
  /// In en, this message translates to:
  /// **'Pair the edges'**
  String get phaseReductionEdges;

  /// No description provided for @phaseReductionEdgeParity.
  ///
  /// In en, this message translates to:
  /// **'Edge parity'**
  String get phaseReductionEdgeParity;

  /// No description provided for @phaseReductionOllParity.
  ///
  /// In en, this message translates to:
  /// **'OLL parity'**
  String get phaseReductionOllParity;

  /// No description provided for @phaseReductionPllParity.
  ///
  /// In en, this message translates to:
  /// **'PLL parity'**
  String get phaseReductionPllParity;

  /// No description provided for @explainReductionCenterBlock.
  ///
  /// In en, this message translates to:
  /// **'Slice turns that bring several center pieces home at once.'**
  String get explainReductionCenterBlock;

  /// No description provided for @explainReductionCenterCycle.
  ///
  /// In en, this message translates to:
  /// **'Bring a {piece} center piece to its face with a 3-cycle that leaves finished centers alone.'**
  String explainReductionCenterCycle(String piece);

  /// No description provided for @explainReductionParityCenters.
  ///
  /// In en, this message translates to:
  /// **'Rebuild the centers that the parity slice turn moved.'**
  String get explainReductionParityCenters;

  /// No description provided for @explainReductionEdgeCycle.
  ///
  /// In en, this message translates to:
  /// **'Join the {piece} edge pieces with a 3-cycle; the centers stay solved.'**
  String explainReductionEdgeCycle(String piece);

  /// No description provided for @explainReductionEdgeParity.
  ///
  /// In en, this message translates to:
  /// **'The last edges can\'t be paired with 3-cycles alone (edge parity). One inner-slice turn fixes that.'**
  String get explainReductionEdgeParity;

  /// No description provided for @explainReductionOllParity.
  ///
  /// In en, this message translates to:
  /// **'OLL parity: one edge is flipped, which can\'t happen on a 3×3. This algorithm flips it back.'**
  String get explainReductionOllParity;

  /// No description provided for @explainReductionPllParity.
  ///
  /// In en, this message translates to:
  /// **'PLL parity: two edges are swapped, impossible on a 3×3. This algorithm swaps them back.'**
  String get explainReductionPllParity;

  /// No description provided for @patternsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pattern library'**
  String get patternsTitle;

  /// No description provided for @patternsHint.
  ///
  /// In en, this message translates to:
  /// **'Tap a pattern to watch it, then follow along on your own cube.'**
  String get patternsHint;

  /// No description provided for @patternCheckerboard.
  ///
  /// In en, this message translates to:
  /// **'Checkerboard'**
  String get patternCheckerboard;

  /// No description provided for @patternCubeInCube.
  ///
  /// In en, this message translates to:
  /// **'Cube in a cube'**
  String get patternCubeInCube;

  /// No description provided for @patternSuperflip.
  ///
  /// In en, this message translates to:
  /// **'Superflip'**
  String get patternSuperflip;

  /// No description provided for @patternDots.
  ///
  /// In en, this message translates to:
  /// **'Dots'**
  String get patternDots;

  /// No description provided for @patternCross.
  ///
  /// In en, this message translates to:
  /// **'Cross'**
  String get patternCross;

  /// No description provided for @patternPython.
  ///
  /// In en, this message translates to:
  /// **'Python'**
  String get patternPython;

  /// No description provided for @phasePattern.
  ///
  /// In en, this message translates to:
  /// **'Make the pattern'**
  String get phasePattern;

  /// No description provided for @explainPatternStep.
  ///
  /// In en, this message translates to:
  /// **'Follow each move on your own cube. Tap Solve to bring it back to normal.'**
  String get explainPatternStep;

  /// No description provided for @patternTitle.
  ///
  /// In en, this message translates to:
  /// **'{name} · {size}×{size}'**
  String patternTitle(String name, int size);

  /// No description provided for @timerTitle.
  ///
  /// In en, this message translates to:
  /// **'Speed timer'**
  String get timerTitle;

  /// No description provided for @timerHoldToStart.
  ///
  /// In en, this message translates to:
  /// **'Hold, then release to start'**
  String get timerHoldToStart;

  /// No description provided for @timerReleaseToStart.
  ///
  /// In en, this message translates to:
  /// **'Release to start'**
  String get timerReleaseToStart;

  /// No description provided for @timerTapToStop.
  ///
  /// In en, this message translates to:
  /// **'Tap anywhere to stop'**
  String get timerTapToStop;

  /// No description provided for @timerInspecting.
  ///
  /// In en, this message translates to:
  /// **'Inspection: hold, then release to start'**
  String get timerInspecting;

  /// No description provided for @timerTapToInspect.
  ///
  /// In en, this message translates to:
  /// **'Tap to start the 15-second inspection'**
  String get timerTapToInspect;

  /// No description provided for @timerInspectionToggle.
  ///
  /// In en, this message translates to:
  /// **'15 s inspection'**
  String get timerInspectionToggle;

  /// No description provided for @timerNewScramble.
  ///
  /// In en, this message translates to:
  /// **'New scramble'**
  String get timerNewScramble;

  /// No description provided for @timerLoadingScramble.
  ///
  /// In en, this message translates to:
  /// **'Generating a scramble…'**
  String get timerLoadingScramble;

  /// No description provided for @timerPb.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get timerPb;

  /// No description provided for @timerSolves.
  ///
  /// In en, this message translates to:
  /// **'Solves'**
  String get timerSolves;

  /// No description provided for @timerPlus2.
  ///
  /// In en, this message translates to:
  /// **'+2'**
  String get timerPlus2;

  /// No description provided for @timerDnf.
  ///
  /// In en, this message translates to:
  /// **'DNF'**
  String get timerDnf;

  /// No description provided for @timerDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get timerDelete;

  /// No description provided for @timerHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get timerHistory;

  /// No description provided for @timerNoSolves.
  ///
  /// In en, this message translates to:
  /// **'No solves yet. Scramble your cube and go!'**
  String get timerNoSolves;

  /// No description provided for @timerNewPb.
  ///
  /// In en, this message translates to:
  /// **'New personal best!'**
  String get timerNewPb;

  /// No description provided for @timerClearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear history'**
  String get timerClearHistory;

  /// No description provided for @timerScrambleHint.
  ///
  /// In en, this message translates to:
  /// **'Hold white on top and green in front, then scramble:'**
  String get timerScrambleHint;

  /// No description provided for @dailyTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily challenge'**
  String get dailyTitle;

  /// No description provided for @dailyFor.
  ///
  /// In en, this message translates to:
  /// **'Challenge for {date}'**
  String dailyFor(String date);

  /// No description provided for @dailyBestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best streak: {count}'**
  String dailyBestStreak(int count);

  /// No description provided for @dailyDone.
  ///
  /// In en, this message translates to:
  /// **'Done for today! Come back tomorrow.'**
  String get dailyDone;

  /// No description provided for @dailyNotDone.
  ///
  /// In en, this message translates to:
  /// **'Solve today\'s scramble to keep your streak.'**
  String get dailyNotDone;

  /// No description provided for @dailySolveVirtual.
  ///
  /// In en, this message translates to:
  /// **'Solve on the 3D cube'**
  String get dailySolveVirtual;

  /// No description provided for @dailyTimeIt.
  ///
  /// In en, this message translates to:
  /// **'Time it on your cube'**
  String get dailyTimeIt;

  /// No description provided for @dailyHint.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get dailyHint;

  /// No description provided for @dailyHintText.
  ///
  /// In en, this message translates to:
  /// **'Start with the white cross: {moves}'**
  String dailyHintText(String moves);

  /// No description provided for @dailyHintFailed.
  ///
  /// In en, this message translates to:
  /// **'No hint is available right now.'**
  String get dailyHintFailed;

  /// No description provided for @lessonBasics.
  ///
  /// In en, this message translates to:
  /// **'Meet the cube'**
  String get lessonBasics;

  /// No description provided for @lessonBasicsDesc.
  ///
  /// In en, this message translates to:
  /// **'Pieces, faces and move names.'**
  String get lessonBasicsDesc;

  /// No description provided for @stepBasicsPieces.
  ///
  /// In en, this message translates to:
  /// **'Three kinds of pieces'**
  String get stepBasicsPieces;

  /// No description provided for @stepBasicsPiecesBody.
  ///
  /// In en, this message translates to:
  /// **'Centers never move and give each face its color. Edges have two colors, corners have three. Solving means moving every edge and corner next to the centers that match.'**
  String get stepBasicsPiecesBody;

  /// No description provided for @stepBasicsFaces.
  ///
  /// In en, this message translates to:
  /// **'Six face letters'**
  String get stepBasicsFaces;

  /// No description provided for @stepBasicsFacesBody.
  ///
  /// In en, this message translates to:
  /// **'R, L, U, D, F and B are the right, left, up, down, front and back faces. A letter alone means a clockwise quarter turn, as if you looked straight at that face.'**
  String get stepBasicsFacesBody;

  /// No description provided for @stepBasicsPrime.
  ///
  /// In en, this message translates to:
  /// **'Prime and double turns'**
  String get stepBasicsPrime;

  /// No description provided for @stepBasicsPrimeBody.
  ///
  /// In en, this message translates to:
  /// **'An apostrophe (R\') turns the other way, counter-clockwise. A 2 (U2) is a half turn: two quarter turns.'**
  String get stepBasicsPrimeBody;

  /// No description provided for @stepCrossGoal.
  ///
  /// In en, this message translates to:
  /// **'The goal'**
  String get stepCrossGoal;

  /// No description provided for @stepCrossGoalBody.
  ///
  /// In en, this message translates to:
  /// **'Hold yellow on top. The four white edges go around the white center on the bottom, each side color matching the center next to it.'**
  String get stepCrossGoalBody;

  /// No description provided for @stepCrossTop.
  ///
  /// In en, this message translates to:
  /// **'Edge on top'**
  String get stepCrossTop;

  /// No description provided for @stepCrossTopBody.
  ///
  /// In en, this message translates to:
  /// **'Find a white edge on top. Turn the top until its side color sits above the matching center, then turn that face twice to drop it in.'**
  String get stepCrossTopBody;

  /// No description provided for @stepCrossMiddle.
  ///
  /// In en, this message translates to:
  /// **'Edge in the middle'**
  String get stepCrossMiddle;

  /// No description provided for @stepCrossMiddleBody.
  ///
  /// In en, this message translates to:
  /// **'An edge stuck in the middle layer goes up first: turn its side up, move the top out of the way and turn the side back, so the cross stays intact. Then place it from the top.'**
  String get stepCrossMiddleBody;

  /// No description provided for @stepCornersInsert.
  ///
  /// In en, this message translates to:
  /// **'Above its spot'**
  String get stepCornersInsert;

  /// No description provided for @stepCornersInsertBody.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until a white corner sits above the spot where its colors belong, at the front right. R U R\' U\' then drops it in.'**
  String get stepCornersInsertBody;

  /// No description provided for @stepCornersRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat the trigger'**
  String get stepCornersRepeat;

  /// No description provided for @stepCornersRepeatBody.
  ///
  /// In en, this message translates to:
  /// **'If white faces the wrong way, keep repeating R U R\' U\' over the same spot. Every corner is solved after at most five repeats.'**
  String get stepCornersRepeatBody;

  /// No description provided for @stepMiddleRight.
  ///
  /// In en, this message translates to:
  /// **'Edge to the right'**
  String get stepMiddleRight;

  /// No description provided for @stepMiddleRightBody.
  ///
  /// In en, this message translates to:
  /// **'Line up a top edge with its center on the front. If its top color matches the right center, insert it with U R U\' R\' U\' F\' U F.'**
  String get stepMiddleRightBody;

  /// No description provided for @stepMiddleLeft.
  ///
  /// In en, this message translates to:
  /// **'Edge to the left'**
  String get stepMiddleLeft;

  /// No description provided for @stepMiddleLeftBody.
  ///
  /// In en, this message translates to:
  /// **'If its top color matches the left center instead, use the mirror: U\' L\' U L U F U\' F\'.'**
  String get stepMiddleLeftBody;

  /// No description provided for @stepYellowCross.
  ///
  /// In en, this message translates to:
  /// **'One algorithm'**
  String get stepYellowCross;

  /// No description provided for @stepYellowCrossBody.
  ///
  /// In en, this message translates to:
  /// **'F R U R\' U\' F\' turns a yellow dot into an L, an L into a line and a line into the cross. Hold the L at the back left and the line sideways.'**
  String get stepYellowCrossBody;

  /// No description provided for @stepYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Match the edges'**
  String get stepYellowEdges;

  /// No description provided for @stepYellowEdgesBody.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until two edges match their centers. With one at the back and one on the right, R U R\' U R U2 R\' U swaps the other two.'**
  String get stepYellowEdgesBody;

  /// No description provided for @stepPlaceCorners.
  ///
  /// In en, this message translates to:
  /// **'Place them'**
  String get stepPlaceCorners;

  /// No description provided for @stepPlaceCornersBody.
  ///
  /// In en, this message translates to:
  /// **'Hold a corner that is already in its spot at the front right. U R U\' L\' U R\' U\' L moves the other three around; repeat until all four are home.'**
  String get stepPlaceCornersBody;

  /// No description provided for @stepTwistCorners.
  ///
  /// In en, this message translates to:
  /// **'Twist them'**
  String get stepTwistCorners;

  /// No description provided for @stepTwistCornersBody.
  ///
  /// In en, this message translates to:
  /// **'With an unsolved corner at the front right, repeat R\' D\' R D until yellow is on top, then turn only the top to bring the next one. The bottom looks broken until the very end: keep going.'**
  String get stepTwistCornersBody;

  /// No description provided for @lessonCfopIntro.
  ///
  /// In en, this message translates to:
  /// **'What is CFOP?'**
  String get lessonCfopIntro;

  /// No description provided for @lessonCfopIntroDesc.
  ///
  /// In en, this message translates to:
  /// **'Cross, F2L, OLL, PLL.'**
  String get lessonCfopIntroDesc;

  /// No description provided for @stepCfopOverview.
  ///
  /// In en, this message translates to:
  /// **'Four stages'**
  String get stepCfopOverview;

  /// No description provided for @stepCfopOverviewBody.
  ///
  /// In en, this message translates to:
  /// **'Speedcubers solve the cross, then pair each first-layer corner with its middle edge (F2L), orient the last layer (OLL) and finally permute it (PLL).'**
  String get stepCfopOverviewBody;

  /// No description provided for @stepCfopCross.
  ///
  /// In en, this message translates to:
  /// **'Plan the cross'**
  String get stepCfopCross;

  /// No description provided for @stepCfopCrossBody.
  ///
  /// In en, this message translates to:
  /// **'In CFOP the cross is planned during inspection and built on the bottom in about eight moves.'**
  String get stepCfopCrossBody;

  /// No description provided for @lessonF2l.
  ///
  /// In en, this message translates to:
  /// **'F2L basics'**
  String get lessonF2l;

  /// No description provided for @lessonF2lDesc.
  ///
  /// In en, this message translates to:
  /// **'Pair a corner with its edge.'**
  String get lessonF2lDesc;

  /// No description provided for @stepF2lRight.
  ///
  /// In en, this message translates to:
  /// **'Insert a pair'**
  String get stepF2lRight;

  /// No description provided for @stepF2lRightBody.
  ///
  /// In en, this message translates to:
  /// **'When a corner and its edge sit side by side on top, bring them above their slot and insert them together.'**
  String get stepF2lRightBody;

  /// No description provided for @stepF2lLeft.
  ///
  /// In en, this message translates to:
  /// **'Left-hand pair'**
  String get stepF2lLeft;

  /// No description provided for @stepF2lLeftBody.
  ///
  /// In en, this message translates to:
  /// **'The same case on the other side is the mirror, U\' L\' U L. Rotating the cube (y) lets you use whichever hand is easier.'**
  String get stepF2lLeftBody;

  /// No description provided for @lessonOll.
  ///
  /// In en, this message translates to:
  /// **'Two-look OLL'**
  String get lessonOll;

  /// No description provided for @lessonOllDesc.
  ///
  /// In en, this message translates to:
  /// **'Make the top yellow.'**
  String get lessonOllDesc;

  /// No description provided for @stepOllCross.
  ///
  /// In en, this message translates to:
  /// **'Edges first'**
  String get stepOllCross;

  /// No description provided for @stepOllCrossBody.
  ///
  /// In en, this message translates to:
  /// **'Two-look OLL starts with the yellow-cross algorithm you already know.'**
  String get stepOllCrossBody;

  /// No description provided for @stepOllSune.
  ///
  /// In en, this message translates to:
  /// **'Sune'**
  String get stepOllSune;

  /// No description provided for @stepOllSuneBody.
  ///
  /// In en, this message translates to:
  /// **'With one yellow corner facing up at the front left, Sune (R U R\' U R U2 R\') orients the other three. Most other cases use Sune and its mirror.'**
  String get stepOllSuneBody;

  /// No description provided for @lessonPll.
  ///
  /// In en, this message translates to:
  /// **'Two-look PLL'**
  String get lessonPll;

  /// No description provided for @lessonPllDesc.
  ///
  /// In en, this message translates to:
  /// **'Finish the cube.'**
  String get lessonPllDesc;

  /// No description provided for @stepPllT.
  ///
  /// In en, this message translates to:
  /// **'T-perm'**
  String get stepPllT;

  /// No description provided for @stepPllTBody.
  ///
  /// In en, this message translates to:
  /// **'The T-perm swaps two corners and two edges. Use it to place the corners: hold the two corners that must swap on the right.'**
  String get stepPllTBody;

  /// No description provided for @stepPllU.
  ///
  /// In en, this message translates to:
  /// **'U-perm'**
  String get stepPllU;

  /// No description provided for @stepPllUBody.
  ///
  /// In en, this message translates to:
  /// **'With the corners done, the U-perm cycles three edges. Keep the finished side at the back.'**
  String get stepPllUBody;

  /// No description provided for @lessonTwoFirst.
  ///
  /// In en, this message translates to:
  /// **'2×2 first layer'**
  String get lessonTwoFirst;

  /// No description provided for @lessonTwoFirstDesc.
  ///
  /// In en, this message translates to:
  /// **'Build one side with matching corners.'**
  String get lessonTwoFirstDesc;

  /// No description provided for @stepTwoIntro.
  ///
  /// In en, this message translates to:
  /// **'Only corners'**
  String get stepTwoIntro;

  /// No description provided for @stepTwoIntroBody.
  ///
  /// In en, this message translates to:
  /// **'A 2×2 is a 3×3 without edges and centers. Pick a color, build that face on the bottom, and make the side colors of neighbouring corners match.'**
  String get stepTwoIntroBody;

  /// No description provided for @stepTwoCorner.
  ///
  /// In en, this message translates to:
  /// **'Insert corners'**
  String get stepTwoCorner;

  /// No description provided for @stepTwoCornerBody.
  ///
  /// In en, this message translates to:
  /// **'Exactly like the 3×3 white corners: bring a corner above its spot and use R U R\' U\' until it fits.'**
  String get stepTwoCornerBody;

  /// No description provided for @lessonTwoOll.
  ///
  /// In en, this message translates to:
  /// **'Orient the top'**
  String get lessonTwoOll;

  /// No description provided for @lessonTwoOllDesc.
  ///
  /// In en, this message translates to:
  /// **'Ortega OLL with Sune.'**
  String get lessonTwoOllDesc;

  /// No description provided for @stepTwoSune.
  ///
  /// In en, this message translates to:
  /// **'Sune again'**
  String get stepTwoSune;

  /// No description provided for @stepTwoSuneBody.
  ///
  /// In en, this message translates to:
  /// **'Sune turns the top yellow on a 2×2 too. Ortega solvers learn seven short cases; Sune and its mirror cover most of them.'**
  String get stepTwoSuneBody;

  /// No description provided for @lessonTwoPbl.
  ///
  /// In en, this message translates to:
  /// **'Permute both layers'**
  String get lessonTwoPbl;

  /// No description provided for @lessonTwoPblDesc.
  ///
  /// In en, this message translates to:
  /// **'Swap corners to finish.'**
  String get lessonTwoPblDesc;

  /// No description provided for @stepTwoAdjacent.
  ///
  /// In en, this message translates to:
  /// **'Adjacent swap'**
  String get stepTwoAdjacent;

  /// No description provided for @stepTwoAdjacentBody.
  ///
  /// In en, this message translates to:
  /// **'When two neighbouring top corners must swap, hold them on the right and use the T-perm.'**
  String get stepTwoAdjacentBody;

  /// No description provided for @stepTwoDiagonal.
  ///
  /// In en, this message translates to:
  /// **'Diagonal swap'**
  String get stepTwoDiagonal;

  /// No description provided for @stepTwoDiagonalBody.
  ///
  /// In en, this message translates to:
  /// **'Two corners in opposite spots swap with the Y-perm.'**
  String get stepTwoDiagonalBody;

  /// No description provided for @lessonBigIntro.
  ///
  /// In en, this message translates to:
  /// **'Big cube pieces'**
  String get lessonBigIntro;

  /// No description provided for @lessonBigIntroDesc.
  ///
  /// In en, this message translates to:
  /// **'Centers, wings and slices.'**
  String get lessonBigIntroDesc;

  /// No description provided for @stepBigPieces.
  ///
  /// In en, this message translates to:
  /// **'No fixed centers'**
  String get stepBigPieces;

  /// No description provided for @stepBigPiecesBody.
  ///
  /// In en, this message translates to:
  /// **'On a 4×4 each face has four center pieces that move around, and every edge is made of two wings. Reduction groups them so the cube behaves like a 3×3.'**
  String get stepBigPiecesBody;

  /// No description provided for @stepBigSlices.
  ///
  /// In en, this message translates to:
  /// **'Wide and inner turns'**
  String get stepBigSlices;

  /// No description provided for @stepBigSlicesBody.
  ///
  /// In en, this message translates to:
  /// **'Rw turns the two right layers together. 2R turns only the second layer from the right. These turns move centers and wings.'**
  String get stepBigSlicesBody;

  /// No description provided for @lessonBigCenters.
  ///
  /// In en, this message translates to:
  /// **'Centers'**
  String get lessonBigCenters;

  /// No description provided for @lessonBigCentersDesc.
  ///
  /// In en, this message translates to:
  /// **'Group the center pieces.'**
  String get lessonBigCentersDesc;

  /// No description provided for @stepBigCenterCycle.
  ///
  /// In en, this message translates to:
  /// **'A center 3-cycle'**
  String get stepBigCenterCycle;

  /// No description provided for @stepBigCenterCycleBody.
  ///
  /// In en, this message translates to:
  /// **'This commutator moves exactly three center pieces and leaves everything else alone, so finished centers stay finished.'**
  String get stepBigCenterCycleBody;

  /// No description provided for @lessonBigEdges.
  ///
  /// In en, this message translates to:
  /// **'Pair the edges'**
  String get lessonBigEdges;

  /// No description provided for @lessonBigEdgesDesc.
  ///
  /// In en, this message translates to:
  /// **'Join wings into full edges.'**
  String get lessonBigEdgesDesc;

  /// No description provided for @stepBigEdgePair.
  ///
  /// In en, this message translates to:
  /// **'Pair and restore'**
  String get stepBigEdgePair;

  /// No description provided for @stepBigEdgePairBody.
  ///
  /// In en, this message translates to:
  /// **'Uw\' lines two matching wings up, R U R\' F R\' F\' R swaps in an unpaired edge, and Uw puts the centers back.'**
  String get stepBigEdgePairBody;

  /// No description provided for @lessonBigParity.
  ///
  /// In en, this message translates to:
  /// **'Parity'**
  String get lessonBigParity;

  /// No description provided for @lessonBigParityDesc.
  ///
  /// In en, this message translates to:
  /// **'OLL and PLL parity on even cubes.'**
  String get lessonBigParityDesc;

  /// No description provided for @stepBigOllParity.
  ///
  /// In en, this message translates to:
  /// **'OLL parity'**
  String get stepBigOllParity;

  /// No description provided for @stepBigOllParityBody.
  ///
  /// In en, this message translates to:
  /// **'A single flipped edge can\'t happen on a 3×3. On even cubes this algorithm flips the top-front edge back. It may shuffle the rest of the top layer, which the last 3×3 steps fix anyway.'**
  String get stepBigOllParityBody;

  /// No description provided for @stepBigPllParity.
  ///
  /// In en, this message translates to:
  /// **'PLL parity'**
  String get stepBigPllParity;

  /// No description provided for @stepBigPllParityBody.
  ///
  /// In en, this message translates to:
  /// **'Two swapped edges at the very end? 2R2 U2 2R2 Uw2 2R2 Uw2 swaps the front and back top edges.'**
  String get stepBigPllParityBody;

  /// No description provided for @introGoalHeading.
  ///
  /// In en, this message translates to:
  /// **'What\'s the goal?'**
  String get introGoalHeading;

  /// No description provided for @introHowHeading.
  ///
  /// In en, this message translates to:
  /// **'How do we do it?'**
  String get introHowHeading;

  /// No description provided for @introStart.
  ///
  /// In en, this message translates to:
  /// **'Got it, start step by step'**
  String get introStart;

  /// No description provided for @introShowGoal.
  ///
  /// In en, this message translates to:
  /// **'Show the goal'**
  String get introShowGoal;

  /// No description provided for @introStateStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get introStateStart;

  /// No description provided for @introStateGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get introStateGoal;

  /// No description provided for @introPlayMorph.
  ///
  /// In en, this message translates to:
  /// **'Play from start to goal'**
  String get introPlayMorph;

  /// No description provided for @introGoalBasics.
  ///
  /// In en, this message translates to:
  /// **'Learn to read the cube: its pieces, its six faces and how the move letters turn them.'**
  String get introGoalBasics;

  /// No description provided for @introGoalCross.
  ///
  /// In en, this message translates to:
  /// **'Make a white plus sign where every white edge also matches the center color beside it.'**
  String get introGoalCross;

  /// No description provided for @introGoalCorners.
  ///
  /// In en, this message translates to:
  /// **'Fill in the four white corners so the first crown, the whole white layer, is complete.'**
  String get introGoalCorners;

  /// No description provided for @introGoalMiddle.
  ///
  /// In en, this message translates to:
  /// **'Place the four middle-layer edges so the first two layers are solved.'**
  String get introGoalMiddle;

  /// No description provided for @introGoalYellowCross.
  ///
  /// In en, this message translates to:
  /// **'Make a yellow plus sign on top; the side colors don\'t need to match yet.'**
  String get introGoalYellowCross;

  /// No description provided for @introGoalYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Line up every yellow cross edge with the center color on its side.'**
  String get introGoalYellowEdges;

  /// No description provided for @introGoalYellowCorners.
  ///
  /// In en, this message translates to:
  /// **'Move every yellow corner to its own spot, even if it is still twisted.'**
  String get introGoalYellowCorners;

  /// No description provided for @introGoalTwistCorners.
  ///
  /// In en, this message translates to:
  /// **'Twist the yellow corners the right way so the whole cube is solved.'**
  String get introGoalTwistCorners;

  /// No description provided for @introGoalCfopIntro.
  ///
  /// In en, this message translates to:
  /// **'See the speedcubing plan: cross, first two layers, then the last layer in two looks.'**
  String get introGoalCfopIntro;

  /// No description provided for @introGoalF2l.
  ///
  /// In en, this message translates to:
  /// **'Insert each white corner together with its middle edge, finishing two layers at once.'**
  String get introGoalF2l;

  /// No description provided for @introGoalOll.
  ///
  /// In en, this message translates to:
  /// **'Make the whole top face yellow with one or two algorithms.'**
  String get introGoalOll;

  /// No description provided for @introGoalPll.
  ///
  /// In en, this message translates to:
  /// **'Move the last-layer pieces to their spots to finish the cube.'**
  String get introGoalPll;

  /// No description provided for @introGoalTwoFirst.
  ///
  /// In en, this message translates to:
  /// **'Build one complete white layer on the 2×2.'**
  String get introGoalTwoFirst;

  /// No description provided for @introGoalTwoOll.
  ///
  /// In en, this message translates to:
  /// **'Make the top face of the 2×2 all yellow.'**
  String get introGoalTwoOll;

  /// No description provided for @introGoalTwoPbl.
  ///
  /// In en, this message translates to:
  /// **'Swap the last corners into place to solve the 2×2.'**
  String get introGoalTwoPbl;

  /// No description provided for @introGoalBigIntro.
  ///
  /// In en, this message translates to:
  /// **'Meet the 4×4: centers, edge pairs and corners, and the moves that turn them.'**
  String get introGoalBigIntro;

  /// No description provided for @introGoalBigCenters.
  ///
  /// In en, this message translates to:
  /// **'Gather each face\'s center pieces into one solid block of color.'**
  String get introGoalBigCenters;

  /// No description provided for @introGoalBigEdges.
  ///
  /// In en, this message translates to:
  /// **'Pair up matching edge pieces so every edge looks like a single 3×3 edge.'**
  String get introGoalBigEdges;

  /// No description provided for @introGoalBigParity.
  ///
  /// In en, this message translates to:
  /// **'Fix the two 4×4 cases a 3×3 never has: one flipped edge or two swapped edges.'**
  String get introGoalBigParity;

  /// No description provided for @introHowBasics.
  ///
  /// In en, this message translates to:
  /// **'Centers never move, so they tell you each face\'s color.\nEach letter turns one face a quarter turn clockwise.\nAn apostrophe (\') turns it back; a 2 turns it twice.'**
  String get introHowBasics;

  /// No description provided for @introHowCross.
  ///
  /// In en, this message translates to:
  /// **'Hold yellow on top: the white cross is built on the bottom.\nFind a white edge and line its side color up with the matching center.\nTurn that face twice to drop the edge into place.'**
  String get introHowCross;

  /// No description provided for @introHowCorners.
  ///
  /// In en, this message translates to:
  /// **'Bring a white corner above its empty spot.\nRepeat R U R\' U\' until it drops in the right way round.\nDo the same for the other three corners.'**
  String get introHowCorners;

  /// No description provided for @introHowMiddle.
  ///
  /// In en, this message translates to:
  /// **'Find a top edge without yellow and match its front color to a center.\nSend it right or left with a short 8-move algorithm.\nThe white layer comes back intact every time.'**
  String get introHowMiddle;

  /// No description provided for @introHowYellowCross.
  ///
  /// In en, this message translates to:
  /// **'Look at the top: a dot, an L or a line.\nHold it as shown and do F R U R\' U\' F\'.\nRepeat until the yellow cross appears.'**
  String get introHowYellowCross;

  /// No description provided for @introHowYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until two edges match their centers.\nHold them at the back and right, then do R U R\' U R U2 R\' U.\nRepeat until all four edges match.'**
  String get introHowYellowEdges;

  /// No description provided for @introHowYellowCorners.
  ///
  /// In en, this message translates to:
  /// **'A corner is in its spot when its colors match the three faces around it.\nKeep a placed corner at the front right.\nU R U\' L\' U R\' U\' L cycles the other three until they all fit.'**
  String get introHowYellowCorners;

  /// No description provided for @introHowTwistCorners.
  ///
  /// In en, this message translates to:
  /// **'Hold an unsolved corner at the front right.\nRepeat R\' D\' R D until its yellow faces up.\nTurn only the top for the next one; the bottom fixes itself at the end.'**
  String get introHowTwistCorners;

  /// No description provided for @introHowCfopIntro.
  ///
  /// In en, this message translates to:
  /// **'Cross: four edges, planned during inspection.\nF2L: each corner goes in together with its edge.\nOLL makes the top yellow, then PLL moves the pieces home.'**
  String get introHowCfopIntro;

  /// No description provided for @introHowF2l.
  ///
  /// In en, this message translates to:
  /// **'Find a corner and its matching edge in the top layer.\nPair them up above their slot.\nDrop the pair in with three or four moves.'**
  String get introHowF2l;

  /// No description provided for @introHowOll.
  ///
  /// In en, this message translates to:
  /// **'First the yellow cross with F R U R\' U\' F\'.\nThen orient the corners, for example with Sune.\nRecognize the case by the yellow you see.'**
  String get introHowOll;

  /// No description provided for @introHowPll.
  ///
  /// In en, this message translates to:
  /// **'The top is already all yellow.\nThe T-perm swaps corners; the U-perm cycles three edges.\nRead the side colors to choose the algorithm.'**
  String get introHowPll;

  /// No description provided for @introHowTwoFirst.
  ///
  /// In en, this message translates to:
  /// **'A 2×2 is only corners, like a 3×3 without edges.\nBring each white corner above its spot.\nRepeat R U R\' U\' until it drops in.'**
  String get introHowTwoFirst;

  /// No description provided for @introHowTwoOll.
  ///
  /// In en, this message translates to:
  /// **'Keep the white layer at the bottom.\nSune (R U R\' U R U2 R\') twists the top corners.\nRepeat from the right angle until the top is all yellow.'**
  String get introHowTwoOll;

  /// No description provided for @introHowTwoPbl.
  ///
  /// In en, this message translates to:
  /// **'Look for a side where two corners already match.\nAdjacent swap: one T-perm style algorithm.\nDiagonal swap: one longer algorithm.'**
  String get introHowTwoPbl;

  /// No description provided for @introHowBigIntro.
  ///
  /// In en, this message translates to:
  /// **'No center is fixed: four center pieces make up each face color.\nWide moves like Rw turn two layers at once.\nInner moves like 2R turn just one inner slice.'**
  String get introHowBigIntro;

  /// No description provided for @introHowBigCenters.
  ///
  /// In en, this message translates to:
  /// **'Build two opposite centers first.\nInner slices swap center pieces without breaking finished ones.\nFinish the last four centers the same way.'**
  String get introHowBigCenters;

  /// No description provided for @introHowBigEdges.
  ///
  /// In en, this message translates to:
  /// **'Find two edge pieces with the same colors.\nLine them up side by side with an inner slice.\nPut the pair away and bring the centers back.'**
  String get introHowBigEdges;

  /// No description provided for @introHowBigParity.
  ///
  /// In en, this message translates to:
  /// **'Solve the 4×4 like a 3×3 until it gets stuck.\nOne flipped edge: the long OLL parity algorithm.\nTwo swapped edges: 2R2 U2 2R2 Uw2 2R2 Uw2.'**
  String get introHowBigParity;

  /// No description provided for @dirFaceR.
  ///
  /// In en, this message translates to:
  /// **'Right side'**
  String get dirFaceR;

  /// No description provided for @dirFaceL.
  ///
  /// In en, this message translates to:
  /// **'Left side'**
  String get dirFaceL;

  /// No description provided for @dirFaceU.
  ///
  /// In en, this message translates to:
  /// **'Top row'**
  String get dirFaceU;

  /// No description provided for @dirFaceD.
  ///
  /// In en, this message translates to:
  /// **'Bottom row'**
  String get dirFaceD;

  /// No description provided for @dirFaceF.
  ///
  /// In en, this message translates to:
  /// **'Front face'**
  String get dirFaceF;

  /// No description provided for @dirFaceB.
  ///
  /// In en, this message translates to:
  /// **'Back face'**
  String get dirFaceB;

  /// No description provided for @dirMiddle.
  ///
  /// In en, this message translates to:
  /// **'Middle slice'**
  String get dirMiddle;

  /// No description provided for @dirWholeCube.
  ///
  /// In en, this message translates to:
  /// **'Whole cube'**
  String get dirWholeCube;

  /// No description provided for @dirLayerInner.
  ///
  /// In en, this message translates to:
  /// **'{face}, layer {depth}'**
  String dirLayerInner(int depth, String face);

  /// No description provided for @dirLayerWide.
  ///
  /// In en, this message translates to:
  /// **'{face}, {depth} layers deep'**
  String dirLayerWide(int depth, String face);

  /// No description provided for @dirLayerBlock.
  ///
  /// In en, this message translates to:
  /// **'{face}, layers {near}–{far}'**
  String dirLayerBlock(int near, int far, String face);

  /// No description provided for @dirUp.
  ///
  /// In en, this message translates to:
  /// **'Up'**
  String get dirUp;

  /// No description provided for @dirDown.
  ///
  /// In en, this message translates to:
  /// **'Down'**
  String get dirDown;

  /// No description provided for @dirLeft.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get dirLeft;

  /// No description provided for @dirRight.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get dirRight;

  /// No description provided for @dirClockwise.
  ///
  /// In en, this message translates to:
  /// **'Clockwise'**
  String get dirClockwise;

  /// No description provided for @dirCounter.
  ///
  /// In en, this message translates to:
  /// **'Counter-clockwise'**
  String get dirCounter;

  /// No description provided for @dirBackClockwise.
  ///
  /// In en, this message translates to:
  /// **'Clockwise, seen from behind'**
  String get dirBackClockwise;

  /// No description provided for @dirBackCounter.
  ///
  /// In en, this message translates to:
  /// **'Counter-clockwise, seen from behind'**
  String get dirBackCounter;

  /// No description provided for @dirHalf.
  ///
  /// In en, this message translates to:
  /// **'Double turn (180°)'**
  String get dirHalf;

  /// No description provided for @moveInstruction.
  ///
  /// In en, this message translates to:
  /// **'{layer} — {direction}'**
  String moveInstruction(String layer, String direction);

  /// No description provided for @solveCollapse.
  ///
  /// In en, this message translates to:
  /// **'Hide details'**
  String get solveCollapse;

  /// No description provided for @solveExpand.
  ///
  /// In en, this message translates to:
  /// **'Show details'**
  String get solveExpand;

  /// No description provided for @dailyScrambleSteps.
  ///
  /// In en, this message translates to:
  /// **'Scramble step by step'**
  String get dailyScrambleSteps;

  /// No description provided for @dailyScrambleGuide.
  ///
  /// In en, this message translates to:
  /// **'3D scramble guide'**
  String get dailyScrambleGuide;

  /// No description provided for @dailyScrambleGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Scramble guide'**
  String get dailyScrambleGuideTitle;

  /// No description provided for @phaseDailyScramble.
  ///
  /// In en, this message translates to:
  /// **'Scramble today\'s cube'**
  String get phaseDailyScramble;

  /// No description provided for @explainDailyScramble.
  ///
  /// In en, this message translates to:
  /// **'Start from a solved cube, white on top and green in front, and copy each turn on your real cube.'**
  String get explainDailyScramble;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fil',
    'fr',
    'he',
    'hi',
    'id',
    'ja',
    'ko',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
