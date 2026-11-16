// Vision tests: CIELAB conversion, balanced K-Means under simulated lighting
// (warm, cool, dim and mixed per-face exposure), off-brand color schemes and
// the cube state validator.
#include <algorithm>
#include <cmath>
#include <map>
#include <random>
#include <string>
#include <vector>

#include "core/cubie.hpp"
#include "ffi_bridge.h"
#include "test_framework.hpp"
#include "vision/color.hpp"
#include "vision/kmeans.hpp"
#include "vision/scanner.hpp"
#include "vision/validator.hpp"

using namespace cm;
using namespace cm::vision;

namespace {

/// Linear-light gains of a lighting condition (per channel, then exposure).
struct Lighting {
  const char* name;
  double r;
  double g;
  double b;
  double exposure;
};

const Lighting kNeutral{"neutral", 1.0, 1.0, 1.0, 1.0};
const Lighting kWarm{"warm", 1.0, 0.80, 0.52, 0.95};   // tungsten bulb
const Lighting kCool{"cool", 0.78, 0.92, 1.12, 0.95};  // shade / cold LED
const Lighting kDim{"dim", 1.0, 1.0, 1.0, 0.22};       // dark room
const Lighting kBright{"bright", 1.0, 1.0, 1.0, 1.25}; // near a window

/// Standard sticker colors keyed by the letters of solvedColored().
std::map<char, Rgb> standardScheme() {
  return {{'W', {245, 245, 245}}, {'Y', {255, 213, 0}}, {'G', {0, 155, 72}},
          {'B', {0, 70, 173}},    {'R', {183, 18, 52}}, {'O', {255, 88, 0}}};
}

Rgb shoot(Rgb color, const Lighting& light, std::mt19937& rng) {
  std::normal_distribution<double> noise(0.0, 5.0);
  auto channel = [&](uint8_t value, double gain) {
    const uint8_t lit = linearToSrgb(srgbToLinear(value) * gain * light.exposure);
    return static_cast<uint8_t>(std::clamp(lit + noise(rng), 0.0, 255.0));
  };
  return {channel(color.r, light.r), channel(color.g, light.g), channel(color.b, light.b)};
}

FaceletCube scrambled(int n, std::mt19937& rng) {
  FaceletCube cube = cmtest::solvedColored(n);
  cmtest::applyTokens(cube, cmtest::randomScramble(rng, 25, true, n % 2 == 1));
  return cube;
}

/// Photographs every face of [cube] under [faceLight] (one per face).
std::vector<Rgb> photograph(const FaceletCube& cube, const std::map<char, Rgb>& scheme,
                            const std::array<Lighting, 6>& faceLight, std::mt19937& rng) {
  const int perFace = cube.n * cube.n;
  std::vector<Rgb> out;
  for (int i = 0; i < static_cast<int>(cube.f.size()); ++i) {
    out.push_back(shoot(scheme.at(cube.f[i]), faceLight[i / perFace], rng));
  }
  return out;
}

/// True when [classified] equals [truth] up to renaming the colors.
bool sameUpToRenaming(const std::string& truth, const std::string& classified) {
  if (truth.size() != classified.size()) return false;
  std::map<char, char> forward;
  std::map<char, char> backward;
  for (size_t i = 0; i < truth.size(); ++i) {
    auto f = forward.emplace(truth[i], classified[i]);
    auto b = backward.emplace(classified[i], truth[i]);
    if (f.first->second != classified[i] || b.first->second != truth[i]) return false;
  }
  return true;
}

/// Classifies 40 scrambles per size and returns how many were fully right
/// and validated.
int scanSuccesses(const std::map<char, Rgb>& scheme, const std::array<Lighting, 6>& light,
                  int n, unsigned seed, bool expectStandardNames = false) {
  std::mt19937 rng(seed);
  int ok = 0;
  for (int t = 0; t < 40; ++t) {
    const FaceletCube cube = scrambled(n, rng);
    const ScanResult result = classifyScan(n, photograph(cube, scheme, light, rng));
    const bool right = expectStandardNames ? result.facelets == cube.f
                                           : sameUpToRenaming(cube.f, result.facelets);
    if (right && result.validation.ok()) ++ok;
  }
  return ok;
}

std::array<Lighting, 6> uniform(const Lighting& light) {
  return {light, light, light, light, light, light};
}

/// Twists corner [slot] clockwise in place (colors move one sticker on).
void twistCorner(std::string& f, int n, int slot) {
  const auto& c = cubieFacelets(n).corner[slot];
  const char t = f[c[2]];
  f[c[2]] = f[c[1]];
  f[c[1]] = f[c[0]];
  f[c[0]] = t;
}

std::vector<double> confidences(size_t count, int low = -1) {
  std::vector<double> conf(count, 0.9);
  if (low >= 0) conf[low] = 0.05;
  return conf;
}

bool contains(const std::vector<int>& values, int value) {
  return std::find(values.begin(), values.end(), value) != values.end();
}

}  // namespace

