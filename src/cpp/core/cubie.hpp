// Cubie-level representation (corner/edge permutation and orientation) in
// Kociemba's conventions, derived from the facelet geometry.
#pragma once

#include <array>
#include <cstdint>
#include <string>

#include "geometry.hpp"

namespace cm {

enum Corner : int { URF, UFL, ULB, UBR, DFR, DLF, DBL, DRB };
enum Edge : int { UR, UF, UL, UB, DR, DF, DL, DB, FR, FL, BL, BR };

/// Unit position (signs) of each corner / edge slot.
const std::array<Vec3, 8>& cornerSlotUnits();
const std::array<Vec3, 12>& edgeSlotUnits();

/// Facelets of every corner and edge slot for an n x n x n cube (edges only
/// for n == 3). Corner facelets start with the U/D sticker and continue
/// clockwise; edge facelets start with the U/D sticker, else the F/B one.
struct CubieFacelets {
  std::array<std::array<int, 3>, 8> corner;
  std::array<std::array<int, 2>, 12> edge;
};
const CubieFacelets& cubieFacelets(int n);

struct CubieCube {
  std::array<uint8_t, 8> cp{};
  std::array<uint8_t, 8> co{};
  std::array<uint8_t, 12> ep{};
  std::array<uint8_t, 12> eo{};

  static CubieCube identity();
  bool operator==(const CubieCube& o) const {
    return cp == o.cp && co == o.co && ep == o.ep && eo == o.eo;
  }
};

/// `a * b`: apply b after a (b is usually a move).
CubieCube multiply(const CubieCube& a, const CubieCube& b);

/// The 18 face turns as cubie cubes (derived from the facelet geometry).
const std::array<CubieCube, 18>& moveCubes();

enum class CubeError {
  kNone = 0,
  kBadLength,
  kBadColors,   // wrong color counts or centers
  kBadPieces,   // a sticker combination that does not exist
  kTwist,       // one corner twisted
  kFlip,        // one edge flipped
  kParity,      // two pieces swapped
};

const char* cubeErrorName(CubeError error);

/// Reads corners (and edges when n == 3) from facelet colors, given the color
/// of each face in URFDLB order. Validates piece uniqueness and invariants.
CubeError toCubie(const std::string& facelets, int n, const std::array<char, 6>& faceColors,
                  CubieCube& out);

/// Writes a 3x3 cubie cube back to facelets colored with [faceColors].
std::string toFacelets3(const CubieCube& cube, const std::array<char, 6>& faceColors);

/// Face colors of a 3x3 read from its centers, or false if not 6 distinct.
bool centerColors3(const std::string& facelets, std::array<char, 6>& faceColors);

int cornerParity(const CubieCube& c);
int edgeParity(const CubieCube& c);

}  // namespace cm
