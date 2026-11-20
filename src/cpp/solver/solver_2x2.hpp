// Optimal 2x2x2 solver.
//
// The DBL corner is kept fixed, so only U, R and F turns are needed and the
// state space is 7! * 3^6 = 3,674,160 positions. A complete breadth-first
// distance table (built once, ~3.7 MB) turns every solve into a greedy walk
// down the table: always optimal in the half-turn metric, in microseconds.
#pragma once

#include <string>
#include <vector>

#include "solve_step.hpp"

namespace cm {

class Solver2x2 {
 public:
  /// Builds the distance table on first use (thread-safe).
  static void prepare();

  /// Solves 24 facelets (URFDLB order). Moves use the cube's current
  /// orientation; any color scheme with opposite colors is accepted.
  static SolveResult solve(const std::string& facelets);

  /// The learner's 2x2 solve in three stages, each the shortest way to its
  /// goal: the bottom layer (the one holding the fixed DBL corner), then
  /// the top face one color, then the remaining corners. Phases
  /// `twoFirstLayer`, `twoTopColor` and `twoFinish`.
  static SolveResult solveGuided(const std::string& facelets);

  /// Optimal move indices (face turns, see notation.hpp), or an error key.
  static bool solveMoves(const std::string& facelets, std::vector<int>& moves,
                         std::string& error);

  /// Number of positions at each distance (God's number check in tests).
  static std::vector<long> distanceHistogram();
};

}  // namespace cm
