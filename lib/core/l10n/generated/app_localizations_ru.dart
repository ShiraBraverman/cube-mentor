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
  String get comingSoon => 'Скоро';

  @override
  String get comingSoonMessage =>
      'Эта функция появится в одном из следующих обновлений.';

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
  String get nextStep => 'Далее';

  @override
  String get previousStep => 'Назад';

  @override
  String get playbackTitle => 'Воспроизведение';

  @override
  String get playbackEmpty =>
      'Запутайте кубик, чтобы построить воспроизведение решения.';

  @override
  String playbackProgress(int current, int total) {
    return 'Шаг $current из $total';
  }

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
  String get solveChooseMethod => 'Как вы хотите его собрать?';

  @override
  String get solveFast => 'Быстрая сборка';

  @override
  String get solveFastDesc => 'Двухфазный алгоритм Коцембы · около 20 ходов';

  @override
  String get solveLearn => 'Учиться шаг за шагом';

  @override
  String get solveLearnDesc => 'Послойный метод для начинающих с объяснениями';

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
  String get replayStep => 'Повторить шаг';

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
  String get phaseLblOrient => 'Возьмите кубик';

  @override
  String get phaseLblCross => 'Белый крест';

  @override
  String get phaseLblCorners => 'Белые углы';

  @override
  String get phaseLblMiddle => 'Средний слой';

  @override
  String get phaseLblYellowCross => 'Жёлтый крест';

  @override
  String get phaseLblYellowEdges => 'Жёлтые рёбра';

  @override
  String get phaseLblYellowCorners => 'Расставить жёлтые углы';

  @override
  String get phaseLblYellowCornersOrient => 'Развернуть жёлтые углы';

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
  String get lessonDone => 'Пройден';

  @override
  String lessonPartOf(int index, int total) {
    return 'Часть $index из $total';
  }

  @override
  String get lessonBack => 'Назад';

  @override
  String get lessonNext => 'Далее';

  @override
  String get lessonFinish => 'Завершить урок';

  @override
  String get lessonComplete => 'Урок пройден!';

  @override
  String get lessonNextLesson => 'Следующий урок';

  @override
  String get lessonBackToAcademy => 'Вернуться в Академию';

  @override
  String get lessonShowMe => 'Показать';

  @override
  String get lessonTryIt =>
      'Ваша очередь: проведите слой, указанный стрелкой, или нажмите «Показать».';

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
  String get trackBeginner => '3×3 для начинающих (послойно)';

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
  String get solveFastBigDesc =>
      'Редукция: центры, рёбра и паритет, затем Коцемба';

  @override
  String get solveLearnBigDesc =>
      'Редукция, завершённая послойным методом для начинающих';

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
  String get timerInspecting => 'Инспекция: удерживайте и отпустите для старта';

  @override
  String get timerTapToInspect =>
      'Коснитесь, чтобы начать 15-секундную инспекцию';

  @override
  String get timerInspectionToggle => 'Инспекция 15 с';

  @override
  String get timerNewScramble => 'Новый скрамбл';

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
  String get lessonCross => 'Белый крест';

  @override
  String get lessonCrossDesc => 'Соберите белый крест внизу.';

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
  String get lessonCorners => 'Белые углы';

  @override
  String get lessonCornersDesc => 'Закончите первый слой.';

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
  String get lessonMiddle => 'Средний слой';

  @override
  String get lessonMiddleDesc => 'Вставьте четыре средних ребра.';

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
  String get lessonLastLayer => 'Жёлтый крест и рёбра';

  @override
  String get lessonLastLayerDesc => 'Соберите крест сверху и совместите рёбра.';

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
  String get lessonLastCorners => 'Жёлтые углы';

  @override
  String get lessonLastCornersDesc => 'Расставьте и разверните последние углы.';

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
}
