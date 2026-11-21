// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tatar (`tt`).
class AppLocalizationsTt extends AppLocalizations {
  AppLocalizationsTt([String locale = 'tt']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      '2×2 дән 6×6 га кадәр һәр кубны сканерлагыз, җыегыз һәм остасы булыгыз.';

  @override
  String get chooseCubeSize => 'Кубыгызны сайлагыз';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Башлангыч';

  @override
  String get cubeLevel3 => 'Классик';

  @override
  String get cubeLevel4 => 'Алга киткән';

  @override
  String get cubeLevel5 => 'Белгеч';

  @override
  String get cubeLevel6 => 'Оста';

  @override
  String get cubeComingSoon => 'Яңа куб тиздән';

  @override
  String get carouselPrevious => 'Алдагы куб';

  @override
  String get carouselNext => 'Киләсе куб';

  @override
  String get chooseMode => 'Нәрсә эшлисегез килә?';

  @override
  String get modePlayground => '3D мәйданчык';

  @override
  String get modePlaygroundDesc =>
      '3D-та катламнарны борыгыз, бутагыз һәм хәрәкәтләрне кабатлагыз.';

  @override
  String get modeScanSolve => 'Сканерлау һәм җыю';

  @override
  String get modeScanSolveDesc =>
      'Кубны камера белән сканерлагыз һәм чишелешен алыгыз.';

  @override
  String get modeAcademy => 'Академия';

  @override
  String get modeAcademyDesc => 'Интерактив дәресләр белән адымлап өйрәнегез.';

  @override
  String get language => 'Тел';

  @override
  String get languageSearch => 'Тел эзләү';

  @override
  String get languageNoResults => 'Эзләвегезгә туры килгән тел юк.';

  @override
  String playgroundTitle(int size) {
    return '$size×$size мәйданчык';
  }

  @override
  String get scramble => 'Бутау';

  @override
  String get reset => 'Ташлату';

  @override
  String get undo => 'Кире кайтару';

  @override
  String get speed => 'Тизлек';

  @override
  String get xray => 'Рентген';

  @override
  String get prime => 'Прайм';

  @override
  String get wide => 'Киң';

  @override
  String layer(int index) {
    return '$index катлам';
  }

  @override
  String get cubeRotations => 'Әйләндерүләр';

  @override
  String get play => 'Уйнату';

  @override
  String get pause => 'Туктату';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хәрәкәт',
      one: '1 хәрәкәт',
      zero: 'Хәрәкәт юк',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Җыелган';

  @override
  String get scrambled => 'Бутаган';

  @override
  String get orbitHint =>
      'Борыр өчен рәтне тартыгыз · Әйләндерер өчен фонны тартыгыз';

  @override
  String get notationPad => 'Нотация панеле';

  @override
  String get solve => 'Җыю';

  @override
  String get solving => 'Җыела…';

  @override
  String get solveFast => 'Тиз җыю';

  @override
  String get solveLearn => 'Адымлап өйрәнү';

  @override
  String get solveModeGuided => 'Ярдәм белән (3 таҗ)';

  @override
  String get solveModeFast => 'Тиз (оптималь)';

  @override
  String solveUnavailable(int size) {
    return '$size×$size чишүчесе киләсе яңартуда булачак.';
  }

  @override
  String get solveAlreadySolved => 'Куб инде җыелган.';

  @override
  String solveFailed(String reason) {
    return 'Бу кубны җыеп булмый ($reason).';
  }

  @override
  String get solveEngineMissing => 'Бу җайланмада чишү механизмы юк.';

  @override
  String get solveComplete => 'Җыелды! Афәрин.';

  @override
  String solveSummary(int count) {
    return '$count хәрәкәт';
  }

  @override
  String get nextMove => 'Киләсе хәрәкәт';

  @override
  String get previousMove => 'Алдагы хәрәкәт';

  @override
  String get halfTurnHalfway =>
      'Әйбәт, яртысы үтте! Икеле борылыш (180°) өчен тагын бер тапкыр борыгыз.';

  @override
  String get wideTurnInner =>
      'Шәп! Хәзер киң борылышны тәмамлар өчен янәшәдәге эчке катламны сыпырыгыз.';

  @override
  String get wideTurnOuter =>
      'Шәп! Хәзер киң борылышны тәмамлар өчен янәшәдәге тышкы катламны сыпырыгыз.';

  @override
  String get wideTurnMore =>
      'Шәп! Киң борылышны тәмамлар өчен балкыган катламнарны берәм-берәм сыпыруны дәвам итегез.';

  @override
  String get guideSwipeHint =>
      'Балкыган катламны ук күрсәткән якка сыпырыгыз яки «Алга» төймәсенә басыгыз.';

  @override
  String get guideRotateHint =>
      'Бөтен кубны ук күрсәткәнчә борыгыз: «Алга» төймәсенә басыгыз.';

  @override
  String get guideWrongMove => 'Билгеләнгән ук буенча барыгыз';

  @override
  String get guideExit => 'Ярдәмчедән чыгу';

  @override
  String get colorWhite => 'ак';

  @override
  String get colorYellow => 'сары';

  @override
  String get colorGreen => 'яшел';

  @override
  String get colorBlue => 'зәңгәр';

  @override
  String get colorRed => 'кызыл';

  @override
  String get colorOrange => 'кызгылт сары';

  @override
  String get phaseOptimal2x2 => 'Оптималь чишелеш';

  @override
  String get phaseKociemba1 => '1 нче этап · Кисәкләрне юнәлтү';

  @override
  String get phaseKociemba2 => '2 нче этап · Кубны тәмамлау';

  @override
  String get phaseLblCross => 'Ак хач';

  @override
  String get phaseLblCorners => 'Беренче таҗның почмаклары';

  @override
  String get phaseLblMiddle => 'Урта катлам кырлары';

  @override
  String get phaseLblYellowCross => 'Сары хач';

  @override
  String get phaseLblYellowEdges => 'Сары хач кырларын тигезләү';

  @override
  String get phaseLblYellowCorners => 'Сары почмакларны урынына кую';

  @override
  String get phaseLblYellowCornersOrient => 'Сары почмакларны юнәлтү';

  @override
  String get crownFirst => 'Беренче таҗ';

  @override
  String get crownSecond => 'Икенче таҗ';

  @override
  String get crownThird => 'Өченче таҗ';

  @override
  String get crownFirstGoal => 'Ак як һәм беренче катлам';

  @override
  String get crownSecondGoal => 'Урта катлам';

  @override
  String get crownThirdGoal => 'Сары як һәм соңгы катлам';

  @override
  String get subStepGoal11 =>
      'Ак хач ясагыз: һәр ак кыр янәшәдәге үзәк төсенә дә туры килсен.';

  @override
  String get subStepGoal12 =>
      '4 ак почмакны үз урыннарына куеп, ак якны һәм бөтен беренче боҗраны тәмамлагыз.';

  @override
  String get subStepGoal21 =>
      'Беренче таҗны бозмыйча, урта катламның 4 кырын куегыз.';

  @override
  String get subStepGoal31 => 'Соңгы катламда сары хач ясагыз.';

  @override
  String get subStepGoal32 =>
      'Сары хач кырларын һәрберсе үз ягындагы үзәккә туры килгәнчегә кадәр алмаштырыгыз.';

  @override
  String get subStepGoal33 =>
      '4 сары почмакны дөрес урыннарына күчерегез, алар әле борылган булса да.';

  @override
  String get subStepGoal34 =>
      'Һәр сары почмакны урынында борыгыз: барлык стикерлар туры килеп, куб җыелганчы.';

  @override
  String get explainOptimal2x2 =>
      'Мөмкин булган иң кыска чишелеш, 2×2 нең һәр торышын тикшереп табылган.';

  @override
  String get explainKociemba1 =>
      'Һәр кисәкне юнәлтегез һәм урта катлам кырларын урта катламга җыегыз.';

  @override
  String get explainKociemba2 =>
      'Шул юнәлешне саклый торган U, D һәм ярты борылышлар белән генә тәмамлагыз.';

  @override
  String get explainLblOrient => 'Бөтен кубны ак үзәк аска караганчы борыгыз.';

  @override
  String explainLblCrossEdge(String piece) {
    return '$piece кырын ак үзәк янына аска төшерегез, ян төсе туры килсен.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece почмагы дөрес булмаган урында кысылган. Аны R U R\' U\' белән өскә күтәрегез.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return '$piece почмагы үз урыны өстенә килгәнче өске катламны борыгыз.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '$piece почмагы урынына утырганчы R U R\' U\' кабатлагыз.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece кыры урта катламда, ләкин дөрес түгел. Аны өскә чыгарыгыз.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return '$piece кырының ян төсе үз үзәгенә туры килсен өчен өске катламны борыгыз.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '$piece кырын уңга куегыз: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '$piece кырын сулга куегыз: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Киләсе алгоритм өчен сары фигураны урнаштырырга өске катламны борыгыз.';

  @override
  String get explainLblYellowCrossAlg =>
      'F R U R\' U\' F\' белән сары хач ясагыз.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Сары кырларны үз үзәкләре белән тигезләр өчен өске катламны борыгыз.';

  @override
  String get explainLblYellowEdgesAlg =>
      'R U R\' U R U2 R\' U белән сары кырларны алмаштырыгыз.';

  @override
  String get explainLblYellowCornersAlg =>
      'U R U\' L\' U R\' U\' L белән сары почмакларны әйләндереп урыннарына китерегез.';

  @override
  String get explainLblNextCorner =>
      'Киләсе җыелмаган сары почмакны алгы-уң якка китерер өчен өске катламны борыгыз.';

  @override
  String get explainLblCornerTwist =>
      'Сары өскә караганчы R\' D\' R D кабатлагыз. Ахырда аскы өлеш үзе төзәлә.';

  @override
  String get explainLblFinalAlign =>
      'Кубны тәмамлар өчен өске катламны борыгыз.';

  @override
  String scanTitle(int size) {
    return '$size×$size сканерлау';
  }

  @override
  String get scanManualInput => 'Төсләрне кулдан кертү';

  @override
  String get scanUseCamera => 'Камера белән сканерлау';

  @override
  String scanFaceProgress(int current, int total) {
    return '$total яктан $current нчесе';
  }

  @override
  String get faceUp => 'Өске як';

  @override
  String get faceRight => 'Уң як';

  @override
  String get faceFront => 'Алгы як';

  @override
  String get faceDown => 'Аскы як';

  @override
  String get faceLeft => 'Сул як';

  @override
  String get faceBack => 'Арткы як';

  @override
  String get scanHintFront =>
      'Кубны теләсә кайсы ягы белән үзегезгә таба тотыгыз. Бу — алгы ягыгыз: сканерлаганда өске якны үзгәртмәгез.';

  @override
  String get scanHintRight =>
      'Алгы яктан бөтен кубны бер тапкыр сулга борыгыз, уң як сезгә карасын.';

  @override
  String get scanHintBack => 'Алгы яктан бөтен кубны ике тапкыр сулга борыгыз.';

  @override
  String get scanHintLeft => 'Алгы яктан бөтен кубны бер тапкыр уңга борыгыз.';

  @override
  String get scanHintUp =>
      'Алгы яктан өске якны үзегезгә таба авыштырыгыз, ул камерага карасын.';

  @override
  String get scanHintDown =>
      'Алгы яктан аскы якны үзегезгә таба авыштырыгыз, ул камерага карасын.';

  @override
  String get scanAlignHint =>
      'Челтәрне як белән тутырыгыз, аннары затворга басыгыз.';

  @override
  String get scanCapture => 'Якны төшерү';

  @override
  String get scanTurnLeft => 'Бөтен кубны сулга борыгыз';

  @override
  String get scanTurnRight => 'Бөтен кубны уңга борыгыз';

  @override
  String get scanTipTop => 'Өске якны үзегезгә авыштырыгыз';

  @override
  String get scanTipBottom => 'Аскы якны үзегезгә авыштырыгыз';

  @override
  String get scanGlareTip =>
      'Ялтырау бар: кубны бераз авыштырыгыз яки өстәге яктыны каплар өчен телефонны аның өстендә тотыгыз.';

  @override
  String get scanDimTip =>
      'Бик караңгы: яктырак урынга күчегез яки фонарьны кабызыгыз.';

  @override
  String get scanTorch => 'Фонарь';

  @override
  String get scanGuideLabel =>
      'Сканерлау ярдәмчесе: сканерланган яклар төсле. Кабат сканерлар өчен сканерланган якка басыгыз.';

  @override
  String get scanTapToRescan =>
      'Кабат сканерлар өчен сканерланган якка басыгыз.';

  @override
  String get scanCameraMissing => 'Бу җайланмада камера табылмады.';

  @override
  String get scanCameraDenied =>
      'Камерага рөхсәт бирелмәде. Төсләрне барыбер кулдан кертә аласыз.';

  @override
  String get scanCameraFailed => 'Камераны кабызып булмады.';

  @override
  String get scanAllGood => 'Барлык стикерлар дөрес күренә.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count стикер дөрес түгел кебек',
      one: '1 стикер дөрес түгел кебек',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Нәрсәдер туры килми';

  @override
  String scanIssueColors(int count) {
    return 'Һәр төс нәкъ $count тапкыр булырга тиеш.';
  }

  @override
  String get scanIssueCenters => 'Ике үзәкнең төсе бер үк.';

  @override
  String get scanIssuePieces =>
      'Бу стикерлар чын кубта булмаган кисәкләр барлыкка китерә.';

  @override
  String get scanIssueTwist =>
      'Бер почмак борылган. Почмак стикерларын тикшерегез.';

  @override
  String get scanIssueFlip => 'Бер кыр әйләнгән. Кыр стикерларын тикшерегез.';

  @override
  String get scanIssueParity => 'Ике кисәк урыннары белән алышынган кебек.';

  @override
  String get scanIssueUnavailable => 'Бу җайланмада төсләрне тикшереп булмый.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count стикерны уку авыр булды: аларга бер күз салыгыз.',
      one: '1 стикерны уку авыр булды: аңа бер күз салыгыз.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Төсен үзгәртер өчен стикерга басыгыз · Палитра өчен басып торыгыз';

  @override
  String get scanRescanFace => 'Якны кабат сканерлау';

  @override
  String get scanCancelRescan => 'Төсләргә кайту';

  @override
  String get scanPaletteTitle => 'Төс сайлагыз';

  @override
  String get scanOpen3d => '3D-та ачу';

  @override
  String get scanRestart => 'Яңадан башлау';

  @override
  String get modeTimer => 'Тизлек таймеры';

  @override
  String get modeTimerDesc =>
      'Бутаулар, карап чыгу, уртача нәтиҗәләр һәм шәхси рекордлар.';

  @override
  String get modeDaily => 'Көндәлек бурыч';

  @override
  String get modeDailyDesc => 'Көн саен яңа бутау. Сериягезне өзмәгез.';

  @override
  String get modePatterns => 'Үрнәкләр китапханәсе';

  @override
  String get modePatternsDesc =>
      'Шахмат тактасы, суперфлип һәм башкалар, 3D-та.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count көнлек серия',
      one: '1 көнлек серия',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Өйрәнүне дәвам итү';

  @override
  String get startLearning => 'Өйрәнә башлау';

  @override
  String lessonOf(int index, int total) {
    return '$total дәрестән $index нчесе';
  }

  @override
  String get academyAllDone => 'Барлык дәресләр үтелде!';

  @override
  String get academyTitle => 'Академия';

  @override
  String academyProgress(int done, int total) {
    return '$total дәрестән $done үтелде';
  }

  @override
  String get lessonAdvanced => 'Алга киткән';

  @override
  String lessonPartOf(int index, int total) {
    return '$total өлештән $index нчесе';
  }

  @override
  String get lessonNext => 'Алга';

  @override
  String get lessonPrevious => 'Артка';

  @override
  String get lessonFinish => 'Дәресне тәмамлау';

  @override
  String get lessonComplete => 'Дәрес тәмам!';

  @override
  String get lessonNextLesson => 'Киләсе дәрес';

  @override
  String get lessonBackToAcademy => 'Академиягә кайту';

  @override
  String get lessonTryIt =>
      'Сезнең чират: ук күрсәткән катламны сыпырыгыз яки «Алга» төймәсенә басыгыз.';

  @override
  String get lessonLookAround => 'Кубны һәр яктан карар өчен фонны тартыгыз.';

  @override
  String get lessonDemoDone => 'Әйбәт! Дәвам итәр өчен «Алга» басыгыз.';

  @override
  String holdPrompt(String top, String front) {
    return 'Кубны $top үзәк өстә, $front үзәк сезгә караган итеп тотыгыз.';
  }

  @override
  String get trackBeginner => 'Башлангыч 3×3: 3 таҗ';

  @override
  String get trackCfop => 'CFOP белән танышу';

  @override
  String get trackTwoByTwo => '2×2 башлангыч һәм Ortega';

  @override
  String get trackBigCubes => 'Зур кублар: редукция һәм паритет';

  @override
  String moveSentence(String layer, String direction) {
    return '$layer $direction борыгыз';
  }

  @override
  String get moveFaceR => 'уң якны';

  @override
  String get moveFaceL => 'сул якны';

  @override
  String get moveFaceU => 'өске якны';

  @override
  String get moveFaceD => 'аскы якны';

  @override
  String get moveFaceF => 'алгы якны';

  @override
  String get moveFaceB => 'арткы якны';

  @override
  String moveLayerInner(int depth, String face) {
    return '$face санап $depth нче катламны';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth катлам тирәнлегендә)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '$face санап $near–$far катламнарны';
  }

  @override
  String get moveLayerMiddle => 'урта катламны';

  @override
  String get moveDirUp => 'өскә';

  @override
  String get moveDirDown => 'аска';

  @override
  String get moveDirLeft => 'сулга';

  @override
  String get moveDirRight => 'уңга';

  @override
  String get moveDirClockwise => 'сәгать угы уңаена';

  @override
  String get moveDirCounter => 'сәгать угына каршы';

  @override
  String get moveDirBackClockwise => 'арттан караганда сәгать угы уңаена';

  @override
  String get moveDirBackCounter => 'арттан караганда сәгать угына каршы';

  @override
  String get moveDirHalf => 'ярты әйләнешкә (ике тапкыр)';

  @override
  String get moveRotateX => 'Бөтен кубны авыштырыгыз: алгы як өскә күчә';

  @override
  String get moveRotateXPrime => 'Бөтен кубны авыштырыгыз: алгы як аска күчә';

  @override
  String get moveRotateX2 =>
      'Бөтен кубны әйләндереп куегыз: алгы як артка күчә';

  @override
  String get moveRotateY => 'Бөтен кубны борыгыз: алгы як сулга күчә';

  @override
  String get moveRotateYPrime => 'Бөтен кубны борыгыз: алгы як уңга күчә';

  @override
  String get moveRotateY2 =>
      'Бөтен кубны ярты әйләнешкә борыгыз: арткы як алга килә';

  @override
  String get moveRotateZ =>
      'Бөтен кубны сәгать угы уңаена тәгәрәтегез: өске як уңга күчә';

  @override
  String get moveRotateZPrime =>
      'Бөтен кубны сәгать угына каршы тәгәрәтегез: өске як сулга күчә';

  @override
  String get moveRotateZ2 =>
      'Бөтен кубны башы белән аска тәгәрәтегез: өске як аска күчә';

  @override
  String get phaseReductionCenters => 'Үзәкләр';

  @override
  String get phaseReductionEdges => 'Кырларны парлау';

  @override
  String get phaseReductionEdgeParity => 'Кыр паритеты';

  @override
  String get phaseReductionOllParity => 'OLL паритеты';

  @override
  String get phaseReductionPllParity => 'PLL паритеты';

  @override
  String get explainReductionCenterBlock =>
      'Берничә үзәк кисәген берьюлы урынына кайтара торган кисем борылышлары.';

  @override
  String explainReductionCenterCycle(String piece) {
    return '$piece үзәк кисәген әзер үзәкләргә тимәүче 3-цикл белән үз ягына китерегез.';
  }

  @override
  String get explainReductionParityCenters =>
      'Паритет кисеме күчергән үзәкләрне яңадан төзегез.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '$piece кыр кисәкләрен 3-цикл белән кушыгыз; үзәкләр җыелган килеш кала.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Соңгы кырларны 3-цикллар белән генә парлап булмый (кыр паритеты). Бер эчке кисем борылышы моны төзәтә.';

  @override
  String get explainReductionOllParity =>
      'OLL паритеты: бер кыр әйләнгән, 3×3-та мондый хәл булмый. Бу алгоритм аны кире әйләндерә.';

  @override
  String get explainReductionPllParity =>
      'PLL паритеты: ике кыр алышынган, 3×3-та бу мөмкин түгел. Бу алгоритм аларны кире алмаштыра.';

  @override
  String get patternsTitle => 'Үрнәкләр китапханәсе';

  @override
  String get patternsHint =>
      'Карар өчен үрнәккә басыгыз, аннары үз кубыгызда кабатлагыз.';

  @override
  String get patternCheckerboard => 'Шахмат тактасы';

  @override
  String get patternCubeInCube => 'Куб эчендә куб';

  @override
  String get patternSuperflip => 'Суперфлип';

  @override
  String get patternDots => 'Нокталар';

  @override
  String get patternCross => 'Хач';

  @override
  String get patternPython => 'Питон';

  @override
  String get phasePattern => 'Үрнәкне ясау';

  @override
  String get explainPatternStep =>
      'Һәр хәрәкәтне үз кубыгызда кабатлагыз. Гадәти хәлгә кайтару өчен «Җыю» басыгыз.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Тизлек таймеры';

  @override
  String get timerHoldToStart => 'Басып торыгыз, аннары җибәреп башлагыз';

  @override
  String get timerReleaseToStart => 'Башлар өчен җибәрегез';

  @override
  String get timerTapToStop => 'Туктатыр өчен теләсә кайда басыгыз';

  @override
  String get timerInspecting =>
      'Карап чыгу: басып торыгыз, аннары җибәреп башлагыз';

  @override
  String get timerTapToInspect =>
      '15 секундлык карап чыгуны башлар өчен басыгыз';

  @override
  String get timerInspectionToggle => '15 с карап чыгу';

  @override
  String get timerLoadingScramble => 'Бутау ясала…';

  @override
  String get timerPb => 'Рекорд';

  @override
  String get timerSolves => 'Җыюлар';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Бетерү';

  @override
  String get timerHistory => 'Тарих';

  @override
  String get timerNoSolves => 'Әлегә җыюлар юк. Кубны бутагыз да башлагыз!';

  @override
  String get timerNewPb => 'Яңа шәхси рекорд!';

  @override
  String get timerClearHistory => 'Тарихны чистарту';

  @override
  String get timerScrambleHint =>
      'Акны өстә, яшелне алда тотыгыз, аннары бутагыз:';

  @override
  String get dailyTitle => 'Көндәлек бурыч';

  @override
  String dailyFor(String date) {
    return '$date бурычы';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Иң яхшы серия: $count';
  }

  @override
  String get dailyDone => 'Бүгенгә җитте! Иртәгә килегез.';

  @override
  String get dailyNotDone => 'Сериягезне саклар өчен бүгенге бутауны җыегыз.';

  @override
  String get dailySolveVirtual => '3D кубта җыю';

  @override
  String get dailyTimeIt => 'Үз кубыгызда вакытны үлчәү';

  @override
  String get dailyHint => 'Ишарә';

  @override
  String dailyHintText(String moves) {
    return 'Ак хачтан башлагыз: $moves';
  }

  @override
  String get dailyHintFailed => 'Хәзерге вакытта ишарә юк.';

  @override
  String get lessonBasics => 'Куб белән танышу';

  @override
  String get lessonBasicsDesc => 'Кисәкләр, яклар һәм хәрәкәт исемнәре.';

  @override
  String get stepBasicsPieces => 'Кисәкләрнең өч төре';

  @override
  String get stepBasicsPiecesBody =>
      'Үзәкләр беркайчан да күчми һәм һәр якка аның төсен бирә. Кырларда ике төс, почмакларда өч төс. Җыю — һәр кырны һәм почмакны туры килгән үзәкләр янына күчерү.';

  @override
  String get stepBasicsFaces => 'Якларның алты хәрефе';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F һәм B — уң, сул, өске, аскы, алгы һәм арткы яклар. Ялгыз хәреф сәгать угы уңаена чирек борылышны аңлата, әйтерсең сез шул якка туп-туры карыйсыз.';

  @override
  String get stepBasicsPrime => 'Прайм һәм икеле борылышлар';

  @override
  String get stepBasicsPrimeBody =>
      'Апостроф (R\') икенче якка, сәгать угына каршы бора. 2 (U2) — ярты борылыш: ике чирек борылыш.';

  @override
  String get stepCrossGoal => 'Максат';

  @override
  String get stepCrossGoalBody =>
      'Сарыны өстә тотыгыз. Дүрт ак кыр астагы ак үзәк тирәсенә урнаша, һәрберсенең ян төсе янәшәдәге үзәккә туры килә.';

  @override
  String get stepCrossTop => 'Өстәге кыр';

  @override
  String get stepCrossTopBody =>
      'Өстә ак кыр табыгыз. Аның ян төсе туры килгән үзәк өстенә килгәнче өске катламны борыгыз, аннары аны төшерер өчен шул якны ике тапкыр борыгыз.';

  @override
  String get stepCrossMiddle => 'Уртадагы кыр';

  @override
  String get stepCrossMiddleBody =>
      'Урта катламда кысылган кыр башта өскә күтәрелә: аның ягын өскә борыгыз, өске катламны читкә алыгыз һәм якны кире борыгыз, хач бозылмасын. Аннары аны өстән куегыз.';

  @override
  String get stepCornersInsert => 'Урыны өстендә';

  @override
  String get stepCornersInsertBody =>
      'Ак почмак алгы-уң якта төсләре туры килгән урын өстенә килгәнче өске катламны борыгыз. Аннары R U R\' U\' аны төшерә.';

  @override
  String get stepCornersRepeat => 'Триггерны кабатлагыз';

  @override
  String get stepCornersRepeatBody =>
      'Ак төс дөрес якка карамаса, шул ук урын өстендә R U R\' U\' кабатлауны дәвам итегез. Иң күбе биш кабатлаудан һәр почмак җыела.';

  @override
  String get stepMiddleRight => 'Кыр уңга';

  @override
  String get stepMiddleRightBody =>
      'Өске кырны алда үз үзәге белән тигезләгез. Аның өске төсе уң үзәккә туры килсә, U R U\' R\' U\' F\' U F белән куегыз.';

  @override
  String get stepMiddleLeft => 'Кыр сулга';

  @override
  String get stepMiddleLeftBody =>
      'Өске төсе сул үзәккә туры килсә, көзге чагылышын кулланыгыз: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Бер алгоритм';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' сары ноктаны L хәрефенә, L ны сызыкка, сызыкны хачка әйләндерә. L ны арткы-сул якта, сызыкны аркылы тотыгыз.';

  @override
  String get stepYellowEdges => 'Кырларны тигезләү';

  @override
  String get stepYellowEdgesBody =>
      'Ике кыр үз үзәкләренә туры килгәнче өске катламны борыгыз. Берсе артта, берсе уңда булганда, R U R\' U R U2 R\' U калган икесен алмаштыра.';

  @override
  String get stepPlaceCorners => 'Урынга кую';

  @override
  String get stepPlaceCornersBody =>
      'Инде үз урынында булган почмакны алгы-уң якта тотыгыз. U R U\' L\' U R\' U\' L калган өчесен күчерә; дүртесе дә урынына кайтканчы кабатлагыз.';

  @override
  String get stepTwistCorners => 'Почмакларны бору';

  @override
  String get stepTwistCornersBody =>
      'Җыелмаган почмак алгы-уң якта булганда, сары өскә чыкканчы R\' D\' R D кабатлагыз, аннары киләсен китерер өчен өске катламны гына борыгыз. Аскы өлеш ахырга кадәр бозык күренә: дәвам итегез.';

  @override
  String get lessonCfopIntro => 'CFOP нәрсә ул?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Дүрт этап';

  @override
  String get stepCfopOverviewBody =>
      'Спидкуберлар хачны җыя, аннары беренче катламның һәр почмагын үзенең урта кыры белән парлый (F2L), соңгы катламны юнәлтә (OLL) һәм ахырда урыннарына куя (PLL).';

  @override
  String get stepCfopCross => 'Хачны планлаштыру';

  @override
  String get stepCfopCrossBody =>
      'CFOP та хач карап чыгу вакытында ук планлаштырыла һәм якынча сигез хәрәкәттә аста җыела.';

  @override
  String get lessonF2l => 'F2L нигезләре';

  @override
  String get lessonF2lDesc => 'Почмакны үз кыры белән парлагыз.';

  @override
  String get stepF2lRight => 'Парны кую';

  @override
  String get stepF2lRightBody =>
      'Почмак һәм аның кыры өстә янәшә торганда, аларны урыннары өстенә китереп бергә куегыз.';

  @override
  String get stepF2lLeft => 'Сул кул пары';

  @override
  String get stepF2lLeftBody =>
      'Икенче яктагы шундый ук хәл — көзге чагылыш, U\' L\' U L. Кубны борып (y), уңайлырак кулны куллана аласыз.';

  @override
  String get lessonOll => 'Ике карашлы OLL';

  @override
  String get lessonOllDesc => 'Өске якны сары итегез.';

  @override
  String get stepOllCross => 'Башта кырлар';

  @override
  String get stepOllCrossBody =>
      'Ике карашлы OLL сезгә таныш сары хач алгоритмыннан башлана.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Алгы-сул якта бер сары почмак өскә караганда, Sune (R U R\' U R U2 R\') калган өчесен юнәлтә. Башка күпчелек хәлләрдә Sune һәм аның көзге чагылышы кулланыла.';

  @override
  String get lessonPll => 'Ике карашлы PLL';

  @override
  String get lessonPllDesc => 'Кубны тәмамлагыз.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm ике почмакны һәм ике кырны алмаштыра. Почмакларны урнаштыру өчен кулланыгыз: алмашырга тиешле ике почмакны уңда тотыгыз.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Почмаклар әзер булгач, U-perm өч кырны әйләндерә. Әзер якны артта тотыгыз.';

  @override
  String get lessonTwoFirst => '2×2 нең беренче катламы';

  @override
  String get lessonTwoFirstDesc => 'Туры килгән почмаклардан бер як җыегыз.';

  @override
  String get stepTwoIntro => 'Почмаклар гына';

  @override
  String get stepTwoIntroBody =>
      '2×2 — кырларсыз һәм үзәкләрсез 3×3. Бер төс сайлагыз, шул якны аста җыегыз һәм күрше почмакларның ян төсләрен туры китерегез.';

  @override
  String get stepTwoCorner => 'Почмакларны кую';

  @override
  String get stepTwoCornerBody =>
      'Нәкъ 3×3 нең ак почмаклары кебек: почмакны урыны өстенә китерегез һәм утырганчы R U R\' U\' кулланыгыз.';

  @override
  String get lessonTwoOll => 'Өскене юнәлтү';

  @override
  String get lessonTwoOllDesc => 'Sune белән Ortega OLL.';

  @override
  String get stepTwoSune => 'Тагын Sune';

  @override
  String get stepTwoSuneBody =>
      'Sune 2×2 та да өскене сары итә. Ortega белән җыючылар җиде кыска хәлне өйрәнә; аларның күбесен Sune һәм аның көзге чагылышы каплый.';

  @override
  String get lessonTwoPbl => 'Ике катламны да урнаштыру';

  @override
  String get lessonTwoPblDesc => 'Тәмамлау өчен почмакларны алмаштырыгыз.';

  @override
  String get stepTwoAdjacent => 'Янәшә алмашу';

  @override
  String get stepTwoAdjacentBody =>
      'Өстәге ике күрше почмак алмашырга тиеш булса, аларны уңда тотып T-perm кулланыгыз.';

  @override
  String get stepTwoDiagonal => 'Диагональ алмашу';

  @override
  String get stepTwoDiagonalBody =>
      'Каршы урыннардагы ике почмак Y-perm белән алмаша.';

  @override
  String get lessonBigIntro => 'Зур куб кисәкләре';

  @override
  String get lessonBigIntroDesc => 'Үзәкләр, канатлар һәм кисемнәр.';

  @override
  String get stepBigPieces => 'Даими үзәкләр юк';

  @override
  String get stepBigPiecesBody =>
      '4×4 та һәр якта күчеп йөри торган дүрт үзәк кисәге бар, ә һәр кыр ике канаттан тора. Редукция аларны төркемли, һәм куб 3×3 кебек эш итә.';

  @override
  String get stepBigSlices => 'Киң һәм эчке борылышлар';

  @override
  String get stepBigSlicesBody =>
      'Rw ике уң катламны бергә бора. 2R уңнан икенче катламны гына бора. Бу борылышлар үзәкләрне һәм канатларны күчерә.';

  @override
  String get lessonBigCenters => 'Үзәкләр';

  @override
  String get lessonBigCentersDesc => 'Үзәк кисәкләрен төркемләгез.';

  @override
  String get stepBigCenterCycle => 'Үзәк 3-циклы';

  @override
  String get stepBigCenterCycleBody =>
      'Бу коммутатор нәкъ өч үзәк кисәген күчерә һәм калганына тими, шуңа күрә әзер үзәкләр әзер килеш кала.';

  @override
  String get lessonBigEdges => 'Кырларны парлау';

  @override
  String get lessonBigEdgesDesc => 'Канатларны тулы кырларга кушыгыз.';

  @override
  String get stepBigEdgePair => 'Парлау һәм кайтару';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' ике туры килгән канатны тигезли, R U R\' F R\' F\' R парсыз кырны кертә, ә Uw үзәкләрне кире кайтара.';

  @override
  String get lessonBigParity => 'Паритет';

  @override
  String get lessonBigParityDesc => 'Җөп кубларда OLL һәм PLL паритеты.';

  @override
  String get stepBigOllParity => 'OLL паритеты';

  @override
  String get stepBigOllParityBody =>
      '3×3 та бер генә әйләнгән кыр булмый. Җөп кубларда бу алгоритм өске-алгы кырны кире әйләндерә. Ул өске катламның калган өлешен бутарга мөмкин, аны барыбер соңгы 3×3 адымнары төзәтә.';

  @override
  String get stepBigPllParity => 'PLL паритеты';

  @override
  String get stepBigPllParityBody =>
      'Иң ахырда ике кыр алышынганмы? 2R2 U2 2R2 Uw2 2R2 Uw2 алгы һәм арткы өске кырларны алмаштыра.';

  @override
  String get introGoalHeading => 'Максат нинди?';

  @override
  String get introHowHeading => 'Ничек эшлибез?';

  @override
  String get introStart => 'Аңладым, адымлап башлыйк';

  @override
  String get introDontShowAgain => 'Автомат рәвештә башка күрсәтмәскә';

  @override
  String get introShowGoal => 'Максатны күрсәтү';

  @override
  String get introStateStart => 'Башлангыч';

  @override
  String get introStateGoal => 'Максат';

  @override
  String get introPlayMorph => 'Башлангычтан максатка кадәр уйнату';

  @override
  String get introGoalBasics =>
      'Кубны укырга өйрәнегез: аның кисәкләрен, алты ягын һәм хәрәкәт хәрефләре аларны ничек боруын.';

  @override
  String get introGoalCross =>
      'Ак кушу билгесе ясагыз: һәр ак кыр янәшәдәге үзәк төсенә дә туры килсен.';

  @override
  String get introGoalCorners =>
      'Дүрт ак почмакны куеп, беренче таҗны — бөтен ак катламны тәмамлагыз.';

  @override
  String get introGoalMiddle =>
      'Урта катламның дүрт кырын куегыз, беренче ике катлам җыелсын.';

  @override
  String get introGoalYellowCross =>
      'Өстә сары кушу билгесе ясагыз; ян төсләре әлегә туры килмәсә дә ярый.';

  @override
  String get introGoalYellowEdges =>
      'Сары хачның һәр кырын үз ягындагы үзәк төсе белән тигезләгез.';

  @override
  String get introGoalYellowCorners =>
      'Һәр сары почмакны үз урынына күчерегез, әле борылган булса да.';

  @override
  String get introGoalTwistCorners =>
      'Сары почмакларны дөрес якка борыгыз, бөтен куб җыелсын.';

  @override
  String get introGoalCfopIntro =>
      'Спидкубинг планын карагыз: хач, беренче ике катлам, аннары ике карашта соңгы катлам.';

  @override
  String get introGoalF2l =>
      'Һәр ак почмакны үз урта кыры белән бергә куеп, ике катламны берьюлы тәмамлагыз.';

  @override
  String get introGoalOll =>
      'Бер яки ике алгоритм белән бөтен өске якны сары итегез.';

  @override
  String get introGoalPll =>
      'Кубны тәмамлар өчен соңгы катлам кисәкләрен урыннарына күчерегез.';

  @override
  String get introGoalTwoFirst => '2×2 та бер тулы ак катлам җыегыз.';

  @override
  String get introGoalTwoOll => '2×2 нең өске ягын тулысынча сары итегез.';

  @override
  String get introGoalTwoPbl =>
      '2×2 ны җыяр өчен соңгы почмакларны алмаштырып урыннарына куегыз.';

  @override
  String get introGoalBigIntro =>
      '4×4 белән танышыгыз: үзәкләр, кыр парлары һәм почмаклар, шулай ук аларны бора торган хәрәкәтләр.';

  @override
  String get introGoalBigCenters =>
      'Һәр якның үзәк кисәкләрен бер төсле бөтен блокка җыегыз.';

  @override
  String get introGoalBigEdges =>
      'Туры килгән кыр кисәкләрен парлагыз, һәр кыр 3×3 нең бер кыры кебек күренсен.';

  @override
  String get introGoalBigParity =>
      '3×3 та беркайчан да булмый торган ике 4×4 хәлен төзәтегез: бер әйләнгән кыр яки ике алышынган кыр.';

  @override
  String get introHowBasics =>
      'Үзәкләр беркайчан да күчми, шуңа күрә алар һәр якның төсен күрсәтә.\nҺәр хәреф бер якны сәгать угы уңаена чирек борылышка бора.\nАпостроф (\') аны кире бора; 2 ике тапкыр бора.';

  @override
  String get introHowCross =>
      'Сарыны өстә тотыгыз: ак хач аста җыела.\nАк кыр табып, аның ян төсен туры килгән үзәк белән тигезләгез.\nКырны урынына төшерер өчен шул якны ике тапкыр борыгыз.';

  @override
  String get introHowCorners =>
      'Ак почмакны буш урыны өстенә китерегез.\nДөрес утырганчы R U R\' U\' кабатлагыз.\nКалган өч почмак белән дә шулай эшләгез.';

  @override
  String get introHowMiddle =>
      'Сарысыз өске кыр табып, аның алгы төсен үзәк белән тигезләгез.\nАны кыска 8 хәрәкәтле алгоритм белән уңга яки сулга җибәрегез.\nАк катлам һәр тапкыр бөтен килеш кайта.';

  @override
  String get introHowYellowCross =>
      'Өскә карагыз: нокта, L яки сызык.\nКүрсәтелгәнчә тотып, F R U R\' U\' F\' эшләгез.\nСары хач барлыкка килгәнче кабатлагыз.';

  @override
  String get introHowYellowEdges =>
      'Ике кыр үз үзәкләренә туры килгәнче өске катламны борыгыз.\nАларны артта һәм уңда тотып, R U R\' U R U2 R\' U эшләгез.\nДүрт кыр да туры килгәнче кабатлагыз.';

  @override
  String get introHowYellowCorners =>
      'Почмакның төсләре тирәсендәге өч якка туры килсә, ул үз урынында.\nУрнашкан почмакны алгы-уң якта тотыгыз.\nU R U\' L\' U R\' U\' L калган өчесен барысы да урнашканчы әйләндерә.';

  @override
  String get introHowTwistCorners =>
      'Җыелмаган почмакны алгы-уң якта тотыгыз.\nАның сарысы өскә караганчы R\' D\' R D кабатлагыз.\nКиләсе өчен өске катламны гына борыгыз; аскы өлеш ахырда үзе төзәлә.';

  @override
  String get introHowCfopIntro =>
      'Хач: дүрт кыр, карап чыгу вакытында планлаштырыла.\nF2L: һәр почмак үз кыры белән бергә куела.\nOLL өскене сары итә, аннары PLL кисәкләрне урыннарына кайтара.';

  @override
  String get introHowF2l =>
      'Өске катламда почмакны һәм аңа туры килгән кырны табыгыз.\nАларны урыннары өстендә парлагыз.\nПарны өч-дүрт хәрәкәттә төшерегез.';

  @override
  String get introHowOll =>
      'Башта F R U R\' U\' F\' белән сары хач.\nАннары почмакларны юнәлтегез, мәсәлән Sune белән.\nХәлне күргән сары төс буенча танычыгыз.';

  @override
  String get introHowPll =>
      'Өске як инде тулысынча сары.\nT-perm почмакларны алмаштыра; U-perm өч кырны әйләндерә.\nАлгоритмны сайлар өчен ян төсләрне укыгыз.';

  @override
  String get introHowTwoFirst =>
      '2×2 почмаклардан гына тора, кырсыз 3×3 кебек.\nҺәр ак почмакны үз урыны өстенә китерегез.\nУтырганчы R U R\' U\' кабатлагыз.';

  @override
  String get introHowTwoOll =>
      'Ак катламны аста тотыгыз.\nSune (R U R\' U R U2 R\') өске почмакларны бора.\nӨске як тулысынча сары булганчы дөрес яктан кабатлагыз.';

  @override
  String get introHowTwoPbl =>
      'Ике почмагы инде туры килгән якны эзләгез.\nЯнәшә алмашу: T-perm төсле бер алгоритм.\nДиагональ алмашу: бер озынрак алгоритм.';

  @override
  String get introHowBigIntro =>
      'Бер үзәк тә даими түгел: һәр як төсен дүрт үзәк кисәге тәшкил итә.\nRw кебек киң хәрәкәтләр ике катламны берьюлы бора.\n2R кебек эчке хәрәкәтләр бер эчке кисемне генә бора.';

  @override
  String get introHowBigCenters =>
      'Башта ике каршы үзәкне җыегыз.\nЭчке кисемнәр әзер үзәкләрне бозмыйча үзәк кисәкләрен алмаштыра.\nКалган дүрт үзәкне дә шулай тәмамлагыз.';

  @override
  String get introHowBigEdges =>
      'Төсләре бер үк булган ике кыр кисәген табыгыз.\nАларны эчке кисем белән янәшә тигезләгез.\nПарны читкә алып, үзәкләрне кире кайтарыгыз.';

  @override
  String get introHowBigParity =>
      '4×4 ны тукталып калганчы 3×3 кебек җыегыз.\nБер әйләнгән кыр: озын OLL паритеты алгоритмы.\nИке алышынган кыр: 2R2 U2 2R2 Uw2 2R2 Uw2.';

  @override
  String get dirFaceR => 'Уң як';

  @override
  String get dirFaceL => 'Сул як';

  @override
  String get dirFaceU => 'Өске рәт';

  @override
  String get dirFaceD => 'Аскы рәт';

  @override
  String get dirFaceF => 'Алгы як';

  @override
  String get dirFaceB => 'Арткы як';

  @override
  String get dirMiddle => 'Урта кисем';

  @override
  String get dirWholeCube => 'Бөтен куб';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, $depth катлам';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth катлам тирәнлегендә';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, $near–$far катламнар';
  }

