#include "lbl.hpp"

#include <algorithm>
#include <array>
#include <chrono>
#include <functional>
#include <sstream>
#include <unordered_set>

#include "../core/cubie.hpp"
#include "../core/notation.hpp"

namespace cm {

namespace {

// Side faces in clockwise order seen from above. A "frame" k treats
// kSides[k] as the front and kSides[k + 1] as the right face.
constexpr std::array<int, 4> kSides = {kF, kR, kB, kL};
constexpr const char* kSideLetters = "FRBL";

constexpr const char* kTrigger = "R U R' U'";
constexpr const char* kMiddleRight = "U R U' R' U' F' U F";
constexpr const char* kMiddleLeft = "U' L' U L U F U' F'";
constexpr const char* kYellowCross = "F R U R' U' F'";
constexpr const char* kYellowEdges = "R U R' U R U2 R' U";
constexpr const char* kCornerCycle = "U R U' L' U R' U' L";
constexpr const char* kCornerTwist = "R' D' R D";

Vec3 sideNormal(int k) { return faceNormal(kSides[((k % 4) + 4) % 4]); }

/// Rewrites a frame-relative algorithm (front = kSides[frame]) in absolute
/// face letters.
std::string mapAlgorithm(const std::string& alg, int frame) {
  std::istringstream in(alg);
  std::string token;
  std::string out;
  while (in >> token) {
    const char* rel = std::char_traits<char>::find(kSideLetters, 4, token[0]);
    if (rel != nullptr) token[0] = kSideLetters[(frame + (rel - kSideLetters)) % 4];
    if (!out.empty()) out += ' ';
    out += token;
  }
  return out;
}

std::vector<int> permutationOf(const std::string& tokens) {
  std::vector<LayerMove> moves;
  parseSequence(tokens, 3, moves);
  std::vector<int> total(54);
  for (int i = 0; i < 54; ++i) total[i] = i;
  const CubeGeometry& g = CubeGeometry::get(3);
  for (const LayerMove& m : moves) {
    const std::vector<int> p = g.permutation(m);
    for (int i = 0; i < 54; ++i) total[i] = p[total[i]];
  }
  return total;
}

const char* uTurnToken(int quarterTurns) {
  switch (quarterTurns) {
    case 1: return "U";
    case 2: return "U2";
    case 3: return "U'";
    default: return "";
  }
}

class Builder {
 public:
  explicit Builder(const std::string& facelets) {
    cube_.n = 3;
    cube_.f = facelets;
  }

  bool run(std::string& error) {
    orient();
    cross();
    if (!firstLayerCorners() || !middleLayer() || !yellowCross() || !yellowEdges() ||
        !yellowCorners() || !orientYellowCorners() || !cube_.isSolved()) {
      error = "internal";
      return false;
    }
    return true;
  }

  std::vector<SolveStep>& steps() { return steps_; }

 private:
  using Goal = std::function<bool(const FaceletCube&)>;

  // ---- Piece queries -------------------------------------------------------

  char center(int face) const { return cube_.f[face * 9 + 4]; }
  char sideColor(int k) const { return center(kSides[((k % 4) + 4) % 4]); }

  static int findEdge(const FaceletCube& c, char a, char b) {
    const auto& slots = cubieFacelets(3).edge;
    for (int i = 0; i < 12; ++i) {
      const char x = c.f[slots[i][0]];
      const char y = c.f[slots[i][1]];
      if ((x == a && y == b) || (x == b && y == a)) return i;
    }
    return -1;
  }

  static int findCorner(const FaceletCube& c, char a, char b, char d) {
    const auto& slots = cubieFacelets(3).corner;
    for (int i = 0; i < 8; ++i) {
      int hits = 0;
      for (int k = 0; k < 3; ++k) {
        const char x = c.f[slots[i][k]];
        hits += (x == a || x == b || x == d) ? 1 : 0;
      }
      if (hits == 3) return i;
    }
    return -1;
  }

