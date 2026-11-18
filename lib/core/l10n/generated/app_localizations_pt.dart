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
  String get comingSoon => 'Brevemente';

  @override
  String get comingSoonMessage =>
      'Esta funcionalidade chega numa próxima atualização.';

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
  String get nextStep => 'Seguinte';

  @override
  String get previousStep => 'Anterior';

  @override
  String get playbackTitle => 'Reprodução';

  @override
  String get playbackEmpty =>
      'Baralhe o cubo para criar a reprodução da solução.';

  @override
  String playbackProgress(int current, int total) {
    return 'Passo $current de $total';
  }

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
  String get replayStep => 'Repetir passo';

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
  String crownProgress(int current, int total) {
    return 'Coroa $current de $total';
  }

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
  String get lessonDone => 'Concluída';

  @override
  String lessonPartOf(int index, int total) {
    return 'Parte $index de $total';
  }

  @override
  String get lessonBack => 'Voltar';

  @override
  String get lessonNext => 'Seguinte';

  @override
  String get lessonFinish => 'Concluir lição';

  @override
  String get lessonComplete => 'Lição concluída!';

  @override
  String get lessonNextLesson => 'Lição seguinte';

  @override
  String get lessonBackToAcademy => 'Voltar à Academia';

  @override
  String get lessonShowMe => 'Mostrar';

  @override
  String get lessonTryIt =>
      'A sua vez: deslize a camada que a seta indica ou toque em Mostrar.';

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
  String get timerNewScramble => 'Novo baralhamento';

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
  String get comingSoon => 'Em breve';

  @override
  String get comingSoonMessage =>
      'Este recurso chega em uma próxima atualização.';

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
  String get nextStep => 'Próximo';

  @override
  String get previousStep => 'Anterior';

  @override
  String get playbackTitle => 'Reprodução';

  @override
  String get playbackEmpty =>
      'Embaralhe o cubo para montar a reprodução da solução.';

  @override
  String playbackProgress(int current, int total) {
    return 'Passo $current de $total';
  }

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
  String get replayStep => 'Repetir passo';

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
  String crownProgress(int current, int total) {
    return 'Coroa $current de $total';
  }

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
  String get lessonDone => 'Concluída';

  @override
  String lessonPartOf(int index, int total) {
    return 'Parte $index de $total';
  }

  @override
  String get lessonBack => 'Voltar';

  @override
  String get lessonNext => 'Próximo';

  @override
  String get lessonFinish => 'Concluir aula';

  @override
  String get lessonComplete => 'Aula concluída!';

  @override
  String get lessonNextLesson => 'Próxima aula';

  @override
  String get lessonBackToAcademy => 'Voltar à Academia';

  @override
  String get lessonShowMe => 'Mostrar';

  @override
  String get lessonTryIt =>
      'Sua vez: deslize a camada que a seta mostra ou toque em Mostrar.';

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
  String get timerNewScramble => 'Novo embaralhamento';

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
}
