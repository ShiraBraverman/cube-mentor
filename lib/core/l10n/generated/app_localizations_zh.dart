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
  String get timerInspectionToggle => '15 秒观察';

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

  @override
  String get tabSolve => '还原';

  @override
  String get tabScan => '扫描';

  @override
  String get tabAcademy => '学院';

  @override
  String get tabTrain => '训练';

  @override
  String get openCubeSolver => '打开 3D 魔方与求解器';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => '训练';

  @override
  String get trainSubtitle => '每天磨练你的技巧。';

  @override
  String get settings => '设置';

  @override
  String get settingsSoundHaptics => '声音与振动';

  @override
  String get settingsSoundHapticsDesc => '转动魔方时的点击声和振动。';

  @override
  String get settingsAnimationSpeed => '默认动画速度';

  @override
  String get settingsAnimationSpeedDesc => '播放步骤时魔方转动的速度。';

  @override
  String get settingsResetProgress => '重置进度';

  @override
  String get settingsResetProgressDesc => '清除已完成的学院课程和每日连胜记录。';

  @override
  String get resetProgressTitle => '要重置所有进度吗？';

  @override
  String get resetProgressBody => '已完成的课程和每日连胜记录将被清除，且无法撤销。';

  @override
  String get resetProgressDone => '进度已重置。';

  @override
  String get cancel => '取消';

  @override
  String get settingsPrivacyAds => '隐私与广告';

  @override
  String get settingsPrivacyAdsDesc => '查看或更改你的广告同意选项。';

  @override
  String get playbackPrevious => '上一步';

  @override
  String get playbackNext => '下一步';

  @override
  String fastSolveMoves(int count) {
    return '$count 步完成还原！';
  }

  @override
  String get feedbackTitle => '一起打造下一个版本';

  @override
  String get feedbackBody => '想建议新功能，或参与塑造 CubeMentor 的下一个版本？欢迎发邮件至：';

  @override
  String get feedbackEmailCopied => '未找到邮件应用，已将邮箱地址复制到剪贴板。';

  @override
  String get adWatchToUnlock => '看广告解锁';

  @override
  String get adLoading => '正在加载短视频…';

  @override
  String get adRewardNotEarned => '完整观看视频即可解锁。';

  @override
  String get adUnavailableFreePass => '暂时没有可用视频，本次免费解锁。';

  @override
  String get settingsPrivacyAdsError => '无法打开隐私选项，请稍后重试。';

  @override
  String get nicknamePromptTitle => '我们该怎么称呼你？';

  @override
  String get nicknamePromptBody => '每次还原成功，我们都会喊着你的名字为你喝彩。';

  @override
  String get nicknameHint => '你的名字或昵称';

  @override
  String get nicknameSave => '保存';

  @override
  String get settingsNickname => '你的名字';

  @override
  String get settingsNicknameNotSet => '未设置 — 点按添加';

  @override
  String celebrateNamed(String name) {
    return '干得好，$name！';
  }

  @override
  String get celebrateAnon => '干得好！';

  @override
  String get celebrateCubeSolved => '魔方还原成功！';

  @override
  String get celebrateDailyDone => '每日挑战完成！';

  @override
  String fastSolveRatio(int count, int limit) {
    return '$count / $limit 步';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    return '任何打乱都能在 $limit 步以内还原';
  }

  @override
  String get patternsWatchVideo => '观看视频';

  @override
  String get patternsNotNow => '以后再说';

  @override
  String get settingsColorScheme => '魔方配色';

  @override
  String get colorSchemeWestern => '西方配色';

  @override
  String get colorSchemeJapanese => '日本配色';

  @override
  String get colorSchemeWesternDesc => '白对黄，蓝对绿';

  @override
  String get colorSchemeJapaneseDesc => '白对蓝，黄对绿';

  @override
  String dailyYourTime(String time) {
    return '你的用时：$time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return '你有 $seconds 秒观察魔方。点按开始倒计时。';
  }

  @override
  String get timerInspectTapReady => '准备好后点按开始复原';

  @override
  String timerInspectPlus2(int seconds) {
    return '观察超过 $seconds 秒，计时已自动开始：罚时 +2 秒';
  }

  @override
  String timerAvgOf(int count) {
    return '$count 次平均';
  }

  @override
  String get timerAvgNote => '平均成绩会去掉最快和最慢的成绩';

  @override
  String get timerPbSub => '最佳单次';

  @override
  String get timerPlus2Caption => '罚时 +2 秒';

  @override
  String get timerDnfCaption => '未完成（DNF）';

  @override
  String get timerDeleteCaption => '删除这次成绩';

  @override
  String get patternBullsEye => '靶心';

  @override
  String get patternFramedCenter => '框形中心';

  @override
  String get patternBlockCheckerboard => '方块棋盘';

  @override
  String get patternCubeInCubeInCube => '三层魔方中魔方';

  @override
  String get patternUnionJack => '米字旗';

  @override
  String get patternKilt => '苏格兰裙';

  @override
  String get patternSixTs => '六个 T';

  @override
  String get patternTwinPeaks => '双峰';

  @override
  String get patternSpiral => '螺旋';

  @override
  String get patternTetris => '俄罗斯方块';

  @override
  String get patternSpots => '中心圆点';

  @override
  String get patternStripes => '条纹';

  @override
  String get patternAnaconda => '森蚺';

  @override
  String get patternZigzag => '之字形';

  @override
  String get patternFourSpots => '四个圆点';

  @override
  String get patternGreenMamba => '绿曼巴';

  @override
  String get patternPlusMinus => '加减号';

  @override
  String guideStepCounter(int current, int total) {
    return '第 $current / $total 步';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return '转动 $current / $total';
  }

  @override
  String get dailyStep1Title => '第 1 步：打乱你的魔方';

  @override
  String get dailyStep2Title => '第 2 步：复原魔方';

  @override
  String dailyPersonalBest(String time) {
    return '个人最佳：$time';
  }

  @override
  String get dailyRecentDays => '最近记录';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '连续 $count 天！势不可挡！',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => '魔方已打乱！现在去复原吧';

  @override
  String get dailyCongratsTitle => '恭喜！';

  @override
  String dailyCongratsBody(String time) {
    return '你用 $time 完成了今天的挑战。';
  }

  @override
  String get dailyCongratsDone => '返回挑战';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $count 个图案';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '剩余 $hours 小时';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '剩余 $minutes 分钟';
  }

  @override
  String get lockedLabel => '已锁定';

  @override
  String get unlockedLabel => '已解锁';

  @override
  String patternUnlockBody(int hours) {
    return '观看 1 个短视频，即可解锁此图案及其分步指南 $hours 小时。';
  }

  @override
  String lessonUnlockBody(int hours) {
    return '观看 1 个短视频，即可在接下来的 $hours 小时内随时打开本课。';
  }

  @override
  String get bigCubeUnlockTitle => '还原高阶魔方';

  @override
  String bigCubeUnlockBody(int hours) {
    return '你已用完 4×4–6×6 的免费还原次数。观看 1 个短视频，即可在接下来的 $hours 小时内还原高阶魔方。';
  }

  @override
  String get doubleTurnBadge => '转两次 · 180°';

  @override
  String get homeAcademy => '学院';

  @override
  String get homePatterns => '酷炫图案';

  @override
  String get homePractice => '计时器与每日挑战';

  @override
  String get scanChoiceSubtitle => '想怎么开始？';

  @override
  String get scanChoiceCamera => '用相机扫描';

  @override
  String get scanChoiceCameraDesc => '把每个面对准相机，即可获得解法。';

  @override
  String get scanChoice3d => '打开 3D 魔方';

  @override
  String get scanChoice3dDesc => '转动虚拟魔方，打乱后一步步还原。';

  @override
  String get academyAllSizes => '全部尺寸';

  @override
  String homeAcademyProgress(int done, int total) {
    return '已完成 $done / $total 课';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • 已完成 $done / $total';
  }

  @override
  String get lessonStageConcept => '讲解';

  @override
  String get lessonStageExamples => '示例';

  @override
  String get lessonStagePractice => '实战';

  @override
  String get lessonStageNext => '继续 / 自由';

  @override
  String lessonStageOf(int index, int total, String name) {
    return '第 $index 阶段，共 $total 阶段：$name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return '示例 $index/$total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return '实战 $index/$total';
  }

  @override
  String get lessonBonusCase => '额外情况';

  @override
  String get lessonPracticeIntro => '真实打乱：只有前面的步骤已完成。跟着提示一条条来，把这一整步完成。';

  @override
  String lessonContinueDesc(String lesson) {
    return '直接进入「$lesson」。';
  }

  @override
  String get lessonFreePractice => '自由练习';

  @override
  String get lessonFreePracticeDesc => '自己还原一个打乱的 3D 魔方，从头一直到这一步。';

  @override
  String freePracticeBanner(String topic) {
    return '自由练习：从头开始，把魔方还原到「$topic」！';
  }

  @override
  String get pieceColorSeparator => '·';

  @override
  String cueFaceTurn(String face) {
    return '按箭头方向转动$face色中心所在的面。中心不动，只有它周围的块在移动。';
  }

  @override
  String cueTrigger(String front) {
    return '右手公式，$front色朝向你：右面向上，顶层向左，右面向下，顶层向右回来。';
  }

  @override
  String get cueTriggerBack => '连续做第六次，魔方就会完全回到原来的样子。六就是神奇数字！';

  @override
  String cueSliceInner(String face) {
    return '只转动紧挨$face色面的内层。这个面本身不动，所以中心会被分开。';
  }

  @override
  String cueSliceWide(String face) {
    return '宽层转动：$face色面和旁边的内层一起转，就像一层厚厚的层。';
  }

  @override
  String cueTurnCube(String top, String front) {
    return '整体转动魔方，让$top色中心朝上、$front色中心朝向你。';
  }

  @override
  String get cueTurnTop => '按箭头只转动顶层，为下一个公式做准备。';

  @override
  String get cueAlignTop => '最后一步：转动顶层把颜色对齐。完成！';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece棱块在顶层。转动顶层，直到它正好在$center色中心上方，然后把这一面转两次，让它落下去。';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece棱块卡在中层。把它提到顶层，对准$center色中心上方，再把它放下去。';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece棱块位置对了，但方向反了：白色朝向侧面。先把它取出来，再以正确方向放回$center色中心旁边。';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP 里也可以转底层。把$piece棱块放下去，再转动底层让它对准$center色中心。';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return '转动顶层，让$piece角块正好在它的位置上方，也就是$a色和$b色两面之间。重复右手公式，直到它以正确方向落进去。';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece角块在自己的位置上，但方向转错了。做一次公式就会把它取出（一个黄色角块会换进去）；继续重复，直到它正确地回到原位。';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return '转动顶层，直到$piece棱块对准$a色中心，然后把它送到右下方，$a色和$b色之间的槽位。';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return '转动顶层，直到$piece棱块对准$a色中心，然后把它送到左下方，$a色和$b色之间的槽位。';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece棱块在槽位里，但方向反了。先把一个黄色棱块插进去把它顶出来，再把它重新插入$a色和$b色之间。';
  }

  @override
  String cueYellowLine(String front) {
    return '黄色一字：转动顶层让它左右横放，保持$front色朝向你，然后做黄色十字公式。';
  }

  @override
  String cueYellowL(String front) {
    return '黄色 L 形：转动顶层让 L 指向左后方，保持$front色朝向你，然后做公式。它会变成一字。';
  }

  @override
  String cueYellowDot(String front) {
    return '只有中心是黄色：一个点。保持$front色朝向你，做一次公式，就会得到 L 形。';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return '转动顶层，直到$piece棱块和$center色中心对上。';
  }

  @override
  String cueEdgesSwap(String front) {
    return '两个对好的棱块在后面和右边。保持$front色朝向你，做交换公式：前面和左边的棱块互换位置。';
  }

  @override
  String cueEdgesOpposite(String front) {
    return '对好的棱块彼此相对。保持$front色朝向你做一次交换；之后会有两个相邻的棱块对好。';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece角块已经在自己的位置上。把它放在右前方，保持$front色朝向你，轮换另外三个角块。';
  }

  @override
  String cueCornersNone(String front) {
    return '还没有黄色角块在自己的位置上。保持$front色朝向你轮换一次；之后就会有一个角块归位。';
  }

  @override
  String cueTwistCorner(String piece) {
    return '调整右前方的$piece角块：重复下层公式，直到它的黄色朝上。下面几层暂时看起来是乱的，这很正常！';
  }

  @override
  String cueTwistFour(String piece) {
    return '这次$piece角块需要做四次。继续：黄色总会在两次或四次后朝上。';
  }

  @override
  String get cueTwistNext => '只转动顶层，把下一个方向不对的角块转到右前方。现在不要整体转动魔方！';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return '在顶层把$piece角块和$edge棱块配成一对，然后把这一对插入$a色和$b色之间的槽位。';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece角块和错误的棱块一起卡在槽位里。先把它取到顶层，再配对插入。';
  }

  @override
  String cueOllSune(String front) {
    return '保持$front色朝向你，做 Sune，让黄色角块朝上。';
  }

  @override
  String cueOllSuneAgain(String front) {
    return '这次一个 Sune 不够。转动顶层，保持$front色朝向你，再做一次 Sune。';
  }

  @override
  String cuePllCorners(String front) {
    return '有两个角块需要交换。把颜色相同的一对（车灯）放在左边，保持$front色朝向你，做 T-perm。';
  }

  @override
  String cuePllEdges(String piece) {
    return '角块已完成。把$piece棱块放在后面，用 U-perm 轮换另外三个棱块。';
  }

  @override
  String get cuePllNoEdge => '顶层还没有棱块和中心对上。从任意一面做一次 U-perm；之后就会有一个对上。';

  @override
  String cueTwoSwapAdjacent(String front) {
    return '顶层两个相邻的角块需要交换。把颜色相同的一对放在左边，保持$front色朝向你，做交换公式。';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return '需要交换的两个角块位于对角。保持$front色朝向你，做对角交换。';
  }

  @override
  String cueCenterCycle(String color) {
    return '用中心三循环把走散的$color色中心块送回家：内层、顶层、内层，然后全部还原。';
  }

  @override
  String cueCenterBar(String color) {
    return '一整条$color色中心块在错误的面上。用内层把它抬上去，转动顶层，再把它送回原位。';
  }

  @override
  String cueEdgePair(String piece) {
    return '把$piece棱的两个小块配对：先对齐，转动内层，用右手动作换入一个未配对的棱，再把内层转回来。';
  }

  @override
  String cueEdgeLast(String piece) {
    return '最后的棱：用最后两棱公式配好$piece棱，已完成的棱都不会被打乱。';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL 特殊情况：顶层有一个棱块翻转了，这在三阶上从不会发生。把它放在前面，保持$front色朝向你，做特殊情况修正公式。';
  }

  @override
  String get cueParityPll =>
      'PLL 特殊情况：顶层两个棱块互换了，这在三阶上从不会发生。把它们放在前面和后面，做特殊情况交换公式。';

  @override
  String cueParityFive(String front) {
    return '棱的特殊情况：一条棱外侧的两个小块互换了。把这条棱转到前面，保持$front色朝向你，修正后再转回去。';
  }
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline => '從 2×2 到 6×6，掃描、解開並精通每一顆魔術方塊。';

  @override
  String get chooseCubeSize => '選擇你的方塊';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => '入門';

  @override
  String get cubeLevel3 => '經典';

  @override
  String get cubeLevel4 => '進階';

  @override
  String get cubeLevel5 => '專家';

  @override
  String get cubeLevel6 => '大師';

  @override
  String get cubeComingSoon => '新方塊即將推出';

  @override
  String get carouselPrevious => '上一顆方塊';

  @override
  String get carouselNext => '下一顆方塊';

  @override
  String get chooseMode => '你想做什麼？';

  @override
  String get modePlayground => '3D 遊樂場';

  @override
  String get modePlaygroundDesc => '在 3D 中轉動層、打亂並重播步驟。';

  @override
  String get modeScanSolve => '掃描並解開';

  @override
  String get modeScanSolveDesc => '用相機掃描你的方塊，取得解法。';

  @override
  String get modeAcademy => '學院';

  @override
  String get modeAcademyDesc => '透過互動課程一步步學習。';

  @override
  String get language => '語言';

  @override
  String get languageSearch => '搜尋語言';

  @override
  String get languageNoResults => '沒有符合搜尋的語言。';

  @override
  String playgroundTitle(int size) {
    return '$size×$size 遊樂場';
  }

  @override
  String get scramble => '打亂';

  @override
  String get reset => '重設';

  @override
  String get undo => '復原';

  @override
  String get speed => '速度';

  @override
  String get xray => '透視';

  @override
  String get prime => '逆時針';

  @override
  String get wide => '雙層';

  @override
  String layer(int index) {
    return '第 $index 層';
  }

  @override
  String get cubeRotations => '整體轉動';

  @override
  String get play => '播放';

  @override
  String get pause => '暫停';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 步',
      zero: '沒有步驟',
    );
    return '$_temp0';
  }

  @override
  String get solved => '已還原';

  @override
  String get scrambled => '已打亂';

  @override
  String get orbitHint => '拖曳一列即可轉動 · 拖曳背景可環繞檢視';

  @override
  String get notationPad => '記號面板';

  @override
  String get solve => '解開';

  @override
  String get solving => '正在求解…';

  @override
  String get solveFast => '快速解法';

  @override
  String get solveLearn => '一步步學習';

  @override
  String get solveModeGuided => '引導模式（三頂皇冠）';

  @override
  String get solveModeFast => '快速（最佳解）';

  @override
  String solveUnavailable(int size) {
    return '$size×$size 解題器將在之後的更新推出。';
  }

  @override
  String get solveAlreadySolved => '方塊已經還原了。';

  @override
  String solveFailed(String reason) {
    return '這顆方塊無法解開（$reason）。';
  }

  @override
  String get solveEngineMissing => '此裝置無法使用求解引擎。';

  @override
  String get solveComplete => '還原了！做得好。';

  @override
  String solveSummary(int count) {
    return '$count 步';
  }

  @override
  String get nextMove => '下一步';

  @override
  String get previousMove => '上一步';

  @override
  String get halfTurnHalfway => '很好，完成一半了！再轉一次就是 180° 的雙轉。';

  @override
  String get wideTurnInner => '太棒了！現在滑動相鄰的內層，完成雙層轉動。';

  @override
  String get wideTurnOuter => '太棒了！現在滑動旁邊的外層，完成雙層轉動。';

  @override
  String get wideTurnMore => '太棒了！繼續一層一層滑動發亮的層，完成雙層轉動。';

  @override
  String get guideSwipeHint => '依箭頭方向滑動發亮的層，或點一下「下一步」。';

  @override
  String get guideRotateHint => '依箭頭所示轉動整顆方塊：點一下「下一步」。';

  @override
  String get guideWrongMove => '請依照醒目提示的箭頭操作';

  @override
  String get guideExit => '離開引導';

  @override
  String get colorWhite => '白';

  @override
  String get colorYellow => '黃';

  @override
  String get colorGreen => '綠';

  @override
  String get colorBlue => '藍';

  @override
  String get colorRed => '紅';

  @override
  String get colorOrange => '橘';

  @override
  String get phaseOptimal2x2 => '最佳解';

  @override
  String get phaseKociemba1 => '階段 1 · 調整方向';

  @override
  String get phaseKociemba2 => '階段 2 · 完成方塊';

  @override
  String get phaseLblCross => '白色十字';

  @override
  String get phaseLblCorners => '第一頂皇冠的角塊';

  @override
  String get phaseLblMiddle => '中層邊塊';

  @override
  String get phaseLblYellowCross => '黃色十字';

  @override
  String get phaseLblYellowEdges => '對齊黃色十字的邊塊';

  @override
  String get phaseLblYellowCorners => '歸位黃色角塊';

  @override
  String get phaseLblYellowCornersOrient => '翻轉黃色角塊';

  @override
  String get crownFirst => '第一頂皇冠';

  @override
  String get crownSecond => '第二頂皇冠';

  @override
  String get crownThird => '第三頂皇冠';

  @override
  String get crownFirstGoal => '白色面與第一層';

  @override
  String get crownSecondGoal => '中層';

  @override
  String get crownThirdGoal => '黃色面與最後一層';

  @override
  String get subStepGoal11 => '做出白色十字，讓每個白色邊塊也與旁邊的中心塊同色。';

  @override
  String get subStepGoal12 => '把 4 個白色角塊放進對應的位置，完成白色面與整個第一圈。';

  @override
  String get subStepGoal21 => '放入 4 個中層邊塊，同時不破壞第一頂皇冠。';

  @override
  String get subStepGoal31 => '在最後一層做出黃色十字。';

  @override
  String get subStepGoal32 => '交換黃色十字的邊塊，直到每個邊塊都對上側面的中心塊。';

  @override
  String get subStepGoal33 => '把 4 個黃色角塊移到正確位置，即使方向還沒轉正。';

  @override
  String get subStepGoal34 => '在原位翻轉每個黃色角塊，直到所有貼紙都對齊、方塊還原。';

  @override
  String get explainOptimal2x2 => '搜尋所有 2×2 狀態後找到的最短解法。';

  @override
  String get explainKociemba1 => '調整所有塊的方向，並把中層邊塊集中到中層。';

  @override
  String get explainKociemba2 => '只用 U、D 和半圈轉動完成，這些轉動會保持方向不變。';

  @override
  String get explainLblOrient => '轉動整顆方塊，讓白色中心朝下。';

  @override
  String explainLblCrossEdge(String piece) {
    return '把$piece邊塊移到白色中心旁，並對齊側面顏色。';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece角塊卡在錯誤位置。用 R U R\' U\' 把它移到頂層。';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return '轉動頂層，直到$piece角塊位於它的槽位正上方。';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '重複 R U R\' U\'，直到$piece角塊歸位。';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece邊塊在中層但位置錯了。把它移到頂層。';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return '轉動頂層，讓$piece邊塊的側面顏色對上中心塊。';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '把$piece邊塊放到右邊：U R U\' R\' U\' F\' U F。';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '把$piece邊塊放到左邊：U\' L\' U L U F U\' F\'。';
  }

  @override
  String get explainLblYellowCrossAlign => '轉動頂層，把黃色圖形擺好以執行下一個公式。';

  @override
  String get explainLblYellowCrossAlg => '用 F R U R\' U\' F\' 做出黃色十字。';

  @override
  String get explainLblYellowEdgesAlign => '轉動頂層，讓黃色邊塊對齊各自的中心塊。';

  @override
  String get explainLblYellowEdgesAlg => '用 R U R\' U R U2 R\' U 交換黃色邊塊。';

  @override
  String get explainLblYellowCornersAlg =>
      '用 U R U\' L\' U R\' U\' L 循環移動黃色角塊到位。';

  @override
  String get explainLblNextCorner => '轉動頂層，把下一個未完成的黃色角塊移到右前方。';

  @override
  String get explainLblCornerTwist => '重複 R\' D\' R D 直到黃色朝上。底層最後會自動復原。';

  @override
  String get explainLblFinalAlign => '轉動頂層完成方塊。';

  @override
  String scanTitle(int size) {
    return '掃描 $size×$size';
  }

  @override
  String get scanManualInput => '手動輸入顏色';

  @override
  String get scanUseCamera => '用相機掃描';

  @override
  String scanFaceProgress(int current, int total) {
    return '第 $current 面，共 $total 面';
  }

  @override
  String get faceUp => '頂面';

  @override
  String get faceRight => '右面';

  @override
  String get faceFront => '前面';

  @override
  String get faceDown => '底面';

  @override
  String get faceLeft => '左面';

  @override
  String get faceBack => '後面';

  @override
  String get scanHintFront => '拿著方塊，任一面朝向你。這就是前面：掃描時請保持同一面朝上。';

  @override
  String get scanHintRight => '從前面開始，把整顆方塊向左轉一次，讓右面朝向你。';

  @override
  String get scanHintBack => '從前面開始，把整顆方塊向左轉兩次。';

  @override
  String get scanHintLeft => '從前面開始，把整顆方塊向右轉一次。';

  @override
  String get scanHintUp => '從前面開始，把頂面朝你傾斜，讓它面向相機。';

  @override
  String get scanHintDown => '從前面開始，把底面朝你傾斜，讓它面向相機。';

  @override
  String get scanAlignHint => '讓這一面填滿格線，然後點快門。';

  @override
  String get scanCapture => '拍下這一面';

  @override
  String get scanTurnLeft => '把整顆方塊向左轉';

  @override
  String get scanTurnRight => '把整顆方塊向右轉';

  @override
  String get scanTipTop => '把頂面朝你傾斜';

  @override
  String get scanTipBottom => '把底面朝你傾斜';

  @override
  String get scanGlareTip => '偵測到反光：稍微傾斜方塊，或用手機遮住上方的燈光。';

  @override
  String get scanDimTip => '太暗了：移到較亮的地方或開啟手電筒。';

  @override
  String get scanTorch => '手電筒';

  @override
  String get scanGuideLabel => '掃描指南：已掃描的面會顯示顏色。點一下已掃描的面即可重新掃描。';

  @override
  String get scanTapToRescan => '點一下已掃描的面即可重新掃描。';

  @override
  String get scanCameraMissing => '此裝置找不到相機。';

  @override
  String get scanCameraDenied => '相機存取遭拒。你仍可手動輸入顏色。';

  @override
  String get scanCameraFailed => '無法啟動相機。';

  @override
  String get scanAllGood => '所有貼紙看起來都正確。';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 張貼紙看起來不對',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => '有些地方對不上';

  @override
  String scanIssueColors(int count) {
    return '每種顏色都必須正好出現 $count 次。';
  }

  @override
  String get scanIssueCenters => '有兩個中心塊顏色相同。';

  @override
  String get scanIssuePieces => '這些貼紙組成了真實方塊上不存在的塊。';

  @override
  String get scanIssueTwist => '有一個角塊被轉歪了。請檢查角塊貼紙。';

  @override
  String get scanIssueFlip => '有一個邊塊被翻轉了。請檢查邊塊貼紙。';

  @override
  String get scanIssueParity => '有兩個塊似乎互換了。';

  @override
  String get scanIssueUnavailable => '此裝置無法檢查顏色。';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 張貼紙不易辨識：請快速確認一下。',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint => '點一下貼紙可更換顏色 · 長按開啟調色盤';

  @override
  String get scanRescanFace => '重新掃描一面';

  @override
  String get scanCancelRescan => '回到顏色';

  @override
  String get scanPaletteTitle => '選擇顏色';

  @override
  String get scanOpen3d => '在 3D 中開啟';

  @override
  String get scanRestart => '重新開始';

  @override
  String get modeTimer => '速解計時器';

  @override
  String get modeTimerDesc => '打亂、觀察、平均成績與個人最佳。';

  @override
  String get modeDaily => '每日挑戰';

  @override
  String get modeDailyDesc => '每天一個新的打亂。保持你的連續紀錄。';

  @override
  String get modePatterns => '花式圖案庫';

  @override
  String get modePatternsDesc => '棋盤、Superflip 等花式，以 3D 播放。';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '連續 $count 天',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => '繼續學習';

  @override
  String get startLearning => '開始學習';

  @override
  String lessonOf(int index, int total) {
    return '第 $index 課，共 $total 課';
  }

  @override
  String get academyAllDone => '所有課程都完成了！';

  @override
  String get academyTitle => '學院';

  @override
  String academyProgress(int done, int total) {
    return '已完成 $done/$total 課';
  }

  @override
  String get lessonAdvanced => '進階';

  @override
  String lessonPartOf(int index, int total) {
    return '第 $index 部分，共 $total 部分';
  }

  @override
  String get lessonNext => '下一步';

  @override
  String get lessonPrevious => '上一步';

  @override
  String get lessonFinish => '完成課程';

  @override
  String get lessonComplete => '課程完成！';

  @override
  String get lessonNextLesson => '下一課';

  @override
  String get lessonBackToAcademy => '回到學院';

  @override
  String get lessonTryIt => '換你了：滑動箭頭指示的層，或點一下「下一步」。';

  @override
  String get lessonLookAround => '拖曳背景，從各個角度觀察方塊。';

  @override
  String get lessonDemoDone => '很好！點一下「下一步」繼續。';

  @override
  String holdPrompt(String top, String front) {
    return '拿好方塊：$top色中心朝上，$front色中心朝向你。';
  }

  @override
  String get trackBeginner => '3×3 新手：三頂皇冠';

  @override
  String get trackCfop => 'CFOP 入門';

  @override
  String get trackTwoByTwo => '2×2 新手與 Ortega';

  @override
  String get trackBigCubes => '高階方塊：降階與 Parity';

  @override
  String moveSentence(String layer, String direction) {
    return '將$layer$direction轉動';
  }

  @override
  String get moveFaceR => '右面';

  @override
  String get moveFaceL => '左面';

  @override
  String get moveFaceU => '頂面';

  @override
  String get moveFaceD => '底面';

  @override
  String get moveFaceF => '前面';

  @override
  String get moveFaceB => '後面';

  @override
  String moveLayerInner(int depth, String face) {
    return '從$face數第 $depth 層';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face（$depth 層厚）';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '從$face數第 $near–$far 層';
  }

  @override
  String get moveLayerMiddle => '中間層';

  @override
  String get moveDirUp => '向上';

  @override
  String get moveDirDown => '向下';

  @override
  String get moveDirLeft => '向左';

  @override
  String get moveDirRight => '向右';

  @override
  String get moveDirClockwise => '順時針';

  @override
  String get moveDirCounter => '逆時針';

  @override
  String get moveDirBackClockwise => '從後面看順時針';

  @override
  String get moveDirBackCounter => '從後面看逆時針';

  @override
  String get moveDirHalf => '半圈（兩次）';

  @override
  String get moveRotateX => '傾轉整顆方塊：前面轉到頂部';

  @override
  String get moveRotateXPrime => '傾轉整顆方塊：前面轉到底部';

  @override
  String get moveRotateX2 => '把整顆方塊翻過來：前面轉到後面';

  @override
  String get moveRotateY => '旋轉整顆方塊：前面轉到左邊';

  @override
  String get moveRotateYPrime => '旋轉整顆方塊：前面轉到右邊';

  @override
  String get moveRotateY2 => '把整顆方塊轉半圈：後面轉到前面';

  @override
  String get moveRotateZ => '順時針滾動整顆方塊：頂面轉到右邊';

  @override
  String get moveRotateZPrime => '逆時針滾動整顆方塊：頂面轉到左邊';

  @override
  String get moveRotateZ2 => '把整顆方塊上下顛倒：頂面轉到底部';

  @override
  String get phaseReductionCenters => '中心';

  @override
  String get phaseReductionEdges => '配對邊塊';

  @override
  String get phaseReductionEdgeParity => '邊塊 Parity';

  @override
  String get phaseReductionOllParity => 'OLL Parity';

  @override
  String get phaseReductionPllParity => 'PLL Parity';

  @override
  String get explainReductionCenterBlock => '用內層轉動一次把好幾個中心塊送回原位。';

  @override
  String explainReductionCenterCycle(String piece) {
    return '用三循環把一個$piece中心塊送到它的面上，不影響已完成的中心。';
  }

  @override
  String get explainReductionParityCenters => '重建被 Parity 內層轉動打亂的中心。';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '用三循環把$piece邊塊組合起來；中心保持完成狀態。';
  }

  @override
  String get explainReductionEdgeParity =>
      '最後的邊塊無法只靠三循環配對（邊塊 Parity）。一次內層轉動就能修正。';

  @override
  String get explainReductionOllParity =>
      'OLL Parity：有一個邊塊被翻轉，這在 3×3 上不可能發生。這個公式會把它翻回來。';

  @override
  String get explainReductionPllParity =>
      'PLL Parity：有兩個邊塊互換，這在 3×3 上不可能發生。這個公式會把它們換回來。';

  @override
  String get patternsTitle => '花式圖案庫';

  @override
  String get patternsHint => '點一個花式觀看，然後在你自己的方塊上跟著做。';

  @override
  String get patternCheckerboard => '棋盤';

  @override
  String get patternCubeInCube => '方塊中的方塊';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => '圓點';

  @override
  String get patternCross => '十字';

  @override
  String get patternPython => '蟒蛇';

  @override
  String get phasePattern => '做出花式';

  @override
  String get explainPatternStep => '在你自己的方塊上照著每一步做。點「解開」即可恢復原狀。';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => '速解計時器';

  @override
  String get timerHoldToStart => '按住，放開即開始';

  @override
  String get timerReleaseToStart => '放開即開始';

  @override
  String get timerTapToStop => '點任意處停止';

  @override
  String get timerInspectionToggle => '15 秒觀察';

  @override
  String get timerLoadingScramble => '正在產生打亂…';

  @override
  String get timerPb => '最佳';

  @override
  String get timerSolves => '次數';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => '刪除';

  @override
  String get timerHistory => '紀錄';

  @override
  String get timerNoSolves => '還沒有成績。打亂方塊，開始吧！';

  @override
  String get timerNewPb => '新的個人最佳！';

  @override
  String get timerClearHistory => '清除紀錄';

  @override
  String get timerScrambleHint => '白色朝上、綠色朝前，然後打亂：';

  @override
  String get dailyTitle => '每日挑戰';

  @override
  String dailyFor(String date) {
    return '$date 的挑戰';
  }

  @override
  String dailyBestStreak(int count) {
    return '最長連續紀錄：$count';
  }

  @override
  String get dailyDone => '今天完成了！明天再來。';

  @override
  String get dailyNotDone => '解開今天的打亂，保持連續紀錄。';

  @override
  String get dailySolveVirtual => '在 3D 方塊上解';

  @override
  String get dailyTimeIt => '在你的方塊上計時';

  @override
  String get dailyHint => '提示';

  @override
  String dailyHintText(String moves) {
    return '從白色十字開始：$moves';
  }

  @override
  String get dailyHintFailed => '目前沒有提示。';

  @override
  String get lessonBasics => '認識方塊';

  @override
  String get lessonBasicsDesc => '塊、面與轉動名稱。';

  @override
  String get stepBasicsPieces => '三種塊';

  @override
  String get stepBasicsPiecesBody =>
      '中心塊永遠不會移動，決定每一面的顏色。邊塊有兩種顏色，角塊有三種。還原就是把每個邊塊和角塊移到同色的中心塊旁邊。';

  @override
  String get stepBasicsFaces => '六個面的字母';

  @override
  String get stepBasicsFacesBody =>
      'R、L、U、D、F、B 分別是右、左、上、下、前、後面。單獨一個字母表示順時針轉 90°，就像你正對著那一面看。';

  @override
  String get stepBasicsPrime => '逆轉與雙轉';

  @override
  String get stepBasicsPrimeBody => '加上撇號（R\'）表示反方向、逆時針轉。2（U2）表示轉半圈：轉兩次 90°。';

  @override
  String get stepCrossGoal => '目標';

  @override
  String get stepCrossGoalBody => '黃色朝上。四個白色邊塊圍繞底部的白色中心，每個邊塊的側面顏色都對上旁邊的中心塊。';

  @override
  String get stepCrossTop => '頂層的邊塊';

  @override
  String get stepCrossTopBody =>
      '在頂層找到一個白色邊塊。轉動頂層，直到它的側面顏色位於同色中心塊上方，再把那一面轉兩次放下去。';

  @override
  String get stepCrossMiddle => '中層的邊塊';

  @override
  String get stepCrossMiddleBody =>
      '卡在中層的邊塊要先移上去：把它所在的側面轉上去，把頂層移開，再把側面轉回來，十字就不會被破壞。然後從頂層放入。';

  @override
  String get stepCornersInsert => '在位置正上方';

  @override
  String get stepCornersInsertBody =>
      '轉動頂層，直到白色角塊位於它顏色所屬位置的正上方，也就是右前方。R U R\' U\' 就能把它放下去。';

  @override
  String get stepCornersRepeat => '重複這組動作';

  @override
  String get stepCornersRepeatBody =>
      '如果白色朝向不對，就在同一個位置繼續重複 R U R\' U\'。每個角塊最多重複五次就會完成。';

  @override
  String get stepMiddleRight => '邊塊放右邊';

  @override
  String get stepMiddleRightBody =>
      '把頂層邊塊對齊前面的中心塊。如果它的頂部顏色與右邊中心塊相同，用 U R U\' R\' U\' F\' U F 放入。';

  @override
  String get stepMiddleLeft => '邊塊放左邊';

  @override
  String get stepMiddleLeftBody =>
      '如果頂部顏色與左邊中心塊相同，就用鏡像公式：U\' L\' U L U F U\' F\'。';

  @override
  String get stepYellowCross => '一個公式';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' 能把黃色點變成 L 形、L 形變成一字形、一字形變成十字。L 形放在左後方，一字形橫放。';

  @override
  String get stepYellowEdges => '對齊邊塊';

  @override
  String get stepYellowEdgesBody =>
      '轉動頂層，直到兩個邊塊對上中心塊。一個在後、一個在右時，R U R\' U R U2 R\' U 會交換另外兩個。';

  @override
  String get stepPlaceCorners => '歸位角塊';

  @override
  String get stepPlaceCornersBody =>
      '把已經在正確位置的角塊放在右前方。U R U\' L\' U R\' U\' L 會移動另外三個；重複直到四個都歸位。';

  @override
  String get stepTwistCorners => '翻轉角塊';

  @override
  String get stepTwistCornersBody =>
      '把未完成的角塊放在右前方，重複 R\' D\' R D 直到黃色朝上，然後只轉頂層帶出下一個。底層直到最後都會看起來亂掉：繼續做就對了。';

  @override
  String get lessonCfopIntro => '什麼是 CFOP？';

  @override
  String get lessonCfopIntroDesc => 'Cross、F2L、OLL、PLL。';

  @override
  String get stepCfopOverview => '四個階段';

  @override
  String get stepCfopOverviewBody =>
      '速解玩家先完成十字，再把每個第一層角塊和對應的中層邊塊配對（F2L），接著調整最後一層的方向（OLL），最後交換位置（PLL）。';

  @override
  String get stepCfopCross => '規劃十字';

  @override
  String get stepCfopCrossBody => '在 CFOP 中，十字會在觀察時規劃好，並在底部用大約八步完成。';

  @override
  String get lessonF2l => 'F2L 基礎';

  @override
  String get lessonF2lDesc => '把角塊與它的邊塊配對。';

  @override
  String get stepF2lRight => '放入一組';

  @override
  String get stepF2lRightBody => '當角塊和它的邊塊在頂層並排時，把它們移到槽位上方，一起放入。';

  @override
  String get stepF2lLeft => '左手配對';

  @override
  String get stepF2lLeftBody =>
      '另一側的相同情況就是鏡像：U\' L\' U L。轉動整顆方塊（y）就能用比較順手的那隻手。';

  @override
  String get lessonOll => '兩段式 OLL';

  @override
  String get lessonOllDesc => '讓頂面全黃。';

  @override
  String get stepOllCross => '先做邊塊';

  @override
  String get stepOllCrossBody => '兩段式 OLL 從你已經學會的黃色十字公式開始。';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      '當左前方有一個黃色朝上的角塊時，Sune（R U R\' U R U2 R\'）會調整另外三個角塊。其他大多數情況都用 Sune 和它的鏡像。';

  @override
  String get lessonPll => '兩段式 PLL';

  @override
  String get lessonPllDesc => '完成方塊。';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody => 'T-perm 會交換兩個角塊和兩個邊塊。用它來歸位角塊：把需要交換的兩個角塊放在右邊。';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody => '角塊完成後，U-perm 會循環三個邊塊。把已完成的那一側放在後面。';

  @override
  String get lessonTwoFirst => '2×2 第一層';

  @override
  String get lessonTwoFirstDesc => '用相符的角塊拼出一面。';

  @override
  String get stepTwoIntro => '只有角塊';

  @override
  String get stepTwoIntroBody =>
      '2×2 就是沒有邊塊和中心塊的 3×3。選一個顏色，把那一面拼在底部，並讓相鄰角塊的側面顏色相符。';

  @override
  String get stepTwoCorner => '放入角塊';

  @override
  String get stepTwoCornerBody =>
      '就像 3×3 的白色角塊：把角塊移到它的位置上方，重複 R U R\' U\' 直到放好。';

  @override
  String get lessonTwoOll => '調整頂面方向';

  @override
  String get lessonTwoOllDesc => '用 Sune 做 Ortega OLL。';

  @override
  String get stepTwoSune => '又是 Sune';

  @override
  String get stepTwoSuneBody =>
      'Sune 也能讓 2×2 的頂面變黃。Ortega 玩家會學七種短公式；Sune 和它的鏡像就涵蓋了大部分。';

  @override
  String get lessonTwoPbl => '兩層同時歸位';

  @override
  String get lessonTwoPblDesc => '交換角塊完成。';

  @override
  String get stepTwoAdjacent => '相鄰交換';

  @override
  String get stepTwoAdjacentBody => '當頂層兩個相鄰角塊需要交換時，把它們放在右邊並使用 T-perm。';

  @override
  String get stepTwoDiagonal => '對角交換';

  @override
  String get stepTwoDiagonalBody => '位於對角的兩個角塊用 Y-perm 交換。';

  @override
  String get lessonBigIntro => '高階方塊的塊';

  @override
  String get lessonBigIntroDesc => '中心、翼邊與內層。';

  @override
  String get stepBigPieces => '中心不固定';

  @override
  String get stepBigPiecesBody =>
      '在 4×4 上，每一面有四個會移動的中心塊，每條邊由兩個翼邊組成。降階法把它們組合起來，讓方塊像 3×3 一樣運作。';

  @override
  String get stepBigSlices => '雙層與內層轉動';

  @override
  String get stepBigSlicesBody => 'Rw 同時轉動右邊兩層。2R 只轉右邊數來第二層。這些轉動會移動中心塊和翼邊。';

  @override
  String get lessonBigCenters => '中心';

  @override
  String get lessonBigCentersDesc => '把中心塊集中起來。';

  @override
  String get stepBigCenterCycle => '中心三循環';

  @override
  String get stepBigCenterCycleBody => '這個交換子只移動三個中心塊，其他都不動，所以已完成的中心會保持完成。';

  @override
  String get lessonBigEdges => '配對邊塊';

  @override
  String get lessonBigEdgesDesc => '把翼邊組成完整的邊。';

  @override
  String get stepBigEdgePair => '配對並還原';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' 讓兩個相同的翼邊對齊，R U R\' F R\' F\' R 換入一個未配對的邊，再用 Uw 把中心轉回來。';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => '偶數階方塊的 OLL 與 PLL Parity。';

  @override
  String get stepBigOllParity => 'OLL Parity';

  @override
  String get stepBigOllParityBody =>
      '3×3 上不可能只有一個邊塊被翻轉。在偶數階方塊上，這個公式會把頂層前方的邊塊翻回來。它可能打亂頂層其他部分，但最後的 3×3 步驟反正都會修好。';

  @override
  String get stepBigPllParity => 'PLL Parity';

  @override
  String get stepBigPllParityBody =>
      '最後剩兩個邊塊互換？2R2 U2 2R2 Uw2 2R2 Uw2 會交換頂層前後的邊塊。';

  @override
  String get introGoalHeading => '目標是什麼？';

  @override
  String get introHowHeading => '怎麼做？';

  @override
  String get introStart => '了解，開始一步步做';

  @override
  String get introDontShowAgain => '不再自動顯示';

  @override
  String get introShowGoal => '顯示目標';

  @override
  String get introStateStart => '開始';

  @override
  String get introStateGoal => '目標';

  @override
  String get introPlayMorph => '從開始播放到目標';

  @override
  String get introGoalBasics => '學會看懂方塊：它的塊、六個面，以及轉動字母如何轉動它們。';

  @override
  String get introGoalCross => '做出白色十字，讓每個白色邊塊也與旁邊的中心塊同色。';

  @override
  String get introGoalCorners => '補上四個白色角塊，完成第一頂皇冠，也就是整個白色層。';

  @override
  String get introGoalMiddle => '放好四個中層邊塊，完成前兩層。';

  @override
  String get introGoalYellowCross => '在頂面做出黃色十字；側面顏色暫時不必對齊。';

  @override
  String get introGoalYellowEdges => '讓黃色十字的每個邊塊對上側面的中心顏色。';

  @override
  String get introGoalYellowCorners => '把每個黃色角塊移到自己的位置，即使方向還沒轉正。';

  @override
  String get introGoalTwistCorners => '把黃色角塊轉到正確方向，讓整顆方塊還原。';

  @override
  String get introGoalCfopIntro => '了解速解的流程：十字、前兩層，再用兩段式完成最後一層。';

  @override
  String get introGoalF2l => '把每個白色角塊和它的中層邊塊一起放入，同時完成兩層。';

  @override
  String get introGoalOll => '用一到兩個公式讓整個頂面變黃。';

  @override
  String get introGoalPll => '把最後一層的塊移到正確位置，完成方塊。';

  @override
  String get introGoalTwoFirst => '在 2×2 上拼出完整的白色層。';

  @override
  String get introGoalTwoOll => '讓 2×2 的頂面全部變黃。';

  @override
  String get introGoalTwoPbl => '交換最後的角塊到位，還原 2×2。';

  @override
  String get introGoalBigIntro => '認識 4×4：中心、邊塊組與角塊，以及轉動它們的步驟。';

  @override
  String get introGoalBigCenters => '把每一面的中心塊集中成一整塊同色區域。';

  @override
  String get introGoalBigEdges => '把相同的邊塊配對，讓每條邊看起來就像一個 3×3 邊塊。';

  @override
  String get introGoalBigParity => '修正 3×3 不會出現的兩種 4×4 情況：一個邊塊翻轉，或兩個邊塊互換。';

  @override
  String get introHowBasics =>
      '中心塊永遠不動，所以它們代表每一面的顏色。\n每個字母把一面順時針轉 90°。\n撇號（\'）表示轉回來；2 表示轉兩次。';

  @override
  String get introHowCross =>
      '黃色朝上：白色十字做在底部。\n找到一個白色邊塊，把它的側面顏色對上同色中心塊。\n把那一面轉兩次，讓邊塊歸位。';

  @override
  String get introHowCorners =>
      '把一個白色角塊移到它空位的正上方。\n重複 R U R\' U\'，直到它以正確方向歸位。\n其他三個角塊也照做。';

  @override
  String get introHowMiddle =>
      '在頂層找一個沒有黃色的邊塊，把它的前面顏色對上中心塊。\n用一個 8 步的短公式把它送到右邊或左邊。\n每次白色層都會完好地回來。';

  @override
  String get introHowYellowCross =>
      '看頂面：一個點、一個 L 形或一條線。\n照圖拿好，做 F R U R\' U\' F\'。\n重複直到出現黃色十字。';

  @override
  String get introHowYellowEdges =>
      '轉動頂層，直到兩個邊塊對上中心塊。\n把它們放在後面和右邊，然後做 R U R\' U R U2 R\' U。\n重複直到四個邊塊都對上。';

  @override
  String get introHowYellowCorners =>
      '角塊的顏色和周圍三個面相符時，就代表它在正確位置。\n把一個已歸位的角塊放在右前方。\nU R U\' L\' U R\' U\' L 會循環另外三個，直到全部歸位。';

  @override
  String get introHowTwistCorners =>
      '把一個未完成的角塊放在右前方。\n重複 R\' D\' R D，直到它的黃色朝上。\n只轉頂層換到下一個；底層最後會自動復原。';

  @override
  String get introHowCfopIntro =>
      'Cross：四個邊塊，在觀察時規劃。\nF2L：每個角塊和它的邊塊一起放入。\nOLL 讓頂面變黃，再用 PLL 把塊送回原位。';

  @override
  String get introHowF2l =>
      '在頂層找到一個角塊和與它相配的邊塊。\n在它們的槽位上方把兩者配成一組。\n用三到四步把這組放進去。';

  @override
  String get introHowOll =>
      '先用 F R U R\' U\' F\' 做出黃色十字。\n再調整角塊方向，例如用 Sune。\n從看到的黃色辨認情況。';

  @override
  String get introHowPll => '頂面已經全黃了。\nT-perm 交換角塊；U-perm 循環三個邊塊。\n看側面顏色來選擇公式。';

  @override
  String get introHowTwoFirst =>
      '2×2 只有角塊，就像沒有邊塊的 3×3。\n把每個白色角塊移到它的位置上方。\n重複 R U R\' U\' 直到它歸位。';

  @override
  String get introHowTwoOll =>
      '白色層保持在底部。\nSune（R U R\' U R U2 R\'）會轉動頂層的角塊。\n從正確的角度重複，直到頂面全黃。';

  @override
  String get introHowTwoPbl =>
      '找一個已經有兩個角塊相符的側面。\n相鄰交換：一個類似 T-perm 的公式。\n對角交換：一個較長的公式。';

  @override
  String get introHowBigIntro =>
      '沒有固定的中心：四個中心塊組成每一面的顏色。\n像 Rw 這樣的雙層轉動一次轉兩層。\n像 2R 這樣的內層轉動只轉一個內層。';

  @override
  String get introHowBigCenters =>
      '先完成兩個相對的中心。\n內層可以交換中心塊，而不破壞已完成的中心。\n用同樣方法完成最後四個中心。';

  @override
  String get introHowBigEdges => '找到兩個顏色相同的邊塊。\n用一個內層把它們並排對齊。\n把這組移開，再把中心轉回來。';

  @override
  String get introHowBigParity =>
      '像 3×3 一樣解 4×4，直到卡住。\n一個邊塊翻轉：長的 OLL Parity 公式。\n兩個邊塊互換：2R2 U2 2R2 Uw2 2R2 Uw2。';

  @override
  String get dirFaceR => '右側';

  @override
  String get dirFaceL => '左側';

  @override
  String get dirFaceU => '頂排';

  @override
  String get dirFaceD => '底排';

  @override
  String get dirFaceF => '前面';

  @override
  String get dirFaceB => '後面';

  @override
  String get dirMiddle => '中間層';

  @override
  String get dirWholeCube => '整顆方塊';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face，第 $depth 層';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face，$depth 層厚';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face，第 $near–$far 層';
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
  String get dirClockwise => '順時針';

  @override
  String get dirCounter => '逆時針';

  @override
  String get dirBackClockwise => '從後面看順時針';

  @override
  String get dirBackCounter => '從後面看逆時針';

  @override
  String get dirHalf => '雙轉（180°）';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => '隱藏詳細資料';

  @override
  String get solveExpand => '顯示詳細資料';

  @override
  String get dailyScrambleSteps => '一步步打亂';

  @override
  String get dailyScrambleGuide => '3D 打亂指南';

  @override
  String get dailyShowMoves => '顯示文字步驟';

  @override
  String get dailyHideMoves => '隱藏文字步驟';

  @override
  String get dailyScrambleGuideTitle => '打亂指南';

  @override
  String get phaseDailyScramble => '打亂今天的方塊';

  @override
  String get explainDailyScramble => '從還原好的方塊開始，白色朝上、綠色朝前，在你的實體方塊上照著每一步轉。';

  @override
  String get stageCenters => '拼出中心塊';

  @override
  String get stageEdges => '配對外側與內側邊塊';

  @override
  String get stageParity => '處理 Parity';

  @override
  String get stageCrown1 => '第一頂皇冠（白）';

  @override
  String get stageCrown2 => '第二頂皇冠';

  @override
  String get stageCrown3 => '第三頂皇冠（黃）';

  @override
  String get stageOrient => '調整方向';

  @override
  String get stageFinish => '完成方塊';

  @override
  String get stageAsThree => '像 3×3 一樣解';

  @override
  String get stageTwoByTwo => '解開 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return '第 $number/$total 階段：$title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return '皇冠 $crown • 第 $number/$total 階段：$title';
  }

  @override
  String get solveAllStagesDone => '所有階段都完成了。做得好！';

  @override
  String get trackFiveByFive => '5×5 Professor\'s Cube';

  @override
  String get trackSixBySix => '6×6 方塊';

  @override
  String get lessonFiveIntro => '認識 5×5';

  @override
  String get lessonFiveIntroDesc => '固定中心、中心條、中間邊塊與翼邊。';

  @override
  String get introGoalFiveIntro => '認識 5×5：固定中心、中心條、中間邊塊與翼邊。';

  @override
  String get introHowFiveIntro =>
      '每一面正中央的塊永遠不動。\n每條邊由一個中間塊和兩個翼邊組成。\n內層轉動可以移動塊而不影響外側。';

  @override
  String get lessonFiveCenters => '5×5 中心';

  @override
  String get lessonFiveCentersDesc => '用三塊一條的中心條拼出每個中心。';

  @override
  String get introGoalFiveCenters => '在每一面拼出同一顏色的 3×3 中心區塊。';

  @override
  String get introHowFiveCenters =>
      '從正中央的塊開始：它決定顏色。\n拼出三塊一條的中心條，用內層滑進去。\n最後兩個中心一起完成。';

  @override
  String get lessonFiveEdges => '5×5 邊塊';

  @override
  String get lessonFiveEdgesDesc => '把兩個翼邊和它們的中間邊塊組合。';

  @override
  String get introGoalFiveEdges => '把每個中間邊塊和它的兩個翼邊組合，讓 12 條邊都像單一塊。';

  @override
  String get introHowFiveEdges =>
      '在前面把兩個翼邊對上它們的中間邊塊。\n轉動內層，換入一個未完成的邊，再轉回來。\n配對最後的邊塊，不破壞已完成的邊。';

  @override
  String get lessonFiveSolve => '像 3×3 一樣解 5×5';

  @override
  String get lessonFiveSolveDesc => '用三頂皇冠完成。';

  @override
  String get introGoalFiveSolve => '把降階後的 5×5 像 3×3 一樣，一頂皇冠一頂皇冠地解開。';

  @override
  String get introHowFiveSolve =>
      '從現在起只轉外層。\n第一頂皇冠、第二頂皇冠，然後是黃色皇冠。\n固定中心代表每一面的顏色。';

  @override
  String get lessonFiveParity => '5×5 邊塊 Parity';

  @override
  String get lessonFiveParityDesc => '修正翼邊互換的邊塊。';

  @override
  String get introGoalFiveParity => '修正兩個翼邊互換的那一條邊，然後完成。';

  @override
  String get introHowFiveParity => '它會以一條無法配對的邊出現。\n做一次長的內層修正公式。\n其他一切都會回到原位。';

  @override
  String get lessonSixIntro => '認識 6×6';

  @override
  String get lessonSixIntroDesc => '中心不固定，每條邊有四個塊。';

  @override
  String get introGoalSixIntro => '認識 6×6：每面十六個中心塊，每條邊四個塊。';

  @override
  String get introHowSixIntro =>
      '沒有固定的中心：顏色由你拼的時候決定。\n每條邊都有外翼邊和內翼邊。\n雙層轉動最多可移動三層。';

  @override
  String get lessonSixCenters => '6×6 中心';

  @override
  String get lessonSixCentersDesc => '用四塊一條的中心條拼出 4×4 中心。';

  @override
  String get introGoalSixCenters => '在每一面拼出一整塊同色的 4×4 中心區塊。';

  @override
  String get introHowSixCenters =>
      '先完成兩個相對的中心。\n拼出四塊一條的中心條，再把它們併在一起。\n用「內層、頂層、復原」技巧移動單一塊。';

  @override
  String get lessonSixEdges => '6×6 邊塊';

  @override
  String get lessonSixEdgesDesc => '集齊每條邊的四個塊。';

  @override
  String get introGoalSixEdges => '集齊每條邊的四個塊，讓 6×6 有 12 條完整的邊。';

  @override
  String get introHowSixEdges =>
      '在前面把外翼邊和內翼邊對齊。\n深層的雙層轉動把一條邊帶進來再帶出去。\n已完成的邊永遠不會被破壞。';

  @override
  String get lessonSixSolve => '像 3×3 一樣解 6×6';

  @override
  String get lessonSixSolveDesc => '用三頂皇冠完成。';

  @override
  String get introGoalSixSolve => '把降階後的 6×6 像 3×3 一樣，一頂皇冠一頂皇冠地解開。';

  @override
  String get introHowSixSolve =>
      '從現在起只轉外層。\n你拼好的中心代表每一面的顏色。\n第一頂皇冠、第二頂皇冠，然後是黃色皇冠。';

  @override
  String get lessonSixParity => '6×6 Parity';

  @override
  String get lessonSixParityDesc => '一個邊塊翻轉或兩個邊塊互換。';

  @override
  String get introGoalSixParity => '修正 3×3 不會出現的兩種 6×6 情況：一個邊塊翻轉，或兩個邊塊互換。';

  @override
  String get introHowSixParity =>
      '像 3×3 一樣解，直到卡住。\n一個邊塊翻轉：長的 Parity 修正公式。\n兩個邊塊互換：短的雙轉修正公式。';

  @override
  String get stepFivePieces => '5×5 的塊';

  @override
  String get stepFivePiecesBody =>
      '每一面正中央的塊永遠不動，所以和 3×3 一樣代表那一面的顏色。它周圍還有八個中心塊；每條邊有一個中間塊和兩個翼邊，角塊則和 3×3 一樣。';

  @override
  String get stepFiveSlices => '三種轉動';

  @override
  String get stepFiveSlicesBody =>
      '外層轉動移動一個面。雙層轉動移動一個面和它後面的那一層。內層轉動只移動裡面的一層：塊就是這樣在不影響外側的情況下換位置。';

  @override
  String get stepFiveCenterBar => '中心條';

  @override
  String get stepFiveCenterBarBody =>
      '拼出一排三個同色的中心塊，再用內層轉動把它滑到同色的正中央塊旁邊。三條就組成一個完整的中心。';

  @override
  String get stepFiveCenterSwap => '交換而不破壞';

  @override
  String get stepFiveCenterSwapBody =>
      '要移動單一中心塊：轉一個內層、轉頂層、把內層轉回、再把頂層轉回。已完成的中心每次都會恢復。';

  @override
  String get stepFiveEdgePair => '把翼邊和中間邊塊配對';

  @override
  String get stepFiveEdgePairBody =>
      '在前面把兩個翼邊對齊到同色的中間邊塊旁，把內層往下轉，從頂層換入一個未完成的邊，再把內層轉回來。';

  @override
  String get stepFiveEdgeLast => '最後的邊塊';

  @override
  String get stepFiveEdgeLastBody =>
      '只剩幾條邊時，用一次雙層轉動、一組短公式，再把雙層轉回，就能配對它們而不破壞已完成的邊。';

  @override
  String get stepFiveAsThree => '現在它是 3×3 了';

  @override
  String get stepFiveAsThreeBody =>
      '中心和邊塊完成後，5×5 就像一顆大 3×3。只用外層轉動，照三頂皇冠進行：白色十字與角塊、中層，然後是黃色層。';

  @override
  String get stepFiveEdgeParity => '交換最後一條邊的翼邊';

  @override
  String get stepFiveEdgeParityBody =>
      '有時最後一條邊的兩個翼邊互換了。用一個較長的內層公式把它們換回來，其他一切都會回到原位。然後像 3×3 一樣完成。';

  @override
  String get stepSixPieces => '6×6 的塊';

  @override
  String get stepSixPiecesBody =>
      '和 4×4 一樣，6×6 沒有固定的中心：十六個中心塊組成每一面的顏色。每條邊有四個塊：兩個外翼邊和兩個內翼邊。';

  @override
  String get stepSixSlices => '轉動更深的層';

  @override
  String get stepSixSlicesBody => '雙層轉動可以從一面移動兩層或三層。第二或第三層的內層轉動是處理中心和邊塊的工具。';

  @override
  String get stepSixCenterBar => '四塊一條';

  @override
  String get stepSixCenterBarBody => '拼出一排排四個同色的中心塊，用內層轉動把它們併在一起，直到整面變成同一顏色。';

  @override
  String get stepSixCenterSwap => '一次移動一塊';

  @override
  String get stepSixCenterSwapBody => '轉第三層、轉頂層、復原、轉回：移動一個中心塊，同時已完成的中心會恢復。';

  @override
  String get stepSixEdgePair => '四個塊，一條邊';

  @override
  String get stepSixEdgePairBody => '用深層的雙層轉動在前面集齊一條邊的四個塊，再換入一個未完成的邊，把雙層轉回來。';

  @override
  String get stepSixEdgeLast => '最後的邊塊';

  @override
  String get stepSixEdgeLastBody => '在深層雙層轉動和它的復原之間夾一組短公式來配對最後的邊塊，讓已完成的邊保持配對。';

  @override
  String get stepSixAsThree => '現在它是 3×3 了';

  @override
  String get stepSixAsThreeBody =>
      '有了 4×4 中心和配對好的邊塊，就用外層轉動和三頂皇冠，像 3×3 一樣解開 6×6。';

  @override
  String get stepSixOllParity => '一個邊塊翻轉';

  @override
  String get stepSixOllParityBody =>
      '如果在解最後一層時有一個邊塊看起來被翻轉，那就是 Parity。把它放在頂層前方，做長的修正公式：前兩頂皇冠會完好如初。';

  @override
  String get stepSixPllParity => '兩個邊塊互換';

  @override
  String get stepSixPllParityBody =>
      '如果到最後有兩個邊塊看起來互換了，把它們放在頂層的前方和後方，做由內層雙轉組成的短修正公式。';

  @override
  String get stageTwoFirstLayer => '拼出底層';

  @override
  String get stageTwoTopColor => '讓頂面同一顏色';

  @override
  String get stageTwoFinish => '完成角塊';

  @override
  String get explainTwoFirstLayer => '完成底層：四個角塊彼此相符，也與側面顏色相符。';

  @override
  String get explainTwoTopColor => '保持底層不動，轉動頂層直到頂面四張貼紙都是同一顏色。';

  @override
  String get explainTwoFinish => '把最後的角塊移到正確位置，完成方塊。';

  @override
  String get tabSolve => '解題';

  @override
  String get tabScan => '掃描';

  @override
  String get tabAcademy => '學院';

  @override
  String get tabTrain => '訓練';

  @override
  String get openCubeSolver => '開啟 3D 方塊與解題器';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => '訓練';

  @override
  String get trainSubtitle => '每天磨練你的技巧。';

  @override
  String get settings => '設定';

  @override
  String get settingsSoundHaptics => '音效與震動';

  @override
  String get settingsSoundHapticsDesc => '轉動方塊時的喀嚓聲與震動。';

  @override
  String get settingsAnimationSpeed => '預設動畫速度';

  @override
  String get settingsAnimationSpeedDesc => '播放步驟時方塊轉動的速度。';

  @override
  String get settingsResetProgress => '重設進度';

  @override
  String get settingsResetProgressDesc => '清除已完成的學院課程與每日連續紀錄。';

  @override
  String get resetProgressTitle => '要重設所有進度嗎？';

  @override
  String get resetProgressBody => '已完成的課程和每日連續紀錄將被清除。此動作無法復原。';

  @override
  String get resetProgressDone => '進度已重設。';

  @override
  String get cancel => '取消';

  @override
  String get settingsPrivacyAds => '隱私權與廣告';

  @override
  String get settingsPrivacyAdsDesc => '檢視或變更你的廣告同意選擇。';

  @override
  String get playbackPrevious => '上一步';

  @override
  String get playbackNext => '下一步';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '用 $count 步還原！',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => '一起打造下一個版本';

  @override
  String get feedbackBody => '想建議新功能，或影響 CubeMentor 的下一個版本嗎？寫信給我們：';

  @override
  String get feedbackEmailCopied => '找不到電子郵件 App，所以我們已將地址複製到剪貼簿。';

  @override
  String get adWatchToUnlock => '觀看廣告';

  @override
  String get adLoading => '正在載入短片…';

  @override
  String get adRewardNotEarned => '看完整支影片才能解鎖。';

  @override
  String get adUnavailableFreePass => '目前沒有可用的影片——這次免費為你解鎖。';

  @override
  String get settingsPrivacyAdsError => '無法開啟隱私權選項。請稍後再試。';

  @override
  String get nicknamePromptTitle => '我們該怎麼稱呼你？';

  @override
  String get nicknamePromptBody => '每次你還原方塊時，我們都會叫著你的名字為你喝采。';

  @override
  String get nicknameHint => '你的名字或暱稱';

  @override
  String get nicknameSave => '儲存';

  @override
  String get settingsNickname => '你的名字';

  @override
  String get settingsNicknameNotSet => '尚未設定——點一下新增';

  @override
  String celebrateNamed(String name) {
    return '太棒了，$name！';
  }

  @override
  String get celebrateAnon => '太棒了！';

  @override
  String get celebrateCubeSolved => '方塊還原了！';

  @override
  String get celebrateDailyDone => '每日挑戰完成！';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit 步',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '任何打亂都能在 $limit 步以內還原',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => '觀看影片';

  @override
  String get patternsNotNow => '稍後再說';

  @override
  String get settingsColorScheme => '魔術方塊配色';

  @override
  String get colorSchemeWestern => '西方配色';

  @override
  String get colorSchemeJapanese => '日本配色';

  @override
  String get colorSchemeWesternDesc => '白對黃，藍對綠';

  @override
  String get colorSchemeJapaneseDesc => '白對藍，黃對綠';

  @override
  String dailyYourTime(String time) {
    return '你的時間：$time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return '你有 $seconds 秒觀察魔術方塊。點一下開始倒數。';
  }

  @override
  String get timerInspectTapReady => '準備好後點一下開始解';

  @override
  String timerInspectPlus2(int seconds) {
    return '觀察超過 $seconds 秒，計時已自動開始：加罰 +2 秒';
  }

  @override
  String timerAvgOf(int count) {
    return '$count 次平均';
  }

  @override
  String get timerAvgNote => '平均成績會去掉最快和最慢的成績';

  @override
  String get timerPbSub => '最佳單次';

  @override
  String get timerPlus2Caption => '加罰 +2 秒';

  @override
  String get timerDnfCaption => '未完成（DNF）';

  @override
  String get timerDeleteCaption => '刪除這次成績';

  @override
  String get patternBullsEye => '靶心';

  @override
  String get patternFramedCenter => '框形中心';

  @override
  String get patternBlockCheckerboard => '方塊棋盤';

  @override
  String get patternCubeInCubeInCube => '三層方塊中方塊';

  @override
  String get patternUnionJack => '米字旗';

  @override
  String get patternKilt => '蘇格蘭裙';

  @override
  String get patternSixTs => '六個 T';

  @override
  String get patternTwinPeaks => '雙峰';

  @override
  String get patternSpiral => '螺旋';

  @override
  String get patternTetris => '俄羅斯方塊';

  @override
  String get patternSpots => '中心圓點';

  @override
  String get patternStripes => '條紋';

  @override
  String get patternAnaconda => '森蚺';

  @override
  String get patternZigzag => '之字形';

  @override
  String get patternFourSpots => '四個圓點';

  @override
  String get patternGreenMamba => '綠曼巴';

  @override
  String get patternPlusMinus => '加減號';

  @override
  String guideStepCounter(int current, int total) {
    return '第 $current / $total 步';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return '轉動 $current / $total';
  }

  @override
  String get dailyStep1Title => '第 1 步：打亂你的方塊';

  @override
  String get dailyStep2Title => '第 2 步：解開方塊';

  @override
  String dailyPersonalBest(String time) {
    return '個人最佳：$time';
  }

  @override
  String get dailyRecentDays => '最近紀錄';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '連續 $count 天！勢不可擋！',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => '方塊已打亂！現在去解開它吧';

  @override
  String get dailyCongratsTitle => '恭喜！';

  @override
  String dailyCongratsBody(String time) {
    return '你用 $time 完成了今天的挑戰。';
  }

  @override
  String get dailyCongratsDone => '返回挑戰';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $count 個花式';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '剩餘 $hours 小時';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '剩餘 $minutes 分鐘';
  }

  @override
  String get lockedLabel => '已鎖定';

  @override
  String get unlockedLabel => '已解鎖';

  @override
  String patternUnlockBody(int hours) {
    return '觀看 1 支短片，即可解鎖此花式及其逐步教學 $hours 小時。';
  }

  @override
  String lessonUnlockBody(int hours) {
    return '觀看 1 支短片，即可在接下來的 $hours 小時內隨時開啟本課。';
  }

  @override
  String get bigCubeUnlockTitle => '解開高階方塊';

  @override
  String bigCubeUnlockBody(int hours) {
    return '你已用完 4×4–6×6 的免費解法次數。觀看 1 支短片，即可在接下來的 $hours 小時內解開高階方塊。';
  }

  @override
  String get doubleTurnBadge => '轉兩次 · 180°';

  @override
  String get homeAcademy => '學院';

  @override
  String get homePatterns => '酷炫圖案';

  @override
  String get homePractice => '計時器與每日挑戰';

  @override
  String get scanChoiceSubtitle => '想怎麼開始？';

  @override
  String get scanChoiceCamera => '用相機掃描';

  @override
  String get scanChoiceCameraDesc => '把每一面對準相機，即可取得解法。';

  @override
  String get scanChoice3d => '開啟 3D 方塊';

  @override
  String get scanChoice3dDesc => '轉動虛擬方塊，打亂後一步步解開。';

  @override
  String get academyAllSizes => '全部尺寸';

  @override
  String homeAcademyProgress(int done, int total) {
    return '已完成 $done / $total 課';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • 已完成 $done / $total';
  }

  @override
  String get lessonStageConcept => '講解';

  @override
  String get lessonStageExamples => '範例';

  @override
  String get lessonStagePractice => '實戰';

  @override
  String get lessonStageNext => '繼續 / 自由';

  @override
  String lessonStageOf(int index, int total, String name) {
    return '第 $index 階段，共 $total 階段：$name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return '範例 $index/$total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return '實戰 $index/$total';
  }

  @override
  String get lessonBonusCase => '額外狀況';

  @override
  String get lessonPracticeIntro => '真實打亂：只有前面的步驟已完成。跟著提示一條一條來，把這一整步完成。';

  @override
  String lessonContinueDesc(String lesson) {
    return '直接進入「$lesson」。';
  }

  @override
  String get lessonFreePractice => '自由練習';

  @override
  String get lessonFreePracticeDesc => '自己還原一顆打亂的 3D 方塊，從頭一直到這一步。';

  @override
  String freePracticeBanner(String topic) {
    return '自由練習：從頭開始，把方塊還原到「$topic」！';
  }

  @override
  String get pieceColorSeparator => '·';

  @override
  String cueFaceTurn(String face) {
    return '照箭頭方向轉動$face色中心所在的面。中心不動，只有它周圍的方塊在移動。';
  }

  @override
  String cueTrigger(String front) {
    return '右手公式，$front色朝向你：右面往上，頂層往左，右面往下，頂層往右轉回來。';
  }

  @override
  String get cueTriggerBack => '連續做到第六次，方塊就會完全回到原本的樣子。六就是神奇數字！';

  @override
  String cueSliceInner(String face) {
    return '只轉動緊鄰$face色面的內層。這一面本身不動，所以中心會被拆開。';
  }

  @override
  String cueSliceWide(String face) {
    return '寬層轉動：$face色面和旁邊的內層一起轉，就像一層厚厚的層。';
  }

  @override
  String cueTurnCube(String top, String front) {
    return '整顆方塊轉向，讓$top色中心朝上、$front色中心朝向你。';
  }

  @override
  String get cueTurnTop => '照箭頭只轉動頂層，為下一個公式做準備。';

  @override
  String get cueAlignTop => '最後一步：轉動頂層把顏色對齊。完成！';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece邊塊在頂層。轉動頂層，直到它剛好在$center色中心上方，再把那一面轉兩次放下去。';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece邊塊卡在中層。把它拿到頂層，對準$center色中心上方，再放下去。';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece邊塊位置對了，但方向相反：白色朝向側面。先把它拿出來，再以正確方向放回$center色中心旁邊。';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP 也可以轉底層。把$piece邊塊放下去，再轉動底層讓它對準$center色中心。';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return '轉動頂層，讓$piece角塊剛好在它的位置上方，也就是$a色和$b色兩面之間。重複右手公式，直到它以正確方向落進去。';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece角塊在自己的位置上，但方向轉錯了。做一次公式就會把它拿出來（一個黃色角塊會換進去）；繼續重複，直到它正確地回到原位。';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return '轉動頂層，直到$piece邊塊對準$a色中心，再把它送到右下方，$a色和$b色之間的位置。';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return '轉動頂層，直到$piece邊塊對準$a色中心，再把它送到左下方，$a色和$b色之間的位置。';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece邊塊在位置上，但方向相反。先插入一個黃色邊塊把它頂出來，再把它重新插入$a色和$b色之間。';
  }

  @override
  String cueYellowLine(String front) {
    return '黃色一字：轉動頂層讓它左右橫放，保持$front色朝向你，然後做黃色十字公式。';
  }

  @override
  String cueYellowL(String front) {
    return '黃色 L 形：轉動頂層讓 L 指向左後方，保持$front色朝向你，然後做公式。它會變成一字。';
  }

  @override
  String cueYellowDot(String front) {
    return '只有中心是黃色：一個點。保持$front色朝向你，做一次公式，就會得到 L 形。';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return '轉動頂層，直到$piece邊塊和$center色中心對上。';
  }

  @override
  String cueEdgesSwap(String front) {
    return '兩個對好的邊塊在後面和右邊。保持$front色朝向你，做交換公式：前面和左邊的邊塊互換位置。';
  }

  @override
  String cueEdgesOpposite(String front) {
    return '對好的邊塊彼此相對。保持$front色朝向你做一次交換；之後會有兩個相鄰的邊塊對好。';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece角塊已經在自己的位置上。把它放在右前方，保持$front色朝向你，輪換另外三個角塊。';
  }

  @override
  String cueCornersNone(String front) {
    return '還沒有黃色角塊在自己的位置上。保持$front色朝向你輪換一次；之後就會有一個角塊歸位。';
  }

  @override
  String cueTwistCorner(String piece) {
    return '調整右前方的$piece角塊：重複下層公式，直到它的黃色朝上。下面幾層暫時看起來是亂的，這很正常！';
  }

  @override
  String cueTwistFour(String piece) {
    return '這次$piece角塊需要做四次。繼續：黃色總會在兩次或四次後朝上。';
  }

  @override
  String get cueTwistNext => '只轉動頂層，把下一個方向不對的角塊轉到右前方。現在不要整顆轉向！';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return '在頂層把$piece角塊和$edge邊塊配成一對，再把這一對插入$a色和$b色之間的位置。';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece角塊和錯的邊塊一起卡在位置裡。先把它拿到頂層，再配對插入。';
  }

  @override
  String cueOllSune(String front) {
    return '保持$front色朝向你，做 Sune，讓黃色角塊朝上。';
  }

  @override
  String cueOllSuneAgain(String front) {
    return '這次一個 Sune 不夠。轉動頂層，保持$front色朝向你，再做一次 Sune。';
  }

  @override
  String cuePllCorners(String front) {
    return '有兩個角塊需要交換。把顏色相同的一對（車燈）放在左邊，保持$front色朝向你，做 T-perm。';
  }

  @override
  String cuePllEdges(String piece) {
    return '角塊已完成。把$piece邊塊放在後面，用 U-perm 輪換另外三個邊塊。';
  }

  @override
  String get cuePllNoEdge => '頂層還沒有邊塊和中心對上。從任一面做一次 U-perm；之後就會有一個對上。';

  @override
  String cueTwoSwapAdjacent(String front) {
    return '頂層兩個相鄰的角塊需要交換。把顏色相同的一對放在左邊，保持$front色朝向你，做交換公式。';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return '需要交換的兩個角塊位在對角。保持$front色朝向你，做對角交換。';
  }

  @override
  String cueCenterCycle(String color) {
    return '用中心三循環把走散的$color色中心塊送回家：內層、頂層、內層，然後全部還原。';
  }

  @override
  String cueCenterBar(String color) {
    return '一整條$color色中心塊在錯的面上。用內層把它抬上去，轉動頂層，再把它送回原位。';
  }

  @override
  String cueEdgePair(String piece) {
    return '把$piece邊的兩個小塊配對：先對齊，轉動內層，用右手動作換入一個未配對的邊，再把內層轉回來。';
  }

  @override
  String cueEdgeLast(String piece) {
    return '最後的邊：用最後兩邊公式配好$piece邊，已完成的邊都不會被打亂。';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL 特殊狀況：頂層有一個邊塊翻轉了，這在三階上從不會發生。把它放在前面，保持$front色朝向你，做特殊狀況修正公式。';
  }

  @override
  String get cueParityPll =>
      'PLL 特殊狀況：頂層兩個邊塊互換了，這在三階上從不會發生。把它們放在前面和後面，做特殊狀況交換公式。';

  @override
  String cueParityFive(String front) {
    return '邊的特殊狀況：一條邊外側的兩個小塊互換了。把這條邊轉到前面，保持$front色朝向你，修正後再轉回去。';
  }
}