  static bool slotMatchesCenters(const FaceletCube& c, const int* facelets, int count) {
    for (int k = 0; k < count; ++k) {
      if (c.f[facelets[k]] != c.f[(facelets[k] / 9) * 9 + 4]) return false;
    }
    return true;
  }

  // An edge is solved when it sits in the slot whose centers match it.
  static bool edgeSolved(const FaceletCube& c, char a, char b) {
    const int slot = findEdge(c, a, b);
    return slot >= 0 && slotMatchesCenters(c, cubieFacelets(3).edge[slot].data(), 2);
  }

  static bool cornerSolved(const FaceletCube& c, char a, char b, char d) {
    const int slot = findCorner(c, a, b, d);
    return slot >= 0 && slotMatchesCenters(c, cubieFacelets(3).corner[slot].data(), 3);
  }

  /// Cubie positions (doubled coordinates) of pieces given by their colors.
  std::vector<Vec3> positionsOf(const std::vector<std::string>& pieces) const {
    std::vector<Vec3> out;
    for (const std::string& p : pieces) {
      if (p.size() == 2) {
        const int slot = findEdge(cube_, p[0], p[1]);
        if (slot >= 0) out.push_back(edgeSlotUnits()[slot] * 2);
      } else if (p.size() == 3) {
        const int slot = findCorner(cube_, p[0], p[1], p[2]);
        if (slot >= 0) out.push_back(cornerSlotUnits()[slot] * 2);
      }
    }
    return out;
  }

  /// Frame whose front-right column holds the slot with this unit position.
  static int frameOfSlot(const Vec3& unit) {
    for (int k = 0; k < 4; ++k) {
      const Vec3 v = sideNormal(k) + sideNormal(k + 1);
      if (v.x == unit.x && v.z == unit.z) return k;
    }
    return 0;
  }

  // ---- Emitting moves ------------------------------------------------------

  struct Focus {
    std::string explanation;
    std::vector<std::string> pieces;
    std::string piece;  // colors named in the explanation (may be empty)
  };

  void move(const std::string& token, const Focus& focus) {
    LayerMove m;
    if (!parseMove(token, 3, m)) return;
    SolveStep step;
    step.move = token;
    step.cubeState = cube_.f;
    step.phase = phase_;
    for (const LblStage& stage : kLblStages) {
      if (phase_ == stage.phase) {
        step.crown = stage.crown;
        step.subStep = stage.subStep;
      }
    }
    step.explanation = focus.explanation;
    step.piece = focus.piece;
    step.highlight = positionsOf(focus.pieces);
    steps_.push_back(std::move(step));
    cube_.apply(m);
  }

  void algorithm(const std::string& relative, int frame, const Focus& focus) {
    std::istringstream in(mapAlgorithm(relative, frame));
    std::string token;
    while (in >> token) move(token, focus);
  }

  /// Smallest number of U quarter turns (0..3) after which [goal] holds.
  int alignU(const Goal& goal) const {
    FaceletCube probe = cube_;
    for (int q = 0; q < 4; ++q) {
      if (goal(probe)) return q;
      probe.apply(faceTurnPermutation3(0));
    }
    return -1;
  }

  void turnU(int quarterTurns, const Focus& focus) {
    if (quarterTurns > 0) move(uTurnToken(quarterTurns), focus);
  }

  // ---- Phases --------------------------------------------------------------

  void orient() {
    // Holding white down is the first move of 1.1 (the white cross).
    phase_ = "lblCross";
    white_ = center(kD);
    for (int face = 0; face < 6; ++face) {
      if (center(face) == 'W') white_ = 'W';
    }
    int face = 0;
    while (center(face) != white_) ++face;
    static const char* const kRotation[6] = {"x2", "z", "x'", "", "z'", "x"};
    if (face != kD) move(kRotation[face], {"lblOrientExplain", {}, std::string(1, white_)});
    yellow_ = center(kU);
  }

