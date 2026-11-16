// Cube state validator for scanned or hand-entered stickers. Instead of a
// bare "invalid cube" it points at the stickers most likely to be wrong.
#pragma once

#include <array>
#include <string>
#include <vector>

namespace cm::vision {

enum class ScanError {
  kNone = 0,
  kBadLength,   // wrong number of stickers or an unsupported size
  kBadColors,   // not exactly n^2 stickers of 6 colors
  kBadCenters,  // two face centers share a color (odd cubes)
  kBadPieces,   // a corner / edge color combination that cannot exist
  kTwist,       // one corner twisted in place
  kFlip,        // one edge flipped in place (3x3)
  kParity,      // two pieces swapped (3x3)
};

const char* scanErrorName(ScanError error);

/// Confidence below which a classified sticker is reported as uncertain.
constexpr double kUncertainConfidence = 0.25;

struct Validation {
  ScanError error = ScanError::kNone;
  /// Color of each face in URFDLB order, when it could be inferred.
  std::array<char, 6> scheme{};
  bool hasScheme = false;
  /// Stickers implicated by the error, most suspicious first.
  std::vector<int> invalid;
  /// Low-confidence stickers (only when confidences are known), least
  /// confident first.
  std::vector<int> uncertain;

  bool ok() const { return error == ScanError::kNone; }
};

/// Infers the color scheme (color of each face, URFDLB): from the centers
/// on odd cubes; on even cubes from the corners (opposite colors never share
/// a corner, and a corner's clockwise order fixes the chirality), falling
/// back to the dominant color of each face. Needs 6 colors of n^2 stickers.
bool inferScheme(int n, const std::string& facelets, std::array<char, 6>& scheme);

/// Validates [facelets] (6 * n^2 colors in URFDLB order). [confidence] is
/// either empty (hand-entered colors) or one value in [0, 1] per sticker.
/// Checks color counts and centers for every size, corner pieces and twist
/// for every size, and edges, flips and parity for the 3x3.
Validation validateCube(int n, const std::string& facelets,
                        const std::vector<double>& confidence);

}  // namespace cm::vision