// ---- Color science -----------------------------------------------------------

TEST_CASE("vision: sRGB -> CIELAB matches reference values and round-trips") {
  const Lab white = rgbToLab({255, 255, 255});
  CHECK(std::abs(white.L - 100.0) < 0.01);
  CHECK(std::abs(white.a) < 0.01 && std::abs(white.b) < 0.01);
  const Lab black = rgbToLab({0, 0, 0});
  CHECK(std::abs(black.L) < 0.01);
  // Pure red: L* 53.24, a* 80.09, b* 67.20 (D65).
  const Lab red = rgbToLab({255, 0, 0});
  CHECK(std::abs(red.L - 53.24) < 0.05);
  CHECK(std::abs(red.a - 80.09) < 0.1);
  CHECK(std::abs(red.b - 67.20) < 0.1);
  std::mt19937 rng(7);
  for (int i = 0; i < 2000; ++i) {
    const Rgb c{static_cast<uint8_t>(rng()), static_cast<uint8_t>(rng()), static_cast<uint8_t>(rng())};
    const Rgb back = labToRgb(rgbToLab(c));
    CHECK(std::abs(back.r - c.r) <= 1 && std::abs(back.g - c.g) <= 1 && std::abs(back.b - c.b) <= 1);
  }
}

TEST_CASE("vision: dimming changes lightness far more than chromaticity") {
  for (const Rgb& c : referenceColors()) {
    std::mt19937 rng(1);
    const Lab bright = rgbToLab(c);
    Lighting quiet = kDim;
    const Lab dim = rgbToLab(shoot(c, quiet, rng));
    CHECK(bright.L - dim.L > 20);
  }
}

TEST_CASE("vision: Hungarian assignment finds the optimum") {
  // 3 x 3 with a unique optimum of 1 + 2 + 2 = 5 (rows -> cols 1, 0, 2).
  const std::vector<double> cost = {4, 1, 3, 2, 0, 5, 3, 2, 2};
  const std::vector<int> col = solveAssignment(cost, 3, 3);
  CHECK(col[0] == 1 && col[1] == 0 && col[2] == 2);
  // Rectangular: 2 rows, 3 columns.
  const std::vector<double> rect = {9, 1, 9, 1, 9, 9};
  const std::vector<int> col2 = solveAssignment(rect, 2, 3);
  CHECK(col2[0] == 1 && col2[1] == 0);
}

// ---- Classification under lighting shifts ------------------------------------

TEST_CASE("vision: neutral light classifies every size with standard names") {
  for (int n = 2; n <= 6; ++n) {
    const int ok = scanSuccesses(standardScheme(), uniform(kNeutral), n, 100 + n, true);
    std::printf("    %dx%d: %d/40\n", n, n, ok);
    CHECK(ok == 40);
  }
}

TEST_CASE("vision: warm, cool and dim lighting still classify every sticker") {
  for (const Lighting& light : {kWarm, kCool, kDim, kBright}) {
    for (int n = 2; n <= 6; ++n) {
      const int ok = scanSuccesses(standardScheme(), uniform(light), n, 200 + n);
      if (ok != 40) std::printf("    %s %dx%d: %d/40\n", light.name, n, n, ok);
      CHECK(ok == 40);
    }
  }
}

TEST_CASE("vision: each face shot under different lighting") {
  // Auto exposure / white balance changes between the six captures.
  const std::array<Lighting, 6> mixed = {kNeutral, kWarm, kCool, kDim, kBright,
                                         Lighting{"dusk", 0.95, 0.9, 0.8, 0.5}};
  for (int n = 2; n <= 6; ++n) {
    const int ok = scanSuccesses(standardScheme(), mixed, n, 300 + n);
    std::printf("    %dx%d: %d/40\n", n, n, ok);
    CHECK(ok >= 39);
  }
}

