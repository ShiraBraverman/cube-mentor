// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline => '2×2から6×6まで、どのキューブもスキャンして解いてマスターしよう。';

  @override
  String get chooseCubeSize => 'キューブを選ぶ';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => '入門';

  @override
  String get cubeLevel3 => '定番';

  @override
  String get cubeLevel4 => '上級';

  @override
  String get cubeLevel5 => 'エキスパート';

  @override
  String get cubeLevel6 => 'マスター';

  @override
  String get cubeComingSoon => '新しいキューブ近日登場';

  @override
  String get carouselPrevious => '前のキューブ';

  @override
  String get carouselNext => '次のキューブ';

  @override
  String get chooseMode => '何をしますか？';

  @override
  String get modePlayground => '3Dプレイグラウンド';

  @override
  String get modePlaygroundDesc => '3Dで面を回したり、崩したり、手順を再生したりできます。';

  @override
  String get modeScanSolve => 'スキャンして解く';

  @override
  String get modeScanSolveDesc => 'カメラでキューブをスキャンして解法を表示します。';

  @override
  String get modeAcademy => 'アカデミー';

  @override
  String get modeAcademyDesc => 'インタラクティブなレッスンで一歩ずつ学べます。';

  @override
  String get language => '言語';

  @override
  String get languageSearch => '言語を検索';

  @override
  String get languageNoResults => '一致する言語がありません。';

  @override
  String playgroundTitle(int size) {
    return '$size×$size プレイグラウンド';
  }

  @override
  String get scramble => 'スクランブル';

  @override
  String get reset => 'リセット';

  @override
  String get undo => '元に戻す';

  @override
  String get speed => '速度';

  @override
  String get xray => '透視';

  @override
  String get prime => '逆回転';

  @override
  String get wide => 'ワイド';

  @override
  String layer(int index) {
    return '$index層目';
  }

  @override
  String get cubeRotations => '持ち替え';

  @override
  String get play => '再生';

  @override
  String get pause => '一時停止';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count手',
      zero: '手数なし',
    );
    return '$_temp0';
  }

  @override
  String get solved => '完成';

  @override
  String get scrambled => 'スクランブル済み';

  @override
  String get orbitHint => '列をドラッグして回転 · 背景をドラッグして視点を回転';

  @override
  String get notationPad => '記号パッド';

  @override
  String get solve => '解く';

  @override
  String get solving => '解いています…';

  @override
  String get solveFast => '高速で解く';

  @override
  String get solveLearn => '一歩ずつ学ぶ';

  @override
  String get solveModeGuided => 'ガイド付き（3段）';

  @override
  String get solveModeFast => '高速（最適）';

  @override
  String solveUnavailable(int size) {
    return '$size×$sizeのソルバーは今後のアップデートで追加されます。';
  }

  @override
  String get solveAlreadySolved => 'キューブはすでに完成しています。';

  @override
  String solveFailed(String reason) {
    return 'このキューブは解けません（$reason）。';
  }

  @override
  String get solveEngineMissing => 'このデバイスではソルバーエンジンを利用できません。';

  @override
  String get solveComplete => '完成！よくできました。';

  @override
  String solveSummary(int count) {
    return '$count手';
  }

  @override
  String get nextMove => '次の手';

  @override
  String get previousMove => '前の手';

  @override
  String get halfTurnHalfway => 'いいですね、半分できました！同じ向きにもう一度回すと180°回転の完成です。';

  @override
  String get wideTurnInner => 'いいですね！続けて隣の内側の層をスワイプすると、ワイド回転が完成します。';

  @override
  String get wideTurnOuter => 'いいですね！続けて隣の外側の層をスワイプすると、ワイド回転が完成します。';

  @override
  String get wideTurnMore => 'いいですね！光っている層を1つずつスワイプして、ワイド回転を完成させましょう。';

  @override
  String get guideSwipeHint => '光っている層を矢印の方向にスワイプするか、「次へ」をタップしてください。';

  @override
  String get guideRotateHint => '矢印のとおりにキューブ全体を持ち替えて、「次へ」をタップしてください。';

  @override
  String get guideWrongMove => 'ハイライトされた矢印に従ってください';

  @override
  String get guideExit => 'ガイドを終了';

  @override
  String get colorWhite => '白';

  @override
  String get colorYellow => '黄';

  @override
  String get colorGreen => '緑';

  @override
  String get colorBlue => '青';

  @override
  String get colorRed => '赤';

  @override
  String get colorOrange => 'オレンジ';

  @override
  String get phaseOptimal2x2 => '最短解';

  @override
  String get phaseKociemba1 => 'フェーズ1 · パーツの向きをそろえる';

  @override
  String get phaseKociemba2 => 'フェーズ2 · キューブを完成させる';

  @override
  String get phaseLblCross => '白クロス';

  @override
  String get phaseLblCorners => '1段目のコーナー';

  @override
  String get phaseLblMiddle => '中段のエッジ';

  @override
  String get phaseLblYellowCross => '黄クロス';

  @override
  String get phaseLblYellowEdges => '黄クロスのエッジをそろえる';

  @override
  String get phaseLblYellowCorners => '黄コーナーの位置をそろえる';

  @override
  String get phaseLblYellowCornersOrient => '黄コーナーの向きをそろえる';

  @override
  String get crownFirst => '1段目';

  @override
  String get crownSecond => '2段目';

  @override
  String get crownThird => '3段目';

  @override
  String get crownFirstGoal => '白い面と1段目';

  @override
  String get crownSecondGoal => '中段';

  @override
  String get crownThirdGoal => '黄色い面と最終段';

  @override
  String get subStepGoal11 => '白いエッジが隣のセンターの色ともそろった白クロスを作ります。';

  @override
  String get subStepGoal12 => '4つの白いコーナーを正しい場所に入れて、白い面と1段目全体を完成させます。';

  @override
  String get subStepGoal21 => '1段目をくずさずに、中段の4つのエッジを入れます。';

  @override
  String get subStepGoal31 => '最終段に黄色の十字を作ります。';

  @override
  String get subStepGoal32 => '黄クロスのエッジを入れ替えて、それぞれ側面のセンターとそろえます。';

  @override
  String get subStepGoal33 => '4つの黄色いコーナーを正しい位置に移します。向きはまだそろっていなくてもかまいません。';

  @override
  String get subStepGoal34 => '黄色いコーナーをその場でひねり、すべてのステッカーをそろえてキューブを完成させます。';

  @override
  String get explainOptimal2x2 => '2×2のすべての状態を探索して見つけた、最短の解法です。';

  @override
  String get explainKociemba1 => 'すべてのパーツの向きをそろえ、中段のエッジを中段に集めます。';

  @override
  String get explainKociemba2 => 'その向きを崩さないU、Dと180度回転だけで完成させます。';

  @override
  String get explainLblOrient => '白のセンターが下に来るよう、キューブ全体を持ち替えます。';

  @override
  String explainLblCrossEdge(String piece) {
    return '$pieceのエッジを白センターの隣に下ろし、側面の色を合わせます。';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$pieceのコーナーが違う場所にはまっています。R U R\' U\'で上に出しましょう。';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return '$pieceのコーナーが入る場所の真上に来るまで、上の層を回します。';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '$pieceのコーナーがはまるまでR U R\' U\'をくり返します。';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$pieceのエッジは中段にありますが、向きか位置が違います。上に出しましょう。';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return '$pieceのエッジの側面の色がセンターと合うように、上の層を回します。';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '$pieceのエッジを右に入れます：U R U\' R\' U\' F\' U F。';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '$pieceのエッジを左に入れます：U\' L\' U L U F U\' F\'。';
  }

  @override
  String get explainLblYellowCrossAlign => '次の手順に向けて、黄色の形の向きを上の層で合わせます。';

  @override
  String get explainLblYellowCrossAlg => 'F R U R\' U\' F\'で黄クロスを作ります。';

  @override
  String get explainLblYellowEdgesAlign => '黄色のエッジがセンターとそろうように上の層を回します。';

  @override
  String get explainLblYellowEdgesAlg => 'R U R\' U R U2 R\' Uで黄色のエッジを入れ替えます。';

  @override
  String get explainLblYellowCornersAlg =>
      'U R U\' L\' U R\' U\' Lで黄色のコーナーを正しい位置に回します。';

  @override
  String get explainLblNextCorner => '上の層を回して、次の未完成の黄コーナーを右手前に持ってきます。';

  @override
  String get explainLblCornerTwist =>
      '黄色が上を向くまでR\' D\' R Dをくり返します。下の層は最後に自然に元どおりになります。';

  @override
  String get explainLblFinalAlign => '上の層を回してキューブを完成させます。';

  @override
  String scanTitle(int size) {
    return '$size×$sizeをスキャン';
  }

  @override
  String get scanManualInput => '色を手動で入力';

  @override
  String get scanUseCamera => 'カメラでスキャン';

  @override
  String scanFaceProgress(int current, int total) {
    return '面 $current/$total';
  }

  @override
  String get faceUp => '上面';

  @override
  String get faceRight => '右面';

  @override
  String get faceFront => '前面';

  @override
  String get faceDown => '下面';

  @override
  String get faceLeft => '左面';

  @override
  String get faceBack => '背面';

  @override
  String get scanHintFront =>
      '好きな面を自分に向けてキューブを持ちます。それが前面です。スキャン中は上面を変えないでください。';

  @override
  String get scanHintRight => '前面の状態から、キューブ全体を左に1回回して右面をこちらに向けます。';

  @override
  String get scanHintBack => '前面の状態から、キューブ全体を左に2回回します。';

  @override
  String get scanHintLeft => '前面の状態から、キューブ全体を右に1回回します。';

  @override
  String get scanHintUp => '前面の状態から、上面を手前に倒してカメラに向けます。';

  @override
  String get scanHintDown => '前面の状態から、下面を手前に起こしてカメラに向けます。';

  @override
  String get scanAlignHint => 'グリッドに面を合わせて、シャッターをタップしてください。';

  @override
  String get scanCapture => '面を撮影';

  @override
  String get scanTurnLeft => 'キューブ全体を左に回す';

  @override
  String get scanTurnRight => 'キューブ全体を右に回す';

  @override
  String get scanTipTop => '上面を手前に倒す';

  @override
  String get scanTipBottom => '下面を手前に起こす';

  @override
  String get scanGlareTip =>
      '反射を検出しました。キューブを少し傾けるか、スマホをキューブの上にかざして天井の光をさえぎってください。';

  @override
  String get scanDimTip => '暗すぎます。明るい場所に移動するか、ライトを点けてください。';

  @override
  String get scanTorch => 'ライト';

  @override
  String get scanGuideLabel =>
      'スキャンガイド：スキャン済みの面はカラーで表示されます。スキャン済みの面をタップすると撮り直せます。';

  @override
  String get scanTapToRescan => 'スキャン済みの面をタップすると撮り直せます。';

  @override
  String get scanCameraMissing => 'このデバイスにカメラが見つかりません。';

  @override
  String get scanCameraDenied => 'カメラへのアクセスが拒否されました。色は手動でも入力できます。';

  @override
  String get scanCameraFailed => 'カメラを起動できませんでした。';

  @override
  String get scanAllGood => 'すべてのステッカーが正しく見えます。';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count枚のステッカーが間違っているようです',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'どこかがおかしいようです';

  @override
  String scanIssueColors(int count) {
    return '各色はちょうど$count枚ずつ必要です。';
  }

  @override
  String get scanIssueCenters => '2つのセンターが同じ色になっています。';

  @override
  String get scanIssuePieces => 'このステッカーの組み合わせは、実際のキューブには存在しないパーツになります。';

  @override
  String get scanIssueTwist => 'コーナーが1つねじれています。コーナーのステッカーを確認してください。';

  @override
  String get scanIssueFlip => 'エッジが1つ反転しています。エッジのステッカーを確認してください。';

  @override
  String get scanIssueParity => '2つのパーツが入れ替わっているようです。';

  @override
  String get scanIssueUnavailable => 'このデバイスでは色のチェックを利用できません。';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count枚のステッカーが読み取りにくかったので、確認してください。',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint => 'ステッカーをタップで色を変更 · 長押しでパレット';

  @override
  String get scanRescanFace => '面を撮り直す';

  @override
  String get scanCancelRescan => '色の確認に戻る';

  @override
  String get scanPaletteTitle => '色を選ぶ';

  @override
  String get scanOpen3d => '3Dで開く';

  @override
  String get scanRestart => '最初からやり直す';

  @override
  String get modeTimer => 'スピードタイマー';

  @override
  String get modeTimerDesc => 'スクランブル、インスペクション、平均、自己ベスト。';

  @override
  String get modeDaily => 'デイリーチャレンジ';

  @override
  String get modeDailyDesc => '毎日新しいスクランブル。連続記録を伸ばそう。';

  @override
  String get modePatterns => '模様ライブラリ';

  @override
  String get modePatternsDesc => '市松模様、スーパーフリップなどを3Dで。';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日連続',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => '学習を続ける';

  @override
  String get startLearning => '学習を始める';

  @override
  String lessonOf(int index, int total) {
    return 'レッスン $index/$total';
  }

  @override
  String get academyAllDone => 'すべてのレッスンを完了しました！';

  @override
  String get academyTitle => 'アカデミー';

  @override
  String academyProgress(int done, int total) {
    return '$totalレッスン中$done完了';
  }

  @override
  String get lessonAdvanced => '上級';

  @override
  String lessonPartOf(int index, int total) {
    return 'パート $index/$total';
  }

  @override
  String get lessonNext => '次へ';

  @override
  String get lessonPrevious => '前へ';

  @override
  String get lessonFinish => 'レッスンを終える';

  @override
  String get lessonComplete => 'レッスン完了！';

  @override
  String get lessonNextLesson => '次のレッスン';

  @override
  String get lessonBackToAcademy => 'アカデミーに戻る';

  @override
  String get lessonTryIt => 'あなたの番です。矢印の層をスワイプするか、「次へ」をタップしてください。';

  @override
  String get lessonLookAround => '背景をドラッグすると、キューブをいろいろな角度から見られます。';

  @override
  String get lessonDemoDone => 'いいですね！「次へ」をタップして進みましょう。';

  @override
  String holdPrompt(String top, String front) {
    return '$topのセンターを上、$frontのセンターを手前にしてキューブを持ちます。';
  }

  @override
  String get trackBeginner => '初心者向け3×3：1段ずつそろえる';

  @override
  String get trackCfop => 'CFOP入門';

  @override
  String get trackTwoByTwo => '2×2初心者 & Ortega';

  @override
  String get trackBigCubes => '大型キューブ：リダクションとパリティ';

  @override
  String moveSentence(String layer, String direction) {
    return '$layerを$direction回す';
  }

  @override
  String get moveFaceR => '右面';

  @override
  String get moveFaceL => '左面';

  @override
  String get moveFaceU => '上面';

  @override
  String get moveFaceD => '下面';

  @override
  String get moveFaceF => '前面';

  @override
  String get moveFaceB => '背面';

  @override
  String moveLayerInner(int depth, String face) {
    return '$faceから$depth層目';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face（$depth層分）';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '$faceから$near〜$far層目';
  }

  @override
  String get moveLayerMiddle => '中層';

  @override
  String get moveDirUp => '上に';

  @override
  String get moveDirDown => '下に';

  @override
  String get moveDirLeft => '左に';

  @override
  String get moveDirRight => '右に';

  @override
  String get moveDirClockwise => '時計回りに';

  @override
  String get moveDirCounter => '反時計回りに';

  @override
  String get moveDirBackClockwise => '背面から見て時計回りに';

  @override
  String get moveDirBackCounter => '背面から見て反時計回りに';

  @override
  String get moveDirHalf => '180度（2回）';

  @override
  String get moveRotateX => 'キューブ全体を傾ける：前面が上へ';

  @override
  String get moveRotateXPrime => 'キューブ全体を傾ける：前面が下へ';

  @override
  String get moveRotateX2 => 'キューブ全体をひっくり返す：前面が背面へ';

  @override
  String get moveRotateY => 'キューブ全体を回す：前面が左へ';

  @override
  String get moveRotateYPrime => 'キューブ全体を回す：前面が右へ';

  @override
  String get moveRotateY2 => 'キューブ全体を半回転：背面が手前へ';

  @override
  String get moveRotateZ => 'キューブ全体を時計回りに転がす：上面が右へ';

  @override
  String get moveRotateZPrime => 'キューブ全体を反時計回りに転がす：上面が左へ';

  @override
  String get moveRotateZ2 => 'キューブ全体を上下逆さまに：上面が下へ';

  @override
  String get phaseReductionCenters => 'センター';

  @override
  String get phaseReductionEdges => 'エッジのペアリング';

  @override
  String get phaseReductionEdgeParity => 'エッジパリティ';

  @override
  String get phaseReductionOllParity => 'OLLパリティ';

  @override
  String get phaseReductionPllParity => 'PLLパリティ';

  @override
  String get explainReductionCenterBlock => '複数のセンターパーツを一度にそろえるスライス回転です。';

  @override
  String explainReductionCenterCycle(String piece) {
    return '完成済みのセンターを崩さない3-サイクルで、$pieceのセンターパーツを自分の面へ運びます。';
  }

  @override
  String get explainReductionParityCenters => 'パリティのスライス回転で動いたセンターを作り直します。';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '3-サイクルで$pieceのエッジパーツをつなげます。センターは崩れません。';
  }

  @override
  String get explainReductionEdgeParity =>
      '最後のエッジは3-サイクルだけではペアにできません（エッジパリティ）。内側のスライスを1回回せば直ります。';

  @override
  String get explainReductionOllParity =>
      'OLLパリティ：エッジが1つだけ反転しています。3×3ではありえない状態です。この手順で元に戻します。';

  @override
  String get explainReductionPllParity =>
      'PLLパリティ：エッジが2つ入れ替わっています。3×3ではありえない状態です。この手順で元に戻します。';

  @override
  String get patternsTitle => '模様ライブラリ';

  @override
  String get patternsHint => '模様をタップして見てから、手元のキューブでまねしてみましょう。';

  @override
  String get patternCheckerboard => '市松模様';

  @override
  String get patternCubeInCube => 'キューブ・イン・キューブ';

  @override
  String get patternSuperflip => 'スーパーフリップ';

  @override
  String get patternDots => 'ドット';

  @override
  String get patternCross => 'クロス';

  @override
  String get patternPython => 'パイソン';

  @override
  String get phasePattern => '模様を作る';

  @override
  String get explainPatternStep => '手元のキューブで1手ずつまねしてください。「解く」をタップすると元に戻ります。';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'スピードタイマー';

  @override
  String get timerHoldToStart => '長押しして離すとスタート';

  @override
  String get timerReleaseToStart => '離すとスタート';

  @override
  String get timerTapToStop => 'どこかをタップしてストップ';

  @override
  String get timerInspectionToggle => '15秒インスペクション';

  @override
  String get timerLoadingScramble => 'スクランブルを生成中…';

  @override
  String get timerPb => 'ベスト';

  @override
  String get timerSolves => '記録数';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => '削除';

  @override
  String get timerHistory => '履歴';

  @override
  String get timerNoSolves => 'まだ記録がありません。キューブを崩してスタート！';

  @override
  String get timerNewPb => '自己ベスト更新！';

  @override
  String get timerClearHistory => '履歴を消去';

  @override
  String get timerScrambleHint => '白を上、緑を手前にしてスクランブル：';

  @override
  String get dailyTitle => 'デイリーチャレンジ';

  @override
  String dailyFor(String date) {
    return '$dateのチャレンジ';
  }

  @override
  String dailyBestStreak(int count) {
    return '最長連続記録：$count';
  }

  @override
  String get dailyDone => '今日はクリア！また明日。';

  @override
  String get dailyNotDone => '今日のスクランブルを解いて連続記録をキープしよう。';

  @override
  String get dailySolveVirtual => '3Dキューブで解く';

  @override
  String get dailyTimeIt => '手元のキューブで計測';

  @override
  String get dailyHint => 'ヒント';

  @override
  String dailyHintText(String moves) {
    return '白クロスから始めましょう：$moves';
  }

  @override
  String get dailyHintFailed => '現在ヒントはありません。';

  @override
  String get lessonBasics => 'キューブを知ろう';

  @override
  String get lessonBasicsDesc => 'パーツ、面、回転記号。';

  @override
  String get stepBasicsPieces => '3種類のパーツ';

  @override
  String get stepBasicsPiecesBody =>
      'センターは動かず、各面の色を決めます。エッジは2色、コーナーは3色です。キューブを解くとは、すべてのエッジとコーナーを同じ色のセンターの隣に運ぶことです。';

  @override
  String get stepBasicsFaces => '6つの面の記号';

  @override
  String get stepBasicsFacesBody =>
      'R、L、U、D、F、Bはそれぞれ右、左、上、下、前、後ろの面です。記号だけなら、その面を正面から見て時計回りに90度回すという意味です。';

  @override
  String get stepBasicsPrime => '逆回転と180度回転';

  @override
  String get stepBasicsPrimeBody =>
      'アポストロフィ（R\'）は反対方向、つまり反時計回りです。2（U2）は180度、つまり90度を2回です。';

  @override
  String get stepCrossGoal => 'ゴール';

  @override
  String get stepCrossGoalBody =>
      '黄色を上、緑を手前に持ちます。まず4つの白いエッジを、白を上にして黄色いセンターのまわりに花びらのように集めます。これがデイジーです。それから花びらを1つずつ白いセンターへ下ろし、横の色をとなりのセンターに合わせます。';

  @override
  String get stepCrossTop => '上にあるエッジ';

  @override
  String get stepCrossTopBody =>
      '白を上に向けた上の段の白いエッジは、デイジーの花びらです。上の段を回して横の色を同じ色のセンターの真上に合わせ、その面を2回（180°）まわして白いセンターへ下ろします。';

  @override
  String get stepCrossMiddle => '中段にあるエッジ';

  @override
  String get stepCrossMiddleBody =>
      '中段に引っかかったエッジは、まず上に出します。その側面を上げ、上の段をよけて、側面を戻せば、入れたピースは動きません。これで上の花びらになったので、合わせてその面を2回まわします。';

  @override
  String get stepCornersInsert => '入る場所の真上へ';

  @override
  String get stepCornersInsertBody =>
      '上の段を回して、白いコーナーを横の色と同じ2つのセンターの間、入る場所の真上に合わせます。ここでは上を1回とR U\' R\'で十分です。Uでコーナーを真上に運び、R U\' R\'で白を下にして入れます。';

  @override
  String get stepCornersRepeat => '手順をくり返す';

  @override
  String get stepCornersRepeatBody =>
      '場所を右手前にして、白が下を向くまでR U R\' U\'をくり返します。白が右向きなら1回、上向きなら3回、手前向きなら5回です。途中で上がくずれて見えても、自然に元に戻ります。';

  @override
  String get stepMiddleRight => '右に入れる';

  @override
  String get stepMiddleRightBody =>
      '黄色を含まない上のエッジを探します。上の段を回して、前の色を目の前のセンターに合わせます。上の色が右のセンターと同じなら右へ：U R U\' R\' U\' F\' U F。';

  @override
  String get stepMiddleLeft => '左に入れる';

  @override
  String get stepMiddleLeftBody =>
      '上の色が左のセンターと同じなら、鏡の手順を使います：U\' L\' U L U F U\' F\'。白い段は毎回きれいに戻ります。';

  @override
  String get stepYellowCross => 'ひとつの手順';

  @override
  String get stepYellowCrossBody =>
      '上の黄色いエッジだけを見ます。L字は左奥、線は左右に向けて持ち、F R U R\' U\' F\'をします。線は1回、L字は2回、点は最大3回です。';

  @override
  String get stepYellowEdges => 'エッジをそろえる';

  @override
  String get stepYellowEdgesBody =>
      '上の段を回して、2つのエッジを横のセンターに合わせます。1つが奥、1つが右にあれば、R U R\' U R U2 R\' Uで手前と左のエッジが入れ替わります。';

  @override
  String get stepPlaceCorners => '位置をそろえる';

  @override
  String get stepPlaceCornersBody =>
      'コーナーの色がまわりの3つのセンターと合えば、ねじれていても正しい位置です。そのコーナーを右手前に持てば、U R U\' L\' U R\' U\' Lで残り3つが回ります。4つともそろうまでくり返します。';

  @override
  String get stepTwistCorners => '向きをそろえる';

  @override
  String get stepTwistCornersBody =>
      'そろっていないコーナーを右手前にして、黄色が上を向くまでR\' D\' R Dを2回ずつくり返し、次のコーナーへは上の段だけを回します。最後のコーナーまで下はくずれて見えますが、続けてください。';

  @override
  String get lessonCfopIntro => 'CFOPとは？';

  @override
  String get lessonCfopIntroDesc => 'クロス、F2L、OLL、PLL。';

  @override
  String get stepCfopOverview => '4つのステップ';

  @override
  String get stepCfopOverviewBody =>
      'スピードキューバーはクロスを作り、1段目のコーナーと中段のエッジをペアにして入れ（F2L）、最終段の向きをそろえ（OLL）、最後に位置をそろえます（PLL）。';

  @override
  String get stepCfopCross => 'クロスを計画する';

  @override
  String get stepCfopCrossBody => 'CFOPでは、インスペクション中にクロスの手順を考え、下面に約8手で作ります。';

  @override
  String get lessonF2l => 'F2Lの基本';

  @override
  String get lessonF2lDesc => 'コーナーとエッジをペアにします。';

  @override
  String get stepF2lRight => 'ペアを入れる';

  @override
  String get stepF2lRightBody => 'コーナーとそのエッジが上で隣り合っていたら、入る場所の上に運んで一緒に入れます。';

  @override
  String get stepF2lLeft => '左側のペア';

  @override
  String get stepF2lLeftBody =>
      '反対側の同じケースは左右反転のU\' L\' U Lです。キューブを持ち替える（y）と、やりやすい手で回せます。';

  @override
  String get lessonOll => '2-Look OLL';

  @override
  String get lessonOllDesc => '上面を黄色にそろえます。';

  @override
  String get stepOllCross => 'まずエッジ';

  @override
  String get stepOllCrossBody => '2-Look OLLは、すでに知っている黄クロスの手順から始めます。';

  @override
  String get stepOllSune => 'スーン';

  @override
  String get stepOllSuneBody =>
      '黄色のコーナーが1つだけ左手前で上を向いているとき、スーン（R U R\' U R U2 R\'）で残り3つの向きがそろいます。ほかの多くのケースもスーンとその反転で解けます。';

  @override
  String get lessonPll => '2-Look PLL';

  @override
  String get lessonPllDesc => 'キューブを完成させます。';

  @override
  String get stepPllT => 'Tパーム';

  @override
  String get stepPllTBody =>
      'Tパームはコーナー2つとエッジ2つを入れ替えます。コーナーをそろえるときに使い、入れ替えたい2つのコーナーを右側に持ちます。';

  @override
  String get stepPllU => 'Uパーム';

  @override
  String get stepPllUBody => 'コーナーがそろったら、Uパームで3つのエッジを回します。完成している面を奥にして持ちます。';

  @override
  String get lessonTwoFirst => '2×2の1段目';

  @override
  String get lessonTwoFirstDesc => 'コーナーの色がそろった面を作ります。';

  @override
  String get stepTwoIntro => 'コーナーだけ';

  @override
  String get stepTwoIntroBody =>
      '2×2はコーナー8つだけで、エッジもセンターもありません。となりの横の色がそろうように白い段を下に作り、あとは1つのルートで仕上げます。Suneで上を黄色にして、T-permかY-permです。';

  @override
  String get stepTwoCorner => 'コーナーを入れる';

  @override
  String get stepTwoCornerBody =>
      '3×3の白いコーナーと同じです。コーナーを右手前の空いた場所の真上に運んで入れます。ここではU R U\' R\'、または白が下を向くまでR U R\' U\'をくり返します。横の色をとなりと見比べましょう。';

  @override
  String get lessonTwoOll => '上面の向きをそろえる';

  @override
  String get lessonTwoOllDesc => 'スーンを使ったOrtega法のOLL。';

  @override
  String get stepTwoSune => 'またスーン';

  @override
  String get stepTwoSuneBody =>
      '上を向いた黄色のステッカーを数えます。黄色が上を向いた唯一のコーナーを左手前にしてSune（R U R\' U R U2 R\'）をします。数え直して持ち直し、Suneは最大3回。間は上の段だけを回します。';

  @override
  String get lessonTwoPbl => '上下の層の位置をそろえる';

  @override
  String get lessonTwoPblDesc => 'コーナーを入れ替えて完成させます。';

  @override
  String get stepTwoAdjacent => '隣同士の入れ替え';

  @override
  String get stepTwoAdjacentBody =>
      'ヘッドライトとは、1つの側面に並ぶ同じ色の上のステッカー2枚です。上の段を回してヘッドライトを左にすると、入れ替える2つのコーナーが右に来るので、T-permをします。';

  @override
  String get stepTwoDiagonal => '対角の入れ替え';

  @override
  String get stepTwoDiagonalBody =>
      'どの側面にもヘッドライトがなければ、対角の2つのコーナーを入れ替えます。どこからでもY-permをして、上の段を回して全体を合わせます。';

  @override
  String get lessonBigIntro => '大型キューブのパーツ';

  @override
  String get lessonBigIntroDesc => 'センター、ウイング、スライス。';

  @override
  String get stepBigPieces => '固定センターがない';

  @override
  String get stepBigPiecesBody =>
      '4×4では各面に動くセンターピースが4つあり、エッジはそれぞれウイング2つでできています。固定のセンターがないので、コーナーで色の並びを確かめます：白の反対は黄色、青の反対は緑、赤の反対はオレンジ。';

  @override
  String get stepBigSlices => 'ワイド回転と内側の回転';

  @override
  String get stepBigSlicesBody =>
      'Rwは右の2層を一緒に回します。2Rは右から2層目だけを回します。これらの回転でセンターやウイングが動きます。';

  @override
  String get lessonBigCenters => 'センター';

  @override
  String get lessonBigCentersDesc => 'センターパーツをまとめます。';

  @override
  String get stepBigCenterCycle => 'センターの3-サイクル';

  @override
  String get stepBigCenterCycleBody =>
      'このコミュテーターはセンターピースをちょうど3つだけ動かし、ほかは動かしません。完成したセンターはそのままです。はぐれたピースがバーに入らないときに使います。';

  @override
  String get lessonBigEdges => 'エッジのペアリング';

  @override
  String get lessonBigEdgesDesc => 'ウイングをつなげてエッジにします。';

  @override
  String get stepBigEdgePair => 'ペアにして戻す';

  @override
  String get stepBigEdgePairBody =>
      'Uw\'で同じ色のウイング2つを並べ、R U R\' F R\' F\' Rでペアになっていないエッジと入れ替え、Uwでセンターを戻します。開いた層は必ず閉じます。';

  @override
  String get lessonBigParity => 'パリティ';

  @override
  String get lessonBigParityDesc => '偶数キューブのOLLパリティとPLLパリティ。';

  @override
  String get stepBigOllParity => 'OLLパリティ';

  @override
  String get stepBigOllParityBody =>
      'エッジ1つだけの反転は3×3では起こりません。OLLパリティで、まちがいではありません。上の段の前に置いて長い手順をします。上の左右のエッジとコーナー2つも入れ替わりますが、3×3の最後のステップで直ります。';

  @override
  String get stepBigPllParity => 'PLLパリティ';

  @override
  String get stepBigPllParityBody =>
      '最後の最後でエッジ2つが入れ替わっていて、3×3の手順が合わない？それがPLLパリティです。上の段の前と奥に置き、2R2 U2 2R2 Uw2 2R2 2U2で入れ替えます。';

  @override
  String get introGoalHeading => '目標は？';

  @override
  String get introHowHeading => 'どうやるの？';

  @override
  String get introHoldHeading => '持ち方';

  @override
  String get introWhyHeading => 'なぜうまくいくのか';

  @override
  String get introStart => 'わかった、1手ずつ始める';

  @override
  String get introDontShowAgain => '今後は自動で表示しない';

  @override
  String get introShowGoal => '目標を見る';

  @override
  String get introStateStart => 'スタート';

  @override
  String get introStateGoal => 'ゴール';

  @override
  String get introPlayMorph => 'スタートからゴールまで再生';

  @override
  String get introGoalBasics => 'キューブの読み方を覚えましょう。パーツ、6つの面、そして回転記号の動きです。';

  @override
  String get introGoalCross => '下の面に白クロスを作り、白いエッジがそれぞれ横のセンターの色ともそろうようにします。';

  @override
  String get introGoalCorners => '4つの白いコーナーを入れて1段目全体を完成させます。白い面と、そろった横の色が目印です。';

  @override
  String get introGoalMiddle => '中段のエッジ4つを入れて、下の2層を完成させます。';

  @override
  String get introGoalYellowCross => '上面に黄色いクロスを作ります。側面の色はまだそろわなくて大丈夫です。';

  @override
  String get introGoalYellowEdges => '黄色いクロスの各エッジを、その側のセンターの色に合わせます。';

  @override
  String get introGoalYellowCorners => '黄色いコーナーを、ねじれていてもよいので正しい位置に移します。';

  @override
  String get introGoalTwistCorners => '黄色いコーナーを正しい向きにひねって、キューブを完成させます。';

  @override
  String get introGoalCfopIntro => 'スピードキュービングの流れを知りましょう：クロス、F2L、最後の層を2段階で。';

  @override
  String get introGoalF2l => '白いコーナーを中段のエッジと一緒に入れて、2層を同時に仕上げます。';

  @override
  String get introGoalOll => '1〜2個の手順で上面をすべて黄色にします。';

  @override
  String get introGoalPll => '最後の層のパーツを正しい位置に移して完成させます。';

  @override
  String get introGoalTwoFirst => '2×2で白い層を1つ完成させます。';

  @override
  String get introGoalTwoOll => '2×2の上面をすべて黄色にします。';

  @override
  String get introGoalTwoPbl =>
      'T-permかY-permを1回使って最後のコーナーを戻し、上の段を合わせて2×2を完成させます。';

  @override
  String get introGoalBigIntro => '4×4を知りましょう：センター、エッジのペア、コーナー、そしてそれらを回す記号です。';

  @override
  String get introGoalBigCenters => '各面のセンターパーツを1色のブロックにまとめます。';

  @override
  String get introGoalBigEdges => '同じ色のエッジパーツをペアにして、どのエッジも3×3のエッジ1つに見えるようにします。';

  @override
  String get introGoalBigParity =>
      '3×3では起こらない4×4の2つのケースを直します。エッジ1つが反転（OLLパリティ）か、エッジ2つが入れ替わり（PLLパリティ）です。';

  @override
  String get introHowBasics =>
      'センターは動かないので、各面の色を決めています。\n各記号は1つの面を時計回りに90°回します。\nアポストロフィ（\'）は逆回り、2は2回まわします。';

  @override
  String get introHoldBasics => '持ち方は自由です。センターは動かないので、色を見ればどの面かいつでもわかります。';

  @override
  String get introWhyBasics => 'どの手順もこの文字の並びなので、読めることが最初のスキルです。';

  @override
  String get introHowCross =>
      '白いエッジを白を上に向けて上の段に集め、黄色いセンターを囲みます。これがデイジーです。\n上の段を回して、花びらの横の色を同じ色のセンターの上に合わせます。\nその面を2回まわして下ろし、4つとも同じようにします。';

  @override
  String get introHoldCross =>
      'このステップの間、黄色いセンターを上、白いセンターを下にします。花びらを合わせるときは、キューブではなく上の段を回します。';

  @override
  String get introWhyCross =>
      '白が上を向いていれば、前の面を2回まわすだけでエッジが白いセンターの上に、白を下にして横の色もそろった状態で入ります。';

  @override
  String get introHowCorners =>
      '上の段を回して、白いコーナーを右手前の空いた場所の真上に持ってきます。\nR U R\' U\'をくり返します。白が右向きなら1回、上向きなら3回、手前向きなら5回です。\n残り3つのコーナーも同じようにします。';

  @override
  String get introHoldCorners => '白を下、黄色を上。コーナーは右手前、入る場所の真上です。';

  @override
  String get introWhyCorners =>
      'R U R\' U\'は場所を持ち上げて戻す手順です。回すたびにコーナーが少しねじれ、白が下を向けば完成。クロスはくずれません。';

  @override
  String get introHowMiddle =>
      '黄色を含まない上の段のエッジを探し、前の色を下のセンターに合わせます。\n上の色で行き先がわかります：右か左か。\n8手の手順で入れれば、白い段は毎回元に戻ります。';

  @override
  String get introHoldMiddle => '白を下、黄色を上。エッジは前面にあり、前の色が下のセンターと同じです。';

  @override
  String get introWhyMiddle =>
      '手順で場所をどけてエッジを差し込み、白い段を戻します。黄色を含むエッジは上の段のもので、中段には入りません。';

  @override
  String get introHowYellowCross =>
      '上の黄色いエッジだけを見ます：点、L字、線のどれかです。\nL字は左奥、線は左右に向けて持ち、F R U R\' U\' F\'をします。\n線は1回、L字は2回、点は最大3回です。';

  @override
  String get introHoldYellowCross => '白を下、黄色を上。L字は左奥、線は左右に。点はどの向きでもかまいません。';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\'は、下の2段にふれずに上のエッジを2つずつ反転させます。';

  @override
  String get introHowYellowEdges =>
      '上の段を回して、2つのエッジを横のセンターに合わせます。\nその2つを奥と右に持ち、R U R\' U R U2 R\' Uをします。\nそろったエッジが向かい合っていたら、まずどこからでも1回します。';

  @override
  String get introHoldYellowEdges => '黄色を上。そろったエッジの1つを奥に、もう1つを右に。';

  @override
  String get introWhyYellowEdges => 'この手順は上のピースだけを動かすので、下の2段はいつも元に戻ります。';

  @override
  String get introHowYellowCorners =>
      'コーナーの色がまわりの3つのセンターと合えば、ねじれていても正しい位置です。\n正しい位置のコーナーを右手前に置きます。\nU R U\' L\' U R\' U\' Lで残り3つが回ります。全部そろうまでくり返します。';

  @override
  String get introHoldYellowCorners =>
      '黄色を上。すでに正しい位置にあるコーナーを右手前に。なければどれでもかまいません。';

  @override
  String get introWhyYellowCorners =>
      '3つのコーナーを回し、右手前のコーナーはそのままにするので、くり返すたびにそろうコーナーが増えます。';

  @override
  String get introHowTwistCorners =>
      'まだそろっていないコーナーを右手前に持ちます。\n黄色が上を向くまでR\' D\' R Dを2回ずつくり返します。\n次のコーナーへは上の段だけを回します。下は最後のコーナーで元に戻ります。';

  @override
  String get introHoldTwistCorners =>
      '黄色を上、回すコーナーを右手前に。コーナーの間は上の段だけを回し、キューブ全体は回しません。';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R Dはコーナーをねじり下をくずしますが、全部のコーナーを回し終えると下は元に戻ります。途中でやめるとくずれたままです。';

  @override
  String get introHowCfopIntro =>
      'クロス：インスペクション中に4つのエッジを計画します。\nF2L：コーナーとエッジをペアで入れます。\nOLLで上面を黄色にし、PLLでパーツを元の位置に戻します。';

  @override
  String get introHoldCfopIntro => 'スピードキューバーはクロスを下に作り、回しながら次のピースを先に見ます。';

  @override
  String get introWhyCfopIntro =>
      'コーナーとエッジを一緒に解けば手数が大きく減り、ケースを見分ければ試行錯誤がいらなくなります。';

  @override
  String get introHowF2l =>
      '上段でコーナーと対応するエッジを見つけます。\nスロットの上でペアにします。\n3〜4手でペアを入れます。';

  @override
  String get introHoldF2l => 'クロスを下に。ペアを入れる場所は右手前、鏡のケースなら左手前です。';

  @override
  String get introWhyF2l => 'ペアにしたコーナーとエッジが一緒に入るので、1つずつではなく2段が同時に進みます。';

  @override
  String get introHowOll =>
      'まずF R U R\' U\' F\'で黄色いクロス。\n次にSuneなどでコーナーの向きをそろえます。\n見えている黄色の形でケースを見分けます。';

  @override
  String get introHoldOll => '黄色を上。Suneでは、黄色が上を向いた唯一のコーナーを左手前に置きます。';

  @override
  String get introWhyOll => '最後の段を「向き」と「位置」に分けることで、覚える手順が少なくてすみます。';

  @override
  String get introHowPll =>
      '上面はすでに全部黄色です。\nT-permはコーナーを交換し、U-permは3つのエッジを回します。\n側面の色を見て手順を選びます。';

  @override
  String get introHoldPll => '黄色を上。T-perm：ヘッドライトを左に。U-perm：完成した側面を奥に。';

  @override
  String get introWhyPll => '上が全部黄色になれば、あとはピースの位置だけ。数回の入れ替えでキューブが完成します。';

  @override
  String get introHowTwoFirst =>
      '白を下にした白いコーナーを1つ、基準に選びます。\n次のコーナーを右手前の場所の真上に持ってきます。\n横の色がそろって入るまでR U R\' U\'をくり返します。';

  @override
  String get introHoldTwoFirst => '白を下。空いた場所を右手前に、そのコーナーを上の段の真上に。';

  @override
  String get introWhyTwoFirst =>
      '2×2にはセンターがありません。最初に置いたコーナーがとなりの色を決めるので、白だけでなく横の色も大切です。';

  @override
  String get introHowTwoOll =>
      '黄色が上を向いたコーナーを数えます。\n1つなら左手前に置いて、Sune（R U R\' U R U2 R\'）をします。\nもう一度数えてくり返します。Suneは最大3回です。';

  @override
  String get introHoldTwoOll => '白を下、黄色を上。毎回Suneの前に、黄色が上のコーナーを左手前に。';

  @override
  String get introWhyTwoOll => 'Suneは白い段をくずさずに上のコーナーをねじります。数え直すと次の持ち方がわかります。';

  @override
  String get introHowTwoPbl =>
      'ヘッドライトを探します：1つの側面に並ぶ同じ色の上のステッカー2枚です。\n1つの側面にあれば左に置いてT-permをします。\nなければどこからでもY-permをして、上の段を合わせます。';

  @override
  String get introHoldTwoPbl =>
      '白を下、黄色を上。T-perm：ヘッドライトを左に。Y-perm：どの面を手前にしてもかまいません。';

  @override
  String get introWhyTwoPbl =>
      '上が黄色なら、残るのはコーナーの位置だけ。T-permはとなり合う2つ、Y-permは対角の2つを入れ替えます。';

  @override
  String get introHowBigIntro =>
      '固定されたセンターはなく、4つのセンターパーツで面の色が決まります。\nRwのようなワイド回転は2層を同時に回します。\n2Rのような内側の回転は内側の1層だけを回します。';

  @override
  String get introHoldBigIntro =>
      '最初は自由に。4×4には固定のセンターがないので、どの色をどこにするかは自分で決めます。';

  @override
  String get introWhyBigIntro =>
      'リダクションでセンターとエッジのピースをまとめ、大きなキューブを3×3のように解けるようにします。';

  @override
  String get introHowBigCenters =>
      'まずコーナーで色の並びを確かめます。\n向かい合う2つのセンターを作り、残り4つを作ります。\n内側の層でセンターを動かし、開いた層は必ず戻します。';

  @override
  String get introHoldBigCenters => '作っている面を前に。完成したセンターは左右に置いて邪魔にならないようにします。';

  @override
  String get introWhyBigCenters =>
      '層を回すとセンターが動き、戻すと完成したセンターも戻るので、ねらったピースだけが変わります。';

  @override
  String get introHowBigEdges =>
      '同じ2色のウイングを2つ探します。\n前面に並べてUw\'でくっつけます。\nペアになっていないエッジと入れ替え、Uwでセンターを戻します。';

  @override
  String get introHoldBigEdges => 'ペアにするエッジは前の層に。完成したエッジは上下の段に置いておきます。';

  @override
  String get introWhyBigEdges =>
      'Uw\'でセンターをよけて2つのウイングを出会わせ、Uwでセンターを戻すので、作業がむだになりません。';

  @override
  String get introHowBigParity =>
      '行き詰まるまで4×4を3×3のように解きます。\nエッジ1つが反転：長いOLLパリティの手順。\nエッジ2つが入れ替わり：2R2 U2 2R2 Uw2 2R2 2U2。';

  @override
  String get introHoldBigParity =>
      '最後の段を上に。OLLパリティ：反転したエッジを前に。PLLパリティ：入れ替わったエッジを前と奥に。';

  @override
  String get introWhyBigParity =>
      'ウイングは3×3にはない状態になることがあります。この手順は内側の層を回して、ちょうどそれを元に戻します。';

  @override
  String get dirFaceR => '右側';

  @override
  String get dirFaceL => '左側';

  @override
  String get dirFaceU => '上の段';

  @override
  String get dirFaceD => '下の段';

  @override
  String get dirFaceF => '前面';

  @override
  String get dirFaceB => '背面';

  @override
  String get dirMiddle => '中央の層';

  @override
  String get dirWholeCube => 'キューブ全体';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face・$depth層目';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face・$depth層分';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face・$near〜$far層目';
  }

  @override
  String get dirUp => '上へ';

  @override
  String get dirDown => '下へ';

  @override
  String get dirLeft => '左へ';

  @override
  String get dirRight => '右へ';

  @override
  String get dirClockwise => '時計回り';

  @override
  String get dirCounter => '反時計回り';

  @override
  String get dirBackClockwise => '時計回り（後ろから見て）';

  @override
  String get dirBackCounter => '反時計回り（後ろから見て）';

  @override
  String get dirHalf => '2回転（180°）';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => '詳細を隠す';

  @override
  String get solveExpand => '詳細を表示';

  @override
  String get dailyScrambleSteps => '1手ずつスクランブル';

  @override
  String get dailyScrambleGuide => '3Dスクランブルガイド';

  @override
  String get dailyShowMoves => '手順をテキストで表示';

  @override
  String get dailyHideMoves => 'テキスト手順を隠す';

  @override
  String get dailyScrambleGuideTitle => 'スクランブルガイド';

  @override
  String get phaseDailyScramble => '今日のキューブを崩す';

  @override
  String get explainDailyScramble =>
      '白を上、緑を手前にした完成キューブから始めて、各回転を実物のキューブでまねしましょう。';

  @override
  String get stageCenters => 'センターブロックを作る';

  @override
  String get stageEdges => '外側と内側のエッジをペアにする';

  @override
  String get stageParity => 'パリティを解消';

  @override
  String get stageCrown1 => '1段目（白）';

  @override
  String get stageCrown2 => '2段目';

  @override
  String get stageCrown3 => '3段目（黄色）';

  @override
  String get stageOrient => 'パーツの向きをそろえる';

  @override
  String get stageFinish => 'キューブを仕上げる';

  @override
  String get stageAsThree => '3×3として解く';

  @override
  String get stageTwoByTwo => '2×2を解く';

  @override
  String stageHeader(int number, int total, String title) {
    return 'ステージ $number/$total：$title';
  }

  @override
  String get solveAllStagesDone => 'すべてのステージ完了。お見事！';

  @override
  String get trackFiveByFive => '5×5 プロフェッサーキューブ';

  @override
  String get trackSixBySix => '6×6 キューブ';

  @override
  String get lessonFiveIntro => '5×5を知ろう';

  @override
  String get lessonFiveIntroDesc => '固定センター、センターバー、中央エッジ、ウイング。';

  @override
  String get introGoalFiveIntro => '5×5を知ろう：固定センター、センターバー、中央エッジ、ウイング。';

  @override
  String get introHowFiveIntro =>
      '各面のいちばん真ん中のパーツは動きません。\nエッジは中央パーツと2つのウイングでできています。\n内側の層を回すと、外側を崩さずにパーツを動かせます。';

  @override
  String get introHoldFiveIntro => '持ち方は自由です。5×5では各面の真ん中が動かないので、それが面の色を示します。';

  @override
  String get introWhyFiveIntro => '動かないセンターが配色を決めるので、センターの順番をまちがえることはありません。';

  @override
  String get lessonFiveCenters => '5×5のセンター';

  @override
  String get lessonFiveCentersDesc => '3つ並びのバーでセンターを作ります。';

  @override
  String get introGoalFiveCenters => '各面に1色の3×3センターブロックを作ります。';

  @override
  String get introHowFiveCenters =>
      '動かない真ん中のピースから始めます。色はこれで決まります。\n3つ並びのバーを作り、内側の層で差し込みます。\nバーを入れる手が、完成したセンターも元に戻します。';

  @override
  String get introHoldFiveCenters => '作っているセンターを前か上に。完成したセンターは下、左、右に置きます。';

  @override
  String get introWhyFiveCenters => '層を入れる、上を回す、層を戻す。バーを入れる層が、完成したセンターも戻します。';

  @override
  String get lessonFiveEdges => '5×5のエッジ';

  @override
  String get lessonFiveEdgesDesc => '2つのウイングを中央エッジとつなげます。';

  @override
  String get introGoalFiveEdges => '中央エッジと2つのウイングをつなげ、12本のエッジを1つのパーツのようにします。';

  @override
  String get introHowFiveEdges =>
      '前面で各ウイングを真ん中のエッジに合わせます。\n内側の層を回し、未完成のエッジと入れ替え、戻します。\n最後のエッジは：層、反転、層。';

  @override
  String get introHoldFiveEdges => '作っているエッジを前に。完成したエッジは上下の段にしまっておきます。';

  @override
  String get introWhyFiveEdges => '内側の層を開いて閉じるとウイングがつながり、センターとしまったエッジは元に戻ります。';

  @override
  String get lessonFiveSolve => '5×5を3×3として解く';

  @override
  String get lessonFiveSolveDesc => '3×3と同じように1段ずつ仕上げます。';

  @override
  String get introGoalFiveSolve => 'リダクションした5×5を3×3と同じように、外側の回転だけで1段ずつ解きます。';

  @override
  String get introHowFiveSolve =>
      'ここからは外側の回転だけです。そうしないとペアにしたエッジが分かれます。\n白クロスとコーナー、中段、そして黄色の段。\n動かない真ん中のピースが各面の色を示します。';

  @override
  String get introHoldFiveSolve => '1段目の色を下に、3×3とまったく同じです。入れるコーナーは右手前に。';

  @override
  String get introWhyFiveSolve =>
      '内側を回すとセンターとエッジがまた分かれます。外側の回転なら、各ブロックを3×3の1ピースとして動かせます。';

  @override
  String get lessonFiveParity => '5×5のエッジパリティ';

  @override
  String get lessonFiveParityDesc => 'ウイングが入れ替わったエッジを直します。';

  @override
  String get introGoalFiveParity =>
      '外側のウイング2つが入れ替わったエッジ1つを直します。5×5にあるパリティはこれだけです。';

  @override
  String get introHowFiveParity =>
      '反転して見える最後のエッジとして現れます。\n内側の層を使う長い手順を1回します。\n5×5にPLLパリティはありません。';

  @override
  String get introHoldFiveParity => '最後の段を上に、ウイングが入れ替わったエッジを上の段の前に。';

  @override
  String get introWhyFiveParity =>
      '5×5で入れ替わるのは1つのエッジの外側のウイング2つだけなので、手順は1つで足ります。';

  @override
  String get lessonSixIntro => '6×6を知ろう';

  @override
  String get lessonSixIntroDesc => '固定センターなし、エッジは4パーツ。';

  @override
  String get introGoalSixIntro => '6×6を知ろう：各面16個のセンターパーツと、エッジごとに4つのパーツ。';

  @override
  String get introHowSixIntro =>
      '固定センターはありません。作りながら色を決めます。\nエッジには外側と内側のウイングがあります。\nワイド回転は最大3層を動かせます。';

  @override
  String get introHoldSixIntro => '最初は自由に。4×4と同じく、6×6にも固定のセンターはありません。';

  @override
  String get introWhySixIntro => '4×4と5×5が解ければ、6×6はブロックが大きいだけの同じリダクションです。';

  @override
  String get lessonSixCenters => '6×6のセンター';

  @override
  String get lessonSixCentersDesc => '4つ並びのバーで4×4センターを作ります。';

  @override
  String get introGoalSixCenters => '各面に1色の4×4センターブロックを作ります。';

  @override
  String get introHowSixCenters =>
      'まずコーナーで色の並びを確かめます。固定のセンターはありません。\n4つ並びのバーを作って合わせます。\n最後の2つのセンターは1つずつ動かします：層、上、戻す。';

  @override
  String get introHoldSixCenters => '作っている面を前に。完成したセンターは左、右、下に置きます。';

  @override
  String get introWhySixCenters => 'バーは内側の層でつながり、層は毎回戻すので、完成したセンターはくずれません。';

  @override
  String get lessonSixEdges => '6×6のエッジ';

  @override
  String get lessonSixEdgesDesc => '各エッジの4パーツを集めます。';

  @override
  String get introGoalSixEdges => '各エッジの4パーツを集め、6×6に12本のきれいなエッジを作ります。';

  @override
  String get introHowSixEdges =>
      '1つのエッジの外側と内側のウイングを前面にそろえます。\n深いワイド層でエッジを出し入れします。\nピースを取り出すために完成したエッジをくずさないこと。';

  @override
  String get introHoldSixEdges => '作っているエッジを前に。完成したエッジは上下に置いておきます。';

  @override
  String get introWhySixEdges => '深いワイド回転でセンターをよけてウイングを出会わせ、そのあと戻します。';

  @override
  String get lessonSixSolve => '6×6を3×3として解く';

  @override
  String get lessonSixSolveDesc => '3×3と同じように1段ずつ仕上げます。';

  @override
  String get introGoalSixSolve => 'リダクションした6×6を3×3と同じように、外側の回転だけで1段ずつ解きます。';

  @override
  String get introHowSixSolve =>
      'ここからは外側の回転だけです。内側の層を回すとセンターやエッジがくずれます。\n作ったセンターが各面の色を示します。\n白クロスとコーナー、中段、そして黄色の段。';

  @override
  String get introHoldSixSolve => '1段目の色を下に、3×3とまったく同じです。入れるコーナーは右手前に。';

  @override
  String get introWhySixSolve =>
      '外側の回転なら、4×4のセンターもエッジも1ピースとして動きます。3×3とまったく同じです。';

  @override
  String get lessonSixParity => '6×6のパリティ';

  @override
  String get lessonSixParityDesc => 'エッジ1本の反転か、2本の入れ替わり。';

  @override
  String get introGoalSixParity =>
      '3×3では起きない6×6の2つのケースを直します：エッジ1本の反転か、2本の入れ替わり。';

  @override
  String get introHowSixParity =>
      '行き詰まるまで3×3のように解きます。\nエッジ1つが反転：3Rwを使う長い手順。\nエッジ2つが入れ替わり：内側の2回転を使う短い手順。';

  @override
  String get introHoldSixParity => '最後の段を上に。反転したエッジを前に。2つ入れ替わっていれば前と奥に。';

  @override
  String get introWhySixParity =>
      '4×4と同じく、6×6もエッジ1つの反転か2つの入れ替わりで終わることがあります。内側の層の手順でそれだけを直せます。';

  @override
  String get stepFivePieces => '5×5のパーツ';

  @override
  String get stepFivePiecesBody =>
      '各面の真ん中のピースは動かないので、配色をまちがえることはありません。そのまわりにセンターピースが8つあり、コーナーセンターとエッジセンターが入れ替わることはありません。エッジは真ん中のピースとウイング2つです。';

  @override
  String get stepFiveSlices => '3種類の回転';

  @override
  String get stepFiveSlicesBody =>
      '外側の回転は1つの面を回します。ワイド回転は面とその奥の層をいっしょに回します。内側の層の回転は中の層だけを回すので、外側を崩さずにパーツが入れ替わります。';

  @override
  String get stepFiveCenterBar => 'センターバー';

  @override
  String get stepFiveCenterBarBody =>
      '同じ色のセンターピースを3つ並べ、内側の層で差し込み、上を回して層を戻します。バーを入れる手が、完成したセンターも戻します。バー3本でセンター1つです。';

  @override
  String get stepFiveCenterSwap => '崩さずに入れ替える';

  @override
  String get stepFiveCenterSwapBody =>
      'センターパーツを1つだけ動かすには、内側の層を回し、上面を回し、層を戻して上面も戻します。完成したセンターは毎回元に戻ります。';

  @override
  String get stepFiveEdgePair => 'ウイングを中央エッジにつなげる';

  @override
  String get stepFiveEdgePairBody =>
      '前面でウイングを真ん中のエッジのとなりに並べ、内側の層を下げ、短いトリガーで未完成のエッジと入れ替えて、内側の層を戻します。';

  @override
  String get stepFiveEdgeLast => '最後のエッジ';

  @override
  String get stepFiveEdgeLastBody =>
      '入れ替えに使える空きエッジがなくなったら、層、反転、層です。ワイド回転、短いトリガー、ワイド回転の戻しで、完成したエッジをくずさずに最後のエッジをペアにします。';

  @override
  String get stepFiveAsThree => 'これで3×3';

  @override
  String get stepFiveAsThreeBody =>
      'センターとエッジができれば、5×5は大きな3×3です。外側の回転だけで1段ずつ進めます：白クロスとコーナー、中段、黄色の段。5×5にPLLパリティはありません。';

  @override
  String get stepFiveEdgeParity => '最後のエッジのウイングを戻す';

  @override
  String get stepFiveEdgeParityBody =>
      '最後のエッジの外側のウイング2つが入れ替わって、反転して見えることがあります。5×5にある唯一のパリティです。上の段の前に置き、内側の層の手順を1回します。ほかはすべて元に戻ります。';

  @override
  String get stepSixPieces => '6×6のパーツ';

  @override
  String get stepSixPiecesBody =>
      '4×4と同じく6×6にも固定のセンターはなく、16個のセンターピースで各面の色ができます。まずコーナーで色の並びを確かめましょう。エッジにはウイングが4つ、外側2つと内側2つです。';

  @override
  String get stepSixSlices => '深い層を回す';

  @override
  String get stepSixSlicesBody =>
      'ワイド回転は面から2層または3層を動かせます。2層目や3層目の内側の層が、センターとエッジの道具です。';

  @override
  String get stepSixCenterBar => '4つ並びのバー';

  @override
  String get stepSixCenterBarBody =>
      '同じ色のセンターピースを4つ並べ、内側の層で横に並べていきます。層は毎回戻し、面が1色の4×4ブロックになるまで続けます。';

  @override
  String get stepSixCenterSwap => '1つずつ動かす';

  @override
  String get stepSixCenterSwapBody =>
      '3層目を回し、上を回し、戻し、上を戻す。センターピースが1つ動き、完成したセンターは戻ります。バーが入らない最後の2つのセンターで使います。';

  @override
  String get stepSixEdgePair => '4パーツで1本のエッジ';

  @override
  String get stepSixEdgePairBody =>
      '深いワイド層で1つのエッジのウイング4つを前面に集め、短いトリガーで未完成のエッジと入れ替えて、ワイド層を戻します。';

  @override
  String get stepSixEdgeLast => '最後のエッジ';

  @override
  String get stepSixEdgeLastBody =>
      '深いワイド回転とその戻しの間に短いトリガーを入れて最後のエッジをペアにします。完成したエッジはそのままです。ピースを取り出すために完成したエッジをくずさないこと。';

  @override
  String get stepSixAsThree => 'これで3×3';

  @override
  String get stepSixAsThreeBody =>
      '4×4のセンターとペアのエッジができたら、外側の回転だけで6×6を3×3のように1段ずつ解きます。最後にエッジ1つの反転や2つの入れ替わりがあれば、それはパリティでまちがいではありません。';

  @override
  String get stepSixOllParity => 'エッジ1本の反転';

  @override
  String get stepSixOllParityBody =>
      '最後の段でエッジが1つだけ反転して見えたらパリティです。上の段の前に置いて長い手順をします。ウイング4つすべてを反転させ、上の左右のエッジも入れ替えますが、下の2段にはふれません。';

  @override
  String get stepSixPllParity => 'エッジ2本の入れ替わり';

  @override
  String get stepSixPllParityBody =>
      '最後の最後でエッジ2つが入れ替わって見えたら、上の段の前と奥に置き、内側の2回転を使う短い手順をします。2つのエッジのウイング4つがすべて入れ替わります。';

  @override
  String get stageTwoFirstLayer => '下の層を作る';

  @override
  String get stageTwoTopColor => '上面を1色にする';

  @override
  String get stageTwoFinish => 'コーナーを仕上げる';

  @override
  String get explainTwoFirstLayer => '下の層を完成させます。4つのコーナーがそろい、側面の色とも合います。';

  @override
  String get explainTwoTopColor => '下の層を崩さずに、上の4枚のシールが同じ色になるまで回します。';

  @override
  String get explainTwoFinish => '最後のコーナーを正しい位置に移して完成させます。';

  @override
  String get tabSolve => '解く';

  @override
  String get tabScan => 'スキャン';

  @override
  String get tabAcademy => 'アカデミー';

  @override
  String get tabTrain => 'トレーニング';

  @override
  String get openCubeSolver => '3Dキューブとソルバーを開く';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'トレーニング';

  @override
  String get trainSubtitle => '毎日スキルを磨こう。';

  @override
  String get settings => '設定';

  @override
  String get settingsSoundHaptics => 'サウンドと振動';

  @override
  String get settingsSoundHapticsDesc => 'キューブを回すときのクリック音と振動。';

  @override
  String get settingsAnimationSpeed => '標準のアニメーション速度';

  @override
  String get settingsAnimationSpeedDesc => '手順を再生するときにキューブが回る速さ。';

  @override
  String get settingsResetProgress => '進捗をリセット';

  @override
  String get settingsResetProgressDesc => 'アカデミーの完了したレッスンとデイリー連続記録を消去します。';

  @override
  String get resetProgressTitle => 'すべての進捗をリセットしますか？';

  @override
  String get resetProgressBody => '完了したレッスンとデイリー連続記録が消去されます。元に戻せません。';

  @override
  String get resetProgressDone => '進捗をリセットしました。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get settingsPrivacyAds => 'プライバシーと広告';

  @override
  String get settingsPrivacyAdsDesc => '広告の同意設定を確認・変更できます。';

  @override
  String get playbackPrevious => '前へ';

  @override
  String get playbackNext => '次へ';

  @override
  String fastSolveMoves(int count) {
    return '$count手で完成！';
  }

  @override
  String get feedbackTitle => '次のバージョンを一緒に作ろう';

  @override
  String get feedbackBody => '機能の提案や、CubeMentor の次のバージョンへのご意見はこちらまで：';

  @override
  String get feedbackEmailCopied => 'メールアプリが見つからないため、アドレスをクリップボードにコピーしました。';

  @override
  String get adWatchToUnlock => '広告を見る';

  @override
  String get adLoading => '短い動画を読み込み中…';

  @override
  String get adRewardNotEarned => '最後まで視聴するとロックが解除されます。';

  @override
  String get adUnavailableFreePass => '現在視聴できる動画がありません。今回は無料で解除しました。';

  @override
  String get settingsPrivacyAdsError =>
      'プライバシー設定を開けませんでした。しばらくしてからもう一度お試しください。';

  @override
  String get nicknamePromptTitle => 'なんとお呼びしましょうか？';

  @override
  String get nicknamePromptBody => '揃えるたびに、お名前で応援します。';

  @override
  String get nicknameHint => 'お名前またはニックネーム';

  @override
  String get nicknameSave => '保存';

  @override
  String get settingsNickname => 'お名前';

  @override
  String get settingsNicknameNotSet => '未設定 — タップして追加';

  @override
  String celebrateNamed(String name) {
    return 'やったね、$nameさん！';
  }

  @override
  String get celebrateAnon => 'やったね！';

  @override
  String get celebrateCubeSolved => 'キューブ完成！';

  @override
  String get celebrateDailyDone => 'デイリーチャレンジ達成！';

  @override
  String fastSolveRatio(int count, int limit) {
    return '$count / $limit 手';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    return 'どんなスクランブルも$limit手以内で揃えられます';
  }

  @override
  String get patternsWatchVideo => '動画を見る';

  @override
  String get patternsNotNow => '今はしない';

  @override
  String get settingsColorScheme => 'キューブの配色';

  @override
  String get colorSchemeWestern => '西洋配色';

  @override
  String get colorSchemeJapanese => '日本配色';

  @override
  String get colorSchemeWesternDesc => '白の反対が黄、青の反対が緑';

  @override
  String get colorSchemeJapaneseDesc => '白の反対が青、黄の反対が緑';

  @override
  String dailyYourTime(String time) {
    return 'あなたのタイム：$time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'キューブを観察できるのは$seconds秒です。タップでカウントダウン開始。';
  }

  @override
  String get timerInspectTapReady => '準備ができたらタップして解き始めよう';

  @override
  String timerInspectPlus2(int seconds) {
    return 'インスペクションが$seconds秒を超えたため自動でスタート：+2秒のペナルティ';
  }

  @override
  String timerAvgOf(int count) {
    return '$count回の平均';
  }

  @override
  String get timerAvgNote => '平均は最速と最遅のタイムを除いて計算';

  @override
  String get timerPbSub => 'ベストタイム';

  @override
  String get timerPlus2Caption => '+2秒のペナルティ';

  @override
  String get timerDnfCaption => '未完了（DNF）';

  @override
  String get timerDeleteCaption => 'このソルブを削除';

  @override
  String get patternBullsEye => 'ブルズアイ';

  @override
  String get patternFramedCenter => '額縁センター';

  @override
  String get patternBlockCheckerboard => 'ブロック市松模様';

  @override
  String get patternCubeInCubeInCube => 'キューブ・イン・キューブ・イン・キューブ';

  @override
  String get patternUnionJack => 'ユニオンジャック';

  @override
  String get patternKilt => 'キルト';

  @override
  String get patternSixTs => '6つのT';

  @override
  String get patternTwinPeaks => 'ツインピークス';

  @override
  String get patternSpiral => 'スパイラル';

  @override
  String get patternTetris => 'テトリス';

  @override
  String get patternSpots => 'センタードット';

  @override
  String get patternStripes => 'ストライプ';

  @override
  String get patternAnaconda => 'アナコンダ';

  @override
  String get patternZigzag => 'ジグザグ';

  @override
  String get patternFourSpots => '4つのドット';

  @override
  String get patternGreenMamba => 'グリーンマンバ';

  @override
  String get patternPlusMinus => 'プラスマイナス';

  @override
  String guideStepCounter(int current, int total) {
    return 'ステップ $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return '手順 $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return '$current / $total 手目';
  }

  @override
  String get dailyStep1Title => 'ステップ1：キューブを崩す';

  @override
  String get dailyStep2Title => 'ステップ2：キューブを解く';

  @override
  String dailyPersonalBest(String time) {
    return '自己ベスト：$time';
  }

  @override
  String get dailyRecentDays => '最近の記録';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日連続！絶好調！',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'スクランブル完了！さあ解いてみよう';

  @override
  String get dailyCongratsTitle => 'おめでとう！';

  @override
  String dailyCongratsBody(String time) {
    return '今日のチャレンジを$timeで解きました。';
  }

  @override
  String get dailyCongratsDone => 'チャレンジに戻る';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $count種類';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '残り$hours時間';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '残り$minutes分';
  }

  @override
  String get lockedLabel => 'ロック中';

  @override
  String get unlockedLabel => '解放済み';

  @override
  String patternUnlockBody(int hours) {
    return '短い動画を1本見ると、この模様とステップごとのガイドが$hours時間解放されます。';
  }

  @override
  String lessonUnlockBody(int hours) {
    return '短い動画を1本見ると、これから$hours時間、このレッスンを何度でも開けます。';
  }

  @override
  String get bigCubeUnlockTitle => '大型キューブを解く';

  @override
  String bigCubeUnlockBody(int hours) {
    return '4×4–6×6の無料ソルブは使用済みです。短い動画を1本見ると、これから$hours時間、大型キューブを解けます。';
  }

  @override
  String get doubleTurnBadge => '2回回す・180°';

  @override
  String get homeAcademy => 'アカデミー';

  @override
  String get homePatterns => 'クールな模様';

  @override
  String get homePractice => 'タイマー＆デイリー';

  @override
  String get scanChoiceSubtitle => 'どの方法で始めますか？';

  @override
  String get scanChoiceCamera => 'カメラでスキャン';

  @override
  String get scanChoiceCameraDesc => '各面をカメラに映すと解き方がわかります。';

  @override
  String get scanChoice3d => '3Dキューブを開く';

  @override
  String get scanChoice3dDesc => 'バーチャルキューブを回し、崩して、一手ずつ解きましょう。';

  @override
  String get academyAllSizes => 'すべてのサイズ';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total レッスン完了';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total 完了';
  }

  @override
  String get lessonStageConcept => '解説';

  @override
  String get lessonStageExamples => '例';

  @override
  String get lessonStagePractice => '実践';

  @override
  String get lessonStageNext => '次へ / 自由';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'ステージ $index/$total：$name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return '例 $index/$total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return '実践 $index/$total';
  }

  @override
  String get lessonBonusCase => 'ボーナスケース';

  @override
  String get lessonPracticeIntro =>
      '本物のスクランブルです。完成しているのは前のステップだけ。ヒントに沿って、このステップを最後までそろえましょう。';

  @override
  String lessonContinueDesc(String lesson) {
    return 'そのまま「$lesson」へ進みます。';
  }

  @override
  String get lessonFreePractice => '自由練習';

  @override
  String get lessonFreePracticeDesc => '崩れた3Dキューブを、最初からこのステップまで自分でそろえます。';

  @override
  String freePracticeBanner(String topic) {
    return '自由に練習：最初から「$topic」までキューブをそろえよう！';
  }

  @override
  String get pieceColorSeparator => '・';

  @override
  String cueFaceTurn(String face) {
    return '$faceのセンターの面を矢印の向きに回します。センターは動かず、まわりのパーツだけが移動します。';
  }

  @override
  String cueTrigger(String front) {
    return '右手の手順、$frontを手前に：右面を上へ、上面を左へ、右面を下へ、上面を右へ戻します。';
  }

  @override
  String get cueTriggerBack => '6回続けると、キューブはぴったり元の状態に戻ります。6は魔法の数！';

  @override
  String cueSliceInner(String face) {
    return '$faceの面のとなりの内側の層だけを回します。面そのものは動かないので、センターが分かれます。';
  }

  @override
  String cueSliceWide(String face) {
    return 'ワイドムーブ：$faceの面ととなりの内側の層が、1枚の厚い層のように一緒に回ります。';
  }

  @override
  String cueTurnCube(String top, String front) {
    return '$topのセンターが上、$frontのセンターが手前になるよう、キューブ全体を持ち替えます。';
  }

  @override
  String get cueTurnTop => '次の手順の準備として、矢印のとおり上の層だけを回します。';

  @override
  String get cueAlignTop => '最後の一手：上の層を回して色をそろえます。完成！';

  @override
  String cueCrossTop(String piece, String center) {
    return '$pieceのエッジは上の層にあります。$centerのセンターの真上に来るまで上を回し、その面を2回回して下ろします。';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$pieceのエッジが中段にはまっています。上に出して$centerのセンターの上にそろえ、下ろします。';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$pieceのエッジは位置は合っていますが反転しています（白が横向き）。いったん外して白を上にして上の段に出し、$centerのセンターの横へ下ろします。';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOPでは下の面も回してかまいません。$pieceのエッジを下ろし、下を回して$centerのセンターにそろえます。';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return '$pieceのコーナーが、$aと$bの面の間にある自分の場所の真上に来るまで上を回します。正しい向きで入るまで右手の手順をくり返します。';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$pieceのコーナーは位置は合っていますがねじれています。1回のトリガーで外に出し（代わりに黄色いコーナーが入ります）、白が下を向いて戻るまで同じ場所でくり返します。キューブを回して追いかけないこと。';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return '$pieceのエッジが$aのセンターとそろうまで上を回し、右下の$aと$bの間へ入れます。';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return '$pieceのエッジが$aのセンターとそろうまで上を回し、左下の$aと$bの間へ入れます。';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$pieceのエッジは位置は合っていますが反転しています。そこに黄色いエッジを入れて上に押し出し、$aと$bの間に入れ直します。';
  }

  @override
  String cueYellowLine(String front) {
    return '黄色の一直線：線が左右に伸びるよう上を回し、$frontを手前にしたまま黄色十字の手順を回します。';
  }

  @override
  String cueYellowL(String front) {
    return '黄色のL字：L字が左奥を向くよう上を回し、$frontを手前にしたまま手順を回します。一直線に変わります。';
  }

  @override
  String cueYellowDot(String front) {
    return '黄色はセンターだけ：点です。$frontを手前にして手順を1回するとL字になります。点は3回かかることもあるので、続けましょう。';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return '$pieceのエッジが$centerのセンターとそろうまで上を回します。';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'そろった2つのエッジが奥と右にあります。$frontを手前にして入れ替えの手順を回すと、手前と左のエッジが入れ替わります。';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'そろったエッジが向かい合っています。$frontを手前にして入れ替えを1回回すと、となり合う2つがそろいます。';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$pieceのコーナーはもう自分の場所にあります。右手前に置いたまま、$frontを手前にして残り3つのコーナーを入れ替えます。';
  }

  @override
  String cueCornersNone(String front) {
    return 'まだ黄色のコーナーがどれも自分の場所にありません。$frontを手前にして1回入れ替えると、1つが正しい場所に入ります。';
  }

  @override
  String cueTwistCorner(String piece) {
    return '右手前の$pieceのコーナーを回します。黄色が上を向くまで下のトリガーを2回ずつくり返します。下の段は今くずれて見えますが、最後のコーナーで元に戻ります！';
  }

  @override
  String cueTwistFour(String piece) {
    return '今回は$pieceのコーナーに4回必要です。続けましょう。黄色は必ず2回か4回で上を向きます。';
  }

  @override
  String get cueTwistNext =>
      '上の層だけを回して、次のねじれたコーナーを右手前へ持ってきます。今はキューブ全体を持ち替えないで！';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return '上で$pieceのコーナーと$edgeのエッジをペアにし、$aと$bの間のスロットに入れます。';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$pieceのコーナーが違うエッジと一緒にスロットにはまっています。まず上に出してから、ペアを作って入れます。';
  }

  @override
  String cueOllSune(String front) {
    return '$frontを手前にしてSuneを回し、黄色のコーナーを上に向けます。';
  }

  @override
  String cueOllSuneAgain(String front) {
    return '今回はSune 1回では足りません。上を回して、$frontを手前にもう一度Suneを回します。';
  }

  @override
  String cuePllCorners(String front) {
    return '2つのコーナーを入れ替えます。そろったペア（ヘッドライト）を左に、$frontを手前にしてT-permを回します。';
  }

  @override
  String cuePllEdges(String piece) {
    return 'コーナーは完成です。$pieceのエッジを奥に置いたまま、残り3つのエッジをU-permで入れ替えます。';
  }

  @override
  String get cuePllNoEdge =>
      '上のエッジはまだどれもセンターとそろっていません。どの向きからでもU-permを1回回すと、1つがそろいます。';

  @override
  String cueTwoSwapAdjacent(String front) {
    return '上のとなり合う2つのコーナーを入れ替えます。そろったペアを左に、$frontを手前にして入れ替えの手順を回します。';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return '入れ替える2つのコーナーは対角にあります。$frontを手前にして対角入れ替えを回します。';
  }

  @override
  String cueCenterCycle(String color) {
    return 'はぐれた$colorのセンターパーツを、センターの3-サイクルで戻します：内側の層、上、内側の層、そしてすべて元へ。';
  }

  @override
  String cueCenterBar(String color) {
    return '$colorのセンターパーツが1列まるごと違う面にあります。内側の層で持ち上げ、上を回して、元の面へ戻します。';
  }

  @override
  String cueEdgePair(String piece) {
    return '$pieceのエッジの2つのパーツをペアにします：並べて内側の層を回し、右手の手順でペアでないエッジと入れ替え、層を戻します。';
  }

  @override
  String cueEdgeLast(String piece) {
    return '最後のエッジ：$pieceのエッジを最後の2エッジの手順でペアにします。完成したエッジはくずれません。';
  }

  @override
  String cueParityOll(String front) {
    return 'OLLパリティ：上のエッジが1つ反転しています。3×3では起こりません。$frontを手前にしてそのエッジを前に置き、通常のOLLの前にパリティの手順をします。';
  }

  @override
  String get cueParityPll =>
      'PLLパリティ：上のエッジが2つ入れ替わっています。3×3では起こりません。前と奥に置いてパリティの入れ替えをし、上の段を合わせます。';

  @override
  String cueParityFive(String front) {
    return 'エッジパリティ：1つのエッジの外側のウイング2つが入れ替わっています。5×5の唯一のパリティです。$frontを手前にしてそのエッジを前に置き、手順を1回します。';
  }

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingNext => '次へ';

  @override
  String get onboardingStart => 'はじめる';

  @override
  String get onboardingWhatTitle => 'キューブの頼れる相棒';

  @override
  String get onboardingWhatBody =>
      'CubeMentor は 2×2 から 6×6 までのキューブを解く・学ぶ・練習するのを、完全オフラインでサポートします。';

  @override
  String get onboardingScanTitle => '数秒でスキャンして解く';

  @override
  String get onboardingScanBody =>
      '各面をカメラに見せる（または色をタップで入力する）だけで、3D の解法を1手ずつたどれます。';

  @override
  String get onboardingLearnTitle => '学んで、遊ぶ';

  @override
  String get onboardingLearnBody =>
      'アカデミーで段ごとにそろえる解法をマスターしたら、3Dプレイグラウンドで自由に回して、崩して、解いてみましょう。';

  @override
  String get scanChoiceManualDesc => '各面の色をステッカーごとにタップで入力します。';

  @override
  String get scanTryAgain => 'もう一度試す';

  @override
  String get scanEditManually => '色を手動で直す';

  @override
  String get scanLightingHint => '面をグリッドの中央に合わせ、明るく均一な光で反射を避けてください。';

  @override
  String get crownExplain => '段とはキューブの横一層のことです。1段目は下の白い段、2段目は中段、3段目は上の黄色い段です。';

  @override
  String get lessonObjectiveHeading => '学習の目標';

  @override
  String get dirRowTop => '前面のいちばん上の列';

  @override
  String get dirRowBottom => '前面のいちばん下の列';

  @override
  String get dirColumnRight => '前面の右の列';

  @override
  String get dirColumnLeft => '前面の左の列';

  @override
  String get solveChoiceTitle => 'どの方法で解きますか？';

  @override
  String get solveChoiceFastDesc => 'いちばん短い解法を1手ずつ。';

  @override
  String get solveChoiceGuidedDesc => '段ごとにそろえる解法を一歩ずつ学びます。';

  @override
  String get guidedSolvedTitle => '完成！';

  @override
  String get guidedSolvedBody => 'すべてのステップをたどってキューブを完成させました。';

  @override
  String get solveAgain => 'もう一度解く';

  @override
  String get backToHome => 'ホームに戻る';

  @override
  String get dailyStatTime => '今日のタイム';

  @override
  String get dailyStatBest => '自己ベスト';

  @override
  String get dailyStatStreak => '現在の連続記録';

  @override
  String get dailyStatBestStreak => '最長連続記録';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get settingsPrivacyPolicyDesc => 'CubeMentor が保存するものと広告が使うもの。';

  @override
  String get privacyIntro =>
      'CubeMentor はアカウントも独自のサーバーも使わずに動作します。このページでは、端末に残るものと広告パートナーが使うものを説明します。';

  @override
  String get privacyDataTitle => 'データは端末の中だけに';

  @override
  String get privacyDataBody =>
      '言語、設定、レッスンの進み具合、タイム、デイリーの連続記録はこの端末にだけ保存されます。サーバーがないため、私たちが受け取ることはありません。アプリを削除すると消去されます。';

  @override
  String get privacyCameraTitle => 'カメラ';

  @override
  String get privacyCameraBody =>
      'カメラはキューブをスキャンしている間だけ使われます。ステッカーの色を読み取るため映像は端末内で解析され、写真や動画が保存・送信されることはありません。';

  @override
  String get privacyAdsTitle => '広告';

  @override
  String get privacyAdsBody =>
      'このアプリは Google AdMob の広告を表示します。Google のプライバシーポリシーに記載のとおり、Google は広告の表示と効果測定のために端末の識別子や広告とのやり取りのデータを使うことがあります。法律で必要な地域では先に同意を求め、設定から変更できます。';

  @override
  String get privacyContactTitle => 'お問い合わせ';

  @override
  String privacyContactBody(String email) {
    return 'プライバシーについてのご質問は $email までお寄せください。';
  }
}
