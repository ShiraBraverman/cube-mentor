#include "kociemba.hpp"

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <mutex>

#include "../core/coords.hpp"
#include "../core/notation.hpp"

namespace cm {
namespace {

using Clock = std::chrono::steady_clock;

constexpr int kMoves = 18;
constexpr int kTwist = 2187;   // 3^7 corner orientations
constexpr int kFlip = 2048;    // 2^11 edge orientations
constexpr int kSlice = 495;    // C(12, 4) positions of the slice edges
constexpr int kCPerm = 40320;  // 8! corner permutations
constexpr int kEPerm = 40320;  // 8! U/D edge permutations (in G1)
constexpr int kSPerm = 24;     // 4! slice edge permutations (in G1)

// G1 generators: U, U2, U', D, D2, D', R2, F2, L2, B2.
constexpr std::array<int, 10> kPhase2Moves = {0, 1, 2, 9, 10, 11, 4, 7, 13, 16};

// ---- Coordinates -----------------------------------------------------------

int twistCoord(const CubieCube& c) {
  int t = 0;
  for (int i = 0; i < 7; ++i) t = t * 3 + c.co[i];
  return t;
}

void setTwist(CubieCube& c, int t) {
  int sum = 0;
  for (int i = 6; i >= 0; --i) {
    c.co[i] = static_cast<uint8_t>(t % 3);
    sum += t % 3;
    t /= 3;
  }
  c.co[7] = static_cast<uint8_t>((3 - sum % 3) % 3);
}

int flipCoord(const CubieCube& c) {
  int f = 0;
  for (int i = 0; i < 11; ++i) f = f * 2 + c.eo[i];
  return f;
}

void setFlip(CubieCube& c, int f) {
  int sum = 0;
  for (int i = 10; i >= 0; --i) {
    c.eo[i] = static_cast<uint8_t>(f & 1);
    sum += f & 1;
    f >>= 1;
  }
  c.eo[11] = static_cast<uint8_t>(sum & 1);
}

struct SliceIndex {
  std::array<int16_t, 4096> ofMask{};
  std::array<uint16_t, kSlice> mask{};
  int goal = 0;