  /// 1.1 the way the Academy teaches it: first the daisy (every white edge
  /// that is not already home goes up around the yellow center, white
  /// facing up), then each petal is lined up above its matching side
  /// center and dropped onto the white center with a half turn of that
  /// face. White edges already solved on the bottom stay where they are.
  void cross() {
    phase_ = "lblCross";
    const auto& slots = cubieFacelets(3).edge;
    std::array<int, 54> edgeFacelet;
    edgeFacelet.fill(-1);
    for (int i = 0; i < 12; ++i)
      for (int k = 0; k < 2; ++k) edgeFacelet[slots[i][k]] = 2 * i + k;
    // Bottom edge slot next to each side face.
    constexpr std::array<int, 4> kHome = {DF, DR, DB, DL};

    auto whiteFacelet = [&](int k) {
      const int slot = findEdge(cube_, white_, sideColor(k));
      return slots[slot][cube_.f[slots[slot][0]] == white_ ? 0 : 1];
    };
    auto home = [&](int k) { return whiteFacelet(k) == slots[kHome[k]][0]; };
    // A petal: a white edge in the top layer with white facing up.
    auto onTop = [](int facelet) { return facelet / 9 == kU; };

    // ---- The daisy ----
    std::vector<int> fixed;  // solved bottom edges: they must not move
    std::vector<int> petals;
    std::vector<int> remaining;
    for (int k = 0; k < 4; ++k) {
      if (home(k)) {
        fixed.push_back(k);
      } else if (onTop(whiteFacelet(k))) {
        petals.push_back(k);
      } else {
        remaining.push_back(k);
      }
    }
    while (!remaining.empty()) {
      std::vector<int> bestPath;
      int bestK = -1;
      for (int k : remaining) {
        std::vector<int> start;
        std::vector<int> target;  // exact facelet, or -1 for "any petal"
        for (int j : fixed) {
          start.push_back(edgeFacelet[whiteFacelet(j)]);
          target.push_back(edgeFacelet[slots[kHome[j]][0]]);
        }
        for (int j : petals) {
          start.push_back(edgeFacelet[whiteFacelet(j)]);
          target.push_back(-1);
        }
        start.push_back(edgeFacelet[whiteFacelet(k)]);
        target.push_back(-1);
        std::vector<int> path = shortestEdgePath(start, target, edgeFacelet, kU);
        if (bestK < 0 || path.size() < bestPath.size()) {
          bestPath = path;
          bestK = k;
        }
      }
      const std::string piece = {white_, sideColor(bestK)};
      for (int m : bestPath) move(faceTurnName(m), {"lblDaisyPetal", {piece}, piece});
      petals.push_back(bestK);
      remaining.erase(std::find(remaining.begin(), remaining.end(), bestK));
    }

    // ---- Petals down onto the white center ----
    while (!petals.empty()) {
      // The petal needing the fewest top turns goes first.
      int bestK = -1;
      int bestQ = 4;
      for (int k : petals) {
        const std::string c = {white_, sideColor(k)};
        const Vec3 above = sideNormal(k) + Vec3{0, 1, 0};
        const int q = alignU([&](const FaceletCube& probe) {
          return edgeSlotUnits()[findEdge(probe, c[0], c[1])] == above;
        });
        if (q >= 0 && q < bestQ) {
          bestQ = q;
          bestK = k;
        }
      }
      if (bestK < 0) return;
      const std::string piece = {white_, sideColor(bestK)};
      turnU(bestQ, {"lblDaisyAlign", {piece}, piece});
      move(std::string(1, kSideLetters[bestK]) + "2", {"lblDaisyDrop", {piece}, piece});
      petals.erase(std::find(petals.begin(), petals.end(), bestK));
    }
  }

