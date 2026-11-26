// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline => '2×2\'den 6×6\'ya her küpü tara, çöz ve ustalaş.';

  @override
  String get chooseCubeSize => 'Küpünü seç';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Başlangıç';

  @override
  String get cubeLevel3 => 'Klasik';

  @override
  String get cubeLevel4 => 'İleri';

  @override
  String get cubeLevel5 => 'Uzman';

  @override
  String get cubeLevel6 => 'Usta';

  @override
  String get cubeComingSoon => 'Yeni küp çok yakında';

  @override
  String get carouselPrevious => 'Önceki küp';

  @override
  String get carouselNext => 'Sonraki küp';

  @override
  String get chooseMode => 'Ne yapmak istiyorsun?';

  @override
  String get modePlayground => '3D Oyun Alanı';

  @override
  String get modePlaygroundDesc =>
      'Katmanları çevir, karıştır ve hamleleri 3D olarak tekrar oynat.';

  @override
  String get modeScanSolve => 'Tara ve Çöz';

  @override
  String get modeScanSolveDesc => 'Küpünü kamerayla tara ve çözümü al.';

  @override
  String get modeAcademy => 'Akademi';

  @override
  String get modeAcademyDesc => 'Etkileşimli derslerle adım adım öğren.';

  @override
  String get language => 'Dil';

  @override
  String get languageSearch => 'Dil ara';

  @override
  String get languageNoResults => 'Aramanla eşleşen dil yok.';

  @override
  String playgroundTitle(int size) {
    return '$size×$size Oyun Alanı';
  }

  @override
  String get scramble => 'Karıştır';

  @override
  String get reset => 'Sıfırla';

  @override
  String get undo => 'Geri al';

  @override
  String get speed => 'Hız';

  @override
  String get xray => 'Röntgen';

  @override
  String get prime => 'Ters';

  @override
  String get wide => 'Geniş';

  @override
  String layer(int index) {
    return 'Katman $index';
  }

  @override
  String get cubeRotations => 'Küp çevirmeleri';

  @override
  String get play => 'Oynat';

  @override
  String get pause => 'Duraklat';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hamle',
      one: '1 hamle',
      zero: 'Hamle yok',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Çözüldü';

  @override
  String get scrambled => 'Karışık';

  @override
  String get orbitHint =>
      'Çevirmek için bir sırayı sürükle · Görüşü döndürmek için arka planı sürükle';

  @override
  String get notationPad => 'Notasyon paneli';

  @override
  String get solve => 'Çöz';

  @override
  String get solving => 'Çözülüyor…';

  @override
  String get solveFast => 'Hızlı çözüm';

  @override
  String get solveLearn => 'Adım adım öğren';

  @override
  String get solveModeGuided => 'Rehberli (3 katman)';

  @override
  String get solveModeFast => 'Hızlı (optimal)';

  @override
  String solveUnavailable(int size) {
    return '$size×$size çözücü sonraki bir güncellemeyle gelecek.';
  }

  @override
  String get solveAlreadySolved => 'Küp zaten çözülmüş.';

  @override
  String solveFailed(String reason) {
    return 'Bu küp çözülemiyor ($reason).';
  }

  @override
  String get solveEngineMissing => 'Çözüm motoru bu cihazda kullanılamıyor.';

  @override
  String get solveComplete => 'Çözüldü! Harika iş.';

  @override
  String solveSummary(int count) {
    return '$count hamle';
  }

  @override
  String get nextMove => 'Sonraki hamle';

  @override
  String get previousMove => 'Önceki hamle';

  @override
  String get halfTurnHalfway =>
      'Güzel, yarısı tamam! Çift çevirme (180°) için bir kez daha çevir.';

  @override
  String get wideTurnInner =>
      'Harika! Geniş çevirmeyi tamamlamak için şimdi bitişik iç katmanı kaydır.';

  @override
  String get wideTurnOuter =>
      'Harika! Geniş çevirmeyi tamamlamak için şimdi yanındaki dış katmanı kaydır.';

  @override
  String get wideTurnMore =>
      'Harika! Geniş çevirmeyi tamamlamak için oku izleyerek katmanları tek tek kaydırmaya devam et.';

  @override
  String get guideSwipeHint =>
      'Okun gösterdiği katmanı okun yönüne kaydır ya da İleri\'ye dokun.';

  @override
  String get guideRotateHint =>
      'Tüm küpü okun gösterdiği gibi çevir: İleri\'ye dokun.';

  @override
  String get guideWrongMove => 'Vurgulanan oku takip et';

  @override
  String get guideExit => 'Rehberden çık';

  @override
  String get colorWhite => 'beyaz';

  @override
  String get colorYellow => 'sarı';

  @override
  String get colorGreen => 'yeşil';

  @override
  String get colorBlue => 'mavi';

  @override
  String get colorRed => 'kırmızı';

  @override
  String get colorOrange => 'turuncu';

  @override
  String get phaseOptimal2x2 => 'Optimal çözüm';

  @override
  String get phaseKociemba1 => 'Aşama 1 · Parçaları yönlendir';

  @override
  String get phaseKociemba2 => 'Aşama 2 · Küpü bitir';

  @override
  String get phaseLblCross => 'Beyaz artı';

  @override
  String get phaseLblCorners => 'Birinci katman köşeleri';

  @override
  String get phaseLblMiddle => 'Orta katman kenarları';

  @override
  String get phaseLblYellowCross => 'Sarı artı';

  @override
  String get phaseLblYellowEdges => 'Sarı artının kenarlarını hizala';

  @override
  String get phaseLblYellowCorners => 'Sarı köşeleri yerleştir';

  @override
  String get phaseLblYellowCornersOrient => 'Sarı köşeleri yönlendir';

  @override
  String get crownFirst => 'Birinci katman';

  @override
  String get crownSecond => 'İkinci katman';

  @override
  String get crownThird => 'Üçüncü katman';

  @override
  String get crownFirstGoal => 'Beyaz yüz ve birinci katman';

  @override
  String get crownSecondGoal => 'Orta katman';

  @override
  String get crownThirdGoal => 'Sarı yüz ve son katman';

  @override
  String get subStepGoal11 =>
      'Her beyaz kenarın yanındaki merkez rengiyle de eşleştiği bir beyaz artı oluştur.';

  @override
  String get subStepGoal12 =>
      '4 beyaz köşeyi yerlerine yerleştirip beyaz yüzü ve tüm birinci katmanı bitir.';

  @override
  String get subStepGoal21 =>
      'Birinci katmanı bozmadan orta katmanın 4 kenarını yerleştir.';

  @override
  String get subStepGoal31 => 'Son katmanda sarı bir artı oluştur.';

  @override
  String get subStepGoal32 =>
      'Sarı artının kenarlarını, her biri kendi yan merkeziyle eşleşene kadar yer değiştir.';

  @override
  String get subStepGoal33 =>
      '4 sarı köşeyi, hâlâ dönük olsalar bile doğru yerlerine taşı.';

  @override
  String get subStepGoal34 =>
      'Her sarı köşeyi yerinde, tüm etiketler eşleşip küp çözülene kadar döndür.';

  @override
  String get explainOptimal2x2 =>
      'Tüm 2×2 pozisyonları taranarak bulunan mümkün olan en kısa çözüm.';

  @override
  String get explainKociemba1 =>
      'Tüm parçaları yönlendir ve orta katman kenarlarını orta katmanda topla.';

  @override
  String get explainKociemba2 =>
      'Bu yönlendirmeyi koruyan yalnızca U, D ve yarım çevirmelerle bitir.';

  @override
  String get explainLblOrient =>
      'Tüm küpü beyaz merkez aşağıyı gösterecek şekilde çevir.';

  @override
  String explainLblCrossEdge(String piece) {
    return '$piece kenarını yan rengini eşleştirerek beyaz merkezin yanına indir.';
  }

  @override
  String explainLblDaisyPetal(String piece) {
    return 'Papatya: $piece kenarını beyazı yukarı bakacak şekilde sarı merkezin etrafına çıkar, bir yaprak olarak.';
  }

  @override
  String explainLblDaisyAlign(String piece) {
    return 'Üst katmanı, $piece yaprağı yan rengiyle aynı renkli merkezin tam üstüne gelene kadar çevir.';
  }

  @override
  String explainLblDaisyDrop(String piece) {
    return '$piece kenarını beyaz merkeze indirmek için o yüzü iki kez (180°) çevir: beyaz artının bir kolu daha.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return '$piece köşesi yanlış yerde sıkışmış. R U R\' U\' ile yukarı çıkar.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return '$piece köşesi yerinin üstüne gelene kadar üst katmanı çevir.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return '$piece köşesi yerine oturana kadar R U R\' U\' tekrarla.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return '$piece kenarı orta katmanda ama yanlış yerde. Onu yukarı çıkar.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Üst katmanı, $piece kenarının yan rengi merkeziyle eşleşecek şekilde çevir.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return '$piece kenarını sağa yerleştir: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return '$piece kenarını sola yerleştir: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Sarı şekli sonraki algoritma için yerleştirmek üzere üst katmanı çevir.';

  @override
  String get explainLblYellowCrossAlg =>
      'Sarı artıyı F R U R\' U\' F\' ile oluştur.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Sarı kenarları merkezleriyle hizalamak için üst katmanı çevir.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Sarı kenarları R U R\' U R U2 R\' U ile yer değiştir.';

  @override
  String get explainLblYellowCornersAlg =>
      'Sarı köşeleri U R U\' L\' U R\' U\' L ile döngüsel olarak yerlerine taşı.';

  @override
  String get explainLblNextCorner =>
      'Çözülmemiş sonraki sarı köşeyi sağ öne getirmek için üst katmanı çevir.';

  @override
  String get explainLblCornerTwist =>
      'Sarı yukarı bakana kadar R\' D\' R D tekrarla. Alt katman sonunda kendiliğinden düzelir.';

  @override
  String get explainLblFinalAlign => 'Küpü bitirmek için üst katmanı çevir.';

  @override
  String scanTitle(int size) {
    return '$size×$size Tara';
  }

  @override
  String get scanManualInput => 'Renkleri elle gir';

  @override
  String get scanUseCamera => 'Kamerayla tara';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Yüz $current/$total';
  }

  @override
  String get faceUp => 'Üst yüz';

  @override
  String get faceRight => 'Sağ yüz';

  @override
  String get faceFront => 'Ön yüz';

  @override
  String get faceDown => 'Alt yüz';

  @override
  String get faceLeft => 'Sol yüz';

  @override
  String get faceBack => 'Arka yüz';

  @override
  String get scanHintFront =>
      'Küpü herhangi bir yüzü sana dönük olacak şekilde tut. Bu senin ön yüzün: tarama boyunca üstte aynı yüzü koru.';

  @override
  String get scanHintRight =>
      'Ön yüzden başlayarak tüm küpü bir kez sola çevir, böylece sağ yüz sana baksın.';

  @override
  String get scanHintBack =>
      'Ön yüzden başlayarak tüm küpü iki kez sola çevir.';

  @override
  String get scanHintLeft =>
      'Ön yüzden başlayarak tüm küpü bir kez sağa çevir.';

  @override
  String get scanHintUp =>
      'Ön yüzden başlayarak üst yüzü kameraya bakacak şekilde kendine doğru eğ.';

  @override
  String get scanHintDown =>
      'Ön yüzden başlayarak alt yüzü kameraya bakacak şekilde kendine doğru eğ.';

  @override
  String get scanAlignHint => 'Izgarayı yüzle doldur, sonra deklanşöre dokun.';

  @override
  String get scanCapture => 'Yüzü yakala';

  @override
  String get scanTurnLeft => 'Tüm küpü sola çevir';

  @override
  String get scanTurnRight => 'Tüm küpü sağa çevir';

  @override
  String get scanTipTop => 'Üst yüzü kendine doğru eğ';

  @override
  String get scanTipBottom => 'Alt yüzü kendine doğru eğ';

  @override
  String get scanGlareTip =>
      'Parlama algılandı: küpü biraz eğ ya da tepedeki ışığı engellemek için telefonunu üzerinde tut.';

  @override
  String get scanDimTip =>
      'Çok karanlık: daha aydınlık bir yere geç veya feneri aç.';

  @override
  String get scanTorch => 'Fener';

  @override
  String get scanGuideLabel =>
      'Tarama rehberi: taranan yüzler renkli. Yeniden taramak için taranmış bir yüze dokun.';

  @override
  String get scanTapToRescan => 'Yeniden taramak için taranmış bir yüze dokun.';

  @override
  String get scanCameraMissing => 'Bu cihazda kamera bulunamadı.';

  @override
  String get scanCameraDenied =>
      'Kamera erişimi reddedildi. Renkleri yine de elle girebilirsin.';

  @override
  String get scanCameraFailed => 'Kamera başlatılamadı.';

  @override
  String get scanAllGood => 'Tüm etiketler doğru görünüyor.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count etiket yanlış görünüyor',
      one: '1 etiket yanlış görünüyor',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Bir şeyler tutmuyor';

  @override
  String scanIssueColors(int count) {
    return 'Her renk tam olarak $count kez görünmeli.';
  }

  @override
  String get scanIssueCenters => 'İki merkez aynı renkte.';

  @override
  String get scanIssuePieces =>
      'Bu etiketler gerçek bir küpte bulunmayan parçalar oluşturuyor.';

  @override
  String get scanIssueTwist => 'Bir köşe dönük. Köşe etiketlerini kontrol et.';

  @override
  String get scanIssueFlip => 'Bir kenar ters. Kenar etiketlerini kontrol et.';

  @override
  String get scanIssueParity => 'İki parça yer değiştirmiş görünüyor.';

  @override
  String get scanIssueUnavailable => 'Renk kontrolü bu cihazda kullanılamıyor.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count etiket zor okundu: hızlıca bir göz at.',
      one: '1 etiket zor okundu: hızlıca bir göz at.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Rengini değiştirmek için etikete dokun · Palet için basılı tut';

  @override
  String get scanRescanFace => 'Bir yüzü yeniden tara';

  @override
  String get scanCancelRescan => 'Renklere dön';

  @override
  String get scanPaletteTitle => 'Bir renk seç';

  @override
  String get scanOpen3d => '3D\'de aç';

  @override
  String get scanRestart => 'Baştan başla';

  @override
  String get modeTimer => 'Speedcube zamanlayıcı';

  @override
  String get modeTimerDesc =>
      'Karıştırmalar, inceleme, ortalamalar ve kişisel rekorlar.';

  @override
  String get modeDaily => 'Günlük meydan okuma';

  @override
  String get modeDailyDesc => 'Her gün yeni bir karıştırma. Serini sürdür.';

  @override
  String get modePatterns => 'Desen kütüphanesi';

  @override
  String get modePatternsDesc =>
      'Dama tahtası, superflip ve daha fazlası, 3D olarak.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count günlük seri',
      one: '1 günlük seri',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Öğrenmeye devam et';

  @override
  String get startLearning => 'Öğrenmeye başla';

  @override
  String lessonOf(int index, int total) {
    return 'Ders $index/$total';
  }

  @override
  String get academyAllDone => 'Tüm dersler tamamlandı!';

  @override
  String get academyTitle => 'Akademi';

  @override
  String academyProgress(int done, int total) {
    return '$total dersten $done tanesi tamamlandı';
  }

  @override
  String get lessonAdvanced => 'İleri';

  @override
  String lessonPartOf(int index, int total) {
    return 'Bölüm $index/$total';
  }

  @override
  String get lessonNext => 'İleri';

  @override
  String get lessonPrevious => 'Geri';

  @override
  String get lessonFinish => 'Dersi bitir';

  @override
  String get lessonComplete => 'Ders tamamlandı!';

  @override
  String get lessonNextLesson => 'Sonraki ders';

  @override
  String get lessonBackToAcademy => 'Akademi\'ye dön';

  @override
  String get lessonTryIt =>
      'Sıra sende: okun gösterdiği katmanı kaydır ya da İleri\'ye dokun.';

  @override
  String get lessonLookAround =>
      'Küpe her taraftan bakmak için arka planı sürükle.';

  @override
  String get lessonDemoDone => 'Güzel! Devam etmek için İleri\'ye dokun.';

  @override
  String holdPrompt(String top, String front) {
    return 'Küpü $top merkez üstte, $front merkez sana dönük olacak şekilde tut.';
  }

  @override
  String get trackBeginner => 'Başlangıç 3×3: katman katman';

  @override
  String get trackCfop => 'CFOP\'a giriş';

  @override
  String get trackTwoByTwo => '2×2 başlangıç ve Ortega';

  @override
  String get trackBigCubes => 'Büyük küpler: indirgeme ve parity';

  @override
  String moveSentence(String layer, String direction) {
    return '$layer $direction çevir';
  }

  @override
  String get moveFaceR => 'sağ yüzü';

  @override
  String get moveFaceL => 'sol yüzü';

  @override
  String get moveFaceU => 'üst yüzü';

  @override
  String get moveFaceD => 'alt yüzü';

  @override
  String get moveFaceF => 'ön yüzü';

  @override
  String get moveFaceB => 'arka yüzü';

  @override
  String moveLayerInner(int depth, String face) {
    return '($face tarafından) $depth. katmanı';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth katman derinliğinde)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return '($face tarafından) $near–$far. katmanları';
  }

  @override
  String get moveLayerMiddle => 'orta katmanı';

  @override
  String get moveDirUp => 'yukarı';

  @override
  String get moveDirDown => 'aşağı';

  @override
  String get moveDirLeft => 'sola';

  @override
  String get moveDirRight => 'sağa';

  @override
  String get moveDirClockwise => 'saat yönünde';

  @override
  String get moveDirCounter => 'saat yönünün tersine';

  @override
  String get moveDirBackClockwise => 'arkadan bakınca saat yönünde';

  @override
  String get moveDirBackCounter => 'arkadan bakınca saat yönünün tersine';

  @override
  String get moveDirHalf => 'yarım tur (iki kez)';

  @override
  String get moveRotateX => 'Tüm küpü eğ: ön yüz üste gider';

  @override
  String get moveRotateXPrime => 'Tüm küpü eğ: ön yüz alta gider';

  @override
  String get moveRotateX2 => 'Tüm küpü ters çevir: ön yüz arkaya gider';

  @override
  String get moveRotateY => 'Tüm küpü döndür: ön yüz sola gider';

  @override
  String get moveRotateYPrime => 'Tüm küpü döndür: ön yüz sağa gider';

  @override
  String get moveRotateY2 => 'Tüm küpü yarım tur döndür: arka yüz öne gelir';

  @override
  String get moveRotateZ => 'Tüm küpü saat yönünde yuvarla: üst yüz sağa gider';

  @override
  String get moveRotateZPrime =>
      'Tüm küpü saat yönünün tersine yuvarla: üst yüz sola gider';

  @override
  String get moveRotateZ2 => 'Tüm küpü baş aşağı çevir: üst yüz alta gider';

  @override
  String get phaseReductionCenters => 'Merkezler';

  @override
  String get phaseReductionEdges => 'Kenarları eşleştir';

  @override
  String get phaseReductionEdgeParity => 'Kenar parity';

  @override
  String get phaseReductionOllParity => 'OLL parity';

  @override
  String get phaseReductionPllParity => 'PLL parity';

  @override
  String get explainReductionCenterBlock =>
      'Birkaç merkez parçasını aynı anda yerine getiren iç katman çevirmeleri.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Bir $piece merkez parçasını, bitmiş merkezlere dokunmayan bir 3\'lü döngüyle kendi yüzüne getir.';
  }

  @override
  String get explainReductionParityCenters =>
      'Parity hamlesinin kaydırdığı merkezleri yeniden kur.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '$piece kenar parçalarını bir 3\'lü döngüyle birleştir; merkezler çözülü kalır.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Son kenarlar yalnızca 3\'lü döngülerle eşleştirilemez (kenar parity). Tek bir iç katman çevirmesi bunu düzeltir.';

  @override
  String get explainReductionOllParity =>
      'OLL parity: bir kenar ters, bu 3×3\'te olamaz. Bu algoritma onu geri çevirir.';

  @override
  String get explainReductionPllParity =>
      'PLL parity: iki kenar yer değiştirmiş, bu 3×3\'te imkânsız. Bu algoritma onları geri değiştirir.';

  @override
  String get patternsTitle => 'Desen kütüphanesi';

  @override
  String get patternsHint =>
      'İzlemek için bir desene dokun, sonra kendi küpünde takip et.';

  @override
  String get patternCheckerboard => 'Dama tahtası';

  @override
  String get patternCubeInCube => 'Küp içinde küp';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Noktalar';

  @override
  String get patternCross => 'Artı';

  @override
  String get patternPython => 'Piton';

  @override
  String get phasePattern => 'Deseni oluştur';

  @override
  String get explainPatternStep =>
      'Her hamleyi kendi küpünde takip et. Normale döndürmek için Çöz\'e dokun.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Speedcube zamanlayıcı';

  @override
  String get timerHoldToStart => 'Basılı tut, sonra başlatmak için bırak';

  @override
  String get timerReleaseToStart => 'Başlatmak için bırak';

  @override
  String get timerTapToStop => 'Durdurmak için herhangi bir yere dokun';

  @override
  String get timerInspectionToggle => '15 sn inceleme';

  @override
  String get timerLoadingScramble => 'Karıştırma oluşturuluyor…';

  @override
  String get timerPb => 'En iyi';

  @override
  String get timerSolves => 'Çözümler';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Sil';

  @override
  String get timerHistory => 'Geçmiş';

  @override
  String get timerNoSolves => 'Henüz çözüm yok. Küpünü karıştır ve başla!';

  @override
  String get timerNewPb => 'Yeni kişisel rekor!';

  @override
  String get timerClearHistory => 'Geçmişi temizle';

  @override
  String get timerScrambleHint =>
      'Beyaz üstte, yeşil önde olacak şekilde tut, sonra karıştır:';

  @override
  String get dailyTitle => 'Günlük meydan okuma';

  @override
  String dailyFor(String date) {
    return '$date meydan okuması';
  }

  @override
  String dailyBestStreak(int count) {
    return 'En iyi seri: $count';
  }

  @override
  String get dailyDone => 'Bugünlük bu kadar! Yarın tekrar gel.';

  @override
  String get dailyNotDone => 'Serini korumak için bugünün karıştırmasını çöz.';

  @override
  String get dailySolveVirtual => '3D küpte çöz';

  @override
  String get dailyTimeIt => 'Kendi küpünde süre tut';

  @override
  String get dailyHint => 'İpucu';

  @override
  String dailyHintText(String moves) {
    return 'Beyaz artıyla başla: $moves';
  }

  @override
  String get dailyHintFailed => 'Şu anda ipucu yok.';

  @override
  String get lessonBasics => 'Küple tanış';

  @override
  String get lessonBasicsDesc => 'Parçalar, yüzler ve hamle adları.';

  @override
  String get stepBasicsPieces => 'Üç tür parça';

  @override
  String get stepBasicsPiecesBody =>
      'Merkezler asla hareket etmez ve her yüze rengini verir. Kenarların iki rengi, köşelerin üç rengi vardır. Çözmek, her kenarı ve köşeyi eşleşen merkezlerin yanına taşımak demektir.';

  @override
  String get stepBasicsFaces => 'Altı yüz harfi';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F ve B sağ, sol, üst, alt, ön ve arka yüzlerdir. Tek başına bir harf, o yüze doğrudan bakıyormuş gibi saat yönünde çeyrek tur demektir.';

  @override
  String get stepBasicsPrime => 'Ters ve çift hamleler';

  @override
  String get stepBasicsPrimeBody =>
      'Kesme işareti (R\') diğer yöne, saat yönünün tersine çevirir. 2 (U2) yarım turdur: iki çeyrek tur.';

  @override
  String get stepCrossGoal => 'Hedef';

  @override
  String get stepCrossGoalBody =>
      'Sarıyı üstte, yeşili sana dönük tut. Önce dört beyaz kenarı sarı merkezin etrafına, beyazı yukarı bakacak şekilde, yapraklar gibi topla: bu papatya. Sonra her yaprak beyaz merkeze iner ve yan rengi yanındaki merkezle eşleşir.';

  @override
  String get stepCrossTop => 'Üstteki kenar';

  @override
  String get stepCrossTopBody =>
      'Üstte beyazı yukarı bakan beyaz kenar bir papatya yaprağıdır. Üst katmanı, yan rengi aynı renkli merkezin tam üstüne gelene kadar çevir, sonra o yüzü iki kez (180°) çevirip beyaz merkeze indir.';

  @override
  String get stepCrossMiddle => 'Ortadaki kenar';

  @override
  String get stepCrossMiddleBody =>
      'Orta katmanda sıkışan kenar önce yukarı çıkar: yanını yukarı çevir, üstü kenara al ve yanı geri çevir; yerleşmiş parçalar yerinde kalır. Artık üstte bir yaprak: hizala ve o yüzü iki kez çevir.';

  @override
  String get stepCornersInsert => 'Yerinin üstünde';

  @override
  String get stepCornersInsertBody =>
      'Üst katmanı, beyaz köşe yan renklerine uyan iki merkezin arasındaki yerinin tam üstüne gelene kadar çevir. Burada bir üst hamlesi ve R U\' R\' yeter: U köşeyi yerinin üstüne getirir, R U\' R\' onu beyaz aşağıda olacak şekilde sokar.';

  @override
  String get stepCornersRepeat => 'Tetikleyiciyi tekrarla';

  @override
  String get stepCornersRepeatBody =>
      'Yeri ön sağda tut ve beyaz aşağı bakana kadar R U R\' U\' tekrarla: beyaz sağa bakıyorsa bir, yukarı bakıyorsa üç, sana bakıyorsa beş kez. Bu arada üst karışık görünür; kendiliğinden düzelir.';

  @override
  String get stepMiddleRight => 'Kenar sağa';

  @override
  String get stepMiddleRightBody =>
      'Üstte sarısı olmayan bir kenar bul. Ön rengi karşındaki merkezle eşleşene kadar üstü çevir. Üst rengi sağ merkezle eşleşiyorsa sağa gönder: U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Kenar sola';

  @override
  String get stepMiddleLeftBody =>
      'Üst rengi sol merkezle eşleşiyorsa aynasını kullan: U\' L\' U L U F U\' F\'. Beyaz katman her seferinde bütün olarak geri gelir.';

  @override
  String get stepYellowCross => 'Tek algoritma';

  @override
  String get stepYellowCrossBody =>
      'Sadece üstteki sarı kenarlara bak. L\'yi arka solda, çizgiyi soldan sağa tut, sonra F R U R\' U\' F\' yap. Çizgi bir kez, L iki kez, nokta en fazla üç kez ister.';

  @override
  String get stepYellowEdges => 'Kenarları eşleştir';

  @override
  String get stepYellowEdgesBody =>
      'Üstü, iki kenar merkezleriyle eşleşene kadar çevir. Biri arkada, biri sağdayken R U R\' U R U2 R\' U ön ve sol kenarların yerini değiştirir.';

  @override
  String get stepPlaceCorners => 'Yerleştir';

  @override
  String get stepPlaceCornersBody =>
      'Bir köşe, renkleri çevresindeki üç merkezle eşleşince yerindedir, dönük olsa bile. Böyle bir köşeyi ön sağda tut: U R U\' L\' U R\' U\' L diğer üçünü döndürür. Dördü de yerine gelene kadar tekrarla.';

  @override
  String get stepTwistCorners => 'Döndür';

  @override
  String get stepTwistCornersBody =>
      'Çözülmemiş köşe ön sağdayken sarı üste gelene kadar R\' D\' R D\'yi çiftler halinde tekrarla, sonra sıradakini getirmek için yalnızca üstü çevir. Alt kısım son köşeye kadar bozuk görünür: devam et.';

  @override
  String get lessonCfopIntro => 'CFOP nedir?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Dört aşama';

  @override
  String get stepCfopOverviewBody =>
      'Speedcuber\'lar artıyı çözer, sonra her birinci katman köşesini orta kenarıyla eşleştirir (F2L), son katmanı yönlendirir (OLL) ve en sonunda permüte eder (PLL).';

  @override
  String get stepCfopCross => 'Artıyı planla';

  @override
  String get stepCfopCrossBody =>
      'CFOP\'ta artı inceleme sırasında planlanır ve altta yaklaşık sekiz hamlede kurulur.';

  @override
  String get lessonF2l => 'F2L temelleri';

  @override
  String get lessonF2lDesc => 'Bir köşeyi kenarıyla eşleştir.';

  @override
  String get stepF2lRight => 'Bir çifti yerleştir';

  @override
  String get stepF2lRightBody =>
      'Bir köşe ve kenarı üstte yan yana durduğunda, onları yuvalarının üstüne getir ve birlikte yerleştir.';

  @override
  String get stepF2lLeft => 'Sol el çifti';

  @override
  String get stepF2lLeftBody =>
      'Diğer taraftaki aynı durum aynasıdır: U\' L\' U L. Küpü çevirmek (y) hangi el daha kolaysa onu kullanmanı sağlar.';

  @override
  String get lessonOll => 'İki bakışta OLL';

  @override
  String get lessonOllDesc => 'Üstü sarı yap.';

  @override
  String get stepOllCross => 'Önce kenarlar';

  @override
  String get stepOllCrossBody =>
      'İki bakışta OLL, zaten bildiğin sarı artı algoritmasıyla başlar.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Sol önde bir sarı köşe yukarı bakarken Sune (R U R\' U R U2 R\') diğer üçünü yönlendirir. Diğer durumların çoğu Sune ve aynasını kullanır.';

  @override
  String get lessonPll => 'İki bakışta PLL';

  @override
  String get lessonPllDesc => 'Küpü bitir.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm iki köşeyi ve iki kenarı yer değiştirir. Köşeleri yerleştirmek için kullan: yer değiştirmesi gereken iki köşeyi sağda tut.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Köşeler bittiğinde U-perm üç kenarı döngüsel olarak taşır. Bitmiş tarafı arkada tut.';

  @override
  String get lessonTwoFirst => '2×2 birinci katman';

  @override
  String get lessonTwoFirstDesc => 'Eşleşen köşelerle bir yüz kur.';

  @override
  String get stepTwoIntro => 'Yalnızca köşeler';

  @override
  String get stepTwoIntroBody =>
      '2×2 yalnızca sekiz köşedir: kenar da merkez de yok. Komşu yan renkleri eşleşen beyaz katmanı altta kur, sonra tek bir yoldan bitir: sarı üst için Sune, ardından T-perm ya da Y-perm.';

  @override
  String get stepTwoCorner => 'Köşeleri yerleştir';

  @override
  String get stepTwoCornerBody =>
      '3×3\'teki beyaz köşeler gibi: bir köşeyi ön sağdaki boş yerinin üstüne getir ve sok; burada U R U\' R\' ile ya da beyaz aşağı bakana kadar R U R\' U\' tekrarlayarak. Yan renklerini komşusuyla karşılaştır.';

  @override
  String get lessonTwoOll => 'Üstü yönlendir';

  @override
  String get lessonTwoOllDesc => 'Sune ile Ortega OLL.';

  @override
  String get stepTwoSune => 'Yine Sune';

  @override
  String get stepTwoSuneBody =>
      'Yukarı bakan sarı çıkartmaları say. Sarısı yukarı bakan tek köşeyi ön solda tut ve Sune yap (R U R\' U R U2 R\'). Yeniden say ve tut; en fazla üç Sune. Aralarda yalnızca üstü çevir.';

  @override
  String get lessonTwoPbl => 'İki katmanı da permüte et';

  @override
  String get lessonTwoPblDesc => 'Bitirmek için köşeleri yer değiştir.';

  @override
  String get stepTwoAdjacent => 'Komşu değişim';

  @override
  String get stepTwoAdjacentBody =>
      'Farlar, bir yanda üstteki iki aynı renkli çıkartmadır. Farlar sola gelene kadar üstü çevir; böylece değişecek iki köşe sağda olur. Sonra T-perm yap.';

  @override
  String get stepTwoDiagonal => 'Çapraz değişim';

  @override
  String get stepTwoDiagonalBody =>
      'Hiçbir yanda far yoksa çapraz iki köşe yer değiştirmelidir: herhangi bir yandan Y-perm yap, sonra her şeyi hizalamak için üstü çevir.';

  @override
  String get lessonBigIntro => 'Büyük küp parçaları';

  @override
  String get lessonBigIntroDesc => 'Merkezler, kanatlar ve iç katmanlar.';

  @override
  String get stepBigPieces => 'Sabit merkez yok';

  @override
  String get stepBigPiecesBody =>
      '4×4\'te her yüzün dört hareketli merkez parçası vardır ve her kenar iki kanattan oluşur. Sabit merkez yok, bu yüzden renk sırasını bir köşeden kontrol et: beyaz sarının, mavi yeşilin, kırmızı turuncunun karşısında.';

  @override
  String get stepBigSlices => 'Geniş ve iç çevirmeler';

  @override
  String get stepBigSlicesBody =>
      'Rw sağdaki iki katmanı birlikte çevirir. 2R yalnızca sağdan ikinci katmanı çevirir. Bu çevirmeler merkezleri ve kanatları hareket ettirir.';

  @override
  String get lessonBigCenters => 'Merkezler';

  @override
  String get lessonBigCentersDesc => 'Merkez parçalarını grupla.';

  @override
  String get stepBigCenterCycle => 'Merkez 3\'lü döngüsü';

  @override
  String get stepBigCenterCycleBody =>
      'Bu komütatör tam olarak üç merkez parçasını taşır ve gerisine dokunmaz; bitmiş merkezler bitmiş kalır. Tek bir parça çubuğa katılmıyorsa bunu kullan.';

  @override
  String get lessonBigEdges => 'Kenarları eşleştir';

  @override
  String get lessonBigEdgesDesc => 'Kanatları tam kenarlara birleştir.';

  @override
  String get stepBigEdgePair => 'Eşleştir ve geri getir';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' iki eşleşen kanadı hizalar, R U R\' F R\' F\' R eşleşmemiş bir kenarı içeri alır ve Uw merkezleri geri getirir. Açtığın katmanı hep kapat.';

  @override
  String get lessonBigParity => 'Parity';

  @override
  String get lessonBigParityDesc => 'Çift küplerde OLL parity ve PLL parity.';

  @override
  String get stepBigOllParity => 'OLL parity';

  @override
  String get stepBigOllParityBody =>
      'Tek bir ters kenar 3×3\'te olamaz: bu OLL parity\'dir, hata değil. Onu üst katmanın önünde tut ve uzun algoritmayı yap. Algoritma üstteki sol ve sağ kenarları ve iki köşeyi de değiştirir; son 3×3 adımları bunları düzeltir.';

  @override
  String get stepBigPllParity => 'PLL parity';

  @override
  String get stepBigPllParityBody =>
      'En sonda iki kenar yer değiştirmiş ve hiçbir 3×3 algoritması uymuyor mu? Bu PLL parity. Onları üst katmanda önde ve arkada tut: 2R2 U2 2R2 Uw2 2R2 2U2 yerlerini değiştirir.';

  @override
  String get introGoalHeading => 'Hedef ne?';

  @override
  String get introHowHeading => 'Nasıl yapıyoruz?';

  @override
  String get introHoldHeading => 'Nasıl tutulur';

  @override
  String get introWhyHeading => 'Neden işe yarar';

  @override
  String get introStart => 'Anladım, adım adım başla';

  @override
  String get introDontShowAgain => 'Bir daha otomatik gösterme';

  @override
  String get introShowGoal => 'Hedefi göster';

  @override
  String get introStateStart => 'Başlangıç';

  @override
  String get introStateGoal => 'Hedef';

  @override
  String get introPlayMorph => 'Başlangıçtan hedefe oynat';

  @override
  String get introGoalBasics =>
      'Küpü okumayı öğren: parçaları, altı yüzü ve hamle harflerinin onları nasıl çevirdiği.';

  @override
  String get introGoalCross =>
      'Altta, her beyaz kenarın yanındaki merkezle de eşleştiği bir beyaz artı yap.';

  @override
  String get introGoalCorners =>
      'Dört beyaz köşeyi yerleştirip tüm birinci katmanı bitir: beyaz yüz ve eşleşen yan renkler.';

  @override
  String get introGoalMiddle =>
      'İlk iki katmanın çözülmesi için dört orta katman kenarını yerleştir.';

  @override
  String get introGoalYellowCross =>
      'Üstte sarı bir artı yap; yan renklerin henüz eşleşmesi gerekmez.';

  @override
  String get introGoalYellowEdges =>
      'Sarı artının her kenarını kendi yanındaki merkez rengiyle hizala.';

  @override
  String get introGoalYellowCorners =>
      'Her sarı köşeyi, hâlâ dönük olsa bile kendi yerine taşı.';

  @override
  String get introGoalTwistCorners =>
      'Tüm küp çözülsün diye sarı köşeleri doğru yöne döndür.';

  @override
  String get introGoalCfopIntro =>
      'Speedcubing planını gör: artı, ilk iki katman, sonra son katman iki bakışta.';

  @override
  String get introGoalF2l =>
      'Her beyaz köşeyi orta kenarıyla birlikte yerleştirerek iki katmanı aynı anda bitir.';

  @override
  String get introGoalOll => 'Tüm üst yüzü bir veya iki algoritmayla sarı yap.';

  @override
  String get introGoalPll =>
      'Küpü bitirmek için son katman parçalarını yerlerine taşı.';

  @override
  String get introGoalTwoFirst => '2×2\'de tam bir beyaz katman kur.';

  @override
  String get introGoalTwoOll => '2×2\'nin üst yüzünü tamamen sarı yap.';

  @override
  String get introGoalTwoPbl =>
      'Son köşeleri tek bir T-perm ya da Y-perm ile yerine götür, sonra üst katmanı hizalayıp 2×2\'yi çöz.';

  @override
  String get introGoalBigIntro =>
      '4×4 ile tanış: merkezler, kenar çiftleri ve köşeler ile onları çeviren hamleler.';

  @override
  String get introGoalBigCenters =>
      'Her yüzün merkez parçalarını tek, düz renkli bir blokta topla.';

  @override
  String get introGoalBigEdges =>
      'Eşleşen kenar parçalarını birleştir, böylece her kenar tek bir 3×3 kenarı gibi görünsün.';

  @override
  String get introGoalBigParity =>
      'Bir 3×3\'te hiç olmayan iki 4×4 durumunu düzelt: ters dönmüş tek kenar (OLL parity) ya da yer değiştirmiş iki kenar (PLL parity).';

  @override
  String get introHowBasics =>
      'Merkezler asla hareket etmez, bu yüzden her yüzün rengini gösterir.\nHer harf bir yüzü saat yönünde çeyrek tur çevirir.\nKesme işareti (\') geri çevirir; 2 iki kez çevirir.';

  @override
  String get introHoldBasics =>
      'İstediğin gibi: merkezler hareket etmez, bu yüzden renkler hangi yüzün hangisi olduğunu hep söyler.';

  @override
  String get introWhyBasics =>
      'Her algoritma bu harflerin bir dizisidir, bu yüzden onları okumak ilk beceridir.';

  @override
  String get introHowCross =>
      'Her beyaz kenarı beyazı yukarı bakacak şekilde, sarı merkezin etrafına üste çıkar: bu papatya.\nÜst katmanı, bir yaprağın yan rengi kendi merkezinin üstüne gelene kadar çevir.\nO yüzü iki kez çevirip aşağı indir; dördü için de tekrarla.';

  @override
  String get introHoldCross =>
      'Adım boyunca sarı merkez üstte, beyaz merkez altta. Bir yaprağı hizalamak için küpü değil üst katmanı çevir.';

  @override
  String get introWhyCross =>
      'Beyaz yukarı bakarken ön yüzü iki kez çevirmek kenarı beyaz merkezin üstüne, beyaz aşağıda ve yan rengi zaten eşleşmiş olarak koyar.';

  @override
  String get introHowCorners =>
      'Üst katmanı, beyaz bir köşe ön sağdaki boş yerinin üstüne gelene kadar çevir.\nR U R\' U\' tekrarla: beyaz sağa bakıyorsa bir, yukarı bakıyorsa üç, sana bakıyorsa beş kez.\nDiğer üç köşe için de aynısını yap.';

  @override
  String get introHoldCorners =>
      'Beyaz altta, sarı üstte. Köşe ön sağda, tam yerinin üstünde.';

  @override
  String get introWhyCorners =>
      'R U R\' U\' yeri kaldırıp geri koyar: her tur köşeyi biraz çevirir, sonunda beyaz aşağı bakar ve artı hiç bozulmaz.';

  @override
  String get introHowMiddle =>
      'Üstte sarısı olmayan bir kenar bul ve ön rengini altındaki merkezle eşleştir.\nÜst rengi nereye gideceğini söyler: sağa ya da sola.\n8 hamlelik algoritmayla yerleştir; beyaz katman her seferinde geri gelir.';

  @override
  String get introHoldMiddle =>
      'Beyaz altta, sarı üstte. Kenar önde, ön rengi altındaki merkezle aynı.';

  @override
  String get introWhyMiddle =>
      'Algoritma yeri kenara çeker, kenarı içeri kaydırır ve beyaz katmanı geri getirir. Sarısı olan kenar üste aittir, ortaya asla.';

  @override
  String get introHowYellowCross =>
      'Sadece üstteki sarı kenarlara bak: nokta, L ya da çizgi.\nL\'yi arka solda, çizgiyi soldan sağa tut ve F R U R\' U\' F\' yap.\nÇizgi bir kez, L iki kez, nokta en fazla üç kez ister.';

  @override
  String get introHoldYellowCross =>
      'Beyaz altta, sarı üstte. L arka solda, çizgi soldan sağa; nokta nasıl olursa.';

  @override
  String get introWhyYellowCross =>
      'F R U R\' U\' F\' ilk iki katmana dokunmadan her seferinde iki üst kenarı çevirir.';

  @override
  String get introHowYellowEdges =>
      'Üst katmanı, iki kenar kendi merkezleriyle eşleşene kadar çevir.\nOnları arkada ve sağda tut, sonra R U R\' U R U2 R\' U yap.\nEşleşen kenarlar karşı karşıyaysa önce herhangi bir yandan bir kez yap.';

  @override
  String get introHoldYellowEdges =>
      'Sarı üstte. Eşleşen bir kenar arkada, diğeri sağda.';

  @override
  String get introWhyYellowEdges =>
      'Bu algoritma yalnızca üst parçaları hareket ettirir, bu yüzden ilk iki katman hep geri gelir.';

  @override
  String get introHowYellowCorners =>
      'Bir köşe, renkleri çevresindeki üç merkezle eşleşince yerindedir, dönük olsa bile.\nYerindeki bir köşeyi ön sağda tut.\nU R U\' L\' U R\' U\' L diğer üçünü döndürür; hepsi oturana kadar tekrarla.';

  @override
  String get introHoldYellowCorners =>
      'Sarı üstte. Zaten yerinde olan bir köşe ön sağda; yoksa herhangi bir köşe.';

  @override
  String get introWhyYellowCorners =>
      'Üç köşeyi daire halinde döndürür, ön sağdakini yerinde bırakır; her tekrar daha çok köşeyi yerine getirir.';

  @override
  String get introHowTwistCorners =>
      'Çözülmemiş bir köşeyi ön sağda tut.\nSarısı yukarı bakana kadar R\' D\' R D\'yi çiftler halinde tekrarla.\nSonraki için yalnızca üstü çevir; alt kısım son köşeyle geri gelir.';

  @override
  String get introHoldTwistCorners =>
      'Sarı üstte, çevrilecek köşe ön sağda. Köşeler arasında yalnızca üstü çevir, asla bütün küpü değil.';

  @override
  String get introWhyTwistCorners =>
      'R\' D\' R D köşeyi çevirir ve altı karıştırır, ama tüm köşeler çevrilince alt geri gelir. Yarıda bırakırsan bozuk kalır.';

  @override
  String get introHowCfopIntro =>
      'Cross: inceleme sırasında planlanan dört kenar.\nF2L: her köşe kenarıyla birlikte girer.\nOLL üstü sarı yapar, sonra PLL parçaları yerlerine taşır.';

  @override
  String get introHoldCfopIntro =>
      'Hızlı küpçüler artıyı altta yapar, böylece çevirirken sıradaki parçaları önceden görürler.';

  @override
  String get introWhyCfopIntro =>
      'Köşeyi kenarıyla birlikte çözmek çok hamle kazandırır, durumları tanımak deneme yanılmanın yerini alır.';

  @override
  String get introHowF2l =>
      'Üst katmanda bir köşe ve eşleşen kenarını bul.\nOnları yuvalarının üstünde eşleştir.\nÇifti üç veya dört hamleyle yerleştir.';

  @override
  String get introHoldF2l =>
      'Artı altta. Çiftin yeri ön sağda, ayna durumda ön solda.';

  @override
  String get introWhyF2l =>
      'Eşleşmiş köşe ve kenar birlikte girer, böylece parça parça değil iki katman aynı anda büyür.';

  @override
  String get introHowOll =>
      'Önce F R U R\' U\' F\' ile sarı artı.\nSonra köşeleri yönlendir, örneğin Sune ile.\nDurumu gördüğün sarıdan tanı.';

  @override
  String get introHoldOll =>
      'Sarı üstte. Sune için sarısı yukarı bakan tek köşe ön solda durur.';

  @override
  String get introWhyOll =>
      'Son katmanı önce yönlendirme, sonra yer değiştirme olarak bölmek algoritma sayısını az tutar.';

  @override
  String get introHowPll =>
      'Üst zaten tamamen sarı.\nT-perm köşeleri değiştirir; U-perm üç kenarı döngüsel taşır.\nAlgoritmayı seçmek için yan renkleri oku.';

  @override
  String get introHoldPll =>
      'Sarı üstte. T-perm: farlar solda. U-perm: bitmiş yan arkada.';

  @override
  String get introWhyPll =>
      'Üst tamamen sarı olunca yalnızca parçaların yerleri yanlıştır ve birkaç değişim küpü bitirir.';

  @override
  String get introHowTwoFirst =>
      'Beyazı aşağıda olan bir köşeyi çapa olarak seç.\nSonraki her köşeyi ön sağdaki yerinin üstüne getir.\nYan renkleri eşleşerek oturana kadar R U R\' U\' tekrarla.';

  @override
  String get introHoldTwoFirst =>
      'Beyaz altta. Boş yer ön sağda, köşesi üst katmanda tam üstünde.';

  @override
  String get introWhyTwoFirst =>
      '2×2\'nin merkezi yoktur: koyduğun ilk köşe komşularının renklerini belirler, bu yüzden yalnızca beyaz değil yan renkler de önemlidir.';

  @override
  String get introHowTwoOll =>
      'Sarısı yukarı bakan köşeleri say.\nBir taneyse onu ön solda tut ve Sune yap: R U R\' U R U2 R\'.\nYeniden say ve tekrarla; en fazla üç Sune.';

  @override
  String get introHoldTwoOll =>
      'Beyaz altta, sarı üstte. Her Sune\'dan önce sarısı yukarı bakan köşe ön solda.';

  @override
  String get introWhyTwoOll =>
      'Sune beyaz katmanı bozmadan üst köşeleri çevirir; yeniden saymak bir sonraki tutuşu söyler.';

  @override
  String get introHowTwoPbl =>
      'Far ara: bir yanda üstte iki aynı renkli çıkartma.\nBir yanda far varsa sola al ve T-perm yap.\nFar yoksa herhangi bir yandan Y-perm yap, sonra üstü hizala.';

  @override
  String get introHoldTwoPbl =>
      'Beyaz altta, sarı üstte. T-perm: farlar solda. Y-perm: herhangi bir yan sana dönük.';

  @override
  String get introWhyTwoPbl =>
      'Üst sarıyken yalnızca köşelerin yerleri yanlıştır: T-perm iki komşuyu, Y-perm iki çaprazı değiştirir.';

  @override
  String get introHowBigIntro =>
      'Hiçbir merkez sabit değil: dört merkez parçası her yüz rengini oluşturur.\nRw gibi geniş hamleler iki katmanı aynı anda çevirir.\n2R gibi iç hamleler yalnızca bir iç katmanı çevirir.';

  @override
  String get introHoldBigIntro =>
      'Başta istediğin gibi: 4×4\'te sabit merkez yoktur, her rengin yerini sen seçersin.';

  @override
  String get introWhyBigIntro =>
      'İndirgeme, merkezleri ve kenar parçalarını gruplar; böylece büyük küp 3×3 gibi çözülür.';

  @override
  String get introHowBigCenters =>
      'Önce bir köşeden renk sırasını kontrol et.\nİki karşı merkezi, sonra diğer dördünü kur.\nİç katmanlar merkez parçalarını taşır; açtığın katmanı hep geri kapat.';

  @override
  String get introHoldBigCenters =>
      'Kurduğun yüz önde; bitmiş merkezler solda ve sağda, yoldan uzak.';

  @override
  String get introWhyBigCenters =>
      'Bir katman merkezleri taşır, geri almak bitmişleri geri getirir; yalnızca hedeflediğin parça değişir.';

  @override
  String get introHowBigEdges =>
      'Aynı iki renge sahip iki kanadı bul.\nOnları önde hizala ve Uw\' ile birleştir.\nEşleşmemiş bir kenarı içeri al, Uw merkezleri geri getirir.';

  @override
  String get introHoldBigEdges =>
      'Eşleştirdiğin kenar ön katmanlarda; bitmiş kenarlar üstte ve altta park edilmiş.';

  @override
  String get introWhyBigEdges =>
      'Uw\' iki kanat buluşsun diye merkezleri kenara çeker; Uw onları geri getirir ve emeğin korunur.';

  @override
  String get introHowBigParity =>
      '4×4\'ü takılana kadar 3×3 gibi çöz.\nTers dönmüş tek kenar: uzun OLL parity algoritması.\nYer değiştirmiş iki kenar: 2R2 U2 2R2 Uw2 2R2 2U2.';

  @override
  String get introHoldBigParity =>
      'Son katman üstte. OLL parity: ters kenar önde. PLL parity: yer değiştiren kenarlar önde ve arkada.';

  @override
  String get introWhyBigParity =>
      'Kanatlar 3×3\'ün ulaşamadığı durumlara girebilir; bu algoritmalar tam bunu geri almak için iç katmanları çevirir.';

  @override
  String get dirFaceR => 'Sağ taraf';

  @override
  String get dirFaceL => 'Sol taraf';

  @override
  String get dirFaceU => 'Üst sıra';

  @override
  String get dirFaceD => 'Alt sıra';

  @override
  String get dirFaceF => 'Ön yüz';

  @override
  String get dirFaceB => 'Arka yüz';

  @override
  String get dirMiddle => 'Orta katman';

  @override
  String get dirWholeCube => 'Tüm küp';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, $depth. katman';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth katman derinliğinde';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, $near–$far. katmanlar';
  }

  @override
  String get dirUp => 'Yukarı';

  @override
  String get dirDown => 'Aşağı';

  @override
  String get dirLeft => 'Sola';

  @override
  String get dirRight => 'Sağa';

  @override
  String get dirClockwise => 'Saat yönünde';

  @override
  String get dirCounter => 'Saat yönünün tersine';

  @override
  String get dirBackClockwise => 'Arkadan bakınca saat yönünde';

  @override
  String get dirBackCounter => 'Arkadan bakınca saat yönünün tersine';

  @override
  String get dirHalf => 'Çift çevirme (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Ayrıntıları gizle';

  @override
  String get solveExpand => 'Ayrıntıları göster';

  @override
  String get dailyScrambleSteps => 'Adım adım karıştır';

  @override
  String get dailyScrambleGuide => '3D karıştırma rehberi';

  @override
  String get dailyShowMoves => 'Hamleleri yazıyla göster';

  @override
  String get dailyHideMoves => 'Yazılı hamleleri gizle';

  @override
  String get dailyScrambleGuideTitle => 'Karıştırma rehberi';

  @override
  String get phaseDailyScramble => 'Bugünün küpünü karıştır';

  @override
  String get explainDailyScramble =>
      'Çözülmüş bir küpten başla, beyaz üstte ve yeşil önde olsun, ve her çevirmeyi gerçek küpünde tekrarla.';

  @override
  String get stageCenters => 'Merkez bloklarını kur';

  @override
  String get stageEdges => 'Dış ve iç kenarları eşleştir';

  @override
  String get stageParity => 'Parity çözümü';

  @override
  String get stageCrown1 => 'Birinci katman (beyaz)';

  @override
  String get stageCrown2 => 'İkinci katman';

  @override
  String get stageCrown3 => 'Üçüncü katman (sarı)';

  @override
  String get stageOrient => 'Parçaları yönlendir';

  @override
  String get stageFinish => 'Küpü bitir';

  @override
  String get stageAsThree => '3×3 gibi çöz';

  @override
  String get stageTwoByTwo => '2×2\'yi çöz';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Aşama $number/$total: $title';
  }

  @override
  String get solveAllStagesDone => 'Tüm aşamalar tamamlandı. Tebrikler!';

  @override
  String get trackFiveByFive => '5×5 Professor\'s Cube';

  @override
  String get trackSixBySix => '6×6 küp';

  @override
  String get lessonFiveIntro => '5×5 ile tanış';

  @override
  String get lessonFiveIntroDesc =>
      'Sabit orta parçalar, merkez çubukları, orta kenarlar ve kanatlar.';

  @override
  String get introGoalFiveIntro =>
      '5×5\'i tanı: sabit orta parçalar, merkez çubukları, orta kenarlar ve kanatlar.';

  @override
  String get introHowFiveIntro =>
      'Her yüzün tam ortası asla hareket etmez.\nHer kenar bir orta parça ve iki kanattan oluşur.\nİç katmanlar dışa dokunmadan parçaları hareket ettirir.';

  @override
  String get introHoldFiveIntro =>
      'İstediğin gibi: 5×5\'te her yüzün ortası hiç hareket etmez, yüzün rengini o gösterir.';

  @override
  String get introWhyFiveIntro =>
      'Sabit merkezler renk düzenini belirler, bu yüzden merkezler yanlış sırada kurulamaz.';

  @override
  String get lessonFiveCenters => '5×5 merkezleri';

  @override
  String get lessonFiveCentersDesc => 'Her merkezi üçlü çubuklardan kur.';

  @override
  String get introGoalFiveCenters =>
      'Her yüzün 3×3 merkez bloğunu tek renkte kur.';

  @override
  String get introHowFiveCenters =>
      'Sabit orta parçadan başla: rengi o belirler.\nÜçlü çubuklar yap ve bir iç katmanla içeri kaydır.\nÇubuğu getiren hamle bitmiş merkezi de geri getirir.';

  @override
  String get introHoldFiveCenters =>
      'Kurduğun merkez önde ya da üstte; bitmiş merkezler altta, solda ya da sağda.';

  @override
  String get introWhyFiveCenters =>
      'Katman içeri, üst, katman geri: çubuğu getiren katman bitmiş merkezleri de geri getirir.';

  @override
  String get lessonFiveEdges => '5×5 kenarları';

  @override
  String get lessonFiveEdgesDesc => 'İki kanadı orta kenarlarıyla birleştir.';

  @override
  String get introGoalFiveEdges =>
      'Her orta kenarı iki kanadıyla birleştir, böylece 12 kenarın hepsi tek parça gibi görünsün.';

  @override
  String get introHowFiveEdges =>
      'Her kanadı önde kendi orta kenarıyla eşleştir.\nİç katmanı çevir, çözülmemiş bir kenarı al, geri çevir.\nSon kenarlar için: katman, çevir, katman.';

  @override
  String get introHoldFiveEdges =>
      'Kurduğun kenar önde; bitmiş kenarlar üst ve alt katmanlarda saklı.';

  @override
  String get introWhyFiveEdges =>
      'İç katmanı açıp kapamak kanatları birleştirir, merkezler ve saklanan kenarlar geri gelir.';

  @override
  String get lessonFiveSolve => '5×5\'i 3×3 gibi çöz';

  @override
  String get lessonFiveSolveDesc => '3×3 gibi katman katman bitir.';

  @override
  String get introGoalFiveSolve =>
      'İndirgenmiş 5×5\'i 3×3 gibi, katman katman, yalnızca dış hamlelerle çöz.';

  @override
  String get introHowFiveSolve =>
      'Artık yalnızca dış hamleler, yoksa eşleşmiş kenarlar ayrılır.\nBeyaz artı ve köşeler, orta katman, sonra sarı katman.\nSabit orta parçalar her yüzün rengini gösterir.';

  @override
  String get introHoldFiveSolve =>
      'Birinci katmanın rengi altta, tıpkı 3×3\'teki gibi; yerleştirilecek köşe ön sağda.';

  @override
  String get introWhyFiveSolve =>
      'İç hamleler merkezleri ve kenarları yeniden ayırır; dış hamleler her bloğu tek bir 3×3 parçası gibi taşır.';

  @override
  String get lessonFiveParity => '5×5 kenar parity';

  @override
  String get lessonFiveParityDesc => 'Kanatları yer değiştirmiş kenarı düzelt.';

  @override
  String get introGoalFiveParity =>
      'İki dış kanadı yer değiştirmiş tek kenarı düzelt: 5×5\'in tek parity durumu.';

  @override
  String get introHowFiveParity =>
      'Ters dönmüş gibi görünen son bir kenar olarak çıkar.\nUzun iç katman düzeltmesini bir kez yap.\n5×5\'te PLL parity yoktur.';

  @override
  String get introHoldFiveParity =>
      'Son katman üstte, kanatları yer değiştirmiş kenar üst katmanın önünde.';

  @override
  String get introWhyFiveParity =>
      '5×5\'te yalnızca bir kenarın iki dış kanadı yer değiştirebilir, bu yüzden tek algoritma yeter.';

  @override
  String get lessonSixIntro => '6×6 ile tanış';

  @override
  String get lessonSixIntroDesc =>
      'Sabit merkez yok ve her kenarda dört parça var.';

  @override
  String get introGoalSixIntro =>
      '6×6\'yı tanı: yüz başına on altı merkez parçası ve kenar başına dört parça.';

  @override
  String get introHowSixIntro =>
      'Hiçbir merkez sabit değil: renkleri kurarken sen seçersin.\nHer kenarın dış ve iç kanatları vardır.\nGeniş çevirmeler üç katmana kadar hareket ettirebilir.';

  @override
  String get introHoldSixIntro =>
      'Başta istediğin gibi: 4×4 gibi 6×6\'da da sabit merkez yoktur.';

  @override
  String get introWhySixIntro =>
      '4×4 ve 5×5 çözebiliyorsan 6×6, daha büyük bloklarla aynı indirgemedir.';

  @override
  String get lessonSixCenters => '6×6 merkezleri';

  @override
  String get lessonSixCentersDesc => '4×4 merkezleri dörtlü çubuklardan kur.';

  @override
  String get introGoalSixCenters =>
      'Her yüzün 4×4 merkez bloğunu tek, düz renkte kur.';

  @override
  String get introHowSixCenters =>
      'Önce bir köşeden renk sırasını kontrol et: hiçbir merkez sabit değil.\nDörtlü çubuklar yap ve birleştir.\nSon iki merkezde tek tek parça taşı: katman, üst, geri al.';

  @override
  String get introHoldSixCenters =>
      'Kurduğun yüz önde; bitmiş merkezler solda, sağda ya da altta.';

  @override
  String get introWhySixCenters =>
      'Çubuklar iç katmanlarla birleşir ve her katman geri alınır, bu yüzden bitmiş merkezler bütün kalır.';

  @override
  String get lessonSixEdges => '6×6 kenarları';

  @override
  String get lessonSixEdgesDesc => 'Her kenarın dört parçasını topla.';

  @override
  String get introGoalSixEdges =>
      'Her kenarın dört parçasını topla, böylece 6×6\'nın 12 temiz kenarı olsun.';

  @override
  String get introHowSixEdges =>
      'Bir kenarın dış ve iç kanatlarını önde hizala.\nDerin geniş katman bir kenarı içeri alıp dışarı çıkarır.\nBir parçayı kurtarmak için bitmiş kenarı asla bozma.';

  @override
  String get introHoldSixEdges =>
      'Kurduğun kenar önde; bitmiş kenarlar üstte ve altta park edilmiş.';

  @override
  String get introWhySixEdges =>
      'Derin geniş hamle, kanatlar buluşsun diye merkezleri kenara çeker, sonra geri getirir.';

  @override
  String get lessonSixSolve => '6×6\'yı 3×3 gibi çöz';

  @override
  String get lessonSixSolveDesc => '3×3 gibi katman katman bitir.';

  @override
  String get introGoalSixSolve =>
      'İndirgenmiş 6×6\'yı 3×3 gibi, katman katman, yalnızca dış hamlelerle çöz.';

  @override
  String get introHowSixSolve =>
      'Artık yalnızca dış hamleler: iç katman bir merkezi ya da kenarı bozar.\nKurduğun merkezler her yüzün rengini gösterir.\nBeyaz artı ve köşeler, orta katman, sonra sarı katman.';

  @override
  String get introHoldSixSolve =>
      'Birinci katmanın rengi altta, tıpkı 3×3\'teki gibi; yerleştirilecek köşe ön sağda.';

  @override
  String get introWhySixSolve =>
      'Dış hamleler her 4×4 merkezi ve her kenarı tek parça gibi taşır, tıpkı 3×3\'teki gibi.';

  @override
  String get lessonSixParity => '6×6 parity';

  @override
  String get lessonSixParityDesc =>
      'Bir ters kenar veya iki yer değiştirmiş kenar.';

  @override
  String get introGoalSixParity =>
      '3×3\'te hiç olmayan iki 6×6 durumunu düzelt: bir ters kenar veya iki yer değiştirmiş kenar.';

  @override
  String get introHowSixParity =>
      'Takılana kadar 3×3 gibi çöz.\nTers dönmüş tek kenar: 3Rw ile uzun düzeltme.\nYer değiştirmiş iki kenar: iç çift hamlelerle kısa düzeltme.';

  @override
  String get introHoldSixParity =>
      'Son katman üstte. Ters kenar önde; iki kenar yer değiştirdiyse önde ve arkada.';

  @override
  String get introWhySixParity =>
      '4×4 gibi 6×6 da ters tek kenar ya da yer değiştirmiş iki kenarla bitebilir; iç katman algoritmaları bunları düzeltir ve gerisini bırakır.';

  @override
  String get stepFivePieces => '5×5\'in parçaları';

  @override
  String get stepFivePiecesBody =>
      'Her yüzün orta parçası hiç hareket etmez, bu yüzden renk düzeni yanlış çıkamaz. Çevresinde sekiz merkez parçası vardır: köşe merkezleri ve kenar merkezleri asla tür değiştirmez. Her kenar, iki kanatlı bir orta parçadır.';

  @override
  String get stepFiveSlices => 'Üç tür çevirme';

  @override
  String get stepFiveSlicesBody =>
      'Dış çevirmeler bir yüzü hareket ettirir. Geniş çevirmeler bir yüzü arkasındaki katmanla birlikte hareket ettirir. İç katman çevirmeleri yalnızca içerideki bir katmanı hareket ettirir: parçalar dışa dokunmadan böyle yer değiştirir.';

  @override
  String get stepFiveCenterBar => 'Merkez çubukları';

  @override
  String get stepFiveCenterBarBody =>
      'Üç eşleşen merkez parçasından bir sıra yap, bir iç katmanla içeri kaydır, üstü çevir ve katmanı geri al: çubuğu getiren hamle bitmiş merkezi de geri getirir. Üç çubuk bir merkez eder.';

  @override
  String get stepFiveCenterSwap => 'Bozmadan değiştir';

  @override
  String get stepFiveCenterSwapBody =>
      'Tek bir merkez parçasını taşımak için: bir iç katmanı çevir, üstü çevir, katmanı geri al, üstü geri çevir. Bitmiş merkezler her seferinde geri gelir.';

  @override
  String get stepFiveEdgePair => 'Kanatları orta kenarla eşleştir';

  @override
  String get stepFiveEdgePairBody =>
      'Önde bir kanadı kendi orta kenarının yanına hizala, iç katmanı aşağı çevir, kısa bir tetikle çözülmemiş bir kenarı al, sonra iç katmanı geri çevir.';

  @override
  String get stepFiveEdgeLast => 'Son kenarlar';

  @override
  String get stepFiveEdgeLastBody =>
      'Değiştirecek boş kenar kalmayınca katman, çevir, katman kullan: geniş bir hamle, kısa bir tetik ve geri geniş hamle son kenarları, bitmişleri bozmadan eşleştirir.';

  @override
  String get stepFiveAsThree => 'Artık bir 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Merkezler ve kenarlar hazırken 5×5 büyük bir 3×3 gibi davranır. Yalnızca dış hamlelerle katman katman ilerle: beyaz artı ve köşeler, orta katman, sonra sarı katman. 5×5\'te PLL parity yoktur.';

  @override
  String get stepFiveEdgeParity => 'Son kenarın kanatlarını değiştir';

  @override
  String get stepFiveEdgeParityBody =>
      'Bazen son kenarın iki dış kanadı yer değiştirmiştir ve ters görünür: 5×5\'in tek parity durumu. Onu üst katmanın önünde tut ve iç katman algoritmasını bir kez yap; geri kalan her şey yerine döner.';

  @override
  String get stepSixPieces => '6×6\'nın parçaları';

  @override
  String get stepSixPiecesBody =>
      '4×4 gibi 6×6\'da da sabit merkez yoktur: on altı merkez parçası her yüzün rengini oluşturur, bu yüzden önce bir köşeden renk sırasını kontrol et. Her kenarın dört kanadı vardır: iki dış, iki iç.';

  @override
  String get stepSixSlices => 'Daha derin katmanları çevirmek';

  @override
  String get stepSixSlicesBody =>
      'Geniş çevirmeler bir yüzden itibaren iki veya üç katmanı hareket ettirebilir. İkinci veya üçüncü katmandaki iç katmanlar merkezler ve kenarlar için araçlardır.';

  @override
  String get stepSixCenterBar => 'Dörtlü çubuklar';

  @override
  String get stepSixCenterBarBody =>
      'Dört eşleşen merkez parçasından sıralar yap ve iç katman hamleleriyle yan yana kaydır, her katmanı geri al; yüz tek renkli bir 4×4 blok olana kadar.';

  @override
  String get stepSixCenterSwap => 'Parçaları tek tek taşı';

  @override
  String get stepSixCenterSwapBody =>
      'Üçüncü katmanı çevir, üstü çevir, geri al, üstü geri çevir: bir merkez parçası taşınır, bitmiş merkezler geri gelir. Hiçbir çubuk uymadığında son iki merkez için kullan.';

  @override
  String get stepSixEdgePair => 'Dört parça, bir kenar';

  @override
  String get stepSixEdgePairBody =>
      'Bir kenarın dört kanadını derin geniş katmanla önde topla, kısa bir tetikle çözülmemiş bir kenarı al, sonra geniş katmanı geri çevir.';

  @override
  String get stepSixEdgeLast => 'Son kenarlar';

  @override
  String get stepSixEdgeLastBody =>
      'Son kenarları derin bir geniş hamle ile onun geri alınması arasındaki kısa bir tetikle eşleştir; bitmiş kenarlar eşli kalır. Bir parçayı kurtarmak için bitmiş kenarı asla bozma.';

  @override
  String get stepSixAsThree => 'Artık bir 3×3';

  @override
  String get stepSixAsThreeBody =>
      '4×4 merkezler ve eşleşmiş kenarlarla 6×6\'yı 3×3 gibi, katman katman, yalnızca dış hamlelerle çöz. Sonda ters tek kenar ya da yer değiştirmiş iki kenar parity\'dir, hata değil.';

  @override
  String get stepSixOllParity => 'Bir ters kenar';

  @override
  String get stepSixOllParityBody =>
      'Son katmanda ters görünen tek bir kenar parity\'dir. Onu üst katmanın önünde tut ve uzun düzeltmeyi yap: dört kanadın hepsini çevirir, üstteki sol ve sağ kenarları da değiştirir ve ilk iki katmana dokunmaz.';

  @override
  String get stepSixPllParity => 'İki yer değiştirmiş kenar';

  @override
  String get stepSixPllParityBody =>
      'En sonda iki kenar yer değiştirmiş görünüyorsa onları üst katmanda önde ve arkada tut ve iç çift hamlelerle kısa düzeltmeyi yap: iki kenarın dört kanadı da yer değiştirir.';

  @override
  String get stepSixWingRule => 'Dört kanat mı, iki mi?';

  @override
  String get stepSixWingRuleBody =>
      '6×6 kenarı 4 kanattan oluşur. Ters görünen bir kenarı düzeltmeden önce dikkatle bak: 4 kanadın hepsi tersse normal 3 katmanlı OLL parity\'yi kullan; yalnızca 2 iç kanat tersse iç kanat parity\'sini kullan. Küp iç kanat durumunu gösteriyor.';

  @override
  String get stepSixInnerWingParity => 'İki iç kanat ters';

  @override
  String get stepSixInnerWingParityBody =>
      'Burada öndeki üst kenarın dış kanatları doğru, yalnızca 2 iç kanat ters. O kenarı üst katmanın önünde tut ve yalnızca üçüncü dilimleri (3R, 3L) çevir: iç kanatlar düzelir, küpün geri kalanı çözülmüş kalır.';

  @override
  String get stageTwoFirstLayer => 'Alt katmanı kur';

  @override
  String get stageTwoTopColor => 'Üstü tek renk yap';

  @override
  String get stageTwoFinish => 'Köşeleri bitir';

  @override
  String get explainTwoFirstLayer =>
      'Alt katmanı tamamla: dört köşesi birbiriyle ve yan renklerle eşleşsin.';

  @override
  String get explainTwoTopColor =>
      'Alt katmanı koruyarak dört üst etiketin hepsi aynı rengi gösterene kadar üstü çevir.';

  @override
  String get explainTwoFinish =>
      'Küpü bitirmek için son köşeleri yerlerine taşı.';

  @override
  String get tabSolve => 'Çöz';

  @override
  String get tabScan => 'Tara';

  @override
  String get tabAcademy => 'Akademi';

  @override
  String get tabTrain => 'Antrenman';

  @override
  String get openCubeSolver => '3D Küpü ve Çözücüyü Aç';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Antrenman';

  @override
  String get trainSubtitle => 'Becerilerini her gün geliştir.';

  @override
  String get settings => 'Ayarlar';

  @override
  String get settingsSoundHaptics => 'Ses ve titreşim';

  @override
  String get settingsSoundHapticsDesc =>
      'Küpü çevirdiğinde tık sesleri ve titreşimler.';

  @override
  String get settingsAnimationSpeed => 'Varsayılan animasyon hızı';

  @override
  String get settingsAnimationSpeedDesc =>
      'Hamleler oynatılırken küpün ne kadar hızlı döndüğü.';

  @override
  String get settingsResetProgress => 'İlerlemeyi sıfırla';

  @override
  String get settingsResetProgressDesc =>
      'Bitirilen Akademi derslerini ve günlük serini temizle.';

  @override
  String get resetProgressTitle => 'Tüm ilerleme sıfırlansın mı?';

  @override
  String get resetProgressBody =>
      'Bitirdiğin dersler ve günlük serin silinecek. Bu işlem geri alınamaz.';

  @override
  String get resetProgressDone => 'İlerleme sıfırlandı.';

  @override
  String get cancel => 'İptal';

  @override
  String get settingsPrivacyAds => 'Gizlilik ve reklamlar';

  @override
  String get settingsPrivacyAdsDesc =>
      'Reklam onayı seçimlerini gözden geçir veya değiştir.';

  @override
  String get playbackPrevious => 'Geri';

  @override
  String get playbackNext => 'İleri';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hamlede çözüldü!',
      one: '1 hamlede çözüldü!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Sonraki Sürümü Birlikte Şekillendirelim';

  @override
  String get feedbackBody =>
      'Bir özellik önermek ya da CubeMentor\'ın sonraki sürümüne katkıda bulunmak mı istiyorsun? Bize şu adresten yaz:';

  @override
  String get feedbackEmailCopied =>
      'E-posta uygulaması bulunamadı, bu yüzden adresi panoya kopyaladık.';

  @override
  String get adWatchToUnlock => 'Reklam izle';

  @override
  String get adLoading => 'Kısa bir video yükleniyor…';

  @override
  String get adRewardNotEarned => 'Kilidi açmak için videonun tamamını izle.';

  @override
  String get adUnavailableFreePass =>
      'Şu anda video yok — bu seferlik ücretsiz açıldı.';

  @override
  String get settingsPrivacyAdsError =>
      'Gizlilik seçenekleri açılamadı. Daha sonra tekrar dene.';

  @override
  String get nicknamePromptTitle => 'Sana nasıl hitap edelim?';

  @override
  String get nicknamePromptBody =>
      'Her çözdüğünde seni adınla tebrik edeceğiz.';

  @override
  String get nicknameHint => 'Adın veya takma adın';

  @override
  String get nicknameSave => 'Kaydet';

  @override
  String get settingsNickname => 'Adın';

  @override
  String get settingsNicknameNotSet => 'Ayarlanmadı — eklemek için dokun';

  @override
  String celebrateNamed(String name) {
    return 'Harikasın, $name!';
  }

  @override
  String get celebrateAnon => 'Harikasın!';

  @override
  String get celebrateCubeSolved => 'Küp çözüldü!';

  @override
  String get celebrateDailyDone => 'Günlük meydan okuma tamamlandı!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit hamle',
      one: '$count / 1 hamle',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Her karıştırma $limit veya daha az hamlede çözülebilir',
      one: 'Her karıştırma 1 veya daha az hamlede çözülebilir',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Video İzle';

  @override
  String get patternsNotNow => 'Şimdi Değil';

  @override
  String get settingsColorScheme => 'Küp renk düzeni';

  @override
  String get colorSchemeWestern => 'Batı';

  @override
  String get colorSchemeJapanese => 'Japon';

  @override
  String get colorSchemeWesternDesc =>
      'Beyazın karşısında sarı, mavinin karşısında yeşil';

  @override
  String get colorSchemeJapaneseDesc =>
      'Beyazın karşısında mavi, sarının karşısında yeşil';

  @override
  String dailyYourTime(String time) {
    return 'Senin süren: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Küpü incelemek için $seconds saniyen var. Geri sayımı başlatmak için dokun.';
  }

  @override
  String get timerInspectTapReady => 'Çözmeye hazır olduğunda dokun';

  @override
  String timerInspectPlus2(int seconds) {
    return 'İnceleme $seconds sn\'yi geçti, saat kendiliğinden başladı: +2 sn ceza';
  }

  @override
  String timerAvgOf(int count) {
    return '$count ortalaması';
  }

  @override
  String get timerAvgNote => 'Ortalamalarda en iyi ve en kötü süre sayılmaz';

  @override
  String get timerPbSub => 'En iyi süre';

  @override
  String get timerPlus2Caption => '+2 sn ceza';

  @override
  String get timerDnfCaption => 'Bitirilmedi (DNF)';

  @override
  String get timerDeleteCaption => 'Bu çözümü sil';

  @override
  String get patternBullsEye => 'On ikiden vuruş';

  @override
  String get patternFramedCenter => 'Çerçeveli merkez';

  @override
  String get patternBlockCheckerboard => 'Blok dama tahtası';

  @override
  String get patternCubeInCubeInCube => 'Küp içinde küp içinde küp';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Altı T';

  @override
  String get patternTwinPeaks => 'İkiz tepeler';

  @override
  String get patternSpiral => 'Spiral';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Merkez noktalar';

  @override
  String get patternStripes => 'Çizgiler';

  @override
  String get patternAnaconda => 'Anakonda';

  @override
  String get patternZigzag => 'Zikzak';

  @override
  String get patternFourSpots => 'Dört nokta';

  @override
  String get patternGreenMamba => 'Yeşil mamba';

  @override
  String get patternPlusMinus => 'Artı eksi';

  @override
  String guideStepCounter(int current, int total) {
    return 'Adım $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Hamle $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Hamle $current / $total';
  }

  @override
  String get dailyStep1Title => 'Adım 1: Küpünü karıştır';

  @override
  String get dailyStep2Title => 'Adım 2: Küpü çöz';

  @override
  String dailyPersonalBest(String time) {
    return 'Kişisel rekor: $time';
  }

  @override
  String get dailyRecentDays => 'Son günler';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count günlük seri! Harikasın!',
      one: '1 günlük seri! Harikasın!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Küp karıştırıldı! Şimdi çöz';

  @override
  String get dailyCongratsTitle => 'Tebrikler!';

  @override
  String dailyCongratsBody(String time) {
    return 'Bugünün meydan okumasını $time sürede çözdün.';
  }

  @override
  String get dailyCongratsDone => 'Meydan okumaya dön';

  @override
  String patternsSizeChip(String size, int count) {
    return '$size • $count desen';
  }

  @override
  String unlockHoursLeft(int hours) {
    return '$hours saat kaldı';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    return '$minutes dakika kaldı';
  }

  @override
  String get lockedLabel => 'Kilitli';

  @override
  String get unlockedLabel => 'Kilidi açık';

  @override
  String patternUnlockBody(int hours) {
    return 'Bu desenin ve adım adım rehberinin kilidini $hours saatliğine açmak için 1 kısa video izle.';
  }

  @override
  String lessonUnlockBody(int hours) {
    return 'Bu dersi önümüzdeki $hours saat boyunca istediğin kadar açmak için 1 kısa video izle.';
  }

  @override
  String get bigCubeUnlockTitle => 'Büyük küpleri çöz';

  @override
  String bigCubeUnlockBody(int hours) {
    return 'Ücretsiz 4×4–6×6 çözüm hakkını kullandın. Önümüzdeki $hours saat boyunca büyük küpleri çözmek için 1 kısa video izle.';
  }

  @override
  String get doubleTurnBadge => 'Çift çevirme · 180°';

  @override
  String get homeAcademy => 'Akademi';

  @override
  String get homePatterns => 'Havalı Desenler';

  @override
  String get homePractice => 'Zamanlayıcı ve Günlük Görev';

  @override
  String get scanChoiceSubtitle => 'Nasıl başlamak istersin?';

  @override
  String get scanChoiceCamera => 'Kamerayla tara';

  @override
  String get scanChoiceCameraDesc => 'Her yüzü kameraya göster ve çözümü al.';

  @override
  String get scanChoice3d => '3D küpü aç';

  @override
  String get scanChoice3dDesc =>
      'Sanal bir küpü çevir, karıştır ve adım adım çöz.';

  @override
  String get academyAllSizes => 'Tüm boyutlar';

  @override
  String homeAcademyProgress(int done, int total) {
    return '$done / $total ders tamamlandı';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • $done / $total tamamlandı';
  }

  @override
  String get lessonStageConcept => 'Kavram';

  @override
  String get lessonStageExamples => 'Örnekler';

  @override
  String get lessonStagePractice => 'Uygulama';

  @override
  String get lessonStageNext => 'Devam / serbest';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Aşama $index/$total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Örnek $index/$total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Uygulama $index/$total';
  }

  @override
  String get lessonBonusCase => 'Bonus durum';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Doğrudan $lesson dersine geç.';
  }

  @override
  String get lessonFreePractice => 'Serbest pratik';

  @override
  String get lessonFreePracticeDesc =>
      'Karışık bir 3D küpü baştan bu adıma kadar kendin çöz.';

  @override
  String freePracticeBanner(String topic) {
    return 'Serbestçe çalış: küpü baştan $topic adımına kadar çöz!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return '$face merkezli yüzü okun gösterdiği yöne çevir. Merkez yerinde kalır; yalnızca çevresindeki parçalar yer değiştirir.';
  }

  @override
  String cueTrigger(String front) {
    return 'Sağ el hamlesi, $front sana dönük: sağ yüz yukarı, üst sola, sağ yüz aşağı, üst yeniden sağa.';
  }

  @override
  String get cueTriggerBack =>
      'Üst üste altıncı hamle küpü tam olarak başladığı hâle getirir. Altı sihirli sayıdır!';

  @override
  String cueSliceInner(String face) {
    return 'Yalnızca $face yüzünün yanındaki iç katmanı çevir. Yüzün kendisi yerinde kalır, bu yüzden merkezler ayrılır.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Geniş dönüş: $face yüzü ve yanındaki iç katman, kalın tek bir katman gibi birlikte döner.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Tüm küpü, $top merkez üstte ve $front merkez sana dönük olacak şekilde çevir.';
  }

  @override
  String get cueTurnTop =>
      'Bir sonraki algoritmaya hazırlanmak için okun gösterdiği gibi yalnızca üst katmanı çevir.';

  @override
  String get cueAlignTop =>
      'Son hamle: renkleri hizalamak için üst katmanı çevir. Bitti!';

  @override
  String cueCrossTop(String piece, String center) {
    return '$piece kenar üst katmanda. Tam $center merkezin üstüne gelene kadar üstü çevir, sonra onu indirmek için o yüzü iki kez çevir.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return '$piece kenar orta katmanda sıkışmış. Onu üste çıkar, $center merkezin üstüne hizala ve indir.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return '$piece kenarı yerinde ama ters: beyazı yana bakıyor. Onu çıkar, beyazı yukarı bakacak şekilde üste al, sonra $center merkezin yanına indir.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'CFOP tarzında alt da dönebilir. $piece kenarı indir ve altı çevirerek $center merkezle hizala.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return '$piece köşe, $a ve $b yüzleri arasındaki yerinin tam üstüne gelene kadar üstü çevir. Doğru yönde yerine oturana kadar sağ el hamlesini tekrarla.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return '$piece köşesi yerinde ama dönük. Bir tetik onu dışarı çıkarır (yerine sarı bir köşe girer); beyaz aşağıda geri girene kadar aynı yerin üstünde tekrarla. Onu kovalamak için küpü çevirme.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return '$piece kenar $a merkezle hizalanana kadar üstü çevir, sonra onu sağ aşağıya, $a ile $b arasındaki yuvaya gönder.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return '$piece kenar $a merkezle hizalanana kadar üstü çevir, sonra onu sol aşağıya, $a ile $b arasındaki yuvaya gönder.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return '$piece kenarı yerinde ama ters. Oraya sarı bir kenar sokarak onu üste it, sonra $a ile $b arasına yeniden yerleştir.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Sarı bir çizgi: üstü çizgi soldan sağa uzanacak şekilde çevir, $front sana dönük kalsın, sonra sarı artı algoritmasını uygula.';
  }

  @override
  String cueYellowL(String front) {
    return 'Sarı bir L: üstü L arka sola bakacak şekilde çevir, $front sana dönük kalsın, sonra algoritmayı uygula. Bir çizgiye dönüşür.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Yalnızca merkez sarı: nokta. $front sana dönükken algoritmayı bir kez uygula, L elde edersin. Nokta üç tur sürebilir, devam et.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return '$piece kenar $center merkezle eşleşene kadar üstü çevir.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Eşleşen iki kenar arkada ve sağda. $front sana dönükken değiştirme hamlesini yap: öndeki ve soldaki kenar yer değiştirir.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Eşleşen kenarlar karşı karşıya. $front sana dönükken değiştirmeyi bir kez yap; ardından iki komşu kenar eşleşir.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return '$piece köşe zaten yerinde. Onu sağ önde tut, $front sana dönük olsun, ve diğer üç köşeyi döngüyle yer değiştir.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Henüz hiçbir sarı köşe yerinde değil. $front sana dönükken bir döngü yap; ardından bir köşe yerine oturur.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Ön sağdaki $piece köşesini çevir: sarısı yukarı bakana kadar alt tetiği çiftler halinde tekrarla. Alt katmanlar şimdilik karışık görünür; son köşeyle geri gelirler!';
  }

  @override
  String cueTwistFour(String piece) {
    return '$piece köşe bu kez dört hamle istiyor. Devam et: sarı her zaman iki ya da dört hamleden sonra yukarı gelir.';
  }

  @override
  String get cueTwistNext =>
      'Sıradaki dönmüş köşeyi sağ öne getirmek için yalnızca üst katmanı çevir. Şimdi tüm küpü çevirme!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Üstte $piece köşeyi $edge kenarla eşleştir, sonra çifti $a ile $b arasındaki yuvaya yerleştir.';
  }

  @override
  String cueF2lStuck(String piece) {
    return '$piece köşe yanlış kenarla birlikte yuvasında sıkışmış. Önce onu üste çıkar, sonra eşleştirip yerleştir.';
  }

  @override
  String cueOllSune(String front) {
    return '$front sana dönükken, sarı köşeleri yukarı çevirmek için Sune uygula.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Bu kez tek bir Sune yetmedi. Üstü çevir ve $front sana dönükken Sune\'yi yeniden uygula.';
  }

  @override
  String cuePllCorners(String front) {
    return 'İki köşenin yer değiştirmesi gerekiyor. Eşleşen çifti (farları) solda tut, $front sana dönük olsun, ve T-perm uygula.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Köşeler tamam. $piece kenarı arkada tut ve diğer üç kenarı U-perm ile döngüyle yer değiştir.';
  }

  @override
  String get cuePllNoEdge =>
      'Henüz hiçbir üst kenar merkeziyle eşleşmiyor. Herhangi bir taraftan bir kez U-perm uygula; ardından biri eşleşir.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Üstteki iki komşu köşenin yer değiştirmesi gerekiyor. Eşleşen çifti solda tut, $front sana dönük olsun, ve değiştirme hamlesini yap.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Değiştirilecek iki köşe çaprazda. $front sana dönükken çapraz değiştirmeyi yap.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Yolunu şaşırmış $color merkez parçasını merkez 3\'lü döngüsüyle yerine getir: katman, üst, katman, sonra her şey geri.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Koca bir $color merkez parçası şeridi yanlış yüzde. Onu iç katmanla kaldır, üstü çevir ve yerine geri getir.';
  }

  @override
  String cueEdgePair(String piece) {
    return '$piece kenarın iki parçasını eşleştir: onları hizala, katmanı çevir, sağ el hamleleriyle eşleşmemiş bir kenarı içeri al ve katmanı geri çevir.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Son kenarlar: $piece kenarı son iki kenar algoritmasıyla eşleştir; bu algoritma tamamlanan tüm kenarları korur.';
  }

  @override
  String cueParityOll(String front) {
    return 'OLL parity: üstte bir kenar ters, bu 3×3\'te asla olmaz. Onu önde tut, $front sana dönük, ve normal OLL\'den önce parity düzeltmesini uygula.';
  }

  @override
  String get cueParityPll =>
      'PLL parity: üstte iki kenar yer değiştirmiş, bu 3×3\'te asla olmaz. Onları önde ve arkada tut, parity değişimini uygula, sonra üstü hizala.';

  @override
  String cueParityFive(String front) {
    return 'Kenar parity: bir kenarın iki dış kanadı yer değiştirmiş, 5×5\'in tek parity durumu. O kenarı önde tut, $front sana dönük, ve düzeltmeyi bir kez uygula.';
  }

  @override
  String cueParityInnerWing(String front) {
    return 'İç kanat parity\'si: üst kenarın yalnızca 2 iç kanadı ters. Onu önde tut, $front sana dönük, ve yalnızca üçüncü dilimleri çevir.';
  }

  @override
  String get wingRuleAllFour => '4 kanadın hepsi ters';

  @override
  String get wingRuleAllFourFix => '3 katmanlı OLL parity (3Rw)';

  @override
  String get wingRuleInnerTwo => 'Yalnızca 2 iç kanat ters';

  @override
  String get wingRuleInnerTwoFix => 'İç kanat parity\'si (3R)';

  @override
  String get onboardingSkip => 'Atla';

  @override
  String get onboardingNext => 'İleri';

  @override
  String get onboardingStart => 'Başlayalım';

  @override
  String get onboardingWhatTitle => 'Küp arkadaşın';

  @override
  String get onboardingWhatBody =>
      'CubeMentor, 2×2’den 6×6’ya kadar her küpü çözmene, öğrenmene ve çalışmana yardım eder; tamamen çevrimdışı.';

  @override
  String get onboardingScanTitle => 'Saniyeler içinde tara ve çöz';

  @override
  String get onboardingScanBody =>
      'Her yüzü kameraya göster (ya da renkleri gir) ve 3D çözümü hamle hamle takip et.';

  @override
  String get onboardingLearnTitle => 'Akademide öğren';

  @override
  String get onboardingLearnBody =>
      'Katman katman yöntemini kısa derslerle öğren; 3D küp her hamleyi gösterir.';

  @override
  String get onboardingPatternsTitle => 'Havalı desenler ve 3D Oyun Alanı';

  @override
  String get onboardingPatternsBody =>
      '2×2\'den 6×6\'ya her küpü göz alıcı desenlere dönüştür ya da Oyun Alanı\'nda serbestçe çevir ve karıştır. Döndürmek için küpü sürükle; değiştirmek için bir boyuta dokun.';

  @override
  String get scanChoiceManualDesc =>
      'Her yüzün renklerini çıkartma çıkartma gir.';

  @override
  String get scanTryAgain => 'Tekrar dene';

  @override
  String get scanEditManually => 'Renkleri elle düzelt';

  @override
  String get scanLightingHint =>
      'Yüzü ızgaranın ortasına getir. Parlak ve eşit ışık kullan, parlamadan kaçın.';

  @override
  String get crownExplain =>
      'Katman, küpün yatay bir dilimidir: birinci katman alttaki beyaz katman, ikincisi orta katman, üçüncüsü üstteki sarı katmandır.';

  @override
  String get lessonObjectiveHeading => 'Öğrenme hedefi';

  @override
  String get dirRowTop => 'Ön yüzün üst sırası';

  @override
  String get dirRowBottom => 'Ön yüzün alt sırası';

  @override
  String get dirColumnRight => 'Ön yüzün sağ sütunu';

  @override
  String get dirColumnLeft => 'Ön yüzün sol sütunu';

  @override
  String get solveChoiceTitle => 'Nasıl çözmek istersin?';

  @override
  String get solveChoiceFastDesc => 'En kısa çözüm, hamle hamle.';

  @override
  String get solveChoiceGuidedDesc =>
      'Katman katman yöntemini adım adım öğren.';

  @override
  String get guidedSolvedTitle => 'Çözüldü!';

  @override
  String get guidedSolvedBody => 'Her adımı izledin ve küpü çözdün.';

  @override
  String get solveAgain => 'Tekrar çöz';

  @override
  String get backToHome => 'Ana ekrana dön';

  @override
  String get dailyStatTime => 'Bugünkü süre';

  @override
  String get dailyStatBest => 'Kişisel rekor';

  @override
  String get dailyStatStreak => 'Güncel seri';

  @override
  String get dailyStatBestStreak => 'En iyi seri';

  @override
  String get privacyPolicyTitle => 'Gizlilik politikası';

  @override
  String get settingsPrivacyPolicyDesc =>
      'CubeMentor’ın neleri sakladığı ve reklamların neleri kullandığı.';

  @override
  String get privacyIntro =>
      'CubeMentor hesap olmadan ve kendi sunucuları olmadan çalışır. Bu sayfa cihazında nelerin kaldığını ve reklam ortağımızın neleri kullandığını açıklar.';

  @override
  String get privacyDataTitle => 'Verilerin cihazında kalır';

  @override
  String get privacyDataBody =>
      'Dilin, ayarların, ders ilerlemen, çözüm sürelerin ve günlük serin yalnızca bu cihazda saklanır. Sunucumuz olmadığı için bunları hiçbir zaman almayız. Uygulamayı kaldırmak hepsini siler.';

  @override
  String get privacyCameraTitle => 'Kamera';

  @override
  String get privacyCameraBody =>
      'Kamera yalnızca bir küpü tararken kullanılır. Görüntüler çıkartma renklerini okumak için cihazında analiz edilir; hiçbir fotoğraf veya video kaydedilmez ya da gönderilmez.';

  @override
  String get privacyAdsTitle => 'Reklamlar';

  @override
  String get privacyAdsBody =>
      'Uygulama Google AdMob reklamları gösterir. Google, Google’ın gizlilik politikasında açıklandığı gibi reklamları göstermek ve ölçmek için cihaz tanımlayıcılarını ve reklam etkileşim verilerini kullanabilir. Yasanın gerektirdiği yerlerde önce iznin istenir ve bunu Ayarlar’dan değiştirebilirsin.';

  @override
  String get privacyContactTitle => 'İletişim';

  @override
  String privacyContactBody(String email) {
    return 'Gizlilikle ilgili soruların mı var? Bize $email adresinden yaz.';
  }
}
