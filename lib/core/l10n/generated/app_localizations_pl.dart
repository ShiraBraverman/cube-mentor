// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'CubeMentor';

  @override
  String get homeTagline =>
      'Skanuj, układaj i opanuj każdą kostkę od 2×2 do 6×6.';

  @override
  String get chooseCubeSize => 'Wybierz kostkę';

  @override
  String cubeSizeLabel(int size) {
    return '$size×$size';
  }

  @override
  String get cubeLevel2 => 'Początkujący';

  @override
  String get cubeLevel3 => 'Klasyka';

  @override
  String get cubeLevel4 => 'Zaawansowany';

  @override
  String get cubeLevel5 => 'Ekspert';

  @override
  String get cubeLevel6 => 'Mistrz';

  @override
  String get cubeComingSoon => 'Nowa kostka już wkrótce';

  @override
  String get carouselPrevious => 'Poprzednia kostka';

  @override
  String get carouselNext => 'Następna kostka';

  @override
  String get chooseMode => 'Co chcesz zrobić?';

  @override
  String get modePlayground => 'Plac zabaw 3D';

  @override
  String get modePlaygroundDesc =>
      'Obracaj warstwy, mieszaj i odtwarzaj ruchy w 3D.';

  @override
  String get modeScanSolve => 'Skanuj i ułóż';

  @override
  String get modeScanSolveDesc =>
      'Zeskanuj kostkę aparatem i otrzymaj rozwiązanie.';

  @override
  String get modeAcademy => 'Akademia';

  @override
  String get modeAcademyDesc =>
      'Ucz się krok po kroku dzięki interaktywnym lekcjom.';

  @override
  String get language => 'Język';

  @override
  String get languageSearch => 'Szukaj języka';

  @override
  String get languageNoResults => 'Żaden język nie pasuje do wyszukiwania.';

  @override
  String playgroundTitle(int size) {
    return 'Plac zabaw $size×$size';
  }

  @override
  String get scramble => 'Pomieszaj';

  @override
  String get reset => 'Resetuj';

  @override
  String get undo => 'Cofnij';

  @override
  String get speed => 'Prędkość';

  @override
  String get xray => 'Prześwietlenie';

  @override
  String get prime => 'Odwrotny';

  @override
  String get wide => 'Szeroki';

  @override
  String layer(int index) {
    return 'Warstwa $index';
  }

  @override
  String get cubeRotations => 'Obroty kostki';

  @override
  String get play => 'Odtwórz';

  @override
  String get pause => 'Pauza';

  @override
  String moveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ruchu',
      many: '$count ruchów',
      few: '$count ruchy',
      one: '1 ruch',
      zero: 'Brak ruchów',
    );
    return '$_temp0';
  }

  @override
  String get solved => 'Ułożona';

  @override
  String get scrambled => 'Pomieszana';

  @override
  String get orbitHint =>
      'Przeciągnij rząd, aby go obrócić · Przeciągnij tło, aby obrócić widok';

  @override
  String get notationPad => 'Panel notacji';

  @override
  String get solve => 'Ułóż';

  @override
  String get solving => 'Układanie…';

  @override
  String get solveFast => 'Szybkie układanie';

  @override
  String get solveLearn => 'Ucz się krok po kroku';

  @override
  String get solveModeGuided => 'Z przewodnikiem (3 korony)';

  @override
  String get solveModeFast => 'Szybko (optymalnie)';

  @override
  String solveUnavailable(int size) {
    return 'Solver $size×$size pojawi się w kolejnej aktualizacji.';
  }

  @override
  String get solveAlreadySolved => 'Kostka jest już ułożona.';

  @override
  String solveFailed(String reason) {
    return 'Tej kostki nie da się ułożyć ($reason).';
  }

  @override
  String get solveEngineMissing =>
      'Silnik układania nie jest dostępny na tym urządzeniu.';

  @override
  String get solveComplete => 'Ułożona! Świetna robota.';

  @override
  String solveSummary(int count) {
    return '$count ruchów';
  }

  @override
  String get nextMove => 'Następny ruch';

  @override
  String get previousMove => 'Poprzedni ruch';

  @override
  String get halfTurnHalfway =>
      'Dobrze, połowa za tobą! Obróć jeszcze raz, aby wykonać podwójny ruch (180°).';

  @override
  String get wideTurnInner =>
      'Świetnie! Teraz przesuń sąsiednią wewnętrzną warstwę, aby dokończyć szeroki ruch.';

  @override
  String get wideTurnOuter =>
      'Świetnie! Teraz przesuń sąsiednią zewnętrzną warstwę, aby dokończyć szeroki ruch.';

  @override
  String get wideTurnMore =>
      'Świetnie! Przesuwaj podświetlone warstwy po kolei, aby dokończyć szeroki ruch.';

  @override
  String get guideSwipeHint =>
      'Przesuń podświetloną warstwę zgodnie ze strzałką albo stuknij Dalej.';

  @override
  String get guideRotateHint =>
      'Obróć całą kostkę tak, jak pokazuje strzałka: stuknij Dalej.';

  @override
  String get guideWrongMove => 'Podążaj za podświetloną strzałką';

  @override
  String get guideExit => 'Zakończ przewodnik';

  @override
  String get colorWhite => 'biały';

  @override
  String get colorYellow => 'żółty';

  @override
  String get colorGreen => 'zielony';

  @override
  String get colorBlue => 'niebieski';

  @override
  String get colorRed => 'czerwony';

  @override
  String get colorOrange => 'pomarańczowy';

  @override
  String get phaseOptimal2x2 => 'Optymalne rozwiązanie';

  @override
  String get phaseKociemba1 => 'Faza 1 · Orientacja elementów';

  @override
  String get phaseKociemba2 => 'Faza 2 · Dokończenie kostki';

  @override
  String get phaseLblCross => 'Biały krzyż';

  @override
  String get phaseLblCorners => 'Rogi pierwszej korony';

  @override
  String get phaseLblMiddle => 'Krawędzie środkowej warstwy';

  @override
  String get phaseLblYellowCross => 'Żółty krzyż';

  @override
  String get phaseLblYellowEdges => 'Dopasuj krawędzie żółtego krzyża';

  @override
  String get phaseLblYellowCorners => 'Ustaw żółte rogi na miejscach';

  @override
  String get phaseLblYellowCornersOrient => 'Zorientuj żółte rogi';

  @override
  String get crownFirst => 'Pierwsza korona';

  @override
  String get crownSecond => 'Druga korona';

  @override
  String get crownThird => 'Trzecia korona';

  @override
  String get crownFirstGoal => 'Biała ściana i pierwsza warstwa';

  @override
  String get crownSecondGoal => 'Środkowa warstwa';

  @override
  String get crownThirdGoal => 'Żółta ściana i ostatnia warstwa';

  @override
  String get subStepGoal11 =>
      'Ułóż biały krzyż, w którym każda biała krawędź pasuje też kolorem do sąsiedniego środka.';

  @override
  String get subStepGoal12 =>
      'Wstaw 4 białe rogi na ich miejsca, aby dokończyć białą ścianę i cały pierwszy pierścień.';

  @override
  String get subStepGoal21 =>
      'Wstaw 4 krawędzie środkowej warstwy, nie psując pierwszej korony.';

  @override
  String get subStepGoal31 => 'Ułóż żółty krzyż na ostatniej warstwie.';

  @override
  String get subStepGoal32 =>
      'Zamieniaj krawędzie żółtego krzyża, aż każda będzie pasować do środka swojej ściany.';

  @override
  String get subStepGoal33 =>
      'Przenieś 4 żółte rogi na właściwe miejsca, nawet jeśli są jeszcze skręcone.';

  @override
  String get subStepGoal34 =>
      'Skręcaj każdy żółty róg w miejscu, aż wszystkie naklejki będą pasować i kostka będzie ułożona.';

  @override
  String get explainOptimal2x2 =>
      'Najkrótsze możliwe rozwiązanie, znalezione przez przeszukanie wszystkich pozycji kostki 2×2.';

  @override
  String get explainKociemba1 =>
      'Zorientuj wszystkie elementy i zbierz krawędzie środkowej warstwy w środkowej warstwie.';

  @override
  String get explainKociemba2 =>
      'Dokończ wyłącznie ruchami U, D i półobrotami, które zachowują tę orientację.';

  @override
  String get explainLblOrient =>
      'Obróć całą kostkę tak, aby biały środek był na dole.';

  @override
  String explainLblCrossEdge(String piece) {
    return 'Sprowadź krawędź $piece na dół obok białego środka, dopasowując kolor boczny.';
  }

  @override
  String explainLblCornerExtract(String piece) {
    return 'Róg $piece utknął w złym miejscu. Wyciągnij go na górę ruchami R U R\' U\'.';
  }

  @override
  String explainLblCornerAlign(String piece) {
    return 'Obracaj górną warstwę, aż róg $piece znajdzie się nad swoim miejscem.';
  }

  @override
  String explainLblCornerInsert(String piece) {
    return 'Powtarzaj R U R\' U\', aż róg $piece wskoczy na miejsce.';
  }

  @override
  String explainLblMiddleExtract(String piece) {
    return 'Krawędź $piece jest w środkowej warstwie, ale źle. Wyciągnij ją na górę.';
  }

  @override
  String explainLblMiddleAlign(String piece) {
    return 'Obróć górną warstwę, aby boczny kolor krawędzi $piece pasował do środka.';
  }

  @override
  String explainLblMiddleRight(String piece) {
    return 'Wstaw krawędź $piece w prawo: U R U\' R\' U\' F\' U F.';
  }

  @override
  String explainLblMiddleLeft(String piece) {
    return 'Wstaw krawędź $piece w lewo: U\' L\' U L U F U\' F\'.';
  }

  @override
  String get explainLblYellowCrossAlign =>
      'Obróć górną warstwę, aby ustawić żółty kształt do następnego algorytmu.';

  @override
  String get explainLblYellowCrossAlg =>
      'Ułóż żółty krzyż algorytmem F R U R\' U\' F\'.';

  @override
  String get explainLblYellowEdgesAlign =>
      'Obróć górną warstwę, aby wyrównać żółte krawędzie ze środkami.';

  @override
  String get explainLblYellowEdgesAlg =>
      'Zamień żółte krawędzie algorytmem R U R\' U R U2 R\' U.';

  @override
  String get explainLblYellowCornersAlg =>
      'Przestaw żółte rogi na ich miejsca algorytmem U R U\' L\' U R\' U\' L.';

  @override
  String get explainLblNextCorner =>
      'Obróć górną warstwę, aby następny nieułożony żółty róg znalazł się z przodu po prawej.';

  @override
  String get explainLblCornerTwist =>
      'Powtarzaj R\' D\' R D, aż żółty kolor będzie u góry. Dolna warstwa naprawi się sama na końcu.';

  @override
  String get explainLblFinalAlign =>
      'Obróć górną warstwę, aby dokończyć kostkę.';

  @override
  String scanTitle(int size) {
    return 'Skanowanie $size×$size';
  }

  @override
  String get scanManualInput => 'Wprowadź kolory ręcznie';

  @override
  String get scanUseCamera => 'Skanuj aparatem';

  @override
  String scanFaceProgress(int current, int total) {
    return 'Ściana $current z $total';
  }

  @override
  String get faceUp => 'Górna ściana';

  @override
  String get faceRight => 'Prawa ściana';

  @override
  String get faceFront => 'Przednia ściana';

  @override
  String get faceDown => 'Dolna ściana';

  @override
  String get faceLeft => 'Lewa ściana';

  @override
  String get faceBack => 'Tylna ściana';

  @override
  String get scanHintFront =>
      'Trzymaj kostkę dowolną ścianą do siebie. To jest przód: podczas skanowania zachowaj tę samą ścianę u góry.';

  @override
  String get scanHintRight =>
      'Z pozycji przodem obróć całą kostkę raz w lewo, aby prawa ściana była zwrócona do ciebie.';

  @override
  String get scanHintBack =>
      'Z pozycji przodem obróć całą kostkę dwa razy w lewo.';

  @override
  String get scanHintLeft => 'Z pozycji przodem obróć całą kostkę raz w prawo.';

  @override
  String get scanHintUp =>
      'Z pozycji przodem przechyl górę do siebie, aby była zwrócona do aparatu.';

  @override
  String get scanHintDown =>
      'Z pozycji przodem przechyl spód do siebie, aby był zwrócony do aparatu.';

  @override
  String get scanAlignHint =>
      'Wypełnij siatkę ścianą kostki, a potem stuknij migawkę.';

  @override
  String get scanCapture => 'Zrób zdjęcie ściany';

  @override
  String get scanTurnLeft => 'Obróć całą kostkę w lewo';

  @override
  String get scanTurnRight => 'Obróć całą kostkę w prawo';

  @override
  String get scanTipTop => 'Przechyl górę do siebie';

  @override
  String get scanTipBottom => 'Przechyl spód do siebie';

  @override
  String get scanGlareTip =>
      'Wykryto odblask: lekko przechyl kostkę albo zasłoń telefonem światło z góry.';

  @override
  String get scanDimTip =>
      'Za ciemno: przejdź do jaśniejszego miejsca lub włącz latarkę.';

  @override
  String get scanTorch => 'Latarka';

  @override
  String get scanGuideLabel =>
      'Przewodnik skanowania: zeskanowane ściany w kolorze. Stuknij zeskanowaną ścianę, aby zeskanować ją ponownie.';

  @override
  String get scanTapToRescan =>
      'Stuknij zeskanowaną ścianę, aby zeskanować ją ponownie.';

  @override
  String get scanCameraMissing => 'Na tym urządzeniu nie znaleziono aparatu.';

  @override
  String get scanCameraDenied =>
      'Odmówiono dostępu do aparatu. Nadal możesz wprowadzić kolory ręcznie.';

  @override
  String get scanCameraFailed => 'Nie udało się uruchomić aparatu.';

  @override
  String get scanAllGood => 'Wszystkie naklejki wyglądają dobrze.';

  @override
  String scanStickersWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count naklejki wygląda źle',
      many: '$count naklejek wygląda źle',
      few: '$count naklejki wyglądają źle',
      one: '1 naklejka wygląda źle',
    );
    return '$_temp0';
  }

  @override
  String get scanCheckCube => 'Coś się nie zgadza';

  @override
  String scanIssueColors(int count) {
    return 'Każdy kolor musi wystąpić dokładnie $count razy.';
  }

  @override
  String get scanIssueCenters => 'Dwa środki mają ten sam kolor.';

  @override
  String get scanIssuePieces =>
      'Te naklejki tworzą elementy, które nie istnieją na prawdziwej kostce.';

  @override
  String get scanIssueTwist =>
      'Jeden róg jest skręcony. Sprawdź naklejki na rogach.';

  @override
  String get scanIssueFlip =>
      'Jedna krawędź jest odwrócona. Sprawdź naklejki na krawędziach.';

  @override
  String get scanIssueParity => 'Dwa elementy wyglądają na zamienione.';

  @override
  String get scanIssueUnavailable =>
      'Sprawdzanie kolorów nie jest dostępne na tym urządzeniu.';

  @override
  String scanUncertain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count naklejki były trudne do odczytania: rzuć na nie okiem.',
      many: '$count naklejek było trudnych do odczytania: rzuć na nie okiem.',
      few: '$count naklejki były trudne do odczytania: rzuć na nie okiem.',
      one: '1 naklejka była trudna do odczytania: rzuć na nią okiem.',
    );
    return '$_temp0';
  }

  @override
  String get scanEditHint =>
      'Stuknij naklejkę, aby zmienić jej kolor · Przytrzymaj, aby otworzyć paletę';

  @override
  String get scanRescanFace => 'Zeskanuj ścianę ponownie';

  @override
  String get scanCancelRescan => 'Wróć do kolorów';

  @override
  String get scanPaletteTitle => 'Wybierz kolor';

  @override
  String get scanOpen3d => 'Otwórz w 3D';

  @override
  String get scanRestart => 'Zacznij od nowa';

  @override
  String get modeTimer => 'Stoper speedcubingowy';

  @override
  String get modeTimerDesc =>
      'Scramble, inspekcja, średnie i rekordy osobiste.';

  @override
  String get modeDaily => 'Wyzwanie dnia';

  @override
  String get modeDailyDesc =>
      'Codziennie nowy scramble. Nie przerywaj swojej serii.';

  @override
  String get modePatterns => 'Biblioteka wzorów';

  @override
  String get modePatternsDesc =>
      'Szachownica, superflip i inne, odtwarzane w 3D.';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seria $count dni',
      one: 'Seria 1 dnia',
    );
    return '$_temp0';
  }

  @override
  String get continueLearning => 'Kontynuuj naukę';

  @override
  String get startLearning => 'Zacznij naukę';

  @override
  String lessonOf(int index, int total) {
    return 'Lekcja $index z $total';
  }

  @override
  String get academyAllDone => 'Wszystkie lekcje ukończone!';

  @override
  String get academyTitle => 'Akademia';

  @override
  String academyProgress(int done, int total) {
    return 'Ukończono $done z $total lekcji';
  }

  @override
  String get lessonAdvanced => 'Zaawansowane';

  @override
  String lessonPartOf(int index, int total) {
    return 'Część $index z $total';
  }

  @override
  String get lessonNext => 'Dalej';

  @override
  String get lessonPrevious => 'Wstecz';

  @override
  String get lessonFinish => 'Zakończ lekcję';

  @override
  String get lessonComplete => 'Lekcja ukończona!';

  @override
  String get lessonNextLesson => 'Następna lekcja';

  @override
  String get lessonBackToAcademy => 'Wróć do Akademii';

  @override
  String get lessonTryIt =>
      'Twoja kolej: przesuń warstwę wskazaną strzałką albo stuknij Dalej.';

  @override
  String get lessonLookAround =>
      'Przeciągnij tło, aby obejrzeć kostkę z każdej strony.';

  @override
  String get lessonDemoDone => 'Brawo! Stuknij Dalej, aby kontynuować.';

  @override
  String holdPrompt(String top, String front) {
    return 'Trzymaj kostkę tak, aby środek w kolorze: $top był u góry, a środek w kolorze: $front był zwrócony do ciebie.';
  }

  @override
  String get trackBeginner => '3×3 dla początkujących: 3 korony';

  @override
  String get trackCfop => 'Wprowadzenie do CFOP';

  @override
  String get trackTwoByTwo => '2×2 dla początkujących i Ortega';

  @override
  String get trackBigCubes => 'Duże kostki: redukcja i parzystość';

  @override
  String moveSentence(String layer, String direction) {
    return 'Obróć $layer $direction';
  }

  @override
  String get moveFaceR => 'prawą ścianę';

  @override
  String get moveFaceL => 'lewą ścianę';

  @override
  String get moveFaceU => 'górną ścianę';

  @override
  String get moveFaceD => 'dolną ścianę';

  @override
  String get moveFaceF => 'przednią ścianę';

  @override
  String get moveFaceB => 'tylną ścianę';

  @override
  String moveLayerInner(int depth, String face) {
    return 'warstwę $depth, licząc od ściany: $face';
  }

  @override
  String moveLayerWide(int depth, String face) {
    return '$face ($depth warstwy w głąb)';
  }

  @override
  String moveLayerBlock(int near, int far, String face) {
    return 'warstwy $near–$far, licząc od ściany: $face';
  }

  @override
  String get moveLayerMiddle => 'środkową warstwę';

  @override
  String get moveDirUp => 'w górę';

  @override
  String get moveDirDown => 'w dół';

  @override
  String get moveDirLeft => 'w lewo';

  @override
  String get moveDirRight => 'w prawo';

  @override
  String get moveDirClockwise => 'zgodnie z ruchem wskazówek zegara';

  @override
  String get moveDirCounter => 'przeciwnie do ruchu wskazówek zegara';

  @override
  String get moveDirBackClockwise =>
      'zgodnie z ruchem wskazówek zegara, patrząc od tyłu';

  @override
  String get moveDirBackCounter =>
      'przeciwnie do ruchu wskazówek zegara, patrząc od tyłu';

  @override
  String get moveDirHalf => 'o pół obrotu (dwa razy)';

  @override
  String get moveRotateX => 'Przechyl całą kostkę: przód idzie do góry';

  @override
  String get moveRotateXPrime => 'Przechyl całą kostkę: przód idzie na dół';

  @override
  String get moveRotateX2 => 'Przewróć całą kostkę: przód idzie do tyłu';

  @override
  String get moveRotateY => 'Obróć całą kostkę: przód idzie w lewo';

  @override
  String get moveRotateYPrime => 'Obróć całą kostkę: przód idzie w prawo';

  @override
  String get moveRotateY2 =>
      'Obróć całą kostkę o pół obrotu: tył przechodzi do przodu';

  @override
  String get moveRotateZ =>
      'Przetocz całą kostkę zgodnie z ruchem wskazówek zegara: góra idzie w prawo';

  @override
  String get moveRotateZPrime =>
      'Przetocz całą kostkę przeciwnie do ruchu wskazówek zegara: góra idzie w lewo';

  @override
  String get moveRotateZ2 =>
      'Odwróć całą kostkę do góry nogami: góra idzie na dół';

  @override
  String get phaseReductionCenters => 'Środki';

  @override
  String get phaseReductionEdges => 'Parowanie krawędzi';

  @override
  String get phaseReductionEdgeParity => 'Parzystość krawędzi';

  @override
  String get phaseReductionOllParity => 'Parzystość OLL';

  @override
  String get phaseReductionPllParity => 'Parzystość PLL';

  @override
  String get explainReductionCenterBlock =>
      'Ruchy warstw wewnętrznych, które przenoszą kilka elementów środka na miejsce naraz.';

  @override
  String explainReductionCenterCycle(String piece) {
    return 'Przenieś element środka $piece na jego ścianę 3-cyklem, który nie rusza ułożonych środków.';
  }

  @override
  String get explainReductionParityCenters =>
      'Odbuduj środki przesunięte przez ruch naprawiający parzystość.';

  @override
  String explainReductionEdgeCycle(String piece) {
    return 'Połącz elementy krawędzi $piece 3-cyklem; środki pozostają ułożone.';
  }

  @override
  String get explainReductionEdgeParity =>
      'Ostatnich krawędzi nie da się sparować samymi 3-cyklami (parzystość krawędzi). Naprawia to jeden ruch warstwy wewnętrznej.';

  @override
  String get explainReductionOllParity =>
      'Parzystość OLL: jedna krawędź jest odwrócona, co na 3×3 jest niemożliwe. Ten algorytm odwraca ją z powrotem.';

  @override
  String get explainReductionPllParity =>
      'Parzystość PLL: dwie krawędzie są zamienione, co na 3×3 jest niemożliwe. Ten algorytm zamienia je z powrotem.';

  @override
  String get patternsTitle => 'Biblioteka wzorów';

  @override
  String get patternsHint =>
      'Stuknij wzór, aby go obejrzeć, a potem powtórz go na swojej kostce.';

  @override
  String get patternCheckerboard => 'Szachownica';

  @override
  String get patternCubeInCube => 'Kostka w kostce';

  @override
  String get patternSuperflip => 'Superflip';

  @override
  String get patternDots => 'Kropki';

  @override
  String get patternCross => 'Krzyż';

  @override
  String get patternPython => 'Pyton';

  @override
  String get phasePattern => 'Ułóż wzór';

  @override
  String get explainPatternStep =>
      'Powtarzaj każdy ruch na swojej kostce. Stuknij Ułóż, aby przywrócić ją do normy.';

  @override
  String patternTitle(String name, int size) {
    return '$name · $size×$size';
  }

  @override
  String get timerTitle => 'Stoper speedcubingowy';

  @override
  String get timerHoldToStart => 'Przytrzymaj, a potem puść, aby zacząć';

  @override
  String get timerReleaseToStart => 'Puść, aby zacząć';

  @override
  String get timerTapToStop => 'Stuknij w dowolnym miejscu, aby zatrzymać';

  @override
  String get timerInspectionToggle => 'Inspekcja 15 s';

  @override
  String get timerLoadingScramble => 'Generowanie scramble\'a…';

  @override
  String get timerPb => 'Rekord';

  @override
  String get timerSolves => 'Ułożenia';

  @override
  String get timerPlus2 => '+2';

  @override
  String get timerDnf => 'DNF';

  @override
  String get timerDelete => 'Usuń';

  @override
  String get timerHistory => 'Historia';

  @override
  String get timerNoSolves => 'Brak ułożeń. Pomieszaj kostkę i do dzieła!';

  @override
  String get timerNewPb => 'Nowy rekord osobisty!';

  @override
  String get timerClearHistory => 'Wyczyść historię';

  @override
  String get timerScrambleHint =>
      'Trzymaj biały u góry i zielony z przodu, a potem pomieszaj:';

  @override
  String get dailyTitle => 'Wyzwanie dnia';

  @override
  String dailyFor(String date) {
    return 'Wyzwanie na $date';
  }

  @override
  String dailyBestStreak(int count) {
    return 'Najdłuższa seria: $count';
  }

  @override
  String get dailyDone => 'Na dziś gotowe! Wróć jutro.';

  @override
  String get dailyNotDone => 'Ułóż dzisiejszy scramble, aby utrzymać serię.';

  @override
  String get dailySolveVirtual => 'Ułóż na kostce 3D';

  @override
  String get dailyTimeIt => 'Zmierz czas na swojej kostce';

  @override
  String get dailyHint => 'Podpowiedź';

  @override
  String dailyHintText(String moves) {
    return 'Zacznij od białego krzyża: $moves';
  }

  @override
  String get dailyHintFailed => 'Podpowiedź nie jest teraz dostępna.';

  @override
  String get lessonBasics => 'Poznaj kostkę';

  @override
  String get lessonBasicsDesc => 'Elementy, ściany i nazwy ruchów.';

  @override
  String get stepBasicsPieces => 'Trzy rodzaje elementów';

  @override
  String get stepBasicsPiecesBody =>
      'Środki nigdy się nie ruszają i nadają każdej ścianie kolor. Krawędzie mają dwa kolory, rogi trzy. Ułożenie kostki to przeniesienie każdej krawędzi i każdego rogu obok pasujących środków.';

  @override
  String get stepBasicsFaces => 'Sześć liter ścian';

  @override
  String get stepBasicsFacesBody =>
      'R, L, U, D, F i B to ściany prawa, lewa, górna, dolna, przednia i tylna. Sama litera oznacza obrót o ćwierć obrotu zgodnie z ruchem wskazówek zegara, tak jakbyś patrzył prosto na tę ścianę.';

  @override
  String get stepBasicsPrime => 'Ruchy odwrotne i podwójne';

  @override
  String get stepBasicsPrimeBody =>
      'Apostrof (R\') oznacza obrót w drugą stronę, przeciwnie do ruchu wskazówek zegara. Dwójka (U2) to pół obrotu: dwa ćwierćobroty.';

  @override
  String get stepCrossGoal => 'Cel';

  @override
  String get stepCrossGoalBody =>
      'Trzymaj żółty u góry. Cztery białe krawędzie otaczają biały środek na dole, a boczny kolor każdej pasuje do sąsiedniego środka.';

  @override
  String get stepCrossTop => 'Krawędź na górze';

  @override
  String get stepCrossTopBody =>
      'Znajdź białą krawędź na górze. Obracaj górę, aż jej boczny kolor znajdzie się nad pasującym środkiem, a potem obróć tę ścianę dwa razy, aby ją opuścić.';

  @override
  String get stepCrossMiddle => 'Krawędź w środku';

  @override
  String get stepCrossMiddleBody =>
      'Krawędź utknięta w środkowej warstwie najpierw idzie na górę: obróć jej ścianę w górę, odsuń górę i obróć ścianę z powrotem, aby krzyż pozostał nienaruszony. Potem wstaw ją z góry.';

  @override
  String get stepCornersInsert => 'Nad swoim miejscem';

  @override
  String get stepCornersInsertBody =>
      'Obracaj górę, aż biały róg znajdzie się nad miejscem, do którego należą jego kolory, z przodu po prawej. R U R\' U\' wstawi go na dół.';

  @override
  String get stepCornersRepeat => 'Powtarzaj sekwencję';

  @override
  String get stepCornersRepeatBody =>
      'Jeśli biały jest skierowany w złą stronę, powtarzaj R U R\' U\' nad tym samym miejscem. Każdy róg jest ułożony po najwyżej pięciu powtórzeniach.';

  @override
  String get stepMiddleRight => 'Krawędź w prawo';

  @override
  String get stepMiddleRightBody =>
      'Ustaw górną krawędź nad jej środkiem z przodu. Jeśli jej górny kolor pasuje do prawego środka, wstaw ją ruchami U R U\' R\' U\' F\' U F.';

  @override
  String get stepMiddleLeft => 'Krawędź w lewo';

  @override
  String get stepMiddleLeftBody =>
      'Jeśli jej górny kolor pasuje do lewego środka, użyj odbicia lustrzanego: U\' L\' U L U F U\' F\'.';

  @override
  String get stepYellowCross => 'Jeden algorytm';

  @override
  String get stepYellowCrossBody =>
      'F R U R\' U\' F\' zmienia żółtą kropkę w literę L, L w linię, a linię w krzyż. Trzymaj L z tyłu po lewej, a linię poziomo.';

  @override
  String get stepYellowEdges => 'Dopasuj krawędzie';

  @override
  String get stepYellowEdgesBody =>
      'Obracaj górę, aż dwie krawędzie będą pasować do środków. Gdy jedna jest z tyłu, a druga po prawej, R U R\' U R U2 R\' U zamienia pozostałe dwie.';

  @override
  String get stepPlaceCorners => 'Ustaw je';

  @override
  String get stepPlaceCornersBody =>
      'Trzymaj róg, który już jest na swoim miejscu, z przodu po prawej. U R U\' L\' U R\' U\' L przestawia pozostałe trzy; powtarzaj, aż wszystkie cztery będą na miejscach.';

  @override
  String get stepTwistCorners => 'Skręć je';

  @override
  String get stepTwistCornersBody =>
      'Z nieułożonym rogiem z przodu po prawej powtarzaj R\' D\' R D, aż żółty będzie u góry, a potem obracaj tylko górę, aby podstawić następny. Dół wygląda na zepsuty aż do samego końca: kontynuuj.';

  @override
  String get lessonCfopIntro => 'Czym jest CFOP?';

  @override
  String get lessonCfopIntroDesc => 'Cross, F2L, OLL, PLL.';

  @override
  String get stepCfopOverview => 'Cztery etapy';

  @override
  String get stepCfopOverviewBody =>
      'Speedcuberzy układają krzyż, potem parują każdy róg pierwszej warstwy z krawędzią środkowej warstwy (F2L), orientują ostatnią warstwę (OLL) i na koniec ją permutują (PLL).';

  @override
  String get stepCfopCross => 'Zaplanuj krzyż';

  @override
  String get stepCfopCrossBody =>
      'W CFOP krzyż planuje się podczas inspekcji i układa na dole w około ośmiu ruchach.';

  @override
  String get lessonF2l => 'Podstawy F2L';

  @override
  String get lessonF2lDesc => 'Sparuj róg z jego krawędzią.';

  @override
  String get stepF2lRight => 'Wstaw parę';

  @override
  String get stepF2lRightBody =>
      'Gdy róg i jego krawędź leżą obok siebie na górze, przenieś je nad ich slot i wstaw razem.';

  @override
  String get stepF2lLeft => 'Para lewą ręką';

  @override
  String get stepF2lLeftBody =>
      'Ten sam przypadek po drugiej stronie to odbicie lustrzane, U\' L\' U L. Obrót kostki (y) pozwala użyć wygodniejszej ręki.';

  @override
  String get lessonOll => 'Dwuetapowy OLL';

  @override
  String get lessonOllDesc => 'Zrób żółtą górę.';

  @override
  String get stepOllCross => 'Najpierw krawędzie';

  @override
  String get stepOllCrossBody =>
      'Dwuetapowy OLL zaczyna się od znanego ci już algorytmu żółtego krzyża.';

  @override
  String get stepOllSune => 'Sune';

  @override
  String get stepOllSuneBody =>
      'Gdy jeden żółty róg patrzy w górę z przodu po lewej, Sune (R U R\' U R U2 R\') orientuje pozostałe trzy. Większość innych przypadków wykorzystuje Sune i jego lustrzane odbicie.';

  @override
  String get lessonPll => 'Dwuetapowy PLL';

  @override
  String get lessonPllDesc => 'Dokończ kostkę.';

  @override
  String get stepPllT => 'T-perm';

  @override
  String get stepPllTBody =>
      'T-perm zamienia dwa rogi i dwie krawędzie. Użyj go do ustawienia rogów: trzymaj dwa rogi do zamiany po prawej.';

  @override
  String get stepPllU => 'U-perm';

  @override
  String get stepPllUBody =>
      'Gdy rogi są gotowe, U-perm przestawia cyklicznie trzy krawędzie. Trzymaj ułożoną stronę z tyłu.';

  @override
  String get lessonTwoFirst => 'Pierwsza warstwa 2×2';

  @override
  String get lessonTwoFirstDesc => 'Ułóż jedną ścianę z pasującymi rogami.';

  @override
  String get stepTwoIntro => 'Same rogi';

  @override
  String get stepTwoIntroBody =>
      'Kostka 2×2 to 3×3 bez krawędzi i środków. Wybierz kolor, ułóż tę ścianę na dole i dopasuj boczne kolory sąsiednich rogów.';

  @override
  String get stepTwoCorner => 'Wstawianie rogów';

  @override
  String get stepTwoCornerBody =>
      'Dokładnie jak białe rogi na 3×3: przenieś róg nad jego miejsce i powtarzaj R U R\' U\', aż pasuje.';

  @override
  String get lessonTwoOll => 'Orientacja góry';

  @override
  String get lessonTwoOllDesc => 'OLL metodą Ortega z Sune.';

  @override
  String get stepTwoSune => 'Znowu Sune';

  @override
  String get stepTwoSuneBody =>
      'Sune robi żółtą górę także na 2×2. Układający metodą Ortega uczą się siedmiu krótkich przypadków; Sune i jego lustrzane odbicie obejmują większość z nich.';

  @override
  String get lessonTwoPbl => 'Permutacja obu warstw';

  @override
  String get lessonTwoPblDesc => 'Zamień rogi, aby skończyć.';

  @override
  String get stepTwoAdjacent => 'Zamiana sąsiednich';

  @override
  String get stepTwoAdjacentBody =>
      'Gdy dwa sąsiednie górne rogi trzeba zamienić, trzymaj je po prawej i użyj T-perm.';

  @override
  String get stepTwoDiagonal => 'Zamiana po przekątnej';

  @override
  String get stepTwoDiagonalBody =>
      'Dwa rogi leżące naprzeciw siebie zamienia Y-perm.';

  @override
  String get lessonBigIntro => 'Elementy dużych kostek';

  @override
  String get lessonBigIntroDesc => 'Środki, skrzydełka i warstwy wewnętrzne.';

  @override
  String get stepBigPieces => 'Brak stałych środków';

  @override
  String get stepBigPiecesBody =>
      'Na 4×4 każda ściana ma cztery ruchome elementy środka, a każda krawędź składa się z dwóch skrzydełek. Redukcja grupuje je tak, aby kostka zachowywała się jak 3×3.';

  @override
  String get stepBigSlices => 'Ruchy szerokie i wewnętrzne';

  @override
  String get stepBigSlicesBody =>
      'Rw obraca razem dwie prawe warstwy. 2R obraca tylko drugą warstwę od prawej. Te ruchy przesuwają środki i skrzydełka.';

  @override
  String get lessonBigCenters => 'Środki';

  @override
  String get lessonBigCentersDesc => 'Zbierz elementy środków.';

  @override
  String get stepBigCenterCycle => '3-cykl środków';

  @override
  String get stepBigCenterCycleBody =>
      'Ten komutator przesuwa dokładnie trzy elementy środka i nie rusza niczego innego, więc ułożone środki pozostają ułożone.';

  @override
  String get lessonBigEdges => 'Parowanie krawędzi';

  @override
  String get lessonBigEdgesDesc => 'Połącz skrzydełka w pełne krawędzie.';

  @override
  String get stepBigEdgePair => 'Sparuj i przywróć';

  @override
  String get stepBigEdgePairBody =>
      'Uw\' ustawia dwa pasujące skrzydełka w linii, R U R\' F R\' F\' R wstawia niesparowaną krawędź, a Uw przywraca środki.';

  @override
  String get lessonBigParity => 'Parzystość';

  @override
  String get lessonBigParityDesc =>
      'Parzystość OLL i PLL na parzystych kostkach.';

  @override
  String get stepBigOllParity => 'Parzystość OLL';

  @override
  String get stepBigOllParityBody =>
      'Pojedyncza odwrócona krawędź nie może wystąpić na 3×3. Na parzystych kostkach ten algorytm odwraca z powrotem górną przednią krawędź. Może przemieszać resztę górnej warstwy, ale ostatnie kroki 3×3 i tak to naprawią.';

  @override
  String get stepBigPllParity => 'Parzystość PLL';

  @override
  String get stepBigPllParityBody =>
      'Dwie zamienione krawędzie na samym końcu? 2R2 U2 2R2 Uw2 2R2 Uw2 zamienia przednią i tylną krawędź górnej warstwy.';

  @override
  String get introGoalHeading => 'Jaki jest cel?';

  @override
  String get introHowHeading => 'Jak to zrobić?';

  @override
  String get introStart => 'Rozumiem, zaczynam krok po kroku';

  @override
  String get introDontShowAgain => 'Nie pokazuj więcej automatycznie';

  @override
  String get introShowGoal => 'Pokaż cel';

  @override
  String get introStateStart => 'Start';

  @override
  String get introStateGoal => 'Cel';

  @override
  String get introPlayMorph => 'Odtwórz od startu do celu';

  @override
  String get introGoalBasics =>
      'Naucz się czytać kostkę: jej elementy, sześć ścian i to, jak litery ruchów je obracają.';

  @override
  String get introGoalCross =>
      'Ułóż biały plus, w którym każda biała krawędź pasuje też do sąsiedniego środka.';

  @override
  String get introGoalCorners =>
      'Wstaw cztery białe rogi, aby pierwsza korona, cała biała warstwa, była gotowa.';

  @override
  String get introGoalMiddle =>
      'Wstaw cztery krawędzie środkowej warstwy, aby pierwsze dwie warstwy były ułożone.';

  @override
  String get introGoalYellowCross =>
      'Ułóż żółty plus na górze; boczne kolory nie muszą jeszcze pasować.';

  @override
  String get introGoalYellowEdges =>
      'Wyrównaj każdą krawędź żółtego krzyża ze środkiem po jej stronie.';

  @override
  String get introGoalYellowCorners =>
      'Przenieś każdy żółty róg na jego miejsce, nawet jeśli jest jeszcze skręcony.';

  @override
  String get introGoalTwistCorners =>
      'Skręć żółte rogi we właściwą stronę, aby cała kostka była ułożona.';

  @override
  String get introGoalCfopIntro =>
      'Poznaj plan speedcuberów: krzyż, pierwsze dwie warstwy, a potem ostatnia warstwa w dwóch spojrzeniach.';

  @override
  String get introGoalF2l =>
      'Wstaw każdy biały róg razem z jego krawędzią środkową, kończąc dwie warstwy naraz.';

  @override
  String get introGoalOll =>
      'Zrób całą górną ścianę żółtą jednym lub dwoma algorytmami.';

  @override
  String get introGoalPll =>
      'Przenieś elementy ostatniej warstwy na ich miejsca, aby dokończyć kostkę.';

  @override
  String get introGoalTwoFirst => 'Ułóż jedną pełną białą warstwę na 2×2.';

  @override
  String get introGoalTwoOll => 'Zrób górną ścianę 2×2 całą żółtą.';

  @override
  String get introGoalTwoPbl =>
      'Zamień ostatnie rogi na miejsca, aby ułożyć 2×2.';

  @override
  String get introGoalBigIntro =>
      'Poznaj 4×4: środki, pary krawędzi i rogi oraz ruchy, które je obracają.';

  @override
  String get introGoalBigCenters =>
      'Zbierz elementy środka każdej ściany w jeden jednolity blok koloru.';

  @override
  String get introGoalBigEdges =>
      'Sparuj pasujące elementy krawędzi, aby każda krawędź wyglądała jak pojedyncza krawędź 3×3.';

  @override
  String get introGoalBigParity =>
      'Napraw dwa przypadki 4×4, których 3×3 nigdy nie ma: jedną odwróconą krawędź lub dwie zamienione krawędzie.';

  @override
  String get introHowBasics =>
      'Środki nigdy się nie ruszają, więc pokazują kolor każdej ściany.\nKażda litera obraca jedną ścianę o ćwierć obrotu zgodnie z ruchem wskazówek zegara.\nApostrof (\') obraca ją z powrotem; 2 obraca ją dwa razy.';

  @override
  String get introHowCross =>
      'Trzymaj żółty u góry: biały krzyż powstaje na dole.\nZnajdź białą krawędź i ustaw jej boczny kolor nad pasującym środkiem.\nObróć tę ścianę dwa razy, aby wstawić krawędź na miejsce.';

  @override
  String get introHowCorners =>
      'Przenieś biały róg nad jego puste miejsce.\nPowtarzaj R U R\' U\', aż wskoczy właściwie obrócony.\nZrób to samo z pozostałymi trzema rogami.';

  @override
  String get introHowMiddle =>
      'Znajdź górną krawędź bez żółtego i dopasuj jej przedni kolor do środka.\nWyślij ją w prawo lub w lewo krótkim algorytmem z 8 ruchów.\nBiała warstwa za każdym razem wraca nienaruszona.';

  @override
  String get introHowYellowCross =>
      'Spójrz na górę: kropka, L lub linia.\nTrzymaj tak, jak pokazano, i wykonaj F R U R\' U\' F\'.\nPowtarzaj, aż pojawi się żółty krzyż.';

  @override
  String get introHowYellowEdges =>
      'Obracaj górę, aż dwie krawędzie będą pasować do środków.\nTrzymaj je z tyłu i po prawej, a potem wykonaj R U R\' U R U2 R\' U.\nPowtarzaj, aż wszystkie cztery krawędzie będą pasować.';

  @override
  String get introHowYellowCorners =>
      'Róg jest na swoim miejscu, gdy jego kolory pasują do trzech ścian wokół niego.\nTrzymaj ustawiony róg z przodu po prawej.\nU R U\' L\' U R\' U\' L przestawia pozostałe trzy, aż wszystkie będą pasować.';

  @override
  String get introHowTwistCorners =>
      'Trzymaj nieułożony róg z przodu po prawej.\nPowtarzaj R\' D\' R D, aż jego żółty kolor będzie u góry.\nDo następnego obracaj tylko górę; dół naprawi się sam na końcu.';

  @override
  String get introHowCfopIntro =>
      'Cross: cztery krawędzie zaplanowane podczas inspekcji.\nF2L: każdy róg wchodzi razem ze swoją krawędzią.\nOLL robi żółtą górę, a potem PLL przenosi elementy na miejsca.';

  @override
  String get introHowF2l =>
      'Znajdź w górnej warstwie róg i pasującą do niego krawędź.\nSparuj je nad ich slotem.\nWstaw parę trzema lub czterema ruchami.';

  @override
  String get introHowOll =>
      'Najpierw żółty krzyż algorytmem F R U R\' U\' F\'.\nPotem zorientuj rogi, na przykład algorytmem Sune.\nRozpoznaj przypadek po widocznym żółtym kolorze.';

  @override
  String get introHowPll =>
      'Góra jest już cała żółta.\nT-perm zamienia rogi; U-perm przestawia cyklicznie trzy krawędzie.\nOdczytaj boczne kolory, aby wybrać algorytm.';

  @override
  String get introHowTwoFirst =>
      'Kostka 2×2 to same rogi, jak 3×3 bez krawędzi.\nPrzenieś każdy biały róg nad jego miejsce.\nPowtarzaj R U R\' U\', aż wskoczy na miejsce.';

  @override
  String get introHowTwoOll =>
      'Trzymaj białą warstwę na dole.\nSune (R U R\' U R U2 R\') skręca górne rogi.\nPowtarzaj z właściwego ustawienia, aż góra będzie cała żółta.';

  @override
  String get introHowTwoPbl =>
      'Poszukaj strony, na której dwa rogi już pasują.\nZamiana sąsiednich: jeden algorytm w stylu T-perm.\nZamiana po przekątnej: jeden dłuższy algorytm.';

  @override
  String get introHowBigIntro =>
      'Żaden środek nie jest stały: cztery elementy środka tworzą kolor każdej ściany.\nRuchy szerokie, jak Rw, obracają dwie warstwy naraz.\nRuchy wewnętrzne, jak 2R, obracają tylko jedną wewnętrzną warstwę.';

  @override
  String get introHowBigCenters =>
      'Najpierw ułóż dwa przeciwległe środki.\nWarstwy wewnętrzne zamieniają elementy środka, nie psując ułożonych.\nOstatnie cztery środki dokończ w ten sam sposób.';

  @override
  String get introHowBigEdges =>
      'Znajdź dwa elementy krawędzi o tych samych kolorach.\nUstaw je obok siebie warstwą wewnętrzną.\nOdłóż parę na bok i przywróć środki.';

  @override
  String get introHowBigParity =>
      'Układaj 4×4 jak 3×3, aż utkniesz.\nJedna odwrócona krawędź: długi algorytm parzystości OLL.\nDwie zamienione krawędzie: 2R2 U2 2R2 Uw2 2R2 Uw2.';

  @override
  String get dirFaceR => 'Prawa strona';

  @override
  String get dirFaceL => 'Lewa strona';

  @override
  String get dirFaceU => 'Górny rząd';

  @override
  String get dirFaceD => 'Dolny rząd';

  @override
  String get dirFaceF => 'Przednia ściana';

  @override
  String get dirFaceB => 'Tylna ściana';

  @override
  String get dirMiddle => 'Środkowa warstwa';

  @override
  String get dirWholeCube => 'Cała kostka';

  @override
  String dirLayerInner(int depth, String face) {
    return '$face, warstwa $depth';
  }

  @override
  String dirLayerWide(int depth, String face) {
    return '$face, $depth warstwy w głąb';
  }

  @override
  String dirLayerBlock(int near, int far, String face) {
    return '$face, warstwy $near–$far';
  }

  @override
  String get dirUp => 'W górę';

  @override
  String get dirDown => 'W dół';

  @override
  String get dirLeft => 'W lewo';

  @override
  String get dirRight => 'W prawo';

  @override
  String get dirClockwise => 'Zgodnie z ruchem wskazówek zegara';

  @override
  String get dirCounter => 'Przeciwnie do ruchu wskazówek zegara';

  @override
  String get dirBackClockwise =>
      'Zgodnie z ruchem wskazówek zegara, patrząc od tyłu';

  @override
  String get dirBackCounter =>
      'Przeciwnie do ruchu wskazówek zegara, patrząc od tyłu';

  @override
  String get dirHalf => 'Podwójny obrót (180°)';

  @override
  String moveInstruction(String layer, String direction) {
    return '$layer — $direction';
  }

  @override
  String get solveCollapse => 'Ukryj szczegóły';

  @override
  String get solveExpand => 'Pokaż szczegóły';

  @override
  String get dailyScrambleSteps => 'Scramble krok po kroku';

  @override
  String get dailyScrambleGuide => 'Przewodnik 3D po scramble\'u';

  @override
  String get dailyShowMoves => 'Pokaż ruchy w notacji';

  @override
  String get dailyHideMoves => 'Ukryj ruchy w notacji';

  @override
  String get dailyScrambleGuideTitle => 'Przewodnik po scramble\'u';

  @override
  String get phaseDailyScramble => 'Pomieszaj dzisiejszą kostkę';

  @override
  String get explainDailyScramble =>
      'Zacznij od ułożonej kostki, białym do góry i zielonym do przodu, i powtarzaj każdy ruch na prawdziwej kostce.';

  @override
  String get stageCenters => 'Ułóż bloki środków';

  @override
  String get stageEdges => 'Sparuj krawędzie zewnętrzne i wewnętrzne';

  @override
  String get stageParity => 'Rozwiązanie parzystości';

  @override
  String get stageCrown1 => 'Pierwsza korona (biała)';

  @override
  String get stageCrown2 => 'Druga korona';

  @override
  String get stageCrown3 => 'Trzecia korona (żółta)';

  @override
  String get stageOrient => 'Orientacja elementów';

  @override
  String get stageFinish => 'Dokończ kostkę';

  @override
  String get stageAsThree => 'Ułóż jak 3×3';

  @override
  String get stageTwoByTwo => 'Ułóż 2×2';

  @override
  String stageHeader(int number, int total, String title) {
    return 'Etap $number z $total: $title';
  }

  @override
  String get solveAllStagesDone => 'Wszystkie etapy ukończone. Brawo!';

  @override
  String get trackFiveByFive => '5×5 Professor\'s Cube';

  @override
  String get trackSixBySix => 'Kostka 6×6';

  @override
  String get lessonFiveIntro => 'Poznaj 5×5';

  @override
  String get lessonFiveIntroDesc =>
      'Stałe środki, belki środków, krawędzie środkowe i skrzydełka.';

  @override
  String get introGoalFiveIntro =>
      'Poznaj 5×5: stałe środki, belki środków, krawędzie środkowe i skrzydełka.';

  @override
  String get introHowFiveIntro =>
      'Sam środek każdej ściany nigdy się nie rusza.\nKażda krawędź to element środkowy i dwa skrzydełka.\nWarstwy wewnętrzne przesuwają elementy bez ruszania zewnętrza.';

  @override
  String get lessonFiveCenters => 'Środki 5×5';

  @override
  String get lessonFiveCentersDesc => 'Ułóż każdy środek z belek po trzy.';

  @override
  String get introGoalFiveCenters =>
      'Ułóż na każdej ścianie blok środków 3×3 w jednym kolorze.';

  @override
  String get introHowFiveCenters =>
      'Zacznij od środkowego elementu: on wskazuje kolor.\nUłóż belki po trzy i wsuń je warstwą wewnętrzną.\nOstatnie dwa środki dokończ razem.';

  @override
  String get lessonFiveEdges => 'Krawędzie 5×5';

  @override
  String get lessonFiveEdgesDesc =>
      'Połącz dwa skrzydełka z krawędzią środkową.';

  @override
  String get introGoalFiveEdges =>
      'Połącz każdą krawędź środkową z jej dwoma skrzydełkami, aby wszystkie 12 krawędzi wyglądało jak pojedyncze elementy.';

  @override
  String get introHowFiveEdges =>
      'Dopasuj dwa skrzydełka do ich krawędzi środkowej z przodu.\nObróć warstwę wewnętrzną, wstaw nieułożoną krawędź, obróć z powrotem.\nSparuj ostatnie krawędzie, nie psując ułożonych.';

  @override
  String get lessonFiveSolve => 'Ułóż 5×5 jak 3×3';

  @override
  String get lessonFiveSolveDesc => 'Dokończ trzema koronami.';

  @override
  String get introGoalFiveSolve =>
      'Ułóż zredukowaną 5×5 jak 3×3, korona po koronie.';

  @override
  String get introHowFiveSolve =>
      'Od teraz tylko ruchy zewnętrzne.\nPierwsza korona, druga korona, potem żółta korona.\nStałe środki wskazują kolor każdej ściany.';

  @override
  String get lessonFiveParity => 'Parzystość krawędzi 5×5';

  @override
  String get lessonFiveParityDesc =>
      'Napraw krawędź z zamienionymi skrzydełkami.';

  @override
  String get introGoalFiveParity =>
      'Napraw jedyną krawędź, której dwa skrzydełka są zamienione, a potem dokończ.';

  @override
  String get introHowFiveParity =>
      'Objawia się jako krawędź, której nie da się sparować.\nWykonaj raz długi algorytm warstw wewnętrznych.\nWszystko inne wraca na swoje miejsce.';

  @override
  String get lessonSixIntro => 'Poznaj 6×6';

  @override
  String get lessonSixIntroDesc =>
      'Brak stałych środków i cztery elementy w każdej krawędzi.';

  @override
  String get introGoalSixIntro =>
      'Poznaj 6×6: szesnaście elementów środka na ścianę i cztery elementy na krawędź.';

  @override
  String get introHowSixIntro =>
      'Żaden środek nie jest stały: kolory wybierasz podczas układania.\nKażda krawędź ma skrzydełka zewnętrzne i wewnętrzne.\nRuchy szerokie mogą przesuwać do trzech warstw.';

  @override
  String get lessonSixCenters => 'Środki 6×6';

  @override
  String get lessonSixCentersDesc => 'Ułóż środki 4×4 z belek po cztery.';

  @override
  String get introGoalSixCenters =>
      'Ułóż na każdej ścianie blok środków 4×4 w jednolitym kolorze.';

  @override
  String get introHowSixCenters =>
      'Najpierw ułóż dwa przeciwległe środki.\nUłóż belki po cztery i zsuń je razem.\nPojedyncze elementy przenoś sztuczką: warstwa, góra, cofnięcie.';

  @override
  String get lessonSixEdges => 'Krawędzie 6×6';

  @override
  String get lessonSixEdgesDesc => 'Zbierz cztery elementy każdej krawędzi.';

  @override
  String get introGoalSixEdges =>
      'Zbierz cztery elementy każdej krawędzi, aby 6×6 miała 12 czystych krawędzi.';

  @override
  String get introHowSixEdges =>
      'Ustaw skrzydełka zewnętrzne i wewnętrzne w linii z przodu.\nGłęboka szeroka warstwa wprowadza i wyprowadza krawędź.\nUłożone krawędzie nigdy nie są psute.';

  @override
  String get lessonSixSolve => 'Ułóż 6×6 jak 3×3';

  @override
  String get lessonSixSolveDesc => 'Dokończ trzema koronami.';

  @override
  String get introGoalSixSolve =>
      'Ułóż zredukowaną 6×6 jak 3×3, korona po koronie.';

  @override
  String get introHowSixSolve =>
      'Od teraz tylko ruchy zewnętrzne.\nUłożone środki wskazują kolor każdej ściany.\nPierwsza korona, druga korona, potem żółta korona.';

  @override
  String get lessonSixParity => 'Parzystość 6×6';

  @override
  String get lessonSixParityDesc =>
      'Jedna odwrócona krawędź lub dwie zamienione krawędzie.';

  @override
  String get introGoalSixParity =>
      'Napraw dwa przypadki 6×6, których 3×3 nigdy nie ma: jedną odwróconą krawędź lub dwie zamienione krawędzie.';

  @override
  String get introHowSixParity =>
      'Układaj jak 3×3, aż utkniesz.\nJedna odwrócona krawędź: długi algorytm parzystości.\nDwie zamienione krawędzie: krótki algorytm z podwójnymi obrotami.';

  @override
  String get stepFivePieces => 'Elementy 5×5';

  @override
  String get stepFivePiecesBody =>
      'Sam środkowy element każdej ściany nigdy się nie rusza, więc nadal wskazuje kolor ściany, jak na 3×3. Wokół niego jest jeszcze osiem elementów środka; każda krawędź ma element środkowy i dwa skrzydełka, a rogi działają jak na 3×3.';

  @override
  String get stepFiveSlices => 'Trzy rodzaje ruchów';

  @override
  String get stepFiveSlicesBody =>
      'Ruchy zewnętrzne obracają jedną ścianę. Ruchy szerokie obracają ścianę razem z warstwą za nią. Ruchy wewnętrzne obracają tylko warstwę w środku: tak elementy zmieniają miejsce bez ruszania zewnętrza.';

  @override
  String get stepFiveCenterBar => 'Belki środków';

  @override
  String get stepFiveCenterBarBody =>
      'Ułóż rząd trzech pasujących elementów środka, a potem wsuń go obok pasującego środka ruchem warstwy wewnętrznej. Trzy belki tworzą gotowy środek.';

  @override
  String get stepFiveCenterSwap => 'Zamiana bez psucia';

  @override
  String get stepFiveCenterSwapBody =>
      'Aby przenieść pojedynczy element środka: obróć warstwę wewnętrzną, obróć górę, cofnij warstwę, obróć górę z powrotem. Ułożone środki za każdym razem wracają.';

  @override
  String get stepFiveEdgePair => 'Sparuj skrzydełka z krawędzią środkową';

  @override
  String get stepFiveEdgePairBody =>
      'Ustaw dwa skrzydełka obok pasującej krawędzi środkowej z przodu, obróć warstwę wewnętrzną w dół, wprowadź z góry nieułożoną krawędź, a potem obróć warstwę wewnętrzną z powrotem.';

  @override
  String get stepFiveEdgeLast => 'Ostatnie krawędzie';

  @override
  String get stepFiveEdgeLastBody =>
      'Gdy zostało tylko kilka krawędzi, ruch szeroki, krótka sekwencja i ruch szeroki z powrotem parują je bez psucia ułożonych krawędzi.';

  @override
  String get stepFiveAsThree => 'Teraz to 3×3';

  @override
  String get stepFiveAsThreeBody =>
      'Gdy środki i krawędzie są gotowe, 5×5 zachowuje się jak duża 3×3. Używaj tylko ruchów zewnętrznych i podążaj za trzema koronami: biały krzyż i rogi, środkowa warstwa, potem żółta warstwa.';

  @override
  String get stepFiveEdgeParity => 'Zamień skrzydełka ostatniej krawędzi';

  @override
  String get stepFiveEdgeParityBody =>
      'Czasem ostatnia krawędź ma zamienione skrzydełka. Dłuższy algorytm warstw wewnętrznych zamienia je z powrotem, a wszystko inne wraca na miejsce. Potem dokończ jak 3×3.';

  @override
  String get stepSixPieces => 'Elementy 6×6';

  @override
  String get stepSixPiecesBody =>
      'Jak 4×4, kostka 6×6 nie ma stałego środka: szesnaście elementów środka tworzy kolor każdej ściany. Każda krawędź ma cztery elementy: dwa skrzydełka zewnętrzne i dwa wewnętrzne.';

  @override
  String get stepSixSlices => 'Obracanie głębszych warstw';

  @override
  String get stepSixSlicesBody =>
      'Ruchy szerokie mogą obracać dwie lub trzy warstwy od ściany. Warstwy wewnętrzne na drugim lub trzecim poziomie to narzędzia do środków i krawędzi.';

  @override
  String get stepSixCenterBar => 'Belki po cztery';

  @override
  String get stepSixCenterBarBody =>
      'Ułóż rzędy czterech pasujących elementów środka i zsuwaj je obok siebie ruchami warstw wewnętrznych, aż ściana będzie jednolita.';

  @override
  String get stepSixCenterSwap => 'Przenoś po jednym elemencie';

  @override
  String get stepSixCenterSwapBody =>
      'Obróć trzecią warstwę, obróć górę, cofnij, obróć z powrotem: jeden element środka się przesuwa, a ułożone środki wracają.';

  @override
  String get stepSixEdgePair => 'Cztery elementy, jedna krawędź';

  @override
  String get stepSixEdgePairBody =>
      'Zbierz z przodu cztery elementy krawędzi głęboką szeroką warstwą, potem wprowadź nieułożoną krawędź i obróć szeroką warstwę z powrotem.';

  @override
  String get stepSixEdgeLast => 'Ostatnie krawędzie';

  @override
  String get stepSixEdgeLastBody =>
      'Sparuj ostatnie krawędzie krótką sekwencją między głębokim ruchem szerokim a jego cofnięciem, aby ułożone krawędzie pozostały sparowane.';

  @override
  String get stepSixAsThree => 'Teraz to 3×3';

  @override
  String get stepSixAsThreeBody =>
      'Mając środki 4×4 i sparowane krawędzie, ułóż 6×6 jak 3×3 ruchami zewnętrznymi i trzema koronami.';

  @override
  String get stepSixOllParity => 'Jedna odwrócona krawędź';

  @override
  String get stepSixOllParityBody =>
      'Jeśli podczas układania ostatniej warstwy pojedyncza krawędź wydaje się odwrócona, to parzystość. Trzymaj ją z przodu górnej warstwy i wykonaj długi algorytm: dwie pierwsze korony wrócą nienaruszone.';

  @override
  String get stepSixPllParity => 'Dwie zamienione krawędzie';

  @override
  String get stepSixPllParityBody =>
      'Jeśli na samym końcu dwie krawędzie wyglądają na zamienione, trzymaj je z przodu i z tyłu górnej warstwy i wykonaj krótki algorytm z podwójnymi obrotami warstw wewnętrznych.';

  @override
  String get stageTwoFirstLayer => 'Ułóż dolną warstwę';

  @override
  String get stageTwoTopColor => 'Zrób górę w jednym kolorze';

  @override
  String get stageTwoFinish => 'Dokończ rogi';

  @override
  String get explainTwoFirstLayer =>
      'Dokończ dolną warstwę: jej cztery rogi pasują do siebie i do kolorów bocznych.';

  @override
  String get explainTwoTopColor =>
      'Obracaj górę, aż wszystkie cztery górne naklejki będą w tym samym kolorze, zachowując dolną warstwę.';

  @override
  String get explainTwoFinish =>
      'Przenieś ostatnie rogi na miejsca, aby dokończyć kostkę.';

  @override
  String get tabSolve => 'Układaj';

  @override
  String get tabScan => 'Skanuj';

  @override
  String get tabAcademy => 'Akademia';

  @override
  String get tabTrain => 'Trening';

  @override
  String get openCubeSolver => 'Otwórz kostkę 3D i solver';

  @override
  String progressFraction(int done, int total) {
    return '$done/$total';
  }

  @override
  String get trainTitle => 'Trening';

  @override
  String get trainSubtitle => 'Szlifuj umiejętności każdego dnia.';

  @override
  String get settings => 'Ustawienia';

  @override
  String get settingsSoundHaptics => 'Dźwięk i wibracje';

  @override
  String get settingsSoundHapticsDesc =>
      'Kliknięcia i wibracje przy obracaniu kostki.';

  @override
  String get settingsAnimationSpeed => 'Domyślna prędkość animacji';

  @override
  String get settingsAnimationSpeedDesc =>
      'Jak szybko kostka się obraca podczas odtwarzania ruchów.';

  @override
  String get settingsResetProgress => 'Resetuj postępy';

  @override
  String get settingsResetProgressDesc =>
      'Usuń ukończone lekcje Akademii i dzienną serię.';

  @override
  String get resetProgressTitle => 'Zresetować wszystkie postępy?';

  @override
  String get resetProgressBody =>
      'Ukończone lekcje i dzienna seria zostaną usunięte. Tej operacji nie można cofnąć.';

  @override
  String get resetProgressDone => 'Postępy zresetowane.';

  @override
  String get cancel => 'Anuluj';

  @override
  String get settingsPrivacyAds => 'Prywatność i reklamy';

  @override
  String get settingsPrivacyAdsDesc =>
      'Przejrzyj lub zmień zgody dotyczące reklam.';

  @override
  String get playbackPrevious => 'Wstecz';

  @override
  String get playbackNext => 'Dalej';

  @override
  String fastSolveMoves(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ułożona w $count ruchach!',
      one: 'Ułożona w 1 ruchu!',
    );
    return '$_temp0';
  }

  @override
  String get feedbackTitle => 'Współtwórz następną wersję';

  @override
  String get feedbackBody =>
      'Chcesz zaproponować funkcję lub mieć wpływ na następną wersję CubeMentor? Napisz do nas na adres:';

  @override
  String get feedbackEmailCopied =>
      'Nie znaleziono aplikacji pocztowej, więc skopiowaliśmy adres do schowka.';

  @override
  String get adWatchToUnlock => 'Obejrzyj reklamę';

  @override
  String get adLoading => 'Wczytywanie krótkiego filmu…';

  @override
  String get adRewardNotEarned => 'Obejrzyj cały film, aby odblokować.';

  @override
  String get adUnavailableFreePass =>
      'Brak dostępnego filmu — tym razem odblokowano za darmo.';

  @override
  String get settingsPrivacyAdsError =>
      'Nie udało się otworzyć opcji prywatności. Spróbuj ponownie później.';

  @override
  String get nicknamePromptTitle => 'Jak mamy się do ciebie zwracać?';

  @override
  String get nicknamePromptBody =>
      'Będziemy kibicować ci po imieniu za każdym razem, gdy ułożysz kostkę.';

  @override
  String get nicknameHint => 'Twoje imię lub pseudonim';

  @override
  String get nicknameSave => 'Zapisz';

  @override
  String get settingsNickname => 'Twoje imię';

  @override
  String get settingsNicknameNotSet => 'Nie ustawiono — stuknij, aby dodać';

  @override
  String celebrateNamed(String name) {
    return 'Brawo, $name!';
  }

  @override
  String get celebrateAnon => 'Brawo!';

  @override
  String get celebrateCubeSolved => 'Kostka ułożona!';

  @override
  String get celebrateDailyDone => 'Wyzwanie dnia ukończone!';

  @override
  String fastSolveRatio(int count, int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$count / $limit ruchu',
      many: '$count / $limit ruchów',
      few: '$count / $limit ruchy',
      one: '$count / 1 ruch',
    );
    return '$_temp0';
  }

  @override
  String fastSolveRatioTooltip(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Każdy scramble da się ułożyć w $limit ruchu lub mniej',
      many: 'Każdy scramble da się ułożyć w $limit ruchach lub mniej',
      few: 'Każdy scramble da się ułożyć w $limit ruchach lub mniej',
      one: 'Każdy scramble da się ułożyć w 1 ruchu lub mniej',
    );
    return '$_temp0';
  }

  @override
  String get patternsWatchVideo => 'Obejrzyj film';

  @override
  String get patternsNotNow => 'Nie teraz';

  @override
  String get settingsColorScheme => 'Schemat kolorów kostki';

  @override
  String get colorSchemeWestern => 'Zachodni';

  @override
  String get colorSchemeJapanese => 'Japoński';

  @override
  String get colorSchemeWesternDesc =>
      'Biały naprzeciw żółtego, niebieski naprzeciw zielonego';

  @override
  String get colorSchemeJapaneseDesc =>
      'Biały naprzeciw niebieskiego, żółty naprzeciw zielonego';

  @override
  String dailyYourTime(String time) {
    return 'Twój czas: $time';
  }

  @override
  String timerInspectIntro(int seconds) {
    return 'Masz $seconds sekund na obejrzenie kostki. Stuknij, aby rozpocząć odliczanie.';
  }

  @override
  String get timerInspectTapReady =>
      'Stuknij, gdy będziesz gotów zacząć układać';

  @override
  String timerInspectPlus2(int seconds) {
    return 'Inspekcja przekroczyła $seconds s, więc zegar ruszył sam: kara +2 s';
  }

  @override
  String timerAvgOf(int count) {
    return 'Średnia z $count';
  }

  @override
  String get timerAvgNote => 'Średnie pomijają najlepszy i najgorszy czas';

  @override
  String get timerPbSub => 'Najlepszy czas';

  @override
  String get timerPlus2Caption => 'Kara +2 s';

  @override
  String get timerDnfCaption => 'Nieukończone (DNF)';

  @override
  String get timerDeleteCaption => 'Usuń to ułożenie';

  @override
  String get patternBullsEye => 'Tarcza';

  @override
  String get patternFramedCenter => 'Środek w ramce';

  @override
  String get patternBlockCheckerboard => 'Szachownica z bloków';

  @override
  String get patternCubeInCubeInCube => 'Kostka w kostce w kostce';

  @override
  String get patternUnionJack => 'Union Jack';

  @override
  String get patternKilt => 'Kilt';

  @override
  String get patternSixTs => 'Sześć liter T';

  @override
  String get patternTwinPeaks => 'Bliźniacze szczyty';

  @override
  String get patternSpiral => 'Spirala';

  @override
  String get patternTetris => 'Tetris';

  @override
  String get patternSpots => 'Kropki w środku';

  @override
  String get patternStripes => 'Paski';

  @override
  String get patternAnaconda => 'Anakonda';

  @override
  String get patternZigzag => 'Zygzak';

  @override
  String get patternFourSpots => 'Cztery kropki';

  @override
  String get patternGreenMamba => 'Zielona mamba';

  @override
  String get patternPlusMinus => 'Plus minus';

  @override
  String guideStepCounter(int current, int total) {
    return 'Krok $current / $total';
  }

  @override
  String guideMoveCounter(int current, int total) {
    return 'Ruch $current / $total';
  }

  @override
  String fastMoveCounter(int current, int total) {
    return 'Ruch $current / $total';
  }

  @override
  String get dailyStep1Title => 'Krok 1: Pomieszaj kostkę';

  @override
  String get dailyStep2Title => 'Krok 2: Ułóż kostkę';

  @override
  String dailyPersonalBest(String time) {
    return 'Rekord osobisty: $time';
  }

  @override
  String get dailyRecentDays => 'Ostatnie dni';

  @override
  String dailyMilestone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seria $count dnia! Jesteś w formie!',
      many: 'Seria $count dni! Jesteś w formie!',
      few: 'Seria $count dni! Jesteś w formie!',
      one: 'Seria $count dnia! Jesteś w formie!',
    );
    return '$_temp0';
  }

  @override
  String get dailyScrambledTitle => 'Kostka pomieszana! Teraz ją ułóż';

  @override
  String get dailyCongratsTitle => 'Gratulacje!';

  @override
  String dailyCongratsBody(String time) {
    return 'Ułożono dzisiejsze wyzwanie w $time.';
  }

  @override
  String get dailyCongratsDone => 'Wróć do wyzwania';

  @override
  String patternsSizeChip(String size, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wzoru',
      many: '$count wzorów',
      few: '$count wzory',
      one: '1 wzór',
    );
    return '$size • $_temp0';
  }

  @override
  String unlockHoursLeft(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Zostało $hours godziny',
      many: 'Zostało $hours godzin',
      few: 'Zostały $hours godziny',
      one: 'Została 1 godzina',
    );
    return '$_temp0';
  }

  @override
  String unlockMinutesLeft(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Zostało $minutes minuty',
      many: 'Zostało $minutes minut',
      few: 'Zostały $minutes minuty',
      one: 'Została 1 minuta',
    );
    return '$_temp0';
  }

  @override
  String get lockedLabel => 'Zablokowane';

  @override
  String get unlockedLabel => 'Odblokowane';

  @override
  String patternUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Obejrzyj 1 krótki film, aby odblokować ten wzór i jego instrukcję krok po kroku na $hours godziny.',
      many:
          'Obejrzyj 1 krótki film, aby odblokować ten wzór i jego instrukcję krok po kroku na $hours godzin.',
      few:
          'Obejrzyj 1 krótki film, aby odblokować ten wzór i jego instrukcję krok po kroku na $hours godziny.',
      one: 'Obejrzyj 1 krótki film, aby odblokować ten wzór i jego instrukcję krok po kroku na 1 godzinę.',
    );
    return '$_temp0';
  }

  @override
  String lessonUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Obejrzyj 1 krótki film, aby przez następne $hours godziny otwierać tę lekcję, ile razy chcesz.',
      many:
          'Obejrzyj 1 krótki film, aby przez następne $hours godzin otwierać tę lekcję, ile razy chcesz.',
      few:
          'Obejrzyj 1 krótki film, aby przez następne $hours godziny otwierać tę lekcję, ile razy chcesz.',
      one: 'Obejrzyj 1 krótki film, aby przez następną godzinę otwierać tę lekcję, ile razy chcesz.',
    );
    return '$_temp0';
  }

  @override
  String get bigCubeUnlockTitle => 'Układanie dużych kostek';

  @override
  String bigCubeUnlockBody(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other:
          'Darmowe ułożenie kostki 4×4–6×6 zostało już wykorzystane. Obejrzyj 1 krótki film, aby układać duże kostki przez następne $hours godziny.',
      many:
          'Darmowe ułożenie kostki 4×4–6×6 zostało już wykorzystane. Obejrzyj 1 krótki film, aby układać duże kostki przez następne $hours godzin.',
      few:
          'Darmowe ułożenie kostki 4×4–6×6 zostało już wykorzystane. Obejrzyj 1 krótki film, aby układać duże kostki przez następne $hours godziny.',
      one: 'Darmowe ułożenie kostki 4×4–6×6 zostało już wykorzystane. Obejrzyj 1 krótki film, aby układać duże kostki przez następną godzinę.',
    );
    return '$_temp0';
  }

  @override
  String get doubleTurnBadge => 'Podwójny obrót · 180°';

  @override
  String get homeAcademy => 'Akademia';

  @override
  String get homePatterns => 'Fajne wzory';

  @override
  String get homePractice => 'Stoper i wyzwanie dnia';

  @override
  String get scanChoiceSubtitle => 'Jak chcesz zacząć?';

  @override
  String get scanChoiceCamera => 'Skanuj aparatem';

  @override
  String get scanChoiceCameraDesc =>
      'Pokaż aparatowi każdą ścianę i otrzymaj rozwiązanie.';

  @override
  String get scanChoice3d => 'Otwórz kostkę 3D';

  @override
  String get scanChoice3dDesc =>
      'Obracaj wirtualną kostkę, pomieszaj ją i ułóż krok po kroku.';

  @override
  String get academyAllSizes => 'Wszystkie rozmiary';

  @override
  String homeAcademyProgress(int done, int total) {
    return 'Ukończone lekcje: $done / $total';
  }

  @override
  String academySizeProgress(String size, int done, int total) {
    return '$size • ukończono $done / $total';
  }

  @override
  String get lessonStageConcept => 'Idea';

  @override
  String get lessonStageExamples => 'Przykłady';

  @override
  String get lessonStagePractice => 'Praktyka';

  @override
  String get lessonStageNext => 'Dalej / sam';

  @override
  String lessonStageOf(int index, int total, String name) {
    return 'Etap $index z $total: $name';
  }

  @override
  String lessonExampleOf(int index, int total) {
    return 'Przykład $index z $total';
  }

  @override
  String lessonWalkthroughOf(int index, int total) {
    return 'Ćwiczenie $index z $total';
  }

  @override
  String get lessonBonusCase => 'Przypadek bonusowy';

  @override
  String get lessonPracticeIntro =>
      'Prawdziwe pomieszanie: ułożone są tylko wcześniejsze kroki. Dokończ cały ten krok, wskazówka po wskazówce.';

  @override
  String lessonContinueDesc(String lesson) {
    return 'Przejdź od razu do: $lesson.';
  }

  @override
  String get lessonFreePractice => 'Swobodny trening';

  @override
  String get lessonFreePracticeDesc =>
      'Ułóż samodzielnie pomieszaną kostkę 3D, od początku aż do tego kroku.';

  @override
  String freePracticeBanner(String topic) {
    return 'Ćwicz swobodnie: ułóż kostkę od początku aż do kroku $topic!';
  }

  @override
  String get pieceColorSeparator => '-';

  @override
  String cueFaceTurn(String face) {
    return 'Obróć ścianę ze środkiem w kolorze: $face, tak jak pokazuje strzałka. Środek zostaje na miejscu, ruszają się tylko elementy wokół niego.';
  }

  @override
  String cueTrigger(String front) {
    return 'Ruch prawej ręki, kolor $front przodem do ciebie: prawa ściana w górę, góra w lewo, prawa ściana w dół, góra z powrotem w prawo.';
  }

  @override
  String get cueTriggerBack =>
      'Szósty ruch z rzędu przywraca kostkę dokładnie do stanu wyjściowego. Sześć to magiczna liczba!';

  @override
  String cueSliceInner(String face) {
    return 'Obróć tylko wewnętrzną warstwę obok ściany w kolorze: $face. Sama ściana stoi w miejscu, więc środki się rozdzielają.';
  }

  @override
  String cueSliceWide(String face) {
    return 'Szeroki obrót: ściana w kolorze $face i sąsiednia warstwa wewnętrzna obracają się razem, jak jedna gruba warstwa.';
  }

  @override
  String cueTurnCube(String top, String front) {
    return 'Obróć całą kostkę tak, aby środek w kolorze $top był na górze, a środek w kolorze $front przodem do ciebie.';
  }

  @override
  String get cueTurnTop =>
      'Obróć tylko górną warstwę, jak pokazuje strzałka, aby przygotować następny algorytm.';

  @override
  String get cueAlignTop =>
      'Ostatni ruch: obróć górną warstwę, aby wyrównać kolory. Gotowe!';

  @override
  String cueCrossTop(String piece, String center) {
    return 'Krawędź w kolorach $piece jest w górnej warstwie. Obracaj górę, aż znajdzie się tuż nad środkiem w kolorze $center, potem obróć tę ścianę dwa razy, aby ją opuścić.';
  }

  @override
  String cueCrossMiddle(String piece, String center) {
    return 'Krawędź w kolorach $piece utknęła w środkowej warstwie. Podnieś ją na górę, ustaw nad środkiem w kolorze $center i opuść.';
  }

  @override
  String cueCrossFlipped(String piece, String center) {
    return 'Krawędź w kolorach $piece jest na swoim miejscu, ale odwrócona: biały patrzy w bok. Wyjmij ją i włóż z powrotem obok środka w kolorze $center właściwą stroną.';
  }

  @override
  String cueCrossBottom(String piece, String center) {
    return 'W stylu CFOP można obracać też dół. Wstaw krawędź w kolorach $piece i obróć dół, aby zgrała się ze środkiem w kolorze $center.';
  }

  @override
  String cueCornerTop(String piece, String a, String b) {
    return 'Obracaj górę, aż róg w kolorach $piece będzie tuż nad swoim miejscem, między stronami w kolorach $a i $b. Powtarzaj ruch prawej ręki, aż wskoczy, prawidłowo obrócony.';
  }

  @override
  String cueCornerTwisted(String piece) {
    return 'Róg w kolorach $piece jest na swoim miejscu, ale skręcony. Jeden ruch go wyjmuje (na jego miejsce wchodzi żółty róg); powtarzaj, aż wróci prawidłowo.';
  }

  @override
  String cueMiddleRight(String piece, String a, String b) {
    return 'Obracaj górę, aż krawędź w kolorach $piece zgra się ze środkiem w kolorze $a, potem wyślij ją w dół w prawo, do slotu między $a a $b.';
  }

  @override
  String cueMiddleLeft(String piece, String a, String b) {
    return 'Obracaj górę, aż krawędź w kolorach $piece zgra się ze środkiem w kolorze $a, potem wyślij ją w dół w lewo, do slotu między $a a $b.';
  }

  @override
  String cueMiddleFlipped(String piece, String a, String b) {
    return 'Krawędź w kolorach $piece jest w swoim slocie, ale odwrócona. Wstaw tam żółtą krawędź, aby ją wypchnąć, a potem wstaw ją ponownie między $a a $b.';
  }

  @override
  String cueYellowLine(String front) {
    return 'Żółta linia: obróć górę tak, aby biegła od lewej do prawej, trzymaj kolor $front przodem do siebie i wykonaj algorytm żółtego krzyża.';
  }

  @override
  String cueYellowL(String front) {
    return 'Żółte L: obróć górę tak, aby L wskazywało do tyłu w lewo, trzymaj kolor $front przodem do siebie i wykonaj algorytm. Powstanie linia.';
  }

  @override
  String cueYellowDot(String front) {
    return 'Żółty jest tylko środek: kropka. Wykonaj algorytm raz, z kolorem $front przodem do siebie, aby dostać L.';
  }

  @override
  String cueEdgesMatch(String piece, String center) {
    return 'Obracaj górę, aż krawędź w kolorach $piece zgra się ze środkiem w kolorze $center.';
  }

  @override
  String cueEdgesSwap(String front) {
    return 'Dwie pasujące krawędzie są z tyłu i po prawej. Z kolorem $front przodem do siebie wykonaj zamianę: przednia i lewa krawędź zamieniają się miejscami.';
  }

  @override
  String cueEdgesOpposite(String front) {
    return 'Pasujące krawędzie są naprzeciw siebie. Wykonaj zamianę raz, z kolorem $front przodem do siebie; potem będą pasować dwie sąsiednie.';
  }

  @override
  String cueCornersCycle(String piece, String front) {
    return 'Róg w kolorach $piece jest już na swoim miejscu. Trzymaj go z przodu po prawej, kolor $front przodem do siebie, i przestaw cyklicznie pozostałe trzy rogi.';
  }

  @override
  String cueCornersNone(String front) {
    return 'Żaden żółty róg nie jest jeszcze na miejscu. Wykonaj cykl raz, z kolorem $front przodem do siebie; potem jeden róg będzie na miejscu.';
  }

  @override
  String cueTwistCorner(String piece) {
    return 'Skręć róg w kolorach $piece z przodu po prawej: powtarzaj dolny ruch, aż jego żółty będzie na górze. Dolne warstwy na razie wyglądają na pomieszane — to normalne!';
  }

  @override
  String cueTwistFour(String piece) {
    return 'Róg w kolorach $piece potrzebuje tym razem czterech ruchów. Kontynuuj: żółty zawsze wychodzi na górę po dwóch lub czterech.';
  }

  @override
  String get cueTwistNext =>
      'Obróć tylko górną warstwę, aby przenieść następny skręcony róg na przód po prawej. Nie obracaj teraz całej kostki!';

  @override
  String cueF2lPair(String piece, String edge, String a, String b) {
    return 'Połącz róg w kolorach $piece z krawędzią w kolorach $edge na górze, potem wstaw parę do slotu między $a a $b.';
  }

  @override
  String cueF2lStuck(String piece) {
    return 'Róg w kolorach $piece utknął w swoim slocie z niewłaściwą krawędzią. Najpierw wyjmij go na górę, potem połącz w parę i wstaw.';
  }

  @override
  String cueOllSune(String front) {
    return 'Z kolorem $front przodem do siebie wykonaj Sune, aby obrócić żółte rogi do góry.';
  }

  @override
  String cueOllSuneAgain(String front) {
    return 'Tym razem jedno Sune nie wystarczyło. Obróć górę i wykonaj Sune jeszcze raz, z kolorem $front przodem do siebie.';
  }

  @override
  String cuePllCorners(String front) {
    return 'Dwa rogi trzeba zamienić. Trzymaj pasującą parę („reflektory”) po lewej, kolor $front przodem do siebie, i wykonaj T-perm.';
  }

  @override
  String cuePllEdges(String piece) {
    return 'Rogi są gotowe. Trzymaj krawędź w kolorach $piece z tyłu i przestaw cyklicznie pozostałe trzy krawędzie za pomocą U-perm.';
  }

  @override
  String get cuePllNoEdge =>
      'Żadna górna krawędź nie pasuje jeszcze do swojego środka. Wykonaj U-perm raz z dowolnej strony; potem jedna będzie pasować.';

  @override
  String cueTwoSwapAdjacent(String front) {
    return 'Dwa sąsiednie górne rogi trzeba zamienić. Trzymaj pasującą parę po lewej, kolor $front przodem do siebie, i wykonaj zamianę.';
  }

  @override
  String cueTwoSwapDiagonal(String front) {
    return 'Dwa rogi do zamiany są po przekątnej. Wykonaj zamianę po przekątnej z kolorem $front przodem do siebie.';
  }

  @override
  String cueCenterCycle(String color) {
    return 'Przenieś zabłąkany element środka w kolorze $color na miejsce 3-cyklem środków: warstwa, góra, warstwa, a potem wszystko z powrotem.';
  }

  @override
  String cueCenterBar(String color) {
    return 'Cały pasek elementów środka w kolorze $color jest na złej ścianie. Podnieś go wewnętrzną warstwą, obróć górę i odstaw go na miejsce.';
  }

  @override
  String cueEdgePair(String piece) {
    return 'Połącz dwa elementy krawędzi w kolorach $piece: ustaw je w linii, obróć warstwę, wstaw niepołączoną krawędź ruchami prawej ręki i cofnij warstwę.';
  }

  @override
  String cueEdgeLast(String piece) {
    return 'Ostatnie krawędzie: połącz krawędź w kolorach $piece algorytmem dwóch ostatnich krawędzi, który zachowuje wszystkie gotowe krawędzie.';
  }

  @override
  String cueParityOll(String front) {
    return 'Parzystość OLL: jedna górna krawędź jest odwrócona, co na 3×3 nigdy się nie zdarza. Trzymaj ją z przodu, kolor $front przodem do siebie, i wykonaj poprawkę parzystości.';
  }

  @override
  String get cueParityPll =>
      'Parzystość PLL: dwie górne krawędzie są zamienione, co na 3×3 nigdy się nie zdarza. Trzymaj je z przodu i z tyłu i wykonaj zamianę parzystości.';

  @override
  String cueParityFive(String front) {
    return 'Parzystość krawędzi: dwa zewnętrzne elementy jednej krawędzi są zamienione. Obróć tę krawędź do przodu, kolor $front przodem do siebie, popraw i obróć z powrotem.';
  }

  @override
  String get onboardingSkip => 'Pomiń';

  @override
  String get onboardingNext => 'Dalej';

  @override
  String get onboardingStart => 'Zaczynamy';

  @override
  String get onboardingWhatTitle => 'Twój kostkowy towarzysz';

  @override
  String get onboardingWhatBody =>
      'CubeMentor pomaga układać, poznawać i ćwiczyć każdą kostkę od 2×2 do 6×6 — całkowicie offline.';

  @override
  String get onboardingScanTitle => 'Skanuj i układaj w kilka sekund';

  @override
  String get onboardingScanBody =>
      'Pokaż aparatowi każdą ścianę (albo wpisz kolory) i podążaj za rozwiązaniem 3D ruch po ruchu.';

  @override
  String get onboardingLearnTitle => 'Ucz się i baw';

  @override
  String get onboardingLearnBody =>
      'Opanuj metodę trzech koron w Akademii, a potem swobodnie kręć, mieszaj i układaj na placu zabaw 3D.';

  @override
  String get scanChoiceManualDesc =>
      'Wpisz kolory każdej ściany, naklejka po naklejce.';

  @override
  String get scanTryAgain => 'Spróbuj ponownie';

  @override
  String get scanEditManually => 'Popraw kolory ręcznie';

  @override
  String get scanLightingHint =>
      'Ustaw ścianę na środku siatki. Użyj jasnego, równego światła i unikaj odblasków.';

  @override
  String get crownExplain =>
      'Korona to jedna pozioma warstwa kostki: pierwsza korona to biała warstwa na dole, druga to środkowa warstwa, a trzecia to żółta warstwa na górze.';

  @override
  String get lessonObjectiveHeading => 'Cel lekcji';

  @override
  String get dirRowTop => 'Górny rząd przedniej ściany';

  @override
  String get dirRowBottom => 'Dolny rząd przedniej ściany';

  @override
  String get dirColumnRight => 'Prawa kolumna przedniej ściany';

  @override
  String get dirColumnLeft => 'Lewa kolumna przedniej ściany';

  @override
  String get solveChoiceTitle => 'Jak chcesz ją ułożyć?';

  @override
  String get solveChoiceFastDesc => 'Najkrótsze rozwiązanie, ruch po ruchu.';

  @override
  String get solveChoiceGuidedDesc =>
      'Poznaj metodę trzech koron krok po kroku.';

  @override
  String get guidedSolvedTitle => 'Ułożona!';

  @override
  String get guidedSolvedBody => 'Wszystkie kroki za Tobą — kostka ułożona.';

  @override
  String get solveAgain => 'Ułóż ponownie';

  @override
  String get backToHome => 'Wróć do ekranu głównego';

  @override
  String get dailyStatTime => 'Dzisiejszy czas';

  @override
  String get dailyStatBest => 'Rekord osobisty';

  @override
  String get dailyStatStreak => 'Obecna seria';

  @override
  String get dailyStatBestStreak => 'Najdłuższa seria';

  @override
  String get privacyPolicyTitle => 'Polityka prywatności';

  @override
  String get settingsPrivacyPolicyDesc =>
      'Co zapisuje CubeMentor i z czego korzystają reklamy.';

  @override
  String get privacyIntro =>
      'CubeMentor działa bez konta i bez własnych serwerów. Ta strona wyjaśnia, co zostaje na Twoim urządzeniu i z czego korzysta nasz partner reklamowy.';

  @override
  String get privacyDataTitle => 'Twoje dane zostają na urządzeniu';

  @override
  String get privacyDataBody =>
      'Język, ustawienia, postępy w lekcjach, czasy ułożeń i dzienna seria są zapisywane tylko na tym urządzeniu. Nie mamy serwerów, więc nigdy ich nie otrzymujemy. Odinstalowanie aplikacji je usuwa.';

  @override
  String get privacyCameraTitle => 'Aparat';

  @override
  String get privacyCameraBody =>
      'Aparat jest używany tylko podczas skanowania kostki. Klatki są analizowane na urządzeniu, aby odczytać kolory naklejek; żadne zdjęcie ani film nie jest zapisywane ani wysyłane.';

  @override
  String get privacyAdsTitle => 'Reklamy';

  @override
  String get privacyAdsBody =>
      'Aplikacja wyświetla reklamy Google AdMob. Google może używać identyfikatorów urządzenia i danych o interakcjach z reklamami, aby je wyświetlać i mierzyć, zgodnie z polityką prywatności Google. Tam, gdzie wymaga tego prawo, najpierw prosimy o zgodę, którą możesz zmienić w Ustawieniach.';

  @override
  String get privacyContactTitle => 'Kontakt';

  @override
  String privacyContactBody(String email) {
    return 'Pytania o prywatność? Napisz do nas: $email.';
  }
}
