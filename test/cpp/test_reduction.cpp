// Big-cube reduction solver and scramble tests: 1,200 random scrambles
// across 4x4x4, 5x5x5 and 6x6x6 (plus forced OLL / PLL / edge parity),
// every solution verified by replaying it on the facelet model.
#include <algorithm>
#include <chrono>
#include <cstring>
#include <random>
#include <set>
#include <string>

#include "core/cubie.hpp"
#include "ffi_bridge.h"
#include "solver/reduction.hpp"
#include "solver/scramble.hpp"
#include "solver/solver.hpp"
#include "test_framework.hpp"

using namespace cm;

namespace {

using Clock = std::chrono::steady_clock;

double millisSince(Clock::time_point start) {
  return std::chrono::duration<double, std::milli>(Clock::now() - start).count();
}

bool replaySolves(const std::string& facelets, int n, const SolveResult& result) {
  FaceletCube cube{n, facelets};
  for (const SolveStep& step : result.steps) {
    if (step.cubeState != cube.f) return false;
    LayerMove move;
    if (!parseMove(step.move, n, move)) return false;
    cube.apply(move);
  }
  return cube.isSolved();
}

bool applyAlg(FaceletCube& cube, const std::string& alg) {
  std::vector<LayerMove> moves;
  if (!parseSequence(alg, cube.n, moves)) return false;
  for (const LayerMove& m : moves) cube.apply(m);
  return true;
}

/// Random big-cube scramble: outer, wide and single inner-slice turns.
std::string bigScramble(std::mt19937& rng, int n, int length) {
  static const char kFaces[] = "UDRLFB";
  static const char* kSuffix[] = {"", "'", "2"};
  std::string out;
  for (int i = 0; i < length; ++i) {
    const char face = kFaces[rng() % 6];
    const int depth = 1 + static_cast<int>(rng() % (n - 1));
    std::string token;
    switch (rng() % 3) {
      case 0:
        token = std::string(1, face);
        break;
      case 1:
        token = (depth <= 2 ? std::string() : std::to_string(depth)) + face + "w";
        if (depth == 1) token = std::string(1, face) + "w";
        break;
      default:
        token = std::to_string(1 + depth / 2 + (depth / 2 == 0)) + face;
        break;
    }
    out += token + kSuffix[rng() % 3] + ' ';
  }
  if (rng() % 2 == 0) out += "x y'";  // any orientation is fine
  return out;
}

bool hasPhase(const SolveResult& r, const std::string& phase) {
  return std::any_of(r.steps.begin(), r.steps.end(),
                     [&](const SolveStep& s) { return s.phase == phase; });
}

/// Centers uniform and every dedge paired.
bool isReduced(const FaceletCube& cube) {
  const int n = cube.n;
  const CubeGeometry& g = CubeGeometry::get(n);
  for (int face = 0; face < 6; ++face) {
    const char c = cube.f[face * n * n + n + 1];
    for (int r = 1; r < n - 1; ++r) {
      for (int col = 1; col < n - 1; ++col) {
        if (cube.f[face * n * n + r * n + col] != c) return false;
      }
    }
  }
  // Wings along each edge show the same pair of colors.
  for (int i = 0; i < g.faceletCount(); ++i) {
    const Vec3& p = g.cubiePosition(i);
    const int outer = (std::abs(p.x) == n - 1) + (std::abs(p.y) == n - 1) + (std::abs(p.z) == n - 1);
    if (outer != 2) continue;
    Vec3 step{std::abs(p.x) == n - 1 ? 0 : 2, std::abs(p.y) == n - 1 ? 0 : 2,
              std::abs(p.z) == n - 1 ? 0 : 2};
    const Vec3 next = p + step;
    if (std::abs(next.x) > n - 1 || std::abs(next.y) > n - 1 || std::abs(next.z) > n - 1) continue;
    const int other = g.faceletAt(next, g.normal(i));
    if (other >= 0 && std::abs(dot(next, step)) < n - 1 && cube.f[other] != cube.f[i]) return false;
  }
  return true;
}

CubeError reducedError(const FaceletCube& cube) {
  const int n = cube.n;
  std::string f3(54, '?');
  auto index = [n](int i) { return i == 0 ? 0 : (i == 2 ? n - 1 : n / 2); };
  for (int face = 0; face < 6; ++face) {
    for (int r = 0; r < 3; ++r) {
      for (int c = 0; c < 3; ++c) f3[face * 9 + r * 3 + c] = cube.f[face * n * n + index(r) * n + index(c)];
    }
  }
  std::array<char, 6> colors{};
  if (!centerColors3(f3, colors)) return CubeError::kBadColors;
  CubieCube cubie;
  return toCubie(f3, 3, colors, cubie);
}

}  // namespace

