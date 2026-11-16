// Minimal self-contained test framework (no external dependencies, so the
// tests build offline).
#pragma once

#include <cstdio>
#include <functional>
#include <random>
#include <string>
#include <vector>

#include "core/geometry.hpp"
#include "core/notation.hpp"

namespace cmtest {

struct TestCase {
  const char* name;
  std::function<void()> body;
};

inline std::vector<TestCase>& registry() {
  static std::vector<TestCase> tests;
  return tests;
}

inline int& failures() {
  static int count = 0;
  return count;
}

struct Registrar {
  Registrar(const char* name, std::function<void()> body) {
    registry().push_back({name, std::move(body)});
  }
};

#define CM_CONCAT_INNER(a, b) a##b
#define CM_CONCAT(a, b) CM_CONCAT_INNER(a, b)
#define TEST_CASE(name)                                                   \
  static void CM_CONCAT(test_fn_, __LINE__)();                           \
  static ::cmtest::Registrar CM_CONCAT(test_reg_, __LINE__)(name,        \
                                                            &CM_CONCAT(test_fn_, __LINE__)); \
  static void CM_CONCAT(test_fn_, __LINE__)()

#define CHECK(cond)                                                              \
  do {                                                                           \
    if (!(cond)) {                                                               \
      ++::cmtest::failures();                                                    \
      std::printf("    FAILED %s:%d: %s\n", __FILE__, __LINE__, #cond);          \
    }                                                                            \
  } while (0)

#define REQUIRE(cond)                                                            \
  do {                                                                           \
    if (!(cond)) {                                                               \
      ++::cmtest::failures();                                                    \
      std::printf("    FAILED %s:%d: %s\n", __FILE__, __LINE__, #cond);          \
      return;                                                                    \
    }                                                                            \
  } while (0)

/// Color letters used by the app: U white, R red, F green, D yellow,
/// L orange, B blue.
inline cm::FaceletCube solvedColored(int n) {
  cm::FaceletCube cube = cm::FaceletCube::solved(n);
  const std::string from = "URFDLB";
  const std::string to = "WRGYOB";
  for (char& c : cube.f) c = to[from.find(c)];
  return cube;
}

/// Random face turns (and optionally whole-cube rotations / slice moves),
/// never turning the same axis twice in a row.
inline std::vector<std::string> randomScramble(std::mt19937& rng, int length, bool rotations,
                                               bool slices = false) {
  static const char* kFaces[] = {"U", "D", "R", "L", "F", "B"};
  static const char* kSuffix[] = {"", "'", "2"};
  std::vector<std::string> out;
  int lastAxis = -1;
  while (static_cast<int>(out.size()) < length) {
    const int face = static_cast<int>(rng() % 6);
    const int axis = face / 2;
    if (axis == lastAxis) continue;
    lastAxis = axis;
    std::string token = kFaces[face];
    if (slices && rng() % 6 == 0) token = std::string(1, "MES"[axis == 0 ? 1 : (axis == 1 ? 0 : 2)]);
    out.push_back(token + kSuffix[rng() % 3]);
  }
  if (rotations) {
    static const char* kRot[] = {"x", "y", "z", "x'", "y'", "z'", "x2", "y2", "z2"};
    const int count = static_cast<int>(rng() % 3);
    for (int i = 0; i < count; ++i) out.push_back(kRot[rng() % 9]);
  }
  return out;
}

inline void applyTokens(cm::FaceletCube& cube, const std::vector<std::string>& tokens) {
  for (const std::string& token : tokens) {
    cm::LayerMove move;
    if (cm::parseMove(token, cube.n, move)) cube.apply(move);
  }
}

}  // namespace cmtest
