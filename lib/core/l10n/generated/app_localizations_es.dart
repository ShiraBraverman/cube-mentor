// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Escanea, resuelve y domina cualquier cubo, del 2×2 al 6×6.';

  @override
  String get chooseCubeSize => 'Elige tu cubo';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Principiante';

  @override
  String get cubeLevel3 => 'Clásico';

  @override
  String get cubeLevel4 => 'Avanzado';

  @override
  String get cubeLevel5 => 'Experto';

  @override
  String get cubeLevel6 => 'Maestro';

  @override
  String get cubeComingSoon => 'Nuevo cubo muy pronto';

  @override
  String get carouselPrevious => 'Cubo anterior';

  @override
  String get carouselNext => 'Cubo siguiente';

  @override
  String get chooseMode => '¿Qué quieres hacer?';

  @override
  String get modePlayground => 'Zona 3D';

  @override
  String get modePlaygroundDesc =>
      'Gira capas, mezcla y repite movimientos en 3D.';

  @override
  String get modeScanSolve => 'Escanear y resolver';

  @override
  String get modeScanSolveDesc =>
      'Escanea tu cubo con la cámara y obtén una solución.';

  @override
  String get modeAcademy => 'Academia';

  @override
  String get modeAcademyDesc =>
      'Aprende paso a paso con lecciones interactivas.';

  @override
  String get language => 'Idioma';

  @override
  String get languageSearch => 'Buscar idioma';

  @override
  String get languageNoResults => 'Ningún idioma coincide con tu búsqueda.';

  @override
  String playgroundTitle(int size) {
    return 'Zona 3D $size×$size';
  }

  @override
  String get scramble => 'Mezclar';

  @override
  String get reset => 'Reiniciar';

  @override
  String get undo => 'Deshacer';

  @override
  String get speed => 'Velocidad';

  @override
  String get xray => 'Rayos X';

  @override
  String get prime => 'Prima';

  @override
  String get wide => 'Doble';

  @override
  String layer(int index) {
    return 'Capa $index';
  }

  @override
  String get cubeRotations => 'Rotaciones';

  @override
  String get play => 'Reproducir';

  @override
  String get pause => 'Pausa';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count movimientos',
      one: '1 movimiento',
      zero: 'Sin movimientos',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Resuelto';

  @override
  String get scrambled => 'Mezclado';

  @override
  String get orbitHint =>
      'Arrastra una fila para girarla · Arrastra el fondo para rotar la vista';

  @override
  String get notationPad => 'Teclado de notación';

  @override
  String get solve => 'Resolver';

  @override
  String get solving => 'Resolviendo…';

  @override
  String get solveFast => 'Solución rápida';

  @override
  String get solveLearn => 'Aprender paso a paso';

  @override
  String get solveModeGuided => 'Guiado (3 capas)';

  @override
  String get solveModeFast => 'Rápido (óptimo)';

  @override
  String solveUnavailable(int size) {
    return 'El solucionador de $size×$size llegará en una actualización futura.';
  }

  @override
  String get solveAlreadySolved => 'El cubo ya está resuelto.';

  @override
  String solveFailed(String reason) {
    return 'Este cubo no se puede resolver ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'El motor de resolución no está disponible en este dispositivo.';

  @override
  String get solveComplete => '¡Resuelto! Buen trabajo.';

  @override
  String solveSummary(int count) {
    return '$count movimientos';
  }

  @override
  String get nextMove => 'Siguiente movimiento';

  @override
  String get previousMove => 'Movimiento anterior';

  @override
  String get halfTurnHalfway =>
      '¡Bien, ya vas por la mitad! Gírala una vez más en el mismo sentido para completar el medio giro (180°).';

  @override
  String get wideTurnInner =>
      '¡Genial! Ahora desliza la capa interior contigua para completar el giro doble.';

  @override
  String get wideTurnOuter =>
      '¡Genial! Ahora desliza la capa exterior contigua para completar el giro doble.';

  @override
  String get wideTurnMore =>
      '¡Genial! Sigue deslizando las capas una a una, siguiendo la flecha, para completar el giro doble.';

  @override
  String get guideSwipeHint =>
      'Desliza la capa que marca la flecha en su dirección o toca Siguiente.';

  @override
  String get guideRotateHint =>
      'Gira el cubo entero como indica la flecha: toca Siguiente.';

  @override
  String get guideWrongMove => 'Sigue la flecha resaltada';

  @override
  String get guideExit => 'Salir de la guía';

  @override
  String get colorWhite => 'blanco';

  @override
  String get colorYellow => 'amarillo';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'azul';

  @override
  String get colorRed => 'rojo';

  @override
  String get colorOrange => 'naranja';

  @override
  String get phaseOptimal2x2 => 'Solución óptima';

  @override
  String get phaseKociemba1 => 'Fase 1 · Orientar las piezas';

  @override
  String get phaseKociemba2 => 'Fase 2 · Terminar el cubo';

  @override
  String get phaseLblCross => 'Cruz blanca';

  @override
  String get phaseLblCorners => 'Esquinas de la primera capa';

  @override
  String get phaseLblMiddle => 'Aristas de la capa media';

  @override
  String get phaseLblYellowCross => 'Cruz amarilla';

  @override
  String get phaseLblYellowEdges => 'Alinear las aristas de la cruz amarilla';

  @override
  String get phaseLblYellowCorners => 'Colocar las esquinas amarillas';

  @override
  String get phaseLblYellowCornersOrient => 'Orientar las esquinas amarillas';

  @override
  String get crownFirst => 'Primera capa';

  @override
  String get crownSecond => 'Segunda capa';

  @override
  String get crownThird => 'Tercera capa';

  @override
  String get crownFirstGoal => 'Cara blanca y primera capa';

  @override
  String get crownSecondGoal => 'Capa media';

  @override
  String get crownThirdGoal => 'Cara amarilla y última capa';

  @override
  String get subStepGoal11 =>
      'Forma una cruz blanca en la que cada arista blanca coincida también con el centro de al lado.';

  @override
  String get subStepGoal12 =>
      'Mete las 4 esquinas blancas en sus huecos para terminar la cara blanca y toda la primera capa.';

  @override
  String get subStepGoal21 =>
      'Mete las 4 aristas de la capa media sin deshacer la primera capa.';

  @override
  String get subStepGoal31 => 'Forma una cruz amarilla en la última capa.';

  @override
  String get subStepGoal32 =>
      'Intercambia las aristas de la cruz amarilla hasta que cada una coincida con su centro lateral.';

  @override
  String get subStepGoal33 =>
      'Lleva las 4 esquinas amarillas a su sitio, aunque todavía estén giradas.';

  @override
  String get subStepGoal34 =>
      'Gira cada esquina amarilla en su sitio hasta que todas las pegatinas coincidan y el cubo quede resuelto.';

  @override
  String get explainOptimal2x2 =>
      'La solución más corta posible, encontrada buscando entre todas las posiciones del 2×2.';

  @override
  String get explainKociemba1 =>
      'Orienta todas las piezas y lleva las aristas de la capa media a la capa media.';

  @override
  String get explainKociemba2 =>
      'Termina solo con U, D y medios giros, que conservan esa orientación.';

  @override
  String get explainLblOrient =>
      'Gira el cubo entero para que el centro blanco quede abajo.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Baja la arista $piece junto al centro blanco, con su color lateral coincidiendo.';
  }

  @override
  String explainLblDaisyPetal(String piece) {
    return 'Margarita: sube la arista $piece alrededor del centro amarillo, con el blanco hacia arriba, como un pétalo.';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return 'Gira la capa superior hasta que el pétalo $piece quede justo encima del centro de su color lateral.';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return 'Gira esa cara dos veces (180°) para bajar la arista $piece al centro blanco: un brazo más de la cruz blanca.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'La esquina $piece está atascada en el lugar equivocado. Súbela con R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Gira la capa superior hasta que la esquina $piece quede encima de su hueco.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Repite R U R\' U\' hasta que la esquina $piece encaje en su sitio.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'La arista $piece está en la capa media pero mal colocada. Sácala hacia arriba.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Gira la capa superior para que el color lateral de la arista $piece coincida con su centro.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Inserta la arista $piece a la derecha: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Inserta la arista $piece a la izquierda: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Gira la capa superior para colocar la figura amarilla antes del siguiente algoritmo.';

  @override
  String get explainLblYellowCrossAlg =>
      'Forma la cruz amarilla con F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Gira la capa superior para alinear las aristas amarillas con sus centros.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Intercambia aristas amarillas con R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Rota las esquinas amarillas hacia sus lugares con U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Gira la capa superior para llevar la siguiente esquina amarilla sin resolver a la posición delantera derecha.';

  @override
  String get explainLblCornerTwist =>
      'Repite R\' D\' R D hasta que el amarillo mire hacia arriba. La capa inferior se arregla sola al final.';

  @override
  String get explainLblFinalAlign =>
      'Gira la capa superior para terminar el cubo.';

  @override
  String scanTitle(int size) {
    return 'Escanear $size×$size';
  }

  @override
  String get scanManualInput => 'Introducir colores a mano';

  @override
  String get scanUseCamera => 'Escanear con la cámara';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Cara $current de $total';
  }

  @override
  String get faceUp => 'Cara superior';

  @override
  String get faceRight => 'Cara derecha';

  @override
  String get faceFront => 'Cara frontal';

  @override
  String get faceDown => 'Cara inferior';

  @override
  String get faceLeft => 'Cara izquierda';

  @override
  String get faceBack => 'Cara trasera';

  @override
  String get scanHintFront =>
      'Sujeta el cubo con cualquier cara hacia ti. Esa es tu cara frontal: mantén la misma cara arriba mientras escaneas.';

  @override
  String get scanHintRight =>
      'Desde la cara frontal, gira el cubo entero una vez a la izquierda para que la cara derecha te mire.';

  @override
  String get scanHintBack =>
      'Desde la cara frontal, gira el cubo entero dos veces a la izquierda.';

  @override
  String get scanHintLeft =>
      'Desde la cara frontal, gira el cubo entero una vez a la derecha.';

  @override
  String get scanHintUp =>
      'Desde la cara frontal, inclina la parte superior hacia ti para que mire a la cámara.';

  @override
  String get scanHintDown =>
      'Desde la cara frontal, inclina la parte inferior hacia ti para que mire a la cámara.';

  @override
  String get scanAlignHint =>
      'Llena la cuadrícula con la cara y pulsa el disparador.';

  @override
  String get scanCapture => 'Capturar cara';

  @override
  String get scanTurnLeft => 'Gira el cubo entero hacia la izquierda';

  @override
  String get scanTurnRight => 'Gira el cubo entero hacia la derecha';

  @override
  String get scanTipTop => 'Inclina la parte superior hacia ti';

  @override
  String get scanTipBottom => 'Inclina la parte inferior hacia ti';

  @override
  String get scanGlareTip =>
      'Hay reflejos: inclina un poco el cubo o pon el móvil encima para tapar la luz del techo.';

  @override
  String get scanDimTip =>
      'Muy poca luz: busca un lugar más iluminado o enciende la linterna.';

  @override
  String get scanTorch => 'Linterna';

  @override
  String get scanGuideLabel =>
      'Guía de escaneo: las caras escaneadas aparecen en color. Toca una cara escaneada para volver a escanearla.';

  @override
  String get scanTapToRescan =>
      'Toca una cara escaneada para volver a escanearla.';

  @override
  String get scanCameraMissing =>
      'No se encontró ninguna cámara en este dispositivo.';

  @override
  String get scanCameraDenied =>
      'Se denegó el acceso a la cámara. Aún puedes introducir los colores a mano.';

  @override
  String get scanCameraFailed => 'No se pudo iniciar la cámara.';

  @override
  String get scanAllGood => 'Todas las pegatinas parecen correctas.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pegatinas parecen incorrectas',
      one: '1 pegatina parece incorrecta',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Algo no cuadra';

  @override
  String scanIssueColors(int count) {
    return 'Cada color debe aparecer exactamente $count veces.';
  }

  @override
  String get scanIssueCenters => 'Dos centros tienen el mismo color.';

  @override
  String get scanIssuePieces =>
      'Estas pegatinas forman piezas que no existen en un cubo real.';

  @override
  String get scanIssueTwist =>
      'Una esquina está girada. Revisa las pegatinas de las esquinas.';

  @override
  String get scanIssueFlip =>
      'Una arista está volteada. Revisa las pegatinas de las aristas.';

  @override
  String get scanIssueParity => 'Parece que dos piezas están intercambiadas.';

  @override
  String get scanIssueUnavailable =>
      'La comprobación de colores no está disponible en este dispositivo.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pegatinas eran difíciles de leer: échales un vistazo.',
      one: 'Una pegatina era difícil de leer: échale un vistazo.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Toca una pegatina para cambiar su color · Mantén pulsado para ver la paleta';

  @override
  String get scanRescanFace => 'Volver a escanear una cara';

  @override
  String get scanCancelRescan => 'Volver a los colores';

  @override
  String get scanPaletteTitle => 'Elige un color';

  @override
  String get scanOpen3d => 'Abrir en 3D';

  @override
  String get scanRestart => 'Empezar de nuevo';

  @override
  String get modeTimer => 'Cronómetro';

  @override
  String get modeTimerDesc =>
      'Mezclas, inspección, medias y récords personales.';

  @override
  String get modeDaily => 'Reto diario';

  @override
  String get modeDailyDesc => 'Una mezcla nueva cada día. Mantén tu racha.';

  @override
  String get modePatterns => 'Biblioteca de patrones';

  @override
  String get modePatternsDesc => 'Tablero de ajedrez, superflip y más, en 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Racha de $count días',
      one: 'Racha de 1 día',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Seguir aprendiendo';

  @override
  String get startLearning => 'Empezar a aprender';

  @override
  String lessonOf(int index, int total) {
    return 'Lección $index de $total';
  }

  @override
  String get academyAllDone => '¡Todas las lecciones completadas!';

  @override
  String get academyTitle => 'Academia';

  @override
  String academyProgress(int done, int total) {
    return '$done de $total lecciones completadas';
  }

  @override
  String get lessonAdvanced => 'Avanzado';

  @override
  String lessonPartOf(int index, int total) {
    return 'Parte $index de $total';
  }

  @override
  String get lessonNext => 'Siguiente';

  @override
  String get lessonPrevious => 'Anterior';

  @override
  String get lessonFinish => 'Terminar lección';

  @override
  String get lessonComplete => '¡Lección completada!';

  @override
  String get lessonNextLesson => 'Siguiente lección';

  @override
  String get lessonBackToAcademy => 'Volver a la Academia';

  @override
  String get lessonTryIt =>
      'Tu turno: desliza la capa que indica la flecha o toca Siguiente.';

  @override
  String get lessonLookAround =>
      'Arrastra el fondo para ver el cubo desde todos los lados.';

  @override
  String get lessonDemoDone => '¡Bien! Toca Siguiente para continuar.';

  @override
  String holdPrompt(String top, String front) {
    return 'Sujeta el cubo con el centro $top arriba y el centro $front hacia ti.';
  }

  @override
  String get trackBeginner => '3×3 principiante: capa a capa';

  @override
  String get trackCfop => 'Introducción a CFOP';

  @override
  String get trackTwoByTwo => '2×2 principiante y Ortega';

  @override
  String get trackBigCubes => 'Cubos grandes: reducción y paridad';

  @override
  String moveSentence(String layer, String direction) {
    return 'Gira $layer $direction';
  }

  @override
  String get moveFaceR => 'la cara derecha';

  @override
  String get moveFaceL => 'la cara izquierda';

  @override
  String get moveFaceU => 'la cara superior';

  @override
  String get moveFaceD => 'la cara inferior';

  @override
  String get moveFaceF => 'la cara frontal';

  @override
  String get moveFaceB => 'la cara trasera';

  @override
  String moveLayerInner(int depth, String face) {
    return 'la capa $depth desde $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth capas de profundidad)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'las capas $near–$far desde $face';
  }

  @override
  String get moveLayerMiddle => 'la capa media';

  @override
  String get moveDirUp => 'hacia arriba';

  @override
  String get moveDirDown => 'hacia abajo';

  @override
  String get moveDirLeft => 'hacia la izquierda';

  @override
  String get moveDirRight => 'hacia la derecha';

  @override
  String get moveDirClockwise => 'en sentido horario';

  @override
  String get moveDirCounter => 'en sentido antihorario';

  @override
  String get moveDirBackClockwise => 'en sentido horario, visto desde atrás';

  @override
  String get moveDirBackCounter => 'en sentido antihorario, visto desde atrás';

  @override
  String get moveDirHalf => 'media vuelta (dos veces)';

  @override
  String get moveRotateX => 'Inclina el cubo entero: el frente sube arriba';

  @override
  String get moveRotateXPrime => 'Inclina el cubo entero: el frente baja abajo';

  @override
  String get moveRotateX2 =>
      'Da la vuelta al cubo entero: el frente pasa atrás';

  @override
  String get moveRotateY => 'Gira el cubo entero: el frente va a la izquierda';

  @override
  String get moveRotateYPrime =>
      'Gira el cubo entero: el frente va a la derecha';

  @override
  String get moveRotateY2 =>
      'Gira el cubo entero media vuelta: la parte trasera pasa al frente';

  @override
  String get moveRotateZ =>
      'Rueda el cubo entero en sentido horario: la parte superior va a la derecha';

  @override
  String get moveRotateZPrime =>
      'Rueda el cubo entero en sentido antihorario: la parte superior va a la izquierda';

  @override
  String get moveRotateZ2 =>
      'Pon el cubo entero boca abajo: la parte superior pasa abajo';

  @override
  String get phaseReductionCenters => 'Centros';

  @override
  String get phaseReductionEdges => 'Emparejar aristas';

  @override
  String get phaseReductionEdgeParity => 'Paridad de aristas';

  @override
  String get phaseReductionOllParity => 'Paridad OLL';

  @override
  String get phaseReductionPllParity => 'Paridad PLL';

  @override
  String get explainReductionCenterBlock =>
      'Giros de capas internas que llevan varias piezas de centro a su sitio a la vez.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Lleva una pieza de centro $piece a su cara con un 3-ciclo que no toca los centros terminados.';
  }

  @override
  String get explainReductionParityCenters =>
      'Reconstruye los centros que movió el giro de paridad.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Une las piezas de la arista $piece con un 3-ciclo; los centros siguen resueltos.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Las últimas aristas no se pueden emparejar solo con 3-ciclos (paridad de aristas). Un giro de capa interna lo arregla.';

  @override
  String get explainReductionOllParity =>
      'Paridad OLL: hay una arista volteada, algo imposible en un 3×3. Este algoritmo la vuelve a voltear.';

  @override
  String get explainReductionPllParity =>
      'Paridad PLL: dos aristas están intercambiadas, algo imposible en un 3×3. Este algoritmo las devuelve a su sitio.';

  @override
  String get patternsTitle => 'Biblioteca de patrones';

  @override
  String get patternsHint =>
      'Toca un patrón para verlo y luego síguelo en tu propio cubo.';

  @override
  String get patternCheckerboard => 'Tablero de ajedrez';

  @override
  String get patternCubeInCube => 'Cubo dentro de cubo';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Puntos';

  @override
  String get patternCross => 'Cruz';

  @override
  String get patternPython => 'Pitón';

  @override
  String get phasePattern => 'Forma el patrón';

  @override
  String get explainPatternStep =>
      'Sigue cada movimiento en tu propio cubo. Toca Resolver para volver al estado normal.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Cronómetro';

  @override
  String get timerHoldToStart => 'Mantén pulsado y suelta para empezar';

  @override
  String get timerReleaseToStart => 'Suelta para empezar';

  @override
  String get timerTapToStop => 'Toca en cualquier sitio para parar';

  @override
  String get timerInspectionToggle => 'Inspección de 15 s';

  @override
  String get timerLoadingScramble => 'Generando una mezcla…';

  @override
  String get timerPb => 'Mejor';

  @override
  String get timerSolves => 'Resoluciones';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Eliminar';

  @override
  String get timerHistory => 'Historial';

  @override
  String get timerNoSolves =>
      'Aún no hay resoluciones. ¡Mezcla tu cubo y adelante!';

  @override
  String get timerNewPb => '¡Nuevo récord personal!';

  @override
  String get timerClearHistory => 'Borrar historial';

  @override
  String get timerScrambleHint =>
      'Sujeta el blanco arriba y el verde al frente, y luego mezcla:';

  @override
  String get dailyTitle => 'Reto diario';

  @override
  String dailyFor(String date) {
    return 'Reto del $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Mejor racha: $count';
  }

  @override
  String get dailyDone => '¡Listo por hoy! Vuelve mañana.';

  @override
  String get dailyNotDone =>
      'Resuelve la mezcla de hoy para mantener tu racha.';

  @override
  String get dailySolveVirtual => 'Resolver en el cubo 3D';

  @override
  String get dailyTimeIt => 'Cronometrar en tu cubo';

  @override
  String get dailyHint => 'Pista';

  @override
  String dailyHintText(String moves) {
    return 'Empieza por la cruz blanca: $moves';
  }

  @override
  String get dailyHintFailed => 'No hay ninguna pista disponible ahora mismo.';

  @override
  String get lessonBasics => 'Conoce el cubo';

  @override
  String get lessonBasicsDesc => 'Piezas, caras y nombres de los movimientos.';

  @override
  String get stepBasicsPieces => 'Tres tipos de piezas';

  @override
  String get stepBasicsPiecesBody =>
      'Los centros nunca se mueven y dan su color a cada cara. Las aristas tienen dos colores y las esquinas, tres. Resolver significa llevar cada arista y cada esquina junto a los centros de sus colores.';

  @override
  String get stepBasicsFaces => 'Seis letras de caras';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F y B son las caras derecha, izquierda, superior, inferior, frontal y trasera. Una letra sola significa un cuarto de vuelta en sentido horario, como si miraras esa cara de frente.';

  @override
  String get stepBasicsPrime => 'Giros prima y dobles';

  @override
  String get stepBasicsPrimeBody =>
      'Un apóstrofo (R\') gira al revés, en sentido antihorario. Un 2 (U2) es media vuelta: dos cuartos de vuelta.';

  @override
  String get stepCrossGoal => 'El objetivo';

  @override
  String get stepCrossGoalBody =>
      'Sujeta el amarillo arriba y el verde hacia ti. Primero junta las cuatro aristas blancas alrededor del centro amarillo, con el blanco arriba, como pétalos: es la margarita. Luego cada pétalo baja al centro blanco, con su color lateral igual al centro de al lado.';

  @override
  String get stepCrossTop => 'Arista arriba';

  @override
  String get stepCrossTopBody =>
      'Una arista blanca arriba con el blanco hacia arriba es un pétalo de la margarita. Gira la capa superior hasta que su color lateral quede justo encima del centro del mismo color y dale media vuelta a esa cara (180°) para bajarla al centro blanco.';

  @override
  String get stepCrossMiddle => 'Arista en medio';

  @override
  String get stepCrossMiddleBody =>
      'Una arista atascada en la capa media sube primero: sube su lado, aparta la capa de arriba y baja el lado, así lo ya colocado no se mueve. Ahora es un pétalo arriba: alinéalo y dale media vuelta a esa cara.';

  @override
  String get stepCornersInsert => 'Encima de su sitio';

  @override
  String get stepCornersInsertBody =>
      'Gira la capa superior hasta que la esquina blanca quede justo encima de su hueco, entre los dos centros de sus colores laterales. Aquí basta un giro de arriba y R U\' R\': U la pone sobre su hueco y R U\' R\' la mete con el blanco abajo.';

  @override
  String get stepCornersRepeat => 'Repite el gatillo';

  @override
  String get stepCornersRepeatBody =>
      'Deja el hueco delante a la derecha y repite R U R\' U\' hasta que el blanco mire abajo: una vez si mira a la derecha, tres si mira arriba, cinco si te mira a ti. Mientras, arriba parece un lío; se arregla solo.';

  @override
  String get stepMiddleRight => 'Arista a la derecha';

  @override
  String get stepMiddleRightBody =>
      'Busca una arista de arriba sin amarillo. Gira la capa superior hasta que su color frontal coincida con el centro que tienes delante. Si su color de arriba coincide con el centro derecho, mándala a la derecha: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Arista a la izquierda';

  @override
  String get stepMiddleLeftBody =>
      'Si su color de arriba coincide con el centro izquierdo, usa el espejo: U\' L\' U L U F U\' F\'. La capa blanca vuelve entera cada vez.';

  @override
  String get stepYellowCross => 'Un solo algoritmo';

  @override
  String get stepYellowCrossBody =>
      'Mira solo las aristas amarillas de arriba. Pon la L atrás a la izquierda y la línea de izquierda a derecha, y haz F R U R\' U\' F\'. La línea necesita una vez, la L dos, el punto hasta tres.';

  @override
  String get stepYellowEdges => 'Empareja las aristas';

  @override
  String get stepYellowEdgesBody =>
      'Gira la capa superior hasta que dos aristas coincidan con sus centros. Con una atrás y otra a la derecha, R U R\' U R U2 R\' U intercambia la de delante y la de la izquierda.';

  @override
  String get stepPlaceCorners => 'Colócalas';

  @override
  String get stepPlaceCornersBody =>
      'Una esquina está en su sitio cuando sus colores coinciden con los tres centros que la rodean, aunque esté girada. Pon una así delante a la derecha: U R U\' L\' U R\' U\' L mueve las otras tres. Repite hasta que estén las cuatro.';

  @override
  String get stepTwistCorners => 'Oriéntalas';

  @override
  String get stepTwistCornersBody =>
      'Con una esquina sin resolver delante a la derecha, repite R\' D\' R D de dos en dos hasta que el amarillo quede arriba; luego gira solo la capa de arriba para traer la siguiente. Abajo parece roto hasta la última esquina: sigue.';

  @override
  String get lessonCfopIntro => '¿Qué es CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cruz, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Cuatro etapas';

  @override
  String get stepCfopOverviewBody =>
      'Los speedcubers resuelven la cruz, emparejan cada esquina de la primera capa con su arista media (F2L), orientan la última capa (OLL) y por último la permutan (PLL).';

  @override
  String get stepCfopCross => 'Planifica la cruz';

  @override
  String get stepCfopCrossBody =>
      'En CFOP la cruz se planifica durante la inspección y se construye abajo en unos ocho movimientos.';

  @override
  String get lessonF2l => 'Bases de F2L';

  @override
  String get lessonF2lDesc => 'Empareja una esquina con su arista.';

  @override
  String get stepF2lRight => 'Inserta un par';

  @override
  String get stepF2lRightBody =>
      'Cuando una esquina y su arista están juntas arriba, llévalas encima de su hueco e insértalas a la vez.';

  @override
  String get stepF2lLeft => 'Par a la izquierda';

  @override
  String get stepF2lLeftBody =>
      'El mismo caso al otro lado es el espejo, U\' L\' U L. Rotar el cubo (y) te deja usar la mano que te resulte más cómoda.';

  @override
  String get lessonOll => 'OLL en dos pasos';

  @override
  String get lessonOllDesc => 'Pon toda la cara superior amarilla.';

  @override
  String get stepOllCross => 'Primero las aristas';

  @override
  String get stepOllCrossBody =>
      'El OLL en dos pasos empieza con el algoritmo de la cruz amarilla que ya conoces.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Con una esquina amarilla mirando arriba delante a la izquierda, el Sune (R U R\' U R U2 R\') orienta las otras tres. La mayoría de los demás casos usan el Sune y su espejo.';

  @override
  String get lessonPll => 'PLL en dos pasos';

  @override
  String get lessonPllDesc => 'Termina el cubo.';

  @override
  String get stepPllT => 'Perm T';

  @override
  String get stepPllTBody =>
      'La perm T intercambia dos esquinas y dos aristas. Úsala para colocar las esquinas: sujeta a la derecha las dos esquinas que deben intercambiarse.';

  @override
  String get stepPllU => 'Perm U';

  @override
  String get stepPllUBody =>
      'Con las esquinas listas, la perm U rota tres aristas. Deja el lado terminado atrás.';

  @override
  String get lessonTwoFirst => 'Primera capa del 2×2';

  @override
  String get lessonTwoFirstDesc => 'Forma una cara con esquinas que coincidan.';

  @override
  String get stepTwoIntro => 'Solo esquinas';

  @override
  String get stepTwoIntroBody =>
      'Un 2×2 son solo ocho esquinas: sin aristas ni centros. Haz la capa blanca abajo con los colores laterales de las vecinas iguales y termina por una sola ruta: Sune para el amarillo arriba y luego la T-perm o la Y-perm.';

  @override
  String get stepTwoCorner => 'Inserta esquinas';

  @override
  String get stepTwoCornerBody =>
      'Como las esquinas blancas del 3×3: lleva una esquina sobre su hueco vacío delante a la derecha y métela, aquí con U R U\' R\' o repitiendo R U R\' U\' hasta que el blanco mire abajo. Compara sus laterales con la vecina.';

  @override
  String get lessonTwoOll => 'Orienta la capa superior';

  @override
  String get lessonTwoOllDesc => 'OLL de Ortega con el Sune.';

  @override
  String get stepTwoSune => 'Otra vez el Sune';

  @override
  String get stepTwoSuneBody =>
      'Cuenta las pegatinas amarillas hacia arriba. Pon la única esquina con amarillo arriba delante a la izquierda y haz Sune (R U R\' U R U2 R\'). Vuelve a contar y a sujetar; tres Sunes como mucho. Entre medias gira solo la capa de arriba.';

  @override
  String get lessonTwoPbl => 'Permuta ambas capas';

  @override
  String get lessonTwoPblDesc => 'Intercambia esquinas para terminar.';

  @override
  String get stepTwoAdjacent => 'Intercambio adyacente';

  @override
  String get stepTwoAdjacentBody =>
      'Los faros son dos pegatinas iguales arriba en un mismo lado. Gira la capa superior hasta tener los faros a la izquierda, así las dos esquinas que se cambian quedan a la derecha, y haz la T-perm.';

  @override
  String get stepTwoDiagonal => 'Intercambio diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Si no hay faros en ningún lado, dos esquinas en diagonal deben cambiarse: haz la Y-perm desde cualquier lado y gira la capa de arriba para alinear todo.';

  @override
  String get lessonBigIntro => 'Piezas de los cubos grandes';

  @override
  String get lessonBigIntroDesc =>
      'Centros, aristas partidas y capas internas.';

  @override
  String get stepBigPieces => 'Sin centros fijos';

  @override
  String get stepBigPiecesBody =>
      'En el 4×4 cada cara tiene cuatro piezas de centro que se mueven y cada arista son dos alas. Ningún centro es fijo, así que mira el orden de colores en una esquina: blanco frente a amarillo, azul frente a verde, rojo frente a naranja.';

  @override
  String get stepBigSlices => 'Giros dobles e internos';

  @override
  String get stepBigSlicesBody =>
      'Rw gira juntas las dos capas de la derecha. 2R gira solo la segunda capa desde la derecha. Estos giros mueven centros y piezas de arista.';

  @override
  String get lessonBigCenters => 'Centros';

  @override
  String get lessonBigCentersDesc => 'Agrupa las piezas de centro.';

  @override
  String get stepBigCenterCycle => 'Un 3-ciclo de centros';

  @override
  String get stepBigCenterCycleBody =>
      'Este conmutador mueve exactamente tres piezas de centro y deja todo lo demás, así que los centros terminados siguen terminados. Úsalo cuando una pieza suelta no se une a una barra.';

  @override
  String get lessonBigEdges => 'Empareja las aristas';

  @override
  String get lessonBigEdgesDesc => 'Une las piezas en aristas completas.';

  @override
  String get stepBigEdgePair => 'Empareja y restaura';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' alinea dos alas iguales, R U R\' F R\' F\' R mete una arista sin emparejar y Uw devuelve los centros. Cierra siempre la capa que abras.';

  @override
  String get lessonBigParity => 'Paridad';

  @override
  String get lessonBigParityDesc => 'Paridad OLL y PLL en cubos pares.';

  @override
  String get stepBigOllParity => 'Paridad OLL';

  @override
  String get stepBigOllParityBody =>
      'Una sola arista volteada no puede darse en un 3×3: es paridad OLL, no un error. Déjala al frente de la capa superior y haz el algoritmo largo. También cambia las aristas izquierda y derecha de arriba y dos esquinas; los últimos pasos del 3×3 lo arreglan.';

  @override
  String get stepBigPllParity => 'Paridad PLL';

  @override
  String get stepBigPllParityBody =>
      '¿Dos aristas intercambiadas al final y ningún algoritmo de 3×3 encaja? Es paridad PLL. Ponlas delante y detrás en la capa superior: 2R2 U2 2R2 Uw2 2R2 2U2 las intercambia.';

  @override
  String get introGoalHeading => '¿Cuál es el objetivo?';

  @override
  String get introHowHeading => '¿Cómo se hace?';

  @override
  String get introHoldHeading => 'Cómo sujetarlo';

  @override
  String get introWhyHeading => 'Por qué funciona';

  @override
  String get introStart => 'Entendido, empezar paso a paso';

  @override
  String get introDontShowAgain => 'No volver a mostrar automáticamente';

  @override
  String get introShowGoal => 'Ver el objetivo';

  @override
  String get introStateStart => 'Inicio';

  @override
  String get introStateGoal => 'Objetivo';

  @override
  String get introPlayMorph => 'Reproducir del inicio al objetivo';

  @override
  String get introGoalBasics =>
      'Aprende a leer el cubo: sus piezas, sus seis caras y cómo las giran las letras de los movimientos.';

  @override
  String get introGoalCross =>
      'Forma una cruz blanca abajo en la que cada arista blanca también coincida con el centro de al lado.';

  @override
  String get introGoalCorners =>
      'Coloca las cuatro esquinas blancas para completar toda la primera capa: cara blanca y colores laterales iguales.';

  @override
  String get introGoalMiddle =>
      'Coloca las cuatro aristas de la capa media para resolver las dos primeras capas.';

  @override
  String get introGoalYellowCross =>
      'Forma una cruz amarilla arriba; los colores laterales aún no tienen que coincidir.';

  @override
  String get introGoalYellowEdges =>
      'Alinea cada arista de la cruz amarilla con el centro de su lado.';

  @override
  String get introGoalYellowCorners =>
      'Lleva cada esquina amarilla a su sitio, aunque todavía esté girada.';

  @override
  String get introGoalTwistCorners =>
      'Gira las esquinas amarillas hasta su color correcto para resolver todo el cubo.';

  @override
  String get introGoalCfopIntro =>
      'Descubre el plan del speedcubing: cruz, dos primeras capas y la última capa en dos pasos.';

  @override
  String get introGoalF2l =>
      'Inserta cada esquina blanca junto con su arista media y termina dos capas a la vez.';

  @override
  String get introGoalOll =>
      'Pon amarilla toda la cara de arriba con uno o dos algoritmos.';

  @override
  String get introGoalPll =>
      'Lleva las piezas de la última capa a su sitio para terminar el cubo.';

  @override
  String get introGoalTwoFirst => 'Arma una capa blanca completa en el 2×2.';

  @override
  String get introGoalTwoOll =>
      'Pon toda la cara de arriba del 2×2 en amarillo.';

  @override
  String get introGoalTwoPbl =>
      'Lleva las últimas esquinas a su sitio con una T-perm o una Y-perm y alinea la capa de arriba para resolver el 2×2.';

  @override
  String get introGoalBigIntro =>
      'Conoce el 4×4: centros, parejas de aristas y esquinas, y los movimientos que los giran.';

  @override
  String get introGoalBigCenters =>
      'Junta las piezas de centro de cada cara en un bloque de un solo color.';

  @override
  String get introGoalBigEdges =>
      'Empareja las piezas de arista para que cada arista parezca una sola arista de 3×3.';

  @override
  String get introGoalBigParity =>
      'Arregla los dos casos del 4×4 que un 3×3 nunca tiene: una arista volteada (paridad OLL) o dos aristas intercambiadas (paridad PLL).';

  @override
  String get introHowBasics =>
      'Los centros nunca se mueven: indican el color de cada cara.\nCada letra gira una cara un cuarto de vuelta en sentido horario.\nUn apóstrofo (\') gira hacia atrás; un 2 gira dos veces.';

  @override
  String get introHoldBasics =>
      'Como quieras: los centros no se mueven, así que los colores siempre te dicen qué cara es cuál.';

  @override
  String get introWhyBasics =>
      'Cada algoritmo es solo una fila de estas letras, así que leerlas es la primera habilidad.';

  @override
  String get introHowCross =>
      'Sube cada arista blanca arriba, con el blanco hacia arriba, alrededor del centro amarillo: es la margarita.\nGira la capa superior hasta que el color lateral de un pétalo quede sobre su centro.\nDale media vuelta a esa cara para bajarlo; repite con los cuatro.';

  @override
  String get introHoldCross =>
      'Centro amarillo arriba y blanco abajo durante todo el paso. Gira la capa de arriba, no el cubo, para alinear un pétalo.';

  @override
  String get introWhyCross =>
      'Con el blanco mirando arriba, media vuelta de la cara frontal deja la arista sobre el centro blanco, con el blanco abajo y el lateral ya a juego.';

  @override
  String get introHowCorners =>
      'Gira la capa superior hasta que una esquina blanca quede sobre su hueco vacío, en el frente a la derecha.\nRepite R U R\' U\': una vez si el blanco mira a la derecha, tres si mira arriba, cinco si te mira a ti.\nHaz lo mismo con las otras tres esquinas.';

  @override
  String get introHoldCorners =>
      'Blanco abajo, amarillo arriba. La esquina delante a la derecha, justo encima de su hueco.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' saca el hueco y lo devuelve: cada vuelta gira un poco la esquina hasta que el blanco mira abajo, y la cruz nunca se rompe.';

  @override
  String get introHowMiddle =>
      'Busca una arista de arriba sin amarillo y haz coincidir su color frontal con el centro de abajo.\nSu color de arriba te dice adónde va: derecha o izquierda.\nMétela con el algoritmo de 8 movimientos; la capa blanca vuelve entera.';

  @override
  String get introHoldMiddle =>
      'Blanco abajo, amarillo arriba. La arista en el frente, con su color frontal igual al centro de abajo.';

  @override
  String get introWhyMiddle =>
      'El algoritmo aparta el hueco, mete la arista y devuelve la capa blanca. Una arista con amarillo va arriba, nunca en el medio.';

  @override
  String get introHowYellowCross =>
      'Mira solo las aristas amarillas de arriba: un punto, una L o una línea.\nPon la L atrás a la izquierda y la línea de izquierda a derecha, y haz F R U R\' U\' F\'.\nLa línea necesita una vez, la L dos, el punto hasta tres.';

  @override
  String get introHoldYellowCross =>
      'Blanco abajo, amarillo arriba. La L atrás a la izquierda, la línea de izquierda a derecha; el punto, como sea.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' voltea dos aristas de arriba cada vez sin tocar las dos primeras capas.';

  @override
  String get introHowYellowEdges =>
      'Gira la capa superior hasta que dos aristas coincidan con sus centros.\nPonlas atrás y a la derecha y haz R U R\' U R U2 R\' U.\nSi las aristas buenas están enfrentadas, hazlo primero una vez desde cualquier lado.';

  @override
  String get introHoldYellowEdges =>
      'Amarillo arriba. Una arista buena atrás y la otra a la derecha.';

  @override
  String get introWhyYellowEdges =>
      'Este algoritmo solo mueve piezas de arriba, así que las dos primeras capas siempre vuelven.';

  @override
  String get introHowYellowCorners =>
      'Una esquina está en su sitio cuando sus colores coinciden con los tres centros que la rodean, aunque esté girada.\nDeja una esquina en su sitio delante a la derecha.\nU R U\' L\' U R\' U\' L rota las otras tres; repite hasta que encajen todas.';

  @override
  String get introHoldYellowCorners =>
      'Amarillo arriba. Una esquina que ya está en su sitio delante a la derecha; si no hay, cualquiera.';

  @override
  String get introWhyYellowCorners =>
      'Rota tres esquinas en círculo y deja quieta la de delante a la derecha, así que cada repetición coloca más esquinas.';

  @override
  String get introHowTwistCorners =>
      'Sujeta una esquina sin resolver delante a la derecha.\nRepite R\' D\' R D de dos en dos hasta que su amarillo mire arriba.\nGira solo la capa de arriba para la siguiente; la parte de abajo vuelve con la última.';

  @override
  String get introHoldTwistCorners =>
      'Amarillo arriba, la esquina que vas a girar delante a la derecha. Entre esquinas gira solo la capa de arriba, nunca todo el cubo.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D gira la esquina y desordena abajo, pero abajo vuelve cuando todas las esquinas están giradas. Si paras a medias, queda roto.';

  @override
  String get introHowCfopIntro =>
      'Cruz: cuatro aristas planeadas durante la inspección.\nF2L: cada esquina entra junto con su arista.\nOLL pone amarilla la cara de arriba y PLL lleva las piezas a su sitio.';

  @override
  String get introHoldCfopIntro =>
      'Los speedcubers hacen la cruz abajo para ver por adelantado las siguientes piezas mientras giran.';

  @override
  String get introWhyCfopIntro =>
      'Resolver una esquina con su arista ahorra muchos movimientos, y reconocer casos sustituye al ensayo y error.';

  @override
  String get introHowF2l =>
      'Busca una esquina y su arista en la capa de arriba.\nEmparéjalas encima de su hueco.\nMete la pareja con tres o cuatro movimientos.';

  @override
  String get introHoldF2l =>
      'Cruz abajo. El hueco del par delante a la derecha, o delante a la izquierda para el espejo.';

  @override
  String get introWhyF2l =>
      'Una esquina y su arista emparejadas entran juntas, así que dos capas crecen a la vez en lugar de pieza a pieza.';

  @override
  String get introHowOll =>
      'Primero la cruz amarilla con F R U R\' U\' F\'.\nLuego orienta las esquinas, por ejemplo con el Sune.\nReconoce el caso por el amarillo que ves.';

  @override
  String get introHoldOll =>
      'Amarillo arriba. Para Sune, la única esquina con amarillo arriba va delante a la izquierda.';

  @override
  String get introWhyOll =>
      'Dividir la última capa en orientar y luego permutar mantiene pocos algoritmos.';

  @override
  String get introHowPll =>
      'La cara de arriba ya es toda amarilla.\nLa T-perm intercambia esquinas; la U-perm mueve tres aristas.\nLee los colores laterales para elegir el algoritmo.';

  @override
  String get introHoldPll =>
      'Amarillo arriba. T-perm: faros a la izquierda. U-perm: el lado terminado atrás.';

  @override
  String get introWhyPll =>
      'Con la cara de arriba toda amarilla, solo falla el sitio de las piezas, y unos pocos intercambios terminan el cubo.';

  @override
  String get introHowTwoFirst =>
      'Elige una esquina blanca como ancla, con el blanco abajo.\nLleva cada esquina siguiente sobre su hueco, delante a la derecha.\nRepite R U R\' U\' hasta que entre con los colores laterales iguales.';

  @override
  String get introHoldTwoFirst =>
      'Blanco abajo. El hueco vacío delante a la derecha, con su esquina justo encima en la capa de arriba.';

  @override
  String get introWhyTwoFirst =>
      'El 2×2 no tiene centros: la primera esquina que colocas fija los colores de sus vecinas, así que importan los laterales, no solo el blanco.';

  @override
  String get introHowTwoOll =>
      'Cuenta las esquinas con el amarillo hacia arriba.\nCon una, ponla delante a la izquierda y haz Sune: R U R\' U R U2 R\'.\nVuelve a contar y repite; tres Sunes como mucho.';

  @override
  String get introHoldTwoOll =>
      'Blanco abajo, amarillo arriba. Antes de cada Sune, la esquina con amarillo arriba delante a la izquierda.';

  @override
  String get introWhyTwoOll =>
      'Sune gira las esquinas de arriba sin romper la capa blanca; volver a contar te dice cómo sujetarlo la próxima vez.';

  @override
  String get introHowTwoPbl =>
      'Busca faros: dos pegatinas iguales arriba en un mismo lado.\nFaros en un lado: ponlos a la izquierda y haz la T-perm.\nSin faros: haz la Y-perm desde cualquier lado y alinea la capa de arriba.';

  @override
  String get introHoldTwoPbl =>
      'Blanco abajo, amarillo arriba. T-perm: faros a la izquierda. Y-perm: cualquier lado hacia ti.';

  @override
  String get introWhyTwoPbl =>
      'Con arriba amarillo, solo falla el sitio de las esquinas: la T-perm cambia dos vecinas, la Y-perm dos diagonales.';

  @override
  String get introHowBigIntro =>
      'Ningún centro es fijo: cuatro piezas de centro forman el color de cada cara.\nLos giros dobles como Rw mueven dos capas a la vez.\nLos giros internos como 2R mueven solo una capa interior.';

  @override
  String get introHoldBigIntro =>
      'Al principio, como quieras: en el 4×4 ningún centro es fijo, así que tú eliges dónde va cada color.';

  @override
  String get introWhyBigIntro =>
      'La reducción agrupa centros y piezas de arista para que el cubo grande se resuelva como un 3×3.';

  @override
  String get introHowBigCenters =>
      'Primero comprueba el orden de colores en una esquina.\nConstruye dos centros opuestos y luego los otros cuatro.\nLas capas internas mueven piezas de centro; deshaz siempre la capa que abras.';

  @override
  String get introHoldBigCenters =>
      'La cara que construyes al frente; los centros terminados a izquierda y derecha, fuera del camino.';

  @override
  String get introWhyBigCenters =>
      'Una capa interna mueve centros y deshacerla restaura los terminados, así que solo cambia la pieza que buscabas.';

  @override
  String get introHowBigEdges =>
      'Busca las dos alas con los mismos dos colores.\nAlinéalas en el frente y únelas con Uw\'.\nMete una arista sin emparejar y Uw devuelve los centros.';

  @override
  String get introHoldBigEdges =>
      'La arista que emparejas en las capas del frente; las terminadas, aparcadas arriba y abajo.';

  @override
  String get introWhyBigEdges =>
      'Uw\' aparta los centros para que dos alas se junten; Uw los devuelve y tu trabajo sigue intacto.';

  @override
  String get introHowBigParity =>
      'Resuelve el 4×4 como un 3×3 hasta que te atasques.\nUna arista volteada: el algoritmo largo de paridad OLL.\nDos aristas intercambiadas: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'La última capa arriba. Paridad OLL: la arista volteada al frente. Paridad PLL: las aristas intercambiadas delante y detrás.';

  @override
  String get introWhyBigParity =>
      'Las alas pueden quedar en estados que un 3×3 no alcanza; estos algoritmos giran capas internas para deshacer justo eso.';

  @override
  String get dirFaceR => 'Lado derecho';

  @override
  String get dirFaceL => 'Lado izquierdo';

  @override
  String get dirFaceU => 'Fila superior';

  @override
  String get dirFaceD => 'Fila inferior';

  @override
  String get dirFaceF => 'Cara frontal';

  @override
  String get dirFaceB => 'Cara trasera';

  @override
  String get dirMiddle => 'Capa central';

  @override
  String get dirWholeCube => 'Cubo entero';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, capa $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth capas de profundidad';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, capas $near–$far';
  }

  @override
  String get dirUp => 'Arriba';

  @override
  String get dirDown => 'Abajo';

  @override
  String get dirLeft => 'Izquierda';

  @override
  String get dirRight => 'Derecha';

  @override
  String get dirClockwise => 'Horario';

  @override
  String get dirCounter => 'Antihorario';

  @override
  String get dirBackClockwise => 'Horario, visto desde atrás';

  @override
  String get dirBackCounter => 'Antihorario, visto desde atrás';

  @override
  String get dirHalf => 'Giro de 180° (dos veces)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Ocultar detalles';

  @override
  String get solveExpand => 'Mostrar detalles';

  @override
  String get dailyScrambleSteps => 'Mezcla paso a paso';

  @override
  String get dailyScrambleGuide => 'Guía de mezcla en 3D';

  @override
  String get dailyShowMoves => 'Mostrar movimientos en texto';

  @override
  String get dailyHideMoves => 'Ocultar movimientos en texto';

  @override
  String get dailyScrambleGuideTitle => 'Guía de mezcla';

  @override
  String get phaseDailyScramble => 'Mezcla el cubo de hoy';

  @override
  String get explainDailyScramble =>
      'Empieza con un cubo resuelto, blanco arriba y verde al frente, y copia cada giro en tu cubo real.';

  @override
  String get stageCenters => 'Construir los bloques de centros';

  @override
  String get stageEdges => 'Emparejar aristas exteriores e interiores';

  @override
  String get stageParity => 'Resolver la paridad';

  @override
  String get stageCrown1 => 'Primera capa (blanca)';

  @override
  String get stageCrown2 => 'Segunda capa';

  @override
  String get stageCrown3 => 'Tercera capa (amarilla)';

  @override
  String get stageOrient => 'Orientar las piezas';

  @override
  String get stageFinish => 'Terminar el cubo';

  @override
  String get stageAsThree => 'Resolver como un 3×3';

  @override
  String get stageTwoByTwo => 'Resolver el 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Etapa $number de $total: $title';
  }

  @override
  String get solveAllStagesDone => '¡Todas las etapas completadas! Muy bien.';

  @override
  String get trackFiveByFive => '5×5 Cubo del Profesor';

  @override
  String get trackSixBySix => 'Cubo 6×6';

  @override
  String get lessonFiveIntro => 'Conoce el 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Centros fijos, barras de centro, aristas centrales y alas.';

  @override
  String get introGoalFiveIntro =>
      'Conoce el 5×5: centros fijos, barras de centro, aristas centrales y alas.';

  @override
  String get introHowFiveIntro =>
      'La pieza central de cada cara nunca se mueve.\nCada arista es una pieza central con dos alas.\nLas capas interiores mueven piezas sin tocar el exterior.';

  @override
  String get introHoldFiveIntro =>
      'Como quieras: en el 5×5 el centro de cada cara nunca se mueve, así que muestra su color.';

  @override
  String get introWhyFiveIntro =>
      'Los centros fijos marcan el esquema de colores, así que los centros no pueden quedar en mal orden.';

  @override
  String get lessonFiveCenters => 'Centros del 5×5';

  @override
  String get lessonFiveCentersDesc => 'Arma cada centro con barras de tres.';

  @override
  String get introGoalFiveCenters =>
      'Arma en cada cara un bloque de centro de 3×3 de un solo color.';

  @override
  String get introHowFiveCenters =>
      'Empieza por la pieza central fija: marca el color.\nHaz barras de tres y mételas con una capa interna.\nEl movimiento que mete la barra también restaura el centro terminado.';

  @override
  String get introHoldFiveCenters =>
      'El centro que construyes al frente o arriba; los terminados abajo, a la izquierda o a la derecha.';

  @override
  String get introWhyFiveCenters =>
      'Capa dentro, giro arriba, capa fuera: la capa que mete la barra también restaura los centros terminados.';

  @override
  String get lessonFiveEdges => 'Aristas del 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Une dos alas con su arista central.';

  @override
  String get introGoalFiveEdges =>
      'Une cada arista central con sus dos alas para que las 12 aristas parezcan piezas únicas.';

  @override
  String get introHowFiveEdges =>
      'Junta cada ala con su arista central en el frente.\nGira la capa interna, mete una arista sin resolver y vuelve a girarla.\nPara las últimas aristas: capa, volteo, capa.';

  @override
  String get introHoldFiveEdges =>
      'La arista que construyes al frente; las terminadas, guardadas en las capas de arriba y abajo.';

  @override
  String get introWhyFiveEdges =>
      'Abrir y cerrar la capa interna une alas mientras centros y aristas guardadas vuelven a su sitio.';

  @override
  String get lessonFiveSolve => 'Resuelve el 5×5 como un 3×3';

  @override
  String get lessonFiveSolveDesc => 'Termina capa a capa, como un 3×3.';

  @override
  String get introGoalFiveSolve =>
      'Resuelve el 5×5 reducido como un 3×3, capa a capa, solo con giros exteriores.';

  @override
  String get introHowFiveSolve =>
      'Desde ahora solo giros exteriores, o las aristas emparejadas se separan.\nCruz y esquinas blancas, la capa media y después la amarilla.\nLos centros fijos muestran el color de cada cara.';

  @override
  String get introHoldFiveSolve =>
      'El color de la primera capa abajo, igual que en un 3×3; la esquina que vas a meter delante a la derecha.';

  @override
  String get introWhyFiveSolve =>
      'Los giros internos volverían a separar centros y aristas; los exteriores tratan cada bloque como una pieza de 3×3.';

  @override
  String get lessonFiveParity => 'Paridad de aristas del 5×5';

  @override
  String get lessonFiveParityDesc =>
      'Arregla la arista con las alas cambiadas.';

  @override
  String get introGoalFiveParity =>
      'Arregla la única arista con sus dos alas exteriores intercambiadas: la única paridad del 5×5.';

  @override
  String get introHowFiveParity =>
      'Aparece como una última arista que parece volteada.\nHaz una vez el arreglo largo de capas internas.\nEn el 5×5 no hay paridad PLL.';

  @override
  String get introHoldFiveParity =>
      'La última capa arriba y la arista con las alas cambiadas al frente de la capa superior.';

  @override
  String get introWhyFiveParity =>
      'En el 5×5 solo pueden cambiarse las dos alas exteriores de una arista, así que basta un algoritmo.';

  @override
  String get lessonSixIntro => 'Conoce el 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Sin centros fijos y cuatro piezas en cada arista.';

  @override
  String get introGoalSixIntro =>
      'Conoce el 6×6: dieciséis piezas de centro por cara y cuatro piezas por arista.';

  @override
  String get introHowSixIntro =>
      'Ningún centro es fijo: eliges los colores al armar.\nCada arista tiene alas exteriores e interiores.\nLos giros dobles pueden mover hasta tres capas.';

  @override
  String get introHoldSixIntro =>
      'Al principio, como quieras: igual que el 4×4, el 6×6 no tiene centros fijos.';

  @override
  String get introWhySixIntro =>
      'Si resuelves un 4×4 y un 5×5, el 6×6 es la misma reducción con bloques más grandes.';

  @override
  String get lessonSixCenters => 'Centros del 6×6';

  @override
  String get lessonSixCentersDesc =>
      'Arma centros de 4×4 con barras de cuatro.';

  @override
  String get introGoalSixCenters =>
      'Arma en cada cara un bloque de centro de 4×4 de un solo color.';

  @override
  String get introHowSixCenters =>
      'Primero comprueba el orden de colores en una esquina: ningún centro es fijo.\nHaz barras de cuatro y júntalas.\nEn los dos últimos centros mueve piezas sueltas: capa, arriba, deshacer.';

  @override
  String get introHoldSixCenters =>
      'La cara que construyes al frente; los centros terminados a la izquierda, a la derecha o abajo.';

  @override
  String get introWhySixCenters =>
      'Las barras se unen con capas internas y cada capa se deshace, así que los centros terminados siguen enteros.';

  @override
  String get lessonSixEdges => 'Aristas del 6×6';

  @override
  String get lessonSixEdgesDesc => 'Junta las cuatro piezas de cada arista.';

  @override
  String get introGoalSixEdges =>
      'Junta las cuatro piezas de cada arista para que el 6×6 tenga 12 aristas limpias.';

  @override
  String get introHowSixEdges =>
      'Alinea en el frente las alas exteriores e interiores de una arista.\nLa capa ancha profunda mete y saca una arista.\nNunca rompas una arista terminada para liberar una pieza.';

  @override
  String get introHoldSixEdges =>
      'La arista que construyes al frente; las terminadas, aparcadas arriba y abajo.';

  @override
  String get introWhySixEdges =>
      'El giro ancho profundo aparta los centros para que las alas se junten y luego los devuelve.';

  @override
  String get lessonSixSolve => 'Resuelve el 6×6 como un 3×3';

  @override
  String get lessonSixSolveDesc => 'Termina capa a capa, como un 3×3.';

  @override
  String get introGoalSixSolve =>
      'Resuelve el 6×6 reducido como un 3×3, capa a capa, solo con giros exteriores.';

  @override
  String get introHowSixSolve =>
      'Desde ahora solo giros exteriores: una capa interna rompería un centro o una arista.\nLos centros que construiste muestran el color de cada cara.\nCruz y esquinas blancas, la capa media y después la amarilla.';

  @override
  String get introHoldSixSolve =>
      'El color de la primera capa abajo, igual que en un 3×3; la esquina que vas a meter delante a la derecha.';

  @override
  String get introWhySixSolve =>
      'Los giros exteriores mueven cada centro 4×4 y cada arista como una sola pieza, igual que en un 3×3.';

  @override
  String get lessonSixParity => 'Paridad del 6×6';

  @override
  String get lessonSixParityDesc => 'Una arista volteada o dos intercambiadas.';

  @override
  String get introGoalSixParity =>
      'Corrige los dos casos del 6×6 que un 3×3 nunca tiene: una arista volteada o dos aristas intercambiadas.';

  @override
  String get introHowSixParity =>
      'Resuelve como un 3×3 hasta que te atasques.\nUna arista volteada: el arreglo largo con 3Rw.\nDos aristas intercambiadas: el arreglo corto de dobles giros internos.';

  @override
  String get introHoldSixParity =>
      'La última capa arriba. La arista volteada al frente; si son dos intercambiadas, delante y detrás.';

  @override
  String get introWhySixParity =>
      'Como el 4×4, el 6×6 puede acabar con una arista volteada o dos intercambiadas; los algoritmos de capas internas lo arreglan y dejan lo demás.';

  @override
  String get stepFivePieces => 'Las piezas del 5×5';

  @override
  String get stepFivePiecesBody =>
      'La pieza central de cada cara nunca se mueve, así que el esquema de colores no puede salir mal. A su alrededor hay ocho piezas de centro: los centros de esquina y de arista nunca cambian de tipo. Cada arista es una pieza central con dos alas.';

  @override
  String get stepFiveSlices => 'Tres tipos de giros';

  @override
  String get stepFiveSlicesBody =>
      'Un giro exterior mueve una cara. Un giro doble mueve una cara con la capa de detrás. Un giro de capa interior mueve solo una capa de dentro: así cambian las piezas sin tocar el exterior.';

  @override
  String get stepFiveCenterBar => 'Barras de centro';

  @override
  String get stepFiveCenterBarBody =>
      'Forma una fila de tres piezas de centro iguales, métela con una capa interna, gira arriba y deshaz la capa: el movimiento que mete la barra también restaura el centro terminado. Tres barras hacen un centro.';

  @override
  String get stepFiveCenterSwap => 'Cambiar sin romper';

  @override
  String get stepFiveCenterSwapBody =>
      'Para mover una sola pieza de centro: gira una capa interior, gira la cara de arriba, deshaz la capa y devuelve la cara de arriba. Los centros terminados vuelven cada vez.';

  @override
  String get stepFiveEdgePair => 'Emparejar alas con la arista central';

  @override
  String get stepFiveEdgePairBody =>
      'Alinea un ala junto a su arista central en el frente, baja la capa interna, mete una arista sin resolver con un gatillo corto y vuelve a subir la capa interna.';

  @override
  String get stepFiveEdgeLast => 'Las últimas aristas';

  @override
  String get stepFiveEdgeLastBody =>
      'Si ya no queda ninguna arista libre que meter, usa capa, volteo, capa: un giro ancho, un gatillo corto y el giro ancho de vuelta emparejan las últimas aristas sin romper las terminadas.';

  @override
  String get stepFiveAsThree => 'Ahora es un 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Con centros y aristas listos, el 5×5 se comporta como un 3×3 grande. Usa solo giros exteriores y avanza capa a capa: cruz y esquinas blancas, la capa media y después la amarilla. El 5×5 no tiene paridad PLL.';

  @override
  String get stepFiveEdgeParity => 'Cambiar las alas de la última arista';

  @override
  String get stepFiveEdgeParityBody =>
      'A veces la última arista tiene sus dos alas exteriores cambiadas y parece volteada: es la única paridad del 5×5. Ponla al frente de la capa superior y haz una vez el algoritmo de capas internas; todo lo demás vuelve a su sitio.';

  @override
  String get stepSixPieces => 'Las piezas del 6×6';

  @override
  String get stepSixPiecesBody =>
      'Como el 4×4, el 6×6 no tiene centros fijos: dieciséis piezas de centro forman el color de cada cara, así que primero mira el orden de colores en una esquina. Cada arista tiene cuatro alas: dos exteriores y dos interiores.';

  @override
  String get stepSixSlices => 'Girar capas más profundas';

  @override
  String get stepSixSlicesBody =>
      'Los giros dobles pueden mover dos o tres capas desde una cara. Las capas interiores segunda y tercera son las herramientas para centros y aristas.';

  @override
  String get stepSixCenterBar => 'Barras de cuatro';

  @override
  String get stepSixCenterBarBody =>
      'Forma filas de cuatro piezas de centro iguales y júntalas con giros de capas internas, deshaciendo cada capa, hasta que la cara sea un bloque 4×4 de un solo color.';

  @override
  String get stepSixCenterSwap => 'Una pieza cada vez';

  @override
  String get stepSixCenterSwapBody =>
      'Gira la tercera capa, gira arriba, deshaz y vuelve: una pieza de centro se mueve y los centros terminados vuelven. Úsalo en los dos últimos centros, cuando no encaja ninguna barra.';

  @override
  String get stepSixEdgePair => 'Cuatro piezas, una arista';

  @override
  String get stepSixEdgePairBody =>
      'Reúne las cuatro alas de una arista en el frente con la capa ancha profunda, mete una arista sin resolver con un gatillo corto y vuelve a girar la capa ancha.';

  @override
  String get stepSixEdgeLast => 'Las últimas aristas';

  @override
  String get stepSixEdgeLastBody =>
      'Empareja las últimas aristas con un gatillo corto entre un giro ancho profundo y su deshacer, así las terminadas siguen unidas. Nunca rompas una arista terminada para liberar una pieza.';

  @override
  String get stepSixAsThree => 'Ahora es un 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Con centros 4×4 y aristas emparejadas, resuelve el 6×6 como un 3×3, capa a capa, solo con giros exteriores. Una arista volteada o dos cambiadas al final es paridad, no un error.';

  @override
  String get stepSixOllParity => 'Una arista volteada';

  @override
  String get stepSixOllParityBody =>
      'Una sola arista que parece volteada en la última capa es paridad. Ponla al frente de la capa superior y haz el arreglo largo: voltea sus cuatro alas, cambia también las aristas izquierda y derecha de arriba y no toca las dos primeras capas.';

  @override
  String get stepSixPllParity => 'Dos aristas intercambiadas';

  @override
  String get stepSixPllParityBody =>
      'Si dos aristas parecen intercambiadas al final, ponlas delante y detrás en la capa superior y haz el arreglo corto de dobles giros internos: las cuatro alas de ambas aristas se cambian.';

  @override
  String get stepSixWingRule => '¿Cuatro alas o dos?';

  @override
  String get stepSixWingRuleBody =>
      'Una arista del 6×6 tiene 4 alas. Antes de arreglar una arista que parece volteada, mírala bien: si las 4 alas están volteadas, usa la paridad OLL normal de 3 capas; si solo las 2 alas interiores están volteadas, usa la paridad de alas interiores. El cubo muestra el caso de las alas interiores.';

  @override
  String get stepSixInnerWingParity => 'Dos alas interiores volteadas';

  @override
  String get stepSixInnerWingParityBody =>
      'Aquí las alas exteriores de la arista superior delantera están bien y solo las 2 interiores están volteadas. Deja esa arista al frente de la capa superior y gira solo las terceras capas (3R, 3L): las alas interiores vuelven a su sitio y el resto del cubo sigue resuelto.';

  @override
  String get stageTwoFirstLayer => 'Arma la capa inferior';

  @override
  String get stageTwoTopColor => 'Pon la cara de arriba de un color';

  @override
  String get stageTwoFinish => 'Termina las esquinas';

  @override
  String get explainTwoFirstLayer =>
      'Completa la capa inferior: sus cuatro esquinas coinciden entre sí y con los colores laterales.';

  @override
  String get explainTwoTopColor =>
      'Gira hasta que las cuatro pegatinas de arriba sean del mismo color, sin romper la capa inferior.';

  @override
  String get explainTwoFinish =>
      'Lleva las últimas esquinas a su sitio para terminar el cubo.';

  @override
  String get tabSolve => 'Resolver';

  @override
  String get tabScan => 'Escanear';

  @override
  String get tabAcademy => 'Academia';

  @override
  String get tabTrain => 'Entrenar';

  @override
  String get openCubeSolver => 'Abrir cubo 3D y solucionador';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Entrenamiento';

  @override
  String get trainSubtitle => 'Mejora tus habilidades cada día.';

  @override
  String get settings => 'Ajustes';

  @override
  String get settingsSoundHaptics => 'Sonido y vibración';

  @override
  String get settingsSoundHapticsDesc =>
      'Clics y vibraciones al girar el cubo.';

  @override
  String get settingsAnimationSpeed => 'Velocidad de animación predeterminada';

  @override
  String get settingsAnimationSpeedDesc =>
      'Qué tan rápido gira el cubo al reproducir movimientos.';

  @override
  String get settingsResetProgress => 'Restablecer progreso';

  @override
  String get settingsResetProgressDesc =>
      'Borra las lecciones completadas de la Academia y tu racha diaria.';

  @override
  String get resetProgressTitle => '¿Restablecer todo el progreso?';

  @override
  String get resetProgressBody =>
      'Se borrarán tus lecciones completadas y tu racha diaria. No se puede deshacer.';

  @override
  String get resetProgressDone => 'Progreso restablecido.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get settingsPrivacyAds => 'Privacidad y anuncios';

  @override
  String get settingsPrivacyAdsDesc =>
      'Revisa o cambia tus opciones de consentimiento de anuncios.';

  @override
  String get playbackPrevious => 'Anterior';

  @override
  String get playbackNext => 'Siguiente';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¡Resuelto en $count movimientos!',
      one: '¡Resuelto en 1 movimiento!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Da forma a la próxima versión';

  @override
  String get feedbackBody =>
      '¿Quieres sugerir una función o influir en la próxima versión de CubeMentor? Escríbenos a:';

  @override
  String get feedbackEmailCopied =>
      'No encontramos una app de correo, así que copiamos la dirección al portapapeles.';

  @override
  String get adWatchToUnlock => 'Ver anuncio';

  @override
  String get adLoading => 'Cargando un vídeo corto…';

  @override
  String get adRewardNotEarned => 'Mira el vídeo completo para desbloquearlo.';

  @override
  String get adUnavailableFreePass =>
      'No hay vídeos disponibles ahora: desbloqueado gratis esta vez.';

  @override
  String get settingsPrivacyAdsError =>
      'No se pudieron abrir las opciones de privacidad. Inténtalo más tarde.';

  @override
  String get nicknamePromptTitle => '¿Cómo te llamamos?';

  @override
  String get nicknamePromptBody =>
      'Te animaremos por tu nombre cada vez que resuelvas.';

  @override
  String get nicknameHint => 'Tu nombre o apodo';

  @override
  String get nicknameSave => 'Guardar';

  @override
  String get settingsNickname => 'Tu nombre';

  @override
  String get settingsNicknameNotSet => 'Sin definir: toca para añadirlo';

  @override
  String celebrateNamed(String name) {
    return '¡Bien hecho, $name!';
  }

  @override
  String get celebrateAnon => '¡Bien hecho!';

  @override
  String get celebrateCubeSolved => '¡Cubo resuelto!';

  @override
  String get celebrateDailyDone => '¡Reto diario completado!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit movimientos',
      one: '$count / 1 movimiento',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Cualquier mezcla se puede resolver en $limit movimientos o menos',
      one: 'Cualquier mezcla se puede resolver en 1 movimiento o menos',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Ver vídeo';

  @override
  String get patternsNotNow => 'Ahora no';

  @override
  String get settingsColorScheme => 'Esquema de colores del cubo';

  @override
  String get colorSchemeWestern => 'Occidental';

  @override
  String get colorSchemeJapanese => 'Japonés';

  @override
  String get colorSchemeWesternDesc =>
      'Blanco opuesto al amarillo, azul opuesto al verde';

  @override
  String get colorSchemeJapaneseDesc =>
      'Blanco opuesto al azul, amarillo opuesto al verde';

  @override
  String dailyYourTime(String time) {
    return 'Tu tiempo: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Tienes $seconds segundos para inspeccionar el cubo. Toca para iniciar la cuenta atrás.';
  }

  @override
  String get timerInspectTapReady =>
      'Toca cuando estés listo para empezar a resolver';

  @override
  String timerInspectPlus2(int seconds) {
    return 'La inspección pasó de $seconds s y el reloj arrancó solo: penalización de +2 s';
  }

  @override
  String timerAvgOf(int count) {
    return 'Media de $count';
  }

  @override
  String get timerAvgNote => 'Las medias descartan el mejor y el peor tiempo';

  @override
  String get timerPbSub => 'Mejor tiempo';

  @override
  String get timerPlus2Caption => 'Penalización de +2 s';

  @override
  String get timerDnfCaption => 'No terminado (DNF)';

  @override
  String get timerDeleteCaption => 'Borrar esta resolución';

  @override
  String get patternBullsEye => 'Diana';

  @override
  String get patternFramedCenter => 'Centro enmarcado';

  @override
  String get patternBlockCheckerboard => 'Tablero de bloques';

  @override
  String get patternCubeInCubeInCube => 'Cubo en un cubo en un cubo';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Falda escocesa';

  @override
  String get patternSixTs => 'Seis T';

  @override
  String get patternTwinPeaks => 'Picos gemelos';

  @override
  String get patternSpiral => 'Espiral';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Puntos centrales';

  @override
  String get patternStripes => 'Rayas';

  @override
  String get patternAnaconda => 'Anaconda';

  @override
  String get patternZigzag => 'Zigzag';

  @override
  String get patternFourSpots => 'Cuatro puntos';

  @override
  String get patternGreenMamba => 'Mamba verde';

  @override
  String get patternPlusMinus => 'Más y menos';

  @override
  String guideStepCounter(int current, int total) {
    return 'Paso $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Movimiento $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Movimiento $current / $total';
  }

  @override
  String get dailyStep1Title => 'Paso 1: Mezcla tu cubo';

  @override
  String get dailyStep2Title => 'Paso 2: Resuelve el cubo';

  @override
  String dailyPersonalBest(String time) {
    return 'Mejor marca: $time';
  }

  @override
  String get dailyRecentDays => 'Días recientes';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¡Racha de $count días! ¡Estás que ardes!',
      one: '¡Racha de 1 día! ¡Estás que ardes!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => '¡Cubo mezclado! Ahora, a resolverlo';

  @override
  String get dailyCongratsTitle => '¡Felicidades!';

  @override
  String dailyCongratsBody(String time) {
    return 'Resolviste el reto de hoy en $time.';
  }

  @override
  String get dailyCongratsDone => 'Volver al reto';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count patrones',
      one: '1 patrón',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Quedan $hours horas',
      one: 'Queda 1 hora',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Quedan $minutes minutos',
      one: 'Queda 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'Bloqueado';

  @override
  String get unlockedLabel => 'Desbloqueado';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Mira 1 vídeo corto para desbloquear este patrón y su guía paso a paso durante $hours horas.',
      one: 'Mira 1 vídeo corto para desbloquear este patrón y su guía paso a paso durante 1 hora.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Mira 1 vídeo corto para abrir esta lección tantas veces como quieras durante las próximas $hours horas.',
      one: 'Mira 1 vídeo corto para abrir esta lección tantas veces como quieras durante la próxima hora.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'Resolver cubos grandes';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Ya usaste tu resolución gratis de 4×4–6×6. Mira 1 vídeo corto para resolver cubos grandes durante las próximas $hours horas.',
      one: 'Ya usaste tu resolución gratis de 4×4–6×6. Mira 1 vídeo corto para resolver cubos grandes durante la próxima hora.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Giro doble · 180°';

  @override
  String get homeAcademy => 'Academia';

  @override
  String get homePatterns => 'Patrones geniales';

  @override
  String get homePractice => 'Cronómetro y reto diario';

  @override
  String get scanChoiceSubtitle => '¿Cómo quieres empezar?';

  @override
  String get scanChoiceCamera => 'Escanear con la cámara';

  @override
  String get scanChoiceCameraDesc =>
      'Muestra cada cara a la cámara y obtén la solución.';

  @override
  String get scanChoice3d => 'Abrir cubo 3D';

  @override
  String get scanChoice3dDesc =>
      'Gira un cubo virtual, mézclalo y resuélvelo paso a paso.';

  @override
  String get academyAllSizes => 'Todos los tamaños';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total lecciones completadas';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total completadas';
  }

  @override
  String get lessonStageConcept => 'Concepto';

  @override
  String get lessonStageExamples => 'Ejemplos';

  @override
  String get lessonStagePractice => 'Práctica';

  @override
  String get lessonStageNext => 'Seguir / libre';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Etapa $index de $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Ejemplo $index de $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Recorrido $index de $total';
  }

  @override
  String get lessonBonusCase => 'Caso extra';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Sigue directamente con $lesson.';
  }

  @override
  String get lessonFreePractice => 'Práctica libre';

  @override
  String get lessonFreePracticeDesc =>
      'Resuelve tú solo un cubo 3D mezclado, desde el principio hasta este paso.';

  @override
  String freePracticeBanner(String topic) {
    return 'Practica libremente: ¡resuelve el cubo desde el principio hasta $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Gira la cara del centro $face como indica la flecha. El centro se queda quieto; solo viajan las piezas de alrededor.';
  }

  @override
  String cueTrigger(String front) {
    return 'Gatillo de mano derecha, con el $front hacia ti: cara derecha arriba, arriba a la izquierda, cara derecha abajo, arriba de vuelta a la derecha.';
  }

  @override
  String get cueTriggerBack =>
      'El sexto gatillo seguido devuelve el cubo exactamente a como estaba. ¡Seis es el número mágico!';

  @override
  String cueSliceInner(String face) {
    return 'Gira solo la capa interior junto a la cara $face. La cara en sí no se mueve, así que los centros se separan.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Un giro doble: la cara $face y la capa interior de al lado giran juntas, como una sola capa gruesa.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Gira todo el cubo para que el centro $top quede arriba y el centro $front mire hacia ti.';
  }

  @override
  String get cueTurnTop =>
      'Gira solo la capa superior, como indica la flecha, para preparar el siguiente algoritmo.';

  @override
  String get cueAlignTop =>
      'Último movimiento: gira la capa superior para alinear sus colores. ¡Listo!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'La arista $piece está en la capa superior. Gira arriba hasta que quede justo encima del centro $center y luego gira esa cara dos veces para bajarla.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'La arista $piece está atascada en la capa del medio. Súbela, alinéala sobre el centro $center y bájala.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'La arista $piece está en su sitio pero volteada: su blanco mira de lado. Sácala y súbela con el blanco hacia arriba; luego bájala junto al centro $center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'Al estilo CFOP, la base también puede girar. Baja la arista $piece y gira la base para alinearla con el centro $center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Gira arriba hasta que la esquina $piece quede justo encima de su hueco, entre los lados $a y $b. Repite el gatillo de mano derecha hasta que entre bien orientada.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'La esquina $piece está en su hueco pero girada. Un gatillo la saca (entra una esquina amarilla en su lugar); sigue repitiendo sobre el mismo hueco hasta que vuelva a entrar con el blanco abajo. No gires el cubo para perseguirla.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Gira arriba hasta alinear la arista $piece con el centro $a y luego bájala a la derecha, al hueco entre $a y $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Gira arriba hasta alinear la arista $piece con el centro $a y luego bájala a la izquierda, al hueco entre $a y $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'La arista $piece está en su hueco pero volteada. Mete ahí una arista amarilla para sacarla arriba y luego vuelve a meterla entre $a y $b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Una línea amarilla: gira arriba para que vaya de izquierda a derecha, mantén el $front hacia ti y haz el algoritmo de la cruz amarilla.';
  }

  @override
  String cueYellowL(String front) {
    return 'Una L amarilla: gira arriba para que la L apunte atrás a la izquierda, mantén el $front hacia ti y haz el algoritmo. Se convierte en una línea.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Solo el centro es amarillo: un punto. Aplica el algoritmo una vez con el $front hacia ti para conseguir una L. Un punto puede llevar tres rondas, así que sigue.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Gira arriba hasta que la arista $piece coincida con el centro $center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Dos aristas que coinciden están atrás y a la derecha. Con el $front hacia ti, haz el intercambio: las aristas delantera e izquierda cambian de sitio.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Las aristas que coinciden están una frente a la otra. Haz el intercambio una vez con el $front hacia ti; después coincidirán dos vecinas.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'La esquina $piece ya está en su sitio. Mantenla delante a la derecha, con el $front hacia ti, y cicla las otras tres esquinas.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Ninguna esquina amarilla está aún en su sitio. Haz un ciclo con el $front hacia ti; después una esquina estará en su lugar.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Gira la esquina $piece de delante a la derecha: repite el gatillo de abajo de dos en dos hasta que su amarillo mire arriba. Las capas de abajo parecen revueltas; ¡vuelven con la última esquina!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Esta vez la esquina $piece necesita cuatro gatillos. Sigue: el amarillo siempre sube tras dos o cuatro.';
  }

  @override
  String get cueTwistNext =>
      'Gira solo la capa superior para llevar la siguiente esquina mal orientada delante a la derecha. ¡No gires ahora todo el cubo!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Empareja la esquina $piece con la arista $edge arriba y luego inserta la pareja en el hueco entre $a y $b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'La esquina $piece está atascada en su hueco con la arista equivocada. Sácala primero arriba, luego empareja e inserta.';
  }

  @override
  String cueOllSune(String front) {
    return 'Con el $front hacia ti, haz Sune para girar las esquinas amarillas hacia arriba.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Esta vez un Sune no bastó. Gira arriba y haz Sune otra vez, con el $front hacia ti.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Dos esquinas deben intercambiarse. Deja la pareja igual (los «faros») a la izquierda, con el $front hacia ti, y haz la T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Las esquinas están listas. Deja la arista $piece atrás y cicla las otras tres aristas con la U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'Ninguna arista de arriba coincide aún con su centro. Haz la U-perm una vez desde cualquier lado; después una coincidirá.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Dos esquinas vecinas de arriba deben intercambiarse. Deja la pareja igual a la izquierda, con el $front hacia ti, y haz el intercambio.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Las dos esquinas a intercambiar están en diagonal. Haz el intercambio diagonal con el $front hacia ti.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Lleva a su sitio la pieza de centro $color perdida con el 3-ciclo de centros: capa, arriba, capa y luego todo de vuelta.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Una barra entera de piezas de centro $color está en la cara equivocada. Levántala con la capa, gira arriba y devuélvela a su sitio.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Empareja las dos piezas de arista $piece: alinéalas, gira la capa, cambia una arista sin emparejar con los movimientos de mano derecha y devuelve la capa.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Las últimas aristas: empareja la arista $piece con el algoritmo de las dos últimas aristas, que mantiene intactas todas las aristas terminadas.';
  }

  @override
  String cueParityOll(String front) {
    return 'Paridad OLL: una arista de arriba está volteada, algo que nunca pasa en un 3×3. Déjala al frente, con el $front hacia ti, y aplica el arreglo de paridad antes de cualquier OLL normal.';
  }

  @override
  String get cueParityPll =>
      'Paridad PLL: dos aristas de arriba están intercambiadas, algo que nunca pasa en un 3×3. Déjalas delante y detrás, aplica el cambio de paridad y alinea la capa de arriba.';

  @override
  String cueParityFive(String front) {
    return 'Paridad de aristas: las dos alas exteriores de una arista están cambiadas, la única paridad del 5×5. Deja esa arista al frente, con el $front hacia ti, y aplica el arreglo una vez.';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'Paridad de alas interiores: solo las 2 alas interiores de la arista de arriba están volteadas. Déjala al frente, con el $front hacia ti, y gira solo las terceras capas.';
  }

  @override
  String get wingRuleAllFour => 'Las 4 alas volteadas';

  @override
  String get wingRuleAllFourFix => 'Paridad OLL de 3 capas (3Rw)';

  @override
  String get wingRuleInnerTwo => 'Solo las 2 alas interiores volteadas';

  @override
  String get wingRuleInnerTwoFix => 'Paridad de alas interiores (3R)';

  @override
  String get onboardingSkip => 'Omitir';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingStart => 'Empezar';

  @override
  String get onboardingWhatTitle => 'Tu compañero de cubos';

  @override
  String get onboardingWhatBody =>
      'CubeMentor te ayuda a resolver, aprender y practicar cualquier cubo de 2×2 a 6×6, totalmente sin conexión.';

  @override
  String get onboardingScanTitle => 'Escanea y resuelve en segundos';

  @override
  String get onboardingScanBody =>
      'Muestra cada cara a la cámara (o introduce los colores) y sigue la solución en 3D movimiento a movimiento.';

  @override
  String get onboardingLearnTitle => 'Aprende en la Academia';

  @override
  String get onboardingLearnBody =>
      'Domina el método por capas con lecciones cortas y un cubo 3D que muestra cada movimiento.';

  @override
  String get onboardingPatternsTitle => 'Patrones geniales y Playground 3D';

  @override
  String get onboardingPatternsBody =>
      'Convierte cualquier cubo de 2×2 a 6×6 en patrones llamativos, o gira y mezcla libremente en el Playground. Arrastra el cubo para girarlo; toca un tamaño para cambiar.';

  @override
  String get scanChoiceManualDesc =>
      'Introduce los colores de cada cara, pegatina a pegatina.';

  @override
  String get scanTryAgain => 'Reintentar';

  @override
  String get scanEditManually => 'Corregir colores a mano';

  @override
  String get scanLightingHint =>
      'Centra la cara en la cuadrícula. Usa luz intensa y uniforme y evita los reflejos.';

  @override
  String get crownExplain =>
      'Una capa es una franja horizontal del cubo: la primera capa es la blanca de abajo, la segunda es la capa media y la tercera es la amarilla de arriba.';

  @override
  String get lessonObjectiveHeading => 'Objetivo de aprendizaje';

  @override
  String get dirRowTop => 'Fila superior de la cara frontal';

  @override
  String get dirRowBottom => 'Fila inferior de la cara frontal';

  @override
  String get dirColumnRight => 'Columna derecha de la cara frontal';

  @override
  String get dirColumnLeft => 'Columna izquierda de la cara frontal';

  @override
  String get solveChoiceTitle => '¿Cómo quieres resolverlo?';

  @override
  String get solveChoiceFastDesc =>
      'La solución más corta, movimiento a movimiento.';

  @override
  String get solveChoiceGuidedDesc =>
      'Aprende el método por capas paso a paso.';

  @override
  String get guidedSolvedTitle => '¡Resuelto!';

  @override
  String get guidedSolvedBody =>
      'Seguiste todos los pasos y resolviste el cubo.';

  @override
  String get solveAgain => 'Resolver de nuevo';

  @override
  String get backToHome => 'Volver al inicio';

  @override
  String get dailyStatTime => 'Tiempo de hoy';

  @override
  String get dailyStatBest => 'Récord personal';

  @override
  String get dailyStatStreak => 'Racha actual';

  @override
  String get dailyStatBestStreak => 'Mejor racha';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get settingsPrivacyPolicyDesc =>
      'Qué guarda CubeMentor y qué usan los anuncios.';

  @override
  String get privacyIntro =>
      'CubeMentor funciona sin cuenta y sin servidores propios. Esta página explica qué se queda en tu dispositivo y qué usa nuestro socio publicitario.';

  @override
  String get privacyDataTitle => 'Tus datos se quedan en tu dispositivo';

  @override
  String get privacyDataBody =>
      'Tu idioma, ajustes, progreso en las lecciones, tiempos y racha diaria se guardan solo en este dispositivo. No tenemos servidores, así que nunca los recibimos. Al desinstalar la app se borran.';

  @override
  String get privacyCameraTitle => 'Cámara';

  @override
  String get privacyCameraBody =>
      'La cámara solo se usa mientras escaneas un cubo. Las imágenes se analizan en tu dispositivo para leer los colores de las pegatinas; no se guarda ni se envía ninguna foto o vídeo.';

  @override
  String get privacyAdsTitle => 'Anuncios';

  @override
  String get privacyAdsBody =>
      'La app muestra anuncios de Google AdMob. Google puede usar identificadores del dispositivo y datos de interacción con anuncios para mostrarlos y medirlos, como se describe en la política de privacidad de Google. Donde la ley lo exige, primero se te pide tu consentimiento y puedes cambiarlo en Ajustes.';

  @override
  String get privacyContactTitle => 'Contacto';

  @override
  String privacyContactBody(String email) {
    return '¿Preguntas sobre privacidad? Escríbenos a $email.';
  }
}