TEST_CASE("notation: every layer turn round-trips through its name") {
  for (int n = 2; n <= 7; ++n) {
    for (int axis = 0; axis < 3; ++axis) {
      for (int from = 0; from < n; ++from) {
        for (int to = from; to < n; ++to) {
          for (int q = 1; q <= 3; ++q) {
            const LayerMove m{axis, from, to, q};
            const std::string name = moveName(m, n);
            LayerMove back;
            REQUIRE(parseMove(name, n, back));
            CHECK(back.axis == m.axis && back.fromLayer == m.fromLayer && back.toLayer == m.toLayer &&
                  back.quarterTurns == m.quarterTurns);
          }
        }
      }
    }
  }
  LayerMove m;
  CHECK(parseMove("2-3Rw'", 6, m) && m.axis == 0 && m.fromLayer == 3 && m.toLayer == 4);
  CHECK(parseMove("2-3Lw", 6, m) && m.fromLayer == 1 && m.toLayer == 2);
  CHECK(!parseMove("3-2Rw", 6, m));
  CHECK(!parseMove("2-3R", 6, m));
  CHECK(!parseMove("2-7Rw", 6, m));
}

TEST_CASE("reduction: the 3-cycle library covers every center and wing orbit") {
  const int expectedCenter[] = {0, 0, 0, 0, 1, 2, 4};
  const int expectedWing[] = {0, 0, 0, 0, 1, 1, 2};
  for (int n = 4; n <= 6; ++n) {
    const auto start = Clock::now();
    const ReductionSolver::Coverage c = ReductionSolver::coverage(n);
    std::printf("    %dx%d: %d center + %d wing orbits, %d / %d cycles in %.0f ms\n", n, n,
                c.centerOrbits, c.wingOrbits, c.cycles, c.possible, millisSince(start));
    CHECK(c.centerOrbits == expectedCenter[n]);
    CHECK(c.wingOrbits == expectedWing[n]);
    CHECK(c.cycles == c.possible);
  }
}

TEST_CASE("reduction: parity algorithms keep the cube reduced and toggle one invariant") {
  for (int n : {4, 6}) {
    FaceletCube oll = cmtest::solvedColored(n);
    REQUIRE(applyAlg(oll, ReductionSolver::ollParityAlgorithm(n)));
    CHECK(isReduced(oll));
    CHECK(reducedError(oll) == CubeError::kFlip);

    FaceletCube pll = cmtest::solvedColored(n);
    REQUIRE(applyAlg(pll, ReductionSolver::pllParityAlgorithm(n)));
    CHECK(isReduced(pll));
    CHECK(reducedError(pll) == CubeError::kParity);
  }
  CHECK(ReductionSolver::ollParityAlgorithm(6).find("2-3Rw") == std::string::npos);
  CHECK(ReductionSolver::pllParityAlgorithm(6).find("2-3Rw2") != std::string::npos);
  CHECK(ReductionSolver::pllParityAlgorithm(4) == "2R2 U2 2R2 Uw2 2R2 Uw2");
}

TEST_CASE("reduction: 1200 random 4x4-6x6 scrambles solve with structured steps") {
  std::mt19937 rng(4444);
  const int counts[] = {0, 0, 0, 0, 400, 400, 400};
  for (int n = 4; n <= 6; ++n) {
    prepareSolvers(n);
    double total = 0;
    double worst = 0;
    size_t moves = 0;
    size_t longest = 0;
    int parityCases = 0;
    for (int i = 0; i < counts[n]; ++i) {
      FaceletCube cube = cmtest::solvedColored(n);
      REQUIRE(applyAlg(cube, bigScramble(rng, n, 20 * n)));
      // A third of them through the learner's 3x3 stage.
      const SolveMethod method = i % 3 == 0 ? SolveMethod::kLayerByLayer : SolveMethod::kFast;
      const auto start = Clock::now();
      const SolveResult r = solveCube(n, method, cube.f);
      const double ms = millisSince(start);
      if (!r.ok) std::printf("    %dx%d scramble %d failed: %s\n", n, n, i, r.error.c_str());
      REQUIRE(r.ok);
      CHECK(replaySolves(cube.f, n, r));
      CHECK(hasPhase(r, "reductionCenters"));
      CHECK(hasPhase(r, "reductionEdges"));
      for (const SolveStep& s : r.steps) {
        CHECK(!s.phase.empty() && !s.explanation.empty());
      }
      parityCases += hasPhase(r, "reductionOllParity") || hasPhase(r, "reductionPllParity") ||
                     hasPhase(r, "reductionEdgeParity");
      total += ms;
      worst = std::max(worst, ms);
      moves += r.steps.size();
      longest = std::max(longest, r.steps.size());
    }
    std::printf("    %dx%d: %d solves, avg %.1f ms (worst %.1f), avg %.0f moves (max %zu), %d with parity\n",
                n, n, counts[n], total / counts[n], worst, static_cast<double>(moves) / counts[n],
                longest, parityCases);
    CHECK(parityCases > 0);
  }
}