  @override
  String get dirUp => 'Өскә';

  @override
  String get dirDown => 'Аска';

  @override
  String get dirLeft => 'Сулга';

  @override
  String get dirRight => 'Уңга';

  @override
  String get dirClockwise => 'Сәгать угы уңаена';

  @override
  String get dirCounter => 'Сәгать угына каршы';

  @override
  String get dirBackClockwise => 'Арттан караганда сәгать угы уңаена';

  @override
  String get dirBackCounter => 'Арттан караганда сәгать угына каршы';

  @override
  String get dirHalf => 'Икеле борылыш (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Җентекләрне яшерү';

  @override
  String get solveExpand => 'Җентекләрне күрсәтү';

  @override
  String get dailyScrambleSteps => 'Адымлап бутау';

  @override
  String get dailyScrambleGuide => '3D бутау ярдәмчесе';

  @override
  String get dailyShowMoves => 'Хәрәкәтләрне текст белән күрсәтү';

  @override
  String get dailyHideMoves => 'Текст хәрәкәтләрне яшерү';

  @override
  String get dailyScrambleGuideTitle => 'Бутау ярдәмчесе';

  @override
  String get phaseDailyScramble => 'Бүгенге кубны бутагыз';

  @override
  String get explainDailyScramble =>
      'Җыелган кубтан башлагыз, ак өстә һәм яшел алда, һәм һәр борылышны үз чын кубыгызда кабатлагыз.';

