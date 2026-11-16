// Solver tests: 1,000+ random scrambles per solver, verified by replaying
// every solution on the facelet model.
#include <algorithm>
#include <chrono>
#include <cstring>
#include <random>
#include <set>
#include <string>

#include "ffi_bridge.h"
#include "solver/kociemba.hpp"
#include "solver/lbl.hpp"
#include "solver/solver.hpp"
#include "solver/solver_2x2.hpp"
#include "test_framework.hpp"

using namespace cm;

namespace {

constexpr int kScrambles = 1000;

using Clock = std::chrono::steady_clock;

double millisSince(Clock::time_point start) {
  return std::chrono::duration<double, std::milli>(Clock::now() - start).count();
}

bool replaySolves(const std::string& facelets, int n, const SolveResult& result) {
  FaceletCube cube;
  cube.n = n;
  cube.f = facelets;
  for (const SolveStep& step : result.steps) {
    if (step.cubeState != cube.f) return false;
    LayerMove move;
    if (!parseMove(step.move, n, move)) return false;
    cube.apply(move);
  }
  return cube.isSolved();
}

}  // namespace

// ---- 2x2 -------------------------------------------------------------------

TEST_CASE("2x2: distance table matches the known 2x2x2 HTM distribution") {
  const auto start = Clock::now();
  Solver2x2::prepare();
  std::printf("    table built in %.0f ms\n", millisSince(start));
  const std::vector<long> h = Solver2x2::distanceHistogram();
  long total = 0;
  for (long count : h) total += count;
  CHECK(total == 3674160);
  REQUIRE(h.size() == 12);  // God's number for the 2x2x2 is 11 (HTM)
  const long expected[12] = {1, 9, 54, 321, 1847, 9992, 50136, 227536, 870072, 1887748, 623800, 2644};
  for (int d = 0; d < 12; ++d) CHECK(h[d] == expected[d]);
}

TEST_CASE("2x2: 1000 random scrambles solve optimally in under 1 ms") {
  Solver2x2::prepare();
  std::mt19937 rng(2024);
  double worst = 0;
  double total = 0;
  int longest = 0;
  for (int i = 0; i < kScrambles; ++i) {
    FaceletCube cube = cmtest::solvedColored(2);
    // Rotations make sure any orientation of the puzzle is handled.
    const auto scramble = cmtest::randomScramble(rng, 3 + static_cast<int>(rng() % 15), true);
    cmtest::applyTokens(cube, scramble);
    const auto start = Clock::now();
    const SolveResult result = solveCube(2, SolveMethod::kFast, cube.f);
    const double ms = millisSince(start);
    REQUIRE(result.ok);
    CHECK(replaySolves(cube.f, 2, result));
    CHECK(result.steps.size() <= 11);
    // Never longer than the face-turn part of the scramble.
    int faceTurns = 0;
    for (const auto& t : scramble) faceTurns += std::islower(static_cast<unsigned char>(t[0])) ? 0 : 1;
    CHECK(static_cast<int>(result.steps.size()) <= faceTurns);
    worst = std::max(worst, ms);
    total += ms;
    longest = std::max(longest, static_cast<int>(result.steps.size()));
  }
  std::printf("    avg %.4f ms, worst %.4f ms, longest %d moves\n", total / kScrambles, worst, longest);
  CHECK(total / kScrambles < 1.0);
}

TEST_CASE("2x2: rejects impossible states") {
  FaceletCube cube = cmtest::solvedColored(2);
  std::string twisted = cube.f;
  // Twist the URF corner in place: rotate its three stickers.
  const auto& urf = cubieFacelets(2).corner[URF];
  const char a = twisted[urf[0]];
  twisted[urf[0]] = twisted[urf[2]];
  twisted[urf[2]] = twisted[urf[1]];
  twisted[urf[1]] = a;
  const SolveResult result = solveCube(2, SolveMethod::kFast, twisted);
  CHECK(!result.ok);
  CHECK(result.error == "twist");
  CHECK(!solveCube(2, SolveMethod::kFast, "WWWW").ok);
}

