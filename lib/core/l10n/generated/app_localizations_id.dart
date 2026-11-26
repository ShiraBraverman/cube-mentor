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
  String get solveModeGuided => 'Terpandu (3 lapisan)';

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
  String get phaseLblCorners => 'Sudut lapisan pertama';

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
  String get crownFirst => 'Lapisan pertama';

  @override
  String get crownSecond => 'Lapisan kedua';

  @override
  String get crownThird => 'Lapisan ketiga';

  @override
  String get crownFirstGoal => 'Sisi putih dan lapisan pertama';

  @override
  String get crownSecondGoal => 'Lapisan tengah';

  @override
  String get crownThirdGoal => 'Sisi kuning dan lapisan terakhir';

  @override
  String get subStepGoal11 =>
      'Bentuk silang putih yang setiap rusuk putihnya juga cocok dengan warna pusat di sebelahnya.';

  @override
  String get subStepGoal12 =>
      'Masukkan 4 sudut putih ke tempatnya untuk menyelesaikan sisi putih dan seluruh lapisan pertama.';

  @override
  String get subStepGoal21 =>
      'Masukkan 4 rusuk lapisan tengah tanpa merusak lapisan pertama.';

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
  String lessonPartOf(int index, int total) {
    return 'Bagian $index dari $total';
  }

  @override
  String get lessonNext => 'Lanjut';

  @override
  String get lessonPrevious => 'Sebelumnya';

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
      'Giliranmu: geser lapisan yang ditunjuk panah, atau ketuk Lanjut.';

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
  String get trackBeginner => '3×3 pemula: lapis demi lapis';

  @override
  String get trackCfop => 'Pengenalan CFOP';

  @override
  String get trackTwoByTwo => '2×2 pemula & Ortega';

  @override
  String get trackBigCubes => 'Kubus besar: reduksi & parity';

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
  String get phaseReductionEdgeParity => 'Parity rusuk';

  @override
  String get phaseReductionOllParity => 'OLL parity';

  @override
  String get phaseReductionPllParity => 'PLL parity';

  @override
  String get explainReductionCenterBlock =>
      'Putaran irisan yang membawa beberapa kepingan pusat ke tempatnya sekaligus.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Bawa kepingan pusat $piece ke sisinya dengan siklus-3 yang tidak mengganggu pusat yang sudah jadi.';
  }

  @override
  String get explainReductionParityCenters =>
      'Susun ulang pusat yang bergeser karena putaran parity.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Gabungkan kepingan rusuk $piece dengan siklus-3; pusat tetap selesai.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Rusuk terakhir tidak bisa dipasangkan hanya dengan siklus-3 (parity rusuk). Satu putaran irisan dalam akan memperbaikinya.';

  @override
  String get explainReductionOllParity =>
      'OLL parity: satu rusuk terbalik, hal yang mustahil pada 3×3. Algoritma ini membaliknya kembali.';

  @override
  String get explainReductionPllParity =>
      'PLL parity: dua rusuk tertukar, hal yang mustahil pada 3×3. Algoritma ini menukarnya kembali.';

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
  String get timerInspectionToggle => 'Inspeksi 15 dtk';

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
      'Pegang kuning di atas dan hijau menghadapmu. Kumpulkan dulu empat rusuk putih di sekeliling pusat kuning, putih menghadap atas, seperti kelopak: itulah bunga. Lalu tiap kelopak turun ke pusat putih dengan warna samping cocok dengan pusat di sebelahnya.';

  @override
  String get stepCrossTop => 'Rusuk di atas';

  @override
  String get stepCrossTopBody =>
      'Rusuk putih di atas dengan putih menghadap atas adalah kelopak bunga. Putar lapisan atas sampai warna sampingnya tepat di atas pusat yang sewarna, lalu putar sisi itu dua kali (180°) untuk menurunkannya ke pusat putih.';

  @override
  String get stepCrossMiddle => 'Rusuk di tengah';

  @override
  String get stepCrossMiddleBody =>
      'Rusuk yang tersangkut di lapisan tengah naik dulu: putar sisinya ke atas, geser lapisan atas, lalu kembalikan sisinya agar keping yang sudah dipasang tetap. Sekarang ia kelopak di atas: sejajarkan dan putar sisi itu dua kali.';

  @override
  String get stepCornersInsert => 'Di atas tempatnya';

  @override
  String get stepCornersInsertBody =>
      'Putar lapisan atas sampai sudut putih tepat di atas slotnya, di antara dua pusat yang sewarna dengan warna sampingnya. Di sini cukup satu putaran atas dan R U\' R\': U membawa sudut ke atas slot, R U\' R\' memasukkannya dengan putih di bawah.';

  @override
  String get stepCornersRepeat => 'Ulangi pemicunya';

  @override
  String get stepCornersRepeatBody =>
      'Pegang slot di depan kanan dan ulangi R U R\' U\' sampai putih di bawah: sekali jika putih menghadap kanan, tiga kali jika ke atas, lima kali jika menghadapmu. Bagian atas tampak berantakan sementara; nanti rapi sendiri.';

  @override
  String get stepMiddleRight => 'Rusuk ke kanan';

  @override
  String get stepMiddleRightBody =>
      'Cari rusuk atas tanpa kuning. Putar lapisan atas sampai warna depannya cocok dengan pusat di depanmu. Jika warna atasnya cocok dengan pusat kanan, kirim ke kanan: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Rusuk ke kiri';

  @override
  String get stepMiddleLeftBody =>
      'Jika warna atasnya cocok dengan pusat kiri, pakai cerminnya: U\' L\' U L U F U\' F\'. Lapisan putih selalu kembali utuh.';

  @override
  String get stepYellowCross => 'Satu algoritma';

  @override
  String get stepYellowCrossBody =>
      'Lihat hanya rusuk kuning di atas. Pegang L di belakang kiri dan garis dari kiri ke kanan, lalu lakukan F R U R\' U\' F\'. Garis butuh sekali, L dua kali, titik sampai tiga kali.';

  @override
  String get stepYellowEdges => 'Cocokkan rusuk';

  @override
  String get stepYellowEdgesBody =>
      'Putar lapisan atas sampai dua rusuk cocok dengan pusatnya. Dengan satu di belakang dan satu di kanan, R U R\' U R U2 R\' U menukar rusuk depan dan kiri.';

  @override
  String get stepPlaceCorners => 'Tempatkan';

  @override
  String get stepPlaceCornersBody =>
      'Sudut sudah di tempatnya jika warnanya cocok dengan tiga pusat di sekitarnya, meski terpelintir. Pegang sudut seperti itu di depan kanan: U R U\' L\' U R\' U\' L memutar tiga lainnya. Ulangi sampai keempatnya di tempat.';

  @override
  String get stepTwistCorners => 'Putar';

  @override
  String get stepTwistCornersBody =>
      'Dengan sudut yang belum selesai di depan kanan, ulangi R\' D\' R D berpasangan sampai kuning di atas, lalu putar hanya lapisan atas untuk membawa sudut berikutnya. Bagian bawah tampak rusak sampai sudut terakhir: terus saja.';

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
      '2×2 hanyalah delapan sudut: tanpa rusuk dan tanpa pusat. Bangun lapisan putih di bawah dengan warna samping tetangga yang cocok, lalu selesaikan lewat satu jalur: Sune untuk atas kuning, kemudian T-perm atau Y-perm.';

  @override
  String get stepTwoCorner => 'Masukkan sudut';

  @override
  String get stepTwoCornerBody =>
      'Seperti sudut putih di 3×3: bawa sudut ke atas slot kosongnya di depan kanan lalu masukkan, di sini dengan U R U\' R\' atau dengan mengulang R U R\' U\' sampai putih di bawah. Cocokkan warna sampingnya dengan tetangganya.';

  @override
  String get lessonTwoOll => 'Orientasikan bagian atas';

  @override
  String get lessonTwoOllDesc => 'OLL Ortega dengan Sune.';

  @override
  String get stepTwoSune => 'Sune lagi';

  @override
  String get stepTwoSuneBody =>
      'Hitung stiker kuning yang menghadap atas. Pegang satu-satunya sudut dengan kuning di atas di depan kiri dan lakukan Sune (R U R\' U R U2 R\'). Hitung dan pegang ulang; paling banyak tiga Sune. Di antaranya putar hanya lapisan atas.';

  @override
  String get lessonTwoPbl => 'Permutasi kedua lapisan';

  @override
  String get lessonTwoPblDesc => 'Tukar sudut untuk menyelesaikan.';

  @override
  String get stepTwoAdjacent => 'Tukar berdampingan';

  @override
  String get stepTwoAdjacentBody =>
      'Lampu depan adalah dua stiker atas yang sama di satu sisi. Putar lapisan atas sampai lampu depan di kiri, sehingga dua sudut yang ditukar ada di kanan, lalu lakukan T-perm.';

  @override
  String get stepTwoDiagonal => 'Tukar diagonal';

  @override
  String get stepTwoDiagonalBody =>
      'Tidak ada lampu depan di sisi mana pun berarti dua sudut diagonal harus ditukar: lakukan Y-perm dari sisi mana saja, lalu putar lapisan atas untuk meluruskan semuanya.';

  @override
  String get lessonBigIntro => 'Kepingan kubus besar';

  @override
  String get lessonBigIntroDesc => 'Pusat, sayap, dan irisan.';

  @override
  String get stepBigPieces => 'Pusat tidak tetap';

  @override
  String get stepBigPiecesBody =>
      'Di 4×4 tiap sisi punya empat keping pusat yang bisa berpindah, dan tiap rusuk terdiri dari dua sayap. Tidak ada pusat tetap, jadi cek urutan warna pada sudut: putih seberang kuning, biru seberang hijau, merah seberang oranye.';

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
      'Komutator ini memindahkan tepat tiga keping pusat dan membiarkan sisanya, jadi pusat yang sudah jadi tetap jadi. Pakai ini saat satu keping nyasar tidak mau bergabung ke batang.';

  @override
  String get lessonBigEdges => 'Pasangkan rusuk';

  @override
  String get lessonBigEdgesDesc => 'Gabungkan sayap menjadi rusuk utuh.';

  @override
  String get stepBigEdgePair => 'Pasangkan & pulihkan';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' menyejajarkan dua sayap yang cocok, R U R\' F R\' F\' R menukar masuk rusuk yang belum berpasangan, dan Uw mengembalikan pusat. Selalu tutup lapisan yang kamu buka.';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc =>
      'OLL parity dan PLL parity pada kubus genap.';

  @override
  String get stepBigOllParity => 'OLL parity';

  @override
  String get stepBigOllParityBody =>
      'Satu rusuk terbalik sendirian tidak mungkin di 3×3: ini OLL parity, bukan kesalahan. Pegang di depan lapisan atas dan lakukan rumus panjangnya. Rumus ini juga menukar rusuk atas kiri dan kanan serta dua sudut; langkah 3×3 terakhir memperbaikinya.';

  @override
  String get stepBigPllParity => 'PLL parity';

  @override
  String get stepBigPllParityBody =>
      'Dua rusuk tertukar di akhir dan tidak ada rumus 3×3 yang cocok? Itu PLL parity. Pegang keduanya di depan dan belakang lapisan atas: 2R2 U2 2R2 Uw2 2R2 2U2 menukarnya.';

  @override
  String get introGoalHeading => 'Apa tujuannya?';

  @override
  String get introHowHeading => 'Bagaimana caranya?';

  @override
  String get introHoldHeading => 'Cara memegang';

  @override
  String get introWhyHeading => 'Kenapa ini berhasil';

  @override
  String get introStart => 'Paham, mulai langkah demi langkah';

  @override
  String get introDontShowAgain => 'Jangan tampilkan otomatis lagi';

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
      'Buat silang putih di bawah yang setiap rusuk putihnya juga cocok dengan warna pusat di sebelahnya.';

  @override
  String get introGoalCorners =>
      'Pasang keempat sudut putih agar seluruh lapisan pertama selesai: sisi putih dengan warna samping yang cocok.';

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
      'Bawa sudut terakhir ke tempatnya dengan satu T-perm atau Y-perm, lalu luruskan lapisan atas untuk menyelesaikan 2×2.';

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
      'Perbaiki dua kasus 4×4 yang tidak pernah ada di 3×3: satu rusuk terbalik (OLL parity) atau dua rusuk tertukar (PLL parity).';

  @override
  String get introHowBasics =>
      'Pusat tidak pernah berpindah, jadi pusat menunjukkan warna tiap sisi.\nSetiap huruf memutar satu sisi seperempat putaran searah jarum jam.\nTanda petik (\') memutar balik; angka 2 memutar dua kali.';

  @override
  String get introHoldBasics =>
      'Bebas: pusat tidak bergerak, jadi warnanya selalu memberi tahu sisi mana adalah mana.';

  @override
  String get introWhyBasics =>
      'Setiap rumus hanyalah deretan huruf ini, jadi membacanya adalah keterampilan pertama.';

  @override
  String get introHowCross =>
      'Bawa setiap rusuk putih ke atas, putih menghadap atas, di sekeliling pusat kuning: itulah bunga (daisy).\nPutar lapisan atas sampai warna samping satu kelopak ada di atas pusat yang sewarna.\nPutar sisi itu dua kali untuk menurunkannya; ulangi untuk keempatnya.';

  @override
  String get introHoldCross =>
      'Pusat kuning di atas dan pusat putih di bawah selama langkah ini. Putar lapisan atas, bukan kubusnya, untuk menyejajarkan kelopak.';

  @override
  String get introWhyCross =>
      'Saat putih menghadap atas, dua putaran sisi depan menurunkan rusuk ke pusat putih, putih di bawah dan warna sampingnya sudah cocok.';

  @override
  String get introHowCorners =>
      'Putar lapisan atas sampai sudut putih ada di atas tempat kosongnya, di depan kanan.\nUlangi R U R\' U\': sekali jika putih menghadap kanan, tiga kali jika ke atas, lima kali jika menghadapmu.\nLakukan hal yang sama untuk tiga sudut lainnya.';

  @override
  String get introHoldCorners =>
      'Putih di bawah, kuning di atas. Sudut di depan kanan, tepat di atas tempatnya.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' mengangkat slot lalu mengembalikannya: tiap putaran memelintir sudut sedikit sampai putih di bawah, dan silang tidak pernah rusak.';

  @override
  String get introHowMiddle =>
      'Cari rusuk atas tanpa kuning dan cocokkan warna depannya dengan pusat di bawahnya.\nWarna atasnya menentukan arahnya: kanan atau kiri.\nMasukkan dengan rumus 8 gerakan; lapisan putih selalu kembali utuh.';

  @override
  String get introHoldMiddle =>
      'Putih di bawah, kuning di atas. Rusuk di depan, warna depannya sama dengan pusat di bawahnya.';

  @override
  String get introWhyMiddle =>
      'Rumusnya menyingkirkan slot, memasukkan rusuk, dan mengembalikan lapisan putih. Rusuk yang ada kuningnya milik bagian atas, bukan tengah.';

  @override
  String get introHowYellowCross =>
      'Lihat hanya rusuk kuning di atas: titik, huruf L, atau garis.\nPegang L di belakang kiri dan garis dari kiri ke kanan, lalu lakukan F R U R\' U\' F\'.\nGaris butuh sekali, L dua kali, titik sampai tiga kali.';

  @override
  String get introHoldYellowCross =>
      'Putih di bawah, kuning di atas. L di belakang kiri, garis dari kiri ke kanan; titik bebas.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' membalik dua rusuk atas setiap kali tanpa menyentuh dua lapisan pertama.';

  @override
  String get introHowYellowEdges =>
      'Putar lapisan atas sampai dua rusuk cocok dengan pusatnya.\nPegang keduanya di belakang dan kanan, lalu lakukan R U R\' U R U2 R\' U.\nJika rusuk yang cocok saling berhadapan, lakukan sekali dari sisi mana saja dulu.';

  @override
  String get introHoldYellowEdges =>
      'Kuning di atas. Satu rusuk yang cocok di belakang, yang lain di kanan.';

  @override
  String get introWhyYellowEdges =>
      'Rumus ini hanya menggerakkan keping atas, jadi dua lapisan pertama selalu kembali.';

  @override
  String get introHowYellowCorners =>
      'Sudut sudah di tempatnya jika warnanya cocok dengan tiga pusat di sekitarnya, meski masih terpelintir.\nPegang sudut yang sudah di tempatnya di depan kanan.\nU R U\' L\' U R\' U\' L memutar tiga sudut lain; ulangi sampai semuanya pas.';

  @override
  String get introHoldYellowCorners =>
      'Kuning di atas. Sudut yang sudah di tempatnya di depan kanan; kalau tidak ada, sudut mana saja.';

  @override
  String get introWhyYellowCorners =>
      'Rumus ini memutar tiga sudut melingkar dan membiarkan sudut depan kanan, jadi tiap pengulangan menempatkan lebih banyak sudut.';

  @override
  String get introHowTwistCorners =>
      'Pegang sudut yang belum selesai di depan kanan.\nUlangi R\' D\' R D berpasangan sampai kuningnya menghadap atas.\nPutar hanya lapisan atas untuk sudut berikutnya; bagian bawah kembali di sudut terakhir.';

  @override
  String get introHoldTwistCorners =>
      'Kuning di atas, sudut yang akan diputar di depan kanan. Di antara sudut putar hanya lapisan atas, jangan seluruh kubus.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D memelintir sudut dan mengacak bagian bawah, tapi bagian bawah kembali setelah semua sudut diputar. Berhenti di tengah membuatnya rusak.';

  @override
  String get introHowCfopIntro =>
      'Silang: empat rusuk yang direncanakan saat inspeksi.\nF2L: setiap sudut masuk bersama rusuknya.\nOLL membuat sisi atas kuning, lalu PLL memindahkan keping ke tempatnya.';

  @override
  String get introHoldCfopIntro =>
      'Speedcuber membuat silang di bawah agar bisa melihat keping berikutnya sambil memutar.';

  @override
  String get introWhyCfopIntro =>
      'Menyelesaikan sudut bersama rusuknya menghemat banyak gerakan, dan mengenali kasus menggantikan coba-coba.';

  @override
  String get introHowF2l =>
      'Cari sudut dan rusuk pasangannya di lapisan atas.\nPasangkan keduanya di atas slotnya.\nMasukkan pasangan itu dengan tiga atau empat gerakan.';

  @override
  String get introHoldF2l =>
      'Silang di bawah. Slot pasangan di depan kanan, atau depan kiri untuk versi cermin.';

  @override
  String get introWhyF2l =>
      'Sudut dan rusuk yang berpasangan masuk bersama, jadi dua lapisan tumbuh sekaligus, bukan keping demi keping.';

  @override
  String get introHowOll =>
      'Pertama silang kuning dengan F R U R\' U\' F\'.\nLalu orientasikan sudut, misalnya dengan Sune.\nKenali kasusnya dari pola kuning yang terlihat.';

  @override
  String get introHoldOll =>
      'Kuning di atas. Untuk Sune, satu-satunya sudut dengan kuning di atas berada di depan kiri.';

  @override
  String get introWhyOll =>
      'Membagi lapisan terakhir menjadi orientasi lalu permutasi membuat jumlah rumus tetap sedikit.';

  @override
  String get introHowPll =>
      'Sisi atas sudah kuning semua.\nT-perm menukar sudut; U-perm menggilir tiga rusuk.\nBaca warna samping untuk memilih algoritma.';

  @override
  String get introHoldPll =>
      'Kuning di atas. T-perm: lampu depan di kiri. U-perm: sisi yang sudah jadi di belakang.';

  @override
  String get introWhyPll =>
      'Saat atas sudah kuning semua, hanya posisi keping yang salah, dan beberapa tukaran menyelesaikan kubus.';

  @override
  String get introHowTwoFirst =>
      'Pilih satu sudut putih sebagai jangkar, putih menghadap bawah.\nBawa setiap sudut berikutnya ke atas tempatnya di depan kanan.\nUlangi R U R\' U\' sampai masuk dengan warna samping yang cocok.';

  @override
  String get introHoldTwoFirst =>
      'Putih di bawah. Tempat kosong di depan kanan, sudutnya tepat di atasnya di lapisan atas.';

  @override
  String get introWhyTwoFirst =>
      '2×2 tidak punya pusat: sudut pertama yang dipasang menentukan warna tetangganya, jadi warna samping penting, bukan hanya putih.';

  @override
  String get introHowTwoOll =>
      'Hitung sudut yang kuningnya menghadap atas.\nJika ada satu, pegang di depan kiri dan lakukan Sune: R U R\' U R U2 R\'.\nHitung lagi dan ulangi; paling banyak tiga Sune.';

  @override
  String get introHoldTwoOll =>
      'Putih di bawah, kuning di atas. Sebelum tiap Sune, sudut dengan kuning di atas di depan kiri.';

  @override
  String get introWhyTwoOll =>
      'Sune memelintir sudut atas tanpa merusak lapisan putih; menghitung ulang memberi tahu cara memegang berikutnya.';

  @override
  String get introHowTwoPbl =>
      'Cari lampu depan: dua stiker atas yang sama di satu sisi.\nLampu depan di satu sisi: taruh di kiri dan lakukan T-perm.\nTanpa lampu depan: lakukan Y-perm dari sisi mana saja, lalu luruskan atas.';

  @override
  String get introHoldTwoPbl =>
      'Putih di bawah, kuning di atas. T-perm: lampu depan di kiri. Y-perm: sisi mana saja menghadapmu.';

  @override
  String get introWhyTwoPbl =>
      'Saat atas kuning, hanya posisi sudut yang salah: T-perm menukar dua tetangga, Y-perm dua yang diagonal.';

  @override
  String get introHowBigIntro =>
      'Tidak ada pusat yang tetap: empat keping pusat membentuk warna tiap sisi.\nGerakan lebar seperti Rw memutar dua lapisan sekaligus.\nGerakan dalam seperti 2R hanya memutar satu irisan dalam.';

  @override
  String get introHoldBigIntro =>
      'Awalnya bebas: di 4×4 tidak ada pusat tetap, jadi kamu yang memilih letak tiap warna.';

  @override
  String get introWhyBigIntro =>
      'Reduksi mengelompokkan pusat dan keping rusuk agar kubus besar bisa diselesaikan seperti 3×3.';

  @override
  String get introHowBigCenters =>
      'Cek dulu urutan warna pada satu sudut.\nBangun dua pusat yang berseberangan, lalu empat lainnya.\nLapisan dalam memindahkan keping pusat; selalu kembalikan lapisan yang kamu buka.';

  @override
  String get introHoldBigCenters =>
      'Sisi yang sedang dibangun di depan; pusat yang sudah jadi di kiri dan kanan, tidak menghalangi.';

  @override
  String get introWhyBigCenters =>
      'Lapisan dalam memindahkan pusat, dan membatalkannya mengembalikan yang sudah jadi, jadi hanya keping incaranmu yang berubah.';

  @override
  String get introHowBigEdges =>
      'Cari dua sayap dengan dua warna yang sama.\nSejajarkan di depan dan satukan dengan Uw\'.\nTukar dengan rusuk yang belum berpasangan, lalu Uw mengembalikan pusat.';

  @override
  String get introHoldBigEdges =>
      'Rusuk yang dipasangkan di lapisan depan; rusuk jadi diparkir di lapisan atas dan bawah.';

  @override
  String get introWhyBigEdges =>
      'Uw\' menyingkirkan pusat agar dua sayap bertemu; Uw mengembalikannya sehingga hasil kerjamu tetap utuh.';

  @override
  String get introHowBigParity =>
      'Selesaikan 4×4 seperti 3×3 sampai macet.\nSatu rusuk terbalik: rumus panjang OLL parity.\nDua rusuk tertukar: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'Lapisan terakhir di atas. OLL parity: rusuk terbalik di depan. PLL parity: rusuk yang tertukar di depan dan belakang.';

  @override
  String get introWhyBigParity =>
      'Sayap bisa masuk ke keadaan yang tak bisa dicapai 3×3; rumus ini memutar lapisan dalam untuk membatalkan tepat itu.';

  @override
  String get dirFaceR => 'Sisi kanan';

  @override
  String get dirFaceL => 'Sisi kiri';

  @override
  String get dirFaceU => 'Baris atas';

  @override
  String get dirFaceD => 'Baris bawah';

  @override
  String get dirFaceF => 'Sisi depan';

  @override
  String get dirFaceB => 'Sisi belakang';

  @override
  String get dirMiddle => 'Irisan tengah';

  @override
  String get dirWholeCube => 'Seluruh kubus';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, lapisan $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, sedalam $depth lapisan';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, lapisan $near–$far';
  }

  @override
  String get dirUp => 'Ke atas';

  @override
  String get dirDown => 'Ke bawah';

  @override
  String get dirLeft => 'Ke kiri';

  @override
  String get dirRight => 'Ke kanan';

  @override
  String get dirClockwise => 'Searah jarum jam';

  @override
  String get dirCounter => 'Berlawanan arah jarum jam';

  @override
  String get dirBackClockwise => 'Searah jarum jam, dilihat dari belakang';

  @override
  String get dirBackCounter =>
      'Berlawanan arah jarum jam, dilihat dari belakang';

  @override
  String get dirHalf => 'Putar ganda (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Sembunyikan detail';

  @override
  String get solveExpand => 'Tampilkan detail';

  @override
  String get dailyScrambleSteps => 'Acak langkah demi langkah';

  @override
  String get dailyScrambleGuide => 'Panduan acak 3D';

  @override
  String get dailyShowMoves => 'Tampilkan gerakan dalam teks';

  @override
  String get dailyHideMoves => 'Sembunyikan gerakan teks';

  @override
  String get dailyScrambleGuideTitle => 'Panduan acak';

  @override
  String get phaseDailyScramble => 'Acak kubus hari ini';

  @override
  String get explainDailyScramble =>
      'Mulai dari kubus yang sudah selesai, putih di atas dan hijau di depan, lalu tiru setiap putaran di kubus aslimu.';

  @override
  String get stageCenters => 'Bangun blok pusat';

  @override
  String get stageEdges => 'Pasangkan rusuk luar & dalam';

  @override
  String get stageParity => 'Atasi parity';

  @override
  String get stageCrown1 => 'Lapisan pertama (putih)';

  @override
  String get stageCrown2 => 'Lapisan kedua';

  @override
  String get stageCrown3 => 'Lapisan ketiga (kuning)';

  @override
  String get stageOrient => 'Orientasikan keping';

  @override
  String get stageFinish => 'Selesaikan kubus';

  @override
  String get stageAsThree => 'Selesaikan seperti 3×3';

  @override
  String get stageTwoByTwo => 'Selesaikan 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Tahap $number dari $total: $title';
  }

  @override
  String get solveAllStagesDone => 'Semua tahap selesai. Hebat!';

  @override
  String get trackFiveByFive => '5×5 Kubus Profesor';

  @override
  String get trackSixBySix => 'Kubus 6×6';

  @override
  String get lessonFiveIntro => 'Kenali 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Pusat tetap, batang pusat, rusuk tengah, dan sayap.';

  @override
  String get introGoalFiveIntro =>
      'Kenali 5×5: pusat tetap, batang pusat, rusuk tengah, dan sayap.';

  @override
  String get introHowFiveIntro =>
      'Keping tengah setiap sisi tidak pernah berpindah.\nSetiap rusuk terdiri dari keping tengah dan dua sayap.\nIrisan dalam memindahkan keping tanpa menyentuh bagian luar.';

  @override
  String get introHoldFiveIntro =>
      'Bebas: di 5×5 bagian tengah tiap sisi tidak pernah bergerak, jadi ia menunjukkan warna sisinya.';

  @override
  String get introWhyFiveIntro =>
      'Pusat yang tetap menentukan skema warna, jadi pusat tidak mungkin tersusun salah urutan.';

  @override
  String get lessonFiveCenters => 'Pusat 5×5';

  @override
  String get lessonFiveCentersDesc =>
      'Bangun setiap pusat dari batang berisi tiga.';

  @override
  String get introGoalFiveCenters =>
      'Bangun blok pusat 3×3 berwarna sama di setiap sisi.';

  @override
  String get introHowFiveCenters =>
      'Mulai dari keping tengah yang tetap: dialah penentu warna.\nBuat batang berisi tiga lalu geser masuk dengan lapisan dalam.\nGerakan yang memasukkan batang juga mengembalikan pusat yang sudah jadi.';

  @override
  String get introHoldFiveCenters =>
      'Pusat yang sedang dibangun di depan atau atas; pusat jadi di bawah, kiri, atau kanan.';

  @override
  String get introWhyFiveCenters =>
      'Lapisan masuk, putar atas, lapisan kembali: lapisan yang membawa batang juga mengembalikan pusat yang sudah jadi.';

  @override
  String get lessonFiveEdges => 'Rusuk 5×5';

  @override
  String get lessonFiveEdgesDesc => 'Satukan dua sayap dengan rusuk tengahnya.';

  @override
  String get introGoalFiveEdges =>
      'Satukan setiap rusuk tengah dengan dua sayapnya agar 12 rusuk tampak utuh.';

  @override
  String get introHowFiveEdges =>
      'Pasangkan tiap sayap dengan rusuk tengahnya di depan.\nPutar lapisan dalam, tukar dengan rusuk yang belum selesai, putar kembali.\nUntuk rusuk terakhir: lapisan, balik, lapisan.';

  @override
  String get introHoldFiveEdges =>
      'Rusuk yang sedang dibangun di depan; rusuk jadi disimpan di lapisan atas dan bawah.';

  @override
  String get introWhyFiveEdges =>
      'Membuka dan menutup lapisan dalam menyatukan sayap, sementara pusat dan rusuk simpanan kembali.';

  @override
  String get lessonFiveSolve => 'Selesaikan 5×5 seperti 3×3';

  @override
  String get lessonFiveSolveDesc => 'Selesaikan lapis demi lapis, seperti 3×3.';

  @override
  String get introGoalFiveSolve =>
      'Selesaikan 5×5 yang sudah direduksi seperti 3×3, lapis demi lapis, hanya dengan putaran luar.';

  @override
  String get introHowFiveSolve =>
      'Mulai sekarang hanya putaran luar, kalau tidak rusuk yang berpasangan terpisah lagi.\nSilang dan sudut putih, lapisan tengah, lalu lapisan kuning.\nPusat yang tetap menunjukkan warna setiap sisi.';

  @override
  String get introHoldFiveSolve =>
      'Warna lapisan pertama di bawah, sama seperti 3×3; sudut yang akan dimasukkan di depan kanan.';

  @override
  String get introWhyFiveSolve =>
      'Putaran dalam akan memisahkan pusat dan rusuk lagi; putaran luar memperlakukan tiap blok sebagai satu keping 3×3.';

  @override
  String get lessonFiveParity => 'Parity rusuk 5×5';

  @override
  String get lessonFiveParityDesc => 'Perbaiki rusuk yang sayapnya tertukar.';

  @override
  String get introGoalFiveParity =>
      'Perbaiki satu rusuk yang dua sayap luarnya tertukar: satu-satunya parity di 5×5.';

  @override
  String get introHowFiveParity =>
      'Muncul sebagai satu rusuk terakhir yang tampak terbalik.\nLakukan sekali perbaikan panjang dengan lapisan dalam.\nTidak ada PLL parity di 5×5.';

  @override
  String get introHoldFiveParity =>
      'Lapisan terakhir di atas, rusuk dengan sayap tertukar di depan lapisan atas.';

  @override
  String get introWhyFiveParity =>
      'Di 5×5 hanya dua sayap luar dari satu rusuk yang bisa tertukar, jadi satu rumus sudah cukup.';

  @override
  String get lessonSixIntro => 'Kenali 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Tanpa pusat tetap dan empat keping di setiap rusuk.';

  @override
  String get introGoalSixIntro =>
      'Kenali 6×6: enam belas keping pusat per sisi dan empat keping per rusuk.';

  @override
  String get introHowSixIntro =>
      'Tidak ada pusat tetap: kamu memilih warnanya saat membangun.\nSetiap rusuk punya sayap luar dan sayap dalam.\nPutaran lebar bisa memindahkan hingga tiga lapisan.';

  @override
  String get introHoldSixIntro =>
      'Awalnya bebas: seperti 4×4, 6×6 tidak punya pusat tetap.';

  @override
  String get introWhySixIntro =>
      'Kalau kamu bisa 4×4 dan 5×5, 6×6 adalah reduksi yang sama dengan blok lebih besar.';

  @override
  String get lessonSixCenters => 'Pusat 6×6';

  @override
  String get lessonSixCentersDesc =>
      'Bangun pusat 4×4 dari batang berisi empat.';

  @override
  String get introGoalSixCenters =>
      'Bangun blok pusat 4×4 berwarna sama di setiap sisi.';

  @override
  String get introHowSixCenters =>
      'Cek dulu urutan warna pada satu sudut: tidak ada pusat yang tetap.\nBuat batang berisi empat lalu satukan.\nDi dua pusat terakhir pindahkan keping satu per satu: lapisan, atas, batalkan.';

  @override
  String get introHoldSixCenters =>
      'Sisi yang sedang dibangun di depan; pusat jadi di kiri, kanan, atau bawah.';

  @override
  String get introWhySixCenters =>
      'Batang menyatu lewat lapisan dalam dan setiap lapisan dibatalkan, jadi pusat yang sudah jadi tetap utuh.';

  @override
  String get lessonSixEdges => 'Rusuk 6×6';

  @override
  String get lessonSixEdgesDesc => 'Kumpulkan empat keping setiap rusuk.';

  @override
  String get introGoalSixEdges =>
      'Kumpulkan empat keping setiap rusuk agar 6×6 punya 12 rusuk rapi.';

  @override
  String get introHowSixEdges =>
      'Sejajarkan sayap luar dan dalam dari satu rusuk di depan.\nLapisan lebar yang dalam membawa rusuk masuk dan keluar.\nJangan pernah merusak rusuk jadi untuk membebaskan keping.';

  @override
  String get introHoldSixEdges =>
      'Rusuk yang sedang dibangun di depan; rusuk jadi diparkir di atas dan bawah.';

  @override
  String get introWhySixEdges =>
      'Putaran lebar yang dalam menyingkirkan pusat agar sayap bertemu, lalu mengembalikannya.';

  @override
  String get lessonSixSolve => 'Selesaikan 6×6 seperti 3×3';

  @override
  String get lessonSixSolveDesc => 'Selesaikan lapis demi lapis, seperti 3×3.';

  @override
  String get introGoalSixSolve =>
      'Selesaikan 6×6 yang sudah direduksi seperti 3×3, lapis demi lapis, hanya dengan putaran luar.';

  @override
  String get introHowSixSolve =>
      'Mulai sekarang hanya putaran luar: lapisan dalam akan memecah pusat atau rusuk.\nPusat yang kamu bangun menunjukkan warna setiap sisi.\nSilang dan sudut putih, lapisan tengah, lalu lapisan kuning.';

  @override
  String get introHoldSixSolve =>
      'Warna lapisan pertama di bawah, sama seperti 3×3; sudut yang akan dimasukkan di depan kanan.';

  @override
  String get introWhySixSolve =>
      'Putaran luar menggerakkan tiap pusat 4×4 dan tiap rusuk sebagai satu keping, persis seperti 3×3.';

  @override
  String get lessonSixParity => 'Parity 6×6';

  @override
  String get lessonSixParityDesc =>
      'Satu rusuk terbalik atau dua rusuk tertukar.';

  @override
  String get introGoalSixParity =>
      'Atasi dua kasus 6×6 yang tidak ada di 3×3: satu rusuk terbalik atau dua rusuk tertukar.';

  @override
  String get introHowSixParity =>
      'Selesaikan seperti 3×3 sampai macet.\nSatu rusuk terbalik: perbaikan panjang dengan 3Rw.\nDua rusuk tertukar: perbaikan pendek dengan putaran ganda di dalam.';

  @override
  String get introHoldSixParity =>
      'Lapisan terakhir di atas. Rusuk terbalik di depan; dua rusuk tertukar di depan dan belakang.';

  @override
  String get introWhySixParity =>
      'Seperti 4×4, 6×6 bisa berakhir dengan satu rusuk terbalik atau dua rusuk tertukar; rumus lapisan dalam memperbaikinya dan membiarkan sisanya.';

  @override
  String get stepFivePieces => 'Keping 5×5';

  @override
  String get stepFivePiecesBody =>
      'Keping tengah tiap sisi tidak pernah bergerak, jadi skema warna tidak mungkin salah. Di sekitarnya ada delapan keping pusat: pusat sudut dan pusat rusuk tidak pernah bertukar jenis. Tiap rusuk adalah keping tengah dengan dua sayap.';

  @override
  String get stepFiveSlices => 'Tiga jenis putaran';

  @override
  String get stepFiveSlicesBody =>
      'Putaran luar memutar satu sisi. Putaran lebar memutar sisi bersama lapisan di belakangnya. Putaran irisan dalam hanya memutar lapisan di dalam: begitulah keping berpindah tanpa menyentuh bagian luar.';

  @override
  String get stepFiveCenterBar => 'Batang pusat';

  @override
  String get stepFiveCenterBarBody =>
      'Buat deret tiga keping pusat yang sama, geser masuk dengan lapisan dalam, putar atas, lalu kembalikan lapisannya: gerakan yang membawa batang juga mengembalikan pusat yang sudah jadi. Tiga batang membentuk satu pusat.';

  @override
  String get stepFiveCenterSwap => 'Tukar tanpa merusak';

  @override
  String get stepFiveCenterSwapBody =>
      'Untuk memindahkan satu keping pusat: putar irisan dalam, putar sisi atas, batalkan irisan, lalu kembalikan sisi atas. Pusat yang sudah jadi selalu kembali.';

  @override
  String get stepFiveEdgePair => 'Pasangkan sayap dengan rusuk tengah';

  @override
  String get stepFiveEdgePairBody =>
      'Sejajarkan satu sayap di samping rusuk tengahnya di depan, turunkan lapisan dalam, tukar masuk rusuk yang belum selesai dengan pemicu pendek, lalu kembalikan lapisan dalam.';

  @override
  String get stepFiveEdgeLast => 'Rusuk terakhir';

  @override
  String get stepFiveEdgeLastBody =>
      'Kalau tidak ada lagi rusuk bebas untuk ditukar, pakai lapisan, balik, lapisan: putaran lebar, pemicu pendek, dan putaran lebar kembali memasangkan rusuk terakhir tanpa merusak yang sudah jadi.';

  @override
  String get stepFiveAsThree => 'Sekarang menjadi 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Dengan pusat dan rusuk selesai, 5×5 berperilaku seperti 3×3 besar. Pakai hanya putaran luar dan maju lapis demi lapis: silang dan sudut putih, lapisan tengah, lalu lapisan kuning. 5×5 tidak punya PLL parity.';

  @override
  String get stepFiveEdgeParity => 'Tukar sayap rusuk terakhir';

  @override
  String get stepFiveEdgeParityBody =>
      'Kadang rusuk terakhir punya dua sayap luar yang tertukar sehingga tampak terbalik: satu-satunya parity di 5×5. Pegang di depan lapisan atas dan lakukan sekali rumus lapisan dalam; semua yang lain kembali ke tempatnya.';

  @override
  String get stepSixPieces => 'Keping 6×6';

  @override
  String get stepSixPiecesBody =>
      'Seperti 4×4, 6×6 tidak punya pusat tetap: enam belas keping pusat membentuk warna tiap sisi, jadi cek dulu urutan warna pada sudut. Tiap rusuk punya empat sayap: dua luar dan dua dalam.';

  @override
  String get stepSixSlices => 'Memutar lapisan lebih dalam';

  @override
  String get stepSixSlicesBody =>
      'Putaran lebar bisa memindahkan dua atau tiga lapisan dari satu sisi. Irisan dalam di lapisan kedua atau ketiga adalah alat untuk pusat dan rusuk.';

  @override
  String get stepSixCenterBar => 'Batang berisi empat';

  @override
  String get stepSixCenterBarBody =>
      'Buat deret empat keping pusat yang sama dan geser berdampingan dengan putaran lapisan dalam, batalkan tiap lapisan, sampai sisi itu menjadi satu blok 4×4 berwarna sama.';

  @override
  String get stepSixCenterSwap => 'Satu keping setiap kali';

  @override
  String get stepSixCenterSwapBody =>
      'Putar lapisan ketiga, putar atas, batalkan, putar balik: satu keping pusat berpindah dan pusat yang sudah jadi kembali. Pakai ini untuk dua pusat terakhir saat tidak ada batang yang pas.';

  @override
  String get stepSixEdgePair => 'Empat keping, satu rusuk';

  @override
  String get stepSixEdgePairBody =>
      'Kumpulkan empat sayap satu rusuk di depan dengan lapisan lebar yang dalam, tukar masuk rusuk yang belum selesai dengan pemicu pendek, lalu putar lapisan lebar kembali.';

  @override
  String get stepSixEdgeLast => 'Rusuk terakhir';

  @override
  String get stepSixEdgeLastBody =>
      'Pasangkan rusuk terakhir dengan pemicu pendek di antara putaran lebar yang dalam dan pembatalannya, agar rusuk yang sudah jadi tetap berpasangan. Jangan pernah merusak rusuk jadi untuk membebaskan keping.';

  @override
  String get stepSixAsThree => 'Sekarang menjadi 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Dengan pusat 4×4 dan rusuk berpasangan, selesaikan 6×6 seperti 3×3, lapis demi lapis, hanya dengan putaran luar. Satu rusuk terbalik atau dua tertukar di akhir adalah parity, bukan kesalahan.';

  @override
  String get stepSixOllParity => 'Satu rusuk terbalik';

  @override
  String get stepSixOllParityBody =>
      'Satu rusuk yang tampak terbalik di lapisan terakhir adalah parity. Pegang di depan lapisan atas dan lakukan perbaikan panjang: keempat sayapnya dibalik, rusuk atas kiri dan kanan ikut tertukar, dan dua lapisan pertama tidak tersentuh.';

  @override
  String get stepSixPllParity => 'Dua rusuk tertukar';

  @override
  String get stepSixPllParityBody =>
      'Jika di akhir dua rusuk tampak tertukar, pegang keduanya di depan dan belakang lapisan atas lalu lakukan perbaikan pendek dengan putaran ganda di dalam: keempat sayap kedua rusuk bertukar tempat.';

  @override
  String get stageTwoFirstLayer => 'Bangun lapisan bawah';

  @override
  String get stageTwoTopColor => 'Buat sisi atas satu warna';

  @override
  String get stageTwoFinish => 'Selesaikan sudut-sudutnya';

  @override
  String get explainTwoFirstLayer =>
      'Lengkapi lapisan bawah: keempat sudutnya cocok satu sama lain dan dengan warna sampingnya.';

  @override
  String get explainTwoTopColor =>
      'Putar sampai keempat stiker atas berwarna sama, tanpa merusak lapisan bawah.';

  @override
  String get explainTwoFinish =>
      'Pindahkan sudut terakhir ke tempatnya untuk menyelesaikan kubus.';

  @override
  String get tabSolve => 'Pecahkan';

  @override
  String get tabScan => 'Pindai';

  @override
  String get tabAcademy => 'Akademi';

  @override
  String get tabTrain => 'Latihan';

  @override
  String get openCubeSolver => 'Buka Kubus 3D & Pemecah';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Latihan';

  @override
  String get trainSubtitle => 'Asah kemampuanmu setiap hari.';

  @override
  String get settings => 'Pengaturan';

  @override
  String get settingsSoundHaptics => 'Suara & getaran';

  @override
  String get settingsSoundHapticsDesc =>
      'Klik dan getaran saat kamu memutar kubus.';

  @override
  String get settingsAnimationSpeed => 'Kecepatan animasi bawaan';

  @override
  String get settingsAnimationSpeedDesc =>
      'Seberapa cepat kubus berputar saat gerakan diputar.';

  @override
  String get settingsResetProgress => 'Atur ulang progres';

  @override
  String get settingsResetProgressDesc =>
      'Hapus pelajaran Akademi yang selesai dan streak harianmu.';

  @override
  String get resetProgressTitle => 'Atur ulang semua progres?';

  @override
  String get resetProgressBody =>
      'Pelajaran yang selesai dan streak harianmu akan dihapus. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get resetProgressDone => 'Progres diatur ulang.';

  @override
  String get cancel => 'Batal';

  @override
  String get settingsPrivacyAds => 'Privasi & iklan';

  @override
  String get settingsPrivacyAdsDesc =>
      'Tinjau atau ubah pilihan persetujuan iklan Anda.';

  @override
  String get playbackPrevious => 'Sebelumnya';

  @override
  String get playbackNext => 'Berikutnya';

  @override
  String fastSolveMoves(int count) {
    return 'Selesai dalam $count gerakan!';
  }

  @override
  String get feedbackTitle => 'Bentuk Versi Berikutnya';

  @override
  String get feedbackBody =>
      'Ingin menyarankan fitur atau ikut menentukan versi CubeMentor berikutnya? Kirim email ke:';

  @override
  String get feedbackEmailCopied =>
      'Aplikasi email tidak ditemukan, jadi alamatnya kami salin ke papan klip.';

  @override
  String get adWatchToUnlock => 'Tonton iklan';

  @override
  String get adLoading => 'Memuat video singkat…';

  @override
  String get adRewardNotEarned =>
      'Tonton video sampai selesai untuk membukanya.';

  @override
  String get adUnavailableFreePass =>
      'Tidak ada video saat ini — dibuka gratis kali ini.';

  @override
  String get settingsPrivacyAdsError =>
      'Tidak dapat membuka opsi privasi. Coba lagi nanti.';

  @override
  String get nicknamePromptTitle => 'Kami panggil kamu siapa?';

  @override
  String get nicknamePromptBody =>
      'Kami akan menyemangatimu dengan namamu setiap kali kamu berhasil menyelesaikan kubus.';

  @override
  String get nicknameHint => 'Nama atau panggilanmu';

  @override
  String get nicknameSave => 'Simpan';

  @override
  String get settingsNickname => 'Namamu';

  @override
  String get settingsNicknameNotSet => 'Belum diatur — ketuk untuk menambahkan';

  @override
  String celebrateNamed(String name) {
    return 'Hebat, $name!';
  }

  @override
  String get celebrateAnon => 'Hebat!';

  @override
  String get celebrateCubeSolved => 'Kubus selesai!';

  @override
  String get celebrateDailyDone => 'Tantangan harian selesai!';

  @override
  String fastSolveRatio(int count, int limit) {
    return '$count / $limit gerakan';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    return 'Setiap acakan bisa diselesaikan dalam $limit gerakan atau kurang';
  }

  @override
  String get patternsWatchVideo => 'Tonton video';

  @override
  String get patternsNotNow => 'Nanti saja';

  @override
  String get settingsColorScheme => 'Skema warna kubus';

  @override
  String get colorSchemeWestern => 'Barat';

  @override
  String get colorSchemeJapanese => 'Jepang';

  @override
  String get colorSchemeWesternDesc =>
      'Putih berseberangan dengan kuning, biru dengan hijau';

  @override
  String get colorSchemeJapaneseDesc =>
      'Putih berseberangan dengan biru, kuning dengan hijau';

  @override
  String dailyYourTime(String time) {
    return 'Waktumu: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Kamu punya $seconds detik untuk memeriksa kubus. Ketuk untuk memulai hitung mundur.';
  }

  @override
  String get timerInspectTapReady => 'Ketuk saat siap mulai memecahkan';

  @override
  String timerInspectPlus2(int seconds) {
    return 'Inspeksi lewat $seconds detik, jadi jam mulai sendiri: penalti +2 detik';
  }

  @override
  String timerAvgOf(int count) {
    return 'Rata-rata $count';
  }

  @override
  String get timerAvgNote => 'Rata-rata membuang waktu terbaik dan terburuk';

  @override
  String get timerPbSub => 'Waktu terbaik';

  @override
  String get timerPlus2Caption => 'Penalti +2 detik';

  @override
  String get timerDnfCaption => 'Tidak selesai (DNF)';

  @override
  String get timerDeleteCaption => 'Hapus solve ini';

  @override
  String get patternBullsEye => 'Mata banteng';

  @override
  String get patternFramedCenter => 'Pusat berbingkai';

  @override
  String get patternBlockCheckerboard => 'Papan catur blok';

  @override
  String get patternCubeInCubeInCube => 'Kubus dalam kubus dalam kubus';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Enam T';

  @override
  String get patternTwinPeaks => 'Puncak kembar';

  @override
  String get patternSpiral => 'Spiral';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Titik tengah';

  @override
  String get patternStripes => 'Garis-garis';

  @override
  String get patternAnaconda => 'Anakonda';

  @override
  String get patternZigzag => 'Zigzag';

  @override
  String get patternFourSpots => 'Empat titik';

  @override
  String get patternGreenMamba => 'Mamba hijau';

  @override
  String get patternPlusMinus => 'Plus minus';

  @override
  String guideStepCounter(int current, int total) {
    return 'Langkah $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Gerakan $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Gerakan $current / $total';
  }

  @override
  String get dailyStep1Title => 'Langkah 1: Acak kubusmu';

  @override
  String get dailyStep2Title => 'Langkah 2: Pecahkan kubusnya';

  @override
  String dailyPersonalBest(String time) {
    return 'Rekor pribadi: $time';
  }

  @override
  String get dailyRecentDays => 'Hari-hari terakhir';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Runtutan $count hari! Kamu luar biasa!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Kubus sudah teracak! Sekarang pecahkan';

  @override
  String get dailyCongratsTitle => 'Selamat!';

  @override
  String dailyCongratsBody(String time) {
    return 'Kamu memecahkan tantangan hari ini dalam $time.';
  }

  @override
  String get dailyCongratsDone => 'Kembali ke tantangan';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $count pola';
  }

  @override
  String unlockHoursLeft(int hours) {
    return 'Sisa $hours jam';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return 'Sisa $minutes menit';
  }

  @override
  String get lockedLabel => 'Terkunci';

  @override
  String get unlockedLabel => 'Terbuka';

  @override
  String patternUnlockBody(int hours) {
    return 'Tonton 1 video singkat untuk membuka pola ini beserta panduan langkah demi langkahnya selama $hours jam.';
  }

  @override
  String lessonUnlockBody(int hours) {
    return 'Tonton 1 video singkat untuk membuka pelajaran ini sesering yang diinginkan selama $hours jam ke depan.';
  }

  @override
  String get bigCubeUnlockTitle => 'Selesaikan kubus besar';

  @override
  String bigCubeUnlockBody(int hours) {
    return 'Penyelesaian gratis 4×4–6×6 sudah terpakai. Tonton 1 video singkat untuk menyelesaikan kubus besar selama $hours jam ke depan.';
  }

  @override
  String get doubleTurnBadge => 'Putaran ganda · 180°';

  @override
  String get homeAcademy => 'Akademi';

  @override
  String get homePatterns => 'Pola Keren';

  @override
  String get homePractice => 'Timer & Tantangan Harian';

  @override
  String get scanChoiceSubtitle => 'Mau mulai dari mana?';

  @override
  String get scanChoiceCamera => 'Pindai dengan kamera';

  @override
  String get scanChoiceCameraDesc =>
      'Tunjukkan setiap sisi ke kamera dan dapatkan solusinya.';

  @override
  String get scanChoice3d => 'Buka kubus 3D';

  @override
  String get scanChoice3dDesc =>
      'Putar kubus virtual, acak, lalu selesaikan langkah demi langkah.';

  @override
  String get academyAllSizes => 'Semua ukuran';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total pelajaran selesai';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total selesai';
  }

  @override
  String get lessonStageConcept => 'Konsep';

  @override
  String get lessonStageExamples => 'Contoh';

  @override
  String get lessonStagePractice => 'Latihan';

  @override
  String get lessonStageNext => 'Lanjut / bebas';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Tahap $index dari $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Contoh $index dari $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Panduan $index dari $total';
  }

  @override
  String get lessonBonusCase => 'Kasus bonus';

  @override
  String get lessonPracticeIntro =>
      'Acakan sungguhan: hanya langkah sebelumnya yang sudah selesai. Tuntaskan seluruh langkah ini, petunjuk demi petunjuk.';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Langsung lanjut ke $lesson.';
  }

  @override
  String get lessonFreePractice => 'Latihan bebas';

  @override
  String get lessonFreePracticeDesc =>
      'Selesaikan sendiri kubus 3D yang teracak, dari awal sampai langkah ini.';

  @override
  String freePracticeBanner(String topic) {
    return 'Berlatihlah bebas: selesaikan kubus dari awal sampai $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Putar sisi berpusat $face sesuai arah panah. Pusatnya tetap di tempat; hanya kepingan di sekitarnya yang berpindah.';
  }

  @override
  String cueTrigger(String front) {
    return 'Gerakan tangan kanan, dengan $front menghadapmu: sisi kanan ke atas, atas ke kiri, sisi kanan ke bawah, atas kembali ke kanan.';
  }

  @override
  String get cueTriggerBack =>
      'Gerakan keenam berturut-turut mengembalikan kubus persis seperti semula. Enam adalah angka ajaib!';

  @override
  String cueSliceInner(String face) {
    return 'Putar hanya lapisan dalam di sebelah sisi $face. Sisi itu sendiri diam, jadi pusat-pusatnya terpisah.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Putaran lebar: sisi $face dan lapisan dalam di sebelahnya berputar bersama, seperti satu lapisan tebal.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Putar seluruh kubus sampai pusat $top di atas dan pusat $front menghadapmu.';
  }

  @override
  String get cueTurnTop =>
      'Putar hanya lapisan atas, sesuai panah, untuk menyiapkan algoritma berikutnya.';

  @override
  String get cueAlignTop =>
      'Gerakan terakhir: putar lapisan atas agar warnanya sejajar. Selesai!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'Rusuk $piece ada di lapisan atas. Putar bagian atas sampai rusuk itu tepat di atas pusat $center, lalu putar sisi itu dua kali untuk menurunkannya.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'Rusuk $piece tersangkut di lapisan tengah. Naikkan ke atas, sejajarkan di atas pusat $center, lalu turunkan.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'Rusuk $piece sudah di tempatnya tapi terbalik: putihnya menghadap samping. Keluarkan dan naikkan ke atas dengan putih menghadap atas, lalu turunkan di samping pusat $center.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'Gaya CFOP: bagian bawah boleh diputar juga. Turunkan rusuk $piece dan putar bagian bawah agar sejajar dengan pusat $center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Putar bagian atas sampai sudut $piece tepat di atas tempatnya, di antara sisi $a dan $b. Ulangi gerakan tangan kanan sampai sudut itu masuk dengan arah yang benar.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'Sudut $piece ada di slotnya tapi terpelintir. Satu pemicu mengeluarkannya (sudut kuning masuk menggantikannya); terus ulangi di atas slot yang sama sampai ia masuk lagi dengan putih di bawah. Jangan memutar kubus untuk mengejarnya.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Putar bagian atas sampai rusuk $piece sejajar dengan pusat $a, lalu kirim ke bawah ke kanan, ke celah antara $a dan $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Putar bagian atas sampai rusuk $piece sejajar dengan pusat $a, lalu kirim ke bawah ke kiri, ke celah antara $a dan $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'Rusuk $piece ada di slotnya tapi terbalik. Masukkan rusuk kuning ke sana untuk mendorongnya ke atas, lalu masukkan lagi di antara $a dan $b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Garis kuning: putar bagian atas agar garisnya dari kiri ke kanan, tetap hadapkan $front kepadamu, lalu jalankan algoritma silang kuning.';
  }

  @override
  String cueYellowL(String front) {
    return 'Huruf L kuning: putar bagian atas agar L menunjuk ke belakang kiri, tetap hadapkan $front kepadamu, lalu jalankan algoritmanya. Ia menjadi garis.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Hanya pusatnya yang kuning: titik. Lakukan rumusnya sekali dengan $front menghadapmu untuk mendapat L. Titik bisa butuh tiga putaran, jadi lanjutkan.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Putar bagian atas sampai rusuk $piece cocok dengan pusat $center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Dua rusuk yang cocok ada di belakang dan di kanan. Dengan $front menghadapmu, jalankan penukaran: rusuk depan dan kiri bertukar tempat.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Rusuk yang cocok saling berseberangan. Jalankan penukaran sekali dengan $front menghadapmu; setelah itu dua rusuk bersebelahan cocok.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'Sudut $piece sudah di tempatnya. Biarkan di depan kanan, dengan $front menghadapmu, lalu putar-gilirkan tiga sudut lainnya.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Belum ada sudut kuning di tempatnya. Lakukan satu putaran giliran dengan $front menghadapmu; setelah itu satu sudut sudah di tempatnya.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Putar sudut $piece di depan kanan: ulangi pemicu bawah berpasangan sampai kuningnya menghadap atas. Lapisan bawah tampak berantakan dulu; semuanya kembali di sudut terakhir!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Kali ini sudut $piece butuh empat gerakan. Teruskan: kuning selalu naik setelah dua atau empat.';
  }

  @override
  String get cueTwistNext =>
      'Putar hanya lapisan atas untuk membawa sudut terpelintir berikutnya ke depan kanan. Jangan putar seluruh kubus sekarang!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Pasangkan sudut $piece dengan rusuk $edge di atas, lalu masukkan pasangan itu ke celah antara $a dan $b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'Sudut $piece tersangkut di celahnya bersama rusuk yang salah. Keluarkan dulu ke atas, lalu pasangkan dan masukkan.';
  }

  @override
  String cueOllSune(String front) {
    return 'Dengan $front menghadapmu, jalankan Sune untuk memutar sudut kuning ke atas.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Kali ini satu Sune belum cukup. Putar bagian atas dan jalankan Sune lagi, dengan $front menghadapmu.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Dua sudut perlu bertukar. Biarkan pasangan yang cocok (\"lampu depan\") di kiri, $front menghadapmu, lalu jalankan T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Sudut-sudutnya sudah beres. Biarkan rusuk $piece di belakang dan putar-gilirkan tiga rusuk lainnya dengan U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'Belum ada rusuk atas yang cocok dengan pusatnya. Jalankan U-perm sekali dari sisi mana pun; setelah itu satu rusuk cocok.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Dua sudut atas yang bersebelahan perlu bertukar. Biarkan pasangan yang cocok di kiri, $front menghadapmu, lalu jalankan penukaran.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Dua sudut yang harus ditukar letaknya diagonal. Jalankan penukaran diagonal dengan $front menghadapmu.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Kembalikan keping pusat $color yang nyasar dengan siklus-3 pusat: lapisan, atas, lapisan, lalu semuanya kembali.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Satu batang penuh keping pusat $color ada di sisi yang salah. Angkat dengan lapisan dalam, putar bagian atas, lalu kembalikan ke tempatnya.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Pasangkan dua keping rusuk $piece: sejajarkan, putar lapisan, tukar masuk rusuk yang belum berpasangan dengan gerakan tangan kanan, lalu kembalikan lapisannya.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Rusuk terakhir: pasangkan rusuk $piece dengan algoritma dua rusuk terakhir, yang menjaga semua rusuk yang sudah jadi tetap utuh.';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL parity: satu rusuk atas terbalik, hal yang tak pernah terjadi di 3×3. Pegang di depan, dengan $front menghadapmu, dan lakukan perbaikan parity sebelum OLL biasa.';
  }

  @override
  String get cueParityPll =>
      'PLL parity: dua rusuk atas tertukar, hal yang tak pernah terjadi di 3×3. Pegang di depan dan belakang, lakukan tukaran parity, lalu luruskan lapisan atas.';

  @override
  String cueParityFive(String front) {
    return 'Parity rusuk: dua sayap luar dari satu rusuk tertukar, satu-satunya parity di 5×5. Pegang rusuk itu di depan, dengan $front menghadapmu, dan lakukan perbaikannya sekali.';
  }

  @override
  String get onboardingSkip => 'Lewati';

  @override
  String get onboardingNext => 'Lanjut';

  @override
  String get onboardingStart => 'Mulai';

  @override
  String get onboardingWhatTitle => 'Teman kubus Anda';

  @override
  String get onboardingWhatBody =>
      'CubeMentor membantu Anda menyelesaikan, mempelajari, dan berlatih semua kubus dari 2×2 hingga 6×6, sepenuhnya offline.';

  @override
  String get onboardingScanTitle => 'Pindai & selesaikan dalam hitungan detik';

  @override
  String get onboardingScanBody =>
      'Tunjukkan setiap sisi ke kamera (atau ketuk warnanya) dan ikuti solusi 3D langkah demi langkah.';

  @override
  String get onboardingLearnTitle => 'Belajar dan bermain';

  @override
  String get onboardingLearnBody =>
      'Kuasai metode lapis demi lapis di Akademi, lalu putar, acak, dan selesaikan sesukamu di Playground 3D.';

  @override
  String get scanChoiceManualDesc =>
      'Ketuk warna setiap sisi, stiker demi stiker.';

  @override
  String get scanTryAgain => 'Coba lagi';

  @override
  String get scanEditManually => 'Perbaiki warna secara manual';

  @override
  String get scanLightingHint =>
      'Letakkan sisi di tengah kisi. Gunakan cahaya terang dan merata, hindari silau.';

  @override
  String get crownExplain =>
      'Lapisan (layer) adalah satu irisan mendatar kubus: lapisan pertama adalah lapisan putih di bawah, yang kedua lapisan tengah, dan yang ketiga lapisan kuning di atas.';

  @override
  String get lessonObjectiveHeading => 'Tujuan pembelajaran';

  @override
  String get dirRowTop => 'Baris atas sisi depan';

  @override
  String get dirRowBottom => 'Baris bawah sisi depan';

  @override
  String get dirColumnRight => 'Kolom kanan sisi depan';

  @override
  String get dirColumnLeft => 'Kolom kiri sisi depan';

  @override
  String get solveChoiceTitle => 'Bagaimana Anda ingin menyelesaikannya?';

  @override
  String get solveChoiceFastDesc => 'Solusi terpendek, gerakan demi gerakan.';

  @override
  String get solveChoiceGuidedDesc =>
      'Pelajari metode lapis demi lapis langkah demi langkah.';

  @override
  String get guidedSolvedTitle => 'Selesai!';

  @override
  String get guidedSolvedBody =>
      'Anda mengikuti setiap langkah dan menyelesaikan kubus.';

  @override
  String get solveAgain => 'Selesaikan lagi';

  @override
  String get backToHome => 'Kembali ke Beranda';

  @override
  String get dailyStatTime => 'Waktu hari ini';

  @override
  String get dailyStatBest => 'Rekor pribadi';

  @override
  String get dailyStatStreak => 'Runtutan saat ini';

  @override
  String get dailyStatBestStreak => 'Runtutan terbaik';

  @override
  String get privacyPolicyTitle => 'Kebijakan privasi';

  @override
  String get settingsPrivacyPolicyDesc =>
      'Apa yang disimpan CubeMentor dan apa yang digunakan iklan.';

  @override
  String get privacyIntro =>
      'CubeMentor bekerja tanpa akun dan tanpa server sendiri. Halaman ini menjelaskan apa yang tetap ada di perangkat Anda dan apa yang digunakan mitra iklan kami.';

  @override
  String get privacyDataTitle => 'Data Anda tetap di perangkat';

  @override
  String get privacyDataBody =>
      'Bahasa, pengaturan, kemajuan pelajaran, waktu penyelesaian, dan runtutan harian Anda hanya disimpan di perangkat ini. Kami tidak punya server, jadi kami tidak pernah menerimanya. Menghapus aplikasi akan menghapusnya.';

  @override
  String get privacyCameraTitle => 'Kamera';

  @override
  String get privacyCameraBody =>
      'Kamera hanya digunakan saat Anda memindai kubus. Gambar dianalisis di perangkat Anda untuk membaca warna stiker; tidak ada foto atau video yang disimpan atau dikirim.';

  @override
  String get privacyAdsTitle => 'Iklan';

  @override
  String get privacyAdsBody =>
      'Aplikasi ini menampilkan iklan dari Google AdMob. Google dapat menggunakan pengenal perangkat dan data interaksi iklan untuk menampilkan dan mengukur iklan, seperti dijelaskan dalam kebijakan privasi Google. Jika diwajibkan oleh hukum, Anda dimintai persetujuan terlebih dahulu dan dapat mengubahnya di Pengaturan.';

  @override
  String get privacyContactTitle => 'Kontak';

  @override
  String privacyContactBody(String email) {
    return 'Ada pertanyaan tentang privasi? Tulis kepada kami di $email.';
  }
}
