// Scan pipeline: averaged sticker colors of all six faces -> CIELAB ->
// balanced global K-Means -> app color letters -> validation.
#pragma once

#include <array>
#include <string>
#include <vector>

#include "vision/color.hpp"
#include "vision/validator.hpp"

namespace cm::vision {

struct ScanResult {
  /// Classified stickers as app color letters (see kColorLetters), URFDLB.
  std::string facelets;
  std::vector<double> confidence;
  /// Measured average color of every letter in kColorLetters order.
  std::array<Rgb, 6> palette{};
  Validation validation;
  double millis = 0;
};

/// Classifies 6 * n^2 sticker colors given in facelet order (URFDLB, each
/// face row-major as seen from outside). Colors are classified relative to
/// each other, never against fixed thresholds: clusters are named after the
/// closest standard colors only for display, so any color scheme works.
ScanResult classifyScan(int n, const std::vector<Rgb>& stickers);

/// JSON for the FFI bridge:
/// {"ok":true,"error":"none","facelets":"WWR...","confidence":[0.91,...],
///  "palette":[[245,245,245],...],"scheme":"WRGYOB","invalid":[],"uncertain":[3],
///  "millis":1.2}
std::string toJson(const ScanResult& result);

/// JSON of a validation alone (same keys minus facelets/confidence/palette).
std::string toJson(const Validation& validation);

}  // namespace cm::vision
