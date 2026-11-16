#include "vision/color.hpp"

#include <algorithm>
#include <cmath>

namespace cm::vision {

namespace {

// D65 reference white.
constexpr double kXn = 0.95047;
constexpr double kYn = 1.0;
constexpr double kZn = 1.08883;

constexpr double kEpsilon = 216.0 / 24389.0;  // (6/29)^3
constexpr double kKappa = 24389.0 / 27.0;

double labF(double t) { return t > kEpsilon ? std::cbrt(t) : (kKappa * t + 16.0) / 116.0; }

double labFInverse(double t) {
  const double t3 = t * t * t;
  return t3 > kEpsilon ? t3 : (116.0 * t - 16.0) / kKappa;
}

}  // namespace

double srgbToLinear(uint8_t value) {
  const double c = value / 255.0;
  return c <= 0.04045 ? c / 12.92 : std::pow((c + 0.055) / 1.055, 2.4);
}

uint8_t linearToSrgb(double linear) {
  const double c = std::clamp(linear, 0.0, 1.0);
  const double v = c <= 0.0031308 ? 12.92 * c : 1.055 * std::pow(c, 1.0 / 2.4) - 0.055;
  return static_cast<uint8_t>(std::lround(std::clamp(v, 0.0, 1.0) * 255.0));
}

LinearRgb toLinear(Rgb rgb) { return {srgbToLinear(rgb.r), srgbToLinear(rgb.g), srgbToLinear(rgb.b)}; }

Lab rgbToLab(Rgb rgb) { return linearToLab(toLinear(rgb)); }

Lab linearToLab(const LinearRgb& rgb) {
  const double r = rgb.r;
  const double g = rgb.g;
  const double b = rgb.b;
  const double x = 0.4124564 * r + 0.3575761 * g + 0.1804375 * b;
  const double y = 0.2126729 * r + 0.7151522 * g + 0.0721750 * b;
  const double z = 0.0193339 * r + 0.1191920 * g + 0.9503041 * b;
  const double fx = labF(x / kXn);
  const double fy = labF(y / kYn);
  const double fz = labF(z / kZn);
  return {116.0 * fy - 16.0, 500.0 * (fx - fy), 200.0 * (fy - fz)};
}

Rgb labToRgb(const Lab& lab) {
  const double fy = (lab.L + 16.0) / 116.0;
  const double fx = fy + lab.a / 500.0;
  const double fz = fy - lab.b / 200.0;
  const double x = kXn * labFInverse(fx);
  const double y = kYn * labFInverse(fy);
  const double z = kZn * labFInverse(fz);
  const double r = 3.2404542 * x - 1.5371385 * y - 0.4985314 * z;
  const double g = -0.9692660 * x + 1.8760108 * y + 0.0415560 * z;
  const double b = 0.0556434 * x - 0.2040259 * y + 1.0572252 * z;
  return {linearToSrgb(r), linearToSrgb(g), linearToSrgb(b)};
}

double clusterDistance2(const Lab& x, const Lab& y) {
  const double dL = kLightnessWeight * (x.L - y.L);
  const double da = x.a - y.a;
  const double db = x.b - y.b;
  return dL * dL + da * da + db * db;
}

double chroma(const Lab& lab) { return std::sqrt(lab.a * lab.a + lab.b * lab.b); }

const std::array<Rgb, 6>& referenceColors() {
  // Order matches kColorLetters: white, yellow, green, blue, red, orange.
  static const std::array<Rgb, 6> colors = {{
      {245, 245, 245},
      {255, 213, 0},
      {0, 155, 72},
      {0, 70, 173},
      {183, 18, 52},
      {255, 88, 0},
  }};
  return colors;
}

}  // namespace cm::vision
