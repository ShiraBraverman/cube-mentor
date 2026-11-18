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
  String get comingSoon => 'Próximamente';

  @override
  String get comingSoonMessage =>
      'Esta función llegará en una próxima actualización.';

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
  String get playbackTitle => 'Reproducción';

  @override
  String get playbackEmpty =>
      'Mezcla el cubo para crear una reproducción de la solución.';

  @override
  String playbackProgress(int current, int total) {
    return 'Paso $current de $total';
  }

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
  String get replayStep => 'Repetir paso';

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
  String crownProgress(int current, int total) {
    return 'Corona $current de $total';
  }

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
  String get lessonDone => 'Hecho';

  @override
  String lessonPartOf(int index, int total) {
    return 'Parte $index de $total';
  }

  @override
  String get lessonBack => 'Atrás';

  @override
  String get lessonNext => 'Siguiente';

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
      'Tu turno: desliza la capa que indica la flecha o toca Siguiente movimiento.';

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
  String get timerInspecting =>
      'Inspección: mantén pulsado y suelta para empezar';

  @override
  String get timerTapToInspect =>
      'Toca para iniciar los 15 segundos de inspección';

  @override
  String get timerInspectionToggle => 'Inspección de 15 s';

  @override
  String get timerNewScramble => 'Nueva mezcla';

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
}
