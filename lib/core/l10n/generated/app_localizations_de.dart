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
  String get solveModeGuided => 'Geführt (3 Ebenen)';

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
  String get phaseLblCorners => 'Ecken der ersten Ebene';

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
  String get crownFirst => 'Erste Ebene';

  @override
  String get crownSecond => 'Zweite Ebene';

  @override
  String get crownThird => 'Dritte Ebene';

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
      'Setze die 4 weißen Ecken in ihre passenden Plätze und mach so die weiße Seite und die ganze erste Ebene fertig.';

  @override
  String get subStepGoal21 =>
      'Setze die 4 Kanten der mittleren Ebene ein, ohne die erste Ebene zu zerstören.';

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
  String get trackBeginner => '3×3 für Einsteiger: Ebene für Ebene';

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
  String get timerInspectionToggle => '15 s Inspektion';

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
      'Halte Gelb oben und Grün zu dir. Sammle zuerst die vier weißen Kanten um die gelbe Mitte, Weiß nach oben, wie Blütenblätter: das Gänseblümchen. Dann kommt jedes Blatt nach unten zur weißen Mitte, seine Seitenfarbe passend zur Mitte daneben.';

  @override
  String get stepCrossTop => 'Kante oben';

  @override
  String get stepCrossTopBody =>
      'Eine weiße Kante oben mit Weiß nach oben ist ein Blütenblatt des Gänseblümchens. Dreh die obere Ebene, bis ihre Seitenfarbe genau über der gleichfarbigen Mitte steht, dann dreh diese Seite zweimal (180°), um sie auf die weiße Mitte zu bringen.';

  @override
  String get stepCrossMiddle => 'Kante in der Mitte';

  @override
  String get stepCrossMiddleBody =>
      'Eine Kante, die in der mittleren Ebene steckt, kommt zuerst hoch: ihre Seite hoch, die obere Ebene aus dem Weg, die Seite zurück, damit gesetzte Steine bleiben. Jetzt ist sie ein Blütenblatt oben: ausrichten und die Seite zweimal drehen.';

  @override
  String get stepCornersInsert => 'Über ihrem Platz';

  @override
  String get stepCornersInsertBody =>
      'Dreh die obere Ebene, bis die weiße Ecke genau über ihrem Platz steht, zwischen den zwei Mitten ihrer Seitenfarben. Hier reichen eine obere Drehung und R U\' R\': U bringt die Ecke über den Platz, R U\' R\' setzt sie mit Weiß nach unten ein.';

  @override
  String get stepCornersRepeat => 'Trigger wiederholen';

  @override
  String get stepCornersRepeatBody =>
      'Halte den Platz vorne rechts und wiederhole R U R\' U\', bis Weiß unten ist: einmal, wenn Weiß nach rechts zeigt, dreimal nach oben, fünfmal zu dir. Oben sieht es dabei wild aus; das ordnet sich von selbst.';

  @override
  String get stepMiddleRight => 'Kante nach rechts';

  @override
  String get stepMiddleRightBody =>
      'Such eine obere Kante ohne Gelb. Dreh die obere Ebene, bis ihre Vorderfarbe zur Mitte vor dir passt. Passt ihre obere Farbe zur rechten Mitte, schick sie nach rechts: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Kante nach links';

  @override
  String get stepMiddleLeftBody =>
      'Passt ihre obere Farbe stattdessen zur linken Mitte, nimm die Spiegelung: U\' L\' U L U F U\' F\'. Die weiße Ebene kommt jedes Mal ganz zurück.';

  @override
  String get stepYellowCross => 'Ein Algorithmus';

  @override
  String get stepYellowCrossBody =>
      'Schau nur auf die gelben Kanten oben. Halte ein L hinten links und eine Linie von links nach rechts, dann F R U R\' U\' F\'. Die Linie braucht ihn einmal, das L zweimal, der Punkt bis zu dreimal.';

  @override
  String get stepYellowEdges => 'Kanten ausrichten';

  @override
  String get stepYellowEdgesBody =>
      'Dreh die obere Ebene, bis zwei Kanten zu ihren Mitten passen. Ist eine hinten und eine rechts, tauscht R U R\' U R U2 R\' U die vordere und die linke Kante.';

  @override
  String get stepPlaceCorners => 'Platzieren';

  @override
  String get stepPlaceCornersBody =>
      'Eine Ecke sitzt richtig, wenn ihre Farben zu den drei Mitten um sie passen, auch verdreht. Halte so eine Ecke vorne rechts: U R U\' L\' U R\' U\' L tauscht die anderen drei im Kreis. Wiederhole, bis alle vier sitzen.';

  @override
  String get stepTwistCorners => 'Drehen';

  @override
  String get stepTwistCornersBody =>
      'Mit einer ungelösten Ecke vorne rechts wiederholst du R\' D\' R D paarweise, bis Gelb oben ist; dann dreh nur die obere Ebene für die nächste. Unten sieht bis zur letzten Ecke kaputt aus: weitermachen.';

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
      'Ein 2×2 besteht nur aus acht Ecken: keine Kanten, keine Mitten. Bau unten die weiße Ebene mit passenden Nachbarfarben und löse dann auf einem Weg: Sune für eine gelbe Oberseite, danach T-Perm oder Y-Perm.';

  @override
  String get stepTwoCorner => 'Ecken einsetzen';

  @override
  String get stepTwoCornerBody =>
      'Wie die weißen Ecken beim 3×3: Bring eine Ecke über ihren leeren Platz vorne rechts und setz sie ein, hier mit U R U\' R\' oder durch Wiederholen von R U R\' U\', bis Weiß unten ist. Prüf die Seitenfarben am Nachbarn.';

  @override
  String get lessonTwoOll => 'Oberseite orientieren';

  @override
  String get lessonTwoOllDesc => 'Ortega-OLL mit Sune.';

  @override
  String get stepTwoSune => 'Wieder Sune';

  @override
  String get stepTwoSuneBody =>
      'Zähle die gelben Sticker, die nach oben zeigen. Halte die einzige Ecke mit Gelb oben vorne links und mach den Sune (R U R\' U R U2 R\'). Neu zählen, neu halten; höchstens drei Sunes. Dazwischen nur oben drehen.';

  @override
  String get lessonTwoPbl => 'Beide Ebenen permutieren';

  @override
  String get lessonTwoPblDesc => 'Tausche Ecken, um fertig zu werden.';

  @override
  String get stepTwoAdjacent => 'Benachbarter Tausch';

  @override
  String get stepTwoAdjacentBody =>
      'Scheinwerfer sind zwei gleiche obere Sticker auf einer Seite. Dreh oben, bis die Scheinwerfer links sind, dann liegen die zwei zu tauschenden Ecken rechts, und mach die T-Perm.';

  @override
  String get stepTwoDiagonal => 'Diagonaler Tausch';

  @override
  String get stepTwoDiagonalBody =>
      'Nirgends Scheinwerfer? Dann müssen zwei diagonale Ecken tauschen: Mach die Y-Perm von beliebiger Seite und dreh oben, um alles auszurichten.';

  @override
  String get lessonBigIntro => 'Steine großer Würfel';

  @override
  String get lessonBigIntroDesc => 'Mitten, Flügel und Ebenen.';

  @override
  String get stepBigPieces => 'Keine festen Mitten';

  @override
  String get stepBigPiecesBody =>
      'Beim 4×4 hat jede Seite vier bewegliche Mittelsteine, und jede Kante besteht aus zwei Flügeln. Keine Mitte ist fest, also prüf die Farbreihenfolge an einer Ecke: Weiß gegenüber Gelb, Blau gegenüber Grün, Rot gegenüber Orange.';

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
      'Dieser Kommutator bewegt genau drei Mittelsteine und lässt alles andere in Ruhe, also bleiben fertige Mitten fertig. Nimm ihn, wenn ein einzelner Stein nicht in einen Balken will.';

  @override
  String get lessonBigEdges => 'Kanten paaren';

  @override
  String get lessonBigEdgesDesc => 'Füge Flügel zu ganzen Kanten zusammen.';

  @override
  String get stepBigEdgePair => 'Paaren & wiederherstellen';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' richtet zwei passende Flügel aus, R U R\' F R\' F\' R tauscht eine ungepaarte Kante ein, und Uw stellt die Mitten wieder her. Schließ jede Schicht, die du öffnest.';

  @override
  String get lessonBigParity => 'Parität';

  @override
  String get lessonBigParityDesc => 'OLL- und PLL-Parität bei geraden Würfeln.';

  @override
  String get stepBigOllParity => 'OLL-Parität';

  @override
  String get stepBigOllParityBody =>
      'Eine einzelne gekippte Kante gibt es beim 3×3 nicht: Das ist OLL-Parität, kein Fehler. Halte sie vorne in der oberen Ebene und spiel den langen Algorithmus. Er tauscht auch die linke und rechte obere Kante und zwei Ecken; das lösen die letzten 3×3-Schritte.';

  @override
  String get stepBigPllParity => 'PLL-Parität';

  @override
  String get stepBigPllParityBody =>
      'Ganz am Ende zwei vertauschte Kanten, und kein 3×3-Algorithmus passt? Das ist PLL-Parität. Halte sie vorne und hinten in der oberen Ebene: 2R2 U2 2R2 Uw2 2R2 2U2 tauscht sie.';

  @override
  String get introGoalHeading => 'Was ist das Ziel?';

  @override
  String get introHowHeading => 'Wie geht das?';

  @override
  String get introHoldHeading => 'So hältst du ihn';

  @override
  String get introWhyHeading => 'Warum es klappt';

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
      'Bau unten ein weißes Kreuz, bei dem jede weiße Kante auch zur Farbe der Mitte daneben passt.';

  @override
  String get introGoalCorners =>
      'Setze die vier weißen Ecken ein, damit die ganze erste Ebene fertig ist: weiße Seite mit passenden Seitenfarben.';

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
      'Bring die letzten Ecken mit einer T-Perm oder Y-Perm nach Hause und richte die obere Ebene aus, um den 2×2 zu lösen.';

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
      'Löse die zwei 4×4-Fälle, die ein 3×3 nie hat: eine gekippte Kante (OLL-Parität) oder zwei vertauschte Kanten (PLL-Parität).';

  @override
  String get introHowBasics =>
      'Mittelstücke bewegen sich nie, sie zeigen die Farbe jeder Seite.\nJeder Buchstabe dreht eine Seite eine Vierteldrehung im Uhrzeigersinn.\nEin Apostroph (\') dreht zurück, eine 2 dreht zweimal.';

  @override
  String get introHoldBasics =>
      'Wie du willst: Die Mitten bewegen sich nicht, also zeigen dir die Farben immer, welche Seite welche ist.';

  @override
  String get introWhyBasics =>
      'Jeder Algorithmus ist nur eine Reihe dieser Buchstaben, also ist das Lesen die erste Fähigkeit.';

  @override
  String get introHowCross =>
      'Bring jede weiße Kante nach oben, Weiß nach oben, rund um die gelbe Mitte: das ist das Gänseblümchen.\nDreh die obere Ebene, bis die Seitenfarbe eines Blütenblatts über der passenden Mitte steht.\nDreh diese Seite zweimal, um es nach unten zu bringen; wiederhole das für alle vier.';

  @override
  String get introHoldCross =>
      'Gelbe Mitte oben, weiße Mitte unten, den ganzen Schritt lang. Dreh die obere Ebene, nicht den Würfel, um ein Blütenblatt auszurichten.';

  @override
  String get introWhyCross =>
      'Zeigt Weiß nach oben, setzen zwei Drehungen der Vorderseite die Kante auf die weiße Mitte, Weiß unten und die Seitenfarbe schon passend.';

  @override
  String get introHowCorners =>
      'Dreh die obere Ebene, bis eine weiße Ecke über ihrem leeren Platz vorne rechts steht.\nWiederhole R U R\' U\': einmal, wenn Weiß nach rechts zeigt, dreimal nach oben, fünfmal zu dir.\nMach dasselbe mit den anderen drei Ecken.';

  @override
  String get introHoldCorners =>
      'Weiß unten, Gelb oben. Die Ecke vorne rechts, direkt über ihrem Platz.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' hebt den Platz an und setzt ihn zurück: Jede Runde dreht die Ecke ein Stück, bis Weiß unten ist, und das Kreuz bleibt immer ganz.';

  @override
  String get introHowMiddle =>
      'Such eine obere Kante ohne Gelb und richte ihre Vorderfarbe an der Mitte darunter aus.\nIhre obere Farbe sagt, wohin sie gehört: rechts oder links.\nSetz sie mit dem 8-Zug-Algorithmus ein; die weiße Ebene kommt jedes Mal zurück.';

  @override
  String get introHoldMiddle =>
      'Weiß unten, Gelb oben. Die Kante vorne, ihre Vorderfarbe passend zur Mitte darunter.';

  @override
  String get introWhyMiddle =>
      'Der Algorithmus hebt den Platz aus dem Weg, schiebt die Kante hinein und bringt die weiße Ebene zurück. Eine Kante mit Gelb gehört nach oben, nie in die Mitte.';

  @override
  String get introHowYellowCross =>
      'Schau nur auf die gelben Kanten oben: Punkt, L oder Linie.\nHalte das L hinten links und die Linie von links nach rechts, dann F R U R\' U\' F\'.\nDie Linie braucht ihn einmal, das L zweimal, der Punkt bis zu dreimal.';

  @override
  String get introHoldYellowCross =>
      'Weiß unten, Gelb oben. Das L hinten links, die Linie von links nach rechts; der Punkt beliebig.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' kippt jedes Mal zwei obere Kanten, ohne die ersten zwei Ebenen anzurühren.';

  @override
  String get introHowYellowEdges =>
      'Dreh die obere Ebene, bis zwei Kanten zu ihren Mitten passen.\nHalte sie hinten und rechts, dann R U R\' U R U2 R\' U.\nLiegen die passenden Kanten gegenüber, mach es zuerst einmal von beliebiger Seite.';

  @override
  String get introHoldYellowEdges =>
      'Gelb oben. Eine passende Kante hinten, die andere rechts.';

  @override
  String get introWhyYellowEdges =>
      'Dieser Algorithmus bewegt nur obere Steine, also kommen die ersten zwei Ebenen immer zurück.';

  @override
  String get introHowYellowCorners =>
      'Eine Ecke sitzt richtig, wenn ihre Farben zu den drei Mitten passen, auch wenn sie verdreht ist.\nHalte eine richtig sitzende Ecke vorne rechts.\nU R U\' L\' U R\' U\' L tauscht die anderen drei im Kreis; wiederhole, bis alle passen.';

  @override
  String get introHoldYellowCorners =>
      'Gelb oben. Eine schon richtig sitzende Ecke vorne rechts; gibt es keine, irgendeine.';

  @override
  String get introWhyYellowCorners =>
      'Er tauscht drei Ecken im Kreis und lässt die vorne rechts stehen, also bringt jede Wiederholung mehr Ecken nach Hause.';

  @override
  String get introHowTwistCorners =>
      'Halte eine ungelöste Ecke vorne rechts.\nWiederhole R\' D\' R D paarweise, bis ihr Gelb nach oben zeigt.\nDreh für die nächste nur die obere Ebene; unten kommt mit der letzten Ecke zurück.';

  @override
  String get introHoldTwistCorners =>
      'Gelb oben, die zu drehende Ecke vorne rechts. Zwischen den Ecken nur die obere Ebene drehen, nie den ganzen Würfel.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D dreht die Ecke und bringt unten durcheinander, aber unten kommt zurück, sobald alle Ecken gedreht sind. Wer mittendrin aufhört, lässt es kaputt.';

  @override
  String get introHowCfopIntro =>
      'Kreuz: vier Kanten, geplant während der Inspektion.\nF2L: Jede Ecke geht zusammen mit ihrer Kante hinein.\nOLL macht die Oberseite gelb, dann bringt PLL die Teile an ihren Platz.';

  @override
  String get introHoldCfopIntro =>
      'Speedcuber bauen das Kreuz unten, damit sie beim Drehen schon die nächsten Steine sehen.';

  @override
  String get introWhyCfopIntro =>
      'Eine Ecke mit ihrer Kante zusammen zu lösen spart viele Züge, und Fälle zu erkennen ersetzt Ausprobieren.';

  @override
  String get introHowF2l =>
      'Suche eine Ecke und ihre passende Kante in der oberen Ebene.\nFüge sie über ihrem Slot zu einem Paar zusammen.\nSetz das Paar mit drei oder vier Zügen ein.';

  @override
  String get introHoldF2l =>
      'Kreuz unten. Der Platz des Paares vorne rechts, gespiegelt vorne links.';

  @override
  String get introWhyF2l =>
      'Ein gepaartes Ecke-Kante-Paar geht zusammen hinein, also wachsen zwei Ebenen gleichzeitig statt Stein für Stein.';

  @override
  String get introHowOll =>
      'Zuerst das gelbe Kreuz mit F R U R\' U\' F\'.\nDann die Ecken ausrichten, zum Beispiel mit dem Sune.\nErkenne den Fall am sichtbaren Gelb.';

  @override
  String get introHoldOll =>
      'Gelb oben. Beim Sune kommt die einzige Ecke mit Gelb oben nach vorne links.';

  @override
  String get introWhyOll =>
      'Die letzte Ebene in erst orientieren, dann permutieren zu teilen, hält die Zahl der Algorithmen klein.';

  @override
  String get introHowPll =>
      'Die Oberseite ist bereits ganz gelb.\nDie T-Perm tauscht Ecken, die U-Perm verschiebt drei Kanten.\nLies die Seitenfarben, um den Algorithmus zu wählen.';

  @override
  String get introHoldPll =>
      'Gelb oben. T-Perm: Scheinwerfer links. U-Perm: die fertige Seite hinten.';

  @override
  String get introWhyPll =>
      'Ist oben alles gelb, stimmen nur noch die Plätze der Steine nicht, und ein paar Tausche lösen den Würfel.';

  @override
  String get introHowTwoFirst =>
      'Wähle eine weiße Ecke als Anker, Weiß nach unten.\nBring jede weitere Ecke über ihren Platz vorne rechts.\nWiederhole R U R\' U\', bis sie mit passenden Seitenfarben einrastet.';

  @override
  String get introHoldTwoFirst =>
      'Weiß unten. Der leere Platz vorne rechts, seine Ecke direkt darüber in der oberen Ebene.';

  @override
  String get introWhyTwoFirst =>
      'Ein 2×2 hat keine Mitten: Die erste Ecke legt die Farben ihrer Nachbarn fest, also zählen die Seitenfarben, nicht nur Weiß.';

  @override
  String get introHowTwoOll =>
      'Zähle die Ecken, deren Gelb nach oben zeigt.\nBei einer: Halte sie vorne links und mach den Sune: R U R\' U R U2 R\'.\nZähle neu und wiederhole; höchstens drei Sunes.';

  @override
  String get introHoldTwoOll =>
      'Weiß unten, Gelb oben. Vor jedem Sune die Ecke mit Gelb oben vorne links.';

  @override
  String get introWhyTwoOll =>
      'Der Sune dreht die oberen Ecken, ohne die weiße Ebene zu zerstören; neu zählen sagt dir, wie du ihn als Nächstes hältst.';

  @override
  String get introHowTwoPbl =>
      'Such Scheinwerfer: zwei gleiche obere Sticker auf einer Seite.\nScheinwerfer auf einer Seite: nach links drehen und T-Perm.\nKeine Scheinwerfer: Y-Perm von beliebiger Seite, dann oben ausrichten.';

  @override
  String get introHoldTwoPbl =>
      'Weiß unten, Gelb oben. T-Perm: Scheinwerfer links. Y-Perm: beliebige Seite zu dir.';

  @override
  String get introWhyTwoPbl =>
      'Ist oben gelb, stimmen nur noch die Plätze der Ecken: Die T-Perm tauscht zwei Nachbarn, die Y-Perm zwei diagonale.';

  @override
  String get introHowBigIntro =>
      'Kein Mittelstück ist fest: Vier Mittelteile bilden die Farbe jeder Seite.\nBreite Züge wie Rw drehen zwei Ebenen auf einmal.\nInnere Züge wie 2R drehen nur eine innere Scheibe.';

  @override
  String get introHoldBigIntro =>
      'Anfangs wie du willst: Beim 4×4 ist keine Mitte fest, du entscheidest, wo jede Farbe hinkommt.';

  @override
  String get introWhyBigIntro =>
      'Die Reduktion fasst Mitten und Kantensteine zusammen, damit der große Würfel wie ein 3×3 lösbar wird.';

  @override
  String get introHowBigCenters =>
      'Prüfe zuerst die Farbreihenfolge an einer Ecke.\nBau zwei gegenüberliegende Mitten, dann die anderen vier.\nInnere Schichten verschieben Mittelsteine; mach jede geöffnete Schicht wieder zu.';

  @override
  String get introHoldBigCenters =>
      'Die Seite, die du baust, vorne; fertige Mitten links und rechts aus dem Weg.';

  @override
  String get introWhyBigCenters =>
      'Eine Schicht verschiebt Mitten, und das Zurückdrehen stellt die fertigen wieder her, also ändert sich nur der gewünschte Stein.';

  @override
  String get introHowBigEdges =>
      'Such die zwei Flügel mit denselben zwei Farben.\nRichte sie vorne aus und verbinde sie mit Uw\'.\nTausch eine ungepaarte Kante ein, dann bringt Uw die Mitten zurück.';

  @override
  String get introHoldBigEdges =>
      'Die Kante, die du paarst, in den vorderen Schichten; fertige Kanten oben und unten geparkt.';

  @override
  String get introWhyBigEdges =>
      'Uw\' schiebt die Mitten weg, damit zwei Flügel sich treffen; Uw bringt sie zurück, und deine Arbeit bleibt.';

  @override
  String get introHowBigParity =>
      'Löse den 4×4 wie einen 3×3, bis es hakt.\nEine gekippte Kante: der lange OLL-Paritätsalgorithmus.\nZwei vertauschte Kanten: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'Letzte Ebene oben. OLL-Parität: die gekippte Kante vorne. PLL-Parität: die vertauschten Kanten vorne und hinten.';

  @override
  String get introWhyBigParity =>
      'Flügel können in Lagen geraten, die ein 3×3 nie erreicht; diese Algorithmen drehen innere Schichten, um genau das rückgängig zu machen.';

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
  String get stageCrown1 => 'Erste Ebene (weiß)';

  @override
  String get stageCrown2 => 'Zweite Ebene';

  @override
  String get stageCrown3 => 'Dritte Ebene (gelb)';

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
  String get introHoldFiveIntro =>
      'Wie du willst: Beim 5×5 bewegt sich die Mitte jeder Seite nie, sie zeigt also ihre Farbe.';

  @override
  String get introWhyFiveIntro =>
      'Die festen Mitten legen das Farbschema fest, also kann man die Mitten nicht falsch anordnen.';

  @override
  String get lessonFiveCenters => '5×5-Mitten';

  @override
  String get lessonFiveCentersDesc => 'Baue jede Mitte aus Dreierbalken.';

  @override
  String get introGoalFiveCenters =>
      'Baue auf jeder Seite einen einfarbigen 3×3-Mittelblock.';

  @override
  String get introHowFiveCenters =>
      'Fang beim festen Mittelstein an: Er gibt die Farbe vor.\nBau Dreierbalken und schieb sie mit einer inneren Schicht hinein.\nDer Zug, der den Balken bringt, stellt auch die fertige Mitte wieder her.';

  @override
  String get introHoldFiveCenters =>
      'Die Mitte, die du baust, vorne oder oben; fertige Mitten unten, links oder rechts aus dem Weg.';

  @override
  String get introWhyFiveCenters =>
      'Schicht rein, oben drehen, Schicht zurück: Die Schicht, die den Balken bringt, stellt auch die fertigen Mitten wieder her.';

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
      'Setz vorne jeden Flügel an seine Mittelkante.\nInnere Schicht drehen, ungelöste Kante eintauschen, zurückdrehen.\nFür die letzten Kanten: Schicht, Kippen, Schicht.';

  @override
  String get introHoldFiveEdges =>
      'Die Kante, die du baust, vorne; fertige Kanten in der oberen und unteren Ebene verstaut.';

  @override
  String get introWhyFiveEdges =>
      'Die innere Schicht öffnen und schließen verbindet Flügel, während Mitten und verstaute Kanten zurückkommen.';

  @override
  String get lessonFiveSolve => 'Den 5×5 wie einen 3×3 lösen';

  @override
  String get lessonFiveSolveDesc =>
      'Ebene für Ebene fertig lösen, wie einen 3×3.';

  @override
  String get introGoalFiveSolve =>
      'Löse den reduzierten 5×5 wie einen 3×3, Ebene für Ebene, nur mit äußeren Drehungen.';

  @override
  String get introHowFiveSolve =>
      'Ab jetzt nur äußere Drehungen, sonst zerfallen gepaarte Kanten.\nWeißes Kreuz und Ecken, mittlere Ebene, dann die gelbe Ebene.\nDie festen Mittelsteine zeigen jede Seitenfarbe.';

  @override
  String get introHoldFiveSolve =>
      'Die Farbe der ersten Ebene unten, genau wie beim 3×3; die Ecke zum Einsetzen vorne rechts.';

  @override
  String get introWhyFiveSolve =>
      'Innere Drehungen würden Mitten und Kanten wieder trennen; äußere behandeln jeden Block wie einen 3×3-Stein.';

  @override
  String get lessonFiveParity => '5×5-Kantenparität';

  @override
  String get lessonFiveParityDesc =>
      'Repariere die Kante mit vertauschten Flügeln.';

  @override
  String get introGoalFiveParity =>
      'Korrigiere die eine Kante, deren zwei äußere Flügel vertauscht sind: die einzige Parität des 5×5.';

  @override
  String get introHowFiveParity =>
      'Sie zeigt sich als letzte Kante, die gekippt aussieht.\nSpiel einmal die lange Korrektur mit inneren Schichten.\nEin 5×5 hat keine PLL-Parität.';

  @override
  String get introHoldFiveParity =>
      'Letzte Ebene oben, die Kante mit vertauschten Flügeln vorne in der oberen Ebene.';

  @override
  String get introWhyFiveParity =>
      'Beim 5×5 können nur die zwei äußeren Flügel einer Kante tauschen, also reicht ein Algorithmus.';

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
  String get introHoldSixIntro =>
      'Anfangs wie du willst: Wie der 4×4 hat der 6×6 keine feste Mitte.';

  @override
  String get introWhySixIntro =>
      'Wenn du einen 4×4 und einen 5×5 löst, ist der 6×6 dieselbe Reduktion mit größeren Blöcken.';

  @override
  String get lessonSixCenters => '6×6-Mitten';

  @override
  String get lessonSixCentersDesc => 'Baue 4×4-Mitten aus Viererbalken.';

  @override
  String get introGoalSixCenters =>
      'Baue auf jeder Seite einen einfarbigen 4×4-Mittelblock.';

  @override
  String get introHowSixCenters =>
      'Prüfe zuerst die Farbreihenfolge an einer Ecke: Keine Mitte ist fest.\nBau Viererbalken und schieb sie zusammen.\nBei den letzten zwei Mitten einzelne Steine bewegen: Schicht, oben, zurück.';

  @override
  String get introHoldSixCenters =>
      'Die Seite, die du baust, vorne; fertige Mitten links, rechts oder unten.';

  @override
  String get introWhySixCenters =>
      'Balken verbinden sich über innere Schichten, und jede wird zurückgedreht, also bleiben fertige Mitten ganz.';

  @override
  String get lessonSixEdges => '6×6-Kanten';

  @override
  String get lessonSixEdgesDesc => 'Sammle die vier Teile jeder Kante.';

  @override
  String get introGoalSixEdges =>
      'Sammle die vier Teile jeder Kante, damit der 6×6 zwölf saubere Kanten hat.';

  @override
  String get introHowSixEdges =>
      'Richte vorne die äußeren und inneren Flügel einer Kante aus.\nDie tiefe breite Schicht bringt eine Kante hinein und hinaus.\nZerstöre nie eine fertige Kante, um einen Stein freizubekommen.';

  @override
  String get introHoldSixEdges =>
      'Die Kante, die du baust, vorne; fertige Kanten oben und unten geparkt.';

  @override
  String get introWhySixEdges =>
      'Die tiefe breite Drehung schiebt die Mitten weg, damit Flügel sich treffen, und bringt sie dann zurück.';

  @override
  String get lessonSixSolve => 'Den 6×6 wie einen 3×3 lösen';

  @override
  String get lessonSixSolveDesc =>
      'Ebene für Ebene fertig lösen, wie einen 3×3.';

  @override
  String get introGoalSixSolve =>
      'Löse den reduzierten 6×6 wie einen 3×3, Ebene für Ebene, nur mit äußeren Drehungen.';

  @override
  String get introHowSixSolve =>
      'Ab jetzt nur äußere Drehungen: Eine Schicht würde Mitte oder Kante trennen.\nDeine gebauten Mitten zeigen jede Seitenfarbe.\nWeißes Kreuz und Ecken, mittlere Ebene, dann die gelbe Ebene.';

  @override
  String get introHoldSixSolve =>
      'Die Farbe der ersten Ebene unten, genau wie beim 3×3; die Ecke zum Einsetzen vorne rechts.';

  @override
  String get introWhySixSolve =>
      'Äußere Drehungen bewegen jede 4×4-Mitte und jede Kante als einen Stein, genau wie beim 3×3.';

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
      'Löse wie einen 3×3, bis es hakt.\nEine gekippte Kante: die lange Korrektur mit 3Rw.\nZwei vertauschte Kanten: die kurze Korrektur mit inneren Doppeldrehungen.';

  @override
  String get introHoldSixParity =>
      'Letzte Ebene oben. Die gekippte Kante vorne; bei zwei vertauschten Kanten vorne und hinten.';

  @override
  String get introWhySixParity =>
      'Wie beim 4×4 kann ein 6×6 mit einer gekippten oder zwei vertauschten Kanten enden; Algorithmen mit inneren Schichten beheben das und lassen den Rest stehen.';

  @override
  String get stepFivePieces => 'Die Teile des 5×5';

  @override
  String get stepFivePiecesBody =>
      'Der mittlere Stein jeder Seite bewegt sich nie, also kann das Farbschema nicht falsch werden. Um ihn liegen acht Mittelsteine: Eck- und Kantenmitten tauschen nie die Art. Jede Kante ist ein Mittelstück mit zwei Flügeln.';

  @override
  String get stepFiveSlices => 'Drei Arten von Drehungen';

  @override
  String get stepFiveSlicesBody =>
      'Eine äußere Drehung dreht eine Seite. Eine breite Drehung dreht die Seite samt der Ebene dahinter. Eine innere Scheibendrehung dreht nur eine Ebene im Inneren: So tauschen Teile ihren Platz, ohne die Außenseite zu berühren.';

  @override
  String get stepFiveCenterBar => 'Mittelbalken';

  @override
  String get stepFiveCenterBarBody =>
      'Bau eine Reihe aus drei passenden Mittelsteinen, schieb sie mit einer inneren Schicht hinein, dreh oben und schieb zurück: Der Zug, der den Balken bringt, stellt auch die fertige Mitte wieder her. Drei Balken sind eine Mitte.';

  @override
  String get stepFiveCenterSwap => 'Tauschen ohne Zerstören';

  @override
  String get stepFiveCenterSwapBody =>
      'Um ein einzelnes Mittelteil zu bewegen: innere Scheibe drehen, oben drehen, Scheibe zurück, oben zurück. Fertige Mitten kehren jedes Mal zurück.';

  @override
  String get stepFiveEdgePair => 'Flügel an die Mittelkante';

  @override
  String get stepFiveEdgePairBody =>
      'Richte vorne einen Flügel neben seiner passenden Mittelkante aus, dreh die innere Schicht runter, tausch mit einem kurzen Trigger eine ungelöste Kante ein und dreh die innere Schicht zurück.';

  @override
  String get stepFiveEdgeLast => 'Die letzten Kanten';

  @override
  String get stepFiveEdgeLastBody =>
      'Keine freie Kante mehr zum Eintauschen? Dann Schicht, Kippen, Schicht: eine breite Drehung, ein kurzer Trigger und die breite Drehung zurück paaren die letzten Kanten, ohne fertige zu zerstören.';

  @override
  String get stepFiveAsThree => 'Jetzt ist es ein 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Mit fertigen Mitten und Kanten verhält sich der 5×5 wie ein großer 3×3. Nur äußere Drehungen, Ebene für Ebene: weißes Kreuz und Ecken, die mittlere Ebene, dann die gelbe Ebene. Ein 5×5 hat keine PLL-Parität.';

  @override
  String get stepFiveEdgeParity => 'Flügel der letzten Kante tauschen';

  @override
  String get stepFiveEdgeParityBody =>
      'Manchmal sind bei der letzten Kante die zwei äußeren Flügel vertauscht, sie sieht gekippt aus: die einzige Parität des 5×5. Halte sie vorne in der oberen Ebene und spiel einmal den Algorithmus mit inneren Schichten; alles andere kehrt zurück.';

  @override
  String get stepSixPieces => 'Die Teile des 6×6';

  @override
  String get stepSixPiecesBody =>
      'Wie der 4×4 hat der 6×6 keine feste Mitte: Sechzehn Mittelsteine bilden jede Seitenfarbe, also prüf zuerst die Farbreihenfolge an einer Ecke. Jede Kante hat vier Flügel: zwei äußere und zwei innere.';

  @override
  String get stepSixSlices => 'Tiefere Ebenen drehen';

  @override
  String get stepSixSlicesBody =>
      'Breite Drehungen bewegen zwei oder drei Ebenen von einer Seite. Innere Scheiben auf der zweiten oder dritten Ebene sind die Werkzeuge für Mitten und Kanten.';

  @override
  String get stepSixCenterBar => 'Viererbalken';

  @override
  String get stepSixCenterBarBody =>
      'Bau Reihen aus vier passenden Mittelsteinen und schieb sie mit inneren Schichten nebeneinander, jede Schicht wieder zurück, bis die Seite ein einfarbiger 4×4-Block ist.';

  @override
  String get stepSixCenterSwap => 'Ein Teil nach dem anderen';

  @override
  String get stepSixCenterSwapBody =>
      'Dritte Schicht drehen, oben drehen, zurück, oben zurück: Ein Mittelstein wandert, und fertige Mitten kommen zurück. Nimm das für die letzten zwei Mitten, wenn kein Balken passt.';

  @override
  String get stepSixEdgePair => 'Vier Teile, eine Kante';

  @override
  String get stepSixEdgePairBody =>
      'Sammle die vier Flügel einer Kante vorne mit der tiefen breiten Schicht, tausch mit einem kurzen Trigger eine ungelöste Kante ein und dreh die breite Schicht zurück.';

  @override
  String get stepSixEdgeLast => 'Die letzten Kanten';

  @override
  String get stepSixEdgeLastBody =>
      'Paare die letzten Kanten mit einem kurzen Trigger zwischen einer tiefen breiten Drehung und ihrer Umkehr, damit fertige Kanten gepaart bleiben. Zerstöre nie eine fertige Kante, um einen Stein freizubekommen.';

  @override
  String get stepSixAsThree => 'Jetzt ist es ein 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Mit 4×4-Mitten und gepaarten Kanten löst du den 6×6 wie einen 3×3, Ebene für Ebene, nur mit äußeren Drehungen. Eine gekippte oder zwei vertauschte Kanten am Ende sind Parität, kein Fehler.';

  @override
  String get stepSixOllParity => 'Eine gekippte Kante';

  @override
  String get stepSixOllParityBody =>
      'Eine einzelne Kante, die in der letzten Ebene gekippt aussieht, ist Parität. Halte sie vorne in der oberen Ebene und spiel die lange Korrektur: Sie kippt alle vier Flügel, tauscht auch die linke und rechte obere Kante und lässt die ersten zwei Ebenen unberührt.';

  @override
  String get stepSixPllParity => 'Zwei vertauschte Kanten';

  @override
  String get stepSixPllParityBody =>
      'Sehen ganz am Ende zwei Kanten vertauscht aus, halte sie vorne und hinten in der oberen Ebene und spiel die kurze Korrektur mit inneren Doppeldrehungen: Alle vier Flügel beider Kanten tauschen.';

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
      'Prüfe oder ändere deine Einwilligung zu Werbung.';

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
  String get feedbackTitle => 'Gestalte die nächste Version mit';

  @override
  String get feedbackBody =>
      'Du möchtest eine Funktion vorschlagen oder die nächste Version von CubeMentor mitgestalten? Schreib uns an:';

  @override
  String get feedbackEmailCopied =>
      'Keine E-Mail-App gefunden – die Adresse wurde in die Zwischenablage kopiert.';

  @override
  String get adWatchToUnlock => 'Werbung ansehen';

  @override
  String get adLoading => 'Kurzes Video wird geladen …';

  @override
  String get adRewardNotEarned =>
      'Sieh dir das ganze Video an, um freizuschalten.';

  @override
  String get adUnavailableFreePass =>
      'Gerade ist kein Video verfügbar – diesmal kostenlos freigeschaltet.';

  @override
  String get settingsPrivacyAdsError =>
      'Die Datenschutzoptionen konnten nicht geöffnet werden. Versuch es später noch einmal.';

  @override
  String get nicknamePromptTitle => 'Wie sollen wir dich nennen?';

  @override
  String get nicknamePromptBody =>
      'Wir feuern dich bei jedem Lösen mit deinem Namen an.';

  @override
  String get nicknameHint => 'Dein Name oder Spitzname';

  @override
  String get nicknameSave => 'Speichern';

  @override
  String get settingsNickname => 'Dein Name';

  @override
  String get settingsNicknameNotSet =>
      'Nicht festgelegt – tippe, um einen hinzuzufügen';

  @override
  String celebrateNamed(String name) {
    return 'Stark, $name!';
  }

  @override
  String get celebrateAnon => 'Stark!';

  @override
  String get celebrateCubeSolved => 'Würfel gelöst!';

  @override
  String get celebrateDailyDone => 'Tages-Challenge geschafft!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit Züge',
      one: '$count / 1 Zug',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Jede Verdrehung lässt sich in höchstens $limit Zügen lösen',
      one: 'Jede Verdrehung lässt sich in höchstens 1 Zug lösen',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Video ansehen';

  @override
  String get patternsNotNow => 'Jetzt nicht';

  @override
  String get settingsColorScheme => 'Farbschema des Würfels';

  @override
  String get colorSchemeWestern => 'Westlich';

  @override
  String get colorSchemeJapanese => 'Japanisch';

  @override
  String get colorSchemeWesternDesc =>
      'Weiß gegenüber Gelb, Blau gegenüber Grün';

  @override
  String get colorSchemeJapaneseDesc =>
      'Weiß gegenüber Blau, Gelb gegenüber Grün';

  @override
  String dailyYourTime(String time) {
    return 'Deine Zeit: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Du hast $seconds Sekunden, um den Würfel anzusehen. Tippe, um den Countdown zu starten.';
  }

  @override
  String get timerInspectTapReady => 'Tippe, sobald du bereit bist zu lösen';

  @override
  String timerInspectPlus2(int seconds) {
    return 'Die Inspektion lief über $seconds s, die Uhr startete von selbst: +2 s Strafe';
  }

  @override
  String timerAvgOf(int count) {
    return 'Schnitt aus $count';
  }

  @override
  String get timerAvgNote =>
      'Schnitte lassen die beste und schlechteste Zeit weg';

  @override
  String get timerPbSub => 'Beste Einzelzeit';

  @override
  String get timerPlus2Caption => '+2 s Strafe';

  @override
  String get timerDnfCaption => 'Nicht beendet (DNF)';

  @override
  String get timerDeleteCaption => 'Diesen Solve löschen';

  @override
  String get patternBullsEye => 'Zielscheibe';

  @override
  String get patternFramedCenter => 'Gerahmte Mitte';

  @override
  String get patternBlockCheckerboard => 'Block-Schachbrett';

  @override
  String get patternCubeInCubeInCube => 'Würfel im Würfel im Würfel';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Sechs T';

  @override
  String get patternTwinPeaks => 'Zwillingsgipfel';

  @override
  String get patternSpiral => 'Spirale';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Mittelpunkte';

  @override
  String get patternStripes => 'Streifen';

  @override
  String get patternAnaconda => 'Anakonda';

  @override
  String get patternZigzag => 'Zickzack';

  @override
  String get patternFourSpots => 'Vier Punkte';

  @override
  String get patternGreenMamba => 'Grüne Mamba';

  @override
  String get patternPlusMinus => 'Plus minus';

  @override
  String guideStepCounter(int current, int total) {
    return 'Schritt $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Zug $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Zug $current / $total';
  }

  @override
  String get dailyStep1Title => 'Schritt 1: Würfel verdrehen';

  @override
  String get dailyStep2Title => 'Schritt 2: Würfel lösen';

  @override
  String dailyPersonalBest(String time) {
    return 'Persönliche Bestzeit: $time';
  }

  @override
  String get dailyRecentDays => 'Letzte Tage';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-Tage-Serie! Du bist on fire!',
      one: '1-Tage-Serie! Du bist on fire!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Würfel verdreht! Jetzt lös ihn';

  @override
  String get dailyCongratsTitle => 'Glückwunsch!';

  @override
  String dailyCongratsBody(String time) {
    return 'Du hast die heutige Herausforderung in $time gelöst.';
  }

  @override
  String get dailyCongratsDone => 'Zurück zur Herausforderung';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Muster',
      one: '1 Muster',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Noch $hours Stunden',
      one: 'Noch 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Noch $minutes Minuten',
      one: 'Noch 1 Minute',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'Gesperrt';

  @override
  String get unlockedLabel => 'Freigeschaltet';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Sieh dir 1 kurzes Video an, um dieses Muster samt Schritt-für-Schritt-Anleitung $hours Stunden lang freizuschalten.',
      one: 'Sieh dir 1 kurzes Video an, um dieses Muster samt Schritt-für-Schritt-Anleitung 1 Stunde lang freizuschalten.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Sieh dir 1 kurzes Video an, um diese Lektion in den nächsten $hours Stunden so oft zu öffnen, wie du willst.',
      one: 'Sieh dir 1 kurzes Video an, um diese Lektion in der nächsten Stunde so oft zu öffnen, wie du willst.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'Große Würfel lösen';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Deine kostenlose 4×4–6×6-Lösung ist verbraucht. Sieh dir 1 kurzes Video an, um große Würfel in den nächsten $hours Stunden zu lösen.',
      one: 'Deine kostenlose 4×4–6×6-Lösung ist verbraucht. Sieh dir 1 kurzes Video an, um große Würfel in der nächsten Stunde zu lösen.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Doppelte Drehung · 180°';

  @override
  String get homeAcademy => 'Akademie';

  @override
  String get homePatterns => 'Coole Muster';

  @override
  String get homePractice => 'Timer & Tages-Challenge';

  @override
  String get scanChoiceSubtitle => 'Wie möchtest du starten?';

  @override
  String get scanChoiceCamera => 'Mit der Kamera scannen';

  @override
  String get scanChoiceCameraDesc =>
      'Zeig der Kamera jede Seite und erhalte die Lösung.';

  @override
  String get scanChoice3d => '3D-Würfel öffnen';

  @override
  String get scanChoice3dDesc =>
      'Dreh einen virtuellen Würfel, misch ihn und löse ihn Schritt für Schritt.';

  @override
  String get academyAllSizes => 'Alle Größen';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total Lektionen abgeschlossen';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total abgeschlossen';
  }

  @override
  String get lessonStageConcept => 'Idee';

  @override
  String get lessonStageExamples => 'Beispiele';

  @override
  String get lessonStagePractice => 'Praxis';

  @override
  String get lessonStageNext => 'Weiter / frei';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Stufe $index von $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Beispiel $index von $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Durchgang $index von $total';
  }

  @override
  String get lessonBonusCase => 'Bonusfall';

  @override
  String get lessonPracticeIntro =>
      'Ein echter Scramble: Nur die früheren Schritte sind gelöst. Löse diesen ganzen Schritt, Hinweis für Hinweis.';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Direkt weiter mit $lesson.';
  }

  @override
  String get lessonFreePractice => 'Freies Üben';

  @override
  String get lessonFreePracticeDesc =>
      'Löse einen verdrehten 3D-Würfel selbst, vom Anfang bis zu diesem Schritt.';

  @override
  String freePracticeBanner(String topic) {
    return 'Übe frei: Löse den Würfel vom Anfang bis einschließlich $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Drehe die Seite mit der Mitte $face so, wie der Pfeil zeigt. Die Mitte bleibt stehen; nur die Teile um sie herum wandern.';
  }

  @override
  String cueTrigger(String front) {
    return 'Rechte-Hand-Trigger, $front zu dir: rechte Seite hoch, oben nach links, rechte Seite runter, oben zurück nach rechts.';
  }

  @override
  String get cueTriggerBack =>
      'Der sechste Trigger in Folge bringt den Würfel genau in den Ausgangszustand zurück. Sechs ist die magische Zahl!';

  @override
  String cueSliceInner(String face) {
    return 'Drehe nur die innere Scheibe neben der Seite $face. Die Seite selbst bleibt stehen, also teilen sich die Mitten.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Eine breite Drehung: die Seite $face und die Scheibe daneben drehen sich zusammen, wie eine dicke Schicht.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Drehe den ganzen Würfel so, dass die Mitte $top oben ist und die Mitte $front zu dir zeigt.';
  }

  @override
  String get cueTurnTop =>
      'Drehe nur die obere Ebene, wie der Pfeil zeigt, um den nächsten Algorithmus vorzubereiten.';

  @override
  String get cueAlignTop =>
      'Letzter Zug: Drehe die obere Ebene, bis die Farben passen. Fertig!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'Die Kante $piece ist in der oberen Ebene. Drehe oben, bis sie genau über der Mitte $center steht, dann drehe diese Seite zweimal, um sie nach unten zu bringen.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'Die Kante $piece steckt in der mittleren Ebene. Hebe sie nach oben, richte sie über der Mitte $center aus und bring sie nach unten.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'Die Kante $piece sitzt richtig, ist aber gekippt: Ihr Weiß zeigt zur Seite. Nimm sie heraus und bring sie mit Weiß nach oben nach oben, dann setz sie neben der Mitte $center ein.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'Im CFOP-Stil darf auch die Unterseite drehen. Setze die Kante $piece ein und drehe unten, bis sie zur Mitte $center passt.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Drehe oben, bis die Ecke $piece genau über ihrem Platz steht, zwischen den Seiten $a und $b. Wiederhole den Rechte-Hand-Trigger, bis sie richtig gedreht hineinfällt.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'Die Ecke $piece sitzt in ihrem Platz, ist aber verdreht. Ein Trigger holt sie heraus (eine gelbe Ecke rückt nach); wiederhole über demselben Platz, bis sie mit Weiß unten zurückkommt. Dreh nicht den Würfel hinterher.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Drehe oben, bis die Kante $piece an der Mitte $a ausgerichtet ist, dann schicke sie nach rechts unten, in den Slot zwischen $a und $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Drehe oben, bis die Kante $piece an der Mitte $a ausgerichtet ist, dann schicke sie nach links unten, in den Slot zwischen $a und $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'Die Kante $piece sitzt in ihrem Platz, ist aber gekippt. Setz dort eine gelbe Kante ein, um sie nach oben zu drücken, und setz sie dann neu zwischen $a und $b ein.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Eine gelbe Linie: Drehe oben, bis sie von links nach rechts verläuft, halte $front zu dir und führe den Algorithmus für das gelbe Kreuz aus.';
  }

  @override
  String cueYellowL(String front) {
    return 'Ein gelbes L: Drehe oben, bis das L nach hinten links zeigt, halte $front zu dir und führe den Algorithmus aus. Es wird zur Linie.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Nur die Mitte ist gelb: ein Punkt. Wende den Algorithmus einmal mit $front zu dir an, dann entsteht ein L. Ein Punkt kann drei Runden brauchen, also weitermachen.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Drehe oben, bis die Kante $piece zur Mitte $center passt.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Zwei passende Kanten sind hinten und rechts. Mit $front zu dir führe den Tausch aus: Die vordere und die linke Kante wechseln den Platz.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Die passenden Kanten liegen sich gegenüber. Führe den Tausch einmal mit $front zu dir aus; danach passen zwei benachbarte.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'Die Ecke $piece ist schon an ihrem Platz. Halte sie vorne rechts, $front zu dir, und tausche die anderen drei Ecken im Kreis.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Noch keine gelbe Ecke ist an ihrem Platz. Tausche einmal im Kreis mit $front zu dir; danach sitzt eine Ecke richtig.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Dreh die Ecke $piece vorne rechts: Wiederhole den unteren Trigger paarweise, bis ihr Gelb oben ist. Die unteren Ebenen sehen vorerst durcheinander aus; mit der letzten Ecke kommen sie zurück!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Die Ecke $piece braucht diesmal vier Trigger. Mach weiter: Gelb kommt immer nach zwei oder vier nach oben.';
  }

  @override
  String get cueTwistNext =>
      'Drehe nur die obere Ebene, um die nächste verdrehte Ecke nach vorne rechts zu bringen. Jetzt nicht den ganzen Würfel drehen!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Verbinde oben die Ecke $piece mit der Kante $edge, dann setze das Paar in den Slot zwischen $a und $b ein.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'Die Ecke $piece steckt mit der falschen Kante in ihrem Slot. Hole sie zuerst nach oben, dann bilde das Paar und setze es ein.';
  }

  @override
  String cueOllSune(String front) {
    return 'Mit $front zu dir führe Sune aus, um die gelben Ecken nach oben zu drehen.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Ein Sune hat diesmal nicht gereicht. Drehe oben und führe Sune noch einmal aus, $front zu dir.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Zwei Ecken müssen tauschen. Halte das passende Paar („Scheinwerfer“) links, $front zu dir, und führe die T-Perm aus.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Die Ecken sind fertig. Halte die Kante $piece hinten und tausche die anderen drei Kanten mit der U-Perm im Kreis.';
  }

  @override
  String get cuePllNoEdge =>
      'Noch keine obere Kante passt zu ihrer Mitte. Führe die U-Perm einmal von einer beliebigen Seite aus; danach passt eine.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Zwei benachbarte obere Ecken müssen tauschen. Halte das passende Paar links, $front zu dir, und führe den Tausch aus.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Die zwei zu tauschenden Ecken liegen diagonal. Führe den Diagonaltausch mit $front zu dir aus.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Bring das verirrte Mittelteil $color mit dem Mitten-3-Zyklus nach Hause: Scheibe, oben, Scheibe, dann alles zurück.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Ein ganzer Streifen Mittelteile $color liegt auf der falschen Seite. Hebe ihn mit der Scheibe an, drehe oben und bring ihn nach Hause.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Verbinde die zwei Kantenteile $piece: richte sie aus, drehe die Scheibe, tausche mit den Rechte-Hand-Zügen eine ungepaarte Kante ein und drehe die Scheibe zurück.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Die letzten Kanten: Verbinde die Kante $piece mit dem Algorithmus für die letzten zwei Kanten, der alle fertigen Kanten intakt lässt.';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL-Parität: Eine obere Kante ist gekippt, was beim 3×3 nie passiert. Halte sie vorne, $front zu dir, und wende die Paritätskorrektur vor jedem normalen OLL an.';
  }

  @override
  String get cueParityPll =>
      'PLL-Parität: Zwei obere Kanten sind vertauscht, was beim 3×3 nie passiert. Halte sie vorne und hinten, wende den Paritätstausch an und richte oben aus.';

  @override
  String cueParityFive(String front) {
    return 'Kantenparität: Die zwei äußeren Flügel einer Kante sind vertauscht, die einzige Parität des 5×5. Halte diese Kante vorne, $front zu dir, und wende die Korrektur einmal an.';
  }

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingStart => 'Los geht’s';

  @override
  String get onboardingWhatTitle => 'Dein Würfel-Begleiter';

  @override
  String get onboardingWhatBody =>
      'CubeMentor hilft dir, jeden Würfel von 2×2 bis 6×6 zu lösen, zu lernen und zu üben – komplett offline.';

  @override
  String get onboardingScanTitle => 'Scannen und lösen in Sekunden';

  @override
  String get onboardingScanBody =>
      'Zeig der Kamera jede Seite (oder tippe die Farben ein) und folge der 3D-Lösung Zug für Zug.';

  @override
  String get onboardingLearnTitle => 'Lernen und spielen';

  @override
  String get onboardingLearnBody =>
      'Lerne in der Akademie die Ebene-für-Ebene-Methode und drehe, mische und löse dann frei im 3D-Playground.';

  @override
  String get scanChoiceManualDesc =>
      'Tippe die Farben jeder Seite ein, Aufkleber für Aufkleber.';

  @override
  String get scanTryAgain => 'Erneut versuchen';

  @override
  String get scanEditManually => 'Farben von Hand korrigieren';

  @override
  String get scanLightingHint =>
      'Richte die Seite mittig im Raster aus. Nutze helles, gleichmäßiges Licht und vermeide Spiegelungen.';

  @override
  String get crownExplain =>
      'Eine Ebene ist eine waagerechte Schicht des Würfels: Die erste Ebene ist die weiße unten, die zweite die mittlere und die dritte die gelbe oben.';

  @override
  String get lessonObjectiveHeading => 'Lernziel';

  @override
  String get dirRowTop => 'Obere Reihe der Vorderseite';

  @override
  String get dirRowBottom => 'Untere Reihe der Vorderseite';

  @override
  String get dirColumnRight => 'Rechte Spalte der Vorderseite';

  @override
  String get dirColumnLeft => 'Linke Spalte der Vorderseite';

  @override
  String get solveChoiceTitle => 'Wie möchtest du ihn lösen?';

  @override
  String get solveChoiceFastDesc => 'Die kürzeste Lösung, Zug für Zug.';

  @override
  String get solveChoiceGuidedDesc =>
      'Lerne die Ebene-für-Ebene-Methode Schritt für Schritt.';

  @override
  String get guidedSolvedTitle => 'Gelöst!';

  @override
  String get guidedSolvedBody =>
      'Du bist jedem Schritt gefolgt und hast den Würfel gelöst.';

  @override
  String get solveAgain => 'Nochmal lösen';

  @override
  String get backToHome => 'Zurück zum Start';

  @override
  String get dailyStatTime => 'Heutige Zeit';

  @override
  String get dailyStatBest => 'Bestzeit';

  @override
  String get dailyStatStreak => 'Aktuelle Serie';

  @override
  String get dailyStatBestStreak => 'Beste Serie';

  @override
  String get privacyPolicyTitle => 'Datenschutzerklärung';

  @override
  String get settingsPrivacyPolicyDesc =>
      'Was CubeMentor speichert und was die Werbung nutzt.';

  @override
  String get privacyIntro =>
      'CubeMentor funktioniert ohne Konto und ohne eigene Server. Diese Seite erklärt, was auf deinem Gerät bleibt und was unser Werbepartner nutzt.';

  @override
  String get privacyDataTitle => 'Deine Daten bleiben auf deinem Gerät';

  @override
  String get privacyDataBody =>
      'Deine Sprache, Einstellungen, dein Lektionsfortschritt, deine Lösungszeiten und deine tägliche Serie werden nur auf diesem Gerät gespeichert. Wir haben keine Server und erhalten sie daher nie. Beim Deinstallieren der App werden sie gelöscht.';

  @override
  String get privacyCameraTitle => 'Kamera';

  @override
  String get privacyCameraBody =>
      'Die Kamera wird nur verwendet, während du einen Würfel scannst. Die Bilder werden auf deinem Gerät ausgewertet, um die Aufkleberfarben zu erkennen; kein Foto oder Video wird gespeichert oder versendet.';

  @override
  String get privacyAdsTitle => 'Werbung';

  @override
  String get privacyAdsBody =>
      'Die App zeigt Werbung von Google AdMob. Google kann Gerätekennungen und Daten zur Interaktion mit Anzeigen nutzen, um Anzeigen auszuliefern und zu messen, wie in der Datenschutzerklärung von Google beschrieben. Wo es das Gesetz verlangt, wirst du zuerst um Einwilligung gebeten und kannst sie in den Einstellungen ändern.';

  @override
  String get privacyContactTitle => 'Kontakt';

  @override
  String privacyContactBody(String email) {
    return 'Fragen zum Datenschutz? Schreib uns an $email.';
  }
}