  @override
  String get stageCenters => 'Үзәк блокларын җыю';

  @override
  String get stageEdges => 'Тышкы һәм эчке кырларны парлау';

  @override
  String get stageParity => 'Паритетны чишү';

  @override
  String get stageCrown1 => 'Беренче таҗ (ак)';

  @override
  String get stageCrown2 => 'Икенче таҗ';

  @override
  String get stageCrown3 => 'Өченче таҗ (сары)';

  @override
  String get stageOrient => 'Кисәкләрне юнәлтү';

  @override
  String get stageFinish => 'Кубны тәмамлау';

  @override
  String get stageAsThree => '3×3 кебек җыю';

  @override
  String get stageTwoByTwo => '2×2 ны җыю';

  @override
  String stageHeader(int number, int total, String title) {
    return '$total этаптан $number нчесе: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return '$crown нче таҗ • $total этаптан $number нчесе: $title';
  }

  @override
  String get solveAllStagesDone => 'Барлык этаплар тәмам. Булдырдыгыз!';

  @override
  String get trackFiveByFive => '5×5 Professor\'s Cube';

  @override
  String get trackSixBySix => '6×6 куб';

  @override
  String get lessonFiveIntro => '5×5 белән танышу';

  @override
  String get lessonFiveIntroDesc =>
      'Даими урталар, үзәк баганалары, урта кырлар һәм канатлар.';

