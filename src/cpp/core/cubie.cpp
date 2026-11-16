#include "cubie.hpp"

#include <memory>
#include <mutex>

#include "notation.hpp"

namespace cm {

const std::array<Vec3, 8>& cornerSlotUnits() {
  static const std::array<Vec3, 8> units = {{
      {1, 1, 1}, {-1, 1, 1}, {-1, 1, -1}, {1, 1, -1},
      {1, -1, 1}, {-1, -1, 1}, {-1, -1, -1}, {1, -1, -1},
  }};
  return units;
}

const std::array<Vec3, 12>& edgeSlotUnits() {
  static const std::array<Vec3, 12> units = {{
      {1, 1, 0}, {0, 1, 1}, {-1, 1, 0}, {0, 1, -1},
      {1, -1, 0}, {0, -1, 1}, {-1, -1, 0}, {0, -1, -1},
      {1, 0, 1}, {-1, 0, 1}, {-1, 0, -1}, {1, 0, -1},
  }};
  return units;
}

namespace {

CubieFacelets buildFacelets(int n) {
  const CubeGeometry& g = CubeGeometry::get(n);
  const int r = n - 1;
  CubieFacelets out{};
  for (int i = 0; i < 8; ++i) {
    const Vec3 u = cornerSlotUnits()[i];
    const Vec3 pos = u * r;
    const Vec3 ny{0, u.y, 0};
    Vec3 a{u.x, 0, 0};
    Vec3 b{0, 0, u.z};
    // Clockwise seen from outside the corner.
    if (dot(cross(ny, a), b) != -1) std::swap(a, b);
    out.corner[i] = {g.faceletAt(pos, ny), g.faceletAt(pos, a), g.faceletAt(pos, b)};
  }
  for (int i = 0; i < 12; ++i) {
    if (n != 3) {
      out.edge[i] = {-1, -1};
      continue;
    }
    const Vec3 u = edgeSlotUnits()[i];
    const Vec3 pos = u * r;
    Vec3 first;
    Vec3 second;
    if (u.y != 0) {
      first = {0, u.y, 0};
      second = u.x != 0 ? Vec3{u.x, 0, 0} : Vec3{0, 0, u.z};
    } else {
      first = {0, 0, u.z};
      second = {u.x, 0, 0};
    }
    out.edge[i] = {g.faceletAt(pos, first), g.faceletAt(pos, second)};
  }
  return out;
}

}  // namespace

const CubieFacelets& cubieFacelets(int n) {
  static std::array<std::unique_ptr<CubieFacelets>, 8> cache;
  static std::once_flag once[8];
  std::call_once(once[n], [n] { cache[n] = std::make_unique<CubieFacelets>(buildFacelets(n)); });
  return *cache[n];
}

CubieCube CubieCube::identity() {
  CubieCube c;
  for (int i = 0; i < 8; ++i) c.cp[i] = static_cast<uint8_t>(i);
  for (int i = 0; i < 12; ++i) c.ep[i] = static_cast<uint8_t>(i);
  return c;
}

CubieCube multiply(const CubieCube& a, const CubieCube& b) {
  CubieCube c;
  for (int i = 0; i < 8; ++i) {
    c.cp[i] = a.cp[b.cp[i]];
    c.co[i] = static_cast<uint8_t>((a.co[b.cp[i]] + b.co[i]) % 3);
  }
  for (int i = 0; i < 12; ++i) {
    c.ep[i] = a.ep[b.ep[i]];
    c.eo[i] = static_cast<uint8_t>((a.eo[b.ep[i]] + b.eo[i]) & 1);
  }
  return c;
}

const std::array<CubieCube, 18>& moveCubes() {
  static std::array<CubieCube, 18> moves;
  static std::once_flag once;
  std::call_once(once, [] {
    const std::array<char, 6> letters = {'U', 'R', 'F', 'D', 'L', 'B'};
    for (int m = 0; m < kFaceTurnCount; ++m) {
      FaceletCube cube = FaceletCube::solved(3);
      cube.apply(faceTurnPermutation3(m));
      toCubie(cube.f, 3, letters, moves[m]);
    }
  });
  return moves;
}

const char* cubeErrorName(CubeError error) {
  switch (error) {
    case CubeError::kNone: return "none";
    case CubeError::kBadLength: return "badLength";
    case CubeError::kBadColors: return "badColors";
    case CubeError::kBadPieces: return "badPieces";
    case CubeError::kTwist: return "twist";
    case CubeError::kFlip: return "flip";
    case CubeError::kParity: return "parity";
  }
  return "unknown";
}

bool centerColors3(const std::string& facelets, std::array<char, 6>& faceColors) {
  if (facelets.size() != 54) return false;
  for (int face = 0; face < 6; ++face) {
    faceColors[face] = facelets[face * 9 + 4];
    for (int other = 0; other < face; ++other) {
      if (faceColors[other] == faceColors[face]) return false;
    }
  }
  return true;
}

int cornerParity(const CubieCube& c) {
  int parity = 0;
  for (int i = 0; i < 8; ++i)
    for (int j = i + 1; j < 8; ++j) parity ^= c.cp[i] > c.cp[j] ? 1 : 0;
  return parity;
}

int edgeParity(const CubieCube& c) {
  int parity = 0;
  for (int i = 0; i < 12; ++i)
    for (int j = i + 1; j < 12; ++j) parity ^= c.ep[i] > c.ep[j] ? 1 : 0;
  return parity;
}

CubeError toCubie(const std::string& facelets, int n, const std::array<char, 6>& faceColors,
                  CubieCube& out) {
  if (static_cast<int>(facelets.size()) != 6 * n * n) return CubeError::kBadLength;
  for (int face = 0; face < 6; ++face) {
    int count = 0;
    for (char c : facelets) count += c == faceColors[face] ? 1 : 0;
    if (count != n * n) return CubeError::kBadColors;
  }
  const CubeGeometry& g = CubeGeometry::get(n);
  const CubieFacelets& slots = cubieFacelets(n);
  out = CubieCube::identity();

  std::array<bool, 8> seenCorner{};
  int twist = 0;
  for (int i = 0; i < 8; ++i) {
    std::array<char, 3> col;
    for (int k = 0; k < 3; ++k) col[k] = facelets[slots.corner[i][k]];
    int ori = 0;
    while (ori < 3 && col[ori] != faceColors[kU] && col[ori] != faceColors[kD]) ++ori;
    if (ori == 3) return CubeError::kBadPieces;
    int found = -1;
    for (int j = 0; j < 8 && found < 0; ++j) {
      const auto& home = slots.corner[j];
      if (faceColors[g.face(home[0])] == col[ori] &&
          faceColors[g.face(home[1])] == col[(ori + 1) % 3] &&
          faceColors[g.face(home[2])] == col[(ori + 2) % 3]) {
        found = j;
      }
    }
    if (found < 0 || seenCorner[found]) return CubeError::kBadPieces;
    seenCorner[found] = true;
    out.cp[i] = static_cast<uint8_t>(found);
    out.co[i] = static_cast<uint8_t>(ori);
    twist += ori;
  }
  if (twist % 3 != 0) return CubeError::kTwist;
  if (n != 3) return CubeError::kNone;

  std::array<bool, 12> seenEdge{};
  int flip = 0;
  for (int i = 0; i < 12; ++i) {
    const char a = facelets[slots.edge[i][0]];
    const char b = facelets[slots.edge[i][1]];
    int found = -1;
    int ori = 0;
    for (int j = 0; j < 12 && found < 0; ++j) {
      const char h0 = faceColors[g.face(slots.edge[j][0])];
      const char h1 = faceColors[g.face(slots.edge[j][1])];
      if (a == h0 && b == h1) {
        found = j;
      } else if (a == h1 && b == h0) {
        found = j;
        ori = 1;
      }
    }
    if (found < 0 || seenEdge[found]) return CubeError::kBadPieces;
    seenEdge[found] = true;
    out.ep[i] = static_cast<uint8_t>(found);
    out.eo[i] = static_cast<uint8_t>(ori);
    flip += ori;
  }
  if (flip % 2 != 0) return CubeError::kFlip;
  if (cornerParity(out) != edgeParity(out)) return CubeError::kParity;
  return CubeError::kNone;
}

std::string toFacelets3(const CubieCube& cube, const std::array<char, 6>& faceColors) {
  const CubeGeometry& g = CubeGeometry::get(3);
  const CubieFacelets& slots = cubieFacelets(3);
  std::string f(54, '?');
  for (int face = 0; face < 6; ++face) f[face * 9 + 4] = faceColors[face];
  for (int i = 0; i < 8; ++i) {
    const auto& home = slots.corner[cube.cp[i]];
    for (int k = 0; k < 3; ++k) {
      f[slots.corner[i][(k + cube.co[i]) % 3]] = faceColors[g.face(home[k])];
    }
  }
  for (int i = 0; i < 12; ++i) {
    const auto& home = slots.edge[cube.ep[i]];
    for (int k = 0; k < 2; ++k) {
      f[slots.edge[i][(k + cube.eo[i]) % 2]] = faceColors[g.face(home[k])];
    }
  }
  return f;
}

}  // namespace cm
