// Pedagogical layer-by-layer (beginner's method) 3x3x3 solver.
//
// Three crowns, seven sub-steps (see kLblStages); every step is tagged with
// its crown and sub-step:
//   Crown 1 (first layer)
//     1.1 lblCross               hold white down (one rotation), then the
//                                white cross matching the side centers
//     1.2 lblCorners             white corners with the R U R' U' trigger
//   Crown 2 (middle layer)
//     2.1 lblMiddle              middle-layer edges (right / left insertions)
//   Crown 3 (last layer)
//     3.1 lblYellowCross         F R U R' U' F'
//     3.2 lblYellowEdges         R U R' U R U2 R' U
//     3.3 lblYellowCorners       U R U' L' U R' U' L (position corners)
//     3.4 lblYellowCornersOrient R' D' R D (twist corners), then align U
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
