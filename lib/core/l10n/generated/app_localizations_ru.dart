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
  String get solveModeGuided => 'С подсказками (3 короны)';

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
      'Здорово! Проводите подсвеченные слои по одному, чтобы завершить широкий ход.';

  @override
  String get guideSwipeHint =>
      'Проведите светящийся слой по стрелке или нажмите «Далее».';

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
  String get phaseLblCorners => 'Углы первой короны';

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
  String get crownFirst => 'Первая корона';

  @override
  String get crownSecond => 'Вторая корона';

  @override
  String get crownThird => 'Третья корона';

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
      'Вставьте 4 белых угла на свои места, чтобы завершить белую грань и всё первое кольцо.';

  @override
  String get subStepGoal21 =>
      'Вставьте 4 ребра среднего слоя, не разрушая первую корону.';

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
  String get trackBeginner => '3×3 для начинающих: 3 короны';

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
      'Держите жёлтый сверху. Четыре белых ребра окружают белый центр внизу, и боковой цвет каждого совпадает с соседним центром.';

  @override
  String get stepCrossTop => 'Ребро сверху';

  @override
  String get stepCrossTopBody =>
      'Найдите белое ребро наверху. Вращайте верх, пока его боковой цвет не окажется над таким же центром, затем поверните эту грань дважды, чтобы опустить ребро вниз.';

  @override
  String get stepCrossMiddle => 'Ребро в среднем слое';

  @override
  String get stepCrossMiddleBody =>
      'Ребро, застрявшее в среднем слое, сначала поднимите: поверните его боковую грань вверх, уберите верхний слой в сторону и верните боковую грань, чтобы крест не разрушился. Затем поставьте ребро сверху.';

  @override
  String get stepCornersInsert => 'Над своим местом';

  @override
  String get stepCornersInsertBody =>
      'Вращайте верх, пока белый угол не окажется над местом своих цветов спереди справа. R U R\' U\' опускает его на место.';

  @override
  String get stepCornersRepeat => 'Повторяйте триггер';

  @override
  String get stepCornersRepeatBody =>
      'Если белый цвет смотрит не туда, продолжайте повторять R U R\' U\' над тем же местом. Любой угол собирается не более чем за пять повторов.';

  @override
  String get stepMiddleRight => 'Ребро вправо';

  @override
  String get stepMiddleRightBody =>
      'Совместите верхнее ребро с его центром на передней грани. Если его верхний цвет совпадает с правым центром, вставьте его: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Ребро влево';

  @override
  String get stepMiddleLeftBody =>
      'Если верхний цвет совпадает с левым центром, используйте зеркальный вариант: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Один алгоритм';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' превращает жёлтую точку в уголок, уголок — в линию, а линию — в крест. Держите уголок сзади слева, а линию горизонтально.';

  @override
  String get stepYellowEdges => 'Совместите рёбра';

  @override
  String get stepYellowEdgesBody =>
      'Вращайте верх, пока два ребра не совпадут со своими центрами. Если одно сзади, а другое справа, R U R\' U R U2 R\' U поменяет местами два оставшихся.';

  @override
  String get stepPlaceCorners => 'Расставьте';

  @override
  String get stepPlaceCornersBody =>
      'Держите спереди справа угол, который уже стоит на своём месте. U R U\' L\' U R\' U\' L переставляет остальные три; повторяйте, пока все четыре не встанут на место.';

  @override
  String get stepTwistCorners => 'Разверните';

  @override
  String get stepTwistCornersBody =>
      'С несобранным углом спереди справа повторяйте R\' D\' R D, пока жёлтый не окажется сверху, затем поворачивайте только верх, чтобы подвести следующий. Низ выглядит разобранным до самого конца — продолжайте.';

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
      'Кубик 2×2 — это 3×3 без рёбер и центров. Выберите цвет, соберите эту грань внизу и добейтесь, чтобы боковые цвета соседних углов совпадали.';

  @override
  String get stepTwoCorner => 'Вставьте углы';

  @override
  String get stepTwoCornerBody =>
      'Точно как белые углы на 3×3: подведите угол к его месту и повторяйте R U R\' U\', пока он не встанет.';

  @override
  String get lessonTwoOll => 'Ориентация верха';

  @override
  String get lessonTwoOllDesc => 'OLL по Ortega с Суне.';

  @override
  String get stepTwoSune => 'Снова Суне';

  @override
  String get stepTwoSuneBody =>
      'Суне делает верх жёлтым и на 2×2. По методу Ortega учат семь коротких случаев; Суне и его зеркало покрывают большинство из них.';

  @override
  String get lessonTwoPbl => 'Перестановка обоих слоёв';

  @override
  String get lessonTwoPblDesc => 'Поменяйте углы местами, чтобы закончить.';

  @override
  String get stepTwoAdjacent => 'Соседний обмен';

  @override
  String get stepTwoAdjacentBody =>
      'Если нужно поменять два соседних верхних угла, держите их справа и используйте T-перм.';

  @override
  String get stepTwoDiagonal => 'Диагональный обмен';

  @override
  String get stepTwoDiagonalBody =>
      'Два угла на противоположных позициях меняются местами с помощью Y-перма.';

  @override
  String get lessonBigIntro => 'Детали больших кубиков';

  @override
  String get lessonBigIntroDesc => 'Центры, крылья и срезы.';

  @override
  String get stepBigPieces => 'Нет неподвижных центров';

  @override
  String get stepBigPiecesBody =>
      'На 4×4 у каждой грани четыре подвижные центральные детали, а каждое ребро состоит из двух крыльев. Редукция группирует их, чтобы кубик вёл себя как 3×3.';

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
      'Этот коммутатор перемещает ровно три центральные детали и не трогает ничего больше, поэтому собранные центры остаются собранными.';

  @override
  String get lessonBigEdges => 'Сборка рёбер';

  @override
  String get lessonBigEdgesDesc => 'Соедините крылья в целые рёбра.';

  @override
  String get stepBigEdgePair => 'Соединить и восстановить';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' выстраивает два подходящих крыла, R U R\' F R\' F\' R подставляет несобранное ребро, а Uw возвращает центры на место.';

  @override
  String get lessonBigParity => 'Паритет';

  @override
  String get lessonBigParityDesc => 'OLL- и PLL-паритет на чётных кубиках.';

  @override
  String get stepBigOllParity => 'OLL-паритет';

  @override
  String get stepBigOllParityBody =>
      'Одно перевёрнутое ребро невозможно на 3×3. На чётных кубиках этот алгоритм переворачивает обратно верхнее переднее ребро. Остальной верхний слой при этом может перемешаться — последние шаги 3×3 всё равно это исправят.';

  @override
  String get stepBigPllParity => 'PLL-паритет';

  @override
  String get stepBigPllParityBody =>
      'Два ребра поменялись местами в самом конце? 2R2 U2 2R2 Uw2 2R2 Uw2 меняет местами переднее и заднее верхние рёбра.';

  @override
  String get introGoalHeading => 'Какая цель?';

  @override
  String get introHowHeading => 'Как это сделать?';

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
      'Соберите белый крест, в котором каждое белое ребро совпадает и с цветом соседнего центра.';

  @override
  String get introGoalCorners =>
      'Поставьте четыре белых угла, и первая корона — весь белый слой — готова.';

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
      'Переставьте последние углы на места и соберите 2×2.';

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
      'Исправьте два случая 4×4, которых не бывает на 3×3: одно перевёрнутое ребро или два переставленных.';

  @override
  String get introHowBasics =>
      'Центры никогда не двигаются, поэтому они задают цвет каждой грани.\nКаждая буква поворачивает одну грань на четверть оборота по часовой стрелке.\nАпостроф (\') поворачивает обратно, а 2 — дважды.';

  @override
  String get introHowCross =>
      'Держите жёлтый сверху: белый крест собирается внизу.\nНайдите белое ребро и совместите его боковой цвет с нужным центром.\nПоверните эту грань дважды, чтобы опустить ребро на место.';

  @override
  String get introHowCorners =>
      'Приведите белый угол над его пустым местом.\nПовторяйте R U R\' U\', пока он не встанет правильно.\nСделайте то же с остальными тремя углами.';

  @override
  String get introHowMiddle =>
      'Найдите верхнее ребро без жёлтого и совместите его передний цвет с центром.\nОтправьте его вправо или влево коротким алгоритмом из 8 ходов.\nБелый слой каждый раз возвращается целым.';

  @override
  String get introHowYellowCross =>
      'Посмотрите на верх: точка, буква L или линия.\nДержите, как показано, и сделайте F R U R\' U\' F\'.\nПовторяйте, пока не появится жёлтый крест.';

  @override
  String get introHowYellowEdges =>
      'Крутите верхний слой, пока два ребра не совпадут со своими центрами.\nДержите их сзади и справа и сделайте R U R\' U R U2 R\' U.\nПовторяйте, пока не совпадут все четыре.';

  @override
  String get introHowYellowCorners =>
      'Угол на месте, когда его цвета совпадают с тремя гранями вокруг него.\nДержите уже стоящий угол спереди справа.\nU R U\' L\' U R\' U\' L переставляет остальные три, пока все не встанут.';

  @override
  String get introHowTwistCorners =>
      'Держите несобранный угол спереди справа.\nПовторяйте R\' D\' R D, пока его жёлтый не окажется сверху.\nДля следующего крутите только верх; низ сам соберётся в конце.';

  @override
  String get introHowCfopIntro =>
      'Крест: четыре ребра, которые планируют во время осмотра.\nF2L: каждый угол ставится вместе со своим ребром.\nOLL делает верх жёлтым, затем PLL расставляет детали по местам.';

  @override
  String get introHowF2l =>
      'Найдите угол и подходящее к нему ребро в верхнем слое.\nСоедините их в пару над их слотом.\nВставьте пару за три-четыре хода.';

  @override
  String get introHowOll =>
      'Сначала жёлтый крест с помощью F R U R\' U\' F\'.\nЗатем сориентируйте углы, например «Суне».\nУзнавайте случай по видимому жёлтому узору.';

  @override
  String get introHowPll =>
      'Верх уже полностью жёлтый.\nT-perm меняет углы, U-perm переставляет три ребра.\nСмотрите на боковые цвета, чтобы выбрать алгоритм.';

  @override
  String get introHowTwoFirst =>
      'Кубик 2×2 состоит только из углов, как 3×3 без рёбер.\nПриведите каждый белый угол над его местом.\nПовторяйте R U R\' U\', пока он не встанет.';

  @override
  String get introHowTwoOll =>
      'Держите белый слой внизу.\n«Суне» (R U R\' U R U2 R\') поворачивает верхние углы.\nПовторяйте с правильного ракурса, пока верх не станет жёлтым.';

  @override
  String get introHowTwoPbl =>
      'Найдите сторону, где два угла уже совпадают.\nСоседняя перестановка: алгоритм в стиле T-perm.\nДиагональная перестановка: алгоритм чуть длиннее.';

  @override
  String get introHowBigIntro =>
      'Фиксированных центров нет: четыре центральные детали образуют цвет грани.\nШирокие ходы вроде Rw поворачивают сразу два слоя.\nВнутренние ходы вроде 2R поворачивают только один внутренний слой.';

  @override
  String get introHowBigCenters =>
      'Сначала соберите два противоположных центра.\nВнутренние слои меняют центральные детали, не ломая готовые центры.\nПоследние четыре центра соберите так же.';

  @override
  String get introHowBigEdges =>
      'Найдите две реберные детали одинаковых цветов.\nПоставьте их рядом внутренним слоем.\nУберите пару в сторону и верните центры.';

  @override
  String get introHowBigParity =>
      'Собирайте 4×4 как 3×3, пока не застрянете.\nОдно перевёрнутое ребро: длинный алгоритм OLL-паритета.\nДва переставленных ребра: 2R2 U2 2R2 Uw2 2R2 Uw2.';

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
  String get stageCrown1 => 'Первая корона (белая)';

  @override
  String get stageCrown2 => 'Вторая корона';

  @override
  String get stageCrown3 => 'Третья корона (жёлтая)';

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
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'Корона $crown • Этап $number из $total: $title';
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
  String get lessonFiveCenters => 'Центры 5×5';

  @override
  String get lessonFiveCentersDesc =>
      'Собираем каждый центр из полосок по три.';

  @override
  String get introGoalFiveCenters =>
      'Соберите на каждой грани одноцветный центральный блок 3×3.';

  @override
  String get introHowFiveCenters =>
      'Начните со средней детали: она задаёт цвет.\nСоберите полоски по три и вставьте их внутренним слоем.\nПоследние два центра собирайте вместе.';

  @override
  String get lessonFiveEdges => 'Рёбра 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Соединяем два крыла с их средним ребром.';

  @override
  String get introGoalFiveEdges =>
      'Соедините каждое среднее ребро с его двумя крыльями, чтобы все 12 рёбер выглядели цельными.';

  @override
  String get introHowFiveEdges =>
      'Совместите спереди два крыла с их средним ребром.\nПоверните внутренний слой, подставьте несобранное ребро и верните слой.\nСоединяйте последние рёбра, не ломая готовые.';

  @override
  String get lessonFiveSolve => 'Собираем 5×5 как 3×3';

  @override
  String get lessonFiveSolveDesc => 'Заканчиваем тремя коронами.';

  @override
  String get introGoalFiveSolve =>
      'Соберите сведённый 5×5 как 3×3, корону за короной.';

  @override
  String get introHowFiveSolve =>
      'Дальше только внешние повороты.\nПервая корона, вторая, затем жёлтая.\nНеподвижные центры показывают цвет каждой грани.';

  @override
  String get lessonFiveParity => 'Паритет рёбер 5×5';

  @override
  String get lessonFiveParityDesc =>
      'Исправляем ребро с переставленными крыльями.';

  @override
  String get introGoalFiveParity =>
      'Исправьте единственное ребро с переставленными крыльями и закончите сборку.';

  @override
  String get introHowFiveParity =>
      'Это выглядит как ребро, которое никак не соединяется.\nВыполните один раз длинное исправление внутренними слоями.\nВсё остальное возвращается на место.';

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
  String get lessonSixCenters => 'Центры 6×6';

  @override
  String get lessonSixCentersDesc =>
      'Собираем центры 4×4 из полосок по четыре.';

  @override
  String get introGoalSixCenters =>
      'Соберите на каждой грани одноцветный центральный блок 4×4.';

  @override
  String get introHowSixCenters =>
      'Сначала соберите два противоположных центра.\nСобирайте полоски по четыре и соединяйте их.\nОдиночные детали двигайте приёмом «слой, верх, отмена».';

  @override
  String get lessonSixEdges => 'Рёбра 6×6';

  @override
  String get lessonSixEdgesDesc => 'Собираем четыре детали каждого ребра.';

  @override
  String get introGoalSixEdges =>
      'Соберите четыре детали каждого ребра, чтобы у 6×6 было 12 цельных рёбер.';

  @override
  String get introHowSixEdges =>
      'Выстройте спереди внешние и внутренние крылья.\nГлубокий широкий слой вводит и выводит ребро.\nГотовые рёбра никогда не разрушаются.';

  @override
  String get lessonSixSolve => 'Собираем 6×6 как 3×3';

  @override
  String get lessonSixSolveDesc => 'Заканчиваем тремя коронами.';

  @override
  String get introGoalSixSolve =>
      'Соберите сведённый 6×6 как 3×3, корону за короной.';

  @override
  String get introHowSixSolve =>
      'Дальше только внешние повороты.\nСобранные центры показывают цвет каждой грани.\nПервая корона, вторая, затем жёлтая.';

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
      'Собирайте как 3×3, пока не застрянете.\nОдно перевёрнутое ребро: длинное исправление паритета.\nДва переставленных ребра: короткое исправление двойными поворотами.';

  @override
  String get stepFivePieces => 'Детали 5×5';

  @override
  String get stepFivePiecesBody =>
      'Средняя деталь каждой грани никогда не двигается, поэтому, как на 3×3, она задаёт цвет грани. Вокруг неё ещё восемь центральных деталей; у каждого ребра есть средняя деталь и два крыла, а углы работают как на 3×3.';

  @override
  String get stepFiveSlices => 'Три вида поворотов';

  @override
  String get stepFiveSlicesBody =>
      'Внешний поворот вращает одну грань. Широкий поворот вращает грань вместе со слоем за ней. Поворот внутреннего слоя вращает только слой внутри: так детали меняются местами, не трогая наружную часть.';

  @override
  String get stepFiveCenterBar => 'Полоски центров';

  @override
  String get stepFiveCenterBarBody =>
      'Соберите ряд из трёх одинаковых центральных деталей и придвиньте его к подходящей средней детали поворотом внутреннего слоя. Три полоски — готовый центр.';

  @override
  String get stepFiveCenterSwap => 'Меняем, не ломая';

  @override
  String get stepFiveCenterSwapBody =>
      'Чтобы сдвинуть одну центральную деталь: поверните внутренний слой, поверните верх, отмените слой и верните верх. Готовые центры каждый раз возвращаются.';

  @override
  String get stepFiveEdgePair => 'Крылья к среднему ребру';

  @override
  String get stepFiveEdgePairBody =>
      'Поставьте спереди два крыла рядом с их средним ребром, опустите внутренний слой, подведите сверху несобранное ребро и верните внутренний слой.';

  @override
  String get stepFiveEdgeLast => 'Последние рёбра';

  @override
  String get stepFiveEdgeLastBody =>
      'Когда рёбер осталось мало, широкий поворот, короткий триггер и обратный широкий поворот соединяют их, не ломая готовые.';

  @override
  String get stepFiveAsThree => 'Теперь это 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Когда центры и рёбра готовы, 5×5 ведёт себя как большой 3×3. Используйте только внешние повороты и пройдите три короны: белый крест и углы, средний слой, затем жёлтый слой.';

  @override
  String get stepFiveEdgeParity => 'Меняем крылья последнего ребра';

  @override
  String get stepFiveEdgeParityBody =>
      'Иногда у последнего ребра крылья переставлены. Длинный алгоритм внутренних слоёв меняет их обратно, а всё остальное возвращается на место. Затем доделайте как 3×3.';

  @override
  String get stepSixPieces => 'Детали 6×6';

  @override
  String get stepSixPiecesBody =>
      'Как и у 4×4, у 6×6 нет неподвижного центра: шестнадцать центральных деталей образуют цвет грани. В каждом ребре четыре детали: два внешних и два внутренних крыла.';

  @override
  String get stepSixSlices => 'Поворачиваем глубокие слои';

  @override
  String get stepSixSlicesBody =>
      'Широкие повороты двигают два или три слоя от грани. Внутренние слои на второй и третьей глубине — инструменты для центров и рёбер.';

  @override
  String get stepSixCenterBar => 'Полоски по четыре';

  @override
  String get stepSixCenterBarBody =>
      'Собирайте ряды из четырёх одинаковых центральных деталей и придвигайте их друг к другу поворотами внутренних слоёв, пока грань не станет одноцветной.';

  @override
  String get stepSixCenterSwap => 'По одной детали';

  @override
  String get stepSixCenterSwapBody =>
      'Поверните третий слой, поверните верх, отмените, верните: одна центральная деталь сдвигается, а готовые центры возвращаются.';

  @override
  String get stepSixEdgePair => 'Четыре детали — одно ребро';

  @override
  String get stepSixEdgePairBody =>
      'Соберите спереди четыре детали ребра глубоким широким слоем, подведите несобранное ребро и верните широкий слой.';

  @override
  String get stepSixEdgeLast => 'Последние рёбра';

  @override
  String get stepSixEdgeLastBody =>
      'Соединяйте последние рёбра коротким триггером между глубоким широким поворотом и его отменой, чтобы готовые рёбра не распались.';

  @override
  String get stepSixAsThree => 'Теперь это 3×3';

  @override
  String get stepSixAsThreeBody =>
      'С центрами 4×4 и соединёнными рёбрами соберите 6×6 как 3×3 внешними поворотами и тремя коронами.';

  @override
  String get stepSixOllParity => 'Одно перевёрнутое ребро';

  @override
  String get stepSixOllParityBody =>
      'Если при сборке последнего слоя одно ребро кажется перевёрнутым, это паритет. Поставьте его спереди в верхнем слое и выполните длинное исправление: первые две короны вернутся нетронутыми.';

  @override
  String get stepSixPllParity => 'Два переставленных ребра';

  @override
  String get stepSixPllParityBody =>
      'Если в самом конце два ребра будто поменялись местами, поставьте их спереди и сзади в верхнем слое и выполните короткое исправление внутренними двойными поворотами.';

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
}