  @override
  String get introGoalFiveIntro =>
      '5×5 белән танышыгыз: даими урталар, үзәк баганалары, урта кырлар һәм канатлар.';

  @override
  String get introHowFiveIntro =>
      'Һәр якның нәкъ уртасы беркайчан да күчми.\nҺәр кыр — бер урта кисәк һәм ике канат.\nЭчке кисемнәр тышкы өлешкә тимичә кисәкләрне күчерә.';

  @override
  String get lessonFiveCenters => '5×5 үзәкләре';

  @override
  String get lessonFiveCentersDesc => 'Һәр үзәкне өчәрле баганалардан җыегыз.';

  @override
  String get introGoalFiveCenters =>
      'Һәр якның 3×3 үзәк кисәкләре блогын бер төстә җыегыз.';

  @override
  String get introHowFiveCenters =>
      'Урта кисәктән башлагыз: ул төсне күрсәтә.\nӨчәрле баганалар ясап, аларны эчке кисем белән кертегез.\nСоңгы ике үзәкне бергә тәмамлагыз.';

  @override
  String get lessonFiveEdges => '5×5 кырлары';

  @override
  String get lessonFiveEdgesDesc => 'Ике канатны үз урта кырына кушыгыз.';

  @override
  String get introGoalFiveEdges =>
      'Һәр урта кырны ике канаты белән кушыгыз, 12 кыр да бер кисәк кебек күренсен.';