  SliceIndex() {
    ofMask.fill(-1);
    int next = 0;
    for (int m = 0; m < 4096; ++m) {
      int bits = 0;
      for (int b = 0; b < 12; ++b) bits += (m >> b) & 1;
      if (bits != 4) continue;
      ofMask[m] = static_cast<int16_t>(next);
      mask[next++] = static_cast<uint16_t>(m);
    }
    goal = ofMask[0xF00];
  }
};

const SliceIndex& sliceIndex() {
  static const SliceIndex index;
  return index;
}

int sliceCoord(const CubieCube& c) {
  int m = 0;
  for (int j = 0; j < 12; ++j) m |= (c.ep[j] >= FR ? 1 : 0) << j;
  return sliceIndex().ofMask[m];
}

void setSlice(CubieCube& c, int index) {
  const int m = sliceIndex().mask[index];
  int slice = FR;
  int other = UR;
  for (int j = 0; j < 12; ++j) c.ep[j] = static_cast<uint8_t>(((m >> j) & 1) ? slice++ : other++);
}

int cpermCoord(const CubieCube& c) { return permRank<8>(c.cp.data()); }
int epermCoord(const CubieCube& c) { return permRank<8>(c.ep.data()); }

int spermCoord(const CubieCube& c) {
  uint8_t p[4];
  for (int k = 0; k < 4; ++k) p[k] = static_cast<uint8_t>(c.ep[FR + k] - FR);
  return permRank<4>(p);
}

void setSperm(CubieCube& c, int index) {
  uint8_t p[4];
  permUnrank<4>(index, p);
  for (int k = 0; k < 4; ++k) c.ep[FR + k] = static_cast<uint8_t>(FR + p[k]);
}

// ---- Tables ----------------------------------------------------------------

struct Tables {
  std::vector<uint16_t> twistMove, flipMove, sliceMove;
  std::vector<uint16_t> cpermMove, epermMove, spermMove;
  std::vector<int8_t> sliceTwistPrune, sliceFlipPrune, twistFlipPrune;
  std::vector<int8_t> spermCpermPrune, spermEpermPrune;
};

template <typename Next>
void buildPrune(std::vector<int8_t>& table, int size, int start, const int* moves, int moveCount,
                Next next) {
  table.assign(size, -1);
  table[start] = 0;
  std::vector<int> frontier = {start};
  int8_t depth = 0;
  while (!frontier.empty()) {
    std::vector<int> following;
    ++depth;
    for (int s : frontier) {
      for (int k = 0; k < moveCount; ++k) {
        const int n = next(s, moves[k]);
        if (table[n] < 0) {
          table[n] = depth;
          following.push_back(n);
        }
      }
    }
    frontier.swap(following);
  }
}

const Tables& tables() {
  static Tables t;
  static std::once_flag once;
  std::call_once(once, [] {
    const auto& moves = moveCubes();
    t.twistMove.resize(kTwist * kMoves);
    t.flipMove.resize(kFlip * kMoves);
    t.sliceMove.resize(kSlice * kMoves);
    t.cpermMove.resize(kCPerm * kMoves);
    t.epermMove.assign(kEPerm * kMoves, 0);
    t.spermMove.assign(kSPerm * kMoves, 0);
    for (int i = 0; i < kTwist; ++i) {
      CubieCube c = CubieCube::identity();
      setTwist(c, i);
      for (int m = 0; m < kMoves; ++m)
        t.twistMove[i * kMoves + m] = static_cast<uint16_t>(twistCoord(multiply(c, moves[m])));
    }
    for (int i = 0; i < kFlip; ++i) {
      CubieCube c = CubieCube::identity();
      setFlip(c, i);
      for (int m = 0; m < kMoves; ++m)
        t.flipMove[i * kMoves + m] = static_cast<uint16_t>(flipCoord(multiply(c, moves[m])));
    }
    for (int i = 0; i < kSlice; ++i) {
      CubieCube c = CubieCube::identity();
      setSlice(c, i);
      for (int m = 0; m < kMoves; ++m)
        t.sliceMove[i * kMoves + m] = static_cast<uint16_t>(sliceCoord(multiply(c, moves[m])));
    }
    for (int i = 0; i < kCPerm; ++i) {
      CubieCube c = CubieCube::identity();
      permUnrank<8>(i, c.cp.data());
      for (int m = 0; m < kMoves; ++m)
        t.cpermMove[i * kMoves + m] = static_cast<uint16_t>(cpermCoord(multiply(c, moves[m])));
    }
    for (int i = 0; i < kEPerm; ++i) {
      CubieCube c = CubieCube::identity();
      permUnrank<8>(i, c.ep.data());
      for (int m : kPhase2Moves)
        t.epermMove[i * kMoves + m] = static_cast<uint16_t>(epermCoord(multiply(c, moves[m])));
    }
    for (int i = 0; i < kSPerm; ++i) {
      CubieCube c = CubieCube::identity();
      setSperm(c, i);
      for (int m : kPhase2Moves)
        t.spermMove[i * kMoves + m] = static_cast<uint16_t>(spermCoord(multiply(c, moves[m])));
    }

    std::array<int, kMoves> all;
    for (int m = 0; m < kMoves; ++m) all[m] = m;
    const int goal = sliceIndex().goal;
    buildPrune(t.sliceTwistPrune, kSlice * kTwist, goal * kTwist, all.data(), kMoves,
               [&](int s, int m) {
                 return t.sliceMove[(s / kTwist) * kMoves + m] * kTwist +
                        t.twistMove[(s % kTwist) * kMoves + m];
               });
    buildPrune(t.sliceFlipPrune, kSlice * kFlip, goal * kFlip, all.data(), kMoves,
               [&](int s, int m) {
                 return t.sliceMove[(s / kFlip) * kMoves + m] * kFlip +
                        t.flipMove[(s % kFlip) * kMoves + m];
               });
    buildPrune(t.twistFlipPrune, kTwist * kFlip, 0, all.data(), kMoves, [&](int s, int m) {
      return t.twistMove[(s / kFlip) * kMoves + m] * kFlip + t.flipMove[(s % kFlip) * kMoves + m];
    });
    buildPrune(t.spermCpermPrune, kSPerm * kCPerm, 0, kPhase2Moves.data(),
               static_cast<int>(kPhase2Moves.size()), [&](int s, int m) {
                 return t.spermMove[(s / kCPerm) * kMoves + m] * kCPerm +
                        t.cpermMove[(s % kCPerm) * kMoves + m];
               });
    buildPrune(t.spermEpermPrune, kSPerm * kEPerm, 0, kPhase2Moves.data(),
               static_cast<int>(kPhase2Moves.size()), [&](int s, int m) {
                 return t.spermMove[(s / kEPerm) * kMoves + m] * kEPerm +
                        t.epermMove[(s % kEPerm) * kMoves + m];
               });
  });
  return t;
}

// Canonical move order: never turn the same face twice in a row, and turn
// opposite faces in a fixed order (U before D, R before L, F before B).
inline bool redundant(int face, int lastFace) {
  return lastFace >= 0 && (face == lastFace || face + 3 == lastFace);
}

// ---- Search ----------------------------------------------------------------

// Best solution shared by the searches over several cube orientations.
struct SharedBest {
  KociembaOptions options;
  std::vector<int> moves;
  int phase1Length = 0;
  int orientation = -1;
  int length = 31;
  bool found = false;
  bool stop = false;
  long nodes = 0;
  Clock::time_point deadline = Clock::time_point::max();

