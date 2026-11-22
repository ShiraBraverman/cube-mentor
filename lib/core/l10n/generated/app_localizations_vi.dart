// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Quét, giải và làm chủ mọi khối Rubik từ 2×2 đến 6×6.';

  @override
  String get chooseCubeSize => 'Chọn khối Rubik';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Nhập môn';

  @override
  String get cubeLevel3 => 'Cổ điển';

  @override
  String get cubeLevel4 => 'Nâng cao';

  @override
  String get cubeLevel5 => 'Chuyên gia';

  @override
  String get cubeLevel6 => 'Bậc thầy';

  @override
  String get cubeComingSoon => 'Sắp có khối mới';

  @override
  String get carouselPrevious => 'Khối trước';

  @override
  String get carouselNext => 'Khối tiếp theo';

  @override
  String get chooseMode => 'Bạn muốn làm gì?';

  @override
  String get modePlayground => 'Sân chơi 3D';

  @override
  String get modePlaygroundDesc =>
      'Xoay các tầng, xáo trộn và phát lại nước xoay trong 3D.';

  @override
  String get modeScanSolve => 'Quét & Giải';

  @override
  String get modeScanSolveDesc =>
      'Quét khối Rubik bằng camera và nhận lời giải.';

  @override
  String get modeAcademy => 'Học viện';

  @override
  String get modeAcademyDesc => 'Học từng bước với các bài học tương tác.';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageSearch => 'Tìm ngôn ngữ';

  @override
  String get languageNoResults => 'Không có ngôn ngữ nào khớp với tìm kiếm.';

  @override
  String playgroundTitle(int size) {
    return 'Sân chơi $size×$size';
  }

  @override
  String get scramble => 'Xáo trộn';

  @override
  String get reset => 'Đặt lại';

  @override
  String get undo => 'Hoàn tác';

  @override
  String get speed => 'Tốc độ';

  @override
  String get xray => 'Nhìn xuyên';

  @override
  String get prime => 'Ngược';

  @override
  String get wide => 'Tầng kép';

  @override
  String layer(int index) {
    return 'Tầng $index';
  }

  @override
  String get cubeRotations => 'Xoay cả khối';

  @override
  String get play => 'Phát';

  @override
  String get pause => 'Tạm dừng';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nước',
      zero: 'Chưa có nước nào',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Đã giải';

  @override
  String get scrambled => 'Đã xáo trộn';

  @override
  String get orbitHint => 'Kéo một hàng để xoay · Kéo nền để xoay góc nhìn';

  @override
  String get notationPad => 'Bảng ký hiệu';

  @override
  String get solve => 'Giải';

  @override
  String get solving => 'Đang giải…';

  @override
  String get solveFast => 'Giải nhanh';

  @override
  String get solveLearn => 'Học từng bước';

  @override
  String get solveModeGuided => 'Có hướng dẫn (3 vương miện)';

  @override
  String get solveModeFast => 'Nhanh (tối ưu)';

  @override
  String solveUnavailable(int size) {
    return 'Bộ giải $size×$size sẽ có trong bản cập nhật sau.';
  }

  @override
  String get solveAlreadySolved => 'Khối Rubik đã được giải.';

  @override
  String solveFailed(String reason) {
    return 'Không thể giải khối này ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'Bộ máy giải không khả dụng trên thiết bị này.';

  @override
  String get solveComplete => 'Đã giải xong! Làm tốt lắm.';

  @override
  String solveSummary(int count) {
    return '$count nước';
  }

  @override
  String get nextMove => 'Nước tiếp theo';

  @override
  String get previousMove => 'Nước trước';

  @override
  String get halfTurnHalfway =>
      'Tốt lắm, được nửa đường rồi! Xoay thêm một lần nữa để thành nước xoay kép (180°).';

  @override
  String get wideTurnInner =>
      'Tuyệt! Giờ vuốt tầng bên trong liền kề để hoàn thành nước xoay kép.';

  @override
  String get wideTurnOuter =>
      'Tuyệt! Giờ vuốt tầng ngoài bên cạnh để hoàn thành nước xoay kép.';

  @override
  String get wideTurnMore =>
      'Tuyệt! Tiếp tục vuốt từng tầng đang sáng để hoàn thành nước xoay kép.';

  @override
  String get guideSwipeHint =>
      'Vuốt tầng đang sáng theo hướng mũi tên, hoặc chạm Tiếp.';

  @override
  String get guideRotateHint => 'Xoay cả khối như mũi tên chỉ: chạm Tiếp.';

  @override
  String get guideWrongMove => 'Làm theo mũi tên được tô sáng';

  @override
  String get guideExit => 'Thoát hướng dẫn';

  @override
  String get colorWhite => 'trắng';

  @override
  String get colorYellow => 'vàng';

  @override
  String get colorGreen => 'xanh lá';

  @override
  String get colorBlue => 'xanh dương';

  @override
  String get colorRed => 'đỏ';

  @override
  String get colorOrange => 'cam';

  @override
  String get phaseOptimal2x2 => 'Lời giải tối ưu';

  @override
  String get phaseKociemba1 => 'Giai đoạn 1 · Định hướng các viên';

  @override
  String get phaseKociemba2 => 'Giai đoạn 2 · Hoàn thành khối';

  @override
  String get phaseLblCross => 'Dấu cộng trắng';

  @override
  String get phaseLblCorners => 'Các góc vương miện thứ nhất';

  @override
  String get phaseLblMiddle => 'Các cạnh tầng giữa';

  @override
  String get phaseLblYellowCross => 'Dấu cộng vàng';

  @override
  String get phaseLblYellowEdges => 'Căn các cạnh của dấu cộng vàng';

  @override
  String get phaseLblYellowCorners => 'Đặt đúng vị trí các góc vàng';

  @override
  String get phaseLblYellowCornersOrient => 'Định hướng các góc vàng';

  @override
  String get crownFirst => 'Vương miện thứ nhất';

  @override
  String get crownSecond => 'Vương miện thứ hai';

  @override
  String get crownThird => 'Vương miện thứ ba';

  @override
  String get crownFirstGoal => 'Mặt trắng và tầng thứ nhất';

  @override
  String get crownSecondGoal => 'Tầng giữa';

  @override
  String get crownThirdGoal => 'Mặt vàng và tầng cuối';

  @override
  String get subStepGoal11 =>
      'Tạo dấu cộng trắng sao cho mỗi cạnh trắng cũng khớp màu với tâm bên cạnh.';

  @override
  String get subStepGoal12 =>
      'Đưa 4 góc trắng vào đúng ô để hoàn thành mặt trắng và cả vòng thứ nhất.';

  @override
  String get subStepGoal21 =>
      'Đưa 4 cạnh tầng giữa vào mà không phá vương miện thứ nhất.';

  @override
  String get subStepGoal31 => 'Tạo dấu cộng vàng ở tầng cuối.';

  @override
  String get subStepGoal32 =>
      'Đổi chỗ các cạnh của dấu cộng vàng cho đến khi mỗi cạnh khớp với tâm bên cạnh.';

  @override
  String get subStepGoal33 =>
      'Đưa 4 góc vàng về đúng vị trí, kể cả khi chúng vẫn còn bị xoắn.';

  @override
  String get subStepGoal34 =>
      'Xoắn từng góc vàng tại chỗ cho đến khi mọi miếng dán khớp và khối được giải.';

  @override
  String get explainOptimal2x2 =>
      'Lời giải ngắn nhất có thể, tìm được bằng cách duyệt mọi trạng thái của khối 2×2.';

  @override
  String get explainKociemba1 =>
      'Định hướng mọi viên và gom các cạnh tầng giữa vào tầng giữa.';

  @override
  String get explainKociemba2 =>
      'Hoàn thành chỉ bằng U, D và các nước xoay nửa vòng, giữ nguyên định hướng đó.';

  @override
  String get explainLblOrient => 'Xoay cả khối để tâm trắng hướng xuống dưới.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Đưa cạnh $piece xuống cạnh tâm trắng, khớp với màu mặt bên.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'Góc $piece đang kẹt sai chỗ. Đưa nó lên tầng trên bằng R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Xoay tầng trên cho đến khi góc $piece nằm ngay trên ô của nó.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Lặp lại R U R\' U\' cho đến khi góc $piece vào đúng chỗ.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'Cạnh $piece nằm ở tầng giữa nhưng sai. Đẩy nó lên tầng trên.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Xoay tầng trên để màu mặt bên của cạnh $piece khớp với tâm.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Đưa cạnh $piece sang phải: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Đưa cạnh $piece sang trái: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Xoay tầng trên để đặt hình vàng đúng vị trí cho công thức tiếp theo.';

  @override
  String get explainLblYellowCrossAlg =>
      'Tạo dấu cộng vàng bằng F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Xoay tầng trên để các cạnh vàng thẳng hàng với tâm của chúng.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Đổi chỗ các cạnh vàng bằng R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Hoán vị vòng các góc vàng về đúng chỗ bằng U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Xoay tầng trên để đưa góc vàng chưa giải tiếp theo về phía trước bên phải.';

  @override
  String get explainLblCornerTwist =>
      'Lặp lại R\' D\' R D cho đến khi màu vàng hướng lên. Tầng dưới sẽ tự trở lại ở cuối.';

  @override
  String get explainLblFinalAlign => 'Xoay tầng trên để hoàn thành khối.';

  @override
  String scanTitle(int size) {
    return 'Quét $size×$size';
  }

  @override
  String get scanManualInput => 'Nhập màu thủ công';

  @override
  String get scanUseCamera => 'Quét bằng camera';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Mặt $current/$total';
  }

  @override
  String get faceUp => 'Mặt trên';

  @override
  String get faceRight => 'Mặt phải';

  @override
  String get faceFront => 'Mặt trước';

  @override
  String get faceDown => 'Mặt dưới';

  @override
  String get faceLeft => 'Mặt trái';

  @override
  String get faceBack => 'Mặt sau';

  @override
  String get scanHintFront =>
      'Cầm khối với một mặt bất kỳ hướng về phía bạn. Đó là mặt trước: giữ nguyên mặt trên trong suốt quá trình quét.';

  @override
  String get scanHintRight =>
      'Từ mặt trước, xoay cả khối sang trái một lần để mặt phải hướng về bạn.';

  @override
  String get scanHintBack => 'Từ mặt trước, xoay cả khối sang trái hai lần.';

  @override
  String get scanHintLeft => 'Từ mặt trước, xoay cả khối sang phải một lần.';

  @override
  String get scanHintUp =>
      'Từ mặt trước, nghiêng mặt trên về phía bạn để nó hướng vào camera.';

  @override
  String get scanHintDown =>
      'Từ mặt trước, nghiêng mặt dưới về phía bạn để nó hướng vào camera.';

  @override
  String get scanAlignHint => 'Đặt mặt khối lấp đầy lưới, rồi chạm nút chụp.';

  @override
  String get scanCapture => 'Chụp mặt';

  @override
  String get scanTurnLeft => 'Xoay cả khối sang trái';

  @override
  String get scanTurnRight => 'Xoay cả khối sang phải';

  @override
  String get scanTipTop => 'Nghiêng mặt trên về phía bạn';

  @override
  String get scanTipBottom => 'Nghiêng mặt dưới về phía bạn';

  @override
  String get scanGlareTip =>
      'Phát hiện lóa sáng: nghiêng khối một chút, hoặc giơ điện thoại che bớt đèn trên đầu.';

  @override
  String get scanDimTip => 'Quá tối: hãy ra chỗ sáng hơn hoặc bật đèn pin.';

  @override
  String get scanTorch => 'Đèn pin';

  @override
  String get scanGuideLabel =>
      'Hướng dẫn quét: các mặt đã quét hiển thị màu. Chạm vào mặt đã quét để quét lại.';

  @override
  String get scanTapToRescan => 'Chạm vào mặt đã quét để quét lại.';

  @override
  String get scanCameraMissing => 'Không tìm thấy camera trên thiết bị này.';

  @override
  String get scanCameraDenied =>
      'Quyền truy cập camera bị từ chối. Bạn vẫn có thể nhập màu thủ công.';

  @override
  String get scanCameraFailed => 'Không thể khởi động camera.';

  @override
  String get scanAllGood => 'Tất cả miếng dán đều có vẻ đúng.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miếng dán có vẻ sai',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Có gì đó chưa khớp';

  @override
  String scanIssueColors(int count) {
    return 'Mỗi màu phải xuất hiện đúng $count lần.';
  }

  @override
  String get scanIssueCenters => 'Có hai tâm cùng màu.';

  @override
  String get scanIssuePieces =>
      'Các miếng dán này tạo thành những viên không có trên khối thật.';

  @override
  String get scanIssueTwist =>
      'Một góc bị xoắn. Hãy kiểm tra các miếng dán ở góc.';

  @override
  String get scanIssueFlip =>
      'Một cạnh bị lật. Hãy kiểm tra các miếng dán ở cạnh.';

  @override
  String get scanIssueParity => 'Hai viên có vẻ bị đổi chỗ.';

  @override
  String get scanIssueUnavailable =>
      'Không thể kiểm tra màu trên thiết bị này.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miếng dán khó nhận diện: hãy xem lại nhanh.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Chạm vào miếng dán để đổi màu · Nhấn giữ để mở bảng màu';

  @override
  String get scanRescanFace => 'Quét lại một mặt';

  @override
  String get scanCancelRescan => 'Quay lại phần màu';

  @override
  String get scanPaletteTitle => 'Chọn màu';

  @override
  String get scanOpen3d => 'Mở trong 3D';

  @override
  String get scanRestart => 'Bắt đầu lại';

  @override
  String get modeTimer => 'Đồng hồ speedcube';

  @override
  String get modeTimerDesc =>
      'Xáo trộn, quan sát, trung bình và kỷ lục cá nhân.';

  @override
  String get modeDaily => 'Thử thách hằng ngày';

  @override
  String get modeDailyDesc =>
      'Mỗi ngày một bài xáo trộn mới. Giữ vững chuỗi ngày của bạn.';

  @override
  String get modePatterns => 'Thư viện hoa văn';

  @override
  String get modePatternsDesc =>
      'Bàn cờ, superflip và nhiều hơn nữa, trình diễn trong 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chuỗi $count ngày',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Học tiếp';

  @override
  String get startLearning => 'Bắt đầu học';

  @override
  String lessonOf(int index, int total) {
    return 'Bài $index/$total';
  }

  @override
  String get academyAllDone => 'Đã hoàn thành mọi bài học!';

  @override
  String get academyTitle => 'Học viện';

  @override
  String academyProgress(int done, int total) {
    return 'Đã hoàn thành $done/$total bài học';
  }

  @override
  String get lessonAdvanced => 'Nâng cao';

  @override
  String lessonPartOf(int index, int total) {
    return 'Phần $index/$total';
  }

  @override
  String get lessonNext => 'Tiếp';

  @override
  String get lessonPrevious => 'Trước';

  @override
  String get lessonFinish => 'Kết thúc bài học';

  @override
  String get lessonComplete => 'Hoàn thành bài học!';

  @override
  String get lessonNextLesson => 'Bài tiếp theo';

  @override
  String get lessonBackToAcademy => 'Về Học viện';

  @override
  String get lessonTryIt =>
      'Đến lượt bạn: vuốt tầng mà mũi tên chỉ, hoặc chạm Tiếp.';

  @override
  String get lessonLookAround => 'Kéo nền để nhìn khối từ mọi phía.';

  @override
  String get lessonDemoDone => 'Tốt lắm! Chạm Tiếp để tiếp tục.';

  @override
  String holdPrompt(String top, String front) {
    return 'Cầm khối sao cho tâm $top ở trên và tâm $front hướng về phía bạn.';
  }

  @override
  String get trackBeginner => '3×3 cơ bản: 3 vương miện';

  @override
  String get trackCfop => 'Nhập môn CFOP';

  @override
  String get trackTwoByTwo => '2×2 cơ bản & Ortega';

  @override
  String get trackBigCubes => 'Khối lớn: rút gọn & parity';

  @override
  String moveSentence(String layer, String direction) {
    return 'Xoay $layer $direction';
  }

  @override
  String get moveFaceR => 'mặt phải';

  @override
  String get moveFaceL => 'mặt trái';

  @override
  String get moveFaceU => 'mặt trên';

  @override
  String get moveFaceD => 'mặt dưới';

  @override
  String get moveFaceF => 'mặt trước';

  @override
  String get moveFaceB => 'mặt sau';

  @override
  String moveLayerInner(int depth, String face) {
    return 'tầng thứ $depth tính từ $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face (sâu $depth tầng)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'các tầng $near–$far tính từ $face';
  }

  @override
  String get moveLayerMiddle => 'tầng giữa';

  @override
  String get moveDirUp => 'lên trên';

  @override
  String get moveDirDown => 'xuống dưới';

  @override
  String get moveDirLeft => 'sang trái';

  @override
  String get moveDirRight => 'sang phải';

  @override
  String get moveDirClockwise => 'theo chiều kim đồng hồ';

  @override
  String get moveDirCounter => 'ngược chiều kim đồng hồ';

  @override
  String get moveDirBackClockwise => 'theo chiều kim đồng hồ, nhìn từ phía sau';

  @override
  String get moveDirBackCounter => 'ngược chiều kim đồng hồ, nhìn từ phía sau';

  @override
  String get moveDirHalf => 'nửa vòng (hai lần)';

  @override
  String get moveRotateX => 'Nghiêng cả khối: mặt trước lên trên';

  @override
  String get moveRotateXPrime => 'Nghiêng cả khối: mặt trước xuống dưới';

  @override
  String get moveRotateX2 => 'Lật ngược cả khối: mặt trước ra phía sau';

  @override
  String get moveRotateY => 'Xoay cả khối: mặt trước sang trái';

  @override
  String get moveRotateYPrime => 'Xoay cả khối: mặt trước sang phải';

  @override
  String get moveRotateY2 => 'Xoay cả khối nửa vòng: mặt sau ra phía trước';

  @override
  String get moveRotateZ =>
      'Lăn cả khối theo chiều kim đồng hồ: mặt trên sang phải';

  @override
  String get moveRotateZPrime =>
      'Lăn cả khối ngược chiều kim đồng hồ: mặt trên sang trái';

  @override
  String get moveRotateZ2 => 'Lộn ngược cả khối: mặt trên xuống dưới';

  @override
  String get phaseReductionCenters => 'Tâm';

  @override
  String get phaseReductionEdges => 'Ghép cạnh';

  @override
  String get phaseReductionEdgeParity => 'Parity cạnh';

  @override
  String get phaseReductionOllParity => 'Parity OLL';

  @override
  String get phaseReductionPllParity => 'Parity PLL';

  @override
  String get explainReductionCenterBlock =>
      'Các nước xoay tầng giữa đưa nhiều viên tâm về chỗ cùng lúc.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Đưa một viên tâm $piece về mặt của nó bằng hoán vị vòng 3 viên, không động đến các tâm đã xong.';
  }

  @override
  String get explainReductionParityCenters =>
      'Dựng lại các tâm bị nước xoay parity làm xê dịch.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Ghép các mảnh cạnh $piece bằng hoán vị vòng 3 viên; các tâm vẫn giữ nguyên.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Các cạnh cuối không thể ghép chỉ bằng hoán vị vòng 3 viên (parity cạnh). Một nước xoay tầng trong sẽ khắc phục.';

  @override
  String get explainReductionOllParity =>
      'Parity OLL: một cạnh bị lật, điều không thể xảy ra trên 3×3. Công thức này lật nó lại.';

  @override
  String get explainReductionPllParity =>
      'Parity PLL: hai cạnh bị đổi chỗ, điều không thể có trên 3×3. Công thức này đổi chúng lại.';

  @override
  String get patternsTitle => 'Thư viện hoa văn';

  @override
  String get patternsHint =>
      'Chạm vào một hoa văn để xem, rồi làm theo trên khối của bạn.';

  @override
  String get patternCheckerboard => 'Bàn cờ';

  @override
  String get patternCubeInCube => 'Khối trong khối';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Chấm tròn';

  @override
  String get patternCross => 'Chữ thập';

  @override
  String get patternPython => 'Con trăn';

  @override
  String get phasePattern => 'Tạo hoa văn';

  @override
  String get explainPatternStep =>
      'Làm theo từng nước trên khối của bạn. Chạm Giải để đưa khối về như cũ.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Đồng hồ speedcube';

  @override
  String get timerHoldToStart => 'Giữ, rồi thả ra để bắt đầu';

  @override
  String get timerReleaseToStart => 'Thả ra để bắt đầu';

  @override
  String get timerTapToStop => 'Chạm bất kỳ đâu để dừng';

  @override
  String get timerInspecting => 'Quan sát: giữ, rồi thả ra để bắt đầu';

  @override
  String get timerTapToInspect => 'Chạm để bắt đầu 15 giây quan sát';

  @override
  String get timerInspectionToggle => 'Quan sát 15 giây';

  @override
  String get timerLoadingScramble => 'Đang tạo bài xáo trộn…';

  @override
  String get timerPb => 'Tốt nhất';

  @override
  String get timerSolves => 'Lượt giải';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Xóa';

  @override
  String get timerHistory => 'Lịch sử';

  @override
  String get timerNoSolves =>
      'Chưa có lượt giải nào. Xáo khối và bắt đầu thôi!';

  @override
  String get timerNewPb => 'Kỷ lục cá nhân mới!';

  @override
  String get timerClearHistory => 'Xóa lịch sử';

  @override
  String get timerScrambleHint =>
      'Cầm mặt trắng ở trên và mặt xanh lá ở trước, rồi xáo trộn:';

  @override
  String get dailyTitle => 'Thử thách hằng ngày';

  @override
  String dailyFor(String date) {
    return 'Thử thách ngày $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Chuỗi dài nhất: $count';
  }

  @override
  String get dailyDone => 'Xong hôm nay rồi! Hẹn gặp lại ngày mai.';

  @override
  String get dailyNotDone => 'Giải bài xáo trộn hôm nay để giữ chuỗi ngày.';

  @override
  String get dailySolveVirtual => 'Giải trên khối 3D';

  @override
  String get dailyTimeIt => 'Bấm giờ trên khối của bạn';

  @override
  String get dailyHint => 'Gợi ý';

  @override
  String dailyHintText(String moves) {
    return 'Bắt đầu với dấu cộng trắng: $moves';
  }

  @override
  String get dailyHintFailed => 'Hiện chưa có gợi ý.';

  @override
  String get lessonBasics => 'Làm quen với khối Rubik';

  @override
  String get lessonBasicsDesc => 'Các viên, các mặt và tên nước xoay.';

  @override
  String get stepBasicsPieces => 'Ba loại viên';

  @override
  String get stepBasicsPiecesBody =>
      'Tâm không bao giờ di chuyển và quyết định màu của mỗi mặt. Cạnh có hai màu, góc có ba màu. Giải khối nghĩa là đưa mọi cạnh và góc về cạnh các tâm cùng màu.';

  @override
  String get stepBasicsFaces => 'Sáu chữ cái của các mặt';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F và B là mặt phải, trái, trên, dưới, trước và sau. Một chữ cái đứng riêng nghĩa là xoay một phần tư vòng theo chiều kim đồng hồ, như khi bạn nhìn thẳng vào mặt đó.';

  @override
  String get stepBasicsPrime => 'Nước ngược và nước kép';

  @override
  String get stepBasicsPrimeBody =>
      'Dấu phẩy trên (R\') nghĩa là xoay ngược lại, ngược chiều kim đồng hồ. Số 2 (U2) là nửa vòng: hai lần một phần tư vòng.';

  @override
  String get stepCrossGoal => 'Mục tiêu';

  @override
  String get stepCrossGoalBody =>
      'Cầm mặt vàng ở trên. Bốn cạnh trắng nằm quanh tâm trắng ở dưới, màu mặt bên của mỗi cạnh khớp với tâm bên cạnh.';

  @override
  String get stepCrossTop => 'Cạnh ở tầng trên';

  @override
  String get stepCrossTopBody =>
      'Tìm một cạnh trắng ở tầng trên. Xoay tầng trên cho đến khi màu mặt bên của nó nằm trên tâm cùng màu, rồi xoay mặt đó hai lần để đưa cạnh xuống.';

  @override
  String get stepCrossMiddle => 'Cạnh ở tầng giữa';

  @override
  String get stepCrossMiddleBody =>
      'Cạnh kẹt ở tầng giữa phải đưa lên trước: xoay mặt bên của nó lên, dời tầng trên đi chỗ khác rồi xoay mặt bên trở lại, để dấu cộng không bị phá. Sau đó đặt nó từ tầng trên.';

  @override
  String get stepCornersInsert => 'Ngay trên vị trí';

  @override
  String get stepCornersInsertBody =>
      'Xoay tầng trên cho đến khi một góc trắng nằm ngay trên vị trí của nó, ở phía trước bên phải. R U R\' U\' sẽ đưa nó xuống.';

  @override
  String get stepCornersRepeat => 'Lặp lại công thức';

  @override
  String get stepCornersRepeatBody =>
      'Nếu màu trắng quay sai hướng, cứ lặp lại R U R\' U\' ở cùng vị trí đó. Mỗi góc sẽ xong sau tối đa năm lần lặp.';

  @override
  String get stepMiddleRight => 'Cạnh sang phải';

  @override
  String get stepMiddleRightBody =>
      'Căn một cạnh ở tầng trên với tâm của nó ở mặt trước. Nếu màu trên của nó khớp với tâm bên phải, đưa vào bằng U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Cạnh sang trái';

  @override
  String get stepMiddleLeftBody =>
      'Nếu màu trên khớp với tâm bên trái, dùng công thức đối xứng: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Một công thức';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' biến chấm vàng thành hình chữ L, chữ L thành đường thẳng và đường thẳng thành dấu cộng. Giữ chữ L ở phía sau bên trái và đường thẳng nằm ngang.';

  @override
  String get stepYellowEdges => 'Khớp các cạnh';

  @override
  String get stepYellowEdgesBody =>
      'Xoay tầng trên cho đến khi hai cạnh khớp với tâm. Với một cạnh ở phía sau và một cạnh bên phải, R U R\' U R U2 R\' U sẽ đổi chỗ hai cạnh còn lại.';

  @override
  String get stepPlaceCorners => 'Đặt đúng chỗ';

  @override
  String get stepPlaceCornersBody =>
      'Giữ một góc đã đúng vị trí ở phía trước bên phải. U R U\' L\' U R\' U\' L di chuyển ba góc còn lại; lặp lại cho đến khi cả bốn về đúng chỗ.';

  @override
  String get stepTwistCorners => 'Xoắn góc';

  @override
  String get stepTwistCornersBody =>
      'Với một góc chưa giải ở phía trước bên phải, lặp lại R\' D\' R D cho đến khi màu vàng ở trên, rồi chỉ xoay tầng trên để đưa góc tiếp theo vào. Tầng dưới trông như bị phá cho đến tận cuối: cứ tiếp tục.';

  @override
  String get lessonCfopIntro => 'CFOP là gì?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Bốn giai đoạn';

  @override
  String get stepCfopOverviewBody =>
      'Người chơi speedcube giải dấu cộng, rồi ghép mỗi góc tầng một với cạnh tầng giữa của nó (F2L), định hướng tầng cuối (OLL) và cuối cùng hoán vị nó (PLL).';

  @override
  String get stepCfopCross => 'Lên kế hoạch dấu cộng';

  @override
  String get stepCfopCrossBody =>
      'Trong CFOP, dấu cộng được lên kế hoạch trong lúc quan sát và dựng ở mặt dưới trong khoảng tám nước.';

  @override
  String get lessonF2l => 'F2L cơ bản';

  @override
  String get lessonF2lDesc => 'Ghép một góc với cạnh của nó.';

  @override
  String get stepF2lRight => 'Đưa một cặp vào';

  @override
  String get stepF2lRightBody =>
      'Khi một góc và cạnh của nó nằm cạnh nhau ở tầng trên, đưa chúng lên trên ô của chúng và đưa vào cùng lúc.';

  @override
  String get stepF2lLeft => 'Cặp bên trái';

  @override
  String get stepF2lLeftBody =>
      'Trường hợp tương tự ở phía bên kia là công thức đối xứng, U\' L\' U L. Xoay cả khối (y) giúp bạn dùng tay nào thuận hơn.';

  @override
  String get lessonOll => 'OLL hai bước';

  @override
  String get lessonOllDesc => 'Làm mặt trên thành màu vàng.';

  @override
  String get stepOllCross => 'Cạnh trước';

  @override
  String get stepOllCrossBody =>
      'OLL hai bước bắt đầu bằng công thức dấu cộng vàng mà bạn đã biết.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Với một góc vàng hướng lên ở phía trước bên trái, Sune (R U R\' U R U2 R\') định hướng ba góc còn lại. Hầu hết các trường hợp khác dùng Sune và bản đối xứng của nó.';

  @override
  String get lessonPll => 'PLL hai bước';

  @override
  String get lessonPllDesc => 'Hoàn thành khối.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm đổi chỗ hai góc và hai cạnh. Dùng nó để đặt các góc: giữ hai góc cần đổi chỗ ở bên phải.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Khi các góc đã xong, U-perm hoán vị vòng ba cạnh. Giữ mặt đã hoàn chỉnh ở phía sau.';

  @override
  String get lessonTwoFirst => 'Tầng một của 2×2';

  @override
  String get lessonTwoFirstDesc => 'Dựng một mặt với các góc khớp nhau.';

  @override
  String get stepTwoIntro => 'Chỉ có góc';

  @override
  String get stepTwoIntroBody =>
      'Khối 2×2 là khối 3×3 không có cạnh và tâm. Chọn một màu, dựng mặt đó ở dưới, và làm cho màu mặt bên của các góc kề nhau khớp với nhau.';

  @override
  String get stepTwoCorner => 'Đưa góc vào';

  @override
  String get stepTwoCornerBody =>
      'Giống hệt các góc trắng của 3×3: đưa góc lên trên vị trí của nó và dùng R U R\' U\' cho đến khi vừa khít.';

  @override
  String get lessonTwoOll => 'Định hướng mặt trên';

  @override
  String get lessonTwoOllDesc => 'OLL Ortega với Sune.';

  @override
  String get stepTwoSune => 'Lại là Sune';

  @override
  String get stepTwoSuneBody =>
      'Sune cũng làm mặt trên của 2×2 thành màu vàng. Người giải theo Ortega học bảy trường hợp ngắn; Sune và bản đối xứng của nó bao gồm phần lớn.';

  @override
  String get lessonTwoPbl => 'Hoán vị cả hai tầng';

  @override
  String get lessonTwoPblDesc => 'Đổi chỗ các góc để hoàn thành.';

  @override
  String get stepTwoAdjacent => 'Đổi chỗ kề nhau';

  @override
  String get stepTwoAdjacentBody =>
      'Khi hai góc kề nhau ở tầng trên cần đổi chỗ, giữ chúng ở bên phải và dùng T-perm.';

  @override
  String get stepTwoDiagonal => 'Đổi chỗ chéo';

  @override
  String get stepTwoDiagonalBody =>
      'Hai góc ở vị trí đối diện nhau được đổi chỗ bằng Y-perm.';

  @override
  String get lessonBigIntro => 'Các viên của khối lớn';

  @override
  String get lessonBigIntroDesc => 'Tâm, cánh và tầng giữa.';

  @override
  String get stepBigPieces => 'Không có tâm cố định';

  @override
  String get stepBigPiecesBody =>
      'Trên khối 4×4, mỗi mặt có bốn viên tâm di chuyển được, và mỗi cạnh gồm hai cánh. Phương pháp rút gọn gom chúng lại để khối hoạt động như 3×3.';

  @override
  String get stepBigSlices => 'Xoay kép và xoay tầng trong';

  @override
  String get stepBigSlicesBody =>
      'Rw xoay cùng lúc hai tầng bên phải. 2R chỉ xoay tầng thứ hai tính từ bên phải. Các nước này di chuyển tâm và cánh.';

  @override
  String get lessonBigCenters => 'Tâm';

  @override
  String get lessonBigCentersDesc => 'Gom các viên tâm.';

  @override
  String get stepBigCenterCycle => 'Hoán vị vòng 3 viên tâm';

  @override
  String get stepBigCenterCycleBody =>
      'Commutator này di chuyển đúng ba viên tâm và không động đến phần còn lại, nên các tâm đã xong vẫn giữ nguyên.';

  @override
  String get lessonBigEdges => 'Ghép cạnh';

  @override
  String get lessonBigEdgesDesc => 'Ghép các cánh thành cạnh hoàn chỉnh.';

  @override
  String get stepBigEdgePair => 'Ghép và khôi phục';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' xếp hai cánh cùng màu thẳng hàng, R U R\' F R\' F\' R đưa một cạnh chưa ghép vào, và Uw đưa các tâm trở lại.';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => 'Parity OLL và PLL trên khối chẵn.';

  @override
  String get stepBigOllParity => 'Parity OLL';

  @override
  String get stepBigOllParityBody =>
      'Một cạnh bị lật đơn lẻ không thể xảy ra trên 3×3. Trên khối chẵn, công thức này lật cạnh trên-trước trở lại. Nó có thể xáo phần còn lại của tầng trên, nhưng các bước 3×3 cuối cùng vẫn sẽ sửa lại.';

  @override
  String get stepBigPllParity => 'Parity PLL';

  @override
  String get stepBigPllParityBody =>
      'Hai cạnh bị đổi chỗ ở bước cuối cùng? 2R2 U2 2R2 Uw2 2R2 Uw2 đổi chỗ cạnh trên phía trước và phía sau.';

  @override
  String get introGoalHeading => 'Mục tiêu là gì?';

  @override
  String get introHowHeading => 'Làm thế nào?';

  @override
  String get introStart => 'Hiểu rồi, bắt đầu từng bước';

  @override
  String get introDontShowAgain => 'Không tự động hiển thị nữa';

  @override
  String get introShowGoal => 'Xem mục tiêu';

  @override
  String get introStateStart => 'Bắt đầu';

  @override
  String get introStateGoal => 'Mục tiêu';

  @override
  String get introPlayMorph => 'Phát từ đầu đến mục tiêu';

  @override
  String get introGoalBasics =>
      'Học cách đọc khối: các viên, sáu mặt và cách các chữ cái ký hiệu xoay chúng.';

  @override
  String get introGoalCross =>
      'Tạo dấu cộng trắng sao cho mỗi cạnh trắng cũng khớp màu với tâm bên cạnh.';

  @override
  String get introGoalCorners =>
      'Lấp bốn góc trắng để hoàn thành vương miện thứ nhất, toàn bộ tầng trắng.';

  @override
  String get introGoalMiddle =>
      'Đặt bốn cạnh tầng giữa để hoàn thành hai tầng đầu.';

  @override
  String get introGoalYellowCross =>
      'Tạo dấu cộng vàng ở trên; màu mặt bên chưa cần khớp.';

  @override
  String get introGoalYellowEdges =>
      'Căn mỗi cạnh của dấu cộng vàng với màu tâm ở mặt bên của nó.';

  @override
  String get introGoalYellowCorners =>
      'Đưa mỗi góc vàng về đúng chỗ, kể cả khi nó vẫn còn bị xoắn.';

  @override
  String get introGoalTwistCorners =>
      'Xoắn các góc vàng đúng hướng để cả khối được giải.';

  @override
  String get introGoalCfopIntro =>
      'Xem kế hoạch của speedcube: dấu cộng, hai tầng đầu, rồi tầng cuối trong hai bước.';

  @override
  String get introGoalF2l =>
      'Đưa mỗi góc trắng vào cùng với cạnh tầng giữa của nó, hoàn thành hai tầng cùng lúc.';

  @override
  String get introGoalOll =>
      'Làm cả mặt trên thành màu vàng bằng một hoặc hai công thức.';

  @override
  String get introGoalPll =>
      'Đưa các viên tầng cuối về đúng chỗ để hoàn thành khối.';

  @override
  String get introGoalTwoFirst =>
      'Dựng một tầng trắng hoàn chỉnh trên khối 2×2.';

  @override
  String get introGoalTwoOll => 'Làm mặt trên của 2×2 thành toàn màu vàng.';

  @override
  String get introGoalTwoPbl =>
      'Đổi chỗ các góc cuối về đúng vị trí để giải khối 2×2.';

  @override
  String get introGoalBigIntro =>
      'Làm quen với 4×4: tâm, cặp cạnh và góc, cùng các nước xoay chúng.';

  @override
  String get introGoalBigCenters =>
      'Gom các viên tâm của mỗi mặt thành một khối màu liền.';

  @override
  String get introGoalBigEdges =>
      'Ghép các mảnh cạnh cùng màu để mỗi cạnh trông như một cạnh 3×3.';

  @override
  String get introGoalBigParity =>
      'Sửa hai trường hợp của 4×4 mà 3×3 không bao giờ có: một cạnh bị lật hoặc hai cạnh bị đổi chỗ.';

  @override
  String get introHowBasics =>
      'Tâm không bao giờ di chuyển, nên chúng cho biết màu của mỗi mặt.\nMỗi chữ cái xoay một mặt một phần tư vòng theo chiều kim đồng hồ.\nDấu phẩy trên (\') xoay ngược lại; số 2 xoay hai lần.';

  @override
  String get introHowCross =>
      'Cầm mặt vàng ở trên: dấu cộng trắng được dựng ở mặt dưới.\nTìm một cạnh trắng và căn màu mặt bên của nó với tâm cùng màu.\nXoay mặt đó hai lần để đưa cạnh vào chỗ.';

  @override
  String get introHowCorners =>
      'Đưa một góc trắng lên trên ô trống của nó.\nLặp lại R U R\' U\' cho đến khi nó vào đúng hướng.\nLàm tương tự với ba góc còn lại.';

  @override
  String get introHowMiddle =>
      'Tìm một cạnh ở tầng trên không có màu vàng và khớp màu trước của nó với một tâm.\nĐưa nó sang phải hoặc trái bằng một công thức ngắn 8 nước.\nTầng trắng luôn trở lại nguyên vẹn.';

  @override
  String get introHowYellowCross =>
      'Nhìn mặt trên: một chấm, chữ L hoặc đường thẳng.\nGiữ như hình và làm F R U R\' U\' F\'.\nLặp lại cho đến khi dấu cộng vàng xuất hiện.';

  @override
  String get introHowYellowEdges =>
      'Xoay tầng trên cho đến khi hai cạnh khớp với tâm.\nGiữ chúng ở phía sau và bên phải, rồi làm R U R\' U R U2 R\' U.\nLặp lại cho đến khi cả bốn cạnh khớp.';

  @override
  String get introHowYellowCorners =>
      'Một góc đúng chỗ khi màu của nó khớp với ba mặt xung quanh.\nGiữ một góc đã đúng chỗ ở phía trước bên phải.\nU R U\' L\' U R\' U\' L hoán vị ba góc còn lại cho đến khi tất cả vừa khít.';

  @override
  String get introHowTwistCorners =>
      'Giữ một góc chưa giải ở phía trước bên phải.\nLặp lại R\' D\' R D cho đến khi màu vàng của nó hướng lên.\nChỉ xoay tầng trên để chuyển sang góc tiếp theo; tầng dưới tự trở lại ở cuối.';

  @override
  String get introHowCfopIntro =>
      'Cross: bốn cạnh, lên kế hoạch trong lúc quan sát.\nF2L: mỗi góc được đưa vào cùng với cạnh của nó.\nOLL làm mặt trên thành màu vàng, rồi PLL đưa các viên về chỗ.';

  @override
  String get introHowF2l =>
      'Tìm một góc và cạnh cùng màu với nó ở tầng trên.\nGhép chúng thành cặp ngay trên ô của chúng.\nĐưa cặp vào bằng ba hoặc bốn nước.';

  @override
  String get introHowOll =>
      'Trước hết là dấu cộng vàng với F R U R\' U\' F\'.\nSau đó định hướng các góc, ví dụ bằng Sune.\nNhận diện trường hợp qua phần màu vàng bạn thấy.';

  @override
  String get introHowPll =>
      'Mặt trên đã toàn màu vàng.\nT-perm đổi chỗ góc; U-perm hoán vị vòng ba cạnh.\nĐọc màu các mặt bên để chọn công thức.';

  @override
  String get introHowTwoFirst =>
      'Khối 2×2 chỉ có góc, như 3×3 không có cạnh.\nĐưa mỗi góc trắng lên trên vị trí của nó.\nLặp lại R U R\' U\' cho đến khi nó vào chỗ.';

  @override
  String get introHowTwoOll =>
      'Giữ tầng trắng ở dưới.\nSune (R U R\' U R U2 R\') xoắn các góc ở trên.\nLặp lại từ đúng góc độ cho đến khi mặt trên toàn màu vàng.';

  @override
  String get introHowTwoPbl =>
      'Tìm một mặt bên có hai góc đã khớp nhau.\nĐổi chỗ kề nhau: một công thức kiểu T-perm.\nĐổi chỗ chéo: một công thức dài hơn.';

  @override
  String get introHowBigIntro =>
      'Không có tâm cố định: bốn viên tâm tạo nên màu của mỗi mặt.\nNước xoay kép như Rw xoay hai tầng cùng lúc.\nNước xoay tầng trong như 2R chỉ xoay một tầng bên trong.';

  @override
  String get introHowBigCenters =>
      'Dựng hai tâm đối diện trước.\nCác tầng trong đổi chỗ viên tâm mà không phá các tâm đã xong.\nHoàn thành bốn tâm cuối theo cách tương tự.';

  @override
  String get introHowBigEdges =>
      'Tìm hai mảnh cạnh cùng màu.\nXếp chúng cạnh nhau bằng một tầng trong.\nCất cặp đó đi và đưa các tâm trở lại.';

  @override
  String get introHowBigParity =>
      'Giải 4×4 như 3×3 cho đến khi bị kẹt.\nMột cạnh bị lật: công thức parity OLL dài.\nHai cạnh bị đổi chỗ: 2R2 U2 2R2 Uw2 2R2 Uw2.';

  @override
  String get dirFaceR => 'Mặt phải';

  @override
  String get dirFaceL => 'Mặt trái';

  @override
  String get dirFaceU => 'Hàng trên';

  @override
  String get dirFaceD => 'Hàng dưới';

  @override
  String get dirFaceF => 'Mặt trước';

  @override
  String get dirFaceB => 'Mặt sau';

  @override
  String get dirMiddle => 'Tầng giữa';

  @override
  String get dirWholeCube => 'Cả khối';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, tầng $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, sâu $depth tầng';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, tầng $near–$far';
  }

  @override
  String get dirUp => 'Lên';

  @override
  String get dirDown => 'Xuống';

  @override
  String get dirLeft => 'Trái';

  @override
  String get dirRight => 'Phải';

  @override
  String get dirClockwise => 'Theo chiều kim đồng hồ';

  @override
  String get dirCounter => 'Ngược chiều kim đồng hồ';

  @override
  String get dirBackClockwise => 'Theo chiều kim đồng hồ, nhìn từ phía sau';

  @override
  String get dirBackCounter => 'Ngược chiều kim đồng hồ, nhìn từ phía sau';

  @override
  String get dirHalf => 'Xoay kép (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Ẩn chi tiết';

  @override
  String get solveExpand => 'Hiện chi tiết';

  @override
  String get dailyScrambleSteps => 'Xáo trộn từng bước';

  @override
  String get dailyScrambleGuide => 'Hướng dẫn xáo trộn 3D';

  @override
  String get dailyShowMoves => 'Hiện ký hiệu nước xoay';

  @override
  String get dailyHideMoves => 'Ẩn ký hiệu nước xoay';

  @override
  String get dailyScrambleGuideTitle => 'Hướng dẫn xáo trộn';

  @override
  String get phaseDailyScramble => 'Xáo khối của hôm nay';

  @override
  String get explainDailyScramble =>
      'Bắt đầu từ khối đã giải, mặt trắng ở trên và mặt xanh lá ở trước, rồi làm theo từng nước trên khối thật của bạn.';

  @override
  String get stageCenters => 'Dựng các khối tâm';

  @override
  String get stageEdges => 'Ghép cạnh ngoài & trong';

  @override
  String get stageParity => 'Xử lý parity';

  @override
  String get stageCrown1 => 'Vương miện thứ nhất (trắng)';

  @override
  String get stageCrown2 => 'Vương miện thứ hai';

  @override
  String get stageCrown3 => 'Vương miện thứ ba (vàng)';

  @override
  String get stageOrient => 'Định hướng các viên';

  @override
  String get stageFinish => 'Hoàn thành khối';

  @override
  String get stageAsThree => 'Giải như 3×3';

  @override
  String get stageTwoByTwo => 'Giải khối 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Giai đoạn $number/$total: $title';
  }

  @override
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'Vương miện $crown • Giai đoạn $number/$total: $title';
  }

  @override
  String get solveAllStagesDone => 'Hoàn thành mọi giai đoạn. Làm tốt lắm!';

  @override
  String get trackFiveByFive => 'Professor\'s Cube 5×5';

  @override
  String get trackSixBySix => 'Khối 6×6';

  @override
  String get lessonFiveIntro => 'Làm quen với 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Tâm cố định, thanh tâm, cạnh giữa và cánh.';

  @override
  String get introGoalFiveIntro =>
      'Làm quen với 5×5: tâm cố định, thanh tâm, cạnh giữa và cánh.';

  @override
  String get introHowFiveIntro =>
      'Viên chính giữa mỗi mặt không bao giờ di chuyển.\nMỗi cạnh gồm một viên giữa và hai cánh.\nCác tầng trong di chuyển viên mà không động đến bên ngoài.';

  @override
  String get lessonFiveCenters => 'Tâm của 5×5';

  @override
  String get lessonFiveCentersDesc => 'Dựng mỗi tâm từ các thanh ba viên.';

  @override
  String get introGoalFiveCenters =>
      'Dựng khối tâm 3×3 cùng một màu trên mỗi mặt.';

  @override
  String get introHowFiveCenters =>
      'Bắt đầu từ viên chính giữa: nó cho biết màu.\nDựng các thanh ba viên và trượt chúng vào bằng một tầng trong.\nHoàn thành hai tâm cuối cùng lúc.';

  @override
  String get lessonFiveEdges => 'Cạnh của 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Ghép hai cánh với cạnh giữa của chúng.';

  @override
  String get introGoalFiveEdges =>
      'Ghép mỗi cạnh giữa với hai cánh của nó để cả 12 cạnh trông như những viên liền.';

  @override
  String get introHowFiveEdges =>
      'Khớp hai cánh với cạnh giữa của chúng ở mặt trước.\nXoay tầng trong, đưa một cạnh chưa giải vào, rồi xoay trở lại.\nGhép các cạnh cuối mà không phá các cạnh đã xong.';

  @override
  String get lessonFiveSolve => 'Giải 5×5 như 3×3';

  @override
  String get lessonFiveSolveDesc => 'Hoàn thành với ba vương miện.';

  @override
  String get introGoalFiveSolve =>
      'Giải khối 5×5 đã rút gọn như 3×3, từng vương miện một.';

  @override
  String get introHowFiveSolve =>
      'Từ giờ chỉ xoay các tầng ngoài.\nVương miện thứ nhất, thứ hai, rồi đến vương miện vàng.\nCác tâm cố định cho biết màu của mỗi mặt.';

  @override
  String get lessonFiveParity => 'Parity cạnh 5×5';

  @override
  String get lessonFiveParityDesc => 'Sửa cạnh có hai cánh bị đổi chỗ.';

  @override
  String get introGoalFiveParity =>
      'Sửa cạnh duy nhất có hai cánh bị đổi chỗ, rồi hoàn thành.';

  @override
  String get introHowFiveParity =>
      'Nó xuất hiện dưới dạng một cạnh không thể ghép.\nThực hiện công thức tầng trong dài một lần.\nMọi thứ khác trở về chỗ cũ.';

  @override
  String get lessonSixIntro => 'Làm quen với 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Không có tâm cố định và mỗi cạnh có bốn viên.';

  @override
  String get introGoalSixIntro =>
      'Làm quen với 6×6: mười sáu viên tâm mỗi mặt và bốn viên mỗi cạnh.';

  @override
  String get introHowSixIntro =>
      'Không có tâm cố định: bạn chọn màu khi dựng.\nMỗi cạnh có cánh ngoài và cánh trong.\nNước xoay kép có thể di chuyển đến ba tầng.';

  @override
  String get lessonSixCenters => 'Tâm của 6×6';

  @override
  String get lessonSixCentersDesc => 'Dựng tâm 4×4 từ các thanh bốn viên.';

  @override
  String get introGoalSixCenters =>
      'Dựng khối tâm 4×4 cùng một màu liền trên mỗi mặt.';

  @override
  String get introHowSixCenters =>
      'Dựng hai tâm đối diện trước.\nTạo các thanh bốn viên và trượt chúng lại với nhau.\nDi chuyển từng viên bằng mẹo: tầng trong, tầng trên, hoàn tác.';

  @override
  String get lessonSixEdges => 'Cạnh của 6×6';

  @override
  String get lessonSixEdgesDesc => 'Gom bốn viên của mỗi cạnh.';

  @override
  String get introGoalSixEdges =>
      'Gom bốn viên của mỗi cạnh để khối 6×6 có 12 cạnh hoàn chỉnh.';

  @override
  String get introHowSixEdges =>
      'Xếp cánh ngoài và cánh trong thẳng hàng ở mặt trước.\nTầng kép sâu đưa một cạnh vào và ra.\nCác cạnh đã xong không bao giờ bị phá.';

  @override
  String get lessonSixSolve => 'Giải 6×6 như 3×3';

  @override
  String get lessonSixSolveDesc => 'Hoàn thành với ba vương miện.';

  @override
  String get introGoalSixSolve =>
      'Giải khối 6×6 đã rút gọn như 3×3, từng vương miện một.';

  @override
  String get introHowSixSolve =>
      'Từ giờ chỉ xoay các tầng ngoài.\nCác tâm bạn đã dựng cho biết màu của mỗi mặt.\nVương miện thứ nhất, thứ hai, rồi đến vương miện vàng.';

  @override
  String get lessonSixParity => 'Parity 6×6';

  @override
  String get lessonSixParityDesc => 'Một cạnh bị lật hoặc hai cạnh bị đổi chỗ.';

  @override
  String get introGoalSixParity =>
      'Sửa hai trường hợp của 6×6 mà 3×3 không bao giờ có: một cạnh bị lật hoặc hai cạnh bị đổi chỗ.';

  @override
  String get introHowSixParity =>
      'Giải như 3×3 cho đến khi bị kẹt.\nMột cạnh bị lật: công thức parity dài.\nHai cạnh bị đổi chỗ: công thức ngắn với các nước xoay kép tầng trong.';

  @override
  String get stepFivePieces => 'Các viên của 5×5';

  @override
  String get stepFivePiecesBody =>
      'Viên chính giữa mỗi mặt không bao giờ di chuyển, nên nó vẫn cho biết màu của mặt, giống như trên 3×3. Quanh nó còn tám viên tâm khác; mỗi cạnh có một viên giữa và hai cánh, còn các góc hoạt động như trên 3×3.';

  @override
  String get stepFiveSlices => 'Ba kiểu xoay';

  @override
  String get stepFiveSlicesBody =>
      'Nước xoay ngoài di chuyển một mặt. Nước xoay kép di chuyển một mặt cùng tầng phía sau nó. Nước xoay tầng trong chỉ di chuyển một tầng bên trong: đó là cách các viên đổi chỗ mà không động đến bên ngoài.';

  @override
  String get stepFiveCenterBar => 'Thanh tâm';

  @override
  String get stepFiveCenterBarBody =>
      'Dựng một hàng ba viên tâm cùng màu, rồi trượt nó cạnh viên giữa cùng màu bằng một nước xoay tầng trong. Ba thanh tạo thành một tâm hoàn chỉnh.';

  @override
  String get stepFiveCenterSwap => 'Đổi chỗ mà không phá';

  @override
  String get stepFiveCenterSwapBody =>
      'Để di chuyển một viên tâm: xoay một tầng trong, xoay tầng trên, hoàn tác tầng trong, xoay tầng trên trở lại. Các tâm đã xong luôn được khôi phục.';

  @override
  String get stepFiveEdgePair => 'Ghép cánh với cạnh giữa';

  @override
  String get stepFiveEdgePairBody =>
      'Xếp hai cánh cạnh cạnh giữa cùng màu ở mặt trước, xoay tầng trong xuống, đưa một cạnh chưa giải từ tầng trên vào, rồi xoay tầng trong trở lại.';

  @override
  String get stepFiveEdgeLast => 'Các cạnh cuối';

  @override
  String get stepFiveEdgeLastBody =>
      'Khi chỉ còn vài cạnh, một nước xoay kép, một công thức ngắn và nước xoay kép trở lại sẽ ghép chúng mà không phá các cạnh đã xong.';

  @override
  String get stepFiveAsThree => 'Giờ nó là 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Khi tâm và cạnh đã xong, khối 5×5 hoạt động như một khối 3×3 lớn. Chỉ dùng các nước xoay ngoài và làm theo ba vương miện: dấu cộng và góc trắng, tầng giữa, rồi tầng vàng.';

  @override
  String get stepFiveEdgeParity => 'Đổi chỗ hai cánh của cạnh cuối';

  @override
  String get stepFiveEdgeParityBody =>
      'Đôi khi cạnh cuối có hai cánh bị đổi chỗ. Một công thức tầng trong dài hơn sẽ đổi chúng lại trong khi mọi thứ khác trở về chỗ cũ. Sau đó hoàn thành như 3×3.';

  @override
  String get stepSixPieces => 'Các viên của 6×6';

  @override
  String get stepSixPiecesBody =>
      'Giống như 4×4, khối 6×6 không có tâm cố định: mười sáu viên tâm tạo nên màu của mỗi mặt. Mỗi cạnh có bốn viên: hai cánh ngoài và hai cánh trong.';

  @override
  String get stepSixSlices => 'Xoay các tầng sâu hơn';

  @override
  String get stepSixSlicesBody =>
      'Nước xoay kép có thể di chuyển hai hoặc ba tầng tính từ một mặt. Các tầng trong ở tầng thứ hai hoặc thứ ba là công cụ cho tâm và cạnh.';

  @override
  String get stepSixCenterBar => 'Thanh bốn viên';

  @override
  String get stepSixCenterBarBody =>
      'Dựng các hàng bốn viên tâm cùng màu và trượt chúng cạnh nhau bằng các nước xoay tầng trong cho đến khi mặt có một màu liền.';

  @override
  String get stepSixCenterSwap => 'Di chuyển từng viên một';

  @override
  String get stepSixCenterSwapBody =>
      'Xoay tầng thứ ba, xoay tầng trên, hoàn tác, xoay trở lại: một viên tâm di chuyển trong khi các tâm đã xong trở về như cũ.';

  @override
  String get stepSixEdgePair => 'Bốn viên, một cạnh';

  @override
  String get stepSixEdgePairBody =>
      'Gom bốn viên của một cạnh ở mặt trước bằng tầng kép sâu, rồi đưa một cạnh chưa giải vào và xoay tầng kép trở lại.';

  @override
  String get stepSixEdgeLast => 'Các cạnh cuối';

  @override
  String get stepSixEdgeLastBody =>
      'Ghép các cạnh cuối cùng bằng một công thức ngắn giữa một nước xoay kép sâu và nước hoàn tác của nó, để các cạnh đã xong vẫn được ghép.';

  @override
  String get stepSixAsThree => 'Giờ nó là 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Với tâm 4×4 và các cạnh đã ghép, giải khối 6×6 như 3×3 bằng các nước xoay ngoài và ba vương miện.';

  @override
  String get stepSixOllParity => 'Một cạnh bị lật';

  @override
  String get stepSixOllParityBody =>
      'Nếu một cạnh đơn lẻ có vẻ bị lật khi bạn giải tầng cuối, đó là parity. Giữ nó ở phía trước tầng trên và thực hiện công thức dài: hai vương miện đầu sẽ trở lại nguyên vẹn.';

  @override
  String get stepSixPllParity => 'Hai cạnh bị đổi chỗ';

  @override
  String get stepSixPllParityBody =>
      'Nếu hai cạnh có vẻ bị đổi chỗ ở bước cuối cùng, giữ chúng ở phía trước và phía sau tầng trên rồi thực hiện công thức ngắn gồm các nước xoay kép tầng trong.';

  @override
  String get stageTwoFirstLayer => 'Dựng tầng dưới';

  @override
  String get stageTwoTopColor => 'Làm mặt trên một màu';

  @override
  String get stageTwoFinish => 'Hoàn thành các góc';

  @override
  String get explainTwoFirstLayer =>
      'Hoàn thành tầng dưới: bốn góc của nó khớp với nhau và với màu các mặt bên.';

  @override
  String get explainTwoTopColor =>
      'Xoay tầng trên cho đến khi cả bốn miếng dán ở trên cùng một màu, giữ nguyên tầng dưới.';

  @override
  String get explainTwoFinish =>
      'Đưa các góc cuối về đúng chỗ để hoàn thành khối.';

  @override
  String get tabSolve => 'Giải';

  @override
  String get tabScan => 'Quét';

  @override
  String get tabAcademy => 'Học viện';

  @override
  String get tabTrain => 'Luyện tập';

  @override
  String get openCubeSolver => 'Mở khối 3D & bộ giải';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Luyện tập';

  @override
  String get trainSubtitle => 'Mài giũa kỹ năng mỗi ngày.';

  @override
  String get settings => 'Cài đặt';

  @override
  String get settingsSoundHaptics => 'Âm thanh & rung';

  @override
  String get settingsSoundHapticsDesc =>
      'Tiếng click và rung khi bạn xoay khối.';

  @override
  String get settingsAnimationSpeed => 'Tốc độ hoạt ảnh mặc định';

  @override
  String get settingsAnimationSpeedDesc =>
      'Tốc độ xoay của khối khi phát các nước.';

  @override
  String get settingsResetProgress => 'Đặt lại tiến độ';

  @override
  String get settingsResetProgressDesc =>
      'Xóa các bài học đã hoàn thành và chuỗi ngày của bạn.';

  @override
  String get resetProgressTitle => 'Đặt lại toàn bộ tiến độ?';

  @override
  String get resetProgressBody =>
      'Các bài học đã hoàn thành và chuỗi ngày của bạn sẽ bị xóa. Không thể hoàn tác.';

  @override
  String get resetProgressDone => 'Đã đặt lại tiến độ.';

  @override
  String get cancel => 'Hủy';

  @override
  String get settingsPrivacyAds => 'Quyền riêng tư & quảng cáo';

  @override
  String get settingsPrivacyAdsDesc =>
      'Xem lại hoặc thay đổi lựa chọn đồng ý quảng cáo.';

  @override
  String get playbackPrevious => 'Trước';

  @override
  String get playbackNext => 'Tiếp';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Giải xong trong $count nước!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Cùng định hình phiên bản tiếp theo';

  @override
  String get feedbackBody =>
      'Bạn muốn đề xuất tính năng hay góp ý cho phiên bản tiếp theo của CubeMentor? Hãy viết cho chúng tôi tại:';

  @override
  String get feedbackEmailCopied =>
      'Không tìm thấy ứng dụng email, nên chúng tôi đã sao chép địa chỉ vào bộ nhớ tạm.';

  @override
  String get adWatchToUnlock => 'Xem quảng cáo';

  @override
  String get adLoading => 'Đang tải video ngắn…';

  @override
  String get adRewardNotEarned => 'Hãy xem hết video để mở khóa.';

  @override
  String get adUnavailableFreePass =>
      'Hiện không có video — lần này được mở khóa miễn phí.';

  @override
  String get settingsPrivacyAdsError =>
      'Không mở được tùy chọn quyền riêng tư. Hãy thử lại sau.';

  @override
  String get nicknamePromptTitle => 'Chúng tôi nên gọi bạn là gì?';

  @override
  String get nicknamePromptBody =>
      'Chúng tôi sẽ cổ vũ bạn bằng tên mỗi lần bạn giải xong.';

  @override
  String get nicknameHint => 'Tên hoặc biệt danh của bạn';

  @override
  String get nicknameSave => 'Lưu';

  @override
  String get settingsNickname => 'Tên của bạn';

  @override
  String get settingsNicknameNotSet => 'Chưa đặt — chạm để thêm';

  @override
  String celebrateNamed(String name) {
    return 'Giỏi lắm, $name!';
  }

  @override
  String get celebrateAnon => 'Giỏi lắm!';

  @override
  String get celebrateCubeSolved => 'Đã giải xong khối!';

  @override
  String get celebrateDailyDone => 'Hoàn thành thử thách hằng ngày!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit nước',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Mọi bài xáo trộn đều giải được trong tối đa $limit nước',
    );
    return '$_temp0';
  }

  @override
  String get patternsUnlockTitle => 'Mở khóa mọi hoa văn';

  @override
  String patternsUnlockPrompt(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Xem 1 video ngắn để mở khóa mọi hoa văn trong $minutes phút',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Xem video';

  @override
  String get patternsNotNow => 'Để sau';

  @override
  String patternsUnlockedLeft(String time) {
    return 'Đã mở khóa • còn $time';
  }

  @override
  String get patternsExpiredTitle => 'Thời gian xem thử đã hết';

  @override
  String patternsExpiredBody(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Xem 1 video để tiếp tục mở khóa mọi hoa văn thêm $minutes phút!',
    );
    return '$_temp0';
  }

  @override
  String get patternsFreeSample => 'Miễn phí';

  @override
  String get settingsColorScheme => 'Bảng màu khối Rubik';

  @override
  String get colorSchemeWestern => 'Phương Tây';

  @override
  String get colorSchemeJapanese => 'Nhật Bản';

  @override
  String get colorSchemeWesternDesc =>
      'Trắng đối diện vàng, xanh dương đối diện xanh lá';

  @override
  String get colorSchemeJapaneseDesc =>
      'Trắng đối diện xanh dương, vàng đối diện xanh lá';

  @override
  String dailyYourTime(String time) {
    return 'Thời gian của bạn: $time';
  }
}
