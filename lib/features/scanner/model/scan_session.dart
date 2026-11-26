import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/cube/color_scheme.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/cube/facelets.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/vision/color_science.dart';
import '../../../core/vision/scan_analyzer.dart';

/// Facelet face indices (URFDLB order of the native format).
const int kFaceU = 0;
const int kFaceR = 1;
const int kFaceF = 2;
const int kFaceD = 3;
const int kFaceL = 4;
const int kFaceB = 5;

/// Order in which the faces are scanned: around the cube with the same face
/// on top, then the top and the bottom. Each face is then seen exactly as
/// the facelet format lays it out (sides with U up, U with B up, D with F
/// up).
const List<int> kScanOrder = [kFaceF, kFaceR, kFaceB, kFaceL, kFaceU, kFaceD];

enum ScanPhase {
  /// Pointing the camera at one face after another.
  capture,

  /// Checking and fixing the stickers on the cube net.
  review,
}

@immutable
class ScanSession {
  const ScanSession({
    required this.size,
    required this.phase,
    required this.face,
    this.turnFrom,
    this.samples = const {},
    this.stickers = const [],
    this.confidence,
    this.edited = const {},
    this.analysis,
    this.manual = false,
  });

  final int size;
  final ScanPhase phase;

  /// Face being captured (facelet face index).
  final int face;

  /// Face that was just captured: the user turns the cube from it to
  /// [face]. Null at the start and when a face is picked for a rescan (the
  /// cube may be held any way then).
  final int? turnFrom;

  /// Raw camera samples per captured face, row-major.
  final Map<int, List<Rgb>> samples;

  /// Current sticker colors (facelet order) once classified or entered.
  final List<StickerColor> stickers;

  /// Classifier confidence per sticker (null for manual entry).
  final List<double>? confidence;

  /// Stickers the user changed by hand; they survive a face rescan.
  final Set<int> edited;

  final ScanAnalysis? analysis;

  /// Colors entered by hand, without the camera.
  final bool manual;

  int get perFace => size * size;
  bool get isCaptured => samples.length == 6;

  /// 1-based number of the face being captured within [kScanOrder].
  int get captureStep => kScanOrder.indexOf(face) + 1;

  bool get isValid => analysis?.isValid ?? false;

  /// Invalid stickers to highlight (empty when valid).
  Set<int> get invalid => {...?analysis?.invalid};

  /// Low-confidence stickers the user has not confirmed yet.
  Set<int> get uncertain => {
    for (final i in analysis?.uncertain ?? const <int>[])
      if (!edited.contains(i)) i,
  };

  String get facelets => stickers.map(stickerLetter).join();

  /// The cube to load into the 3D viewport, once valid.
  CubeState? get cube => isValid ? cubeFromFacelets(size, facelets) : null;

  ScanSession copyWith({
    ScanPhase? phase,
    int? face,
    int? turnFrom,
    bool clearTurnFrom = false,
    Map<int, List<Rgb>>? samples,
    List<StickerColor>? stickers,
    List<double>? confidence,
    bool clearConfidence = false,
    Set<int>? edited,
    ScanAnalysis? analysis,
    bool? manual,
  }) => ScanSession(
    size: size,
    phase: phase ?? this.phase,
    face: face ?? this.face,
    turnFrom: clearTurnFrom ? null : (turnFrom ?? this.turnFrom),
    samples: samples ?? this.samples,
    stickers: stickers ?? this.stickers,
    confidence: clearConfidence ? null : (confidence ?? this.confidence),
    edited: edited ?? this.edited,
    analysis: analysis ?? this.analysis,
    manual: manual ?? this.manual,
  );
}

/// Scanner state machine: capture six faces (rescanning any of them at any
/// time), classify them together, then fix stickers by hand on the net.
class ScanSessionController extends Notifier<ScanSession> {
  ScanSessionController(this.size);

  final int size;

  ScanAnalyzer get _analyzer => ref.read(scanAnalyzerProvider);

  @override
  ScanSession build() =>
      ScanSession(size: size, phase: ScanPhase.capture, face: kScanOrder.first);