  void tick() {
    if ((++nodes & 1023) == 0 && found && Clock::now() > deadline) stop = true;
  }
};

class Search {
 public:
  Search(const Tables& t, const CubieCube& cube, int orientation, SharedBest& shared)
      : t_(t),
        cube_(cube),
        orientation_(orientation),
        shared_(shared),
        twist_(twistCoord(cube)),
        flip_(flipCoord(cube)),
        slice_(sliceCoord(cube)) {}

  /// Tries every phase-1 solution of exactly [depth1] moves.
  void searchDepth(int depth1) { phase1(twist_, flip_, slice_, 0, depth1, -1); }

 private:
  void phase1(int twist, int flip, int slice, int depth, int togo, int lastFace) {
    if (togo == 0) {
      if (twist == 0 && flip == 0 && slice == sliceIndex().goal) {
        // A phase-1 solution ending in a G1 move would have a shorter twin.
        const bool canonical =
            depth == 0 || (path1_[depth - 1] % 3 != 1 && turnFace(path1_[depth - 1]) % 3 != 0);
        if (canonical) phase2(depth);
      }
      return;
    }
    shared_.tick();
    for (int m = 0; m < kMoves && !shared_.stop; ++m) {
      const int face = turnFace(m);
      if (redundant(face, lastFace)) continue;
      const int nt = t_.twistMove[twist * kMoves + m];
      const int ns = t_.sliceMove[slice * kMoves + m];
      if (t_.sliceTwistPrune[ns * kTwist + nt] >= togo) continue;
      const int nf = t_.flipMove[flip * kMoves + m];
      if (t_.sliceFlipPrune[ns * kFlip + nf] >= togo) continue;
      if (t_.twistFlipPrune[nt * kFlip + nf] >= togo) continue;
      path1_[depth] = m;
      phase1(nt, nf, ns, depth + 1, togo - 1, face);
    }
  }

  void phase2(int depth1) {
    // Long phase-2 searches are expensive; a slightly longer phase 1 almost
    // always leaves a short phase 2.
    const int maxDepth2 = std::min(shared_.length - 1 - depth1, shared_.options.maxPhase2);
    if (maxDepth2 < 0) return;
    CubieCube c = cube_;
    for (int i = 0; i < depth1; ++i) c = multiply(c, moveCubes()[path1_[i]]);
    const int cp = cpermCoord(c);
    const int ep = epermCoord(c);
    const int sp = spermCoord(c);
    const int h = std::max(t_.spermCpermPrune[sp * kCPerm + cp], t_.spermEpermPrune[sp * kEPerm + ep]);
    if (h > maxDepth2) return;
    const int lastFace = depth1 > 0 ? turnFace(path1_[depth1 - 1]) : -1;
    for (int depth2 = h; depth2 <= maxDepth2 && !shared_.stop; ++depth2) {
      if (!search2(cp, ep, sp, 0, depth2, lastFace)) continue;
      shared_.moves.assign(path1_.begin(), path1_.begin() + depth1);
      shared_.moves.insert(shared_.moves.end(), path2_.begin(), path2_.begin() + depth2);
      shared_.length = depth1 + depth2;
      shared_.phase1Length = depth1;
      shared_.orientation = orientation_;
      if (!shared_.found) {
        shared_.found = true;
        shared_.deadline = Clock::now() + std::chrono::microseconds(static_cast<long long>(
                                              shared_.options.improveBudgetMs * 1000));
      }
      if (shared_.length <= shared_.options.targetLength) shared_.stop = true;
      return;
    }
  }

