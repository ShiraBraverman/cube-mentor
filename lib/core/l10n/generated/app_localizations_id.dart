// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Pindai, selesaikan, dan kuasai setiap kubus dari 2×2 hingga 6×6.';

  @override
  String get chooseCubeSize => 'Pilih kubusmu';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Pemula';

  @override
  String get cubeLevel3 => 'Klasik';

  @override
  String get cubeLevel4 => 'Mahir';

  @override
  String get cubeLevel5 => 'Ahli';

  @override
  String get cubeLevel6 => 'Master';

  @override
  String get cubeComingSoon => 'Kubus baru segera hadir';

  @override
  String get carouselPrevious => 'Kubus sebelumnya';

  @override
  String get carouselNext => 'Kubus berikutnya';

  @override
  String get chooseMode => 'Mau melakukan apa?';

  @override
  String get modePlayground => 'Arena 3D';

  @override
  String get modePlaygroundDesc =>
      'Putar lapisan, acak, dan ulangi gerakan dalam 3D.';

  @override
  String get modeScanSolve => 'Pindai & Selesaikan';

  @override
  String get modeScanSolveDesc =>
      'Pindai kubusmu dengan kamera dan dapatkan solusinya.';

  @override
  String get modeAcademy => 'Akademi';

  @override
  String get modeAcademyDesc =>
      'Belajar langkah demi langkah dengan pelajaran interaktif.';

  @override
  String get comingSoon => 'Segera hadir';

  @override
  String get comingSoonMessage =>
      'Fitur ini akan hadir di pembaruan mendatang.';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSearch => 'Cari bahasa';

  @override
  String get languageNoResults =>
      'Tidak ada bahasa yang cocok dengan pencarianmu.';

  @override
  String playgroundTitle(int size) {
    return 'Arena $size×$size';
  }

  @override
  String get scramble => 'Acak';

  @override
  String get reset => 'Atur ulang';

  @override
  String get undo => 'Urungkan';

  @override
  String get speed => 'Kecepatan';

  @override
  String get xray => 'Sinar-X';

  @override
  String get prime => 'Prime';

  @override
  String get wide => 'Lebar';

  @override
  String layer(int index) {
    return 'Lapisan $index';
  }

  @override
  String get cubeRotations => 'Rotasi';

  @override
  String get play => 'Putar';

  @override
  String get pause => 'Jeda';

  @override
  String get playbackTitle => 'Pemutaran';

  @override
  String get playbackEmpty => 'Acak kubus untuk membuat pemutaran solusi.';

  @override
  String playbackProgress(int current, int total) {
    return 'Langkah $current dari $total';
  }

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gerakan',
      zero: 'Tidak ada gerakan',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Selesai';

  @override
  String get scrambled => 'Teracak';

  @override
  String get orbitHint =>
      'Geser satu baris untuk memutarnya · Geser latar untuk memutar tampilan';

  @override
  String get notationPad => 'Papan notasi';

  @override
  String get solve => 'Selesaikan';

  @override
  String get solving => 'Menyelesaikan…';

  @override
  String get solveFast => 'Selesaikan cepat';

  @override
  String get solveLearn => 'Belajar langkah demi langkah';

  @override
  String get solveModeGuided => 'Terpandu (3 mahkota)';

  @override
  String get solveModeFast => 'Cepat (optimal)';

  @override
  String solveUnavailable(int size) {
    return 'Pemecah $size×$size akan hadir di pembaruan berikutnya.';
  }

  @override
  String get solveAlreadySolved => 'Kubus sudah selesai.';

  @override
  String solveFailed(String reason) {
    return 'Kubus ini tidak bisa diselesaikan ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'Mesin pemecah tidak tersedia di perangkat ini.';

  @override
  String get solveComplete => 'Selesai! Kerja bagus.';

  @override
  String solveSummary(int count) {
    return '$count gerakan';
  }

  @override
  String get nextMove => 'Gerakan berikutnya';

  @override
  String get previousMove => 'Gerakan sebelumnya';

  @override
  String get halfTurnHalfway =>
      'Bagus, sudah setengah jalan! Putar sekali lagi ke arah yang sama untuk putaran ganda (180°).';

  @override
  String get wideTurnInner =>
      'Hebat! Sekarang geser lapisan dalam di sebelahnya untuk menyelesaikan putaran lebar.';

  @override
  String get wideTurnOuter =>
      'Hebat! Sekarang geser lapisan luar di sebelahnya untuk menyelesaikan putaran lebar.';

  @override
  String get wideTurnMore =>
      'Hebat! Terus geser lapisan yang menyala satu per satu untuk menyelesaikan putaran lebar.';

  @override
  String get guideSwipeHint =>
      'Geser lapisan yang menyala sesuai arah panah, atau ketuk Berikutnya.';

  @override
  String get guideRotateHint =>
      'Putar seluruh kubus seperti yang ditunjukkan panah: ketuk Berikutnya.';

  @override
  String get guideWrongMove => 'Ikuti panah yang disorot';

  @override
  String get guideExit => 'Keluar dari panduan';

  @override
  String get replayStep => 'Ulangi langkah';

  @override
  String get colorWhite => 'putih';

  @override
  String get colorYellow => 'kuning';

  @override
  String get colorGreen => 'hijau';

  @override
  String get colorBlue => 'biru';

  @override
  String get colorRed => 'merah';

  @override
  String get colorOrange => 'oranye';

  @override
  String get phaseOptimal2x2 => 'Solusi optimal';

  @override
  String get phaseKociemba1 => 'Fase 1 · Orientasikan kepingan';

  @override
  String get phaseKociemba2 => 'Fase 2 · Selesaikan kubus';

  @override
  String get phaseLblCross => 'Silang putih';

  @override
  String get phaseLblCorners => 'Sudut mahkota pertama';

  @override
  String get phaseLblMiddle => 'Rusuk lapisan tengah';

  @override
  String get phaseLblYellowCross => 'Silang kuning';

  @override
  String get phaseLblYellowEdges => 'Selaraskan rusuk silang kuning';

  @override
  String get phaseLblYellowCorners => 'Tempatkan sudut kuning';

  @override
  String get phaseLblYellowCornersOrient => 'Orientasikan sudut kuning';

  @override
  String get crownFirst => 'Mahkota pertama';

  @override
  String get crownSecond => 'Mahkota kedua';

  @override
  String get crownThird => 'Mahkota ketiga';

  @override
  String get crownFirstGoal => 'Sisi putih dan lapisan pertama';

  @override
  String get crownSecondGoal => 'Lapisan tengah';

  @override
  String get crownThirdGoal => 'Sisi kuning dan lapisan terakhir';

  @override
  String crownProgress(int current, int total) {
    return 'Mahkota $current dari $total';
  }

  @override
  String get subStepGoal11 =>
      'Bentuk silang putih yang setiap rusuk putihnya juga cocok dengan warna pusat di sebelahnya.';

  @override
  String get subStepGoal12 =>
      'Masukkan 4 sudut putih ke slotnya untuk menyelesaikan sisi putih dan seluruh cincin pertama.';

  @override
  String get subStepGoal21 =>
      'Masukkan 4 rusuk lapisan tengah tanpa merusak mahkota pertama.';

  @override
  String get subStepGoal31 => 'Bentuk silang kuning di lapisan terakhir.';

  @override
  String get subStepGoal32 =>
      'Tukar rusuk silang kuning sampai masing-masing cocok dengan pusat sisinya.';

  @override
  String get subStepGoal33 =>
      'Pindahkan 4 sudut kuning ke tempat yang benar, meskipun masih terpelintir.';

  @override
  String get subStepGoal34 =>
      'Putar setiap sudut kuning di tempatnya sampai semua stiker cocok dan kubus selesai.';

  @override
  String get explainOptimal2x2 =>
      'Solusi terpendek yang mungkin, ditemukan dengan menelusuri semua posisi 2×2.';

  @override
  String get explainKociemba1 =>
      'Orientasikan semua kepingan dan kumpulkan rusuk lapisan tengah ke lapisan tengah.';

  @override
  String get explainKociemba2 =>
      'Selesaikan hanya dengan U, D, dan putaran setengah, yang menjaga orientasi tersebut.';

  @override
  String get explainLblOrient =>
      'Putar seluruh kubus agar pusat putih menghadap ke bawah.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Turunkan rusuk $piece ke samping pusat putih, dengan warna sampingnya cocok.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'Sudut $piece tersangkut di tempat yang salah. Angkat ke atas dengan R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Putar lapisan atas sampai sudut $piece berada di atas tempatnya.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Ulangi R U R\' U\' sampai sudut $piece masuk ke tempatnya.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'Rusuk $piece ada di lapisan tengah tetapi salah. Keluarkan ke atas.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Putar lapisan atas agar warna samping rusuk $piece cocok dengan pusatnya.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Masukkan rusuk $piece ke kanan: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Masukkan rusuk $piece ke kiri: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Putar lapisan atas untuk menempatkan bentuk kuning sebelum algoritma berikutnya.';

  @override
  String get explainLblYellowCrossAlg =>
      'Bentuk silang kuning dengan F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Putar lapisan atas untuk menyejajarkan rusuk kuning dengan pusatnya.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Tukar rusuk kuning dengan R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Putar sudut kuning ke tempatnya dengan U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Putar lapisan atas untuk membawa sudut kuning berikutnya yang belum selesai ke depan kanan.';

  @override
  String get explainLblCornerTwist =>
      'Ulangi R\' D\' R D sampai kuning menghadap ke atas. Lapisan bawah akan beres sendiri di akhir.';

  @override
  String get explainLblFinalAlign =>
      'Putar lapisan atas untuk menyelesaikan kubus.';

  @override
  String scanTitle(int size) {
    return 'Pindai $size×$size';
  }

  @override
  String get scanManualInput => 'Masukkan warna secara manual';

  @override
  String get scanUseCamera => 'Pindai dengan kamera';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Sisi $current dari $total';
  }

  @override
  String get faceUp => 'Sisi atas';

  @override
  String get faceRight => 'Sisi kanan';

  @override
  String get faceFront => 'Sisi depan';

  @override
  String get faceDown => 'Sisi bawah';

  @override
  String get faceLeft => 'Sisi kiri';

  @override
  String get faceBack => 'Sisi belakang';

  @override
  String get scanHintFront =>
      'Pegang kubus dengan sisi mana pun menghadapmu. Itulah sisi depanmu: jaga sisi atas tetap sama selama memindai.';

  @override
  String get scanHintRight =>
      'Dari depan, putar seluruh kubus sekali ke kiri agar sisi kanan menghadapmu.';

  @override
  String get scanHintBack =>
      'Dari depan, putar seluruh kubus dua kali ke kiri.';

  @override
  String get scanHintLeft => 'Dari depan, putar seluruh kubus sekali ke kanan.';

  @override
  String get scanHintUp =>
      'Dari depan, miringkan bagian atas ke arahmu agar menghadap kamera.';

  @override
  String get scanHintDown =>
      'Dari depan, miringkan bagian bawah ke arahmu agar menghadap kamera.';

  @override
  String get scanAlignHint =>
      'Penuhi kisi dengan sisi kubus, lalu ketuk tombol rana.';

  @override
  String get scanCapture => 'Ambil sisi';

  @override
  String get scanTurnLeft => 'Putar seluruh kubus ke kiri';

  @override
  String get scanTurnRight => 'Putar seluruh kubus ke kanan';

  @override
  String get scanTipTop => 'Miringkan bagian atas ke arahmu';

  @override
  String get scanTipBottom => 'Miringkan bagian bawah ke arahmu';

  @override
  String get scanGlareTip =>
      'Ada silau: miringkan kubus sedikit, atau pegang ponsel di atasnya untuk menghalangi lampu dari atas.';

  @override
  String get scanDimTip =>
      'Terlalu redup: pindah ke tempat yang lebih terang atau nyalakan senter.';

  @override
  String get scanTorch => 'Senter';

  @override
  String get scanGuideLabel =>
      'Panduan pindai: sisi yang sudah dipindai tampil berwarna. Ketuk sisi yang sudah dipindai untuk memindainya lagi.';

  @override
  String get scanTapToRescan =>
      'Ketuk sisi yang sudah dipindai untuk memindainya lagi.';

  @override
  String get scanCameraMissing => 'Tidak ada kamera di perangkat ini.';

  @override
  String get scanCameraDenied =>
      'Akses kamera ditolak. Kamu tetap bisa memasukkan warna secara manual.';

  @override
  String get scanCameraFailed => 'Kamera tidak dapat dimulai.';

  @override
  String get scanAllGood => 'Semua stiker terlihat benar.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stiker terlihat salah',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Ada yang tidak cocok';

  @override
  String scanIssueColors(int count) {
    return 'Setiap warna harus muncul tepat $count kali.';
  }

  @override
  String get scanIssueCenters => 'Dua pusat memiliki warna yang sama.';

  @override
  String get scanIssuePieces =>
      'Stiker-stiker ini membentuk kepingan yang tidak ada pada kubus asli.';

  @override
  String get scanIssueTwist => 'Satu sudut terpelintir. Periksa stiker sudut.';

  @override
  String get scanIssueFlip => 'Satu rusuk terbalik. Periksa stiker rusuk.';

  @override
  String get scanIssueParity => 'Dua kepingan tampaknya tertukar.';

  @override
  String get scanIssueUnavailable =>
      'Pemeriksaan warna tidak tersedia di perangkat ini.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stiker sulit dibaca: periksa sebentar.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Ketuk stiker untuk mengganti warnanya · Tekan lama untuk palet';

  @override
  String get scanRescanFace => 'Pindai ulang satu sisi';

  @override
  String get scanCancelRescan => 'Kembali ke warna';

  @override
  String get scanPaletteTitle => 'Pilih warna';

  @override
  String get scanOpen3d => 'Buka dalam 3D';

  @override
  String get scanRestart => 'Mulai dari awal';

  @override
  String get modeTimer => 'Timer kecepatan';

  @override
  String get modeTimerDesc => 'Acakan, inspeksi, rata-rata, dan rekor pribadi.';

  @override
  String get modeDaily => 'Tantangan harian';

  @override
  String get modeDailyDesc => 'Acakan baru setiap hari. Jaga runtutanmu.';

  @override
  String get modePatterns => 'Pustaka pola';

  @override
  String get modePatternsDesc =>
      'Papan catur, superflip, dan lainnya, dalam 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Runtutan $count hari',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Lanjutkan belajar';

  @override
  String get startLearning => 'Mulai belajar';

  @override
  String lessonOf(int index, int total) {
    return 'Pelajaran $index dari $total';
  }

  @override
  String get academyAllDone => 'Semua pelajaran selesai!';

  @override
  String get academyTitle => 'Akademi';

  @override
  String academyProgress(int done, int total) {
    return '$done dari $total pelajaran selesai';
  }

  @override
  String get lessonAdvanced => 'Lanjutan';

  @override
  String get lessonDone => 'Selesai';

  @override
  String lessonPartOf(int index, int total) {
    return 'Bagian $index dari $total';
  }

  @override
  String get lessonBack => 'Kembali';

  @override
  String get lessonNext => 'Lanjut';

  @override
  String get lessonFinish => 'Selesaikan pelajaran';

  @override
  String get lessonComplete => 'Pelajaran selesai!';

  @override
  String get lessonNextLesson => 'Pelajaran berikutnya';

  @override
  String get lessonBackToAcademy => 'Kembali ke Akademi';

  @override
  String get lessonTryIt =>
      'Giliranmu: geser lapisan yang ditunjuk panah, atau ketuk Gerakan berikutnya.';

  @override
  String get lessonLookAround =>
      'Geser latar untuk melihat kubus dari segala sisi.';

  @override
  String get lessonDemoDone => 'Bagus! Ketuk Lanjut untuk meneruskan.';

  @override
  String holdPrompt(String top, String front) {
    return 'Pegang kubus dengan pusat $top di atas dan pusat $front menghadapmu.';
  }

  @override
  String get trackBeginner => '3×3 pemula: 3 mahkota';

  @override
  String get trackCfop => 'Pengenalan CFOP';

  @override
  String get trackTwoByTwo => '2×2 pemula & Ortega';

  @override
  String get trackBigCubes => 'Kubus besar: reduksi & paritas';

  @override
  String moveSentence(String layer, String direction) {
    return 'Putar $layer $direction';
  }

  @override
  String get moveFaceR => 'sisi kanan';

  @override
  String get moveFaceL => 'sisi kiri';

  @override
  String get moveFaceU => 'sisi atas';

  @override
  String get moveFaceD => 'sisi bawah';

  @override
  String get moveFaceF => 'sisi depan';

  @override
  String get moveFaceB => 'sisi belakang';

  @override
  String moveLayerInner(int depth, String face) {
    return 'lapisan ke-$depth dari $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face (sedalam $depth lapisan)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'lapisan $near–$far dari $face';
  }

  @override
  String get moveLayerMiddle => 'lapisan tengah';

  @override
  String get moveDirUp => 'ke atas';

  @override
  String get moveDirDown => 'ke bawah';

  @override
  String get moveDirLeft => 'ke kiri';

  @override
  String get moveDirRight => 'ke kanan';

  @override
  String get moveDirClockwise => 'searah jarum jam';

  @override
  String get moveDirCounter => 'berlawanan arah jarum jam';

  @override
  String get moveDirBackClockwise => 'searah jarum jam, dilihat dari belakang';

  @override
  String get moveDirBackCounter =>
      'berlawanan arah jarum jam, dilihat dari belakang';

  @override
  String get moveDirHalf => 'setengah putaran (dua kali)';

  @override
  String get moveRotateX => 'Miringkan seluruh kubus: sisi depan naik ke atas';

  @override
  String get moveRotateXPrime =>
      'Miringkan seluruh kubus: sisi depan turun ke bawah';

  @override
  String get moveRotateX2 =>
      'Balikkan seluruh kubus: sisi depan pindah ke belakang';

  @override
  String get moveRotateY => 'Putar seluruh kubus: sisi depan bergeser ke kiri';

  @override
  String get moveRotateYPrime =>
      'Putar seluruh kubus: sisi depan bergeser ke kanan';

  @override
  String get moveRotateY2 =>
      'Putar seluruh kubus setengah putaran: sisi belakang pindah ke depan';

  @override
  String get moveRotateZ =>
      'Gulingkan seluruh kubus searah jarum jam: sisi atas bergeser ke kanan';

  @override
  String get moveRotateZPrime =>
      'Gulingkan seluruh kubus berlawanan arah jarum jam: sisi atas bergeser ke kiri';

  @override
  String get moveRotateZ2 =>
      'Jungkirkan seluruh kubus: sisi atas pindah ke bawah';

  @override
  String get phaseReductionCenters => 'Pusat';

  @override
  String get phaseReductionEdges => 'Pasangkan rusuk';

  @override
  String get phaseReductionEdgeParity => 'Paritas rusuk';

  @override
  String get phaseReductionOllParity => 'Paritas OLL';

  @override
  String get phaseReductionPllParity => 'Paritas PLL';

  @override
  String get explainReductionCenterBlock =>
      'Putaran irisan yang membawa beberapa kepingan pusat ke tempatnya sekaligus.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Bawa kepingan pusat $piece ke sisinya dengan siklus-3 yang tidak mengganggu pusat yang sudah jadi.';
  }

  @override
  String get explainReductionParityCenters =>
      'Susun ulang pusat yang bergeser karena putaran paritas.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Gabungkan kepingan rusuk $piece dengan siklus-3; pusat tetap selesai.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Rusuk terakhir tidak bisa dipasangkan hanya dengan siklus-3 (paritas rusuk). Satu putaran irisan dalam akan memperbaikinya.';

  @override
  String get explainReductionOllParity =>
      'Paritas OLL: satu rusuk terbalik, hal yang mustahil pada 3×3. Algoritma ini membaliknya kembali.';

  @override
  String get explainReductionPllParity =>
      'Paritas PLL: dua rusuk tertukar, hal yang mustahil pada 3×3. Algoritma ini menukarnya kembali.';

  @override
  String get patternsTitle => 'Pustaka pola';

  @override
  String get patternsHint =>
      'Ketuk sebuah pola untuk melihatnya, lalu ikuti di kubusmu sendiri.';

  @override
  String get patternCheckerboard => 'Papan catur';

  @override
  String get patternCubeInCube => 'Kubus dalam kubus';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Titik';

  @override
  String get patternCross => 'Silang';

  @override
  String get patternPython => 'Piton';

  @override
  String get phasePattern => 'Bentuk polanya';

  @override
  String get explainPatternStep =>
      'Ikuti setiap gerakan di kubusmu sendiri. Ketuk Selesaikan untuk mengembalikannya.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Timer kecepatan';

  @override
  String get timerHoldToStart => 'Tahan, lalu lepas untuk mulai';

  @override
  String get timerReleaseToStart => 'Lepas untuk mulai';

  @override
  String get timerTapToStop => 'Ketuk di mana saja untuk berhenti';

  @override
  String get timerInspecting => 'Inspeksi: tahan, lalu lepas untuk mulai';

  @override
  String get timerTapToInspect => 'Ketuk untuk memulai inspeksi 15 detik';

  @override
  String get timerInspectionToggle => 'Inspeksi 15 dtk';

  @override
  String get timerNewScramble => 'Acakan baru';

  @override
  String get timerLoadingScramble => 'Membuat acakan…';

  @override
  String get timerPb => 'Terbaik';

  @override
  String get timerSolves => 'Penyelesaian';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Hapus';

  @override
  String get timerHistory => 'Riwayat';

  @override
  String get timerNoSolves => 'Belum ada penyelesaian. Acak kubusmu dan mulai!';

  @override
  String get timerNewPb => 'Rekor pribadi baru!';

  @override
  String get timerClearHistory => 'Hapus riwayat';

  @override
  String get timerScrambleHint =>
      'Pegang putih di atas dan hijau di depan, lalu acak:';

  @override
  String get dailyTitle => 'Tantangan harian';

  @override
  String dailyFor(String date) {
    return 'Tantangan untuk $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Runtutan terbaik: $count';
  }

  @override
  String get dailyDone => 'Selesai untuk hari ini! Kembali lagi besok.';

  @override
  String get dailyNotDone =>
      'Selesaikan acakan hari ini untuk menjaga runtutanmu.';

  @override
  String get dailySolveVirtual => 'Selesaikan di kubus 3D';

  @override
  String get dailyTimeIt => 'Catat waktunya di kubusmu';

  @override
  String get dailyHint => 'Petunjuk';

  @override
  String dailyHintText(String moves) {
    return 'Mulai dengan silang putih: $moves';
  }

  @override
  String get dailyHintFailed => 'Belum ada petunjuk saat ini.';

  @override
  String get lessonBasics => 'Kenali kubus';

  @override
  String get lessonBasicsDesc => 'Kepingan, sisi, dan nama gerakan.';

  @override
  String get stepBasicsPieces => 'Tiga jenis kepingan';

  @override
  String get stepBasicsPiecesBody =>
      'Pusat tidak pernah berpindah dan memberi warna pada setiap sisi. Rusuk punya dua warna, sudut punya tiga. Menyelesaikan kubus berarti memindahkan setiap rusuk dan sudut ke samping pusat yang warnanya cocok.';

  @override
  String get stepBasicsFaces => 'Enam huruf sisi';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F, dan B adalah sisi kanan, kiri, atas, bawah, depan, dan belakang. Huruf saja berarti seperempat putaran searah jarum jam, seolah kamu melihat langsung ke sisi itu.';

  @override
  String get stepBasicsPrime => 'Putaran prime dan ganda';

  @override
  String get stepBasicsPrimeBody =>
      'Tanda petik (R\') berarti putar ke arah sebaliknya, berlawanan arah jarum jam. Angka 2 (U2) berarti setengah putaran: dua kali seperempat putaran.';

  @override
  String get stepCrossGoal => 'Tujuannya';

  @override
  String get stepCrossGoalBody =>
      'Pegang kuning di atas. Keempat rusuk putih mengelilingi pusat putih di bawah, dan warna samping masing-masing cocok dengan pusat di sebelahnya.';

  @override
  String get stepCrossTop => 'Rusuk di atas';

  @override
  String get stepCrossTopBody =>
      'Cari rusuk putih di atas. Putar lapisan atas sampai warna sampingnya berada di atas pusat yang cocok, lalu putar sisi itu dua kali untuk menurunkannya.';

  @override
  String get stepCrossMiddle => 'Rusuk di tengah';

  @override
  String get stepCrossMiddleBody =>
      'Rusuk yang tersangkut di lapisan tengah dinaikkan dulu: putar sisinya ke atas, geser lapisan atas agar tidak menghalangi, lalu kembalikan sisinya supaya silang tetap utuh. Setelah itu tempatkan dari atas.';

  @override
  String get stepCornersInsert => 'Di atas tempatnya';

  @override
  String get stepCornersInsertBody =>
      'Putar lapisan atas sampai sebuah sudut putih berada di atas tempat warnanya, di depan kanan. R U R\' U\' akan memasukkannya.';

  @override
  String get stepCornersRepeat => 'Ulangi pemicunya';

  @override
  String get stepCornersRepeatBody =>
      'Jika putih menghadap ke arah yang salah, terus ulangi R U R\' U\' di tempat yang sama. Setiap sudut selesai paling banyak dalam lima kali ulangan.';

  @override
  String get stepMiddleRight => 'Rusuk ke kanan';

  @override
  String get stepMiddleRightBody =>
      'Sejajarkan rusuk atas dengan pusatnya di sisi depan. Jika warna atasnya cocok dengan pusat kanan, masukkan dengan U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Rusuk ke kiri';

  @override
  String get stepMiddleLeftBody =>
      'Jika warna atasnya cocok dengan pusat kiri, gunakan versi cerminnya: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Satu algoritma';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' mengubah titik kuning menjadi bentuk L, L menjadi garis, dan garis menjadi silang. Pegang L di kiri belakang dan garis dalam posisi mendatar.';

  @override
  String get stepYellowEdges => 'Cocokkan rusuk';

  @override
  String get stepYellowEdgesBody =>
      'Putar lapisan atas sampai dua rusuk cocok dengan pusatnya. Dengan satu di belakang dan satu di kanan, R U R\' U R U2 R\' U menukar dua rusuk lainnya.';

  @override
  String get stepPlaceCorners => 'Tempatkan';

  @override
  String get stepPlaceCornersBody =>
      'Pegang sudut yang sudah di tempatnya di depan kanan. U R U\' L\' U R\' U\' L memindahkan tiga sudut lainnya; ulangi sampai keempatnya di tempatnya.';

  @override
  String get stepTwistCorners => 'Putar';

  @override
  String get stepTwistCornersBody =>
      'Dengan sudut yang belum selesai di depan kanan, ulangi R\' D\' R D sampai kuning di atas, lalu putar lapisan atas saja untuk membawa sudut berikutnya. Lapisan bawah akan terlihat berantakan sampai akhir: teruskan saja.';

  @override
  String get lessonCfopIntro => 'Apa itu CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Empat tahap';

  @override
  String get stepCfopOverviewBody =>
      'Speedcuber menyelesaikan silang, memasangkan setiap sudut lapisan pertama dengan rusuk tengahnya (F2L), mengorientasikan lapisan terakhir (OLL), lalu mempermutasikannya (PLL).';

  @override
  String get stepCfopCross => 'Rencanakan silang';

  @override
  String get stepCfopCrossBody =>
      'Dalam CFOP, silang direncanakan saat inspeksi dan dibentuk di bawah dalam sekitar delapan gerakan.';

  @override
  String get lessonF2l => 'Dasar F2L';

  @override
  String get lessonF2lDesc => 'Pasangkan sudut dengan rusuknya.';

  @override
  String get stepF2lRight => 'Masukkan sepasang';

  @override
  String get stepF2lRightBody =>
      'Saat sebuah sudut dan rusuknya bersebelahan di atas, bawa keduanya ke atas slotnya dan masukkan bersama-sama.';

  @override
  String get stepF2lLeft => 'Pasangan kiri';

  @override
  String get stepF2lLeftBody =>
      'Kasus yang sama di sisi lain adalah cerminnya, U\' L\' U L. Memutar kubus (y) memungkinkanmu memakai tangan yang lebih nyaman.';

  @override
  String get lessonOll => 'OLL dua tahap';

  @override
  String get lessonOllDesc => 'Buat bagian atas menjadi kuning.';

  @override
  String get stepOllCross => 'Rusuk lebih dulu';

  @override
  String get stepOllCrossBody =>
      'OLL dua tahap dimulai dengan algoritma silang kuning yang sudah kamu kenal.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Dengan satu sudut kuning menghadap ke atas di depan kiri, Sune (R U R\' U R U2 R\') mengorientasikan tiga sudut lainnya. Sebagian besar kasus lain memakai Sune dan cerminnya.';

  @override
  String get lessonPll => 'PLL dua tahap';

  @override
  String get lessonPllDesc => 'Selesaikan kubus.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm menukar dua sudut dan dua rusuk. Gunakan untuk menempatkan sudut: pegang dua sudut yang harus ditukar di sebelah kanan.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Setelah sudut selesai, U-perm memutar tiga rusuk. Letakkan sisi yang sudah selesai di belakang.';

  @override
  String get lessonTwoFirst => 'Lapisan pertama 2×2';

  @override
  String get lessonTwoFirstDesc => 'Bentuk satu sisi dengan sudut yang cocok.';

  @override
  String get stepTwoIntro => 'Hanya sudut';

  @override
  String get stepTwoIntroBody =>
      '2×2 adalah 3×3 tanpa rusuk dan pusat. Pilih satu warna, bentuk sisi itu di bawah, dan cocokkan warna samping sudut-sudut yang bersebelahan.';

  @override
  String get stepTwoCorner => 'Masukkan sudut';

  @override
  String get stepTwoCornerBody =>
      'Persis seperti sudut putih pada 3×3: bawa sudut ke atas tempatnya dan gunakan R U R\' U\' sampai pas.';

  @override
  String get lessonTwoOll => 'Orientasikan bagian atas';

  @override
  String get lessonTwoOllDesc => 'OLL Ortega dengan Sune.';

  @override
  String get stepTwoSune => 'Sune lagi';

  @override
  String get stepTwoSuneBody =>
      'Sune juga membuat bagian atas 2×2 menjadi kuning. Pengguna Ortega mempelajari tujuh kasus pendek; Sune dan cerminnya mencakup sebagian besar.';

  @override
  String get lessonTwoPbl => 'Permutasi kedua lapisan';

  @override
  String get lessonTwoPblDesc => 'Tukar sudut untuk menyelesaikan.';

  @override
  String get stepTwoAdjacent => 'Tukar berdampingan';

  @override
  String get stepTwoAdjacentBody =>
      'Jika dua sudut atas yang bersebelahan harus ditukar, pegang keduanya di kanan dan gunakan T-perm.';

  @override
  String get stepTwoDiagonal => 'Tukar diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Dua sudut di posisi berseberangan ditukar dengan Y-perm.';

  @override
  String get lessonBigIntro => 'Kepingan kubus besar';

  @override
  String get lessonBigIntroDesc => 'Pusat, sayap, dan irisan.';

  @override
  String get stepBigPieces => 'Pusat tidak tetap';

  @override
  String get stepBigPiecesBody =>
      'Pada 4×4, setiap sisi punya empat kepingan pusat yang bisa berpindah, dan setiap rusuk terdiri dari dua sayap. Reduksi mengelompokkannya agar kubus berperilaku seperti 3×3.';

  @override
  String get stepBigSlices => 'Putaran lebar dan dalam';

  @override
  String get stepBigSlicesBody =>
      'Rw memutar dua lapisan kanan bersama-sama. 2R hanya memutar lapisan kedua dari kanan. Putaran ini memindahkan pusat dan sayap.';

  @override
  String get lessonBigCenters => 'Pusat';

  @override
  String get lessonBigCentersDesc => 'Kelompokkan kepingan pusat.';

  @override
  String get stepBigCenterCycle => 'Siklus-3 pusat';

  @override
  String get stepBigCenterCycleBody =>
      'Komutator ini memindahkan tepat tiga kepingan pusat dan tidak menyentuh yang lain, jadi pusat yang sudah jadi tetap jadi.';

  @override
  String get lessonBigEdges => 'Pasangkan rusuk';

  @override
  String get lessonBigEdgesDesc => 'Gabungkan sayap menjadi rusuk utuh.';

  @override
  String get stepBigEdgePair => 'Pasangkan & pulihkan';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' menyejajarkan dua sayap yang cocok, R U R\' F R\' F\' R menukar masuk rusuk yang belum berpasangan, dan Uw mengembalikan pusat.';

  @override
  String get lessonBigParity => 'Paritas';

  @override
  String get lessonBigParityDesc => 'Paritas OLL dan PLL pada kubus genap.';

  @override
  String get stepBigOllParity => 'Paritas OLL';

  @override
  String get stepBigOllParityBody =>
      'Satu rusuk terbalik tidak mungkin terjadi pada 3×3. Pada kubus genap, algoritma ini membalik kembali rusuk depan atas. Algoritma ini bisa mengacak sisa lapisan atas, yang toh akan diperbaiki oleh langkah terakhir 3×3.';

  @override
  String get stepBigPllParity => 'Paritas PLL';

  @override
  String get stepBigPllParityBody =>
      'Dua rusuk tertukar di bagian paling akhir? 2R2 U2 2R2 Uw2 2R2 Uw2 menukar rusuk atas depan dan belakang.';

  @override
  String get introGoalHeading => 'Apa tujuannya?';

  @override
  String get introHowHeading => 'Bagaimana caranya?';

  @override
  String get introStart => 'Paham, mulai langkah demi langkah';

  @override
  String get introShowGoal => 'Lihat tujuan';

  @override
  String get introStateStart => 'Awal';

  @override
  String get introStateGoal => 'Tujuan';

  @override
  String get introPlayMorph => 'Putar dari awal ke tujuan';

  @override
  String get introGoalBasics =>
      'Belajar membaca kubus: kepingnya, keenam sisinya, dan cara huruf gerakan memutarnya.';

  @override
  String get introGoalCross =>
      'Buat silang putih yang setiap rusuk putihnya juga cocok dengan warna pusat di sebelahnya.';

  @override
  String get introGoalCorners =>
      'Isi keempat sudut putih sehingga mahkota pertama, seluruh lapisan putih, selesai.';

  @override
  String get introGoalMiddle =>
      'Tempatkan keempat rusuk lapisan tengah sehingga dua lapisan pertama selesai.';

  @override
  String get introGoalYellowCross =>
      'Buat silang kuning di atas; warna sampingnya belum perlu cocok.';

  @override
  String get introGoalYellowEdges =>
      'Cocokkan setiap rusuk silang kuning dengan warna pusat di sisinya.';

  @override
  String get introGoalYellowCorners =>
      'Pindahkan setiap sudut kuning ke tempatnya, meskipun masih terpelintir.';

  @override
  String get introGoalTwistCorners =>
      'Putar sudut kuning ke arah yang benar sehingga seluruh kubus selesai.';

  @override
  String get introGoalCfopIntro =>
      'Kenali rencana speedcubing: silang, dua lapisan pertama, lalu lapisan terakhir dalam dua tahap.';

  @override
  String get introGoalF2l =>
      'Masukkan setiap sudut putih bersama rusuk tengahnya dan selesaikan dua lapisan sekaligus.';

  @override
  String get introGoalOll =>
      'Buat seluruh sisi atas kuning dengan satu atau dua algoritma.';

  @override
  String get introGoalPll =>
      'Pindahkan keping lapisan terakhir ke tempatnya untuk menyelesaikan kubus.';

  @override
  String get introGoalTwoFirst =>
      'Buat satu lapisan putih yang lengkap pada 2×2.';

  @override
  String get introGoalTwoOll => 'Buat seluruh sisi atas 2×2 berwarna kuning.';

  @override
  String get introGoalTwoPbl =>
      'Tukar sudut terakhir ke tempatnya untuk menyelesaikan 2×2.';

  @override
  String get introGoalBigIntro =>
      'Kenali 4×4: pusat, pasangan rusuk, sudut, dan gerakan yang memutarnya.';

  @override
  String get introGoalBigCenters =>
      'Kumpulkan keping pusat tiap sisi menjadi satu blok berwarna sama.';

  @override
  String get introGoalBigEdges =>
      'Pasangkan keping rusuk yang cocok sehingga setiap rusuk tampak seperti satu rusuk 3×3.';

  @override
  String get introGoalBigParity =>
      'Atasi dua kasus 4×4 yang tidak ada di 3×3: satu rusuk terbalik atau dua rusuk tertukar.';

  @override
  String get introHowBasics =>
      'Pusat tidak pernah berpindah, jadi pusat menunjukkan warna tiap sisi.\nSetiap huruf memutar satu sisi seperempat putaran searah jarum jam.\nTanda petik (\') memutar balik; angka 2 memutar dua kali.';

  @override
  String get introHowCross =>
      'Pegang kuning di atas: silang putih dibuat di bawah.\nCari rusuk putih dan sejajarkan warna sampingnya dengan pusat yang cocok.\nPutar sisi itu dua kali untuk menurunkan rusuk ke tempatnya.';

  @override
  String get introHowCorners =>
      'Bawa sudut putih ke atas tempat kosongnya.\nUlangi R U R\' U\' sampai sudut masuk dengan arah yang benar.\nLakukan hal yang sama untuk tiga sudut lainnya.';

  @override
  String get introHowMiddle =>
      'Cari rusuk atas tanpa kuning dan cocokkan warna depannya dengan pusat.\nKirim ke kanan atau ke kiri dengan algoritma pendek 8 gerakan.\nLapisan putih selalu kembali utuh.';

  @override
  String get introHowYellowCross =>
      'Lihat sisi atas: titik, huruf L, atau garis.\nPegang seperti contoh lalu lakukan F R U R\' U\' F\'.\nUlangi sampai silang kuning muncul.';

  @override
  String get introHowYellowEdges =>
      'Putar lapisan atas sampai dua rusuk cocok dengan pusatnya.\nTaruh keduanya di belakang dan kanan, lalu lakukan R U R\' U R U2 R\' U.\nUlangi sampai keempat rusuk cocok.';

  @override
  String get introHowYellowCorners =>
      'Sudut ada di tempatnya jika warnanya cocok dengan tiga sisi di sekitarnya.\nTaruh satu sudut yang sudah benar di depan kanan.\nU R U\' L\' U R\' U\' L menggilir tiga sudut lainnya sampai semuanya pas.';

  @override
  String get introHowTwistCorners =>
      'Pegang sudut yang belum beres di depan kanan.\nUlangi R\' D\' R D sampai warna kuningnya menghadap atas.\nPutar hanya lapisan atas untuk sudut berikutnya; lapisan bawah beres sendiri di akhir.';

  @override
  String get introHowCfopIntro =>
      'Silang: empat rusuk yang direncanakan saat inspeksi.\nF2L: setiap sudut masuk bersama rusuknya.\nOLL membuat sisi atas kuning, lalu PLL memindahkan keping ke tempatnya.';

  @override
  String get introHowF2l =>
      'Cari sudut dan rusuk pasangannya di lapisan atas.\nPasangkan keduanya di atas slotnya.\nMasukkan pasangan itu dengan tiga atau empat gerakan.';

  @override
  String get introHowOll =>
      'Pertama silang kuning dengan F R U R\' U\' F\'.\nLalu orientasikan sudut, misalnya dengan Sune.\nKenali kasusnya dari pola kuning yang terlihat.';

  @override
  String get introHowPll =>
      'Sisi atas sudah kuning semua.\nT-perm menukar sudut; U-perm menggilir tiga rusuk.\nBaca warna samping untuk memilih algoritma.';

  @override
  String get introHowTwoFirst =>
      '2×2 hanya berisi sudut, seperti 3×3 tanpa rusuk.\nBawa setiap sudut putih ke atas tempatnya.\nUlangi R U R\' U\' sampai sudut masuk.';

  @override
  String get introHowTwoOll =>
      'Biarkan lapisan putih di bawah.\nSune (R U R\' U R U2 R\') memutar sudut-sudut atas.\nUlangi dari sudut pandang yang tepat sampai sisi atas kuning semua.';

  @override
  String get introHowTwoPbl =>
      'Cari sisi yang dua sudutnya sudah cocok.\nTukar bersebelahan: satu algoritma bergaya T-perm.\nTukar diagonal: satu algoritma yang sedikit lebih panjang.';

  @override
  String get introHowBigIntro =>
      'Tidak ada pusat yang tetap: empat keping pusat membentuk warna tiap sisi.\nGerakan lebar seperti Rw memutar dua lapisan sekaligus.\nGerakan dalam seperti 2R hanya memutar satu irisan dalam.';

  @override
  String get introHowBigCenters =>
      'Buat dulu dua pusat yang berseberangan.\nIrisan dalam menukar keping pusat tanpa merusak pusat yang sudah jadi.\nSelesaikan empat pusat terakhir dengan cara yang sama.';

  @override
  String get introHowBigEdges =>
      'Cari dua keping rusuk dengan warna yang sama.\nJajarkan keduanya dengan irisan dalam.\nSimpan pasangan itu lalu kembalikan pusatnya.';

  @override
  String get introHowBigParity =>
      'Selesaikan 4×4 seperti 3×3 sampai macet.\nSatu rusuk terbalik: algoritma panjang paritas OLL.\nDua rusuk tertukar: 2R2 U2 2R2 Uw2 2R2 Uw2.';
}
