import 'package:cube_mentor/core/vision/color_science.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';

/// In-memory [ScanAnalyzer]: [classify] returns [truth] (or, by default,
/// decodes each sample's red channel as a color index), and [validate] only
/// checks the color counts, flagging every sticker of an over-used color.
class FakeScanAnalyzer implements ScanAnalyzer {
  FakeScanAnalyzer({this.truth});

  String? truth;
  final List<List<Rgb>> classified = [];
  final List<List<double>?> validatedConfidence = [];

  static const letters = 'WYGBRO';

  /// A sample the default [classify] decodes back to [letter].
  static Rgb encode(String letter) => (r: letters.indexOf(letter), g: 0, b: 0);

  @override
  ScanAnalysis classify(int size, List<Rgb> stickers) {
    classified.add(stickers);
    final facelets =
        truth ?? stickers.map((s) => letters[s.r % letters.length]).join();
    final confidence = List<double>.filled(facelets.length, 0.9);
    final check = validate(size, facelets, confidence: confidence);
    return ScanAnalysis(
      issue: check.issue,
      facelets: facelets,
      confidence: confidence,
      invalid: check.invalid,
      uncertain: const [],
    );
  }

  @override
  ScanAnalysis validate(int size, String facelets, {List<double>? confidence}) {
    validatedConfidence.add(confidence);
    final perColor = size * size;
    final counts = <String, int>{};
    for (final c in facelets.split('')) {
      counts[c] = (counts[c] ?? 0) + 1;
    }
    final over = {
      for (final e in counts.entries)
        if (e.value > perColor) e.key,
    };
    final ok = counts.length == 6 && over.isEmpty;
    return ScanAnalysis(
      issue: ok ? ScanIssue.none : ScanIssue.badColors,
      invalid: [
        for (var i = 0; i < facelets.length; i++)
          if (over.contains(facelets[i])) i,
      ],
    );
  }
}
