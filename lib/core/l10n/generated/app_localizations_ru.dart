// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Сканируйте, собирайте и осваивайте любые кубики — от 2×2 до 6×6.';

  @override
  String get chooseCubeSize => 'Выберите кубик';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Новичок';

  @override
  String get cubeLevel3 => 'Классика';

  @override
  String get cubeLevel4 => 'Продвинутый';

  @override
  String get cubeLevel5 => 'Эксперт';

  @override
  String get cubeLevel6 => 'Мастер';

  @override
  String get cubeComingSoon => 'Скоро новый кубик';

  @override
  String get carouselPrevious => 'Предыдущий кубик';

  @override
  String get carouselNext => 'Следующий кубик';

  @override
  String get chooseMode => 'Что хотите сделать?';

  @override
  String get modePlayground => '3D-песочница';

  @override
  String get modePlaygroundDesc =>
      'Вращайте слои, запутывайте и повторяйте ходы в 3D.';

  @override
  String get modeScanSolve => 'Скан и сборка';

  @override
  String get modeScanSolveDesc =>
      'Отсканируйте кубик камерой и получите решение.';

  @override
  String get modeAcademy => 'Академия';

  @override
  String get modeAcademyDesc =>
      'Учитесь шаг за шагом с интерактивными уроками.';

  @override
  String get language => 'Язык';

  @override
  String get languageSearch => 'Поиск языка';

  @override
  String get languageNoResults => 'Ни один язык не подходит под запрос.';

  @override
  String playgroundTitle(int size) {
    return 'Песочница $size×$size';
  }

  @override
  String get scramble => 'Запутать';

  @override
  String get reset => 'Сбросить';

  @override
  String get undo => 'Отменить';

  @override
  String get speed => 'Скорость';

  @override
  String get xray => 'Рентген';

  @override
  String get prime => 'Обратный';

  @override
  String get wide => 'Широкий';

  @override
  String layer(int index) {
    return 'Слой $index';
  }

  @override
  String get cubeRotations => 'Повороты';

  @override
  String get play => 'Воспроизвести';

  @override
  String get pause => 'Пауза';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хода',
      many: '$count ходов',
      few: '$count хода',
      one: '$count ход',
      zero: 'Нет ходов',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Собран';

  @override
  String get scrambled => 'Запутан';

  @override
  String get orbitHint =>
      'Потяните ряд, чтобы повернуть его · Потяните фон, чтобы вращать вид';

  @override
  String get notationPad => 'Панель нотации';

  @override
  String get solve => 'Собрать';

  @override
  String get solving => 'Сборка…';

  @override
  String get solveFast => 'Быстрая сборка';

  @override
  String get solveLearn => 'Учиться шаг за шагом';

  @override
  String get solveModeGuided => 'С подсказками (3 слоя)';

  @override
  String get solveModeFast => 'Быстро (оптимально)';

  @override
  String solveUnavailable(int size) {
    return 'Решатель $size×$size появится в следующем обновлении.';
  }

  @override
  String get solveAlreadySolved => 'Кубик уже собран.';

  @override
  String solveFailed(String reason) {
    return 'Этот кубик невозможно собрать ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'Модуль сборки недоступен на этом устройстве.';

  @override
  String get solveComplete => 'Собрано! Отличная работа.';

  @override
  String solveSummary(int count) {
    return 'Ходов: $count';
  }

  @override
  String get nextMove => 'Следующий ход';

  @override
  String get previousMove => 'Предыдущий ход';

  @override
  String get halfTurnHalfway =>
      'Отлично, полпути позади! Поверните слой ещё раз в ту же сторону — получится двойной поворот (180°).';

  @override
  String get wideTurnInner =>
      'Здорово! Теперь проведите соседний внутренний слой, чтобы завершить широкий ход.';

  @override
  String get wideTurnOuter =>
      'Здорово! Теперь проведите соседний внешний слой, чтобы завершить широкий ход.';

  @override
  String get wideTurnMore =>
      'Здорово! Проводите слои по одному, следуя стрелке, чтобы завершить широкий ход.';

  @override
  String get guideSwipeHint =>
      'Проведите слой, на который указывает стрелка, в её направлении или нажмите «Далее».';

  @override
  String get guideRotateHint =>
      'Поверните весь кубик, как показывает стрелка, и нажмите «Далее».';

  @override
  String get guideWrongMove => 'Следуйте за подсвеченной стрелкой';

  @override
  String get guideExit => 'Выйти из подсказок';

  @override
  String get colorWhite => 'белый';

  @override
  String get colorYellow => 'жёлтый';

  @override
  String get colorGreen => 'зелёный';

  @override
  String get colorBlue => 'синий';

  @override
  String get colorRed => 'красный';

  @override
  String get colorOrange => 'оранжевый';

  @override
  String get phaseOptimal2x2 => 'Оптимальное решение';

  @override
  String get phaseKociemba1 => 'Фаза 1 · Ориентация деталей';

  @override
  String get phaseKociemba2 => 'Фаза 2 · Завершение';

  @override
  String get phaseLblCross => 'Белый крест';

  @override
  String get phaseLblCorners => 'Углы первого слоя';

  @override
  String get phaseLblMiddle => 'Рёбра среднего слоя';

  @override
  String get phaseLblYellowCross => 'Жёлтый крест';

  @override
  String get phaseLblYellowEdges => 'Выравнивание рёбер жёлтого креста';

  @override
  String get phaseLblYellowCorners => 'Расстановка жёлтых углов';

  @override
  String get phaseLblYellowCornersOrient => 'Ориентация жёлтых углов';

  @override
  String get crownFirst => 'Первый слой';

  @override
  String get crownSecond => 'Второй слой';

  @override
  String get crownThird => 'Третий слой';

  @override
  String get crownFirstGoal => 'Белая грань и первый слой';

  @override
  String get crownSecondGoal => 'Средний слой';

  @override
  String get crownThirdGoal => 'Жёлтая грань и последний слой';

  @override
  String get subStepGoal11 =>
      'Соберите белый крест, в котором каждое белое ребро совпадает и с соседним центром.';

  @override
  String get subStepGoal12 =>
      'Поставьте 4 белых угла на их места и закончите белую грань и весь первый слой.';

  @override
  String get subStepGoal21 =>
      'Поставьте 4 ребра среднего слоя, не разрушая первый слой.';

  @override
  String get subStepGoal31 => 'Соберите жёлтый крест на последнем слое.';

  @override
  String get subStepGoal32 =>
      'Меняйте рёбра жёлтого креста местами, пока каждое не совпадёт со своим боковым центром.';

  @override
  String get subStepGoal33 =>
      'Поставьте 4 жёлтых угла на правильные места, даже если они ещё повёрнуты.';

  @override
  String get subStepGoal34 =>
      'Поворачивайте каждый жёлтый угол на месте, пока все наклейки не совпадут и кубик не будет собран.';

  @override
  String get explainOptimal2x2 =>
      'Самое короткое возможное решение, найденное перебором всех позиций 2×2.';

  @override
  String get explainKociemba1 =>
      'Сориентируйте все детали и соберите рёбра среднего слоя в средний слой.';

  @override
  String get explainKociemba2 =>
      'Завершите только ходами U, D и полуоборотами — они сохраняют эту ориентацию.';

  @override
  String get explainLblOrient =>
      'Поверните весь кубик так, чтобы белый центр смотрел вниз.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Опустите ребро $piece вниз к белому центру так, чтобы боковой цвет совпал.';
  }

  @override
  String explainLblDaisyPetal(String piece) {
    return 'Ромашка: поднимите ребро $piece наверх вокруг жёлтого центра, белым вверх, — это лепесток.';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return 'Крутите верхний слой, пока лепесток $piece не окажется прямо над центром своего бокового цвета.';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return 'Поверните эту грань дважды (180°), чтобы опустить ребро $piece к белому центру: ещё один луч белого креста.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'Угол $piece застрял не на своём месте. Поднимите его наверх с помощью R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Вращайте верхний слой, пока угол $piece не окажется над своим местом.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Повторяйте R U R\' U\', пока угол $piece не встанет на место.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'Ребро $piece стоит в среднем слое, но неправильно. Выведите его наверх.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Поверните верхний слой, чтобы боковой цвет ребра $piece совпал с его центром.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Вставьте ребро $piece вправо: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Вставьте ребро $piece влево: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Поверните верхний слой, чтобы расположить жёлтую фигуру для следующего алгоритма.';

  @override
  String get explainLblYellowCrossAlg =>
      'Соберите жёлтый крест: F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Поверните верхний слой, чтобы совместить жёлтые рёбра с их центрами.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Поменяйте жёлтые рёбра местами: R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Переставьте жёлтые углы на свои места: U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Поверните верхний слой, чтобы привести следующий несобранный жёлтый угол вперёд-вправо.';

  @override
  String get explainLblCornerTwist =>
      'Повторяйте R\' D\' R D, пока жёлтый цвет не окажется сверху. Низ сам восстановится в конце.';

  @override
  String get explainLblFinalAlign =>
      'Поверните верхний слой, чтобы завершить сборку.';

  @override
  String scanTitle(int size) {
    return 'Сканирование $size×$size';
  }

  @override
  String get scanManualInput => 'Ввести цвета вручную';

  @override
  String get scanUseCamera => 'Сканировать камерой';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Грань $current из $total';
  }

  @override
  String get faceUp => 'Верхняя грань';

  @override
  String get faceRight => 'Правая грань';

  @override
  String get faceFront => 'Передняя грань';

  @override
  String get faceDown => 'Нижняя грань';

  @override
  String get faceLeft => 'Левая грань';

  @override
  String get faceBack => 'Задняя грань';

  @override
  String get scanHintFront =>
      'Держите кубик любой гранью к себе. Это передняя грань: не меняйте верхнюю грань во время сканирования.';

  @override
  String get scanHintRight =>
      'От передней грани поверните весь кубик один раз влево, чтобы к вам смотрела правая грань.';

  @override
  String get scanHintBack =>
      'От передней грани поверните весь кубик два раза влево.';

  @override
  String get scanHintLeft =>
      'От передней грани поверните весь кубик один раз вправо.';

  @override
  String get scanHintUp =>
      'От передней грани наклоните верх к себе, чтобы он смотрел в камеру.';

  @override
  String get scanHintDown =>
      'От передней грани наклоните низ к себе, чтобы он смотрел в камеру.';

  @override
  String get scanAlignHint =>
      'Заполните сетку гранью и нажмите на кнопку съёмки.';

  @override
  String get scanCapture => 'Снять грань';

  @override
  String get scanTurnLeft => 'Поверните весь кубик влево';

  @override
  String get scanTurnRight => 'Поверните весь кубик вправо';

  @override
  String get scanTipTop => 'Наклоните верх к себе';

  @override
  String get scanTipBottom => 'Наклоните низ к себе';

  @override
  String get scanGlareTip =>
      'Обнаружен блик: слегка наклоните кубик или держите телефон над ним, чтобы закрыть верхний свет.';

  @override
  String get scanDimTip =>
      'Слишком темно: перейдите туда, где светлее, или включите фонарик.';

  @override
  String get scanTorch => 'Фонарик';

  @override
  String get scanGuideLabel =>
      'Подсказка сканирования: отсканированные грани показаны в цвете. Нажмите на отсканированную грань, чтобы отсканировать её заново.';

  @override
  String get scanTapToRescan =>
      'Нажмите на отсканированную грань, чтобы отсканировать её заново.';

  @override
  String get scanCameraMissing => 'На этом устройстве не найдена камера.';

  @override
  String get scanCameraDenied =>
      'Доступ к камере запрещён. Цвета по-прежнему можно ввести вручную.';

  @override
  String get scanCameraFailed => 'Не удалось запустить камеру.';

  @override
  String get scanAllGood => 'Все наклейки выглядят правильно.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count наклейки выглядят неверно',
      many: '$count наклеек выглядят неверно',
      few: '$count наклейки выглядят неверно',
      one: '$count наклейка выглядит неверно',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Что-то не сходится';

  @override
  String scanIssueColors(int count) {
    return 'Каждый цвет должен встречаться ровно $count раз.';
  }

  @override
  String get scanIssueCenters => 'У двух центров одинаковый цвет.';

  @override
  String get scanIssuePieces =>
      'Эти наклейки образуют детали, которых нет на настоящем кубике.';

  @override
  String get scanIssueTwist => 'Один угол повёрнут. Проверьте наклейки углов.';

  @override
  String get scanIssueFlip =>
      'Одно ребро перевёрнуто. Проверьте наклейки рёбер.';

  @override
  String get scanIssueParity => 'Похоже, две детали поменялись местами.';

  @override
  String get scanIssueUnavailable =>
      'Проверка цветов недоступна на этом устройстве.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count наклейки было трудно распознать — взгляните на них.',
      many: '$count наклеек было трудно распознать — взгляните на них.',
      few: '$count наклейки было трудно распознать — взгляните на них.',
      one: '$count наклейку было трудно распознать — взгляните на неё.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Нажмите на наклейку, чтобы сменить цвет · Удерживайте для палитры';

  @override
  String get scanRescanFace => 'Пересканировать грань';

  @override
  String get scanCancelRescan => 'Назад к цветам';

  @override
  String get scanPaletteTitle => 'Выберите цвет';

  @override
  String get scanOpen3d => 'Открыть в 3D';

  @override
  String get scanRestart => 'Начать заново';

  @override
  String get modeTimer => 'Таймер';

  @override
  String get modeTimerDesc => 'Скрамблы, инспекция, средние и личные рекорды.';

  @override
  String get modeDaily => 'Задание дня';

  @override
  String get modeDailyDesc => 'Новый скрамбл каждый день. Не прерывайте серию.';

  @override
  String get modePatterns => 'Библиотека узоров';

  @override
  String get modePatternsDesc => 'Шахматка, суперфлип и другие — в 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Серия: $count дня',
      many: 'Серия: $count дней',
      few: 'Серия: $count дня',
      one: 'Серия: $count день',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Продолжить обучение';

  @override
  String get startLearning => 'Начать обучение';

  @override
  String lessonOf(int index, int total) {
    return 'Урок $index из $total';
  }

  @override
  String get academyAllDone => 'Все уроки пройдены!';

  @override
  String get academyTitle => 'Академия';

  @override
  String academyProgress(int done, int total) {
    return 'Пройдено уроков: $done из $total';
  }

  @override
  String get lessonAdvanced => 'Продвинутый';

  @override
  String lessonPartOf(int index, int total) {
    return 'Часть $index из $total';
  }

  @override
  String get lessonNext => 'Далее';

  @override
  String get lessonPrevious => 'Назад';

  @override
  String get lessonFinish => 'Завершить урок';

  @override
  String get lessonComplete => 'Урок пройден!';

  @override
  String get lessonNextLesson => 'Следующий урок';

  @override
  String get lessonBackToAcademy => 'Вернуться в Академию';

  @override
  String get lessonTryIt =>
      'Ваша очередь: проведите слой, указанный стрелкой, или нажмите «Далее».';

  @override
  String get lessonLookAround =>
      'Потяните фон, чтобы осмотреть кубик со всех сторон.';

  @override
  String get lessonDemoDone => 'Отлично! Нажмите «Далее», чтобы продолжить.';

  @override
  String holdPrompt(String top, String front) {
    return 'Держите кубик так: центр «$top» сверху, центр «$front» к вам.';
  }

  @override
  String get trackBeginner => '3×3 для новичков: послойная сборка';

  @override
  String get trackCfop => 'Введение в CFOP';

  @override
  String get trackTwoByTwo => '2×2: для начинающих и Ortega';

  @override
  String get trackBigCubes => 'Большие кубики: редукция и паритет';

  @override
  String moveSentence(String layer, String direction) {
    return 'Поверните $layer $direction';
  }

  @override
  String get moveFaceR => 'правую грань';

  @override
  String get moveFaceL => 'левую грань';

  @override
  String get moveFaceU => 'верхнюю грань';

  @override
  String get moveFaceD => 'нижнюю грань';

  @override
  String get moveFaceF => 'переднюю грань';

  @override
  String get moveFaceB => 'заднюю грань';

  @override
  String moveLayerInner(int depth, String face) {
    return 'слой $depth, считая от грани: $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face (на глубину $depth слоёв)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'слои $near–$far, считая от грани: $face';
  }

  @override
  String get moveLayerMiddle => 'средний слой';

  @override
  String get moveDirUp => 'вверх';

  @override
  String get moveDirDown => 'вниз';

  @override
  String get moveDirLeft => 'влево';

  @override
  String get moveDirRight => 'вправо';

  @override
  String get moveDirClockwise => 'по часовой стрелке';

  @override
  String get moveDirCounter => 'против часовой стрелки';

  @override
  String get moveDirBackClockwise => 'по часовой стрелке, если смотреть сзади';

  @override
  String get moveDirBackCounter =>
      'против часовой стрелки, если смотреть сзади';

  @override
  String get moveDirHalf => 'на пол-оборота (дважды)';

  @override
  String get moveRotateX => 'Наклоните весь кубик: перед уходит наверх';

  @override
  String get moveRotateXPrime => 'Наклоните весь кубик: перед уходит вниз';

  @override
  String get moveRotateX2 => 'Переверните весь кубик: перед уходит назад';

  @override
  String get moveRotateY => 'Поверните весь кубик: перед уходит влево';

  @override
  String get moveRotateYPrime => 'Поверните весь кубик: перед уходит вправо';

  @override
  String get moveRotateY2 =>
      'Поверните весь кубик на пол-оборота: зад оказывается спереди';

  @override
  String get moveRotateZ =>
      'Перекатите весь кубик по часовой стрелке: верх уходит вправо';

  @override
  String get moveRotateZPrime =>
      'Перекатите весь кубик против часовой стрелки: верх уходит влево';

  @override
  String get moveRotateZ2 =>
      'Переверните весь кубик вверх дном: верх уходит вниз';

  @override
  String get phaseReductionCenters => 'Центры';

  @override
  String get phaseReductionEdges => 'Сборка рёбер';

  @override
  String get phaseReductionEdgeParity => 'Паритет рёбер';

  @override
  String get phaseReductionOllParity => 'OLL-паритет';

  @override
  String get phaseReductionPllParity => 'PLL-паритет';

  @override
  String get explainReductionCenterBlock =>
      'Повороты срезов, которые ставят на место сразу несколько центральных деталей.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Переместите центральную деталь «$piece» на её грань 3-циклом, не трогая готовые центры.';
  }

  @override
  String get explainReductionParityCenters =>
      'Восстановите центры, сдвинутые поворотом паритета.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Соедините части ребра $piece 3-циклом; центры остаются собранными.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Последние рёбра нельзя собрать одними 3-циклами (паритет рёбер). Это исправляет один поворот внутреннего среза.';

  @override
  String get explainReductionOllParity =>
      'OLL-паритет: одно ребро перевёрнуто, что невозможно на 3×3. Этот алгоритм переворачивает его обратно.';

  @override
  String get explainReductionPllParity =>
      'PLL-паритет: два ребра поменялись местами, что невозможно на 3×3. Этот алгоритм меняет их обратно.';

  @override
  String get patternsTitle => 'Библиотека узоров';

  @override
  String get patternsHint =>
      'Нажмите на узор, чтобы посмотреть его, а затем повторите на своём кубике.';

  @override
  String get patternCheckerboard => 'Шахматка';

  @override
  String get patternCubeInCube => 'Куб в кубе';

  @override
  String get patternSuperflip => 'Суперфлип';

  @override
  String get patternDots => 'Точки';

  @override
  String get patternCross => 'Крест';

  @override
  String get patternPython => 'Питон';

  @override
  String get phasePattern => 'Собрать узор';

  @override
  String get explainPatternStep =>
      'Повторяйте каждый ход на своём кубике. Нажмите «Собрать», чтобы вернуть его в исходное состояние.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Таймер';

  @override
  String get timerHoldToStart => 'Удерживайте и отпустите для старта';

  @override
  String get timerReleaseToStart => 'Отпустите для старта';

  @override
  String get timerTapToStop => 'Коснитесь экрана, чтобы остановить';

  @override
  String get timerInspectionToggle => 'Инспекция 15 с';

  @override
  String get timerLoadingScramble => 'Создаём скрамбл…';

  @override
  String get timerPb => 'Рекорд';

  @override
  String get timerSolves => 'Сборки';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Удалить';

  @override
  String get timerHistory => 'История';

  @override
  String get timerNoSolves => 'Сборок пока нет. Запутайте кубик — и вперёд!';

  @override
  String get timerNewPb => 'Новый личный рекорд!';

  @override
  String get timerClearHistory => 'Очистить историю';

  @override
  String get timerScrambleHint =>
      'Белый сверху, зелёный спереди, затем запутайте:';

  @override
  String get dailyTitle => 'Задание дня';

  @override
  String dailyFor(String date) {
    return 'Задание на $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Лучшая серия: $count';
  }

  @override
  String get dailyDone => 'На сегодня всё! Возвращайтесь завтра.';

  @override
  String get dailyNotDone =>
      'Соберите сегодняшний скрамбл, чтобы сохранить серию.';

  @override
  String get dailySolveVirtual => 'Собрать на 3D-кубике';

  @override
  String get dailyTimeIt => 'Засечь время на своём кубике';

  @override
  String get dailyHint => 'Подсказка';

  @override
  String dailyHintText(String moves) {
    return 'Начните с белого креста: $moves';
  }

  @override
  String get dailyHintFailed => 'Сейчас подсказка недоступна.';

  @override
  String get lessonBasics => 'Знакомство с кубиком';

  @override
  String get lessonBasicsDesc => 'Детали, грани и названия ходов.';

  @override
  String get stepBasicsPieces => 'Три вида деталей';

  @override
  String get stepBasicsPiecesBody =>
      'Центры никогда не двигаются и задают цвет каждой грани. У рёбер два цвета, у углов — три. Собрать кубик — значит поставить каждое ребро и каждый угол рядом с центрами тех же цветов.';

  @override
  String get stepBasicsFaces => 'Шесть букв граней';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F и B — это правая, левая, верхняя, нижняя, передняя и задняя грани. Буква без значков означает четверть оборота по часовой стрелке, если смотреть прямо на эту грань.';

  @override
  String get stepBasicsPrime => 'Обратные и двойные ходы';

  @override
  String get stepBasicsPrimeBody =>
      'Апостроф (R\') — поворот в другую сторону, против часовой стрелки. Двойка (U2) — пол-оборота, то есть две четверти.';

  @override
  String get stepCrossGoal => 'Цель';

  @override
  String get stepCrossGoalBody =>
      'Держите жёлтый сверху и зелёный к себе. Сначала соберите четыре белых ребра вокруг жёлтого центра белым вверх, как лепестки: это ромашка. Потом каждый лепесток опускается к белому центру так, чтобы его боковой цвет совпал с центром рядом.';

  @override
  String get stepCrossTop => 'Ребро сверху';

  @override
  String get stepCrossTopBody =>
      'Белое ребро сверху белым вверх — лепесток ромашки. Крутите верхний слой, пока его боковой цвет не окажется прямо над центром того же цвета, затем поверните эту грань дважды (180°), чтобы опустить его к белому центру.';

  @override
  String get stepCrossMiddle => 'Ребро в среднем слое';

  @override
  String get stepCrossMiddleBody =>
      'Ребро, застрявшее в среднем слое, сначала поднимается: его сторону вверх, верх в сторону, сторону обратно — так поставленные детали не сдвинутся. Теперь это лепесток сверху: выровняйте его и поверните грань дважды.';

  @override
  String get stepCornersInsert => 'Над своим местом';

  @override
  String get stepCornersInsertBody =>
      'Крутите верх, пока белый угол не встанет прямо над своим местом, между двумя центрами его боковых цветов. Здесь хватает одного поворота верха и R U\' R\': U ставит угол над местом, а R U\' R\' вводит его белым вниз.';

  @override
  String get stepCornersRepeat => 'Повторяйте триггер';

  @override
  String get stepCornersRepeatBody =>
      'Держите место спереди справа и повторяйте R U R\' U\', пока белый не окажется внизу: один раз, если белый смотрит вправо, три — если вверх, пять — если на вас. Верх тем временем путается; это пройдёт само.';

  @override
  String get stepMiddleRight => 'Ребро вправо';

  @override
  String get stepMiddleRightBody =>
      'Найдите верхнее ребро без жёлтого. Крутите верх, пока его передний цвет не совпадёт с центром перед вами. Если верхний цвет совпадает с правым центром, отправьте ребро вправо: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Ребро влево';

  @override
  String get stepMiddleLeftBody =>
      'Если верхний цвет совпадает с левым центром, используйте зеркальный алгоритм: U\' L\' U L U F U\' F\'. Белый слой каждый раз возвращается целым.';

  @override
  String get stepYellowCross => 'Один алгоритм';

  @override
  String get stepYellowCrossBody =>
      'Смотрите только на жёлтые рёбра сверху. Галку держите сзади слева, палку — слева направо, затем F R U R\' U\' F\'. Палке нужен один раз, галке — два, точке — до трёх.';

  @override
  String get stepYellowEdges => 'Совместите рёбра';

  @override
  String get stepYellowEdgesBody =>
      'Крутите верх, пока два ребра не совпадут со своими центрами. Когда одно сзади, а другое справа, R U R\' U R U2 R\' U меняет местами переднее и левое рёбра.';

  @override
  String get stepPlaceCorners => 'Расставьте';

  @override
  String get stepPlaceCornersBody =>
      'Угол на месте, если его цвета совпадают с тремя центрами вокруг, даже если он повёрнут. Держите такой угол спереди справа: U R U\' L\' U R\' U\' L переставит три других по кругу. Повторяйте, пока все четыре не встанут.';

  @override
  String get stepTwistCorners => 'Разверните';

  @override
  String get stepTwistCornersBody =>
      'С несобранным углом спереди справа повторяйте R\' D\' R D парами, пока жёлтый не окажется сверху, затем крутите только верх, чтобы подвести следующий. Низ выглядит сломанным до последнего угла: продолжайте.';

  @override
  String get lessonCfopIntro => 'Что такое CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Крест, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Четыре этапа';

  @override
  String get stepCfopOverviewBody =>
      'Спидкуберы собирают крест, затем соединяют каждый угол первого слоя с его средним ребром (F2L), ориентируют последний слой (OLL) и наконец переставляют его детали (PLL).';

  @override
  String get stepCfopCross => 'Спланируйте крест';

  @override
  String get stepCfopCrossBody =>
      'В CFOP крест продумывают во время инспекции и собирают внизу примерно за восемь ходов.';

  @override
  String get lessonF2l => 'Основы F2L';

  @override
  String get lessonF2lDesc => 'Соедините угол с его ребром.';

  @override
  String get stepF2lRight => 'Вставьте пару';

  @override
  String get stepF2lRightBody =>
      'Когда угол и его ребро стоят рядом наверху, подведите их к своему слоту и вставьте вместе.';

  @override
  String get stepF2lLeft => 'Пара слева';

  @override
  String get stepF2lLeftBody =>
      'Тот же случай с другой стороны — зеркальный: U\' L\' U L. Поворот кубика (y) позволяет работать более удобной рукой.';

  @override
  String get lessonOll => 'OLL в два этапа';

  @override
  String get lessonOllDesc => 'Сделайте верх жёлтым.';

  @override
  String get stepOllCross => 'Сначала рёбра';

  @override
  String get stepOllCrossBody =>
      'Двухэтапный OLL начинается с уже знакомого вам алгоритма жёлтого креста.';

  @override
  String get stepOllSune => 'Суне';

  @override
  String get stepOllSuneBody =>
      'Когда один жёлтый угол смотрит вверх спереди слева, Суне (R U R\' U R U2 R\') ориентирует остальные три. Большинство других случаев решаются Суне и его зеркальным вариантом.';

  @override
  String get lessonPll => 'PLL в два этапа';

  @override
  String get lessonPllDesc => 'Завершите сборку.';

  @override
  String get stepPllT => 'T-перм';

  @override
  String get stepPllTBody =>
      'T-перм меняет местами два угла и два ребра. Используйте его для расстановки углов: держите справа два угла, которые нужно поменять.';

  @override
  String get stepPllU => 'U-перм';

  @override
  String get stepPllUBody =>
      'Когда углы готовы, U-перм переставляет три ребра по кругу. Держите собранную сторону сзади.';

  @override
  String get lessonTwoFirst => 'Первый слой 2×2';

  @override
  String get lessonTwoFirstDesc => 'Соберите грань с совпадающими углами.';

  @override
  String get stepTwoIntro => 'Только углы';

  @override
  String get stepTwoIntroBody =>
      '2×2 — это только восемь углов: ни рёбер, ни центров. Соберите белый слой внизу так, чтобы боковые цвета соседей совпадали, и закончите одним путём: рыбка для жёлтого верха, затем T-perm или Y-perm.';

  @override
  String get stepTwoCorner => 'Вставьте углы';

  @override
  String get stepTwoCornerBody =>
      'Как белые углы на 3×3: подведите угол к пустому месту спереди справа и вставьте его — здесь ходами U R U\' R\' или повторяя R U R\' U\', пока белый не окажется внизу. Сверьте боковые цвета с соседом.';

  @override
  String get lessonTwoOll => 'Ориентация верха';

  @override
  String get lessonTwoOllDesc => 'OLL по Ortega с Суне.';

  @override
  String get stepTwoSune => 'Снова Суне';

  @override
  String get stepTwoSuneBody =>
      'Посчитайте жёлтые стикеры, смотрящие вверх. Единственный угол с жёлтым вверх держите спереди слева и делайте рыбку (R U R\' U R U2 R\'). Пересчитайте и перехватите; максимум три рыбки. Между ними крутите только верх.';

  @override
  String get lessonTwoPbl => 'Перестановка обоих слоёв';

  @override
  String get lessonTwoPblDesc => 'Поменяйте углы местами, чтобы закончить.';

  @override
  String get stepTwoAdjacent => 'Соседний обмен';

  @override
  String get stepTwoAdjacentBody =>
      'Фары — два одинаковых верхних стикера на одной стороне. Крутите верх, пока фары не окажутся слева: тогда два угла для обмена справа. Сделайте T-perm.';

  @override
  String get stepTwoDiagonal => 'Диагональный обмен';

  @override
  String get stepTwoDiagonalBody =>
      'Фар нет ни на одной стороне — значит, меняются два угла по диагонали: сделайте Y-perm с любой стороны и поверните верх, чтобы всё выровнять.';

  @override
  String get lessonBigIntro => 'Детали больших кубиков';

  @override
  String get lessonBigIntroDesc => 'Центры, крылья и срезы.';

  @override
  String get stepBigPieces => 'Нет неподвижных центров';

  @override
  String get stepBigPiecesBody =>
      'На 4×4 у каждой грани четыре подвижных центральных детали, а каждое ребро — два крыла. Неподвижных центров нет, поэтому проверьте порядок цветов по углу: белый напротив жёлтого, синий — зелёного, красный — оранжевого.';

  @override
  String get stepBigSlices => 'Широкие и внутренние ходы';

  @override
  String get stepBigSlicesBody =>
      'Rw поворачивает два правых слоя вместе. 2R поворачивает только второй слой справа. Эти ходы перемещают центры и крылья.';

  @override
  String get lessonBigCenters => 'Центры';

  @override
  String get lessonBigCentersDesc => 'Соберите центральные детали.';

  @override
  String get stepBigCenterCycle => '3-цикл центров';

  @override
  String get stepBigCenterCycleBody =>
      'Этот коммутатор двигает ровно три центральные детали и не трогает остальное, так что готовые центры остаются готовыми. Используйте его, когда одна деталь не встаёт в полоску.';

  @override
  String get lessonBigEdges => 'Сборка рёбер';

  @override
  String get lessonBigEdgesDesc => 'Соедините крылья в целые рёбра.';

  @override
  String get stepBigEdgePair => 'Соединить и восстановить';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' выстраивает два одинаковых крыла, R U R\' F R\' F\' R подставляет несобранное ребро, а Uw возвращает центры. Всегда закрывайте открытый слой.';

  @override
  String get lessonBigParity => 'Паритет';

  @override
  String get lessonBigParityDesc => 'OLL- и PLL-паритет на чётных кубиках.';

  @override
  String get stepBigOllParity => 'OLL-паритет';

  @override
  String get stepBigOllParityBody =>
      'Одно перевёрнутое ребро на 3×3 невозможно: это паритет OLL, а не ошибка. Держите его спереди в верхнем слое и выполните длинный алгоритм. Он ещё меняет местами левое и правое верхние рёбра и два угла; это исправят последние шаги 3×3.';

  @override
  String get stepBigPllParity => 'PLL-паритет';

  @override
  String get stepBigPllParityBody =>
      'В самом конце два ребра переставлены, и ни один алгоритм 3×3 не подходит? Это паритет PLL. Держите их спереди и сзади в верхнем слое: 2R2 U2 2R2 Uw2 2R2 2U2 меняет их местами.';

  @override
  String get introGoalHeading => 'Какая цель?';

  @override
  String get introHowHeading => 'Как это сделать?';

  @override
  String get introHoldHeading => 'Как держать';

  @override
  String get introWhyHeading => 'Почему это работает';

  @override
  String get introStart => 'Понятно, начать по шагам';

  @override
  String get introDontShowAgain => 'Больше не показывать автоматически';

  @override
  String get introShowGoal => 'Показать цель';

  @override
  String get introStateStart => 'Начало';

  @override
  String get introStateGoal => 'Цель';

  @override
  String get introPlayMorph => 'Проиграть от начала до цели';

  @override
  String get introGoalBasics =>
      'Научитесь читать кубик: его детали, шесть граней и то, как их поворачивают буквы ходов.';

  @override
  String get introGoalCross =>
      'Соберите внизу белый крест, где каждое белое ребро совпадает и с центром рядом.';

  @override
  String get introGoalCorners =>
      'Поставьте четыре белых угла, чтобы собрать весь первый слой: белая грань и совпадающие боковые цвета.';

  @override
  String get introGoalMiddle =>
      'Поставьте четыре ребра среднего слоя, чтобы первые два слоя были собраны.';

  @override
  String get introGoalYellowCross =>
      'Соберите жёлтый крест сверху; боковые цвета пока могут не совпадать.';

  @override
  String get introGoalYellowEdges =>
      'Совместите каждое ребро жёлтого креста с цветом центра на его стороне.';

  @override
  String get introGoalYellowCorners =>
      'Переставьте каждый жёлтый угол на своё место, даже если он ещё повёрнут.';

  @override
  String get introGoalTwistCorners =>
      'Поверните жёлтые углы правильными цветами — и весь кубик собран.';

  @override
  String get introGoalCfopIntro =>
      'Узнайте план спидкубинга: крест, первые два слоя, затем последний слой в два этапа.';

  @override
  String get introGoalF2l =>
      'Ставьте каждый белый угол вместе с его средним ребром и собирайте два слоя сразу.';

  @override
  String get introGoalOll => 'Сделайте весь верх жёлтым за один-два алгоритма.';

  @override
  String get introGoalPll =>
      'Расставьте детали последнего слоя по местам и закончите кубик.';

  @override
  String get introGoalTwoFirst =>
      'Соберите один полный белый слой на кубике 2×2.';

  @override
  String get introGoalTwoOll => 'Сделайте всю верхнюю грань кубика 2×2 жёлтой.';

  @override
  String get introGoalTwoPbl =>
      'Поставьте последние углы на места одной T-perm или Y-perm и выровняйте верх, чтобы собрать 2×2.';

  @override
  String get introGoalBigIntro =>
      'Познакомьтесь с 4×4: центры, пары рёбер и углы, а также ходы, которые их поворачивают.';

  @override
  String get introGoalBigCenters =>
      'Соберите центральные детали каждой грани в один одноцветный блок.';

  @override
  String get introGoalBigEdges =>
      'Соедините одинаковые реберные детали, чтобы каждое ребро выглядело как одно ребро 3×3.';

  @override
  String get introGoalBigParity =>
      'Исправьте два случая 4×4, которых не бывает на 3×3: одно перевёрнутое ребро (паритет OLL) или два переставленных ребра (паритет PLL).';

  @override
  String get introHowBasics =>
      'Центры никогда не двигаются, поэтому они задают цвет каждой грани.\nКаждая буква поворачивает одну грань на четверть оборота по часовой стрелке.\nАпостроф (\') поворачивает обратно, а 2 — дважды.';

  @override
  String get introHoldBasics =>
      'Как удобно: центры не двигаются, поэтому цвета всегда подскажут, где какая грань.';

  @override
  String get introWhyBasics =>
      'Любой алгоритм — просто ряд этих букв, поэтому умение их читать — первый навык.';

  @override
  String get introHowCross =>
      'Поднимите каждое белое ребро наверх, белым вверх, вокруг жёлтого центра: это ромашка.\nКрутите верхний слой, пока боковой цвет лепестка не окажется над своим центром.\nПоверните эту грань дважды, чтобы опустить лепесток; так со всеми четырьмя.';

  @override
  String get introHoldCross =>
      'Жёлтый центр сверху, белый снизу на всём этапе. Чтобы выровнять лепесток, крутите верхний слой, а не кубик.';

  @override
  String get introWhyCross =>
      'Когда белый смотрит вверх, два поворота передней грани кладут ребро на белый центр белым вниз, и боковой цвет уже совпадает.';

  @override
  String get introHowCorners =>
      'Крутите верх, пока белый угол не окажется над своим пустым местом спереди справа.\nПовторяйте R U R\' U\': один раз, если белый смотрит вправо, три — если вверх, пять — если на вас.\nТо же с остальными тремя углами.';

  @override
  String get introHoldCorners =>
      'Белый снизу, жёлтый сверху. Угол спереди справа, прямо над своим местом.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' поднимает слот и возвращает его: каждый круг чуть поворачивает угол, пока белый не окажется внизу, а крест не ломается.';

  @override
  String get introHowMiddle =>
      'Найдите верхнее ребро без жёлтого и совместите его передний цвет с центром под ним.\nЕго верхний цвет подскажет, куда оно идёт: вправо или влево.\nВставьте его алгоритмом из 8 ходов; белый слой каждый раз возвращается.';

  @override
  String get introHoldMiddle =>
      'Белый снизу, жёлтый сверху. Ребро спереди, его передний цвет совпадает с центром под ним.';

  @override
  String get introWhyMiddle =>
      'Алгоритм отводит слот, вводит ребро и возвращает белый слой. Ребро с жёлтым — для верха, никогда не для середины.';

  @override
  String get introHowYellowCross =>
      'Смотрите только на жёлтые рёбра сверху: точка, галка или палка.\nГалку держите сзади слева, палку — слева направо и делайте F R U R\' U\' F\'.\nПалке нужен один раз, галке — два, точке — до трёх.';

  @override
  String get introHoldYellowCross =>
      'Белый снизу, жёлтый сверху. Галка сзади слева, палка слева направо; точка — как угодно.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' переворачивает по два верхних ребра, не трогая первые два слоя.';

  @override
  String get introHowYellowEdges =>
      'Крутите верх, пока два ребра не совпадут со своими центрами.\nДержите их сзади и справа и делайте R U R\' U R U2 R\' U.\nЕсли совпавшие рёбра напротив друг друга, сначала сделайте это один раз с любой стороны.';

  @override
  String get introHoldYellowEdges =>
      'Жёлтый сверху. Одно совпавшее ребро сзади, другое справа.';

  @override
  String get introWhyYellowEdges =>
      'Этот алгоритм двигает только верхние детали, поэтому первые два слоя всегда возвращаются.';

  @override
  String get introHowYellowCorners =>
      'Угол на месте, если его цвета совпадают с тремя центрами вокруг, даже если он повёрнут.\nДержите такой угол спереди справа.\nU R U\' L\' U R\' U\' L переставляет три других по кругу; повторяйте, пока все не встанут.';

  @override
  String get introHoldYellowCorners =>
      'Жёлтый сверху. Угол, который уже на месте, спереди справа; если такого нет — любой.';

  @override
  String get introWhyYellowCorners =>
      'Он переставляет три угла по кругу и оставляет угол спереди справа, так что каждый повтор ставит больше углов.';

  @override
  String get introHowTwistCorners =>
      'Держите несобранный угол спереди справа.\nПовторяйте R\' D\' R D парами, пока его жёлтый не посмотрит вверх.\nДля следующего крутите только верх; низ вернётся с последним углом.';

  @override
  String get introHoldTwistCorners =>
      'Жёлтый сверху, поворачиваемый угол спереди справа. Между углами крутите только верх, никогда не весь кубик.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D поворачивает угол и путает низ, но низ возвращается, когда все углы повёрнуты. Если остановиться посередине, он останется сломанным.';

  @override
  String get introHowCfopIntro =>
      'Крест: четыре ребра, которые планируют во время осмотра.\nF2L: каждый угол ставится вместе со своим ребром.\nOLL делает верх жёлтым, затем PLL расставляет детали по местам.';

  @override
  String get introHoldCfopIntro =>
      'Спидкуберы собирают крест снизу, чтобы видеть следующие детали прямо во время сборки.';

  @override
  String get introWhyCfopIntro =>
      'Угол и ребро вместе экономят много ходов, а узнавание случаев заменяет перебор.';

  @override
  String get introHowF2l =>
      'Найдите угол и подходящее к нему ребро в верхнем слое.\nСоедините их в пару над их слотом.\nВставьте пару за три-четыре хода.';

  @override
  String get introHoldF2l =>
      'Крест снизу. Слот пары спереди справа, в зеркальном случае спереди слева.';

  @override
  String get introWhyF2l =>
      'Собранная пара угол-ребро входит целиком, поэтому растут сразу два слоя, а не по одной детали.';

  @override
  String get introHowOll =>
      'Сначала жёлтый крест с помощью F R U R\' U\' F\'.\nЗатем сориентируйте углы, например «Суне».\nУзнавайте случай по видимому жёлтому узору.';

  @override
  String get introHoldOll =>
      'Жёлтый сверху. Для рыбки единственный угол с жёлтым вверх держите спереди слева.';

  @override
  String get introWhyOll =>
      'Разделение последнего слоя на ориентацию и перестановку держит число алгоритмов маленьким.';

  @override
  String get introHowPll =>
      'Верх уже полностью жёлтый.\nT-perm меняет углы, U-perm переставляет три ребра.\nСмотрите на боковые цвета, чтобы выбрать алгоритм.';

  @override
  String get introHoldPll =>
      'Жёлтый сверху. T-perm: фары слева. U-perm: собранная сторона сзади.';

  @override
  String get introWhyPll =>
      'Когда верх весь жёлтый, неверны только места деталей, и пара перестановок заканчивает кубик.';

  @override
  String get introHowTwoFirst =>
      'Выберите белый угол как опору, белым вниз.\nПриводите каждый следующий угол на место спереди справа.\nПовторяйте R U R\' U\', пока он не встанет с совпадающими боковыми цветами.';

  @override
  String get introHoldTwoFirst =>
      'Белый снизу. Пустое место спереди справа, его угол прямо над ним в верхнем слое.';

  @override
  String get introWhyTwoFirst =>
      'У 2×2 нет центров: первый поставленный угол задаёт цвета соседей, поэтому важны боковые цвета, а не только белый.';

  @override
  String get introHowTwoOll =>
      'Посчитайте углы с жёлтым вверх.\nЕсли такой один, держите его спереди слева и делайте рыбку: R U R\' U R U2 R\'.\nПересчитайте и повторите; не больше трёх раз.';

  @override
  String get introHoldTwoOll =>
      'Белый снизу, жёлтый сверху. Перед каждой рыбкой угол с жёлтым вверх спереди слева.';

  @override
  String get introWhyTwoOll =>
      'Рыбка поворачивает верхние углы, не ломая белый слой; пересчёт подсказывает, как держать дальше.';

  @override
  String get introHowTwoPbl =>
      'Ищите фары: два одинаковых верхних стикера на одной стороне.\nФары на одной стороне: поверните их влево и сделайте T-perm.\nФар нет: Y-perm с любой стороны, затем выровняйте верх.';

  @override
  String get introHoldTwoPbl =>
      'Белый снизу, жёлтый сверху. T-perm: фары слева. Y-perm: любая сторона к вам.';

  @override
  String get introWhyTwoPbl =>
      'Когда верх жёлтый, неверны только места углов: T-perm меняет двух соседей, Y-perm — два угла по диагонали.';

  @override
  String get introHowBigIntro =>
      'Фиксированных центров нет: четыре центральные детали образуют цвет грани.\nШирокие ходы вроде Rw поворачивают сразу два слоя.\nВнутренние ходы вроде 2R поворачивают только один внутренний слой.';

  @override
  String get introHoldBigIntro =>
      'Сначала как угодно: на 4×4 неподвижных центров нет, вы сами выбираете, где какой цвет.';

  @override
  String get introWhyBigIntro =>
      'Редукция объединяет центры и части рёбер, чтобы большой кубик собирался как 3×3.';

  @override
  String get introHowBigCenters =>
      'Сначала проверьте порядок цветов по углу.\nСоберите два противоположных центра, потом остальные четыре.\nВнутренние слои двигают центры; всегда возвращайте открытый слой.';

  @override
  String get introHoldBigCenters =>
      'Собираемая грань спереди, готовые центры слева и справа, чтобы не мешали.';

  @override
  String get introWhyBigCenters =>
      'Слой двигает центры, а его отмена возвращает готовые, поэтому меняется только нужная деталь.';

  @override
  String get introHowBigEdges =>
      'Найдите два крыла с одинаковыми двумя цветами.\nВыстройте их спереди и соедините ходом Uw\'.\nПодставьте несобранное ребро, и Uw вернёт центры.';

  @override
  String get introHoldBigEdges =>
      'Собираемое ребро в передних слоях; готовые рёбра припаркованы сверху и снизу.';

  @override
  String get introWhyBigEdges =>
      'Uw\' отводит центры, чтобы два крыла встретились; Uw возвращает их, и ваша работа цела.';

  @override
  String get introHowBigParity =>
      'Собирайте 4×4 как 3×3, пока не застрянете.\nОдно перевёрнутое ребро: длинный алгоритм паритета OLL.\nДва переставленных ребра: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'Последний слой сверху. Паритет OLL: перевёрнутое ребро спереди. Паритет PLL: переставленные рёбра спереди и сзади.';

  @override
  String get introWhyBigParity =>
      'Крылья могут попасть в положения, недоступные 3×3; эти алгоритмы крутят внутренние слои, чтобы отменить именно это.';

  @override
  String get dirFaceR => 'Правая сторона';

  @override
  String get dirFaceL => 'Левая сторона';

  @override
  String get dirFaceU => 'Верхний ряд';

  @override
  String get dirFaceD => 'Нижний ряд';

  @override
  String get dirFaceF => 'Передняя грань';

  @override
  String get dirFaceB => 'Задняя грань';

  @override
  String get dirMiddle => 'Средний слой';

  @override
  String get dirWholeCube => 'Весь кубик';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, слой $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, глубина $depth';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, слои $near–$far';
  }

  @override
  String get dirUp => 'Вверх';

  @override
  String get dirDown => 'Вниз';

  @override
  String get dirLeft => 'Влево';

  @override
  String get dirRight => 'Вправо';

  @override
  String get dirClockwise => 'По часовой стрелке';

  @override
  String get dirCounter => 'Против часовой стрелки';

  @override
  String get dirBackClockwise => 'По часовой, если смотреть сзади';

  @override
  String get dirBackCounter => 'Против часовой, если смотреть сзади';

  @override
  String get dirHalf => 'Двойной поворот (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Скрыть подробности';

  @override
  String get solveExpand => 'Показать подробности';

  @override
  String get dailyScrambleSteps => 'Запутывание по шагам';

  @override
  String get dailyScrambleGuide => '3D-гид по запутыванию';

  @override
  String get dailyShowMoves => 'Показать ходы текстом';

  @override
  String get dailyHideMoves => 'Скрыть текстовые ходы';

  @override
  String get dailyScrambleGuideTitle => 'Гид по запутыванию';

  @override
  String get phaseDailyScramble => 'Запутайте кубик дня';

  @override
  String get explainDailyScramble =>
      'Начните с собранного кубика: белый сверху, зелёный спереди — и повторяйте каждый поворот на настоящем кубике.';

  @override
  String get stageCenters => 'Собираем центральные блоки';

  @override
  String get stageEdges => 'Соединяем внешние и внутренние рёбра';

  @override
  String get stageParity => 'Исправляем паритет';

  @override
  String get stageCrown1 => 'Первый слой (белый)';

  @override
  String get stageCrown2 => 'Второй слой';

  @override
  String get stageCrown3 => 'Третий слой (жёлтый)';

  @override
  String get stageOrient => 'Ориентируем детали';

  @override
  String get stageFinish => 'Заканчиваем кубик';

  @override
  String get stageAsThree => 'Собираем как 3×3';

  @override
  String get stageTwoByTwo => 'Собираем 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Этап $number из $total: $title';
  }

  @override
  String get solveAllStagesDone => 'Все этапы пройдены. Отлично!';

  @override
  String get trackFiveByFive => '5×5 «Кубик Профессора»';

  @override
  String get trackSixBySix => 'Кубик 6×6';

  @override
  String get lessonFiveIntro => 'Знакомство с 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Неподвижные центры, полоски центров, средние рёбра и крылья.';

  @override
  String get introGoalFiveIntro =>
      'Знакомство с 5×5: неподвижные центры, полоски центров, средние рёбра и крылья.';

  @override
  String get introHowFiveIntro =>
      'Самая средняя деталь каждой грани никогда не двигается.\nКаждое ребро — это средняя деталь и два крыла.\nВнутренние слои двигают детали, не трогая наружную часть.';

  @override
  String get introHoldFiveIntro =>
      'Как удобно: на 5×5 середина каждой грани никогда не двигается и показывает её цвет.';

  @override
  String get introWhyFiveIntro =>
      'Неподвижные центры задают цветовую схему, поэтому центры нельзя собрать в неверном порядке.';

  @override
  String get lessonFiveCenters => 'Центры 5×5';

  @override
  String get lessonFiveCentersDesc =>
      'Собираем каждый центр из полосок по три.';

  @override
  String get introGoalFiveCenters =>
      'Соберите на каждой грани одноцветный центральный блок 3×3.';

  @override
  String get introHowFiveCenters =>
      'Начните с неподвижного центра: он задаёт цвет.\nСобирайте полоски по три и вставляйте их внутренним слоем.\nХод, который вводит полоску, заодно возвращает готовый центр.';

  @override
  String get introHoldFiveCenters =>
      'Собираемый центр спереди или сверху; готовые центры снизу, слева или справа.';

  @override
  String get introWhyFiveCenters =>
      'Слой внутрь, верх, слой обратно: слой, который вводит полоску, заодно возвращает готовые центры.';

  @override
  String get lessonFiveEdges => 'Рёбра 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Соединяем два крыла с их средним ребром.';

  @override
  String get introGoalFiveEdges =>
      'Соедините каждое среднее ребро с его двумя крыльями, чтобы все 12 рёбер выглядели цельными.';

  @override
  String get introHowFiveEdges =>
      'Подведите каждое крыло к его среднему ребру спереди.\nВнутренний слой вниз, подставьте несобранное ребро, слой обратно.\nДля последних рёбер: слой, переворот, слой.';

  @override
  String get introHoldFiveEdges =>
      'Собираемое ребро спереди; готовые рёбра хранятся в верхнем и нижнем слоях.';

  @override
  String get introWhyFiveEdges =>
      'Открыть и закрыть внутренний слой — это соединить крылья, а центры и отложенные рёбра вернутся.';

  @override
  String get lessonFiveSolve => 'Собираем 5×5 как 3×3';

  @override
  String get lessonFiveSolveDesc => 'Доберите слой за слоем, как 3×3.';

  @override
  String get introGoalFiveSolve =>
      'Соберите редуцированный 5×5 как 3×3, слой за слоем, только внешними поворотами.';

  @override
  String get introHowFiveSolve =>
      'Дальше только внешние повороты, иначе собранные рёбра развалятся.\nБелый крест и углы, средний слой, потом жёлтый слой.\nНеподвижные центры показывают цвет каждой грани.';

  @override
  String get introHoldFiveSolve =>
      'Цвет первого слоя снизу, как на 3×3; вставляемый угол спереди справа.';

  @override
  String get introWhyFiveSolve =>
      'Внутренние повороты снова разделили бы центры и рёбра; внешние двигают каждый блок как деталь 3×3.';

  @override
  String get lessonFiveParity => 'Паритет рёбер 5×5';

  @override
  String get lessonFiveParityDesc =>
      'Исправляем ребро с переставленными крыльями.';

  @override
  String get introGoalFiveParity =>
      'Исправьте единственное ребро, у которого переставлены два внешних крыла: это единственный паритет 5×5.';

  @override
  String get introHowFiveParity =>
      'Он выглядит как последнее ребро, которое кажется перевёрнутым.\nОдин раз выполните длинное исправление внутренними слоями.\nПаритета PLL на 5×5 нет.';

  @override
  String get introHoldFiveParity =>
      'Последний слой сверху, ребро с переставленными крыльями спереди в верхнем слое.';

  @override
  String get introWhyFiveParity =>
      'На 5×5 переставиться могут только два внешних крыла одного ребра, поэтому хватает одного алгоритма.';

  @override
  String get lessonSixIntro => 'Знакомство с 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Нет неподвижных центров, в каждом ребре четыре детали.';

  @override
  String get introGoalSixIntro =>
      'Знакомство с 6×6: шестнадцать центральных деталей на грани и четыре детали в ребре.';

  @override
  String get introHowSixIntro =>
      'Неподвижного центра нет: цвета вы выбираете при сборке.\nУ каждого ребра есть внешние и внутренние крылья.\nШирокие повороты двигают до трёх слоёв.';

  @override
  String get introHoldSixIntro =>
      'Сначала как угодно: как и у 4×4, у 6×6 нет неподвижных центров.';

  @override
  String get introWhySixIntro =>
      'Если вы собираете 4×4 и 5×5, то 6×6 — та же редукция с блоками крупнее.';

  @override
  String get lessonSixCenters => 'Центры 6×6';

  @override
  String get lessonSixCentersDesc =>
      'Собираем центры 4×4 из полосок по четыре.';

  @override
  String get introGoalSixCenters =>
      'Соберите на каждой грани одноцветный центральный блок 4×4.';

  @override
  String get introHowSixCenters =>
      'Сначала проверьте порядок цветов по углу: неподвижных центров нет.\nСобирайте полоски по четыре и сдвигайте их вместе.\nВ двух последних центрах двигайте по одной детали: слой, верх, отмена.';

  @override
  String get introHoldSixCenters =>
      'Собираемая грань спереди, готовые центры слева, справа или снизу.';

  @override
  String get introWhySixCenters =>
      'Полоски соединяются внутренними слоями, и каждый слой отменяется, поэтому готовые центры остаются целыми.';

  @override
  String get lessonSixEdges => 'Рёбра 6×6';

  @override
  String get lessonSixEdgesDesc => 'Собираем четыре детали каждого ребра.';

  @override
  String get introGoalSixEdges =>
      'Соберите четыре детали каждого ребра, чтобы у 6×6 было 12 цельных рёбер.';

  @override
  String get introHowSixEdges =>
      'Выстройте спереди внешние и внутренние крылья одного ребра.\nГлубокий широкий слой вводит и выводит ребро.\nНикогда не ломайте готовое ребро ради одной детали.';

  @override
  String get introHoldSixEdges =>
      'Собираемое ребро спереди; готовые рёбра припаркованы сверху и снизу.';

  @override
  String get introWhySixEdges =>
      'Глубокий широкий поворот отводит центры, чтобы крылья встретились, и потом возвращает их.';

  @override
  String get lessonSixSolve => 'Собираем 6×6 как 3×3';

  @override
  String get lessonSixSolveDesc => 'Доберите слой за слоем, как 3×3.';

  @override
  String get introGoalSixSolve =>
      'Соберите редуцированный 6×6 как 3×3, слой за слоем, только внешними поворотами.';

  @override
  String get introHowSixSolve =>
      'Дальше только внешние повороты: слой разбил бы центр или ребро.\nСобранные центры показывают цвет каждой грани.\nБелый крест и углы, средний слой, потом жёлтый слой.';

  @override
  String get introHoldSixSolve =>
      'Цвет первого слоя снизу, как на 3×3; вставляемый угол спереди справа.';

  @override
  String get introWhySixSolve =>
      'Внешние повороты двигают каждый центр 4×4 и каждое ребро как одну деталь, как на 3×3.';

  @override
  String get lessonSixParity => 'Паритет 6×6';

  @override
  String get lessonSixParityDesc =>
      'Одно перевёрнутое ребро или два переставленных.';

  @override
  String get introGoalSixParity =>
      'Исправьте два случая 6×6, которых не бывает на 3×3: одно перевёрнутое ребро или два переставленных.';

  @override
  String get introHowSixParity =>
      'Собирайте как 3×3, пока не застрянете.\nОдно перевёрнутое ребро: длинное исправление с 3Rw.\nДва переставленных ребра: короткое исправление двойными внутренними поворотами.';

  @override
  String get introHoldSixParity =>
      'Последний слой сверху. Перевёрнутое ребро спереди; два переставленных — спереди и сзади.';

  @override
  String get introWhySixParity =>
      'Как и 4×4, 6×6 может закончиться одним перевёрнутым или двумя переставленными рёбрами; алгоритмы внутренних слоёв исправляют это, не трогая остальное.';

  @override
  String get stepFivePieces => 'Детали 5×5';

  @override
  String get stepFivePiecesBody =>
      'Средняя деталь каждой грани никогда не двигается, поэтому цветовая схема не может получиться неверной. Вокруг неё восемь центральных деталей: угловые и рёберные центры никогда не меняются типами. Каждое ребро — средняя деталь и два крыла.';

  @override
  String get stepFiveSlices => 'Три вида поворотов';

  @override
  String get stepFiveSlicesBody =>
      'Внешний поворот вращает одну грань. Широкий поворот вращает грань вместе со слоем за ней. Поворот внутреннего слоя вращает только слой внутри: так детали меняются местами, не трогая наружную часть.';

  @override
  String get stepFiveCenterBar => 'Полоски центров';

  @override
  String get stepFiveCenterBarBody =>
      'Соберите ряд из трёх одинаковых центральных деталей, введите его внутренним слоем, поверните верх и верните слой: ход, который вводит полоску, заодно возвращает готовый центр. Три полоски — это центр.';

  @override
  String get stepFiveCenterSwap => 'Меняем, не ломая';

  @override
  String get stepFiveCenterSwapBody =>
      'Чтобы сдвинуть одну центральную деталь: поверните внутренний слой, поверните верх, отмените слой и верните верх. Готовые центры каждый раз возвращаются.';

  @override
  String get stepFiveEdgePair => 'Крылья к среднему ребру';

  @override
  String get stepFiveEdgePairBody =>
      'Выстройте крыло рядом с его средним ребром спереди, опустите внутренний слой, подставьте несобранное ребро коротким триггером и верните внутренний слой.';

  @override
  String get stepFiveEdgeLast => 'Последние рёбра';

  @override
  String get stepFiveEdgeLastBody =>
      'Когда свободных рёбер для обмена не осталось, используйте слой, переворот, слой: широкий поворот, короткий триггер и широкий поворот обратно соединяют последние рёбра, не ломая готовые.';

  @override
  String get stepFiveAsThree => 'Теперь это 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Когда центры и рёбра готовы, 5×5 ведёт себя как большой 3×3. Только внешние повороты, слой за слоем: белый крест и углы, средний слой, затем жёлтый. Паритета PLL у 5×5 нет.';

  @override
  String get stepFiveEdgeParity => 'Меняем крылья последнего ребра';

  @override
  String get stepFiveEdgeParityBody =>
      'Иногда у последнего ребра переставлены два внешних крыла, и оно кажется перевёрнутым: это единственный паритет 5×5. Держите его спереди в верхнем слое и один раз выполните алгоритм внутренними слоями; всё остальное вернётся на место.';

  @override
  String get stepSixPieces => 'Детали 6×6';

  @override
  String get stepSixPiecesBody =>
      'Как и у 4×4, у 6×6 нет неподвижных центров: шестнадцать центральных деталей образуют цвет каждой грани, поэтому сначала проверьте порядок цветов по углу. У каждого ребра четыре крыла: два внешних и два внутренних.';

  @override
  String get stepSixSlices => 'Поворачиваем глубокие слои';

  @override
  String get stepSixSlicesBody =>
      'Широкие повороты двигают два или три слоя от грани. Внутренние слои на второй и третьей глубине — инструменты для центров и рёбер.';

  @override
  String get stepSixCenterBar => 'Полоски по четыре';

  @override
  String get stepSixCenterBarBody =>
      'Собирайте ряды из четырёх одинаковых центральных деталей и сдвигайте их рядом внутренними слоями, каждый раз возвращая слой, пока грань не станет сплошным блоком 4×4.';

  @override
  String get stepSixCenterSwap => 'По одной детали';

  @override
  String get stepSixCenterSwapBody =>
      'Третий слой, верх, отмена, верх обратно: одна центральная деталь переходит, а готовые центры возвращаются. Используйте это для двух последних центров, когда полоска не встаёт.';

  @override
  String get stepSixEdgePair => 'Четыре детали — одно ребро';

  @override
  String get stepSixEdgePairBody =>
      'Соберите четыре крыла ребра спереди глубоким широким слоем, подставьте несобранное ребро коротким триггером и верните широкий слой.';

  @override
  String get stepSixEdgeLast => 'Последние рёбра';

  @override
  String get stepSixEdgeLastBody =>
      'Соединяйте последние рёбра коротким триггером между глубоким широким поворотом и его отменой, чтобы готовые рёбра не распались. Никогда не ломайте готовое ребро ради одной детали.';

  @override
  String get stepSixAsThree => 'Теперь это 3×3';

  @override
  String get stepSixAsThreeBody =>
      'С центрами 4×4 и собранными рёбрами соберите 6×6 как 3×3, слой за слоем, только внешними поворотами. Одно перевёрнутое или два переставленных ребра в конце — паритет, а не ошибка.';

  @override
  String get stepSixOllParity => 'Одно перевёрнутое ребро';

  @override
  String get stepSixOllParityBody =>
      'Одно ребро, которое выглядит перевёрнутым в последнем слое, — это паритет. Держите его спереди в верхнем слое и выполните длинное исправление: оно переворачивает все четыре крыла, меняет местами левое и правое верхние рёбра и не трогает первые два слоя.';

  @override
  String get stepSixPllParity => 'Два переставленных ребра';

  @override
  String get stepSixPllParityBody =>
      'Если в самом конце два ребра выглядят переставленными, держите их спереди и сзади в верхнем слое и выполните короткое исправление двойными внутренними поворотами: все четыре крыла обоих рёбер меняются местами.';

  @override
  String get stepSixWingRule => 'Четыре крыла или два?';

  @override
  String get stepSixWingRuleBody =>
      'Ребро 6×6 состоит из 4 крыльев. Прежде чем исправлять ребро, которое выглядит перевёрнутым, присмотритесь: если перевёрнуты все 4 крыла, используйте обычный паритет OLL на 3 слоя; если перевёрнуты только 2 внутренних крыла, используйте паритет внутренних крыльев. На кубике — случай внутренних крыльев.';

  @override
  String get stepSixInnerWingParity => 'Перевёрнуты два внутренних крыла';

  @override
  String get stepSixInnerWingParityBody =>
      'Здесь внешние крылья переднего верхнего ребра в порядке, перевёрнуты только 2 внутренних. Держите это ребро спереди в верхнем слое и крутите только третьи срезы (3R, 3L): внутренние крылья встают на место, остальной кубик остаётся собранным.';

  @override
  String get stageTwoFirstLayer => 'Собираем нижний слой';

  @override
  String get stageTwoTopColor => 'Делаем верх одного цвета';

  @override
  String get stageTwoFinish => 'Доделываем углы';

  @override
  String get explainTwoFirstLayer =>
      'Соберите нижний слой: его четыре угла подходят друг к другу и к цветам сторон.';

  @override
  String get explainTwoTopColor =>
      'Вращайте, пока все четыре верхние наклейки не станут одного цвета, не ломая нижний слой.';

  @override
  String get explainTwoFinish =>
      'Поставьте последние углы на места и закончите кубик.';

  @override
  String get tabSolve => 'Сборка';

  @override
  String get tabScan => 'Скан';

  @override
  String get tabAcademy => 'Академия';

  @override
  String get tabTrain => 'Тренировка';

  @override
  String get openCubeSolver => 'Открыть 3D-кубик и решатель';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Тренировка';

  @override
  String get trainSubtitle => 'Оттачивайте навыки каждый день.';

  @override
  String get settings => 'Настройки';

  @override
  String get settingsSoundHaptics => 'Звук и вибрация';

  @override
  String get settingsSoundHapticsDesc =>
      'Щелчки и вибрация при повороте кубика.';

  @override
  String get settingsAnimationSpeed => 'Скорость анимации по умолчанию';

  @override
  String get settingsAnimationSpeedDesc =>
      'Как быстро вращается кубик при воспроизведении ходов.';

  @override
  String get settingsResetProgress => 'Сбросить прогресс';

  @override
  String get settingsResetProgressDesc =>
      'Удаляет пройденные уроки Академии и вашу ежедневную серию.';

  @override
  String get resetProgressTitle => 'Сбросить весь прогресс?';

  @override
  String get resetProgressBody =>
      'Пройденные уроки и ежедневная серия будут удалены. Это действие нельзя отменить.';

  @override
  String get resetProgressDone => 'Прогресс сброшен.';

  @override
  String get cancel => 'Отмена';

  @override
  String get settingsPrivacyAds => 'Конфиденциальность и реклама';

  @override
  String get settingsPrivacyAdsDesc =>
      'Просмотрите или измените согласие на рекламу.';

  @override
  String get playbackPrevious => 'Назад';

  @override
  String get playbackNext => 'Далее';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Собран за $count хода!',
      many: 'Собран за $count ходов!',
      few: 'Собран за $count хода!',
      one: 'Собран за $count ход!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Создайте следующую версию вместе с нами';

  @override
  String get feedbackBody =>
      'Хотите предложить функцию или повлиять на следующую версию CubeMentor? Пишите нам:';

  @override
  String get feedbackEmailCopied =>
      'Почтовое приложение не найдено, поэтому адрес скопирован в буфер обмена.';

  @override
  String get adWatchToUnlock => 'Смотреть рекламу';

  @override
  String get adLoading => 'Загружаем короткое видео…';

  @override
  String get adRewardNotEarned =>
      'Досмотрите видео до конца, чтобы открыть доступ.';

  @override
  String get adUnavailableFreePass =>
      'Сейчас видео недоступно — на этот раз открыто бесплатно.';

  @override
  String get settingsPrivacyAdsError =>
      'Не удалось открыть настройки конфиденциальности. Попробуйте позже.';

  @override
  String get nicknamePromptTitle => 'Как к вам обращаться?';

  @override
  String get nicknamePromptBody =>
      'Мы будем подбадривать вас по имени после каждой сборки.';

  @override
  String get nicknameHint => 'Ваше имя или никнейм';

  @override
  String get nicknameSave => 'Сохранить';

  @override
  String get settingsNickname => 'Ваше имя';

  @override
  String get settingsNicknameNotSet => 'Не указано — нажмите, чтобы добавить';

  @override
  String celebrateNamed(String name) {
    return 'Так держать, $name!';
  }

  @override
  String get celebrateAnon => 'Так держать!';

  @override
  String get celebrateCubeSolved => 'Кубик собран!';

  @override
  String get celebrateDailyDone => 'Ежедневное испытание пройдено!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit хода',
      many: '$count / $limit ходов',
      few: '$count / $limit хода',
      one: '$count / $limit ход',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Любую комбинацию можно собрать не более чем за $limit хода',
      many: 'Любую комбинацию можно собрать не более чем за $limit ходов',
      few: 'Любую комбинацию можно собрать не более чем за $limit хода',
      one: 'Любую комбинацию можно собрать не более чем за $limit ход',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Смотреть видео';

  @override
  String get patternsNotNow => 'Не сейчас';

  @override
  String get settingsColorScheme => 'Цветовая схема кубика';

  @override
  String get colorSchemeWestern => 'Западная';

  @override
  String get colorSchemeJapanese => 'Японская';

  @override
  String get colorSchemeWesternDesc =>
      'Белый напротив жёлтого, синий напротив зелёного';

  @override
  String get colorSchemeJapaneseDesc =>
      'Белый напротив синего, жёлтый напротив зелёного';

  @override
  String dailyYourTime(String time) {
    return 'Ваше время: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'У вас $seconds секунд, чтобы осмотреть кубик. Коснитесь, чтобы начать обратный отсчёт.';
  }

  @override
  String get timerInspectTapReady =>
      'Коснитесь, когда будете готовы начать сборку';

  @override
  String timerInspectPlus2(int seconds) {
    return 'Инспекция превысила $seconds с, и таймер запустился сам: штраф +2 с';
  }

  @override
  String timerAvgOf(int count) {
    return 'Среднее из $count';
  }

  @override
  String get timerAvgNote => 'В средних не учитываются лучшее и худшее время';

  @override
  String get timerPbSub => 'Лучшая сборка';

  @override
  String get timerPlus2Caption => 'Штраф +2 с';

  @override
  String get timerDnfCaption => 'Не собран (DNF)';

  @override
  String get timerDeleteCaption => 'Удалить эту сборку';

  @override
  String get patternBullsEye => 'Мишень';

  @override
  String get patternFramedCenter => 'Центр в рамке';

  @override
  String get patternBlockCheckerboard => 'Шахматка из блоков';

  @override
  String get patternCubeInCubeInCube => 'Куб в кубе в кубе';

  @override
  String get patternUnionJack => 'Юнион Джек';

  @override
  String get patternKilt => 'Килт';

  @override
  String get patternSixTs => 'Шесть букв T';

  @override
  String get patternTwinPeaks => 'Две вершины';

  @override
  String get patternSpiral => 'Спираль';

  @override
  String get patternTetris => 'Тетрис';

  @override
  String get patternSpots => 'Точки в центре';

  @override
  String get patternStripes => 'Полосы';

  @override
  String get patternAnaconda => 'Анаконда';

  @override
  String get patternZigzag => 'Зигзаг';

  @override
  String get patternFourSpots => 'Четыре точки';

  @override
  String get patternGreenMamba => 'Зелёная мамба';

  @override
  String get patternPlusMinus => 'Плюс-минус';

  @override
  String guideStepCounter(int current, int total) {
    return 'Шаг $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Ход $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Ход $current / $total';
  }

  @override
  String get dailyStep1Title => 'Шаг 1: запутайте кубик';

  @override
  String get dailyStep2Title => 'Шаг 2: соберите кубик';

  @override
  String dailyPersonalBest(String time) {
    return 'Личный рекорд: $time';
  }

  @override
  String get dailyRecentDays => 'Последние дни';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Серия: $count дня! Вы в ударе!',
      many: 'Серия: $count дней! Вы в ударе!',
      few: 'Серия: $count дня! Вы в ударе!',
      one: 'Серия: $count день! Вы в ударе!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Кубик запутан! Теперь соберите его';

  @override
  String get dailyCongratsTitle => 'Поздравляем!';

  @override
  String dailyCongratsBody(String time) {
    return 'Вы собрали задание дня за $time.';
  }

  @override
  String get dailyCongratsDone => 'Назад к заданию';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count узора',
      many: '$count узоров',
      few: '$count узора',
      one: '$count узор',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Осталось $hours часа',
      many: 'Осталось $hours часов',
      few: 'Осталось $hours часа',
      one: 'Остался $hours час',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Осталось $minutes минуты',
      many: 'Осталось $minutes минут',
      few: 'Осталось $minutes минуты',
      one: 'Осталась $minutes минута',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'Заблокировано';

  @override
  String get unlockedLabel => 'Открыто';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Посмотрите 1 короткое видео, чтобы открыть этот узор и пошаговую инструкцию на $hours часа.',
      many:
          'Посмотрите 1 короткое видео, чтобы открыть этот узор и пошаговую инструкцию на $hours часов.',
      few:
          'Посмотрите 1 короткое видео, чтобы открыть этот узор и пошаговую инструкцию на $hours часа.',
      one:
          'Посмотрите 1 короткое видео, чтобы открыть этот узор и пошаговую инструкцию на $hours час.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Посмотрите 1 короткое видео, чтобы открывать этот урок сколько угодно раз на $hours часа.',
      many:
          'Посмотрите 1 короткое видео, чтобы открывать этот урок сколько угодно раз на $hours часов.',
      few:
          'Посмотрите 1 короткое видео, чтобы открывать этот урок сколько угодно раз на $hours часа.',
      one:
          'Посмотрите 1 короткое видео, чтобы открывать этот урок сколько угодно раз на $hours час.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'Сборка больших кубиков';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Бесплатная сборка 4×4–6×6 уже использована. Посмотрите 1 короткое видео, чтобы собирать большие кубики ещё $hours часа.',
      many:
          'Бесплатная сборка 4×4–6×6 уже использована. Посмотрите 1 короткое видео, чтобы собирать большие кубики ещё $hours часов.',
      few:
          'Бесплатная сборка 4×4–6×6 уже использована. Посмотрите 1 короткое видео, чтобы собирать большие кубики ещё $hours часа.',
      one:
          'Бесплатная сборка 4×4–6×6 уже использована. Посмотрите 1 короткое видео, чтобы собирать большие кубики ещё $hours час.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Двойной поворот · 180°';

  @override
  String get homeAcademy => 'Академия';

  @override
  String get homePatterns => 'Крутые узоры';

  @override
  String get homePractice => 'Таймер и задание дня';

  @override
  String get scanChoiceSubtitle => 'С чего начнём?';

  @override
  String get scanChoiceCamera => 'Сканировать камерой';

  @override
  String get scanChoiceCameraDesc =>
      'Покажите камере каждую грань и получите решение.';

  @override
  String get scanChoice3d => 'Открыть 3D-кубик';

  @override
  String get scanChoice3dDesc =>
      'Вращайте виртуальный кубик, запутайте его и соберите шаг за шагом.';

  @override
  String get academyAllSizes => 'Все размеры';

  @override
  String homeAcademyProgress(int done, int total) {
    return 'Пройдено уроков: $done / $total';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • пройдено $done / $total';
  }

  @override
  String get lessonStageConcept => 'Суть';

  @override
  String get lessonStageExamples => 'Примеры';

  @override
  String get lessonStagePractice => 'Практика';

  @override
  String get lessonStageNext => 'Дальше / сам';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Этап $index из $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Пример $index из $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Разбор $index из $total';
  }

  @override
  String get lessonBonusCase => 'Бонусный случай';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Сразу к уроку «$lesson».';
  }

  @override
  String get lessonFreePractice => 'Свободная практика';

  @override
  String get lessonFreePracticeDesc =>
      'Соберите перемешанный 3D-кубик сами: с самого начала и до этого шага.';

  @override
  String freePracticeBanner(String topic) {
    return 'Свободная практика: соберите кубик с начала и до шага «$topic»!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Поверните грань с центром «$face», как показывает стрелка. Центр остаётся на месте, двигаются только детали вокруг него.';
  }

  @override
  String cueTrigger(String front) {
    return 'Правый триггер, центр «$front» к вам: правая грань вверх, верх влево, правая грань вниз, верх обратно вправо.';
  }

  @override
  String get cueTriggerBack =>
      'Шестой триггер подряд возвращает кубик точно в исходное состояние. Шесть — волшебное число!';

  @override
  String cueSliceInner(String face) {
    return 'Поверните только внутренний слой рядом с гранью «$face». Сама грань стоит на месте, поэтому центры расходятся.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Широкий поворот: грань «$face» и соседний внутренний слой поворачиваются вместе, как один толстый слой.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Поверните весь кубик так, чтобы центр «$top» был сверху, а центр «$front» смотрел на вас.';
  }

  @override
  String get cueTurnTop =>
      'Поверните только верхний слой, как показывает стрелка, чтобы подготовить следующий алгоритм.';

  @override
  String get cueAlignTop =>
      'Последний ход: поверните верхний слой, чтобы цвета совпали. Готово!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'Ребро «$piece» в верхнем слое. Вращайте верх, пока оно не окажется прямо над центром «$center», затем поверните эту грань дважды, чтобы опустить его.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'Ребро «$piece» застряло в среднем слое. Поднимите его наверх, совместите над центром «$center» и опустите вниз.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'Ребро «$piece» на своём месте, но перевёрнуто: белый смотрит вбок. Выньте его и поднимите наверх белым вверх, затем опустите рядом с центром «$center».';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'В стиле CFOP низ тоже можно вращать. Опустите ребро «$piece» и поверните низ так, чтобы оно встало к центру «$center».';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Вращайте верх, пока угол «$piece» не окажется прямо над своим местом, между сторонами «$a» и «$b». Повторяйте правый триггер, пока он не встанет правильно.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'Угол «$piece» на своём месте, но повёрнут. Один пиф-паф выводит его наверх (на его место встаёт жёлтый угол); повторяйте над тем же местом, пока он не вернётся белым вниз. Не крутите кубик за ним.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Вращайте верх, пока ребро «$piece» не совпадёт с центром «$a», затем отправьте его вниз вправо, в слот между «$a» и «$b».';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Вращайте верх, пока ребро «$piece» не совпадёт с центром «$a», затем отправьте его вниз влево, в слот между «$a» и «$b».';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'Ребро «$piece» на месте, но перевёрнуто. Вставьте туда жёлтое ребро, чтобы вытолкнуть его наверх, затем снова вставьте его между «$a» и «$b».';
  }

  @override
  String cueYellowLine(String front) {
    return 'Жёлтая линия: поверните верх так, чтобы она шла слева направо, центр «$front» к вам, и выполните алгоритм жёлтого креста.';
  }

  @override
  String cueYellowL(String front) {
    return 'Жёлтый уголок: поверните верх так, чтобы уголок смотрел назад влево, центр «$front» к вам, и выполните алгоритм. Получится линия.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Жёлтый только центр: точка. Примените алгоритм один раз, центр «$front» к вам, — получится галка. Точке может понадобиться три круга, так что продолжайте.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Вращайте верх, пока ребро «$piece» не совпадёт с центром «$center».';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Два совпавших ребра сзади и справа. С центром «$front» к вам выполните обмен: переднее и левое рёбра меняются местами.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Совпавшие рёбра стоят друг напротив друга. Выполните обмен один раз, центр «$front» к вам; после этого совпадут два соседних.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'Угол «$piece» уже на своём месте. Держите его спереди справа, центр «$front» к вам, и переставьте по кругу остальные три угла.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Ни один жёлтый угол ещё не на месте. Выполните перестановку один раз, центр «$front» к вам; после неё один угол встанет на место.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Поворачивайте угол «$piece» спереди справа: повторяйте нижний триггер парами, пока его жёлтый не посмотрит вверх. Нижние слои пока выглядят запутанными; они вернутся с последним углом!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Углу «$piece» на этот раз нужно четыре триггера. Продолжайте: жёлтый всегда поднимается после двух или четырёх.';
  }

  @override
  String get cueTwistNext =>
      'Поверните только верхний слой, чтобы подвести следующий неправильный угол вперёд вправо. Весь кубик сейчас не вращайте!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Соедините угол «$piece» с ребром «$edge» наверху, затем вставьте пару в слот между «$a» и «$b».';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'Угол «$piece» застрял в своём слоте с чужим ребром. Сначала выньте его наверх, затем соберите пару и вставьте.';
  }

  @override
  String cueOllSune(String front) {
    return 'С центром «$front» к вам выполните Sune, чтобы развернуть жёлтые углы вверх.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'На этот раз одного Sune мало. Поверните верх и выполните Sune ещё раз, центр «$front» к вам.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Два угла нужно поменять местами. Держите совпавшую пару («фары») слева, центр «$front» к вам, и выполните T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Углы готовы. Держите ребро «$piece» сзади и переставьте по кругу остальные три ребра с помощью U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'Ни одно верхнее ребро ещё не совпадает со своим центром. Выполните U-perm один раз с любой стороны; после этого одно совпадёт.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Два соседних верхних угла нужно поменять местами. Держите совпавшую пару слева, цвет «$front» к вам, и выполните обмен.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Два угла для обмена стоят по диагонали. Выполните диагональный обмен, цвет «$front» к вам.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Верните заблудившуюся центральную деталь цвета «$color» на место 3-циклом центров: слой, верх, слой, затем всё обратно.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Целая полоса центров цвета «$color» стоит не на той грани. Поднимите её внутренним слоем, поверните верх и верните её на место.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Соедините две детали ребра «$piece»: выстройте их, поверните слой, подставьте несобранное ребро правыми ходами и верните слой.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Последние рёбра: соедините ребро «$piece» алгоритмом двух последних рёбер — он сохраняет все готовые рёбра.';
  }

  @override
  String cueParityOll(String front) {
    return 'Паритет OLL: одно верхнее ребро перевёрнуто, чего на 3×3 не бывает. Держите его спереди, центр «$front» к вам, и примените исправление паритета до обычного OLL.';
  }

  @override
  String get cueParityPll =>
      'Паритет PLL: два верхних ребра переставлены, чего на 3×3 не бывает. Держите их спереди и сзади, примените обмен паритета и выровняйте верх.';

  @override
  String cueParityFive(String front) {
    return 'Рёберный паритет: два внешних крыла одного ребра переставлены — единственный паритет 5×5. Держите это ребро спереди, центр «$front» к вам, и примените исправление один раз.';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'Паритет внутренних крыльев: перевёрнуты только 2 внутренних крыла верхнего ребра. Держите его спереди, центр «$front» к вам, и крутите только третьи срезы.';
  }

  @override
  String get wingRuleAllFour => 'Перевёрнуты все 4 крыла';

  @override
  String get wingRuleAllFourFix => 'Паритет OLL на 3 слоя (3Rw)';

  @override
  String get wingRuleInnerTwo => 'Перевёрнуты только 2 внутренних крыла';

  @override
  String get wingRuleInnerTwoFix => 'Паритет внутренних крыльев (3R)';

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingNext => 'Далее';

  @override
  String get onboardingStart => 'Начать';

  @override
  String get onboardingWhatTitle => 'Ваш помощник по кубикам';

  @override
  String get onboardingWhatBody =>
      'CubeMentor помогает собирать, изучать и тренировать любые кубики от 2×2 до 6×6 — полностью офлайн.';

  @override
  String get onboardingScanTitle => 'Сканируйте и собирайте за секунды';

  @override
  String get onboardingScanBody =>
      'Покажите камере каждую грань (или введите цвета) и следуйте 3D-решению ход за ходом.';

  @override
  String get onboardingLearnTitle => 'Учитесь в Академии';

  @override
  String get onboardingLearnBody =>
      'Освойте послойную сборку короткими уроками — 3D-кубик покажет каждый ход.';

  @override
  String get onboardingPatternsTitle => 'Крутые узоры и 3D-песочница';

  @override
  String get onboardingPatternsBody =>
      'Превратите любой кубик от 2×2 до 6×6 в эффектный узор или крутите и запутывайте его в песочнице. Потяните кубик, чтобы повернуть; нажмите на размер, чтобы сменить.';

  @override
  String get scanChoiceManualDesc =>
      'Введите цвета каждой грани, наклейку за наклейкой.';

  @override
  String get scanTryAgain => 'Повторить';

  @override
  String get scanEditManually => 'Исправить цвета вручную';

  @override
  String get scanLightingHint =>
      'Расположите грань по центру сетки. Используйте яркий ровный свет и избегайте бликов.';

  @override
  String get crownExplain =>
      'Слой — это один горизонтальный ряд кубика: первый слой — белый внизу, второй — средний, третий — жёлтый наверху.';

  @override
  String get lessonObjectiveHeading => 'Цель урока';

  @override
  String get dirRowTop => 'Верхний ряд передней грани';

  @override
  String get dirRowBottom => 'Нижний ряд передней грани';

  @override
  String get dirColumnRight => 'Правый столбец передней грани';

  @override
  String get dirColumnLeft => 'Левый столбец передней грани';

  @override
  String get solveChoiceTitle => 'Как вы хотите собрать кубик?';

  @override
  String get solveChoiceFastDesc => 'Самое короткое решение, ход за ходом.';

  @override
  String get solveChoiceGuidedDesc => 'Изучайте послойную сборку шаг за шагом.';

  @override
  String get guidedSolvedTitle => 'Собрано!';

  @override
  String get guidedSolvedBody => 'Вы прошли все шаги и собрали кубик.';

  @override
  String get solveAgain => 'Собрать снова';

  @override
  String get backToHome => 'На главный экран';

  @override
  String get dailyStatTime => 'Время сегодня';

  @override
  String get dailyStatBest => 'Личный рекорд';

  @override
  String get dailyStatStreak => 'Текущая серия';

  @override
  String get dailyStatBestStreak => 'Лучшая серия';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get settingsPrivacyPolicyDesc =>
      'Что хранит CubeMentor и что использует реклама.';

  @override
  String get privacyIntro =>
      'CubeMentor работает без аккаунта и без собственных серверов. На этой странице объясняется, что остаётся на вашем устройстве и что использует наш рекламный партнёр.';

  @override
  String get privacyDataTitle => 'Ваши данные остаются на устройстве';

  @override
  String get privacyDataBody =>
      'Язык, настройки, прогресс в уроках, время сборок и ежедневная серия хранятся только на этом устройстве. У нас нет серверов, поэтому мы их никогда не получаем. При удалении приложения они стираются.';

  @override
  String get privacyCameraTitle => 'Камера';

  @override
  String get privacyCameraBody =>
      'Камера используется только во время сканирования кубика. Кадры анализируются на устройстве, чтобы распознать цвета наклеек; фото и видео не сохраняются и никуда не отправляются.';

  @override
  String get privacyAdsTitle => 'Реклама';

  @override
  String get privacyAdsBody =>
      'Приложение показывает рекламу Google AdMob. Google может использовать идентификаторы устройства и данные о взаимодействии с рекламой, чтобы показывать и оценивать объявления, как описано в политике конфиденциальности Google. Там, где этого требует закон, сначала запрашивается ваше согласие, и его можно изменить в настройках.';

  @override
  String get privacyContactTitle => 'Контакты';

  @override
  String privacyContactBody(String email) {
    return 'Вопросы о конфиденциальности? Напишите нам: $email.';
  }
}