  @override
  String get introHowFiveEdges =>
      'Алда ике канатны үз урта кырына туры китерегез.\nЭчке катламны борып, җыелмаган кырны кертегез, кире борыгыз.\nСоңгы кырларны әзерләрен бозмыйча парлагыз.';

  @override
  String get lessonFiveSolve => '5×5 ны 3×3 кебек җыю';

  @override
  String get lessonFiveSolveDesc => 'Өч таҗ белән тәмамлагыз.';

  @override
  String get introGoalFiveSolve =>
      'Редукцияләнгән 5×5 ны 3×3 кебек, таҗ артыннан таҗ җыегыз.';

  @override
  String get introHowFiveSolve =>
      'Моннан соң тышкы борылышлар гына.\nБеренче таҗ, икенче таҗ, аннары сары таҗ.\nДаими урталар һәр якның төсен күрсәтә.';

  @override
  String get lessonFiveParity => '5×5 кыр паритеты';

  @override
  String get lessonFiveParityDesc => 'Канатлары алышынган кырны төзәтегез.';

  @override
  String get introGoalFiveParity =>
      'Ике канаты алышынган бер кырны төзәтегез, аннары тәмамлагыз.';

  @override
  String get introHowFiveParity =>
      'Ул парланмый торган кыр булып күренә.\nОзын эчке кисем төзәтмәсен бер тапкыр уйнатыгыз.\nКалган барысы да үз урынына кайта.';

