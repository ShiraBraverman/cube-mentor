// Cube geometry shared by every solver.
//
// Conventions mirror the Dart model (lib/core/cube/cube_state.dart):
// * Axes: +x = Right, +y = Up, +z = Front.
// * Cubie centers use "doubled" coordinates: coord = 2 * index - (n - 1).
// * A layer turn rotates `quarterTurns` times counter-clockwise around +axis.
// * Facelets are indexed face-major in U R F D L B order, each face row-major
//   as seen from outside in the standard cube net (Kociemba layout).
#pragma once

#include <array>
#include <string>
#include <vector>

namespace cm {

struct Vec3 {
  int x = 0;
  int y = 0;
  int z = 0;

  bool operator==(const Vec3& o) const { return x == o.x && y == o.y && z == o.z; }
  bool operator!=(const Vec3& o) const { return !(*this == o); }
  Vec3 operator+(const Vec3& o) const { return {x + o.x, y + o.y, z + o.z}; }
  Vec3 operator*(int k) const { return {x * k, y * k, z * k}; }
};

int dot(const Vec3& a, const Vec3& b);
Vec3 cross(const Vec3& a, const Vec3& b);
int component(const Vec3& v, int axis);

/// Rotates [v] by `quarterTurns * 90deg` counter-clockwise around +axis.
Vec3 rotateQuarter(Vec3 v, int axis, int quarterTurns);

enum Face : int { kU = 0, kR = 1, kF = 2, kD = 3, kL = 4, kB = 5 };

/// Face letters in facelet order.
constexpr const char* kFaceLetters = "URFDLB";

Vec3 faceNormal(int face);

/// Face index for a unit axis vector, or -1.
int faceOfNormal(const Vec3& normal);

/// A turn of the contiguous layers [fromLayer, toLayer] along [axis].
struct LayerMove {
  int axis = 0;
  int fromLayer = 0;
  int toLayer = 0;
  int quarterTurns = 0;
};

/// Facelet <-> geometry mapping for an n x n x n cube.
class CubeGeometry {
 public:
  /// Cached geometry for sizes 1..7.
  static const CubeGeometry& get(int n);

  explicit CubeGeometry(int n);

  int size() const { return n_; }
  int faceletCount() const { return 6 * n_ * n_; }

  /// Center of the cubie carrying [facelet] (doubled coordinates).
  const Vec3& cubiePosition(int facelet) const { return positions_[facelet]; }
  const Vec3& normal(int facelet) const { return normals_[facelet]; }
  int face(int facelet) const { return facelet / (n_ * n_); }

  /// Facelet on the cubie at [position] facing [normal], or -1.
  int faceletAt(const Vec3& position, const Vec3& normal) const;

  /// result[i] is where the sticker currently at facelet i ends up.
  std::vector<int> permutation(const LayerMove& move) const;

 private:
  int n_;
  std::vector<Vec3> positions_;
  std::vector<Vec3> normals_;
};

/// Sticker colors of an n x n x n cube in facelet order. Colors are opaque
/// characters; faces are identified by their colors, never by letters.
struct FaceletCube {
  int n = 3;
  std::string f;

  /// Solved cube whose stickers are the face letters "URFDLB".
  static FaceletCube solved(int n);

  void apply(const LayerMove& move);
  void apply(const std::vector<int>& permutation);

  /// Every face shows a single color (whole-cube orientation is ignored).
  bool isSolved() const;
};

}  // namespace cm
