// Cube model: geometry, notation, cubie conversion and validation.
#include <random>

#include "core/cubie.hpp"
#include "test_framework.hpp"

using namespace cm;

TEST_CASE("geometry: every move is a permutation and face turns have order 4") {
  for (int n = 1; n <= 6; ++n) {
    const CubeGeometry& g = CubeGeometry::get(n);
    for (int m = 0; m < kFaceTurnCount; ++m) {
      std::vector<int> p = g.permutation(faceTurn(m, n));
      std::vector<bool> hit(p.size(), false);
      for (int d : p) {
        REQUIRE(d >= 0 && d < static_cast<int>(p.size()));
        CHECK(!hit[d]);
        hit[d] = true;
      }
      FaceletCube cube = FaceletCube::solved(n);
      for (int i = 0; i < 4; ++i) cube.apply(faceTurn(m - m % 3, n));
      CHECK(cube.f == FaceletCube::solved(n).f);
    }
  }
}

TEST_CASE("notation: parses like the Dart model") {
  LayerMove m;
  REQUIRE(parseMove("R", 3, m));
  CHECK(m.axis == 0 && m.fromLayer == 2 && m.toLayer == 2 && m.quarterTurns == 3);
  REQUIRE(parseMove("L", 3, m));
  CHECK(m.axis == 0 && m.fromLayer == 0 && m.quarterTurns == 1);
  REQUIRE(parseMove("U'", 3, m));
  CHECK(m.axis == 1 && m.fromLayer == 2 && m.quarterTurns == 1);
  REQUIRE(parseMove("3Rw", 6, m));
  CHECK(m.fromLayer == 3 && m.toLayer == 5 && m.quarterTurns == 3);
  REQUIRE(parseMove("M", 3, m));
  CHECK(m.axis == 0 && m.fromLayer == 1 && m.quarterTurns == 1);
  REQUIRE(parseMove("S", 3, m));
  CHECK(m.axis == 2 && m.quarterTurns == 3);
  REQUIRE(parseMove("z2", 4, m));
  CHECK(m.axis == 2 && m.fromLayer == 0 && m.toLayer == 3 && m.quarterTurns == 2);
  CHECK(!parseMove("M", 4, m));
  CHECK(!parseMove("Q", 3, m));
  CHECK(!parseMove("R3", 3, m));
  for (int i = 0; i < kFaceTurnCount; ++i) {
    REQUIRE(parseMove(faceTurnName(i), 3, m));
    const LayerMove expected = faceTurn(i, 3);
    CHECK(m.axis == expected.axis && m.fromLayer == expected.fromLayer &&
          m.quarterTurns == expected.quarterTurns);
  }
}

TEST_CASE("notation: R moves the front stickers up (clockwise seen from the right)") {
  FaceletCube cube = cmtest::solvedColored(3);
  cmtest::applyTokens(cube, {"R"});
  // Right column of U (facelets 2, 5, 8) now shows the front color.
  CHECK(cube.f[2] == 'G' && cube.f[5] == 'G' && cube.f[8] == 'G');
  // Right column of F (facelets 20, 23, 26) now shows the bottom color.
  CHECK(cube.f[20] == 'Y' && cube.f[26] == 'Y');
}

TEST_CASE("cubie: slots, move cubes and identities") {
  const auto& moves = moveCubes();
  for (int m = 0; m < 18; m += 3) {
    CubieCube c = CubieCube::identity();
    for (int i = 0; i < 4; ++i) c = multiply(c, moves[m]);
    CHECK(c == CubieCube::identity());
  }
  // Kociemba's reference move R.
  const CubieCube& r = moves[3];
  const uint8_t cpR[8] = {DFR, UFL, ULB, URF, DRB, DLF, DBL, UBR};
  const uint8_t coR[8] = {2, 0, 0, 1, 1, 0, 0, 2};
  const uint8_t epR[12] = {FR, UF, UL, UB, BR, DF, DL, DB, DR, FL, BL, UR};
  for (int i = 0; i < 8; ++i) CHECK(r.cp[i] == cpR[i] && r.co[i] == coR[i]);
  for (int i = 0; i < 12; ++i) CHECK(r.ep[i] == epR[i] && r.eo[i] == 0);
  // F flips four edges.
  int flips = 0;
  for (int i = 0; i < 12; ++i) flips += moves[6].eo[i];
  CHECK(flips == 4);
  // (R U R' U') has order 6.
  CubieCube sexy = CubieCube::identity();
  for (int m : {3, 0, 5, 2}) sexy = multiply(sexy, moves[m]);
  CubieCube power = CubieCube::identity();
  for (int i = 1; i <= 6; ++i) {
    power = multiply(power, sexy);
    CHECK((power == CubieCube::identity()) == (i == 6));
  }
}

TEST_CASE("cubie: facelet moves and cubie products agree on random sequences") {
  std::mt19937 rng(7);
  const std::array<char, 6> colors = {'W', 'R', 'G', 'Y', 'O', 'B'};
  for (int round = 0; round < 300; ++round) {
    FaceletCube cube = cmtest::solvedColored(3);
    CubieCube expected = CubieCube::identity();
    for (int i = 0; i < 25; ++i) {
      const int m = static_cast<int>(rng() % 18);
      cube.apply(faceTurnPermutation3(m));
      expected = multiply(expected, moveCubes()[m]);
    }
    CubieCube actual;
    REQUIRE(toCubie(cube.f, 3, colors, actual) == CubeError::kNone);
    CHECK(actual == expected);
    CHECK(toFacelets3(actual, colors) == cube.f);
  }
}

TEST_CASE("cubie: invalid cubes are rejected with a reason") {
  const std::array<char, 6> colors = {'W', 'R', 'G', 'Y', 'O', 'B'};
  CubieCube c;
  const FaceletCube solved = cmtest::solvedColored(3);
  CHECK(toCubie(solved.f, 3, colors, c) == CubeError::kNone);

  CubieCube twisted = CubieCube::identity();
  twisted.co[URF] = 1;
  CHECK(toCubie(toFacelets3(twisted, colors), 3, colors, c) == CubeError::kTwist);

  CubieCube flipped = CubieCube::identity();
  flipped.eo[UF] = 1;
  CHECK(toCubie(toFacelets3(flipped, colors), 3, colors, c) == CubeError::kFlip);

  CubieCube swapped = CubieCube::identity();
  std::swap(swapped.ep[UF], swapped.ep[UR]);
  CHECK(toCubie(toFacelets3(swapped, colors), 3, colors, c) == CubeError::kParity);

  std::string wrong = solved.f;
  wrong[0] = 'Y';
  CHECK(toCubie(wrong, 3, colors, c) == CubeError::kBadColors);

  std::string impossible = solved.f;
  std::swap(impossible[1], impossible[46]);  // swap two stickers of different edges
  CHECK(toCubie(impossible, 3, colors, c) != CubeError::kNone);
  CHECK(toCubie("WRG", 3, colors, c) == CubeError::kBadLength);
}