// ---- 3x3 Kociemba --------------------------------------------------------

TEST_CASE("kociemba: 1000 random scrambles solve in under 5 ms on average") {
  const auto build = Clock::now();
  KociembaSolver::prepare();
  std::printf("    tables built in %.0f ms\n", millisSince(build));
  std::mt19937 rng(1);
  double total = 0;
  double worst = 0;
  long moves = 0;
  int longest = 0;
  for (int i = 0; i < kScrambles; ++i) {
    FaceletCube cube = cmtest::solvedColored(3);
    cmtest::applyTokens(cube, cmtest::randomScramble(rng, 25, true, true));
    const auto start = Clock::now();
    const SolveResult result = solveCube(3, SolveMethod::kFast, cube.f);
    const double ms = millisSince(start);
    REQUIRE(result.ok);
    CHECK(replaySolves(cube.f, 3, result));
    CHECK(result.steps.size() <= 30);
    bool phase2 = false;
    for (const SolveStep& step : result.steps) {
      if (step.phase == "kociembaPhase2") phase2 = true;
      CHECK(step.phase == (phase2 ? "kociembaPhase2" : "kociembaPhase1"));
    }
    total += ms;
    worst = std::max(worst, ms);
    moves += static_cast<long>(result.steps.size());
    longest = std::max(longest, static_cast<int>(result.steps.size()));
  }
  std::printf("    avg %.3f ms, worst %.3f ms, avg %.2f moves, longest %d\n", total / kScrambles,
              worst, static_cast<double>(moves) / kScrambles, longest);
  CHECK(total / kScrambles < 5.0);
}

TEST_CASE("kociemba: solved cube, superflip and invalid input") {
  const FaceletCube solved = cmtest::solvedColored(3);
  SolveResult result = solveCube(3, SolveMethod::kFast, solved.f);
  CHECK(result.ok && result.steps.empty());

  FaceletCube superflip = solved;
  cmtest::applyTokens(superflip, {"U", "R2", "F", "B", "R", "B2", "R", "U2", "L", "B2", "R",
                                  "U'", "D'", "R2", "F", "R'", "L", "B2", "U2", "F2"});
  result = solveCube(3, SolveMethod::kFast, superflip.f);
  REQUIRE(result.ok);
  CHECK(replaySolves(superflip.f, 3, result));

  std::string parity = solved.f;
  std::swap(parity[1], parity[46]);  // U-B edge sticker swapped with B-U sticker = flip
  CHECK(!solveCube(3, SolveMethod::kFast, parity).ok);
  CHECK(solveCube(5, SolveMethod::kFast, std::string(150, 'W')).error == "unsupported");
}

// ---- 3x3 layer by layer --------------------------------------------------

TEST_CASE("lbl: 1000 random scrambles solve with structured steps") {
  std::mt19937 rng(99);
  const std::vector<std::string> order = {
      "lblOrient",     "lblCross",       "lblCorners",       "lblMiddle",
      "lblYellowCross", "lblYellowEdges", "lblYellowCorners", "lblYellowCornersOrient"};
  double total = 0;
  double worst = 0;
  long moves = 0;
  int longest = 0;
  for (int i = 0; i < kScrambles; ++i) {
    FaceletCube cube = cmtest::solvedColored(3);
    cmtest::applyTokens(cube, cmtest::randomScramble(rng, 25, true, true));
    const auto start = Clock::now();
    const SolveResult result = solveCube(3, SolveMethod::kLayerByLayer, cube.f);
    const double ms = millisSince(start);
    REQUIRE(result.ok);
    REQUIRE(replaySolves(cube.f, 3, result));
    int lastPhase = 0;
    for (const SolveStep& step : result.steps) {
      const auto it = std::find(order.begin(), order.end(), step.phase);
      REQUIRE(it != order.end());
      const int phase = static_cast<int>(it - order.begin());
      CHECK(phase >= lastPhase);  // phases never go backwards
      lastPhase = phase;
      CHECK(!step.explanation.empty());
      CHECK(step.cubeState.size() == 54);
      for (const Vec3& p : step.highlight) {
        CHECK(std::abs(p.x) <= 2 && std::abs(p.y) <= 2 && std::abs(p.z) <= 2);
      }
      if (step.phase == "lblCross" || step.phase == "lblCorners" || step.phase == "lblMiddle") {
        CHECK(!step.piece.empty());
        CHECK(step.highlight.size() == 1);
      }
    }
    total += ms;
    worst = std::max(worst, ms);
    moves += static_cast<long>(result.steps.size());
    longest = std::max(longest, static_cast<int>(result.steps.size()));
  }
  std::printf("    avg %.3f ms, worst %.3f ms, avg %.1f moves, longest %d\n", total / kScrambles,
              worst, static_cast<double>(moves) / kScrambles, longest);
}

