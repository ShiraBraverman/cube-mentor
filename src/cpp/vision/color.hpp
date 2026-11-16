// Color science used by the scanner: sRGB <-> CIELAB (D65) and the
// lighting-tolerant distance used for clustering stickers.
#pragma once

#include <array>
#include <cstdint>

namespace cm::vision {

struct Rgb {
  uint8_t r = 0;
  uint8_t g = 0;
  uint8_t b = 0;
};

/// CIELAB: L in [0, 100], a/b roughly in [-128, 127].
struct Lab {
  double L = 0;
  double a = 0;
  double b = 0;
};

/// Linear-light RGB in [0, 1] (per channel).
struct LinearRgb {
  double r = 0;
  double g = 0;
  double b = 0;
};

/// sRGB (gamma encoded, D65 white) to CIELAB.
Lab rgbToLab(Rgb rgb);

/// Linear RGB to CIELAB (values above 1 are allowed and extrapolated).
Lab linearToLab(const LinearRgb& rgb);

LinearRgb toLinear(Rgb rgb);

/// CIELAB back to sRGB, clamped to the gamut (used by tests and previews).
Rgb labToRgb(const Lab& lab);

/// sRGB component <-> linear light in [0, 1].
double srgbToLinear(uint8_t value);
uint8_t linearToSrgb(double linear);

/// Weight of the lightness difference relative to chroma. Lighting changes
/// (dim rooms, shadows, per-face exposure) move L far more than a/b, so the
/// clustering distance leans on chromaticity.
constexpr double kLightnessWeight = 0.45;

/// Squared clustering distance: `(w * dL)^2 + da^2 + db^2`.
double clusterDistance2(const Lab& x, const Lab& y);

/// Chroma `sqrt(a^2 + b^2)`.
double chroma(const Lab& lab);

/// Display color letters of the app (lib/core/cube/facelets.dart) and their
/// reference sRGB values on a typical stickered cube.
constexpr const char* kColorLetters = "WYGBRO";
const std::array<Rgb, 6>& referenceColors();

}  // namespace cm::vision
