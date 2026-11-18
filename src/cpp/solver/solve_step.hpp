// Structured solution output shared by every solver.
//
// Each step is one move with the metadata the Academy and the future AI
// Coach need: the cube state before the move, the phase, an explanation key
// (localized on the Dart side) and the pieces to highlight.
#pragma once

#include <string>
#include <vector>

#include "../core/geometry.hpp"

namespace cm {

struct SolveStep {
  /// Move token, e.g. "R", "U2", "x'".
  std::string move;
  /// Facelets (URFDLB order) before the move.
  std::string cubeState;
  /// Phase key, e.g. "lblCross" or "kociembaPhase1".
  std::string phase;
  /// Explanation key for the sub-goal this move belongs to.
  std::string explanation;
  /// Sticker colors of the piece being solved (may be empty), e.g. "WR".
  std::string piece;
  /// Cubie positions (doubled coordinates) to highlight before the move.
  std::vector<Vec3> highlight;
  /// Beginner's-method stage: crown 1..3 (first layer, middle layer, last
  /// layer) and the sub-step within it (1.1, 1.2, 2.1, 3.1 .. 3.4). Zero
  /// for steps outside the layer-by-layer method.
  int crown = 0;
  int subStep = 0;
};

/// The seven layer-by-layer phases in solving order, grouped into the three
/// crowns of the classic beginner's method.
struct LblStage {
  const char* phase;
  int crown;
  int subStep;
};

inline constexpr LblStage kLblStages[7] = {
    {"lblCross", 1, 1},          // 1.1 white cross matching the side centers
    {"lblCorners", 1, 2},        // 1.2 first-crown corners
    {"lblMiddle", 2, 1},         // 2.1 middle-layer edges
    {"lblYellowCross", 3, 1},    // 3.1 yellow cross
    {"lblYellowEdges", 3, 2},    // 3.2 align the yellow cross edges
    {"lblYellowCorners", 3, 3},  // 3.3 position the yellow corners
    {"lblYellowCornersOrient", 3, 4},  // 3.4 orient the yellow corners
};

enum class SolveMethod : int {
  /// Optimal 2x2 / Kociemba two-phase 3x3.
  kFast = 1,
  /// Layer-by-layer pedagogical solver (3x3).
  kLayerByLayer = 2,
};

struct SolveResult {
  bool ok = false;
  /// Error key when !ok (e.g. "parity", "unsupported").
  std::string error;
  std::string method;
  std::vector<SolveStep> steps;
  double millis = 0;
};

}  // namespace cm