  @override
  String get lessonSixIntro => '6×6 белән танышу';

  @override
  String get lessonSixIntroDesc => 'Даими үзәкләр юк, һәр кырда дүрт кисәк.';

  @override
  String get introGoalSixIntro =>
      '6×6 белән танышыгыз: һәр якта уналты үзәк кисәге һәм һәр кырда дүрт кисәк.';

  @override
  String get introHowSixIntro =>
      'Бер үзәк тә даими түгел: төсләрне җыйганда үзегез сайлыйсыз.\nҺәр кырның тышкы һәм эчке канатлары бар.\nКиң борылышлар өч катламга кадәр күчерә ала.';

  @override
  String get lessonSixCenters => '6×6 үзәкләре';

  @override
  String get lessonSixCentersDesc =>
      '4×4 үзәкләрне дүртәрле баганалардан җыегыз.';

  @override
  String get introGoalSixCenters =>
      'Һәр якның 4×4 үзәк блогын бер бөтен төстә җыегыз.';

  @override
  String get introHowSixCenters =>
      'Башта ике каршы үзәкне җыегыз.\nДүртәрле баганалар ясап, аларны бергә тоташтырыгыз.\nАерым кисәкләрне «кисем, өске, кире» алымы белән күчерегез.';

  @override
  String get lessonSixEdges => '6×6 кырлары';

