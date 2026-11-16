import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ffi/cubementor_bindings.dart';
import 'color_science.dart';

/// What the validator found wrong with a scanned or entered cube.
enum ScanIssue {
  none,
  badLength,
  badColors,
  badCenters,
  badPieces,
  twist,
  flip,
  parity,

  /// The native engine is missing or failed.
  unavailable;

  static ScanIssue fromCode(String code) => ScanIssue.values.firstWhere(
    (issue) => issue.name == code,
    orElse: () => ScanIssue.unavailable,
  );
}

/// Result of classifying sticker colors and/or validating a cube state.
@immutable
class ScanAnalysis {
  const ScanAnalysis({
    required this.issue,
    this.facelets,
    this.confidence,
    this.invalid = const [],
    this.uncertain = const [],
  });

  factory ScanAnalysis.fromJson(String source) {
    final json = jsonDecode(source) as Map<String, dynamic>;
    List<int> ints(String key) => [
      for (final v in (json[key] as List<dynamic>? ?? const [])) v as int,
    ];
    final confidence = json['confidence'] as List<dynamic>?;
    return ScanAnalysis(
      issue: ScanIssue.fromCode(json['error'] as String? ?? 'unavailable'),
      facelets: json['facelets'] as String?,
      confidence: confidence == null
          ? null
          : List.unmodifiable([
              for (final v in confidence) (v as num).toDouble(),
            ]),
      invalid: List.unmodifiable(ints('invalid')),
      uncertain: List.unmodifiable(ints('uncertain')),
    );
  }

  static const ScanAnalysis unavailable = ScanAnalysis(
    issue: ScanIssue.unavailable,
  );

  final ScanIssue issue;

  /// Classified colors as app letters (see `facelets.dart`), when classified.
  final String? facelets;

  /// Per-sticker confidence in [0, 1], when classified.
  final List<double>? confidence;

  /// Stickers implicated by [issue], most suspicious first.
  final List<int> invalid;

  /// Stickers that were hard to read (low confidence).
  final List<int> uncertain;

  bool get isValid => issue == ScanIssue.none;
}

/// Classifies scanned colors and validates cube states.
abstract interface class ScanAnalyzer {
  /// Classifies `6 * size^2` samples in facelet order (URFDLB).
  ScanAnalysis classify(int size, List<Rgb> stickers);

  /// Validates facelet letters, optionally weighting stickers by confidence.
  ScanAnalysis validate(int size, String facelets, {List<double>? confidence});
}

/// [ScanAnalyzer] backed by the C++ vision pipeline. Calls are synchronous:
/// even a 6x6 classifies in about 10 ms.
class NativeScanAnalyzer implements ScanAnalyzer {
  CubeMentorBindings? _bindings() {
    try {
      return CubeMentorBindings.instance;
    } on ArgumentError {
      return null;
    }
  }

  @override
  ScanAnalysis classify(int size, List<Rgb> stickers) {
    final bindings = _bindings();
    if (bindings == null) return ScanAnalysis.unavailable;
    final bytes = Uint8List(stickers.length * 3);
    for (var i = 0; i < stickers.length; i++) {
      bytes[3 * i] = stickers[i].r;
      bytes[3 * i + 1] = stickers[i].g;
      bytes[3 * i + 2] = stickers[i].b;
    }
    return ScanAnalysis.fromJson(bindings.scanClassifyJson(size, bytes));
  }

  @override
  ScanAnalysis validate(int size, String facelets, {List<double>? confidence}) {
    final bindings = _bindings();
    if (bindings == null) return ScanAnalysis.unavailable;
    return ScanAnalysis.fromJson(
      bindings.scanValidateJson(size, facelets, confidence),
    );
  }
}

final scanAnalyzerProvider = Provider<ScanAnalyzer>(
  (ref) => NativeScanAnalyzer(),
);