  /// Breadth-first search over the positions of a few tracked edge stickers
  /// (24 edge facelets each) for the shortest face-turn sequence. A target
  /// of -1 accepts any edge facelet on [anyFace].
  static std::vector<int> shortestEdgePath(const std::vector<int>& start,
                                           const std::vector<int>& goal,
                                           const std::array<int, 54>& edgeFacelet,
                                           int anyFace = -1) {
    const auto& slots = cubieFacelets(3).edge;
    std::array<int, 24> faceletOf;
    for (int i = 0; i < 12; ++i)
      for (int k = 0; k < 2; ++k) faceletOf[2 * i + k] = slots[i][k];
    const int count = static_cast<int>(start.size());
    int total = 1;
    for (int i = 0; i < count; ++i) total *= 24;
    auto encode = [&](const std::vector<int>& v) {
      int code = 0;
      for (int i = count - 1; i >= 0; --i) code = code * 24 + v[i];
      return code;
    };
    auto reached = [&](int code) {
      for (int i = 0; i < count; ++i) {
        const int sticker = code % 24;
        code /= 24;
        if (goal[i] >= 0 ? sticker != goal[i] : faceletOf[sticker] / 9 != anyFace) return false;
      }
      return true;
    };
    const int startCode = encode(start);
    if (reached(startCode)) return {};
    std::vector<int> parent(total, -1);
    std::vector<int8_t> via(total, -1);
    std::vector<int> queue = {startCode};
    parent[startCode] = startCode;
    std::vector<int> v(count);
    for (size_t head = 0; head < queue.size(); ++head) {
      const int s = queue[head];
      int rest = s;
      for (int i = 0; i < count; ++i) {
        v[i] = rest % 24;
        rest /= 24;
      }
      for (int m = 0; m < kFaceTurnCount; ++m) {
        const std::vector<int>& perm = faceTurnPermutation3(m);
        int code = 0;
        for (int i = count - 1; i >= 0; --i) code = code * 24 + edgeFacelet[perm[faceletOf[v[i]]]];
        if (parent[code] >= 0) continue;
        parent[code] = s;
        via[code] = static_cast<int8_t>(m);
        if (reached(code)) {
          std::vector<int> path;
          for (int c = code; c != startCode; c = parent[c]) path.push_back(via[c]);
          std::reverse(path.begin(), path.end());
          return path;
        }
        queue.push_back(code);
      }
    }
    return {};
  }

  bool firstLayerCorners() {
    phase_ = "lblCorners";
    auto colors = [&](int k) { return std::string{white_, sideColor(k), sideColor(k + 1)}; };
    auto solved = [&](int k) {
      const std::string c = colors(k);
      return cornerSolved(cube_, c[0], c[1], c[2]);
    };
    auto unitOf = [&](int k) {
      const std::string c = colors(k);
      return cornerSlotUnits()[findCorner(cube_, c[0], c[1], c[2])];
    };
    for (int guard = 0; guard < 8; ++guard) {
      int pick = -1;
      for (int k = 0; k < 4 && pick < 0; ++k)
        if (!solved(k) && unitOf(k).y > 0) pick = k;
      for (int k = 0; k < 4 && pick < 0; ++k)
        if (!solved(k)) pick = k;
      if (pick < 0) return true;
      const std::string piece = colors(pick);
      if (unitOf(pick).y < 0) {
        algorithm(kTrigger, frameOfSlot(unitOf(pick)), {"lblCornerExtract", {piece}, piece});
      }
      const Vec3 above = sideNormal(pick) + sideNormal(pick + 1) + Vec3{0, 1, 0};
      const int q = alignU([&](const FaceletCube& c) {
        return cornerSlotUnits()[findCorner(c, piece[0], piece[1], piece[2])] == above;
      });
      if (q < 0) return false;
      turnU(q, {"lblCornerAlign", {piece}, piece});
      for (int reps = 0; reps < 6 && !solved(pick); ++reps) {
        algorithm(kTrigger, pick, {"lblCornerInsert", {piece}, piece});
      }
      if (!solved(pick)) return false;
    }
    return false;
  }