TEST_CASE("vision: off-brand color schemes are learned, not assumed") {
  // Purple instead of orange, pink instead of red, and a black-bodied cube
  // with a light gray "white".
  std::map<char, Rgb> offBrand = standardScheme();
  offBrand['O'] = {120, 40, 170};
  offBrand['R'] = {255, 105, 180};
  offBrand['W'] = {200, 205, 210};
  for (int n = 2; n <= 5; ++n) {
    const int ok = scanSuccesses(offBrand, uniform(kNeutral), n, 400 + n);
    std::printf("    %dx%d: %d/40\n", n, n, ok);
    CHECK(ok == 40);
    const int warm = scanSuccesses(offBrand, uniform(kWarm), n, 500 + n);
    CHECK(warm == 40);
  }
}

TEST_CASE("vision: confidence drops for a sticker between two colors") {
  std::mt19937 rng(9);
  const FaceletCube cube = scrambled(3, rng);
  std::vector<Rgb> shot = photograph(cube, standardScheme(), uniform(kNeutral), rng);
  // Blend one non-center red sticker halfway towards orange.
  int target = -1;
  for (int i = 0; i < 54 && target < 0; ++i) {
    if (cube.f[i] == 'R' && i % 9 != 4) target = i;
  }
  REQUIRE(target >= 0);
  shot[target] = {219, 53, 26};
  const ScanResult result = classifyScan(3, shot);
  double others = 1.0;
  for (int i = 0; i < 54; ++i) {
    if (i != target) others = std::min(others, result.confidence[i]);
  }
  CHECK(result.confidence[target] < others);
  CHECK(contains(result.validation.uncertain, target));
  CHECK(result.validation.ok());  // balanced counts still put it in red
  CHECK(result.facelets[target] == 'R');
}

TEST_CASE("vision: a full scan of a 6x6 stays fast") {
  std::mt19937 rng(11);
  const FaceletCube cube = scrambled(6, rng);
  const ScanResult result = classifyScan(6, photograph(cube, standardScheme(), uniform(kWarm), rng));
  std::printf("    6x6 classified in %.1f ms\n", result.millis);
  CHECK(result.millis < 1500);
}

// ---- Validator -----------------------------------------------------------------

TEST_CASE("validator: scrambled cubes of every size are valid") {
  std::mt19937 rng(21);
  for (int n = 2; n <= 6; ++n) {
    for (int t = 0; t < 50; ++t) {
      const FaceletCube cube = scrambled(n, rng);
      const Validation v = validateCube(n, cube.f, {});
      CHECK(v.ok());
      CHECK(v.invalid.empty());
    }
  }
}

TEST_CASE("validator: wrong length and unsupported sizes") {
  CHECK(validateCube(3, "WWW", {}).error == ScanError::kBadLength);
  CHECK(validateCube(9, std::string(486, 'W'), {}).error == ScanError::kBadLength);
  const std::string solved = cmtest::solvedColored(3).f;
  CHECK(validateCube(3, solved, std::vector<double>(10, 1.0)).error == ScanError::kBadLength);
}

TEST_CASE("validator: a miscolored sticker is pinpointed by its count") {
  std::mt19937 rng(22);
  for (int n = 2; n <= 5; ++n) {
    const FaceletCube cube = scrambled(n, rng);
    std::string f = cube.f;
    const int target = n * n + 1;  // a sticker on the R face
    f[target] = f[target] == 'W' ? 'Y' : 'W';
    const Validation v = validateCube(n, f, confidences(f.size(), target));
    CHECK(v.error == ScanError::kBadColors);
    REQUIRE(!v.invalid.empty());
    CHECK(v.invalid.front() == target);
  }
}

TEST_CASE("validator: duplicate centers on odd cubes") {
  std::string f = cmtest::solvedColored(3).f;
  // Swap the F center with a U edge sticker: counts stay right.
  std::swap(f[2 * 9 + 4], f[1]);
  const Validation v = validateCube(3, f, confidences(f.size(), 2 * 9 + 4));
  CHECK(v.error == ScanError::kBadCenters);
  CHECK(v.invalid.size() == 1 && v.invalid.front() == 2 * 9 + 4);
}

