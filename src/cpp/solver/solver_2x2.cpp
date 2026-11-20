#include "solver_2x2.hpp"

#include <chrono>
#include <cstdint>
#include <mutex>
#include <set>

#include "../core/coords.hpp"
#include "../core/cubie.hpp"
#include "../core/notation.hpp"

namespace cm {

namespace {

constexpr int kPermCount = 5040;  // 7!
constexpr int kTwistCount = 729;  // 3^6
constexpr int kStateCount = kPermCount * kTwistCount;
constexpr int kMoveCount = 9;     // U, R, F turns (indices 0..8)

// Corner slots other than the fixed DBL corner.
constexpr int kSlots[7] = {URF, UFL, ULB, UBR, DFR, DLF, DRB};

int compact(int piece) { return piece == DRB ? DBL : piece; }
int expand(int index) { return index == DBL ? DRB : index; }

int permCoord(const CubieCube& c) {
  uint8_t p[7];
  for (int k = 0; k < 7; ++k) p[k] = static_cast<uint8_t>(compact(c.cp[kSlots[k]]));
  return permRank<7>(p);
}

void setPerm(CubieCube& c, int rank) {
  uint8_t p[7];
  permUnrank<7>(rank, p);
  for (int k = 0; k < 7; ++k) c.cp[kSlots[k]] = static_cast<uint8_t>(expand(p[k]));
  c.cp[DBL] = DBL;
}

int twistCoord(const CubieCube& c) {
  int t = 0;
  for (int k = 0; k < 6; ++k) t = t * 3 + c.co[kSlots[k]];
  return t;
}

void setTwist(CubieCube& c, int t) {
  int sum = 0;
  for (int k = 5; k >= 0; --k) {
    c.co[kSlots[k]] = static_cast<uint8_t>(t % 3);
    sum += t % 3;
    t /= 3;
  }
  c.co[DBL] = 0;
  c.co[DRB] = static_cast<uint8_t>((3 - sum % 3) % 3);
}

struct Tables {
  std::vector<uint16_t> permMove;
  std::vector<uint16_t> twistMove;
  std::vector<int8_t> distance;
  /// Guided stages: distance to "bottom layer done" and to "bottom layer
  /// done, top one color" (multi-source BFS from every goal position).
  std::vector<int8_t> layerDistance;
  std::vector<int8_t> topDistance;
};

/// Breadth-first distances from every state where [goal] holds. The move
/// set is closed under inverses, so these are distances *to* the goal.
template <typename Goal>
std::vector<int8_t> distancesTo(const Tables& t, Goal goal) {
  std::vector<int8_t> d(kStateCount, -1);
  std::vector<uint32_t> queue;
  queue.reserve(kStateCount);
  for (int perm = 0; perm < kPermCount; ++perm) {
    for (int twist = 0; twist < kTwistCount; ++twist) {
      if (!goal(perm, twist)) continue;
      const uint32_t s = static_cast<uint32_t>(perm * kTwistCount + twist);
      d[s] = 0;
      queue.push_back(s);
    }
  }
  for (size_t head = 0; head < queue.size(); ++head) {
    const uint32_t s = queue[head];
    const int perm = static_cast<int>(s / kTwistCount);
    const int twist = static_cast<int>(s % kTwistCount);
    for (int m = 0; m < kMoveCount; ++m) {
      const uint32_t n = t.permMove[perm * kMoveCount + m] * kTwistCount +
                         t.twistMove[twist * kMoveCount + m];
      if (d[n] < 0) {
        d[n] = static_cast<int8_t>(d[s] + 1);
        queue.push_back(n);
      }
    }
  }
  return d;
}

const Tables& tables() {
  static Tables t;
  static std::once_flag once;
  std::call_once(once, [] {
    const auto& moves = moveCubes();
    t.permMove.resize(kPermCount * kMoveCount);
    t.twistMove.resize(kTwistCount * kMoveCount);
    for (int i = 0; i < kPermCount; ++i) {
      CubieCube c = CubieCube::identity();
      setPerm(c, i);
      for (int m = 0; m < kMoveCount; ++m)
        t.permMove[i * kMoveCount + m] = static_cast<uint16_t>(permCoord(multiply(c, moves[m])));
    }
    for (int i = 0; i < kTwistCount; ++i) {
      CubieCube c = CubieCube::identity();
      setTwist(c, i);
      for (int m = 0; m < kMoveCount; ++m)
        t.twistMove[i * kMoveCount + m] = static_cast<uint16_t>(twistCoord(multiply(c, moves[m])));
    }
    t.distance.assign(kStateCount, -1);
    std::vector<uint32_t> queue;
    queue.reserve(kStateCount);
    t.distance[0] = 0;
    queue.push_back(0);
    for (size_t head = 0; head < queue.size(); ++head) {
      const uint32_t s = queue[head];
      const int perm = static_cast<int>(s / kTwistCount);
      const int twist = static_cast<int>(s % kTwistCount);
      const int8_t next = static_cast<int8_t>(t.distance[s] + 1);
      for (int m = 0; m < kMoveCount; ++m) {
        const uint32_t n = t.permMove[perm * kMoveCount + m] * kTwistCount +
                           t.twistMove[twist * kMoveCount + m];
        if (t.distance[n] < 0) {
          t.distance[n] = next;
          queue.push_back(n);
        }
      }
    }

    // Bottom layer: the corners sharing the fixed DBL corner's layer are
    // home and untwisted. Top color: also every top corner untwisted.
    std::vector<bool> layerPerm(kPermCount);
    for (int perm = 0; perm < kPermCount; ++perm) {
      CubieCube c = CubieCube::identity();
      setPerm(c, perm);
      layerPerm[perm] = c.cp[DFR] == DFR && c.cp[DLF] == DLF && c.cp[DRB] == DRB;
    }
    std::vector<bool> layerTwist(kTwistCount);
    std::vector<bool> topTwist(kTwistCount);
    for (int twist = 0; twist < kTwistCount; ++twist) {
      CubieCube c = CubieCube::identity();
      setTwist(c, twist);
      layerTwist[twist] = c.co[DFR] == 0 && c.co[DLF] == 0 && c.co[DRB] == 0;
      topTwist[twist] = layerTwist[twist] && c.co[URF] == 0 && c.co[UFL] == 0 &&
                        c.co[ULB] == 0 && c.co[UBR] == 0;
    }
    t.layerDistance = distancesTo(t, [&](int perm, int twist) {
      return layerPerm[perm] && layerTwist[twist];
    });
    t.topDistance = distancesTo(t, [&](int perm, int twist) {
      return layerPerm[perm] && topTwist[twist];
    });
  });
  return t;
}

// Face colors from the DBL piece and opposite-color pairs, so that any
// orientation of the puzzle can be solved without whole-cube rotations.
bool faceColors2x2(const std::string& f, std::array<char, 6>& faceColors) {
  const CubieFacelets& slots = cubieFacelets(2);
  std::set<char> palette(f.begin(), f.end());
  if (palette.size() != 6) return false;
  auto opposite = [&](char color) -> char {
    std::set<char> neighbors;
    for (const auto& corner : slots.corner) {
      bool has = false;
      for (int k = 0; k < 3; ++k) has = has || f[corner[k]] == color;
      if (!has) continue;
      for (int k = 0; k < 3; ++k) neighbors.insert(f[corner[k]]);
    }
    char result = 0;
    int candidates = 0;
    for (char c : palette) {
      if (neighbors.count(c) == 0) {
        result = c;
        ++candidates;
      }
    }
    return candidates == 1 ? result : 0;
  };
  const auto& dbl = slots.corner[DBL];  // D, B, L stickers
  faceColors[kD] = f[dbl[0]];
  faceColors[kB] = f[dbl[1]];
  faceColors[kL] = f[dbl[2]];
  faceColors[kU] = opposite(faceColors[kD]);
  faceColors[kF] = opposite(faceColors[kB]);
  faceColors[kR] = opposite(faceColors[kL]);
  std::set<char> distinct(faceColors.begin(), faceColors.end());
  return distinct.size() == 6 && distinct.count(0) == 0;
}

}  // namespace

void Solver2x2::prepare() { tables(); }

namespace {

/// Parses facelets into the fixed-DBL coordinates.
bool coordinates(const std::string& facelets, int& perm, int& twist, std::string& error) {
  if (facelets.size() != 24) {
    error = cubeErrorName(CubeError::kBadLength);
    return false;
  }
  std::array<char, 6> colors;
  if (!faceColors2x2(facelets, colors)) {
    error = cubeErrorName(CubeError::kBadColors);
    return false;
  }
  CubieCube cube;
  const CubeError status = toCubie(facelets, 2, colors, cube);
  if (status != CubeError::kNone) {
    error = cubeErrorName(status);
    return false;
  }
  perm = permCoord(cube);
  twist = twistCoord(cube);
  return true;
}

/// Walks down [distance] to 0, appending the moves (always a shortest way).
void descend(const Tables& t, const std::vector<int8_t>& distance, int& perm, int& twist,
             std::vector<int>& moves) {
  while (distance[perm * kTwistCount + twist] > 0) {
    const int d = distance[perm * kTwistCount + twist];
    for (int m = 0; m < kMoveCount; ++m) {
      const int np = t.permMove[perm * kMoveCount + m];
      const int nt = t.twistMove[twist * kMoveCount + m];
      if (distance[np * kTwistCount + nt] == d - 1) {
        moves.push_back(m);
        perm = np;
        twist = nt;
        break;
      }
    }
  }
}

}  // namespace

SolveResult Solver2x2::solveGuided(const std::string& facelets) {
  const auto start = std::chrono::steady_clock::now();
  SolveResult result;
  result.method = "guided2x2";
  int perm = 0;
  int twist = 0;
  if (!coordinates(facelets, perm, twist, result.error)) return result;
  const Tables& t = tables();
  struct Stage {
    const std::vector<int8_t>* distance;
    const char* phase;
    const char* explanation;
  };
  const Stage stages[] = {
      {&t.layerDistance, "twoFirstLayer", "twoFirstLayerExplain"},
      {&t.topDistance, "twoTopColor", "twoTopColorExplain"},
      {&t.distance, "twoFinish", "twoFinishExplain"},
  };
  for (const Stage& stage : stages) {
    std::vector<int> moves;
    descend(t, *stage.distance, perm, twist, moves);
    for (int m : moves) {
      SolveStep step;
      step.move = faceTurnName(m);
      step.phase = stage.phase;
      step.explanation = stage.explanation;
      result.steps.push_back(step);
    }
  }
  result.ok = true;
  result.millis = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count();
  return result;
}

bool Solver2x2::solveMoves(const std::string& facelets, std::vector<int>& moves,
                           std::string& error) {
  int perm = 0;
  int twist = 0;
  if (!coordinates(facelets, perm, twist, error)) return false;
  moves.clear();
  descend(tables(), tables().distance, perm, twist, moves);
  return true;
}

SolveResult Solver2x2::solve(const std::string& facelets) {
  const auto start = std::chrono::steady_clock::now();
  SolveResult result;
  result.method = "optimal2x2";
  std::vector<int> moves;
  if (!solveMoves(facelets, moves, result.error)) return result;
  for (int m : moves) {
    SolveStep step;
    step.move = faceTurnName(m);
    step.phase = "optimal2x2";
    step.explanation = "optimal2x2Explain";
    result.steps.push_back(step);
  }
  result.ok = true;
  result.millis = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count();
  return result;
}

std::vector<long> Solver2x2::distanceHistogram() {
  const Tables& t = tables();
  std::vector<long> histogram;
  for (int8_t d : t.distance) {
    if (d < 0) continue;
    if (static_cast<size_t>(d) >= histogram.size()) histogram.resize(d + 1, 0);
    ++histogram[d];
  }
  return histogram;
}

}  // namespace cm
