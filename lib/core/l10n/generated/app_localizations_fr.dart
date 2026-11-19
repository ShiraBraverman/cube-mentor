// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Scannez, résolvez et maîtrisez tous les cubes, du 2×2 au 6×6.';

  @override
  String get chooseCubeSize => 'Choisissez votre cube';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Débutant';

  @override
  String get cubeLevel3 => 'Classique';

  @override
  String get cubeLevel4 => 'Avancé';

  @override
  String get cubeLevel5 => 'Expert';

  @override
  String get cubeLevel6 => 'Maître';

  @override
  String get cubeComingSoon => 'Nouveau cube bientôt disponible';

  @override
  String get carouselPrevious => 'Cube précédent';

  @override
  String get carouselNext => 'Cube suivant';

  @override
  String get chooseMode => 'Que voulez-vous faire ?';

  @override
  String get modePlayground => 'Bac à sable 3D';

  @override
  String get modePlaygroundDesc =>
      'Tournez les couches, mélangez et rejouez les mouvements en 3D.';

  @override
  String get modeScanSolve => 'Scanner et résoudre';

  @override
  String get modeScanSolveDesc =>
      'Scannez votre cube avec l\'appareil photo et obtenez une solution.';

  @override
  String get modeAcademy => 'Académie';

  @override
  String get modeAcademyDesc =>
      'Apprenez pas à pas avec des leçons interactives.';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get comingSoonMessage =>
      'Cette fonction arrive dans une prochaine mise à jour.';

  @override
  String get language => 'Langue';

  @override
  String get languageSearch => 'Rechercher une langue';

  @override
  String get languageNoResults =>
      'Aucune langue ne correspond à votre recherche.';

  @override
  String playgroundTitle(int size) {
    return 'Bac à sable $size×$size';
  }

  @override
  String get scramble => 'Mélanger';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get undo => 'Annuler';

  @override
  String get speed => 'Vitesse';

  @override
  String get xray => 'Rayons X';

  @override
  String get prime => 'Prime';

  @override
  String get wide => 'Large';

  @override
  String layer(int index) {
    return 'Couche $index';
  }

  @override
  String get cubeRotations => 'Rotations';

  @override
  String get play => 'Lecture';

  @override
  String get pause => 'Pause';

  @override
  String get playbackTitle => 'Lecture';

  @override
  String get playbackEmpty =>
      'Mélangez le cube pour créer une lecture de la résolution.';

  @override
  String playbackProgress(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mouvements',
      one: '1 mouvement',
      zero: 'Aucun mouvement',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Résolu';

  @override
  String get scrambled => 'Mélangé';

  @override
  String get orbitHint =>
      'Faites glisser une rangée pour la tourner · Faites glisser le fond pour pivoter la vue';

  @override
  String get notationPad => 'Clavier de notation';

  @override
  String get solve => 'Résoudre';

  @override
  String get solving => 'Résolution…';

  @override
  String get solveFast => 'Résolution rapide';

  @override
  String get solveLearn => 'Apprendre pas à pas';

  @override
  String get solveModeGuided => 'Guidé (3 couronnes)';

  @override
  String get solveModeFast => 'Rapide (optimal)';

  @override
  String solveUnavailable(int size) {
    return 'Le solveur $size×$size arrivera dans une prochaine mise à jour.';
  }

  @override
  String get solveAlreadySolved => 'Le cube est déjà résolu.';

  @override
  String solveFailed(String reason) {
    return 'Ce cube ne peut pas être résolu ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'Le moteur de résolution n\'est pas disponible sur cet appareil.';

  @override
  String get solveComplete => 'Résolu ! Bravo.';

  @override
  String solveSummary(int count) {
    return '$count mouvements';
  }

  @override
  String get nextMove => 'Mouvement suivant';

  @override
  String get previousMove => 'Mouvement précédent';

  @override
  String get halfTurnHalfway =>
      'Bien, vous êtes à mi-chemin ! Tournez-la encore une fois dans le même sens pour faire un demi-tour (180°).';

  @override
  String get wideTurnInner =>
      'Super ! Faites maintenant glisser la couche intérieure voisine pour terminer le tour large.';

  @override
  String get wideTurnOuter =>
      'Super ! Faites maintenant glisser la couche extérieure voisine pour terminer le tour large.';

  @override
  String get wideTurnMore =>
      'Super ! Continuez à faire glisser les couches lumineuses une par une pour terminer le tour large.';

  @override
  String get guideSwipeHint =>
      'Faites glisser la couche lumineuse dans le sens de la flèche, ou touchez Suivant.';

  @override
  String get guideRotateHint =>
      'Tournez le cube entier comme l\'indique la flèche : touchez Suivant.';

  @override
  String get guideWrongMove => 'Suivez la flèche en surbrillance';

  @override
  String get guideExit => 'Quitter le guide';

  @override
  String get replayStep => 'Rejouer l\'étape';

  @override
  String get colorWhite => 'blanc';

  @override
  String get colorYellow => 'jaune';

  @override
  String get colorGreen => 'vert';

  @override
  String get colorBlue => 'bleu';

  @override
  String get colorRed => 'rouge';

  @override
  String get colorOrange => 'orange';

  @override
  String get phaseOptimal2x2 => 'Solution optimale';

  @override
  String get phaseKociemba1 => 'Phase 1 · Orienter les pièces';

  @override
  String get phaseKociemba2 => 'Phase 2 · Terminer le cube';

  @override
  String get phaseLblCross => 'Croix blanche';

  @override
  String get phaseLblCorners => 'Coins de la première couronne';

  @override
  String get phaseLblMiddle => 'Arêtes de la couche du milieu';

  @override
  String get phaseLblYellowCross => 'Croix jaune';

  @override
  String get phaseLblYellowEdges => 'Aligner les arêtes de la croix jaune';

  @override
  String get phaseLblYellowCorners => 'Placer les coins jaunes';

  @override
  String get phaseLblYellowCornersOrient => 'Orienter les coins jaunes';

  @override
  String get crownFirst => 'Première couronne';

  @override
  String get crownSecond => 'Deuxième couronne';

  @override
  String get crownThird => 'Troisième couronne';

  @override
  String get crownFirstGoal => 'Face blanche et première couche';

  @override
  String get crownSecondGoal => 'Couche du milieu';

  @override
  String get crownThirdGoal => 'Face jaune et dernière couche';

  @override
  String crownProgress(int current, int total) {
    return 'Couronne $current sur $total';
  }

  @override
  String get subStepGoal11 =>
      'Formez une croix blanche dont chaque arête blanche correspond aussi au centre voisin.';

  @override
  String get subStepGoal12 =>
      'Insérez les 4 coins blancs à leur place pour terminer la face blanche et toute la première couronne.';

  @override
  String get subStepGoal21 =>
      'Insérez les 4 arêtes de la couche du milieu sans défaire la première couronne.';

  @override
  String get subStepGoal31 => 'Formez une croix jaune sur la dernière couche.';

  @override
  String get subStepGoal32 =>
      'Échangez les arêtes de la croix jaune jusqu\'à ce que chacune corresponde à son centre latéral.';

  @override
  String get subStepGoal33 =>
      'Amenez les 4 coins jaunes à leur place, même s’ils sont encore tournés.';

  @override
  String get subStepGoal34 =>
      'Tournez chaque coin jaune sur place jusqu\'à ce que tous les autocollants correspondent et que le cube soit résolu.';

  @override
  String get explainOptimal2x2 =>
      'La solution la plus courte possible, trouvée en explorant toutes les positions du 2×2.';

  @override
  String get explainKociemba1 =>
      'Orientez toutes les pièces et regroupez les arêtes de la couche du milieu dans cette couche.';

  @override
  String get explainKociemba2 =>
      'Terminez uniquement avec U, D et des demi-tours, qui conservent cette orientation.';

  @override
  String get explainLblOrient =>
      'Tournez le cube entier pour que le centre blanc soit en bas.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Descendez l\'arête $piece à côté du centre blanc, avec sa couleur latérale assortie.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'Le coin $piece est coincé au mauvais endroit. Remontez-le avec R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Tournez la couche du haut jusqu\'à ce que le coin $piece soit au-dessus de son emplacement.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Répétez R U R\' U\' jusqu\'à ce que le coin $piece se mette en place.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'L\'arête $piece est dans la couche du milieu mais mal placée. Sortez-la vers le haut.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Tournez la couche du haut pour que la couleur latérale de l\'arête $piece corresponde à son centre.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Insérez l\'arête $piece à droite : U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Insérez l\'arête $piece à gauche : U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Tournez la couche du haut pour placer la forme jaune avant l\'algorithme suivant.';

  @override
  String get explainLblYellowCrossAlg =>
      'Formez la croix jaune avec F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Tournez la couche du haut pour aligner les arêtes jaunes avec leurs centres.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Échangez des arêtes jaunes avec R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Faites tourner les coins jaunes vers leurs places avec U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Tournez la couche du haut pour amener le prochain coin jaune non résolu en avant à droite.';

  @override
  String get explainLblCornerTwist =>
      'Répétez R\' D\' R D jusqu\'à ce que le jaune soit vers le haut. Le bas se répare tout seul à la fin.';

  @override
  String get explainLblFinalAlign =>
      'Tournez la couche du haut pour terminer le cube.';

  @override
  String scanTitle(int size) {
    return 'Scanner $size×$size';
  }

  @override
  String get scanManualInput => 'Saisir les couleurs à la main';

  @override
  String get scanUseCamera => 'Scanner avec l\'appareil photo';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Face $current sur $total';
  }

  @override
  String get faceUp => 'Face du haut';

  @override
  String get faceRight => 'Face droite';

  @override
  String get faceFront => 'Face avant';

  @override
  String get faceDown => 'Face du bas';

  @override
  String get faceLeft => 'Face gauche';

  @override
  String get faceBack => 'Face arrière';

  @override
  String get scanHintFront =>
      'Tenez le cube avec n\'importe quelle face vers vous. C\'est votre face avant : gardez la même face en haut pendant le scan.';

  @override
  String get scanHintRight =>
      'Depuis l\'avant, tournez le cube entier une fois vers la gauche pour que la face droite vous regarde.';

  @override
  String get scanHintBack =>
      'Depuis l\'avant, tournez le cube entier deux fois vers la gauche.';

  @override
  String get scanHintLeft =>
      'Depuis l\'avant, tournez le cube entier une fois vers la droite.';

  @override
  String get scanHintUp =>
      'Depuis l\'avant, basculez le haut vers vous pour qu\'il fasse face à l\'appareil photo.';

  @override
  String get scanHintDown =>
      'Depuis l\'avant, basculez le bas vers vous pour qu\'il fasse face à l\'appareil photo.';

  @override
  String get scanAlignHint =>
      'Remplissez la grille avec la face, puis touchez le déclencheur.';

  @override
  String get scanCapture => 'Capturer la face';

  @override
  String get scanTurnLeft => 'Tournez le cube entier vers la gauche';

  @override
  String get scanTurnRight => 'Tournez le cube entier vers la droite';

  @override
  String get scanTipTop => 'Basculez le haut vers vous';

  @override
  String get scanTipBottom => 'Basculez le bas vers vous';

  @override
  String get scanGlareTip =>
      'Reflets détectés : inclinez légèrement le cube ou placez votre téléphone au-dessus pour masquer la lumière du plafond.';

  @override
  String get scanDimTip =>
      'Trop sombre : placez-vous à la lumière ou allumez la lampe torche.';

  @override
  String get scanTorch => 'Lampe torche';

  @override
  String get scanGuideLabel =>
      'Guide de scan : les faces scannées sont en couleur. Touchez une face scannée pour la scanner à nouveau.';

  @override
  String get scanTapToRescan =>
      'Touchez une face scannée pour la scanner à nouveau.';

  @override
  String get scanCameraMissing =>
      'Aucun appareil photo trouvé sur cet appareil.';

  @override
  String get scanCameraDenied =>
      'L\'accès à l\'appareil photo a été refusé. Vous pouvez toujours saisir les couleurs à la main.';

  @override
  String get scanCameraFailed => 'Impossible de démarrer l\'appareil photo.';

  @override
  String get scanAllGood => 'Tous les autocollants semblent corrects.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autocollants semblent incorrects',
      one: '1 autocollant semble incorrect',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Quelque chose cloche';

  @override
  String scanIssueColors(int count) {
    return 'Chaque couleur doit apparaître exactement $count fois.';
  }

  @override
  String get scanIssueCenters => 'Deux centres ont la même couleur.';

  @override
  String get scanIssuePieces =>
      'Ces autocollants forment des pièces qui n\'existent pas sur un vrai cube.';

  @override
  String get scanIssueTwist =>
      'Un coin est tourné. Vérifiez les autocollants des coins.';

  @override
  String get scanIssueFlip =>
      'Une arête est retournée. Vérifiez les autocollants des arêtes.';

  @override
  String get scanIssueParity => 'Deux pièces semblent inversées.';

  @override
  String get scanIssueUnavailable =>
      'La vérification des couleurs n\'est pas disponible sur cet appareil.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count autocollants étaient difficiles à lire : jetez-y un coup d\'œil.',
      one: 'Un autocollant était difficile à lire : jetez-y un coup d\'œil.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Touchez un autocollant pour changer sa couleur · Appui long pour la palette';

  @override
  String get scanRescanFace => 'Rescanner une face';

  @override
  String get scanCancelRescan => 'Retour aux couleurs';

  @override
  String get scanPaletteTitle => 'Choisissez une couleur';

  @override
  String get scanOpen3d => 'Ouvrir en 3D';

  @override
  String get scanRestart => 'Recommencer';

  @override
  String get modeTimer => 'Chronomètre';

  @override
  String get modeTimerDesc =>
      'Mélanges, inspection, moyennes et records personnels.';

  @override
  String get modeDaily => 'Défi du jour';

  @override
  String get modeDailyDesc =>
      'Un nouveau mélange chaque jour. Gardez votre série en vie.';

  @override
  String get modePatterns => 'Bibliothèque de motifs';

  @override
  String get modePatternsDesc => 'Damier, superflip et plus encore, en 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Série de $count jours',
      one: 'Série de 1 jour',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Continuer à apprendre';

  @override
  String get startLearning => 'Commencer à apprendre';

  @override
  String lessonOf(int index, int total) {
    return 'Leçon $index sur $total';
  }

  @override
  String get academyAllDone => 'Toutes les leçons sont terminées !';

  @override
  String get academyTitle => 'Académie';

  @override
  String academyProgress(int done, int total) {
    return '$done leçons terminées sur $total';
  }

  @override
  String get lessonAdvanced => 'Avancé';

  @override
  String get lessonDone => 'Terminée';

  @override
  String lessonPartOf(int index, int total) {
    return 'Partie $index sur $total';
  }

  @override
  String get lessonBack => 'Retour';

  @override
  String get lessonNext => 'Suivant';

  @override
  String get lessonFinish => 'Terminer la leçon';

  @override
  String get lessonComplete => 'Leçon terminée !';

  @override
  String get lessonNextLesson => 'Leçon suivante';

  @override
  String get lessonBackToAcademy => 'Retour à l\'Académie';

  @override
  String get lessonTryIt =>
      'À vous : faites glisser la couche indiquée par la flèche, ou touchez Mouvement suivant.';

  @override
  String get lessonLookAround =>
      'Faites glisser le fond pour voir le cube sous tous les angles.';

  @override
  String get lessonDemoDone => 'Bien joué ! Touchez Suivant pour continuer.';

  @override
  String holdPrompt(String top, String front) {
    return 'Tenez le cube avec le centre $top en haut et le centre $front face à vous.';
  }

  @override
  String get trackBeginner => '3×3 débutant : les 3 couronnes';

  @override
  String get trackCfop => 'Introduction au CFOP';

  @override
  String get trackTwoByTwo => '2×2 débutant et Ortega';

  @override
  String get trackBigCubes => 'Grands cubes : réduction et parité';

  @override
  String moveSentence(String layer, String direction) {
    return 'Tournez $layer $direction';
  }

  @override
  String get moveFaceR => 'la face droite';

  @override
  String get moveFaceL => 'la face gauche';

  @override
  String get moveFaceU => 'la face du haut';

  @override
  String get moveFaceD => 'la face du bas';

  @override
  String get moveFaceF => 'la face avant';

  @override
  String get moveFaceB => 'la face arrière';

  @override
  String moveLayerInner(int depth, String face) {
    return 'la couche $depth depuis $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth couches d\'épaisseur)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'les couches $near à $far depuis $face';
  }

  @override
  String get moveLayerMiddle => 'la couche du milieu';

  @override
  String get moveDirUp => 'vers le haut';

  @override
  String get moveDirDown => 'vers le bas';

  @override
  String get moveDirLeft => 'vers la gauche';

  @override
  String get moveDirRight => 'vers la droite';

  @override
  String get moveDirClockwise => 'dans le sens horaire';

  @override
  String get moveDirCounter => 'dans le sens antihoraire';

  @override
  String get moveDirBackClockwise => 'dans le sens horaire, vu de l\'arrière';

  @override
  String get moveDirBackCounter => 'dans le sens antihoraire, vu de l\'arrière';

  @override
  String get moveDirHalf => 'd\'un demi-tour (deux fois)';

  @override
  String get moveRotateX =>
      'Basculez le cube entier : l\'avant monte vers le haut';

  @override
  String get moveRotateXPrime =>
      'Basculez le cube entier : l\'avant descend vers le bas';

  @override
  String get moveRotateX2 =>
      'Retournez le cube entier : l\'avant passe à l\'arrière';

  @override
  String get moveRotateY =>
      'Pivotez le cube entier : l\'avant va vers la gauche';

  @override
  String get moveRotateYPrime =>
      'Pivotez le cube entier : l\'avant va vers la droite';

  @override
  String get moveRotateY2 =>
      'Pivotez le cube entier d\'un demi-tour : l\'arrière vient devant';

  @override
  String get moveRotateZ =>
      'Roulez le cube entier dans le sens horaire : le haut va vers la droite';

  @override
  String get moveRotateZPrime =>
      'Roulez le cube entier dans le sens antihoraire : le haut va vers la gauche';

  @override
  String get moveRotateZ2 =>
      'Mettez le cube entier à l\'envers : le haut passe en bas';

  @override
  String get phaseReductionCenters => 'Centres';

  @override
  String get phaseReductionEdges => 'Apparier les arêtes';

  @override
  String get phaseReductionEdgeParity => 'Parité des arêtes';

  @override
  String get phaseReductionOllParity => 'Parité OLL';

  @override
  String get phaseReductionPllParity => 'Parité PLL';

  @override
  String get explainReductionCenterBlock =>
      'Des rotations de tranches qui ramènent plusieurs pièces de centre à la fois.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Amenez une pièce de centre $piece sur sa face avec un 3-cycle qui ne touche pas les centres terminés.';
  }

  @override
  String get explainReductionParityCenters =>
      'Reconstruisez les centres déplacés par la rotation de parité.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Assemblez les pièces de l\'arête $piece avec un 3-cycle ; les centres restent résolus.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Les dernières arêtes ne peuvent pas être appariées avec des 3-cycles seuls (parité des arêtes). Une rotation de tranche interne règle le problème.';

  @override
  String get explainReductionOllParity =>
      'Parité OLL : une arête est retournée, ce qui est impossible sur un 3×3. Cet algorithme la remet dans le bon sens.';

  @override
  String get explainReductionPllParity =>
      'Parité PLL : deux arêtes sont échangées, ce qui est impossible sur un 3×3. Cet algorithme les remet en place.';

  @override
  String get patternsTitle => 'Bibliothèque de motifs';

  @override
  String get patternsHint =>
      'Touchez un motif pour le regarder, puis reproduisez-le sur votre cube.';

  @override
  String get patternCheckerboard => 'Damier';

  @override
  String get patternCubeInCube => 'Cube dans le cube';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Points';

  @override
  String get patternCross => 'Croix';

  @override
  String get patternPython => 'Python';

  @override
  String get phasePattern => 'Former le motif';

  @override
  String get explainPatternStep =>
      'Suivez chaque mouvement sur votre cube. Touchez Résoudre pour revenir à l\'état normal.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Chronomètre';

  @override
  String get timerHoldToStart => 'Maintenez, puis relâchez pour démarrer';

  @override
  String get timerReleaseToStart => 'Relâchez pour démarrer';

  @override
  String get timerTapToStop => 'Touchez n\'importe où pour arrêter';

  @override
  String get timerInspecting =>
      'Inspection : maintenez, puis relâchez pour démarrer';

  @override
  String get timerTapToInspect =>
      'Touchez pour lancer les 15 secondes d\'inspection';

  @override
  String get timerInspectionToggle => 'Inspection de 15 s';

  @override
  String get timerNewScramble => 'Nouveau mélange';

  @override
  String get timerLoadingScramble => 'Génération d\'un mélange…';

  @override
  String get timerPb => 'Record';

  @override
  String get timerSolves => 'Résolutions';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Supprimer';

  @override
  String get timerHistory => 'Historique';

  @override
  String get timerNoSolves =>
      'Aucune résolution pour l\'instant. Mélangez votre cube et c\'est parti !';

  @override
  String get timerNewPb => 'Nouveau record personnel !';

  @override
  String get timerClearHistory => 'Effacer l\'historique';

  @override
  String get timerScrambleHint => 'Blanc en haut, vert devant, puis mélangez :';

  @override
  String get dailyTitle => 'Défi du jour';

  @override
  String dailyFor(String date) {
    return 'Défi du $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Meilleure série : $count';
  }

  @override
  String get dailyDone => 'C\'est fait pour aujourd\'hui ! Revenez demain.';

  @override
  String get dailyNotDone =>
      'Résolvez le mélange du jour pour garder votre série.';

  @override
  String get dailySolveVirtual => 'Résoudre sur le cube 3D';

  @override
  String get dailyTimeIt => 'Chronométrer sur votre cube';

  @override
  String get dailyHint => 'Indice';

  @override
  String dailyHintText(String moves) {
    return 'Commencez par la croix blanche : $moves';
  }

  @override
  String get dailyHintFailed =>
      'Aucun indice n\'est disponible pour le moment.';

  @override
  String get lessonBasics => 'Découvrez le cube';

  @override
  String get lessonBasicsDesc => 'Pièces, faces et noms des mouvements.';

  @override
  String get stepBasicsPieces => 'Trois types de pièces';

  @override
  String get stepBasicsPiecesBody =>
      'Les centres ne bougent jamais et donnent sa couleur à chaque face. Les arêtes ont deux couleurs, les coins en ont trois. Résoudre, c\'est placer chaque arête et chaque coin à côté des centres de mêmes couleurs.';

  @override
  String get stepBasicsFaces => 'Six lettres de faces';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F et B désignent les faces droite, gauche, haut, bas, avant et arrière. Une lettre seule signifie un quart de tour dans le sens horaire, comme si vous regardiez cette face de face.';

  @override
  String get stepBasicsPrime => 'Tours prime et doubles';

  @override
  String get stepBasicsPrimeBody =>
      'Une apostrophe (R\') tourne dans l\'autre sens, antihoraire. Un 2 (U2) est un demi-tour : deux quarts de tour.';

  @override
  String get stepCrossGoal => 'L\'objectif';

  @override
  String get stepCrossGoalBody =>
      'Tenez le jaune en haut. Les quatre arêtes blanches entourent le centre blanc en bas, chaque couleur latérale assortie au centre voisin.';

  @override
  String get stepCrossTop => 'Arête en haut';

  @override
  String get stepCrossTopBody =>
      'Trouvez une arête blanche en haut. Tournez la couche du haut jusqu\'à ce que sa couleur latérale soit au-dessus du centre assorti, puis tournez cette face deux fois pour la descendre.';

  @override
  String get stepCrossMiddle => 'Arête au milieu';

  @override
  String get stepCrossMiddleBody =>
      'Une arête coincée dans la couche du milieu remonte d\'abord : tournez sa face latérale vers le haut, écartez la couche du haut puis remettez la face latérale, pour garder la croix intacte. Placez-la ensuite depuis le haut.';

  @override
  String get stepCornersInsert => 'Au-dessus de sa place';

  @override
  String get stepCornersInsertBody =>
      'Tournez la couche du haut jusqu\'à ce qu\'un coin blanc soit au-dessus de l\'emplacement de ses couleurs, en avant à droite. R U R\' U\' le met en place.';

  @override
  String get stepCornersRepeat => 'Répétez le trigger';

  @override
  String get stepCornersRepeatBody =>
      'Si le blanc est orienté du mauvais côté, continuez à répéter R U R\' U\' au même endroit. Chaque coin est résolu en cinq répétitions au maximum.';

  @override
  String get stepMiddleRight => 'Arête vers la droite';

  @override
  String get stepMiddleRightBody =>
      'Alignez une arête du haut avec son centre sur la face avant. Si sa couleur du dessus correspond au centre de droite, insérez-la avec U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Arête vers la gauche';

  @override
  String get stepMiddleLeftBody =>
      'Si sa couleur du dessus correspond plutôt au centre de gauche, utilisez le miroir : U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Un seul algorithme';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' transforme un point jaune en L, un L en ligne et une ligne en croix. Tenez le L en arrière à gauche et la ligne à l\'horizontale.';

  @override
  String get stepYellowEdges => 'Alignez les arêtes';

  @override
  String get stepYellowEdgesBody =>
      'Tournez la couche du haut jusqu\'à ce que deux arêtes correspondent à leurs centres. Avec l\'une à l\'arrière et l\'autre à droite, R U R\' U R U2 R\' U échange les deux autres.';

  @override
  String get stepPlaceCorners => 'Placez-les';

  @override
  String get stepPlaceCornersBody =>
      'Tenez en avant à droite un coin déjà à sa place. U R U\' L\' U R\' U\' L déplace les trois autres : répétez jusqu\'à ce que les quatre soient en place.';

  @override
  String get stepTwistCorners => 'Orientez-les';

  @override
  String get stepTwistCornersBody =>
      'Avec un coin non résolu en avant à droite, répétez R\' D\' R D jusqu\'à ce que le jaune soit en haut, puis tournez seulement la couche du haut pour amener le suivant. Le bas semble cassé jusqu\'à la toute fin : continuez.';

  @override
  String get lessonCfopIntro => 'Qu\'est-ce que le CFOP ?';

  @override
  String get lessonCfopIntroDesc => 'Croix, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Quatre étapes';

  @override
  String get stepCfopOverviewBody =>
      'Les speedcubers résolvent la croix, associent chaque coin de la première couche à son arête du milieu (F2L), orientent la dernière couche (OLL) puis la permutent (PLL).';

  @override
  String get stepCfopCross => 'Planifiez la croix';

  @override
  String get stepCfopCrossBody =>
      'En CFOP, la croix est planifiée pendant l\'inspection et construite en bas en huit mouvements environ.';

  @override
  String get lessonF2l => 'Bases du F2L';

  @override
  String get lessonF2lDesc => 'Associez un coin à son arête.';

  @override
  String get stepF2lRight => 'Insérez une paire';

  @override
  String get stepF2lRightBody =>
      'Quand un coin et son arête sont côte à côte en haut, amenez-les au-dessus de leur emplacement et insérez-les ensemble.';

  @override
  String get stepF2lLeft => 'Paire à gauche';

  @override
  String get stepF2lLeftBody =>
      'Le même cas de l\'autre côté est le miroir, U\' L\' U L. Une rotation du cube (y) vous permet d\'utiliser la main la plus pratique.';

  @override
  String get lessonOll => 'OLL en deux temps';

  @override
  String get lessonOllDesc => 'Rendez le dessus entièrement jaune.';

  @override
  String get stepOllCross => 'D\'abord les arêtes';

  @override
  String get stepOllCrossBody =>
      'L\'OLL en deux temps commence par l\'algorithme de la croix jaune que vous connaissez déjà.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Avec un coin jaune orienté vers le haut en avant à gauche, le Sune (R U R\' U R U2 R\') oriente les trois autres. La plupart des autres cas utilisent le Sune et son miroir.';

  @override
  String get lessonPll => 'PLL en deux temps';

  @override
  String get lessonPllDesc => 'Terminez le cube.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'La T-perm échange deux coins et deux arêtes. Utilisez-la pour placer les coins : tenez à droite les deux coins à échanger.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Une fois les coins placés, la U-perm fait tourner trois arêtes. Gardez le côté terminé à l\'arrière.';

  @override
  String get lessonTwoFirst => 'Première couche du 2×2';

  @override
  String get lessonTwoFirstDesc => 'Formez une face avec des coins assortis.';

  @override
  String get stepTwoIntro => 'Seulement des coins';

  @override
  String get stepTwoIntroBody =>
      'Un 2×2 est un 3×3 sans arêtes ni centres. Choisissez une couleur, formez cette face en bas et faites correspondre les couleurs latérales des coins voisins.';

  @override
  String get stepTwoCorner => 'Insérez les coins';

  @override
  String get stepTwoCornerBody =>
      'Exactement comme les coins blancs du 3×3 : amenez un coin au-dessus de sa place et faites R U R\' U\' jusqu\'à ce qu\'il s\'y mette.';

  @override
  String get lessonTwoOll => 'Orientez le dessus';

  @override
  String get lessonTwoOllDesc => 'OLL Ortega avec le Sune.';

  @override
  String get stepTwoSune => 'Encore le Sune';

  @override
  String get stepTwoSuneBody =>
      'Le Sune rend aussi le dessus jaune sur un 2×2. Avec la méthode Ortega, on apprend sept cas courts ; le Sune et son miroir couvrent la plupart d\'entre eux.';

  @override
  String get lessonTwoPbl => 'Permutez les deux couches';

  @override
  String get lessonTwoPblDesc => 'Échangez des coins pour terminer.';

  @override
  String get stepTwoAdjacent => 'Échange adjacent';

  @override
  String get stepTwoAdjacentBody =>
      'Quand deux coins voisins du haut doivent être échangés, tenez-les à droite et utilisez la T-perm.';

  @override
  String get stepTwoDiagonal => 'Échange en diagonale';

  @override
  String get stepTwoDiagonalBody =>
      'Deux coins en positions opposées s\'échangent avec la Y-perm.';

  @override
  String get lessonBigIntro => 'Les pièces des grands cubes';

  @override
  String get lessonBigIntroDesc => 'Centres, ailes et tranches.';

  @override
  String get stepBigPieces => 'Pas de centres fixes';

  @override
  String get stepBigPiecesBody =>
      'Sur un 4×4, chaque face a quatre pièces de centre mobiles, et chaque arête est formée de deux ailes. La réduction les regroupe pour que le cube se comporte comme un 3×3.';

  @override
  String get stepBigSlices => 'Tours larges et internes';

  @override
  String get stepBigSlicesBody =>
      'Rw tourne ensemble les deux couches de droite. 2R ne tourne que la deuxième couche en partant de la droite. Ces tours déplacent les centres et les ailes.';

  @override
  String get lessonBigCenters => 'Centres';

  @override
  String get lessonBigCentersDesc => 'Regroupez les pièces de centre.';

  @override
  String get stepBigCenterCycle => 'Un 3-cycle de centres';

  @override
  String get stepBigCenterCycleBody =>
      'Ce commutateur déplace exactement trois pièces de centre et ne touche à rien d\'autre, donc les centres terminés le restent.';

  @override
  String get lessonBigEdges => 'Apparier les arêtes';

  @override
  String get lessonBigEdgesDesc => 'Assemblez les ailes en arêtes complètes.';

  @override
  String get stepBigEdgePair => 'Apparier et restaurer';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' aligne deux ailes assorties, R U R\' F R\' F\' R fait entrer une arête non appariée, et Uw remet les centres en place.';

  @override
  String get lessonBigParity => 'Parité';

  @override
  String get lessonBigParityDesc => 'Parités OLL et PLL sur les cubes pairs.';

  @override
  String get stepBigOllParity => 'Parité OLL';

  @override
  String get stepBigOllParityBody =>
      'Une seule arête retournée est impossible sur un 3×3. Sur les cubes pairs, cet algorithme retourne l\'arête avant du haut. Il peut mélanger le reste de la couche du haut, ce que les dernières étapes du 3×3 corrigent de toute façon.';

  @override
  String get stepBigPllParity => 'Parité PLL';

  @override
  String get stepBigPllParityBody =>
      'Deux arêtes échangées tout à la fin ? 2R2 U2 2R2 Uw2 2R2 Uw2 échange les arêtes avant et arrière du haut.';

  @override
  String get introGoalHeading => 'Quel est le but ?';

  @override
  String get introHowHeading => 'Comment fait-on ?';

  @override
  String get introStart => 'Compris, commencer pas à pas';

  @override
  String get introShowGoal => 'Voir l\'objectif';

  @override
  String get introStateStart => 'Départ';

  @override
  String get introStateGoal => 'Objectif';

  @override
  String get introPlayMorph => 'Lire du départ à l\'objectif';

  @override
  String get introGoalBasics =>
      'Apprenez à lire le cube : ses pièces, ses six faces et comment les lettres des mouvements les tournent.';

  @override
  String get introGoalCross =>
      'Formez une croix blanche dont chaque arête blanche correspond aussi au centre voisin.';

  @override
  String get introGoalCorners =>
      'Placez les quatre coins blancs : la première couronne, toute la couche blanche, est terminée.';

  @override
  String get introGoalMiddle =>
      'Placez les quatre arêtes de la couche du milieu pour résoudre les deux premières couches.';

  @override
  String get introGoalYellowCross =>
      'Formez une croix jaune en haut ; les couleurs des côtés n\'ont pas encore besoin de correspondre.';

  @override
  String get introGoalYellowEdges =>
      'Alignez chaque arête de la croix jaune avec le centre de son côté.';

  @override
  String get introGoalYellowCorners =>
      'Amenez chaque coin jaune à sa place, même s\'il est encore tourné.';

  @override
  String get introGoalTwistCorners =>
      'Tournez les coins jaunes dans le bon sens pour résoudre tout le cube.';

  @override
  String get introGoalCfopIntro =>
      'Découvrez le plan du speedcubing : croix, deux premières couches, puis dernière couche en deux étapes.';

  @override
  String get introGoalF2l =>
      'Insérez chaque coin blanc avec son arête du milieu et terminez deux couches à la fois.';

  @override
  String get introGoalOll =>
      'Rendez toute la face du haut jaune avec un ou deux algorithmes.';

  @override
  String get introGoalPll =>
      'Ramenez les pièces de la dernière couche à leur place pour finir le cube.';

  @override
  String get introGoalTwoFirst =>
      'Construisez une couche blanche complète sur le 2×2.';

  @override
  String get introGoalTwoOll => 'Rendez toute la face du haut du 2×2 jaune.';

  @override
  String get introGoalTwoPbl =>
      'Échangez les derniers coins pour résoudre le 2×2.';

  @override
  String get introGoalBigIntro =>
      'Découvrez le 4×4 : centres, paires d\'arêtes et coins, et les mouvements qui les tournent.';

  @override
  String get introGoalBigCenters =>
      'Rassemblez les pièces centrales de chaque face en un bloc d\'une seule couleur.';

  @override
  String get introGoalBigEdges =>
      'Appariez les pièces d\'arête identiques pour que chaque arête ressemble à une arête de 3×3.';

  @override
  String get introGoalBigParity =>
      'Corrigez les deux cas du 4×4 qu\'un 3×3 n\'a jamais : une arête retournée ou deux arêtes échangées.';

  @override
  String get introHowBasics =>
      'Les centres ne bougent jamais : ils donnent la couleur de chaque face.\nChaque lettre tourne une face d\'un quart de tour dans le sens horaire.\nUne apostrophe (\') tourne dans l\'autre sens ; un 2 tourne deux fois.';

  @override
  String get introHowCross =>
      'Tenez le jaune en haut : la croix blanche se construit en bas.\nTrouvez une arête blanche et alignez sa couleur latérale avec le bon centre.\nTournez cette face deux fois pour descendre l\'arête à sa place.';

  @override
  String get introHowCorners =>
      'Amenez un coin blanc au-dessus de sa place vide.\nRépétez R U R\' U\' jusqu\'à ce qu\'il entre dans le bon sens.\nFaites de même pour les trois autres coins.';

  @override
  String get introHowMiddle =>
      'Trouvez une arête du haut sans jaune et alignez sa couleur avant avec un centre.\nEnvoyez-la à droite ou à gauche avec un court algorithme de 8 mouvements.\nLa couche blanche revient intacte à chaque fois.';

  @override
  String get introHowYellowCross =>
      'Regardez le dessus : un point, un L ou une ligne.\nTenez-le comme montré et faites F R U R\' U\' F\'.\nRépétez jusqu\'à voir la croix jaune.';

  @override
  String get introHowYellowEdges =>
      'Tournez le haut jusqu\'à ce que deux arêtes correspondent à leurs centres.\nPlacez-les derrière et à droite, puis faites R U R\' U R U2 R\' U.\nRépétez jusqu\'à ce que les quatre correspondent.';

  @override
  String get introHowYellowCorners =>
      'Un coin est à sa place quand ses couleurs correspondent aux trois faces qui l\'entourent.\nGardez un coin déjà placé en avant à droite.\nU R U\' L\' U R\' U\' L fait tourner les trois autres jusqu\'à ce qu\'ils soient tous en place.';

  @override
  String get introHowTwistCorners =>
      'Tenez un coin non résolu en avant à droite.\nRépétez R\' D\' R D jusqu\'à ce que son jaune soit en haut.\nTournez seulement le haut pour le suivant ; le bas se répare tout seul à la fin.';

  @override
  String get introHowCfopIntro =>
      'Croix : quatre arêtes planifiées pendant l\'inspection.\nF2L : chaque coin entre avec son arête.\nL\'OLL rend le dessus jaune, puis la PLL remet les pièces en place.';

  @override
  String get introHowF2l =>
      'Trouvez un coin et son arête dans la couche du haut.\nAssociez-les au-dessus de leur emplacement.\nInsérez la paire en trois ou quatre mouvements.';

  @override
  String get introHowOll =>
      'D\'abord la croix jaune avec F R U R\' U\' F\'.\nPuis orientez les coins, par exemple avec le Sune.\nReconnaissez le cas au jaune que vous voyez.';

  @override
  String get introHowPll =>
      'Le dessus est déjà entièrement jaune.\nLa T-perm échange des coins ; la U-perm fait tourner trois arêtes.\nLisez les couleurs des côtés pour choisir l\'algorithme.';

  @override
  String get introHowTwoFirst =>
      'Un 2×2 n\'a que des coins, comme un 3×3 sans arêtes.\nAmenez chaque coin blanc au-dessus de sa place.\nRépétez R U R\' U\' jusqu\'à ce qu\'il entre.';

  @override
  String get introHowTwoOll =>
      'Gardez la couche blanche en bas.\nLe Sune (R U R\' U R U2 R\') tourne les coins du haut.\nRépétez depuis le bon angle jusqu\'à ce que le dessus soit tout jaune.';

  @override
  String get introHowTwoPbl =>
      'Cherchez un côté où deux coins correspondent déjà.\nÉchange adjacent : un algorithme de type T-perm.\nÉchange en diagonale : un algorithme un peu plus long.';

  @override
  String get introHowBigIntro =>
      'Aucun centre n\'est fixe : quatre pièces centrales forment la couleur de chaque face.\nLes tours larges comme Rw tournent deux couches à la fois.\nLes tours internes comme 2R tournent une seule tranche intérieure.';

  @override
  String get introHowBigCenters =>
      'Construisez d\'abord deux centres opposés.\nLes tranches intérieures échangent des pièces centrales sans casser les centres finis.\nTerminez les quatre derniers centres de la même façon.';

  @override
  String get introHowBigEdges =>
      'Trouvez deux pièces d\'arête aux mêmes couleurs.\nAlignez-les côte à côte avec une tranche intérieure.\nRangez la paire et remettez les centres en place.';

  @override
  String get introHowBigParity =>
      'Résolvez le 4×4 comme un 3×3 jusqu\'à être bloqué.\nUne arête retournée : le long algorithme de parité OLL.\nDeux arêtes échangées : 2R2 U2 2R2 Uw2 2R2 Uw2.';

  @override
  String get dirFaceR => 'Côté droit';

  @override
  String get dirFaceL => 'Côté gauche';

  @override
  String get dirFaceU => 'Rangée du haut';

  @override
  String get dirFaceD => 'Rangée du bas';

  @override
  String get dirFaceF => 'Face avant';

  @override
  String get dirFaceB => 'Face arrière';

  @override
  String get dirMiddle => 'Tranche du milieu';

  @override
  String get dirWholeCube => 'Cube entier';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, couche $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth couches de profondeur';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, couches $near–$far';
  }

  @override
  String get dirUp => 'Vers le haut';

  @override
  String get dirDown => 'Vers le bas';

  @override
  String get dirLeft => 'Vers la gauche';

  @override
  String get dirRight => 'Vers la droite';

  @override
  String get dirClockwise => 'Sens horaire';

  @override
  String get dirCounter => 'Sens antihoraire';

  @override
  String get dirBackClockwise => 'Sens horaire, vu de l\'arrière';

  @override
  String get dirBackCounter => 'Sens antihoraire, vu de l\'arrière';

  @override
  String get dirHalf => 'Double tour (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Masquer les détails';

  @override
  String get solveExpand => 'Afficher les détails';

  @override
  String get dailyScrambleSteps => 'Mélange pas à pas';

  @override
  String get dailyScrambleGuide => 'Guide de mélange en 3D';

  @override
  String get dailyScrambleGuideTitle => 'Guide de mélange';

  @override
  String get phaseDailyScramble => 'Mélangez le cube du jour';

  @override
  String get explainDailyScramble =>
      'Partez d\'un cube résolu, blanc en haut et vert devant, et reproduisez chaque rotation sur votre vrai cube.';

  @override
  String get stageCenters => 'Construire les blocs de centres';

  @override
  String get stageEdges => 'Apparier les arêtes extérieures et intérieures';

  @override
  String get stageParity => 'Résoudre la parité';

  @override
  String get stageCrown1 => 'Première couronne (blanche)';

  @override
  String get stageCrown2 => 'Deuxième couronne';

  @override
  String get stageCrown3 => 'Troisième couronne (jaune)';

  @override
  String get stageOrient => 'Orienter les pièces';

  @override
  String get stageFinish => 'Finir le cube';

  @override
  String get stageAsThree => 'Résoudre comme un 3×3';

  @override
  String get stageTwoByTwo => 'Résoudre le 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Étape $number sur $total : $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'Couronne $crown • Étape $number sur $total : $title';
  }

  @override
  String get solveAllStagesDone => 'Toutes les étapes sont terminées. Bravo !';

  @override
  String get trackFiveByFive => '5×5 Professor’s Cube';

  @override
  String get trackSixBySix => 'Cube 6×6';

  @override
  String get lessonFiveIntro => 'Découvrir le 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Centres fixes, barres de centre, arêtes du milieu et ailes.';

  @override
  String get introGoalFiveIntro =>
      'Découvrez le 5×5 : centres fixes, barres de centre, arêtes du milieu et ailes.';

  @override
  String get introHowFiveIntro =>
      'La pièce du milieu de chaque face ne bouge jamais.\nChaque arête est une pièce du milieu avec deux ailes.\nLes tranches intérieures déplacent des pièces sans toucher l\'extérieur.';

  @override
  String get lessonFiveCenters => 'Centres du 5×5';

  @override
  String get lessonFiveCentersDesc =>
      'Construisez chaque centre avec des barres de trois.';

  @override
  String get introGoalFiveCenters =>
      'Construisez sur chaque face un bloc de centre 3×3 d\'une seule couleur.';

  @override
  String get introHowFiveCenters =>
      'Partez de la pièce du milieu : elle donne la couleur.\nFormez des barres de trois et glissez-les avec une tranche intérieure.\nTerminez ensemble les deux derniers centres.';

  @override
  String get lessonFiveEdges => 'Arêtes du 5×5';

  @override
  String get lessonFiveEdgesDesc =>
      'Réunissez deux ailes et leur arête du milieu.';

  @override
  String get introGoalFiveEdges =>
      'Réunissez chaque arête du milieu et ses deux ailes pour que les 12 arêtes ressemblent à des pièces uniques.';

  @override
  String get introHowFiveEdges =>
      'Alignez deux ailes avec leur arête du milieu devant.\nTournez la couche intérieure, échangez une arête non résolue, puis revenez.\nAppariez les dernières arêtes sans casser celles qui sont finies.';

  @override
  String get lessonFiveSolve => 'Résoudre le 5×5 comme un 3×3';

  @override
  String get lessonFiveSolveDesc => 'Finissez avec les trois couronnes.';

  @override
  String get introGoalFiveSolve =>
      'Résolvez le 5×5 réduit comme un 3×3, couronne par couronne.';

  @override
  String get introHowFiveSolve =>
      'Désormais, seulement des tours extérieurs.\nPremière couronne, deuxième, puis la couronne jaune.\nLes centres fixes montrent la couleur de chaque face.';

  @override
  String get lessonFiveParity => 'Parité des arêtes du 5×5';

  @override
  String get lessonFiveParityDesc =>
      'Réparez l\'arête dont les ailes sont échangées.';

  @override
  String get introGoalFiveParity =>
      'Réparez l\'unique arête dont les deux ailes sont échangées, puis terminez.';

  @override
  String get introHowFiveParity =>
      'Elle apparaît comme une arête qui refuse de s\'apparier.\nJouez une fois la longue correction de tranches intérieures.\nTout le reste reprend sa place.';

  @override
  String get lessonSixIntro => 'Découvrir le 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Pas de centre fixe et quatre pièces par arête.';

  @override
  String get introGoalSixIntro =>
      'Découvrez le 6×6 : seize pièces centrales par face et quatre pièces par arête.';

  @override
  String get introHowSixIntro =>
      'Aucun centre n\'est fixe : vous choisissez les couleurs en construisant.\nChaque arête a des ailes extérieures et intérieures.\nLes tours larges peuvent bouger jusqu\'à trois couches.';

  @override
  String get lessonSixCenters => 'Centres du 6×6';

  @override
  String get lessonSixCentersDesc =>
      'Construisez des centres 4×4 avec des barres de quatre.';

  @override
  String get introGoalSixCenters =>
      'Construisez sur chaque face un bloc de centre 4×4 d\'une seule couleur.';

  @override
  String get introHowSixCenters =>
      'Construisez d\'abord deux centres opposés.\nFormez des barres de quatre et réunissez-les.\nDéplacez une pièce seule avec le truc tranche, haut, annuler.';

  @override
  String get lessonSixEdges => 'Arêtes du 6×6';

  @override
  String get lessonSixEdgesDesc =>
      'Rassemblez les quatre pièces de chaque arête.';

  @override
  String get introGoalSixEdges =>
      'Rassemblez les quatre pièces de chaque arête pour que le 6×6 ait 12 arêtes nettes.';

  @override
  String get introHowSixEdges =>
      'Alignez devant les ailes extérieures et intérieures.\nLa couche large profonde fait entrer et sortir une arête.\nLes arêtes finies ne sont jamais cassées.';

  @override
  String get lessonSixSolve => 'Résoudre le 6×6 comme un 3×3';

  @override
  String get lessonSixSolveDesc => 'Finissez avec les trois couronnes.';

  @override
  String get introGoalSixSolve =>
      'Résolvez le 6×6 réduit comme un 3×3, couronne par couronne.';

  @override
  String get introHowSixSolve =>
      'Désormais, seulement des tours extérieurs.\nLes centres construits montrent la couleur de chaque face.\nPremière couronne, deuxième, puis la couronne jaune.';

  @override
  String get lessonSixParity => 'Parité du 6×6';

  @override
  String get lessonSixParityDesc =>
      'Une arête retournée ou deux arêtes échangées.';

  @override
  String get introGoalSixParity =>
      'Corrigez les deux cas du 6×6 qu\'un 3×3 n\'a jamais : une arête retournée ou deux arêtes échangées.';

  @override
  String get introHowSixParity =>
      'Résolvez comme un 3×3 jusqu\'à être bloqué.\nUne arête retournée : la longue correction de parité.\nDeux arêtes échangées : la courte correction en doubles tours.';

  @override
  String get stepFivePieces => 'Les pièces du 5×5';

  @override
  String get stepFivePiecesBody =>
      'La pièce du milieu de chaque face ne bouge jamais ; elle donne donc la couleur de la face, comme sur un 3×3. Autour, huit autres pièces de centre ; chaque arête a une pièce du milieu et deux ailes, et les coins fonctionnent comme sur un 3×3.';

  @override
  String get stepFiveSlices => 'Trois sortes de tours';

  @override
  String get stepFiveSlicesBody =>
      'Un tour extérieur tourne une face. Un tour large tourne une face avec la couche derrière elle. Un tour de tranche intérieure ne tourne qu\'une couche intérieure : c\'est ainsi que les pièces changent de place sans toucher l\'extérieur.';

  @override
  String get stepFiveCenterBar => 'Barres de centre';

  @override
  String get stepFiveCenterBarBody =>
      'Formez une rangée de trois pièces de centre identiques, puis glissez-la près du milieu assorti par un tour de tranche intérieure. Trois barres font un centre terminé.';

  @override
  String get stepFiveCenterSwap => 'Échanger sans casser';

  @override
  String get stepFiveCenterSwapBody =>
      'Pour déplacer une seule pièce de centre : tournez une tranche intérieure, tournez le haut, annulez la tranche et remettez le haut. Les centres finis reviennent à chaque fois.';

  @override
  String get stepFiveEdgePair => 'Apparier les ailes à l\'arête du milieu';

  @override
  String get stepFiveEdgePairBody =>
      'Alignez deux ailes près de leur arête du milieu devant, descendez la couche intérieure, amenez une arête non résolue par le haut, puis remontez la couche intérieure.';

  @override
  String get stepFiveEdgeLast => 'Les dernières arêtes';

  @override
  String get stepFiveEdgeLastBody =>
      'Quand il reste peu d’arêtes, un tour large, un court déclencheur et le tour large inverse les apparient sans casser les arêtes finies.';

  @override
  String get stepFiveAsThree => 'C\'est maintenant un 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Une fois centres et arêtes faits, le 5×5 se comporte comme un grand 3×3. Utilisez seulement des tours extérieurs et suivez les trois couronnes : croix et coins blancs, couche du milieu, puis couche jaune.';

  @override
  String get stepFiveEdgeParity => 'Échanger les ailes de la dernière arête';

  @override
  String get stepFiveEdgeParityBody =>
      'Parfois, la dernière arête a ses deux ailes échangées. Un long algorithme de tranches intérieures les remet en place et tout le reste revient. Terminez ensuite comme un 3×3.';

  @override
  String get stepSixPieces => 'Les pièces du 6×6';

  @override
  String get stepSixPiecesBody =>
      'Comme le 4×4, le 6×6 n\'a pas de centre fixe : seize pièces de centre forment la couleur de chaque face. Chaque arête a quatre pièces : deux ailes extérieures et deux intérieures.';

  @override
  String get stepSixSlices => 'Tourner des couches plus profondes';

  @override
  String get stepSixSlicesBody =>
      'Les tours larges peuvent bouger deux ou trois couches depuis une face. Les tranches intérieures de deuxième ou troisième couche sont les outils des centres et des arêtes.';

  @override
  String get stepSixCenterBar => 'Barres de quatre';

  @override
  String get stepSixCenterBarBody =>
      'Formez des rangées de quatre pièces de centre identiques et glissez-les côte à côte avec des tours de tranche intérieure jusqu\'à ce que la face soit d\'une seule couleur.';

  @override
  String get stepSixCenterSwap => 'Une pièce à la fois';

  @override
  String get stepSixCenterSwapBody =>
      'Tournez la troisième couche, tournez le haut, annulez, revenez : une pièce de centre bouge et les centres finis reviennent.';

  @override
  String get stepSixEdgePair => 'Quatre pièces, une arête';

  @override
  String get stepSixEdgePairBody =>
      'Rassemblez devant les quatre pièces d\'une arête avec la couche large profonde, amenez une arête non résolue, puis remettez la couche large.';

  @override
  String get stepSixEdgeLast => 'Les dernières arêtes';

  @override
  String get stepSixEdgeLastBody =>
      'Appariez les dernières arêtes avec un court déclencheur entre un tour large profond et son inverse, pour que les arêtes finies restent appariées.';

  @override
  String get stepSixAsThree => 'C\'est maintenant un 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Avec des centres 4×4 et des arêtes appariées, résolvez le 6×6 comme un 3×3 avec des tours extérieurs et les trois couronnes.';

  @override
  String get stepSixOllParity => 'Une arête retournée';

  @override
  String get stepSixOllParityBody =>
      'Si une seule arête semble retournée pendant la dernière couche, c\'est la parité. Placez-la devant dans la couche du haut et jouez la longue correction : les deux premières couronnes reviennent intactes.';

  @override
  String get stepSixPllParity => 'Deux arêtes échangées';

  @override
  String get stepSixPllParityBody =>
      'Si deux arêtes semblent échangées tout à la fin, placez-les devant et derrière dans la couche du haut et jouez la courte correction en doubles tours intérieurs.';
}
