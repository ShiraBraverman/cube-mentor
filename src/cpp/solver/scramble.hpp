// Offline scrambles for the speed timer and the daily challenge.
//
// * 2x2x2 and 3x3x3: random-state scrambles (WCA style): a uniformly random
//   solvable position is generated and solved; the scramble is the inverse
//   of that solution.
// * 4x4x4 to 7x7x7: random-move scrambles with outer and wide turns, never
//   turning the same axis twice in a row (csTimer's fallback).
//
// The same seed always gives the same scramble (daily challenge).
#pragma once

#include <cstdint>
#include <string>

namespace cm {

/// Space-separated scramble for a cube of [size], or "" if unsupported.
std::string makeScramble(int size, uint32_t seed);

}  // namespace cm