  bool search2(int cp, int ep, int sp, int depth, int togo, int lastFace) {
    if (togo == 0) return cp == 0 && ep == 0 && sp == 0;
    shared_.tick();
    if (shared_.stop) return false;
    for (int m : kPhase2Moves) {
      const int face = turnFace(m);
      if (redundant(face, lastFace)) continue;
      const int ncp = t_.cpermMove[cp * kMoves + m];
      const int nsp = t_.spermMove[sp * kMoves + m];
      if (t_.spermCpermPrune[nsp * kCPerm + ncp] >= togo) continue;
      const int nep = t_.epermMove[ep * kMoves + m];
      if (t_.spermEpermPrune[nsp * kEPerm + nep] >= togo) continue;
      path2_[depth] = m;
      if (search2(ncp, nep, nsp, depth + 1, togo - 1, face)) return true;
    }
    return false;
  }

  const Tables& t_;
  CubieCube cube_;
  int orientation_;
  SharedBest& shared_;
  int twist_;
  int flip_;
  int slice_;
  std::array<int, 32> path1_{};
  std::array<int, 32> path2_{};
};

/// Interleaves the searches by phase-1 depth so that whichever orientation
/// is easiest finds the first solution.
void runSearches(const std::vector<CubieCube>& cubes, SharedBest& shared) {
  const Tables& t = tables();
  std::vector<Search> searches;
  for (size_t i = 0; i < cubes.size(); ++i) {
    searches.emplace_back(t, cubes[i], static_cast<int>(i), shared);
  }
  for (int depth1 = 0; depth1 <= 20 && depth1 < shared.length && !shared.stop; ++depth1) {
    for (Search& search : searches) {
      if (shared.stop || depth1 >= shared.length) break;
      search.searchDepth(depth1);
    }
  }
}

// Whole-cube rotations that put each axis vertical in turn.
constexpr const char* kOrientations[] = {"", "z", "x"};

}  // namespace

void KociembaSolver::prepare() { tables(); }

bool KociembaSolver::solveCubie(const CubieCube& cube, const KociembaOptions& options,
                                std::vector<int>& moves, int& phase1Length) {
  SharedBest shared;
  shared.options = options;
  runSearches({cube}, shared);
  if (!shared.found) return false;
  moves = shared.moves;
  phase1Length = shared.phase1Length;
  return true;
}

SolveResult KociembaSolver::solve(const std::string& facelets, const KociembaOptions& options) {
  const auto start = Clock::now();
  SolveResult result;
  result.method = "kociemba";
  std::array<char, 6> colors;
  if (facelets.size() != 54) {
    result.error = cubeErrorName(CubeError::kBadLength);
    return result;
  }
  if (!centerColors3(facelets, colors)) {
    result.error = cubeErrorName(CubeError::kBadColors);
    return result;
  }
  CubieCube cube;
  const CubeError status = toCubie(facelets, 3, colors, cube);
  if (status != CubeError::kNone) {
    result.error = cubeErrorName(status);
    return result;
  }

  // The same cube seen with each axis vertical; faceMap[o][f] is the face
  // of the real cube that plays face f in orientation o.
  std::vector<CubieCube> cubes;
  std::vector<std::array<int, 6>> faceMap;
  for (const char* token : kOrientations) {
    FaceletCube rotated{3, facelets};
    std::array<int, 6> map = {0, 1, 2, 3, 4, 5};
    LayerMove rotation;
    if (parseMove(token, 3, rotation)) {
      rotated.apply(rotation);
      for (int f = 0; f < 6; ++f) {
        map[f] = faceOfNormal(rotateQuarter(faceNormal(f), rotation.axis, 4 - rotation.quarterTurns));
      }
    }
    std::array<char, 6> rotatedColors;
    CubieCube c;
    if (!centerColors3(rotated.f, rotatedColors) ||
        toCubie(rotated.f, 3, rotatedColors, c) != CubeError::kNone) {
      continue;
    }
    cubes.push_back(c);
    faceMap.push_back(map);
  }

  SharedBest shared;
  shared.options = options;
  runSearches(cubes, shared);
  if (!shared.found) {
    result.error = "notFound";
    return result;
  }
  const std::array<int, 6>& map = faceMap[shared.orientation];
  for (size_t i = 0; i < shared.moves.size(); ++i) {
    const int m = shared.moves[i];
    SolveStep step;
    step.move = faceTurnName(map[turnFace(m)] * 3 + m % 3);
    const bool first = static_cast<int>(i) < shared.phase1Length;
    step.phase = first ? "kociembaPhase1" : "kociembaPhase2";
    step.explanation = first ? "kociembaPhase1Explain" : "kociembaPhase2Explain";
    result.steps.push_back(step);
  }
  result.ok = true;
  result.millis = std::chrono::duration<double, std::milli>(Clock::now() - start).count();
  return result;
}

}  // namespace cm
