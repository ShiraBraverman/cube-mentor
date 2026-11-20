// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Scanne, löse und meistere jeden Würfel vom 2×2 bis zum 6×6.';

  @override
  String get chooseCubeSize => 'Wähle deinen Würfel';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Einsteiger';

  @override
  String get cubeLevel3 => 'Klassiker';

  @override
  String get cubeLevel4 => 'Fortgeschritten';

  @override
  String get cubeLevel5 => 'Experte';

  @override
  String get cubeLevel6 => 'Meister';

  @override
  String get cubeComingSoon => 'Neuer Würfel kommt bald';

  @override
  String get carouselPrevious => 'Vorheriger Würfel';

  @override
  String get carouselNext => 'Nächster Würfel';

  @override
  String get chooseMode => 'Was möchtest du tun?';

  @override
  String get modePlayground => '3D-Spielwiese';

  @override
  String get modePlaygroundDesc =>
      'Drehe Ebenen, verdrehe den Würfel und spiele Züge in 3D ab.';

  @override
  String get modeScanSolve => 'Scannen & lösen';

  @override
  String get modeScanSolveDesc =>
      'Scanne deinen Würfel mit der Kamera und erhalte eine Lösung.';

  @override
  String get modeAcademy => 'Akademie';

  @override
  String get modeAcademyDesc =>
      'Lerne Schritt für Schritt mit interaktiven Lektionen.';

  @override
  String get language => 'Sprache';

  @override
  String get languageSearch => 'Sprache suchen';

  @override
  String get languageNoResults => 'Keine Sprache passt zu deiner Suche.';

  @override
  String playgroundTitle(int size) {
    return '$size×$size-Spielwiese';
  }

  @override
  String get scramble => 'Verdrehen';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get undo => 'Rückgängig';

  @override
  String get speed => 'Tempo';

  @override
  String get xray => 'Röntgen';

  @override
  String get prime => 'Gegen';

  @override
  String get wide => 'Breit';

  @override
  String layer(int index) {
    return 'Ebene $index';
  }

  @override
  String get cubeRotations => 'Drehungen';

  @override
  String get play => 'Abspielen';

  @override
  String get pause => 'Pause';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Züge',
      one: '1 Zug',
      zero: 'Keine Züge',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Gelöst';

  @override
  String get scrambled => 'Verdreht';

  @override
  String get orbitHint =>
      'Ziehe an einer Reihe, um sie zu drehen · Ziehe am Hintergrund, um die Ansicht zu drehen';

  @override
  String get notationPad => 'Notationstasten';

  @override
  String get solve => 'Lösen';

  @override
  String get solving => 'Wird gelöst…';

  @override
  String get solveFast => 'Schnell lösen';

  @override
  String get solveLearn => 'Schritt für Schritt lernen';

  @override
  String get solveModeGuided => 'Geführt (3 Kronen)';

  @override
  String get solveModeFast => 'Schnell (optimal)';

  @override
  String solveUnavailable(int size) {
    return 'Der $size×$size-Löser kommt mit einem späteren Update.';
  }

  @override
  String get solveAlreadySolved => 'Der Würfel ist bereits gelöst.';

  @override
  String solveFailed(String reason) {
    return 'Dieser Würfel lässt sich nicht lösen ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'Die Lösungs-Engine ist auf diesem Gerät nicht verfügbar.';

  @override
  String get solveComplete => 'Gelöst! Super gemacht.';

  @override
  String solveSummary(int count) {
    return '$count Züge';
  }

  @override
  String get nextMove => 'Nächster Zug';

  @override
  String get previousMove => 'Vorheriger Zug';

  @override
  String get halfTurnHalfway =>
      'Gut, schon halb geschafft! Dreh sie noch einmal in dieselbe Richtung für eine Doppeldrehung (180°).';

  @override
  String get wideTurnInner =>
      'Super! Wische jetzt die angrenzende innere Ebene, um die breite Drehung abzuschließen.';

  @override
  String get wideTurnOuter =>
      'Super! Wische jetzt die angrenzende äußere Ebene, um die breite Drehung abzuschließen.';

  @override
  String get wideTurnMore =>
      'Super! Wische die leuchtenden Ebenen nacheinander weiter, um die breite Drehung abzuschließen.';

  @override
  String get guideSwipeHint =>
      'Wische die leuchtende Ebene in Pfeilrichtung oder tippe auf Weiter.';

  @override
  String get guideRotateHint =>
      'Drehe den ganzen Würfel wie vom Pfeil gezeigt: Tippe auf Weiter.';

  @override
  String get guideWrongMove => 'Folge dem markierten Pfeil';

  @override
  String get guideExit => 'Anleitung beenden';

  @override
  String get colorWhite => 'weiß';

  @override
  String get colorYellow => 'gelb';

  @override
  String get colorGreen => 'grün';

  @override
  String get colorBlue => 'blau';

  @override
  String get colorRed => 'rot';

  @override
  String get colorOrange => 'orange';

  @override
  String get phaseOptimal2x2 => 'Optimale Lösung';

  @override
  String get phaseKociemba1 => 'Phase 1 · Steine orientieren';

  @override
  String get phaseKociemba2 => 'Phase 2 · Würfel fertigstellen';

  @override
  String get phaseLblCross => 'Weißes Kreuz';

  @override
  String get phaseLblCorners => 'Ecken der ersten Krone';

  @override
  String get phaseLblMiddle => 'Kanten der mittleren Ebene';

  @override
  String get phaseLblYellowCross => 'Gelbes Kreuz';

  @override
  String get phaseLblYellowEdges => 'Kanten des gelben Kreuzes ausrichten';

  @override
  String get phaseLblYellowCorners => 'Gelbe Ecken platzieren';

  @override
  String get phaseLblYellowCornersOrient => 'Gelbe Ecken drehen';

  @override
  String get crownFirst => 'Erste Krone';

  @override
  String get crownSecond => 'Zweite Krone';

  @override
  String get crownThird => 'Dritte Krone';

  @override
  String get crownFirstGoal => 'Weiße Seite und erste Ebene';

  @override
  String get crownSecondGoal => 'Mittlere Ebene';

  @override
  String get crownThirdGoal => 'Gelbe Seite und letzte Ebene';

  @override
  String get subStepGoal11 =>
      'Baue ein weißes Kreuz, bei dem jede weiße Kante auch zur benachbarten Mitte passt.';

  @override
  String get subStepGoal12 =>
      'Setze die 4 weißen Ecken an ihre Plätze, um die weiße Seite und den ganzen ersten Ring fertigzustellen.';

  @override
  String get subStepGoal21 =>
      'Setze die 4 Kanten der mittleren Ebene ein, ohne die erste Krone zu zerstören.';

  @override
  String get subStepGoal31 => 'Baue ein gelbes Kreuz auf der letzten Ebene.';

  @override
  String get subStepGoal32 =>
      'Tausche die Kanten des gelben Kreuzes, bis jede zu ihrer seitlichen Mitte passt.';

  @override
  String get subStepGoal33 =>
      'Bringe die 4 gelben Ecken an ihre richtigen Plätze, auch wenn sie noch verdreht sind.';

  @override
  String get subStepGoal34 =>
      'Drehe jede gelbe Ecke an ihrem Platz, bis alle Aufkleber passen und der Würfel gelöst ist.';

  @override
  String get explainOptimal2x2 =>
      'Die kürzestmögliche Lösung, gefunden durch Durchsuchen aller 2×2-Stellungen.';

  @override
  String get explainKociemba1 =>
      'Orientiere alle Steine und bringe die Kanten der mittleren Ebene in die mittlere Ebene.';

  @override
  String get explainKociemba2 =>
      'Beende nur mit U, D und halben Drehungen, die diese Orientierung erhalten.';

  @override
  String get explainLblOrient =>
      'Drehe den ganzen Würfel so, dass die weiße Mitte nach unten zeigt.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Bringe die Kante $piece nach unten neben die weiße Mitte, passend zur Seitenfarbe.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'Die Ecke $piece steckt an der falschen Stelle. Hole sie mit R U R\' U\' nach oben.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Drehe die obere Ebene, bis die Ecke $piece über ihrem Platz steht.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Wiederhole R U R\' U\', bis die Ecke $piece an ihrem Platz sitzt.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'Die Kante $piece ist in der mittleren Ebene, aber falsch. Hole sie nach oben heraus.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Drehe die obere Ebene, bis die Seitenfarbe der Kante $piece zu ihrer Mitte passt.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Setze die Kante $piece nach rechts ein: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Setze die Kante $piece nach links ein: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Drehe die obere Ebene, um die gelbe Form für den nächsten Algorithmus auszurichten.';

  @override
  String get explainLblYellowCrossAlg =>
      'Baue das gelbe Kreuz mit F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Drehe die obere Ebene, bis die gelben Kanten zu ihren Mitten passen.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Tausche gelbe Kanten mit R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Bringe die gelben Ecken mit U R U\' L\' U R\' U\' L an ihre Plätze.';

  @override
  String get explainLblNextCorner =>
      'Drehe die obere Ebene, um die nächste ungelöste gelbe Ecke nach vorne rechts zu bringen.';

  @override
  String get explainLblCornerTwist =>
      'Wiederhole R\' D\' R D, bis Gelb nach oben zeigt. Die untere Ebene ordnet sich am Ende von selbst.';

  @override
  String get explainLblFinalAlign =>
      'Drehe die obere Ebene, um den Würfel fertigzustellen.';

  @override
  String scanTitle(int size) {
    return '$size×$size scannen';
  }

  @override
  String get scanManualInput => 'Farben von Hand eingeben';

  @override
  String get scanUseCamera => 'Mit der Kamera scannen';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Seite $current von $total';
  }

  @override
  String get faceUp => 'Obere Seite';

  @override
  String get faceRight => 'Rechte Seite';

  @override
  String get faceFront => 'Vordere Seite';

  @override
  String get faceDown => 'Untere Seite';

  @override
  String get faceLeft => 'Linke Seite';

  @override
  String get faceBack => 'Hintere Seite';

  @override
  String get scanHintFront =>
      'Halte den Würfel mit einer beliebigen Seite zu dir. Das ist deine Vorderseite: Behalte beim Scannen dieselbe Seite oben.';

  @override
  String get scanHintRight =>
      'Drehe den ganzen Würfel von vorne aus einmal nach links, sodass dich die rechte Seite ansieht.';

  @override
  String get scanHintBack =>
      'Drehe den ganzen Würfel von vorne aus zweimal nach links.';

  @override
  String get scanHintLeft =>
      'Drehe den ganzen Würfel von vorne aus einmal nach rechts.';

  @override
  String get scanHintUp =>
      'Kippe von vorne aus die Oberseite zu dir, sodass sie zur Kamera zeigt.';

  @override
  String get scanHintDown =>
      'Kippe von vorne aus die Unterseite zu dir, sodass sie zur Kamera zeigt.';

  @override
  String get scanAlignHint =>
      'Fülle das Raster mit der Seite aus und tippe dann auf den Auslöser.';

  @override
  String get scanCapture => 'Seite aufnehmen';

  @override
  String get scanTurnLeft => 'Drehe den ganzen Würfel nach links';

  @override
  String get scanTurnRight => 'Drehe den ganzen Würfel nach rechts';

  @override
  String get scanTipTop => 'Kippe die Oberseite zu dir';

  @override
  String get scanTipBottom => 'Kippe die Unterseite zu dir';

  @override
  String get scanGlareTip =>
      'Spiegelung erkannt: Neige den Würfel etwas oder halte dein Handy darüber, um das Deckenlicht abzuschirmen.';

  @override
  String get scanDimTip =>
      'Zu dunkel: Geh an einen helleren Ort oder schalte die Taschenlampe ein.';

  @override
  String get scanTorch => 'Taschenlampe';

  @override
  String get scanGuideLabel =>
      'Scan-Anleitung: Gescannte Seiten sind farbig. Tippe auf eine gescannte Seite, um sie neu zu scannen.';

  @override
  String get scanTapToRescan =>
      'Tippe auf eine gescannte Seite, um sie erneut zu scannen.';

  @override
  String get scanCameraMissing =>
      'Auf diesem Gerät wurde keine Kamera gefunden.';

  @override
  String get scanCameraDenied =>
      'Der Kamerazugriff wurde verweigert. Du kannst die Farben trotzdem von Hand eingeben.';

  @override
  String get scanCameraFailed => 'Die Kamera konnte nicht gestartet werden.';

  @override
  String get scanAllGood => 'Alle Aufkleber sehen richtig aus.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Aufkleber sehen falsch aus',
      one: '1 Aufkleber sieht falsch aus',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Irgendetwas stimmt nicht';

  @override
  String scanIssueColors(int count) {
    return 'Jede Farbe muss genau $count-mal vorkommen.';
  }

  @override
  String get scanIssueCenters => 'Zwei Mitten haben dieselbe Farbe.';

  @override
  String get scanIssuePieces =>
      'Diese Aufkleber ergeben Steine, die es auf einem echten Würfel nicht gibt.';

  @override
  String get scanIssueTwist =>
      'Eine Ecke ist verdreht. Prüfe die Eckaufkleber.';

  @override
  String get scanIssueFlip =>
      'Eine Kante ist gekippt. Prüfe die Kantenaufkleber.';

  @override
  String get scanIssueParity => 'Zwei Steine scheinen vertauscht zu sein.';

  @override
  String get scanIssueUnavailable =>
      'Die Farbprüfung ist auf diesem Gerät nicht verfügbar.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Aufkleber waren schwer zu erkennen: Wirf kurz einen Blick darauf.',
      one:
          'Ein Aufkleber war schwer zu erkennen: Wirf kurz einen Blick darauf.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Tippe auf einen Aufkleber, um die Farbe zu ändern · Lange drücken für die Palette';

  @override
  String get scanRescanFace => 'Seite neu scannen';

  @override
  String get scanCancelRescan => 'Zurück zu den Farben';

  @override
  String get scanPaletteTitle => 'Farbe wählen';

  @override
  String get scanOpen3d => 'In 3D öffnen';

  @override
  String get scanRestart => 'Neu beginnen';

  @override
  String get modeTimer => 'Speed-Timer';

  @override
  String get modeTimerDesc =>
      'Scrambles, Inspektion, Durchschnitte und Bestzeiten.';

  @override
  String get modeDaily => 'Tägliche Herausforderung';

  @override
  String get modeDailyDesc =>
      'Jeden Tag ein neuer Scramble. Halte deine Serie am Leben.';

  @override
  String get modePatterns => 'Musterbibliothek';

  @override
  String get modePatternsDesc => 'Schachbrett, Superflip und mehr, in 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-Tage-Serie',
      one: '1-Tage-Serie',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Weiterlernen';

  @override
  String get startLearning => 'Jetzt lernen';

  @override
  String lessonOf(int index, int total) {
    return 'Lektion $index von $total';
  }

  @override
  String get academyAllDone => 'Alle Lektionen abgeschlossen!';

  @override
  String get academyTitle => 'Akademie';

  @override
  String academyProgress(int done, int total) {
    return '$done von $total Lektionen abgeschlossen';
  }

  @override
  String get lessonAdvanced => 'Fortgeschritten';

  @override
  String lessonPartOf(int index, int total) {
    return 'Teil $index von $total';
  }

  @override
  String get lessonNext => 'Weiter';

  @override
  String get lessonPrevious => 'Zurück';

  @override
  String get lessonFinish => 'Lektion abschließen';

  @override
  String get lessonComplete => 'Lektion abgeschlossen!';

  @override
  String get lessonNextLesson => 'Nächste Lektion';

  @override
  String get lessonBackToAcademy => 'Zurück zur Akademie';

  @override
  String get lessonTryIt =>
      'Du bist dran: Wische die Ebene, die der Pfeil zeigt, oder tippe auf Weiter.';

  @override
  String get lessonLookAround =>
      'Ziehe am Hintergrund, um den Würfel von allen Seiten zu sehen.';

  @override
  String get lessonDemoDone => 'Gut gemacht! Tippe auf Weiter.';

  @override
  String holdPrompt(String top, String front) {
    return 'Halte den Würfel mit der Mitte $top oben und der Mitte $front zu dir.';
  }

  @override
  String get trackBeginner => '3×3 für Anfänger: die 3 Kronen';

  @override
  String get trackCfop => 'Einführung in CFOP';

  @override
  String get trackTwoByTwo => '2×2 für Anfänger & Ortega';

  @override
  String get trackBigCubes => 'Große Würfel: Reduktion & Parität';

  @override
  String moveSentence(String layer, String direction) {
    return 'Drehe $layer $direction';
  }

  @override
  String get moveFaceR => 'die rechte Seite';

  @override
  String get moveFaceL => 'die linke Seite';

  @override
  String get moveFaceU => 'die obere Seite';

  @override
  String get moveFaceD => 'die untere Seite';

  @override
  String get moveFaceF => 'die vordere Seite';

  @override
  String get moveFaceB => 'die hintere Seite';

  @override
  String moveLayerInner(int depth, String face) {
    return 'Ebene $depth von $face aus';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth Ebenen tief)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'die Ebenen $near–$far von $face aus';
  }

  @override
  String get moveLayerMiddle => 'die mittlere Ebene';

  @override
  String get moveDirUp => 'nach oben';

  @override
  String get moveDirDown => 'nach unten';

  @override
  String get moveDirLeft => 'nach links';

  @override
  String get moveDirRight => 'nach rechts';

  @override
  String get moveDirClockwise => 'im Uhrzeigersinn';

  @override
  String get moveDirCounter => 'gegen den Uhrzeigersinn';

  @override
  String get moveDirBackClockwise => 'im Uhrzeigersinn, von hinten gesehen';

  @override
  String get moveDirBackCounter =>
      'gegen den Uhrzeigersinn, von hinten gesehen';

  @override
  String get moveDirHalf => 'um eine halbe Drehung (zweimal)';

  @override
  String get moveRotateX => 'Kippe den ganzen Würfel: Vorne wandert nach oben';

  @override
  String get moveRotateXPrime =>
      'Kippe den ganzen Würfel: Vorne wandert nach unten';

  @override
  String get moveRotateX2 =>
      'Dreh den ganzen Würfel um: Vorne wandert nach hinten';

  @override
  String get moveRotateY => 'Drehe den ganzen Würfel: Vorne wandert nach links';

  @override
  String get moveRotateYPrime =>
      'Drehe den ganzen Würfel: Vorne wandert nach rechts';

  @override
  String get moveRotateY2 =>
      'Drehe den ganzen Würfel halb herum: Hinten kommt nach vorne';

  @override
  String get moveRotateZ =>
      'Rolle den ganzen Würfel im Uhrzeigersinn: Oben wandert nach rechts';

  @override
  String get moveRotateZPrime =>
      'Rolle den ganzen Würfel gegen den Uhrzeigersinn: Oben wandert nach links';

  @override
  String get moveRotateZ2 =>
      'Stell den ganzen Würfel auf den Kopf: Oben wandert nach unten';

  @override
  String get phaseReductionCenters => 'Mitten';

  @override
  String get phaseReductionEdges => 'Kanten paaren';

  @override
  String get phaseReductionEdgeParity => 'Kantenparität';

  @override
  String get phaseReductionOllParity => 'OLL-Parität';

  @override
  String get phaseReductionPllParity => 'PLL-Parität';

  @override
  String get explainReductionCenterBlock =>
      'Ebenendrehungen, die mehrere Mittelsteine auf einmal an ihren Platz bringen.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Bringe einen Mittelstein $piece mit einem 3-Zyklus auf seine Seite, ohne fertige Mitten zu stören.';
  }

  @override
  String get explainReductionParityCenters =>
      'Baue die Mitten wieder auf, die die Paritätsdrehung verschoben hat.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Füge die Teile der Kante $piece mit einem 3-Zyklus zusammen; die Mitten bleiben gelöst.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Die letzten Kanten lassen sich nicht allein mit 3-Zyklen paaren (Kantenparität). Eine Drehung einer inneren Ebene behebt das.';

  @override
  String get explainReductionOllParity =>
      'OLL-Parität: Eine Kante ist gekippt, was auf einem 3×3 unmöglich ist. Dieser Algorithmus kippt sie zurück.';

  @override
  String get explainReductionPllParity =>
      'PLL-Parität: Zwei Kanten sind vertauscht, was auf einem 3×3 unmöglich ist. Dieser Algorithmus tauscht sie zurück.';

  @override
  String get patternsTitle => 'Musterbibliothek';

  @override
  String get patternsHint =>
      'Tippe auf ein Muster, um es anzusehen, und mach es dann auf deinem eigenen Würfel nach.';

  @override
  String get patternCheckerboard => 'Schachbrett';

  @override
  String get patternCubeInCube => 'Würfel im Würfel';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Punkte';

  @override
  String get patternCross => 'Kreuz';

  @override
  String get patternPython => 'Python';

  @override
  String get phasePattern => 'Muster bauen';

  @override
  String get explainPatternStep =>
      'Mach jeden Zug auf deinem eigenen Würfel nach. Tippe auf Lösen, um ihn wiederherzustellen.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Speed-Timer';

  @override
  String get timerHoldToStart => 'Gedrückt halten, dann zum Start loslassen';

  @override
  String get timerReleaseToStart => 'Zum Start loslassen';

  @override
  String get timerTapToStop => 'Zum Stoppen irgendwo tippen';

  @override
  String get timerInspecting =>
      'Inspektion: gedrückt halten, dann zum Start loslassen';

  @override
  String get timerTapToInspect => 'Tippen für 15 Sekunden Inspektion';

  @override
  String get timerInspectionToggle => '15 s Inspektion';

  @override
  String get timerNewScramble => 'Neuer Scramble';

  @override
  String get timerLoadingScramble => 'Scramble wird erstellt…';

  @override
  String get timerPb => 'Bestzeit';

  @override
  String get timerSolves => 'Lösungen';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Löschen';

  @override
  String get timerHistory => 'Verlauf';

  @override
  String get timerNoSolves =>
      'Noch keine Lösungen. Verdrehe deinen Würfel und los!';

  @override
  String get timerNewPb => 'Neue Bestzeit!';

  @override
  String get timerClearHistory => 'Verlauf löschen';

  @override
  String get timerScrambleHint =>
      'Weiß oben, Grün vorne halten, dann verdrehen:';

  @override
  String get dailyTitle => 'Tägliche Herausforderung';

  @override
  String dailyFor(String date) {
    return 'Herausforderung vom $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Beste Serie: $count';
  }

  @override
  String get dailyDone => 'Für heute geschafft! Komm morgen wieder.';

  @override
  String get dailyNotDone =>
      'Löse den heutigen Scramble, um deine Serie zu halten.';

  @override
  String get dailySolveVirtual => 'Am 3D-Würfel lösen';

  @override
  String get dailyTimeIt => 'Am eigenen Würfel stoppen';

  @override
  String get dailyHint => 'Tipp';

  @override
  String dailyHintText(String moves) {
    return 'Beginne mit dem weißen Kreuz: $moves';
  }

  @override
  String get dailyHintFailed => 'Gerade ist kein Tipp verfügbar.';

  @override
  String get lessonBasics => 'Lerne den Würfel kennen';

  @override
  String get lessonBasicsDesc => 'Steine, Seiten und Zugnamen.';

  @override
  String get stepBasicsPieces => 'Drei Arten von Steinen';

  @override
  String get stepBasicsPiecesBody =>
      'Mitten bewegen sich nie und geben jeder Seite ihre Farbe. Kanten haben zwei Farben, Ecken drei. Lösen heißt, jede Kante und jede Ecke neben die passenden Mitten zu bringen.';

  @override
  String get stepBasicsFaces => 'Sechs Seitenbuchstaben';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F und B stehen für die rechte, linke, obere, untere, vordere und hintere Seite. Ein Buchstabe allein bedeutet eine Vierteldrehung im Uhrzeigersinn, als würdest du direkt auf diese Seite schauen.';

  @override
  String get stepBasicsPrime => 'Gegen- und Doppeldrehungen';

  @override
  String get stepBasicsPrimeBody =>
      'Ein Apostroph (R\') dreht in die andere Richtung, gegen den Uhrzeigersinn. Eine 2 (U2) ist eine halbe Drehung: zwei Vierteldrehungen.';

  @override
  String get stepCrossGoal => 'Das Ziel';

  @override
  String get stepCrossGoalBody =>
      'Halte Gelb oben. Die vier weißen Kanten liegen unten um die weiße Mitte, jede Seitenfarbe passend zur benachbarten Mitte.';

  @override
  String get stepCrossTop => 'Kante oben';

  @override
  String get stepCrossTopBody =>
      'Suche oben eine weiße Kante. Drehe die obere Ebene, bis ihre Seitenfarbe über der passenden Mitte steht, und drehe diese Seite dann zweimal, um sie nach unten zu bringen.';

  @override
  String get stepCrossMiddle => 'Kante in der Mitte';

  @override
  String get stepCrossMiddleBody =>
      'Eine Kante in der mittleren Ebene muss erst nach oben: Drehe ihre Seite hoch, drehe die obere Ebene aus dem Weg und die Seite zurück, damit das Kreuz heil bleibt. Setze sie dann von oben ein.';

  @override
  String get stepCornersInsert => 'Über ihrem Platz';

  @override
  String get stepCornersInsertBody =>
      'Drehe die obere Ebene, bis eine weiße Ecke über dem Platz ihrer Farben vorne rechts steht. R U R\' U\' setzt sie ein.';

  @override
  String get stepCornersRepeat => 'Trigger wiederholen';

  @override
  String get stepCornersRepeatBody =>
      'Zeigt Weiß in die falsche Richtung, wiederhole R U R\' U\' über demselben Platz. Jede Ecke ist nach höchstens fünf Wiederholungen gelöst.';

  @override
  String get stepMiddleRight => 'Kante nach rechts';

  @override
  String get stepMiddleRightBody =>
      'Richte eine obere Kante an ihrer Mitte auf der Vorderseite aus. Passt ihre obere Farbe zur rechten Mitte, setze sie mit U R U\' R\' U\' F\' U F ein.';

  @override
  String get stepMiddleLeft => 'Kante nach links';

  @override
  String get stepMiddleLeftBody =>
      'Passt die obere Farbe stattdessen zur linken Mitte, nimm die Spiegelung: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Ein Algorithmus';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' macht aus einem gelben Punkt ein L, aus einem L eine Linie und aus einer Linie das Kreuz. Halte das L hinten links und die Linie waagerecht.';

  @override
  String get stepYellowEdges => 'Kanten ausrichten';

  @override
  String get stepYellowEdgesBody =>
      'Drehe die obere Ebene, bis zwei Kanten zu ihren Mitten passen. Mit einer hinten und einer rechts tauscht R U R\' U R U2 R\' U die anderen beiden.';

  @override
  String get stepPlaceCorners => 'Platzieren';

  @override
  String get stepPlaceCornersBody =>
      'Halte eine Ecke, die schon am richtigen Platz ist, vorne rechts. U R U\' L\' U R\' U\' L bewegt die anderen drei; wiederhole, bis alle vier am Platz sind.';

  @override
  String get stepTwistCorners => 'Drehen';

  @override
  String get stepTwistCornersBody =>
      'Mit einer ungelösten Ecke vorne rechts wiederholst du R\' D\' R D, bis Gelb oben ist, und drehst dann nur die obere Ebene, um die nächste zu holen. Unten sieht es bis ganz zum Schluss chaotisch aus: einfach weitermachen.';

  @override
  String get lessonCfopIntro => 'Was ist CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Vier Phasen';

  @override
  String get stepCfopOverviewBody =>
      'Speedcuber lösen das Kreuz, paaren jede Ecke der ersten Ebene mit ihrer Mittelkante (F2L), orientieren die letzte Ebene (OLL) und permutieren sie schließlich (PLL).';

  @override
  String get stepCfopCross => 'Das Kreuz planen';

  @override
  String get stepCfopCrossBody =>
      'Bei CFOP wird das Kreuz während der Inspektion geplant und unten in etwa acht Zügen gebaut.';

  @override
  String get lessonF2l => 'F2L-Grundlagen';

  @override
  String get lessonF2lDesc => 'Paare eine Ecke mit ihrer Kante.';

  @override
  String get stepF2lRight => 'Ein Paar einsetzen';

  @override
  String get stepF2lRightBody =>
      'Liegen eine Ecke und ihre Kante oben nebeneinander, bringe sie über ihren Slot und setze sie gemeinsam ein.';

  @override
  String get stepF2lLeft => 'Linkes Paar';

  @override
  String get stepF2lLeftBody =>
      'Derselbe Fall auf der anderen Seite ist die Spiegelung, U\' L\' U L. Mit einer Würfeldrehung (y) kannst du die bequemere Hand nutzen.';

  @override
  String get lessonOll => '2-Look-OLL';

  @override
  String get lessonOllDesc => 'Mach die Oberseite gelb.';

  @override
  String get stepOllCross => 'Zuerst die Kanten';

  @override
  String get stepOllCrossBody =>
      '2-Look-OLL beginnt mit dem Gelbes-Kreuz-Algorithmus, den du schon kennst.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Mit einer gelben Ecke nach oben vorne links orientiert Sune (R U R\' U R U2 R\') die anderen drei. Die meisten anderen Fälle nutzen Sune und seine Spiegelung.';

  @override
  String get lessonPll => '2-Look-PLL';

  @override
  String get lessonPllDesc => 'Stelle den Würfel fertig.';

  @override
  String get stepPllT => 'T-Perm';

  @override
  String get stepPllTBody =>
      'Die T-Perm tauscht zwei Ecken und zwei Kanten. Nutze sie, um die Ecken zu platzieren: Halte die zwei zu tauschenden Ecken rechts.';

  @override
  String get stepPllU => 'U-Perm';

  @override
  String get stepPllUBody =>
      'Sind die Ecken fertig, verschiebt die U-Perm drei Kanten zyklisch. Halte die fertige Seite hinten.';

  @override
  String get lessonTwoFirst => '2×2: erste Ebene';

  @override
  String get lessonTwoFirstDesc => 'Baue eine Seite mit passenden Ecken.';

  @override
  String get stepTwoIntro => 'Nur Ecken';

  @override
  String get stepTwoIntroBody =>
      'Ein 2×2 ist ein 3×3 ohne Kanten und Mitten. Wähle eine Farbe, baue diese Seite unten und sorge dafür, dass die Seitenfarben benachbarter Ecken zusammenpassen.';

  @override
  String get stepTwoCorner => 'Ecken einsetzen';

  @override
  String get stepTwoCornerBody =>
      'Genau wie die weißen Ecken beim 3×3: Bringe eine Ecke über ihren Platz und wiederhole R U R\' U\', bis sie passt.';

  @override
  String get lessonTwoOll => 'Oberseite orientieren';

  @override
  String get lessonTwoOllDesc => 'Ortega-OLL mit Sune.';

  @override
  String get stepTwoSune => 'Wieder Sune';

  @override
  String get stepTwoSuneBody =>
      'Sune macht auch beim 2×2 die Oberseite gelb. Ortega-Löser lernen sieben kurze Fälle; Sune und seine Spiegelung decken die meisten davon ab.';

  @override
  String get lessonTwoPbl => 'Beide Ebenen permutieren';

  @override
  String get lessonTwoPblDesc => 'Tausche Ecken, um fertig zu werden.';

  @override
  String get stepTwoAdjacent => 'Benachbarter Tausch';

  @override
  String get stepTwoAdjacentBody =>
      'Müssen zwei benachbarte obere Ecken getauscht werden, halte sie rechts und nutze die T-Perm.';

  @override
  String get stepTwoDiagonal => 'Diagonaler Tausch';

  @override
  String get stepTwoDiagonalBody =>
      'Zwei gegenüberliegende Ecken tauschst du mit der Y-Perm.';

  @override
  String get lessonBigIntro => 'Steine großer Würfel';

  @override
  String get lessonBigIntroDesc => 'Mitten, Flügel und Ebenen.';

  @override
  String get stepBigPieces => 'Keine festen Mitten';

  @override
  String get stepBigPiecesBody =>
      'Beim 4×4 hat jede Seite vier bewegliche Mittelsteine, und jede Kante besteht aus zwei Flügeln. Die Reduktion gruppiert sie, sodass sich der Würfel wie ein 3×3 verhält.';

  @override
  String get stepBigSlices => 'Breite und innere Drehungen';

  @override
  String get stepBigSlicesBody =>
      'Rw dreht die beiden rechten Ebenen zusammen. 2R dreht nur die zweite Ebene von rechts. Diese Drehungen bewegen Mitten und Flügel.';

  @override
  String get lessonBigCenters => 'Mitten';

  @override
  String get lessonBigCentersDesc => 'Gruppiere die Mittelsteine.';

  @override
  String get stepBigCenterCycle => 'Ein Mitten-3-Zyklus';

  @override
  String get stepBigCenterCycleBody =>
      'Dieser Kommutator bewegt genau drei Mittelsteine und lässt alles andere unberührt, sodass fertige Mitten fertig bleiben.';

  @override
  String get lessonBigEdges => 'Kanten paaren';

  @override
  String get lessonBigEdgesDesc => 'Füge Flügel zu ganzen Kanten zusammen.';

  @override
  String get stepBigEdgePair => 'Paaren & wiederherstellen';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' bringt zwei passende Flügel zusammen, R U R\' F R\' F\' R tauscht eine ungepaarte Kante ein, und Uw stellt die Mitten wieder her.';

  @override
  String get lessonBigParity => 'Parität';

  @override
  String get lessonBigParityDesc => 'OLL- und PLL-Parität bei geraden Würfeln.';

  @override
  String get stepBigOllParity => 'OLL-Parität';

  @override
  String get stepBigOllParityBody =>
      'Eine einzelne gekippte Kante gibt es auf einem 3×3 nicht. Bei geraden Würfeln kippt dieser Algorithmus die vordere obere Kante zurück. Dabei kann der Rest der oberen Ebene durcheinandergeraten, was die letzten 3×3-Schritte ohnehin beheben.';

  @override
  String get stepBigPllParity => 'PLL-Parität';

  @override
  String get stepBigPllParityBody =>
      'Ganz am Ende zwei vertauschte Kanten? 2R2 U2 2R2 Uw2 2R2 Uw2 tauscht die vordere und die hintere obere Kante.';

  @override
  String get introGoalHeading => 'Was ist das Ziel?';

  @override
  String get introHowHeading => 'Wie geht das?';

  @override
  String get introStart => 'Verstanden, Schritt für Schritt starten';

  @override
  String get introDontShowAgain => 'Nicht mehr automatisch anzeigen';

  @override
  String get introShowGoal => 'Ziel anzeigen';

  @override
  String get introStateStart => 'Start';

  @override
  String get introStateGoal => 'Ziel';

  @override
  String get introPlayMorph => 'Vom Start bis zum Ziel abspielen';

  @override
  String get introGoalBasics =>
      'Lerne, den Würfel zu lesen: seine Teile, seine sechs Seiten und wie die Zugbuchstaben sie drehen.';

  @override
  String get introGoalCross =>
      'Baue ein weißes Kreuz, bei dem jede weiße Kante auch zur Farbe des Mittelstücks daneben passt.';

  @override
  String get introGoalCorners =>
      'Setze die vier weißen Ecken ein, damit die erste Krone, die ganze weiße Ebene, fertig ist.';

  @override
  String get introGoalMiddle =>
      'Setze die vier Kanten der mittleren Ebene ein, damit die ersten zwei Ebenen gelöst sind.';

  @override
  String get introGoalYellowCross =>
      'Baue oben ein gelbes Kreuz; die Seitenfarben müssen noch nicht passen.';

  @override
  String get introGoalYellowEdges =>
      'Richte jede Kante des gelben Kreuzes an der Farbe des Mittelstücks auf ihrer Seite aus.';

  @override
  String get introGoalYellowCorners =>
      'Bring jede gelbe Ecke an ihren Platz, auch wenn sie noch verdreht ist.';

  @override
  String get introGoalTwistCorners =>
      'Dreh die gelben Ecken richtig herum, damit der ganze Würfel gelöst ist.';

  @override
  String get introGoalCfopIntro =>
      'Lerne den Speedcubing-Plan kennen: Kreuz, die ersten zwei Ebenen, dann die letzte Ebene in zwei Schritten.';

  @override
  String get introGoalF2l =>
      'Setze jede weiße Ecke zusammen mit ihrer Mittelkante ein und löse zwei Ebenen auf einmal.';

  @override
  String get introGoalOll =>
      'Mach die ganze Oberseite mit ein oder zwei Algorithmen gelb.';

  @override
  String get introGoalPll =>
      'Bring die Teile der letzten Ebene an ihren Platz, um den Würfel fertigzustellen.';

  @override
  String get introGoalTwoFirst =>
      'Baue auf dem 2×2 eine komplette weiße Ebene.';

  @override
  String get introGoalTwoOll => 'Mach die ganze Oberseite des 2×2 gelb.';

  @override
  String get introGoalTwoPbl =>
      'Tausche die letzten Ecken an ihren Platz, um den 2×2 zu lösen.';

  @override
  String get introGoalBigIntro =>
      'Lerne den 4×4 kennen: Mittelstücke, Kantenpaare und Ecken und die Züge, die sie drehen.';

  @override
  String get introGoalBigCenters =>
      'Sammle die Mittelteile jeder Seite zu einem einfarbigen Block.';

  @override
  String get introGoalBigEdges =>
      'Füge passende Kantenteile zusammen, sodass jede Kante wie eine einzige 3×3-Kante aussieht.';

  @override
  String get introGoalBigParity =>
      'Behebe die zwei 4×4-Fälle, die es beim 3×3 nie gibt: eine gekippte Kante oder zwei vertauschte Kanten.';

  @override
  String get introHowBasics =>
      'Mittelstücke bewegen sich nie, sie zeigen die Farbe jeder Seite.\nJeder Buchstabe dreht eine Seite eine Vierteldrehung im Uhrzeigersinn.\nEin Apostroph (\') dreht zurück, eine 2 dreht zweimal.';

  @override
  String get introHowCross =>
      'Halte Gelb oben: Das weiße Kreuz entsteht unten.\nSuche eine weiße Kante und richte ihre Seitenfarbe am passenden Mittelstück aus.\nDreh diese Seite zweimal, um die Kante an ihren Platz zu bringen.';

  @override
  String get introHowCorners =>
      'Bring eine weiße Ecke über ihren leeren Platz.\nWiederhole R U R\' U\', bis sie richtig herum einrastet.\nMach dasselbe mit den anderen drei Ecken.';

  @override
  String get introHowMiddle =>
      'Suche eine obere Kante ohne Gelb und richte ihre vordere Farbe an einem Mittelstück aus.\nSchick sie mit einem kurzen Algorithmus aus 8 Zügen nach rechts oder links.\nDie weiße Ebene kommt jedes Mal unversehrt zurück.';

  @override
  String get introHowYellowCross =>
      'Schau nach oben: ein Punkt, ein L oder eine Linie.\nHalte es wie gezeigt und mach F R U R\' U\' F\'.\nWiederhole, bis das gelbe Kreuz erscheint.';

  @override
  String get introHowYellowEdges =>
      'Dreh die obere Ebene, bis zwei Kanten zu ihren Mittelstücken passen.\nHalte sie hinten und rechts und mach dann R U R\' U R U2 R\' U.\nWiederhole, bis alle vier Kanten passen.';

  @override
  String get introHowYellowCorners =>
      'Eine Ecke sitzt richtig, wenn ihre Farben zu den drei Seiten um sie herum passen.\nHalte eine richtig platzierte Ecke vorne rechts.\nU R U\' L\' U R\' U\' L tauscht die anderen drei, bis alle passen.';

  @override
  String get introHowTwistCorners =>
      'Halte eine ungelöste Ecke vorne rechts.\nWiederhole R\' D\' R D, bis ihr Gelb nach oben zeigt.\nDreh für die nächste nur die obere Ebene; unten ordnet sich am Ende alles von selbst.';

  @override
  String get introHowCfopIntro =>
      'Kreuz: vier Kanten, geplant während der Inspektion.\nF2L: Jede Ecke geht zusammen mit ihrer Kante hinein.\nOLL macht die Oberseite gelb, dann bringt PLL die Teile an ihren Platz.';

  @override
  String get introHowF2l =>
      'Suche eine Ecke und ihre passende Kante in der oberen Ebene.\nFüge sie über ihrem Slot zu einem Paar zusammen.\nSetz das Paar mit drei oder vier Zügen ein.';

  @override
  String get introHowOll =>
      'Zuerst das gelbe Kreuz mit F R U R\' U\' F\'.\nDann die Ecken ausrichten, zum Beispiel mit dem Sune.\nErkenne den Fall am sichtbaren Gelb.';

  @override
  String get introHowPll =>
      'Die Oberseite ist bereits ganz gelb.\nDie T-Perm tauscht Ecken, die U-Perm verschiebt drei Kanten.\nLies die Seitenfarben, um den Algorithmus zu wählen.';

  @override
  String get introHowTwoFirst =>
      'Ein 2×2 hat nur Ecken, wie ein 3×3 ohne Kanten.\nBring jede weiße Ecke über ihren Platz.\nWiederhole R U R\' U\', bis sie einrastet.';

  @override
  String get introHowTwoOll =>
      'Lass die weiße Ebene unten.\nDer Sune (R U R\' U R U2 R\') verdreht die oberen Ecken.\nWiederhole aus dem richtigen Winkel, bis oben alles gelb ist.';

  @override
  String get introHowTwoPbl =>
      'Suche eine Seite, auf der zwei Ecken schon passen.\nBenachbarter Tausch: ein Algorithmus im T-Perm-Stil.\nDiagonaler Tausch: ein etwas längerer Algorithmus.';

  @override
  String get introHowBigIntro =>
      'Kein Mittelstück ist fest: Vier Mittelteile bilden die Farbe jeder Seite.\nBreite Züge wie Rw drehen zwei Ebenen auf einmal.\nInnere Züge wie 2R drehen nur eine innere Scheibe.';

  @override
  String get introHowBigCenters =>
      'Baue zuerst zwei gegenüberliegende Mitten.\nInnere Scheiben tauschen Mittelteile, ohne fertige Mitten zu zerstören.\nVervollständige die letzten vier Mitten genauso.';

  @override
  String get introHowBigEdges =>
      'Suche zwei Kantenteile mit denselben Farben.\nBring sie mit einer inneren Scheibe nebeneinander.\nLeg das Paar beiseite und stell die Mitten wieder her.';

  @override
  String get introHowBigParity =>
      'Löse den 4×4 wie einen 3×3, bis es hakt.\nEine gekippte Kante: der lange OLL-Paritätsalgorithmus.\nZwei vertauschte Kanten: 2R2 U2 2R2 Uw2 2R2 Uw2.';

  @override
  String get dirFaceR => 'Rechte Seite';

  @override
  String get dirFaceL => 'Linke Seite';

  @override
  String get dirFaceU => 'Obere Reihe';

  @override
  String get dirFaceD => 'Untere Reihe';

  @override
  String get dirFaceF => 'Vorderseite';

  @override
  String get dirFaceB => 'Rückseite';

  @override
  String get dirMiddle => 'Mittlere Scheibe';

  @override
  String get dirWholeCube => 'Ganzer Würfel';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, Ebene $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth Ebenen tief';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, Ebenen $near–$far';
  }

  @override
  String get dirUp => 'Nach oben';

  @override
  String get dirDown => 'Nach unten';

  @override
  String get dirLeft => 'Nach links';

  @override
  String get dirRight => 'Nach rechts';

  @override
  String get dirClockwise => 'Im Uhrzeigersinn';

  @override
  String get dirCounter => 'Gegen den Uhrzeigersinn';

  @override
  String get dirBackClockwise => 'Im Uhrzeigersinn, von hinten gesehen';

  @override
  String get dirBackCounter => 'Gegen den Uhrzeigersinn, von hinten gesehen';

  @override
  String get dirHalf => 'Doppeldrehung (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Details ausblenden';

  @override
  String get solveExpand => 'Details einblenden';

  @override
  String get dailyScrambleSteps => 'Schritt für Schritt verdrehen';

  @override
  String get dailyScrambleGuide => '3D-Verdrehanleitung';

  @override
  String get dailyShowMoves => 'Züge als Text anzeigen';

  @override
  String get dailyHideMoves => 'Züge als Text ausblenden';

  @override
  String get dailyScrambleGuideTitle => 'Verdrehanleitung';

  @override
  String get phaseDailyScramble => 'Verdrehe den heutigen Würfel';

  @override
  String get explainDailyScramble =>
      'Starte mit einem gelösten Würfel, Weiß oben und Grün vorne, und mach jede Drehung an deinem echten Würfel nach.';

  @override
  String get stageCenters => 'Mittelblöcke bauen';

  @override
  String get stageEdges => 'Äußere & innere Kanten paaren';

  @override
  String get stageParity => 'Parität auflösen';

  @override
  String get stageCrown1 => 'Erste Krone (weiß)';

  @override
  String get stageCrown2 => 'Zweite Krone';

  @override
  String get stageCrown3 => 'Dritte Krone (gelb)';

  @override
  String get stageOrient => 'Teile ausrichten';

  @override
  String get stageFinish => 'Würfel fertigstellen';

  @override
  String get stageAsThree => 'Wie einen 3×3 lösen';

  @override
  String get stageTwoByTwo => 'Den 2×2 lösen';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Stufe $number von $total: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'Krone $crown • Stufe $number von $total: $title';
  }

  @override
  String get solveAllStagesDone => 'Alle Stufen geschafft. Super!';

  @override
  String get trackFiveByFive => '5×5 Professor’s Cube';

  @override
  String get trackSixBySix => '6×6-Würfel';

  @override
  String get lessonFiveIntro => 'Lerne den 5×5 kennen';

  @override
  String get lessonFiveIntroDesc =>
      'Feste Mitten, Mittelbalken, Mittelkanten und Flügel.';

  @override
  String get introGoalFiveIntro =>
      'Lerne den 5×5 kennen: feste Mitten, Mittelbalken, Mittelkanten und Flügel.';

  @override
  String get introHowFiveIntro =>
      'Das mittlere Teil jeder Seite bewegt sich nie.\nJede Kante ist ein Mittelteil mit zwei Flügeln.\nInnere Scheiben bewegen Teile, ohne die Außenseite zu berühren.';

  @override
  String get lessonFiveCenters => '5×5-Mitten';

  @override
  String get lessonFiveCentersDesc => 'Baue jede Mitte aus Dreierbalken.';

  @override
  String get introGoalFiveCenters =>
      'Baue auf jeder Seite einen einfarbigen 3×3-Mittelblock.';

  @override
  String get introHowFiveCenters =>
      'Beginne beim Mittelteil: Es bestimmt die Farbe.\nBaue Dreierbalken und schiebe sie mit einer inneren Scheibe hinein.\nLöse die letzten zwei Mitten zusammen.';

  @override
  String get lessonFiveEdges => '5×5-Kanten';

  @override
  String get lessonFiveEdgesDesc =>
      'Verbinde zwei Flügel mit ihrer Mittelkante.';

  @override
  String get introGoalFiveEdges =>
      'Verbinde jede Mittelkante mit ihren zwei Flügeln, damit alle 12 Kanten wie ein Stück aussehen.';

  @override
  String get introHowFiveEdges =>
      'Bring zwei Flügel vorne zu ihrer Mittelkante.\nDreh die innere Ebene, tausch eine ungelöste Kante ein, dreh zurück.\nPaare die letzten Kanten, ohne fertige zu zerstören.';

  @override
  String get lessonFiveSolve => 'Den 5×5 wie einen 3×3 lösen';

  @override
  String get lessonFiveSolveDesc => 'Mit den drei Kronen abschließen.';

  @override
  String get introGoalFiveSolve =>
      'Löse den reduzierten 5×5 wie einen 3×3, Krone für Krone.';

  @override
  String get introHowFiveSolve =>
      'Ab jetzt nur noch äußere Drehungen.\nErste Krone, zweite Krone, dann die gelbe Krone.\nDie festen Mitten zeigen jede Seitenfarbe.';

  @override
  String get lessonFiveParity => '5×5-Kantenparität';

  @override
  String get lessonFiveParityDesc =>
      'Repariere die Kante mit vertauschten Flügeln.';

  @override
  String get introGoalFiveParity =>
      'Repariere die eine Kante mit vertauschten Flügeln und löse dann fertig.';

  @override
  String get introHowFiveParity =>
      'Sie zeigt sich als Kante, die sich nicht paaren lässt.\nSpiele einmal die lange Korrektur mit inneren Scheiben.\nAlles andere kehrt an seinen Platz zurück.';

  @override
  String get lessonSixIntro => 'Lerne den 6×6 kennen';

  @override
  String get lessonSixIntroDesc =>
      'Keine festen Mitten und vier Teile pro Kante.';

  @override
  String get introGoalSixIntro =>
      'Lerne den 6×6 kennen: sechzehn Mittelteile pro Seite und vier Teile pro Kante.';

  @override
  String get introHowSixIntro =>
      'Keine Mitte ist fest: Du wählst die Farben beim Bauen.\nJede Kante hat äußere und innere Flügel.\nBreite Drehungen bewegen bis zu drei Ebenen.';

  @override
  String get lessonSixCenters => '6×6-Mitten';

  @override
  String get lessonSixCentersDesc => 'Baue 4×4-Mitten aus Viererbalken.';

  @override
  String get introGoalSixCenters =>
      'Baue auf jeder Seite einen einfarbigen 4×4-Mittelblock.';

  @override
  String get introHowSixCenters =>
      'Baue zuerst zwei gegenüberliegende Mitten.\nBaue Viererbalken und füge sie zusammen.\nBewege einzelne Teile mit dem Trick Scheibe, oben, zurück.';

  @override
  String get lessonSixEdges => '6×6-Kanten';

  @override
  String get lessonSixEdgesDesc => 'Sammle die vier Teile jeder Kante.';

  @override
  String get introGoalSixEdges =>
      'Sammle die vier Teile jeder Kante, damit der 6×6 zwölf saubere Kanten hat.';

  @override
  String get introHowSixEdges =>
      'Bring äußere und innere Flügel vorne in eine Linie.\nDie tiefe breite Ebene bringt eine Kante hinein und hinaus.\nFertige Kanten werden nie zerstört.';

  @override
  String get lessonSixSolve => 'Den 6×6 wie einen 3×3 lösen';

  @override
  String get lessonSixSolveDesc => 'Mit den drei Kronen abschließen.';

  @override
  String get introGoalSixSolve =>
      'Löse den reduzierten 6×6 wie einen 3×3, Krone für Krone.';

  @override
  String get introHowSixSolve =>
      'Ab jetzt nur noch äußere Drehungen.\nDie gebauten Mitten zeigen jede Seitenfarbe.\nErste Krone, zweite Krone, dann die gelbe Krone.';

  @override
  String get lessonSixParity => '6×6-Parität';

  @override
  String get lessonSixParityDesc =>
      'Eine gekippte Kante oder zwei vertauschte Kanten.';

  @override
  String get introGoalSixParity =>
      'Behebe die zwei 6×6-Fälle, die ein 3×3 nie hat: eine gekippte Kante oder zwei vertauschte Kanten.';

  @override
  String get introHowSixParity =>
      'Löse wie einen 3×3, bis es hakt.\nEine gekippte Kante: die lange Paritätskorrektur.\nZwei vertauschte Kanten: die kurze Korrektur mit Doppeldrehungen.';

  @override
  String get stepFivePieces => 'Die Teile des 5×5';

  @override
  String get stepFivePiecesBody =>
      'Das mittlere Teil jeder Seite bewegt sich nie und zeigt daher wie beim 3×3 die Seitenfarbe. Drumherum sitzen acht weitere Mittelteile; jede Kante hat ein Mittelteil und zwei Flügel, und die Ecken funktionieren wie beim 3×3.';

  @override
  String get stepFiveSlices => 'Drei Arten von Drehungen';

  @override
  String get stepFiveSlicesBody =>
      'Eine äußere Drehung dreht eine Seite. Eine breite Drehung dreht die Seite samt der Ebene dahinter. Eine innere Scheibendrehung dreht nur eine Ebene im Inneren: So tauschen Teile ihren Platz, ohne die Außenseite zu berühren.';

  @override
  String get stepFiveCenterBar => 'Mittelbalken';

  @override
  String get stepFiveCenterBarBody =>
      'Baue eine Reihe aus drei gleichen Mittelteilen und schiebe sie mit einer inneren Scheibendrehung neben die passende Mitte. Drei Balken ergeben eine fertige Mitte.';

  @override
  String get stepFiveCenterSwap => 'Tauschen ohne Zerstören';

  @override
  String get stepFiveCenterSwapBody =>
      'Um ein einzelnes Mittelteil zu bewegen: innere Scheibe drehen, oben drehen, Scheibe zurück, oben zurück. Fertige Mitten kehren jedes Mal zurück.';

  @override
  String get stepFiveEdgePair => 'Flügel an die Mittelkante';

  @override
  String get stepFiveEdgePairBody =>
      'Bring zwei Flügel vorne neben ihre Mittelkante, dreh die innere Ebene nach unten, hol eine ungelöste Kante von oben und dreh die innere Ebene zurück.';

  @override
  String get stepFiveEdgeLast => 'Die letzten Kanten';

  @override
  String get stepFiveEdgeLastBody =>
      'Wenn nur noch wenige Kanten übrig sind, paaren eine breite Drehung, ein kurzer Trigger und die breite Drehung zurück sie, ohne fertige Kanten zu zerstören.';

  @override
  String get stepFiveAsThree => 'Jetzt ist es ein 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Mit fertigen Mitten und Kanten verhält sich der 5×5 wie ein großer 3×3. Nutze nur äußere Drehungen und folge den drei Kronen: weißes Kreuz und Ecken, mittlere Ebene, dann die gelbe Ebene.';

  @override
  String get stepFiveEdgeParity => 'Flügel der letzten Kante tauschen';

  @override
  String get stepFiveEdgeParityBody =>
      'Manchmal sind die zwei Flügel der letzten Kante vertauscht. Ein langer Algorithmus mit inneren Scheiben tauscht sie zurück, alles andere kehrt an seinen Platz zurück. Dann wie einen 3×3 fertig lösen.';

  @override
  String get stepSixPieces => 'Die Teile des 6×6';

  @override
  String get stepSixPiecesBody =>
      'Wie der 4×4 hat der 6×6 keine feste Mitte: Sechzehn Mittelteile bilden jede Seitenfarbe. Jede Kante hat vier Teile: zwei äußere und zwei innere Flügel.';

  @override
  String get stepSixSlices => 'Tiefere Ebenen drehen';

  @override
  String get stepSixSlicesBody =>
      'Breite Drehungen bewegen zwei oder drei Ebenen von einer Seite. Innere Scheiben auf der zweiten oder dritten Ebene sind die Werkzeuge für Mitten und Kanten.';

  @override
  String get stepSixCenterBar => 'Viererbalken';

  @override
  String get stepSixCenterBarBody =>
      'Baue Reihen aus vier gleichen Mittelteilen und schiebe sie mit inneren Scheibendrehungen nebeneinander, bis die Seite einfarbig ist.';

  @override
  String get stepSixCenterSwap => 'Ein Teil nach dem anderen';

  @override
  String get stepSixCenterSwapBody =>
      'Dritte Ebene drehen, oben drehen, zurück, zurück: Ein Mittelteil bewegt sich und fertige Mitten kehren zurück.';

  @override
  String get stepSixEdgePair => 'Vier Teile, eine Kante';

  @override
  String get stepSixEdgePairBody =>
      'Sammle vorne die vier Teile einer Kante mit der tiefen breiten Ebene, hol eine ungelöste Kante herein und dreh die breite Ebene zurück.';

  @override
  String get stepSixEdgeLast => 'Die letzten Kanten';

  @override
  String get stepSixEdgeLastBody =>
      'Paare die letzten Kanten mit einem kurzen Trigger zwischen einer tiefen breiten Drehung und ihrer Umkehr, damit fertige Kanten gepaart bleiben.';

  @override
  String get stepSixAsThree => 'Jetzt ist es ein 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Mit 4×4-Mitten und gepaarten Kanten löst du den 6×6 wie einen 3×3 mit äußeren Drehungen und den drei Kronen.';

  @override
  String get stepSixOllParity => 'Eine gekippte Kante';

  @override
  String get stepSixOllParityBody =>
      'Wirkt beim Lösen der letzten Ebene eine einzelne Kante gekippt, ist das Parität. Halte sie vorne in der oberen Ebene und spiele die lange Korrektur: Die ersten zwei Kronen kommen unversehrt zurück.';

  @override
  String get stepSixPllParity => 'Zwei vertauschte Kanten';

  @override
  String get stepSixPllParityBody =>
      'Wirken ganz am Ende zwei Kanten vertauscht, halte sie vorne und hinten in der oberen Ebene und spiele die kurze Korrektur mit inneren Doppeldrehungen.';

  @override
  String get stageTwoFirstLayer => 'Untere Ebene bauen';

  @override
  String get stageTwoTopColor => 'Oberseite einfarbig machen';

  @override
  String get stageTwoFinish => 'Ecken fertigstellen';

  @override
  String get explainTwoFirstLayer =>
      'Vervollständige die untere Ebene: Ihre vier Ecken passen zueinander und zu den Seitenfarben.';

  @override
  String get explainTwoTopColor =>
      'Dreh, bis alle vier Aufkleber oben dieselbe Farbe haben, ohne die untere Ebene zu zerstören.';

  @override
  String get explainTwoFinish =>
      'Bring die letzten Ecken an ihren Platz, um den Würfel fertigzustellen.';

  @override
  String get tabSolve => 'Lösen';

  @override
  String get tabScan => 'Scannen';

  @override
  String get tabAcademy => 'Akademie';

  @override
  String get tabTrain => 'Training';

  @override
  String get openCubeSolver => '3D-Würfel & Löser öffnen';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Training';

  @override
  String get trainSubtitle => 'Verbessere jeden Tag deine Fähigkeiten.';

  @override
  String get settings => 'Einstellungen';

  @override
  String get settingsSoundHaptics => 'Ton & Vibration';

  @override
  String get settingsSoundHapticsDesc =>
      'Klicks und Vibrationen beim Drehen des Würfels.';

  @override
  String get settingsAnimationSpeed => 'Standard-Animationstempo';

  @override
  String get settingsAnimationSpeedDesc =>
      'Wie schnell sich der Würfel dreht, wenn Züge abgespielt werden.';

  @override
  String get settingsResetProgress => 'Fortschritt zurücksetzen';

  @override
  String get settingsResetProgressDesc =>
      'Löscht abgeschlossene Akademie-Lektionen und deine Tagesserie.';

  @override
  String get resetProgressTitle => 'Gesamten Fortschritt zurücksetzen?';

  @override
  String get resetProgressBody =>
      'Deine abgeschlossenen Lektionen und deine Tagesserie werden gelöscht. Das lässt sich nicht rückgängig machen.';

  @override
  String get resetProgressDone => 'Fortschritt zurückgesetzt.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get settingsPrivacyAds => 'Datenschutz & Werbung';

  @override
  String get settingsPrivacyAdsDesc =>
      'Werbe- und Einwilligungsoptionen erscheinen hier, sobald es Werbung gibt.';

  @override
  String get settingsComingSoon => 'Demnächst';

  @override
  String get playbackPrevious => 'Zurück';

  @override
  String get playbackNext => 'Weiter';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'In $count Zügen gelöst!',
      one: 'In 1 Zug gelöst!',
    );
    return '$_temp0';
  }

  @override
  String fastSolveOptimal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Optimal: $count Züge',
      one: 'Optimal: 1 Zug',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Gestalte die nächste Version mit';

  @override
  String get feedbackBody =>
      'Du möchtest eine Funktion vorschlagen oder die nächste Version von CubeMentor mitgestalten? Schreib uns an:';

  @override
  String get feedbackEmailCopied =>
      'Keine E-Mail-App gefunden – die Adresse wurde in die Zwischenablage kopiert.';
}
