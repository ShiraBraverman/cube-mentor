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
  String get solveModeGuided => 'Rehberli (3 taç)';

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
      'Harika! Geniş çevirmeyi tamamlamak için parlayan katmanları tek tek kaydırmaya devam et.';

  @override
  String get guideSwipeHint =>
      'Parlayan katmanı okun gösterdiği yöne kaydır ya da İleri\'ye dokun.';

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
  String get phaseLblCorners => 'Birinci taç köşeleri';

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
  String get crownFirst => 'Birinci taç';

  @override
  String get crownSecond => 'İkinci taç';

  @override
  String get crownThird => 'Üçüncü taç';

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
      'Beyaz yüzü ve birinci halkanın tamamını bitirmek için 4 beyaz köşeyi yerlerine yerleştir.';

  @override
  String get subStepGoal21 =>
      'Birinci tacı bozmadan 4 orta katman kenarını yerleştir.';

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
  String get trackBeginner => 'Başlangıç 3×3: 3 taç';

  @override
  String get trackCfop => 'CFOP\'a giriş';

  @override
  String get trackTwoByTwo => '2×2 başlangıç ve Ortega';

  @override
  String get trackBigCubes => 'Büyük küpler: indirgeme ve parite';

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
  String get phaseReductionEdgeParity => 'Kenar paritesi';

  @override
  String get phaseReductionOllParity => 'OLL paritesi';

  @override
  String get phaseReductionPllParity => 'PLL paritesi';

  @override
  String get explainReductionCenterBlock =>
      'Birkaç merkez parçasını aynı anda yerine getiren iç katman çevirmeleri.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Bir $piece merkez parçasını, bitmiş merkezlere dokunmayan bir 3\'lü döngüyle kendi yüzüne getir.';
  }

  @override
  String get explainReductionParityCenters =>
      'Parite çevirmesinin kaydırdığı merkezleri yeniden kur.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return '$piece kenar parçalarını bir 3\'lü döngüyle birleştir; merkezler çözülü kalır.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Son kenarlar yalnızca 3\'lü döngülerle eşleştirilemez (kenar paritesi). Tek bir iç katman çevirmesi bunu düzeltir.';

  @override
  String get explainReductionOllParity =>
      'OLL paritesi: bir kenar ters, bu 3×3\'te olamaz. Bu algoritma onu geri çevirir.';

  @override
  String get explainReductionPllParity =>
      'PLL paritesi: iki kenar yer değiştirmiş, bu 3×3\'te imkânsız. Bu algoritma onları geri değiştirir.';

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
  String get timerInspecting =>
      'İnceleme: basılı tut, sonra başlatmak için bırak';

  @override
  String get timerTapToInspect =>
      '15 saniyelik incelemeyi başlatmak için dokun';

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
      'Sarıyı üstte tut. Dört beyaz kenar alttaki beyaz merkezin etrafına yerleşir ve her birinin yan rengi yanındaki merkezle eşleşir.';

  @override
  String get stepCrossTop => 'Üstteki kenar';

  @override
  String get stepCrossTopBody =>
      'Üstte bir beyaz kenar bul. Yan rengi eşleşen merkezin üstüne gelene kadar üstü çevir, sonra onu indirmek için o yüzü iki kez çevir.';

  @override
  String get stepCrossMiddle => 'Ortadaki kenar';

  @override
  String get stepCrossMiddleBody =>
      'Orta katmanda sıkışan bir kenar önce yukarı çıkar: yan yüzünü yukarı çevir, üstü yoldan çek ve yan yüzü geri çevir; böylece artı bozulmaz. Sonra onu üstten yerleştir.';

  @override
  String get stepCornersInsert => 'Yerinin üstünde';

  @override
  String get stepCornersInsertBody =>
      'Bir beyaz köşe, renklerinin ait olduğu yerin üstüne, sağ öne gelene kadar üstü çevir. R U R\' U\' onu aşağı indirir.';

  @override
  String get stepCornersRepeat => 'Tetikleyiciyi tekrarla';

  @override
  String get stepCornersRepeatBody =>
      'Beyaz yanlış yöne bakıyorsa aynı yerin üstünde R U R\' U\' tekrarlamaya devam et. Her köşe en fazla beş tekrarda çözülür.';

  @override
  String get stepMiddleRight => 'Kenar sağa';

  @override
  String get stepMiddleRightBody =>
      'Üstteki bir kenarı önde kendi merkeziyle hizala. Üst rengi sağ merkezle eşleşiyorsa U R U\' R\' U\' F\' U F ile yerleştir.';

  @override
  String get stepMiddleLeft => 'Kenar sola';

  @override
  String get stepMiddleLeftBody =>
      'Üst rengi bunun yerine sol merkezle eşleşiyorsa ayna algoritmasını kullan: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Tek algoritma';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' sarı noktayı L\'ye, L\'yi çizgiye, çizgiyi de artıya çevirir. L\'yi sol arkada, çizgiyi yatay tut.';

  @override
  String get stepYellowEdges => 'Kenarları eşleştir';

  @override
  String get stepYellowEdgesBody =>
      'İki kenar merkezleriyle eşleşene kadar üstü çevir. Biri arkada, biri sağdayken R U R\' U R U2 R\' U diğer ikisini yer değiştirir.';

  @override
  String get stepPlaceCorners => 'Yerleştir';

  @override
  String get stepPlaceCornersBody =>
      'Zaten yerinde olan bir köşeyi sağ önde tut. U R U\' L\' U R\' U\' L diğer üçünü döndürür; dördü de yerine gelene kadar tekrarla.';

  @override
  String get stepTwistCorners => 'Döndür';

  @override
  String get stepTwistCornersBody =>
      'Çözülmemiş bir köşe sağ öndeyken sarı üste gelene kadar R\' D\' R D tekrarla, sonra sıradakini getirmek için yalnızca üstü çevir. Alt kısım sona kadar bozuk görünür: devam et.';

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
      '2×2, kenarları ve merkezleri olmayan bir 3×3\'tür. Bir renk seç, o yüzü altta kur ve komşu köşelerin yan renklerini eşleştir.';

  @override
  String get stepTwoCorner => 'Köşeleri yerleştir';

  @override
  String get stepTwoCornerBody =>
      'Tıpkı 3×3\'ün beyaz köşeleri gibi: bir köşeyi yerinin üstüne getir ve oturana kadar R U R\' U\' kullan.';

  @override
  String get lessonTwoOll => 'Üstü yönlendir';

  @override
  String get lessonTwoOllDesc => 'Sune ile Ortega OLL.';

  @override
  String get stepTwoSune => 'Yine Sune';

  @override
  String get stepTwoSuneBody =>
      'Sune 2×2\'de de üstü sarı yapar. Ortega kullananlar yedi kısa durum öğrenir; Sune ve aynası çoğunu kapsar.';

  @override
  String get lessonTwoPbl => 'İki katmanı da permüte et';

  @override
  String get lessonTwoPblDesc => 'Bitirmek için köşeleri yer değiştir.';

  @override
  String get stepTwoAdjacent => 'Komşu değişim';

  @override
  String get stepTwoAdjacentBody =>
      'Üstteki iki komşu köşenin yer değiştirmesi gerektiğinde onları sağda tut ve T-perm kullan.';

  @override
  String get stepTwoDiagonal => 'Çapraz değişim';

  @override
  String get stepTwoDiagonalBody =>
      'Karşılıklı köşelerdeki iki parça Y-perm ile yer değiştirir.';

  @override
  String get lessonBigIntro => 'Büyük küp parçaları';

  @override
  String get lessonBigIntroDesc => 'Merkezler, kanatlar ve iç katmanlar.';

  @override
  String get stepBigPieces => 'Sabit merkez yok';

  @override
  String get stepBigPiecesBody =>
      '4×4\'te her yüzün hareket eden dört merkez parçası vardır ve her kenar iki kanattan oluşur. İndirgeme bunları gruplar, böylece küp 3×3 gibi davranır.';

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
      'Bu komütatör tam olarak üç merkez parçasını hareket ettirir ve geri kalan her şeyi olduğu gibi bırakır; böylece bitmiş merkezler bitmiş kalır.';

  @override
  String get lessonBigEdges => 'Kenarları eşleştir';

  @override
  String get lessonBigEdgesDesc => 'Kanatları tam kenarlara birleştir.';

  @override
  String get stepBigEdgePair => 'Eşleştir ve geri getir';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' eşleşen iki kanadı hizalar, R U R\' F R\' F\' R eşleşmemiş bir kenarı içeri alır ve Uw merkezleri geri yerine koyar.';

  @override
  String get lessonBigParity => 'Parite';

  @override
  String get lessonBigParityDesc => 'Çift küplerde OLL ve PLL paritesi.';

  @override
  String get stepBigOllParity => 'OLL paritesi';

  @override
  String get stepBigOllParityBody =>
      '3×3\'te tek bir ters kenar olamaz. Çift küplerde bu algoritma üst-ön kenarı geri çevirir. Üst katmanın geri kalanını karıştırabilir, ama son 3×3 adımları zaten bunu düzeltir.';

  @override
  String get stepBigPllParity => 'PLL paritesi';

  @override
  String get stepBigPllParityBody =>
      'En sonda iki kenar yer değiştirmiş mi? 2R2 U2 2R2 Uw2 2R2 Uw2 üstteki ön ve arka kenarları yer değiştirir.';

  @override
  String get introGoalHeading => 'Hedef ne?';

  @override
  String get introHowHeading => 'Nasıl yapıyoruz?';

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
      'Her beyaz kenarın yanındaki merkez rengiyle de eşleştiği beyaz bir artı yap.';

  @override
  String get introGoalCorners =>
      'Birinci taç, yani tüm beyaz katman tamamlansın diye dört beyaz köşeyi yerleştir.';

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
      '2×2\'yi çözmek için son köşeleri yerlerine değiştir.';

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
      '3×3\'te hiç olmayan iki 4×4 durumunu düzelt: bir ters kenar veya iki yer değiştirmiş kenar.';

  @override
  String get introHowBasics =>
      'Merkezler asla hareket etmez, bu yüzden her yüzün rengini gösterir.\nHer harf bir yüzü saat yönünde çeyrek tur çevirir.\nKesme işareti (\') geri çevirir; 2 iki kez çevirir.';

  @override
  String get introHowCross =>
      'Sarıyı üstte tut: beyaz artı altta kurulur.\nBir beyaz kenar bul ve yan rengini eşleşen merkezle hizala.\nKenarı yerine indirmek için o yüzü iki kez çevir.';

  @override
  String get introHowCorners =>
      'Bir beyaz köşeyi boş yerinin üstüne getir.\nDoğru yönde oturana kadar R U R\' U\' tekrarla.\nDiğer üç köşe için de aynısını yap.';

  @override
  String get introHowMiddle =>
      'Üstte sarı içermeyen bir kenar bul ve ön rengini bir merkezle eşleştir.\nKısa 8 hamlelik bir algoritmayla sağa veya sola gönder.\nBeyaz katman her seferinde sağlam geri gelir.';

  @override
  String get introHowYellowCross =>
      'Üste bak: bir nokta, bir L veya bir çizgi.\nGösterildiği gibi tut ve F R U R\' U\' F\' yap.\nSarı artı görünene kadar tekrarla.';

  @override
  String get introHowYellowEdges =>
      'İki kenar merkezleriyle eşleşene kadar üstü çevir.\nOnları arkada ve sağda tut, sonra R U R\' U R U2 R\' U yap.\nDört kenar da eşleşene kadar tekrarla.';

  @override
  String get introHowYellowCorners =>
      'Bir köşe, renkleri etrafındaki üç yüzle eşleştiğinde yerindedir.\nYerleşmiş bir köşeyi sağ önde tut.\nU R U\' L\' U R\' U\' L diğer üçünü hepsi oturana kadar döndürür.';

  @override
  String get introHowTwistCorners =>
      'Çözülmemiş bir köşeyi sağ önde tut.\nSarısı yukarı bakana kadar R\' D\' R D tekrarla.\nSıradaki için yalnızca üstü çevir; alt kısım sonunda kendiliğinden düzelir.';

  @override
  String get introHowCfopIntro =>
      'Cross: inceleme sırasında planlanan dört kenar.\nF2L: her köşe kenarıyla birlikte girer.\nOLL üstü sarı yapar, sonra PLL parçaları yerlerine taşır.';

  @override
  String get introHowF2l =>
      'Üst katmanda bir köşe ve eşleşen kenarını bul.\nOnları yuvalarının üstünde eşleştir.\nÇifti üç veya dört hamleyle yerleştir.';

  @override
  String get introHowOll =>
      'Önce F R U R\' U\' F\' ile sarı artı.\nSonra köşeleri yönlendir, örneğin Sune ile.\nDurumu gördüğün sarıdan tanı.';

  @override
  String get introHowPll =>
      'Üst zaten tamamen sarı.\nT-perm köşeleri değiştirir; U-perm üç kenarı döngüsel taşır.\nAlgoritmayı seçmek için yan renkleri oku.';

  @override
  String get introHowTwoFirst =>
      '2×2 yalnızca köşelerden oluşur, kenarsız bir 3×3 gibi.\nHer beyaz köşeyi yerinin üstüne getir.\nOturana kadar R U R\' U\' tekrarla.';

  @override
  String get introHowTwoOll =>
      'Beyaz katmanı altta tut.\nSune (R U R\' U R U2 R\') üst köşeleri döndürür.\nÜst tamamen sarı olana kadar doğru açıdan tekrarla.';

  @override
  String get introHowTwoPbl =>
      'İki köşenin zaten eşleştiği bir yan ara.\nKomşu değişim: T-perm tarzı tek algoritma.\nÇapraz değişim: daha uzun tek algoritma.';

  @override
  String get introHowBigIntro =>
      'Hiçbir merkez sabit değil: dört merkez parçası her yüz rengini oluşturur.\nRw gibi geniş hamleler iki katmanı aynı anda çevirir.\n2R gibi iç hamleler yalnızca bir iç katmanı çevirir.';

  @override
  String get introHowBigCenters =>
      'Önce iki karşılıklı merkezi kur.\nİç katmanlar bitmiş merkezleri bozmadan merkez parçalarını değiştirir.\nSon dört merkezi de aynı şekilde bitir.';

  @override
  String get introHowBigEdges =>
      'Aynı renklere sahip iki kenar parçası bul.\nBir iç katmanla onları yan yana hizala.\nÇifti kenara koy ve merkezleri geri getir.';

  @override
  String get introHowBigParity =>
      '4×4\'ü takılana kadar 3×3 gibi çöz.\nBir ters kenar: uzun OLL parite algoritması.\nİki yer değiştirmiş kenar: 2R2 U2 2R2 Uw2 2R2 Uw2.';

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
  String get stageParity => 'Parite çözümü';

  @override
  String get stageCrown1 => 'Birinci taç (beyaz)';

  @override
  String get stageCrown2 => 'İkinci taç';

  @override
  String get stageCrown3 => 'Üçüncü taç (sarı)';

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
  String stageCrownHeader(int crown, int number, int total, String title) {
    return 'Taç $crown • Aşama $number/$total: $title';
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
  String get lessonFiveCenters => '5×5 merkezleri';

  @override
  String get lessonFiveCentersDesc => 'Her merkezi üçlü çubuklardan kur.';

  @override
  String get introGoalFiveCenters =>
      'Her yüzün 3×3 merkez bloğunu tek renkte kur.';

  @override
  String get introHowFiveCenters =>
      'Orta parçadan başla: rengi o belirler.\nÜçlü çubuklar kur ve bir iç katmanla içeri kaydır.\nSon iki merkezi birlikte bitir.';

  @override
  String get lessonFiveEdges => '5×5 kenarları';

  @override
  String get lessonFiveEdgesDesc => 'İki kanadı orta kenarlarıyla birleştir.';

  @override
  String get introGoalFiveEdges =>
      'Her orta kenarı iki kanadıyla birleştir, böylece 12 kenarın hepsi tek parça gibi görünsün.';

  @override
  String get introHowFiveEdges =>
      'Önde iki kanadı orta kenarlarıyla eşleştir.\nİç katmanı çevir, çözülmemiş bir kenarı içeri al, geri çevir.\nBitmiş kenarları bozmadan son kenarları eşleştir.';

  @override
  String get lessonFiveSolve => '5×5\'i 3×3 gibi çöz';

  @override
  String get lessonFiveSolveDesc => 'Üç taçla bitir.';

  @override
  String get introGoalFiveSolve =>
      'İndirgenmiş 5×5\'i taç taç bir 3×3 gibi çöz.';

  @override
  String get introHowFiveSolve =>
      'Bundan sonra yalnızca dış çevirmeler.\nBirinci taç, ikinci taç, sonra sarı taç.\nSabit orta parçalar her yüzün rengini gösterir.';

  @override
  String get lessonFiveParity => '5×5 kenar paritesi';

  @override
  String get lessonFiveParityDesc => 'Kanatları yer değiştirmiş kenarı düzelt.';

  @override
  String get introGoalFiveParity =>
      'İki kanadı yer değiştirmiş tek kenarı düzelt, sonra bitir.';

  @override
  String get introHowFiveParity =>
      'Eşleşmeyen bir kenar olarak ortaya çıkar.\nUzun iç katman düzeltmesini bir kez uygula.\nGeri kalan her şey yerine döner.';

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
  String get lessonSixCenters => '6×6 merkezleri';

  @override
  String get lessonSixCentersDesc => '4×4 merkezleri dörtlü çubuklardan kur.';

  @override
  String get introGoalSixCenters =>
      'Her yüzün 4×4 merkez bloğunu tek, düz renkte kur.';

  @override
  String get introHowSixCenters =>
      'Önce iki karşılıklı merkezi kur.\nDörtlü çubuklar yap ve onları yan yana kaydır.\nTek parçaları katman, üst, geri al hilesiyle taşı.';

  @override
  String get lessonSixEdges => '6×6 kenarları';

  @override
  String get lessonSixEdgesDesc => 'Her kenarın dört parçasını topla.';

  @override
  String get introGoalSixEdges =>
      'Her kenarın dört parçasını topla, böylece 6×6\'nın 12 temiz kenarı olsun.';

  @override
  String get introHowSixEdges =>
      'Önde dış ve iç kanatları hizala.\nDerin geniş katman bir kenarı içeri ve dışarı alır.\nBitmiş kenarlar asla bozulmaz.';

  @override
  String get lessonSixSolve => '6×6\'yı 3×3 gibi çöz';

  @override
  String get lessonSixSolveDesc => 'Üç taçla bitir.';

  @override
  String get introGoalSixSolve =>
      'İndirgenmiş 6×6\'yı taç taç bir 3×3 gibi çöz.';

  @override
  String get introHowSixSolve =>
      'Bundan sonra yalnızca dış çevirmeler.\nKurduğun merkezler her yüzün rengini gösterir.\nBirinci taç, ikinci taç, sonra sarı taç.';

  @override
  String get lessonSixParity => '6×6 paritesi';

  @override
  String get lessonSixParityDesc =>
      'Bir ters kenar veya iki yer değiştirmiş kenar.';

  @override
  String get introGoalSixParity =>
      '3×3\'te hiç olmayan iki 6×6 durumunu düzelt: bir ters kenar veya iki yer değiştirmiş kenar.';

  @override
  String get introHowSixParity =>
      'Takılana kadar 3×3 gibi çöz.\nBir ters kenar: uzun parite düzeltmesi.\nİki yer değiştirmiş kenar: kısa çift çevirme düzeltmesi.';

  @override
  String get stepFivePieces => '5×5\'in parçaları';

  @override
  String get stepFivePiecesBody =>
      'Her yüzün tam ortasındaki parça asla hareket etmez, bu yüzden 3×3\'teki gibi yüzün rengini göstermeye devam eder. Etrafında sekiz merkez parçası daha bulunur; her kenarın bir orta parçası ve iki kanadı vardır, köşeler ise 3×3\'teki gibi çalışır.';

  @override
  String get stepFiveSlices => 'Üç tür çevirme';

  @override
  String get stepFiveSlicesBody =>
      'Dış çevirmeler bir yüzü hareket ettirir. Geniş çevirmeler bir yüzü arkasındaki katmanla birlikte hareket ettirir. İç katman çevirmeleri yalnızca içerideki bir katmanı hareket ettirir: parçalar dışa dokunmadan böyle yer değiştirir.';

  @override
  String get stepFiveCenterBar => 'Merkez çubukları';

  @override
  String get stepFiveCenterBarBody =>
      'Eşleşen üç merkez parçasından bir sıra kur, sonra bir iç katman çevirmesiyle eşleşen ortanın yanına kaydır. Üç çubuk bitmiş bir merkez oluşturur.';

  @override
  String get stepFiveCenterSwap => 'Bozmadan değiştir';

  @override
  String get stepFiveCenterSwapBody =>
      'Tek bir merkez parçasını taşımak için: bir iç katmanı çevir, üstü çevir, katmanı geri al, üstü geri çevir. Bitmiş merkezler her seferinde geri gelir.';

  @override
  String get stepFiveEdgePair => 'Kanatları orta kenarla eşleştir';

  @override
  String get stepFiveEdgePairBody =>
      'Önde iki kanadı eşleşen orta kenarın yanına hizala, iç katmanı aşağı çevir, üstten çözülmemiş bir kenar getir, sonra iç katmanı geri çevir.';

  @override
  String get stepFiveEdgeLast => 'Son kenarlar';

  @override
  String get stepFiveEdgeLastBody =>
      'Yalnızca birkaç kenar kaldığında bir geniş çevirme, kısa bir tetikleyici ve geri geniş çevirme bitmiş kenarları bozmadan onları eşleştirir.';

  @override
  String get stepFiveAsThree => 'Artık bir 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Merkezler ve kenarlar bitince 5×5 büyük bir 3×3 gibi davranır. Yalnızca dış çevirmeler kullan ve üç tacı izle: beyaz artı ve köşeler, orta katman, sonra sarı katman.';

  @override
  String get stepFiveEdgeParity => 'Son kenarın kanatlarını değiştir';

  @override
  String get stepFiveEdgeParityBody =>
      'Bazen son kenarın iki kanadı yer değiştirmiş olur. Daha uzun bir iç katman algoritması onları geri değiştirirken geri kalan her şey yerine döner. Sonra 3×3 gibi bitir.';

  @override
  String get stepSixPieces => '6×6\'nın parçaları';

  @override
  String get stepSixPiecesBody =>
      '4×4 gibi 6×6\'nın da sabit merkezi yoktur: on altı merkez parçası her yüz rengini oluşturur. Her kenarın dört parçası vardır: iki dış kanat ve iki iç kanat.';

  @override
  String get stepSixSlices => 'Daha derin katmanları çevirmek';

  @override
  String get stepSixSlicesBody =>
      'Geniş çevirmeler bir yüzden itibaren iki veya üç katmanı hareket ettirebilir. İkinci veya üçüncü katmandaki iç katmanlar merkezler ve kenarlar için araçlardır.';

  @override
  String get stepSixCenterBar => 'Dörtlü çubuklar';

  @override
  String get stepSixCenterBarBody =>
      'Eşleşen dört merkez parçasından sıralar kur ve yüz tek düz renk olana kadar iç katman çevirmeleriyle onları yan yana kaydır.';

  @override
  String get stepSixCenterSwap => 'Parçaları tek tek taşı';

  @override
  String get stepSixCenterSwapBody =>
      'Üçüncü katmanı çevir, üstü çevir, geri al, geri çevir: bir merkez parçası yer değiştirirken bitmiş merkezler geri gelir.';

  @override
  String get stepSixEdgePair => 'Dört parça, bir kenar';

  @override
  String get stepSixEdgePairBody =>
      'Bir kenarın dört parçasını derin geniş katmanla önde topla, sonra çözülmemiş bir kenar getir ve geniş katmanı geri çevir.';

  @override
  String get stepSixEdgeLast => 'Son kenarlar';

  @override
  String get stepSixEdgeLastBody =>
      'Son kenarları derin bir geniş çevirme ile onun geri alınması arasındaki kısa bir tetikleyiciyle eşleştir; böylece bitmiş kenarlar eşleşmiş kalır.';

  @override
  String get stepSixAsThree => 'Artık bir 3×3';

  @override
  String get stepSixAsThreeBody =>
      '4×4 merkezler ve eşleşmiş kenarlarla 6×6\'yı dış çevirmeler ve üç taçla bir 3×3 gibi çöz.';

  @override
  String get stepSixOllParity => 'Bir ters kenar';

  @override
  String get stepSixOllParityBody =>
      'Son katmanı çözerken tek bir kenar ters görünüyorsa bu paritedir. Onu üst katmanın önünde tut ve uzun düzeltmeyi uygula: ilk iki taç dokunulmadan geri gelir.';

  @override
  String get stepSixPllParity => 'İki yer değiştirmiş kenar';

  @override
  String get stepSixPllParityBody =>
      'En sonda iki kenar yer değiştirmiş görünüyorsa onları üst katmanın önünde ve arkasında tut ve iç katman çift çevirmelerinden oluşan kısa düzeltmeyi uygula.';

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
  String get patternsUnlockTitle => 'Tüm desenlerin kilidini aç';

  @override
  String patternsUnlockPrompt(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Tüm desenlerin kilidini $minutes dakikalığına açmak için 1 kısa video izle',
      one:
          'Tüm desenlerin kilidini 1 dakikalığına açmak için 1 kısa video izle',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Video İzle';

  @override
  String get patternsNotNow => 'Şimdi Değil';

  @override
  String patternsUnlockedLeft(String time) {
    return 'Kilit açık • $time kaldı';
  }

  @override
  String get patternsExpiredTitle => 'Önizlemen sona erdi';

  @override
  String patternsExpiredBody(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Tüm desenleri $minutes dakika daha açık tutmak için 1 video izle!',
      one: 'Tüm desenleri 1 dakika daha açık tutmak için 1 video izle!',
    );
    return '$_temp0';
  }

  @override
  String get patternsFreeSample => 'Ücretsiz';

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
}
