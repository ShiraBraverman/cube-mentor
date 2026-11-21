// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Digitalize, resolva e domine qualquer cubo, do 2×2 ao 6×6.';

  @override
  String get chooseCubeSize => 'Escolha o seu cubo';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Iniciante';

  @override
  String get cubeLevel3 => 'Clássico';

  @override
  String get cubeLevel4 => 'Avançado';

  @override
  String get cubeLevel5 => 'Especialista';

  @override
  String get cubeLevel6 => 'Mestre';

  @override
  String get cubeComingSoon => 'Novo cubo em breve';

  @override
  String get carouselPrevious => 'Cubo anterior';

  @override
  String get carouselNext => 'Cubo seguinte';

  @override
  String get chooseMode => 'O que pretende fazer?';

  @override
  String get modePlayground => 'Área 3D';

  @override
  String get modePlaygroundDesc =>
      'Rode camadas, baralhe e repita movimentos em 3D.';

  @override
  String get modeScanSolve => 'Digitalizar e resolver';

  @override
  String get modeScanSolveDesc =>
      'Digitalize o cubo com a câmara e obtenha uma solução.';

  @override
  String get modeAcademy => 'Academia';

  @override
  String get modeAcademyDesc => 'Aprenda passo a passo com lições interativas.';

  @override
  String get language => 'Idioma';

  @override
  String get languageSearch => 'Pesquisar idioma';

  @override
  String get languageNoResults => 'Nenhum idioma corresponde à pesquisa.';

  @override
  String playgroundTitle(int size) {
    return 'Área 3D $size×$size';
  }

  @override
  String get scramble => 'Baralhar';

  @override
  String get reset => 'Repor';

  @override
  String get undo => 'Anular';

  @override
  String get speed => 'Velocidade';

  @override
  String get xray => 'Raio X';

  @override
  String get prime => 'Anti-horário';

  @override
  String get wide => 'Dupla';

  @override
  String layer(int index) {
    return 'Camada $index';
  }

  @override
  String get cubeRotations => 'Rotações';

  @override
  String get play => 'Reproduzir';

  @override
  String get pause => 'Pausa';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count movimentos',
      one: '1 movimento',
      zero: 'Nenhum movimento',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Resolvido';

  @override
  String get scrambled => 'Baralhado';

  @override
  String get orbitHint =>
      'Arraste uma fila para a rodar · Arraste o fundo para rodar a vista';

  @override
  String get notationPad => 'Teclado de notação';

  @override
  String get solve => 'Resolver';

  @override
  String get solving => 'A resolver…';

  @override
  String get solveFast => 'Solução rápida';

  @override
  String get solveLearn => 'Aprender passo a passo';

  @override
  String get solveModeGuided => 'Guiado (3 coroas)';

  @override
  String get solveModeFast => 'Rápido (ótimo)';

  @override
  String solveUnavailable(int size) {
    return 'O resolvedor de $size×$size chega numa atualização futura.';
  }

  @override
  String get solveAlreadySolved => 'O cubo já está resolvido.';

  @override
  String solveFailed(String reason) {
    return 'Este cubo não pode ser resolvido ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'O motor de resolução não está disponível neste dispositivo.';

  @override
  String get solveComplete => 'Resolvido! Muito bem.';

  @override
  String solveSummary(int count) {
    return '$count movimentos';
  }

  @override
  String get nextMove => 'Movimento seguinte';

  @override
  String get previousMove => 'Movimento anterior';

  @override
  String get halfTurnHalfway =>
      'Boa, já vai a meio! Rode-a mais uma vez no mesmo sentido para fazer a meia-volta (180°).';

  @override
  String get wideTurnInner =>
      'Ótimo! Agora deslize a camada interior ao lado para completar a rotação dupla.';

  @override
  String get wideTurnOuter =>
      'Ótimo! Agora deslize a camada exterior ao lado para completar a rotação dupla.';

  @override
  String get wideTurnMore =>
      'Ótimo! Continue a deslizar as camadas iluminadas, uma de cada vez, para completar a rotação dupla.';

  @override
  String get guideSwipeHint =>
      'Deslize a camada iluminada no sentido da seta ou toque em Seguinte.';

  @override
  String get guideRotateHint =>
      'Rode o cubo inteiro como a seta indica: toque em Seguinte.';

  @override
  String get guideWrongMove => 'Siga a seta destacada';

  @override
  String get guideExit => 'Sair do guia';

  @override
  String get colorWhite => 'branco';

  @override
  String get colorYellow => 'amarelo';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'azul';

  @override
  String get colorRed => 'vermelho';

  @override
  String get colorOrange => 'laranja';

  @override
  String get phaseOptimal2x2 => 'Solução ótima';

  @override
  String get phaseKociemba1 => 'Fase 1 · Orientar as peças';

  @override
  String get phaseKociemba2 => 'Fase 2 · Terminar o cubo';

  @override
  String get phaseLblCross => 'Cruz branca';

  @override
  String get phaseLblCorners => 'Cantos da primeira coroa';

  @override
  String get phaseLblMiddle => 'Arestas da camada do meio';

  @override
  String get phaseLblYellowCross => 'Cruz amarela';

  @override
  String get phaseLblYellowEdges => 'Alinhar as arestas da cruz amarela';

  @override
  String get phaseLblYellowCorners => 'Posicionar os cantos amarelos';

  @override
  String get phaseLblYellowCornersOrient => 'Orientar os cantos amarelos';

  @override
  String get crownFirst => 'Primeira coroa';

  @override
  String get crownSecond => 'Segunda coroa';

  @override
  String get crownThird => 'Terceira coroa';

  @override
  String get crownFirstGoal => 'Face branca e primeira camada';

  @override
  String get crownSecondGoal => 'Camada do meio';

  @override
  String get crownThirdGoal => 'Face amarela e última camada';

  @override
  String get subStepGoal11 =>
      'Forme uma cruz branca em que cada aresta branca também condiga com o centro ao lado.';

  @override
  String get subStepGoal12 =>
      'Encaixe os 4 cantos brancos nos seus lugares para completar a face branca e todo o primeiro anel.';

  @override
  String get subStepGoal21 =>
      'Encaixe as 4 arestas da camada do meio sem desfazer a primeira coroa.';

  @override
  String get subStepGoal31 => 'Forme uma cruz amarela na última camada.';

  @override
  String get subStepGoal32 =>
      'Troque as arestas da cruz amarela até cada uma condizer com o centro do seu lado.';

  @override
  String get subStepGoal33 =>
      'Leve os 4 cantos amarelos para os lugares certos, mesmo que ainda estejam torcidos.';

  @override
  String get subStepGoal34 =>
      'Rode cada canto amarelo no lugar até todos os autocolantes condizerem e o cubo ficar resolvido.';

  @override
  String get explainOptimal2x2 =>
      'A solução mais curta possível, encontrada ao analisar todas as posições do 2×2.';

  @override
  String get explainKociemba1 =>
      'Oriente todas as peças e junte as arestas da camada do meio na camada do meio.';

  @override
  String get explainKociemba2 =>
      'Termine apenas com U, D e meias-voltas, que mantêm essa orientação.';

  @override
  String get explainLblOrient =>
      'Rode o cubo inteiro para que o centro branco fique para baixo.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Leve a aresta $piece para baixo, junto ao centro branco, com a cor lateral a condizer.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'O canto $piece está preso no sítio errado. Suba-o com R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Rode a camada de cima até o canto $piece ficar por cima do seu lugar.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Repita R U R\' U\' até o canto $piece encaixar no lugar.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'A aresta $piece está na camada do meio, mas mal colocada. Tire-a para cima.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Rode a camada de cima para que a cor lateral da aresta $piece condiga com o seu centro.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Insira a aresta $piece à direita: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Insira a aresta $piece à esquerda: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Rode a camada de cima para posicionar a forma amarela para o algoritmo seguinte.';

  @override
  String get explainLblYellowCrossAlg =>
      'Forme a cruz amarela com F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Rode a camada de cima para alinhar as arestas amarelas com os seus centros.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Troque arestas amarelas com R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Leve os cantos amarelos para os seus lugares com U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Rode a camada de cima para trazer o canto amarelo seguinte por resolver para a frente à direita.';

  @override
  String get explainLblCornerTwist =>
      'Repita R\' D\' R D até o amarelo ficar para cima. A camada de baixo corrige-se sozinha no fim.';

  @override
  String get explainLblFinalAlign =>
      'Rode a camada de cima para terminar o cubo.';

  @override
  String scanTitle(int size) {
    return 'Digitalizar $size×$size';
  }

  @override
  String get scanManualInput => 'Introduzir cores manualmente';

  @override
  String get scanUseCamera => 'Digitalizar com a câmara';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Face $current de $total';
  }

  @override
  String get faceUp => 'Face de cima';

  @override
  String get faceRight => 'Face direita';

  @override
  String get faceFront => 'Face da frente';

  @override
  String get faceDown => 'Face de baixo';

  @override
  String get faceLeft => 'Face esquerda';

  @override
  String get faceBack => 'Face de trás';

  @override
  String get scanHintFront =>
      'Segure o cubo com qualquer face virada para si. Essa é a frente: mantenha a mesma face em cima enquanto digitaliza.';

  @override
  String get scanHintRight =>
      'A partir da frente, rode o cubo inteiro uma vez para a esquerda, para que a face direita fique virada para si.';

  @override
  String get scanHintBack =>
      'A partir da frente, rode o cubo inteiro duas vezes para a esquerda.';

  @override
  String get scanHintLeft =>
      'A partir da frente, rode o cubo inteiro uma vez para a direita.';

  @override
  String get scanHintUp =>
      'A partir da frente, incline o topo na sua direção para que fique virado para a câmara.';

  @override
  String get scanHintDown =>
      'A partir da frente, incline a base na sua direção para que fique virada para a câmara.';

  @override
  String get scanAlignHint =>
      'Preencha a grelha com a face e toque no obturador.';

  @override
  String get scanCapture => 'Capturar face';

  @override
  String get scanTurnLeft => 'Rode o cubo inteiro para a esquerda';

  @override
  String get scanTurnRight => 'Rode o cubo inteiro para a direita';

  @override
  String get scanTipTop => 'Incline o topo na sua direção';

  @override
  String get scanTipBottom => 'Incline a base na sua direção';

  @override
  String get scanGlareTip =>
      'Reflexo detetado: incline ligeiramente o cubo ou segure o telemóvel por cima dele para tapar a luz do teto.';

  @override
  String get scanDimTip =>
      'Pouca luz: procure um sítio mais iluminado ou ligue a lanterna.';

  @override
  String get scanTorch => 'Lanterna';

  @override
  String get scanGuideLabel =>
      'Guia de digitalização: as faces digitalizadas aparecem a cores. Toque numa face digitalizada para a digitalizar de novo.';

  @override
  String get scanTapToRescan =>
      'Toque numa face digitalizada para a digitalizar de novo.';

  @override
  String get scanCameraMissing =>
      'Não foi encontrada nenhuma câmara neste dispositivo.';

  @override
  String get scanCameraDenied =>
      'O acesso à câmara foi recusado. Ainda pode introduzir as cores manualmente.';

  @override
  String get scanCameraFailed => 'Não foi possível iniciar a câmara.';

  @override
  String get scanAllGood => 'Todos os autocolantes parecem corretos.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autocolantes parecem errados',
      one: '1 autocolante parece errado',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Há algo que não bate certo';

  @override
  String scanIssueColors(int count) {
    return 'Cada cor tem de aparecer exatamente $count vezes.';
  }

  @override
  String get scanIssueCenters => 'Dois centros têm a mesma cor.';

  @override
  String get scanIssuePieces =>
      'Estes autocolantes formam peças que não existem num cubo verdadeiro.';

  @override
  String get scanIssueTwist =>
      'Um canto está torcido. Verifique os autocolantes dos cantos.';

  @override
  String get scanIssueFlip =>
      'Uma aresta está virada. Verifique os autocolantes das arestas.';

  @override
  String get scanIssueParity => 'Parece que duas peças estão trocadas.';

  @override
  String get scanIssueUnavailable =>
      'A verificação de cores não está disponível neste dispositivo.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count autocolantes foram difíceis de ler: dê-lhes uma vista de olhos.',
      one: 'Um autocolante foi difícil de ler: dê-lhe uma vista de olhos.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Toque num autocolante para mudar a cor · Toque sem soltar para ver a paleta';

  @override
  String get scanRescanFace => 'Digitalizar uma face de novo';

  @override
  String get scanCancelRescan => 'Voltar às cores';

  @override
  String get scanPaletteTitle => 'Escolha uma cor';

  @override
  String get scanOpen3d => 'Abrir em 3D';

  @override
  String get scanRestart => 'Recomeçar';

  @override
  String get modeTimer => 'Cronómetro';

  @override
  String get modeTimerDesc =>
      'Baralhamentos, inspeção, médias e recordes pessoais.';

  @override
  String get modeDaily => 'Desafio diário';

  @override
  String get modeDailyDesc =>
      'Um baralhamento novo todos os dias. Mantenha a sua série.';

  @override
  String get modePatterns => 'Biblioteca de padrões';

  @override
  String get modePatternsDesc => 'Xadrez, superflip e muito mais, em 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Série de $count dias',
      one: 'Série de 1 dia',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Continuar a aprender';

  @override
  String get startLearning => 'Começar a aprender';

  @override
  String lessonOf(int index, int total) {
    return 'Lição $index de $total';
  }

  @override
  String get academyAllDone => 'Todas as lições concluídas!';

  @override
  String get academyTitle => 'Academia';

  @override
  String academyProgress(int done, int total) {
    return '$done de $total lições concluídas';
  }

  @override
  String get lessonAdvanced => 'Avançado';

  @override
  String lessonPartOf(int index, int total) {
    return 'Parte $index de $total';
  }

  @override
  String get lessonNext => 'Seguinte';

  @override
  String get lessonPrevious => 'Anterior';

  @override
  String get lessonFinish => 'Concluir lição';

  @override
  String get lessonComplete => 'Lição concluída!';

  @override
  String get lessonNextLesson => 'Lição seguinte';

  @override
  String get lessonBackToAcademy => 'Voltar à Academia';

  @override
  String get lessonTryIt =>
      'A sua vez: deslize a camada que a seta indica ou toque em Seguinte.';

  @override
  String get lessonLookAround =>
      'Arraste o fundo para ver o cubo de todos os lados.';

  @override
  String get lessonDemoDone => 'Boa! Toque em Seguinte para continuar.';

  @override
  String holdPrompt(String top, String front) {
    return 'Segure o cubo com o centro $top em cima e o centro $front virado para si.';
  }

  @override
  String get trackBeginner => '3×3 iniciante: as 3 coroas';

  @override
  String get trackCfop => 'Introdução ao CFOP';

  @override
  String get trackTwoByTwo => '2×2 iniciante e Ortega';

  @override
  String get trackBigCubes => 'Cubos grandes: redução e paridade';

  @override
  String moveSentence(String layer, String direction) {
    return 'Rode $layer $direction';
  }

  @override
  String get moveFaceR => 'a face direita';

  @override
  String get moveFaceL => 'a face esquerda';

  @override
  String get moveFaceU => 'a face de cima';

  @override
  String get moveFaceD => 'a face de baixo';

  @override
  String get moveFaceF => 'a face da frente';

  @override
  String get moveFaceB => 'a face de trás';

  @override
  String moveLayerInner(int depth, String face) {
    return 'a camada $depth a contar de $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth camadas de profundidade)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'as camadas $near–$far a contar de $face';
  }

  @override
  String get moveLayerMiddle => 'a camada do meio';

  @override
  String get moveDirUp => 'para cima';

  @override
  String get moveDirDown => 'para baixo';

  @override
  String get moveDirLeft => 'para a esquerda';

  @override
  String get moveDirRight => 'para a direita';

  @override
  String get moveDirClockwise => 'no sentido dos ponteiros do relógio';

  @override
  String get moveDirCounter => 'no sentido contrário aos ponteiros do relógio';

  @override
  String get moveDirBackClockwise =>
      'no sentido dos ponteiros do relógio, visto de trás';

  @override
  String get moveDirBackCounter =>
      'no sentido contrário aos ponteiros do relógio, visto de trás';

  @override
  String get moveDirHalf => 'meia-volta (duas vezes)';

  @override
  String get moveRotateX => 'Incline o cubo inteiro: a frente sobe para o topo';

  @override
  String get moveRotateXPrime =>
      'Incline o cubo inteiro: a frente desce para a base';

  @override
  String get moveRotateX2 => 'Vire o cubo inteiro: a frente passa para trás';

  @override
  String get moveRotateY => 'Rode o cubo inteiro: a frente vai para a esquerda';

  @override
  String get moveRotateYPrime =>
      'Rode o cubo inteiro: a frente vai para a direita';

  @override
  String get moveRotateY2 =>
      'Rode o cubo inteiro meia-volta: a parte de trás passa para a frente';

  @override
  String get moveRotateZ =>
      'Tombe o cubo inteiro no sentido dos ponteiros do relógio: o topo vai para a direita';

  @override
  String get moveRotateZPrime =>
      'Tombe o cubo inteiro no sentido contrário aos ponteiros do relógio: o topo vai para a esquerda';

  @override
  String get moveRotateZ2 =>
      'Vire o cubo inteiro de pernas para o ar: o topo passa para a base';

  @override
  String get phaseReductionCenters => 'Centros';

  @override
  String get phaseReductionEdges => 'Emparelhar as arestas';

  @override
  String get phaseReductionEdgeParity => 'Paridade das arestas';

  @override
  String get phaseReductionOllParity => 'Paridade de OLL';

  @override
  String get phaseReductionPllParity => 'Paridade de PLL';

  @override
  String get explainReductionCenterBlock =>
      'Rotações de camadas interiores que levam várias peças de centro ao lugar de uma só vez.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Leve uma peça de centro $piece para a sua face com um 3-ciclo que não mexe nos centros já feitos.';
  }

  @override
  String get explainReductionParityCenters =>
      'Refaça os centros que a rotação de paridade desfez.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Junte as peças da aresta $piece com um 3-ciclo; os centros continuam resolvidos.';
  }

  @override
  String get explainReductionEdgeParity =>
      'As últimas arestas não se emparelham só com 3-ciclos (paridade das arestas). Uma rotação de camada interior resolve isso.';

  @override
  String get explainReductionOllParity =>
      'Paridade de OLL: uma aresta está virada, o que é impossível num 3×3. Este algoritmo volta a virá-la.';

  @override
  String get explainReductionPllParity =>
      'Paridade de PLL: duas arestas estão trocadas, o que é impossível num 3×3. Este algoritmo destroca-as.';

  @override
  String get patternsTitle => 'Biblioteca de padrões';

  @override
  String get patternsHint =>
      'Toque num padrão para o ver e depois repita-o no seu cubo.';

  @override
  String get patternCheckerboard => 'Xadrez';

  @override
  String get patternCubeInCube => 'Cubo dentro do cubo';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Pontos';

  @override
  String get patternCross => 'Cruz';

  @override
  String get patternPython => 'Pitão';

  @override
  String get phasePattern => 'Forme o padrão';

  @override
  String get explainPatternStep =>
      'Siga cada movimento no seu cubo. Toque em Resolver para o voltar ao normal.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Cronómetro';

  @override
  String get timerHoldToStart => 'Mantenha premido e solte para começar';

  @override
  String get timerReleaseToStart => 'Solte para começar';

  @override
  String get timerTapToStop => 'Toque em qualquer sítio para parar';

  @override
  String get timerInspecting =>
      'Inspeção: mantenha premido e solte para começar';

  @override
  String get timerTapToInspect =>
      'Toque para iniciar a inspeção de 15 segundos';

  @override
  String get timerInspectionToggle => 'Inspeção de 15 s';

  @override
  String get timerLoadingScramble => 'A gerar um baralhamento…';

  @override
  String get timerPb => 'Recorde';

  @override
  String get timerSolves => 'Resoluções';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Eliminar';

  @override
  String get timerHistory => 'Histórico';

  @override
  String get timerNoSolves =>
      'Ainda não há resoluções. Baralhe o cubo e comece!';

  @override
  String get timerNewPb => 'Novo recorde pessoal!';

  @override
  String get timerClearHistory => 'Limpar histórico';

  @override
  String get timerScrambleHint =>
      'Segure o branco em cima e o verde à frente e depois baralhe:';

  @override
  String get dailyTitle => 'Desafio diário';

  @override
  String dailyFor(String date) {
    return 'Desafio de $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Melhor série: $count';
  }

  @override
  String get dailyDone => 'Já está por hoje! Volte amanhã.';

  @override
  String get dailyNotDone =>
      'Resolva o baralhamento de hoje para manter a sua série.';

  @override
  String get dailySolveVirtual => 'Resolver no cubo 3D';

  @override
  String get dailyTimeIt => 'Cronometrar no seu cubo';

  @override
  String get dailyHint => 'Dica';

  @override
  String dailyHintText(String moves) {
    return 'Comece pela cruz branca: $moves';
  }

  @override
  String get dailyHintFailed => 'Não há nenhuma dica disponível de momento.';

  @override
  String get lessonBasics => 'Conheça o cubo';

  @override
  String get lessonBasicsDesc => 'Peças, faces e nomes dos movimentos.';

  @override
  String get stepBasicsPieces => 'Três tipos de peças';

  @override
  String get stepBasicsPiecesBody =>
      'Os centros nunca se movem e dão a cor a cada face. As arestas têm duas cores e os cantos têm três. Resolver é levar cada aresta e cada canto para junto dos centros das mesmas cores.';

  @override
  String get stepBasicsFaces => 'Seis letras de faces';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F e B são as faces direita, esquerda, de cima, de baixo, da frente e de trás. Uma letra sozinha significa um quarto de volta no sentido dos ponteiros do relógio, como se olhasse diretamente para essa face.';

  @override
  String get stepBasicsPrime => 'Rotações inversas e duplas';

  @override
  String get stepBasicsPrimeBody =>
      'Um apóstrofo (R\') roda no sentido inverso, contrário aos ponteiros do relógio. Um 2 (U2) é meia-volta: dois quartos de volta.';

  @override
  String get stepCrossGoal => 'O objetivo';

  @override
  String get stepCrossGoalBody =>
      'Segure o amarelo em cima. As quatro arestas brancas ficam à volta do centro branco em baixo, cada cor lateral a condizer com o centro ao lado.';

  @override
  String get stepCrossTop => 'Aresta em cima';

  @override
  String get stepCrossTopBody =>
      'Encontre uma aresta branca em cima. Rode a camada de cima até a sua cor lateral ficar sobre o centro correspondente e rode essa face duas vezes para a descer.';

  @override
  String get stepCrossMiddle => 'Aresta no meio';

  @override
  String get stepCrossMiddleBody =>
      'Uma aresta presa na camada do meio sobe primeiro: rode a sua lateral para cima, afaste a camada de cima e volte a rodar a lateral, para a cruz se manter. Depois coloque-a a partir de cima.';

  @override
  String get stepCornersInsert => 'Por cima do seu lugar';

  @override
  String get stepCornersInsertBody =>
      'Rode a camada de cima até um canto branco ficar por cima do lugar das suas cores, à frente à direita. R U R\' U\' encaixa-o.';

  @override
  String get stepCornersRepeat => 'Repita o gatilho';

  @override
  String get stepCornersRepeatBody =>
      'Se o branco estiver virado para o lado errado, continue a repetir R U R\' U\' sobre o mesmo lugar. Cada canto fica resolvido com cinco repetições, no máximo.';

  @override
  String get stepMiddleRight => 'Aresta para a direita';

  @override
  String get stepMiddleRightBody =>
      'Alinhe uma aresta de cima com o seu centro na frente. Se a cor de cima condisser com o centro da direita, insira-a com U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Aresta para a esquerda';

  @override
  String get stepMiddleLeftBody =>
      'Se a cor de cima condisser com o centro da esquerda, use o espelho: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Um só algoritmo';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' transforma um ponto amarelo num L, um L numa linha e uma linha na cruz. Segure o L atrás à esquerda e a linha na horizontal.';

  @override
  String get stepYellowEdges => 'Alinhe as arestas';

  @override
  String get stepYellowEdgesBody =>
      'Rode a camada de cima até duas arestas condizerem com os seus centros. Com uma atrás e outra à direita, R U R\' U R U2 R\' U troca as outras duas.';

  @override
  String get stepPlaceCorners => 'Posicione-os';

  @override
  String get stepPlaceCornersBody =>
      'Segure à frente à direita um canto que já esteja no lugar. U R U\' L\' U R\' U\' L move os outros três; repita até os quatro estarem no lugar.';

  @override
  String get stepTwistCorners => 'Oriente-os';

  @override
  String get stepTwistCornersBody =>
      'Com um canto por resolver à frente à direita, repita R\' D\' R D até o amarelo ficar em cima e rode só a camada de cima para trazer o seguinte. A camada de baixo parece desfeita até ao fim: continue.';

  @override
  String get lessonCfopIntro => 'O que é o CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cruz, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Quatro etapas';

  @override
  String get stepCfopOverviewBody =>
      'Os speedcubers resolvem a cruz, juntam cada canto da primeira camada à respetiva aresta do meio (F2L), orientam a última camada (OLL) e, por fim, permutam-na (PLL).';

  @override
  String get stepCfopCross => 'Planeie a cruz';

  @override
  String get stepCfopCrossBody =>
      'No CFOP, a cruz é planeada durante a inspeção e formada em baixo em cerca de oito movimentos.';

  @override
  String get lessonF2l => 'Bases do F2L';

  @override
  String get lessonF2lDesc => 'Junte um canto à sua aresta.';

  @override
  String get stepF2lRight => 'Insira um par';

  @override
  String get stepF2lRightBody =>
      'Quando um canto e a sua aresta estão lado a lado em cima, leve-os para cima do seu lugar e insira-os juntos.';

  @override
  String get stepF2lLeft => 'Par à esquerda';

  @override
  String get stepF2lLeftBody =>
      'O mesmo caso do outro lado é o espelho, U\' L\' U L. Rodar o cubo (y) permite usar a mão que for mais confortável.';

  @override
  String get lessonOll => 'OLL em dois passos';

  @override
  String get lessonOllDesc => 'Ponha o topo todo amarelo.';

  @override
  String get stepOllCross => 'Primeiro as arestas';

  @override
  String get stepOllCrossBody =>
      'O OLL em dois passos começa com o algoritmo da cruz amarela que já conhece.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Com um canto amarelo virado para cima à frente à esquerda, o Sune (R U R\' U R U2 R\') orienta os outros três. A maioria dos outros casos usa o Sune e o seu espelho.';

  @override
  String get lessonPll => 'PLL em dois passos';

  @override
  String get lessonPllDesc => 'Termine o cubo.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'A T-perm troca dois cantos e duas arestas. Use-a para posicionar os cantos: segure à direita os dois cantos que têm de trocar.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Com os cantos feitos, a U-perm roda três arestas. Mantenha o lado já feito atrás.';

  @override
  String get lessonTwoFirst => 'Primeira camada do 2×2';

  @override
  String get lessonTwoFirstDesc => 'Forme uma face com cantos a condizer.';

  @override
  String get stepTwoIntro => 'Só cantos';

  @override
  String get stepTwoIntroBody =>
      'Um 2×2 é um 3×3 sem arestas nem centros. Escolha uma cor, forme essa face em baixo e faça condizer as cores laterais dos cantos vizinhos.';

  @override
  String get stepTwoCorner => 'Insira os cantos';

  @override
  String get stepTwoCornerBody =>
      'Tal como os cantos brancos do 3×3: leve um canto para cima do seu lugar e use R U R\' U\' até encaixar.';

  @override
  String get lessonTwoOll => 'Oriente o topo';

  @override
  String get lessonTwoOllDesc => 'OLL do Ortega com o Sune.';

  @override
  String get stepTwoSune => 'O Sune outra vez';

  @override
  String get stepTwoSuneBody =>
      'O Sune também põe o topo amarelo num 2×2. Quem usa o Ortega aprende sete casos curtos; o Sune e o seu espelho cobrem a maioria.';

  @override
  String get lessonTwoPbl => 'Permute as duas camadas';

  @override
  String get lessonTwoPblDesc => 'Troque cantos para terminar.';

  @override
  String get stepTwoAdjacent => 'Troca adjacente';

  @override
  String get stepTwoAdjacentBody =>
      'Quando dois cantos vizinhos de cima têm de trocar, segure-os à direita e use a T-perm.';

  @override
  String get stepTwoDiagonal => 'Troca diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Dois cantos em posições opostas trocam com a Y-perm.';

  @override
  String get lessonBigIntro => 'Peças dos cubos grandes';

  @override
  String get lessonBigIntroDesc =>
      'Centros, meias-arestas e camadas interiores.';

  @override
  String get stepBigPieces => 'Sem centros fixos';

  @override
  String get stepBigPiecesBody =>
      'Num 4×4, cada face tem quatro peças de centro que se movem, e cada aresta é feita de duas meias-arestas. A redução agrupa-as para o cubo se comportar como um 3×3.';

  @override
  String get stepBigSlices => 'Rotações duplas e interiores';

  @override
  String get stepBigSlicesBody =>
      'Rw roda as duas camadas da direita em conjunto. 2R roda só a segunda camada a contar da direita. Estas rotações movem centros e meias-arestas.';

  @override
  String get lessonBigCenters => 'Centros';

  @override
  String get lessonBigCentersDesc => 'Agrupe as peças de centro.';

  @override
  String get stepBigCenterCycle => 'Um 3-ciclo de centros';

  @override
  String get stepBigCenterCycleBody =>
      'Este comutador move exatamente três peças de centro e deixa tudo o resto igual, por isso os centros feitos continuam feitos.';

  @override
  String get lessonBigEdges => 'Emparelhar as arestas';

  @override
  String get lessonBigEdgesDesc =>
      'Junte as meias-arestas em arestas completas.';

  @override
  String get stepBigEdgePair => 'Emparelhar e repor';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' alinha duas meias-arestas iguais, R U R\' F R\' F\' R troca uma aresta por emparelhar e Uw repõe os centros.';

  @override
  String get lessonBigParity => 'Paridade';

  @override
  String get lessonBigParityDesc => 'Paridade de OLL e PLL em cubos pares.';

  @override
  String get stepBigOllParity => 'Paridade de OLL';

  @override
  String get stepBigOllParityBody =>
      'Uma única aresta virada é impossível num 3×3. Nos cubos pares, este algoritmo volta a virar a aresta de cima da frente. Pode baralhar o resto da camada de cima, o que os últimos passos do 3×3 corrigem de qualquer forma.';

  @override
  String get stepBigPllParity => 'Paridade de PLL';

  @override
  String get stepBigPllParityBody =>
      'Duas arestas trocadas mesmo no fim? 2R2 U2 2R2 Uw2 2R2 Uw2 troca as arestas de cima da frente e de trás.';

  @override
  String get introGoalHeading => 'Qual é o objetivo?';

  @override
  String get introHowHeading => 'Como se faz?';

  @override
  String get introStart => 'Percebi, começar passo a passo';

  @override
  String get introDontShowAgain => 'Não voltar a mostrar automaticamente';

  @override
  String get introShowGoal => 'Ver o objetivo';

  @override
  String get introStateStart => 'Início';

  @override
  String get introStateGoal => 'Objetivo';

  @override
  String get introPlayMorph => 'Reproduzir do início ao objetivo';

  @override
  String get introGoalBasics =>
      'Aprenda a ler o cubo: as peças, as seis faces e como as letras dos movimentos as rodam.';

  @override
  String get introGoalCross =>
      'Forme uma cruz branca em que cada aresta branca também combine com o centro ao lado.';

  @override
  String get introGoalCorners =>
      'Complete os quatro cantos brancos: a primeira coroa, toda a camada branca, fica pronta.';

  @override
  String get introGoalMiddle =>
      'Coloque as quatro arestas da camada do meio para resolver as duas primeiras camadas.';

  @override
  String get introGoalYellowCross =>
      'Forme uma cruz amarela em cima; as cores laterais ainda não precisam combinar.';

  @override
  String get introGoalYellowEdges =>
      'Alinhe cada aresta da cruz amarela com o centro do seu lado.';

  @override
  String get introGoalYellowCorners =>
      'Leve cada canto amarelo para o seu lugar, mesmo que ainda esteja torcido.';

  @override
  String get introGoalTwistCorners =>
      'Torça os cantos amarelos para a cor certa e o cubo fica resolvido.';

  @override
  String get introGoalCfopIntro =>
      'Conheça o plano do speedcubing: cruz, duas primeiras camadas e a última camada em dois passos.';

  @override
  String get introGoalF2l =>
      'Insira cada canto branco junto com a aresta do meio e termine duas camadas de uma vez.';

  @override
  String get introGoalOll =>
      'Deixe toda a face de cima amarela com um ou dois algoritmos.';

  @override
  String get introGoalPll =>
      'Leve as peças da última camada para o lugar e termine o cubo.';

  @override
  String get introGoalTwoFirst => 'Monte uma camada branca completa no 2×2.';

  @override
  String get introGoalTwoOll => 'Deixe toda a face de cima do 2×2 amarela.';

  @override
  String get introGoalTwoPbl =>
      'Troque os últimos cantos para o lugar e resolva o 2×2.';

  @override
  String get introGoalBigIntro =>
      'Conheça o 4×4: centros, pares de arestas e cantos, e os movimentos que os mexem.';

  @override
  String get introGoalBigCenters =>
      'Junte as peças de centro de cada face num bloco de uma só cor.';

  @override
  String get introGoalBigEdges =>
      'Junte as peças de aresta iguais para cada aresta parecer uma aresta de 3×3.';

  @override
  String get introGoalBigParity =>
      'Corrija os dois casos do 4×4 que um 3×3 nunca tem: uma aresta virada ou duas arestas trocadas.';

  @override
  String get introHowBasics =>
      'Os centros nunca se mexem: indicam a cor de cada face.\nCada letra roda uma face um quarto de volta no sentido horário.\nUm apóstrofo (\') roda para trás; um 2 roda duas vezes.';

  @override
  String get introHowCross =>
      'Segure o amarelo em cima: a cruz branca é feita em baixo.\nEncontre uma aresta branca e alinhe a cor lateral com o centro certo.\nRode essa face duas vezes para a descer para o lugar.';

  @override
  String get introHowCorners =>
      'Leve um canto branco para cima do seu espaço vazio.\nRepita R U R\' U\' até ele entrar na posição certa.\nFaça o mesmo com os outros três cantos.';

  @override
  String get introHowMiddle =>
      'Encontre uma aresta de cima sem amarelo e alinhe a cor da frente com um centro.\nMande-a para a direita ou para a esquerda com um algoritmo curto de 8 movimentos.\nA camada branca volta intacta todas as vezes.';

  @override
  String get introHowYellowCross =>
      'Olhe para o topo: um ponto, um L ou uma linha.\nSegure como na imagem e faça F R U R\' U\' F\'.\nRepita até a cruz amarela aparecer.';

  @override
  String get introHowYellowEdges =>
      'Rode o topo até duas arestas combinarem com os centros.\nColoque-as atrás e à direita e faça R U R\' U R U2 R\' U.\nRepita até as quatro combinarem.';

  @override
  String get introHowYellowCorners =>
      'Um canto está no lugar quando as cores combinam com as três faces à volta.\nMantenha um canto já colocado à frente, à direita.\nU R U\' L\' U R\' U\' L troca os outros três até todos encaixarem.';

  @override
  String get introHowTwistCorners =>
      'Segure um canto por resolver à frente, à direita.\nRepita R\' D\' R D até o amarelo ficar virado para cima.\nRode só o topo para o canto seguinte; a camada de baixo arruma-se sozinha no fim.';

  @override
  String get introHowCfopIntro =>
      'Cruz: quatro arestas planeadas durante a inspeção.\nF2L: cada canto entra junto com a sua aresta.\nA OLL põe o topo amarelo e a PLL leva as peças para o lugar.';

  @override
  String get introHowF2l =>
      'Encontre um canto e a aresta dele na camada de cima.\nJunte-os em par por cima do seu espaço.\nEncaixe o par com três ou quatro movimentos.';

  @override
  String get introHowOll =>
      'Primeiro a cruz amarela com F R U R\' U\' F\'.\nDepois oriente os cantos, por exemplo com o Sune.\nReconheça o caso pelo amarelo que vê.';

  @override
  String get introHowPll =>
      'O topo já está todo amarelo.\nA T-perm troca cantos; a U-perm move três arestas.\nLeia as cores laterais para escolher o algoritmo.';

  @override
  String get introHowTwoFirst =>
      'Um 2×2 só tem cantos, como um 3×3 sem arestas.\nLeve cada canto branco para cima do seu lugar.\nRepita R U R\' U\' até ele entrar.';

  @override
  String get introHowTwoOll =>
      'Mantenha a camada branca em baixo.\nO Sune (R U R\' U R U2 R\') roda os cantos de cima.\nRepita a partir do ângulo certo até o topo ficar todo amarelo.';

  @override
  String get introHowTwoPbl =>
      'Procure um lado onde dois cantos já combinam.\nTroca adjacente: um algoritmo no estilo T-perm.\nTroca diagonal: um algoritmo um pouco mais longo.';

  @override
  String get introHowBigIntro =>
      'Nenhum centro é fixo: quatro peças de centro formam a cor de cada face.\nRotações duplas como Rw rodam duas camadas de uma vez.\nRotações interiores como 2R rodam só uma camada interior.';

  @override
  String get introHowBigCenters =>
      'Monte primeiro dois centros opostos.\nAs camadas interiores trocam peças de centro sem desfazer os centros prontos.\nTermine os últimos quatro centros da mesma forma.';

  @override
  String get introHowBigEdges =>
      'Encontre duas peças de aresta com as mesmas cores.\nAlinhe-as lado a lado com uma camada interior.\nTire o par do caminho e devolva os centros ao lugar.';

  @override
  String get introHowBigParity =>
      'Resolva o 4×4 como um 3×3 até ficar preso.\nUma aresta virada: o algoritmo longo de paridade OLL.\nDuas arestas trocadas: 2R2 U2 2R2 Uw2 2R2 Uw2.';

  @override
  String get dirFaceR => 'Lado direito';

  @override
  String get dirFaceL => 'Lado esquerdo';

  @override
  String get dirFaceU => 'Fila de cima';

  @override
  String get dirFaceD => 'Fila de baixo';

  @override
  String get dirFaceF => 'Face da frente';

  @override
  String get dirFaceB => 'Face de trás';

  @override
  String get dirMiddle => 'Camada do meio';

  @override
  String get dirWholeCube => 'Cubo inteiro';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, camada $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth camadas de profundidade';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, camadas $near–$far';
  }

  @override
  String get dirUp => 'Para cima';

  @override
  String get dirDown => 'Para baixo';

  @override
  String get dirLeft => 'Para a esquerda';

  @override
  String get dirRight => 'Para a direita';

  @override
  String get dirClockwise => 'Sentido horário';

  @override
  String get dirCounter => 'Sentido anti-horário';

  @override
  String get dirBackClockwise => 'Sentido horário, visto de trás';

  @override
  String get dirBackCounter => 'Sentido anti-horário, visto de trás';

  @override
  String get dirHalf => 'Meia-volta (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Ocultar detalhes';

  @override
  String get solveExpand => 'Mostrar detalhes';

  @override
  String get dailyScrambleSteps => 'Baralhar passo a passo';

  @override
  String get dailyScrambleGuide => 'Guia de baralhar em 3D';

  @override
  String get dailyShowMoves => 'Mostrar movimentos em texto';

  @override
  String get dailyHideMoves => 'Ocultar movimentos em texto';

  @override
  String get dailyScrambleGuideTitle => 'Guia de baralhar';

  @override
  String get phaseDailyScramble => 'Baralhe o cubo de hoje';

  @override
  String get explainDailyScramble =>
      'Comece com um cubo resolvido, branco em cima e verde à frente, e copie cada rotação no seu cubo real.';

  @override
  String get stageCenters => 'Construir os blocos de centro';

  @override
  String get stageEdges => 'Emparelhar arestas exteriores e interiores';

  @override
  String get stageParity => 'Resolver a paridade';

  @override
  String get stageCrown1 => 'Primeira coroa (branca)';

  @override
  String get stageCrown2 => 'Segunda coroa';

  @override
  String get stageCrown3 => 'Terceira coroa (amarela)';

  @override
  String get stageOrient => 'Orientar as peças';

  @override
  String get stageFinish => 'Terminar o cubo';

  @override
  String get stageAsThree => 'Resolver como um 3×3';

  @override
  String get stageTwoByTwo => 'Resolver o 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Etapa $number de $total: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'Coroa $crown • Etapa $number de $total: $title';
  }

  @override
  String get solveAllStagesDone => 'Todas as etapas concluídas. Muito bem!';

  @override
  String get trackFiveByFive => '5×5 Cubo do Professor';

  @override
  String get trackSixBySix => 'Cubo 6×6';

  @override
  String get lessonFiveIntro => 'Conheça o 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Centros fixos, barras de centro, arestas do meio e asas.';

  @override
  String get introGoalFiveIntro =>
      'Conheça o 5×5: centros fixos, barras de centro, arestas do meio e asas.';

  @override
  String get introHowFiveIntro =>
      'A peça do meio de cada face nunca se mexe.\nCada aresta é uma peça do meio com duas asas.\nAs camadas interiores mexem peças sem tocar no exterior.';

  @override
  String get lessonFiveCenters => 'Centros do 5×5';

  @override
  String get lessonFiveCentersDesc => 'Monte cada centro com barras de três.';

  @override
  String get introGoalFiveCenters =>
      'Monte em cada face um bloco de centro 3×3 de uma só cor.';

  @override
  String get introHowFiveCenters =>
      'Comece pela peça do meio: ela indica a cor.\nFaça barras de três e deslize-as com uma camada interior.\nTermine juntos os dois últimos centros.';

  @override
  String get lessonFiveEdges => 'Arestas do 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Junte duas asas à aresta do meio.';

  @override
  String get introGoalFiveEdges =>
      'Junte cada aresta do meio às suas duas asas para as 12 arestas parecerem peças únicas.';

  @override
  String get introHowFiveEdges =>
      'Alinhe duas asas com a aresta do meio à frente.\nRode a camada interior, troque uma aresta por resolver e volte.\nEmparelhe as últimas arestas sem desfazer as prontas.';

  @override
  String get lessonFiveSolve => 'Resolva o 5×5 como um 3×3';

  @override
  String get lessonFiveSolveDesc => 'Termine com as três coroas.';

  @override
  String get introGoalFiveSolve =>
      'Resolva o 5×5 reduzido como um 3×3, coroa a coroa.';

  @override
  String get introHowFiveSolve =>
      'A partir de agora, só rotações exteriores.\nPrimeira coroa, segunda coroa e depois a amarela.\nOs centros fixos mostram a cor de cada face.';

  @override
  String get lessonFiveParity => 'Paridade de arestas do 5×5';

  @override
  String get lessonFiveParityDesc => 'Corrija a aresta com as asas trocadas.';

  @override
  String get introGoalFiveParity =>
      'Corrija a única aresta com as duas asas trocadas e termine.';

  @override
  String get introHowFiveParity =>
      'Aparece como uma aresta que não emparelha.\nFaça uma vez a correção longa de camadas interiores.\nTodo o resto volta ao lugar.';

  @override
  String get lessonSixIntro => 'Conheça o 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Sem centros fixos e quatro peças em cada aresta.';

  @override
  String get introGoalSixIntro =>
      'Conheça o 6×6: dezasseis peças de centro por face e quatro peças por aresta.';

  @override
  String get introHowSixIntro =>
      'Nenhum centro é fixo: você escolhe as cores ao montar.\nCada aresta tem asas exteriores e interiores.\nAs rotações duplas podem mexer até três camadas.';

  @override
  String get lessonSixCenters => 'Centros do 6×6';

  @override
  String get lessonSixCentersDesc => 'Monte centros 4×4 com barras de quatro.';

  @override
  String get introGoalSixCenters =>
      'Monte em cada face um bloco de centro 4×4 de uma só cor.';

  @override
  String get introHowSixCenters =>
      'Monte primeiro dois centros opostos.\nFaça barras de quatro e junte-as.\nMova peças soltas com o truque camada, topo, desfazer.';

  @override
  String get lessonSixEdges => 'Arestas do 6×6';

  @override
  String get lessonSixEdgesDesc => 'Junte as quatro peças de cada aresta.';

  @override
  String get introGoalSixEdges =>
      'Junte as quatro peças de cada aresta para o 6×6 ter 12 arestas limpas.';

  @override
  String get introHowSixEdges =>
      'Alinhe à frente as asas exteriores e interiores.\nA camada dupla profunda leva uma aresta para dentro e para fora.\nAs arestas prontas nunca se desfazem.';

  @override
  String get lessonSixSolve => 'Resolva o 6×6 como um 3×3';

  @override
  String get lessonSixSolveDesc => 'Termine com as três coroas.';

  @override
  String get introGoalSixSolve =>
      'Resolva o 6×6 reduzido como um 3×3, coroa a coroa.';

  @override
  String get introHowSixSolve =>
      'A partir de agora, só rotações exteriores.\nOs centros que montou mostram a cor de cada face.\nPrimeira coroa, segunda coroa e depois a amarela.';

  @override
  String get lessonSixParity => 'Paridade do 6×6';

  @override
  String get lessonSixParityDesc => 'Uma aresta virada ou duas trocadas.';

  @override
  String get introGoalSixParity =>
      'Corrija os dois casos do 6×6 que um 3×3 nunca tem: uma aresta virada ou duas arestas trocadas.';

  @override
  String get introHowSixParity =>
      'Resolva como um 3×3 até travar.\nUma aresta virada: a correção longa de paridade.\nDuas arestas trocadas: a correção curta de giros duplos.';

  @override
  String get stepFivePieces => 'As peças do 5×5';

  @override
  String get stepFivePiecesBody =>
      'A peça do meio de cada face nunca se mexe, por isso continua a indicar a cor, como num 3×3. À volta há mais oito peças de centro; cada aresta tem uma peça do meio e duas asas, e os cantos funcionam como num 3×3.';

  @override
  String get stepFiveSlices => 'Três tipos de rotações';

  @override
  String get stepFiveSlicesBody =>
      'Uma rotação exterior mexe uma face. Uma rotação dupla mexe uma face com a camada de trás. Uma rotação de camada interior mexe só uma camada de dentro: é assim que as peças trocam de lugar sem tocar no exterior.';

  @override
  String get stepFiveCenterBar => 'Barras de centro';

  @override
  String get stepFiveCenterBarBody =>
      'Faça uma fila de três peças de centro iguais e deslize-a para junto do centro da mesma cor com uma rotação de camada interior. Três barras formam um centro pronto.';

  @override
  String get stepFiveCenterSwap => 'Trocar sem desfazer';

  @override
  String get stepFiveCenterSwapBody =>
      'Para mexer uma só peça de centro: rode uma camada interior, rode o topo, desfaça a camada e volte o topo. Os centros prontos voltam sempre.';

  @override
  String get stepFiveEdgePair => 'Emparelhar asas com a aresta do meio';

  @override
  String get stepFiveEdgePairBody =>
      'Alinhe duas asas junto à aresta do meio à frente, desça a camada interior, traga de cima uma aresta por resolver e volte a camada interior.';

  @override
  String get stepFiveEdgeLast => 'As últimas arestas';

  @override
  String get stepFiveEdgeLastBody =>
      'Com poucas arestas, uma rotação dupla, um gatilho curto e a rotação dupla de volta emparelham-nas sem desfazer as prontas.';

  @override
  String get stepFiveAsThree => 'Agora é um 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Com centros e arestas prontos, o 5×5 comporta-se como um 3×3 grande. Use só rotações exteriores e siga as três coroas: cruz e cantos brancos, camada do meio e camada amarela.';

  @override
  String get stepFiveEdgeParity => 'Trocar as asas da última aresta';

  @override
  String get stepFiveEdgeParityBody =>
      'Às vezes a última aresta tem as duas asas trocadas. Um algoritmo longo de camadas interiores destroca-as e todo o resto volta ao lugar. Depois termine como um 3×3.';

  @override
  String get stepSixPieces => 'As peças do 6×6';

  @override
  String get stepSixPiecesBody =>
      'Como o 4×4, o 6×6 não tem centro fixo: dezasseis peças de centro formam a cor de cada face. Cada aresta tem quatro peças: duas asas exteriores e duas interiores.';

  @override
  String get stepSixSlices => 'Rodar camadas mais fundas';

  @override
  String get stepSixSlicesBody =>
      'As rotações duplas podem mexer duas ou três camadas a partir de uma face. As camadas interiores, segunda e terceira, são as ferramentas para centros e arestas.';

  @override
  String get stepSixCenterBar => 'Barras de quatro';

  @override
  String get stepSixCenterBarBody =>
      'Faça filas de quatro peças de centro iguais e deslize-as lado a lado com rotações de camada interior até a face ficar de uma só cor.';

  @override
  String get stepSixCenterSwap => 'Uma peça de cada vez';

  @override
  String get stepSixCenterSwapBody =>
      'Rode a terceira camada, rode o topo, desfaça e volte: uma peça de centro muda e os centros prontos regressam.';

  @override
  String get stepSixEdgePair => 'Quatro peças, uma aresta';

  @override
  String get stepSixEdgePairBody =>
      'Junte à frente as quatro peças de uma aresta com a camada dupla profunda, traga uma aresta por resolver e volte a camada dupla.';

  @override
  String get stepSixEdgeLast => 'As últimas arestas';

  @override
  String get stepSixEdgeLastBody =>
      'Emparelhe as arestas finais com um gatilho curto entre uma rotação dupla profunda e o seu desfazer, para as arestas prontas continuarem unidas.';

  @override
  String get stepSixAsThree => 'Agora é um 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Com centros 4×4 e arestas emparelhadas, resolva o 6×6 como um 3×3 com rotações exteriores e as três coroas.';

  @override
  String get stepSixOllParity => 'Uma aresta virada';

  @override
  String get stepSixOllParityBody =>
      'Se uma só aresta parecer virada ao resolver a última camada, é paridade. Ponha-a à frente na camada de cima e faça a correção longa: as duas primeiras coroas voltam intactas.';

  @override
  String get stepSixPllParity => 'Duas arestas trocadas';

  @override
  String get stepSixPllParityBody =>
      'Se duas arestas parecerem trocadas no fim, ponha-as à frente e atrás na camada de cima e faça a correção curta de rotações duplas interiores.';

  @override
  String get stageTwoFirstLayer => 'Monte a camada de baixo';

  @override
  String get stageTwoTopColor => 'Deixe o topo de uma só cor';

  @override
  String get stageTwoFinish => 'Termine os cantos';

  @override
  String get explainTwoFirstLayer =>
      'Complete a camada de baixo: os quatro cantos combinam entre si e com as cores laterais.';

  @override
  String get explainTwoTopColor =>
      'Rode até os quatro autocolantes de cima ficarem da mesma cor, sem desfazer a camada de baixo.';

  @override
  String get explainTwoFinish =>
      'Leve os últimos cantos para o lugar e termine o cubo.';

  @override
  String get tabSolve => 'Resolver';

  @override
  String get tabScan => 'Digitalizar';

  @override
  String get tabAcademy => 'Academia';

  @override
  String get tabTrain => 'Treinar';

  @override
  String get openCubeSolver => 'Abrir cubo 3D e solucionador';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Treino';

  @override
  String get trainSubtitle => 'Aperfeiçoe as suas competências todos os dias.';

  @override
  String get settings => 'Definições';

  @override
  String get settingsSoundHaptics => 'Som e vibração';

  @override
  String get settingsSoundHapticsDesc => 'Cliques e vibrações ao rodar o cubo.';

  @override
  String get settingsAnimationSpeed => 'Velocidade de animação predefinida';

  @override
  String get settingsAnimationSpeedDesc =>
      'A rapidez com que o cubo roda ao reproduzir movimentos.';

  @override
  String get settingsResetProgress => 'Repor progresso';

  @override
  String get settingsResetProgressDesc =>
      'Apaga as lições concluídas da Academia e a sua sequência diária.';

  @override
  String get resetProgressTitle => 'Repor todo o progresso?';

  @override
  String get resetProgressBody =>
      'As lições concluídas e a sequência diária serão apagadas. Não é possível anular.';

  @override
  String get resetProgressDone => 'Progresso reposto.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get settingsPrivacyAds => 'Privacidade e anúncios';

  @override
  String get settingsPrivacyAdsDesc =>
      'Reveja ou altere as suas opções de consentimento de anúncios.';

  @override
  String get playbackPrevious => 'Anterior';

  @override
  String get playbackNext => 'Seguinte';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Resolvido em $count movimentos!',
      one: 'Resolvido em 1 movimento!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Ajude a criar a próxima versão';

  @override
  String get feedbackBody =>
      'Quer sugerir uma funcionalidade ou influenciar a próxima versão do CubeMentor? Escreva-nos para:';

  @override
  String get feedbackEmailCopied =>
      'Não encontrámos uma app de e-mail, por isso copiámos o endereço para a área de transferência.';

  @override
  String get adWatchToUnlock => 'Ver anúncio';

  @override
  String get adLoading => 'A carregar um vídeo curto…';

  @override
  String get adRewardNotEarned => 'Veja o vídeo até ao fim para desbloquear.';

  @override
  String get adUnavailableFreePass =>
      'Nenhum vídeo disponível agora — desbloqueado grátis desta vez.';

  @override
  String get settingsPrivacyAdsError =>
      'Não foi possível abrir as opções de privacidade. Tente mais tarde.';

  @override
  String get nicknamePromptTitle => 'Qual é o seu nome?';

  @override
  String get nicknamePromptBody =>
      'Vamos festejar cada resolução com o seu nome.';

  @override
  String get nicknameHint => 'O seu nome ou alcunha';

  @override
  String get nicknameGo => 'Vamos lá';

  @override
  String get nicknameSkip => 'Saltar';

  @override
  String get nicknameSave => 'Guardar';

  @override
  String get settingsNickname => 'O seu nome';

  @override
  String get settingsNicknameNotSet => 'Não definido — toque para adicionar';

  @override
  String celebrateNamed(String name) {
    return 'Muito bem, $name!';
  }

  @override
  String get celebrateAnon => 'Muito bem!';

  @override
  String get celebrateCubeSolved => 'Cubo resolvido!';

  @override
  String get celebrateDailyDone => 'Desafio diário concluído!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit movimentos',
      one: '$count / 1 movimento',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other:
          'Qualquer mistura pode ser resolvida em $limit movimentos ou menos',
      one: 'Qualquer mistura pode ser resolvida em 1 movimento ou menos',
    );
    return '$_temp0';
  }

  @override
  String get patternsUnlockTitle => 'Desbloquear todos os padrões';

  @override
  String patternsUnlockPrompt(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Veja 1 vídeo curto para desbloquear todos os padrões durante $minutes minutos',
      one: 'Veja 1 vídeo curto para desbloquear todos os padrões durante 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Ver vídeo';

  @override
  String get patternsNotNow => 'Agora não';

  @override
  String patternsUnlockedLeft(String time) {
    return 'Desbloqueado • faltam $time';
  }

  @override
  String get patternsExpiredTitle => 'A sua pré-visualização terminou';

  @override
  String patternsExpiredBody(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Veja 1 vídeo para manter todos os padrões desbloqueados por mais $minutes minutos!',
      one: 'Veja 1 vídeo para manter todos os padrões desbloqueados por mais 1 minuto!',
    );
    return '$_temp0';
  }

  @override
  String get patternsFreeSample => 'Grátis';

  @override
  String get settingsColorScheme => 'Esquema de cores do cubo';

  @override
  String get colorSchemeWestern => 'Ocidental';

  @override
  String get colorSchemeJapanese => 'Japonês';

  @override
  String get colorSchemeWesternDesc =>
      'Branco oposto ao amarelo, azul oposto ao verde';

  @override
  String get colorSchemeJapaneseDesc =>
      'Branco oposto ao azul, amarelo oposto ao verde';

  @override
  String get leaderboardTitle => 'Classificação diária';

  @override
  String get leaderboardView => 'Ver classificação';

  @override
  String get leaderboardReminder => 'Ainda não resolveste o desafio de hoje!';

  @override
  String leaderboardSolvedToday(int count, String countText) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countText jogadores resolveram-no hoje',
      one: '$countText jogador resolveu-o hoje',
    );
    return '$_temp0';
  }

  @override
  String leaderboardAvgTime(String time) {
    return 'Tempo médio: $time';
  }

  @override
  String leaderboardRankOf(String rank, String total) {
    return '#$rank de $total';
  }

  @override
  String leaderboardYourTime(String time) {
    return 'O teu tempo: $time';
  }

  @override
  String get leaderboardYou => 'Tu';

  @override
  String get leaderboardNotRanked =>
      'Resolve o desafio de hoje para entrares na classificação.';

  @override
  String get leaderboardJumpToMe => 'Ir para a minha posição';

  @override
  String get leaderboardAnonymous => 'Anónimo';

  @override
  String get leaderboardLive =>
      'Classificação mundial em direto: jogadores reais, atualizada em tempo real.';

  @override
  String get leaderboardConnecting => 'A ligar à classificação em direto…';

  @override
  String get leaderboardOffline =>
      'Estás sem ligação. A classificação em direto aparece quando voltares a ligar-te.';

  @override
  String get leaderboardCached =>
      'Sem ligação: a mostrar a última classificação guardada neste dispositivo.';

  @override
  String get leaderboardPendingSync =>
      'O teu tempo está guardado e entra na classificação quando voltares a estar online.';

  @override
  String get leaderboardBeFirst =>
      'Ainda ninguém resolveu o desafio de hoje. Sê o primeiro!';

  @override
  String get leaderboardRetry => 'Tentar novamente';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Escaneie, resolva e domine qualquer cubo, do 2×2 ao 6×6.';

  @override
  String get chooseCubeSize => 'Escolha seu cubo';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Iniciante';

  @override
  String get cubeLevel3 => 'Clássico';

  @override
  String get cubeLevel4 => 'Avançado';

  @override
  String get cubeLevel5 => 'Especialista';

  @override
  String get cubeLevel6 => 'Mestre';

  @override
  String get cubeComingSoon => 'Novo cubo em breve';

  @override
  String get carouselPrevious => 'Cubo anterior';

  @override
  String get carouselNext => 'Próximo cubo';

  @override
  String get chooseMode => 'O que você quer fazer?';

  @override
  String get modePlayground => 'Área 3D';

  @override
  String get modePlaygroundDesc =>
      'Gire camadas, embaralhe e repita movimentos em 3D.';

  @override
  String get modeScanSolve => 'Escanear e resolver';

  @override
  String get modeScanSolveDesc =>
      'Escaneie seu cubo com a câmera e receba uma solução.';

  @override
  String get modeAcademy => 'Academia';

  @override
  String get modeAcademyDesc => 'Aprenda passo a passo com aulas interativas.';

  @override
  String get language => 'Idioma';

  @override
  String get languageSearch => 'Buscar idioma';

  @override
  String get languageNoResults => 'Nenhum idioma corresponde à sua busca.';

  @override
  String playgroundTitle(int size) {
    return 'Área 3D $size×$size';
  }

  @override
  String get scramble => 'Embaralhar';

  @override
  String get reset => 'Reiniciar';

  @override
  String get undo => 'Desfazer';

  @override
  String get speed => 'Velocidade';

  @override
  String get xray => 'Raio X';

  @override
  String get prime => 'Anti-horário';

  @override
  String get wide => 'Dupla';

  @override
  String layer(int index) {
    return 'Camada $index';
  }

  @override
  String get cubeRotations => 'Rotações';

  @override
  String get play => 'Reproduzir';

  @override
  String get pause => 'Pausar';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count movimentos',
      one: '1 movimento',
      zero: 'Nenhum movimento',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Resolvido';

  @override
  String get scrambled => 'Embaralhado';

  @override
  String get orbitHint =>
      'Arraste uma fileira para girá-la · Arraste o fundo para girar a visão';

  @override
  String get notationPad => 'Teclado de notação';

  @override
  String get solve => 'Resolver';

  @override
  String get solving => 'Resolvendo…';

  @override
  String get solveFast => 'Solução rápida';

  @override
  String get solveLearn => 'Aprender passo a passo';

  @override
  String get solveModeGuided => 'Guiado (3 coroas)';

  @override
  String get solveModeFast => 'Rápido (ótimo)';

  @override
  String solveUnavailable(int size) {
    return 'O resolvedor de $size×$size chega em uma atualização futura.';
  }

  @override
  String get solveAlreadySolved => 'O cubo já está resolvido.';

  @override
  String solveFailed(String reason) {
    return 'Este cubo não pode ser resolvido ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'O motor de resolução não está disponível neste aparelho.';

  @override
  String get solveComplete => 'Resolvido! Mandou bem.';

  @override
  String solveSummary(int count) {
    return '$count movimentos';
  }

  @override
  String get nextMove => 'Próximo movimento';

  @override
  String get previousMove => 'Movimento anterior';

  @override
  String get halfTurnHalfway =>
      'Boa, já está na metade! Gire mais uma vez no mesmo sentido para fazer a meia-volta (180°).';

  @override
  String get wideTurnInner =>
      'Ótimo! Agora deslize a camada interna vizinha para completar o giro duplo.';

  @override
  String get wideTurnOuter =>
      'Ótimo! Agora deslize a camada externa vizinha para completar o giro duplo.';

  @override
  String get wideTurnMore =>
      'Ótimo! Continue deslizando as camadas iluminadas, uma de cada vez, para completar o giro duplo.';

  @override
  String get guideSwipeHint =>
      'Deslize a camada iluminada na direção da seta ou toque em Próximo.';

  @override
  String get guideRotateHint =>
      'Gire o cubo inteiro como a seta mostra: toque em Próximo.';

  @override
  String get guideWrongMove => 'Siga a seta destacada';

  @override
  String get guideExit => 'Sair do guia';

  @override
  String get colorWhite => 'branco';

  @override
  String get colorYellow => 'amarelo';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'azul';

  @override
  String get colorRed => 'vermelho';

  @override
  String get colorOrange => 'laranja';

  @override
  String get phaseOptimal2x2 => 'Solução ótima';

  @override
  String get phaseKociemba1 => 'Fase 1 · Orientar as peças';

  @override
  String get phaseKociemba2 => 'Fase 2 · Terminar o cubo';

  @override
  String get phaseLblCross => 'Cruz branca';

  @override
  String get phaseLblCorners => 'Quinas da primeira coroa';

  @override
  String get phaseLblMiddle => 'Meios da camada do meio';

  @override
  String get phaseLblYellowCross => 'Cruz amarela';

  @override
  String get phaseLblYellowEdges => 'Alinhar os meios da cruz amarela';

  @override
  String get phaseLblYellowCorners => 'Posicionar as quinas amarelas';

  @override
  String get phaseLblYellowCornersOrient => 'Orientar as quinas amarelas';

  @override
  String get crownFirst => 'Primeira coroa';

  @override
  String get crownSecond => 'Segunda coroa';

  @override
  String get crownThird => 'Terceira coroa';

  @override
  String get crownFirstGoal => 'Face branca e primeira camada';

  @override
  String get crownSecondGoal => 'Camada do meio';

  @override
  String get crownThirdGoal => 'Face amarela e última camada';

  @override
  String get subStepGoal11 =>
      'Monte uma cruz branca em que cada meio branco também combine com o centro ao lado.';

  @override
  String get subStepGoal12 =>
      'Encaixe as 4 quinas brancas nos seus lugares para completar a face branca e todo o primeiro anel.';

  @override
  String get subStepGoal21 =>
      'Encaixe os 4 meios da camada do meio sem desfazer a primeira coroa.';

  @override
  String get subStepGoal31 => 'Monte uma cruz amarela na última camada.';

  @override
  String get subStepGoal32 =>
      'Troque os meios da cruz amarela até cada um combinar com o centro do seu lado.';

  @override
  String get subStepGoal33 =>
      'Leve as 4 quinas amarelas para os lugares certos, mesmo que ainda estejam torcidas.';

  @override
  String get subStepGoal34 =>
      'Gire cada quina amarela no lugar até todos os adesivos combinarem e o cubo ficar resolvido.';

  @override
  String get explainOptimal2x2 =>
      'A solução mais curta possível, encontrada analisando todas as posições do 2×2.';

  @override
  String get explainKociemba1 =>
      'Oriente todas as peças e leve os meios da camada do meio para a camada do meio.';

  @override
  String get explainKociemba2 =>
      'Termine só com U, D e meias-voltas, que mantêm essa orientação.';

  @override
  String get explainLblOrient =>
      'Gire o cubo inteiro para que o centro branco fique para baixo.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Leve o meio $piece para baixo, ao lado do centro branco, com a cor lateral combinando.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'A quina $piece está presa no lugar errado. Suba-a com R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Gire a camada de cima até a quina $piece ficar sobre o seu espaço.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Repita R U R\' U\' até a quina $piece encaixar no lugar.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'O meio $piece está na camada do meio, mas errado. Tire-o para cima.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Gire a camada de cima para a cor lateral do meio $piece combinar com o centro.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Insira o meio $piece à direita: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Insira o meio $piece à esquerda: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Gire a camada de cima para posicionar a forma amarela para o próximo algoritmo.';

  @override
  String get explainLblYellowCrossAlg =>
      'Monte a cruz amarela com F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Gire a camada de cima para alinhar os meios amarelos com seus centros.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Troque meios amarelos com R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Leve as quinas amarelas para seus lugares com U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Gire a camada de cima para trazer a próxima quina amarela não resolvida para a frente à direita.';

  @override
  String get explainLblCornerTwist =>
      'Repita R\' D\' R D até o amarelo ficar para cima. A camada de baixo se arruma sozinha no final.';

  @override
  String get explainLblFinalAlign =>
      'Gire a camada de cima para terminar o cubo.';

  @override
  String scanTitle(int size) {
    return 'Escanear $size×$size';
  }

  @override
  String get scanManualInput => 'Inserir cores manualmente';

  @override
  String get scanUseCamera => 'Escanear com a câmera';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Face $current de $total';
  }

  @override
  String get faceUp => 'Face de cima';

  @override
  String get faceRight => 'Face direita';

  @override
  String get faceFront => 'Face da frente';

  @override
  String get faceDown => 'Face de baixo';

  @override
  String get faceLeft => 'Face esquerda';

  @override
  String get faceBack => 'Face de trás';

  @override
  String get scanHintFront =>
      'Segure o cubo com qualquer face virada para você. Essa é a sua frente: mantenha a mesma face em cima enquanto escaneia.';

  @override
  String get scanHintRight =>
      'A partir da frente, gire o cubo inteiro uma vez para a esquerda, para que a face direita fique virada para você.';

  @override
  String get scanHintBack =>
      'A partir da frente, gire o cubo inteiro duas vezes para a esquerda.';

  @override
  String get scanHintLeft =>
      'A partir da frente, gire o cubo inteiro uma vez para a direita.';

  @override
  String get scanHintUp =>
      'A partir da frente, incline o topo na sua direção para que ele fique virado para a câmera.';

  @override
  String get scanHintDown =>
      'A partir da frente, incline a base na sua direção para que ela fique virada para a câmera.';

  @override
  String get scanAlignHint =>
      'Preencha a grade com a face e toque no obturador.';

  @override
  String get scanCapture => 'Capturar face';

  @override
  String get scanTurnLeft => 'Gire o cubo inteiro para a esquerda';

  @override
  String get scanTurnRight => 'Gire o cubo inteiro para a direita';

  @override
  String get scanTipTop => 'Incline o topo na sua direção';

  @override
  String get scanTipBottom => 'Incline a base na sua direção';

  @override
  String get scanGlareTip =>
      'Reflexo detectado: incline um pouco o cubo ou segure o celular acima dele para bloquear a luz do teto.';

  @override
  String get scanDimTip =>
      'Pouca luz: vá para um lugar mais iluminado ou ligue a lanterna.';

  @override
  String get scanTorch => 'Lanterna';

  @override
  String get scanGuideLabel =>
      'Guia de escaneamento: as faces escaneadas aparecem em cores. Toque em uma face escaneada para escaneá-la de novo.';

  @override
  String get scanTapToRescan =>
      'Toque em uma face escaneada para escaneá-la de novo.';

  @override
  String get scanCameraMissing => 'Nenhuma câmera encontrada neste aparelho.';

  @override
  String get scanCameraDenied =>
      'O acesso à câmera foi negado. Você ainda pode inserir as cores manualmente.';

  @override
  String get scanCameraFailed => 'Não foi possível iniciar a câmera.';

  @override
  String get scanAllGood => 'Todos os adesivos parecem corretos.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adesivos parecem errados',
      one: '1 adesivo parece errado',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Alguma coisa não bate';

  @override
  String scanIssueColors(int count) {
    return 'Cada cor deve aparecer exatamente $count vezes.';
  }

  @override
  String get scanIssueCenters => 'Dois centros têm a mesma cor.';

  @override
  String get scanIssuePieces =>
      'Esses adesivos formam peças que não existem em um cubo de verdade.';

  @override
  String get scanIssueTwist =>
      'Uma quina está torcida. Confira os adesivos das quinas.';

  @override
  String get scanIssueFlip =>
      'Um meio está invertido. Confira os adesivos dos meios.';

  @override
  String get scanIssueParity => 'Parece que duas peças estão trocadas.';

  @override
  String get scanIssueUnavailable =>
      'A verificação de cores não está disponível neste aparelho.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adesivos foram difíceis de ler: dê uma olhada rápida.',
      one: 'Um adesivo foi difícil de ler: dê uma olhada rápida.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Toque em um adesivo para mudar a cor · Toque e segure para ver a paleta';

  @override
  String get scanRescanFace => 'Escanear uma face de novo';

  @override
  String get scanCancelRescan => 'Voltar às cores';

  @override
  String get scanPaletteTitle => 'Escolha uma cor';

  @override
  String get scanOpen3d => 'Abrir em 3D';

  @override
  String get scanRestart => 'Recomeçar';

  @override
  String get modeTimer => 'Cronômetro';

  @override
  String get modeTimerDesc =>
      'Embaralhamentos, inspeção, médias e recordes pessoais.';

  @override
  String get modeDaily => 'Desafio diário';

  @override
  String get modeDailyDesc =>
      'Um embaralhamento novo todo dia. Mantenha sua sequência.';

  @override
  String get modePatterns => 'Biblioteca de padrões';

  @override
  String get modePatternsDesc => 'Xadrez, superflip e muito mais, em 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sequência de $count dias',
      one: 'Sequência de 1 dia',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Continuar aprendendo';

  @override
  String get startLearning => 'Começar a aprender';

  @override
  String lessonOf(int index, int total) {
    return 'Aula $index de $total';
  }

  @override
  String get academyAllDone => 'Todas as aulas concluídas!';

  @override
  String get academyTitle => 'Academia';

  @override
  String academyProgress(int done, int total) {
    return '$done de $total aulas concluídas';
  }

  @override
  String get lessonAdvanced => 'Avançado';

  @override
  String lessonPartOf(int index, int total) {
    return 'Parte $index de $total';
  }

  @override
  String get lessonNext => 'Próximo';

  @override
  String get lessonPrevious => 'Anterior';

  @override
  String get lessonFinish => 'Concluir aula';

  @override
  String get lessonComplete => 'Aula concluída!';

  @override
  String get lessonNextLesson => 'Próxima aula';

  @override
  String get lessonBackToAcademy => 'Voltar à Academia';

  @override
  String get lessonTryIt =>
      'Sua vez: deslize a camada que a seta mostra ou toque em Próximo.';

  @override
  String get lessonLookAround =>
      'Arraste o fundo para ver o cubo de todos os lados.';

  @override
  String get lessonDemoDone => 'Boa! Toque em Próximo para continuar.';

  @override
  String holdPrompt(String top, String front) {
    return 'Segure o cubo com o centro $top em cima e o centro $front virado para você.';
  }

  @override
  String get trackBeginner => '3×3 iniciante: as 3 coroas';

  @override
  String get trackCfop => 'Introdução ao CFOP';

  @override
  String get trackTwoByTwo => '2×2 iniciante e Ortega';

  @override
  String get trackBigCubes => 'Cubos grandes: redução e paridade';

  @override
  String moveSentence(String layer, String direction) {
    return 'Gire $layer $direction';
  }

  @override
  String get moveFaceR => 'a face direita';

  @override
  String get moveFaceL => 'a face esquerda';

  @override
  String get moveFaceU => 'a face de cima';

  @override
  String get moveFaceD => 'a face de baixo';

  @override
  String get moveFaceF => 'a face da frente';

  @override
  String get moveFaceB => 'a face de trás';

  @override
  String moveLayerInner(int depth, String face) {
    return 'a camada $depth a partir de $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth camadas de profundidade)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'as camadas $near–$far a partir de $face';
  }

  @override
  String get moveLayerMiddle => 'a camada do meio';

  @override
  String get moveDirUp => 'para cima';

  @override
  String get moveDirDown => 'para baixo';

  @override
  String get moveDirLeft => 'para a esquerda';

  @override
  String get moveDirRight => 'para a direita';

  @override
  String get moveDirClockwise => 'no sentido horário';

  @override
  String get moveDirCounter => 'no sentido anti-horário';

  @override
  String get moveDirBackClockwise => 'no sentido horário, visto de trás';

  @override
  String get moveDirBackCounter => 'no sentido anti-horário, visto de trás';

  @override
  String get moveDirHalf => 'meia-volta (duas vezes)';

  @override
  String get moveRotateX => 'Incline o cubo inteiro: a frente sobe para o topo';

  @override
  String get moveRotateXPrime =>
      'Incline o cubo inteiro: a frente desce para a base';

  @override
  String get moveRotateX2 => 'Vire o cubo inteiro: a frente vai para trás';

  @override
  String get moveRotateY => 'Gire o cubo inteiro: a frente vai para a esquerda';

  @override
  String get moveRotateYPrime =>
      'Gire o cubo inteiro: a frente vai para a direita';

  @override
  String get moveRotateY2 =>
      'Gire o cubo inteiro meia-volta: a parte de trás vem para a frente';

  @override
  String get moveRotateZ =>
      'Role o cubo inteiro no sentido horário: o topo vai para a direita';

  @override
  String get moveRotateZPrime =>
      'Role o cubo inteiro no sentido anti-horário: o topo vai para a esquerda';

  @override
  String get moveRotateZ2 =>
      'Vire o cubo inteiro de cabeça para baixo: o topo vai para a base';

  @override
  String get phaseReductionCenters => 'Centros';

  @override
  String get phaseReductionEdges => 'Parear os meios';

  @override
  String get phaseReductionEdgeParity => 'Paridade de meios';

  @override
  String get phaseReductionOllParity => 'Paridade de OLL';

  @override
  String get phaseReductionPllParity => 'Paridade de PLL';

  @override
  String get explainReductionCenterBlock =>
      'Giros de camadas internas que levam várias peças de centro para casa de uma vez.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Leve uma peça de centro $piece para a sua face com um 3-ciclo que não mexe nos centros prontos.';
  }

  @override
  String get explainReductionParityCenters =>
      'Refaça os centros que o giro de paridade mexeu.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Junte as peças do meio $piece com um 3-ciclo; os centros continuam resolvidos.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Os últimos meios não podem ser pareados só com 3-ciclos (paridade de meios). Um giro de camada interna resolve isso.';

  @override
  String get explainReductionOllParity =>
      'Paridade de OLL: um meio está invertido, o que é impossível em um 3×3. Este algoritmo o desvira.';

  @override
  String get explainReductionPllParity =>
      'Paridade de PLL: dois meios estão trocados, o que é impossível em um 3×3. Este algoritmo os destroca.';

  @override
  String get patternsTitle => 'Biblioteca de padrões';

  @override
  String get patternsHint =>
      'Toque em um padrão para assistir e depois repita no seu próprio cubo.';

  @override
  String get patternCheckerboard => 'Xadrez';

  @override
  String get patternCubeInCube => 'Cubo dentro do cubo';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Pontos';

  @override
  String get patternCross => 'Cruz';

  @override
  String get patternPython => 'Píton';

  @override
  String get phasePattern => 'Monte o padrão';

  @override
  String get explainPatternStep =>
      'Siga cada movimento no seu próprio cubo. Toque em Resolver para voltar ao normal.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Cronômetro';

  @override
  String get timerHoldToStart => 'Segure e solte para começar';

  @override
  String get timerReleaseToStart => 'Solte para começar';

  @override
  String get timerTapToStop => 'Toque em qualquer lugar para parar';

  @override
  String get timerInspecting => 'Inspeção: segure e solte para começar';

  @override
  String get timerTapToInspect =>
      'Toque para iniciar a inspeção de 15 segundos';

  @override
  String get timerInspectionToggle => 'Inspeção de 15 s';

  @override
  String get timerLoadingScramble => 'Gerando um embaralhamento…';

  @override
  String get timerPb => 'Recorde';

  @override
  String get timerSolves => 'Resoluções';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Excluir';

  @override
  String get timerHistory => 'Histórico';

  @override
  String get timerNoSolves =>
      'Nenhuma resolução ainda. Embaralhe seu cubo e vá!';

  @override
  String get timerNewPb => 'Novo recorde pessoal!';

  @override
  String get timerClearHistory => 'Limpar histórico';

  @override
  String get timerScrambleHint =>
      'Segure o branco em cima e o verde na frente e embaralhe:';

  @override
  String get dailyTitle => 'Desafio diário';

  @override
  String dailyFor(String date) {
    return 'Desafio de $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Melhor sequência: $count';
  }

  @override
  String get dailyDone => 'Feito por hoje! Volte amanhã.';

  @override
  String get dailyNotDone =>
      'Resolva o embaralhamento de hoje para manter sua sequência.';

  @override
  String get dailySolveVirtual => 'Resolver no cubo 3D';

  @override
  String get dailyTimeIt => 'Cronometrar no seu cubo';

  @override
  String get dailyHint => 'Dica';

  @override
  String dailyHintText(String moves) {
    return 'Comece pela cruz branca: $moves';
  }

  @override
  String get dailyHintFailed => 'Nenhuma dica disponível no momento.';

  @override
  String get lessonBasics => 'Conheça o cubo';

  @override
  String get lessonBasicsDesc => 'Peças, faces e nomes dos movimentos.';

  @override
  String get stepBasicsPieces => 'Três tipos de peças';

  @override
  String get stepBasicsPiecesBody =>
      'Os centros nunca se movem e dão a cor de cada face. Os meios têm duas cores e as quinas, três. Resolver é levar cada meio e cada quina para junto dos centros das mesmas cores.';

  @override
  String get stepBasicsFaces => 'Seis letras de faces';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F e B são as faces direita, esquerda, de cima, de baixo, da frente e de trás. Uma letra sozinha significa um quarto de volta no sentido horário, como se você olhasse direto para aquela face.';

  @override
  String get stepBasicsPrime => 'Giros anti-horários e duplos';

  @override
  String get stepBasicsPrimeBody =>
      'Um apóstrofo (R\') gira para o outro lado, no sentido anti-horário. Um 2 (U2) é meia-volta: dois quartos de volta.';

  @override
  String get stepCrossGoal => 'O objetivo';

  @override
  String get stepCrossGoalBody =>
      'Segure o amarelo em cima. Os quatro meios brancos ficam em volta do centro branco embaixo, cada cor lateral combinando com o centro ao lado.';

  @override
  String get stepCrossTop => 'Meio em cima';

  @override
  String get stepCrossTopBody =>
      'Encontre um meio branco em cima. Gire a camada de cima até a cor lateral dele ficar sobre o centro correspondente e gire essa face duas vezes para descê-lo.';

  @override
  String get stepCrossMiddle => 'Meio na camada do meio';

  @override
  String get stepCrossMiddleBody =>
      'Um meio preso na camada do meio sobe primeiro: gire a lateral dele para cima, tire a camada de cima do caminho e volte a lateral, assim a cruz não se desfaz. Depois posicione-o por cima.';

  @override
  String get stepCornersInsert => 'Sobre o seu lugar';

  @override
  String get stepCornersInsertBody =>
      'Gire a camada de cima até uma quina branca ficar sobre o lugar das cores dela, na frente à direita. R U R\' U\' encaixa a quina.';

  @override
  String get stepCornersRepeat => 'Repita o gatilho';

  @override
  String get stepCornersRepeatBody =>
      'Se o branco estiver virado para o lado errado, continue repetindo R U R\' U\' sobre o mesmo lugar. Toda quina fica resolvida em no máximo cinco repetições.';

  @override
  String get stepMiddleRight => 'Meio para a direita';

  @override
  String get stepMiddleRightBody =>
      'Alinhe um meio de cima com o centro dele na frente. Se a cor de cima combinar com o centro da direita, insira com U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Meio para a esquerda';

  @override
  String get stepMiddleLeftBody =>
      'Se a cor de cima combinar com o centro da esquerda, use o espelho: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Um só algoritmo';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' transforma um ponto amarelo em um L, um L em uma linha e uma linha na cruz. Segure o L atrás à esquerda e a linha na horizontal.';

  @override
  String get stepYellowEdges => 'Alinhe os meios';

  @override
  String get stepYellowEdgesBody =>
      'Gire a camada de cima até dois meios combinarem com seus centros. Com um atrás e outro à direita, R U R\' U R U2 R\' U troca os outros dois.';

  @override
  String get stepPlaceCorners => 'Posicione';

  @override
  String get stepPlaceCornersBody =>
      'Segure na frente à direita uma quina que já está no lugar. U R U\' L\' U R\' U\' L move as outras três; repita até as quatro estarem no lugar.';

  @override
  String get stepTwistCorners => 'Oriente';

  @override
  String get stepTwistCornersBody =>
      'Com uma quina não resolvida na frente à direita, repita R\' D\' R D até o amarelo ficar em cima e gire só a camada de cima para trazer a próxima. A camada de baixo parece bagunçada até o fim: continue.';

  @override
  String get lessonCfopIntro => 'O que é CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cruz, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Quatro etapas';

  @override
  String get stepCfopOverviewBody =>
      'Os speedcubers resolvem a cruz, juntam cada quina da primeira camada com o meio correspondente (F2L), orientam a última camada (OLL) e por fim a permutam (PLL).';

  @override
  String get stepCfopCross => 'Planeje a cruz';

  @override
  String get stepCfopCrossBody =>
      'No CFOP a cruz é planejada durante a inspeção e montada embaixo em cerca de oito movimentos.';

  @override
  String get lessonF2l => 'Básico de F2L';

  @override
  String get lessonF2lDesc => 'Junte uma quina com seu meio.';

  @override
  String get stepF2lRight => 'Insira um par';

  @override
  String get stepF2lRightBody =>
      'Quando uma quina e seu meio estão lado a lado em cima, leve-os sobre o espaço deles e insira os dois juntos.';

  @override
  String get stepF2lLeft => 'Par à esquerda';

  @override
  String get stepF2lLeftBody =>
      'O mesmo caso do outro lado é o espelho, U\' L\' U L. Girar o cubo (y) deixa você usar a mão mais confortável.';

  @override
  String get lessonOll => 'OLL em duas etapas';

  @override
  String get lessonOllDesc => 'Deixe o topo todo amarelo.';

  @override
  String get stepOllCross => 'Primeiro os meios';

  @override
  String get stepOllCrossBody =>
      'O OLL em duas etapas começa com o algoritmo da cruz amarela que você já conhece.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Com uma quina amarela virada para cima na frente à esquerda, o Sune (R U R\' U R U2 R\') orienta as outras três. A maioria dos outros casos usa o Sune e seu espelho.';

  @override
  String get lessonPll => 'PLL em duas etapas';

  @override
  String get lessonPllDesc => 'Termine o cubo.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'A T-perm troca duas quinas e dois meios. Use-a para posicionar as quinas: segure à direita as duas quinas que precisam trocar.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Com as quinas prontas, a U-perm gira três meios. Deixe o lado pronto atrás.';

  @override
  String get lessonTwoFirst => 'Primeira camada do 2×2';

  @override
  String get lessonTwoFirstDesc => 'Monte uma face com quinas combinando.';

  @override
  String get stepTwoIntro => 'Só quinas';

  @override
  String get stepTwoIntroBody =>
      'Um 2×2 é um 3×3 sem meios e centros. Escolha uma cor, monte essa face embaixo e faça as cores laterais das quinas vizinhas combinarem.';

  @override
  String get stepTwoCorner => 'Insira as quinas';

  @override
  String get stepTwoCornerBody =>
      'Igual às quinas brancas do 3×3: leve uma quina para cima do seu lugar e use R U R\' U\' até ela encaixar.';

  @override
  String get lessonTwoOll => 'Oriente o topo';

  @override
  String get lessonTwoOllDesc => 'OLL do Ortega com o Sune.';

  @override
  String get stepTwoSune => 'Sune de novo';

  @override
  String get stepTwoSuneBody =>
      'O Sune também deixa o topo amarelo no 2×2. Quem usa Ortega aprende sete casos curtos; o Sune e seu espelho cobrem a maioria deles.';

  @override
  String get lessonTwoPbl => 'Permute as duas camadas';

  @override
  String get lessonTwoPblDesc => 'Troque quinas para terminar.';

  @override
  String get stepTwoAdjacent => 'Troca adjacente';

  @override
  String get stepTwoAdjacentBody =>
      'Quando duas quinas vizinhas de cima precisam trocar, segure-as à direita e use a T-perm.';

  @override
  String get stepTwoDiagonal => 'Troca diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Duas quinas em posições opostas trocam com a Y-perm.';

  @override
  String get lessonBigIntro => 'Peças dos cubos grandes';

  @override
  String get lessonBigIntroDesc => 'Centros, wings e camadas internas.';

  @override
  String get stepBigPieces => 'Sem centros fixos';

  @override
  String get stepBigPiecesBody =>
      'Em um 4×4 cada face tem quatro peças de centro que se movem, e cada meio é formado por duas wings. A redução agrupa essas peças para o cubo se comportar como um 3×3.';

  @override
  String get stepBigSlices => 'Giros duplos e internos';

  @override
  String get stepBigSlicesBody =>
      'Rw gira juntas as duas camadas da direita. 2R gira só a segunda camada a partir da direita. Esses giros movem centros e wings.';

  @override
  String get lessonBigCenters => 'Centros';

  @override
  String get lessonBigCentersDesc => 'Agrupe as peças de centro.';

  @override
  String get stepBigCenterCycle => 'Um 3-ciclo de centros';

  @override
  String get stepBigCenterCycleBody =>
      'Este comutador move exatamente três peças de centro e não mexe em mais nada, então os centros prontos continuam prontos.';

  @override
  String get lessonBigEdges => 'Parear os meios';

  @override
  String get lessonBigEdgesDesc => 'Junte as wings em meios completos.';

  @override
  String get stepBigEdgePair => 'Parear e restaurar';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' alinha duas wings iguais, R U R\' F R\' F\' R traz um meio não pareado e Uw devolve os centros.';

  @override
  String get lessonBigParity => 'Paridade';

  @override
  String get lessonBigParityDesc => 'Paridade de OLL e PLL em cubos pares.';

  @override
  String get stepBigOllParity => 'Paridade de OLL';

  @override
  String get stepBigOllParityBody =>
      'Um único meio invertido é impossível em um 3×3. Em cubos pares, este algoritmo desvira o meio de cima da frente. Ele pode bagunçar o resto da camada de cima, o que as últimas etapas do 3×3 corrigem de qualquer jeito.';

  @override
  String get stepBigPllParity => 'Paridade de PLL';

  @override
  String get stepBigPllParityBody =>
      'Dois meios trocados bem no final? 2R2 U2 2R2 Uw2 2R2 Uw2 troca os meios de cima da frente e de trás.';

  @override
  String get introGoalHeading => 'Qual é o objetivo?';

  @override
  String get introHowHeading => 'Como fazer?';

  @override
  String get introStart => 'Entendi, começar passo a passo';

  @override
  String get introDontShowAgain => 'Não mostrar automaticamente de novo';

  @override
  String get introShowGoal => 'Ver o objetivo';

  @override
  String get introStateStart => 'Início';

  @override
  String get introStateGoal => 'Objetivo';

  @override
  String get introPlayMorph => 'Reproduzir do início ao objetivo';

  @override
  String get introGoalBasics =>
      'Aprenda a ler o cubo: as peças, as seis faces e como as letras dos movimentos as giram.';

  @override
  String get introGoalCross =>
      'Forme uma cruz branca em que cada aresta branca também combine com o centro ao lado.';

  @override
  String get introGoalCorners =>
      'Complete os quatro cantos brancos: a primeira coroa, toda a camada branca, fica pronta.';

  @override
  String get introGoalMiddle =>
      'Coloque as quatro arestas da camada do meio para resolver as duas primeiras camadas.';

  @override
  String get introGoalYellowCross =>
      'Forme uma cruz amarela em cima; as cores laterais ainda não precisam combinar.';

  @override
  String get introGoalYellowEdges =>
      'Alinhe cada aresta da cruz amarela com o centro do seu lado.';

  @override
  String get introGoalYellowCorners =>
      'Leve cada canto amarelo para o seu lugar, mesmo que ainda esteja torcido.';

  @override
  String get introGoalTwistCorners =>
      'Torça os cantos amarelos para a cor certa e o cubo fica resolvido.';

  @override
  String get introGoalCfopIntro =>
      'Conheça o plano do speedcubing: cruz, duas primeiras camadas e a última camada em dois passos.';

  @override
  String get introGoalF2l =>
      'Insira cada canto branco junto com a aresta do meio e termine duas camadas de uma vez.';

  @override
  String get introGoalOll =>
      'Deixe toda a face de cima amarela com um ou dois algoritmos.';

  @override
  String get introGoalPll =>
      'Leve as peças da última camada para o lugar e termine o cubo.';

  @override
  String get introGoalTwoFirst => 'Monte uma camada branca completa no 2×2.';

  @override
  String get introGoalTwoOll => 'Deixe toda a face de cima do 2×2 amarela.';

  @override
  String get introGoalTwoPbl =>
      'Troque os últimos cantos para o lugar e resolva o 2×2.';

  @override
  String get introGoalBigIntro =>
      'Conheça o 4×4: centros, pares de arestas e cantos, e os movimentos que os mexem.';

  @override
  String get introGoalBigCenters =>
      'Junte as peças de centro de cada face em um bloco de uma cor só.';

  @override
  String get introGoalBigEdges =>
      'Junte as peças de aresta iguais para cada aresta parecer uma aresta de 3×3.';

  @override
  String get introGoalBigParity =>
      'Corrija os dois casos do 4×4 que um 3×3 nunca tem: uma aresta virada ou duas arestas trocadas.';

  @override
  String get introHowBasics =>
      'Os centros nunca se mexem: indicam a cor de cada face.\nCada letra gira uma face um quarto de volta no sentido horário.\nUm apóstrofo (\') gira para trás; um 2 gira duas vezes.';

  @override
  String get introHowCross =>
      'Segure o amarelo em cima: a cruz branca é montada embaixo.\nEncontre uma aresta branca e alinhe a cor lateral com o centro certo.\nGire essa face duas vezes para descê-la até o lugar.';

  @override
  String get introHowCorners =>
      'Leve um canto branco para cima do seu espaço vazio.\nRepita R U R\' U\' até ele entrar na posição certa.\nFaça o mesmo com os outros três cantos.';

  @override
  String get introHowMiddle =>
      'Encontre uma aresta de cima sem amarelo e alinhe a cor da frente com um centro.\nMande-a para a direita ou para a esquerda com um algoritmo curto de 8 movimentos.\nA camada branca volta intacta todas as vezes.';

  @override
  String get introHowYellowCross =>
      'Olhe para o topo: um ponto, um L ou uma linha.\nSegure como na imagem e faça F R U R\' U\' F\'.\nRepita até a cruz amarela aparecer.';

  @override
  String get introHowYellowEdges =>
      'Gire o topo até duas arestas combinarem com os centros.\nColoque-as atrás e à direita e faça R U R\' U R U2 R\' U.\nRepita até as quatro combinarem.';

  @override
  String get introHowYellowCorners =>
      'Um canto está no lugar quando as cores combinam com as três faces ao redor.\nMantenha um canto já colocado à frente, à direita.\nU R U\' L\' U R\' U\' L troca os outros três até todos encaixarem.';

  @override
  String get introHowTwistCorners =>
      'Segure um canto não resolvido à frente, à direita.\nRepita R\' D\' R D até o amarelo ficar virado para cima.\nGire só o topo para o próximo canto; a camada de baixo se arruma sozinha no final.';

  @override
  String get introHowCfopIntro =>
      'Cruz: quatro arestas planejadas durante a inspeção.\nF2L: cada canto entra junto com a sua aresta.\nA OLL deixa o topo amarelo e a PLL leva as peças para o lugar.';

  @override
  String get introHowF2l =>
      'Encontre um canto e a aresta dele na camada de cima.\nJunte-os em par por cima do seu espaço.\nEncaixe o par com três ou quatro movimentos.';

  @override
  String get introHowOll =>
      'Primeiro a cruz amarela com F R U R\' U\' F\'.\nDepois oriente os cantos, por exemplo com o Sune.\nReconheça o caso pelo amarelo que vê.';

  @override
  String get introHowPll =>
      'O topo já está todo amarelo.\nA T-perm troca cantos; a U-perm move três arestas.\nLeia as cores laterais para escolher o algoritmo.';

  @override
  String get introHowTwoFirst =>
      'Um 2×2 só tem cantos, como um 3×3 sem arestas.\nLeve cada canto branco para cima do seu lugar.\nRepita R U R\' U\' até ele entrar.';

  @override
  String get introHowTwoOll =>
      'Mantenha a camada branca embaixo.\nO Sune (R U R\' U R U2 R\') gira os cantos de cima.\nRepita a partir do ângulo certo até o topo ficar todo amarelo.';

  @override
  String get introHowTwoPbl =>
      'Procure um lado onde dois cantos já combinam.\nTroca adjacente: um algoritmo no estilo T-perm.\nTroca diagonal: um algoritmo um pouco mais longo.';

  @override
  String get introHowBigIntro =>
      'Nenhum centro é fixo: quatro peças de centro formam a cor de cada face.\nGiros duplos como Rw giram duas camadas de uma vez.\nGiros internos como 2R giram só uma camada interna.';

  @override
  String get introHowBigCenters =>
      'Monte primeiro dois centros opostos.\nAs camadas internas trocam peças de centro sem desfazer os centros prontos.\nTermine os últimos quatro centros da mesma forma.';

  @override
  String get introHowBigEdges =>
      'Encontre duas peças de aresta com as mesmas cores.\nAlinhe-as lado a lado com uma camada interna.\nTire o par do caminho e devolva os centros ao lugar.';

  @override
  String get introHowBigParity =>
      'Resolva o 4×4 como um 3×3 até ficar preso.\nUma aresta virada: o algoritmo longo de paridade OLL.\nDuas arestas trocadas: 2R2 U2 2R2 Uw2 2R2 Uw2.';

  @override
  String get dirFaceR => 'Lado direito';

  @override
  String get dirFaceL => 'Lado esquerdo';

  @override
  String get dirFaceU => 'Fileira de cima';

  @override
  String get dirFaceD => 'Fileira de baixo';

  @override
  String get dirFaceF => 'Face da frente';

  @override
  String get dirFaceB => 'Face de trás';

  @override
  String get dirMiddle => 'Camada do meio';

  @override
  String get dirWholeCube => 'Cubo inteiro';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, camada $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth camadas de profundidade';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, camadas $near–$far';
  }

  @override
  String get dirUp => 'Para cima';

  @override
  String get dirDown => 'Para baixo';

  @override
  String get dirLeft => 'Para a esquerda';

  @override
  String get dirRight => 'Para a direita';

  @override
  String get dirClockwise => 'Sentido horário';

  @override
  String get dirCounter => 'Sentido anti-horário';

  @override
  String get dirBackClockwise => 'Sentido horário, visto de trás';

  @override
  String get dirBackCounter => 'Sentido anti-horário, visto de trás';

  @override
  String get dirHalf => 'Meia-volta (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Ocultar detalhes';

  @override
  String get solveExpand => 'Mostrar detalhes';

  @override
  String get dailyScrambleSteps => 'Embaralhar passo a passo';

  @override
  String get dailyScrambleGuide => 'Guia de embaralhamento em 3D';

  @override
  String get dailyShowMoves => 'Mostrar movimentos em texto';

  @override
  String get dailyHideMoves => 'Ocultar movimentos em texto';

  @override
  String get dailyScrambleGuideTitle => 'Guia de embaralhamento';

  @override
  String get phaseDailyScramble => 'Embaralhe o cubo de hoje';

  @override
  String get explainDailyScramble =>
      'Comece com um cubo resolvido, branco em cima e verde na frente, e copie cada giro no seu cubo real.';

  @override
  String get stageCenters => 'Construir os blocos de centro';

  @override
  String get stageEdges => 'Emparelhar arestas externas e internas';

  @override
  String get stageParity => 'Resolver a paridade';

  @override
  String get stageCrown1 => 'Primeira coroa (branca)';

  @override
  String get stageCrown2 => 'Segunda coroa';

  @override
  String get stageCrown3 => 'Terceira coroa (amarela)';

  @override
  String get stageOrient => 'Orientar as peças';

  @override
  String get stageFinish => 'Terminar o cubo';

  @override
  String get stageAsThree => 'Resolver como um 3×3';

  @override
  String get stageTwoByTwo => 'Resolver o 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Etapa $number de $total: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'Coroa $crown • Etapa $number de $total: $title';
  }

  @override
  String get solveAllStagesDone => 'Todas as etapas concluídas. Mandou bem!';

  @override
  String get trackFiveByFive => '5×5 Cubo do Professor';

  @override
  String get trackSixBySix => 'Cubo 6×6';

  @override
  String get lessonFiveIntro => 'Conheça o 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Centros fixos, barras de centro, arestas do meio e asas.';

  @override
  String get introGoalFiveIntro =>
      'Conheça o 5×5: centros fixos, barras de centro, arestas do meio e asas.';

  @override
  String get introHowFiveIntro =>
      'A peça do meio de cada face nunca se mexe.\nCada aresta é uma peça do meio com duas asas.\nAs camadas internas movem peças sem tocar no lado de fora.';

  @override
  String get lessonFiveCenters => 'Centros do 5×5';

  @override
  String get lessonFiveCentersDesc => 'Monte cada centro com barras de três.';

  @override
  String get introGoalFiveCenters =>
      'Monte em cada face um bloco de centro 3×3 de uma só cor.';

  @override
  String get introHowFiveCenters =>
      'Comece pela peça do meio: ela indica a cor.\nFaça barras de três e deslize-as com uma camada interna.\nTermine juntos os dois últimos centros.';

  @override
  String get lessonFiveEdges => 'Arestas do 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Junte duas asas à aresta do meio.';

  @override
  String get introGoalFiveEdges =>
      'Junte cada aresta do meio às suas duas asas para as 12 arestas parecerem peças únicas.';

  @override
  String get introHowFiveEdges =>
      'Alinhe duas asas com a aresta do meio à frente.\nGire a camada interna, troque uma aresta não resolvida e volte.\nEmparelhe as últimas arestas sem desfazer as prontas.';

  @override
  String get lessonFiveSolve => 'Resolva o 5×5 como um 3×3';

  @override
  String get lessonFiveSolveDesc => 'Termine com as três coroas.';

  @override
  String get introGoalFiveSolve =>
      'Resolva o 5×5 reduzido como um 3×3, coroa a coroa.';

  @override
  String get introHowFiveSolve =>
      'A partir de agora, só giros externos.\nPrimeira coroa, segunda coroa e depois a amarela.\nOs centros fixos mostram a cor de cada face.';

  @override
  String get lessonFiveParity => 'Paridade de arestas do 5×5';

  @override
  String get lessonFiveParityDesc => 'Corrija a aresta com as asas trocadas.';

  @override
  String get introGoalFiveParity =>
      'Corrija a única aresta com as duas asas trocadas e termine.';

  @override
  String get introHowFiveParity =>
      'Aparece como uma aresta que não emparelha.\nFaça uma vez a correção longa de camadas internas.\nTodo o resto volta ao lugar.';

  @override
  String get lessonSixIntro => 'Conheça o 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Sem centros fixos e quatro peças em cada aresta.';

  @override
  String get introGoalSixIntro =>
      'Conheça o 6×6: dezesseis peças de centro por face e quatro peças por aresta.';

  @override
  String get introHowSixIntro =>
      'Nenhum centro é fixo: você escolhe as cores ao montar.\nCada aresta tem asas externas e internas.\nOs giros duplos podem mover até três camadas.';

  @override
  String get lessonSixCenters => 'Centros do 6×6';

  @override
  String get lessonSixCentersDesc => 'Monte centros 4×4 com barras de quatro.';

  @override
  String get introGoalSixCenters =>
      'Monte em cada face um bloco de centro 4×4 de uma só cor.';

  @override
  String get introHowSixCenters =>
      'Monte primeiro dois centros opostos.\nFaça barras de quatro e junte-as.\nMova peças soltas com o truque camada, topo, desfazer.';

  @override
  String get lessonSixEdges => 'Arestas do 6×6';

  @override
  String get lessonSixEdgesDesc => 'Junte as quatro peças de cada aresta.';

  @override
  String get introGoalSixEdges =>
      'Junte as quatro peças de cada aresta para o 6×6 ter 12 arestas limpas.';

  @override
  String get introHowSixEdges =>
      'Alinhe na frente as asas externas e internas.\nA camada dupla profunda leva uma aresta para dentro e para fora.\nAs arestas prontas nunca se desfazem.';

  @override
  String get lessonSixSolve => 'Resolva o 6×6 como um 3×3';

  @override
  String get lessonSixSolveDesc => 'Termine com as três coroas.';

  @override
  String get introGoalSixSolve =>
      'Resolva o 6×6 reduzido como um 3×3, coroa a coroa.';

  @override
  String get introHowSixSolve =>
      'A partir de agora, só giros externos.\nOs centros que montou mostram a cor de cada face.\nPrimeira coroa, segunda coroa e depois a amarela.';

  @override
  String get lessonSixParity => 'Paridade do 6×6';

  @override
  String get lessonSixParityDesc => 'Uma aresta virada ou duas trocadas.';

  @override
  String get introGoalSixParity =>
      'Corrija os dois casos do 6×6 que um 3×3 nunca tem: uma aresta virada ou duas arestas trocadas.';

  @override
  String get introHowSixParity =>
      'Resolva como um 3×3 até travar.\nUma aresta virada: a correção longa de paridade.\nDuas arestas trocadas: a correção curta de giros duplos.';

  @override
  String get stepFivePieces => 'As peças do 5×5';

  @override
  String get stepFivePiecesBody =>
      'A peça do meio de cada face nunca se mexe, então continua indicando a cor, como em um 3×3. Ao redor há mais oito peças de centro; cada aresta tem uma peça do meio e duas asas, e os cantos funcionam como em um 3×3.';

  @override
  String get stepFiveSlices => 'Três tipos de giros';

  @override
  String get stepFiveSlicesBody =>
      'Um giro externo move uma face. Um giro duplo move uma face junto com a camada de trás. Um giro de camada interna move só uma camada de dentro: é assim que as peças trocam de lugar sem mexer no lado de fora.';

  @override
  String get stepFiveCenterBar => 'Barras de centro';

  @override
  String get stepFiveCenterBarBody =>
      'Faça uma fileira de três peças de centro iguais e deslize-a até o centro da mesma cor com um giro de camada interna. Três barras formam um centro pronto.';

  @override
  String get stepFiveCenterSwap => 'Trocar sem desfazer';

  @override
  String get stepFiveCenterSwapBody =>
      'Para mover uma só peça de centro: gire uma camada interna, gire o topo, desfaça a camada e volte o topo. Os centros prontos sempre voltam.';

  @override
  String get stepFiveEdgePair => 'Emparelhar asas com a aresta do meio';

  @override
  String get stepFiveEdgePairBody =>
      'Alinhe duas asas ao lado da aresta do meio na frente, desça a camada interna, traga de cima uma aresta não resolvida e volte a camada interna.';

  @override
  String get stepFiveEdgeLast => 'As últimas arestas';

  @override
  String get stepFiveEdgeLastBody =>
      'Com poucas arestas, um giro duplo, um gatilho curto e o giro duplo de volta emparelham as arestas sem desfazer as prontas.';

  @override
  String get stepFiveAsThree => 'Agora é um 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Com centros e arestas prontos, o 5×5 se comporta como um 3×3 grande. Use só giros externos e siga as três coroas: cruz e cantos brancos, camada do meio e camada amarela.';

  @override
  String get stepFiveEdgeParity => 'Trocar as asas da última aresta';

  @override
  String get stepFiveEdgeParityBody =>
      'Às vezes a última aresta tem as duas asas trocadas. Um algoritmo longo de camadas internas destroca as asas e todo o resto volta ao lugar. Depois termine como um 3×3.';

  @override
  String get stepSixPieces => 'As peças do 6×6';

  @override
  String get stepSixPiecesBody =>
      'Como o 4×4, o 6×6 não tem centro fixo: dezesseis peças de centro formam a cor de cada face. Cada aresta tem quatro peças: duas asas externas e duas internas.';

  @override
  String get stepSixSlices => 'Girar camadas mais fundas';

  @override
  String get stepSixSlicesBody =>
      'Os giros duplos podem mover duas ou três camadas a partir de uma face. As camadas internas, segunda e terceira, são as ferramentas para centros e arestas.';

  @override
  String get stepSixCenterBar => 'Barras de quatro';

  @override
  String get stepSixCenterBarBody =>
      'Faça fileiras de quatro peças de centro iguais e deslize-as lado a lado com giros de camada interna até a face ficar de uma cor só.';

  @override
  String get stepSixCenterSwap => 'Uma peça de cada vez';

  @override
  String get stepSixCenterSwapBody =>
      'Gire a terceira camada, gire o topo, desfaça e volte: uma peça de centro muda e os centros prontos voltam.';

  @override
  String get stepSixEdgePair => 'Quatro peças, uma aresta';

  @override
  String get stepSixEdgePairBody =>
      'Junte na frente as quatro peças de uma aresta com a camada dupla profunda, traga uma aresta não resolvida e volte a camada dupla.';

  @override
  String get stepSixEdgeLast => 'As últimas arestas';

  @override
  String get stepSixEdgeLastBody =>
      'Emparelhe as arestas finais com um gatilho curto entre um giro duplo profundo e o desfazer dele, para as arestas prontas continuarem unidas.';

  @override
  String get stepSixAsThree => 'Agora é um 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Com centros 4×4 e arestas emparelhadas, resolva o 6×6 como um 3×3 com giros externos e as três coroas.';

  @override
  String get stepSixOllParity => 'Uma aresta virada';

  @override
  String get stepSixOllParityBody =>
      'Se uma só aresta parecer virada ao resolver a última camada, é paridade. Coloque-a na frente da camada de cima e faça a correção longa: as duas primeiras coroas voltam intactas.';

  @override
  String get stepSixPllParity => 'Duas arestas trocadas';

  @override
  String get stepSixPllParityBody =>
      'Se duas arestas parecerem trocadas no final, coloque-as na frente e atrás da camada de cima e faça a correção curta de giros duplos internos.';

  @override
  String get stageTwoFirstLayer => 'Monte a camada de baixo';

  @override
  String get stageTwoTopColor => 'Deixe o topo de uma cor só';

  @override
  String get stageTwoFinish => 'Termine os cantos';

  @override
  String get explainTwoFirstLayer =>
      'Complete a camada de baixo: os quatro cantos combinam entre si e com as cores laterais.';

  @override
  String get explainTwoTopColor =>
      'Gire até os quatro adesivos de cima ficarem da mesma cor, sem desfazer a camada de baixo.';

  @override
  String get explainTwoFinish =>
      'Leve os últimos cantos para o lugar e termine o cubo.';

  @override
  String get tabSolve => 'Resolver';

  @override
  String get tabScan => 'Escanear';

  @override
  String get tabAcademy => 'Academia';

  @override
  String get tabTrain => 'Treinar';

  @override
  String get openCubeSolver => 'Abrir cubo 3D e solucionador';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Treino';

  @override
  String get trainSubtitle => 'Aprimore suas habilidades todos os dias.';

  @override
  String get settings => 'Configurações';

  @override
  String get settingsSoundHaptics => 'Som e vibração';

  @override
  String get settingsSoundHapticsDesc => 'Cliques e vibrações ao girar o cubo.';

  @override
  String get settingsAnimationSpeed => 'Velocidade de animação padrão';

  @override
  String get settingsAnimationSpeedDesc =>
      'A velocidade com que o cubo gira ao reproduzir movimentos.';

  @override
  String get settingsResetProgress => 'Redefinir progresso';

  @override
  String get settingsResetProgressDesc =>
      'Apaga as aulas concluídas da Academia e sua sequência diária.';

  @override
  String get resetProgressTitle => 'Redefinir todo o progresso?';

  @override
  String get resetProgressBody =>
      'Suas aulas concluídas e sua sequência diária serão apagadas. Não é possível desfazer.';

  @override
  String get resetProgressDone => 'Progresso redefinido.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get settingsPrivacyAds => 'Privacidade e anúncios';

  @override
  String get settingsPrivacyAdsDesc =>
      'Revise ou altere suas opções de consentimento de anúncios.';

  @override
  String get playbackPrevious => 'Anterior';

  @override
  String get playbackNext => 'Próximo';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Resolvido em $count movimentos!',
      one: 'Resolvido em 1 movimento!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Ajude a criar a próxima versão';

  @override
  String get feedbackBody =>
      'Quer sugerir um recurso ou influenciar a próxima versão do CubeMentor? Escreva para a gente em:';

  @override
  String get feedbackEmailCopied =>
      'Não encontramos um app de e-mail, então copiamos o endereço para a área de transferência.';

  @override
  String get adWatchToUnlock => 'Assistir anúncio';

  @override
  String get adLoading => 'Carregando um vídeo curto…';

  @override
  String get adRewardNotEarned => 'Assista ao vídeo inteiro para desbloquear.';

  @override
  String get adUnavailableFreePass =>
      'Nenhum vídeo disponível agora — desbloqueado de graça desta vez.';

  @override
  String get settingsPrivacyAdsError =>
      'Não foi possível abrir as opções de privacidade. Tente novamente mais tarde.';

  @override
  String get nicknamePromptTitle => 'Como podemos te chamar?';

  @override
  String get nicknamePromptBody =>
      'Vamos comemorar cada resolução com o seu nome.';

  @override
  String get nicknameHint => 'Seu nome ou apelido';

  @override
  String get nicknameGo => 'Vamos lá';

  @override
  String get nicknameSkip => 'Pular';

  @override
  String get nicknameSave => 'Salvar';

  @override
  String get settingsNickname => 'Seu nome';

  @override
  String get settingsNicknameNotSet => 'Não definido — toque para adicionar';

  @override
  String celebrateNamed(String name) {
    return 'Mandou bem, $name!';
  }

  @override
  String get celebrateAnon => 'Mandou bem!';

  @override
  String get celebrateCubeSolved => 'Cubo resolvido!';

  @override
  String get celebrateDailyDone => 'Desafio diário concluído!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit movimentos',
      one: '$count / 1 movimento',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other:
          'Qualquer embaralhamento pode ser resolvido em $limit movimentos ou menos',
      one: 'Qualquer embaralhamento pode ser resolvido em 1 movimento ou menos',
    );
    return '$_temp0';
  }

  @override
  String get patternsUnlockTitle => 'Desbloquear todos os padrões';

  @override
  String patternsUnlockPrompt(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Assista a 1 vídeo curto para desbloquear todos os padrões por $minutes minutos',
      one: 'Assista a 1 vídeo curto para desbloquear todos os padrões por 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Assistir ao vídeo';

  @override
  String get patternsNotNow => 'Agora não';

  @override
  String patternsUnlockedLeft(String time) {
    return 'Desbloqueado • faltam $time';
  }

  @override
  String get patternsExpiredTitle => 'Sua prévia terminou';

  @override
  String patternsExpiredBody(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Assista a 1 vídeo para manter todos os padrões desbloqueados por mais $minutes minutos!',
      one: 'Assista a 1 vídeo para manter todos os padrões desbloqueados por mais 1 minuto!',
    );
    return '$_temp0';
  }

  @override
  String get patternsFreeSample => 'Grátis';

  @override
  String get settingsColorScheme => 'Esquema de cores do cubo';

  @override
  String get colorSchemeWestern => 'Ocidental';

  @override
  String get colorSchemeJapanese => 'Japonês';

  @override
  String get colorSchemeWesternDesc =>
      'Branco oposto ao amarelo, azul oposto ao verde';

  @override
  String get colorSchemeJapaneseDesc =>
      'Branco oposto ao azul, amarelo oposto ao verde';

  @override
  String get leaderboardTitle => 'Ranking diário';

  @override
  String get leaderboardView => 'Ver ranking';

  @override
  String get leaderboardReminder =>
      'Você ainda não resolveu o desafio de hoje!';

  @override
  String leaderboardSolvedToday(int count, String countText) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countText jogadores resolveram hoje',
      one: '$countText jogador resolveu hoje',
    );
    return '$_temp0';
  }

  @override
  String leaderboardAvgTime(String time) {
    return 'Tempo médio: $time';
  }

  @override
  String leaderboardRankOf(String rank, String total) {
    return '#$rank de $total';
  }

  @override
  String leaderboardYourTime(String time) {
    return 'Seu tempo: $time';
  }

  @override
  String get leaderboardYou => 'Você';

  @override
  String get leaderboardNotRanked =>
      'Resolva o desafio de hoje para entrar no ranking.';

  @override
  String get leaderboardJumpToMe => 'Ir para minha posição';

  @override
  String get leaderboardAnonymous => 'Anônimo';

  @override
  String get leaderboardLive =>
      'Ranking global ao vivo: jogadores reais, atualizado em tempo real.';

  @override
  String get leaderboardConnecting => 'Conectando ao ranking ao vivo…';

  @override
  String get leaderboardOffline =>
      'Você está offline. O ranking ao vivo aparece quando você se conectar de novo.';

  @override
  String get leaderboardCached =>
      'Offline: mostrando o último ranking salvo neste aparelho.';

  @override
  String get leaderboardPendingSync =>
      'Seu tempo foi salvo e entra no ranking quando você voltar a ficar online.';

  @override
  String get leaderboardBeFirst =>
      'Ninguém resolveu o desafio de hoje ainda. Seja o primeiro!';

  @override
  String get leaderboardRetry => 'Tentar de novo';
}
