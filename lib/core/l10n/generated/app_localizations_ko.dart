// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline => '2×2부터 6×6까지, 모든 큐브를 스캔하고 풀고 마스터하세요.';

  @override
  String get chooseCubeSize => '큐브를 선택하세요';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => '입문';

  @override
  String get cubeLevel3 => '클래식';

  @override
  String get cubeLevel4 => '고급';

  @override
  String get cubeLevel5 => '전문가';

  @override
  String get cubeLevel6 => '마스터';

  @override
  String get cubeComingSoon => '새 큐브 곧 출시';

  @override
  String get carouselPrevious => '이전 큐브';

  @override
  String get carouselNext => '다음 큐브';

  @override
  String get chooseMode => '무엇을 할까요?';

  @override
  String get modePlayground => '3D 놀이터';

  @override
  String get modePlaygroundDesc => '3D로 층을 돌리고, 섞고, 동작을 다시 재생해 보세요.';

  @override
  String get modeScanSolve => '스캔하고 풀기';

  @override
  String get modeScanSolveDesc => '카메라로 큐브를 스캔하고 해법을 받아 보세요.';

  @override
  String get modeAcademy => '아카데미';

  @override
  String get modeAcademyDesc => '인터랙티브 강의로 차근차근 배워 보세요.';

  @override
  String get language => '언어';

  @override
  String get languageSearch => '언어 검색';

  @override
  String get languageNoResults => '검색과 일치하는 언어가 없습니다.';

  @override
  String playgroundTitle(int size) {
    return '$size×$size 놀이터';
  }

  @override
  String get scramble => '섞기';

  @override
  String get reset => '초기화';

  @override
  String get undo => '실행 취소';

  @override
  String get speed => '속도';

  @override
  String get xray => '투시';

  @override
  String get prime => '역방향';

  @override
  String get wide => '와이드';

  @override
  String layer(int index) {
    return '$index번째 층';
  }

  @override
  String get cubeRotations => '큐브 회전';

  @override
  String get play => '재생';

  @override
  String get pause => '일시정지';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count수',
      zero: '동작 없음',
    );
    return '$_temp0';
  }

  @override
  String get solved => '완성';

  @override
  String get scrambled => '섞임';

  @override
  String get orbitHint => '줄을 드래그해 돌리기 · 배경을 드래그해 시점 회전';

  @override
  String get notationPad => '기호 패드';

  @override
  String get solve => '풀기';

  @override
  String get solving => '푸는 중…';

  @override
  String get solveFast => '빠르게 풀기';

  @override
  String get solveLearn => '단계별로 배우기';

  @override
  String get solveModeGuided => '가이드 (3개 층)';

  @override
  String get solveModeFast => '빠르게 (최적)';

  @override
  String solveUnavailable(int size) {
    return '$size×$size 솔버는 이후 업데이트에서 제공됩니다.';
  }

  @override
  String get solveAlreadySolved => '큐브가 이미 맞춰져 있습니다.';

  @override
  String solveFailed(String reason) {
    return '이 큐브는 풀 수 없습니다($reason).';
  }

  @override
  String get solveEngineMissing => '이 기기에서는 풀이 엔진을 사용할 수 없습니다.';

  @override
  String get solveComplete => '완성! 잘했어요.';

  @override
  String solveSummary(int count) {
    return '$count수';
  }

  @override
  String get nextMove => '다음 동작';

  @override
  String get previousMove => '이전 동작';

  @override
  String get halfTurnHalfway => '좋아요, 절반 왔어요! 같은 방향으로 한 번 더 돌리면 180° 회전이 완성돼요.';

  @override
  String get wideTurnInner => '잘했어요! 이제 옆의 안쪽 층을 밀어 와이드 회전을 완성하세요.';

  @override
  String get wideTurnOuter => '잘했어요! 이제 옆의 바깥쪽 층을 밀어 와이드 회전을 완성하세요.';

  @override
  String get wideTurnMore => '잘했어요! 빛나는 층을 하나씩 계속 밀어 와이드 회전을 완성하세요.';

  @override
  String get guideSwipeHint => '빛나는 층을 화살표 방향으로 밀거나 다음을 탭하세요.';

  @override
  String get guideRotateHint => '화살표대로 큐브 전체를 돌린 뒤 다음을 탭하세요.';

  @override
  String get guideWrongMove => '강조된 화살표를 따라 하세요';

  @override
  String get guideExit => '가이드 종료';

  @override
  String get colorWhite => '흰색';

  @override
  String get colorYellow => '노란색';

  @override
  String get colorGreen => '초록색';

  @override
  String get colorBlue => '파란색';

  @override
  String get colorRed => '빨간색';

  @override
  String get colorOrange => '주황색';

  @override
  String get phaseOptimal2x2 => '최단 해법';

  @override
  String get phaseKociemba1 => '1단계 · 조각 방향 맞추기';

  @override
  String get phaseKociemba2 => '2단계 · 큐브 완성하기';

  @override
  String get phaseLblCross => '흰색 십자';

  @override
  String get phaseLblCorners => '1층 코너';

  @override
  String get phaseLblMiddle => '가운데 층 엣지';

  @override
  String get phaseLblYellowCross => '노란색 십자';

  @override
  String get phaseLblYellowEdges => '노란색 십자 엣지 맞추기';

  @override
  String get phaseLblYellowCorners => '노란색 코너 위치 맞추기';

  @override
  String get phaseLblYellowCornersOrient => '노란색 코너 방향 맞추기';

  @override
  String get crownFirst => '1층';

  @override
  String get crownSecond => '2층';

  @override
  String get crownThird => '3층';

  @override
  String get crownFirstGoal => '흰색 면과 첫 번째 층';

  @override
  String get crownSecondGoal => '가운데 층';

  @override
  String get crownThirdGoal => '노란색 면과 마지막 층';

  @override
  String get subStepGoal11 => '흰색 엣지가 옆 센터 색과도 맞는 흰색 십자를 만드세요.';

  @override
  String get subStepGoal12 => '흰색 코너 4개를 제자리에 넣어 흰색 면과 1층 전체를 완성합니다.';

  @override
  String get subStepGoal21 => '1층을 흐트러뜨리지 않고 가운데 층 엣지 4개를 넣습니다.';

  @override
  String get subStepGoal31 => '마지막 층에 노란색 십자를 만드세요.';

  @override
  String get subStepGoal32 => '노란색 십자 엣지를 바꿔 각 엣지가 옆면 센터와 맞도록 하세요.';

  @override
  String get subStepGoal33 => '노란색 코너 4개를 올바른 자리로 옮기세요. 아직 비틀려 있어도 괜찮아요.';

  @override
  String get subStepGoal34 => '노란색 코너를 제자리에서 돌려 모든 스티커가 맞고 큐브가 완성되도록 하세요.';

  @override
  String get explainOptimal2x2 => '2×2의 모든 상태를 탐색해서 찾은 가장 짧은 해법입니다.';

  @override
  String get explainKociemba1 => '모든 조각의 방향을 맞추고 가운데 층 엣지를 가운데 층으로 모읍니다.';

  @override
  String get explainKociemba2 => '그 방향을 유지하는 U, D와 180도 회전만으로 마무리합니다.';

  @override
  String get explainLblOrient => '흰색 센터가 아래를 향하도록 큐브 전체를 돌리세요.';

  @override
  String explainLblCrossEdge(String piece) {
    return '$piece 엣지를 흰색 센터 옆으로 내리고 옆면 색을 맞추세요.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece 코너가 잘못된 자리에 끼어 있어요. R U R\' U\'로 위로 꺼내세요.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return '$piece 코너가 들어갈 자리 바로 위에 올 때까지 윗층을 돌리세요.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '$piece 코너가 제자리에 들어갈 때까지 R U R\' U\'를 반복하세요.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece 엣지가 가운데 층에 있지만 잘못 들어가 있어요. 위로 꺼내세요.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return '$piece 엣지의 옆면 색이 센터와 맞도록 윗층을 돌리세요.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '$piece 엣지를 오른쪽으로 넣으세요: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '$piece 엣지를 왼쪽으로 넣으세요: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign => '다음 공식을 위해 윗층을 돌려 노란색 모양의 위치를 맞추세요.';

  @override
  String get explainLblYellowCrossAlg => 'F R U R\' U\' F\'로 노란색 십자를 만드세요.';

  @override
  String get explainLblYellowEdgesAlign => '노란색 엣지가 센터와 맞도록 윗층을 돌리세요.';

  @override
  String get explainLblYellowEdgesAlg => 'R U R\' U R U2 R\' U로 노란색 엣지를 바꾸세요.';

  @override
  String get explainLblYellowCornersAlg =>
      'U R U\' L\' U R\' U\' L로 노란색 코너를 제자리로 돌리세요.';

  @override
  String get explainLblNextCorner => '윗층을 돌려 다음으로 풀 노란색 코너를 오른쪽 앞으로 가져오세요.';

  @override
  String get explainLblCornerTwist =>
      '노란색이 위를 향할 때까지 R\' D\' R D를 반복하세요. 아랫층은 마지막에 저절로 맞춰집니다.';

  @override
  String get explainLblFinalAlign => '윗층을 돌려 큐브를 완성하세요.';

  @override
  String scanTitle(int size) {
    return '$size×$size 스캔';
  }

  @override
  String get scanManualInput => '색을 직접 입력';

  @override
  String get scanUseCamera => '카메라로 스캔';

  @override
  String scanFaceProgress(int current, int total) {
    return '$total면 중 $current면';
  }

  @override
  String get faceUp => '윗면';

  @override
  String get faceRight => '오른쪽 면';

  @override
  String get faceFront => '앞면';

  @override
  String get faceDown => '아랫면';

  @override
  String get faceLeft => '왼쪽 면';

  @override
  String get faceBack => '뒷면';

  @override
  String get scanHintFront =>
      '아무 면이나 나를 향하게 큐브를 잡으세요. 그 면이 앞면입니다. 스캔하는 동안 윗면은 바꾸지 마세요.';

  @override
  String get scanHintRight => '앞면에서 큐브 전체를 왼쪽으로 한 번 돌려 오른쪽 면이 나를 향하게 하세요.';

  @override
  String get scanHintBack => '앞면에서 큐브 전체를 왼쪽으로 두 번 돌리세요.';

  @override
  String get scanHintLeft => '앞면에서 큐브 전체를 오른쪽으로 한 번 돌리세요.';

  @override
  String get scanHintUp => '앞면에서 윗면을 내 쪽으로 기울여 카메라를 향하게 하세요.';

  @override
  String get scanHintDown => '앞면에서 아랫면을 내 쪽으로 기울여 카메라를 향하게 하세요.';

  @override
  String get scanAlignHint => '격자에 면을 꽉 채운 뒤 셔터를 탭하세요.';

  @override
  String get scanCapture => '면 촬영';

  @override
  String get scanTurnLeft => '큐브 전체를 왼쪽으로 돌리세요';

  @override
  String get scanTurnRight => '큐브 전체를 오른쪽으로 돌리세요';

  @override
  String get scanTipTop => '윗면을 내 쪽으로 기울이세요';

  @override
  String get scanTipBottom => '아랫면을 내 쪽으로 기울이세요';

  @override
  String get scanGlareTip =>
      '빛 반사가 감지됐어요. 큐브를 살짝 기울이거나 휴대폰으로 위를 가려 천장 조명을 막아 보세요.';

  @override
  String get scanDimTip => '너무 어두워요. 밝은 곳으로 이동하거나 손전등을 켜세요.';

  @override
  String get scanTorch => '손전등';

  @override
  String get scanGuideLabel =>
      '스캔 가이드: 스캔한 면은 색으로 표시됩니다. 스캔한 면을 탭하면 다시 스캔할 수 있어요.';

  @override
  String get scanTapToRescan => '스캔한 면을 탭하면 다시 스캔할 수 있습니다.';

  @override
  String get scanCameraMissing => '이 기기에서 카메라를 찾을 수 없습니다.';

  @override
  String get scanCameraDenied => '카메라 접근이 거부되었습니다. 색은 직접 입력할 수 있습니다.';

  @override
  String get scanCameraFailed => '카메라를 시작할 수 없습니다.';

  @override
  String get scanAllGood => '모든 스티커가 올바르게 보입니다.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스티커 $count개가 잘못된 것 같아요',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => '뭔가 맞지 않아요';

  @override
  String scanIssueColors(int count) {
    return '각 색은 정확히 $count번씩 나와야 합니다.';
  }

  @override
  String get scanIssueCenters => '두 센터의 색이 같습니다.';

  @override
  String get scanIssuePieces => '이 스티커들은 실제 큐브에 없는 조각을 만듭니다.';

  @override
  String get scanIssueTwist => '코너 하나가 비틀려 있습니다. 코너 스티커를 확인하세요.';

  @override
  String get scanIssueFlip => '엣지 하나가 뒤집혀 있습니다. 엣지 스티커를 확인하세요.';

  @override
  String get scanIssueParity => '두 조각이 서로 바뀐 것 같습니다.';

  @override
  String get scanIssueUnavailable => '이 기기에서는 색 검사를 사용할 수 없습니다.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스티커 $count개를 읽기 어려웠어요. 한번 확인해 주세요.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint => '스티커를 탭해 색 변경 · 길게 눌러 팔레트 열기';

  @override
  String get scanRescanFace => '면 다시 스캔';

  @override
  String get scanCancelRescan => '색 확인으로 돌아가기';

  @override
  String get scanPaletteTitle => '색 선택';

  @override
  String get scanOpen3d => '3D로 열기';

  @override
  String get scanRestart => '처음부터 다시';

  @override
  String get modeTimer => '스피드 타이머';

  @override
  String get modeTimerDesc => '스크램블, 인스펙션, 평균, 개인 기록.';

  @override
  String get modeDaily => '오늘의 도전';

  @override
  String get modeDailyDesc => '매일 새로운 스크램블. 연속 기록을 이어 가세요.';

  @override
  String get modePatterns => '패턴 라이브러리';

  @override
  String get modePatternsDesc => '체커보드, 슈퍼플립 등 다양한 패턴을 3D로.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 연속',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => '이어서 배우기';

  @override
  String get startLearning => '배우기 시작';

  @override
  String lessonOf(int index, int total) {
    return '$total개 중 $index번째 강의';
  }

  @override
  String get academyAllDone => '모든 강의를 완료했어요!';

  @override
  String get academyTitle => '아카데미';

  @override
  String academyProgress(int done, int total) {
    return '$total개 중 $done개 강의 완료';
  }

  @override
  String get lessonAdvanced => '고급';

  @override
  String lessonPartOf(int index, int total) {
    return '$total부 중 $index부';
  }

  @override
  String get lessonNext => '다음';

  @override
  String get lessonPrevious => '이전';

  @override
  String get lessonFinish => '강의 마치기';

  @override
  String get lessonComplete => '강의 완료!';

  @override
  String get lessonNextLesson => '다음 강의';

  @override
  String get lessonBackToAcademy => '아카데미로 돌아가기';

  @override
  String get lessonTryIt => '이제 해 보세요: 화살표가 가리키는 층을 밀거나 다음을 탭하세요.';

  @override
  String get lessonLookAround => '배경을 드래그해 큐브를 여러 방향에서 살펴보세요.';

  @override
  String get lessonDemoDone => '좋아요! 다음을 탭해 계속하세요.';

  @override
  String holdPrompt(String top, String front) {
    return '$top 센터가 위, $front 센터가 앞을 향하도록 큐브를 잡으세요.';
  }

  @override
  String get trackBeginner => '초보자 3×3: 층별 맞추기';

  @override
  String get trackCfop => 'CFOP 입문';

  @override
  String get trackTwoByTwo => '2×2 초보자 & Ortega';

  @override
  String get trackBigCubes => '큰 큐브: 리덕션과 패리티';

  @override
  String moveSentence(String layer, String direction) {
    return '$layer을(를) $direction 돌리세요';
  }

  @override
  String get moveFaceR => '오른쪽 면';

  @override
  String get moveFaceL => '왼쪽 면';

  @override
  String get moveFaceU => '윗면';

  @override
  String get moveFaceD => '아랫면';

  @override
  String get moveFaceF => '앞면';

  @override
  String get moveFaceB => '뒷면';

  @override
  String moveLayerInner(int depth, String face) {
    return '$face에서 $depth번째 층';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face($depth층 깊이)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '$face에서 $near–$far번째 층';
  }

  @override
  String get moveLayerMiddle => '가운데 층';

  @override
  String get moveDirUp => '위로';

  @override
  String get moveDirDown => '아래로';

  @override
  String get moveDirLeft => '왼쪽으로';

  @override
  String get moveDirRight => '오른쪽으로';

  @override
  String get moveDirClockwise => '시계 방향으로';

  @override
  String get moveDirCounter => '반시계 방향으로';

  @override
  String get moveDirBackClockwise => '뒤에서 보았을 때 시계 방향으로';

  @override
  String get moveDirBackCounter => '뒤에서 보았을 때 반시계 방향으로';

  @override
  String get moveDirHalf => '반 바퀴(두 번)';

  @override
  String get moveRotateX => '큐브 전체를 기울이세요: 앞면이 위로 갑니다';

  @override
  String get moveRotateXPrime => '큐브 전체를 기울이세요: 앞면이 아래로 갑니다';

  @override
  String get moveRotateX2 => '큐브 전체를 뒤집으세요: 앞면이 뒤로 갑니다';

  @override
  String get moveRotateY => '큐브 전체를 돌리세요: 앞면이 왼쪽으로 갑니다';

  @override
  String get moveRotateYPrime => '큐브 전체를 돌리세요: 앞면이 오른쪽으로 갑니다';

  @override
  String get moveRotateY2 => '큐브 전체를 반 바퀴 돌리세요: 뒷면이 앞으로 옵니다';

  @override
  String get moveRotateZ => '큐브 전체를 시계 방향으로 굴리세요: 윗면이 오른쪽으로 갑니다';

  @override
  String get moveRotateZPrime => '큐브 전체를 반시계 방향으로 굴리세요: 윗면이 왼쪽으로 갑니다';

  @override
  String get moveRotateZ2 => '큐브 전체를 위아래로 뒤집으세요: 윗면이 아래로 갑니다';

  @override
  String get phaseReductionCenters => '센터';

  @override
  String get phaseReductionEdges => '엣지 짝 맞추기';

  @override
  String get phaseReductionEdgeParity => '엣지 패리티';

  @override
  String get phaseReductionOllParity => 'OLL 패리티';

  @override
  String get phaseReductionPllParity => 'PLL 패리티';

  @override
  String get explainReductionCenterBlock =>
      '여러 센터 조각을 한 번에 제자리로 보내는 슬라이스 회전입니다.';

  @override
  String explainReductionCenterCycle(String piece) {
    return '완성된 센터는 건드리지 않는 3-사이클로 $piece 센터 조각을 제 면으로 보내세요.';
  }

  @override
  String get explainReductionParityCenters => '패리티 슬라이스 회전으로 흐트러진 센터를 다시 맞추세요.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '3-사이클로 $piece 엣지 조각을 이어 붙이세요. 센터는 그대로 유지됩니다.';
  }

  @override
  String get explainReductionEdgeParity =>
      '마지막 엣지는 3-사이클만으로 짝을 맞출 수 없습니다(엣지 패리티). 안쪽 슬라이스를 한 번 돌리면 해결됩니다.';

  @override
  String get explainReductionOllParity =>
      'OLL 패리티: 엣지 하나가 뒤집혀 있는데, 3×3에서는 불가능한 상태입니다. 이 공식으로 다시 뒤집습니다.';

  @override
  String get explainReductionPllParity =>
      'PLL 패리티: 엣지 두 개가 서로 바뀌어 있는데, 3×3에서는 불가능한 상태입니다. 이 공식으로 되돌립니다.';

  @override
  String get patternsTitle => '패턴 라이브러리';

  @override
  String get patternsHint => '패턴을 탭해서 보고, 내 큐브로 따라 해 보세요.';

  @override
  String get patternCheckerboard => '체커보드';

  @override
  String get patternCubeInCube => '큐브 속 큐브';

  @override
  String get patternSuperflip => '슈퍼플립';

  @override
  String get patternDots => '점무늬';

  @override
  String get patternCross => '십자';

  @override
  String get patternPython => '파이썬';

  @override
  String get phasePattern => '패턴 만들기';

  @override
  String get explainPatternStep => '내 큐브로 한 동작씩 따라 하세요. 풀기를 탭하면 원래대로 돌아갑니다.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => '스피드 타이머';

  @override
  String get timerHoldToStart => '길게 누른 뒤 손을 떼면 시작';

  @override
  String get timerReleaseToStart => '손을 떼면 시작';

  @override
  String get timerTapToStop => '아무 곳이나 탭하면 정지';

  @override
  String get timerInspectionToggle => '15초 인스펙션';

  @override
  String get timerLoadingScramble => '스크램블 생성 중…';

  @override
  String get timerPb => '최고 기록';

  @override
  String get timerSolves => '기록 수';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => '삭제';

  @override
  String get timerHistory => '기록';

  @override
  String get timerNoSolves => '아직 기록이 없어요. 큐브를 섞고 시작해 보세요!';

  @override
  String get timerNewPb => '새 개인 기록!';

  @override
  String get timerClearHistory => '기록 지우기';

  @override
  String get timerScrambleHint => '흰색을 위, 초록색을 앞으로 잡고 섞으세요:';

  @override
  String get dailyTitle => '오늘의 도전';

  @override
  String dailyFor(String date) {
    return '$date 도전';
  }

  @override
  String dailyBestStreak(int count) {
    return '최장 연속 기록: $count';
  }

  @override
  String get dailyDone => '오늘은 완료! 내일 또 만나요.';

  @override
  String get dailyNotDone => '오늘의 스크램블을 풀어 연속 기록을 이어 가세요.';

  @override
  String get dailySolveVirtual => '3D 큐브로 풀기';

  @override
  String get dailyTimeIt => '내 큐브로 시간 재기';

  @override
  String get dailyHint => '힌트';

  @override
  String dailyHintText(String moves) {
    return '흰색 십자부터 시작하세요: $moves';
  }

  @override
  String get dailyHintFailed => '지금은 힌트를 사용할 수 없습니다.';

  @override
  String get lessonBasics => '큐브와 친해지기';

  @override
  String get lessonBasicsDesc => '조각, 면, 동작 이름.';

  @override
  String get stepBasicsPieces => '세 가지 조각';

  @override
  String get stepBasicsPiecesBody =>
      '센터는 움직이지 않고 각 면의 색을 정합니다. 엣지는 두 가지 색, 코너는 세 가지 색입니다. 큐브를 맞춘다는 것은 모든 엣지와 코너를 같은 색 센터 옆으로 옮기는 것입니다.';

  @override
  String get stepBasicsFaces => '여섯 개의 면 기호';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F, B는 각각 오른쪽, 왼쪽, 위, 아래, 앞, 뒤 면입니다. 기호만 있으면 그 면을 정면으로 바라봤을 때 시계 방향으로 90도 돌린다는 뜻입니다.';

  @override
  String get stepBasicsPrime => '역방향과 두 번 돌리기';

  @override
  String get stepBasicsPrimeBody =>
      '아포스트로피(R\')는 반대 방향, 즉 반시계 방향입니다. 2(U2)는 반 바퀴, 즉 90도를 두 번입니다.';

  @override
  String get stepCrossGoal => '목표';

  @override
  String get stepCrossGoalBody =>
      '노란색을 위, 초록색을 앞으로 잡으세요. 먼저 흰색 엣지 네 개를 흰색이 위로 가게 노란 센터 둘레에 꽃잎처럼 모아요: 이게 데이지예요. 그다음 꽃잎을 하나씩 흰색 센터로 내리고, 옆면 색을 옆 센터에 맞춰요.';

  @override
  String get stepCrossTop => '위에 있는 엣지';

  @override
  String get stepCrossTopBody =>
      '흰색이 위를 보는 윗층 흰색 엣지는 데이지의 꽃잎이에요. 윗층을 돌려 옆면 색을 같은 색 센터 바로 위에 맞춘 다음, 그 면을 두 번(180°) 돌려 흰색 센터로 내려요.';

  @override
  String get stepCrossMiddle => '가운데에 있는 엣지';

  @override
  String get stepCrossMiddleBody =>
      '가운데 층에 걸린 엣지는 먼저 위로 올려요: 옆면을 올리고, 윗층을 비키고, 옆면을 되돌리면 넣어 둔 조각은 그대로예요. 이제 윗층의 꽃잎이니 맞춘 뒤 그 면을 두 번 돌려요.';

  @override
  String get stepCornersInsert => '자리 바로 위로';

  @override
  String get stepCornersInsertBody =>
      '윗층을 돌려 흰색 코너를 옆면 색과 같은 두 센터 사이, 제자리 바로 위에 맞춰요. 여기서는 위 한 번과 R U\' R\'면 돼요: U로 코너를 자리 위로 옮기고, R U\' R\'로 흰색이 아래로 가게 넣어요.';

  @override
  String get stepCornersRepeat => '트리거 반복';

  @override
  String get stepCornersRepeatBody =>
      '자리를 오른쪽 앞에 두고 흰색이 아래를 볼 때까지 R U R\' U\'를 반복해요: 흰색이 오른쪽이면 1번, 위면 3번, 나를 보면 5번. 그동안 윗면이 흐트러져 보여도 저절로 정리돼요.';

  @override
  String get stepMiddleRight => '오른쪽으로 넣기';

  @override
  String get stepMiddleRightBody =>
      '노란색이 없는 윗층 엣지를 찾으세요. 윗층을 돌려 앞면 색을 눈앞의 센터에 맞춰요. 윗면 색이 오른쪽 센터와 같으면 오른쪽으로: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => '왼쪽으로 넣기';

  @override
  String get stepMiddleLeftBody =>
      '윗면 색이 왼쪽 센터와 같으면 대칭 공식을 써요: U\' L\' U L U F U\' F\'. 흰색 층은 매번 그대로 돌아와요.';

  @override
  String get stepYellowCross => '하나의 공식';

  @override
  String get stepYellowCrossBody =>
      '윗면의 노란 엣지만 보세요. ㄱ자는 왼쪽 뒤, 선은 가로로 두고 F R U R\' U\' F\'를 해요. 선은 1번, ㄱ자는 2번, 점은 최대 3번이에요.';

  @override
  String get stepYellowEdges => '엣지 맞추기';

  @override
  String get stepYellowEdgesBody =>
      '윗층을 돌려 엣지 두 개를 센터에 맞춰요. 하나는 뒤, 하나는 오른쪽에 있으면 R U R\' U R U2 R\' U가 앞과 왼쪽 엣지를 바꿔요.';

  @override
  String get stepPlaceCorners => '위치 맞추기';

  @override
  String get stepPlaceCornersBody =>
      '코너 색이 둘레의 세 센터와 맞으면, 꼬여 있어도 제자리예요. 그런 코너를 오른쪽 앞에 두면 U R U\' L\' U R\' U\' L이 나머지 셋을 돌려요. 네 개가 모두 제자리일 때까지 반복해요.';

  @override
  String get stepTwistCorners => '방향 맞추기';

  @override
  String get stepTwistCornersBody =>
      '안 맞은 코너를 오른쪽 앞에 두고 노란색이 위로 올 때까지 R\' D\' R D를 두 번씩 반복한 뒤, 다음 코너는 윗층만 돌려 가져와요. 마지막 코너까지 아래가 깨져 보여도 계속하세요.';

  @override
  String get lessonCfopIntro => 'CFOP란?';

  @override
  String get lessonCfopIntroDesc => '크로스, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => '네 단계';

  @override
  String get stepCfopOverviewBody =>
      '스피드큐버는 십자를 맞추고, 첫 층 코너를 가운데 엣지와 짝지어 넣고(F2L), 마지막 층의 방향을 맞춘 뒤(OLL), 마지막으로 위치를 맞춥니다(PLL).';

  @override
  String get stepCfopCross => '십자 계획하기';

  @override
  String get stepCfopCrossBody =>
      'CFOP에서는 인스펙션 동안 십자를 계획하고, 아랫면에 약 8수 만에 만듭니다.';

  @override
  String get lessonF2l => 'F2L 기초';

  @override
  String get lessonF2lDesc => '코너와 엣지를 짝지으세요.';

  @override
  String get stepF2lRight => '한 쌍 넣기';

  @override
  String get stepF2lRightBody => '코너와 그 엣지가 윗면에서 나란히 있으면, 자리 위로 가져가 함께 넣으세요.';

  @override
  String get stepF2lLeft => '왼쪽 쌍';

  @override
  String get stepF2lLeftBody =>
      '반대쪽의 같은 경우는 대칭인 U\' L\' U L입니다. 큐브를 돌리면(y) 편한 손을 쓸 수 있습니다.';

  @override
  String get lessonOll => '2-룩 OLL';

  @override
  String get lessonOllDesc => '윗면을 노란색으로 만드세요.';

  @override
  String get stepOllCross => '엣지 먼저';

  @override
  String get stepOllCrossBody => '2-룩 OLL은 이미 알고 있는 노란색 십자 공식으로 시작합니다.';

  @override
  String get stepOllSune => '수네';

  @override
  String get stepOllSuneBody =>
      '노란색 코너 하나가 왼쪽 앞에서 위를 보고 있으면 수네(R U R\' U R U2 R\')가 나머지 세 개의 방향을 맞춥니다. 다른 경우도 대부분 수네와 그 대칭으로 풀 수 있습니다.';

  @override
  String get lessonPll => '2-룩 PLL';

  @override
  String get lessonPllDesc => '큐브를 완성하세요.';

  @override
  String get stepPllT => 'T-퍼뮤테이션';

  @override
  String get stepPllTBody =>
      'T-퍼뮤테이션은 코너 두 개와 엣지 두 개를 바꿉니다. 코너 위치를 맞출 때 쓰며, 바꿔야 할 두 코너를 오른쪽에 두세요.';

  @override
  String get stepPllU => 'U-퍼뮤테이션';

  @override
  String get stepPllUBody =>
      '코너가 다 맞으면 U-퍼뮤테이션으로 엣지 세 개를 돌립니다. 완성된 면을 뒤쪽에 두세요.';

  @override
  String get lessonTwoFirst => '2×2 첫 번째 층';

  @override
  String get lessonTwoFirstDesc => '코너 색이 맞는 한 면을 만드세요.';

  @override
  String get stepTwoIntro => '코너뿐';

  @override
  String get stepTwoIntroBody =>
      '2×2는 코너 여덟 개뿐이에요: 엣지도 센터도 없어요. 이웃 옆면 색이 맞게 흰색 층을 아래에 만들고, 한 가지 방법으로 마무리해요: Sune으로 윗면을 노랗게, 그다음 T-perm이나 Y-perm.';

  @override
  String get stepTwoCorner => '코너 넣기';

  @override
  String get stepTwoCornerBody =>
      '3×3 흰색 코너와 같아요: 코너를 오른쪽 앞 빈자리 위로 가져와 넣어요. 여기선 U R U\' R\', 또는 흰색이 아래를 볼 때까지 R U R\' U\' 반복. 옆면 색을 이웃과 비교해 보세요.';

  @override
  String get lessonTwoOll => '윗면 방향 맞추기';

  @override
  String get lessonTwoOllDesc => '수네를 이용한 Ortega OLL.';

  @override
  String get stepTwoSune => '다시 수네';

  @override
  String get stepTwoSuneBody =>
      '위를 보는 노란 스티커를 세요. 노란색이 위인 유일한 코너를 왼쪽 앞에 두고 Sune(R U R\' U R U2 R\')을 해요. 다시 세고 다시 잡아요. Sune은 최대 3번, 사이에는 윗층만 돌려요.';

  @override
  String get lessonTwoPbl => '두 층 위치 맞추기';

  @override
  String get lessonTwoPblDesc => '코너를 바꿔 완성하세요.';

  @override
  String get stepTwoAdjacent => '이웃한 코너 교환';

  @override
  String get stepTwoAdjacentBody =>
      '헤드라이트는 한 옆면 위쪽의 같은 색 스티커 두 개예요. 윗층을 돌려 헤드라이트를 왼쪽에 두면 바꿀 코너 두 개가 오른쪽에 와요. 그다음 T-perm을 해요.';

  @override
  String get stepTwoDiagonal => '대각선 교환';

  @override
  String get stepTwoDiagonalBody =>
      '어느 면에도 헤드라이트가 없으면 대각선 코너 두 개를 바꿔야 해요: 아무 방향에서나 Y-perm을 하고, 윗층을 돌려 전체를 맞춰요.';

  @override
  String get lessonBigIntro => '큰 큐브의 조각';

  @override
  String get lessonBigIntroDesc => '센터, 윙, 슬라이스.';

  @override
  String get stepBigPieces => '고정된 센터가 없음';

  @override
  String get stepBigPiecesBody =>
      '4×4는 면마다 움직이는 센터 조각이 네 개 있고, 엣지는 윙 두 개로 되어 있어요. 고정 센터가 없으니 코너로 색 순서를 확인하세요: 흰색 맞은편은 노란색, 파란색은 초록색, 빨간색은 주황색.';

  @override
  String get stepBigSlices => '와이드 회전과 안쪽 회전';

  @override
  String get stepBigSlicesBody =>
      'Rw는 오른쪽 두 층을 함께 돌립니다. 2R은 오른쪽에서 두 번째 층만 돌립니다. 이런 회전이 센터와 윙을 움직입니다.';

  @override
  String get lessonBigCenters => '센터';

  @override
  String get lessonBigCentersDesc => '센터 조각을 모으세요.';

  @override
  String get stepBigCenterCycle => '센터 3-사이클';

  @override
  String get stepBigCenterCycleBody =>
      '이 커뮤테이터는 센터 조각을 정확히 세 개만 옮기고 나머지는 그대로 둬요. 완성된 센터는 그대로예요. 떠돌이 조각 하나가 막대에 안 붙을 때 써요.';

  @override
  String get lessonBigEdges => '엣지 짝 맞추기';

  @override
  String get lessonBigEdgesDesc => '윙을 이어 완전한 엣지를 만드세요.';

  @override
  String get stepBigEdgePair => '짝 맞추고 되돌리기';

  @override
  String get stepBigEdgePairBody =>
      'Uw\'로 같은 윙 두 개를 나란히 놓고, R U R\' F R\' F\' R로 짝 없는 엣지를 바꿔 넣은 뒤, Uw로 센터를 되돌려요. 연 층은 꼭 닫으세요.';

  @override
  String get lessonBigParity => '패리티';

  @override
  String get lessonBigParityDesc => '짝수 큐브의 OLL 패리티와 PLL 패리티.';

  @override
  String get stepBigOllParity => 'OLL 패리티';

  @override
  String get stepBigOllParityBody =>
      '엣지 하나만 뒤집히는 건 3×3에서 불가능해요: 실수가 아니라 OLL 패리티예요. 윗층 앞에 두고 긴 공식을 해요. 위의 왼쪽·오른쪽 엣지와 코너 두 개도 바뀌지만, 3×3 마지막 단계에서 고쳐져요.';

  @override
  String get stepBigPllParity => 'PLL 패리티';

  @override
  String get stepBigPllParityBody =>
      '맨 마지막에 엣지 두 개가 바뀌었는데 맞는 3×3 공식이 없나요? 그게 PLL 패리티예요. 윗층 앞과 뒤에 두고 2R2 U2 2R2 Uw2 2R2 2U2로 바꿔요.';

  @override
  String get introGoalHeading => '목표가 뭐예요?';

  @override
  String get introHowHeading => '어떻게 하나요?';

  @override
  String get introHoldHeading => '잡는 법';

  @override
  String get introWhyHeading => '왜 되는 걸까';

  @override
  String get introStart => '알겠어요, 한 단계씩 시작';

  @override
  String get introDontShowAgain => '다시 자동으로 표시하지 않기';

  @override
  String get introShowGoal => '목표 보기';

  @override
  String get introStateStart => '시작';

  @override
  String get introStateGoal => '목표';

  @override
  String get introPlayMorph => '시작부터 목표까지 재생';

  @override
  String get introGoalBasics => '큐브 읽는 법을 배워요: 조각, 여섯 면, 그리고 회전 기호가 면을 돌리는 방식.';

  @override
  String get introGoalCross => '아래에 흰색 십자를 만들고, 흰색 엣지마다 옆 센터 색도 맞춰요.';

  @override
  String get introGoalCorners => '흰색 코너 4개를 넣어 1층 전체를 완성해요: 흰색 면과 맞춰진 옆면 색.';

  @override
  String get introGoalMiddle => '가운데 층 엣지 네 개를 넣어 아래 두 층을 완성해요.';

  @override
  String get introGoalYellowCross => '윗면에 노란 십자를 만들어요. 옆면 색은 아직 안 맞아도 돼요.';

  @override
  String get introGoalYellowEdges => '노란 십자의 각 엣지를 그쪽 센터 색에 맞춰요.';

  @override
  String get introGoalYellowCorners => '노란 코너를 각자 제자리로 옮겨요. 아직 비틀려 있어도 괜찮아요.';

  @override
  String get introGoalTwistCorners => '노란 코너를 올바른 색으로 비틀어 큐브 전체를 완성해요.';

  @override
  String get introGoalCfopIntro => '스피드큐빙 계획을 알아봐요: 십자, F2L, 그리고 마지막 층을 두 단계로.';

  @override
  String get introGoalF2l => '흰색 코너를 가운데 엣지와 함께 넣어 두 층을 한 번에 끝내요.';

  @override
  String get introGoalOll => '공식 한두 개로 윗면 전체를 노랗게 만들어요.';

  @override
  String get introGoalPll => '마지막 층 조각을 제자리로 옮겨 큐브를 완성해요.';

  @override
  String get introGoalTwoFirst => '2×2에서 흰색 층 하나를 완성해요.';

  @override
  String get introGoalTwoOll => '2×2의 윗면 전체를 노랗게 만들어요.';

  @override
  String get introGoalTwoPbl =>
      'T-perm이나 Y-perm 한 번으로 마지막 코너를 제자리로 보내고, 윗층을 맞춰 2×2를 완성해요.';

  @override
  String get introGoalBigIntro => '4×4를 알아봐요: 센터, 엣지 쌍, 코너, 그리고 이들을 돌리는 기호.';

  @override
  String get introGoalBigCenters => '각 면의 센터 조각을 한 가지 색 블록으로 모아요.';

  @override
  String get introGoalBigEdges => '같은 색 엣지 조각을 짝지어 모든 엣지가 3×3 엣지 하나처럼 보이게 해요.';

  @override
  String get introGoalBigParity =>
      '3×3에서는 절대 없는 4×4의 두 경우를 고쳐요: 뒤집힌 엣지 하나(OLL 패리티) 또는 자리가 바뀐 엣지 둘(PLL 패리티).';

  @override
  String get introHowBasics =>
      '센터는 절대 움직이지 않아서 각 면의 색을 알려 줘요.\n각 기호는 한 면을 시계 방향으로 90° 돌려요.\n아포스트로피(\')는 반대로, 2는 두 번 돌려요.';

  @override
  String get introHoldBasics =>
      '아무렇게나 잡아도 돼요: 센터는 움직이지 않아서 색만 보면 어느 면인지 알 수 있어요.';

  @override
  String get introWhyBasics => '모든 공식은 이 글자들의 나열이라서, 읽을 줄 아는 게 첫 번째 기술이에요.';

  @override
  String get introHowCross =>
      '흰색 엣지를 흰색이 위로 가게 윗층으로 올려 노란 센터를 둘러싸요: 이게 데이지예요.\n윗층을 돌려 꽃잎의 옆면 색을 같은 색 센터 위에 맞춰요.\n그 면을 두 번 돌려 내리고, 네 개 모두 똑같이 해요.';

  @override
  String get introHoldCross =>
      '이 단계 내내 노란 센터는 위, 흰색 센터는 아래예요. 꽃잎을 맞출 때는 큐브가 아니라 윗층을 돌려요.';

  @override
  String get introWhyCross =>
      '흰색이 위를 보면 앞면을 두 번 돌리는 것만으로 엣지가 흰색 센터 위에, 흰색은 아래로, 옆면 색도 맞은 채로 내려가요.';

  @override
  String get introHowCorners =>
      '윗층을 돌려 흰색 코너를 오른쪽 앞 빈자리 바로 위로 가져와요.\nR U R\' U\'를 반복해요: 흰색이 오른쪽이면 1번, 위면 3번, 나를 보면 5번.\n나머지 코너 세 개도 똑같이 해요.';

  @override
  String get introHoldCorners => '흰색 아래, 노란색 위. 코너는 오른쪽 앞, 제자리 바로 위에 있어요.';

  @override
  String get introWhyCorners =>
      'R U R\' U\'는 자리를 들었다가 다시 놓아요. 돌릴 때마다 코너가 조금씩 꼬이다가 흰색이 아래를 보면 끝이고, 십자는 깨지지 않아요.';

  @override
  String get introHowMiddle =>
      '노란색이 없는 윗층 엣지를 찾아 앞면 색을 아래 센터에 맞춰요.\n윗면 색이 갈 방향을 알려 줘요: 오른쪽 또는 왼쪽.\n8수 공식으로 넣으면 흰색 층은 매번 그대로 돌아와요.';

  @override
  String get introHoldMiddle => '흰색 아래, 노란색 위. 엣지는 앞면에 있고, 앞면 색이 아래 센터와 같아요.';

  @override
  String get introWhyMiddle =>
      '공식이 자리를 비켜 엣지를 넣고 흰색 층을 되돌려요. 노란색이 있는 엣지는 윗층 조각이라 가운데에 들어가지 않아요.';

  @override
  String get introHowYellowCross =>
      '윗면의 노란 엣지만 봐요: 점, ㄱ자, 선.\nㄱ자는 왼쪽 뒤, 선은 가로로 두고 F R U R\' U\' F\'를 해요.\n선은 1번, ㄱ자는 2번, 점은 최대 3번이에요.';

  @override
  String get introHoldYellowCross =>
      '흰색 아래, 노란색 위. ㄱ자는 왼쪽 뒤, 선은 가로로, 점은 아무 방향이나요.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\'는 아래 두 층을 건드리지 않고 위 엣지를 두 개씩 뒤집어요.';

  @override
  String get introHowYellowEdges =>
      '윗층을 돌려 엣지 두 개를 옆면 센터에 맞춰요.\n그 둘을 뒤와 오른쪽에 두고 R U R\' U R U2 R\' U를 해요.\n맞은 엣지가 서로 마주 보면 먼저 아무 방향에서나 한 번 해요.';

  @override
  String get introHoldYellowEdges => '노란색 위. 맞은 엣지 하나는 뒤에, 다른 하나는 오른쪽에.';

  @override
  String get introWhyYellowEdges => '이 공식은 윗층 조각만 움직여서 아래 두 층은 늘 돌아와요.';

  @override
  String get introHowYellowCorners =>
      '코너 색이 둘레의 세 센터와 맞으면, 꼬여 있어도 제자리예요.\n제자리 코너를 오른쪽 앞에 둬요.\nU R U\' L\' U R\' U\' L이 나머지 셋을 돌려요. 모두 맞을 때까지 반복해요.';

  @override
  String get introHoldYellowCorners =>
      '노란색 위. 이미 제자리인 코너를 오른쪽 앞에. 없으면 아무 코너나요.';

  @override
  String get introWhyYellowCorners =>
      '코너 세 개를 돌리고 오른쪽 앞 코너는 그대로 둬서, 반복할수록 제자리 코너가 늘어나요.';

  @override
  String get introHowTwistCorners =>
      '아직 안 맞은 코너를 오른쪽 앞에 잡아요.\n노란색이 위를 볼 때까지 R\' D\' R D를 두 번씩 반복해요.\n다음 코너는 윗층만 돌려 가져와요. 아래는 마지막 코너에서 돌아와요.';

  @override
  String get introHoldTwistCorners =>
      '노란색 위, 돌릴 코너는 오른쪽 앞. 코너 사이에는 윗층만 돌리고, 큐브 전체는 절대 돌리지 마세요.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D는 코너를 꼬고 아래를 흩뜨리지만, 모든 코너를 다 돌리면 아래가 돌아와요. 중간에 멈추면 흩어진 채로 남아요.';

  @override
  String get introHowCfopIntro =>
      '십자: 인스펙션 동안 엣지 네 개를 계획해요.\nF2L: 각 코너가 엣지와 함께 들어가요.\nOLL로 윗면을 노랗게 하고 PLL로 조각을 제자리로 보내요.';

  @override
  String get introHoldCfopIntro => '스피드큐버는 십자를 아래에 만들어서, 돌리는 동안 다음 조각을 미리 봐요.';

  @override
  String get introWhyCfopIntro =>
      '코너와 엣지를 함께 맞추면 수가 크게 줄고, 경우를 알아보면 시행착오가 필요 없어요.';

  @override
  String get introHowF2l =>
      '윗층에서 코너와 짝이 되는 엣지를 찾아요.\n슬롯 위에서 둘을 짝지어요.\n서너 수로 짝을 넣어요.';

  @override
  String get introHoldF2l => '십자는 아래. 페어가 들어갈 자리는 오른쪽 앞, 대칭이면 왼쪽 앞이에요.';

  @override
  String get introWhyF2l => '짝지은 코너와 엣지가 함께 들어가서, 한 조각씩이 아니라 두 층이 동시에 완성돼요.';

  @override
  String get introHowOll =>
      '먼저 F R U R\' U\' F\'로 노란 십자.\n그다음 Sune 같은 공식으로 코너 방향을 맞춰요.\n보이는 노란 모양으로 케이스를 알아봐요.';

  @override
  String get introHoldOll => '노란색 위. Sune에서는 노란색이 위인 유일한 코너를 왼쪽 앞에 둬요.';

  @override
  String get introWhyOll => '마지막 층을 방향 맞추기와 위치 맞추기로 나누면 외울 공식이 적어요.';

  @override
  String get introHowPll =>
      '윗면은 이미 전부 노란색이에요.\nT-perm은 코너를 바꾸고 U-perm은 엣지 세 개를 돌려요.\n옆면 색을 보고 공식을 골라요.';

  @override
  String get introHoldPll => '노란색 위. T-perm: 헤드라이트는 왼쪽. U-perm: 완성된 면은 뒤쪽.';

  @override
  String get introWhyPll => '윗면이 다 노란색이면 조각의 위치만 남아서, 몇 번 바꾸면 큐브가 완성돼요.';

  @override
  String get introHowTwoFirst =>
      '흰색이 아래인 흰색 코너 하나를 기준으로 정해요.\n다음 코너를 오른쪽 앞 제자리 위로 가져와요.\n옆면 색이 맞게 들어갈 때까지 R U R\' U\'를 반복해요.';

  @override
  String get introHoldTwoFirst => '흰색 아래. 빈자리는 오른쪽 앞, 그 코너는 윗층 바로 위에.';

  @override
  String get introWhyTwoFirst =>
      '2×2에는 센터가 없어요. 처음 놓은 코너가 이웃의 색을 정하니까, 흰색뿐 아니라 옆면 색도 중요해요.';

  @override
  String get introHowTwoOll =>
      '노란색이 위를 보는 코너를 세요.\n하나면 왼쪽 앞에 두고 Sune을 해요: R U R\' U R U2 R\'.\n다시 세고 반복해요. Sune은 최대 3번이에요.';

  @override
  String get introHoldTwoOll => '흰색 아래, 노란색 위. Sune 전마다 노란색이 위인 코너를 왼쪽 앞에.';

  @override
  String get introWhyTwoOll =>
      'Sune은 흰색 층을 깨지 않고 위 코너를 꼬아요. 다시 세면 다음에 어떻게 잡을지 알 수 있어요.';

  @override
  String get introHowTwoPbl =>
      '헤드라이트를 찾아요: 한 옆면 위쪽에 같은 색 스티커 두 개.\n한쪽에 있으면 왼쪽에 두고 T-perm을 해요.\n없으면 아무 방향에서나 Y-perm을 하고 윗층을 맞춰요.';

  @override
  String get introHoldTwoPbl =>
      '흰색 아래, 노란색 위. T-perm: 헤드라이트는 왼쪽. Y-perm: 아무 면이나 앞으로.';

  @override
  String get introWhyTwoPbl =>
      '윗면이 노란색이면 코너 위치만 남아요: T-perm은 이웃 둘, Y-perm은 대각선 둘을 바꿔요.';

  @override
  String get introHowBigIntro =>
      '고정된 센터가 없어요. 센터 조각 네 개가 면의 색을 만들어요.\nRw 같은 와이드 회전은 두 층을 한 번에 돌려요.\n2R 같은 안쪽 회전은 안쪽 한 층만 돌려요.';

  @override
  String get introHoldBigIntro =>
      '처음엔 아무렇게나: 4×4에는 고정 센터가 없어서 각 색의 자리를 직접 정해요.';

  @override
  String get introWhyBigIntro => '리덕션은 센터와 엣지 조각을 묶어서 큰 큐브를 3×3처럼 맞추게 해 줘요.';

  @override
  String get introHowBigCenters =>
      '먼저 코너로 색 순서를 확인해요.\n마주 보는 센터 두 개를 만들고, 나머지 네 개를 만들어요.\n안쪽 층이 센터 조각을 옮겨요. 연 층은 꼭 되돌려요.';

  @override
  String get introHoldBigCenters => '만드는 면은 앞에, 완성된 센터는 방해되지 않게 왼쪽과 오른쪽에.';

  @override
  String get introWhyBigCenters =>
      '층을 돌리면 센터가 움직이고, 되돌리면 완성된 센터가 돌아와서 노린 조각만 바뀌어요.';

  @override
  String get introHowBigEdges =>
      '같은 두 색을 가진 윙 두 개를 찾아요.\n앞면에 나란히 놓고 Uw\'로 붙여요.\n짝 없는 엣지를 넣고 Uw로 센터를 되돌려요.';

  @override
  String get introHoldBigEdges => '짝짓는 엣지는 앞쪽 층에, 완성된 엣지는 위아래 층에 세워 둬요.';

  @override
  String get introWhyBigEdges =>
      'Uw\'가 센터를 비켜 두 윙을 만나게 하고, Uw가 센터를 되돌려서 해 둔 작업이 그대로예요.';

  @override
  String get introHowBigParity =>
      '막힐 때까지 4×4를 3×3처럼 맞춰요.\n엣지 하나가 뒤집힘: 긴 OLL 패리티 공식.\n엣지 둘이 바뀜: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      '마지막 층이 위. OLL 패리티: 뒤집힌 엣지를 앞에. PLL 패리티: 바뀐 엣지를 앞과 뒤에.';

  @override
  String get introWhyBigParity =>
      '윙은 3×3에는 없는 상태가 될 수 있어요. 이 공식들은 안쪽 층을 돌려 바로 그것만 되돌려요.';

  @override
  String get dirFaceR => '오른쪽 면';

  @override
  String get dirFaceL => '왼쪽 면';

  @override
  String get dirFaceU => '윗줄';

  @override
  String get dirFaceD => '아랫줄';

  @override
  String get dirFaceF => '앞면';

  @override
  String get dirFaceB => '뒷면';

  @override
  String get dirMiddle => '가운데 층';

  @override
  String get dirWholeCube => '큐브 전체';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, $depth번째 층';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth층 깊이';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, $near–$far번째 층';
  }

  @override
  String get dirUp => '위로';

  @override
  String get dirDown => '아래로';

  @override
  String get dirLeft => '왼쪽으로';

  @override
  String get dirRight => '오른쪽으로';

  @override
  String get dirClockwise => '시계 방향';

  @override
  String get dirCounter => '반시계 방향';

  @override
  String get dirBackClockwise => '시계 방향(뒤에서 볼 때)';

  @override
  String get dirBackCounter => '반시계 방향(뒤에서 볼 때)';

  @override
  String get dirHalf => '두 번 돌리기(180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => '자세히 숨기기';

  @override
  String get solveExpand => '자세히 보기';

  @override
  String get dailyScrambleSteps => '한 단계씩 섞기';

  @override
  String get dailyScrambleGuide => '3D 섞기 가이드';

  @override
  String get dailyShowMoves => '동작을 텍스트로 보기';

  @override
  String get dailyHideMoves => '텍스트 동작 숨기기';

  @override
  String get dailyScrambleGuideTitle => '섞기 가이드';

  @override
  String get phaseDailyScramble => '오늘의 큐브 섞기';

  @override
  String get explainDailyScramble =>
      '흰색이 위, 초록색이 앞을 보는 맞춰진 큐브로 시작해 각 회전을 실제 큐브에서 따라 하세요.';

  @override
  String get stageCenters => '센터 블록 만들기';

  @override
  String get stageEdges => '바깥쪽·안쪽 엣지 짝짓기';

  @override
  String get stageParity => '패리티 해결';

  @override
  String get stageCrown1 => '1층 (흰색)';

  @override
  String get stageCrown2 => '2층';

  @override
  String get stageCrown3 => '3층 (노란색)';

  @override
  String get stageOrient => '조각 방향 맞추기';

  @override
  String get stageFinish => '큐브 마무리';

  @override
  String get stageAsThree => '3×3처럼 맞추기';

  @override
  String get stageTwoByTwo => '2×2 맞추기';

  @override
  String stageHeader(int number, int total, String title) {
    return '$total단계 중 $number단계: $title';
  }

  @override
  String get solveAllStagesDone => '모든 단계를 마쳤어요. 잘했어요!';

  @override
  String get trackFiveByFive => '5×5 프로페서 큐브';

  @override
  String get trackSixBySix => '6×6 큐브';

  @override
  String get lessonFiveIntro => '5×5 알아보기';

  @override
  String get lessonFiveIntroDesc => '고정 센터, 센터 바, 가운데 엣지와 윙.';

  @override
  String get introGoalFiveIntro => '5×5 알아보기: 고정 센터, 센터 바, 가운데 엣지와 윙.';

  @override
  String get introHowFiveIntro =>
      '각 면의 정가운데 조각은 절대 움직이지 않아요.\n엣지는 가운데 조각과 윙 두 개로 이뤄져요.\n안쪽 층은 바깥을 건드리지 않고 조각을 움직여요.';

  @override
  String get introHoldFiveIntro =>
      '아무렇게나 잡아도 돼요: 5×5는 각 면의 한가운데가 움직이지 않아서 그 면의 색을 보여 줘요.';

  @override
  String get introWhyFiveIntro => '고정된 센터가 배색을 정해서, 센터를 잘못된 순서로 만들 수가 없어요.';

  @override
  String get lessonFiveCenters => '5×5 센터';

  @override
  String get lessonFiveCentersDesc => '세 칸짜리 바로 센터를 만들어요.';

  @override
  String get introGoalFiveCenters => '각 면에 한 가지 색의 3×3 센터 블록을 만들어요.';

  @override
  String get introHowFiveCenters =>
      '움직이지 않는 가운데 조각부터 시작해요: 색을 정해 줘요.\n세 개짜리 막대를 만들어 안쪽 층으로 밀어 넣어요.\n막대를 넣는 수가 완성된 센터도 되돌려 줘요.';

  @override
  String get introHoldFiveCenters => '만드는 센터는 앞이나 위에, 완성된 센터는 아래, 왼쪽, 오른쪽에.';

  @override
  String get introWhyFiveCenters =>
      '층 넣기, 위 돌리기, 층 되돌리기: 막대를 넣는 층이 완성된 센터도 되돌려요.';

  @override
  String get lessonFiveEdges => '5×5 엣지';

  @override
  String get lessonFiveEdgesDesc => '윙 두 개를 가운데 엣지와 합쳐요.';

  @override
  String get introGoalFiveEdges => '가운데 엣지와 윙 두 개를 합쳐 12개 엣지가 한 조각처럼 보이게 해요.';

  @override
  String get introHowFiveEdges =>
      '앞면에서 각 윙을 가운데 엣지에 맞춰요.\n안쪽 층을 돌리고, 안 맞은 엣지를 넣고, 되돌려요.\n마지막 엣지는: 층, 뒤집기, 층.';

  @override
  String get introHoldFiveEdges => '만드는 엣지는 앞에, 완성된 엣지는 위아래 층에 보관해요.';

  @override
  String get introWhyFiveEdges => '안쪽 층을 열고 닫으면 윙이 붙고, 센터와 보관한 엣지는 돌아와요.';

  @override
  String get lessonFiveSolve => '5×5를 3×3처럼 맞추기';

  @override
  String get lessonFiveSolveDesc => '3×3처럼 한 층씩 마무리해요.';

  @override
  String get introGoalFiveSolve => '리덕션한 5×5를 3×3처럼, 바깥 회전만으로 한 층씩 맞춰요.';

  @override
  String get introHowFiveSolve =>
      '이제부터 바깥 회전만 써요. 아니면 짝지은 엣지가 갈라져요.\n흰색 십자와 코너, 가운데 층, 그다음 노란 층.\n움직이지 않는 가운데 조각이 각 면의 색을 보여 줘요.';

  @override
  String get introHoldFiveSolve => '1층 색이 아래, 3×3과 똑같아요. 넣을 코너는 오른쪽 앞에.';

  @override
  String get introWhyFiveSolve =>
      '안쪽을 돌리면 센터와 엣지가 다시 갈라져요. 바깥 회전은 각 블록을 3×3의 한 조각처럼 움직여요.';

  @override
  String get lessonFiveParity => '5×5 엣지 패리티';

  @override
  String get lessonFiveParityDesc => '윙이 바뀐 엣지를 고쳐요.';

  @override
  String get introGoalFiveParity =>
      '바깥 윙 두 개가 바뀐 엣지 하나를 고쳐요: 5×5에 있는 유일한 패리티예요.';

  @override
  String get introHowFiveParity =>
      '뒤집혀 보이는 마지막 엣지 하나로 나타나요.\n안쪽 층을 쓰는 긴 공식을 한 번 해요.\n5×5에는 PLL 패리티가 없어요.';

  @override
  String get introHoldFiveParity => '마지막 층이 위, 윙이 바뀐 엣지는 윗층 앞에.';

  @override
  String get introWhyFiveParity =>
      '5×5에서는 한 엣지의 바깥 윙 두 개만 바뀔 수 있어서 공식 하나면 충분해요.';

  @override
  String get lessonSixIntro => '6×6 알아보기';

  @override
  String get lessonSixIntroDesc => '고정 센터가 없고 엣지마다 조각이 넷.';

  @override
  String get introGoalSixIntro => '6×6 알아보기: 면마다 센터 조각 16개, 엣지마다 조각 4개.';

  @override
  String get introHowSixIntro =>
      '고정 센터가 없어요. 만들면서 색을 정해요.\n엣지마다 바깥쪽 윙과 안쪽 윙이 있어요.\n와이드 회전은 세 층까지 움직일 수 있어요.';

  @override
  String get introHoldSixIntro => '처음엔 아무렇게나: 4×4처럼 6×6에도 고정 센터가 없어요.';

  @override
  String get introWhySixIntro => '4×4와 5×5를 맞출 수 있다면, 6×6은 블록만 더 큰 같은 리덕션이에요.';

  @override
  String get lessonSixCenters => '6×6 센터';

  @override
  String get lessonSixCentersDesc => '네 칸짜리 바로 4×4 센터를 만들어요.';

  @override
  String get introGoalSixCenters => '각 면에 한 가지 색의 4×4 센터 블록을 만들어요.';

  @override
  String get introHowSixCenters =>
      '먼저 코너로 색 순서를 확인해요: 고정된 센터가 없어요.\n네 개짜리 막대를 만들어 합쳐요.\n마지막 두 센터는 한 조각씩 옮겨요: 층, 위, 되돌리기.';

  @override
  String get introHoldSixCenters => '만드는 면은 앞에, 완성된 센터는 왼쪽, 오른쪽, 아래에.';

  @override
  String get introWhySixCenters =>
      '막대는 안쪽 층으로 붙고 층은 매번 되돌리니까, 완성된 센터가 깨지지 않아요.';

  @override
  String get lessonSixEdges => '6×6 엣지';

  @override
  String get lessonSixEdgesDesc => '엣지마다 조각 네 개를 모아요.';

  @override
  String get introGoalSixEdges => '엣지마다 조각 네 개를 모아 6×6에 깔끔한 엣지 12개를 만들어요.';

  @override
  String get introHowSixEdges =>
      '한 엣지의 바깥 윙과 안쪽 윙을 앞면에 나란히 놓아요.\n깊은 와이드 층이 엣지를 넣고 빼요.\n조각을 빼려고 완성된 엣지를 절대 깨지 마세요.';

  @override
  String get introHoldSixEdges => '만드는 엣지는 앞에, 완성된 엣지는 위아래에 세워 둬요.';

  @override
  String get introWhySixEdges => '깊은 와이드 회전이 센터를 비켜 윙을 만나게 한 뒤 되돌려요.';

  @override
  String get lessonSixSolve => '6×6를 3×3처럼 맞추기';

  @override
  String get lessonSixSolveDesc => '3×3처럼 한 층씩 마무리해요.';

  @override
  String get introGoalSixSolve => '리덕션한 6×6을 3×3처럼, 바깥 회전만으로 한 층씩 맞춰요.';

  @override
  String get introHowSixSolve =>
      '이제부터 바깥 회전만 써요: 안쪽 층을 돌리면 센터나 엣지가 깨져요.\n만든 센터가 각 면의 색을 보여 줘요.\n흰색 십자와 코너, 가운데 층, 그다음 노란 층.';

  @override
  String get introHoldSixSolve => '1층 색이 아래, 3×3과 똑같아요. 넣을 코너는 오른쪽 앞에.';

  @override
  String get introWhySixSolve => '바깥 회전은 4×4 센터와 엣지를 한 조각처럼 움직여요. 3×3과 똑같아요.';

  @override
  String get lessonSixParity => '6×6 패리티';

  @override
  String get lessonSixParityDesc => '뒤집힌 엣지 하나 또는 바뀐 엣지 둘.';

  @override
  String get introGoalSixParity =>
      '3×3에는 없는 6×6의 두 경우를 고쳐요: 뒤집힌 엣지 하나, 또는 바뀐 엣지 두 개.';

  @override
  String get introHowSixParity =>
      '막힐 때까지 3×3처럼 맞춰요.\n엣지 하나가 뒤집힘: 3Rw를 쓰는 긴 공식.\n엣지 둘이 바뀜: 안쪽 두 번 회전을 쓰는 짧은 공식.';

  @override
  String get introHoldSixParity => '마지막 층이 위. 뒤집힌 엣지는 앞에, 바뀐 엣지 둘은 앞과 뒤에.';

  @override
  String get introWhySixParity =>
      '4×4처럼 6×6도 뒤집힌 엣지 하나나 바뀐 엣지 둘로 끝날 수 있어요. 안쪽 층 공식이 그것만 고치고 나머지는 그대로 둬요.';

  @override
  String get stepFivePieces => '5×5의 조각';

  @override
  String get stepFivePiecesBody =>
      '각 면의 한가운데 조각은 움직이지 않아서 배색이 틀릴 수 없어요. 그 둘레에 센터 조각 여덟 개가 있고, 코너 센터와 엣지 센터는 서로 바뀌지 않아요. 엣지는 가운데 조각과 윙 두 개예요.';

  @override
  String get stepFiveSlices => '세 가지 회전';

  @override
  String get stepFiveSlicesBody =>
      '바깥쪽 회전은 한 면을 돌려요. 와이드 회전은 면과 그 뒤의 층을 함께 돌려요. 안쪽 층 회전은 안쪽 층만 돌려서, 바깥을 건드리지 않고 조각의 자리를 바꿔요.';

  @override
  String get stepFiveCenterBar => '센터 바';

  @override
  String get stepFiveCenterBarBody =>
      '같은 색 센터 조각 세 개로 줄을 만들어 안쪽 층으로 넣고, 위를 돌린 뒤 층을 되돌려요: 막대를 넣는 수가 완성된 센터도 되돌려요. 막대 세 개가 센터 하나예요.';

  @override
  String get stepFiveCenterSwap => '깨지 않고 바꾸기';

  @override
  String get stepFiveCenterSwapBody =>
      '센터 조각 하나만 옮기려면: 안쪽 층을 돌리고, 윗면을 돌리고, 층을 되돌리고, 윗면도 되돌려요. 완성된 센터는 매번 돌아와요.';

  @override
  String get stepFiveEdgePair => '윙을 가운데 엣지에 붙이기';

  @override
  String get stepFiveEdgePairBody =>
      '앞면에서 윙을 가운데 엣지 옆에 나란히 놓고, 안쪽 층을 내리고, 짧은 트리거로 안 맞은 엣지를 넣은 뒤 안쪽 층을 되돌려요.';

  @override
  String get stepFiveEdgeLast => '마지막 엣지';

  @override
  String get stepFiveEdgeLastBody =>
      '바꿔 넣을 빈 엣지가 없으면 층, 뒤집기, 층: 와이드 회전, 짧은 트리거, 와이드 회전 되돌리기로 완성된 엣지를 깨지 않고 마지막 엣지를 짝지어요.';

  @override
  String get stepFiveAsThree => '이제 3×3이에요';

  @override
  String get stepFiveAsThreeBody =>
      '센터와 엣지가 끝나면 5×5는 큰 3×3처럼 움직여요. 바깥 회전만으로 한 층씩: 흰색 십자와 코너, 가운데 층, 그다음 노란 층. 5×5에는 PLL 패리티가 없어요.';

  @override
  String get stepFiveEdgeParity => '마지막 엣지의 윙 바꾸기';

  @override
  String get stepFiveEdgeParityBody =>
      '가끔 마지막 엣지의 바깥 윙 두 개가 바뀌어 뒤집혀 보여요: 5×5의 유일한 패리티예요. 윗층 앞에 두고 안쪽 층 공식을 한 번 해요. 나머지는 모두 제자리로 돌아와요.';

  @override
  String get stepSixPieces => '6×6의 조각';

  @override
  String get stepSixPiecesBody =>
      '4×4처럼 6×6에도 고정 센터가 없어요: 센터 조각 16개가 각 면의 색을 이뤄요. 먼저 코너로 색 순서를 확인하세요. 엣지마다 윙이 네 개, 바깥 둘과 안쪽 둘이에요.';

  @override
  String get stepSixSlices => '더 깊은 층 돌리기';

  @override
  String get stepSixSlicesBody =>
      '와이드 회전은 한 면에서 두세 층을 움직여요. 두 번째나 세 번째 안쪽 층이 센터와 엣지를 위한 도구예요.';

  @override
  String get stepSixCenterBar => '네 칸짜리 바';

  @override
  String get stepSixCenterBarBody =>
      '같은 색 센터 조각 네 개로 줄을 만들고 안쪽 층 회전으로 나란히 붙여요. 층은 매번 되돌리고, 면이 한 색의 4×4 블록이 될 때까지 계속해요.';

  @override
  String get stepSixCenterSwap => '하나씩 옮기기';

  @override
  String get stepSixCenterSwapBody =>
      '3번째 층, 위, 되돌리기, 위 되돌리기: 센터 조각 하나가 옮겨지고 완성된 센터는 돌아와요. 막대가 안 들어가는 마지막 두 센터에서 써요.';

  @override
  String get stepSixEdgePair => '조각 넷, 엣지 하나';

  @override
  String get stepSixEdgePairBody =>
      '깊은 와이드 층으로 한 엣지의 윙 네 개를 앞면에 모으고, 짧은 트리거로 안 맞은 엣지를 넣은 뒤 와이드 층을 되돌려요.';

  @override
  String get stepSixEdgeLast => '마지막 엣지';

  @override
  String get stepSixEdgeLastBody =>
      '깊은 와이드 회전과 그 되돌리기 사이에 짧은 트리거를 넣어 마지막 엣지를 짝지어요. 완성된 엣지는 그대로예요. 조각을 빼려고 완성된 엣지를 절대 깨지 마세요.';

  @override
  String get stepSixAsThree => '이제 3×3이에요';

  @override
  String get stepSixAsThreeBody =>
      '4×4 센터와 짝지은 엣지가 있으면 6×6을 3×3처럼, 바깥 회전만으로 한 층씩 맞춰요. 끝에 엣지 하나가 뒤집히거나 둘이 바뀌어 있으면 실수가 아니라 패리티예요.';

  @override
  String get stepSixOllParity => '뒤집힌 엣지 하나';

  @override
  String get stepSixOllParityBody =>
      '마지막 층에서 엣지 하나만 뒤집혀 보이면 패리티예요. 윗층 앞에 두고 긴 공식을 해요: 윙 네 개를 모두 뒤집고 위의 왼쪽·오른쪽 엣지도 바꾸지만, 아래 두 층은 건드리지 않아요.';

  @override
  String get stepSixPllParity => '바뀐 엣지 두 개';

  @override
  String get stepSixPllParityBody =>
      '맨 마지막에 엣지 두 개가 바뀐 것 같으면 윗층 앞과 뒤에 두고 안쪽 두 번 회전으로 된 짧은 공식을 해요: 두 엣지의 윙 네 개가 모두 자리를 바꿔요.';

  @override
  String get stageTwoFirstLayer => '아래층 만들기';

  @override
  String get stageTwoTopColor => '윗면을 한 가지 색으로';

  @override
  String get stageTwoFinish => '코너 마무리';

  @override
  String get explainTwoFirstLayer => '아래층을 완성하세요. 네 코너가 서로, 그리고 옆면 색과 맞아야 해요.';

  @override
  String get explainTwoTopColor => '아래층을 유지한 채 윗면 스티커 네 개가 같은 색이 될 때까지 돌리세요.';

  @override
  String get explainTwoFinish => '마지막 코너를 제자리로 옮겨 큐브를 완성하세요.';

  @override
  String get tabSolve => '풀기';

  @override
  String get tabScan => '스캔';

  @override
  String get tabAcademy => '아카데미';

  @override
  String get tabTrain => '훈련';

  @override
  String get openCubeSolver => '3D 큐브 및 솔버 열기';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => '훈련';

  @override
  String get trainSubtitle => '매일 실력을 갈고닦으세요.';

  @override
  String get settings => '설정';

  @override
  String get settingsSoundHaptics => '소리 및 진동';

  @override
  String get settingsSoundHapticsDesc => '큐브를 돌릴 때 클릭음과 진동이 나요.';

  @override
  String get settingsAnimationSpeed => '기본 애니메이션 속도';

  @override
  String get settingsAnimationSpeedDesc => '동작을 재생할 때 큐브가 도는 속도예요.';

  @override
  String get settingsResetProgress => '진행 상황 초기화';

  @override
  String get settingsResetProgressDesc => '완료한 아카데미 레슨과 연속 기록을 지워요.';

  @override
  String get resetProgressTitle => '모든 진행 상황을 초기화할까요?';

  @override
  String get resetProgressBody => '완료한 레슨과 연속 기록이 삭제돼요. 되돌릴 수 없어요.';

  @override
  String get resetProgressDone => '진행 상황을 초기화했어요.';

  @override
  String get cancel => '취소';

  @override
  String get settingsPrivacyAds => '개인정보 및 광고';

  @override
  String get settingsPrivacyAdsDesc => '광고 동의 설정을 확인하거나 변경해요.';

  @override
  String get playbackPrevious => '이전';

  @override
  String get playbackNext => '다음';

  @override
  String fastSolveMoves(int count) {
    return '$count수 만에 완성!';
  }

  @override
  String get feedbackTitle => '다음 버전을 함께 만들어요';

  @override
  String get feedbackBody =>
      '기능을 제안하거나 CubeMentor의 다음 버전에 의견을 주고 싶으신가요? 이메일을 보내 주세요:';

  @override
  String get feedbackEmailCopied => '이메일 앱을 찾을 수 없어 주소를 클립보드에 복사했어요.';

  @override
  String get adWatchToUnlock => '광고 보기';

  @override
  String get adLoading => '짧은 동영상을 불러오는 중…';

  @override
  String get adRewardNotEarned => '끝까지 시청하면 잠금이 해제돼요.';

  @override
  String get adUnavailableFreePass => '지금은 볼 수 있는 동영상이 없어요. 이번에는 무료로 열어 드렸어요.';

  @override
  String get settingsPrivacyAdsError => '개인정보 옵션을 열 수 없어요. 잠시 후 다시 시도해 주세요.';

  @override
  String get nicknamePromptTitle => '어떻게 불러 드릴까요?';

  @override
  String get nicknamePromptBody => '큐브를 맞출 때마다 이름을 불러 응원할게요.';

  @override
  String get nicknameHint => '이름 또는 닉네임';

  @override
  String get nicknameSave => '저장';

  @override
  String get settingsNickname => '이름';

  @override
  String get settingsNicknameNotSet => '설정 안 됨 — 탭해서 추가';

  @override
  String celebrateNamed(String name) {
    return '$name님, 잘했어요!';
  }

  @override
  String get celebrateAnon => '잘했어요!';

  @override
  String get celebrateCubeSolved => '큐브 완성!';

  @override
  String get celebrateDailyDone => '오늘의 챌린지 완료!';

  @override
  String fastSolveRatio(int count, int limit) {
    return '$count / $limit수';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    return '어떤 스크램블도 $limit수 이내로 맞출 수 있어요';
  }

  @override
  String get patternsWatchVideo => '동영상 보기';

  @override
  String get patternsNotNow => '나중에';

  @override
  String get settingsColorScheme => '큐브 색 배열';

  @override
  String get colorSchemeWestern => '서양식';

  @override
  String get colorSchemeJapanese => '일본식';

  @override
  String get colorSchemeWesternDesc => '흰색 맞은편 노란색, 파란색 맞은편 초록색';

  @override
  String get colorSchemeJapaneseDesc => '흰색 맞은편 파란색, 노란색 맞은편 초록색';

  @override
  String dailyYourTime(String time) {
    return '내 기록: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return '큐브를 살펴볼 시간은 $seconds초입니다. 탭하면 카운트다운이 시작돼요.';
  }

  @override
  String get timerInspectTapReady => '준비되면 탭해서 풀기 시작';

  @override
  String timerInspectPlus2(int seconds) {
    return '인스펙션이 $seconds초를 넘어 시계가 자동으로 시작됐어요: +2초 페널티';
  }

  @override
  String timerAvgOf(int count) {
    return '$count회 평균';
  }

  @override
  String get timerAvgNote => '평균은 최고·최저 기록을 빼고 계산해요';

  @override
  String get timerPbSub => '최고 단일 기록';

  @override
  String get timerPlus2Caption => '+2초 페널티';

  @override
  String get timerDnfCaption => '완료 못 함(DNF)';

  @override
  String get timerDeleteCaption => '이 기록 삭제';

  @override
  String get patternBullsEye => '과녁';

  @override
  String get patternFramedCenter => '테두리 센터';

  @override
  String get patternBlockCheckerboard => '블록 체커보드';

  @override
  String get patternCubeInCubeInCube => '큐브 속 큐브 속 큐브';

  @override
  String get patternUnionJack => '유니언 잭';

  @override
  String get patternKilt => '킬트';

  @override
  String get patternSixTs => '여섯 개의 T';

  @override
  String get patternTwinPeaks => '쌍둥이 봉우리';

  @override
  String get patternSpiral => '나선';

  @override
  String get patternTetris => '테트리스';

  @override
  String get patternSpots => '센터 점';

  @override
  String get patternStripes => '줄무늬';

  @override
  String get patternAnaconda => '아나콘다';

  @override
  String get patternZigzag => '지그재그';

  @override
  String get patternFourSpots => '네 개의 점';

  @override
  String get patternGreenMamba => '그린 맘바';

  @override
  String get patternPlusMinus => '플러스 마이너스';

  @override
  String guideStepCounter(int current, int total) {
    return '단계 $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return '동작 $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return '동작 $current / $total';
  }

  @override
  String get dailyStep1Title => '1단계: 큐브 섞기';

  @override
  String get dailyStep2Title => '2단계: 큐브 풀기';

  @override
  String dailyPersonalBest(String time) {
    return '개인 최고 기록: $time';
  }

  @override
  String get dailyRecentDays => '최근 기록';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 연속! 대단해요!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => '큐브를 다 섞었어요! 이제 풀어 보세요';

  @override
  String get dailyCongratsTitle => '축하해요!';

  @override
  String dailyCongratsBody(String time) {
    return '오늘의 도전을 $time에 풀었어요.';
  }

  @override
  String get dailyCongratsDone => '도전으로 돌아가기';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • 패턴 $count개';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '$hours시간 남음';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '$minutes분 남음';
  }

  @override
  String get lockedLabel => '잠김';

  @override
  String get unlockedLabel => '열림';

  @override
  String patternUnlockBody(int hours) {
    return '짧은 동영상 1개를 보면 이 패턴과 단계별 가이드가 $hours시간 동안 열려요.';
  }

  @override
  String lessonUnlockBody(int hours) {
    return '짧은 동영상 1개를 보면 앞으로 $hours시간 동안 이 강의를 마음껏 열 수 있어요.';
  }

  @override
  String get bigCubeUnlockTitle => '큰 큐브 풀기';

  @override
  String bigCubeUnlockBody(int hours) {
    return '4×4–6×6 무료 풀이를 이미 사용했어요. 짧은 동영상 1개를 보면 앞으로 $hours시간 동안 큰 큐브를 풀 수 있어요.';
  }

  @override
  String get doubleTurnBadge => '두 번 돌리기 · 180°';

  @override
  String get homeAcademy => '아카데미';

  @override
  String get homePatterns => '멋진 패턴';

  @override
  String get homePractice => '타이머 & 오늘의 도전';

  @override
  String get scanChoiceSubtitle => '어떻게 시작할까요?';

  @override
  String get scanChoiceCamera => '카메라로 스캔';

  @override
  String get scanChoiceCameraDesc => '각 면을 카메라에 보여 주면 해법을 알려 드려요.';

  @override
  String get scanChoice3d => '3D 큐브 열기';

  @override
  String get scanChoice3dDesc => '가상 큐브를 돌리고 섞은 뒤 단계별로 풀어 보세요.';

  @override
  String get academyAllSizes => '모든 크기';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total 강의 완료';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total 완료';
  }

  @override
  String get lessonStageConcept => '개념';

  @override
  String get lessonStageExamples => '예시';

  @override
  String get lessonStagePractice => '실전';

  @override
  String get lessonStageNext => '다음 / 자유';

  @override
  String lessonStageOf(int index, int total, String name) {
    return '$total단계 중 $index단계: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return '예시 $index/$total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return '실전 $index/$total';
  }

  @override
  String get lessonBonusCase => '보너스 상황';

  @override
  String get lessonPracticeIntro =>
      '진짜 스크램블이에요. 앞 단계만 맞춰져 있어요. 안내를 하나씩 따라 이 단계를 끝까지 완성하세요.';

  @override
  String lessonContinueDesc(String lesson) {
    return '바로 $lesson(으)로 이어서 배워요.';
  }

  @override
  String get lessonFreePractice => '자유 연습';

  @override
  String get lessonFreePracticeDesc => '섞인 3D 큐브를 처음부터 이 단계까지 직접 맞춰 보세요.';

  @override
  String freePracticeBanner(String topic) {
    return '자유롭게 연습하세요: 처음부터 $topic까지 큐브를 맞춰 보세요!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return '$face 센터가 있는 면을 화살표 방향으로 돌리세요. 센터는 그대로 있고, 주변 조각들만 움직여요.';
  }

  @override
  String cueTrigger(String front) {
    return '오른손 트리거, $front 색이 앞을 향하게: 오른쪽 면 위로, 윗면 왼쪽으로, 오른쪽 면 아래로, 윗면 다시 오른쪽으로.';
  }

  @override
  String get cueTriggerBack =>
      '여섯 번째 트리거를 연속으로 하면 큐브가 처음과 똑같이 돌아와요. 6은 마법의 숫자!';

  @override
  String cueSliceInner(String face) {
    return '$face 면 옆의 안쪽 층만 돌리세요. 면 자체는 움직이지 않아서 센터가 갈라져요.';
  }

  @override
  String cueSliceWide(String face) {
    return '와이드 회전: $face 면과 바로 옆 안쪽 층이 두꺼운 한 층처럼 함께 돌아가요.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return '$top 센터가 위, $front 센터가 앞을 향하도록 큐브 전체를 돌려 잡으세요.';
  }

  @override
  String get cueTurnTop => '다음 공식을 준비하도록 화살표대로 윗층만 돌리세요.';

  @override
  String get cueAlignTop => '마지막 동작: 윗층을 돌려 색을 맞추세요. 완성!';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece 엣지가 윗층에 있어요. $center 센터 바로 위에 올 때까지 윗층을 돌린 뒤, 그 면을 두 번 돌려 내리세요.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece 엣지가 가운데 층에 끼어 있어요. 위로 올려 $center 센터 위에 맞춘 뒤 내리세요.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece 엣지가 제자리지만 뒤집혀 있어요: 흰색이 옆을 봐요. 꺼내서 흰색이 위로 가게 윗층으로 올린 뒤, $center 센터 옆으로 내려요.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP 방식에서는 아랫면도 돌려도 돼요. $piece 엣지를 내려 넣고, 아랫면을 돌려 $center 센터에 맞추세요.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return '$piece 코너가 $a 면과 $b 면 사이의 제자리 바로 위에 오도록 윗층을 돌리세요. 올바른 방향으로 들어갈 때까지 오른손 트리거를 반복하세요.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece 코너가 제자리지만 꼬여 있어요. 트리거 한 번으로 빼고(그 자리에 노란 코너가 들어가요), 흰색이 아래로 다시 들어갈 때까지 같은 자리에서 반복해요. 쫓아가려고 큐브를 돌리지 마세요.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return '$piece 엣지가 $a 센터와 맞을 때까지 윗층을 돌린 뒤, 오른쪽 아래 $a와 $b 사이 자리로 보내세요.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return '$piece 엣지가 $a 센터와 맞을 때까지 윗층을 돌린 뒤, 왼쪽 아래 $a와 $b 사이 자리로 보내세요.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece 엣지가 제자리지만 뒤집혀 있어요. 그 자리에 노란 엣지를 넣어 위로 밀어낸 뒤, $a과 $b 사이에 다시 넣어요.';
  }

  @override
  String cueYellowLine(String front) {
    return '노란 일자: 선이 왼쪽에서 오른쪽으로 놓이게 윗층을 돌리고, $front 색을 앞에 둔 채 노란 십자 공식을 하세요.';
  }

  @override
  String cueYellowL(String front) {
    return '노란 L자: L이 왼쪽 뒤를 가리키게 윗층을 돌리고, $front 색을 앞에 둔 채 공식을 하세요. 일자로 바뀌어요.';
  }

  @override
  String cueYellowDot(String front) {
    return '노란 건 센터뿐: 점이에요. $front 색을 앞으로 두고 공식을 한 번 하면 ㄱ자가 돼요. 점은 세 번 걸릴 수도 있으니 계속하세요.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return '$piece 엣지가 $center 센터와 맞을 때까지 윗층을 돌리세요.';
  }

  @override
  String cueEdgesSwap(String front) {
    return '맞춰진 엣지 두 개가 뒤와 오른쪽에 있어요. $front 색을 앞에 두고 교환 공식을 하면 앞과 왼쪽 엣지가 자리를 바꿔요.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return '맞춰진 엣지가 서로 마주 보고 있어요. $front 색을 앞에 두고 교환을 한 번 하면 이웃한 두 개가 맞춰져요.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece 코너는 이미 제자리에 있어요. 오른쪽 앞에 둔 채 $front 색을 앞에 두고 나머지 세 코너를 돌려 바꾸세요.';
  }

  @override
  String cueCornersNone(String front) {
    return '아직 제자리에 있는 노란 코너가 없어요. $front 색을 앞에 두고 한 번 돌리면 코너 하나가 제자리에 들어가요.';
  }

  @override
  String cueTwistCorner(String piece) {
    return '오른쪽 앞 $piece 코너를 돌려요: 노란색이 위를 볼 때까지 아래 트리거를 두 번씩 반복해요. 아래층이 지금은 흐트러져 보여도 마지막 코너에서 돌아와요!';
  }

  @override
  String cueTwistFour(String piece) {
    return '이번에는 $piece 코너에 트리거가 네 번 필요해요. 계속하세요. 노란색은 항상 두 번이나 네 번 뒤에 올라와요.';
  }

  @override
  String get cueTwistNext =>
      '윗층만 돌려 다음으로 돌아간 코너를 오른쪽 앞으로 가져오세요. 지금은 큐브 전체를 돌리면 안 돼요!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return '위에서 $piece 코너와 $edge 엣지를 짝지은 뒤, 그 짝을 $a와 $b 사이 슬롯에 넣으세요.';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece 코너가 엉뚱한 엣지와 함께 슬롯에 끼어 있어요. 먼저 위로 꺼낸 뒤 짝을 맞춰 넣으세요.';
  }

  @override
  String cueOllSune(String front) {
    return '$front 색을 앞에 두고 Sune을 해서 노란 코너들을 위로 향하게 하세요.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return '이번에는 Sune 한 번으로 부족해요. 윗층을 돌리고 $front 색을 앞에 둔 채 Sune을 한 번 더 하세요.';
  }

  @override
  String cuePllCorners(String front) {
    return '코너 두 개를 바꿔야 해요. 같은 색 짝(헤드라이트)을 왼쪽에 두고, $front 색을 앞에 두고 T-perm을 하세요.';
  }

  @override
  String cuePllEdges(String piece) {
    return '코너는 완성이에요. $piece 엣지를 뒤에 두고 나머지 세 엣지를 U-perm으로 돌려 바꾸세요.';
  }

  @override
  String get cuePllNoEdge =>
      '아직 센터와 맞는 윗층 엣지가 없어요. 아무 쪽에서나 U-perm을 한 번 하면 하나가 맞춰져요.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return '윗층의 이웃한 코너 두 개를 바꿔야 해요. 같은 색 짝을 왼쪽에 두고, $front 색을 앞에 두고 교환 공식을 하세요.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return '바꿀 코너 두 개가 대각선에 있어요. $front 색을 앞에 두고 대각 교환을 하세요.';
  }

  @override
  String cueCenterCycle(String color) {
    return '길 잃은 $color 센터 조각을 센터 3-사이클로 제자리에 돌려놓으세요: 안쪽 층, 위, 안쪽 층, 그리고 모두 원래대로.';
  }

  @override
  String cueCenterBar(String color) {
    return '$color 센터 조각 한 줄 전체가 엉뚱한 면에 있어요. 안쪽 층으로 들어 올리고 윗층을 돌린 뒤 제자리로 돌려놓으세요.';
  }

  @override
  String cueEdgePair(String piece) {
    return '$piece 엣지의 두 조각을 짝지으세요: 나란히 놓고, 안쪽 층을 돌리고, 오른손 동작으로 짝 없는 엣지와 바꾼 뒤, 층을 되돌려요.';
  }

  @override
  String cueEdgeLast(String piece) {
    return '마지막 엣지: 마지막 두 엣지 공식으로 $piece 엣지를 짝지으세요. 완성된 엣지는 모두 그대로 유지돼요.';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL 패리티: 위 엣지 하나가 뒤집혀 있어요. 3×3에서는 절대 없는 일이에요. $front 색을 앞으로 두고 그 엣지를 앞에 놓은 뒤, 일반 OLL 전에 패리티 공식을 해요.';
  }

  @override
  String get cueParityPll =>
      'PLL 패리티: 위 엣지 두 개가 바뀌어 있어요. 3×3에서는 절대 없는 일이에요. 앞과 뒤에 두고 패리티 교환을 한 뒤 윗층을 맞춰요.';

  @override
  String cueParityFive(String front) {
    return '엣지 패리티: 한 엣지의 바깥 윙 두 개가 바뀌어 있어요. 5×5의 유일한 패리티예요. $front 색을 앞으로 두고 그 엣지를 앞에 놓은 뒤 공식을 한 번 해요.';
  }

  @override
  String get onboardingSkip => '건너뛰기';

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingStart => '시작하기';

  @override
  String get onboardingWhatTitle => '나만의 큐브 도우미';

  @override
  String get onboardingWhatBody =>
      'CubeMentor는 2×2부터 6×6까지 모든 큐브를 풀고, 배우고, 연습하도록 도와줘요. 완전히 오프라인으로요.';

  @override
  String get onboardingScanTitle => '몇 초 만에 스캔하고 풀기';

  @override
  String get onboardingScanBody =>
      '각 면을 카메라에 보여 주거나 색을 직접 입력하고, 3D 풀이를 한 수씩 따라 하세요.';

  @override
  String get onboardingLearnTitle => '배우고 놀기';

  @override
  String get onboardingLearnBody =>
      '아카데미에서 층별 맞추기를 익힌 다음, 3D 놀이터에서 마음껏 돌리고 섞고 맞춰 보세요.';

  @override
  String get scanChoiceManualDesc => '각 면의 색을 스티커 하나씩 입력하세요.';

  @override
  String get scanTryAgain => '다시 시도';

  @override
  String get scanEditManually => '색 직접 고치기';

  @override
  String get scanLightingHint => '면을 격자 가운데에 맞추세요. 밝고 고른 조명을 쓰고 빛 반사를 피하세요.';

  @override
  String get crownExplain =>
      '층은 큐브의 가로 한 줄이에요. 1층은 아래의 흰색 층, 2층은 가운데 층, 3층은 위의 노란색 층이에요.';

  @override
  String get lessonObjectiveHeading => '학습 목표';

  @override
  String get dirRowTop => '앞면의 윗줄';

  @override
  String get dirRowBottom => '앞면의 아랫줄';

  @override
  String get dirColumnRight => '앞면의 오른쪽 열';

  @override
  String get dirColumnLeft => '앞면의 왼쪽 열';

  @override
  String get solveChoiceTitle => '어떻게 풀까요?';

  @override
  String get solveChoiceFastDesc => '가장 짧은 풀이를 한 수씩.';

  @override
  String get solveChoiceGuidedDesc => '층별 맞추기를 한 단계씩 배워요.';

  @override
  String get guidedSolvedTitle => '완성!';

  @override
  String get guidedSolvedBody => '모든 단계를 따라 큐브를 완성했어요.';

  @override
  String get solveAgain => '다시 풀기';

  @override
  String get backToHome => '홈으로 돌아가기';

  @override
  String get dailyStatTime => '오늘 기록';

  @override
  String get dailyStatBest => '개인 최고 기록';

  @override
  String get dailyStatStreak => '현재 연속 기록';

  @override
  String get dailyStatBestStreak => '최장 연속 기록';

  @override
  String get privacyPolicyTitle => '개인정보 처리방침';

  @override
  String get settingsPrivacyPolicyDesc => 'CubeMentor가 저장하는 정보와 광고가 사용하는 정보.';

  @override
  String get privacyIntro =>
      'CubeMentor는 계정도, 자체 서버도 없이 작동해요. 이 페이지에서는 기기에 남는 정보와 광고 파트너가 사용하는 정보를 설명해요.';

  @override
  String get privacyDataTitle => '데이터는 기기에만 저장돼요';

  @override
  String get privacyDataBody =>
      '언어, 설정, 레슨 진도, 풀이 시간, 일일 연속 기록은 이 기기에만 저장돼요. 저희는 서버가 없어서 이 정보를 받지 않아요. 앱을 삭제하면 함께 지워져요.';

  @override
  String get privacyCameraTitle => '카메라';

  @override
  String get privacyCameraBody =>
      '카메라는 큐브를 스캔하는 동안에만 사용돼요. 스티커 색을 읽기 위해 화면은 기기 안에서 분석되며, 사진이나 동영상은 저장되거나 전송되지 않아요.';

  @override
  String get privacyAdsTitle => '광고';

  @override
  String get privacyAdsBody =>
      '앱은 Google AdMob 광고를 보여 줘요. Google은 Google 개인정보처리방침에 설명된 대로 광고를 표시하고 측정하기 위해 기기 식별자와 광고 상호작용 데이터를 사용할 수 있어요. 법에서 요구하는 지역에서는 먼저 동의를 요청하며, 설정에서 바꿀 수 있어요.';

  @override
  String get privacyContactTitle => '문의';

  @override
  String privacyContactBody(String email) {
    return '개인정보에 관해 궁금한 점이 있나요? $email로 연락해 주세요.';
  }
}
