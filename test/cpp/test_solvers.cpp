// Solver tests: 1,000+ random scrambles per solver, verified by replaying
// every solution on the facelet model.
#include <algorithm>
#include <array>
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

TEST_CASE("2x2: guided solve runs bottom layer, top color, finish") {
  Solver2x2::prepare();
  std::mt19937 rng(222);
  const char* order[] = {"twoFirstLayer", "twoTopColor", "twoFinish"};
  int longest = 0;
  int stageMax[3] = {0, 0, 0};
  double total = 0;
  for (int i = 0; i < kScrambles; ++i) {
    FaceletCube cube = cmtest::solvedColored(2);
    cmtest::applyTokens(cube, cmtest::randomScramble(rng, 3 + static_cast<int>(rng() % 15), true));
    const SolveResult r = solveCube(2, SolveMethod::kLayerByLayer, cube.f);
    REQUIRE(r.ok);
    CHECK(r.method == "guided2x2");
    CHECK(replaySolves(cube.f, 2, r));
    // Stages appear in order, each at most once.
    int stage = 0;
    int length[3] = {0, 0, 0};
    for (const SolveStep& s : r.steps) {
      while (stage < 3 && s.phase != order[stage]) ++stage;
      REQUIRE(stage < 3);
      ++length[stage];
    }
    // After the first stage the bottom layer is done; after the second the
    // top is one color: replay up to each boundary and look.
    FaceletCube replay = cube;
    for (size_t k = 0; k < r.steps.size(); ++k) {
      LayerMove m;
      REQUIRE(parseMove(r.steps[k].move, 2, m));
      replay.apply(m);
      const bool lastOfStage = k + 1 == r.steps.size() || r.steps[k + 1].phase != r.steps[k].phase;
      if (lastOfStage && r.steps[k].phase == std::string("twoTopColor")) {
        // Top face one color.
        for (int j = 1; j < 4; ++j) CHECK(replay.f[j] == replay.f[0]);
      }
    }
    for (int k = 0; k < 3; ++k) stageMax[k] = std::max(stageMax[k], length[k]);
    longest = std::max(longest, static_cast<int>(r.steps.size()));
    total += static_cast<double>(r.steps.size());
  }
  std::printf("    avg %.1f moves, longest %d (stages max %d / %d / %d)\n", total / kScrambles,
              longest, stageMax[0], stageMax[1], stageMax[2]);
  // Short, beginner-sized stages.
  CHECK(stageMax[0] <= 8);
  CHECK(longest <= 30);
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
  CHECK(solveCube(7, SolveMethod::kFast, std::string(294, 'W')).error == "unsupported");
}

// ---- 3x3 layer by layer --------------------------------------------------

TEST_CASE("lbl: 1000 random scrambles solve with structured steps") {
  std::mt19937 rng(99);
  double total = 0;
  double worst = 0;
  long moves = 0;
  int longest = 0;
  // How many scrambles needed each sub-step (some may already be solved).
  std::array<int, 7> seen{};
  for (int i = 0; i < kScrambles; ++i) {
    FaceletCube cube = cmtest::solvedColored(3);
    cmtest::applyTokens(cube, cmtest::randomScramble(rng, 25, true, true));
    const auto start = Clock::now();
    const SolveResult result = solveCube(3, SolveMethod::kLayerByLayer, cube.f);
    const double ms = millisSince(start);
    REQUIRE(result.ok);
    REQUIRE(replaySolves(cube.f, 3, result));
    int lastStage = 0;
    std::array<bool, 7> present{};
    for (const SolveStep& step : result.steps) {
      // Every step belongs to exactly one of the 7 sub-steps, tagged with
      // the matching crown, and the sub-steps run strictly in order.
      int stage = -1;
      for (int k = 0; k < 7; ++k) {
        if (step.phase == kLblStages[k].phase) stage = k;
      }
      REQUIRE(stage >= 0);
      CHECK(step.crown == kLblStages[stage].crown);
      CHECK(step.subStep == kLblStages[stage].subStep);
      CHECK(stage >= lastStage);  // 1.1 -> 1.2 -> 2.1 -> 3.1 .. 3.4
      lastStage = stage;
      present[stage] = true;
      CHECK(!step.explanation.empty());
      CHECK(step.cubeState.size() == 54);
      for (const Vec3& p : step.highlight) {
        CHECK(std::abs(p.x) <= 2 && std::abs(p.y) <= 2 && std::abs(p.z) <= 2);
      }
      if (step.explanation != "lblOrientExplain" &&
          (step.phase == "lblCross" || step.phase == "lblCorners" || step.phase == "lblMiddle")) {
        CHECK(!step.piece.empty());
        CHECK(step.highlight.size() == 1);
      }
    }
    for (int k = 0; k < 7; ++k) seen[k] += present[k];
    total += ms;
    worst = std::max(worst, ms);
    moves += static_cast<long>(result.steps.size());
    longest = std::max(longest, static_cast<int>(result.steps.size()));
  }
  // The first three sub-steps are needed by every real scramble; the last
  // layer ones by most (a few happen to be done already).
  for (int k = 0; k < 3; ++k) CHECK(seen[k] == kScrambles);
  for (int k = 3; k < 7; ++k) CHECK(seen[k] > kScrambles / 2);
  std::printf("    avg %.3f ms, worst %.3f ms, avg %.1f moves, longest %d\n", total / kScrambles,
              worst, static_cast<double>(moves) / kScrambles, longest);
  std::printf("    sub-steps used: 1.1 %d, 1.2 %d, 2.1 %d, 3.1 %d, 3.2 %d, 3.3 %d, 3.4 %d\n",
              seen[0], seen[1], seen[2], seen[3], seen[4], seen[5], seen[6]);
}