  @override
  String get lessonSixEdgesDesc => 'Һәр кырның дүрт кисәген җыегыз.';

  @override
  String get introGoalSixEdges =>
      'Һәр кырның дүрт кисәген җыегыз, 6×6 та 12 чиста кыр булсын.';

  @override
  String get introHowSixEdges =>
      'Алда тышкы һәм эчке канатларны тигезләгез.\nТирән киң катлам кырны кертә һәм чыгара.\nӘзер кырлар беркайчан да бозылмый.';

  @override
  String get lessonSixSolve => '6×6 ны 3×3 кебек җыю';

  @override
  String get lessonSixSolveDesc => 'Өч таҗ белән тәмамлагыз.';

  @override
  String get introGoalSixSolve =>
      'Редукцияләнгән 6×6 ны 3×3 кебек, таҗ артыннан таҗ җыегыз.';

  @override
  String get introHowSixSolve =>
      'Моннан соң тышкы борылышлар гына.\nСез җыйган үзәкләр һәр якның төсен күрсәтә.\nБеренче таҗ, икенче таҗ, аннары сары таҗ.';

  @override
  String get lessonSixParity => '6×6 паритеты';

  @override
  String get lessonSixParityDesc => 'Бер әйләнгән кыр яки ике алышынган кыр.';

  @override
  String get introGoalSixParity =>
      '3×3 та беркайчан да булмый торган ике 6×6 хәлен төзәтегез: бер әйләнгән кыр яки ике алышынган кыр.';

  @override
  String get introHowSixParity =>
      'Тукталып калганчы 3×3 кебек җыегыз.\nБер әйләнгән кыр: озын паритет төзәтмәсе.\nИке алышынган кыр: кыска икеле борылыш төзәтмәсе.';

  @override
  String get stepFivePieces => '5×5 кисәкләре';

  @override
  String get stepFivePiecesBody =>
      'Һәр якның нәкъ уртадагы кисәге беркайчан да күчми, шуңа күрә ул, 3×3 тагы кебек, якның төсен күрсәтә. Аның тирәсендә тагын сигез үзәк кисәге; һәр кырда бер урта кисәк һәм ике канат, ә почмаклар 3×3 тагы кебек эшли.';

  @override
  String get stepFiveSlices => 'Борылышларның өч төре';

  @override
  String get stepFiveSlicesBody =>
      'Тышкы борылышлар бер якны күчерә. Киң борылышлар якны артындагы катлам белән бергә күчерә. Эчке кисем борылышлары эчтәге бер катламны гына күчерә: кисәкләр тышкы өлешкә тимичә шулай урын алмаштыра.';

  @override
  String get stepFiveCenterBar => 'Үзәк баганалары';

  @override
  String get stepFiveCenterBarBody =>
      'Туры килгән өч үзәк кисәгеннән рәт ясагыз, аннары аны эчке кисем борылышы белән туры килгән урта янына кертегез. Өч багана — әзер үзәк.';

  @override
  String get stepFiveCenterSwap => 'Бозмыйча алмаштыру';

  @override
  String get stepFiveCenterSwapBody =>
      'Бер үзәк кисәген күчерер өчен: эчке кисемне борыгыз, өске катламны борыгыз, кисемне кире кайтарыгыз, өске катламны кире борыгыз. Әзер үзәкләр һәр тапкыр кире кайта.';

  @override
  String get stepFiveEdgePair => 'Канатларны урта кыр белән парлау';

  @override
  String get stepFiveEdgePairBody =>
      'Алда ике канатны туры килгән урта кыр янында тигезләгез, эчке катламны аска борыгыз, өстән җыелмаган кырны китерегез, аннары эчке катламны кире борыгыз.';

  @override
  String get stepFiveEdgeLast => 'Соңгы кырлар';

  @override
  String get stepFiveEdgeLastBody =>
      'Берничә кыр гына калганда, киң борылыш, кыска триггер һәм кире киң борылыш аларны әзер кырларны бозмыйча парлый.';

  @override
  String get stepFiveAsThree => 'Хәзер бу — 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Үзәкләр һәм кырлар әзер булгач, 5×5 зур 3×3 кебек эш итә. Тышкы борылышларны гына кулланып, өч таҗ буенча барыгыз: ак хач һәм почмаклар, урта катлам, аннары сары катлам.';

  @override
  String get stepFiveEdgeParity => 'Соңгы кырның канатларын алмаштыру';

  @override
  String get stepFiveEdgeParityBody =>
      'Кайвакыт соңгы кырның ике канаты алышынган була. Озынрак эчке кисем алгоритмы аларны кире алмаштыра, ә калган барысы да үз урынына кайта. Аннары 3×3 кебек тәмамлагыз.';

  @override
  String get stepSixPieces => '6×6 кисәкләре';

  @override
  String get stepSixPiecesBody =>
      '4×4 кебек, 6×6 та да даими үзәк юк: һәр як төсен уналты үзәк кисәге тәшкил итә. Һәр кырда дүрт кисәк: ике тышкы канат һәм ике эчке канат.';

  @override
  String get stepSixSlices => 'Тирәнрәк катламнарны бору';

