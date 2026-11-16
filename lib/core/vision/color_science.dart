import 'dart:math' as math;

import '../cube/cube_state.dart';

/// An 8-bit sRGB color sample.
typedef Rgb = ({int r, int g, int b});

/// CIELAB color (D65).
typedef Lab = ({double l, double a, double b});

/// Reference sRGB colors of a typical stickered cube (kept in sync with
/// `src/cpp/vision/color.cpp`).
const Map<StickerColor, Rgb> kReferenceStickerRgb = {
  StickerColor.white: (r: 245, g: 245, b: 245),
  StickerColor.yellow: (r: 255, g: 213, b: 0),
  StickerColor.green: (r: 0, g: 155, b: 72),
  StickerColor.blue: (r: 0, g: 70, b: 173),
  StickerColor.red: (r: 183, g: 18, b: 52),
  StickerColor.orange: (r: 255, g: 88, b: 0),
};

double _toLinear(int value) {
  final c = value / 255.0;
  return c <= 0.04045
      ? c / 12.92
      : math.pow((c + 0.055) / 1.055, 2.4) as double;
}

double _labF(double t) => t > 216 / 24389
    ? math.pow(t, 1 / 3) as double
    : (24389 / 27 * t + 16) / 116;

/// sRGB to CIELAB (same formulas as the native scanner).
Lab labOf(Rgb rgb) {
  final r = _toLinear(rgb.r);
  final g = _toLinear(rgb.g);
  final b = _toLinear(rgb.b);
  final x = 0.4124564 * r + 0.3575761 * g + 0.1804375 * b;
  final y = 0.2126729 * r + 0.7151522 * g + 0.0721750 * b;
  final z = 0.0193339 * r + 0.1191920 * g + 0.9503041 * b;
  final fx = _labF(x / 0.95047);
  final fy = _labF(y);
  final fz = _labF(z / 1.08883);
  return (l: 116 * fy - 16, a: 500 * (fx - fy), b: 200 * (fy - fz));
}

final Map<StickerColor, Lab> _referenceLab = {
  for (final entry in kReferenceStickerRgb.entries)
    entry.key: labOf(entry.value),
};

/// Lighting-tolerant distance: lightness counts less than chromaticity.
double _distance2(Lab x, Lab y) {
  final dl = 0.45 * (x.l - y.l);
  final da = x.a - y.a;
  final db = x.b - y.b;
  return dl * dl + da * da + db * db;
}

/// Closest standard sticker color to a single sample. Only used for the live
/// camera preview: the real classification clusters all faces together in
/// the native scanner.
StickerColor nearestStickerColor(Rgb rgb) {
  final lab = labOf(rgb);
  var best = StickerColor.white;
  var bestDistance = double.infinity;
  for (final entry in _referenceLab.entries) {
    final d = _distance2(lab, entry.value);
    if (d < bestDistance) {
      bestDistance = d;
      best = entry.key;
    }
  }
  return best;
}
