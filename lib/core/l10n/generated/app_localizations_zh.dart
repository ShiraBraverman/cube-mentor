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
  String get cubeComingSoon => '新魔方即将推出';

  @override
  String get carouselPrevious => '上一个魔方';

  @override
  String get carouselNext => '下一个魔方';

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
  String get solveFast => '快速还原';

  @override
  String get solveLearn => '一步步学习';

  @override
  String get solveModeGuided => '引导（三顶皇冠）';

  @override
  String get solveModeFast => '快速（最优）';

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
  String get previousMove => '上一步';

  @override
  String get halfTurnHalfway => '很好，已经完成一半！同一层朝同一方向再转一次，就完成 180° 转动。';

  @override
  String get wideTurnInner => '太棒了！现在滑动相邻的内层，完成双层转动。';

  @override
  String get wideTurnOuter => '太棒了！现在滑动相邻的外层，完成双层转动。';

  @override
  String get wideTurnMore => '太棒了！继续逐层滑动发光的层，完成双层转动。';

  @override
  String get guideSwipeHint => '按箭头方向滑动发光的层，或点按“下一步”。';

  @override
  String get guideRotateHint => '按箭头所示转动整个魔方，然后点按“下一步”。';

  @override
  String get guideWrongMove => '请按照高亮箭头操作';

  @override
  String get guideExit => '退出引导';

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
  String get phaseLblCross => '白色十字';

  @override
  String get phaseLblCorners => '第一层角块';

  @override
  String get phaseLblMiddle => '中层棱块';

  @override
  String get phaseLblYellowCross => '黄色十字';

  @override
  String get phaseLblYellowEdges => '对齐黄色十字的棱块';

  @override
  String get phaseLblYellowCorners => '归位黄色角块';

  @override
  String get phaseLblYellowCornersOrient => '翻转黄色角块';

  @override
  String get crownFirst => '第一顶皇冠';

  @override
  String get crownSecond => '第二顶皇冠';

  @override
  String get crownThird => '第三顶皇冠';

  @override
  String get crownFirstGoal => '白色面与第一层';

  @override
  String get crownSecondGoal => '中层';

  @override
  String get crownThirdGoal => '黄色面与最后一层';

  @override
  String get subStepGoal11 => '拼出白色十字，并让每个白色棱块的侧面颜色与相邻中心一致。';

  @override
  String get subStepGoal12 => '把 4 个白色角块放入对应位置，完成白色面和整个第一层。';

  @override
  String get subStepGoal21 => '在不破坏第一顶皇冠的前提下，插入中层的 4 个棱块。';

  @override
  String get subStepGoal31 => '在最后一层拼出黄色十字。';

  @override
  String get subStepGoal32 => '交换黄色十字的棱块，直到每个棱块都与侧面中心对齐。';

  @override
  String get subStepGoal33 => '把 4 个黄色角块移到正确的位置，即使它们的朝向还不对。';

  @override
  String get subStepGoal34 => '原地翻转每个黄色角块，直到所有贴纸对齐、魔方还原。';

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
  String get scanTurnLeft => '将整个魔方向左转';

  @override
  String get scanTurnRight => '将整个魔方向右转';

  @override
  String get scanTipTop => '把顶面朝你翻转';

  @override
  String get scanTipBottom => '把底面朝你翻转';

  @override
  String get scanGlareTip => '检测到反光：稍微倾斜魔方，或把手机举在魔方上方挡住顶灯。';

  @override
  String get scanDimTip => '光线太暗：请换到更亮的地方，或打开手电筒。';

  @override
  String get scanTorch => '手电筒';

  @override
  String get scanGuideLabel => '扫描指南：已扫描的面会显示颜色。点按已扫描的面可重新扫描。';

  @override
  String get scanTapToRescan => '点按已扫描的面可重新扫描。';

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
  String lessonPartOf(int index, int total) {
    return '第 $index 部分，共 $total 部分';
  }

  @override
  String get lessonNext => '下一步';

  @override
  String get lessonPrevious => '上一步';

  @override
  String get lessonFinish => '完成课程';

  @override
  String get lessonComplete => '课程完成！';

  @override
  String get lessonNextLesson => '下一课';

  @override
  String get lessonBackToAcademy => '返回学院';

  @override
  String get lessonTryIt => '轮到你了：滑动箭头所指的层，或点按“下一步”。';

  @override
  String get lessonLookAround => '拖动背景，从各个角度观察魔方。';

  @override
  String get lessonDemoDone => '很好！点按“下一步”继续。';

  @override
  String holdPrompt(String top, String front) {
    return '拿好魔方：$top色中心朝上，$front色中心朝向你。';
  }

  @override
  String get trackBeginner => '3×3 新手：三顶皇冠';

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

  @override
  String get introGoalHeading => '目标是什么？';

  @override
  String get introHowHeading => '怎么做？';

  @override
  String get introStart => '明白了，开始分步学习';

  @override
  String get introDontShowAgain => '不再自动显示';

  @override
  String get introShowGoal => '查看目标';

  @override
  String get introStateStart => '开始';

  @override
  String get introStateGoal => '目标';

  @override
  String get introPlayMorph => '从开始播放到目标';

  @override
  String get introGoalBasics => '学会读懂魔方：它的块、六个面，以及转动符号怎样转动它们。';

  @override
  String get introGoalCross => '拼出白色十字，并让每个白色棱块的侧面颜色与相邻中心一致。';

  @override
  String get introGoalCorners => '放好四个白色角块，完成第一个王冠，也就是整个白色层。';

  @override
  String get introGoalMiddle => '放好中间层的四个棱块，前两层就完成了。';

  @override
  String get introGoalYellowCross => '在顶面拼出黄色十字；侧面颜色暂时不用对齐。';

  @override
  String get introGoalYellowEdges => '让黄色十字的每个棱块与它所在侧的中心颜色一致。';

  @override
  String get introGoalYellowCorners => '把每个黄色角块移到自己的位置，即使它还没转正。';

  @override
  String get introGoalTwistCorners => '把黄色角块转到正确颜色，整个魔方就完成了。';

  @override
  String get introGoalCfopIntro => '了解速拧的思路：十字、前两层，再分两步完成最后一层。';

  @override
  String get introGoalF2l => '把每个白色角块和它的中层棱块一起放入，一次完成两层。';

  @override
  String get introGoalOll => '用一两个公式让整个顶面变成黄色。';

  @override
  String get introGoalPll => '把最后一层的块移到正确位置，完成魔方。';

  @override
  String get introGoalTwoFirst => '在 2×2 上完成一整层白色。';

  @override
  String get introGoalTwoOll => '让 2×2 的顶面全部变成黄色。';

  @override
  String get introGoalTwoPbl => '交换最后的角块，完成 2×2。';

  @override
  String get introGoalBigIntro => '认识 4×4：中心块、棱块对、角块，以及转动它们的符号。';

  @override
  String get introGoalBigCenters => '把每个面的中心块拼成一整块同色区域。';

  @override
  String get introGoalBigEdges => '把颜色相同的棱块配对，让每条棱看起来像 3×3 的一个棱块。';

  @override
  String get introGoalBigParity => '解决 3×3 不会出现的两种 4×4 情况：一个翻转的棱块，或两个互换的棱块。';

  @override
  String get introHowBasics =>
      '中心块从不移动，所以它们决定每个面的颜色。\n每个字母把一个面顺时针转 90°。\n撇号（\'）表示反方向，2 表示转两次。';

  @override
  String get introHowCross =>
      '黄色朝上拿：白色十字在底面完成。\n找到一个白色棱块，把它的侧面颜色对准相同颜色的中心。\n把这个面转两次，让棱块落到位。';

  @override
  String get introHowCorners =>
      '把一个白色角块转到它的空位上方。\n重复 R U R\' U\'，直到它以正确方向落入。\n其余三个角块也照做。';

  @override
  String get introHowMiddle =>
      '找一个不含黄色的顶层棱块，把它的前面颜色对准中心。\n用一个 8 步的短公式把它送到右边或左边。\n白色层每次都会完好地回来。';

  @override
  String get introHowYellowCross =>
      '看顶面：一个点、一个 L 形或一条线。\n按图示拿好，做 F R U R\' U\' F\'。\n重复直到出现黄色十字。';

  @override
  String get introHowYellowEdges =>
      '转动顶层，直到有两个棱块与中心对齐。\n把它们放在后面和右边，然后做 R U R\' U R U2 R\' U。\n重复直到四个都对齐。';

  @override
  String get introHowYellowCorners =>
      '角块的颜色与周围三个面一致时，它就在正确位置。\n把一个已归位的角块放在右前方。\nU R U\' L\' U R\' U\' L 轮换另外三个，直到全部归位。';

  @override
  String get introHowTwistCorners =>
      '把一个未完成的角块拿在右前方。\n重复 R\' D\' R D，直到它的黄色朝上。\n下一个只转顶层；底层最后会自己复原。';

  @override
  String get introHowCfopIntro =>
      '十字：在观察时规划好四个棱块。\nF2L：每个角块和它的棱块一起放入。\nOLL 让顶面全黄，然后 PLL 把各块送回原位。';

  @override
  String get introHowF2l => '在顶层找到一个角块和与它配对的棱块。\n在槽位上方把它们组成一对。\n用三四步把这一对放进去。';

  @override
  String get introHowOll =>
      '先用 F R U R\' U\' F\' 做出黄色十字。\n再调整角块朝向，例如用 Sune。\n根据看到的黄色图案识别情况。';

  @override
  String get introHowPll =>
      '顶面已经全是黄色。\nT-perm 交换角块；U-perm 轮换三个棱块。\n看侧面颜色来选择公式。';

  @override
  String get introHowTwoFirst =>
      '2×2 只有角块，就像没有棱块的 3×3。\n把每个白色角块转到它的位置上方。\n重复 R U R\' U\'，直到它落入。';

  @override
  String get introHowTwoOll =>
      '白色层保持在底部。\nSune（R U R\' U R U2 R\'）会翻转顶层角块。\n从正确角度重复，直到顶面全黄。';

  @override
  String get introHowTwoPbl =>
      '找一个已有两个角块对齐的侧面。\n相邻交换：一个类似 T-perm 的公式。\n对角交换：一个稍长的公式。';

  @override
  String get introHowBigIntro =>
      '没有固定的中心：四个中心块组成一个面的颜色。\n像 Rw 这样的双层转动一次转两层。\n像 2R 这样的内层转动只转一个内层。';

  @override
  String get introHowBigCenters =>
      '先拼好两个相对的中心。\n用内层交换中心块，不会破坏已拼好的中心。\n用同样方法完成最后四个中心。';

  @override
  String get introHowBigEdges => '找到两个颜色相同的棱块。\n用内层把它们并排对齐。\n把这一对移开，再把中心恢复。';

  @override
  String get introHowBigParity =>
      '像 3×3 一样还原 4×4，直到卡住。\n一个翻转的棱块：较长的 OLL 奇偶公式。\n两个互换的棱块：2R2 U2 2R2 Uw2 2R2 Uw2。';

  @override
  String get dirFaceR => '右侧';

  @override
  String get dirFaceL => '左侧';

  @override
  String get dirFaceU => '顶层';

  @override
  String get dirFaceD => '底层';

  @override
  String get dirFaceF => '前面';

  @override
  String get dirFaceB => '后面';

  @override
  String get dirMiddle => '中间层';

  @override
  String get dirWholeCube => '整个魔方';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face，第 $depth 层';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face，$depth 层深';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face，第 $near–$far 层';
  }

  @override
  String get dirUp => '向上';

  @override
  String get dirDown => '向下';

  @override
  String get dirLeft => '向左';

  @override
  String get dirRight => '向右';

  @override
  String get dirClockwise => '顺时针';

  @override
  String get dirCounter => '逆时针';

  @override
  String get dirBackClockwise => '顺时针（从后面看）';

  @override
  String get dirBackCounter => '逆时针（从后面看）';

  @override
  String get dirHalf => '转两次（180°）';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => '隐藏详情';

  @override
  String get solveExpand => '显示详情';

  @override
  String get dailyScrambleSteps => '逐步打乱';

  @override
  String get dailyScrambleGuide => '3D 打乱向导';

  @override
  String get dailyShowMoves => '显示文字步骤';

  @override
  String get dailyHideMoves => '隐藏文字步骤';

  @override
  String get dailyScrambleGuideTitle => '打乱向导';

  @override
  String get phaseDailyScramble => '打乱今天的魔方';

  @override
  String get explainDailyScramble => '从复原的魔方开始，白色朝上、绿色朝前，在实体魔方上照做每一步转动。';

  @override
  String get stageCenters => '拼出中心块';

  @override
  String get stageEdges => '配对外层与内层棱块';

  @override
  String get stageParity => '解决奇偶校验';

  @override
  String get stageCrown1 => '第一顶王冠（白色）';

  @override
  String get stageCrown2 => '第二顶王冠';

  @override
  String get stageCrown3 => '第三顶王冠（黄色）';

  @override
  String get stageOrient => '调整块的朝向';

  @override
  String get stageFinish => '完成魔方';

  @override
  String get stageAsThree => '按 3×3 还原';

  @override
  String get stageTwoByTwo => '还原 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return '第 $number/$total 阶段：$title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return '王冠 $crown • 第 $number/$total 阶段：$title';
  }

  @override
  String get solveAllStagesDone => '所有阶段都完成了，太棒了！';

  @override
  String get trackFiveByFive => '5×5 教授魔方';

  @override
  String get trackSixBySix => '6×6 魔方';

  @override
  String get lessonFiveIntro => '认识 5×5';

  @override
  String get lessonFiveIntroDesc => '固定中心、中心条、中棱和翼棱。';

  @override
  String get introGoalFiveIntro => '认识 5×5：固定中心、中心条、中棱和翼棱。';

  @override
  String get introHowFiveIntro =>
      '每个面正中间的块永远不动。\n每条棱由一个中棱和两个翼棱组成。\n内层转动能移动块而不碰外面。';

  @override
  String get lessonFiveCenters => '5×5 中心';

  @override
  String get lessonFiveCentersDesc => '用三格中心条拼每个中心。';

  @override
  String get introGoalFiveCenters => '在每个面拼出同色的 3×3 中心块。';

  @override
  String get introHowFiveCenters =>
      '从正中间的块开始：它决定颜色。\n拼出三格中心条，用内层把它推进去。\n最后两个中心一起完成。';

  @override
  String get lessonFiveEdges => '5×5 棱块';

  @override
  String get lessonFiveEdgesDesc => '把两个翼棱与中棱合在一起。';

  @override
  String get introGoalFiveEdges => '把每个中棱和它的两个翼棱合在一起，让 12 条棱看起来像一整块。';

  @override
  String get introHowFiveEdges =>
      '在前面把两个翼棱对准它们的中棱。\n转内层，换进一条未完成的棱，再转回来。\n配对最后几条棱时不破坏已完成的。';

  @override
  String get lessonFiveSolve => '按 3×3 还原 5×5';

  @override
  String get lessonFiveSolveDesc => '用三顶王冠收尾。';

  @override
  String get introGoalFiveSolve => '把降阶后的 5×5 像 3×3 一样，一顶王冠一顶王冠地还原。';

  @override
  String get introHowFiveSolve =>
      '从现在起只用外层转动。\n第一顶王冠、第二顶，然后是黄色王冠。\n固定中心显示每个面的颜色。';

  @override
  String get lessonFiveParity => '5×5 棱块奇偶';

  @override
  String get lessonFiveParityDesc => '修好两个翼棱互换的棱。';

  @override
  String get introGoalFiveParity => '修好两个翼棱互换的那一条棱，然后完成还原。';

  @override
  String get introHowFiveParity => '它表现为一条怎么也配不上的棱。\n做一次较长的内层修正公式。\n其他一切都回到原位。';

  @override
  String get lessonSixIntro => '认识 6×6';

  @override
  String get lessonSixIntroDesc => '没有固定中心，每条棱有四块。';

  @override
  String get introGoalSixIntro => '认识 6×6：每个面 16 个中心块，每条棱 4 块。';

  @override
  String get introHowSixIntro =>
      '没有固定中心：拼的时候由你决定颜色。\n每条棱有外翼棱和内翼棱。\n宽层转动最多能动三层。';

  @override
  String get lessonSixCenters => '6×6 中心';

  @override
  String get lessonSixCentersDesc => '用四格中心条拼 4×4 中心。';

  @override
  String get introGoalSixCenters => '在每个面拼出同色的 4×4 中心块。';

  @override
  String get introHowSixCenters =>
      '先拼两个相对的中心。\n拼出四格中心条并把它们合在一起。\n用“内层、顶层、撤回”技巧一次移动一块。';

  @override
  String get lessonSixEdges => '6×6 棱块';

  @override
  String get lessonSixEdgesDesc => '集齐每条棱的四块。';

  @override
  String get introGoalSixEdges => '集齐每条棱的四块，让 6×6 有 12 条整齐的棱。';

  @override
  String get introHowSixEdges => '在前面排好外翼棱和内翼棱。\n深的宽层负责把棱送进送出。\n已完成的棱永远不会被拆散。';

  @override
  String get lessonSixSolve => '按 3×3 还原 6×6';

  @override
  String get lessonSixSolveDesc => '用三顶王冠收尾。';

  @override
  String get introGoalSixSolve => '把降阶后的 6×6 像 3×3 一样，一顶王冠一顶王冠地还原。';

  @override
  String get introHowSixSolve =>
      '从现在起只用外层转动。\n你拼好的中心显示每个面的颜色。\n第一顶王冠、第二顶，然后是黄色王冠。';

  @override
  String get lessonSixParity => '6×6 奇偶校验';

  @override
  String get lessonSixParityDesc => '一条棱翻转或两条棱互换。';

  @override
  String get introGoalSixParity => '解决 3×3 不会出现的两种 6×6 情况：一条棱翻转，或两条棱互换。';

  @override
  String get introHowSixParity =>
      '像 3×3 一样还原，直到卡住。\n一条棱翻转：较长的奇偶修正。\n两条棱互换：用双层转动的短修正。';

  @override
  String get stepFivePieces => '5×5 的块';

  @override
  String get stepFivePiecesBody =>
      '每个面正中间的块不动，所以和 3×3 一样决定面的颜色。它周围还有 8 个中心块；每条棱有一个中棱和两个翼棱，角块和 3×3 一样。';

  @override
  String get stepFiveSlices => '三种转动';

  @override
  String get stepFiveSlicesBody =>
      '外层转动转一个面。宽层转动把面和后面的一层一起转。内层转动只转里面的一层：块就这样换位置，而外面不受影响。';

  @override
  String get stepFiveCenterBar => '中心条';

  @override
  String get stepFiveCenterBarBody =>
      '拼出三个同色中心块排成一行，再用内层转动把它移到同色中心旁边。三条中心条组成一个完整的中心。';

  @override
  String get stepFiveCenterSwap => '换块不破坏';

  @override
  String get stepFiveCenterSwapBody =>
      '要单独移动一个中心块：转内层，转顶层，撤回内层，再把顶层转回来。已完成的中心每次都会复原。';

  @override
  String get stepFiveEdgePair => '翼棱接上中棱';

  @override
  String get stepFiveEdgePairBody =>
      '在前面把两个翼棱放到中棱旁边，把内层转下去，从上面带入一条未完成的棱，再把内层转回来。';

  @override
  String get stepFiveEdgeLast => '最后几条棱';

  @override
  String get stepFiveEdgeLastBody => '只剩几条棱时，用宽层转动、短触发和宽层转回，就能配好它们而不破坏已完成的棱。';

  @override
  String get stepFiveAsThree => '现在它是 3×3 了';

  @override
  String get stepFiveAsThreeBody =>
      '中心和棱都完成后，5×5 就像一个大 3×3。只用外层转动，依次完成三顶王冠：白色十字和角块、中间层，然后是黄色层。';

  @override
  String get stepFiveEdgeParity => '换回最后一条棱的翼棱';

  @override
  String get stepFiveEdgeParityBody =>
      '有时最后一条棱的两个翼棱是互换的。一段较长的内层公式会把它们换回来，其他块都回到原位。之后按 3×3 完成。';

  @override
  String get stepSixPieces => '6×6 的块';

  @override
  String get stepSixPiecesBody =>
      '和 4×4 一样，6×6 没有固定中心：16 个中心块组成每个面的颜色。每条棱有四块：两个外翼棱和两个内翼棱。';

  @override
  String get stepSixSlices => '转动更深的层';

  @override
  String get stepSixSlicesBody => '宽层转动可以从一个面带动两层或三层。第二或第三层的内层转动是处理中心和棱的工具。';

  @override
  String get stepSixCenterBar => '四格中心条';

  @override
  String get stepSixCenterBarBody => '拼出四个同色中心块排成一行，用内层转动把它们并排放好，直到整个面同色。';

  @override
  String get stepSixCenterSwap => '一次一块';

  @override
  String get stepSixCenterSwapBody => '转第三层，转顶层，撤回，再转回：一个中心块移动，已完成的中心复原。';

  @override
  String get stepSixEdgePair => '四块拼一条棱';

  @override
  String get stepSixEdgePairBody => '用深的宽层把一条棱的四块集中到前面，带入一条未完成的棱，再把宽层转回来。';

  @override
  String get stepSixEdgeLast => '最后几条棱';

  @override
  String get stepSixEdgeLastBody => '在深宽层转动和撤回之间插入短触发来配好最后的棱，已完成的棱保持不散。';

  @override
  String get stepSixAsThree => '现在它是 3×3 了';

  @override
  String get stepSixAsThreeBody => '有了 4×4 中心和配好的棱，用外层转动和三顶王冠把 6×6 当作 3×3 还原。';

  @override
  String get stepSixOllParity => '一条棱翻转';

  @override
  String get stepSixOllParityBody =>
      '如果还原最后一层时只有一条棱看起来是翻的，那就是奇偶。把它放在顶层前面，做较长的修正：前两顶王冠会完好地回来。';

  @override
  String get stepSixPllParity => '两条棱互换';

  @override
  String get stepSixPllParityBody => '如果最后看到两条棱互换了，把它们放在顶层的前面和后面，做用内层双转的短修正。';

  @override
  String get stageTwoFirstLayer => '完成底层';

  @override
  String get stageTwoTopColor => '让顶面变成同一种颜色';

  @override
  String get stageTwoFinish => '完成角块';

  @override
  String get explainTwoFirstLayer => '完成底层：四个角块彼此对齐，并与侧面颜色一致。';

  @override
  String get explainTwoTopColor => '保持底层不动，转到顶面四个贴纸颜色相同。';

  @override
  String get explainTwoFinish => '把最后的角块移到正确位置，完成魔方。';
}
