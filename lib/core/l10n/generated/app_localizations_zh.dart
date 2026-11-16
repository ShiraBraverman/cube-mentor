// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline => '从 2×2 到 6×6，扫描、还原并精通每一种魔方。';

  @override
  String get chooseCubeSize => '选择你的魔方';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => '入门';

  @override
  String get cubeLevel3 => '经典';

  @override
  String get cubeLevel4 => '进阶';

  @override
  String get cubeLevel5 => '专家';

  @override
  String get cubeLevel6 => '大师';

  @override
  String get chooseMode => '你想做什么？';

  @override
  String get modePlayground => '3D 练习场';

  @override
  String get modePlaygroundDesc => '在 3D 中转动层、打乱魔方并回放步骤。';

  @override
  String get modeScanSolve => '扫描并还原';

  @override
  String get modeScanSolveDesc => '用相机扫描你的魔方，获取还原步骤。';

  @override
  String get modeAcademy => '学院';

  @override
  String get modeAcademyDesc => '通过互动课程一步步学习。';

  @override
  String get comingSoon => '即将推出';

  @override
  String get comingSoonMessage => '此功能将在后续更新中推出。';

  @override
  String get language => '语言';

  @override
  String get languageSearch => '搜索语言';

  @override
  String get languageNoResults => '没有与搜索匹配的语言。';

  @override
  String playgroundTitle(int size) {
    return '$size×$size 练习场';
  }

  @override
  String get scramble => '打乱';

  @override
  String get reset => '重置';

  @override
  String get undo => '撤销';

  @override
  String get speed => '速度';

  @override
  String get xray => '透视';

  @override
  String get prime => '逆时针';

  @override
  String get wide => '双层';

  @override
  String layer(int index) {
    return '第 $index 层';
  }

  @override
  String get cubeRotations => '整体转动';

  @override
  String get play => '播放';

  @override
  String get pause => '暂停';

  @override
  String get nextStep => '下一步';

  @override
  String get previousStep => '上一步';

  @override
  String get playbackTitle => '回放';

  @override
  String get playbackEmpty => '打乱魔方后即可生成还原回放。';

  @override
  String playbackProgress(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 步',
      zero: '没有步骤',
    );
    return '$_temp0';
  }

  @override
  String get solved => '已还原';

  @override
  String get scrambled => '已打乱';

  @override
  String get orbitHint => '拖动一行即可转动 · 拖动背景可旋转视角';

  @override
  String get notationPad => '公式键盘';

  @override
  String get solve => '还原';

  @override
  String get solving => '正在还原…';

  @override
  String get solveChooseMethod => '你想怎么还原？';

  @override
  String get solveFast => '快速还原';

  @override
  String get solveFastDesc => 'Kociemba 两阶段算法 · 约 20 步';

  @override
  String get solveLearn => '一步步学习';

  @override
  String get solveLearnDesc => '带讲解的新手层先法';

  @override
  String solveUnavailable(int size) {
    return '$size×$size 求解器将在后续更新中推出。';
  }

  @override
  String get solveAlreadySolved => '魔方已经是还原状态。';

  @override
  String solveFailed(String reason) {
    return '这个魔方无法还原（$reason）。';
  }

  @override
  String get solveEngineMissing => '此设备无法使用求解引擎。';

  @override
  String get solveComplete => '还原成功！干得漂亮。';

  @override
  String solveSummary(int count) {
    return '$count 步';
  }

  @override
  String get nextMove => '下一步';

  @override
  String get guideSwipeHint => '按箭头方向滑动发光的层，或点按“下一步”。';

  @override
  String get guideRotateHint => '按箭头所示转动整个魔方，然后点按“下一步”。';

  @override
  String get guideWrongMove => '请按照高亮箭头操作';

  @override
  String get guideExit => '退出引导';

  @override
  String get replayStep => '重播此步';

  @override
  String get colorWhite => '白';

  @override
  String get colorYellow => '黄';

  @override
  String get colorGreen => '绿';

  @override
  String get colorBlue => '蓝';

  @override
  String get colorRed => '红';

  @override
  String get colorOrange => '橙';

  @override
  String get phaseOptimal2x2 => '最优解';

  @override
  String get phaseKociemba1 => '阶段 1 · 调整块的朝向';

  @override
  String get phaseKociemba2 => '阶段 2 · 完成还原';

  @override
  String get phaseLblOrient => '拿好魔方';

  @override
  String get phaseLblCross => '白色十字';

  @override
  String get phaseLblCorners => '白色角块';

  @override
  String get phaseLblMiddle => '中层';

  @override
  String get phaseLblYellowCross => '黄色十字';

  @override
  String get phaseLblYellowEdges => '黄色棱块';

  @override
  String get phaseLblYellowCorners => '归位黄色角块';

  @override
  String get phaseLblYellowCornersOrient => '翻转黄色角块';

  @override
  String get explainOptimal2x2 => '通过搜索 2×2 的所有状态找到的最短解法。';

  @override
  String get explainKociemba1 => '调整所有块的朝向，并把中层棱块集中到中层。';

  @override
  String get explainKociemba2 => '只用 U、D 和半圈转动完成还原，这些转动不会破坏已有的朝向。';

  @override
  String get explainLblOrient => '转动整个魔方，让白色中心朝下。';

  @override
  String explainLblCrossEdge(String piece) {
    return '把$piece棱块转到白色中心旁边，并让侧面颜色对齐。';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece角块卡在了错误的位置。用 R U R\' U\' 把它提到顶层。';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return '转动顶层，直到$piece角块位于它的目标位置正上方。';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '重复 R U R\' U\'，直到$piece角块归位。';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece棱块在中层，但位置或朝向不对。先把它移到顶层。';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return '转动顶层，让$piece棱块的侧面颜色与中心对齐。';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '把$piece棱块向右插入：U R U\' R\' U\' F\' U F。';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '把$piece棱块向左插入：U\' L\' U L U F U\' F\'。';
  }

  @override
  String get explainLblYellowCrossAlign => '转动顶层，为下一个公式摆好黄色图案的位置。';

  @override
  String get explainLblYellowCrossAlg => '用 F R U R\' U\' F\' 做出黄色十字。';

  @override
  String get explainLblYellowEdgesAlign => '转动顶层，让黄色棱块与对应中心对齐。';

  @override
  String get explainLblYellowEdgesAlg => '用 R U R\' U R U2 R\' U 交换黄色棱块。';

  @override
  String get explainLblYellowCornersAlg =>
      '用 U R U\' L\' U R\' U\' L 把黄色角块轮换到正确位置。';

  @override
  String get explainLblNextCorner => '转动顶层，把下一个未完成的黄色角块转到右前方。';

  @override
  String get explainLblCornerTwist => '重复 R\' D\' R D，直到黄色朝上。底层会在最后自动恢复。';

  @override
  String get explainLblFinalAlign => '转动顶层，完成还原。';

  @override
  String scanTitle(int size) {
    return '扫描 $size×$size';
  }

  @override
  String get scanManualInput => '手动输入颜色';

  @override
  String get scanUseCamera => '用相机扫描';

  @override
  String scanFaceProgress(int current, int total) {
    return '第 $current 面，共 $total 面';
  }

  @override
  String get faceUp => '顶面';

  @override
  String get faceRight => '右面';

  @override
  String get faceFront => '前面';

  @override
  String get faceDown => '底面';

  @override
  String get faceLeft => '左面';

  @override
  String get faceBack => '后面';

  @override
  String get scanHintFront => '让任意一面朝向你拿好魔方。这一面就是前面：扫描过程中请保持顶面不变。';

  @override
  String get scanHintRight => '从前面开始，把整个魔方向左转一次，让右面朝向你。';

  @override
  String get scanHintBack => '从前面开始，把整个魔方向左转两次。';

  @override
  String get scanHintLeft => '从前面开始，把整个魔方向右转一次。';

  @override
  String get scanHintUp => '从前面开始，把顶面朝你翻转，让它对准相机。';

  @override
  String get scanHintDown => '从前面开始，把底面朝你翻转，让它对准相机。';

  @override
  String get scanAlignHint => '让这一面填满网格，然后点按快门。';

  @override
  String get scanCapture => '拍摄此面';

  @override
  String get scanTapToRescan => '点按已扫描的面可重新扫描。';

  @override
  String get scanTooDark => '光线太暗：请换到更亮的地方。';

  @override
  String get scanGlare => '有反光：请把魔方稍微偏离光源。';

  @override
  String get scanCameraMissing => '此设备上没有找到相机。';

  @override
  String get scanCameraDenied => '相机权限被拒绝。你仍然可以手动输入颜色。';

  @override
  String get scanCameraFailed => '无法启动相机。';

  @override
  String get scanAllGood => '所有贴纸看起来都正确。';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 个贴纸看起来不对',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => '好像有点不对';

  @override
  String scanIssueColors(int count) {
    return '每种颜色必须恰好出现 $count 次。';
  }

  @override
  String get scanIssueCenters => '有两个中心块颜色相同。';

  @override
  String get scanIssuePieces => '这些贴纸组成了真实魔方上不存在的块。';

  @override
  String get scanIssueTwist => '有一个角块被扭转了。请检查角块贴纸。';

  @override
  String get scanIssueFlip => '有一个棱块被翻转了。请检查棱块贴纸。';

  @override
  String get scanIssueParity => '似乎有两个块被互换了。';

  @override
  String get scanIssueUnavailable => '此设备无法进行颜色检查。';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 个贴纸较难识别，请快速确认一下。',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint => '点按贴纸可更改颜色 · 长按可打开调色板';

  @override
  String get scanRescanFace => '重新扫描某一面';

  @override
  String get scanCancelRescan => '返回颜色';

  @override
  String get scanPaletteTitle => '选择颜色';

  @override
  String get scanOpen3d => '在 3D 中打开';

  @override
  String get scanRestart => '重新开始';

  @override
  String get modeTimer => '速拧计时器';

  @override
  String get modeTimerDesc => '打乱公式、观察时间、平均成绩和个人最佳。';

  @override
  String get modeDaily => '每日挑战';

  @override
  String get modeDailyDesc => '每天一个新打乱，保持你的连续纪录。';

  @override
  String get modePatterns => '图案库';

  @override
  String get modePatternsDesc => '棋盘、超级翻转等图案，3D 展示。';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '连续 $count 天',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => '继续学习';

  @override
  String get startLearning => '开始学习';

  @override
  String lessonOf(int index, int total) {
    return '第 $index 课，共 $total 课';
  }

  @override
  String get academyAllDone => '所有课程都已完成！';

  @override
  String get academyTitle => '学院';

  @override
  String academyProgress(int done, int total) {
    return '已完成 $done/$total 课';
  }

  @override
  String get lessonAdvanced => '进阶';

  @override
  String get lessonDone => '已完成';

  @override
  String lessonPartOf(int index, int total) {
    return '第 $index 部分，共 $total 部分';
  }

  @override
  String get lessonBack => '返回';

  @override
  String get lessonNext => '下一步';

  @override
  String get lessonFinish => '完成课程';

  @override
  String get lessonComplete => '课程完成！';

  @override
  String get lessonNextLesson => '下一课';

  @override
  String get lessonBackToAcademy => '返回学院';

  @override
  String get lessonShowMe => '演示给我看';

  @override
  String get lessonTryIt => '轮到你了：滑动箭头所指的层，或点按“演示给我看”。';

  @override
  String get lessonLookAround => '拖动背景，从各个角度观察魔方。';

  @override
  String get lessonDemoDone => '很好！点按“下一步”继续。';

  @override
  String holdPrompt(String top, String front) {
    return '拿好魔方：$top色中心朝上，$front色中心朝向你。';
  }

  @override
  String get trackBeginner => '3×3 新手（层先法）';

  @override
  String get trackCfop => 'CFOP 入门';

  @override
  String get trackTwoByTwo => '2×2 新手与 Ortega';

  @override
  String get trackBigCubes => '高阶魔方：降阶与奇偶校验';

  @override
  String moveSentence(String layer, String direction) {
    return '将$layer$direction转动';
  }

  @override
  String get moveFaceR => '右面';

  @override
  String get moveFaceL => '左面';

  @override
  String get moveFaceU => '顶面';

  @override
  String get moveFaceD => '底面';

  @override
  String get moveFaceF => '前面';

  @override
  String get moveFaceB => '后面';

  @override
  String moveLayerInner(int depth, String face) {
    return '从$face数第 $depth 层';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face（$depth 层厚）';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '从$face数第 $near–$far 层';
  }

  @override
  String get moveLayerMiddle => '中间层';

  @override
  String get moveDirUp => '向上';

  @override
  String get moveDirDown => '向下';

  @override
  String get moveDirLeft => '向左';

  @override
  String get moveDirRight => '向右';

  @override
  String get moveDirClockwise => '顺时针';

  @override
  String get moveDirCounter => '逆时针';

  @override
  String get moveDirBackClockwise => '从后面看顺时针';

  @override
  String get moveDirBackCounter => '从后面看逆时针';

  @override
  String get moveDirHalf => '半圈（两次）';

  @override
  String get moveRotateX => '整体翻转魔方：前面转到顶部';

  @override
  String get moveRotateXPrime => '整体翻转魔方：前面转到底部';

  @override
  String get moveRotateX2 => '整体翻转魔方：前面转到后面';

  @override
  String get moveRotateY => '整体转动魔方：前面转到左边';

  @override
  String get moveRotateYPrime => '整体转动魔方：前面转到右边';

  @override
  String get moveRotateY2 => '整体转动魔方半圈：后面转到前面';

  @override
  String get moveRotateZ => '顺时针侧滚整个魔方：顶面转到右边';

  @override
  String get moveRotateZPrime => '逆时针侧滚整个魔方：顶面转到左边';

  @override
  String get moveRotateZ2 => '把整个魔方上下颠倒：顶面转到底部';

  @override
  String get phaseReductionCenters => '中心';

  @override
  String get phaseReductionEdges => '棱块配对';

  @override
  String get phaseReductionEdgeParity => '棱块奇偶';

  @override
  String get phaseReductionOllParity => 'OLL 奇偶';

  @override
  String get phaseReductionPllParity => 'PLL 奇偶';

  @override
  String get explainReductionCenterBlock => '通过切片转动一次让多个中心块归位。';

  @override
  String explainReductionCenterCycle(String piece) {
    return '用不影响已完成中心的三循环，把一个$piece色中心块送到它所在的面。';
  }

  @override
  String get explainReductionParityCenters => '重新还原被奇偶切片转动打乱的中心。';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '用三循环拼合$piece棱块的各部分；中心保持还原状态。';
  }

  @override
  String get explainReductionEdgeParity =>
      '最后几个棱块无法只靠三循环配对（棱块奇偶）。转动一次内层切片即可解决。';

  @override
  String get explainReductionOllParity =>
      'OLL 奇偶：有一个棱块翻转，这在 3×3 上不可能出现。这个公式会把它翻回来。';

  @override
  String get explainReductionPllParity =>
      'PLL 奇偶：有两个棱块互换，这在 3×3 上不可能出现。这个公式会把它们换回来。';

  @override
  String get solveFastBigDesc => '降阶：中心、棱块和奇偶校验，然后用 Kociemba';

  @override
  String get solveLearnBigDesc => '降阶后用新手层先法完成';

  @override
  String get patternsTitle => '图案库';

  @override
  String get patternsHint => '点按一个图案观看，然后在你自己的魔方上跟着做。';

  @override
  String get patternCheckerboard => '棋盘';

  @override
  String get patternCubeInCube => '魔方中的魔方';

  @override
  String get patternSuperflip => '超级翻转';

  @override
  String get patternDots => '点阵';

  @override
  String get patternCross => '十字';

  @override
  String get patternPython => '蟒蛇';

  @override
  String get phasePattern => '拼出图案';

  @override
  String get explainPatternStep => '在你自己的魔方上跟着每一步做。点按“还原”即可恢复原状。';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => '速拧计时器';

  @override
  String get timerHoldToStart => '按住后松开开始';

  @override
  String get timerReleaseToStart => '松开开始';

  @override
  String get timerTapToStop => '点按任意位置停止';

  @override
  String get timerInspecting => '观察中：按住后松开开始';

  @override
  String get timerTapToInspect => '点按开始 15 秒观察';

  @override
  String get timerInspectionToggle => '15 秒观察';

  @override
  String get timerNewScramble => '新打乱';

  @override
  String get timerLoadingScramble => '正在生成打乱…';

  @override
  String get timerPb => '最佳';

  @override
  String get timerSolves => '次数';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => '删除';

  @override
  String get timerHistory => '历史记录';

  @override
  String get timerNoSolves => '还没有成绩。打乱魔方，开始吧！';

  @override
  String get timerNewPb => '新的个人最佳！';

  @override
  String get timerClearHistory => '清除历史记录';

  @override
  String get timerScrambleHint => '白色朝上、绿色朝前，然后打乱：';

  @override
  String get dailyTitle => '每日挑战';

  @override
  String dailyFor(String date) {
    return '$date 的挑战';
  }

  @override
  String dailyBestStreak(int count) {
    return '最长连续：$count';
  }

  @override
  String get dailyDone => '今天已完成！明天再来。';

  @override
  String get dailyNotDone => '还原今天的打乱，保持你的连续纪录。';

  @override
  String get dailySolveVirtual => '在 3D 魔方上还原';

  @override
  String get dailyTimeIt => '用自己的魔方计时';

  @override
  String get dailyHint => '提示';

  @override
  String dailyHintText(String moves) {
    return '从白色十字开始：$moves';
  }

  @override
  String get dailyHintFailed => '目前没有可用的提示。';

  @override
  String get lessonBasics => '认识魔方';

  @override
  String get lessonBasicsDesc => '块、面和转动符号。';

  @override
  String get stepBasicsPieces => '三种块';

  @override
  String get stepBasicsPiecesBody =>
      '中心块从不移动，决定了每个面的颜色。棱块有两种颜色，角块有三种。还原魔方，就是把每个棱块和角块移到颜色相同的中心块旁边。';

  @override
  String get stepBasicsFaces => '六个面的字母';

  @override
  String get stepBasicsFacesBody =>
      'R、L、U、D、F、B 分别代表右、左、上、下、前、后面。单独一个字母表示把这一面顺时针转 90 度，就像你正对着这一面看时那样。';

  @override
  String get stepBasicsPrime => '逆时针与两次转动';

  @override
  String get stepBasicsPrimeBody =>
      '撇号（R\'）表示反方向，也就是逆时针转动。数字 2（U2）表示转半圈，即转两个 90 度。';

  @override
  String get lessonCross => '白色十字';

  @override
  String get lessonCrossDesc => '在底面拼出白色十字。';

  @override
  String get stepCrossGoal => '目标';

  @override
  String get stepCrossGoalBody =>
      '黄色朝上拿好魔方。四个白色棱块围在底部白色中心四周，每个棱块的侧面颜色都与相邻中心一致。';

  @override
  String get stepCrossTop => '顶层的棱块';

  @override
  String get stepCrossTopBody =>
      '在顶层找到一个白色棱块。转动顶层，直到它的侧面颜色位于同色中心的正上方，然后把这一面转两次，让它落到底部。';

  @override
  String get stepCrossMiddle => '中层的棱块';

  @override
  String get stepCrossMiddleBody =>
      '卡在中层的棱块要先提上来：把它所在的侧面向上转，移开顶层，再把侧面转回去，这样十字不会被破坏。然后从顶层把它放好。';

  @override
  String get lessonCorners => '白色角块';

  @override
  String get lessonCornersDesc => '完成第一层。';

  @override
  String get stepCornersInsert => '移到目标位置上方';

  @override
  String get stepCornersInsertBody =>
      '转动顶层，直到一个白色角块位于它颜色对应的位置（右前方）正上方。用 R U R\' U\' 把它放下去。';

  @override
  String get stepCornersRepeat => '重复基本动作';

  @override
  String get stepCornersRepeatBody =>
      '如果白色朝向不对，就在同一位置继续重复 R U R\' U\'。每个角块最多重复五次就能还原。';

  @override
  String get lessonMiddle => '中层';

  @override
  String get lessonMiddleDesc => '插入中层的四个棱块。';

  @override
  String get stepMiddleRight => '向右插入';

  @override
  String get stepMiddleRightBody =>
      '让顶层的一个棱块与前面的中心对齐。如果它朝上的颜色与右边中心相同，用 U R U\' R\' U\' F\' U F 插入。';

  @override
  String get stepMiddleLeft => '向左插入';

  @override
  String get stepMiddleLeftBody =>
      '如果它朝上的颜色与左边中心相同，就用镜像公式：U\' L\' U L U F U\' F\'。';

  @override
  String get lessonLastLayer => '黄色十字和棱块';

  @override
  String get lessonLastLayerDesc => '在顶面做出十字并对齐棱块。';

  @override
  String get stepYellowCross => '一个公式就够';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' 能把黄色的点变成 L 形，把 L 形变成一字，再把一字变成十字。L 形放在左后方，一字横着放。';

  @override
  String get stepYellowEdges => '对齐棱块';

  @override
  String get stepYellowEdgesBody =>
      '转动顶层，直到两个棱块与中心对齐。让其中一个在后面、一个在右边，用 R U R\' U R U2 R\' U 交换另外两个。';

  @override
  String get lessonLastCorners => '黄色角块';

  @override
  String get lessonLastCornersDesc => '归位并翻转最后的角块。';

  @override
  String get stepPlaceCorners => '归位';

  @override
  String get stepPlaceCornersBody =>
      '把一个已经在正确位置的角块放在右前方。U R U\' L\' U R\' U\' L 会轮换另外三个；重复直到四个角块都归位。';

  @override
  String get stepTwistCorners => '翻转';

  @override
  String get stepTwistCornersBody =>
      '把未完成的角块放在右前方，重复 R\' D\' R D 直到黄色朝上，然后只转顶层把下一个角块转过来。底层在最后之前看起来都是乱的：继续就好。';

  @override
  String get lessonCfopIntro => '什么是 CFOP？';

  @override
  String get lessonCfopIntroDesc => '十字、F2L、OLL、PLL。';

  @override
  String get stepCfopOverview => '四个阶段';

  @override
  String get stepCfopOverviewBody =>
      '速拧玩家先做十字，再把第一层的每个角块和对应的中层棱块配对放入（F2L），然后调整顶层朝向（OLL），最后调整顶层位置（PLL）。';

  @override
  String get stepCfopCross => '规划十字';

  @override
  String get stepCfopCrossBody => '在 CFOP 中，十字在观察时间内规划好，然后用大约八步在底面完成。';

  @override
  String get lessonF2l => 'F2L 基础';

  @override
  String get lessonF2lDesc => '把角块和棱块配对。';

  @override
  String get stepF2lRight => '插入一组';

  @override
  String get stepF2lRightBody => '当一个角块和它的棱块在顶层挨在一起时，把它们转到槽位上方，一起插入。';

  @override
  String get stepF2lLeft => '左侧配对';

  @override
  String get stepF2lLeftBody =>
      '另一侧的同一情况就是镜像公式 U\' L\' U L。整体转动魔方（y）可以让你用更顺手的那只手。';

  @override
  String get lessonOll => '两步 OLL';

  @override
  String get lessonOllDesc => '让顶面全变成黄色。';

  @override
  String get stepOllCross => '先做棱块';

  @override
  String get stepOllCrossBody => '两步 OLL 从你已经学会的黄色十字公式开始。';

  @override
  String get stepOllSune => '小鱼公式';

  @override
  String get stepOllSuneBody =>
      '当只有左前方一个黄色角块朝上时，小鱼公式（R U R\' U R U2 R\'）能调整其余三个角块的朝向。大多数其他情况都可以用小鱼公式及其镜像解决。';

  @override
  String get lessonPll => '两步 PLL';

  @override
  String get lessonPllDesc => '完成魔方。';

  @override
  String get stepPllT => 'T 置换';

  @override
  String get stepPllTBody => 'T 置换交换两个角块和两个棱块。用它来归位角块：把需要交换的两个角块放在右边。';

  @override
  String get stepPllU => 'U 置换';

  @override
  String get stepPllUBody => '角块完成后，U 置换会轮换三个棱块。把已经完成的一面放在后面。';

  @override
  String get lessonTwoFirst => '2×2 第一层';

  @override
  String get lessonTwoFirstDesc => '拼出一面并让角块颜色相配。';

  @override
  String get stepTwoIntro => '只有角块';

  @override
  String get stepTwoIntroBody =>
      '2×2 就是没有棱块和中心块的 3×3。选一种颜色，在底面拼好这一面，并让相邻角块的侧面颜色一致。';

  @override
  String get stepTwoCorner => '插入角块';

  @override
  String get stepTwoCornerBody =>
      '和 3×3 的白色角块完全一样：把角块转到目标位置上方，重复 R U R\' U\' 直到它归位。';

  @override
  String get lessonTwoOll => '调整顶面朝向';

  @override
  String get lessonTwoOllDesc => '用小鱼公式做 Ortega OLL。';

  @override
  String get stepTwoSune => '又是小鱼';

  @override
  String get stepTwoSuneBody =>
      '小鱼公式在 2×2 上同样能让顶面变黄。Ortega 法要学七种简短情况，其中大多数都能用小鱼公式及其镜像解决。';

  @override
  String get lessonTwoPbl => '调整两层位置';

  @override
  String get lessonTwoPblDesc => '交换角块完成还原。';

  @override
  String get stepTwoAdjacent => '相邻交换';

  @override
  String get stepTwoAdjacentBody => '当顶层两个相邻角块需要交换时，把它们放在右边，使用 T 置换。';

  @override
  String get stepTwoDiagonal => '对角交换';

  @override
  String get stepTwoDiagonalBody => '位于对角位置的两个角块用 Y 置换交换。';

  @override
  String get lessonBigIntro => '高阶魔方的块';

  @override
  String get lessonBigIntroDesc => '中心、翼棱和切片。';

  @override
  String get stepBigPieces => '中心不固定';

  @override
  String get stepBigPiecesBody =>
      '在 4×4 上，每个面有四个可移动的中心块，每条棱由两个翼棱组成。降阶法把它们组合起来，让魔方像 3×3 一样还原。';

  @override
  String get stepBigSlices => '双层转动与内层转动';

  @override
  String get stepBigSlicesBody => 'Rw 同时转动右侧两层。2R 只转动从右数第二层。这些转动会移动中心块和翼棱。';

  @override
  String get lessonBigCenters => '中心';

  @override
  String get lessonBigCentersDesc => '拼合中心块。';

  @override
  String get stepBigCenterCycle => '中心三循环';

  @override
  String get stepBigCenterCycleBody =>
      '这个交换子只移动三个中心块，其余部分都不受影响，所以已完成的中心会保持完成状态。';

  @override
  String get lessonBigEdges => '棱块配对';

  @override
  String get lessonBigEdgesDesc => '把翼棱拼成完整的棱。';

  @override
  String get stepBigEdgePair => '配对并复原';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' 让两个相同的翼棱对齐，R U R\' F R\' F\' R 换入一个未配对的棱，Uw 再把中心复原。';

  @override
  String get lessonBigParity => '奇偶校验';

  @override
  String get lessonBigParityDesc => '偶数阶魔方的 OLL 奇偶和 PLL 奇偶。';

  @override
  String get stepBigOllParity => 'OLL 奇偶';

  @override
  String get stepBigOllParityBody =>
      '3×3 上不可能只有一个棱块翻转。在偶数阶魔方上，这个公式会把顶层前方的棱块翻回来。它可能打乱顶层的其余部分，不过 3×3 的最后几步本来就会处理好。';

  @override
  String get stepBigPllParity => 'PLL 奇偶';

  @override
  String get stepBigPllParityBody =>
      '最后有两个棱块互换了？2R2 U2 2R2 Uw2 2R2 Uw2 会交换顶层前后两个棱块。';
}