TEST_CASE("lbl: three crowns, seven sub-steps, in order") {
  // A scramble that needs every sub-step: the emitted (crown, sub-step)
  // sequence, with repeats collapsed, is exactly the beginner's syllabus.
  std::mt19937 rng(7);
  bool checked = false;
  for (int attempt = 0; attempt < 50 && !checked; ++attempt) {
    FaceletCube cube = cmtest::solvedColored(3);
    cmtest::applyTokens(cube, cmtest::randomScramble(rng, 25, true, true));
    const SolveResult result = solveCube(3, SolveMethod::kLayerByLayer, cube.f);
    REQUIRE(result.ok);
    std::vector<std::pair<int, int>> order;
    for (const SolveStep& step : result.steps) {
      const std::pair<int, int> stage{step.crown, step.subStep};
      if (order.empty() || order.back() != stage) order.push_back(stage);
    }
    if (order.size() != 7) continue;
    const std::vector<std::pair<int, int>> syllabus = {{1, 1}, {1, 2}, {2, 1}, {3, 1},
                                                      {3, 2}, {3, 3}, {3, 4}};
    CHECK(order == syllabus);
    checked = true;
  }
  CHECK(checked);
}

TEST_CASE("lbl: white goes down first and the cross is built on the bottom") {
  FaceletCube cube = cmtest::solvedColored(3);
  cmtest::applyTokens(cube, {"R", "U", "F'", "L2", "D"});
  const SolveResult result = solveCube(3, SolveMethod::kLayerByLayer, cube.f);
  REQUIRE(result.ok);
  REQUIRE(!result.steps.empty());
  CHECK(result.steps.front().move == "x2");  // white starts on top
  // Holding white down opens 1.1 (white cross).
  CHECK(result.steps.front().phase == "lblCross");
  CHECK(result.steps.front().explanation == "lblOrientExplain");
  CHECK(result.steps.front().crown == 1);
  CHECK(result.steps.front().subStep == 1);
  // Once the cross phase ends, the four bottom edges are white.
  FaceletCube replay = cube;
  for (const SolveStep& step : result.steps) {
    if (step.phase != "lblCross") break;
    cmtest::applyTokens(replay, {step.move});
  }
  for (int i : {1, 3, 5, 7}) CHECK(replay.f[kD * 9 + i] == 'W');
}

TEST_CASE("lbl: JSON carries the crown and sub-step, fast steps do not") {
  FaceletCube cube = cmtest::solvedColored(3);
  cmtest::applyTokens(cube, {"R", "U", "F"});
  const std::string lbl = toJson(solveCube(3, SolveMethod::kLayerByLayer, cube.f));
  CHECK(lbl.find("\"crown\":1,\"subStep\":1") != std::string::npos);
  CHECK(lbl.find("\"crown\":3,\"subStep\":4") != std::string::npos);
  const std::string fast = toJson(solveCube(3, SolveMethod::kFast, cube.f));
  CHECK(fast.find("\"crown\"") == std::string::npos);
}

// ---- FFI bridge --------------------------------------------------------------

TEST_CASE("ffi: cm_solve writes JSON and reports the needed buffer size") {
  CHECK(std::strcmp(cm_version(), "1.3.0") == 0);
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