  bool middleLayer() {
    phase_ = "lblMiddle";
    const auto& slots = cubieFacelets(3).edge;
    auto colors = [&](int k) { return std::string{sideColor(k), sideColor(k + 1)}; };
    auto solved = [&](int k) {
      const std::string c = colors(k);
      return edgeSolved(cube_, c[0], c[1]);
    };
    for (int guard = 0; guard < 12; ++guard) {
      int pick = -1;
      int slot = -1;
      for (int k = 0; k < 4 && pick < 0; ++k) {
        if (solved(k)) continue;
        const std::string c = colors(k);
        const int s = findEdge(cube_, c[0], c[1]);
        if (edgeSlotUnits()[s].y > 0) {
          pick = k;
          slot = s;
        }
      }
      if (pick < 0) {
        for (int k = 0; k < 4 && pick < 0; ++k)
          if (!solved(k)) pick = k;
        if (pick < 0) return true;
        const std::string piece = colors(pick);
        const int s = findEdge(cube_, piece[0], piece[1]);
        algorithm(kMiddleRight, frameOfSlot(edgeSlotUnits()[s]), {"lblMiddleExtract", {piece}, piece});
        continue;
      }
      const std::string piece = colors(pick);
      // Edge slots list the U sticker first.
      const char top = cube_.f[slots[slot][0]];
      const char side = cube_.f[slots[slot][1]];
      int front = 0;
      while (sideColor(front) != side) ++front;
      const Vec3 target = sideNormal(front) + Vec3{0, 1, 0};
      const int q = alignU([&](const FaceletCube& c) {
        return edgeSlotUnits()[findEdge(c, piece[0], piece[1])] == target;
      });
      if (q < 0) return false;
      turnU(q, {"lblMiddleAlign", {piece}, piece});
      if (top == sideColor(front + 1)) {
        algorithm(kMiddleRight, front, {"lblMiddleRight", {piece}, piece});
      } else {
        algorithm(kMiddleLeft, front, {"lblMiddleLeft", {piece}, piece});
      }
    }
    return false;
  }

  // ---- Last layer: searches over (U turn | algorithm) macros ---------------

  struct Macro {
    std::string tokens;  // absolute notation
    bool isTurn = false;
    std::vector<int> permutation;
  };

  std::vector<std::string> lastLayerEdges() const {
    std::vector<std::string> out;
    for (int k = 0; k < 4; ++k) out.push_back({yellow_, sideColor(k)});
    return out;
  }

  std::vector<std::string> lastLayerCorners() const {
    std::vector<std::string> out;
    for (int k = 0; k < 4; ++k) out.push_back({yellow_, sideColor(k), sideColor(k + 1)});
    return out;
  }

  bool runMacros(const std::vector<std::string>& algorithms, bool allowTurns, const Goal& goal,
                 int maxDepth, const std::string& stage, const std::vector<std::string>& pieces) {
    std::vector<Macro> macros;
    if (allowTurns) {
      for (int q = 1; q <= 3; ++q) macros.push_back({uTurnToken(q), true, {}});
    }
    for (const std::string& a : algorithms) macros.push_back({a, false, {}});
    for (Macro& m : macros) m.permutation = permutationOf(m.tokens);

    struct Node {
      FaceletCube cube;
      int parent;
      int macro;
    };
    std::vector<Node> nodes = {{cube_, -1, -1}};
    std::unordered_set<std::string> seen = {cube_.f};
    int found = goal(cube_) ? 0 : -1;
    size_t levelStart = 0;
    for (int depth = 0; depth < maxDepth && found < 0; ++depth) {
      const size_t levelEnd = nodes.size();
      for (size_t i = levelStart; i < levelEnd && found < 0; ++i) {
        for (size_t m = 0; m < macros.size() && found < 0; ++m) {
          const int previous = nodes[i].macro;
          if (macros[m].isTurn && previous >= 0 && macros[previous].isTurn) continue;
          FaceletCube next = nodes[i].cube;
          next.apply(macros[m].permutation);
          if (!seen.insert(next.f).second) continue;
          nodes.push_back({next, static_cast<int>(i), static_cast<int>(m)});
          if (goal(next)) found = static_cast<int>(nodes.size()) - 1;
        }
      }
      levelStart = levelEnd;
    }
    if (found < 0) return false;
    std::vector<int> chain;
    for (int i = found; nodes[i].parent >= 0; i = nodes[i].parent) chain.push_back(nodes[i].macro);
    std::reverse(chain.begin(), chain.end());
    for (int m : chain) {
      const Focus focus{stage + (macros[m].isTurn ? "Align" : "Alg"), pieces, ""};
      std::istringstream in(macros[m].tokens);
      std::string token;
      while (in >> token) move(token, focus);
    }
    return true;
  }

