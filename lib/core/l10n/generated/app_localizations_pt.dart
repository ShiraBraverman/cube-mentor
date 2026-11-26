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
  String get solveModeGuided => 'Guiado (3 camadas)';

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
  String get phaseLblCorners => 'Cantos da primeira camada';

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
  String get crownFirst => 'Primeira camada';

  @override
  String get crownSecond => 'Segunda camada';

  @override
  String get crownThird => 'Terceira camada';

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
      'Encaixe os 4 cantos brancos nos seus lugares para terminar a face branca e toda a primeira camada.';

  @override
  String get subStepGoal21 =>
      'Encaixe as 4 arestas da camada do meio sem desfazer a primeira camada.';

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
  String get trackBeginner => '3×3 iniciante: camada a camada';

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
      'Segure o amarelo em cima e o verde virado para si. Primeiro junte as quatro arestas brancas à volta do centro amarelo, com o branco para cima, como pétalas: é a margarida. Depois cada pétala desce para o centro branco, com a cor lateral igual ao centro ao lado.';

  @override
  String get stepCrossTop => 'Aresta em cima';

  @override
  String get stepCrossTopBody =>
      'Uma aresta branca em cima com o branco para cima é uma pétala da margarida. Rode o topo até a cor lateral ficar mesmo por cima do centro da mesma cor e rode essa face duas vezes (180°) para a descer até ao centro branco.';

  @override
  String get stepCrossMiddle => 'Aresta no meio';

  @override
  String get stepCrossMiddleBody =>
      'Uma aresta presa na camada do meio sobe primeiro: suba o lado dela, afaste o topo e desça o lado, para as peças colocadas não saírem. Agora é uma pétala em cima: alinhe-a e rode essa face duas vezes.';

  @override
  String get stepCornersInsert => 'Por cima do seu lugar';

  @override
  String get stepCornersInsertBody =>
      'Rode o topo até o canto branco ficar mesmo por cima do seu lugar, entre os dois centros das suas cores laterais. Aqui basta um giro do topo e R U\' R\': U põe o canto sobre o lugar e R U\' R\' encaixa-o com o branco para baixo.';

  @override
  String get stepCornersRepeat => 'Repita o gatilho';

  @override
  String get stepCornersRepeatBody =>
      'Deixe o lugar à frente à direita e repita R U R\' U\' até o branco ficar para baixo: uma vez se olha para a direita, três se olha para cima, cinco se olha para si. Entretanto o topo parece baralhado; arruma-se sozinho.';

  @override
  String get stepMiddleRight => 'Aresta para a direita';

  @override
  String get stepMiddleRightBody =>
      'Procure uma aresta de cima sem amarelo. Rode o topo até a cor da frente combinar com o centro à sua frente. Se a cor de cima combinar com o centro da direita, envie-a para a direita: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Aresta para a esquerda';

  @override
  String get stepMiddleLeftBody =>
      'Se a cor de cima combinar com o centro da esquerda, use o espelho: U\' L\' U L U F U\' F\'. A camada branca volta inteira de cada vez.';

  @override
  String get stepYellowCross => 'Um só algoritmo';

  @override
  String get stepYellowCrossBody =>
      'Olhe só para as arestas amarelas em cima. Ponha o L atrás à esquerda e a linha da esquerda para a direita e faça F R U R\' U\' F\'. A linha precisa de uma vez, o L de duas, o ponto de até três.';

  @override
  String get stepYellowEdges => 'Alinhe as arestas';

  @override
  String get stepYellowEdgesBody =>
      'Rode o topo até duas arestas combinarem com os seus centros. Com uma atrás e outra à direita, R U R\' U R U2 R\' U troca a da frente com a da esquerda.';

  @override
  String get stepPlaceCorners => 'Posicione-os';

  @override
  String get stepPlaceCornersBody =>
      'Um canto está em casa quando as suas cores combinam com os três centros à volta, mesmo rodado. Ponha um assim à frente à direita: U R U\' L\' U R\' U\' L move os outros três. Repita até estarem os quatro.';

  @override
  String get stepTwistCorners => 'Oriente-os';

  @override
  String get stepTwistCornersBody =>
      'Com um canto por resolver à frente à direita, repita R\' D\' R D aos pares até o amarelo ficar em cima; depois rode só o topo para trazer o seguinte. A parte de baixo parece desfeita até ao último canto: continue.';

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
      'Um 2×2 são só oito cantos: sem arestas nem centros. Faça a camada branca em baixo com as cores laterais dos vizinhos iguais e termine por um só caminho: Sune para o topo amarelo e depois a T-perm ou a Y-perm.';

  @override
  String get stepTwoCorner => 'Insira os cantos';

  @override
  String get stepTwoCornerBody =>
      'Como os cantos brancos do 3×3: leve um canto para cima do lugar vazio à frente à direita e encaixe-o, aqui com U R U\' R\' ou repetindo R U R\' U\' até o branco ficar para baixo. Compare as cores laterais com o vizinho.';

  @override
  String get lessonTwoOll => 'Oriente o topo';

  @override
  String get lessonTwoOllDesc => 'OLL do Ortega com o Sune.';

  @override
  String get stepTwoSune => 'O Sune outra vez';

  @override
  String get stepTwoSuneBody =>
      'Conte os autocolantes amarelos virados para cima. Ponha o único canto com amarelo para cima à frente à esquerda e faça Sune (R U R\' U R U2 R\'). Conte e segure de novo; no máximo três Sunes. Entre eles rode só o topo.';

  @override
  String get lessonTwoPbl => 'Permute as duas camadas';

  @override
  String get lessonTwoPblDesc => 'Troque cantos para terminar.';

  @override
  String get stepTwoAdjacent => 'Troca adjacente';

  @override
  String get stepTwoAdjacentBody =>
      'Faróis são dois autocolantes iguais em cima no mesmo lado. Rode o topo até os faróis ficarem à esquerda, assim os dois cantos a trocar ficam à direita, e faça a T-perm.';

  @override
  String get stepTwoDiagonal => 'Troca diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Sem faróis em lado nenhum, dois cantos em diagonal têm de trocar: faça a Y-perm de qualquer lado e rode o topo para alinhar tudo.';

  @override
  String get lessonBigIntro => 'Peças dos cubos grandes';

  @override
  String get lessonBigIntroDesc =>
      'Centros, meias-arestas e camadas interiores.';

  @override
  String get stepBigPieces => 'Sem centros fixos';

  @override
  String get stepBigPiecesBody =>
      'No 4×4 cada face tem quatro peças de centro que se movem e cada aresta são duas asas. Nenhum centro é fixo, por isso confirme a ordem das cores num canto: branco oposto ao amarelo, azul ao verde, vermelho ao laranja.';

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
      'Este comutador move exatamente três peças de centro e deixa tudo o resto, por isso os centros acabados continuam acabados. Use-o quando uma peça solta não se junta a uma barra.';

  @override
  String get lessonBigEdges => 'Emparelhar as arestas';

  @override
  String get lessonBigEdgesDesc =>
      'Junte as meias-arestas em arestas completas.';

  @override
  String get stepBigEdgePair => 'Emparelhar e repor';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' alinha duas asas iguais, R U R\' F R\' F\' R troca por uma aresta por emparelhar e Uw repõe os centros. Feche sempre a camada que abriu.';

  @override
  String get lessonBigParity => 'Paridade';

  @override
  String get lessonBigParityDesc => 'Paridade de OLL e PLL em cubos pares.';

  @override
  String get stepBigOllParity => 'Paridade de OLL';

  @override
  String get stepBigOllParityBody =>
      'Uma única aresta virada não acontece num 3×3: é paridade de OLL, não um erro. Deixe-a à frente da camada de cima e faça o algoritmo longo. Ele também troca as arestas da esquerda e da direita em cima e dois cantos; os últimos passos do 3×3 corrigem isso.';

  @override
  String get stepBigPllParity => 'Paridade de PLL';

  @override
  String get stepBigPllParityBody =>
      'Duas arestas trocadas mesmo no fim e nenhum algoritmo de 3×3 serve? É paridade de PLL. Ponha-as à frente e atrás na camada de cima: 2R2 U2 2R2 Uw2 2R2 2U2 troca-as.';

  @override
  String get introGoalHeading => 'Qual é o objetivo?';

  @override
  String get introHowHeading => 'Como se faz?';

  @override
  String get introHoldHeading => 'Como segurar';

  @override
  String get introWhyHeading => 'Porque funciona';

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
      'Faça uma cruz branca em baixo em que cada aresta branca também combine com o centro ao lado.';

  @override
  String get introGoalCorners =>
      'Coloque os quatro cantos brancos para completar toda a primeira camada: face branca e cores laterais a condizer.';

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
      'Leve os últimos cantos para casa com uma T-perm ou uma Y-perm e alinhe a camada de cima para resolver o 2×2.';

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
      'Corrija os dois casos do 4×4 que um 3×3 nunca tem: uma aresta virada (paridade de OLL) ou duas arestas trocadas (paridade de PLL).';

  @override
  String get introHowBasics =>
      'Os centros nunca se mexem: indicam a cor de cada face.\nCada letra roda uma face um quarto de volta no sentido horário.\nUm apóstrofo (\') roda para trás; um 2 roda duas vezes.';

  @override
  String get introHoldBasics =>
      'Como quiser: os centros não se movem, por isso as cores dizem sempre qual face é qual.';

  @override
  String get introWhyBasics =>
      'Cada algoritmo é só uma fila destas letras, por isso lê-las é a primeira competência.';

  @override
  String get introHowCross =>
      'Leve cada aresta branca para cima, com o branco para cima, à volta do centro amarelo: é a margarida.\nRode o topo até a cor lateral de uma pétala ficar sobre o centro dessa cor.\nRode essa face duas vezes para a descer; repita com as quatro.';

  @override
  String get introHoldCross =>
      'Centro amarelo em cima e branco em baixo durante todo o passo. Rode o topo, não o cubo, para alinhar uma pétala.';

  @override
  String get introWhyCross =>
      'Com o branco virado para cima, duas rotações da face da frente põem a aresta no centro branco, com o branco para baixo e o lado já a condizer.';

  @override
  String get introHowCorners =>
      'Rode o topo até um canto branco ficar sobre o seu espaço vazio, à frente à direita.\nRepita R U R\' U\': uma vez se o branco olha para a direita, três se olha para cima, cinco se olha para si.\nFaça o mesmo com os outros três cantos.';

  @override
  String get introHoldCorners =>
      'Branco em baixo, amarelo em cima. O canto à frente à direita, mesmo por cima do seu lugar.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' levanta o lugar e repõe-no: cada volta roda um pouco o canto até o branco ficar para baixo, e a cruz nunca se desfaz.';

  @override
  String get introHowMiddle =>
      'Procure uma aresta de cima sem amarelo e combine a cor da frente com o centro por baixo.\nA cor de cima diz para onde vai: direita ou esquerda.\nEncaixe-a com o algoritmo de 8 movimentos; a camada branca volta inteira.';

  @override
  String get introHoldMiddle =>
      'Branco em baixo, amarelo em cima. A aresta à frente, com a cor da frente igual ao centro por baixo.';

  @override
  String get introWhyMiddle =>
      'O algoritmo afasta o lugar, encaixa a aresta e repõe a camada branca. Uma aresta com amarelo pertence ao topo, nunca ao meio.';

  @override
  String get introHowYellowCross =>
      'Olhe só para as arestas amarelas em cima: um ponto, um L ou uma linha.\nPonha o L atrás à esquerda e a linha da esquerda para a direita, e faça F R U R\' U\' F\'.\nA linha precisa de uma vez, o L de duas, o ponto de até três.';

  @override
  String get introHoldYellowCross =>
      'Branco em baixo, amarelo em cima. O L atrás à esquerda, a linha da esquerda para a direita; o ponto, de qualquer forma.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' vira duas arestas de cima de cada vez sem tocar nas duas primeiras camadas.';

  @override
  String get introHowYellowEdges =>
      'Rode o topo até duas arestas combinarem com os seus centros.\nPonha-as atrás e à direita e faça R U R\' U R U2 R\' U.\nSe as arestas certas estiverem opostas, faça-o primeiro uma vez de qualquer lado.';

  @override
  String get introHoldYellowEdges =>
      'Amarelo em cima. Uma aresta certa atrás e a outra à direita.';

  @override
  String get introWhyYellowEdges =>
      'Este algoritmo só move peças de cima, por isso as duas primeiras camadas voltam sempre.';

  @override
  String get introHowYellowCorners =>
      'Um canto está em casa quando as suas cores combinam com os três centros à volta, mesmo rodado.\nMantenha um canto em casa à frente à direita.\nU R U\' L\' U R\' U\' L roda os outros três; repita até encaixarem todos.';

  @override
  String get introHoldYellowCorners =>
      'Amarelo em cima. Um canto já em casa à frente à direita; se não houver, qualquer canto.';

  @override
  String get introWhyYellowCorners =>
      'Roda três cantos em círculo e deixa quieto o da frente à direita, por isso cada repetição põe mais cantos em casa.';

  @override
  String get introHowTwistCorners =>
      'Segure um canto por resolver à frente à direita.\nRepita R\' D\' R D aos pares até o amarelo dele ficar para cima.\nRode só o topo para o seguinte; a parte de baixo volta com o último canto.';

  @override
  String get introHoldTwistCorners =>
      'Amarelo em cima, o canto a rodar à frente à direita. Entre cantos rode só o topo, nunca o cubo inteiro.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D roda o canto e baralha a parte de baixo, mas esta volta quando todos os cantos estão rodados. Parar a meio deixa-a desfeita.';

  @override
  String get introHowCfopIntro =>
      'Cruz: quatro arestas planeadas durante a inspeção.\nF2L: cada canto entra junto com a sua aresta.\nA OLL põe o topo amarelo e a PLL leva as peças para o lugar.';

  @override
  String get introHoldCfopIntro =>
      'Os speedcubers fazem a cruz em baixo para verem as peças seguintes enquanto rodam.';

  @override
  String get introWhyCfopIntro =>
      'Resolver um canto com a sua aresta poupa muitos movimentos, e reconhecer casos substitui a tentativa e erro.';

  @override
  String get introHowF2l =>
      'Encontre um canto e a aresta dele na camada de cima.\nJunte-os em par por cima do seu espaço.\nEncaixe o par com três ou quatro movimentos.';

  @override
  String get introHoldF2l =>
      'Cruz em baixo. O lugar do par à frente à direita, ou à frente à esquerda no espelho.';

  @override
  String get introWhyF2l =>
      'Um canto e a sua aresta emparelhados entram juntos, por isso duas camadas crescem ao mesmo tempo em vez de peça a peça.';

  @override
  String get introHowOll =>
      'Primeiro a cruz amarela com F R U R\' U\' F\'.\nDepois oriente os cantos, por exemplo com o Sune.\nReconheça o caso pelo amarelo que vê.';

  @override
  String get introHoldOll =>
      'Amarelo em cima. No Sune, o único canto com amarelo para cima fica à frente à esquerda.';

  @override
  String get introWhyOll =>
      'Dividir a última camada em orientar e depois permutar mantém poucos algoritmos.';

  @override
  String get introHowPll =>
      'O topo já está todo amarelo.\nA T-perm troca cantos; a U-perm move três arestas.\nLeia as cores laterais para escolher o algoritmo.';

  @override
  String get introHoldPll =>
      'Amarelo em cima. T-perm: faróis à esquerda. U-perm: o lado acabado atrás.';

  @override
  String get introWhyPll =>
      'Com o topo todo amarelo, só os lugares das peças estão errados, e poucas trocas acabam o cubo.';

  @override
  String get introHowTwoFirst =>
      'Escolha um canto branco como âncora, com o branco para baixo.\nLeve cada canto seguinte para cima do seu lugar, à frente à direita.\nRepita R U R\' U\' até ele entrar com as cores laterais a condizer.';

  @override
  String get introHoldTwoFirst =>
      'Branco em baixo. O lugar vazio à frente à direita, com o seu canto mesmo por cima, na camada de cima.';

  @override
  String get introWhyTwoFirst =>
      'O 2×2 não tem centros: o primeiro canto que coloca define as cores dos vizinhos, por isso as cores laterais contam, não só o branco.';

  @override
  String get introHowTwoOll =>
      'Conte os cantos com o amarelo para cima.\nCom um, ponha-o à frente à esquerda e faça Sune: R U R\' U R U2 R\'.\nConte de novo e repita; no máximo três Sunes.';

  @override
  String get introHoldTwoOll =>
      'Branco em baixo, amarelo em cima. Antes de cada Sune, o canto com amarelo para cima à frente à esquerda.';

  @override
  String get introWhyTwoOll =>
      'O Sune roda os cantos de cima sem desfazer a camada branca; contar de novo diz como segurar a seguir.';

  @override
  String get introHowTwoPbl =>
      'Procure faróis: dois autocolantes iguais em cima no mesmo lado.\nFaróis num lado: ponha-os à esquerda e faça a T-perm.\nSem faróis: faça a Y-perm de qualquer lado e alinhe o topo.';

  @override
  String get introHoldTwoPbl =>
      'Branco em baixo, amarelo em cima. T-perm: faróis à esquerda. Y-perm: qualquer lado virado para si.';

  @override
  String get introWhyTwoPbl =>
      'Com o topo amarelo, só os lugares dos cantos estão errados: a T-perm troca dois vizinhos, a Y-perm dois na diagonal.';

  @override
  String get introHowBigIntro =>
      'Nenhum centro é fixo: quatro peças de centro formam a cor de cada face.\nRotações duplas como Rw rodam duas camadas de uma vez.\nRotações interiores como 2R rodam só uma camada interior.';

  @override
  String get introHoldBigIntro =>
      'Ao início, como quiser: no 4×4 nenhum centro é fixo, por isso escolhe onde vai cada cor.';

  @override
  String get introWhyBigIntro =>
      'A redução agrupa centros e peças de aresta para o cubo grande se resolver como um 3×3.';

  @override
  String get introHowBigCenters =>
      'Primeiro confirme a ordem das cores num canto.\nConstrua dois centros opostos e depois os outros quatro.\nAs camadas interiores movem peças de centro; desfaça sempre a camada que abriu.';

  @override
  String get introHoldBigCenters =>
      'A face que está a construir à frente; os centros acabados à esquerda e à direita, fora do caminho.';

  @override
  String get introWhyBigCenters =>
      'Uma camada interior move centros e desfazê-la repõe os acabados, por isso só muda a peça que quer.';

  @override
  String get introHowBigEdges =>
      'Procure as duas asas com as mesmas duas cores.\nAlinhe-as à frente e junte-as com Uw\'.\nTroque por uma aresta por emparelhar e Uw repõe os centros.';

  @override
  String get introHoldBigEdges =>
      'A aresta que está a emparelhar nas camadas da frente; as acabadas arrumadas em cima e em baixo.';

  @override
  String get introWhyBigEdges =>
      'Uw\' afasta os centros para duas asas se juntarem; Uw repõe-nos e o seu trabalho fica intacto.';

  @override
  String get introHowBigParity =>
      'Resolva o 4×4 como um 3×3 até encravar.\nUma aresta virada: o algoritmo longo de paridade de OLL.\nDuas arestas trocadas: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'A última camada em cima. Paridade de OLL: a aresta virada à frente. Paridade de PLL: as arestas trocadas à frente e atrás.';

  @override
  String get introWhyBigParity =>
      'As asas podem chegar a estados que um 3×3 não alcança; estes algoritmos rodam camadas interiores para desfazer exatamente isso.';

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
  String get stageCrown1 => 'Primeira camada (branca)';

  @override
  String get stageCrown2 => 'Segunda camada';

  @override
  String get stageCrown3 => 'Terceira camada (amarela)';

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
  String get introHoldFiveIntro =>
      'Como quiser: no 5×5 o meio de cada face nunca se move, por isso mostra a sua cor.';

  @override
  String get introWhyFiveIntro =>
      'Os centros fixos definem o esquema de cores, por isso os centros não podem ficar na ordem errada.';

  @override
  String get lessonFiveCenters => 'Centros do 5×5';

  @override
  String get lessonFiveCentersDesc => 'Monte cada centro com barras de três.';

  @override
  String get introGoalFiveCenters =>
      'Monte em cada face um bloco de centro 3×3 de uma só cor.';

  @override
  String get introHowFiveCenters =>
      'Comece pela peça central fixa: ela define a cor.\nFaça barras de três e encaixe-as com uma camada interior.\nO movimento que mete a barra também repõe o centro acabado.';

  @override
  String get introHoldFiveCenters =>
      'O centro que está a construir à frente ou em cima; os acabados em baixo, à esquerda ou à direita.';

  @override
  String get introWhyFiveCenters =>
      'Camada para dentro, topo, camada para fora: a camada que mete a barra também repõe os centros acabados.';

  @override
  String get lessonFiveEdges => 'Arestas do 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Junte duas asas à aresta do meio.';

  @override
  String get introGoalFiveEdges =>
      'Junte cada aresta do meio às suas duas asas para as 12 arestas parecerem peças únicas.';

  @override
  String get introHowFiveEdges =>
      'Junte cada asa à sua aresta do meio, à frente.\nRode a camada interior, troque por uma aresta por resolver e volte a rodá-la.\nNas últimas arestas: camada, virar, camada.';

  @override
  String get introHoldFiveEdges =>
      'A aresta que está a construir à frente; as acabadas guardadas nas camadas de cima e de baixo.';

  @override
  String get introWhyFiveEdges =>
      'Abrir e fechar a camada interior junta asas enquanto centros e arestas guardadas voltam.';

  @override
  String get lessonFiveSolve => 'Resolva o 5×5 como um 3×3';

  @override
  String get lessonFiveSolveDesc => 'Termine camada a camada, como um 3×3.';

  @override
  String get introGoalFiveSolve =>
      'Resolva o 5×5 reduzido como um 3×3, camada a camada, só com rotações exteriores.';

  @override
  String get introHowFiveSolve =>
      'A partir de agora só rotações exteriores, ou as arestas emparelhadas separam-se.\nCruz e cantos brancos, a camada do meio e depois a amarela.\nOs centros fixos mostram a cor de cada face.';

  @override
  String get introHoldFiveSolve =>
      'A cor da primeira camada em baixo, tal como no 3×3; o canto a encaixar à frente à direita.';

  @override
  String get introWhyFiveSolve =>
      'Rotações interiores voltariam a separar centros e arestas; as exteriores tratam cada bloco como uma peça de 3×3.';

  @override
  String get lessonFiveParity => 'Paridade de arestas do 5×5';

  @override
  String get lessonFiveParityDesc => 'Corrija a aresta com as asas trocadas.';

  @override
  String get introGoalFiveParity =>
      'Corrija a única aresta com as duas asas exteriores trocadas: a única paridade do 5×5.';

  @override
  String get introHowFiveParity =>
      'Aparece como uma última aresta que parece virada.\nFaça uma vez a correção longa com camadas interiores.\nNo 5×5 não há paridade de PLL.';

  @override
  String get introHoldFiveParity =>
      'A última camada em cima e a aresta com as asas trocadas à frente da camada de cima.';

  @override
  String get introWhyFiveParity =>
      'No 5×5 só as duas asas exteriores de uma aresta se podem trocar, por isso basta um algoritmo.';

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
  String get introHoldSixIntro =>
      'Ao início, como quiser: tal como o 4×4, o 6×6 não tem centros fixos.';

  @override
  String get introWhySixIntro =>
      'Se resolve um 4×4 e um 5×5, o 6×6 é a mesma redução com blocos maiores.';

  @override
  String get lessonSixCenters => 'Centros do 6×6';

  @override
  String get lessonSixCentersDesc => 'Monte centros 4×4 com barras de quatro.';

  @override
  String get introGoalSixCenters =>
      'Monte em cada face um bloco de centro 4×4 de uma só cor.';

  @override
  String get introHowSixCenters =>
      'Primeiro confirme a ordem das cores num canto: nenhum centro é fixo.\nFaça barras de quatro e junte-as.\nNos dois últimos centros mova peças soltas: camada, topo, desfazer.';

  @override
  String get introHoldSixCenters =>
      'A face que está a construir à frente; os centros acabados à esquerda, à direita ou em baixo.';

  @override
  String get introWhySixCenters =>
      'As barras juntam-se com camadas interiores e cada camada é desfeita, por isso os centros acabados ficam inteiros.';

  @override
  String get lessonSixEdges => 'Arestas do 6×6';

  @override
  String get lessonSixEdgesDesc => 'Junte as quatro peças de cada aresta.';

  @override
  String get introGoalSixEdges =>
      'Junte as quatro peças de cada aresta para o 6×6 ter 12 arestas limpas.';

  @override
  String get introHowSixEdges =>
      'Alinhe à frente as asas exteriores e interiores de uma aresta.\nA camada larga funda mete e tira uma aresta.\nNunca desfaça uma aresta acabada para libertar uma peça.';

  @override
  String get introHoldSixEdges =>
      'A aresta que está a construir à frente; as acabadas arrumadas em cima e em baixo.';

  @override
  String get introWhySixEdges =>
      'A rotação larga funda afasta os centros para as asas se juntarem e depois repõe-nos.';

  @override
  String get lessonSixSolve => 'Resolva o 6×6 como um 3×3';

  @override
  String get lessonSixSolveDesc => 'Termine camada a camada, como um 3×3.';

  @override
  String get introGoalSixSolve =>
      'Resolva o 6×6 reduzido como um 3×3, camada a camada, só com rotações exteriores.';

  @override
  String get introHowSixSolve =>
      'A partir de agora só rotações exteriores: uma camada interior partiria um centro ou uma aresta.\nOs centros que construiu mostram a cor de cada face.\nCruz e cantos brancos, a camada do meio e depois a amarela.';

  @override
  String get introHoldSixSolve =>
      'A cor da primeira camada em baixo, tal como no 3×3; o canto a encaixar à frente à direita.';

  @override
  String get introWhySixSolve =>
      'As rotações exteriores movem cada centro 4×4 e cada aresta como uma só peça, tal como no 3×3.';

  @override
  String get lessonSixParity => 'Paridade do 6×6';

  @override
  String get lessonSixParityDesc => 'Uma aresta virada ou duas trocadas.';

  @override
  String get introGoalSixParity =>
      'Corrija os dois casos do 6×6 que um 3×3 nunca tem: uma aresta virada ou duas arestas trocadas.';

  @override
  String get introHowSixParity =>
      'Resolva como um 3×3 até encravar.\nUma aresta virada: a correção longa com 3Rw.\nDuas arestas trocadas: a correção curta de rotações interiores duplas.';

  @override
  String get introHoldSixParity =>
      'A última camada em cima. A aresta virada à frente; se forem duas trocadas, à frente e atrás.';

  @override
  String get introWhySixParity =>
      'Tal como o 4×4, o 6×6 pode acabar com uma aresta virada ou duas trocadas; os algoritmos de camadas interiores corrigem-nas e deixam o resto.';

  @override
  String get stepFivePieces => 'As peças do 5×5';

  @override
  String get stepFivePiecesBody =>
      'A peça do meio de cada face nunca se move, por isso o esquema de cores não pode sair errado. À volta há oito peças de centro: centros de canto e de aresta nunca trocam de tipo. Cada aresta é uma peça do meio com duas asas.';

  @override
  String get stepFiveSlices => 'Três tipos de rotações';

  @override
  String get stepFiveSlicesBody =>
      'Uma rotação exterior mexe uma face. Uma rotação dupla mexe uma face com a camada de trás. Uma rotação de camada interior mexe só uma camada de dentro: é assim que as peças trocam de lugar sem tocar no exterior.';

  @override
  String get stepFiveCenterBar => 'Barras de centro';

  @override
  String get stepFiveCenterBarBody =>
      'Faça uma fila de três peças de centro iguais, meta-a com uma camada interior, rode o topo e desfaça a camada: o movimento que mete a barra também repõe o centro acabado. Três barras fazem um centro.';

  @override
  String get stepFiveCenterSwap => 'Trocar sem desfazer';

  @override
  String get stepFiveCenterSwapBody =>
      'Para mexer uma só peça de centro: rode uma camada interior, rode o topo, desfaça a camada e volte o topo. Os centros prontos voltam sempre.';

  @override
  String get stepFiveEdgePair => 'Emparelhar asas com a aresta do meio';

  @override
  String get stepFiveEdgePairBody =>
      'Alinhe uma asa ao lado da sua aresta do meio, à frente, desça a camada interior, troque por uma aresta por resolver com um gatilho curto e volte a subir a camada interior.';

  @override
  String get stepFiveEdgeLast => 'As últimas arestas';

  @override
  String get stepFiveEdgeLastBody =>
      'Sem nenhuma aresta livre para trocar, use camada, virar, camada: uma rotação larga, um gatilho curto e a rotação larga de volta emparelham as últimas arestas sem desfazer as acabadas.';

  @override
  String get stepFiveAsThree => 'Agora é um 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Com centros e arestas prontos, o 5×5 porta-se como um 3×3 grande. Use só rotações exteriores e avance camada a camada: cruz e cantos brancos, a camada do meio e depois a amarela. O 5×5 não tem paridade de PLL.';

  @override
  String get stepFiveEdgeParity => 'Trocar as asas da última aresta';

  @override
  String get stepFiveEdgeParityBody =>
      'Às vezes a última aresta tem as duas asas exteriores trocadas e parece virada: é a única paridade do 5×5. Ponha-a à frente da camada de cima e faça uma vez o algoritmo de camadas interiores; tudo o resto volta ao lugar.';

  @override
  String get stepSixPieces => 'As peças do 6×6';

  @override
  String get stepSixPiecesBody =>
      'Tal como o 4×4, o 6×6 não tem centros fixos: dezasseis peças de centro formam a cor de cada face, por isso confirme primeiro a ordem das cores num canto. Cada aresta tem quatro asas: duas exteriores e duas interiores.';

  @override
  String get stepSixSlices => 'Rodar camadas mais fundas';

  @override
  String get stepSixSlicesBody =>
      'As rotações duplas podem mexer duas ou três camadas a partir de uma face. As camadas interiores, segunda e terceira, são as ferramentas para centros e arestas.';

  @override
  String get stepSixCenterBar => 'Barras de quatro';

  @override
  String get stepSixCenterBarBody =>
      'Faça filas de quatro peças de centro iguais e junte-as com rotações de camadas interiores, desfazendo cada camada, até a face ser um bloco 4×4 de uma só cor.';

  @override
  String get stepSixCenterSwap => 'Uma peça de cada vez';

  @override
  String get stepSixCenterSwapBody =>
      'Rode a terceira camada, rode o topo, desfaça e volte: uma peça de centro move-se e os centros acabados voltam. Use isto nos dois últimos centros, quando nenhuma barra encaixa.';

  @override
  String get stepSixEdgePair => 'Quatro peças, uma aresta';

  @override
  String get stepSixEdgePairBody =>
      'Junte as quatro asas de uma aresta à frente com a camada larga funda, troque por uma aresta por resolver com um gatilho curto e volte a rodar a camada larga.';

  @override
  String get stepSixEdgeLast => 'As últimas arestas';

  @override
  String get stepSixEdgeLastBody =>
      'Emparelhe as últimas arestas com um gatilho curto entre uma rotação larga funda e o seu desfazer, assim as acabadas continuam juntas. Nunca desfaça uma aresta acabada para libertar uma peça.';

  @override
  String get stepSixAsThree => 'Agora é um 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Com centros 4×4 e arestas emparelhadas, resolva o 6×6 como um 3×3, camada a camada, só com rotações exteriores. Uma aresta virada ou duas trocadas no fim é paridade, não um erro.';

  @override
  String get stepSixOllParity => 'Uma aresta virada';

  @override
  String get stepSixOllParityBody =>
      'Uma única aresta que parece virada na última camada é paridade. Ponha-a à frente da camada de cima e faça a correção longa: vira as quatro asas, troca também as arestas da esquerda e da direita em cima e não toca nas duas primeiras camadas.';

  @override
  String get stepSixPllParity => 'Duas arestas trocadas';

  @override
  String get stepSixPllParityBody =>
      'Se duas arestas parecerem trocadas mesmo no fim, ponha-as à frente e atrás na camada de cima e faça a correção curta de rotações interiores duplas: as quatro asas das duas arestas trocam de lugar.';

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
  String get patternsWatchVideo => 'Ver vídeo';

  @override
  String get patternsNotNow => 'Agora não';

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
  String dailyYourTime(String time) {
    return 'O teu tempo: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Tens $seconds segundos para inspecionar o cubo. Toca para iniciar a contagem decrescente.';
  }

  @override
  String get timerInspectTapReady =>
      'Toca quando estiveres pronto para começar a resolver';

  @override
  String timerInspectPlus2(int seconds) {
    return 'A inspeção passou dos $seconds s e o relógio arrancou sozinho: penalização de +2 s';
  }

  @override
  String timerAvgOf(int count) {
    return 'Média de $count';
  }

  @override
  String get timerAvgNote => 'As médias descartam o melhor e o pior tempo';

  @override
  String get timerPbSub => 'Melhor tempo';

  @override
  String get timerPlus2Caption => 'Penalização de +2 s';

  @override
  String get timerDnfCaption => 'Não terminado (DNF)';

  @override
  String get timerDeleteCaption => 'Apagar esta resolução';

  @override
  String get patternBullsEye => 'Alvo';

  @override
  String get patternFramedCenter => 'Centro emoldurado';

  @override
  String get patternBlockCheckerboard => 'Xadrez em blocos';

  @override
  String get patternCubeInCubeInCube => 'Cubo num cubo num cubo';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Seis T';

  @override
  String get patternTwinPeaks => 'Picos gémeos';

  @override
  String get patternSpiral => 'Espiral';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Pontos centrais';

  @override
  String get patternStripes => 'Riscas';

  @override
  String get patternAnaconda => 'Anaconda';

  @override
  String get patternZigzag => 'Ziguezague';

  @override
  String get patternFourSpots => 'Quatro pontos';

  @override
  String get patternGreenMamba => 'Mamba verde';

  @override
  String get patternPlusMinus => 'Mais e menos';

  @override
  String guideStepCounter(int current, int total) {
    return 'Passo $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Movimento $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Movimento $current / $total';
  }

  @override
  String get dailyStep1Title => 'Passo 1: Baralha o cubo';

  @override
  String get dailyStep2Title => 'Passo 2: Resolve o cubo';

  @override
  String dailyPersonalBest(String time) {
    return 'Melhor marca: $time';
  }

  @override
  String get dailyRecentDays => 'Dias recentes';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Série de $count dias! Estás imparável!',
      one: 'Série de 1 dia! Estás imparável!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Cubo baralhado! Agora vai resolvê-lo';

  @override
  String get dailyCongratsTitle => 'Parabéns!';

  @override
  String dailyCongratsBody(String time) {
    return 'Resolveste o desafio de hoje em $time.';
  }

  @override
  String get dailyCongratsDone => 'Voltar ao desafio';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count padrões',
      one: '1 padrão',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Faltam $hours horas',
      one: 'Falta 1 hora',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Faltam $minutes minutos',
      one: 'Falta 1 minuto',
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
          'Veja 1 vídeo curto para desbloquear este padrão e o seu guia passo a passo durante $hours horas.',
      one: 'Veja 1 vídeo curto para desbloquear este padrão e o seu guia passo a passo durante 1 hora.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Veja 1 vídeo curto para abrir esta lição sempre que quiser durante as próximas $hours horas.',
      one: 'Veja 1 vídeo curto para abrir esta lição sempre que quiser durante a próxima hora.',
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
          'Já usou a sua resolução gratuita de 4×4–6×6. Veja 1 vídeo curto para resolver cubos grandes durante as próximas $hours horas.',
      one: 'Já usou a sua resolução gratuita de 4×4–6×6. Veja 1 vídeo curto para resolver cubos grandes durante a próxima hora.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Rotação dupla · 180°';

  @override
  String get homeAcademy => 'Academia';

  @override
  String get homePatterns => 'Padrões fixes';

  @override
  String get homePractice => 'Cronómetro e desafio diário';

  @override
  String get scanChoiceSubtitle => 'Como queres começar?';

  @override
  String get scanChoiceCamera => 'Digitalizar com a câmara';

  @override
  String get scanChoiceCameraDesc =>
      'Mostra cada face à câmara e obtém a solução.';

  @override
  String get scanChoice3d => 'Abrir cubo 3D';

  @override
  String get scanChoice3dDesc =>
      'Roda um cubo virtual, baralha-o e resolve-o passo a passo.';

  @override
  String get academyAllSizes => 'Todos os tamanhos';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total lições concluídas';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total concluídas';
  }

  @override
  String get lessonStageConcept => 'Conceito';

  @override
  String get lessonStageExamples => 'Exemplos';

  @override
  String get lessonStagePractice => 'Prática';

  @override
  String get lessonStageNext => 'Seguir / livre';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Etapa $index de $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Exemplo $index de $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Percurso $index de $total';
  }

  @override
  String get lessonBonusCase => 'Caso bónus';

  @override
  String get lessonPracticeIntro =>
      'Uma baralhação real: só os passos anteriores estão resolvidos. Termine todo este passo, indicação a indicação.';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Siga diretamente para $lesson.';
  }

  @override
  String get lessonFreePractice => 'Prática livre';

  @override
  String get lessonFreePracticeDesc =>
      'Resolva sozinho um cubo 3D baralhado, do início até este passo.';

  @override
  String freePracticeBanner(String topic) {
    return 'Pratique à vontade: resolva o cubo do início até $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Rode a face do centro $face como a seta indica. O centro fica no lugar; só as peças à volta viajam.';
  }

  @override
  String cueTrigger(String front) {
    return 'Gatilho da mão direita, com o $front virado para si: face direita para cima, topo para a esquerda, face direita para baixo, topo de volta para a direita.';
  }

  @override
  String get cueTriggerBack =>
      'O sexto gatilho seguido devolve o cubo exatamente ao estado inicial. Seis é o número mágico!';

  @override
  String cueSliceInner(String face) {
    return 'Rode só a camada interior junto à face $face. A face em si não se mexe, por isso os centros separam-se.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Um movimento largo: a face $face e a camada interior ao lado rodam juntas, como uma única camada grossa.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Rode o cubo todo para o centro $top ficar em cima e o centro $front virado para si.';
  }

  @override
  String get cueTurnTop =>
      'Rode só a camada de cima, como a seta indica, para preparar o algoritmo seguinte.';

  @override
  String get cueAlignTop =>
      'Último movimento: rode a camada de cima para alinhar as cores. Feito!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'A aresta $piece está na camada de cima. Rode o topo até ficar mesmo por cima do centro $center e depois rode essa face duas vezes para a descer.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'A aresta $piece está presa na camada do meio. Suba-a, alinhe-a por cima do centro $center e desça-a.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'A aresta $piece está no lugar mas virada: o branco olha para o lado. Tire-a e suba-a com o branco para cima; depois desça-a junto ao centro $center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'Ao estilo CFOP, a base também pode rodar. Desça a aresta $piece e rode a base para a alinhar com o centro $center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Rode o topo até o canto $piece ficar mesmo por cima do seu lugar, entre os lados $a e $b. Repita o gatilho da mão direita até ele entrar bem orientado.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'O canto $piece está no lugar mas rodado. Um gatilho tira-o (entra um canto amarelo no lugar dele); continue a repetir sobre o mesmo lugar até ele voltar com o branco para baixo. Não rode o cubo para o perseguir.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Rode o topo até a aresta $piece ficar alinhada com o centro $a e depois mande-a para baixo à direita, para o lugar entre $a e $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Rode o topo até a aresta $piece ficar alinhada com o centro $a e depois mande-a para baixo à esquerda, para o lugar entre $a e $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'A aresta $piece está no lugar mas virada. Encaixe ali uma aresta amarela para a empurrar para cima e depois encaixe-a de novo entre $a e $b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Uma linha amarela: rode o topo para ela ir da esquerda para a direita, mantenha o $front virado para si e faça o algoritmo da cruz amarela.';
  }

  @override
  String cueYellowL(String front) {
    return 'Um L amarelo: rode o topo para o L apontar para trás à esquerda, mantenha o $front virado para si e faça o algoritmo. Passa a ser uma linha.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Só o centro é amarelo: um ponto. Aplique o algoritmo uma vez com o $front virado para si para obter um L. Um ponto pode levar três voltas, por isso continue.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Rode o topo até a aresta $piece coincidir com o centro $center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Duas arestas certas estão atrás e à direita. Com o $front virado para si, faça a troca: as arestas da frente e da esquerda trocam de lugar.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'As arestas certas estão uma em frente à outra. Faça a troca uma vez com o $front virado para si; depois duas vizinhas ficam certas.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'O canto $piece já está no seu lugar. Mantenha-o à frente à direita, com o $front virado para si, e faça o ciclo dos outros três cantos.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Nenhum canto amarelo está ainda no lugar. Faça um ciclo com o $front virado para si; depois um canto fica no lugar.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Rode o canto $piece à frente à direita: repita o gatilho de baixo aos pares até o amarelo dele ficar para cima. As camadas de baixo parecem baralhadas; voltam com o último canto!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Desta vez o canto $piece precisa de quatro gatilhos. Continue: o amarelo sobe sempre após dois ou quatro.';
  }

  @override
  String get cueTwistNext =>
      'Rode só a camada de cima para trazer o próximo canto mal orientado para a frente à direita. Não rode agora o cubo todo!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Junte o canto $piece à aresta $edge em cima e depois insira o par no lugar entre $a e $b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'O canto $piece está preso no seu lugar com a aresta errada. Tire-o primeiro para cima, depois forme o par e insira-o.';
  }

  @override
  String cueOllSune(String front) {
    return 'Com o $front virado para si, faça o Sune para virar os cantos amarelos para cima.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Desta vez um Sune não chegou. Rode o topo e faça o Sune outra vez, com o $front virado para si.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Dois cantos têm de trocar. Mantenha o par igual (os «faróis») à esquerda, com o $front virado para si, e faça a T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Os cantos estão feitos. Mantenha a aresta $piece atrás e faça o ciclo das outras três arestas com a U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'Nenhuma aresta de cima coincide ainda com o seu centro. Faça a U-perm uma vez de qualquer lado; depois uma coincide.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Dois cantos vizinhos de cima têm de trocar. Mantenha o par igual à esquerda, com o $front virado para si, e faça a troca.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Os dois cantos a trocar estão na diagonal. Faça a troca diagonal com o $front virado para si.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Leve para casa a peça de centro $color perdida com o 3-ciclo de centros: camada, topo, camada e depois tudo de volta.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Uma barra inteira de peças de centro $color está na face errada. Levante-a com a camada, rode o topo e devolva-a ao lugar.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Junte as duas peças de aresta $piece: alinhe-as, rode a camada, troque uma aresta por emparelhar com os movimentos da mão direita e volte a camada.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'As últimas arestas: emparelhe a aresta $piece com o algoritmo das duas últimas arestas, que mantém intactas todas as arestas prontas.';
  }

  @override
  String cueParityOll(String front) {
    return 'Paridade de OLL: uma aresta de cima está virada, o que nunca acontece num 3×3. Deixe-a à frente, com o $front virado para si, e aplique a correção de paridade antes de qualquer OLL normal.';
  }

  @override
  String get cueParityPll =>
      'Paridade de PLL: duas arestas de cima estão trocadas, o que nunca acontece num 3×3. Deixe-as à frente e atrás, aplique a troca de paridade e alinhe o topo.';

  @override
  String cueParityFive(String front) {
    return 'Paridade de arestas: as duas asas exteriores de uma aresta estão trocadas, a única paridade do 5×5. Deixe essa aresta à frente, com o $front virado para si, e aplique a correção uma vez.';
  }

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingNext => 'Seguinte';

  @override
  String get onboardingStart => 'Começar';

  @override
  String get onboardingWhatTitle => 'O teu companheiro de cubos';

  @override
  String get onboardingWhatBody =>
      'O CubeMentor ajuda-te a resolver, aprender e praticar qualquer cubo de 2×2 a 6×6, totalmente offline.';

  @override
  String get onboardingScanTitle => 'Digitaliza e resolve em segundos';

  @override
  String get onboardingScanBody =>
      'Mostra cada face à câmara (ou introduz as cores) e segue a solução em 3D movimento a movimento.';

  @override
  String get onboardingLearnTitle => 'Aprende e joga';

  @override
  String get onboardingLearnBody =>
      'Domine o método por camadas na Academia e depois rode, baralhe e resolva à vontade no Playground 3D.';

  @override
  String get scanChoiceManualDesc =>
      'Introduz as cores de cada face, autocolante a autocolante.';

  @override
  String get scanTryAgain => 'Tentar novamente';

  @override
  String get scanEditManually => 'Corrigir cores à mão';

  @override
  String get scanLightingHint =>
      'Centra a face na grelha. Usa luz forte e uniforme e evita reflexos.';

  @override
  String get crownExplain =>
      'Uma camada é uma fatia horizontal do cubo: a primeira camada é a branca em baixo, a segunda é a camada do meio e a terceira é a amarela em cima.';

  @override
  String get lessonObjectiveHeading => 'Objetivo de aprendizagem';

  @override
  String get dirRowTop => 'Fila de cima da face da frente';

  @override
  String get dirRowBottom => 'Fila de baixo da face da frente';

  @override
  String get dirColumnRight => 'Coluna direita da face da frente';

  @override
  String get dirColumnLeft => 'Coluna esquerda da face da frente';

  @override
  String get solveChoiceTitle => 'Como queres resolvê-lo?';

  @override
  String get solveChoiceFastDesc =>
      'A solução mais curta, movimento a movimento.';

  @override
  String get solveChoiceGuidedDesc =>
      'Aprenda o método por camadas passo a passo.';

  @override
  String get guidedSolvedTitle => 'Resolvido!';

  @override
  String get guidedSolvedBody =>
      'Seguiste todos os passos e resolveste o cubo.';

  @override
  String get solveAgain => 'Resolver novamente';

  @override
  String get backToHome => 'Voltar ao início';

  @override
  String get dailyStatTime => 'Tempo de hoje';

  @override
  String get dailyStatBest => 'Recorde pessoal';

  @override
  String get dailyStatStreak => 'Série atual';

  @override
  String get dailyStatBestStreak => 'Melhor série';

  @override
  String get privacyPolicyTitle => 'Política de privacidade';

  @override
  String get settingsPrivacyPolicyDesc =>
      'O que o CubeMentor guarda e o que os anúncios usam.';

  @override
  String get privacyIntro =>
      'O CubeMentor funciona sem conta e sem servidores próprios. Esta página explica o que fica no teu dispositivo e o que o nosso parceiro de anúncios usa.';

  @override
  String get privacyDataTitle => 'Os teus dados ficam no teu dispositivo';

  @override
  String get privacyDataBody =>
      'O idioma, as definições, o progresso nas lições, os tempos e a série diária são guardados apenas neste dispositivo. Não temos servidores, por isso nunca os recebemos. Desinstalar a app apaga-os.';

  @override
  String get privacyCameraTitle => 'Câmara';

  @override
  String get privacyCameraBody =>
      'A câmara só é usada enquanto digitalizas um cubo. As imagens são analisadas no teu dispositivo para ler as cores dos autocolantes; nenhuma foto ou vídeo é guardado ou enviado.';

  @override
  String get privacyAdsTitle => 'Anúncios';

  @override
  String get privacyAdsBody =>
      'A app mostra anúncios do Google AdMob. A Google pode usar identificadores do dispositivo e dados de interação com anúncios para os mostrar e medir, conforme descrito na política de privacidade da Google. Onde a lei o exige, é-te pedido consentimento primeiro e podes alterá-lo nas Definições.';

  @override
  String get privacyContactTitle => 'Contacto';

  @override
  String privacyContactBody(String email) {
    return 'Dúvidas sobre privacidade? Escreve-nos para $email.';
  }
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
  String get solveModeGuided => 'Guiado (3 camadas)';

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
  String get phaseLblCorners => 'Quinas da primeira camada';

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
  String get crownFirst => 'Primeira camada';

  @override
  String get crownSecond => 'Segunda camada';

  @override
  String get crownThird => 'Terceira camada';

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
      'Encaixe as 4 quinas brancas nos lugares certos para terminar a face branca e toda a primeira camada.';

  @override
  String get subStepGoal21 =>
      'Encaixe os 4 meios da camada do meio sem desmontar a primeira camada.';

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
  String get trackBeginner => '3×3 iniciante: camada por camada';

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
      'Segure o amarelo em cima e o verde virado para você. Primeiro junte os quatro meios brancos em volta do centro amarelo, com o branco para cima, como pétalas: é a margarida. Depois cada pétala desce para o centro branco, com a cor lateral igual ao centro do lado.';

  @override
  String get stepCrossTop => 'Meio em cima';

  @override
  String get stepCrossTopBody =>
      'Um meio branco em cima com o branco para cima é uma pétala da margarida. Gire o topo até a cor lateral dele ficar bem em cima do centro da mesma cor e gire essa face duas vezes (180°) para descê-lo até o centro branco.';

  @override
  String get stepCrossMiddle => 'Meio na camada do meio';

  @override
  String get stepCrossMiddleBody =>
      'Um meio preso na camada do meio sobe primeiro: suba o lado dele, tire o topo do caminho e desça o lado, para as peças já colocadas não saírem. Agora é uma pétala em cima: alinhe e gire essa face duas vezes.';

  @override
  String get stepCornersInsert => 'Sobre o seu lugar';

  @override
  String get stepCornersInsertBody =>
      'Gire o topo até a quina branca ficar bem em cima do seu lugar, entre os dois centros das cores laterais dela. Aqui basta um giro do topo e R U\' R\': U leva a quina para cima do lugar e R U\' R\' encaixa com o branco para baixo.';

  @override
  String get stepCornersRepeat => 'Repita o gatilho';

  @override
  String get stepCornersRepeatBody =>
      'Deixe o lugar na frente à direita e repita R U R\' U\' até o branco ficar para baixo: uma vez se ele olha para a direita, três se olha para cima, cinco se olha para você. Enquanto isso o topo fica bagunçado; ele se arruma sozinho.';

  @override
  String get stepMiddleRight => 'Meio para a direita';

  @override
  String get stepMiddleRightBody =>
      'Procure um meio de cima sem amarelo. Gire o topo até a cor da frente bater com o centro à sua frente. Se a cor de cima bater com o centro da direita, mande para a direita: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Meio para a esquerda';

  @override
  String get stepMiddleLeftBody =>
      'Se a cor de cima bater com o centro da esquerda, use o espelho: U\' L\' U L U F U\' F\'. A camada branca volta inteira toda vez.';

  @override
  String get stepYellowCross => 'Um só algoritmo';

  @override
  String get stepYellowCrossBody =>
      'Olhe só os meios amarelos em cima. Deixe o L atrás à esquerda e a linha da esquerda para a direita e faça F R U R\' U\' F\'. A linha precisa de uma vez, o L de duas, o ponto de até três.';

  @override
  String get stepYellowEdges => 'Alinhe os meios';

  @override
  String get stepYellowEdgesBody =>
      'Gire o topo até dois meios baterem com seus centros. Com um atrás e outro à direita, R U R\' U R U2 R\' U troca o da frente com o da esquerda.';

  @override
  String get stepPlaceCorners => 'Posicione';

  @override
  String get stepPlaceCornersBody =>
      'Uma quina está no lugar quando suas cores batem com os três centros em volta, mesmo girada. Deixe uma assim na frente à direita: U R U\' L\' U R\' U\' L move as outras três. Repita até as quatro estarem no lugar.';

  @override
  String get stepTwistCorners => 'Oriente';

  @override
  String get stepTwistCornersBody =>
      'Com uma quina não resolvida na frente à direita, repita R\' D\' R D de dois em dois até o amarelo ficar em cima; depois gire só o topo para trazer a próxima. A parte de baixo parece desmontada até a última quina: continue.';

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
      'Um 2×2 são só oito quinas: sem meios nem centros. Monte a camada branca embaixo com as cores laterais das vizinhas batendo e termine por um caminho só: Sune para o topo amarelo e depois a T-perm ou a Y-perm.';

  @override
  String get stepTwoCorner => 'Insira as quinas';

  @override
  String get stepTwoCornerBody =>
      'Igual às quinas brancas do 3×3: leve uma quina para cima do lugar vazio na frente à direita e encaixe, aqui com U R U\' R\' ou repetindo R U R\' U\' até o branco ficar para baixo. Confira as cores laterais com a vizinha.';

  @override
  String get lessonTwoOll => 'Oriente o topo';

  @override
  String get lessonTwoOllDesc => 'OLL do Ortega com o Sune.';

  @override
  String get stepTwoSune => 'Sune de novo';

  @override
  String get stepTwoSuneBody =>
      'Conte os adesivos amarelos para cima. Deixe a única quina com amarelo para cima na frente à esquerda e faça Sune (R U R\' U R U2 R\'). Conte e segure de novo; no máximo três Sunes. Entre eles gire só o topo.';

  @override
  String get lessonTwoPbl => 'Permute as duas camadas';

  @override
  String get lessonTwoPblDesc => 'Troque quinas para terminar.';

  @override
  String get stepTwoAdjacent => 'Troca adjacente';

  @override
  String get stepTwoAdjacentBody =>
      'Faróis são dois adesivos iguais em cima no mesmo lado. Gire o topo até os faróis ficarem à esquerda, assim as duas quinas a trocar ficam à direita, e faça a T-perm.';

  @override
  String get stepTwoDiagonal => 'Troca diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Sem faróis em nenhum lado, duas quinas na diagonal precisam trocar: faça a Y-perm de qualquer lado e gire o topo para alinhar tudo.';

  @override
  String get lessonBigIntro => 'Peças dos cubos grandes';

  @override
  String get lessonBigIntroDesc => 'Centros, wings e camadas internas.';

  @override
  String get stepBigPieces => 'Sem centros fixos';

  @override
  String get stepBigPiecesBody =>
      'No 4×4 cada face tem quatro peças de centro que se movem e cada meio são duas wings. Nenhum centro é fixo, então confira a ordem das cores numa quina: branco oposto ao amarelo, azul ao verde, vermelho ao laranja.';

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
      'Esse comutador move exatamente três peças de centro e deixa todo o resto, então os centros prontos continuam prontos. Use quando uma peça solta não se junta a uma barra.';

  @override
  String get lessonBigEdges => 'Parear os meios';

  @override
  String get lessonBigEdgesDesc => 'Junte as wings em meios completos.';

  @override
  String get stepBigEdgePair => 'Parear e restaurar';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' alinha duas wings iguais, R U R\' F R\' F\' R traz um meio não pareado e Uw devolve os centros. Sempre feche a camada que você abriu.';

  @override
  String get lessonBigParity => 'Paridade';

  @override
  String get lessonBigParityDesc => 'Paridade de OLL e PLL em cubos pares.';

  @override
  String get stepBigOllParity => 'Paridade de OLL';

  @override
  String get stepBigOllParityBody =>
      'Um meio invertido sozinho não acontece num 3×3: é paridade de OLL, não um erro. Deixe-o na frente da camada de cima e faça o algoritmo longo. Ele também troca os meios da esquerda e da direita em cima e duas quinas; os últimos passos do 3×3 corrigem isso.';

  @override
  String get stepBigPllParity => 'Paridade de PLL';

  @override
  String get stepBigPllParityBody =>
      'Dois meios trocados bem no final e nenhum algoritmo de 3×3 serve? É paridade de PLL. Deixe-os na frente e atrás na camada de cima: 2R2 U2 2R2 Uw2 2R2 2U2 troca os dois.';

  @override
  String get introGoalHeading => 'Qual é o objetivo?';

  @override
  String get introHowHeading => 'Como fazer?';

  @override
  String get introHoldHeading => 'Como segurar';

  @override
  String get introWhyHeading => 'Por que funciona';

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
      'Monte uma cruz branca embaixo em que cada meio branco também combine com o centro do lado.';

  @override
  String get introGoalCorners =>
      'Coloque as quatro quinas brancas para completar toda a primeira camada: face branca e cores laterais batendo.';

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
      'Leve as últimas quinas para o lugar com uma T-perm ou uma Y-perm e alinhe a camada de cima para resolver o 2×2.';

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
      'Corrija os dois casos do 4×4 que um 3×3 nunca tem: um meio invertido (paridade de OLL) ou dois meios trocados (paridade de PLL).';

  @override
  String get introHowBasics =>
      'Os centros nunca se mexem: indicam a cor de cada face.\nCada letra gira uma face um quarto de volta no sentido horário.\nUm apóstrofo (\') gira para trás; um 2 gira duas vezes.';

  @override
  String get introHoldBasics =>
      'Como quiser: os centros não se movem, então as cores sempre dizem qual face é qual.';

  @override
  String get introWhyBasics =>
      'Todo algoritmo é só uma sequência dessas letras, então saber lê-las é a primeira habilidade.';

  @override
  String get introHowCross =>
      'Leve cada meio branco para cima, com o branco para cima, em volta do centro amarelo: é a margarida.\nGire o topo até a cor lateral de uma pétala ficar sobre o centro dessa cor.\nGire essa face duas vezes para descê-la; repita com as quatro.';

  @override
  String get introHoldCross =>
      'Centro amarelo em cima e branco embaixo durante todo o passo. Gire o topo, não o cubo, para alinhar uma pétala.';

  @override
  String get introWhyCross =>
      'Com o branco para cima, dois giros da face da frente colocam o meio no centro branco, com o branco para baixo e o lado já batendo.';

  @override
  String get introHowCorners =>
      'Gire o topo até uma quina branca ficar sobre o seu lugar vazio, na frente à direita.\nRepita R U R\' U\': uma vez se o branco olha para a direita, três se olha para cima, cinco se olha para você.\nFaça o mesmo com as outras três quinas.';

  @override
  String get introHoldCorners =>
      'Branco embaixo, amarelo em cima. A quina na frente à direita, bem em cima do seu lugar.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' levanta o lugar e devolve: cada volta gira um pouco a quina até o branco ficar para baixo, e a cruz nunca se desfaz.';

  @override
  String get introHowMiddle =>
      'Procure um meio de cima sem amarelo e combine a cor da frente com o centro embaixo.\nA cor de cima diz para onde ele vai: direita ou esquerda.\nEncaixe com o algoritmo de 8 movimentos; a camada branca volta inteira.';

  @override
  String get introHoldMiddle =>
      'Branco embaixo, amarelo em cima. O meio na frente, com a cor da frente igual ao centro embaixo.';

  @override
  String get introWhyMiddle =>
      'O algoritmo tira o lugar do caminho, encaixa o meio e devolve a camada branca. Meio com amarelo é do topo, nunca da camada do meio.';

  @override
  String get introHowYellowCross =>
      'Olhe só os meios amarelos em cima: um ponto, um L ou uma linha.\nDeixe o L atrás à esquerda e a linha da esquerda para a direita, e faça F R U R\' U\' F\'.\nA linha precisa de uma vez, o L de duas, o ponto de até três.';

  @override
  String get introHoldYellowCross =>
      'Branco embaixo, amarelo em cima. O L atrás à esquerda, a linha da esquerda para a direita; o ponto, de qualquer jeito.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' vira dois meios de cima por vez sem mexer nas duas primeiras camadas.';

  @override
  String get introHowYellowEdges =>
      'Gire o topo até dois meios baterem com seus centros.\nDeixe-os atrás e à direita e faça R U R\' U R U2 R\' U.\nSe os meios certos estiverem opostos, faça uma vez de qualquer lado antes.';

  @override
  String get introHoldYellowEdges =>
      'Amarelo em cima. Um meio certo atrás e o outro à direita.';

  @override
  String get introWhyYellowEdges =>
      'Esse algoritmo só move peças de cima, então as duas primeiras camadas sempre voltam.';

  @override
  String get introHowYellowCorners =>
      'Uma quina está no lugar quando suas cores batem com os três centros em volta, mesmo girada.\nMantenha uma quina no lugar na frente à direita.\nU R U\' L\' U R\' U\' L roda as outras três; repita até encaixarem todas.';

  @override
  String get introHoldYellowCorners =>
      'Amarelo em cima. Uma quina já no lugar na frente à direita; se não houver, qualquer quina.';

  @override
  String get introWhyYellowCorners =>
      'Ele roda três quinas em círculo e deixa parada a da frente à direita, então cada repetição coloca mais quinas no lugar.';

  @override
  String get introHowTwistCorners =>
      'Segure uma quina não resolvida na frente à direita.\nRepita R\' D\' R D de dois em dois até o amarelo dela ficar para cima.\nGire só o topo para a próxima; a parte de baixo volta com a última quina.';

  @override
  String get introHoldTwistCorners =>
      'Amarelo em cima, a quina a girar na frente à direita. Entre as quinas gire só o topo, nunca o cubo inteiro.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D gira a quina e bagunça a parte de baixo, mas ela volta quando todas as quinas estão giradas. Parar no meio deixa tudo desmontado.';

  @override
  String get introHowCfopIntro =>
      'Cruz: quatro arestas planejadas durante a inspeção.\nF2L: cada canto entra junto com a sua aresta.\nA OLL deixa o topo amarelo e a PLL leva as peças para o lugar.';

  @override
  String get introHoldCfopIntro =>
      'Speedcubers montam a cruz embaixo para enxergar as próximas peças enquanto giram.';

  @override
  String get introWhyCfopIntro =>
      'Resolver uma quina junto com seu meio economiza muitos movimentos, e reconhecer casos substitui a tentativa e erro.';

  @override
  String get introHowF2l =>
      'Encontre um canto e a aresta dele na camada de cima.\nJunte-os em par por cima do seu espaço.\nEncaixe o par com três ou quatro movimentos.';

  @override
  String get introHoldF2l =>
      'Cruz embaixo. O lugar do par na frente à direita, ou na frente à esquerda no espelho.';

  @override
  String get introWhyF2l =>
      'Uma quina e seu meio pareados entram juntos, então duas camadas crescem ao mesmo tempo em vez de peça por peça.';

  @override
  String get introHowOll =>
      'Primeiro a cruz amarela com F R U R\' U\' F\'.\nDepois oriente os cantos, por exemplo com o Sune.\nReconheça o caso pelo amarelo que vê.';

  @override
  String get introHoldOll =>
      'Amarelo em cima. No Sune, a única quina com amarelo para cima fica na frente à esquerda.';

  @override
  String get introWhyOll =>
      'Dividir a última camada em orientar e depois permutar mantém poucos algoritmos.';

  @override
  String get introHowPll =>
      'O topo já está todo amarelo.\nA T-perm troca cantos; a U-perm move três arestas.\nLeia as cores laterais para escolher o algoritmo.';

  @override
  String get introHoldPll =>
      'Amarelo em cima. T-perm: faróis à esquerda. U-perm: o lado pronto atrás.';

  @override
  String get introWhyPll =>
      'Com o topo todo amarelo, só os lugares das peças estão errados, e poucas trocas terminam o cubo.';

  @override
  String get introHowTwoFirst =>
      'Escolha uma quina branca como âncora, com o branco para baixo.\nLeve cada quina seguinte para cima do seu lugar, na frente à direita.\nRepita R U R\' U\' até ela entrar com as cores laterais batendo.';

  @override
  String get introHoldTwoFirst =>
      'Branco embaixo. O lugar vazio na frente à direita, com a quina dele bem em cima, na camada de cima.';

  @override
  String get introWhyTwoFirst =>
      'O 2×2 não tem centros: a primeira quina que você coloca define as cores das vizinhas, então as cores laterais contam, não só o branco.';

  @override
  String get introHowTwoOll =>
      'Conte as quinas com o amarelo para cima.\nCom uma, deixe-a na frente à esquerda e faça Sune: R U R\' U R U2 R\'.\nConte de novo e repita; no máximo três Sunes.';

  @override
  String get introHoldTwoOll =>
      'Branco embaixo, amarelo em cima. Antes de cada Sune, a quina com amarelo para cima na frente à esquerda.';

  @override
  String get introWhyTwoOll =>
      'O Sune gira as quinas de cima sem quebrar a camada branca; contar de novo diz como segurar na próxima vez.';

  @override
  String get introHowTwoPbl =>
      'Procure faróis: dois adesivos iguais em cima no mesmo lado.\nFaróis em um lado: deixe-os à esquerda e faça a T-perm.\nSem faróis: faça a Y-perm de qualquer lado e alinhe o topo.';

  @override
  String get introHoldTwoPbl =>
      'Branco embaixo, amarelo em cima. T-perm: faróis à esquerda. Y-perm: qualquer lado virado para você.';

  @override
  String get introWhyTwoPbl =>
      'Com o topo amarelo, só os lugares das quinas estão errados: a T-perm troca duas vizinhas, a Y-perm duas na diagonal.';

  @override
  String get introHowBigIntro =>
      'Nenhum centro é fixo: quatro peças de centro formam a cor de cada face.\nGiros duplos como Rw giram duas camadas de uma vez.\nGiros internos como 2R giram só uma camada interna.';

  @override
  String get introHoldBigIntro =>
      'No começo, como quiser: no 4×4 nenhum centro é fixo, então você escolhe onde fica cada cor.';

  @override
  String get introWhyBigIntro =>
      'A redução agrupa centros e peças de meio para o cubo grande ser resolvido como um 3×3.';

  @override
  String get introHowBigCenters =>
      'Primeiro confira a ordem das cores numa quina.\nMonte dois centros opostos e depois os outros quatro.\nAs camadas internas movem peças de centro; sempre desfaça a camada que abriu.';

  @override
  String get introHoldBigCenters =>
      'A face que você está montando na frente; os centros prontos à esquerda e à direita, fora do caminho.';

  @override
  String get introWhyBigCenters =>
      'Uma camada interna move centros e desfazê-la devolve os prontos, então só muda a peça que você quer.';

  @override
  String get introHowBigEdges =>
      'Procure as duas wings com as mesmas duas cores.\nAlinhe-as na frente e junte-as com Uw\'.\nTroque por um meio não pareado e Uw devolve os centros.';

  @override
  String get introHoldBigEdges =>
      'O meio que você está pareando nas camadas da frente; os prontos guardados em cima e embaixo.';

  @override
  String get introWhyBigEdges =>
      'Uw\' tira os centros do caminho para duas wings se juntarem; Uw devolve tudo e o seu trabalho fica intacto.';

  @override
  String get introHowBigParity =>
      'Resolva o 4×4 como um 3×3 até travar.\nUm meio invertido: o algoritmo longo de paridade de OLL.\nDois meios trocados: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'A última camada em cima. Paridade de OLL: o meio invertido na frente. Paridade de PLL: os meios trocados na frente e atrás.';

  @override
  String get introWhyBigParity =>
      'As wings podem chegar a estados que um 3×3 não alcança; esses algoritmos giram camadas internas para desfazer exatamente isso.';

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
  String get stageCrown1 => 'Primeira camada (branca)';

  @override
  String get stageCrown2 => 'Segunda camada';

  @override
  String get stageCrown3 => 'Terceira camada (amarela)';

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
  String get introHoldFiveIntro =>
      'Como quiser: no 5×5 o meio de cada face nunca se move, então ele mostra a cor da face.';

  @override
  String get introWhyFiveIntro =>
      'Os centros fixos definem o esquema de cores, então os centros não podem ficar na ordem errada.';

  @override
  String get lessonFiveCenters => 'Centros do 5×5';

  @override
  String get lessonFiveCentersDesc => 'Monte cada centro com barras de três.';

  @override
  String get introGoalFiveCenters =>
      'Monte em cada face um bloco de centro 3×3 de uma só cor.';

  @override
  String get introHowFiveCenters =>
      'Comece pela peça central fixa: ela define a cor.\nFaça barras de três e encaixe-as com uma camada interna.\nO movimento que traz a barra também devolve o centro pronto.';

  @override
  String get introHoldFiveCenters =>
      'O centro que você está montando na frente ou em cima; os prontos embaixo, à esquerda ou à direita.';

  @override
  String get introWhyFiveCenters =>
      'Camada para dentro, topo, camada para fora: a camada que traz a barra também devolve os centros prontos.';

  @override
  String get lessonFiveEdges => 'Arestas do 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Junte duas asas à aresta do meio.';

  @override
  String get introGoalFiveEdges =>
      'Junte cada aresta do meio às suas duas asas para as 12 arestas parecerem peças únicas.';

  @override
  String get introHowFiveEdges =>
      'Junte cada wing ao seu meio central na frente.\nGire a camada interna, troque por um meio não resolvido e gire de volta.\nNos últimos meios: camada, virar, camada.';

  @override
  String get introHoldFiveEdges =>
      'O meio que você está montando na frente; os prontos guardados nas camadas de cima e de baixo.';

  @override
  String get introWhyFiveEdges =>
      'Abrir e fechar a camada interna junta wings enquanto centros e meios guardados voltam.';

  @override
  String get lessonFiveSolve => 'Resolva o 5×5 como um 3×3';

  @override
  String get lessonFiveSolveDesc => 'Termine camada por camada, como um 3×3.';

  @override
  String get introGoalFiveSolve =>
      'Resolva o 5×5 reduzido como um 3×3, camada por camada, só com giros externos.';

  @override
  String get introHowFiveSolve =>
      'Daqui em diante só giros externos, senão os meios pareados se separam.\nCruz e quinas brancas, a camada do meio e depois a amarela.\nOs centros fixos mostram a cor de cada face.';

  @override
  String get introHoldFiveSolve =>
      'A cor da primeira camada embaixo, igual no 3×3; a quina a encaixar na frente à direita.';

  @override
  String get introWhyFiveSolve =>
      'Giros internos separariam de novo centros e meios; os externos tratam cada bloco como uma peça de 3×3.';

  @override
  String get lessonFiveParity => 'Paridade de arestas do 5×5';

  @override
  String get lessonFiveParityDesc => 'Corrija a aresta com as asas trocadas.';

  @override
  String get introGoalFiveParity =>
      'Corrija o único meio com as duas wings externas trocadas: a única paridade do 5×5.';

  @override
  String get introHowFiveParity =>
      'Aparece como um último meio que parece invertido.\nFaça uma vez a correção longa com camadas internas.\nNo 5×5 não existe paridade de PLL.';

  @override
  String get introHoldFiveParity =>
      'A última camada em cima e o meio com as wings trocadas na frente da camada de cima.';

  @override
  String get introWhyFiveParity =>
      'No 5×5 só as duas wings externas de um meio podem trocar, então um algoritmo resolve.';

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
  String get introHoldSixIntro =>
      'No começo, como quiser: como o 4×4, o 6×6 não tem centros fixos.';

  @override
  String get introWhySixIntro =>
      'Se você resolve um 4×4 e um 5×5, o 6×6 é a mesma redução com blocos maiores.';

  @override
  String get lessonSixCenters => 'Centros do 6×6';

  @override
  String get lessonSixCentersDesc => 'Monte centros 4×4 com barras de quatro.';

  @override
  String get introGoalSixCenters =>
      'Monte em cada face um bloco de centro 4×4 de uma só cor.';

  @override
  String get introHowSixCenters =>
      'Primeiro confira a ordem das cores numa quina: nenhum centro é fixo.\nFaça barras de quatro e junte-as.\nNos dois últimos centros mova peças soltas: camada, topo, desfazer.';

  @override
  String get introHoldSixCenters =>
      'A face que você está montando na frente; os centros prontos à esquerda, à direita ou embaixo.';

  @override
  String get introWhySixCenters =>
      'As barras se juntam com camadas internas e cada camada é desfeita, então os centros prontos continuam inteiros.';

  @override
  String get lessonSixEdges => 'Arestas do 6×6';

  @override
  String get lessonSixEdgesDesc => 'Junte as quatro peças de cada aresta.';

  @override
  String get introGoalSixEdges =>
      'Junte as quatro peças de cada aresta para o 6×6 ter 12 arestas limpas.';

  @override
  String get introHowSixEdges =>
      'Alinhe na frente as wings externas e internas de um meio.\nA camada larga funda leva um meio para dentro e para fora.\nNunca desmonte um meio pronto para liberar uma peça.';

  @override
  String get introHoldSixEdges =>
      'O meio que você está montando na frente; os prontos guardados em cima e embaixo.';

  @override
  String get introWhySixEdges =>
      'O giro largo fundo tira os centros do caminho para as wings se juntarem e depois devolve.';

  @override
  String get lessonSixSolve => 'Resolva o 6×6 como um 3×3';

  @override
  String get lessonSixSolveDesc => 'Termine camada por camada, como um 3×3.';

  @override
  String get introGoalSixSolve =>
      'Resolva o 6×6 reduzido como um 3×3, camada por camada, só com giros externos.';

  @override
  String get introHowSixSolve =>
      'Daqui em diante só giros externos: uma camada interna quebraria um centro ou um meio.\nOs centros que você montou mostram a cor de cada face.\nCruz e quinas brancas, a camada do meio e depois a amarela.';

  @override
  String get introHoldSixSolve =>
      'A cor da primeira camada embaixo, igual no 3×3; a quina a encaixar na frente à direita.';

  @override
  String get introWhySixSolve =>
      'Giros externos movem cada centro 4×4 e cada meio como uma peça só, igual no 3×3.';

  @override
  String get lessonSixParity => 'Paridade do 6×6';

  @override
  String get lessonSixParityDesc => 'Uma aresta virada ou duas trocadas.';

  @override
  String get introGoalSixParity =>
      'Corrija os dois casos do 6×6 que um 3×3 nunca tem: uma aresta virada ou duas arestas trocadas.';

  @override
  String get introHowSixParity =>
      'Resolva como um 3×3 até travar.\nUm meio invertido: a correção longa com 3Rw.\nDois meios trocados: a correção curta de giros internos duplos.';

  @override
  String get introHoldSixParity =>
      'A última camada em cima. O meio invertido na frente; se forem dois trocados, na frente e atrás.';

  @override
  String get introWhySixParity =>
      'Como no 4×4, o 6×6 pode terminar com um meio invertido ou dois trocados; algoritmos de camadas internas corrigem isso e deixam o resto.';

  @override
  String get stepFivePieces => 'As peças do 5×5';

  @override
  String get stepFivePiecesBody =>
      'A peça do meio de cada face nunca se move, então o esquema de cores não tem como sair errado. Em volta há oito peças de centro: centros de quina e de meio nunca trocam de tipo. Cada meio é uma peça central com duas wings.';

  @override
  String get stepFiveSlices => 'Três tipos de giros';

  @override
  String get stepFiveSlicesBody =>
      'Um giro externo move uma face. Um giro duplo move uma face junto com a camada de trás. Um giro de camada interna move só uma camada de dentro: é assim que as peças trocam de lugar sem mexer no lado de fora.';

  @override
  String get stepFiveCenterBar => 'Barras de centro';

  @override
  String get stepFiveCenterBarBody =>
      'Faça uma fileira de três peças de centro iguais, traga-a com uma camada interna, gire o topo e desfaça a camada: o movimento que traz a barra também devolve o centro pronto. Três barras fazem um centro.';

  @override
  String get stepFiveCenterSwap => 'Trocar sem desfazer';

  @override
  String get stepFiveCenterSwapBody =>
      'Para mover uma só peça de centro: gire uma camada interna, gire o topo, desfaça a camada e volte o topo. Os centros prontos sempre voltam.';

  @override
  String get stepFiveEdgePair => 'Emparelhar asas com a aresta do meio';

  @override
  String get stepFiveEdgePairBody =>
      'Alinhe uma wing ao lado do seu meio central na frente, desça a camada interna, troque por um meio não resolvido com um gatilho curto e suba a camada interna de volta.';

  @override
  String get stepFiveEdgeLast => 'As últimas arestas';

  @override
  String get stepFiveEdgeLastBody =>
      'Sem nenhum meio livre para trocar, use camada, virar, camada: um giro largo, um gatilho curto e o giro largo de volta pareiam os últimos meios sem desmontar os prontos.';

  @override
  String get stepFiveAsThree => 'Agora é um 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Com centros e meios prontos, o 5×5 se comporta como um 3×3 grande. Use só giros externos e vá camada por camada: cruz e quinas brancas, a camada do meio e depois a amarela. O 5×5 não tem paridade de PLL.';

  @override
  String get stepFiveEdgeParity => 'Trocar as asas da última aresta';

  @override
  String get stepFiveEdgeParityBody =>
      'Às vezes o último meio tem as duas wings externas trocadas e parece invertido: é a única paridade do 5×5. Deixe-o na frente da camada de cima e faça uma vez o algoritmo de camadas internas; todo o resto volta para o lugar.';

  @override
  String get stepSixPieces => 'As peças do 6×6';

  @override
  String get stepSixPiecesBody =>
      'Como o 4×4, o 6×6 não tem centros fixos: dezesseis peças de centro formam a cor de cada face, então confira antes a ordem das cores numa quina. Cada meio tem quatro wings: duas externas e duas internas.';

  @override
  String get stepSixSlices => 'Girar camadas mais fundas';

  @override
  String get stepSixSlicesBody =>
      'Os giros duplos podem mover duas ou três camadas a partir de uma face. As camadas internas, segunda e terceira, são as ferramentas para centros e arestas.';

  @override
  String get stepSixCenterBar => 'Barras de quatro';

  @override
  String get stepSixCenterBarBody =>
      'Faça fileiras de quatro peças de centro iguais e junte-as com giros de camadas internas, desfazendo cada camada, até a face virar um bloco 4×4 de uma cor só.';

  @override
  String get stepSixCenterSwap => 'Uma peça de cada vez';

  @override
  String get stepSixCenterSwapBody =>
      'Gire a terceira camada, gire o topo, desfaça e volte: uma peça de centro se move e os centros prontos voltam. Use isso nos dois últimos centros, quando nenhuma barra encaixa.';

  @override
  String get stepSixEdgePair => 'Quatro peças, uma aresta';

  @override
  String get stepSixEdgePairBody =>
      'Junte as quatro wings de um meio na frente com a camada larga funda, troque por um meio não resolvido com um gatilho curto e gire a camada larga de volta.';

  @override
  String get stepSixEdgeLast => 'As últimas arestas';

  @override
  String get stepSixEdgeLastBody =>
      'Pareie os últimos meios com um gatilho curto entre um giro largo fundo e o seu desfazer, assim os prontos continuam juntos. Nunca desmonte um meio pronto para liberar uma peça.';

  @override
  String get stepSixAsThree => 'Agora é um 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Com centros 4×4 e meios pareados, resolva o 6×6 como um 3×3, camada por camada, só com giros externos. Um meio invertido ou dois trocados no final é paridade, não erro.';

  @override
  String get stepSixOllParity => 'Uma aresta virada';

  @override
  String get stepSixOllParityBody =>
      'Um único meio que parece invertido na última camada é paridade. Deixe-o na frente da camada de cima e faça a correção longa: ela vira as quatro wings, troca também os meios da esquerda e da direita em cima e não mexe nas duas primeiras camadas.';

  @override
  String get stepSixPllParity => 'Duas arestas trocadas';

  @override
  String get stepSixPllParityBody =>
      'Se dois meios parecerem trocados bem no final, deixe-os na frente e atrás na camada de cima e faça a correção curta de giros internos duplos: as quatro wings dos dois meios trocam de lugar.';

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
  String get patternsWatchVideo => 'Assistir ao vídeo';

  @override
  String get patternsNotNow => 'Agora não';

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
  String dailyYourTime(String time) {
    return 'Seu tempo: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Você tem $seconds segundos para inspecionar o cubo. Toque para iniciar a contagem regressiva.';
  }

  @override
  String get timerInspectTapReady =>
      'Toque quando estiver pronto para começar a resolver';

  @override
  String timerInspectPlus2(int seconds) {
    return 'A inspeção passou de $seconds s e o cronômetro começou sozinho: penalidade de +2 s';
  }

  @override
  String timerAvgOf(int count) {
    return 'Média de $count';
  }

  @override
  String get timerAvgNote => 'As médias descartam o melhor e o pior tempo';

  @override
  String get timerPbSub => 'Melhor tempo';

  @override
  String get timerPlus2Caption => 'Penalidade de +2 s';

  @override
  String get timerDnfCaption => 'Não terminado (DNF)';

  @override
  String get timerDeleteCaption => 'Apagar esta resolução';

  @override
  String get patternBullsEye => 'Alvo';

  @override
  String get patternFramedCenter => 'Centro emoldurado';

  @override
  String get patternBlockCheckerboard => 'Xadrez em blocos';

  @override
  String get patternCubeInCubeInCube => 'Cubo dentro de cubo dentro de cubo';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Seis T';

  @override
  String get patternTwinPeaks => 'Picos gêmeos';

  @override
  String get patternSpiral => 'Espiral';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Pontos centrais';

  @override
  String get patternStripes => 'Listras';

  @override
  String get patternAnaconda => 'Anaconda';

  @override
  String get patternZigzag => 'Zigue-zague';

  @override
  String get patternFourSpots => 'Quatro pontos';

  @override
  String get patternGreenMamba => 'Mamba verde';

  @override
  String get patternPlusMinus => 'Mais e menos';

  @override
  String guideStepCounter(int current, int total) {
    return 'Passo $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Movimento $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Movimento $current / $total';
  }

  @override
  String get dailyStep1Title => 'Passo 1: Embaralhe seu cubo';

  @override
  String get dailyStep2Title => 'Passo 2: Resolva o cubo';

  @override
  String dailyPersonalBest(String time) {
    return 'Recorde pessoal: $time';
  }

  @override
  String get dailyRecentDays => 'Dias recentes';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sequência de $count dias! Você está pegando fogo!',
      one: 'Sequência de 1 dia! Você está pegando fogo!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Cubo embaralhado! Agora é só resolver';

  @override
  String get dailyCongratsTitle => 'Parabéns!';

  @override
  String dailyCongratsBody(String time) {
    return 'Você resolveu o desafio de hoje em $time.';
  }

  @override
  String get dailyCongratsDone => 'Voltar ao desafio';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count padrões',
      one: '1 padrão',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Faltam $hours horas',
      one: 'Falta 1 hora',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Faltam $minutes minutos',
      one: 'Falta 1 minuto',
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
          'Assista a 1 vídeo curto para desbloquear este padrão e o guia passo a passo por $hours horas.',
      one: 'Assista a 1 vídeo curto para desbloquear este padrão e o guia passo a passo por 1 hora.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Assista a 1 vídeo curto para abrir esta aula quantas vezes quiser nas próximas $hours horas.',
      one: 'Assista a 1 vídeo curto para abrir esta aula quantas vezes quiser na próxima hora.',
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
          'Você já usou sua resolução grátis de 4×4–6×6. Assista a 1 vídeo curto para resolver cubos grandes nas próximas $hours horas.',
      one: 'Você já usou sua resolução grátis de 4×4–6×6. Assista a 1 vídeo curto para resolver cubos grandes na próxima hora.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Giro duplo · 180°';

  @override
  String get homeAcademy => 'Academia';

  @override
  String get homePatterns => 'Padrões incríveis';

  @override
  String get homePractice => 'Cronômetro e desafio diário';

  @override
  String get scanChoiceSubtitle => 'Como você quer começar?';

  @override
  String get scanChoiceCamera => 'Escanear com a câmera';

  @override
  String get scanChoiceCameraDesc =>
      'Mostre cada face para a câmera e receba a solução.';

  @override
  String get scanChoice3d => 'Abrir cubo 3D';

  @override
  String get scanChoice3dDesc =>
      'Gire um cubo virtual, embaralhe e resolva passo a passo.';

  @override
  String get academyAllSizes => 'Todos os tamanhos';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total aulas concluídas';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total concluídas';
  }

  @override
  String get lessonStageConcept => 'Conceito';

  @override
  String get lessonStageExamples => 'Exemplos';

  @override
  String get lessonStagePractice => 'Prática';

  @override
  String get lessonStageNext => 'Seguir / livre';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Etapa $index de $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Exemplo $index de $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Passo a passo $index de $total';
  }

  @override
  String get lessonBonusCase => 'Caso bônus';

  @override
  String get lessonPracticeIntro =>
      'Um embaralhamento de verdade: só as etapas anteriores estão resolvidas. Termine esta etapa inteira, dica por dica.';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Siga direto para $lesson.';
  }

  @override
  String get lessonFreePractice => 'Prática livre';

  @override
  String get lessonFreePracticeDesc =>
      'Resolva sozinho um cubo 3D embaralhado, do começo até esta etapa.';

  @override
  String freePracticeBanner(String topic) {
    return 'Pratique à vontade: resolva o cubo do começo até $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Gire a face do centro $face como a seta mostra. O centro fica parado; só as peças em volta dele se movem.';
  }

  @override
  String cueTrigger(String front) {
    return 'Gatilho da mão direita, com o $front virado para você: face direita para cima, topo para a esquerda, face direita para baixo, topo de volta para a direita.';
  }

  @override
  String get cueTriggerBack =>
      'O sexto gatilho seguido devolve o cubo exatamente como estava. Seis é o número mágico!';

  @override
  String cueSliceInner(String face) {
    return 'Gire só a camada interna ao lado da face $face. A face em si fica parada, então os centros se separam.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Um giro duplo: a face $face e a camada interna ao lado giram juntas, como uma camada grossa só.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Gire o cubo inteiro para o centro $top ficar em cima e o centro $front virado para você.';
  }

  @override
  String get cueTurnTop =>
      'Gire só a camada de cima, como a seta mostra, para preparar o próximo algoritmo.';

  @override
  String get cueAlignTop =>
      'Último movimento: gire a camada de cima para alinhar as cores. Pronto!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'O meio $piece está na camada de cima. Gire o topo até ele ficar bem em cima do centro $center e depois gire essa face duas vezes para descê-lo.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'O meio $piece está preso na camada do meio. Suba-o, alinhe-o em cima do centro $center e desça-o.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'O meio $piece está no lugar, mas invertido: o branco olha para o lado. Tire-o e suba com o branco para cima; depois desça-o junto ao centro $center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'No estilo CFOP, a base também pode girar. Desça o meio $piece e gire a base para alinhá-lo com o centro $center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Gire o topo até a quina $piece ficar bem em cima do lugar dela, entre os lados $a e $b. Repita o gatilho da mão direita até ela entrar na posição certa.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'A quina $piece está no lugar, mas girada. Um gatilho tira ela (uma quina amarela entra no lugar); continue repetindo sobre o mesmo lugar até ela voltar com o branco para baixo. Não gire o cubo para correr atrás dela.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Gire o topo até o meio $piece ficar alinhado com o centro $a e depois mande-o para baixo à direita, no espaço entre $a e $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Gire o topo até o meio $piece ficar alinhado com o centro $a e depois mande-o para baixo à esquerda, no espaço entre $a e $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'O meio $piece está no lugar, mas invertido. Encaixe ali um meio amarelo para empurrá-lo para cima e depois encaixe-o de novo entre $a e $b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Uma linha amarela: gire o topo para ela ir da esquerda para a direita, mantenha o $front virado para você e faça o algoritmo da cruz amarela.';
  }

  @override
  String cueYellowL(String front) {
    return 'Um L amarelo: gire o topo para o L apontar para trás à esquerda, mantenha o $front virado para você e faça o algoritmo. Ele vira uma linha.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Só o centro é amarelo: um ponto. Aplique o algoritmo uma vez com o $front virado para você para obter um L. Um ponto pode levar três rodadas, então continue.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Gire o topo até o meio $piece combinar com o centro $center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Dois meios certos estão atrás e à direita. Com o $front virado para você, faça a troca: os meios da frente e da esquerda trocam de lugar.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Os meios certos estão um de frente para o outro. Faça a troca uma vez com o $front virado para você; depois dois vizinhos combinam.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'A quina $piece já está no lugar dela. Mantenha-a na frente à direita, com o $front virado para você, e faça o ciclo das outras três quinas.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Nenhuma quina amarela está no lugar ainda. Faça um ciclo com o $front virado para você; depois uma quina fica no lugar.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Gire a quina $piece na frente à direita: repita o gatilho de baixo de dois em dois até o amarelo dela ficar para cima. As camadas de baixo parecem bagunçadas; elas voltam com a última quina!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Desta vez a quina $piece precisa de quatro gatilhos. Continue: o amarelo sempre sobe depois de dois ou quatro.';
  }

  @override
  String get cueTwistNext =>
      'Gire só a camada de cima para trazer a próxima quina torcida para a frente à direita. Não gire o cubo inteiro agora!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Junte a quina $piece com o meio $edge em cima e depois insira o par no espaço entre $a e $b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'A quina $piece está presa no lugar dela com o meio errado. Tire-a para cima primeiro, depois forme o par e insira.';
  }

  @override
  String cueOllSune(String front) {
    return 'Com o $front virado para você, faça o Sune para virar as quinas amarelas para cima.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Desta vez um Sune não bastou. Gire o topo e faça o Sune de novo, com o $front virado para você.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Duas quinas precisam trocar. Deixe o par igual (os \"faróis\") à esquerda, com o $front virado para você, e faça a T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'As quinas estão prontas. Deixe o meio $piece atrás e faça o ciclo dos outros três meios com a U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'Nenhum meio de cima combina com o centro ainda. Faça a U-perm uma vez de qualquer lado; depois um combina.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Duas quinas vizinhas de cima precisam trocar. Deixe o par igual à esquerda, com o $front virado para você, e faça a troca.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'As duas quinas a trocar estão na diagonal. Faça a troca diagonal com o $front virado para você.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Leve para casa a peça de centro $color perdida com o 3-ciclo de centros: camada, topo, camada e depois tudo de volta.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Uma barra inteira de peças de centro $color está na face errada. Levante-a com a camada, gire o topo e leve-a de volta para casa.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Junte as duas peças do meio $piece: alinhe-as, gire a camada, troque um meio não pareado com os movimentos da mão direita e volte a camada.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Os últimos meios: pareie o meio $piece com o algoritmo dos dois últimos meios, que mantém todos os meios prontos intactos.';
  }

  @override
  String cueParityOll(String front) {
    return 'Paridade de OLL: um meio de cima está invertido, o que nunca acontece num 3×3. Deixe-o na frente, com o $front virado para você, e aplique a correção de paridade antes de qualquer OLL normal.';
  }

  @override
  String get cueParityPll =>
      'Paridade de PLL: dois meios de cima estão trocados, o que nunca acontece num 3×3. Deixe-os na frente e atrás, aplique a troca de paridade e alinhe o topo.';

  @override
  String cueParityFive(String front) {
    return 'Paridade de meios: as duas wings externas de um meio estão trocadas, a única paridade do 5×5. Deixe esse meio na frente, com o $front virado para você, e aplique a correção uma vez.';
  }

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get onboardingStart => 'Começar';

  @override
  String get onboardingWhatTitle => 'Seu parceiro de cubos';

  @override
  String get onboardingWhatBody =>
      'O CubeMentor ajuda você a resolver, aprender e praticar qualquer cubo de 2×2 a 6×6, totalmente offline.';

  @override
  String get onboardingScanTitle => 'Escaneie e resolva em segundos';

  @override
  String get onboardingScanBody =>
      'Mostre cada face para a câmera (ou insira as cores) e siga a solução em 3D movimento por movimento.';

  @override
  String get onboardingLearnTitle => 'Aprenda e jogue';

  @override
  String get onboardingLearnBody =>
      'Domine o método de camadas na Academia e depois gire, embaralhe e resolva à vontade no Playground 3D.';

  @override
  String get scanChoiceManualDesc =>
      'Insira as cores de cada face, adesivo por adesivo.';

  @override
  String get scanTryAgain => 'Tentar de novo';

  @override
  String get scanEditManually => 'Corrigir cores manualmente';

  @override
  String get scanLightingHint =>
      'Centralize a face na grade. Use luz forte e uniforme e evite reflexos.';

  @override
  String get crownExplain =>
      'Uma camada é uma fatia horizontal do cubo: a primeira camada é a branca embaixo, a segunda é a camada do meio e a terceira é a amarela em cima.';

  @override
  String get lessonObjectiveHeading => 'Objetivo de aprendizagem';

  @override
  String get dirRowTop => 'Fileira de cima da face da frente';

  @override
  String get dirRowBottom => 'Fileira de baixo da face da frente';

  @override
  String get dirColumnRight => 'Coluna direita da face da frente';

  @override
  String get dirColumnLeft => 'Coluna esquerda da face da frente';

  @override
  String get solveChoiceTitle => 'Como você quer resolver?';

  @override
  String get solveChoiceFastDesc =>
      'A solução mais curta, movimento por movimento.';

  @override
  String get solveChoiceGuidedDesc =>
      'Aprenda o método de camadas passo a passo.';

  @override
  String get guidedSolvedTitle => 'Resolvido!';

  @override
  String get guidedSolvedBody =>
      'Você seguiu todos os passos e resolveu o cubo.';

  @override
  String get solveAgain => 'Resolver de novo';

  @override
  String get backToHome => 'Voltar ao início';

  @override
  String get dailyStatTime => 'Tempo de hoje';

  @override
  String get dailyStatBest => 'Recorde pessoal';

  @override
  String get dailyStatStreak => 'Sequência atual';

  @override
  String get dailyStatBestStreak => 'Melhor sequência';

  @override
  String get privacyPolicyTitle => 'Política de privacidade';

  @override
  String get settingsPrivacyPolicyDesc =>
      'O que o CubeMentor guarda e o que os anúncios usam.';

  @override
  String get privacyIntro =>
      'O CubeMentor funciona sem conta e sem servidores próprios. Esta página explica o que fica no seu dispositivo e o que nosso parceiro de anúncios usa.';

  @override
  String get privacyDataTitle => 'Seus dados ficam no seu dispositivo';

  @override
  String get privacyDataBody =>
      'Seu idioma, configurações, progresso nas lições, tempos e sequência diária ficam salvos apenas neste dispositivo. Não temos servidores, então nunca os recebemos. Desinstalar o app apaga tudo.';

  @override
  String get privacyCameraTitle => 'Câmera';

  @override
  String get privacyCameraBody =>
      'A câmera só é usada enquanto você escaneia um cubo. As imagens são analisadas no seu dispositivo para ler as cores dos adesivos; nenhuma foto ou vídeo é salvo ou enviado.';

  @override
  String get privacyAdsTitle => 'Anúncios';

  @override
  String get privacyAdsBody =>
      'O app mostra anúncios do Google AdMob. O Google pode usar identificadores do dispositivo e dados de interação com anúncios para exibi-los e medi-los, conforme descrito na política de privacidade do Google. Onde a lei exige, pedimos seu consentimento antes, e você pode alterá-lo nas Configurações.';

  @override
  String get privacyContactTitle => 'Contato';

  @override
  String privacyContactBody(String email) {
    return 'Dúvidas sobre privacidade? Escreva para $email.';
  }
}
