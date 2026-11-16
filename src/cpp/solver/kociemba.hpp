// Kociemba two-phase solver for the 3x3x3.
//
// Phase 1 brings the cube into the subgroup G1 = <U, D, R2, L2, F2, B2>
// (all corners and edges oriented, middle-slice edges in the middle slice).
// Phase 2 solves within G1. Both phases run IDA* over coordinate move tables
// with pruning tables (distance lower bounds):
//   phase 1: slice x twist, slice x flip, twist x flip
//   phase 2: slice permutation x corner permutation,
//            slice permutation x U/D edge permutation
// After the first solution the search keeps looking for shorter ones until
// the time budget runs out or the target length is reached.
#pragma once

#include <string>
#include <vector>

#include "../core/cubie.hpp"
#include "solve_step.hpp"

namespace cm {

struct KociembaOptions {
  /// Stop as soon as a solution of at most this many moves is found
  /// (0 = keep improving until the budget runs out or no shorter one exists).
  int targetLength = 0;
  /// Extra time spent improving after the first solution (milliseconds).
  double improveBudgetMs = 1.5;
  /// Longest phase-2 search tried for each phase-1 solution.
  int maxPhase2 = 12;
};

class KociembaSolver {
 public:
  /// Builds move and pruning tables on first use (thread-safe, ~11 MB).
  static void prepare();

  /// Solves 54 facelets (URFDLB order, faces identified by centers).
  static SolveResult solve(const std::string& facelets, const KociembaOptions& options = {});

  /// Face-turn indices of a solution and the length of its phase-1 part.
  static bool solveCubie(const CubieCube& cube, const KociembaOptions& options,
                         std::vector<int>& moves, int& phase1Length);
};

}  // namespace cm
