#include "vision/validator.hpp"

#include <algorithm>
#include <set>

#include "core/cubie.hpp"
#include "core/geometry.hpp"

namespace cm::vision {

namespace {

int oppositeFace(int face) { return (face + 3) % 6; }  // URFDLB: U-D, R-L, F-B

int centerIndex(int n, int face) { return face * n * n + (n / 2) * n + n / 2; }

/// Home slot of a corner whose clockwise colors are [col], or -1.
int matchCorner(const CubieFacelets& slots, const CubeGeometry& g,
                const std::array<char, 6>& scheme, const std::array<char, 3>& col) {
  for (int j = 0; j < 8; ++j) {
    const auto& home = slots.corner[j];
    for (int ori = 0; ori < 3; ++ori) {
      if (scheme[g.face(home[0])] == col[ori] && scheme[g.face(home[1])] == col[(ori + 1) % 3] &&
          scheme[g.face(home[2])] == col[(ori + 2) % 3]) {
        return j;
      }
    }
  }
  return -1;
}

/// Home slot of a 3x3 edge with colors [a, b] in either orientation, or -1.
int matchEdge(const CubieFacelets& slots, const CubeGeometry& g, const std::array<char, 6>& scheme,
              char a, char b) {
  for (int j = 0; j < 12; ++j) {
    const char h0 = scheme[g.face(slots.edge[j][0])];
    const char h1 = scheme[g.face(slots.edge[j][1])];
    if ((a == h0 && b == h1) || (a == h1 && b == h0)) return j;
  }
  return -1;
}

std::array<char, 3> cornerColors(const std::string& f, const CubieFacelets& slots, int i) {
  return {f[slots.corner[i][0]], f[slots.corner[i][1]], f[slots.corner[i][2]]};
}

/// Corners that match a distinct home corner under [scheme].
int validCorners(int n, const std::string& f, const std::array<char, 6>& scheme) {
  const CubeGeometry& g = CubeGeometry::get(n);
  const CubieFacelets& slots = cubieFacelets(n);
  std::array<bool, 8> seen{};
  int count = 0;
  for (int i = 0; i < 8; ++i) {
    const int home = matchCorner(slots, g, scheme, cornerColors(f, slots, i));
    if (home >= 0 && !seen[home]) {
      seen[home] = true;
      ++count;
    }
  }
  return count;
}

/// How many stickers of each face already show the scheme's face color.
int dominantScore(int n, const std::string& f, const std::array<char, 6>& scheme) {
  int score = 0;
  for (int face = 0; face < 6; ++face) {
    for (int k = 0; k < n * n; ++k) score += f[face * n * n + k] == scheme[face] ? 1 : 0;
  }
  return score;
}

std::vector<char> distinctColors(const std::string& f) {
  std::vector<char> colors;
  for (char c : f) {
    if (std::find(colors.begin(), colors.end(), c) == colors.end()) colors.push_back(c);
  }
  return colors;
}

double confidenceOf(const std::vector<double>& confidence, int index) {
  return confidence.empty() ? 1.0 : confidence[index];
}

/// Sorts by ascending confidence (stable, so piece order breaks ties).
void sortBySuspicion(std::vector<int>& indices, const std::vector<double>& confidence) {
  std::stable_sort(indices.begin(), indices.end(), [&](int a, int b) {
    return confidenceOf(confidence, a) < confidenceOf(confidence, b);
  });
  indices.erase(std::unique(indices.begin(), indices.end()), indices.end());
}

/// Every piece's facelets: corners for every size, edges for the 3x3.
std::vector<std::vector<int>> pieceFacelets(int n) {
  const CubieFacelets& slots = cubieFacelets(n);
  std::vector<std::vector<int>> pieces;
  for (const auto& corner : slots.corner) pieces.push_back({corner[0], corner[1], corner[2]});
  if (n == 3) {
    for (const auto& edge : slots.edge) pieces.push_back({edge[0], edge[1]});
  }
  return pieces;
}

/// Stickers of the least confident piece among [pieces] (empty when the
/// confidences are unknown: every piece is equally suspect).
std::vector<int> leastConfidentPiece(const std::vector<std::vector<int>>& pieces,
                                     const std::vector<double>& confidence) {
  if (confidence.empty() || pieces.empty()) return {};
  const std::vector<int>* worst = nullptr;
  double worstValue = 2.0;
  for (const auto& piece : pieces) {
    double value = 1.0;
    for (int index : piece) value = std::min(value, confidence[index]);
    if (value < worstValue) {
      worstValue = value;
      worst = &piece;
    }
  }
  return *worst;
}

}  // namespace

const char* scanErrorName(ScanError error) {
  switch (error) {
    case ScanError::kNone: return "none";
    case ScanError::kBadLength: return "badLength";
    case ScanError::kBadColors: return "badColors";
    case ScanError::kBadCenters: return "badCenters";
    case ScanError::kBadPieces: return "badPieces";
    case ScanError::kTwist: return "twist";
    case ScanError::kFlip: return "flip";
    case ScanError::kParity: return "parity";
  }
  return "unknown";
}

bool inferScheme(int n, const std::string& f, std::array<char, 6>& scheme) {
  if (n < 2 || n > 7 || static_cast<int>(f.size()) != 6 * n * n) return false;
  const std::vector<char> colors = distinctColors(f);
  if (colors.size() != 6) return false;

  if (n % 2 == 1) {
    for (int face = 0; face < 6; ++face) scheme[face] = f[centerIndex(n, face)];
    return distinctColors(std::string(scheme.begin(), scheme.end())).size() == 6;
  }

  // Even cubes have no fixed centers. Try every corner as the reference
  // piece (its clockwise colors fix three faces and the chirality) with
  // every placement of the remaining colors on the opposite faces; keep the
  // scheme under which the most corners exist, then the most face-dominant.
  const CubeGeometry& g = CubeGeometry::get(n);
  const CubieFacelets& slots = cubieFacelets(n);
  int bestCorners = -1;
  int bestDominant = -1;
  for (int i = 0; i < 8; ++i) {
    const std::array<char, 3> col = cornerColors(f, slots, i);
    if (col[0] == col[1] || col[1] == col[2] || col[0] == col[2]) continue;
    std::array<int, 3> faces{};
    for (int k = 0; k < 3; ++k) faces[k] = g.face(slots.corner[i][k]);
    std::vector<char> rest;
    for (char c : colors) {
      if (c != col[0] && c != col[1] && c != col[2]) rest.push_back(c);
    }
    std::sort(rest.begin(), rest.end());
    do {
      std::array<char, 6> candidate{};
      for (int k = 0; k < 3; ++k) {
        candidate[faces[k]] = col[k];
        candidate[oppositeFace(faces[k])] = rest[k];
      }
      const int corners = validCorners(n, f, candidate);
      const int dominant = dominantScore(n, f, candidate);
      if (corners > bestCorners || (corners == bestCorners && dominant > bestDominant)) {
        bestCorners = corners;
        bestDominant = dominant;
        scheme = candidate;
      }
    } while (std::next_permutation(rest.begin(), rest.end()));
  }
  if (bestCorners > 0) return true;

  // No usable corner at all: the most frequent color of each face.
  std::vector<char> perm = colors;
  std::sort(perm.begin(), perm.end());
  bestDominant = -1;
  do {
    std::array<char, 6> candidate{};
    std::copy(perm.begin(), perm.end(), candidate.begin());
    const int dominant = dominantScore(n, f, candidate);
    if (dominant > bestDominant) {
      bestDominant = dominant;
      scheme = candidate;
    }
  } while (std::next_permutation(perm.begin(), perm.end()));
  return true;
}

Validation validateCube(int n, const std::string& f, const std::vector<double>& confidence) {
  Validation v;
  const int count = 6 * n * n;
  if (n < 2 || n > 7 || static_cast<int>(f.size()) != count ||
      (!confidence.empty() && static_cast<int>(confidence.size()) != count)) {
    v.error = ScanError::kBadLength;
    return v;
  }
  if (!confidence.empty()) {
    for (int i = 0; i < count; ++i) {
      if (confidence[i] < kUncertainConfidence) v.uncertain.push_back(i);
    }
    sortBySuspicion(v.uncertain, confidence);
  }
  const std::vector<std::vector<int>> pieces = pieceFacelets(n);

  // 1. Exactly six colors with n^2 stickers each.
  const std::vector<char> colors = distinctColors(f);
  bool countsOk = colors.size() == 6;
  for (char c : colors) {
    const int k = static_cast<int>(std::count(f.begin(), f.end(), c));
    if (k == n * n) continue;
    countsOk = false;
    if (k < n * n) continue;
    // Over-represented color: first the stickers that repeat a color on
    // their own piece, then (if known) the least confident ones.
    std::vector<int> strong;
    for (const auto& piece : pieces) {
      int same = 0;
      for (int index : piece) same += f[index] == c ? 1 : 0;
      if (same < 2) continue;
      for (int index : piece) {
        if (f[index] == c) strong.push_back(index);
      }
    }
    sortBySuspicion(strong, confidence);
    v.invalid.insert(v.invalid.end(), strong.begin(), strong.end());
    if (!confidence.empty()) {
      std::vector<int> rest;
      for (int i = 0; i < count; ++i) {
        if (f[i] == c && std::find(strong.begin(), strong.end(), i) == strong.end()) rest.push_back(i);
      }
      sortBySuspicion(rest, confidence);
      const int needed = std::max(0, k - n * n - static_cast<int>(strong.size()));
      v.invalid.insert(v.invalid.end(), rest.begin(),
                       rest.begin() + std::min<int>(needed, static_cast<int>(rest.size())));
    }
  }
  if (!countsOk) {
    v.error = ScanError::kBadColors;
    return v;
  }

  // 2. Odd cubes: six distinct centers.
  if (n % 2 == 1) {
    for (int a = 0; a < 6; ++a) {
      for (int b = a + 1; b < 6; ++b) {
        const int ia = centerIndex(n, a);
        const int ib = centerIndex(n, b);
        if (f[ia] != f[ib]) continue;
        const double ca = confidenceOf(confidence, ia);
        const double cb = confidenceOf(confidence, ib);
        if (ca <= cb) v.invalid.push_back(ia);
        if (cb <= ca) v.invalid.push_back(ib);
      }
    }
    if (!v.invalid.empty()) {
      sortBySuspicion(v.invalid, confidence);
      v.error = ScanError::kBadCenters;
      return v;
    }
  }

  v.hasScheme = inferScheme(n, f, v.scheme);
  if (!v.hasScheme) {
    v.error = ScanError::kBadColors;
    return v;
  }

  // 3. Every corner (and 3x3 edge) must exist exactly once.
  const CubeGeometry& g = CubeGeometry::get(n);
  const CubieFacelets& slots = cubieFacelets(n);
  std::array<std::vector<int>, 8> cornerHolders;
  std::vector<int> bad;
  for (int i = 0; i < 8; ++i) {
    const int home = matchCorner(slots, g, v.scheme, cornerColors(f, slots, i));
    if (home < 0) {
      bad.insert(bad.end(), slots.corner[i].begin(), slots.corner[i].end());
    } else {
      cornerHolders[home].push_back(i);
    }
  }
  for (const auto& holders : cornerHolders) {
    if (holders.size() < 2) continue;
    for (int i : holders) bad.insert(bad.end(), slots.corner[i].begin(), slots.corner[i].end());
  }
  if (n == 3) {
    std::array<std::vector<int>, 12> edgeHolders;
    for (int i = 0; i < 12; ++i) {
      const int home = matchEdge(slots, g, v.scheme, f[slots.edge[i][0]], f[slots.edge[i][1]]);
      if (home < 0) {
        bad.insert(bad.end(), slots.edge[i].begin(), slots.edge[i].end());
      } else {
        edgeHolders[home].push_back(i);
      }
    }
    for (const auto& holders : edgeHolders) {
      if (holders.size() < 2) continue;
      for (int i : holders) bad.insert(bad.end(), slots.edge[i].begin(), slots.edge[i].end());
    }
  }
  if (!bad.empty()) {
    std::sort(bad.begin(), bad.end());
    bad.erase(std::unique(bad.begin(), bad.end()), bad.end());
    sortBySuspicion(bad, confidence);
    v.invalid = bad;
    v.error = ScanError::kBadPieces;
    return v;
  }

  // 4. Orientation and permutation invariants.
  CubieCube cubie;
  switch (toCubie(f, n, v.scheme, cubie)) {
    case CubeError::kNone:
      return v;
    case CubeError::kTwist:
      v.error = ScanError::kTwist;
      v.invalid = leastConfidentPiece({pieces.begin(), pieces.begin() + 8}, confidence);
      break;
    case CubeError::kFlip:
      v.error = ScanError::kFlip;
      v.invalid = leastConfidentPiece({pieces.begin() + 8, pieces.end()}, confidence);
      break;
    case CubeError::kParity:
      v.error = ScanError::kParity;
      v.invalid = leastConfidentPiece(pieces, confidence);
      break;
    default:
      v.error = ScanError::kBadPieces;
      break;
  }
  sortBySuspicion(v.invalid, confidence);
  return v;
}

}  // namespace cm::vision
