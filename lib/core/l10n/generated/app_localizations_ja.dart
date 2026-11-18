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
  String get comingSoon => '近日公開';

  @override
  String get comingSoonMessage => 'この機能は今後のアップデートで追加されます。';

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
  String get nextStep => '次へ';

  @override
  String get previousStep => '前へ';

  @override
  String get playbackTitle => '再生';

  @override
  String get playbackEmpty => 'キューブをスクランブルすると解法を再生できます。';

  @override
  String playbackProgress(int current, int total) {
    return 'ステップ $current/$total';
  }

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
  String get solveChooseMethod => 'どの方法で解きますか？';

  @override
  String get solveFast => '高速で解く';

  @override
  String get solveFastDesc => 'Kociembaの2フェーズアルゴリズム · 約20手';

  @override
  String get solveLearn => '一歩ずつ学ぶ';

  @override
  String get solveLearnDesc => '解説付きの初心者向けLBL法（層ごと）';

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
  String get guideSwipeHint => '光っている層を矢印の方向にスワイプするか、「次へ」をタップしてください。';

  @override
  String get guideRotateHint => '矢印のとおりにキューブ全体を持ち替えて、「次へ」をタップしてください。';

  @override
  String get guideWrongMove => 'ハイライトされた矢印に従ってください';

  @override
  String get guideExit => 'ガイドを終了';

  @override
  String get replayStep => 'ステップを再生';

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
  String get phaseLblOrient => 'キューブを持つ';

  @override
  String get phaseLblCross => '白クロス';

  @override
  String get phaseLblCorners => '白コーナー';

  @override
  String get phaseLblMiddle => '中段';

  @override
  String get phaseLblYellowCross => '黄クロス';

  @override
  String get phaseLblYellowEdges => '黄エッジ';

  @override
  String get phaseLblYellowCorners => '黄コーナーの位置合わせ';

  @override
  String get phaseLblYellowCornersOrient => '黄コーナーの向き合わせ';

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
  String get lessonDone => '完了';

  @override
  String lessonPartOf(int index, int total) {
    return 'パート $index/$total';
  }

  @override
  String get lessonBack => '戻る';

  @override
  String get lessonNext => '次へ';

  @override
  String get lessonFinish => 'レッスンを終える';

  @override
  String get lessonComplete => 'レッスン完了！';

  @override
  String get lessonNextLesson => '次のレッスン';

  @override
  String get lessonBackToAcademy => 'アカデミーに戻る';

  @override
  String get lessonShowMe => 'お手本';

  @override
  String get lessonTryIt => 'あなたの番です。矢印の層をスワイプするか、「お手本」をタップしてください。';

  @override
  String get lessonLookAround => '背景をドラッグすると、キューブをいろいろな角度から見られます。';

  @override
  String get lessonDemoDone => 'いいですね！「次へ」をタップして進みましょう。';

  @override
  String holdPrompt(String top, String front) {
    return '$topのセンターを上、$frontのセンターを手前にしてキューブを持ちます。';
  }

  @override
  String get trackBeginner => '3×3初心者（LBL法）';

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
  String get solveFastBigDesc => 'リダクション：センター、エッジ、パリティの後にKociemba';

  @override
  String get solveLearnBigDesc => 'リダクションの後、初心者向けLBL法で仕上げ';

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
  String get timerInspecting => 'インスペクション：長押しして離すとスタート';

  @override
  String get timerTapToInspect => 'タップして15秒のインスペクションを開始';

  @override
  String get timerInspectionToggle => '15秒インスペクション';

  @override
  String get timerNewScramble => '新しいスクランブル';

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
  String get lessonCross => '白クロス';

  @override
  String get lessonCrossDesc => '下面に白い十字を作ります。';

  @override
  String get stepCrossGoal => 'ゴール';

  @override
  String get stepCrossGoalBody =>
      '黄色を上にして持ちます。4つの白いエッジが下の白センターを囲み、それぞれの側面の色が隣のセンターと一致した状態を目指します。';

  @override
  String get stepCrossTop => '上にあるエッジ';

  @override
  String get stepCrossTopBody =>
      '上面にある白いエッジを探します。側面の色が同じ色のセンターの上に来るまで上の層を回し、その面を2回回して下ろします。';

  @override
  String get stepCrossMiddle => '中段にあるエッジ';

  @override
  String get stepCrossMiddleBody =>
      '中段にあるエッジは、まず上に出します。その側面を上に回し、上の層をずらしてから側面を戻せば、クロスは崩れません。そのあと上から入れます。';

  @override
  String get lessonCorners => '白コーナー';

  @override
  String get lessonCornersDesc => '1段目を完成させます。';

  @override
  String get stepCornersInsert => '入る場所の真上へ';

  @override
  String get stepCornersInsertBody =>
      '白いコーナーが、その色の入る場所（右手前）の真上に来るまで上の層を回します。R U R\' U\'で下に入ります。';

  @override
  String get stepCornersRepeat => '手順をくり返す';

  @override
  String get stepCornersRepeatBody =>
      '白の向きが違うときは、同じ場所でR U R\' U\'をくり返します。どのコーナーも最大5回で完成します。';

  @override
  String get lessonMiddle => '中段';

  @override
  String get lessonMiddleDesc => '中段の4つのエッジを入れます。';

  @override
  String get stepMiddleRight => '右に入れる';

  @override
  String get stepMiddleRightBody =>
      '上のエッジを前面のセンターにそろえます。上側の色が右のセンターと同じなら、U R U\' R\' U\' F\' U Fで入れます。';

  @override
  String get stepMiddleLeft => '左に入れる';

  @override
  String get stepMiddleLeftBody =>
      '上側の色が左のセンターと同じなら、左右反転の手順U\' L\' U L U F U\' F\'を使います。';

  @override
  String get lessonLastLayer => '黄クロスとエッジ';

  @override
  String get lessonLastLayerDesc => '上面に十字を作り、エッジをそろえます。';

  @override
  String get stepYellowCross => 'ひとつの手順';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\'で、黄色の点はL字に、L字は一直線に、一直線は十字に変わります。L字は左奥に、一直線は横向きにして持ちます。';

  @override
  String get stepYellowEdges => 'エッジをそろえる';

  @override
  String get stepYellowEdgesBody =>
      '2つのエッジがセンターとそろうまで上の層を回します。1つが奥、1つが右にある状態で、R U R\' U R U2 R\' Uを使うと残り2つが入れ替わります。';

  @override
  String get lessonLastCorners => '黄コーナー';

  @override
  String get lessonLastCornersDesc => '最後のコーナーの位置と向きをそろえます。';

  @override
  String get stepPlaceCorners => '位置をそろえる';

  @override
  String get stepPlaceCornersBody =>
      'すでに正しい位置にあるコーナーを右手前に持ちます。U R U\' L\' U R\' U\' Lで残りの3つが動きます。4つそろうまでくり返します。';

  @override
  String get stepTwistCorners => '向きをそろえる';

  @override
  String get stepTwistCornersBody =>
      '未完成のコーナーを右手前にしてR\' D\' R Dを黄色が上を向くまでくり返し、次のコーナーは上の層だけを回して持ってきます。下の層は最後まで崩れて見えますが、そのまま続けてください。';

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
      '2×2はエッジとセンターのない3×3です。好きな色を選んで下面にそろえ、隣り合うコーナーの側面の色を合わせます。';

  @override
  String get stepTwoCorner => 'コーナーを入れる';

  @override
  String get stepTwoCornerBody =>
      '3×3の白コーナーと同じです。コーナーを入る場所の上に運び、はまるまでR U R\' U\'をくり返します。';

  @override
  String get lessonTwoOll => '上面の向きをそろえる';

  @override
  String get lessonTwoOllDesc => 'スーンを使ったOrtega法のOLL。';

  @override
  String get stepTwoSune => 'またスーン';

  @override
  String get stepTwoSuneBody =>
      'スーンは2×2でも上面を黄色にします。Ortega法では短い7つのケースを覚えますが、その多くはスーンとその反転で対応できます。';

  @override
  String get lessonTwoPbl => '上下の層の位置をそろえる';

  @override
  String get lessonTwoPblDesc => 'コーナーを入れ替えて完成させます。';

  @override
  String get stepTwoAdjacent => '隣同士の入れ替え';

  @override
  String get stepTwoAdjacentBody => '上の隣り合う2つのコーナーを入れ替えるときは、それを右側にしてTパームを使います。';

  @override
  String get stepTwoDiagonal => '対角の入れ替え';

  @override
  String get stepTwoDiagonalBody => '対角の位置にある2つのコーナーはYパームで入れ替えます。';

  @override
  String get lessonBigIntro => '大型キューブのパーツ';

  @override
  String get lessonBigIntroDesc => 'センター、ウイング、スライス。';

  @override
  String get stepBigPieces => '固定センターがない';

  @override
  String get stepBigPiecesBody =>
      '4×4では各面に動く4つのセンターパーツがあり、各エッジは2つのウイングでできています。リダクションでそれらをまとめ、3×3と同じように扱えるようにします。';

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
      'このコミュテーターはセンターパーツをちょうど3つだけ動かし、ほかには触れません。だから完成したセンターは崩れません。';

  @override
  String get lessonBigEdges => 'エッジのペアリング';

  @override
  String get lessonBigEdgesDesc => 'ウイングをつなげてエッジにします。';

  @override
  String get stepBigEdgePair => 'ペアにして戻す';

  @override
  String get stepBigEdgePairBody =>
      'Uw\'で同じ色のウイング2つを並べ、R U R\' F R\' F\' Rでペアになっていないエッジと入れ替え、Uwでセンターを元に戻します。';

  @override
  String get lessonBigParity => 'パリティ';

  @override
  String get lessonBigParityDesc => '偶数キューブのOLLパリティとPLLパリティ。';

  @override
  String get stepBigOllParity => 'OLLパリティ';

  @override
  String get stepBigOllParityBody =>
      'エッジが1つだけ反転した状態は3×3ではありえません。偶数キューブでは、この手順で上面手前のエッジを元に戻します。上の層の残りが崩れることがありますが、3×3の最後のステップでどのみち直ります。';

  @override
  String get stepBigPllParity => 'PLLパリティ';

  @override
  String get stepBigPllParityBody =>
      '最後の最後でエッジ2つが入れ替わっている？2R2 U2 2R2 Uw2 2R2 Uw2で上面の手前と奥のエッジを入れ替えます。';
}
