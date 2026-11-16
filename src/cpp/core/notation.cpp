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
  bool hasPrefix = i > 0;
  // Inner block "2-3Rw": layers 2..3 counted from the face.
  int blockNear = 0;
  if (hasPrefix && i < token.size() && token[i] == '-') {
    blockNear = prefix;
    prefix = 0;
    const size_t start = ++i;
    while (i < token.size() && std::isdigit(static_cast<unsigned char>(token[i]))) {
      prefix = prefix * 10 + (token[i] - '0');
      ++i;
    }
    if (i == start) return false;
  }
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
  if (blockNear > 0 && (letter == 'x' || letter == 'y' || letter == 'z' || letter == 'M' ||
                         letter == 'E' || letter == 'S')) {
    return false;
  }
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
    if (blockNear > 0) {
      if (!wide || blockNear < 1 || blockNear >= prefix || prefix > n) return false;
      move.fromLayer = positive ? n - prefix : blockNear - 1;
      move.toLayer = positive ? n - blockNear : prefix - 1;
    } else if (wide || lower) {
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

std::string moveName(const LayerMove& move, int n) {
  static const char kPositive[] = "RUF";
  static const char kNegative[] = "LDB";
  const int q = ((move.quarterTurns % 4) + 4) % 4;
  // Suffix for a face (or slice) that turns like the face on the given side.
  auto suffix = [q](bool positiveSide) -> std::string {
    if (q == 2) return "2";
    const bool clockwise = positiveSide ? q == 3 : q == 1;
    return clockwise ? "" : "'";
  };
  const int from = move.fromLayer;
  const int to = move.toLayer;
  if (q == 0 || from < 0 || to >= n || from > to) return "";
  if (from == 0 && to == n - 1) return std::string(1, "xyz"[move.axis]) + suffix(true);
  if (from == to && n % 2 == 1 && from == n / 2) {
    // M follows L, E follows D, S follows F.
    return std::string(1, "MES"[move.axis]) + suffix(move.axis == 2);
  }
  if (from == to) {
    const bool positive = from * 2 >= n;
    const int depth = positive ? n - from : from + 1;
    const char face = positive ? kPositive[move.axis] : kNegative[move.axis];
    return (depth == 1 ? std::string() : std::to_string(depth)) + face + suffix(positive);
  }
  if (to == n - 1 || from == 0) {
    const bool positive = to == n - 1;
    const int depth = positive ? n - from : to + 1;
    const char face = positive ? kPositive[move.axis] : kNegative[move.axis];
    return (depth == 2 ? std::string() : std::to_string(depth)) + face + "w" + suffix(positive);
  }
  // Inner block: named from the nearer face.
  const bool positive = from + to >= n - 1;
  const int nearDepth = positive ? n - to : from + 1;
  const int farDepth = positive ? n - from : to + 1;
  const char face = positive ? kPositive[move.axis] : kNegative[move.axis];
  return std::to_string(nearDepth) + "-" + std::to_string(farDepth) + face + "w" +
         suffix(positive);
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