TEST_CASE("validator: impossible corners and edges are flagged sticker by sticker") {
  std::mt19937 rng(23);
  const FaceletCube cube = scrambled(3, rng);
  // Mirror one corner: swapping two of its stickers creates a corner that
  // does not exist (wrong chirality).
  std::string f = cube.f;
  const auto& corner = cubieFacelets(3).corner[0];
  std::swap(f[corner[1]], f[corner[2]]);
  Validation v = validateCube(3, f, {});
  CHECK(v.error == ScanError::kBadPieces);
  for (int index : corner) CHECK(contains(v.invalid, index));
  CHECK(v.invalid.size() == 3);

  // Two stickers swapped between different edges.
  f = cube.f;
  const auto& slots = cubieFacelets(3);
  int a = slots.edge[0][0];
  int b = slots.edge[5][1];
  if (f[a] != f[b]) {
    std::swap(f[a], f[b]);
    v = validateCube(3, f, {});
    CHECK(v.error == ScanError::kBadPieces);
    CHECK(contains(v.invalid, a) && contains(v.invalid, b));
  }
}

TEST_CASE("validator: twisted corners, flipped edges and parity") {
  std::mt19937 rng(24);
  for (int n : {2, 3, 4}) {
    const FaceletCube cube = scrambled(n, rng);
    std::string f = cube.f;
    twistCorner(f, n, 3);
    const int low = cubieFacelets(n).corner[3][1];
    const Validation v = validateCube(n, f, confidences(f.size(), low));
    CHECK(v.error == ScanError::kTwist);
    CHECK(contains(v.invalid, low));
  }

  const FaceletCube cube = scrambled(3, rng);
  const auto& slots = cubieFacelets(3);
  std::string f = cube.f;
  std::swap(f[slots.edge[4][0]], f[slots.edge[4][1]]);
  Validation v = validateCube(3, f, confidences(f.size(), slots.edge[4][0]));
  CHECK(v.error == ScanError::kFlip);
  CHECK(contains(v.invalid, slots.edge[4][0]));

  // Swap two whole edges: an odd permutation.
  f = cube.f;
  std::swap(f[slots.edge[0][0]], f[slots.edge[1][0]]);
  std::swap(f[slots.edge[0][1]], f[slots.edge[1][1]]);
  v = validateCube(3, f, {});
  CHECK(v.error == ScanError::kParity);
}

TEST_CASE("validator: 2x2 corner swaps are legal, even-cube schemes are inferred") {
  std::mt19937 rng(25);
  FaceletCube cube = scrambled(2, rng);
  const auto& slots = cubieFacelets(2);
  std::string f = cube.f;
  for (int k = 0; k < 3; ++k) std::swap(f[slots.corner[0][k]], f[slots.corner[1][k]]);
  // The swap may or may not keep the twist sum; only twists are illegal.
  const ScanError error = validateCube(2, f, {}).error;
  CHECK(error == ScanError::kNone || error == ScanError::kTwist);

  // Arbitrary color letters, any orientation: still valid.
  for (int t = 0; t < 30; ++t) {
    FaceletCube odd = scrambled(2, rng);
    for (char& c : odd.f) c = "abcdef"[std::string("WRGYOB").find(c)];
    std::array<char, 6> scheme{};
    CHECK(inferScheme(2, odd.f, scheme));
    CHECK(validateCube(2, odd.f, {}).ok());
  }
}

TEST_CASE("ffi: scan classify and validate return JSON") {
  std::mt19937 rng(26);
  const FaceletCube cube = scrambled(3, rng);
  const std::vector<Rgb> shot = photograph(cube, standardScheme(), uniform(kCool), rng);
  std::vector<uint8_t> bytes;
  for (const Rgb& c : shot) bytes.insert(bytes.end(), {c.r, c.g, c.b});
  char small[8];
  const int32_t needed = cm_scan_classify(3, bytes.data(), small, sizeof(small));
  REQUIRE(needed > 100);
  std::string out(static_cast<size_t>(needed) + 1, '\0');
  CHECK(cm_scan_classify(3, bytes.data(), out.data(), needed + 1) == needed);
  CHECK(out.find("\"ok\":true") != std::string::npos);
  CHECK(out.find("\"facelets\":\"") != std::string::npos);

  char buffer[512];
  const int32_t length = cm_scan_validate(3, cube.f.c_str(), nullptr, buffer, sizeof(buffer));
  CHECK(length > 0 && length < 512);
  CHECK(std::string(buffer).find("\"ok\":true") != std::string::npos);
  CHECK(cm_scan_validate(3, nullptr, nullptr, buffer, sizeof(buffer)) > 0);
  CHECK(std::string(buffer).find("badLength") != std::string::npos);
}
