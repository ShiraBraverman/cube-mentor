#include "notation.hpp"

#include <array>
#include <cctype>
#include <mutex>
#include <sstream>

namespace cm {

namespace {

// Rotation axis of each face and whether it lies on the positive side.
constexpr std::array<int, 6> kFaceAxis = {1, 0, 2, 1, 0, 2};
constexpr std::array<bool, 6> kFacePositive = {true, true, true, false, false, false};

int faceIndex(char letter) {
  switch (letter) {
    case 'U': return kU;
    case 'R': return kR;
    case 'F': return kF;
    case 'D': return kD;
    case 'L': return kL;
    case 'B': return kB;
    default: return -1;
  }
}

// Counter-clockwise quarter turns around +axis for one clockwise quarter
// turn seen from the given side.
int baseQuarterTurns(bool positiveSide) { return positiveSide ? 3 : 1; }

}  // namespace

LayerMove faceTurn(int move, int n) {
  const int face = turnFace(move);
  const int power = turnPower(move);
  const bool positive = kFacePositive[face];
  const int layer = positive ? n - 1 : 0;
  const int q = (baseQuarterTurns(positive) * power) % 4;
  return {kFaceAxis[face], layer, layer, q};
}

std::string faceTurnName(int move) {
  std::string name(1, kFaceLetters[turnFace(move)]);
  const int power = turnPower(move);
  if (power == 2) name += '2';
  if (power == 3) name += '\'';
  return name;
}

const std::vector<int>& faceTurnPermutation3(int move) {
  static std::array<std::vector<int>, kFaceTurnCount> perms;
  static std::once_flag once;
  std::call_once(once, [] {
    const CubeGeometry& geometry = CubeGeometry::get(3);
    for (int m = 0; m < kFaceTurnCount; ++m) perms[m] = geometry.permutation(faceTurn(m, 3));
  });
  return perms[move];
}

bool parseMove(const std::string& token, int n, LayerMove& out) {
  size_t i = 0;
  int prefix = 0;
  while (i < token.size() && std::isdigit(static_cast<unsigned char>(token[i]))) {
    prefix = prefix * 10 + (token[i] - '0');
    ++i;
  }
  const bool hasPrefix = i > 0;
  if (i >= token.size()) return false;
  const char letter = token[i++];
  bool wide = false;
  if (i < token.size() && token[i] == 'w') {
    wide = true;
    ++i;
  }
  const std::string suffix = token.substr(i);
  int multiplier;
  if (suffix.empty()) {
    multiplier = 1;
  } else if (suffix == "'") {
    multiplier = 3;
  } else if (suffix == "2" || suffix == "2'") {
    multiplier = 2;
  } else {
    return false;
  }

  LayerMove move;
  int base;
  if (letter == 'x' || letter == 'y' || letter == 'z') {
    if (hasPrefix || wide) return false;
    move.axis = letter == 'x' ? 0 : (letter == 'y' ? 1 : 2);
    move.fromLayer = 0;
    move.toLayer = n - 1;
    base = 3;
  } else if (letter == 'M' || letter == 'E' || letter == 'S') {
    if (hasPrefix || wide || n % 2 == 0) return false;
    move.axis = letter == 'M' ? 0 : (letter == 'E' ? 1 : 2);
    move.fromLayer = move.toLayer = n / 2;
    base = letter == 'S' ? 3 : 1;
  } else {
    const bool lower = std::islower(static_cast<unsigned char>(letter)) != 0;
    const int face = faceIndex(static_cast<char>(std::toupper(static_cast<unsigned char>(letter))));
    if (face < 0) return false;
    if (lower && (wide || hasPrefix)) return false;
    const bool positive = kFacePositive[face];
    move.axis = kFaceAxis[face];
    base = baseQuarterTurns(positive);
    if (wide || lower) {
      const int depth = hasPrefix ? prefix : 2;
      if (depth < 2 || depth > n) return false;
      move.fromLayer = positive ? n - depth : 0;
      move.toLayer = positive ? n - 1 : depth - 1;
    } else {
      const int depth = hasPrefix ? prefix : 1;
      if (depth < 1 || depth > n) return false;
      move.fromLayer = move.toLayer = positive ? n - depth : depth - 1;
    }
  }
  move.quarterTurns = (base * multiplier) % 4;
  out = move;
  return true;
}

bool parseSequence(const std::string& text, int n, std::vector<LayerMove>& out,
                   std::vector<std::string>* tokens) {
  std::istringstream stream(text);
  std::string token;
  while (stream >> token) {
    LayerMove move;
    if (!parseMove(token, n, move)) return false;
    out.push_back(move);
    if (tokens != nullptr) tokens->push_back(token);
  }
  return true;
}

}  // namespace cm
