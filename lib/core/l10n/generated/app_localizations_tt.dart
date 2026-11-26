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
  String get solveModeGuided => 'Ярдәм белән (3 катлам)';

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
  String get phaseLblCorners => 'Беренче катлам почмаклары';

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
  String get crownFirst => 'Беренче катлам';

  @override
  String get crownSecond => 'Икенче катлам';

  @override
  String get crownThird => 'Өченче катлам';

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
      '4 ак почмакны үз урыннарына куеп, ак якны һәм бөтен беренче катламны тәмамлагыз.';

  @override
  String get subStepGoal21 =>
      'Беренче катламны бозмыйча, урта катламның 4 кырын куегыз.';

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
  String get trackBeginner => 'Башлап җыючы 3×3: катлам-катлам';

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
      'Сарыны өстә, яшелне үзегезгә таба тотыгыз. Башта дүрт ак кырны агы өскә карап, сары үзәк тирәсенә чәчәк яфраклары кебек җыегыз: бу — ромашка. Аннары һәр яфракны ак үзәккә төшерегез, ян төсе янәшә үзәккә туры килсен.';

  @override
  String get stepCrossTop => 'Өстәге кыр';

  @override
  String get stepCrossTopBody =>
      'Өстә агы өскә караган ак кыр — ромашканың чәчәк яфрагы. Аның ян төсе бертөсле үзәк өстенә туры килгәнче өске катламны борыгыз, аннары шул якны ике тапкыр (180°) борып, аны ак үзәккә төшерегез.';

  @override
  String get stepCrossMiddle => 'Уртадагы кыр';

  @override
  String get stepCrossMiddleBody =>
      'Урта катламда кысылган кыр башта өскә чыга: аның ягын өскә, өсне читкә, якны кире борыгыз, куелган кисәкләр урыныннан күчмәсен. Хәзер ул өстәге яфрак: тигезләп, якны ике тапкыр борыгыз.';

  @override
  String get stepCornersInsert => 'Урыны өстендә';

  @override
  String get stepCornersInsertBody =>
      'Ак почмак ян төсләренә туры килгән ике үзәк арасындагы урыны өстенә килгәнче өске катламны борыгыз. Монда бер өске борылыш һәм R U\' R\' җитә: U почмакны урын өстенә китерә, R U\' R\' аны агы аска карап кертә.';

  @override
  String get stepCornersRepeat => 'Триггерны кабатлагыз';

  @override
  String get stepCornersRepeatBody =>
      'Урынны алгы-уңда тотып, ак аска караганчы R U R\' U\' кабатлагыз: ак уңга караса 1 тапкыр, өскә — 3, сезгә — 5 тапкыр. Бу арада өс буталган кебек күренә; ул үзе җайга килә.';

  @override
  String get stepMiddleRight => 'Кыр уңга';

  @override
  String get stepMiddleRightBody =>
      'Сарысы булмаган өске кырны табыгыз. Аның алгы төсе каршыдагы үзәккә туры килгәнче өсне борыгыз. Өске төсе уң үзәк белән бер булса, уңга җибәрегез: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Кыр сулга';

  @override
  String get stepMiddleLeftBody =>
      'Өске төсе сул үзәк белән бер булса, көзгедәгесен кулланыгыз: U\' L\' U L U F U\' F\'. Ак катлам һәр тапкыр бөтенләй кайта.';

  @override
  String get stepYellowCross => 'Бер алгоритм';

  @override
  String get stepYellowCrossBody =>
      'Өстәге сары кырларга гына карагыз. L ны арткы-сулда, сызыкны сулдан уңга тотып, F R U R\' U\' F\' эшләгез. Сызыкка 1 тапкыр, L га 2, ноктага 3 тапкырга кадәр кирәк.';

  @override
  String get stepYellowEdges => 'Кырларны тигезләү';

  @override
  String get stepYellowEdgesBody =>
      'Ике кыр үз үзәкләренә туры килгәнче өсне борыгыз. Берсе артта, берсе уңда булганда, R U R\' U R U2 R\' U алгы һәм сул кырларны алыштыра.';

  @override
  String get stepPlaceCorners => 'Урынга кую';

  @override
  String get stepPlaceCornersBody =>
      'Почмакның төсләре тирәдәге өч үзәккә туры килсә, ул борылган булса да урынында. Андый почмакны алгы-уңда тотыгыз: U R U\' L\' U R\' U\' L калган өчесен әйләндерә. Дүртесе дә урынга килгәнче кабатлагыз.';

  @override
  String get stepTwistCorners => 'Почмакларны бору';

  @override
  String get stepTwistCornersBody =>
      'Җыелмаган почмак алгы-уңда булганда, сары өскә килгәнче R\' D\' R D ны парлап кабатлагыз, аннары киләсен китерү өчен өсне генә борыгыз. Соңгы почмакка кадәр ас бозык күренә: дәвам итегез.';

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
      '2×2 — сигез почмак кына: кырлар да, үзәкләр дә юк. Күрше ян төсләр туры килерлек итеп ак катламны аста җыегыз, аннары бер юл белән тәмамлагыз: сары өс өчен Sune, аннары T-perm яки Y-perm.';

  @override
  String get stepTwoCorner => 'Почмакларны кую';

  @override
  String get stepTwoCornerBody =>
      '3×3 тагы ак почмаклар кебек: почмакны алгы-уңдагы буш урын өстенә китереп кертегез, монда U R U\' R\' белән яки ак аска караганчы R U R\' U\' кабатлап. Ян төсләрен күршесе белән чагыштырыгыз.';

  @override
  String get lessonTwoOll => 'Өскене юнәлтү';

  @override
  String get lessonTwoOllDesc => 'Sune белән Ortega OLL.';

  @override
  String get stepTwoSune => 'Тагын Sune';

  @override
  String get stepTwoSuneBody =>
      'Өскә караган сары стикерларны санагыз. Сарысы өскә караган бердәнбер почмакны алгы-сулга куеп, Sune (R U R\' U R U2 R\') эшләгез. Яңадан санап, яңадан тотыгыз; Sune иң күбе өч тапкыр. Арада өсне генә борыгыз.';

  @override
  String get lessonTwoPbl => 'Ике катламны да урнаштыру';

  @override
  String get lessonTwoPblDesc => 'Тәмамлау өчен почмакларны алмаштырыгыз.';

  @override
  String get stepTwoAdjacent => 'Янәшә алмашу';

  @override
  String get stepTwoAdjacentBody =>
      'Фаралар — бер яктагы ике бертөсле өске стикер. Фаралар сулга килгәнче өсне борыгыз, шунда алыштырыла торган ике почмак уңда булыр, аннары T-perm эшләгез.';

  @override
  String get stepTwoDiagonal => 'Диагональ алмашу';

  @override
  String get stepTwoDiagonalBody =>
      'Бер якта да фаралар булмаса, ике диагональ почмак алышынырга тиеш: теләсә кайсы яктан Y-perm эшләгез, аннары барысын тигезләү өчен өсне борыгыз.';

  @override
  String get lessonBigIntro => 'Зур куб кисәкләре';

  @override
  String get lessonBigIntroDesc => 'Үзәкләр, канатлар һәм кисемнәр.';

  @override
  String get stepBigPieces => 'Даими үзәкләр юк';

  @override
  String get stepBigPiecesBody =>
      '4×4 тә һәр якта күчә торган дүрт үзәк кисәге бар, ә һәр кыр — ике канат. Күчми торган үзәк юк, шуңа почмак буенча төсләр тәртибен тикшерегез: ак сарыга, зәңгәр яшелгә, кызыл кызгылт сарыга каршы.';

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
      'Бу коммутатор нәкъ өч үзәк кисәген күчерә һәм калганына кагылмый, шуңа әзер үзәкләр әзер кала. Адашкан бер кисәк таякчыкка кушылмаса, шуны кулланыгыз.';

  @override
  String get lessonBigEdges => 'Кырларны парлау';

  @override
  String get lessonBigEdgesDesc => 'Канатларны тулы кырларга кушыгыз.';

  @override
  String get stepBigEdgePair => 'Парлау һәм кайтару';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' ике туры килгән канатны тигезли, R U R\' F R\' F\' R парсыз кырны кертә, ә Uw үзәкләрне кайтара. Ачкан катламны һәрвакыт ябыгыз.';

  @override
  String get lessonBigParity => 'Паритет';

  @override
  String get lessonBigParityDesc => 'Җөп кубларда OLL һәм PLL паритеты.';

  @override
  String get stepBigOllParity => 'OLL паритеты';

  @override
  String get stepBigOllParityBody =>
      'Бер генә әйләнгән кыр 3×3 тә була алмый: бу — OLL паритеты, хата түгел. Аны өске катламның алдында тотып, озын алгоритмны эшләгез. Ул өстәге сул һәм уң кырларны һәм ике почмакны да алыштыра; соңгы 3×3 адымнары аларны төзәтә.';

  @override
  String get stepBigPllParity => 'PLL паритеты';

  @override
  String get stepBigPllParityBody =>
      'Иң ахырда ике кыр алышынган һәм бер 3×3 алгоритмы да туры килми? Бу — PLL паритеты. Аларны өске катламның алдында һәм артында тотыгыз: 2R2 U2 2R2 Uw2 2R2 2U2 аларны алыштыра.';

  @override
  String get introGoalHeading => 'Максат нинди?';

  @override
  String get introHowHeading => 'Ничек эшлибез?';

  @override
  String get introHoldHeading => 'Ничек тотарга';

  @override
  String get introWhyHeading => 'Ни өчен эшли';

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
      'Аста ак хач ясагыз, анда һәр ак кыр янәшәдәге үзәк төсенә дә туры килсен.';

  @override
  String get introGoalCorners =>
      'Дүрт ак почмакны куеп, бөтен беренче катламны тәмамлагыз: ак як һәм туры килгән ян төсләр.';

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
      'Бер T-perm яки Y-perm белән соңгы почмакларны урынга кайтарыгыз, аннары өске катламны тигезләп, 2×2 не җыегыз.';

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
      '3×3 тә беркайчан да булмый торган ике 4×4 очрагын төзәтегез: бер әйләнгән кыр (OLL паритеты) яки урыннары алышынган ике кыр (PLL паритеты).';

  @override
  String get introHowBasics =>
      'Үзәкләр беркайчан да күчми, шуңа күрә алар һәр якның төсен күрсәтә.\nҺәр хәреф бер якны сәгать угы уңаена чирек борылышка бора.\nАпостроф (\') аны кире бора; 2 ике тапкыр бора.';

  @override
  String get introHoldBasics =>
      'Теләгәнчә: үзәкләр күчми, шуңа күрә төсләр кайсы як кайсы икәнен һәрвакыт әйтә.';

  @override
  String get introWhyBasics =>
      'Һәр алгоритм — шушы хәрефләр рәте генә, шуңа күрә аларны уку — беренче күнекмә.';

  @override
  String get introHowCross =>
      'Һәр ак кырны агы өскә карап, сары үзәк тирәсенә өскә күтәрегез: бу — ромашка.\nӨске катламны чәчәк яфрагының ян төсе үз үзәге өстенә килгәнче борыгыз.\nШул якны ике тапкыр борып, аны төшерегез; дүртесе белән дә шулай.';

  @override
  String get introHoldCross =>
      'Бөтен адым дәвамында сары үзәк өстә, ак үзәк аста. Чәчәк яфрагын тигезләү өчен кубикны түгел, өске катламны борыгыз.';

  @override
  String get introWhyCross =>
      'Ак өскә караганда, алгы якны ике тапкыр бору кырны ак үзәккә, агы аска һәм ян төсе инде туры килгән хәлдә, төшерә.';

  @override
  String get introHowCorners =>
      'Ак почмак алгы-уңдагы буш урыны өстенә килгәнче өске катламны борыгыз.\nR U R\' U\' кабатлагыз: ак уңга караса 1 тапкыр, өскә — 3, сезгә — 5 тапкыр.\nКалган өч почмак белән дә шулай эшләгез.';

  @override
  String get introHoldCorners =>
      'Ак аста, сары өстә. Почмак алгы-уңда, үз урыны өстендә генә.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' урынны күтәреп кире куя: һәр әйләнеш почмакны бераз бора, ак аска караганчы, ә хач беркайчан да бозылмый.';

  @override
  String get introHowMiddle =>
      'Сарысы булмаган өске кырны табып, алгы төсен астагы үзәк белән туры китерегез.\nАның өске төсе кая барасын әйтә: уңга яки сулга.\n8 хәрәкәтле алгоритм белән куегыз; ак катлам һәр тапкыр кире кайта.';

  @override
  String get introHoldMiddle =>
      'Ак аста, сары өстә. Кыр алда, аның алгы төсе астагы үзәк белән бер.';

  @override
  String get introWhyMiddle =>
      'Алгоритм урынны читкә ала, кырны кертә һәм ак катламны кайтара. Сарылы кыр өскә карый, уртага беркайчан да түгел.';

  @override
  String get introHowYellowCross =>
      'Өстәге сары кырларга гына карагыз: нокта, L яки сызык.\nL ны арткы-сулда, сызыкны сулдан уңга тотып, F R U R\' U\' F\' эшләгез.\nСызыкка 1 тапкыр, L га 2, ноктага 3 тапкырга кадәр кирәк.';

  @override
  String get introHoldYellowCross =>
      'Ак аста, сары өстә. L арткы-сулда, сызык сулдан уңга; нокта ничек кирәк.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' беренче ике катламга кагылмыйча, һәр тапкыр ике өске кырны әйләндерә.';

  @override
  String get introHowYellowEdges =>
      'Ике кыр үз үзәкләренә туры килгәнче өске катламны борыгыз.\nАларны артта һәм уңда тотып, R U R\' U R U2 R\' U эшләгез.\nТуры килгән кырлар каршы-каршы торса, башта теләсә кайсы яктан бер тапкыр эшләгез.';

  @override
  String get introHoldYellowEdges =>
      'Сары өстә. Туры килгән бер кыр артта, икенчесе уңда.';

  @override
  String get introWhyYellowEdges =>
      'Бу алгоритм өске кисәкләрне генә күчерә, шуңа беренче ике катлам һәрвакыт кайта.';

  @override
  String get introHowYellowCorners =>
      'Почмакның төсләре тирәдәге өч үзәккә туры килсә, ул борылган булса да урынында.\nАндый почмакны алгы-уңда тотыгыз.\nU R U\' L\' U R\' U\' L калган өчесен әйләндерә; барысы да урнашканчы кабатлагыз.';

  @override
  String get introHoldYellowCorners =>
      'Сары өстә. Урынында булган почмак алгы-уңда; булмаса, теләсә кайсы почмак.';

  @override
  String get introWhyYellowCorners =>
      'Ул өч почмакны түгәрәк буенча әйләндерә, алгы-уңдагысын калдыра, шуңа һәр кабатлау урынга күбрәк почмак китерә.';

  @override
  String get introHowTwistCorners =>
      'Җыелмаган почмакны алгы-уңда тотыгыз.\nСарысы өскә караганчы R\' D\' R D ны парлап кабатлагыз.\nКиләсе өчен өске катламны гына борыгыз; аскы өлеш соңгы почмак белән кайта.';

  @override
  String get introHoldTwistCorners =>
      'Сары өстә, борыла торган почмак алгы-уңда. Почмаклар арасында өске катламны гына борыгыз, бөтен кубикны беркайчан да түгел.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D почмакны бора һәм асны бута, ләкин барлык почмаклар борылгач, ас кире кайта. Уртада туктасагыз, ул бозык кала.';

  @override
  String get introHowCfopIntro =>
      'Хач: дүрт кыр, карап чыгу вакытында планлаштырыла.\nF2L: һәр почмак үз кыры белән бергә куела.\nOLL өскене сары итә, аннары PLL кисәкләрне урыннарына кайтара.';

  @override
  String get introHoldCfopIntro =>
      'Спидкуберлар хачны аста ясый, шуңа күрә борганда киләсе кисәкләрне алдан күрәләр.';

  @override
  String get introWhyCfopIntro =>
      'Почмакны үз кыры белән бергә җыю күп хәрәкәтне саклый, ә очракларны тану сынап карауны алыштыра.';

  @override
  String get introHowF2l =>
      'Өске катламда почмакны һәм аңа туры килгән кырны табыгыз.\nАларны урыннары өстендә парлагыз.\nПарны өч-дүрт хәрәкәттә төшерегез.';

  @override
  String get introHoldF2l =>
      'Хач аста. Парның урыны алгы-уңда, көзге очракта алгы-сулда.';

  @override
  String get introWhyF2l =>
      'Парлы почмак белән кыр бергә керә, шуңа берәмләп түгел, ике катлам бергә үсә.';

  @override
  String get introHowOll =>
      'Башта F R U R\' U\' F\' белән сары хач.\nАннары почмакларны юнәлтегез, мәсәлән Sune белән.\nХәлне күргән сары төс буенча танычыгыз.';

  @override
  String get introHoldOll =>
      'Сары өстә. Sune өчен сарысы өскә караган бердәнбер почмак алгы-сулда тора.';

  @override
  String get introWhyOll =>
      'Соңгы катламны башта юнәлеш, аннары урын итеп бүлү алгоритмнарны аз калдыра.';

  @override
  String get introHowPll =>
      'Өске як инде тулысынча сары.\nT-perm почмакларны алмаштыра; U-perm өч кырны әйләндерә.\nАлгоритмны сайлар өчен ян төсләрне укыгыз.';

  @override
  String get introHoldPll =>
      'Сары өстә. T-perm: фаралар сулда. U-perm: әзер як артта.';

  @override
  String get introWhyPll =>
      'Өс бөтенләй сары булгач, кисәкләрнең урыннары гына дөрес түгел, һәм берничә алыштыру кубикны тәмамлый.';

  @override
  String get introHowTwoFirst =>
      'Агы аска караган бер ак почмакны таяныч итеп сайлагыз.\nҺәр киләсе почмакны алгы-уңдагы урыны өстенә китерегез.\nЯн төсләре туры килеп утырганчы R U R\' U\' кабатлагыз.';

  @override
  String get introHoldTwoFirst =>
      'Ак аста. Буш урын алгы-уңда, аның почмагы өске катламда туп-туры өстендә.';

  @override
  String get introWhyTwoFirst =>
      '2×2 нең үзәкләре юк: беренче куелган почмак күршеләренең төсләрен билгели, шуңа ак кына түгел, ян төсләр дә мөһим.';

  @override
  String get introHowTwoOll =>
      'Сарысы өскә караган почмакларны санагыз.\nБерсе булса, аны алгы-сулга куеп, Sune эшләгез: R U R\' U R U2 R\'.\nЯңадан санап кабатлагыз; Sune иң күбе өч тапкыр.';

  @override
  String get introHoldTwoOll =>
      'Ак аста, сары өстә. Һәр Sune алдыннан сарысы өскә караган почмак алгы-сулда.';

  @override
  String get introWhyTwoOll =>
      'Sune ак катламны бозмыйча өске почмакларны бора; яңадан санау киләсе тапкыр ничек тотарга икәнен әйтә.';

  @override
  String get introHowTwoPbl =>
      'Фаралар эзләгез: бер яктагы ике бертөсле өске стикер.\nБер якта фаралар: сулга куеп, T-perm эшләгез.\nФаралар юк: теләсә кайсы яктан Y-perm, аннары өсне тигезләгез.';

  @override
  String get introHoldTwoPbl =>
      'Ак аста, сары өстә. T-perm: фаралар сулда. Y-perm: теләсә кайсы як сезгә таба.';

  @override
  String get introWhyTwoPbl =>
      'Өс сары булгач, почмакларның урыннары гына дөрес түгел: T-perm ике күршене, Y-perm ике диагональне алыштыра.';

  @override
  String get introHowBigIntro =>
      'Бер үзәк тә даими түгел: һәр як төсен дүрт үзәк кисәге тәшкил итә.\nRw кебек киң хәрәкәтләр ике катламны берьюлы бора.\n2R кебек эчке хәрәкәтләр бер эчке кисемне генә бора.';

  @override
  String get introHoldBigIntro =>
      'Башта теләгәнчә: 4×4 тә күчми торган үзәк юк, һәр төснең урынын үзегез сайлыйсыз.';

  @override
  String get introWhyBigIntro =>
      'Редукция үзәкләрне һәм кыр кисәкләрен берләштерә, шуңа зур кубик 3×3 кебек җыела.';

  @override
  String get introHowBigCenters =>
      'Башта почмак буенча төсләр тәртибен тикшерегез.\nИке каршы үзәкне, аннары калган дүртесен җыегыз.\nЭчке катламнар үзәк кисәкләрен күчерә; ачкан катламны һәрвакыт кире кайтарыгыз.';

  @override
  String get introHoldBigCenters =>
      'Җыела торган як алда, әзер үзәкләр сулда һәм уңда, комачауламасын.';

  @override
  String get introWhyBigCenters =>
      'Катлам үзәкләрне күчерә, ә кире бору әзерләрен кайтара, шуңа максат итеп алынган кисәк кенә үзгәрә.';

  @override
  String get introHowBigEdges =>
      'Ике төсе бер үк булган ике канатны табыгыз.\nАларны алда тезеп, Uw\' белән тоташтырыгыз.\nПарсыз кырны кертегез, аннары Uw үзәкләрне кайтара.';

  @override
  String get introHoldBigEdges =>
      'Парлана торган кыр алгы катламнарда; әзер кырлар өстә һәм аста куелган.';

  @override
  String get introWhyBigEdges =>
      'Uw\' ике канат очрашсын өчен үзәкләрне читкә ала; Uw аларны кайтара, хезмәтегез саклана.';

  @override
  String get introHowBigParity =>
      'Тыгылганчы 4×4 не 3×3 кебек җыегыз.\nБер әйләнгән кыр: озын OLL паритеты алгоритмы.\nИке алышынган кыр: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'Соңгы катлам өстә. OLL паритеты: әйләнгән кыр алда. PLL паритеты: алышынган кырлар алда һәм артта.';

  @override
  String get introWhyBigParity =>
      'Канатлар 3×3 тә булмаган хәлләргә эләгә ала; бу алгоритмнар эчке катламнарны борып, нәкъ шуны кире кайтара.';

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
  String get stageCrown1 => 'Беренче катлам (ак)';

  @override
  String get stageCrown2 => 'Икенче катлам';

  @override
  String get stageCrown3 => 'Өченче катлам (сары)';

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
  String get introHoldFiveIntro =>
      'Теләгәнчә: 5×5 тә һәр якның уртасы күчми, шуңа ул якның төсен күрсәтә.';

  @override
  String get introWhyFiveIntro =>
      'Күчми торган үзәкләр төсләр схемасын билгели, шуңа үзәкләрне ялгыш тәртиптә җыеп булмый.';

  @override
  String get lessonFiveCenters => '5×5 үзәкләре';

  @override
  String get lessonFiveCentersDesc => 'Һәр үзәкне өчәрле баганалардан җыегыз.';

  @override
  String get introGoalFiveCenters =>
      'Һәр якның 3×3 үзәк кисәкләре блогын бер төстә җыегыз.';

  @override
  String get introHowFiveCenters =>
      'Күчми торган урта кисәктән башлагыз: төсне ул билгели.\nӨчәрле таякчыклар ясап, эчке катлам белән кертегез.\nТаякчыкны керткән хәрәкәт әзер үзәкне дә кайтара.';

  @override
  String get introHoldFiveCenters =>
      'Җыела торган үзәк алда яки өстә; әзер үзәкләр аста, сулда яки уңда.';

  @override
  String get introWhyFiveCenters =>
      'Катлам эчкә, өсне бору, катлам кире: таякчыкны керткән катлам әзер үзәкләрне дә кайтара.';

  @override
  String get lessonFiveEdges => '5×5 кырлары';

  @override
  String get lessonFiveEdgesDesc => 'Ике канатны үз урта кырына кушыгыз.';

  @override
  String get introGoalFiveEdges =>
      'Һәр урта кырны ике канаты белән кушыгыз, 12 кыр да бер кисәк кебек күренсен.';

  @override
  String get introHowFiveEdges =>
      'Алда һәр канатны үзенең урта кыры белән туры китерегез.\nЭчке катламны борыгыз, җыелмаган кырны кертегез, кире борыгыз.\nСоңгы кырлар өчен: катлам, әйләндерү, катлам.';

  @override
  String get introHoldFiveEdges =>
      'Җыела торган кыр алда; әзер кырлар өске һәм аскы катламнарда саклана.';

  @override
  String get introWhyFiveEdges =>
      'Эчке катламны ачып ябу канатларны тоташтыра, ә үзәкләр һәм сакланган кырлар кайта.';

  @override
  String get lessonFiveSolve => '5×5 ны 3×3 кебек җыю';

  @override
  String get lessonFiveSolveDesc => '3×3 кебек катлам-катлам тәмамлагыз.';

  @override
  String get introGoalFiveSolve =>
      'Редукцияләнгән 5×5 не 3×3 кебек, тышкы борылышлар белән генә, катлам-катлам җыегыз.';

  @override
  String get introHowFiveSolve =>
      'Моннан соң тышкы борылышлар гына, югыйсә парлы кырлар аерылыр.\nАк хач һәм почмаклар, урта катлам, аннары сары катлам.\nКүчми торган үзәкләр һәр якның төсен күрсәтә.';

  @override
  String get introHoldFiveSolve =>
      'Беренче катламның төсе аста, нәкъ 3×3 тагы кебек; куела торган почмак алгы-уңда.';

  @override
  String get introWhyFiveSolve =>
      'Эчке борылышлар үзәкләрне һәм кырларны яңадан аерыр; тышкылары һәр блокны 3×3 нең бер кисәге итеп йөртә.';

  @override
  String get lessonFiveParity => '5×5 кыр паритеты';

  @override
  String get lessonFiveParityDesc => 'Канатлары алышынган кырны төзәтегез.';

  @override
  String get introGoalFiveParity =>
      'Ике тышкы канаты алышынган бер кырны төзәтегез: бу 5×5 нең бердәнбер паритеты.';

  @override
  String get introHowFiveParity =>
      'Ул әйләнгән кебек күренгән соңгы кыр булып чыга.\nЭчке катламнар белән озын төзәтүне бер тапкыр эшләгез.\n5×5 тә PLL паритеты юк.';

  @override
  String get introHoldFiveParity =>
      'Соңгы катлам өстә, канатлары алышынган кыр өске катламның алдында.';

  @override
  String get introWhyFiveParity =>
      '5×5 тә бер кырның ике тышкы канаты гына алышына ала, шуңа бер алгоритм җитә.';

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
  String get introHoldSixIntro =>
      'Башта теләгәнчә: 4×4 кебек, 6×6 да күчми торган үзәк юк.';

  @override
  String get introWhySixIntro =>
      '4×4 һәм 5×5 не җыя алсагыз, 6×6 — зуррак блоклар белән шул ук редукция.';

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
      'Башта почмак буенча төсләр тәртибен тикшерегез: күчми торган үзәк юк.\nДүртәрле таякчыклар ясап, тоташтырыгыз.\nСоңгы ике үзәктә кисәкләрне берәмләп күчерегез: катлам, өс, кире.';

  @override
  String get introHoldSixCenters =>
      'Җыела торган як алда, әзер үзәкләр сулда, уңда яки аста.';

  @override
  String get introWhySixCenters =>
      'Таякчыклар эчке катламнар белән тоташа һәм һәр катлам кире борыла, шуңа әзер үзәкләр бөтен кала.';

  @override
  String get lessonSixEdges => '6×6 кырлары';

  @override
  String get lessonSixEdgesDesc => 'Һәр кырның дүрт кисәген җыегыз.';

  @override
  String get introGoalSixEdges =>
      'Һәр кырның дүрт кисәген җыегыз, 6×6 та 12 чиста кыр булсын.';

  @override
  String get introHowSixEdges =>
      'Бер кырның тышкы һәм эчке канатларын алда тезегез.\nТирән киң катлам кырны кертә һәм чыгара.\nКисәкне азат итү өчен әзер кырны беркайчан да бозмагыз.';

  @override
  String get introHoldSixEdges =>
      'Җыела торган кыр алда; әзер кырлар өстә һәм аста куелган.';

  @override
  String get introWhySixEdges =>
      'Тирән киң борылыш канатлар очрашсын өчен үзәкләрне читкә ала, аннары кире кайтара.';

  @override
  String get lessonSixSolve => '6×6 ны 3×3 кебек җыю';

  @override
  String get lessonSixSolveDesc => '3×3 кебек катлам-катлам тәмамлагыз.';

  @override
  String get introGoalSixSolve =>
      'Редукцияләнгән 6×6 ны 3×3 кебек, тышкы борылышлар белән генә, катлам-катлам җыегыз.';

  @override
  String get introHowSixSolve =>
      'Моннан соң тышкы борылышлар гына: эчке катлам үзәкне яки кырны бозар.\nСез җыйган үзәкләр һәр якның төсен күрсәтә.\nАк хач һәм почмаклар, урта катлам, аннары сары катлам.';

  @override
  String get introHoldSixSolve =>
      'Беренче катламның төсе аста, нәкъ 3×3 тагы кебек; куела торган почмак алгы-уңда.';

  @override
  String get introWhySixSolve =>
      'Тышкы борылышлар һәр 4×4 үзәкне һәм һәр кырны бер кисәк итеп йөртә, нәкъ 3×3 тагы кебек.';

  @override
  String get lessonSixParity => '6×6 паритеты';

  @override
  String get lessonSixParityDesc => 'Бер әйләнгән кыр яки ике алышынган кыр.';

  @override
  String get introGoalSixParity =>
      '3×3 та беркайчан да булмый торган ике 6×6 хәлен төзәтегез: бер әйләнгән кыр яки ике алышынган кыр.';

  @override
  String get introHowSixParity =>
      'Тыгылганчы 3×3 кебек җыегыз.\nБер әйләнгән кыр: 3Rw белән озын төзәтү.\nИке алышынган кыр: эчке икеле борылышлар белән кыска төзәтү.';

  @override
  String get introHoldSixParity =>
      'Соңгы катлам өстә. Әйләнгән кыр алда; ике алышынган булса, алда һәм артта.';

  @override
  String get introWhySixParity =>
      '4×4 кебек, 6×6 та бер әйләнгән яки ике алышынган кыр белән бетәргә мөмкин; эчке катлам алгоритмнары аларны гына төзәтә.';

  @override
  String get stepFivePieces => '5×5 кисәкләре';

  @override
  String get stepFivePiecesBody =>
      'Һәр якның урта кисәге беркайчан да күчми, шуңа төсләр схемасы ялгыш була алмый. Аның тирәсендә сигез үзәк кисәге: почмак-үзәкләр һәм кыр-үзәкләр төрләрен беркайчан да алыштырмый. Һәр кыр — урта кисәк һәм ике канат.';

  @override
  String get stepFiveSlices => 'Борылышларның өч төре';

  @override
  String get stepFiveSlicesBody =>
      'Тышкы борылышлар бер якны күчерә. Киң борылышлар якны артындагы катлам белән бергә күчерә. Эчке кисем борылышлары эчтәге бер катламны гына күчерә: кисәкләр тышкы өлешкә тимичә шулай урын алмаштыра.';

  @override
  String get stepFiveCenterBar => 'Үзәк баганалары';

  @override
  String get stepFiveCenterBarBody =>
      'Өч бертөсле үзәк кисәгеннән рәт ясап, эчке катлам белән кертегез, өсне борып, катламны кире кайтарыгыз: таякчыкны керткән хәрәкәт әзер үзәкне дә кайтара. Өч таякчык — бер үзәк.';

  @override
  String get stepFiveCenterSwap => 'Бозмыйча алмаштыру';

  @override
  String get stepFiveCenterSwapBody =>
      'Бер үзәк кисәген күчерер өчен: эчке кисемне борыгыз, өске катламны борыгыз, кисемне кире кайтарыгыз, өске катламны кире борыгыз. Әзер үзәкләр һәр тапкыр кире кайта.';

  @override
  String get stepFiveEdgePair => 'Канатларны урта кыр белән парлау';

  @override
  String get stepFiveEdgePairBody =>
      'Алда канатны үзенең урта кыры янына тигезләп, эчке катламны төшерегез, кыска триггер белән җыелмаган кырны кертегез, аннары эчке катламны кире күтәрегез.';

  @override
  String get stepFiveEdgeLast => 'Соңгы кырлар';

  @override
  String get stepFiveEdgeLastBody =>
      'Алыштыру өчен буш кыр калмаса, катлам, әйләндерү, катлам кулланыгыз: киң борылыш, кыска триггер һәм кире киң борылыш әзер кырларны бозмыйча соңгы кырларны парлый.';

  @override
  String get stepFiveAsThree => 'Хәзер бу — 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Үзәкләр һәм кырлар әзер булгач, 5×5 зур 3×3 кебек. Тышкы борылышлар гына, катлам-катлам: ак хач һәм почмаклар, урта катлам, аннары сары катлам. 5×5 тә PLL паритеты юк.';

  @override
  String get stepFiveEdgeParity => 'Соңгы кырның канатларын алмаштыру';

  @override
  String get stepFiveEdgeParityBody =>
      'Кайвакыт соңгы кырның ике тышкы канаты алышынган була һәм ул әйләнгән кебек күренә: 5×5 нең бердәнбер паритеты. Аны өске катламның алдында тотып, эчке катлам алгоритмын бер тапкыр эшләгез; калганы үз урынына кайта.';

  @override
  String get stepSixPieces => '6×6 кисәкләре';

  @override
  String get stepSixPiecesBody =>
      '4×4 кебек, 6×6 да күчми торган үзәк юк: уналты үзәк кисәге һәр якның төсен төзи, шуңа башта почмак буенча төсләр тәртибен тикшерегез. Һәр кырның дүрт канаты бар: икесе тышкы, икесе эчке.';

  @override
  String get stepSixSlices => 'Тирәнрәк катламнарны бору';

  @override
  String get stepSixSlicesBody =>
      'Киң борылышлар яктан ике яки өч катламны күчерә ала. Икенче яки өченче катламдагы эчке кисемнәр — үзәкләр һәм кырлар өчен кораллар.';

  @override
  String get stepSixCenterBar => 'Дүртәрле баганалар';

  @override
  String get stepSixCenterBarBody =>
      'Дүрт бертөсле үзәк кисәгеннән рәтләр ясап, эчке катлам борылышлары белән янәшә тезегез, һәр катламны кире кайтарып, як бер төстәге 4×4 блок булганчы.';

  @override
  String get stepSixCenterSwap => 'Бер мәлгә бер кисәк';

  @override
  String get stepSixCenterSwapBody =>
      'Өченче катламны борыгыз, өсне борыгыз, кире кайтарыгыз, өсне кире: бер үзәк кисәге күчә, әзер үзәкләр кайта. Таякчык сыймаган соңгы ике үзәктә кулланыгыз.';

  @override
  String get stepSixEdgePair => 'Дүрт кисәк, бер кыр';

  @override
  String get stepSixEdgePairBody =>
      'Тирән киң катлам белән бер кырның дүрт канатын алда җыегыз, кыска триггер белән җыелмаган кырны кертегез, аннары киң катламны кире борыгыз.';

  @override
  String get stepSixEdgeLast => 'Соңгы кырлар';

  @override
  String get stepSixEdgeLastBody =>
      'Соңгы кырларны тирән киң борылыш белән аның кире борылышы арасындагы кыска триггер белән парлагыз, әзер кырлар парлы калсын. Кисәкне азат итү өчен әзер кырны беркайчан да бозмагыз.';

  @override
  String get stepSixAsThree => 'Хәзер бу — 3×3';

  @override
  String get stepSixAsThreeBody =>
      '4×4 үзәкләр һәм парлы кырлар белән 6×6 ны 3×3 кебек, тышкы борылышлар белән генә, катлам-катлам җыегыз. Ахырда бер әйләнгән яки ике алышынган кыр — паритет, хата түгел.';

  @override
  String get stepSixOllParity => 'Бер әйләнгән кыр';

  @override
  String get stepSixOllParityBody =>
      'Соңгы катламда әйләнгән кебек күренгән бер кыр — паритет. Аны өске катламның алдында тотып, озын төзәтүне эшләгез: ул дүрт канатны да әйләндерә, өстәге сул һәм уң кырларны да алыштыра һәм беренче ике катламга кагылмый.';

  @override
  String get stepSixPllParity => 'Ике алышынган кыр';

  @override
  String get stepSixPllParityBody =>
      'Иң ахырда ике кыр алышынган кебек күренсә, аларны өске катламның алдында һәм артында тотып, эчке икеле борылышлар белән кыска төзәтүне эшләгез: ике кырның дүрт канаты да урын алыша.';

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
  String get patternsWatchVideo => 'Видео карау';

  @override
  String get patternsNotNow => 'Хәзер түгел';

  @override
  String get settingsColorScheme => 'Кубик төсләре схемасы';

  @override
  String get colorSchemeWestern => 'Көнбатыш';

  @override
  String get colorSchemeJapanese => 'Япон';

  @override
  String get colorSchemeWesternDesc =>
      'Ак – сарыга каршы, зәңгәр – яшелгә каршы';

  @override
  String get colorSchemeJapaneseDesc =>
      'Ак – зәңгәргә каршы, сары – яшелгә каршы';

  @override
  String dailyYourTime(String time) {
    return 'Сезнең вакыт: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Кубны карап чыгу өчен сездә $seconds секунд бар. Кире санауны башлар өчен басыгыз.';
  }

  @override
  String get timerInspectTapReady => 'Җыярга әзер булгач басыгыз';

  @override
  String timerInspectPlus2(int seconds) {
    return 'Карап чыгу $seconds с узды, сәгать үзе башланды: +2 с штраф';
  }

  @override
  String timerAvgOf(int count) {
    return '$count җыюның уртачасы';
  }

  @override
  String get timerAvgNote => 'Уртачада иң яхшы һәм иң начар вакыт исәпләнми';

  @override
  String get timerPbSub => 'Иң яхшы җыю';

  @override
  String get timerPlus2Caption => '+2 с штраф';

  @override
  String get timerDnfCaption => 'Тәмамланмады (DNF)';

  @override
  String get timerDeleteCaption => 'Бу җыюны бетерү';

  @override
  String get patternBullsEye => 'Максат';

  @override
  String get patternFramedCenter => 'Рамкалы үзәк';

  @override
  String get patternBlockCheckerboard => 'Блоклы шахмат';

  @override
  String get patternCubeInCubeInCube => 'Куб эчендә куб эчендә куб';

  @override
  String get patternUnionJack => 'Юнион Джек';

  @override
  String get patternKilt => 'Килт';

  @override
  String get patternSixTs => 'Алты T';

  @override
  String get patternTwinPeaks => 'Игез түбәләр';

  @override
  String get patternSpiral => 'Спираль';

  @override
  String get patternTetris => 'Тетрис';

  @override
  String get patternSpots => 'Үзәк нокталар';

  @override
  String get patternStripes => 'Сызыклар';

  @override
  String get patternAnaconda => 'Анаконда';

  @override
  String get patternZigzag => 'Зигзаг';

  @override
  String get patternFourSpots => 'Дүрт нокта';

  @override
  String get patternGreenMamba => 'Яшел мамба';

  @override
  String get patternPlusMinus => 'Плюс-минус';

  @override
  String guideStepCounter(int current, int total) {
    return 'Адым $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Хәрәкәт $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Хәрәкәт $current / $total';
  }

  @override
  String get dailyStep1Title => '1 нче адым: кубыгызны бутагыз';

  @override
  String get dailyStep2Title => '2 нче адым: кубны җыегыз';

  @override
  String dailyPersonalBest(String time) {
    return 'Шәхси рекорд: $time';
  }

  @override
  String get dailyRecentDays => 'Соңгы көннәр';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count көнлек серия! Сез бик шәп!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Куб бутап куелды! Хәзер аны җыегыз';

  @override
  String get dailyCongratsTitle => 'Котлыйбыз!';

  @override
  String dailyCongratsBody(String time) {
    return 'Сез бүгенге бурычны $time эчендә җыйдыгыз.';
  }

  @override
  String get dailyCongratsDone => 'Бурычка кайту';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $count үрнәк';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '$hours сәгать калды';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '$minutes минут калды';
  }

  @override
  String get lockedLabel => 'Йозакланган';

  @override
  String get unlockedLabel => 'Ачык';

  @override
  String patternUnlockBody(int hours) {
    return 'Бу үрнәкне һәм аның адымлап күрсәтмәсен $hours сәгатькә ачу өчен 1 кыска видео карагыз.';
  }

  @override
  String lessonUnlockBody(int hours) {
    return 'Бу дәресне киләсе $hours сәгать эчендә теләсә ничә тапкыр ачу өчен 1 кыска видео карагыз.';
  }

  @override
  String get bigCubeUnlockTitle => 'Зур кубларны җыю';

  @override
  String bigCubeUnlockBody(int hours) {
    return '4×4–6×6 өчен бушлай җыю кулланылды. Киләсе $hours сәгать эчендә зур кубларны җыю өчен 1 кыска видео карагыз.';
  }

  @override
  String get doubleTurnBadge => 'Ике тапкыр бору · 180°';

  @override
  String get homeAcademy => 'Академия';

  @override
  String get homePatterns => 'Шәп үрнәкләр';

  @override
  String get homePractice => 'Таймер һәм көндәлек бурыч';

  @override
  String get scanChoiceSubtitle => 'Ничек башлыйсыз?';

  @override
  String get scanChoiceCamera => 'Камера белән сканерлау';

  @override
  String get scanChoiceCameraDesc =>
      'Һәр ягын камерага күрсәтегез һәм чишелешне алыгыз.';

  @override
  String get scanChoice3d => '3D кубны ачу';

  @override
  String get scanChoice3dDesc =>
      'Виртуаль кубны борыгыз, болгатыгыз һәм адымлап җыегыз.';

  @override
  String get academyAllSizes => 'Барлык зурлыклар';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total дәрес үтелде';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total үтелде';
  }

  @override
  String get lessonStageConcept => 'Аңлатма';

  @override
  String get lessonStageExamples => 'Мисаллар';

  @override
  String get lessonStagePractice => 'Күнегү';

  @override
  String get lessonStageNext => 'Алга / ирекле';

  @override
  String lessonStageOf(int index, int total, String name) {
    return '$total баскычтан $index нчесе: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Мисал $index/$total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Күнегү $index/$total';
  }

  @override
  String get lessonBonusCase => 'Бонус очрак';

  @override
  String get lessonPracticeIntro =>
      'Чын болгату: алдагы адымнар гына җыелган. Бу адымны күрсәтмә артыннан күрсәтмә белән ахырынача җыегыз.';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Турыдан-туры «$lesson» дәресенә күчегез.';
  }

  @override
  String get lessonFreePractice => 'Ирекле күнегү';

  @override
  String get lessonFreePracticeDesc =>
      'Болгатылган 3D кубны башыннан бу адымга кадәр үзегез җыегыз.';

  @override
  String freePracticeBanner(String topic) {
    return 'Ирекле күнегү: кубны башыннан «$topic» адымына кадәр җыегыз!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return '$face үзәкле якны ук күрсәткәнчә борыгыз. Үзәк урынында кала; аның тирәсендәге кисәкләр генә күчә.';
  }

  @override
  String cueTrigger(String front) {
    return 'Уң кул хәрәкәте, $front сезгә карап: уң як өскә, өс сулга, уң як аска, өс кире уңга.';
  }

  @override
  String get cueTriggerBack =>
      'Рәттән алтынчы хәрәкәт кубны нәкъ элекке хәленә кайтара. Алты — тылсымлы сан!';

  @override
  String cueSliceInner(String face) {
    return '$face ягы янындагы эчке катламны гына борыгыз. Як үзе кузгалмый, шуңа үзәкләр аерыла.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Киң борылыш: $face ягы һәм аның янындагы эчке катлам бер калын катлам кебек бергә борыла.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Бөтен кубны $top үзәк өстә, $front үзәк сезгә караган итеп борыгыз.';
  }

  @override
  String get cueTurnTop =>
      'Киләсе алгоритмга әзерләнү өчен ук күрсәткәнчә өске катламны гына борыгыз.';

  @override
  String get cueAlignTop =>
      'Соңгы хәрәкәт: төсләр тигезләнсен өчен өске катламны борыгыз. Әзер!';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece кыры өске катламда. Ул $center үзәкнең нәкъ өстенә килгәнче өсне борыгыз, аннары аны төшерү өчен шул якны ике тапкыр борыгыз.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece кыры урта катламда кысылып калган. Аны өскә күтәрегез, $center үзәк өстенә тигезләгез һәм төшерегез.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece кыры урынында, ләкин әйләнгән: агы янга карый. Аны чыгарып, агы өскә карап өскә күтәрегез, аннары $center үзәге янына төшерегез.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP рәвешендә астны да борырга ярый. $piece кырын төшерегез һәм аны $center үзәк белән тигезләр өчен астны борыгыз.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return '$piece почмагы $a һәм $b яклар арасындагы үз урынының нәкъ өстенә килгәнче өсне борыгыз. Ул дөрес борылып кергәнче уң кул хәрәкәтен кабатлагыз.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece почмагы урынында, ләкин борылган. Бер триггер аны чыгара (урынына сары почмак керә); ул агы аска карап кире кергәнче шул ук урын өстендә кабатлагыз. Аны куып кубикны бормагыз.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return '$piece кыры $a үзәк белән тигезләнгәнче өсне борыгыз, аннары аны уңга аска, $a белән $b арасындагы урынга җибәрегез.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return '$piece кыры $a үзәк белән тигезләнгәнче өсне борыгыз, аннары аны сулга аска, $a белән $b арасындагы урынга җибәрегез.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece кыры урынында, ләкин әйләнгән. Анда сары кыр кертеп, аны өскә этәрегез, аннары $a белән $b арасына яңадан куегыз.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Сары сызык: сызык сулдан уңга сузылсын өчен өсне борыгыз, $front сезгә карап торсын, аннары сары хач алгоритмын эшләгез.';
  }

  @override
  String cueYellowL(String front) {
    return 'Сары L: L арткы сулга күрсәтсен өчен өсне борыгыз, $front сезгә карап торсын, аннары алгоритмны эшләгез. Ул сызыкка әйләнә.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Үзәк кенә сары: нокта. $front сезгә карап торганда алгоритмны бер тапкыр эшләгез, L килеп чыгар. Нокта өч әйләнеш алырга мөмкин, дәвам итегез.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return '$piece кыры $center үзәк белән туры килгәнче өсне борыгыз.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Туры килгән ике кыр артта һәм уңда. $front сезгә карап торганда алмаштыруны эшләгез: алгы һәм сул кырлар урын алмаша.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Туры килгән кырлар бер-берсенә каршы. $front сезгә карап торганда алмаштыруны бер тапкыр эшләгез; аннары күрше икесе туры килә.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece почмагы инде урынында. Аны алгы уңда тотыгыз, $front сезгә карап торсын, калган өч почмакны әйләндереп алмаштырыгыз.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Бер сары почмак та әле урынында түгел. $front сезгә карап торганда бер тапкыр әйләндерегез; аннары бер почмак урынына утыра.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Алгы-уңдагы $piece почмагын борыгыз: сарысы өскә караганчы аскы триггерны парлап кабатлагыз. Аскы катламнар әлегә буталган кебек; алар соңгы почмак белән кайта!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Бу юлы $piece почмагына дүрт хәрәкәт кирәк. Дәвам итегез: сары һәрвакыт ике яки дүрттән соң өскә чыга.';
  }

  @override
  String get cueTwistNext =>
      'Киләсе борылган почмакны алгы уңга китерү өчен өске катламны гына борыгыз. Хәзер бөтен кубны бормагыз!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Өстә $piece почмагын $edge кыры белән парлагыз, аннары парны $a белән $b арасындагы урынга кертегез.';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece почмагы ялгыш кыр белән үз урынында кысылып калган. Башта аны өскә чыгарыгыз, аннары парлап кертегез.';
  }

  @override
  String cueOllSune(String front) {
    return '$front сезгә карап торганда, сары почмакларны өскә бору өчен Sune эшләгез.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Бу юлы бер Sune җитмәде. Өсне борыгыз һәм $front сезгә карап торганда Sune ны тагын эшләгез.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Ике почмак урын алмашырга тиеш. Туры килгән парны (фараларны) сулда тотыгыз, $front сезгә карап торсын, һәм T-perm эшләгез.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Почмаклар әзер. $piece кырын артта тотыгыз һәм калган өч кырны U-perm белән әйләндереп алмаштырыгыз.';
  }

  @override
  String get cuePllNoEdge =>
      'Өске кырларның берсе дә әле үз үзәгенә туры килми. Теләсә кайсы яктан U-perm ны бер тапкыр эшләгез; аннары берсе туры килә.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Өстәге ике күрше почмак урын алмашырга тиеш. Туры килгән парны сулда тотыгыз, $front сезгә карап торсын, һәм алмаштыруны эшләгез.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Алмаштырасы ике почмак диагональдә. $front сезгә карап торганда диагональ алмаштыруны эшләгез.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Адашкан $color үзәк кисәген үзәкләрнең 3-циклы белән кайтарыгыз: катлам, өс, катлам, аннары барысы да кире.';
  }

  @override
  String cueCenterBar(String color) {
    return '$color үзәк кисәкләренең бер тулы полосасы ялгыш якта. Аны эчке катлам белән күтәрегез, өсне борыгыз һәм урынына кайтарыгыз.';
  }

  @override
  String cueEdgePair(String piece) {
    return '$piece кырының ике кисәген парлагыз: тигезләгез, катламны борыгыз, уң кул хәрәкәтләре белән парсыз кырны алмаштырыгыз һәм катламны кире борыгыз.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Соңгы кырлар: $piece кырын соңгы ике кыр алгоритмы белән парлагыз — ул әзер кырларның берсен дә бозмый.';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL паритеты: өстәге бер кыр әйләнгән, бу 3×3 тә беркайчан да булмый. $front сезгә карап торганда аны алда тотыгыз һәм гади OLL алдыннан паритет төзәтүен эшләгез.';
  }

  @override
  String get cueParityPll =>
      'PLL паритеты: өстәге ике кыр алышынган, бу 3×3 тә беркайчан да булмый. Аларны алда һәм артта тотып, паритет алыштыруын эшләгез, аннары өсне тигезләгез.';

  @override
  String cueParityFive(String front) {
    return 'Кыр паритеты: бер кырның ике тышкы канаты алышынган, 5×5 нең бердәнбер паритеты. $front сезгә карап торганда шул кырны алда тотыгыз һәм төзәтүне бер тапкыр эшләгез.';
  }

  @override
  String get onboardingSkip => 'Калдыру';

  @override
  String get onboardingNext => 'Алга';

  @override
  String get onboardingStart => 'Башлау';

  @override
  String get onboardingWhatTitle => 'Кубик буенча ярдәмчең';

  @override
  String get onboardingWhatBody =>
      'CubeMentor 2×2 дән 6×6 га кадәр һәр кубикны җыярга, өйрәнергә һәм күнегергә ярдәм итә, интернетсыз да.';

  @override
  String get onboardingScanTitle => 'Берничә секундта сканерла һәм җый';

  @override
  String get onboardingScanBody =>
      'Һәр якны камерага күрсәт (яки төсләрне кулдан керт) һәм 3D чишелешне адымлап кабатла.';

  @override
  String get onboardingLearnTitle => 'Өйрән һәм уйна';

  @override
  String get onboardingLearnBody =>
      'Академиядә катлам-катлам ысулын үзләштерегез, аннары 3D мәйданчыкта иркен әйләндерегез, бутагыз һәм җыегыз.';

  @override
  String get scanChoiceManualDesc => 'Һәр якның төсләрен стикерлап кертеп чык.';

  @override
  String get scanTryAgain => 'Кабат тырышып карау';

  @override
  String get scanEditManually => 'Төсләрне кулдан төзәтү';

  @override
  String get scanLightingHint =>
      'Якны челтәр уртасына куй. Якты, тигез яктылык кулла һәм ялтыраудан саклан.';

  @override
  String get crownExplain =>
      'Катлам — кубикның бер горизонталь кисәге: беренче катлам — астагы ак катлам, икенчесе — урта катлам, өченчесе — өстәге сары катлам.';

  @override
  String get lessonObjectiveHeading => 'Дәрес максаты';

  @override
  String get dirRowTop => 'Алгы якның өске рәте';

  @override
  String get dirRowBottom => 'Алгы якның аскы рәте';

  @override
  String get dirColumnRight => 'Алгы якның уң баганасы';

  @override
  String get dirColumnLeft => 'Алгы якның сул баганасы';

  @override
  String get solveChoiceTitle => 'Ничек җыярга телисең?';

  @override
  String get solveChoiceFastDesc => 'Иң кыска чишелеш, адымлап.';

  @override
  String get solveChoiceGuidedDesc => 'Катлам-катлам ысулын адымлап өйрәнегез.';

  @override
  String get guidedSolvedTitle => 'Җыелды!';

  @override
  String get guidedSolvedBody => 'Син һәр адымны үтеп кубикны җыйдың.';

  @override
  String get solveAgain => 'Тагын җыю';

  @override
  String get backToHome => 'Баш биткә кайту';

  @override
  String get dailyStatTime => 'Бүгенге вакыт';

  @override
  String get dailyStatBest => 'Шәхси рекорд';

  @override
  String get dailyStatStreak => 'Хәзерге серия';

  @override
  String get dailyStatBestStreak => 'Иң яхшы серия';

  @override
  String get privacyPolicyTitle => 'Хосусыйлык сәясәте';

  @override
  String get settingsPrivacyPolicyDesc =>
      'CubeMentor нәрсә саклый һәм реклама нәрсә куллана.';

  @override
  String get privacyIntro =>
      'CubeMentor аккаунтсыз һәм үз серверларыннан башка эшли. Бу биттә җиһазыңда нәрсә кала һәм безнең реклама партнёры нәрсә куллана икәне аңлатыла.';

  @override
  String get privacyDataTitle => 'Мәгълүматларың җиһазыңда кала';

  @override
  String get privacyDataBody =>
      'Телең, көйләүләрең, дәресләрдәге алгарышың, җыю вакытларың һәм көндәлек сериясе бары тик шушы җиһазда саклана. Безнең серверлар юк, шуңа күрә без аларны беркайчан да алмыйбыз. Кушымтаны бетергәч, алар юкка чыга.';

  @override
  String get privacyCameraTitle => 'Камера';

  @override
  String get privacyCameraBody =>
      'Камера кубикны сканерлаганда гына кулланыла. Стикер төсләрен уку өчен кадрлар җиһазыңда анализлана; бер фото да, видео да сакланмый һәм беркая да җибәрелми.';

  @override
  String get privacyAdsTitle => 'Реклама';

  @override
  String get privacyAdsBody =>
      'Кушымта Google AdMob рекламасын күрсәтә. Google хосусыйлык сәясәтендә язылганча, Google рекламаны күрсәтү һәм бәяләү өчен җиһаз идентификаторларын һәм реклама белән эш турындагы мәгълүматларны куллана ала. Закон таләп иткән җирләрдә башта синең ризалыгың сорала, һәм аны көйләүләрдә үзгәртә аласың.';

  @override
  String get privacyContactTitle => 'Элемтә';

  @override
  String privacyContactBody(String email) {
    return 'Хосусыйлык буенча сораулар бармы? Безгә $email адресына яз.';
  }
}
