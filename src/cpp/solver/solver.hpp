// Solver dispatch and JSON serialization used by the FFI bridge.
#pragma once

#include <string>

#include "solve_step.hpp"

namespace cm {

/// Builds the lookup tables needed for [size] (no-op for unsupported sizes).
void prepareSolvers(int size);

/// Solves a cube given as 6 * size^2 facelets (URFDLB order). Every step
/// carries the cube state before its move.
SolveResult solveCube(int size, SolveMethod method, const std::string& facelets);

/// Serializes a result as compact JSON:
/// {"ok":true,"method":"lbl","millis":1.2,"steps":[{"move":"R","state":"...",
///  "phase":"lblCross","explanation":"lblCrossEdge","piece":"WR",
///  "crown":1,"subStep":1,"highlight":[[2,-2,0]]}]}
/// or {"ok":false,"error":"parity"}. "crown"/"subStep" appear on
/// layer-by-layer steps only.
std::string toJson(const SolveResult& result);

}  // namespace cm
