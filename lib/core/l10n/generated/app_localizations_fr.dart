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
  String lessonPartOf(int index, int total) {
    return 'Partie $index sur $total';
  }

  @override
  String get lessonNext => 'Suivant';

  @override
  String get lessonPrevious => 'Précédent';

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
      'À vous : faites glisser la couche indiquée par la flèche, ou touchez Suivant.';

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
  String get timerInspectionToggle => 'Inspection de 15 s';

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
      'Tenez le jaune en haut et le vert face à vous. Rassemblez d\'abord les quatre arêtes blanches autour du centre jaune, blanc vers le haut, comme des pétales : c\'est la marguerite. Puis chaque pétale descend sur le centre blanc, sa couleur latérale assortie au centre voisin.';

  @override
  String get stepCrossTop => 'Arête en haut';

  @override
  String get stepCrossTopBody =>
      'Une arête blanche en haut, blanc vers le haut, est un pétale de la marguerite. Tournez le dessus jusqu\'à ce que sa couleur latérale soit juste au-dessus du centre de même couleur, puis faites un demi-tour (180°) de cette face pour la poser sur le centre blanc.';

  @override
  String get stepCrossMiddle => 'Arête au milieu';

  @override
  String get stepCrossMiddleBody =>
      'Une arête coincée dans la couronne du milieu remonte d\'abord : montez son côté, écartez le dessus et redescendez le côté, ainsi les pièces placées ne bougent pas. C\'est maintenant un pétale en haut : alignez-le et faites un demi-tour de cette face.';

  @override
  String get stepCornersInsert => 'Au-dessus de sa place';

  @override
  String get stepCornersInsertBody =>
      'Tournez le dessus jusqu\'à ce que le coin blanc soit juste au-dessus de sa place, entre les deux centres de ses couleurs latérales. Ici, un tour du dessus et R U\' R\' suffisent : U amène le coin au-dessus et R U\' R\' l\'insère, blanc vers le bas.';

  @override
  String get stepCornersRepeat => 'Répétez le trigger';

  @override
  String get stepCornersRepeatBody =>
      'Gardez la place devant à droite et répétez R U R\' U\' jusqu\'à ce que le blanc soit en bas : une fois s\'il regarde à droite, trois s\'il regarde en haut, cinq s\'il vous regarde. Le dessus semble en désordre ; il se remet tout seul.';

  @override
  String get stepMiddleRight => 'Arête vers la droite';

  @override
  String get stepMiddleRightBody =>
      'Cherchez une arête du haut sans jaune. Tournez le dessus jusqu\'à ce que sa couleur avant corresponde au centre face à vous. Si sa couleur du dessus correspond au centre de droite, envoyez-la à droite : U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Arête vers la gauche';

  @override
  String get stepMiddleLeftBody =>
      'Si sa couleur du dessus correspond plutôt au centre de gauche, utilisez le miroir : U\' L\' U L U F U\' F\'. La couronne blanche revient intacte à chaque fois.';

  @override
  String get stepYellowCross => 'Un seul algorithme';

  @override
  String get stepYellowCrossBody =>
      'Regardez seulement les arêtes jaunes du dessus. Tenez un L en arrière à gauche et une ligne de gauche à droite, puis faites F R U R\' U\' F\'. La ligne demande une fois, le L deux, le point jusqu\'à trois.';

  @override
  String get stepYellowEdges => 'Alignez les arêtes';

  @override
  String get stepYellowEdgesBody =>
      'Tournez le dessus jusqu\'à ce que deux arêtes correspondent à leurs centres. Avec l\'une derrière et l\'autre à droite, R U R\' U R U2 R\' U échange l\'arête avant et l\'arête gauche.';

  @override
  String get stepPlaceCorners => 'Placez-les';

  @override
  String get stepPlaceCornersBody =>
      'Un coin est placé quand ses couleurs correspondent aux trois centres autour, même mal orienté. Tenez un coin placé devant à droite : U R U\' L\' U R\' U\' L fait tourner les trois autres. Répétez jusqu\'à ce que les quatre soient placés.';

  @override
  String get stepTwistCorners => 'Orientez-les';

  @override
  String get stepTwistCornersBody =>
      'Avec un coin non résolu devant à droite, répétez R\' D\' R D par paires jusqu\'à ce que le jaune soit en haut, puis tournez seulement le dessus pour amener le suivant. Le bas semble cassé jusqu\'au dernier coin : continuez.';

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
      'Un 2×2, ce ne sont que huit coins : ni arêtes, ni centres. Construisez la couronne blanche en bas avec des côtés voisins assortis, puis finissez par une seule voie : Sune pour un dessus jaune, puis la T-perm ou la Y-perm.';

  @override
  String get stepTwoCorner => 'Insérez les coins';

  @override
  String get stepTwoCornerBody =>
      'Comme les coins blancs du 3×3 : amenez un coin au-dessus de sa place vide devant à droite et insérez-le, ici avec U R U\' R\' ou en répétant R U R\' U\' jusqu\'à ce que le blanc soit en bas. Vérifiez ses côtés avec son voisin.';

  @override
  String get lessonTwoOll => 'Orientez le dessus';

  @override
  String get lessonTwoOllDesc => 'OLL Ortega avec le Sune.';

  @override
  String get stepTwoSune => 'Encore le Sune';

  @override
  String get stepTwoSuneBody =>
      'Comptez les stickers jaunes tournés vers le haut. Placez le seul coin jaune en haut devant à gauche et faites Sune (R U R\' U R U2 R\'). Recomptez et repositionnez ; trois Sune au maximum. Entre deux, tournez seulement le dessus.';

  @override
  String get lessonTwoPbl => 'Permutez les deux couches';

  @override
  String get lessonTwoPblDesc => 'Échangez des coins pour terminer.';

  @override
  String get stepTwoAdjacent => 'Échange adjacent';

  @override
  String get stepTwoAdjacentBody =>
      'Des phares, ce sont deux stickers identiques en haut d\'un même côté. Tournez le dessus jusqu\'à avoir les phares à gauche : les deux coins à échanger sont alors à droite. Faites la T-perm.';

  @override
  String get stepTwoDiagonal => 'Échange en diagonale';

  @override
  String get stepTwoDiagonalBody =>
      'Aucun phare nulle part : deux coins en diagonale doivent s\'échanger. Faites la Y-perm de n\'importe quel côté, puis tournez le dessus pour tout aligner.';

  @override
  String get lessonBigIntro => 'Les pièces des grands cubes';

  @override
  String get lessonBigIntroDesc => 'Centres, ailes et tranches.';

  @override
  String get stepBigPieces => 'Pas de centres fixes';

  @override
  String get stepBigPiecesBody =>
      'Sur un 4×4, chaque face a quatre pièces centrales mobiles et chaque arête est faite de deux ailes. Aucun centre n\'est fixe : vérifiez l\'ordre des couleurs sur un coin, blanc opposé au jaune, bleu au vert, rouge à l\'orange.';

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
      'Ce commutateur déplace exactement trois pièces centrales et laisse tout le reste : les centres finis restent finis. Utilisez-le quand une pièce isolée refuse de rejoindre une barre.';

  @override
  String get lessonBigEdges => 'Apparier les arêtes';

  @override
  String get lessonBigEdgesDesc => 'Assemblez les ailes en arêtes complètes.';

  @override
  String get stepBigEdgePair => 'Apparier et restaurer';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' aligne deux ailes assorties, R U R\' F R\' F\' R fait entrer une arête non appariée, et Uw remet les centres. Refermez toujours une tranche ouverte.';

  @override
  String get lessonBigParity => 'Parité';

  @override
  String get lessonBigParityDesc => 'Parités OLL et PLL sur les cubes pairs.';

  @override
  String get stepBigOllParity => 'Parité OLL';

  @override
  String get stepBigOllParityBody =>
      'Une seule arête retournée est impossible sur un 3×3 : c\'est la parité OLL, pas une erreur. Gardez-la devant, dans la couronne du haut, et jouez le long algorithme. Il échange aussi les arêtes gauche et droite du haut et deux coins ; les dernières étapes du 3×3 les corrigent.';

  @override
  String get stepBigPllParity => 'Parité PLL';

  @override
  String get stepBigPllParityBody =>
      'Deux arêtes échangées tout à la fin, et aucun algorithme de 3×3 ne convient ? C\'est la parité PLL. Tenez-les devant et derrière dans la couronne du haut : 2R2 U2 2R2 Uw2 2R2 2U2 les échange.';

  @override
  String get introGoalHeading => 'Quel est le but ?';

  @override
  String get introHowHeading => 'Comment fait-on ?';

  @override
  String get introHoldHeading => 'Comment le tenir';

  @override
  String get introWhyHeading => 'Pourquoi ça marche';

  @override
  String get introStart => 'Compris, commencer pas à pas';

  @override
  String get introDontShowAgain => 'Ne plus afficher automatiquement';

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
      'Formez une croix blanche en bas dont chaque arête blanche correspond aussi au centre voisin.';

  @override
  String get introGoalCorners =>
      'Placez les quatre coins blancs pour finir toute la première couronne : face blanche et couleurs latérales assorties.';

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
      'Ramenez les derniers coins chez eux avec une T-perm ou une Y-perm, puis alignez le dessus pour résoudre le 2×2.';

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
      'Corrigez les deux cas du 4×4 qu\'un 3×3 n\'a jamais : une arête retournée (parité OLL) ou deux arêtes échangées (parité PLL).';

  @override
  String get introHowBasics =>
      'Les centres ne bougent jamais : ils donnent la couleur de chaque face.\nChaque lettre tourne une face d\'un quart de tour dans le sens horaire.\nUne apostrophe (\') tourne dans l\'autre sens ; un 2 tourne deux fois.';

  @override
  String get introHoldBasics =>
      'Comme vous voulez : les centres ne bougent pas, les couleurs vous disent toujours quelle face est laquelle.';

  @override
  String get introWhyBasics =>
      'Chaque algorithme n\'est qu\'une suite de ces lettres : savoir les lire est la première compétence.';

  @override
  String get introHowCross =>
      'Montez chaque arête blanche en haut, blanc vers le haut, autour du centre jaune : c\'est la marguerite.\nTournez le dessus jusqu\'à ce que la couleur latérale d\'un pétale soit au-dessus de son centre.\nFaites un demi-tour de cette face pour le descendre ; répétez pour les quatre.';

  @override
  String get introHoldCross =>
      'Centre jaune en haut, centre blanc en bas pendant toute l\'étape. Tournez le dessus, pas le cube, pour aligner un pétale.';

  @override
  String get introWhyCross =>
      'Blanc vers le haut, un demi-tour de la face avant pose l\'arête sur le centre blanc, blanc vers le bas et côté déjà assorti.';

  @override
  String get introHowCorners =>
      'Tournez le dessus jusqu\'à ce qu\'un coin blanc soit au-dessus de sa place vide, devant à droite.\nRépétez R U R\' U\' : une fois si le blanc regarde à droite, trois s\'il regarde en haut, cinq s\'il vous regarde.\nFaites de même pour les trois autres coins.';

  @override
  String get introHoldCorners =>
      'Blanc en bas, jaune en haut. Le coin devant à droite, juste au-dessus de sa place.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' soulève l\'emplacement puis le remet : chaque tour oriente un peu le coin jusqu\'à ce que le blanc soit en bas, sans jamais casser la croix.';

  @override
  String get introHowMiddle =>
      'Cherchez une arête du haut sans jaune et faites correspondre sa couleur avant au centre en dessous.\nSa couleur du dessus dit où elle va : à droite ou à gauche.\nInsérez-la avec l\'algorithme de 8 mouvements ; la couronne blanche revient intacte.';

  @override
  String get introHoldMiddle =>
      'Blanc en bas, jaune en haut. L\'arête devant, sa couleur avant assortie au centre en dessous.';

  @override
  String get introWhyMiddle =>
      'L\'algorithme écarte l\'emplacement, glisse l\'arête et remet la couronne blanche. Une arête avec du jaune va en haut, jamais au milieu.';

  @override
  String get introHowYellowCross =>
      'Regardez seulement les arêtes jaunes du dessus : un point, un L ou une ligne.\nTenez le L en arrière à gauche, la ligne de gauche à droite, et faites F R U R\' U\' F\'.\nLa ligne demande une fois, le L deux, le point jusqu\'à trois.';

  @override
  String get introHoldYellowCross =>
      'Blanc en bas, jaune en haut. Le L en arrière à gauche, la ligne de gauche à droite ; le point, n\'importe comment.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' retourne deux arêtes du haut à la fois sans toucher aux deux premières couronnes.';

  @override
  String get introHowYellowEdges =>
      'Tournez le dessus jusqu\'à ce que deux arêtes correspondent à leurs centres.\nTenez-les derrière et à droite, puis faites R U R\' U R U2 R\' U.\nSi les deux bonnes arêtes sont opposées, faites-le d\'abord une fois de n\'importe quel côté.';

  @override
  String get introHoldYellowEdges =>
      'Jaune en haut. Une bonne arête derrière et l\'autre à droite.';

  @override
  String get introWhyYellowEdges =>
      'Cet algorithme ne bouge que des pièces du haut, donc les deux premières couronnes reviennent toujours.';

  @override
  String get introHowYellowCorners =>
      'Un coin est placé quand ses couleurs correspondent aux trois centres autour, même s\'il est mal orienté.\nGardez un coin placé devant à droite.\nU R U\' L\' U R\' U\' L fait tourner les trois autres ; répétez jusqu\'à ce qu\'ils soient tous placés.';

  @override
  String get introHoldYellowCorners =>
      'Jaune en haut. Un coin déjà placé devant à droite ; s\'il n\'y en a pas, n\'importe lequel.';

  @override
  String get introWhyYellowCorners =>
      'Il fait tourner trois coins en cercle et laisse en place celui de devant à droite : chaque répétition place davantage de coins.';

  @override
  String get introHowTwistCorners =>
      'Tenez un coin non résolu devant à droite.\nRépétez R\' D\' R D par paires jusqu\'à ce que son jaune soit en haut.\nTournez seulement le dessus pour le suivant ; le bas revient avec le dernier coin.';

  @override
  String get introHoldTwistCorners =>
      'Jaune en haut, le coin à orienter devant à droite. Entre deux coins, tournez seulement le dessus, jamais tout le cube.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D oriente le coin et mélange le bas, mais le bas revient une fois tous les coins orientés. S\'arrêter en route le laisse cassé.';

  @override
  String get introHowCfopIntro =>
      'Croix : quatre arêtes planifiées pendant l\'inspection.\nF2L : chaque coin entre avec son arête.\nL\'OLL rend le dessus jaune, puis la PLL remet les pièces en place.';

  @override
  String get introHoldCfopIntro =>
      'Les speedcubers font la croix en bas pour anticiper les pièces suivantes pendant qu\'ils tournent.';

  @override
  String get introWhyCfopIntro =>
      'Résoudre un coin avec son arête économise beaucoup de mouvements, et reconnaître les cas remplace les essais au hasard.';

  @override
  String get introHowF2l =>
      'Trouvez un coin et son arête dans la couche du haut.\nAssociez-les au-dessus de leur emplacement.\nInsérez la paire en trois ou quatre mouvements.';

  @override
  String get introHoldF2l =>
      'Croix en bas. L\'emplacement de la paire devant à droite, ou devant à gauche pour le miroir.';

  @override
  String get introWhyF2l =>
      'Un coin et son arête appariés entrent ensemble : deux couronnes avancent à la fois au lieu d\'une pièce à la fois.';

  @override
  String get introHowOll =>
      'D\'abord la croix jaune avec F R U R\' U\' F\'.\nPuis orientez les coins, par exemple avec le Sune.\nReconnaissez le cas au jaune que vous voyez.';

  @override
  String get introHoldOll =>
      'Jaune en haut. Pour Sune, le seul coin dont le jaune est en haut va devant à gauche.';

  @override
  String get introWhyOll =>
      'Séparer la dernière couronne en orientation puis permutation garde peu d\'algorithmes à apprendre.';

  @override
  String get introHowPll =>
      'Le dessus est déjà entièrement jaune.\nLa T-perm échange des coins ; la U-perm fait tourner trois arêtes.\nLisez les couleurs des côtés pour choisir l\'algorithme.';

  @override
  String get introHoldPll =>
      'Jaune en haut. T-perm : phares à gauche. U-perm : le côté fini derrière.';

  @override
  String get introWhyPll =>
      'Une fois le dessus tout jaune, seules les places des pièces sont fausses, et quelques échanges finissent le cube.';

  @override
  String get introHowTwoFirst =>
      'Choisissez un coin blanc comme repère, blanc vers le bas.\nAmenez chaque coin suivant au-dessus de sa place, devant à droite.\nRépétez R U R\' U\' jusqu\'à ce qu\'il entre avec les couleurs latérales assorties.';

  @override
  String get introHoldTwoFirst =>
      'Blanc en bas. La place vide devant à droite, son coin juste au-dessus dans la couronne du haut.';

  @override
  String get introWhyTwoFirst =>
      'Un 2×2 n\'a pas de centres : le premier coin placé fixe les couleurs de ses voisins, donc les côtés comptent, pas seulement le blanc.';

  @override
  String get introHowTwoOll =>
      'Comptez les coins dont le jaune est en haut.\nS\'il y en a un, placez-le devant à gauche et faites Sune : R U R\' U R U2 R\'.\nRecomptez et recommencez ; trois Sune au maximum.';

  @override
  String get introHoldTwoOll =>
      'Blanc en bas, jaune en haut. Avant chaque Sune, le coin dont le jaune est en haut devant à gauche.';

  @override
  String get introWhyTwoOll =>
      'Sune oriente les coins du haut sans casser la couronne blanche ; recompter vous dit comment le tenir ensuite.';

  @override
  String get introHowTwoPbl =>
      'Cherchez des phares : deux stickers identiques en haut d\'un même côté.\nDes phares d\'un côté : mettez-les à gauche et faites la T-perm.\nPas de phares : faites la Y-perm de n\'importe quel côté, puis alignez le dessus.';

  @override
  String get introHoldTwoPbl =>
      'Blanc en bas, jaune en haut. T-perm : phares à gauche. Y-perm : n\'importe quel côté face à vous.';

  @override
  String get introWhyTwoPbl =>
      'Avec le dessus jaune, seules les places des coins sont fausses : la T-perm échange deux voisins, la Y-perm deux en diagonale.';

  @override
  String get introHowBigIntro =>
      'Aucun centre n\'est fixe : quatre pièces centrales forment la couleur de chaque face.\nLes tours larges comme Rw tournent deux couches à la fois.\nLes tours internes comme 2R tournent une seule tranche intérieure.';

  @override
  String get introHoldBigIntro =>
      'Au début, comme vous voulez : sur un 4×4 aucun centre n\'est fixe, vous choisissez où va chaque couleur.';

  @override
  String get introWhyBigIntro =>
      'La réduction regroupe centres et pièces d\'arête pour résoudre le grand cube comme un 3×3.';

  @override
  String get introHowBigCenters =>
      'Vérifiez d\'abord l\'ordre des couleurs sur un coin.\nConstruisez deux centres opposés, puis les quatre autres.\nLes tranches intérieures déplacent les centres ; refermez toujours une tranche ouverte.';

  @override
  String get introHoldBigCenters =>
      'La face en construction devant, les centres finis à gauche et à droite, hors du chemin.';

  @override
  String get introWhyBigCenters =>
      'Une tranche déplace des centres et l\'annuler remet les centres finis : seule la pièce visée change.';

  @override
  String get introHowBigEdges =>
      'Trouvez les deux ailes aux deux mêmes couleurs.\nAlignez-les devant et réunissez-les avec Uw\'.\nÉchangez avec une arête non appariée, puis Uw remet les centres.';

  @override
  String get introHoldBigEdges =>
      'L\'arête à apparier dans les couches avant ; les arêtes finies rangées en haut et en bas.';

  @override
  String get introWhyBigEdges =>
      'Uw\' écarte les centres pour que deux ailes se rejoignent ; Uw les remet et votre travail reste intact.';

  @override
  String get introHowBigParity =>
      'Résolvez le 4×4 comme un 3×3 jusqu\'au blocage.\nUne arête retournée : le long algorithme de parité OLL.\nDeux arêtes échangées : 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'La dernière couronne en haut. Parité OLL : l\'arête retournée devant. Parité PLL : les arêtes échangées devant et derrière.';

  @override
  String get introWhyBigParity =>
      'Les ailes peuvent atteindre des états impossibles sur un 3×3 ; ces algorithmes tournent des tranches intérieures pour annuler exactement cela.';

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
  String get dailyShowMoves => 'Afficher les mouvements en texte';

  @override
  String get dailyHideMoves => 'Masquer les mouvements en texte';

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
  String get introHoldFiveIntro =>
      'Comme vous voulez : sur un 5×5 le milieu de chaque face ne bouge jamais, il montre sa couleur.';

  @override
  String get introWhyFiveIntro =>
      'Les centres fixes imposent le schéma de couleurs : impossible de construire les centres dans le mauvais ordre.';

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
      'Partez de la pièce centrale fixe : elle donne la couleur.\nFaites des barres de trois et glissez-les avec une tranche intérieure.\nLe mouvement qui fait entrer la barre remet aussi le centre fini.';

  @override
  String get introHoldFiveCenters =>
      'Le centre en construction devant ou en haut ; les centres finis en bas, à gauche ou à droite.';

  @override
  String get introWhyFiveCenters =>
      'Tranche, dessus, tranche retour : la tranche qui fait entrer la barre remet aussi les centres finis.';

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
      'Associez chaque aile à son arête du milieu, devant.\nTournez la tranche intérieure, échangez avec une arête non résolue, puis revenez.\nPour les dernières arêtes : tranche, retournement, tranche.';

  @override
  String get introHoldFiveEdges =>
      'L\'arête en construction devant ; les arêtes finies rangées dans les couches du haut et du bas.';

  @override
  String get introWhyFiveEdges =>
      'Ouvrir puis refermer la tranche intérieure réunit des ailes, et centres et arêtes rangées reviennent.';

  @override
  String get lessonFiveSolve => 'Résoudre le 5×5 comme un 3×3';

  @override
  String get lessonFiveSolveDesc => 'Finissez avec les trois couronnes.';

  @override
  String get introGoalFiveSolve =>
      'Résolvez le 5×5 réduit comme un 3×3, couronne par couronne, avec des tours extérieurs uniquement.';

  @override
  String get introHowFiveSolve =>
      'Désormais, tours extérieurs uniquement, sinon les arêtes appariées se séparent.\nCroix et coins blancs, la couronne du milieu, puis la couronne jaune.\nLes centres fixes montrent la couleur de chaque face.';

  @override
  String get introHoldFiveSolve =>
      'La couleur de la première couronne en bas, comme sur un 3×3 ; le coin à insérer devant à droite.';

  @override
  String get introWhyFiveSolve =>
      'Des tours intérieurs sépareraient à nouveau centres et arêtes ; les tours extérieurs traitent chaque bloc comme une pièce de 3×3.';

  @override
  String get lessonFiveParity => 'Parité des arêtes du 5×5';

  @override
  String get lessonFiveParityDesc =>
      'Réparez l\'arête dont les ailes sont échangées.';

  @override
  String get introGoalFiveParity =>
      'Corrigez la seule arête dont les deux ailes extérieures sont échangées : l\'unique parité du 5×5.';

  @override
  String get introHowFiveParity =>
      'Elle apparaît comme une dernière arête qui semble retournée.\nJouez une fois la longue correction en tranches intérieures.\nIl n\'y a pas de parité PLL sur un 5×5.';

  @override
  String get introHoldFiveParity =>
      'La dernière couronne en haut, l\'arête aux ailes échangées devant, dans la couronne du haut.';

  @override
  String get introWhyFiveParity =>
      'Sur un 5×5, seules les deux ailes extérieures d\'une arête peuvent s\'échanger : un seul algorithme suffit.';

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
  String get introHoldSixIntro =>
      'Au début, comme vous voulez : comme le 4×4, le 6×6 n\'a pas de centre fixe.';

  @override
  String get introWhySixIntro =>
      'Si vous résolvez un 4×4 et un 5×5, le 6×6 est la même réduction avec de plus gros blocs.';

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
      'Vérifiez d\'abord l\'ordre des couleurs sur un coin : aucun centre n\'est fixe.\nFaites des barres de quatre et réunissez-les.\nPour les deux derniers centres, déplacez les pièces une à une : tranche, dessus, annuler.';

  @override
  String get introHoldSixCenters =>
      'La face en construction devant, les centres finis à gauche, à droite ou en bas.';

  @override
  String get introWhySixCenters =>
      'Les barres se rejoignent par des tranches intérieures, chacune annulée : les centres finis restent entiers.';

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
      'Alignez devant les ailes extérieures et intérieures d\'une arête.\nLa couche large profonde fait entrer et sortir une arête.\nNe cassez jamais une arête finie pour libérer une pièce.';

  @override
  String get introHoldSixEdges =>
      'L\'arête en construction devant ; les arêtes finies rangées en haut et en bas.';

  @override
  String get introWhySixEdges =>
      'Le tour large profond écarte les centres pour que les ailes se rejoignent, puis les remet.';

  @override
  String get lessonSixSolve => 'Résoudre le 6×6 comme un 3×3';

  @override
  String get lessonSixSolveDesc => 'Finissez avec les trois couronnes.';

  @override
  String get introGoalSixSolve =>
      'Résolvez le 6×6 réduit comme un 3×3, couronne par couronne, avec des tours extérieurs uniquement.';

  @override
  String get introHowSixSolve =>
      'Désormais, tours extérieurs uniquement : une tranche casserait un centre ou une arête.\nLes centres construits montrent la couleur de chaque face.\nCroix et coins blancs, la couronne du milieu, puis la couronne jaune.';

  @override
  String get introHoldSixSolve =>
      'La couleur de la première couronne en bas, comme sur un 3×3 ; le coin à insérer devant à droite.';

  @override
  String get introWhySixSolve =>
      'Les tours extérieurs déplacent chaque centre 4×4 et chaque arête d\'un seul bloc, comme sur un 3×3.';

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
      'Résolvez comme un 3×3 jusqu\'au blocage.\nUne arête retournée : la longue correction avec 3Rw.\nDeux arêtes échangées : la courte correction en doubles tours intérieurs.';

  @override
  String get introHoldSixParity =>
      'La dernière couronne en haut. L\'arête retournée devant ; pour deux arêtes échangées, devant et derrière.';

  @override
  String get introWhySixParity =>
      'Comme le 4×4, le 6×6 peut finir avec une arête retournée ou deux arêtes échangées ; des algorithmes en tranches intérieures les corrigent sans toucher au reste.';

  @override
  String get stepFivePieces => 'Les pièces du 5×5';

  @override
  String get stepFivePiecesBody =>
      'La pièce du milieu de chaque face ne bouge jamais, donc le schéma de couleurs ne peut pas être faux. Autour, huit pièces centrales : centres de coin et centres d\'arête ne changent jamais de type. Chaque arête est une pièce du milieu avec deux ailes.';

  @override
  String get stepFiveSlices => 'Trois sortes de tours';

  @override
  String get stepFiveSlicesBody =>
      'Un tour extérieur tourne une face. Un tour large tourne une face avec la couche derrière elle. Un tour de tranche intérieure ne tourne qu\'une couche intérieure : c\'est ainsi que les pièces changent de place sans toucher l\'extérieur.';

  @override
  String get stepFiveCenterBar => 'Barres de centre';

  @override
  String get stepFiveCenterBarBody =>
      'Formez une rangée de trois pièces centrales assorties, faites-la entrer avec une tranche intérieure, tournez le dessus et revenez : le mouvement qui fait entrer la barre remet aussi le centre fini. Trois barres font un centre.';

  @override
  String get stepFiveCenterSwap => 'Échanger sans casser';

  @override
  String get stepFiveCenterSwapBody =>
      'Pour déplacer une seule pièce de centre : tournez une tranche intérieure, tournez le haut, annulez la tranche et remettez le haut. Les centres finis reviennent à chaque fois.';

  @override
  String get stepFiveEdgePair => 'Apparier les ailes à l\'arête du milieu';

  @override
  String get stepFiveEdgePairBody =>
      'Alignez une aile à côté de son arête du milieu devant, descendez la tranche intérieure, échangez avec une arête non résolue grâce à une courte gâchette, puis remontez la tranche.';

  @override
  String get stepFiveEdgeLast => 'Les dernières arêtes';

  @override
  String get stepFiveEdgeLastBody =>
      'Plus d\'arête libre à faire entrer ? Utilisez tranche, retournement, tranche : un tour large, une courte gâchette et le tour large retour apparient les dernières arêtes sans casser les arêtes finies.';

  @override
  String get stepFiveAsThree => 'C\'est maintenant un 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Centres et arêtes faits, le 5×5 se comporte comme un grand 3×3. Utilisez seulement des tours extérieurs et avancez couronne par couronne : croix et coins blancs, la couronne du milieu, puis la jaune. Le 5×5 n\'a pas de parité PLL.';

  @override
  String get stepFiveEdgeParity => 'Échanger les ailes de la dernière arête';

  @override
  String get stepFiveEdgeParityBody =>
      'Parfois la dernière arête a ses deux ailes extérieures échangées et paraît retournée : c\'est l\'unique parité du 5×5. Tenez-la devant, dans la couronne du haut, et jouez une fois l\'algorithme en tranches intérieures ; tout le reste revient en place.';

  @override
  String get stepSixPieces => 'Les pièces du 6×6';

  @override
  String get stepSixPiecesBody =>
      'Comme un 4×4, un 6×6 n\'a pas de centre fixe : seize pièces centrales forment chaque couleur, vérifiez donc d\'abord l\'ordre des couleurs sur un coin. Chaque arête a quatre ailes : deux extérieures et deux intérieures.';

  @override
  String get stepSixSlices => 'Tourner des couches plus profondes';

  @override
  String get stepSixSlicesBody =>
      'Les tours larges peuvent bouger deux ou trois couches depuis une face. Les tranches intérieures de deuxième ou troisième couche sont les outils des centres et des arêtes.';

  @override
  String get stepSixCenterBar => 'Barres de quatre';

  @override
  String get stepSixCenterBarBody =>
      'Formez des rangées de quatre pièces centrales assorties et rapprochez-les avec des tranches intérieures, en annulant chaque tranche, jusqu\'à obtenir un bloc 4×4 d\'une seule couleur.';

  @override
  String get stepSixCenterSwap => 'Une pièce à la fois';

  @override
  String get stepSixCenterSwapBody =>
      'Tournez la troisième tranche, le dessus, annulez, revenez : une pièce centrale bouge et les centres finis reviennent. Utilisez-le pour les deux derniers centres, quand aucune barre ne rentre.';

  @override
  String get stepSixEdgePair => 'Quatre pièces, une arête';

  @override
  String get stepSixEdgePairBody =>
      'Rassemblez les quatre ailes d\'une arête devant avec la couche large profonde, échangez avec une arête non résolue grâce à une courte gâchette, puis ramenez la couche large.';

  @override
  String get stepSixEdgeLast => 'Les dernières arêtes';

  @override
  String get stepSixEdgeLastBody =>
      'Appariez les dernières arêtes avec une courte gâchette entre un tour large profond et son annulation : les arêtes finies restent appariées. Ne cassez jamais une arête finie pour libérer une pièce.';

  @override
  String get stepSixAsThree => 'C\'est maintenant un 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Avec des centres 4×4 et des arêtes appariées, résolvez le 6×6 comme un 3×3, couronne par couronne, en tours extérieurs uniquement. Une arête retournée ou deux échangées à la fin, c\'est la parité, pas une erreur.';

  @override
  String get stepSixOllParity => 'Une arête retournée';

  @override
  String get stepSixOllParityBody =>
      'Une seule arête qui semble retournée dans la dernière couronne, c\'est la parité. Tenez-la devant, dans la couronne du haut, et jouez la longue correction : elle retourne ses quatre ailes, échange aussi les arêtes gauche et droite du haut et ne touche pas aux deux premières couronnes.';

  @override
  String get stepSixPllParity => 'Deux arêtes échangées';

  @override
  String get stepSixPllParityBody =>
      'Si deux arêtes semblent échangées tout à la fin, tenez-les devant et derrière dans la couronne du haut et jouez la courte correction en doubles tours intérieurs : les quatre ailes des deux arêtes s\'échangent.';

  @override
  String get stageTwoFirstLayer => 'Construire la couche du bas';

  @override
  String get stageTwoTopColor => 'Rendre le dessus d\'une seule couleur';

  @override
  String get stageTwoFinish => 'Finir les coins';

  @override
  String get explainTwoFirstLayer =>
      'Complétez la couche du bas : ses quatre coins vont ensemble et avec les couleurs des côtés.';

  @override
  String get explainTwoTopColor =>
      'Tournez jusqu\'à ce que les quatre autocollants du dessus soient de la même couleur, sans casser la couche du bas.';

  @override
  String get explainTwoFinish =>
      'Placez les derniers coins pour finir le cube.';

  @override
  String get tabSolve => 'Résoudre';

  @override
  String get tabScan => 'Scanner';

  @override
  String get tabAcademy => 'Académie';

  @override
  String get tabTrain => 'S\'entraîner';

  @override
  String get openCubeSolver => 'Ouvrir le cube 3D et le solveur';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Entraînement';

  @override
  String get trainSubtitle => 'Affûtez vos compétences chaque jour.';

  @override
  String get settings => 'Paramètres';

  @override
  String get settingsSoundHaptics => 'Son et vibrations';

  @override
  String get settingsSoundHapticsDesc =>
      'Clics et vibrations quand vous tournez le cube.';

  @override
  String get settingsAnimationSpeed => 'Vitesse d\'animation par défaut';

  @override
  String get settingsAnimationSpeedDesc =>
      'La vitesse à laquelle le cube tourne quand les mouvements sont joués.';

  @override
  String get settingsResetProgress => 'Réinitialiser la progression';

  @override
  String get settingsResetProgressDesc =>
      'Efface les leçons terminées de l\'Académie et votre série quotidienne.';

  @override
  String get resetProgressTitle => 'Réinitialiser toute la progression ?';

  @override
  String get resetProgressBody =>
      'Vos leçons terminées et votre série quotidienne seront effacées. Action irréversible.';

  @override
  String get resetProgressDone => 'Progression réinitialisée.';

  @override
  String get cancel => 'Annuler';

  @override
  String get settingsPrivacyAds => 'Confidentialité et publicités';

  @override
  String get settingsPrivacyAdsDesc =>
      'Consultez ou modifiez vos choix de consentement publicitaire.';

  @override
  String get playbackPrevious => 'Précédent';

  @override
  String get playbackNext => 'Suivant';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Résolu en $count mouvements !',
      one: 'Résolu en $count mouvement !',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Façonnez la prochaine version';

  @override
  String get feedbackBody =>
      'Envie de proposer une fonctionnalité ou d\'influencer la prochaine version de CubeMentor ? Écrivez-nous à :';

  @override
  String get feedbackEmailCopied =>
      'Aucune app de messagerie trouvée : l\'adresse a été copiée dans le presse-papiers.';

  @override
  String get adWatchToUnlock => 'Voir une pub';

  @override
  String get adLoading => 'Chargement d\'une courte vidéo…';

  @override
  String get adRewardNotEarned => 'Regardez la vidéo en entier pour débloquer.';

  @override
  String get adUnavailableFreePass =>
      'Aucune vidéo disponible pour l\'instant — débloqué gratuitement cette fois.';

  @override
  String get settingsPrivacyAdsError =>
      'Impossible d\'ouvrir les options de confidentialité. Réessayez plus tard.';

  @override
  String get nicknamePromptTitle => 'Comment devons-nous vous appeler ?';

  @override
  String get nicknamePromptBody =>
      'Nous vous encouragerons par votre prénom à chaque résolution.';

  @override
  String get nicknameHint => 'Votre prénom ou pseudo';

  @override
  String get nicknameSave => 'Enregistrer';

  @override
  String get settingsNickname => 'Votre prénom';

  @override
  String get settingsNicknameNotSet => 'Non défini — touchez pour l\'ajouter';

  @override
  String celebrateNamed(String name) {
    return 'Bravo, $name !';
  }

  @override
  String get celebrateAnon => 'Bravo !';

  @override
  String get celebrateCubeSolved => 'Cube résolu !';

  @override
  String get celebrateDailyDone => 'Défi du jour réussi !';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit mouvements',
      one: '$count / $limit mouvement',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Tout mélange peut se résoudre en $limit mouvements ou moins',
      one: 'Tout mélange peut se résoudre en $limit mouvement ou moins',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Voir la vidéo';

  @override
  String get patternsNotNow => 'Plus tard';

  @override
  String get settingsColorScheme => 'Schéma de couleurs du cube';

  @override
  String get colorSchemeWestern => 'Occidental';

  @override
  String get colorSchemeJapanese => 'Japonais';

  @override
  String get colorSchemeWesternDesc =>
      'Blanc opposé au jaune, bleu opposé au vert';

  @override
  String get colorSchemeJapaneseDesc =>
      'Blanc opposé au bleu, jaune opposé au vert';

  @override
  String dailyYourTime(String time) {
    return 'Votre temps : $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Vous avez $seconds secondes pour inspecter le cube. Touchez pour lancer le compte à rebours.';
  }

  @override
  String get timerInspectTapReady => 'Touchez quand vous êtes prêt à résoudre';

  @override
  String timerInspectPlus2(int seconds) {
    return 'L\'inspection a dépassé $seconds s, le chrono est parti tout seul : pénalité de +2 s';
  }

  @override
  String timerAvgOf(int count) {
    return 'Moyenne de $count';
  }

  @override
  String get timerAvgNote =>
      'Les moyennes écartent le meilleur et le pire temps';

  @override
  String get timerPbSub => 'Meilleur temps';

  @override
  String get timerPlus2Caption => 'Pénalité de +2 s';

  @override
  String get timerDnfCaption => 'Non terminé (DNF)';

  @override
  String get timerDeleteCaption => 'Supprimer cette résolution';

  @override
  String get patternBullsEye => 'Œil de bœuf';

  @override
  String get patternFramedCenter => 'Centre encadré';

  @override
  String get patternBlockCheckerboard => 'Damier de blocs';

  @override
  String get patternCubeInCubeInCube => 'Cube dans un cube dans un cube';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Six T';

  @override
  String get patternTwinPeaks => 'Pics jumeaux';

  @override
  String get patternSpiral => 'Spirale';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Points centraux';

  @override
  String get patternStripes => 'Rayures';

  @override
  String get patternAnaconda => 'Anaconda';

  @override
  String get patternZigzag => 'Zigzag';

  @override
  String get patternFourSpots => 'Quatre points';

  @override
  String get patternGreenMamba => 'Mamba vert';

  @override
  String get patternPlusMinus => 'Plus moins';

  @override
  String guideStepCounter(int current, int total) {
    return 'Étape $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Mouvement $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Mouvement $current / $total';
  }

  @override
  String get dailyStep1Title => 'Étape 1 : mélangez votre cube';

  @override
  String get dailyStep2Title => 'Étape 2 : résolvez le cube';

  @override
  String dailyPersonalBest(String time) {
    return 'Record personnel : $time';
  }

  @override
  String get dailyRecentDays => 'Derniers jours';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Série de $count jours ! Vous êtes en feu !',
      one: 'Série de 1 jour ! Vous êtes en feu !',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Cube mélangé ! À vous de le résoudre';

  @override
  String get dailyCongratsTitle => 'Félicitations !';

  @override
  String dailyCongratsBody(String time) {
    return 'Vous avez résolu le défi du jour en $time.';
  }

  @override
  String get dailyCongratsDone => 'Retour au défi';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count motifs',
      one: '$count motif',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours heures restantes',
      one: '$hours heure restante',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes restantes',
      one: '$minutes minute restante',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'Verrouillé';

  @override
  String get unlockedLabel => 'Déverrouillé';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Regardez 1 courte vidéo pour débloquer ce motif et son guide pas à pas pendant $hours heures.',
      one:
          'Regardez 1 courte vidéo pour débloquer ce motif et son guide pas à pas pendant $hours heure.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Regardez 1 courte vidéo pour ouvrir cette leçon autant de fois que vous voulez pendant les $hours prochaines heures.',
      one: 'Regardez 1 courte vidéo pour ouvrir cette leçon autant de fois que vous voulez pendant l’heure qui vient.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'Résoudre les grands cubes';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Votre résolution gratuite d’un 4×4–6×6 est utilisée. Regardez 1 courte vidéo pour résoudre les grands cubes pendant les $hours prochaines heures.',
      one: 'Votre résolution gratuite d’un 4×4–6×6 est utilisée. Regardez 1 courte vidéo pour résoudre les grands cubes pendant l’heure qui vient.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Demi-tour · 180°';

  @override
  String get homeAcademy => 'Académie';

  @override
  String get homePatterns => 'Motifs sympas';

  @override
  String get homePractice => 'Chrono et défi du jour';

  @override
  String get scanChoiceSubtitle => 'Comment veux-tu commencer ?';

  @override
  String get scanChoiceCamera => 'Scanner avec la caméra';

  @override
  String get scanChoiceCameraDesc =>
      'Montre chaque face à la caméra et obtiens la solution.';

  @override
  String get scanChoice3d => 'Ouvrir le cube 3D';

  @override
  String get scanChoice3dDesc =>
      'Tourne un cube virtuel, mélange-le et résous-le étape par étape.';

  @override
  String get academyAllSizes => 'Toutes les tailles';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total leçons terminées';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total terminées';
  }

  @override
  String get lessonStageConcept => 'Concept';

  @override
  String get lessonStageExamples => 'Exemples';

  @override
  String get lessonStagePractice => 'Pratique';

  @override
  String get lessonStageNext => 'Suite / libre';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Étape $index sur $total : $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Exemple $index sur $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Parcours $index sur $total';
  }

  @override
  String get lessonBonusCase => 'Cas bonus';

  @override
  String get lessonPracticeIntro =>
      'Un vrai mélange : seules les étapes précédentes sont résolues. Terminez toute cette étape, consigne après consigne.';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Passez directement à $lesson.';
  }

  @override
  String get lessonFreePractice => 'Entraînement libre';

  @override
  String get lessonFreePracticeDesc =>
      'Résolvez vous-même un cube 3D mélangé, du début jusqu\'à cette étape.';

  @override
  String freePracticeBanner(String topic) {
    return 'Entraînez-vous librement : résolvez le cube du début jusqu\'à $topic !';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Tournez la face du centre $face dans le sens de la flèche. Le centre ne bouge pas ; seules les pièces autour voyagent.';
  }

  @override
  String cueTrigger(String front) {
    return 'Gâchette main droite, $front face à vous : face droite vers le haut, haut vers la gauche, face droite vers le bas, haut de retour vers la droite.';
  }

  @override
  String get cueTriggerBack =>
      'La sixième gâchette d\'affilée ramène le cube exactement à son état de départ. Six est le chiffre magique !';

  @override
  String cueSliceInner(String face) {
    return 'Tournez seulement la tranche intérieure à côté de la face $face. La face elle-même ne bouge pas, donc les centres se séparent.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Un mouvement large : la face $face et la tranche voisine tournent ensemble, comme une seule couche épaisse.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Tournez tout le cube pour que le centre $top soit en haut et le centre $front face à vous.';
  }

  @override
  String get cueTurnTop =>
      'Tournez seulement la couche du haut, comme l\'indique la flèche, pour préparer l\'algorithme suivant.';

  @override
  String get cueAlignTop =>
      'Dernier mouvement : tournez la couche du haut pour aligner ses couleurs. Terminé !';

  @override
  String cueCrossTop(String piece, String center) {
    return 'L\'arête $piece est dans la couche du haut. Tournez le haut jusqu\'à ce qu\'elle soit juste au-dessus du centre $center, puis tournez cette face deux fois pour la descendre.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'L\'arête $piece est coincée dans la couche du milieu. Remontez-la, alignez-la au-dessus du centre $center, puis descendez-la.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'L\'arête $piece est à sa place mais retournée : son blanc regarde sur le côté. Sortez-la et montez-la, blanc vers le haut, puis redescendez-la à côté du centre $center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'Façon CFOP : le bas peut tourner aussi. Placez l\'arête $piece et tournez le bas pour l\'aligner avec le centre $center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Tournez le haut pour que le coin $piece soit juste au-dessus de son emplacement, entre les côtés $a et $b. Répétez la gâchette main droite jusqu\'à ce qu\'il tombe en place, bien orienté.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'Le coin $piece est à sa place mais mal orienté. Une gâchette le sort (un coin jaune prend sa place) ; continuez à répéter au même endroit jusqu\'à ce qu\'il revienne, blanc en bas. Ne tournez pas le cube pour le poursuivre.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Tournez le haut jusqu\'à aligner l\'arête $piece avec le centre $a, puis envoyez-la en bas à droite, dans l\'emplacement entre $a et $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Tournez le haut jusqu\'à aligner l\'arête $piece avec le centre $a, puis envoyez-la en bas à gauche, dans l\'emplacement entre $a et $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'L\'arête $piece est à sa place mais retournée. Insérez-y une arête jaune pour la faire remonter, puis réinsérez-la entre $a et $b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Une ligne jaune : tournez le haut pour qu\'elle aille de gauche à droite, gardez $front face à vous, puis faites l\'algorithme de la croix jaune.';
  }

  @override
  String cueYellowL(String front) {
    return 'Un L jaune : tournez le haut pour que le L pointe vers l\'arrière gauche, gardez $front face à vous, puis faites l\'algorithme. Il devient une ligne.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Seul le centre est jaune : un point. Appliquez l\'algorithme une fois, $front face à vous, pour obtenir un L. Un point peut demander trois tours, alors continuez.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Tournez le haut jusqu\'à ce que l\'arête $piece corresponde au centre $center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Deux arêtes correctes sont à l\'arrière et à droite. $front face à vous, faites l\'échange : les arêtes avant et gauche permutent.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Les arêtes correctes sont face à face. Faites l\'échange une fois, $front face à vous ; ensuite deux voisines correspondent.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'Le coin $piece est déjà à sa place. Gardez-le en avant à droite, $front face à vous, et permutez les trois autres coins.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Aucun coin jaune n\'est encore à sa place. Faites un cycle, $front face à vous ; ensuite un coin est bien placé.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Orientez le coin $piece devant à droite : répétez la gâchette du bas par paires jusqu\'à ce que son jaune soit en haut. Les couronnes du bas semblent en désordre ; elles reviennent avec le dernier coin !';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Le coin $piece a besoin de quatre gâchettes cette fois. Continuez : le jaune remonte toujours après deux ou quatre.';
  }

  @override
  String get cueTwistNext =>
      'Tournez seulement la couche du haut pour amener le coin mal orienté suivant en avant à droite. Ne tournez pas tout le cube maintenant !';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Associez le coin $piece à l\'arête $edge en haut, puis insérez la paire dans l\'emplacement entre $a et $b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'Le coin $piece est coincé dans son emplacement avec la mauvaise arête. Sortez-le d\'abord en haut, puis formez la paire et insérez-la.';
  }

  @override
  String cueOllSune(String front) {
    return '$front face à vous, faites le Sune pour orienter les coins jaunes vers le haut.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Un seul Sune ne suffisait pas cette fois. Tournez le haut et refaites le Sune, $front face à vous.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Deux coins doivent permuter. Gardez la paire assortie (les « phares ») à gauche, $front face à vous, et faites la T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Les coins sont faits. Gardez l\'arête $piece à l\'arrière et permutez les trois autres arêtes avec la U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'Aucune arête du haut ne correspond encore à son centre. Faites la U-perm une fois depuis n\'importe quel côté ; ensuite une arête correspond.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Deux coins voisins du haut doivent permuter. Gardez la paire assortie à gauche, $front face à vous, et faites l\'échange.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Les deux coins à échanger sont en diagonale. Faites l\'échange diagonal, $front face à vous.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Ramenez la pièce de centre $color égarée avec le 3-cycle de centres : tranche, haut, tranche, puis tout en arrière.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Toute une barre de pièces de centre $color est sur la mauvaise face. Soulevez-la avec la tranche, tournez le haut et ramenez-la chez elle.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Associez les deux pièces d\'arête $piece : alignez-les, tournez la tranche, échangez une arête non appariée avec les mouvements main droite, puis remettez la tranche.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Les dernières arêtes : appariez l\'arête $piece avec l\'algorithme des deux dernières arêtes, qui garde intactes toutes les arêtes finies.';
  }

  @override
  String cueParityOll(String front) {
    return 'Parité OLL : une arête du haut est retournée, ce qui n\'arrive jamais sur un 3×3. Gardez-la devant, $front face à vous, et appliquez la correction de parité avant tout OLL normal.';
  }

  @override
  String get cueParityPll =>
      'Parité PLL : deux arêtes du haut sont échangées, ce qui n\'arrive jamais sur un 3×3. Gardez-les devant et derrière, appliquez l\'échange de parité, puis alignez le dessus.';

  @override
  String cueParityFive(String front) {
    return 'Parité d\'arête : les deux ailes extérieures d\'une arête sont échangées, l\'unique parité du 5×5. Gardez cette arête devant, $front face à vous, et appliquez la correction une fois.';
  }

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingStart => 'Commencer';

  @override
  String get onboardingWhatTitle => 'Votre compagnon de cube';

  @override
  String get onboardingWhatBody =>
      'CubeMentor vous aide à résoudre, apprendre et pratiquer tous les cubes du 2×2 au 6×6, entièrement hors ligne.';

  @override
  String get onboardingScanTitle => 'Scannez et résolvez en quelques secondes';

  @override
  String get onboardingScanBody =>
      'Montrez chaque face à la caméra (ou saisissez les couleurs) et suivez la solution en 3D mouvement par mouvement.';

  @override
  String get onboardingLearnTitle => 'Apprenez et jouez';

  @override
  String get onboardingLearnBody =>
      'Maîtrisez la méthode des 3 couronnes à l’Académie, puis tournez, mélangez et résolvez librement dans le Bac à sable 3D.';

  @override
  String get scanChoiceManualDesc =>
      'Saisissez les couleurs de chaque face, autocollant par autocollant.';

  @override
  String get scanTryAgain => 'Réessayer';

  @override
  String get scanEditManually => 'Corriger les couleurs à la main';

  @override
  String get scanLightingHint =>
      'Centrez la face dans la grille. Utilisez une lumière vive et uniforme et évitez les reflets.';

  @override
  String get crownExplain =>
      'Une couronne est une couche horizontale du cube : la première couronne est la couche blanche en bas, la deuxième est la couche du milieu et la troisième est la couche jaune en haut.';

  @override
  String get lessonObjectiveHeading => 'Objectif d’apprentissage';

  @override
  String get dirRowTop => 'Rangée du haut de la face avant';

  @override
  String get dirRowBottom => 'Rangée du bas de la face avant';

  @override
  String get dirColumnRight => 'Colonne de droite de la face avant';

  @override
  String get dirColumnLeft => 'Colonne de gauche de la face avant';

  @override
  String get solveChoiceTitle => 'Comment voulez-vous le résoudre ?';

  @override
  String get solveChoiceFastDesc =>
      'La solution la plus courte, mouvement par mouvement.';

  @override
  String get solveChoiceGuidedDesc =>
      'Apprenez la méthode des 3 couronnes étape par étape.';

  @override
  String get guidedSolvedTitle => 'Résolu !';

  @override
  String get guidedSolvedBody =>
      'Vous avez suivi chaque étape et résolu le cube.';

  @override
  String get solveAgain => 'Résoudre à nouveau';

  @override
  String get backToHome => 'Retour à l’accueil';

  @override
  String get dailyStatTime => 'Temps du jour';

  @override
  String get dailyStatBest => 'Record personnel';

  @override
  String get dailyStatStreak => 'Série actuelle';

  @override
  String get dailyStatBestStreak => 'Meilleure série';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get settingsPrivacyPolicyDesc =>
      'Ce que CubeMentor enregistre et ce qu’utilisent les publicités.';

  @override
  String get privacyIntro =>
      'CubeMentor fonctionne sans compte et sans serveurs à lui. Cette page explique ce qui reste sur votre appareil et ce qu’utilise notre partenaire publicitaire.';

  @override
  String get privacyDataTitle => 'Vos données restent sur votre appareil';

  @override
  String get privacyDataBody =>
      'Votre langue, vos réglages, votre progression dans les leçons, vos temps et votre série quotidienne sont enregistrés uniquement sur cet appareil. Nous n’avons pas de serveurs, nous ne les recevons donc jamais. Désinstaller l’app les supprime.';

  @override
  String get privacyCameraTitle => 'Caméra';

  @override
  String get privacyCameraBody =>
      'La caméra n’est utilisée que pendant le scan d’un cube. Les images sont analysées sur votre appareil pour lire les couleurs des autocollants ; aucune photo ni vidéo n’est enregistrée ou envoyée.';

  @override
  String get privacyAdsTitle => 'Publicités';

  @override
  String get privacyAdsBody =>
      'L’app affiche des publicités Google AdMob. Google peut utiliser des identifiants de l’appareil et des données d’interaction publicitaire pour afficher et mesurer les annonces, comme décrit dans la politique de confidentialité de Google. Là où la loi l’exige, votre consentement est d’abord demandé et vous pouvez le modifier dans les Réglages.';

  @override
  String get privacyContactTitle => 'Contact';

  @override
  String privacyContactBody(String email) {
    return 'Des questions sur la confidentialité ? Écrivez-nous à $email.';
  }
}