TEST_CASE("lbl: white goes down first and the cross is built on the bottom") {
  FaceletCube cube = cmtest::solvedColored(3);
  cmtest::applyTokens(cube, {"R", "U", "F'", "L2", "D"});
  const SolveResult result = solveCube(3, SolveMethod::kLayerByLayer, cube.f);
  REQUIRE(result.ok);
  REQUIRE(!result.steps.empty());
  CHECK(result.steps.front().move == "x2");  // white starts on top
  CHECK(result.steps.front().phase == "lblOrient");
  // Once the cross phase ends, the four bottom edges are white.
  FaceletCube replay = cube;
  for (const SolveStep& step : result.steps) {
    if (step.phase != "lblOrient" && step.phase != "lblCross") break;
    cmtest::applyTokens(replay, {step.move});
  }
  for (int i : {1, 3, 5, 7}) CHECK(replay.f[kD * 9 + i] == 'W');
}

// ---- FFI bridge --------------------------------------------------------------

TEST_CASE("ffi: cm_solve writes JSON and reports the needed buffer size") {
  CHECK(std::strcmp(cm_version(), "1.0.0") == 0);
  CHECK(cm_prepare(3) == 0);
  CHECK(cm_prepare(7) == -1);
  FaceletCube cube = cmtest::solvedColored(3);
  cmtest::applyTokens(cube, {"R", "U"});
  char small[8];
  const int needed = cm_solve(3, CM_METHOD_FAST, cube.f.c_str(), small, sizeof(small));
  REQUIRE(needed > 8);
  std::string buffer(needed + 1, '\0');
  CHECK(cm_solve(3, CM_METHOD_FAST, cube.f.c_str(), buffer.data(), needed + 1) == needed);
  const std::string json(buffer.c_str());
  CHECK(json.rfind("{\"ok\":true,\"method\":\"kociemba\"", 0) == 0);
  CHECK(json.find("\"move\":\"U'\"") != std::string::npos);
  CHECK(json.find("\"move\":\"R'\"") != std::string::npos);
  if (json.find("\"move\":\"R'\"") == std::string::npos) std::printf("    %s\n", json.c_str());

  char error[128];
  cm_solve(3, CM_METHOD_FAST, "nope", error, sizeof(error));
  CHECK(std::string(error) == R"({"ok":false,"error":"badLength"})");
  cm_solve(3, CM_METHOD_FAST, nullptr, error, sizeof(error));
  CHECK(std::string(error) == R"({"ok":false,"error":"badLength"})");

  std::string lblJson(200000, '\0');
  const int lblLength =
      cm_solve(3, CM_METHOD_LAYER_BY_LAYER, cube.f.c_str(), lblJson.data(), static_cast<int>(lblJson.size()));
  REQUIRE(lblLength < static_cast<int>(lblJson.size()));
  CHECK(std::string(lblJson.c_str()).find("\"highlight\":[[") != std::string::npos);
}
