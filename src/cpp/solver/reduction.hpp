// Reduction method for big cubes (4x4x4 to 6x6x6; the code handles 7x7x7).
//
// Phases, each producing explained, highlighted steps:
//   1. reductionCenters    group each face's center stickers. A short greedy
//                          opening uses free slice turns, then pure center
//                          3-cycles finish the job without disturbing
//                          anything already built.
//   2. reductionEdges      pair the wing edges into dedges with pure wing
//                          3-cycles (centers stay solved).
//      reductionEdgeParity a wing orbit with an odd permutation cannot be
//                          fixed by 3-cycles: one inner-slice quarter turn
//                          flips its parity, then the centers are re-solved.
//   3. reductionOllParity  even cubes: one dedge flipped (classic algorithm)
//      reductionPllParity  even cubes: two dedges swapped (classic algorithm)
//   4. the reduced cube is solved as a 3x3x3 with outer face turns
//      (Kociemba two-phase, or the layer-by-layer method for learners).
//
// The 3-cycles come from a library built once per size: commutators
// [X, Z W Z'] of single layer turns whose supports overlap in exactly one
// piece (so the commutator moves exactly three pieces), closed under setup
// moves until every 3-cycle of every center and wing orbit is covered.
#pragma once

#include <string>
#include <vector>

#include "solve_step.hpp"

namespace cm {

class ReductionSolver {
 public:
  /// Builds the 3-cycle library for cubes of size [n] (thread-safe) and the
  /// 3x3 tables of the final stage.
  static void prepare(int n);

  /// Solves 6 * n^2 facelets (URFDLB order, any 6 colors). [method] picks
  /// the 3x3 stage: kFast (Kociemba) or kLayerByLayer.
  static SolveResult solve(int n, const std::string& facelets, SolveMethod method);

  /// Classic parity algorithms for an even cube, with inner layers grouped
  /// so they act on every wing orbit at once (e.g. "2-3Rw" on a 6x6x6).
  /// OLL parity flips the UF dedge; PLL parity swaps the UF and UB dedges.
  static std::string ollParityAlgorithm(int n);
  static std::string pllParityAlgorithm(int n);

  /// Number of 3-cycles in the library and how many of the possible ones
  /// it covers (tests check full coverage).
  struct Coverage {
    int centerOrbits = 0;
    int wingOrbits = 0;
    int cycles = 0;
    int possible = 0;
  };
  static Coverage coverage(int n);
};

}  // namespace cm