  /// Stores the samples of the face being captured, then moves to the next
  /// face still missing, or classifies all six.
  void capture(List<Rgb> cells) {
    if (state.phase != ScanPhase.capture || cells.length != state.perFace) {
      return;
    }
    final samples = {
      ...state.samples,
      state.face: List<Rgb>.unmodifiable(cells),
    };
    final next = kScanOrder.where((f) => !samples.containsKey(f));
    if (next.isNotEmpty) {
      // The user is holding the face just captured: turn from there.
      state = state.copyWith(
        samples: samples,
        face: next.first,
        turnFrom: state.face,
      );
      return;
    }
    _classify(samples, rescanned: state.face);
  }

  /// Captures [face] again; the other faces (and hand edits on them) stay.
  void rescanFace(int face) {
    if (state.manual && state.samples.length < 6) return;
    state = state.copyWith(
      phase: ScanPhase.capture,
      face: face,
      clearTurnFrom: true,
      manual: false,
    );
  }

  /// Back to the review once every face is captured (cancels a rescan).
  void cancelRescan() {
    if (!state.isCaptured || state.stickers.isEmpty) return;
    state = state.copyWith(phase: ScanPhase.review);
  }

  /// Enters the colors by hand, starting from a solved cube.
  void startManual() {
    final stickers = [
      for (final normal in kFaceletFaceOrder)
        for (var i = 0; i < state.perFace; i++) kSolvedColors[normal]!,
    ];
    state = ScanSession(
      size: size,
      phase: ScanPhase.review,
      face: kScanOrder.first,
      stickers: List.unmodifiable(stickers),
      manual: true,
    );
    _validate();
  }

  /// Keeps the scanned colors but switches to fixing them by hand (the
  /// "Fix colors by hand" action of an invalid scan).
  void editManually() {
    if (state.phase != ScanPhase.review) return;
    state = state.copyWith(manual: true);
  }

  /// Restarts the camera scan from the first face.
  void restart() => state = build();

  /// Tap-to-fix: the next color in palette order.
  void cycleSticker(int index) {
    const colors = StickerColor.values;
    final current = state.stickers[index];
    setSticker(index, colors[(current.index + 1) % colors.length]);
  }

  /// Sets one sticker by hand and validates again.
  void setSticker(int index, StickerColor color) {
    if (state.phase != ScanPhase.review) return;
    final stickers = [...state.stickers]..[index] = color;
    state = state.copyWith(
      stickers: List.unmodifiable(stickers),
      edited: {...state.edited, index},
    );
    _validate();
  }

  void _classify(Map<int, List<Rgb>> samples, {required int rescanned}) {
    final ordered = [for (var f = 0; f < 6; f++) ...samples[f]!];
    final analysis = _analyzer.classify(size, ordered);
    final facelets = analysis.facelets;
    // Without the native classifier, fall back to the per-sticker guesses of
    // the live preview so the colors can still be fixed by hand.
    final physical = facelets == null
        ? [for (final s in ordered) nearestStickerColor(s)]
        : [for (final c in facelets.split('')) stickerColorOf(c)!];
    // The classifier names the colors it sees; the rest of the app works in
    // logical (Western-layout) colors, so a Japanese-scheme cube swaps
    // blue and yellow here and is validated again below.
    final scheme = ref.read(cubeColorSchemeProvider);
    final stickers = [for (final c in physical) scheme.logicalOf(c)];
    // Hand edits outside the rescanned face win over the new classification.
    final edited = <int>{};
    final faceStart = rescanned * state.perFace;
    for (final i in state.edited) {
      if (i >= faceStart && i < faceStart + state.perFace) continue;
      if (i >= state.stickers.length) continue;
      stickers[i] = state.stickers[i];
      edited.add(i);
    }
    state = state.copyWith(
      phase: ScanPhase.review,
      samples: samples,
      stickers: List.unmodifiable(stickers),
      confidence: analysis.confidence,
      edited: edited,
      analysis: analysis,
      manual: false,
    );
    if (edited.isNotEmpty || scheme != CubeColorScheme.western) _validate();
  }

  void _validate() {
    final confidence = state.confidence;
    state = state.copyWith(
      analysis: _analyzer.validate(
        size,
        state.facelets,
        confidence: confidence == null
            ? null
            : [
                for (var i = 0; i < confidence.length; i++)
                  state.edited.contains(i) ? 1.0 : confidence[i],
              ],
      ),
    );
  }
}

final scanSessionProvider = NotifierProvider.autoDispose
    .family<ScanSessionController, ScanSession, int>(ScanSessionController.new);
