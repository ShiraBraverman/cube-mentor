// Move notation (WCA style) and the 18 outer face turns used by solvers.
#pragma once

#include <string>
#include <vector>

#include "geometry.hpp"

namespace cm {

/// Outer face turns are indexed `face * 3 + power - 1`, where `face` follows
/// URFDLB order and `power` counts clockwise quarter turns seen from that
/// face (1 = U, 2 = U2, 3 = U').
constexpr int kFaceTurnCount = 18;

inline int turnFace(int move) { return move / 3; }
inline int turnPower(int move) { return move % 3 + 1; }

LayerMove faceTurn(int move, int n);
std::string faceTurnName(int move);

/// Cached facelet permutations of the 18 face turns on a 3x3x3.
const std::vector<int>& faceTurnPermutation3(int move);

/// Parses a single token: face turns (R, U', F2), wide turns (Rw, r, 3Rw),
/// numbered inner layers (2R), inner blocks (2-3Rw: layers 2..3 from R),
/// slices (M, E, S on odd sizes) and whole-cube rotations (x, y, z).
/// Returns false for invalid tokens.
bool parseMove(const std::string& token, int n, LayerMove& out);

/// Standard name of any contiguous layer turn (the inverse of parseMove),
/// e.g. "R'", "2U2", "3Rw", "2-3Lw", "M", "y'". Empty for a null turn.
std::string moveName(const LayerMove& move, int n);

/// Parses whitespace-separated tokens. Optionally returns the tokens.
bool parseSequence(const std::string& text, int n, std::vector<LayerMove>& out,
                   std::vector<std::string>* tokens = nullptr);

}  // namespace cm