TEST_CASE("reduction: forced OLL, PLL and edge parity are detected and resolved") {
  std::mt19937 rng(77);
  for (int n : {4, 6}) {
    for (int k = 0; k < 10; ++k) {
      for (int which = 0; which < 2; ++which) {
        FaceletCube cube = cmtest::solvedColored(n);
        REQUIRE(applyAlg(cube, which == 0 ? ReductionSolver::ollParityAlgorithm(n)
                                       : ReductionSolver::pllParityAlgorithm(n)));
        // Outer turns hide the parity inside an ordinary-looking position.
        cmtest::applyTokens(cube, cmtest::randomScramble(rng, 20, true));
        const SolveResult r = solveCube(n, SolveMethod::kFast, cube.f);
        REQUIRE(r.ok);
        CHECK(replaySolves(cube.f, n, r));
        CHECK(hasPhase(r, which == 0 ? "reductionOllParity" : "reductionPllParity"));
        CHECK(!hasPhase(r, "reductionCenters"));
      }
    }
  }
  // Odd cubes: a single flipped wing pair can only be fixed by a slice turn.
  for (int k = 0; k < 10; ++k) {
    FaceletCube cube = cmtest::solvedColored(5);
    REQUIRE(applyAlg(cube, "Rw U2 x Rw U2 Rw U2 Rw' U2 Lw U2 Rw' U2 Rw U2 Rw' U2 Rw'"));
    cmtest::applyTokens(cube, cmtest::randomScramble(rng, 20, true));
    const SolveResult r = solveCube(5, SolveMethod::kFast, cube.f);
    REQUIRE(r.ok);
    CHECK(replaySolves(cube.f, 5, r));
    CHECK(hasPhase(r, "reductionEdgeParity"));
  }
}

TEST_CASE("reduction: solved cubes, rotations and invalid input") {
  for (int n = 4; n <= 6; ++n) {
    const SolveResult solved = solveCube(n, SolveMethod::kFast, cmtest::solvedColored(n).f);
    REQUIRE(solved.ok);
    CHECK(solved.steps.empty());

    FaceletCube rotated = cmtest::solvedColored(n);
    REQUIRE(applyAlg(rotated, "x y2"));
    const SolveResult r = solveCube(n, SolveMethod::kFast, rotated.f);
    REQUIRE(r.ok);
    CHECK(r.steps.empty());

    FaceletCube bad = cmtest::solvedColored(n);
    bad.f[0] = bad.f[n * n];  // seven reds, a missing white
    CHECK(solveCube(n, SolveMethod::kFast, bad.f).error == "badColors");

    // Two stickers of one corner swapped: a corner that does not exist.
    FaceletCube twisted = cmtest::solvedColored(n);
    const CubieFacelets& cf = cubieFacelets(n);
    std::swap(twisted.f[cf.corner[0][0]], twisted.f[cf.corner[0][1]]);
    CHECK(!solveCube(n, SolveMethod::kFast, twisted.f).ok);
  }
  CHECK(solveCube(4, SolveMethod::kFast, "UUU").error == "badLength");
}

TEST_CASE("scramble: random-state 2x2/3x3 and random-move big cubes, seeded") {
  for (int n = 2; n <= 6; ++n) {
    std::set<std::string> seen;
    for (uint32_t seed = 1; seed <= 20; ++seed) {
      const std::string s = makeScramble(n, seed);
      CHECK(s == makeScramble(n, seed));
      seen.insert(s);
      FaceletCube cube = cmtest::solvedColored(n);
      REQUIRE(applyAlg(cube, s));
      CHECK(!cube.isSolved());
      if (n <= 3) {
        const SolveResult r = solveCube(n, SolveMethod::kFast, cube.f);
        CHECK(r.ok && replaySolves(cube.f, n, r));
      }
    }
    CHECK(seen.size() == 20);
  }
  CHECK(makeScramble(9, 1).empty());

  char buffer[2048];
  const int32_t length = cm_scramble(3, 20261116u, buffer, sizeof(buffer));
  REQUIRE(length > 0 && length < static_cast<int32_t>(sizeof(buffer)));
  CHECK(std::string(buffer) == makeScramble(3, 20261116u));
  CHECK(cm_scramble(3, 1u, nullptr, 0) > 0);
}

TEST_CASE("ffi: cm_solve handles a scrambled 5x5x5") {
  std::mt19937 rng(5);
  FaceletCube cube = cmtest::solvedColored(5);
  REQUIRE(applyAlg(cube, bigScramble(rng, 5, 60)));
  CHECK(cm_prepare(5) == 0);
  CHECK(cm_prepare(7) == -1);
  const int32_t needed = cm_solve(5, CM_METHOD_FAST, cube.f.c_str(), nullptr, 0);
  // The time-budgeted 3x3 stage may differ between calls: leave headroom.
  const int32_t capacity = needed + 64 * 1024;
  std::vector<char> out(static_cast<size_t>(capacity));
  CHECK(cm_solve(5, CM_METHOD_FAST, cube.f.c_str(), out.data(), capacity) < capacity);
  const std::string json(out.data());
  CHECK(json.rfind("{\"ok\":true,\"method\":\"reduction\"", 0) == 0);
  CHECK(json.find("\"phase\":\"reductionCenters\"") != std::string::npos);
}
