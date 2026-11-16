#include "scramble.hpp"

#include <array>
#include <random>
#include <utility>
#include <vector>

#include "../core/cubie.hpp"
#include "../core/notation.hpp"
#include "kociemba.hpp"
#include "solver_2x2.hpp"

namespace cm {

namespace {

// std::uniform_int_distribution differs between standard libraries; a plain
// modulo keeps the daily scramble identical on every platform.
int below(std::mt19937& rng, int bound) { return static_cast<int>(rng() % static_cast<uint32_t>(bound)); }

template <size_t N>
void shuffle(std::array<uint8_t, N>& values, std::mt19937& rng) {
  for (int i = static_cast<int>(N) - 1; i > 0; --i) std::swap(values[i], values[below(rng, i + 1)]);
}

template <size_t N>
int parity(const std::array<uint8_t, N>& p) {
  int inversions = 0;
  for (size_t i = 0; i < N; ++i) {
    for (size_t j = i + 1; j < N; ++j) inversions += p[i] > p[j];
  }
  return inversions & 1;
}

CubieCube randomCubie(std::mt19937& rng, bool withEdges) {
  CubieCube c = CubieCube::identity();
  shuffle(c.cp, rng);
  int twist = 0;
  for (int i = 0; i < 7; ++i) {
    c.co[i] = static_cast<uint8_t>(below(rng, 3));
    twist += c.co[i];
  }
  c.co[7] = static_cast<uint8_t>((3 - twist % 3) % 3);
  if (withEdges) {
    shuffle(c.ep, rng);
    if (parity(c.ep) != parity(c.cp)) std::swap(c.ep[0], c.ep[1]);
    int flip = 0;
    for (int i = 0; i < 11; ++i) {
      c.eo[i] = static_cast<uint8_t>(below(rng, 2));
      flip += c.eo[i];
    }
    c.eo[11] = static_cast<uint8_t>(flip & 1);
  }
  return c;
}

/// Inverse of a face-turn solution, as text.
std::string invert(const std::vector<int>& moves) {
  std::string out;
  for (auto it = moves.rbegin(); it != moves.rend(); ++it) {
    const int inverse = turnFace(*it) * 3 + (3 - turnPower(*it));
    if (!out.empty()) out += ' ';
    out += faceTurnName(inverse);
  }
  return out;
}

std::string scramble3(std::mt19937& rng) {
  KociembaSolver::prepare();
  // Keep the first solution: the improvement phase is time-budgeted, and a
  // seeded scramble (daily challenge) must not depend on the clock.
  KociembaOptions options;
  options.targetLength = 30;
  for (;;) {
    const CubieCube cube = randomCubie(rng, true);
    std::vector<int> moves;
    int phase1 = 0;
    if (KociembaSolver::solveCubie(cube, options, moves, phase1) && moves.size() >= 10) {
      return invert(moves);
    }
  }
}

std::string scramble2(std::mt19937& rng) {
  Solver2x2::prepare();
  for (;;) {
    const std::string f3 = toFacelets3(randomCubie(rng, false), {'U', 'R', 'F', 'D', 'L', 'B'});
    // The corner stickers of the 3x3 net are the whole 2x2 net.
    std::string f2;
    for (int face = 0; face < 6; ++face) {
      for (int i : {0, 2, 6, 8}) f2 += f3[face * 9 + i];
    }
    std::vector<int> moves;
    std::string error;
    if (Solver2x2::solveMoves(f2, moves, error) && moves.size() >= 5) return invert(moves);
  }
}

std::string randomMoves(int n, std::mt19937& rng) {
  static const char kFaces[] = "UDRLFB";
  static const char* kSuffix[] = {"", "'", "2"};
  const int length = n == 4 ? 40 : (n == 5 ? 60 : (n == 6 ? 80 : 100));
  std::string out;
  int lastAxis = -1;
  for (int count = 0; count < length;) {
    const int face = below(rng, 6);
    if (face / 2 == lastAxis) continue;
    lastAxis = face / 2;
    const int depth = 1 + below(rng, n / 2);
    std::string token;
    if (depth == 2) token = std::string(1, kFaces[face]) + "w";
    if (depth > 2) token = std::to_string(depth) + kFaces[face] + "w";
    if (depth == 1) token = std::string(1, kFaces[face]);
    if (!out.empty()) out += ' ';
    out += token + kSuffix[below(rng, 3)];
    ++count;
  }
  return out;
}

}  // namespace

std::string makeScramble(int size, uint32_t seed) {
  std::mt19937 rng(seed);
  if (size == 2) return scramble2(rng);
  if (size == 3) return scramble3(rng);
  if (size >= 4 && size <= 7) return randomMoves(size, rng);
  return "";
}

}  // namespace cm