  @override
  String get stepSixSlicesBody =>
      'Киң борылышлар яктан ике яки өч катламны күчерә ала. Икенче яки өченче катламдагы эчке кисемнәр — үзәкләр һәм кырлар өчен кораллар.';

  @override
  String get stepSixCenterBar => 'Дүртәрле баганалар';

  @override
  String get stepSixCenterBarBody =>
      'Туры килгән дүрт үзәк кисәгеннән рәтләр ясагыз һәм як бөтенләй бер төсле булганчы аларны эчке кисем борылышлары белән янәшә кертегез.';

  @override
  String get stepSixCenterSwap => 'Бер мәлгә бер кисәк';

  @override
  String get stepSixCenterSwapBody =>
      'Өченче катламны борыгыз, өске катламны борыгыз, кире кайтарыгыз, кире борыгыз: бер үзәк кисәге күчә, ә әзер үзәкләр кире кайта.';

  @override
  String get stepSixEdgePair => 'Дүрт кисәк, бер кыр';

  @override
  String get stepSixEdgePairBody =>
      'Тирән киң катлам белән кырның дүрт кисәген алда җыегыз, аннары җыелмаган кырны китереп, киң катламны кире борыгыз.';

  @override
  String get stepSixEdgeLast => 'Соңгы кырлар';

  @override
  String get stepSixEdgeLastBody =>
      'Соңгы кырларны тирән киң борылыш белән аның кире кайтуы арасындагы кыска триггер ярдәмендә парлагыз, әзер кырлар парлы килеш калсын.';

  @override
  String get stepSixAsThree => 'Хәзер бу — 3×3';

  @override
  String get stepSixAsThreeBody =>
      '4×4 үзәкләр һәм парланган кырлар белән 6×6 ны тышкы борылышлар һәм өч таҗ ярдәмендә 3×3 кебек җыегыз.';

  @override
  String get stepSixOllParity => 'Бер әйләнгән кыр';

  @override
  String get stepSixOllParityBody =>
      'Соңгы катламны җыйганда бер генә кыр әйләнгән кебек күренсә, бу — паритет. Аны өске катламның алгы ягында тотып, озын төзәтмәне уйнатыгыз: беренче ике таҗ кагылмыйча кайта.';

  @override
  String get stepSixPllParity => 'Ике алышынган кыр';

  @override
  String get stepSixPllParityBody =>
      'Иң ахырда ике кыр алышынган кебек күренсә, аларны өске катламның алгы һәм арткы ягында тотып, эчке икеле борылышларның кыска төзәтмәсен уйнатыгыз.';

  @override
  String get stageTwoFirstLayer => 'Аскы катламны җыю';

  @override
  String get stageTwoTopColor => 'Өскене бер төсле итү';

  @override
  String get stageTwoFinish => 'Почмакларны тәмамлау';

  @override
  String get explainTwoFirstLayer =>
      'Аскы катламны тәмамлагыз: аның дүрт почмагы бер-берсенә һәм ян төсләргә туры килә.';

  @override
  String get explainTwoTopColor =>
      'Аскы катламны саклап, өстәге дүрт стикер бер төсне күрсәткәнче өске катламны борыгыз.';

  @override
  String get explainTwoFinish =>
      'Кубны тәмамлар өчен соңгы почмакларны урыннарына күчерегез.';

  @override
  String get tabSolve => 'Җыю';

  @override
  String get tabScan => 'Сканер';

  @override
  String get tabAcademy => 'Академия';

  @override
  String get tabTrain => 'Күнегү';

  @override
  String get openCubeSolver => '3D куб һәм чишүчене ачу';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Күнегүләр';

  @override
  String get trainSubtitle => 'Осталыгыгызны көн саен үстерегез.';

  @override
  String get settings => 'Көйләүләр';

  @override
  String get settingsSoundHaptics => 'Тавыш һәм тибрәнү';

  @override
  String get settingsSoundHapticsDesc => 'Кубны борганда чыкылдау һәм тибрәнү.';

  @override
  String get settingsAnimationSpeed => 'Анимациянең баштагы тизлеге';

  @override
  String get settingsAnimationSpeedDesc =>
      'Хәрәкәтләр уйнаганда куб никадәр тиз борыла.';

  @override
  String get settingsResetProgress => 'Алгарышны ташлату';

  @override
  String get settingsResetProgressDesc =>
      'Үтелгән Академия дәресләрен һәм көндәлек сериягезне бетерү.';

  @override
  String get resetProgressTitle => 'Бөтен алгарышны ташлатырга?';

  @override
  String get resetProgressBody =>
      'Үтелгән дәресләрегез һәм көндәлек сериягез бетереләчәк. Моны кире кайтарып булмый.';

  @override
  String get resetProgressDone => 'Алгарыш ташлатылды.';

  @override
  String get cancel => 'Баш тарту';

  @override
  String get settingsPrivacyAds => 'Хосусыйлык һәм реклама';

  @override
  String get settingsPrivacyAdsDesc =>
      'Реклама ризалыгы көйләүләрен карагыз яки үзгәртегез.';

  @override
  String get playbackPrevious => 'Артка';

  @override
  String get playbackNext => 'Алга';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хәрәкәттә җыелды!',
      one: '1 хәрәкәттә җыелды!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Киләсе версияне бергә төзик';

  @override
  String get feedbackBody =>
      'Яңа мөмкинлек тәкъдим итәсегез яки CubeMentorның киләсе версиясенә йогынты ясыйсыгыз киләме? Безгә языгыз:';

  @override
  String get feedbackEmailCopied =>
      'Почта кушымтасы табылмады, шуңа күрә адрес алмашу буферына күчерелде.';

  @override
  String get adWatchToUnlock => 'Реклама карау';

  @override
  String get adLoading => 'Кыска видео йөкләнә…';

  @override
  String get adRewardNotEarned => 'Ачу өчен видеоны ахырына кадәр карагыз.';

  @override
  String get adUnavailableFreePass => 'Хәзер видео юк — бу юлы бушлай ачылды.';

  @override
  String get settingsPrivacyAdsError =>
      'Хосусыйлык көйләүләрен ачып булмады. Соңрак тагын карагыз.';

  @override
  String get nicknamePromptTitle => 'Сезгә ничек эндәшик?';

  @override
  String get nicknamePromptBody =>
      'Һәр җыйганда без сезне исемегез белән котлыйбыз.';

  @override
  String get nicknameHint => 'Исемегез яки кушаматыгыз';

  @override
  String get nicknameGo => 'Киттек';

  @override
  String get nicknameSkip => 'Калдыру';

  @override
  String get nicknameSave => 'Саклау';

  @override
  String get settingsNickname => 'Исемегез';

  @override
  String get settingsNicknameNotSet => 'Билгеләнмәгән — өстәү өчен басыгыз';

  @override
  String celebrateNamed(String name) {
    return 'Афәрин, $name!';
  }

  @override
  String get celebrateAnon => 'Афәрин!';

  @override
  String get celebrateCubeSolved => 'Куб җыелды!';

  @override
  String get celebrateDailyDone => 'Көнлек бирем үтәлде!';

  @override
  String fastSolveRatio(int count, int limit) {
    return '$count / $limit хәрәкәт';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    return 'Теләсә нинди буталышны $limit яки азрак хәрәкәттә җыеп була';
  }

  @override
  String get patternsUnlockTitle => 'Бөтен үрнәкләрне ачу';

  @override
  String patternsUnlockPrompt(int minutes) {
    return 'Бөтен үрнәкләрне $minutes минутка ачу өчен 1 кыска видео карагыз';
  }

  @override
  String get patternsWatchVideo => 'Видео карау';

  @override
  String get patternsNotNow => 'Хәзер түгел';

  @override
  String patternsUnlockedLeft(String time) {
    return 'Ачык • $time калды';
  }

  @override
  String get patternsExpiredTitle => 'Сынау вакыты тәмам';

  @override
  String patternsExpiredBody(int minutes) {
    return 'Бөтен үрнәкләр тагын $minutes минут ачык калсын өчен 1 видео карагыз!';
  }

  @override
  String get patternsFreeSample => 'Бушлай';
}
