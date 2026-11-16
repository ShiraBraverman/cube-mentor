#include "geometry.hpp"

#include <memory>
#include <mutex>
#include <stdexcept>

namespace cm {

int dot(const Vec3& a, const Vec3& b) { return a.x * b.x + a.y * b.y + a.z * b.z; }

Vec3 cross(const Vec3& a, const Vec3& b) {
  return {a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x};
}

int component(const Vec3& v, int axis) {
  return axis == 0 ? v.x : (axis == 1 ? v.y : v.z);
}

Vec3 rotateQuarter(Vec3 v, int axis, int quarterTurns) {
  const int q = ((quarterTurns % 4) + 4) % 4;
  for (int i = 0; i < q; ++i) {
    switch (axis) {
      case 0:
        v = {v.x, -v.z, v.y};
        break;
      case 1:
        v = {v.z, v.y, -v.x};
        break;
      default:
        v = {-v.y, v.x, v.z};
        break;
    }
  }
  return v;
}

namespace {

// Outward normal, screen-right and screen-down of each face seen from
// outside, in URFDLB order (identical to Dart's CubeState._faceFrame).
struct FaceFrame {
  Vec3 normal;
  Vec3 right;
  Vec3 down;
};

constexpr std::array<FaceFrame, 6> kFrames = {{
    {{0, 1, 0}, {1, 0, 0}, {0, 0, 1}},     // U
    {{1, 0, 0}, {0, 0, -1}, {0, -1, 0}},   // R
    {{0, 0, 1}, {1, 0, 0}, {0, -1, 0}},    // F
    {{0, -1, 0}, {1, 0, 0}, {0, 0, -1}},   // D
    {{-1, 0, 0}, {0, 0, 1}, {0, -1, 0}},   // L
    {{0, 0, -1}, {-1, 0, 0}, {0, -1, 0}},  // B
}};

}  // namespace

Vec3 faceNormal(int face) { return kFrames[face].normal; }

int faceOfNormal(const Vec3& normal) {
  for (int face = 0; face < 6; ++face) {
    if (kFrames[face].normal == normal) return face;
  }
  return -1;
}

const CubeGeometry& CubeGeometry::get(int n) {
  if (n < 1 || n > 7) throw std::invalid_argument("unsupported cube size");
  static std::array<std::unique_ptr<CubeGeometry>, 8> cache;
  static std::once_flag once[8];
  std::call_once(once[n], [n] { cache[n] = std::make_unique<CubeGeometry>(n); });
  return *cache[n];
}

CubeGeometry::CubeGeometry(int n) : n_(n) {
  positions_.reserve(6 * n * n);
  normals_.reserve(6 * n * n);
  for (int face = 0; face < 6; ++face) {
    const FaceFrame& frame = kFrames[face];
    for (int row = 0; row < n; ++row) {
      for (int col = 0; col < n; ++col) {
        positions_.push_back(frame.normal * (n - 1) + frame.right * (2 * col - (n - 1)) +
                             frame.down * (2 * row - (n - 1)));
        normals_.push_back(frame.normal);
      }
    }
  }
}

int CubeGeometry::faceletAt(const Vec3& position, const Vec3& normal) const {
  const int face = faceOfNormal(normal);
  if (face < 0) return -1;
  const FaceFrame& frame = kFrames[face];
  if (dot(position, frame.normal) != n_ - 1) return -1;
  const int col = (dot(position, frame.right) + n_ - 1) / 2;
  const int row = (dot(position, frame.down) + n_ - 1) / 2;
  if (row < 0 || row >= n_ || col < 0 || col >= n_) return -1;
  return face * n_ * n_ + row * n_ + col;
}

std::vector<int> CubeGeometry::permutation(const LayerMove& move) const {
  std::vector<int> dest(faceletCount());
  for (int i = 0; i < faceletCount(); ++i) {
    const int layer = (component(positions_[i], move.axis) + n_ - 1) / 2;
    if (layer < move.fromLayer || layer > move.toLayer) {
      dest[i] = i;
      continue;
    }
    dest[i] = faceletAt(rotateQuarter(positions_[i], move.axis, move.quarterTurns),
                        rotateQuarter(normals_[i], move.axis, move.quarterTurns));
  }
  return dest;
}

FaceletCube FaceletCube::solved(int n) {
  FaceletCube cube;
  cube.n = n;
  for (int face = 0; face < 6; ++face) cube.f.append(n * n, kFaceLetters[face]);
  return cube;
}

void FaceletCube::apply(const LayerMove& move) {
  apply(CubeGeometry::get(n).permutation(move));
}

void FaceletCube::apply(const std::vector<int>& permutation) {
  std::string next(f.size(), '?');
  for (size_t i = 0; i < f.size(); ++i) next[permutation[i]] = f[i];
  f.swap(next);
}

bool FaceletCube::isSolved() const {
  const int area = n * n;
  for (int face = 0; face < 6; ++face) {
    for (int i = 1; i < area; ++i) {
      if (f[face * area + i] != f[face * area]) return false;
    }
  }
  return true;
}

}  // namespace cm
