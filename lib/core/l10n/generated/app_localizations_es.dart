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
  String get solveModeGuided => 'Guiado (3 coronas)';

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
      '¡Genial! Sigue deslizando las capas iluminadas una a una para completar el giro doble.';

  @override
  String get guideSwipeHint =>
      'Desliza la capa iluminada en la dirección de la flecha o toca Siguiente.';

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
  String get phaseLblCorners => 'Esquinas de la primera corona';

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
  String get crownFirst => 'Primera corona';

  @override
  String get crownSecond => 'Segunda corona';

  @override
  String get crownThird => 'Tercera corona';

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
      'Inserta las 4 esquinas blancas en sus huecos para completar la cara blanca y todo el primer anillo.';

  @override
  String get subStepGoal21 =>
      'Inserta las 4 aristas de la capa media sin deshacer la primera corona.';

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
  String get trackBeginner => '3×3 principiante: las 3 coronas';

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
      'Sujeta el amarillo arriba. Las cuatro aristas blancas rodean el centro blanco de abajo, y el color lateral de cada una coincide con el centro de al lado.';

  @override
  String get stepCrossTop => 'Arista arriba';

  @override
  String get stepCrossTopBody =>
      'Busca una arista blanca arriba. Gira la capa superior hasta que su color lateral quede sobre el centro que coincide y gira esa cara dos veces para bajarla.';

  @override
  String get stepCrossMiddle => 'Arista en medio';

  @override
  String get stepCrossMiddleBody =>
      'Una arista atascada en la capa media sube primero: gira su lateral hacia arriba, aparta la capa superior y devuelve el lateral, para no romper la cruz. Luego colócala desde arriba.';

  @override
  String get stepCornersInsert => 'Encima de su sitio';

  @override
  String get stepCornersInsertBody =>
      'Gira la capa superior hasta que una esquina blanca quede encima del hueco de sus colores, delante a la derecha. R U R\' U\' la baja a su sitio.';

  @override
  String get stepCornersRepeat => 'Repite el gatillo';

  @override
  String get stepCornersRepeatBody =>
      'Si el blanco mira hacia el lado equivocado, sigue repitiendo R U R\' U\' sobre el mismo hueco. Cada esquina queda resuelta en cinco repeticiones como mucho.';

  @override
  String get stepMiddleRight => 'Arista a la derecha';

  @override
  String get stepMiddleRightBody =>
      'Alinea una arista de arriba con su centro en la cara frontal. Si su color superior coincide con el centro derecho, insértala con U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Arista a la izquierda';

  @override
  String get stepMiddleLeftBody =>
      'Si su color superior coincide con el centro izquierdo, usa el espejo: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Un solo algoritmo';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' convierte un punto amarillo en una L, una L en una línea y una línea en la cruz. Sujeta la L atrás a la izquierda y la línea en horizontal.';

  @override
  String get stepYellowEdges => 'Empareja las aristas';

  @override
  String get stepYellowEdgesBody =>
      'Gira la capa superior hasta que dos aristas coincidan con sus centros. Con una atrás y otra a la derecha, R U R\' U R U2 R\' U intercambia las otras dos.';

  @override
  String get stepPlaceCorners => 'Colócalas';

  @override
  String get stepPlaceCornersBody =>
      'Sujeta delante a la derecha una esquina que ya esté en su sitio. U R U\' L\' U R\' U\' L mueve las otras tres; repite hasta que las cuatro estén en su lugar.';

  @override
  String get stepTwistCorners => 'Oriéntalas';

  @override
  String get stepTwistCornersBody =>
      'Con una esquina sin resolver delante a la derecha, repite R\' D\' R D hasta que el amarillo quede arriba y gira solo la capa superior para traer la siguiente. La capa inferior parece rota hasta el final: sigue adelante.';

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
      'Un 2×2 es un 3×3 sin aristas ni centros. Elige un color, forma esa cara abajo y haz que coincidan los colores laterales de las esquinas vecinas.';

  @override
  String get stepTwoCorner => 'Inserta esquinas';

  @override
  String get stepTwoCornerBody =>
      'Igual que las esquinas blancas del 3×3: lleva una esquina encima de su hueco y usa R U R\' U\' hasta que encaje.';

  @override
  String get lessonTwoOll => 'Orienta la capa superior';

  @override
  String get lessonTwoOllDesc => 'OLL de Ortega con el Sune.';

  @override
  String get stepTwoSune => 'Otra vez el Sune';

  @override
  String get stepTwoSuneBody =>
      'El Sune también pone amarilla la cara superior en un 2×2. Con Ortega se aprenden siete casos cortos; el Sune y su espejo cubren la mayoría.';

  @override
  String get lessonTwoPbl => 'Permuta ambas capas';

  @override
  String get lessonTwoPblDesc => 'Intercambia esquinas para terminar.';

  @override
  String get stepTwoAdjacent => 'Intercambio adyacente';

  @override
  String get stepTwoAdjacentBody =>
      'Cuando dos esquinas superiores vecinas deben intercambiarse, sujétalas a la derecha y usa la perm T.';

  @override
  String get stepTwoDiagonal => 'Intercambio diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Dos esquinas en posiciones opuestas se intercambian con la perm Y.';

  @override
  String get lessonBigIntro => 'Piezas de los cubos grandes';

  @override
  String get lessonBigIntroDesc =>
      'Centros, aristas partidas y capas internas.';

  @override
  String get stepBigPieces => 'Sin centros fijos';

  @override
  String get stepBigPiecesBody =>
      'En un 4×4 cada cara tiene cuatro piezas de centro que se mueven, y cada arista está formada por dos piezas. La reducción las agrupa para que el cubo se comporte como un 3×3.';

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
      'Este conmutador mueve exactamente tres piezas de centro y deja todo lo demás igual, así que los centros terminados siguen terminados.';

  @override
  String get lessonBigEdges => 'Empareja las aristas';

  @override
  String get lessonBigEdgesDesc => 'Une las piezas en aristas completas.';

  @override
  String get stepBigEdgePair => 'Empareja y restaura';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' alinea dos piezas de arista iguales, R U R\' F R\' F\' R mete una arista sin emparejar y Uw devuelve los centros a su sitio.';

  @override
  String get lessonBigParity => 'Paridad';

  @override
  String get lessonBigParityDesc => 'Paridad OLL y PLL en cubos pares.';

  @override
  String get stepBigOllParity => 'Paridad OLL';

  @override
  String get stepBigOllParityBody =>
      'Una sola arista volteada no puede darse en un 3×3. En los cubos pares, este algoritmo vuelve a voltear la arista superior delantera. Puede desordenar el resto de la capa superior, algo que los últimos pasos del 3×3 arreglan de todos modos.';

  @override
  String get stepBigPllParity => 'Paridad PLL';

  @override
  String get stepBigPllParityBody =>
      '¿Dos aristas intercambiadas al final? 2R2 U2 2R2 Uw2 2R2 Uw2 intercambia las aristas superiores delantera y trasera.';

  @override
  String get introGoalHeading => '¿Cuál es el objetivo?';

  @override
  String get introHowHeading => '¿Cómo se hace?';

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
      'Forma una cruz blanca en la que cada arista blanca coincida también con el centro de al lado.';

  @override
  String get introGoalCorners =>
      'Coloca las cuatro esquinas blancas para completar la primera corona, toda la capa blanca.';

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
      'Intercambia las últimas esquinas para resolver el 2×2.';

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
      'Corrige los dos casos del 4×4 que un 3×3 nunca tiene: una arista volteada o dos aristas intercambiadas.';

  @override
  String get introHowBasics =>
      'Los centros nunca se mueven: indican el color de cada cara.\nCada letra gira una cara un cuarto de vuelta en sentido horario.\nUn apóstrofo (\') gira hacia atrás; un 2 gira dos veces.';

  @override
  String get introHowCross =>
      'Sujeta el amarillo arriba: la cruz blanca se arma abajo.\nBusca una arista blanca y alinea su color lateral con su centro.\nGira esa cara dos veces para bajarla a su sitio.';

  @override
  String get introHowCorners =>
      'Lleva una esquina blanca encima de su hueco.\nRepite R U R\' U\' hasta que entre bien orientada.\nHaz lo mismo con las otras tres esquinas.';

  @override
  String get introHowMiddle =>
      'Busca una arista de arriba sin amarillo y alinea su color frontal con un centro.\nEnvíala a la derecha o a la izquierda con un algoritmo corto de 8 movimientos.\nLa capa blanca vuelve intacta cada vez.';

  @override
  String get introHowYellowCross =>
      'Mira la cara de arriba: un punto, una L o una línea.\nSujétala como se muestra y haz F R U R\' U\' F\'.\nRepite hasta que aparezca la cruz amarilla.';

  @override
  String get introHowYellowEdges =>
      'Gira la capa de arriba hasta que dos aristas coincidan con sus centros.\nPonlas atrás y a la derecha y haz R U R\' U R U2 R\' U.\nRepite hasta que coincidan las cuatro.';

  @override
  String get introHowYellowCorners =>
      'Una esquina está en su sitio cuando sus colores coinciden con las tres caras que la rodean.\nDeja una esquina ya colocada delante a la derecha.\nU R U\' L\' U R\' U\' L mueve las otras tres hasta que encajen todas.';

  @override
  String get introHowTwistCorners =>
      'Sujeta una esquina sin resolver delante a la derecha.\nRepite R\' D\' R D hasta que su amarillo mire hacia arriba.\nGira solo la capa de arriba para la siguiente; la de abajo se arregla sola al final.';

  @override
  String get introHowCfopIntro =>
      'Cruz: cuatro aristas planeadas durante la inspección.\nF2L: cada esquina entra junto con su arista.\nOLL pone amarilla la cara de arriba y PLL lleva las piezas a su sitio.';

  @override
  String get introHowF2l =>
      'Busca una esquina y su arista en la capa de arriba.\nEmparéjalas encima de su hueco.\nMete la pareja con tres o cuatro movimientos.';

  @override
  String get introHowOll =>
      'Primero la cruz amarilla con F R U R\' U\' F\'.\nLuego orienta las esquinas, por ejemplo con el Sune.\nReconoce el caso por el amarillo que ves.';

  @override
  String get introHowPll =>
      'La cara de arriba ya es toda amarilla.\nLa T-perm intercambia esquinas; la U-perm mueve tres aristas.\nLee los colores laterales para elegir el algoritmo.';

  @override
  String get introHowTwoFirst =>
      'Un 2×2 solo tiene esquinas, como un 3×3 sin aristas.\nLleva cada esquina blanca encima de su sitio.\nRepite R U R\' U\' hasta que entre.';

  @override
  String get introHowTwoOll =>
      'Mantén la capa blanca abajo.\nEl Sune (R U R\' U R U2 R\') gira las esquinas de arriba.\nRepite desde el ángulo correcto hasta que toda la cara sea amarilla.';

  @override
  String get introHowTwoPbl =>
      'Busca un lado donde dos esquinas ya coincidan.\nIntercambio adyacente: un algoritmo tipo T-perm.\nIntercambio diagonal: un algoritmo algo más largo.';

  @override
  String get introHowBigIntro =>
      'Ningún centro es fijo: cuatro piezas de centro forman el color de cada cara.\nLos giros dobles como Rw mueven dos capas a la vez.\nLos giros internos como 2R mueven solo una capa interior.';

  @override
  String get introHowBigCenters =>
      'Arma primero dos centros opuestos.\nLas capas interiores cambian piezas de centro sin romper los terminados.\nTermina los últimos cuatro centros igual.';

  @override
  String get introHowBigEdges =>
      'Busca dos piezas de arista con los mismos colores.\nAlinéalas una junto a otra con una capa interior.\nAparta la pareja y devuelve los centros a su sitio.';

  @override
  String get introHowBigParity =>
      'Resuelve el 4×4 como un 3×3 hasta que te atasques.\nUna arista volteada: el algoritmo largo de paridad OLL.\nDos aristas intercambiadas: 2R2 U2 2R2 Uw2 2R2 Uw2.';

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
  String get stageCrown1 => 'Primera corona (blanca)';

  @override
  String get stageCrown2 => 'Segunda corona';

  @override
  String get stageCrown3 => 'Tercera corona (amarilla)';

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
  String get lessonFiveCenters => 'Centros del 5×5';

  @override
  String get lessonFiveCentersDesc => 'Arma cada centro con barras de tres.';

  @override
  String get introGoalFiveCenters =>
      'Arma en cada cara un bloque de centro de 3×3 de un solo color.';

  @override
  String get introHowFiveCenters =>
      'Empieza por la pieza central: marca el color.\nForma barras de tres y deslízalas con una capa interior.\nTermina juntos los dos últimos centros.';

  @override
  String get lessonFiveEdges => 'Aristas del 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Une dos alas con su arista central.';

  @override
  String get introGoalFiveEdges =>
      'Une cada arista central con sus dos alas para que las 12 aristas parezcan piezas únicas.';

  @override
  String get introHowFiveEdges =>
      'Alinea dos alas con su arista central al frente.\nGira la capa interior, cambia una arista sin resolver y vuelve.\nEmpareja las últimas aristas sin romper las terminadas.';

  @override
  String get lessonFiveSolve => 'Resuelve el 5×5 como un 3×3';

  @override
  String get lessonFiveSolveDesc => 'Termina con las tres coronas.';

  @override
  String get introGoalFiveSolve =>
      'Resuelve el 5×5 reducido como un 3×3, corona a corona.';

  @override
  String get introHowFiveSolve =>
      'Desde ahora, solo giros exteriores.\nPrimera corona, segunda corona y luego la amarilla.\nLos centros fijos indican el color de cada cara.';

  @override
  String get lessonFiveParity => 'Paridad de aristas del 5×5';

  @override
  String get lessonFiveParityDesc =>
      'Arregla la arista con las alas cambiadas.';

  @override
  String get introGoalFiveParity =>
      'Arregla la única arista con sus dos alas intercambiadas y termina.';

  @override
  String get introHowFiveParity =>
      'Aparece como una arista que no se deja emparejar.\nHaz una vez el arreglo largo de capas interiores.\nTodo lo demás vuelve a su sitio.';

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
  String get lessonSixCenters => 'Centros del 6×6';

  @override
  String get lessonSixCentersDesc =>
      'Arma centros de 4×4 con barras de cuatro.';

  @override
  String get introGoalSixCenters =>
      'Arma en cada cara un bloque de centro de 4×4 de un solo color.';

  @override
  String get introHowSixCenters =>
      'Arma primero dos centros opuestos.\nForma barras de cuatro y júntalas.\nMueve piezas sueltas con el truco capa, arriba, deshacer.';

  @override
  String get lessonSixEdges => 'Aristas del 6×6';

  @override
  String get lessonSixEdgesDesc => 'Junta las cuatro piezas de cada arista.';

  @override
  String get introGoalSixEdges =>
      'Junta las cuatro piezas de cada arista para que el 6×6 tenga 12 aristas limpias.';

  @override
  String get introHowSixEdges =>
      'Alinea al frente las alas exteriores e interiores.\nLa capa doble profunda mete y saca una arista.\nLas aristas terminadas nunca se rompen.';

  @override
  String get lessonSixSolve => 'Resuelve el 6×6 como un 3×3';

  @override
  String get lessonSixSolveDesc => 'Termina con las tres coronas.';

  @override
  String get introGoalSixSolve =>
      'Resuelve el 6×6 reducido como un 3×3, corona a corona.';

  @override
  String get introHowSixSolve =>
      'Desde ahora, solo giros exteriores.\nLos centros que armaste indican el color de cada cara.\nPrimera corona, segunda corona y luego la amarilla.';

  @override
  String get lessonSixParity => 'Paridad del 6×6';

  @override
  String get lessonSixParityDesc => 'Una arista volteada o dos intercambiadas.';

  @override
  String get introGoalSixParity =>
      'Corrige los dos casos del 6×6 que un 3×3 nunca tiene: una arista volteada o dos aristas intercambiadas.';

  @override
  String get introHowSixParity =>
      'Resuelve como un 3×3 hasta atascarte.\nUna arista volteada: el arreglo largo de paridad.\nDos aristas intercambiadas: el arreglo corto de giros dobles.';

  @override
  String get stepFivePieces => 'Las piezas del 5×5';

  @override
  String get stepFivePiecesBody =>
      'La pieza central de cada cara nunca se mueve, así que sigue marcando el color, como en un 3×3. A su alrededor hay ocho piezas de centro más; cada arista tiene una pieza central y dos alas, y las esquinas funcionan como en un 3×3.';

  @override
  String get stepFiveSlices => 'Tres tipos de giros';

  @override
  String get stepFiveSlicesBody =>
      'Un giro exterior mueve una cara. Un giro doble mueve una cara con la capa de detrás. Un giro de capa interior mueve solo una capa de dentro: así cambian las piezas sin tocar el exterior.';

  @override
  String get stepFiveCenterBar => 'Barras de centro';

  @override
  String get stepFiveCenterBarBody =>
      'Forma una fila de tres piezas de centro iguales y deslízala junto al centro de su color con un giro de capa interior. Tres barras forman un centro terminado.';

  @override
  String get stepFiveCenterSwap => 'Cambiar sin romper';

  @override
  String get stepFiveCenterSwapBody =>
      'Para mover una sola pieza de centro: gira una capa interior, gira la cara de arriba, deshaz la capa y devuelve la cara de arriba. Los centros terminados vuelven cada vez.';

  @override
  String get stepFiveEdgePair => 'Emparejar alas con la arista central';

  @override
  String get stepFiveEdgePairBody =>
      'Alinea dos alas junto a su arista central al frente, baja la capa interior, trae desde arriba una arista sin resolver y vuelve a subir la capa interior.';

  @override
  String get stepFiveEdgeLast => 'Las últimas aristas';

  @override
  String get stepFiveEdgeLastBody =>
      'Cuando quedan pocas aristas, un giro doble, un gatillo corto y el giro doble de vuelta las emparejan sin romper las terminadas.';

  @override
  String get stepFiveAsThree => 'Ahora es un 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Con centros y aristas listos, el 5×5 se comporta como un 3×3 grande. Usa solo giros exteriores y sigue las tres coronas: cruz y esquinas blancas, capa media y capa amarilla.';

  @override
  String get stepFiveEdgeParity => 'Cambiar las alas de la última arista';

  @override
  String get stepFiveEdgeParityBody =>
      'A veces la última arista tiene sus dos alas cambiadas. Un algoritmo largo de capas interiores las devuelve y todo lo demás vuelve a su sitio. Luego termina como un 3×3.';

  @override
  String get stepSixPieces => 'Las piezas del 6×6';

  @override
  String get stepSixPiecesBody =>
      'Como el 4×4, el 6×6 no tiene centro fijo: dieciséis piezas de centro forman el color de cada cara. Cada arista tiene cuatro piezas: dos alas exteriores y dos interiores.';

  @override
  String get stepSixSlices => 'Girar capas más profundas';

  @override
  String get stepSixSlicesBody =>
      'Los giros dobles pueden mover dos o tres capas desde una cara. Las capas interiores segunda y tercera son las herramientas para centros y aristas.';

  @override
  String get stepSixCenterBar => 'Barras de cuatro';

  @override
  String get stepSixCenterBarBody =>
      'Forma filas de cuatro piezas de centro iguales y deslízalas una junto a otra con giros de capa interior hasta que la cara sea de un solo color.';

  @override
  String get stepSixCenterSwap => 'Una pieza cada vez';

  @override
  String get stepSixCenterSwapBody =>
      'Gira la tercera capa, gira arriba, deshaz y vuelve: una pieza de centro se mueve y los centros terminados regresan.';

  @override
  String get stepSixEdgePair => 'Cuatro piezas, una arista';

  @override
  String get stepSixEdgePairBody =>
      'Junta al frente las cuatro piezas de una arista con la capa doble profunda, trae una arista sin resolver y devuelve la capa doble.';

  @override
  String get stepSixEdgeLast => 'Las últimas aristas';

  @override
  String get stepSixEdgeLastBody =>
      'Empareja las aristas finales con un gatillo corto entre un giro doble profundo y su vuelta, para que las aristas terminadas sigan unidas.';

  @override
  String get stepSixAsThree => 'Ahora es un 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Con centros de 4×4 y aristas emparejadas, resuelve el 6×6 como un 3×3 con giros exteriores y las tres coronas.';

  @override
  String get stepSixOllParity => 'Una arista volteada';

  @override
  String get stepSixOllParityBody =>
      'Si una sola arista parece volteada al resolver la última capa, es paridad. Ponla al frente de la capa de arriba y haz el arreglo largo: las dos primeras coronas vuelven intactas.';

  @override
  String get stepSixPllParity => 'Dos aristas intercambiadas';

  @override
  String get stepSixPllParityBody =>
      'Si dos aristas parecen intercambiadas al final, ponlas delante y detrás en la capa de arriba y haz el arreglo corto de giros dobles interiores.';

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
  String get lessonPracticeIntro =>
      'Una mezcla real: solo los pasos anteriores están resueltos. Termina todo este paso, indicación por indicación.';

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
    return 'La arista $piece está en su sitio pero al revés: su blanco mira hacia un lado. Sácala y vuelve a colocarla junto al centro $center del lado correcto.';
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
    return 'La esquina $piece está en su hueco pero girada. Un gatillo la saca (una esquina amarilla ocupa su lugar); sigue repitiendo hasta que vuelva a entrar bien.';
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
    return 'La arista $piece está en su hueco pero al revés. Mete ahí una arista amarilla para sacarla y luego insértala otra vez entre $a y $b.';
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
    return 'Solo el centro es amarillo: un punto. Haz el algoritmo una vez, con el $front hacia ti, para obtener una L.';
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
    return 'Orienta la esquina $piece de delante a la derecha: repite el gatillo de abajo hasta que su amarillo mire arriba. Las capas de abajo parecen desordenadas por ahora; ¡es normal!';
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
    return 'Paridad OLL: una arista de arriba está volteada, algo que nunca pasa en un 3×3. Déjala delante, con el $front hacia ti, y haz la corrección de paridad.';
  }

  @override
  String get cueParityPll =>
      'Paridad PLL: dos aristas de arriba están intercambiadas, algo que nunca pasa en un 3×3. Déjalas delante y detrás y haz el intercambio de paridad.';

  @override
  String cueParityFive(String front) {
    return 'Paridad de arista: las dos piezas exteriores de una arista están intercambiadas. Gira esa arista al frente, con el $front hacia ti, corrígela y vuelve a girar.';
  }

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
  String get onboardingLearnTitle => 'Aprende y juega';

  @override
  String get onboardingLearnBody =>
      'Domina el método de las 3 coronas en la Academia y luego gira, mezcla y resuelve libremente en la Zona 3D.';

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
      'Una corona es una capa horizontal del cubo: la primera corona es la capa blanca de abajo, la segunda es la capa del medio y la tercera es la capa amarilla de arriba.';

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
      'Aprende el método de las 3 coronas paso a paso.';

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
