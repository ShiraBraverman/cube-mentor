// Pedagogical layer-by-layer (beginner's method) 3x3x3 solver.
//
// Phases, each producing explained, highlighted steps:
//   1. lblOrient              hold the cube with the white center down
//   2. lblCross               white cross, one edge at a time (shortest moves)
//   3. lblCorners             white corners with the R U R' U' trigger
//   4. lblMiddle              middle-layer edges (right / left insertions)
//   5. lblYellowCross         F R U R' U' F'
//   6. lblYellowEdges         R U R' U R U2 R' U
//   7. lblYellowCorners       U R U' L' U R' U' L (place corners)
//   8. lblYellowCornersOrient R' D' R D (twist corners), then align U
#pragma once

#include <string>

#include "solve_step.hpp"

namespace cm {

class LblSolver {
 public:
  /// Solves 54 facelets (URFDLB order, faces identified by centers). The
  /// first layer uses the 'W' color when present, else the bottom center.
  static SolveResult solve(const std::string& facelets);
};

}  // namespace cm