  bool yellowCrossDone(const FaceletCube& c) const {
    for (int i : {1, 3, 5, 7})
      if (c.f[kU * 9 + i] != yellow_) return false;
    return true;
  }

  bool yellowEdgesDone(const FaceletCube& c) const {
    if (!yellowCrossDone(c)) return false;
    for (int face : kSides)
      if (c.f[face * 9 + 1] != c.f[face * 9 + 4]) return false;
    return true;
  }

  bool yellowCornersPlaced(const FaceletCube& c) const {
    if (!yellowEdgesDone(c)) return false;
    const auto& slots = cubieFacelets(3).corner;
    for (int i = URF; i <= UBR; ++i) {
      for (int k = 0; k < 3; ++k) {
        const char needed = c.f[(slots[i][k] / 9) * 9 + 4];
        bool present = false;
        for (int j = 0; j < 3; ++j) present = present || c.f[slots[i][j]] == needed;
        if (!present) return false;
      }
    }
    return true;
  }

  bool yellowCross() {
    phase_ = "lblYellowCross";
    return runMacros({kYellowCross}, true, [this](const FaceletCube& c) { return yellowCrossDone(c); },
                     8, "lblYellowCross", lastLayerEdges());
  }

  bool yellowEdges() {
    phase_ = "lblYellowEdges";
    std::vector<std::string> algs;
    for (int k = 0; k < 4; ++k) algs.push_back(mapAlgorithm(kYellowEdges, k));
    return runMacros(algs, true, [this](const FaceletCube& c) { return yellowEdgesDone(c); }, 6,
                     "lblYellowEdges", lastLayerEdges());
  }

  bool yellowCorners() {
    phase_ = "lblYellowCorners";
    std::vector<std::string> algs;
    for (int k = 0; k < 4; ++k) algs.push_back(mapAlgorithm(kCornerCycle, k));
    return runMacros(algs, false, [this](const FaceletCube& c) { return yellowCornersPlaced(c); },
                     4, "lblYellowCorners", lastLayerCorners());
  }

  bool orientYellowCorners() {
    phase_ = "lblYellowCornersOrient";
    const auto& slots = cubieFacelets(3).corner;
    const int urfTop = slots[URF][0];
    auto pieceAtUrf = [&]() {
      return std::string{cube_.f[slots[URF][0]], cube_.f[slots[URF][1]], cube_.f[slots[URF][2]]};
    };
    auto allOriented = [&](const FaceletCube& c) {
      for (int i = URF; i <= UBR; ++i)
        if (c.f[slots[i][0]] != yellow_) return false;
      return true;
    };
    for (int guard = 0; guard < 4 && !allOriented(cube_); ++guard) {
      const int q = alignU([&](const FaceletCube& c) { return c.f[urfTop] != yellow_; });
      if (q < 0) return false;
      turnU(q, {"lblNextCorner", lastLayerCorners(), ""});
      const std::string piece = pieceAtUrf();
      for (int reps = 0; reps < 6 && cube_.f[urfTop] != yellow_; ++reps) {
        algorithm(kCornerTwist, 0, {"lblCornerTwist", {piece}, ""});
      }
      if (cube_.f[urfTop] != yellow_) return false;
    }
    const int q = alignU([](const FaceletCube& c) { return c.isSolved(); });
    if (q < 0) return false;
    turnU(q, {"lblFinalAlign", {}, ""});
    return true;
  }

  FaceletCube cube_;
  std::vector<SolveStep> steps_;
  std::string phase_;
  char white_ = 'W';
  char yellow_ = 'Y';
};

}  // namespace

SolveResult LblSolver::solve(const std::string& facelets) {
  const auto start = std::chrono::steady_clock::now();
  SolveResult result;
  result.method = "lbl";
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
  Builder builder(facelets);
  if (!builder.run(result.error)) return result;
  result.steps = std::move(builder.steps());
  result.ok = true;
  result.millis = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count();
  return result;
}

}  // namespace cm
