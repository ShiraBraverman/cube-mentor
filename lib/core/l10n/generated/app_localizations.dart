import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
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
import 'app_localizations_my.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_tt.dart';
import 'app_localizations_vi.dart';
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
    Locale('bn'),
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
    Locale('my'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('tr'),
    Locale('tt'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'TW'),
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
  /// **'Guided (3 layers)'**
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
  /// **'Great! Keep swiping the layers one at a time, following the arrow, to complete the wide turn.'**
  String get wideTurnMore;

  /// No description provided for @guideSwipeHint.
  ///
  /// In en, this message translates to:
  /// **'Swipe the layer under the arrow the way it points, or tap Next.'**
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
  /// **'First layer corners'**
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
  /// **'First layer'**
  String get crownFirst;

  /// No description provided for @crownSecond.
  ///
  /// In en, this message translates to:
  /// **'Second layer'**
  String get crownSecond;

  /// No description provided for @crownThird.
  ///
  /// In en, this message translates to:
  /// **'Third layer'**
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

  /// No description provided for @subStepGoal11.
  ///
  /// In en, this message translates to:
  /// **'Form a white cross where every white edge also matches the center color beside it.'**
  String get subStepGoal11;

  /// No description provided for @subStepGoal12.
  ///
  /// In en, this message translates to:
  /// **'Insert the 4 white corners into their matching slots to finish the white face and the whole first layer.'**
  String get subStepGoal12;

  /// No description provided for @subStepGoal21.
  ///
  /// In en, this message translates to:
  /// **'Insert the 4 middle-layer edges without disturbing the first layer.'**
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

  /// Guided solve, sub-step 1.1: one move that brings a white edge up next to the yellow center, white facing up, forming the daisy.
  ///
  /// In en, this message translates to:
  /// **'Daisy: bring the {piece} edge up around the yellow center, white facing up, as a petal.'**
  String explainLblDaisyPetal(String piece);

  /// Guided solve, sub-step 1.1: turning the top so a daisy petal sits above the center of its side color.
  ///
  /// In en, this message translates to:
  /// **'Turn the top layer until the {piece} petal sits right above the center of its side color.'**
  String explainLblDaisyAlign(String piece);

  /// Guided solve, sub-step 1.1: the half turn dropping a daisy petal onto the white center.
  ///
  /// In en, this message translates to:
  /// **'Turn that face twice (180°) to drop the {piece} edge onto the white center: one more arm of the white cross.'**
  String explainLblDaisyDrop(String piece);

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

  /// No description provided for @lessonPartOf.
  ///
  /// In en, this message translates to:
  /// **'Part {index} of {total}'**
  String lessonPartOf(int index, int total);

  /// No description provided for @lessonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get lessonNext;

  /// Previous button of a lesson: the previous move, or the previous part once the part's first move is reached.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get lessonPrevious;

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
  /// **'Your turn: swipe the layer the arrow shows, or tap Next.'**
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
  /// **'Beginner 3×3: layer by layer'**
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

  /// No description provided for @timerInspectionToggle.
  ///
  /// In en, this message translates to:
  /// **'15 s inspection'**
  String get timerInspectionToggle;

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
  /// **'Hold yellow on top and green facing you. First gather the four white edges around the yellow center, white facing up, like petals: that\'s the daisy. Then each petal goes down to the white center, its side color matching the center beside it.'**
  String get stepCrossGoalBody;

  /// No description provided for @stepCrossTop.
  ///
  /// In en, this message translates to:
  /// **'Edge on top'**
  String get stepCrossTop;

  /// No description provided for @stepCrossTopBody.
  ///
  /// In en, this message translates to:
  /// **'A white edge on top with white facing up is a daisy petal. Turn the top until its side color sits right above the center of the same color, then turn that face twice (180°) to drop it onto the white center.'**
  String get stepCrossTopBody;

  /// No description provided for @stepCrossMiddle.
  ///
  /// In en, this message translates to:
  /// **'Edge in the middle'**
  String get stepCrossMiddle;

  /// No description provided for @stepCrossMiddleBody.
  ///
  /// In en, this message translates to:
  /// **'An edge stuck in the middle layer goes up first: turn its side up, move the top out of the way and turn the side back, so placed pieces stay put. Now it\'s a petal on top: line it up and turn that face twice.'**
  String get stepCrossMiddleBody;

  /// No description provided for @stepCornersInsert.
  ///
  /// In en, this message translates to:
  /// **'Above its spot'**
  String get stepCornersInsert;

  /// No description provided for @stepCornersInsertBody.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until the white corner sits right above its slot, between the two centers that match its side colors. Here one top turn and R U\' R\' are enough: U brings the corner over its slot and R U\' R\' tucks it in, white facing down.'**
  String get stepCornersInsertBody;

  /// No description provided for @stepCornersRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat the trigger'**
  String get stepCornersRepeat;

  /// No description provided for @stepCornersRepeatBody.
  ///
  /// In en, this message translates to:
  /// **'Hold the slot at the front right and repeat R U R\' U\' until white faces down: once if white faces right, three times if it faces up, five times if it faces you. The top looks messy meanwhile; it sorts itself out.'**
  String get stepCornersRepeatBody;

  /// No description provided for @stepMiddleRight.
  ///
  /// In en, this message translates to:
  /// **'Edge to the right'**
  String get stepMiddleRight;

  /// No description provided for @stepMiddleRightBody.
  ///
  /// In en, this message translates to:
  /// **'Find a top edge with no yellow on it. Turn the top until its front color matches the center facing you. If its top color matches the right center, send it right: U R U\' R\' U\' F\' U F.'**
  String get stepMiddleRightBody;

  /// No description provided for @stepMiddleLeft.
  ///
  /// In en, this message translates to:
  /// **'Edge to the left'**
  String get stepMiddleLeft;

  /// No description provided for @stepMiddleLeftBody.
  ///
  /// In en, this message translates to:
  /// **'If its top color matches the left center instead, use the mirror: U\' L\' U L U F U\' F\'. The white layer comes back whole every time.'**
  String get stepMiddleLeftBody;

  /// No description provided for @stepYellowCross.
  ///
  /// In en, this message translates to:
  /// **'One algorithm'**
  String get stepYellowCross;

  /// No description provided for @stepYellowCrossBody.
  ///
  /// In en, this message translates to:
  /// **'Look only at the yellow edges on top. Hold an L at the back left and a line from left to right, then do F R U R\' U\' F\'. A line needs it once, an L twice, a dot up to three times.'**
  String get stepYellowCrossBody;

  /// No description provided for @stepYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Match the edges'**
  String get stepYellowEdges;

  /// No description provided for @stepYellowEdgesBody.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until two edges match their side centers. With one at the back and one on the right, R U R\' U R U2 R\' U swaps the front and left edges.'**
  String get stepYellowEdgesBody;

  /// No description provided for @stepPlaceCorners.
  ///
  /// In en, this message translates to:
  /// **'Place them'**
  String get stepPlaceCorners;

  /// No description provided for @stepPlaceCornersBody.
  ///
  /// In en, this message translates to:
  /// **'A corner is home when its colors match the three centers around it, even if it\'s twisted. Hold a home corner at the front right: U R U\' L\' U R\' U\' L moves the other three around. Repeat until all four are home.'**
  String get stepPlaceCornersBody;

  /// No description provided for @stepTwistCorners.
  ///
  /// In en, this message translates to:
  /// **'Twist them'**
  String get stepTwistCorners;

  /// No description provided for @stepTwistCornersBody.
  ///
  /// In en, this message translates to:
  /// **'With an unsolved corner at the front right, repeat R\' D\' R D in pairs until yellow is on top, then turn only the top to bring the next one. The bottom looks broken until the very last corner: keep going.'**
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
  /// **'A 2×2 is only eight corners: no edges, no centers. Build the white layer on the bottom so neighbouring side colors match, then finish on one route: Sune for a yellow top, then the T-perm or Y-perm.'**
  String get stepTwoIntroBody;

  /// No description provided for @stepTwoCorner.
  ///
  /// In en, this message translates to:
  /// **'Insert corners'**
  String get stepTwoCorner;

  /// No description provided for @stepTwoCornerBody.
  ///
  /// In en, this message translates to:
  /// **'Like the 3×3 white corners: bring a corner above its empty slot at the front right and tuck it in, with U R U\' R\' here or by repeating R U R\' U\' until white faces down. Check its side colors against its neighbour.'**
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
  /// **'Count the yellow stickers facing up. Hold the one yellow-up corner at the front left and do Sune (R U R\' U R U2 R\'). Count again and re-hold; it takes three Sunes at most. Turn only the top between them.'**
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
  /// **'Headlights are two matching top stickers on one side. Turn the top until the headlights are on the left, so the two corners to swap are on the right, then do the T-perm.'**
  String get stepTwoAdjacentBody;

  /// No description provided for @stepTwoDiagonal.
  ///
  /// In en, this message translates to:
  /// **'Diagonal swap'**
  String get stepTwoDiagonal;

  /// No description provided for @stepTwoDiagonalBody.
  ///
  /// In en, this message translates to:
  /// **'No headlights anywhere means two diagonal corners must swap: do the Y-perm from any side, then turn the top to line everything up.'**
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
  /// **'On a 4×4 each face has four center pieces that move around, and every edge is two wings. No center is fixed, so check the color order on a corner: white opposite yellow, blue opposite green, red opposite orange.'**
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
  /// **'This commutator moves exactly three center pieces and leaves everything else alone, so finished centers stay finished. Use it when one stray piece won\'t join a bar.'**
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
  /// **'Uw\' lines up two matching wings, R U R\' F R\' F\' R swaps in an unpaired edge, and Uw brings the centers back. Always close a slice you opened.'**
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
  /// **'A single flipped edge can\'t happen on a 3×3: it\'s OLL parity, not a mistake. Keep it at the front of the top layer and play the long algorithm. It also swaps the left and right top edges and two corners; the last 3×3 steps fix those.'**
  String get stepBigOllParityBody;

  /// No description provided for @stepBigPllParity.
  ///
  /// In en, this message translates to:
  /// **'PLL parity'**
  String get stepBigPllParity;

  /// No description provided for @stepBigPllParityBody.
  ///
  /// In en, this message translates to:
  /// **'Two swapped edges at the very end, and no 3×3 algorithm fits? That\'s PLL parity. Hold them at the front and back of the top layer: 2R2 U2 2R2 Uw2 2R2 2U2 swaps them.'**
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

  /// No description provided for @introHoldHeading.
  ///
  /// In en, this message translates to:
  /// **'How to hold it'**
  String get introHoldHeading;

  /// No description provided for @introWhyHeading.
  ///
  /// In en, this message translates to:
  /// **'Why it works'**
  String get introWhyHeading;

  /// No description provided for @introStart.
  ///
  /// In en, this message translates to:
  /// **'Got it, start step by step'**
  String get introStart;

  /// Switch in the sub-step goal sheet: stop opening it automatically at each new sub-step (the flag button still opens it).
  ///
  /// In en, this message translates to:
  /// **'Don\'t show automatically again'**
  String get introDontShowAgain;

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
  /// **'Make a white plus sign on the bottom where every white edge also matches the center color beside it.'**
  String get introGoalCross;

  /// No description provided for @introGoalCorners.
  ///
  /// In en, this message translates to:
  /// **'Fill in the four white corners so the whole first layer is done: a white face with matching side colors.'**
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
  /// **'Put the last corners home with one T-perm or Y-perm, then line up the top to solve the 2×2.'**
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
  /// **'Fix the two 4×4 cases a 3×3 never has: one flipped edge (OLL parity) or two swapped edges (PLL parity).'**
  String get introGoalBigParity;

  /// No description provided for @introHowBasics.
  ///
  /// In en, this message translates to:
  /// **'Centers never move, so they tell you each face\'s color.\nEach letter turns one face a quarter turn clockwise.\nAn apostrophe (\') turns it back; a 2 turns it twice.'**
  String get introHowBasics;

  /// No description provided for @introHoldBasics.
  ///
  /// In en, this message translates to:
  /// **'Any way you like: the centers stay in place, so the colors always tell you which face is which.'**
  String get introHoldBasics;

  /// No description provided for @introWhyBasics.
  ///
  /// In en, this message translates to:
  /// **'Every algorithm is just these letters in a row, so reading them is the first skill.'**
  String get introWhyBasics;

  /// No description provided for @introHowCross.
  ///
  /// In en, this message translates to:
  /// **'Bring each white edge to the top, white facing up, around the yellow center: that\'s the daisy.\nTurn the top until a petal\'s side color sits above its matching center.\nTurn that face twice to drop it down; repeat for all four.'**
  String get introHowCross;

  /// No description provided for @introHoldCross.
  ///
  /// In en, this message translates to:
  /// **'Yellow center on top, white center on the bottom, for the whole step. Turn the top layer, not the cube, to line up a petal.'**
  String get introHoldCross;

  /// No description provided for @introWhyCross.
  ///
  /// In en, this message translates to:
  /// **'With white facing up on top, two turns of the front face land the edge on the white center, white facing down, already matching its side.'**
  String get introWhyCross;

  /// No description provided for @introHowCorners.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until a white corner sits above its empty slot, and hold that slot at the front right.\nRepeat R U R\' U\': once if white faces right, three times if it faces up, five if it faces you.\nDo the same for the other three corners.'**
  String get introHowCorners;

  /// No description provided for @introHoldCorners.
  ///
  /// In en, this message translates to:
  /// **'White on the bottom, yellow on top. The corner sits at the front right, directly above its slot.'**
  String get introHoldCorners;

  /// No description provided for @introWhyCorners.
  ///
  /// In en, this message translates to:
  /// **'R U R\' U\' lifts the slot and puts it back: each round twists the corner a little until white faces down, and the cross is never broken.'**
  String get introWhyCorners;

  /// No description provided for @introHowMiddle.
  ///
  /// In en, this message translates to:
  /// **'Find a top edge with no yellow on it and match its front color to the center below.\nIts top color says where it goes: right or left.\nSend it with the 8-move insert; the white layer comes back every time.'**
  String get introHowMiddle;

  /// No description provided for @introHoldMiddle.
  ///
  /// In en, this message translates to:
  /// **'White on the bottom, yellow on top. The edge sits on the front, its front color matching the center below it.'**
  String get introHoldMiddle;

  /// No description provided for @introWhyMiddle.
  ///
  /// In en, this message translates to:
  /// **'The insert lifts the slot out of the way, slides the edge in and brings the white layer back. An edge with yellow belongs on top, never in the middle.'**
  String get introWhyMiddle;

  /// No description provided for @introHowYellowCross.
  ///
  /// In en, this message translates to:
  /// **'Look only at the yellow edges on top: a dot, an L or a line.\nHold the L at the back left, the line from left to right, and do F R U R\' U\' F\'.\nA line needs it once, an L twice, a dot up to three times.'**
  String get introHowYellowCross;

  /// No description provided for @introHoldYellowCross.
  ///
  /// In en, this message translates to:
  /// **'White on the bottom, yellow on top. An L at the back left, a line from left to right; a dot any way.'**
  String get introHoldYellowCross;

  /// No description provided for @introWhyYellowCross.
  ///
  /// In en, this message translates to:
  /// **'F R U R\' U\' F\' flips two top edges up at a time without touching the first two layers.'**
  String get introWhyYellowCross;

  /// No description provided for @introHowYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until two edges match their side centers.\nHold them at the back and on the right, then do R U R\' U R U2 R\' U.\nIf the matched edges are opposite, do it once from any side first.'**
  String get introHowYellowEdges;

  /// No description provided for @introHoldYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'Yellow on top. One matched edge at the back and the other on the right.'**
  String get introHoldYellowEdges;

  /// No description provided for @introWhyYellowEdges.
  ///
  /// In en, this message translates to:
  /// **'This algorithm only moves top pieces, so the first two layers always come back.'**
  String get introWhyYellowEdges;

  /// No description provided for @introHowYellowCorners.
  ///
  /// In en, this message translates to:
  /// **'A corner is home when its colors match the three centers around it, even if twisted.\nKeep a home corner at the front right.\nU R U\' L\' U R\' U\' L cycles the other three; repeat until all four fit.'**
  String get introHowYellowCorners;

  /// No description provided for @introHoldYellowCorners.
  ///
  /// In en, this message translates to:
  /// **'Yellow on top. A corner that is already home at the front right; if none is, any corner.'**
  String get introHoldYellowCorners;

  /// No description provided for @introWhyYellowCorners.
  ///
  /// In en, this message translates to:
  /// **'It moves three corners in a circle and leaves the one at the front right in place, so every repeat brings more corners home.'**
  String get introWhyYellowCorners;

  /// No description provided for @introHowTwistCorners.
  ///
  /// In en, this message translates to:
  /// **'Hold an unsolved corner at the front right.\nRepeat R\' D\' R D in pairs until its yellow faces up.\nTurn only the top for the next one; the bottom comes back with the last corner.'**
  String get introHowTwistCorners;

  /// No description provided for @introHoldTwistCorners.
  ///
  /// In en, this message translates to:
  /// **'Yellow on top, the corner to twist at the front right. Between corners turn only the top, never the whole cube.'**
  String get introHoldTwistCorners;

  /// No description provided for @introWhyTwistCorners.
  ///
  /// In en, this message translates to:
  /// **'R\' D\' R D twists the corner and scrambles the bottom, but the bottom returns once every corner is twisted. Stopping halfway leaves it broken.'**
  String get introWhyTwistCorners;

  /// No description provided for @introHowCfopIntro.
  ///
  /// In en, this message translates to:
  /// **'Cross: four edges, planned during inspection.\nF2L: each corner goes in together with its edge.\nOLL makes the top yellow, then PLL moves the pieces home.'**
  String get introHowCfopIntro;

  /// No description provided for @introHoldCfopIntro.
  ///
  /// In en, this message translates to:
  /// **'Speedcubers build the cross on the bottom, so they can look ahead at the next pieces while they turn.'**
  String get introHoldCfopIntro;

  /// No description provided for @introWhyCfopIntro.
  ///
  /// In en, this message translates to:
  /// **'Solving a corner and its edge together saves many moves, and recognizing cases replaces trial and error.'**
  String get introWhyCfopIntro;

  /// No description provided for @introHowF2l.
  ///
  /// In en, this message translates to:
  /// **'Find a corner and its matching edge in the top layer.\nPair them up above their slot.\nDrop the pair in with three or four moves.'**
  String get introHowF2l;

  /// No description provided for @introHoldF2l.
  ///
  /// In en, this message translates to:
  /// **'Cross on the bottom. The pair\'s slot at the front right, or the front left for the mirror.'**
  String get introHoldF2l;

  /// No description provided for @introWhyF2l.
  ///
  /// In en, this message translates to:
  /// **'A paired corner and edge drop in together, so two layers grow at once instead of one piece at a time.'**
  String get introWhyF2l;

  /// No description provided for @introHowOll.
  ///
  /// In en, this message translates to:
  /// **'First the yellow cross with F R U R\' U\' F\'.\nThen orient the corners, for example with Sune.\nRecognize the case by the yellow you see.'**
  String get introHowOll;

  /// No description provided for @introHoldOll.
  ///
  /// In en, this message translates to:
  /// **'Yellow on top. For Sune, the one corner with yellow facing up goes at the front left.'**
  String get introHoldOll;

  /// No description provided for @introWhyOll.
  ///
  /// In en, this message translates to:
  /// **'Splitting the last layer into orient first, then permute keeps the number of algorithms small.'**
  String get introWhyOll;

  /// No description provided for @introHowPll.
  ///
  /// In en, this message translates to:
  /// **'The top is already all yellow.\nThe T-perm swaps corners; the U-perm cycles three edges.\nRead the side colors to choose the algorithm.'**
  String get introHowPll;

  /// No description provided for @introHoldPll.
  ///
  /// In en, this message translates to:
  /// **'Yellow on top. T-perm: headlights on the left. U-perm: the finished side at the back.'**
  String get introHoldPll;

  /// No description provided for @introWhyPll.
  ///
  /// In en, this message translates to:
  /// **'Once the top is all yellow, only the pieces\' places are wrong, and a few swaps finish the cube.'**
  String get introWhyPll;

  /// No description provided for @introHowTwoFirst.
  ///
  /// In en, this message translates to:
  /// **'Pick a white corner as your anchor, white facing down.\nBring each next corner above its slot at the front right.\nRepeat R U R\' U\' until it drops in with matching side colors.'**
  String get introHowTwoFirst;

  /// No description provided for @introHoldTwoFirst.
  ///
  /// In en, this message translates to:
  /// **'White on the bottom. The empty slot at the front right, its corner right above it on the top layer.'**
  String get introHoldTwoFirst;

  /// No description provided for @introWhyTwoFirst.
  ///
  /// In en, this message translates to:
  /// **'A 2×2 has no centers: the first corner you place sets the colors of its neighbours, so side colors matter, not only white.'**
  String get introWhyTwoFirst;

  /// No description provided for @introHowTwoOll.
  ///
  /// In en, this message translates to:
  /// **'Count the corners with yellow facing up.\nWith one up, hold it at the front left and do Sune: R U R\' U R U2 R\'.\nCount again and repeat; three Sunes at most.'**
  String get introHowTwoOll;

  /// No description provided for @introHoldTwoOll.
  ///
  /// In en, this message translates to:
  /// **'White on the bottom, yellow on top. The corner with yellow up at the front left before each Sune.'**
  String get introHoldTwoOll;

  /// No description provided for @introWhyTwoOll.
  ///
  /// In en, this message translates to:
  /// **'Sune twists the top corners without breaking the white layer; recounting each time tells you how to hold it next.'**
  String get introWhyTwoOll;

  /// No description provided for @introHowTwoPbl.
  ///
  /// In en, this message translates to:
  /// **'Look for headlights: two matching top stickers on one side.\nHeadlights on one side: hold them on the left and do the T-perm.\nNo headlights: do the Y-perm from any side, then line up the top.'**
  String get introHowTwoPbl;

  /// No description provided for @introHoldTwoPbl.
  ///
  /// In en, this message translates to:
  /// **'White on the bottom, yellow on top. T-perm: headlights on the left. Y-perm: any side facing you.'**
  String get introHoldTwoPbl;

  /// No description provided for @introWhyTwoPbl.
  ///
  /// In en, this message translates to:
  /// **'With the top yellow, only the corners\' places are wrong: the T-perm swaps two neighbours, the Y-perm two diagonals.'**
  String get introWhyTwoPbl;

  /// No description provided for @introHowBigIntro.
  ///
  /// In en, this message translates to:
  /// **'No center is fixed: four center pieces make up each face color.\nWide moves like Rw turn two layers at once.\nInner moves like 2R turn just one inner slice.'**
  String get introHowBigIntro;

  /// No description provided for @introHoldBigIntro.
  ///
  /// In en, this message translates to:
  /// **'Any way you like at first: on a 4×4 no center is fixed, so you choose where each color goes.'**
  String get introHoldBigIntro;

  /// No description provided for @introWhyBigIntro.
  ///
  /// In en, this message translates to:
  /// **'Reduction groups centers and edge pieces so the big cube can be solved like a 3×3.'**
  String get introWhyBigIntro;

  /// No description provided for @introHowBigCenters.
  ///
  /// In en, this message translates to:
  /// **'Check the color order from a corner first.\nBuild two opposite centers, then the other four.\nInner slices move center pieces; always undo a slice you opened.'**
  String get introHowBigCenters;

  /// No description provided for @introHoldBigCenters.
  ///
  /// In en, this message translates to:
  /// **'The face you are building in front, finished centers out of the way on the left and right.'**
  String get introHoldBigCenters;

  /// No description provided for @introWhyBigCenters.
  ///
  /// In en, this message translates to:
  /// **'A slice moves centers, and undoing it restores the finished ones, so only the piece you aimed for changes.'**
  String get introWhyBigCenters;

  /// No description provided for @introHowBigEdges.
  ///
  /// In en, this message translates to:
  /// **'Find the two wings with the same two colors.\nLine them up on the front and join them with Uw\'.\nSwap in an unpaired edge, then Uw brings the centers back.'**
  String get introHowBigEdges;

  /// No description provided for @introHoldBigEdges.
  ///
  /// In en, this message translates to:
  /// **'The edge you are pairing in the front layers; finished edges parked in the top and bottom layers.'**
  String get introHoldBigEdges;

  /// No description provided for @introWhyBigEdges.
  ///
  /// In en, this message translates to:
  /// **'Uw\' moves the centers aside so two wings can meet; Uw puts the centers back, keeping your work.'**
  String get introWhyBigEdges;

  /// No description provided for @introHowBigParity.
  ///
  /// In en, this message translates to:
  /// **'Solve the 4×4 like a 3×3 until it gets stuck.\nOne flipped edge: the long OLL parity algorithm.\nTwo swapped edges: 2R2 U2 2R2 Uw2 2R2 2U2.'**
  String get introHowBigParity;

  /// No description provided for @introHoldBigParity.
  ///
  /// In en, this message translates to:
  /// **'The last layer on top. OLL parity: the flipped edge at the front. PLL parity: the swapped edges at the front and back.'**
  String get introHoldBigParity;

  /// No description provided for @introWhyBigParity.
  ///
  /// In en, this message translates to:
  /// **'Edge wings can end up in states a 3×3 can\'t reach; these algorithms turn inner layers to undo exactly that.'**
  String get introWhyBigParity;

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

  /// Expands the daily scramble written out as numbered moves.
  ///
  /// In en, this message translates to:
  /// **'Show text moves'**
  String get dailyShowMoves;

  /// Collapses the daily scramble's numbered move list.
  ///
  /// In en, this message translates to:
  /// **'Hide text moves'**
  String get dailyHideMoves;

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

  /// No description provided for @stageCenters.
  ///
  /// In en, this message translates to:
  /// **'Build center blocks'**
  String get stageCenters;

  /// No description provided for @stageEdges.
  ///
  /// In en, this message translates to:
  /// **'Pair outer & inner edges'**
  String get stageEdges;

  /// No description provided for @stageParity.
  ///
  /// In en, this message translates to:
  /// **'Parity resolution'**
  String get stageParity;

  /// No description provided for @stageCrown1.
  ///
  /// In en, this message translates to:
  /// **'First layer (white)'**
  String get stageCrown1;

  /// No description provided for @stageCrown2.
  ///
  /// In en, this message translates to:
  /// **'Second layer'**
  String get stageCrown2;

  /// No description provided for @stageCrown3.
  ///
  /// In en, this message translates to:
  /// **'Third layer (yellow)'**
  String get stageCrown3;

  /// No description provided for @stageOrient.
  ///
  /// In en, this message translates to:
  /// **'Orient the pieces'**
  String get stageOrient;

  /// No description provided for @stageFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish the cube'**
  String get stageFinish;

  /// No description provided for @stageAsThree.
  ///
  /// In en, this message translates to:
  /// **'Solve as a 3×3'**
  String get stageAsThree;

  /// No description provided for @stageTwoByTwo.
  ///
  /// In en, this message translates to:
  /// **'Solve the 2×2'**
  String get stageTwoByTwo;

  /// No description provided for @stageHeader.
  ///
  /// In en, this message translates to:
  /// **'Stage {number} of {total}: {title}'**
  String stageHeader(int number, int total, String title);

  /// No description provided for @solveAllStagesDone.
  ///
  /// In en, this message translates to:
  /// **'Every stage complete. Well done!'**
  String get solveAllStagesDone;

  /// No description provided for @trackFiveByFive.
  ///
  /// In en, this message translates to:
  /// **'5×5 Professor\'s Cube'**
  String get trackFiveByFive;

  /// No description provided for @trackSixBySix.
  ///
  /// In en, this message translates to:
  /// **'6×6 cube'**
  String get trackSixBySix;

  /// No description provided for @lessonFiveIntro.
  ///
  /// In en, this message translates to:
  /// **'Meet the 5×5'**
  String get lessonFiveIntro;

  /// No description provided for @lessonFiveIntroDesc.
  ///
  /// In en, this message translates to:
  /// **'Fixed middles, center bars, middle edges and wings.'**
  String get lessonFiveIntroDesc;

  /// No description provided for @introGoalFiveIntro.
  ///
  /// In en, this message translates to:
  /// **'Get to know the 5×5: fixed middles, center bars, middle edges and wings.'**
  String get introGoalFiveIntro;

  /// No description provided for @introHowFiveIntro.
  ///
  /// In en, this message translates to:
  /// **'The very middle of each face never moves.\nEach edge is a middle piece with two wings.\nInner slices move pieces without touching the outside.'**
  String get introHowFiveIntro;

  /// No description provided for @introHoldFiveIntro.
  ///
  /// In en, this message translates to:
  /// **'Any way you like: on a 5×5 the very middle of each face never moves, so it shows that face\'s color.'**
  String get introHoldFiveIntro;

  /// No description provided for @introWhyFiveIntro.
  ///
  /// In en, this message translates to:
  /// **'Fixed middles set the color scheme, so the centers can\'t be built in the wrong order.'**
  String get introWhyFiveIntro;

  /// No description provided for @lessonFiveCenters.
  ///
  /// In en, this message translates to:
  /// **'5×5 centers'**
  String get lessonFiveCenters;

  /// No description provided for @lessonFiveCentersDesc.
  ///
  /// In en, this message translates to:
  /// **'Build each center from bars of three.'**
  String get lessonFiveCentersDesc;

  /// No description provided for @introGoalFiveCenters.
  ///
  /// In en, this message translates to:
  /// **'Build every face\'s 3×3 block of center pieces in one color.'**
  String get introGoalFiveCenters;

  /// No description provided for @introHowFiveCenters.
  ///
  /// In en, this message translates to:
  /// **'Start from the fixed middle piece: it sets the color.\nBuild bars of three and slide them in with an inner slice.\nThe move that brings a bar in also restores the finished center.'**
  String get introHowFiveCenters;

  /// No description provided for @introHoldFiveCenters.
  ///
  /// In en, this message translates to:
  /// **'The center you are building in front or on top; finished centers on the bottom, left or right, out of the way.'**
  String get introHoldFiveCenters;

  /// No description provided for @introWhyFiveCenters.
  ///
  /// In en, this message translates to:
  /// **'Slice in, turn the top, slice back: the slice that brings the bar in also restores the finished centers.'**
  String get introWhyFiveCenters;

  /// No description provided for @lessonFiveEdges.
  ///
  /// In en, this message translates to:
  /// **'5×5 edges'**
  String get lessonFiveEdges;

  /// No description provided for @lessonFiveEdgesDesc.
  ///
  /// In en, this message translates to:
  /// **'Join two wings to their middle edge.'**
  String get lessonFiveEdgesDesc;

  /// No description provided for @introGoalFiveEdges.
  ///
  /// In en, this message translates to:
  /// **'Join each middle edge with its two wings so all 12 edges look like single pieces.'**
  String get introGoalFiveEdges;

  /// No description provided for @introHowFiveEdges.
  ///
  /// In en, this message translates to:
  /// **'Match each wing to its middle edge on the front.\nTurn the inner layer, swap in an unsolved edge, turn it back.\nFor the last edges, use slice, flip, slice.'**
  String get introHowFiveEdges;

  /// No description provided for @introHoldFiveEdges.
  ///
  /// In en, this message translates to:
  /// **'The edge you are building at the front; finished edges stored in the top and bottom layers.'**
  String get introHoldFiveEdges;

  /// No description provided for @introWhyFiveEdges.
  ///
  /// In en, this message translates to:
  /// **'Opening and closing the inner slice joins wings while centers and stored edges come back.'**
  String get introWhyFiveEdges;

  /// No description provided for @lessonFiveSolve.
  ///
  /// In en, this message translates to:
  /// **'Solve the 5×5 as a 3×3'**
  String get lessonFiveSolve;

  /// No description provided for @lessonFiveSolveDesc.
  ///
  /// In en, this message translates to:
  /// **'Finish layer by layer, like a 3×3.'**
  String get lessonFiveSolveDesc;

  /// No description provided for @introGoalFiveSolve.
  ///
  /// In en, this message translates to:
  /// **'Solve the reduced 5×5 like a 3×3, layer by layer, with outer turns only.'**
  String get introGoalFiveSolve;

  /// No description provided for @introHowFiveSolve.
  ///
  /// In en, this message translates to:
  /// **'Only outer turns from now on, or paired edges split apart.\nWhite cross and corners, the middle layer, then the yellow layer.\nThe fixed middles show each face\'s color.'**
  String get introHowFiveSolve;

  /// No description provided for @introHoldFiveSolve.
  ///
  /// In en, this message translates to:
  /// **'The first layer\'s color on the bottom, exactly as on a 3×3; the corner to insert at the front right.'**
  String get introHoldFiveSolve;

  /// No description provided for @introWhyFiveSolve.
  ///
  /// In en, this message translates to:
  /// **'Inner turns would split centers and edges again; outer turns treat each block as one 3×3 piece.'**
  String get introWhyFiveSolve;

  /// No description provided for @lessonFiveParity.
  ///
  /// In en, this message translates to:
  /// **'5×5 edge parity'**
  String get lessonFiveParity;

  /// No description provided for @lessonFiveParityDesc.
  ///
  /// In en, this message translates to:
  /// **'Fix the edge whose wings are swapped.'**
  String get lessonFiveParityDesc;

  /// No description provided for @introGoalFiveParity.
  ///
  /// In en, this message translates to:
  /// **'Fix the one edge whose two outer wings are swapped: the only parity a 5×5 has.'**
  String get introGoalFiveParity;

  /// No description provided for @introHowFiveParity.
  ///
  /// In en, this message translates to:
  /// **'It shows up as one last edge that looks flipped.\nPlay the long inner-slice fix once.\nThere is no PLL parity on a 5×5.'**
  String get introHowFiveParity;

  /// No description provided for @introHoldFiveParity.
  ///
  /// In en, this message translates to:
  /// **'The last layer on top, the edge with swapped wings at the front of the top layer.'**
  String get introHoldFiveParity;

  /// No description provided for @introWhyFiveParity.
  ///
  /// In en, this message translates to:
  /// **'Only the two outer wings of one edge can swap on a 5×5, so a single algorithm covers it.'**
  String get introWhyFiveParity;

  /// No description provided for @lessonSixIntro.
  ///
  /// In en, this message translates to:
  /// **'Meet the 6×6'**
  String get lessonSixIntro;

  /// No description provided for @lessonSixIntroDesc.
  ///
  /// In en, this message translates to:
  /// **'No fixed centers and four pieces in every edge.'**
  String get lessonSixIntroDesc;

  /// No description provided for @introGoalSixIntro.
  ///
  /// In en, this message translates to:
  /// **'Get to know the 6×6: sixteen center pieces per face and four pieces per edge.'**
  String get introGoalSixIntro;

  /// No description provided for @introHowSixIntro.
  ///
  /// In en, this message translates to:
  /// **'No center is fixed: you choose the colors as you build.\nEach edge has outer and inner wings.\nWide turns can move up to three layers.'**
  String get introHowSixIntro;

  /// No description provided for @introHoldSixIntro.
  ///
  /// In en, this message translates to:
  /// **'Any way you like at first: like a 4×4, a 6×6 has no fixed center.'**
  String get introHoldSixIntro;

  /// No description provided for @introWhySixIntro.
  ///
  /// In en, this message translates to:
  /// **'If you can solve a 4×4 and a 5×5, the 6×6 is the same reduction with bigger blocks.'**
  String get introWhySixIntro;

  /// No description provided for @lessonSixCenters.
  ///
  /// In en, this message translates to:
  /// **'6×6 centers'**
  String get lessonSixCenters;

  /// No description provided for @lessonSixCentersDesc.
  ///
  /// In en, this message translates to:
  /// **'Build 4×4 centers from bars of four.'**
  String get lessonSixCentersDesc;

  /// No description provided for @introGoalSixCenters.
  ///
  /// In en, this message translates to:
  /// **'Build every face\'s 4×4 center block in one solid color.'**
  String get introGoalSixCenters;

  /// No description provided for @introHowSixCenters.
  ///
  /// In en, this message translates to:
  /// **'Check the color order from a corner first: no center is fixed.\nBuild bars of four and slide them together.\nFor the last two centers, move single pieces with slice, top, undo.'**
  String get introHowSixCenters;

  /// No description provided for @introHoldSixCenters.
  ///
  /// In en, this message translates to:
  /// **'The face you are building in front, finished centers on the left, right or bottom.'**
  String get introHoldSixCenters;

  /// No description provided for @introWhySixCenters.
  ///
  /// In en, this message translates to:
  /// **'Bars join with inner slices, and every slice is undone, so finished centers stay whole.'**
  String get introWhySixCenters;

  /// No description provided for @lessonSixEdges.
  ///
  /// In en, this message translates to:
  /// **'6×6 edges'**
  String get lessonSixEdges;

  /// No description provided for @lessonSixEdgesDesc.
  ///
  /// In en, this message translates to:
  /// **'Gather the four pieces of every edge.'**
  String get lessonSixEdgesDesc;

  /// No description provided for @introGoalSixEdges.
  ///
  /// In en, this message translates to:
  /// **'Gather the four pieces of each edge so the 6×6 has 12 clean edges.'**
  String get introGoalSixEdges;

  /// No description provided for @introHowSixEdges.
  ///
  /// In en, this message translates to:
  /// **'Line up the outer and inner wings of one edge on the front.\nThe deep wide layer brings an edge in and out.\nNever break a finished edge to free a piece.'**
  String get introHowSixEdges;

  /// No description provided for @introHoldSixEdges.
  ///
  /// In en, this message translates to:
  /// **'The edge you are building at the front; finished edges parked in the top and bottom layers.'**
  String get introHoldSixEdges;

  /// No description provided for @introWhySixEdges.
  ///
  /// In en, this message translates to:
  /// **'The deep wide turn moves centers aside so wings can meet, then brings them back.'**
  String get introWhySixEdges;

  /// No description provided for @lessonSixSolve.
  ///
  /// In en, this message translates to:
  /// **'Solve the 6×6 as a 3×3'**
  String get lessonSixSolve;

  /// No description provided for @lessonSixSolveDesc.
  ///
  /// In en, this message translates to:
  /// **'Finish layer by layer, like a 3×3.'**
  String get lessonSixSolveDesc;

  /// No description provided for @introGoalSixSolve.
  ///
  /// In en, this message translates to:
  /// **'Solve the reduced 6×6 like a 3×3, layer by layer, with outer turns only.'**
  String get introGoalSixSolve;

  /// No description provided for @introHowSixSolve.
  ///
  /// In en, this message translates to:
  /// **'Only outer turns from now on: a slice would split a center or an edge.\nThe centers you built show each face\'s color.\nWhite cross and corners, the middle layer, then the yellow layer.'**
  String get introHowSixSolve;

  /// No description provided for @introHoldSixSolve.
  ///
  /// In en, this message translates to:
  /// **'The first layer\'s color on the bottom, exactly as on a 3×3; the corner to insert at the front right.'**
  String get introHoldSixSolve;

  /// No description provided for @introWhySixSolve.
  ///
  /// In en, this message translates to:
  /// **'Outer turns move each 4×4 center and each edge as one piece, just like on a 3×3.'**
  String get introWhySixSolve;

  /// No description provided for @lessonSixParity.
  ///
  /// In en, this message translates to:
  /// **'6×6 parity'**
  String get lessonSixParity;

  /// No description provided for @lessonSixParityDesc.
  ///
  /// In en, this message translates to:
  /// **'One flipped edge or two swapped edges.'**
  String get lessonSixParityDesc;

  /// No description provided for @introGoalSixParity.
  ///
  /// In en, this message translates to:
  /// **'Fix the two 6×6 cases a 3×3 never has: one flipped edge or two swapped edges.'**
  String get introGoalSixParity;

  /// No description provided for @introHowSixParity.
  ///
  /// In en, this message translates to:
  /// **'Solve like a 3×3 until it gets stuck.\nOne flipped edge: the long parity fix with 3Rw.\nTwo swapped edges: the short fix of inner double turns.'**
  String get introHowSixParity;

  /// No description provided for @introHoldSixParity.
  ///
  /// In en, this message translates to:
  /// **'The last layer on top. The flipped edge at the front; for two swapped edges, the front and back.'**
  String get introHoldSixParity;

  /// No description provided for @introWhySixParity.
  ///
  /// In en, this message translates to:
  /// **'Like a 4×4, a 6×6 can end with one flipped or two swapped edges; inner-layer algorithms fix them and leave the rest alone.'**
  String get introWhySixParity;

  /// No description provided for @stepFivePieces.
  ///
  /// In en, this message translates to:
  /// **'The pieces of a 5×5'**
  String get stepFivePieces;

  /// No description provided for @stepFivePiecesBody.
  ///
  /// In en, this message translates to:
  /// **'The very middle piece of each face never moves, so the color scheme can\'t come out wrong. Around it sit eight center pieces: corner centers and edge centers never swap types. Each edge is a middle piece with two wings.'**
  String get stepFivePiecesBody;

  /// No description provided for @stepFiveSlices.
  ///
  /// In en, this message translates to:
  /// **'Three kinds of turns'**
  String get stepFiveSlices;

  /// No description provided for @stepFiveSlicesBody.
  ///
  /// In en, this message translates to:
  /// **'Outer turns move one face. Wide turns move a face with the layer behind it. Inner slice turns move only a layer inside: that is how pieces change place without touching the outside.'**
  String get stepFiveSlicesBody;

  /// No description provided for @stepFiveCenterBar.
  ///
  /// In en, this message translates to:
  /// **'Center bars'**
  String get stepFiveCenterBar;

  /// No description provided for @stepFiveCenterBarBody.
  ///
  /// In en, this message translates to:
  /// **'Build a row of three matching center pieces, slide it in with an inner slice, turn the top and slide back: the move that brings the bar in also restores the finished center. Three bars make a center.'**
  String get stepFiveCenterBarBody;

  /// No description provided for @stepFiveCenterSwap.
  ///
  /// In en, this message translates to:
  /// **'Swap without breaking'**
  String get stepFiveCenterSwap;

  /// No description provided for @stepFiveCenterSwapBody.
  ///
  /// In en, this message translates to:
  /// **'To move a single center piece: turn an inner slice, turn the top, undo the slice, turn the top back. Finished centers are restored every time.'**
  String get stepFiveCenterSwapBody;

  /// No description provided for @stepFiveEdgePair.
  ///
  /// In en, this message translates to:
  /// **'Pair wings with a middle edge'**
  String get stepFiveEdgePair;

  /// No description provided for @stepFiveEdgePairBody.
  ///
  /// In en, this message translates to:
  /// **'Line up a wing beside its matching middle edge on the front, turn the inner layer down, swap in an unsolved edge with a short trigger, then turn the inner layer back.'**
  String get stepFiveEdgePairBody;

  /// No description provided for @stepFiveEdgeLast.
  ///
  /// In en, this message translates to:
  /// **'The last edges'**
  String get stepFiveEdgeLast;

  /// No description provided for @stepFiveEdgeLastBody.
  ///
  /// In en, this message translates to:
  /// **'With no free edge left to swap in, use slice, flip, slice: a wide turn, a short trigger and the wide turn back pair the last edges without breaking finished ones.'**
  String get stepFiveEdgeLastBody;

  /// No description provided for @stepFiveAsThree.
  ///
  /// In en, this message translates to:
  /// **'Now it is a 3×3'**
  String get stepFiveAsThree;

  /// No description provided for @stepFiveAsThreeBody.
  ///
  /// In en, this message translates to:
  /// **'With centers and edges done, the 5×5 behaves like a big 3×3. Use only outer turns and go layer by layer: white cross and corners, the middle layer, then the yellow layer. A 5×5 has no PLL parity.'**
  String get stepFiveAsThreeBody;

  /// No description provided for @stepFiveEdgeParity.
  ///
  /// In en, this message translates to:
  /// **'Swap the last edge\'s wings'**
  String get stepFiveEdgeParity;

  /// No description provided for @stepFiveEdgeParityBody.
  ///
  /// In en, this message translates to:
  /// **'Sometimes the last edge has its two outer wings swapped, so it looks flipped: the 5×5\'s only parity. Hold it at the front of the top layer and play the inner-slice algorithm once; everything else returns to its place.'**
  String get stepFiveEdgeParityBody;

  /// No description provided for @stepSixPieces.
  ///
  /// In en, this message translates to:
  /// **'The pieces of a 6×6'**
  String get stepSixPieces;

  /// No description provided for @stepSixPiecesBody.
  ///
  /// In en, this message translates to:
  /// **'Like a 4×4, a 6×6 has no fixed center: sixteen center pieces make up each face color, so check the color order on a corner first. Each edge has four wings: two outer and two inner.'**
  String get stepSixPiecesBody;

  /// No description provided for @stepSixSlices.
  ///
  /// In en, this message translates to:
  /// **'Turning deeper layers'**
  String get stepSixSlices;

  /// No description provided for @stepSixSlicesBody.
  ///
  /// In en, this message translates to:
  /// **'Wide turns can move two or three layers from a face. Inner slices on the second or third layer are the tools for centers and edges.'**
  String get stepSixSlicesBody;

  /// No description provided for @stepSixCenterBar.
  ///
  /// In en, this message translates to:
  /// **'Bars of four'**
  String get stepSixCenterBar;

  /// No description provided for @stepSixCenterBarBody.
  ///
  /// In en, this message translates to:
  /// **'Build rows of four matching center pieces and slide them next to each other with inner slice turns, undoing each slice, until the face is one solid 4×4 block.'**
  String get stepSixCenterBarBody;

  /// No description provided for @stepSixCenterSwap.
  ///
  /// In en, this message translates to:
  /// **'Move one piece at a time'**
  String get stepSixCenterSwap;

  /// No description provided for @stepSixCenterSwapBody.
  ///
  /// In en, this message translates to:
  /// **'Turn the third layer, turn the top, undo, turn back: one center piece moves while finished centers come back. Use it for the last two centers, when no bar fits.'**
  String get stepSixCenterSwapBody;

  /// No description provided for @stepSixEdgePair.
  ///
  /// In en, this message translates to:
  /// **'Four pieces, one edge'**
  String get stepSixEdgePair;

  /// No description provided for @stepSixEdgePairBody.
  ///
  /// In en, this message translates to:
  /// **'Collect the four wings of an edge on the front with the deep wide layer, swap in an unsolved edge with a short trigger, then turn the wide layer back.'**
  String get stepSixEdgePairBody;

  /// No description provided for @stepSixEdgeLast.
  ///
  /// In en, this message translates to:
  /// **'The last edges'**
  String get stepSixEdgeLast;

  /// No description provided for @stepSixEdgeLastBody.
  ///
  /// In en, this message translates to:
  /// **'Pair the final edges with a short trigger between a deep wide turn and its undo, so finished edges stay paired. Never break a finished edge to free a piece.'**
  String get stepSixEdgeLastBody;

  /// No description provided for @stepSixAsThree.
  ///
  /// In en, this message translates to:
  /// **'Now it is a 3×3'**
  String get stepSixAsThree;

  /// No description provided for @stepSixAsThreeBody.
  ///
  /// In en, this message translates to:
  /// **'With 4×4 centers and paired edges, solve the 6×6 like a 3×3, layer by layer, with outer turns only. One flipped or two swapped edges at the end is parity, not a mistake.'**
  String get stepSixAsThreeBody;

  /// No description provided for @stepSixOllParity.
  ///
  /// In en, this message translates to:
  /// **'One flipped edge'**
  String get stepSixOllParity;

  /// No description provided for @stepSixOllParityBody.
  ///
  /// In en, this message translates to:
  /// **'A single edge that looks flipped in the last layer is parity. Hold it at the front of the top layer and play the long fix: it flips all four wings, also swaps the left and right top edges, and leaves the first two layers untouched.'**
  String get stepSixOllParityBody;

  /// No description provided for @stepSixPllParity.
  ///
  /// In en, this message translates to:
  /// **'Two swapped edges'**
  String get stepSixPllParity;

  /// No description provided for @stepSixPllParityBody.
  ///
  /// In en, this message translates to:
  /// **'If two edges look swapped at the very end, hold them at the front and back of the top layer and play the short fix of inner double turns: all four wings of both edges trade places.'**
  String get stepSixPllParityBody;

  /// 6x6 parity lesson: title of the rule telling the two flipped-edge cases apart.
  ///
  /// In en, this message translates to:
  /// **'Four wings or two?'**
  String get stepSixWingRule;

  /// 6x6 parity lesson: all 4 wings flipped takes 3-layer OLL parity, only the 2 inner wings flipped takes inner-wing parity.
  ///
  /// In en, this message translates to:
  /// **'A 6×6 edge is made of 4 wings. Before fixing an edge that looks flipped, look closely: if all 4 wings are flipped, use the standard 3-layer OLL parity; if only the 2 inner wings are flipped, use inner-wing parity. The cube shows the inner-wing case.'**
  String get stepSixWingRuleBody;

  /// 6x6 parity lesson: title of the inner-wing parity example.
  ///
  /// In en, this message translates to:
  /// **'Two inner wings flipped'**
  String get stepSixInnerWingParity;

  /// 6x6 parity lesson: explanation of the inner-wing parity example (3R / 3L slices only).
  ///
  /// In en, this message translates to:
  /// **'Here the outer wings of the front top edge are fine and only the 2 inner wings are flipped. Keep that edge at the front of the top layer and turn only the third slices (3R, 3L): the inner wings flip back and the rest of the cube stays solved.'**
  String get stepSixInnerWingParityBody;

  /// No description provided for @stageTwoFirstLayer.
  ///
  /// In en, this message translates to:
  /// **'Build the bottom layer'**
  String get stageTwoFirstLayer;

  /// No description provided for @stageTwoTopColor.
  ///
  /// In en, this message translates to:
  /// **'Make the top one color'**
  String get stageTwoTopColor;

  /// No description provided for @stageTwoFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish the corners'**
  String get stageTwoFinish;

  /// No description provided for @explainTwoFirstLayer.
  ///
  /// In en, this message translates to:
  /// **'Complete the bottom layer: its four corners match each other and the side colors.'**
  String get explainTwoFirstLayer;

  /// No description provided for @explainTwoTopColor.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until all four top stickers show the same color, keeping the bottom layer.'**
  String get explainTwoTopColor;

  /// No description provided for @explainTwoFinish.
  ///
  /// In en, this message translates to:
  /// **'Move the last corners into place to finish the cube.'**
  String get explainTwoFinish;

  /// No description provided for @tabSolve.
  ///
  /// In en, this message translates to:
  /// **'Solve'**
  String get tabSolve;

  /// No description provided for @tabScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get tabScan;

  /// No description provided for @tabAcademy.
  ///
  /// In en, this message translates to:
  /// **'Academy'**
  String get tabAcademy;

  /// No description provided for @tabTrain.
  ///
  /// In en, this message translates to:
  /// **'Train'**
  String get tabTrain;

  /// No description provided for @openCubeSolver.
  ///
  /// In en, this message translates to:
  /// **'Open 3D Cube & Solver'**
  String get openCubeSolver;

  /// No description provided for @progressFraction.
  ///
  /// In en, this message translates to:
  /// **'{done}/{total}'**
  String progressFraction(int done, int total);

  /// No description provided for @trainTitle.
  ///
  /// In en, this message translates to:
  /// **'Training'**
  String get trainTitle;

  /// No description provided for @trainSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sharpen your skills every day.'**
  String get trainSubtitle;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsSoundHaptics.
  ///
  /// In en, this message translates to:
  /// **'Sound & haptics'**
  String get settingsSoundHaptics;

  /// No description provided for @settingsSoundHapticsDesc.
  ///
  /// In en, this message translates to:
  /// **'Clicks and vibrations when you turn the cube.'**
  String get settingsSoundHapticsDesc;

  /// No description provided for @settingsAnimationSpeed.
  ///
  /// In en, this message translates to:
  /// **'Default animation speed'**
  String get settingsAnimationSpeed;

  /// No description provided for @settingsAnimationSpeedDesc.
  ///
  /// In en, this message translates to:
  /// **'How fast the cube turns when moves play.'**
  String get settingsAnimationSpeedDesc;

  /// No description provided for @settingsResetProgress.
  ///
  /// In en, this message translates to:
  /// **'Reset progress'**
  String get settingsResetProgress;

  /// No description provided for @settingsResetProgressDesc.
  ///
  /// In en, this message translates to:
  /// **'Clear finished Academy lessons and your daily streak.'**
  String get settingsResetProgressDesc;

  /// No description provided for @resetProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset all progress?'**
  String get resetProgressTitle;

  /// No description provided for @resetProgressBody.
  ///
  /// In en, this message translates to:
  /// **'Your finished lessons and your daily streak will be erased. This cannot be undone.'**
  String get resetProgressBody;

  /// No description provided for @resetProgressDone.
  ///
  /// In en, this message translates to:
  /// **'Progress reset.'**
  String get resetProgressDone;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @settingsPrivacyAds.
  ///
  /// In en, this message translates to:
  /// **'Privacy & ads'**
  String get settingsPrivacyAds;

  /// Subtitle of the Settings entry that reopens the ad consent (privacy options) form.
  ///
  /// In en, this message translates to:
  /// **'Review or change your ad consent choices.'**
  String get settingsPrivacyAdsDesc;

  /// Label of the playback button that steps one move back.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get playbackPrevious;

  /// Label of the playback button that steps one move forward.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get playbackNext;

  /// Badge on a Fast (Kociemba) 3x3 solution: its total move count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Solved in 1 move!} other{Solved in {count} moves!}}'**
  String fastSolveMoves(int count);

  /// Settings card inviting feature ideas by email.
  ///
  /// In en, this message translates to:
  /// **'Shape the Next Version'**
  String get feedbackTitle;

  /// Settings feedback card text; the email address is shown on its own line below.
  ///
  /// In en, this message translates to:
  /// **'Want to suggest a feature or influence the next version of CubeMentor? Write to us at:'**
  String get feedbackBody;

  /// Snack bar when no email app can open the feedback email.
  ///
  /// In en, this message translates to:
  /// **'No email app found, so we copied the address to your clipboard.'**
  String get feedbackEmailCopied;

  /// Badge on a locked advanced lesson: it opens after a short rewarded video ad.
  ///
  /// In en, this message translates to:
  /// **'Watch ad'**
  String get adWatchToUnlock;

  /// Dialog text while a rewarded video ad loads.
  ///
  /// In en, this message translates to:
  /// **'Loading a short video…'**
  String get adLoading;

  /// Snack bar when the user closes a rewarded video before the reward.
  ///
  /// In en, this message translates to:
  /// **'Watch the whole video to unlock it.'**
  String get adRewardNotEarned;

  /// Snack bar when no rewarded video could load (e.g. offline) and the feature was unlocked anyway.
  ///
  /// In en, this message translates to:
  /// **'No video available right now — unlocked for free this time.'**
  String get adUnavailableFreePass;

  /// Snack bar when the privacy options form could not be shown.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open the privacy options. Try again later.'**
  String get settingsPrivacyAdsError;

  /// Title of the Settings dialog asking for the user's nickname.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get nicknamePromptTitle;

  /// First-launch welcome prompt text under the title.
  ///
  /// In en, this message translates to:
  /// **'We\'ll cheer you on by name every time you solve.'**
  String get nicknamePromptBody;

  /// Hint inside the nickname text field.
  ///
  /// In en, this message translates to:
  /// **'Your name or nickname'**
  String get nicknameHint;

  /// Button saving an edited nickname (opened from Settings).
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get nicknameSave;

  /// Settings row title for the user's nickname.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get settingsNickname;

  /// Settings nickname row subtitle when no nickname was given.
  ///
  /// In en, this message translates to:
  /// **'Not set — tap to add one'**
  String get settingsNicknameNotSet;

  /// Celebration card headline with the user's nickname.
  ///
  /// In en, this message translates to:
  /// **'Way to go, {name}!'**
  String celebrateNamed(String name);

  /// Celebration card headline when no nickname was set.
  ///
  /// In en, this message translates to:
  /// **'Way to go!'**
  String get celebrateAnon;

  /// Celebration card message after the Guided or Fast solver finishes a solve.
  ///
  /// In en, this message translates to:
  /// **'Cube solved!'**
  String get celebrateCubeSolved;

  /// Celebration card message when the daily challenge is finished.
  ///
  /// In en, this message translates to:
  /// **'Daily challenge complete!'**
  String get celebrateDailyDone;

  /// Fast solve badge: the solution length against God's Number for the cube (11 for the 2x2, 20 for the 3x3), e.g. "17 / 20 moves".
  ///
  /// In en, this message translates to:
  /// **'{limit, plural, =1{{count} / 1 move} other{{count} / {limit} moves}}'**
  String fastSolveRatio(int count, int limit);

  /// Tooltip on the fast solve ratio badge explaining the bound.
  ///
  /// In en, this message translates to:
  /// **'{limit, plural, =1{Any scramble can be solved in 1 move or fewer} other{Any scramble can be solved in {limit} moves or fewer}}'**
  String fastSolveRatioTooltip(int limit);

  /// Button that plays a rewarded video to unlock the patterns.
  ///
  /// In en, this message translates to:
  /// **'Watch Video'**
  String get patternsWatchVideo;

  /// Button that closes the pattern unlock sheet.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get patternsNotNow;

  /// Settings row title: which colors sit opposite each other on the user's physical cube.
  ///
  /// In en, this message translates to:
  /// **'Cube color scheme'**
  String get settingsColorScheme;

  /// Segment label: the Western (default) cube color scheme.
  ///
  /// In en, this message translates to:
  /// **'Western'**
  String get colorSchemeWestern;

  /// Segment label: the Japanese cube color scheme.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get colorSchemeJapanese;

  /// Explains the Western scheme's opposite face colors.
  ///
  /// In en, this message translates to:
  /// **'White opposite yellow, blue opposite green'**
  String get colorSchemeWesternDesc;

  /// Explains the Japanese scheme's opposite face colors.
  ///
  /// In en, this message translates to:
  /// **'White opposite blue, yellow opposite green'**
  String get colorSchemeJapaneseDesc;

  /// The user's best solve time on today's daily challenge.
  ///
  /// In en, this message translates to:
  /// **'Your time: {time}'**
  String dailyYourTime(String time);

  /// Idle timer hint when 15-second WCA inspection is on.
  ///
  /// In en, this message translates to:
  /// **'You have {seconds} seconds to inspect the cube. Tap to start the countdown.'**
  String timerInspectIntro(int seconds);

  /// Hint under the inspection countdown numbers.
  ///
  /// In en, this message translates to:
  /// **'Tap when ready to start solving'**
  String get timerInspectTapReady;

  /// Shown while timing after the inspection ran out untouched and the clock started on its own with a +2 penalty.
  ///
  /// In en, this message translates to:
  /// **'Inspection passed {seconds} s, so the clock started on its own: +2 s penalty'**
  String timerInspectPlus2(int seconds);

  /// Tiny caption under ao5 / ao12 / ao100 explaining the stat.
  ///
  /// In en, this message translates to:
  /// **'Avg of {count}'**
  String timerAvgOf(int count);

  /// Footnote under the timer stats explaining how averages are computed.
  ///
  /// In en, this message translates to:
  /// **'Averages drop the best and worst times'**
  String get timerAvgNote;

  /// Tiny caption under the timer personal best.
  ///
  /// In en, this message translates to:
  /// **'Best single'**
  String get timerPbSub;

  /// Caption under the +2 penalty button.
  ///
  /// In en, this message translates to:
  /// **'+2 s penalty'**
  String get timerPlus2Caption;

  /// Caption under the DNF button: what DNF stands for.
  ///
  /// In en, this message translates to:
  /// **'Did Not Finish'**
  String get timerDnfCaption;

  /// Caption under the Delete button of the last solve.
  ///
  /// In en, this message translates to:
  /// **'Remove this solve'**
  String get timerDeleteCaption;

  /// Pattern name: concentric rings on every face.
  ///
  /// In en, this message translates to:
  /// **'Bull\'s-eye'**
  String get patternBullsEye;

  /// Pattern name: a frame of another color around the center block.
  ///
  /// In en, this message translates to:
  /// **'Framed center'**
  String get patternFramedCenter;

  /// Pattern name: checkerboard of 2x2 blocks (6x6).
  ///
  /// In en, this message translates to:
  /// **'Block checkerboard'**
  String get patternBlockCheckerboard;

  /// Pattern name.
  ///
  /// In en, this message translates to:
  /// **'Cube in a cube in a cube'**
  String get patternCubeInCubeInCube;

  /// Pattern name (like the British flag).
  ///
  /// In en, this message translates to:
  /// **'Union Jack'**
  String get patternUnionJack;

  /// Pattern name (tartan-like).
  ///
  /// In en, this message translates to:
  /// **'Kilt'**
  String get patternKilt;

  /// Pattern name: a T shape on each of the six faces.
  ///
  /// In en, this message translates to:
  /// **'Six T\'s'**
  String get patternSixTs;

  /// Pattern name: staircase triangles.
  ///
  /// In en, this message translates to:
  /// **'Twin peaks'**
  String get patternTwinPeaks;

  /// Pattern name.
  ///
  /// In en, this message translates to:
  /// **'Spiral'**
  String get patternSpiral;

  /// Pattern name (L-shaped blocks).
  ///
  /// In en, this message translates to:
  /// **'Tetris'**
  String get patternTetris;

  /// Pattern name: a small spot in the middle of each face.
  ///
  /// In en, this message translates to:
  /// **'Center spots'**
  String get patternSpots;

  /// Pattern name.
  ///
  /// In en, this message translates to:
  /// **'Stripes'**
  String get patternStripes;

  /// Pattern name.
  ///
  /// In en, this message translates to:
  /// **'Anaconda'**
  String get patternAnaconda;

  /// Pattern name.
  ///
  /// In en, this message translates to:
  /// **'Zigzag'**
  String get patternZigzag;

  /// Pattern name: spots on four side faces.
  ///
  /// In en, this message translates to:
  /// **'Four spots'**
  String get patternFourSpots;

  /// Pattern name.
  ///
  /// In en, this message translates to:
  /// **'Green mamba'**
  String get patternGreenMamba;

  /// Pattern name.
  ///
  /// In en, this message translates to:
  /// **'Plus minus'**
  String get patternPlusMinus;

  /// Counter pill while stepping through a pattern or lesson guide.
  ///
  /// In en, this message translates to:
  /// **'Step {current} / {total}'**
  String guideStepCounter(int current, int total);

  /// Counter pill while following the daily scramble guide.
  ///
  /// In en, this message translates to:
  /// **'Move {current} / {total}'**
  String guideMoveCounter(int current, int total);

  /// Live counter on the Fast Solve card: which move of the solution is on screen, out of all its moves.
  ///
  /// In en, this message translates to:
  /// **'Move {current} / {total}'**
  String fastMoveCounter(int current, int total);

  /// Daily challenge: title of the scramble step card.
  ///
  /// In en, this message translates to:
  /// **'Step 1: Scramble your cube'**
  String get dailyStep1Title;

  /// Daily challenge: title of the solve step card.
  ///
  /// In en, this message translates to:
  /// **'Step 2: Solve the cube'**
  String get dailyStep2Title;

  /// Daily challenge: best time over all days.
  ///
  /// In en, this message translates to:
  /// **'Personal best: {time}'**
  String dailyPersonalBest(String time);

  /// Daily challenge: heading of the personal log of solved days.
  ///
  /// In en, this message translates to:
  /// **'Recent days'**
  String get dailyRecentDays;

  /// Celebration on every fifth streak day (5, 10, 15, ...).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count}-day streak! You\'re on fire!}}'**
  String dailyMilestone(int count);

  /// End of the daily 3D scramble guide: the cube is scrambled, not solved.
  ///
  /// In en, this message translates to:
  /// **'Cube scrambled! Now go solve it'**
  String get dailyScrambledTitle;

  /// Title of the dialog after solving the daily challenge on the 3D cube.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get dailyCongratsTitle;

  /// Dialog body with the solve time.
  ///
  /// In en, this message translates to:
  /// **'You solved today\'s challenge in {time}.'**
  String dailyCongratsBody(String time);

  /// Dialog button: back to the daily challenge page.
  ///
  /// In en, this message translates to:
  /// **'Back to the challenge'**
  String get dailyCongratsDone;

  /// Pattern Library size chip: the cube size and how many patterns it has.
  ///
  /// In en, this message translates to:
  /// **'{size} • {count, plural, =1{1 pattern} other{{count} patterns}}'**
  String patternsSizeChip(String size, int count);

  /// Time left on a 24-hour rewarded unlock (a pattern or a lesson), in whole hours rounded up.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =1{1 hour left} other{{hours} hours left}}'**
  String unlockHoursLeft(int hours);

  /// Time left on a rewarded unlock during its last hour, in whole minutes rounded up.
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, =1{1 minute left} other{{minutes} minutes left}}'**
  String unlockMinutesLeft(int minutes);

  /// Screen-reader label of the closed padlock on content that needs a rewarded video.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get lockedLabel;

  /// Screen-reader label of the green open padlock on open content.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get unlockedLabel;

  /// Sheet text under a locked pattern preview: one rewarded video unlocks this one pattern.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =1{Watch 1 short video to unlock this pattern and its step-by-step guide for 1 hour.} other{Watch 1 short video to unlock this pattern and its step-by-step guide for {hours} hours.}}'**
  String patternUnlockBody(int hours);

  /// Sheet text before a locked Academy lesson: one rewarded video unlocks this one lesson.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =1{Watch 1 short video to open this lesson as often as you like for the next hour.} other{Watch 1 short video to open this lesson as often as you like for the next {hours} hours.}}'**
  String lessonUnlockBody(int hours);

  /// Title of the sheet offering a rewarded video to unlock 4x4-6x6 solving.
  ///
  /// In en, this message translates to:
  /// **'Solve big cubes'**
  String get bigCubeUnlockTitle;

  /// Sheet text once the free 4x4-6x6 solve is used: one rewarded video unlocks big-cube solving.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =1{Your free 4×4–6×6 solve is used. Watch 1 short video to solve big cubes for the next hour.} other{Your free 4×4–6×6 solve is used. Watch 1 short video to solve big cubes for the next {hours} hours.}}'**
  String bigCubeUnlockBody(int hours);

  /// Bold pill above the 3D cube when the current guided move is a 180° (double) turn.
  ///
  /// In en, this message translates to:
  /// **'Double turn · 180°'**
  String get doubleTurnBadge;

  /// Home action card that opens the Academy on the selected cube size.
  ///
  /// In en, this message translates to:
  /// **'Academy'**
  String get homeAcademy;

  /// Home action card that opens the Pattern Library on the selected cube size.
  ///
  /// In en, this message translates to:
  /// **'Cool Patterns'**
  String get homePatterns;

  /// Home action card (and hub title) for the speed timer and the daily challenge.
  ///
  /// In en, this message translates to:
  /// **'Timer & Daily Challenge'**
  String get homePractice;

  /// Subtitle of the Scan & Solve choice sheet.
  ///
  /// In en, this message translates to:
  /// **'How would you like to start?'**
  String get scanChoiceSubtitle;

  /// Scan & Solve sheet option: scan the physical cube with the camera.
  ///
  /// In en, this message translates to:
  /// **'Scan with camera'**
  String get scanChoiceCamera;

  /// Description of the camera scan option.
  ///
  /// In en, this message translates to:
  /// **'Show each face to the camera and get the solution.'**
  String get scanChoiceCameraDesc;

  /// Scan & Solve sheet option: open the interactive 3D cube.
  ///
  /// In en, this message translates to:
  /// **'Open 3D cube'**
  String get scanChoice3d;

  /// Description of the 3D cube option.
  ///
  /// In en, this message translates to:
  /// **'Turn a virtual cube, scramble it and solve it step by step.'**
  String get scanChoice3dDesc;

  /// Academy size filter chip that shows the lessons of every cube size.
  ///
  /// In en, this message translates to:
  /// **'All sizes'**
  String get academyAllSizes;

  /// No description provided for @homeAcademyProgress.
  ///
  /// In en, this message translates to:
  /// **'{done} / {total} lessons completed'**
  String homeAcademyProgress(int done, int total);

  /// No description provided for @academySizeProgress.
  ///
  /// In en, this message translates to:
  /// **'{size} • {done} / {total} completed'**
  String academySizeProgress(String size, int done, int total);

  /// No description provided for @lessonStageConcept.
  ///
  /// In en, this message translates to:
  /// **'Concept'**
  String get lessonStageConcept;

  /// No description provided for @lessonStageExamples.
  ///
  /// In en, this message translates to:
  /// **'Examples'**
  String get lessonStageExamples;

  /// No description provided for @lessonStagePractice.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get lessonStagePractice;

  /// No description provided for @lessonStageNext.
  ///
  /// In en, this message translates to:
  /// **'Next / free'**
  String get lessonStageNext;

  /// No description provided for @lessonStageOf.
  ///
  /// In en, this message translates to:
  /// **'Stage {index} of {total}: {name}'**
  String lessonStageOf(int index, int total, String name);

  /// No description provided for @lessonExampleOf.
  ///
  /// In en, this message translates to:
  /// **'Example {index} of {total}'**
  String lessonExampleOf(int index, int total);

  /// No description provided for @lessonWalkthroughOf.
  ///
  /// In en, this message translates to:
  /// **'Walkthrough {index} of {total}'**
  String lessonWalkthroughOf(int index, int total);

  /// No description provided for @lessonBonusCase.
  ///
  /// In en, this message translates to:
  /// **'Bonus case'**
  String get lessonBonusCase;

  /// No description provided for @lessonContinueDesc.
  ///
  /// In en, this message translates to:
  /// **'Go straight on to {lesson}.'**
  String lessonContinueDesc(String lesson);

  /// No description provided for @lessonFreePractice.
  ///
  /// In en, this message translates to:
  /// **'Free practice'**
  String get lessonFreePractice;

  /// No description provided for @lessonFreePracticeDesc.
  ///
  /// In en, this message translates to:
  /// **'Solve a scrambled 3D cube on your own, from the start through this step.'**
  String get lessonFreePracticeDesc;

  /// No description provided for @freePracticeBanner.
  ///
  /// In en, this message translates to:
  /// **'Practice freely: solve the cube from the start up through {topic}!'**
  String freePracticeBanner(String topic);

  /// No description provided for @pieceColorSeparator.
  ///
  /// In en, this message translates to:
  /// **'-'**
  String get pieceColorSeparator;

  /// No description provided for @cueFaceTurn.
  ///
  /// In en, this message translates to:
  /// **'Turn the {face} face the way the arrow shows. Its center stays put; only the pieces around it travel.'**
  String cueFaceTurn(String face);

  /// No description provided for @cueTrigger.
  ///
  /// In en, this message translates to:
  /// **'Right-hand trigger, {front} facing you: right face up, top to the left, right face down, top back to the right.'**
  String cueTrigger(String front);

  /// No description provided for @cueTriggerBack.
  ///
  /// In en, this message translates to:
  /// **'The sixth trigger in a row brings the cube back exactly as it was. Six is the magic number!'**
  String get cueTriggerBack;

  /// No description provided for @cueSliceInner.
  ///
  /// In en, this message translates to:
  /// **'Turn only the inner slice next to the {face} face. The {face} face itself stays still, so the centers split apart.'**
  String cueSliceInner(String face);

  /// No description provided for @cueSliceWide.
  ///
  /// In en, this message translates to:
  /// **'A wide turn: the {face} face and the slice next to it turn together, like one thick layer.'**
  String cueSliceWide(String face);

  /// No description provided for @cueTurnCube.
  ///
  /// In en, this message translates to:
  /// **'Turn the whole cube so the {top} center is on top and the {front} center faces you.'**
  String cueTurnCube(String top, String front);

  /// No description provided for @cueTurnTop.
  ///
  /// In en, this message translates to:
  /// **'Turn only the top layer, as the arrow shows, to set up the next algorithm.'**
  String get cueTurnTop;

  /// No description provided for @cueAlignTop.
  ///
  /// In en, this message translates to:
  /// **'Last move: turn the top layer to line up its colors. Done!'**
  String get cueAlignTop;

  /// No description provided for @cueCrossTop.
  ///
  /// In en, this message translates to:
  /// **'The {piece} edge is in the top layer. Turn the top until it sits right above the {center} center, then turn that face twice to bring it down.'**
  String cueCrossTop(String piece, String center);

  /// No description provided for @cueCrossMiddle.
  ///
  /// In en, this message translates to:
  /// **'The {piece} edge is stuck in the middle layer. Lift it to the top, line it up above the {center} center, then bring it down.'**
  String cueCrossMiddle(String piece, String center);

  /// No description provided for @cueCrossFlipped.
  ///
  /// In en, this message translates to:
  /// **'The {piece} edge is in its spot but flipped: its white faces sideways. Take it out and lift it to the top, white facing up, then bring it down next to the {center} center.'**
  String cueCrossFlipped(String piece, String center);

  /// No description provided for @cueCrossBottom.
  ///
  /// In en, this message translates to:
  /// **'CFOP style: the bottom may turn too. Drop the {piece} edge in and turn the bottom so it lines up with the {center} center.'**
  String cueCrossBottom(String piece, String center);

  /// No description provided for @cueCornerTop.
  ///
  /// In en, this message translates to:
  /// **'Turn the top so the {piece} corner sits right above its slot, between the {a} and {b} sides. Repeat the right-hand trigger until it drops in, correctly turned.'**
  String cueCornerTop(String piece, String a, String b);

  /// No description provided for @cueCornerTwisted.
  ///
  /// In en, this message translates to:
  /// **'The {piece} corner is in its slot but twisted. One trigger pops it out (a yellow corner takes its place); keep repeating over the same slot until it drops back in with white down. Don\'t turn the cube to chase it.'**
  String cueCornerTwisted(String piece);

  /// No description provided for @cueMiddleRight.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until the {piece} edge lines up with the {a} center, then send it down to the right, into the slot between {a} and {b}.'**
  String cueMiddleRight(String piece, String a, String b);

  /// No description provided for @cueMiddleLeft.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until the {piece} edge lines up with the {a} center, then send it down to the left, into the slot between {a} and {b}.'**
  String cueMiddleLeft(String piece, String a, String b);

  /// No description provided for @cueMiddleFlipped.
  ///
  /// In en, this message translates to:
  /// **'The {piece} edge is in its slot but flipped. Insert a yellow edge there to push it out to the top, then insert it again between {a} and {b}.'**
  String cueMiddleFlipped(String piece, String a, String b);

  /// No description provided for @cueYellowLine.
  ///
  /// In en, this message translates to:
  /// **'A yellow line: turn the top so it runs from left to right, keep {front} facing you, then apply the yellow-cross algorithm.'**
  String cueYellowLine(String front);

  /// No description provided for @cueYellowL.
  ///
  /// In en, this message translates to:
  /// **'A yellow L: turn the top so the L points to the back left, keep {front} facing you, then apply the algorithm. It becomes a line.'**
  String cueYellowL(String front);

  /// No description provided for @cueYellowDot.
  ///
  /// In en, this message translates to:
  /// **'Only the yellow center is yellow: a dot. Apply the algorithm once with {front} facing you to get an L. A dot can take three rounds, so keep going.'**
  String cueYellowDot(String front);

  /// No description provided for @cueEdgesMatch.
  ///
  /// In en, this message translates to:
  /// **'Turn the top until the {piece} edge matches the {center} center.'**
  String cueEdgesMatch(String piece, String center);

  /// No description provided for @cueEdgesSwap.
  ///
  /// In en, this message translates to:
  /// **'Two matched edges sit at the back and on the right. With {front} facing you, apply the swap: the front and left edges trade places.'**
  String cueEdgesSwap(String front);

  /// No description provided for @cueEdgesOpposite.
  ///
  /// In en, this message translates to:
  /// **'The matched edges sit opposite each other. Apply the swap once with {front} facing you; afterwards two neighbors match.'**
  String cueEdgesOpposite(String front);

  /// No description provided for @cueCornersCycle.
  ///
  /// In en, this message translates to:
  /// **'The {piece} corner is already in its spot. Keep it at the front right, {front} facing you, and cycle the other three corners.'**
  String cueCornersCycle(String piece, String front);

  /// No description provided for @cueCornersNone.
  ///
  /// In en, this message translates to:
  /// **'No yellow corner is in its spot yet. Cycle once with {front} facing you; afterwards one corner is home.'**
  String cueCornersNone(String front);

  /// No description provided for @cueTwistCorner.
  ///
  /// In en, this message translates to:
  /// **'Twist the {piece} corner at the front right: repeat the down-trigger in pairs until its yellow faces up. The lower layers look messy for now; they come back with the last corner!'**
  String cueTwistCorner(String piece);

  /// No description provided for @cueTwistFour.
  ///
  /// In en, this message translates to:
  /// **'The {piece} corner needs four triggers this time. Keep going: yellow always comes up after two or four.'**
  String cueTwistFour(String piece);

  /// No description provided for @cueTwistNext.
  ///
  /// In en, this message translates to:
  /// **'Turn only the top layer to bring the next twisted corner to the front right. Don\'t turn the whole cube now!'**
  String get cueTwistNext;

  /// No description provided for @cueF2lPair.
  ///
  /// In en, this message translates to:
  /// **'Pair the {piece} corner with the {edge} edge on top, then insert the pair into the slot between {a} and {b}.'**
  String cueF2lPair(String piece, String edge, String a, String b);

  /// No description provided for @cueF2lStuck.
  ///
  /// In en, this message translates to:
  /// **'The {piece} corner is stuck in its slot with the wrong edge. Take it out to the top first, then pair it up and insert it.'**
  String cueF2lStuck(String piece);

  /// No description provided for @cueOllSune.
  ///
  /// In en, this message translates to:
  /// **'With {front} facing you, apply Sune to turn the yellow corners up.'**
  String cueOllSune(String front);

  /// No description provided for @cueOllSuneAgain.
  ///
  /// In en, this message translates to:
  /// **'One Sune was not enough this time. Turn the top and apply Sune again, {front} facing you.'**
  String cueOllSuneAgain(String front);

  /// No description provided for @cuePllCorners.
  ///
  /// In en, this message translates to:
  /// **'Two corners need to swap. Keep the matching pair (headlights) on the left, {front} facing you, and apply the T-perm.'**
  String cuePllCorners(String front);

  /// No description provided for @cuePllEdges.
  ///
  /// In en, this message translates to:
  /// **'The corners are done. Keep the {piece} edge at the back and cycle the other three edges with the U-perm.'**
  String cuePllEdges(String piece);

  /// No description provided for @cuePllNoEdge.
  ///
  /// In en, this message translates to:
  /// **'No top edge matches its center yet. Apply the U-perm once from any side; afterwards one edge does.'**
  String get cuePllNoEdge;

  /// No description provided for @cueTwoSwapAdjacent.
  ///
  /// In en, this message translates to:
  /// **'Two neighboring top corners need to swap. Keep the matching pair on the left, {front} facing you, and apply the swap.'**
  String cueTwoSwapAdjacent(String front);

  /// No description provided for @cueTwoSwapDiagonal.
  ///
  /// In en, this message translates to:
  /// **'The two corners to swap sit diagonally. Apply the diagonal swap with {front} facing you.'**
  String cueTwoSwapDiagonal(String front);

  /// No description provided for @cueCenterCycle.
  ///
  /// In en, this message translates to:
  /// **'Bring the stray {color} center piece home with the center 3-cycle: slice, top, slice, then everything back.'**
  String cueCenterCycle(String color);

  /// No description provided for @cueCenterBar.
  ///
  /// In en, this message translates to:
  /// **'A whole bar of {color} center pieces sits on the wrong face. Lift it with the slice, turn the top, and bring it back home.'**
  String cueCenterBar(String color);

  /// No description provided for @cueEdgePair.
  ///
  /// In en, this message translates to:
  /// **'Pair both {piece} edge pieces: line them up, slice, swap in an unpaired edge with the right-hand moves, then slice back.'**
  String cueEdgePair(String piece);

  /// No description provided for @cueEdgeLast.
  ///
  /// In en, this message translates to:
  /// **'The last edges: pair the {piece} edge with the last-two-edges algorithm, which keeps every finished edge intact.'**
  String cueEdgeLast(String piece);

  /// No description provided for @cueParityOll.
  ///
  /// In en, this message translates to:
  /// **'OLL parity: one top edge is flipped, which never happens on a 3×3. Keep it at the front, {front} facing you, and apply the parity fix before any normal OLL.'**
  String cueParityOll(String front);

  /// No description provided for @cueParityPll.
  ///
  /// In en, this message translates to:
  /// **'PLL parity: two top edges are swapped, which never happens on a 3×3. Keep them at the front and back, apply the parity swap, then line up the top.'**
  String get cueParityPll;

  /// No description provided for @cueParityFive.
  ///
  /// In en, this message translates to:
  /// **'Edge parity: the two outer wings of one edge are swapped, the only parity a 5×5 has. Keep that edge at the front, {front} facing you, and apply the fix once.'**
  String cueParityFive(String front);

  /// Callout of the inner-wing parity demonstration.
  ///
  /// In en, this message translates to:
  /// **'Inner-wing parity: only the 2 inner wings of the top edge are flipped. Keep it at the front, {front} facing you, and turn only the third slices.'**
  String cueParityInnerWing(String front);

  /// Wing rule card: case where all 4 wings of an edge are flipped.
  ///
  /// In en, this message translates to:
  /// **'All 4 wings flipped'**
  String get wingRuleAllFour;

  /// Wing rule card: the fix for all 4 wings flipped.
  ///
  /// In en, this message translates to:
  /// **'3-layer OLL parity (3Rw)'**
  String get wingRuleAllFourFix;

  /// Wing rule card: case where only the 2 inner wings are flipped.
  ///
  /// In en, this message translates to:
  /// **'Only the 2 inner wings flipped'**
  String get wingRuleInnerTwo;

  /// Wing rule card: the fix for only the 2 inner wings flipped.
  ///
  /// In en, this message translates to:
  /// **'Inner-wing parity (3R)'**
  String get wingRuleInnerTwoFix;

  /// First-launch intro: skips the remaining pages.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// First-launch intro: goes to the next page.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// First-launch intro: last page button that opens the app.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingStart;

  /// First-launch intro, page 1 title: what CubeMentor is.
  ///
  /// In en, this message translates to:
  /// **'Your cube companion'**
  String get onboardingWhatTitle;

  /// First-launch intro, page 1 text.
  ///
  /// In en, this message translates to:
  /// **'CubeMentor helps you solve, learn and practice every cube from 2×2 to 6×6, fully offline.'**
  String get onboardingWhatBody;

  /// First-launch intro, page 2 title: scanning and solving.
  ///
  /// In en, this message translates to:
  /// **'Scan & solve in seconds'**
  String get onboardingScanTitle;

  /// First-launch intro, page 2 text.
  ///
  /// In en, this message translates to:
  /// **'Show each face to the camera (or tap in the colors) and follow the 3D solution move by move.'**
  String get onboardingScanBody;

  /// First-launch intro, page 3 title: the Academy.
  ///
  /// In en, this message translates to:
  /// **'Learn in the Academy'**
  String get onboardingLearnTitle;

  /// First-launch intro, page 3 text.
  ///
  /// In en, this message translates to:
  /// **'Master the layer-by-layer method one short lesson at a time, with a 3D cube that shows every move.'**
  String get onboardingLearnBody;

  /// First-launch intro, page 4 title: Pattern Library and 3D Playground.
  ///
  /// In en, this message translates to:
  /// **'Cool patterns & 3D Playground'**
  String get onboardingPatternsTitle;

  /// First-launch intro, page 4 text, under live 3D pattern cubes for every size.
  ///
  /// In en, this message translates to:
  /// **'Turn any cube from 2×2 to 6×6 into eye-catching patterns, or twist and scramble freely in the Playground. Drag the cube to spin it; tap a size to switch.'**
  String get onboardingPatternsBody;

  /// Scan & Solve sheet: description of the manual color entry choice.
  ///
  /// In en, this message translates to:
  /// **'Tap in the colors of each face, sticker by sticker.'**
  String get scanChoiceManualDesc;

  /// Scanner recovery button: start the camera / the scan again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get scanTryAgain;

  /// Scan review: keep the scanned colors and fix them by tapping stickers.
  ///
  /// In en, this message translates to:
  /// **'Fix colors by hand'**
  String get scanEditManually;

  /// Always-visible capture advice over the camera view.
  ///
  /// In en, this message translates to:
  /// **'Center the face in the grid. Use bright, even light and avoid glare.'**
  String get scanLightingHint;

  /// Academy: one-sentence explanation of a crown (a horizontal layer) where crowns are first introduced.
  ///
  /// In en, this message translates to:
  /// **'A layer is one horizontal slice of the cube: the first layer is the white layer at the bottom, the second is the middle layer and the third is the yellow layer on top.'**
  String get crownExplain;

  /// Heading of the learning-objective card at the start of an Academy lesson.
  ///
  /// In en, this message translates to:
  /// **'Learning objective'**
  String get lessonObjectiveHeading;

  /// Move instruction: the U layer as seen on the front face.
  ///
  /// In en, this message translates to:
  /// **'Top row of the front face'**
  String get dirRowTop;

  /// Move instruction: the D layer as seen on the front face.
  ///
  /// In en, this message translates to:
  /// **'Bottom row of the front face'**
  String get dirRowBottom;

  /// Move instruction: the R layer as seen on the front face.
  ///
  /// In en, this message translates to:
  /// **'Right column of the front face'**
  String get dirColumnRight;

  /// Move instruction: the L layer as seen on the front face.
  ///
  /// In en, this message translates to:
  /// **'Left column of the front face'**
  String get dirColumnLeft;

  /// 3D Playground Solve button: sheet title asking for Fast or Guided solve.
  ///
  /// In en, this message translates to:
  /// **'How do you want to solve it?'**
  String get solveChoiceTitle;

  /// Solve choice sheet: description of Fast solve.
  ///
  /// In en, this message translates to:
  /// **'The shortest solution, played move by move.'**
  String get solveChoiceFastDesc;

  /// Solve choice sheet: description of the guided step-by-step solve.
  ///
  /// In en, this message translates to:
  /// **'Learn the layer-by-layer method one step at a time.'**
  String get solveChoiceGuidedDesc;

  /// Dialog title when the last step of a guided solve is done.
  ///
  /// In en, this message translates to:
  /// **'Solved!'**
  String get guidedSolvedTitle;

  /// Dialog text when the last step of a guided solve is done.
  ///
  /// In en, this message translates to:
  /// **'You followed every step and solved the cube.'**
  String get guidedSolvedBody;

  /// Guided solve finished: solve the same cube again from the first step.
  ///
  /// In en, this message translates to:
  /// **'Solve again'**
  String get solveAgain;

  /// Returns to the home screen.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// Daily Challenge completion screen: caption of today's solve time.
  ///
  /// In en, this message translates to:
  /// **'Today\'s time'**
  String get dailyStatTime;

  /// Daily Challenge completion screen: caption of the personal best time.
  ///
  /// In en, this message translates to:
  /// **'Personal best'**
  String get dailyStatBest;

  /// Daily Challenge completion screen: caption of the current streak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get dailyStatStreak;

  /// Daily Challenge completion screen: caption of the best streak.
  ///
  /// In en, this message translates to:
  /// **'Best streak'**
  String get dailyStatBestStreak;

  /// Settings entry and title of the in-app privacy policy screen.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicyTitle;

  /// Subtitle of the Privacy policy entry in Settings.
  ///
  /// In en, this message translates to:
  /// **'What CubeMentor stores and what the ads use.'**
  String get settingsPrivacyPolicyDesc;

  /// Privacy policy: introduction.
  ///
  /// In en, this message translates to:
  /// **'CubeMentor works without an account and without servers of its own. This page explains what stays on your device and what our ad partner uses.'**
  String get privacyIntro;

  /// Privacy policy section title: data stored on the device.
  ///
  /// In en, this message translates to:
  /// **'Your data stays on your device'**
  String get privacyDataTitle;

  /// Privacy policy section: data stored on the device.
  ///
  /// In en, this message translates to:
  /// **'Your language, settings, lesson progress, solve times and daily streak are saved only on this device. We have no servers, so we never receive them. Uninstalling the app deletes them.'**
  String get privacyDataBody;

  /// Privacy policy section title: camera use.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get privacyCameraTitle;

  /// Privacy policy section: camera use.
  ///
  /// In en, this message translates to:
  /// **'The camera is used only while you scan a cube. Frames are analyzed on your device to read the sticker colors; no photo or video is saved or sent anywhere.'**
  String get privacyCameraBody;

  /// Privacy policy section title: advertising.
  ///
  /// In en, this message translates to:
  /// **'Ads'**
  String get privacyAdsTitle;

  /// Privacy policy section: advertising (Google AdMob).
  ///
  /// In en, this message translates to:
  /// **'The app shows ads from Google AdMob. Google may use device identifiers and ad interaction data to show and measure ads, as described in Google\'s privacy policy. Where the law requires it, you are asked for consent first and can change it in Settings.'**
  String get privacyAdsBody;

  /// Privacy policy section title: contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get privacyContactTitle;

  /// Privacy policy section: contact email.
  ///
  /// In en, this message translates to:
  /// **'Questions about privacy? Write to us at {email}.'**
  String privacyContactBody(String email);
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
    'bn',
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
    'my',
    'pl',
    'pt',
    'ru',
    'tr',
    'tt',
    'vi',
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
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
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
    case 'my':
      return AppLocalizationsMy();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'tt':
      return AppLocalizationsTt();
    case 'vi':
      return AppLocalizationsVi();
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
