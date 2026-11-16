#include "reduction.hpp"

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <deque>
#include <map>
#include <memory>
#include <mutex>
#include <stdexcept>

#include "../core/cubie.hpp"
#include "../core/notation.hpp"
#include "../vision/kmeans.hpp"
#include "kociemba.hpp"
#include "lbl.hpp"

namespace cm {

namespace {

using Clock = std::chrono::steady_clock;
using Perm = std::vector<uint16_t>;
using MoveIds = std::vector<uint8_t>;

constexpr int kMinSize = 4;
constexpr int kMaxSize = 7;
constexpr int kOrbitSize = 24;
constexpr int kKeysPerOrbit = kOrbitSize * kOrbitSize * kOrbitSize;
/// Distinct 3-cycles of a 24-element orbit: C(24, 3) subsets x 2 directions.
constexpr int kCyclesPerOrbit = 24 * 23 * 22 / 3;
constexpr int kMaxSetupDepth = 4;

enum class Kind : uint8_t { kCorner, kMidge, kWing, kTrueCenter, kCenter };

/// A pure 3-cycle of center stickers (3 facelet moves) or of wing edges
/// (6 facelet moves), with the move sequence that performs it.
struct Cycle {
  int orbit = 0;
  int pairs = 0;
  std::array<uint16_t, 6> from{};
  std::array<uint16_t, 6> to{};
  MoveIds moves;
};

/// One orbit of center stickers or wing edges: 24 elements.
struct Orbit {
  bool wing = false;
  /// Facelets of each element ({a, -1} for a center sticker; a wing lists
  /// its U/D or else F/B sticker first).
  std::vector<std::array<int, 2>> elements;
  /// For wings: the smaller of the two layer indices along the edge.
  int layer = 0;
};

/// Wing and midge facelets of one of the 12 edge slots.
struct EdgeSlot {
  int face0 = 0;
  int face1 = 0;
  std::vector<std::array<int, 2>> wings;
  std::array<int, 2> midge{-1, -1};
};

int popcount64(uint64_t v) {
  int count = 0;
  while (v != 0) {
    v &= v - 1;
    ++count;
  }
  return count;
}

class Library {
 public:
  explicit Library(int n);

  int n;
  int moveCount;
  std::vector<Perm> perms;
  std::vector<Kind> kind;
  std::vector<int> orbitOf;
  std::vector<int> localOf;
  std::vector<Orbit> orbits;
  std::vector<Cycle> cycles;
  std::array<EdgeSlot, 12> slots;
  int possible = 0;

  LayerMove layerMove(int id) const {
    const int q = id % 3 + 1;
    const int layer = (id / 3) % n;
    const int axis = id / 3 / n;
    return {axis, layer, layer, q};
  }
  int moveId(int axis, int layer, int q) const { return (axis * n + layer) * 3 + (q - 1); }
  int inverse(int id) const { return id - id % 3 + (2 - id % 3); }
  bool isMiddle(int id) const { return n % 2 == 1 && (id / 3) % n == n / 2; }
  bool isOuter(int id) const {
    const int layer = (id / 3) % n;
    return layer == 0 || layer == n - 1;
  }

 private:
  void classify();
  void findOrbits();
  void findSlots();
  void buildCycles();
  int keyOf(const Cycle& c) const;
  MoveIds simplify(const MoveIds& ids) const;
};

Library::Library(int size) : n(size), moveCount(9 * size) {
  const CubeGeometry& g = CubeGeometry::get(n);
  perms.resize(moveCount);
  for (int id = 0; id < moveCount; ++id) {
    const std::vector<int> p = g.permutation(layerMove(id));
    perms[id].resize(p.size());
    for (size_t i = 0; i < p.size(); ++i) perms[id][i] = static_cast<uint16_t>(p[i]);
  }
  classify();
  findOrbits();
  findSlots();
  buildCycles();
}

void Library::classify() {
  const CubeGeometry& g = CubeGeometry::get(n);
  const int count = g.faceletCount();
  kind.resize(count);
  for (int i = 0; i < count; ++i) {
    const Vec3& p = g.cubiePosition(i);
    const int c[3] = {p.x, p.y, p.z};
    int outer = 0;
    int zeros = 0;
    for (int v : c) {
      if (v == n - 1 || v == -(n - 1)) ++outer;
      if (v == 0) ++zeros;
    }
    if (outer == 3) {
      kind[i] = Kind::kCorner;
    } else if (outer == 2) {
      kind[i] = zeros == 1 ? Kind::kMidge : Kind::kWing;
    } else {
      kind[i] = zeros == 2 ? Kind::kTrueCenter : Kind::kCenter;
    }
  }
}

void Library::findOrbits() {
  const CubeGeometry& g = CubeGeometry::get(n);
  const int count = g.faceletCount();
  std::vector<int> parent(count);
  for (int i = 0; i < count; ++i) parent[i] = i;
  auto find = [&parent](int x) {
    while (parent[x] != x) x = parent[x] = parent[parent[x]];
    return x;
  };
  for (const Perm& p : perms) {
    for (int i = 0; i < count; ++i) parent[find(i)] = find(p[i]);
  }
  // The two stickers of a wing travel together: one orbit of pieces.
  for (int i = 0; i < count; ++i) {
    if (kind[i] != Kind::kWing) continue;
    for (int face = 0; face < 6; ++face) {
      const int other = g.faceletAt(g.cubiePosition(i), faceNormal(face));
      if (other >= 0 && other != i) parent[find(i)] = find(other);
    }
  }
  orbitOf.assign(count, -1);
  localOf.assign(count, -1);
  std::map<int, int> rootToOrbit;
  for (int i = 0; i < count; ++i) {
    if (kind[i] != Kind::kCenter && kind[i] != Kind::kWing) continue;
    const int root = find(i);
    auto it = rootToOrbit.find(root);
    if (it == rootToOrbit.end()) {
      it = rootToOrbit.emplace(root, static_cast<int>(orbits.size())).first;
      orbits.push_back({});
      orbits.back().wing = kind[i] == Kind::kWing;
    }
    const int o = it->second;
    orbitOf[i] = o;
    Orbit& orbit = orbits[o];
    if (!orbit.wing) {
      localOf[i] = static_cast<int>(orbit.elements.size());
      orbit.elements.push_back({i, -1});
      continue;
    }
    // A wing: both stickers share the element; the U/D (else F/B) one first.
    const Vec3& pos = g.cubiePosition(i);
    for (int e = 0; e < static_cast<int>(orbit.elements.size()); ++e) {
      std::array<int, 2>& el = orbit.elements[e];
      if (g.cubiePosition(el[0]) == pos) {
        auto rank = [&g](int f) {
          const int face = g.face(f);
          return (face == kU || face == kD) ? 0 : ((face == kF || face == kB) ? 1 : 2);
        };
        if (rank(i) < rank(el[0])) {
          el[1] = el[0];
          el[0] = i;
        } else {
          el[1] = i;
        }
        localOf[i] = e;
        break;
      }
    }
    if (localOf[i] < 0) {
      localOf[i] = static_cast<int>(orbit.elements.size());
      orbit.elements.push_back({i, -1});
      const int c[3] = {pos.x, pos.y, pos.z};
      for (int v : c) {
        if (v != n - 1 && v != -(n - 1)) orbit.layer = std::min((v + n - 1) / 2, n - 1 - (v + n - 1) / 2);
      }
    }
  }
  for (const Orbit& o : orbits) {
    if (static_cast<int>(o.elements.size()) != kOrbitSize) {
      throw std::logic_error("unexpected orbit size");
    }
  }
  possible = static_cast<int>(orbits.size()) * kCyclesPerOrbit;
}

void Library::findSlots() {
  const CubeGeometry& g3 = CubeGeometry::get(3);
  const CubeGeometry& g = CubeGeometry::get(n);
  const CubieFacelets& cf = cubieFacelets(3);
  for (int s = 0; s < 12; ++s) {
    EdgeSlot& slot = slots[s];
    slot.face0 = g3.face(cf.edge[s][0]);
    slot.face1 = g3.face(cf.edge[s][1]);
    const Vec3 n1 = faceNormal(slot.face1);
    for (int i = 0; i < g.faceletCount(); ++i) {
      if (g.face(i) != slot.face0) continue;
      if (kind[i] != Kind::kWing && kind[i] != Kind::kMidge) continue;
      const Vec3& pos = g.cubiePosition(i);
      if (dot(pos, n1) != n - 1) continue;
      const int other = g.faceletAt(pos, n1);
      if (kind[i] == Kind::kMidge) {
        slot.midge = {i, other};
      } else {
        slot.wings.push_back({i, other});
      }
    }
  }
}

MoveIds Library::simplify(const MoveIds& ids) const {
  MoveIds out;
  for (uint8_t id : ids) {
    if (!out.empty() && out.back() / 3 == id / 3) {
      const int q = (out.back() % 3 + 1 + id % 3 + 1) % 4;
      const int base = id - id % 3;
      out.pop_back();
      if (q != 0) out.push_back(static_cast<uint8_t>(base + q - 1));
    } else {
      out.push_back(id);
    }
  }
  return out;
}

int Library::keyOf(const Cycle& c) const {
  // Element-level cycle e0 -> e1 -> e2, rotated so the smallest leads.
  const int first = localOf[c.from[0]];
  int next[kOrbitSize];
  for (int p = 0; p < c.pairs; ++p) next[localOf[c.from[p]]] = localOf[c.to[p]];
  int e[3] = {first, next[first], next[next[first]]};
  const int lead = static_cast<int>(std::min_element(e, e + 3) - e);
  const int a = e[lead];
  const int b = e[(lead + 1) % 3];
  const int d = e[(lead + 2) % 3];
  return c.orbit * kKeysPerOrbit + (a * kOrbitSize + b) * kOrbitSize + d;
}

void Library::buildCycles() {
  const int count = static_cast<int>(kind.size());
  const int words = (count + 63) / 64;
  auto supportOf = [&](const Perm& p) {
    std::vector<uint64_t> bits(words, 0);
    for (int i = 0; i < count; ++i) {
      if (p[i] != i) bits[i / 64] |= uint64_t{1} << (i % 64);
    }
    return bits;
  };
  std::vector<std::vector<uint64_t>> moveSupport(moveCount);
  for (int m = 0; m < moveCount; ++m) moveSupport[m] = supportOf(perms[m]);

  std::vector<int> table(orbits.size() * kKeysPerOrbit, -1);
  auto offer = [&](Cycle&& cycle) -> bool {
    const int key = keyOf(cycle);
    const int existing = table[key];
    if (existing >= 0 && cycles[existing].moves.size() <= cycle.moves.size()) return false;
    if (existing >= 0) {
      cycles[existing] = std::move(cycle);
      return false;
    }
    table[key] = static_cast<int>(cycles.size());
    cycles.push_back(std::move(cycle));
    return true;
  };

  // Base commutators [X, Y] with Y = Z W Z'.
  Perm y(count);
  Perm yInverse(count);
  Perm commutator(count);
  for (int z = 0; z < moveCount; ++z) {
    const Perm& pz = perms[z];
    const Perm& pzi = perms[inverse(z)];
    for (int w = 0; w < moveCount; ++w) {
      if (w / 3 / n == z / 3 / n) continue;  // same axis: Z W Z' == W
      const Perm& pw = perms[w];
      const Perm& pwi = perms[inverse(w)];
      for (int i = 0; i < count; ++i) {
        y[i] = pzi[pw[pz[i]]];
        yInverse[i] = pzi[pwi[pz[i]]];
      }
      const std::vector<uint64_t> ySupport = supportOf(y);
      for (int x = 0; x < moveCount; ++x) {
        int overlap = 0;
        for (int k = 0; k < words; ++k) overlap += popcount64(moveSupport[x][k] & ySupport[k]);
        if (overlap < 1 || overlap > 2) continue;
        const Perm& px = perms[x];
        const Perm& pxi = perms[inverse(x)];
        Cycle cycle;
        bool pure = true;
        for (int i = 0; i < count && pure; ++i) {
          commutator[i] = yInverse[pxi[y[px[i]]]];
          if (commutator[i] == i) continue;
          if (cycle.pairs == 6 || (kind[i] != Kind::kCenter && kind[i] != Kind::kWing)) {
            pure = false;
            break;
          }
          cycle.from[cycle.pairs] = static_cast<uint16_t>(i);
          cycle.to[cycle.pairs] = commutator[i];
          ++cycle.pairs;
        }
        if (!pure) continue;
        const bool wing = kind[cycle.from[0]] == Kind::kWing;
        if (cycle.pairs != (wing ? 6 : 3)) continue;
        cycle.orbit = orbitOf[cycle.from[0]];
        bool sameOrbit = true;
        for (int p = 0; p < cycle.pairs; ++p) sameOrbit &= orbitOf[cycle.from[p]] == cycle.orbit;
        if (!sameOrbit) continue;
        // Group the facelet moves by destination piece (see cycleGain).
        std::array<int, 6> order{};
        for (int p = 0; p < cycle.pairs; ++p) order[p] = p;
        std::sort(order.begin(), order.begin() + cycle.pairs, [&](int a, int b2) {
          return localOf[cycle.to[a]] < localOf[cycle.to[b2]];
        });
        const Cycle unsorted = cycle;
        for (int p = 0; p < cycle.pairs; ++p) {
          cycle.from[p] = unsorted.from[order[p]];
          cycle.to[p] = unsorted.to[order[p]];
        }
        const int iz = inverse(z);
        cycle.moves = simplify({static_cast<uint8_t>(x), static_cast<uint8_t>(z),
                                static_cast<uint8_t>(w), static_cast<uint8_t>(iz),
                                static_cast<uint8_t>(inverse(x)), static_cast<uint8_t>(z),
                                static_cast<uint8_t>(inverse(w)), static_cast<uint8_t>(iz)});
        offer(std::move(cycle));
      }
    }
  }

  // Close under setup moves: S C S' moves S^-1(a) -> S^-1(b).
  std::deque<int> frontier;
  for (int i = 0; i < static_cast<int>(cycles.size()); ++i) frontier.push_back(i);
  std::sort(frontier.begin(), frontier.end(), [this](int a, int b) {
    return cycles[a].moves.size() < cycles[b].moves.size();
  });
  int depth = 0;
  while (!frontier.empty() && static_cast<int>(cycles.size()) < possible && depth < kMaxSetupDepth) {
    std::deque<int> next;
    for (int index : frontier) {
      for (int m = 0; m < moveCount; ++m) {
        const Perm& back = perms[inverse(m)];
        Cycle conj;
        conj.orbit = cycles[index].orbit;
        conj.pairs = cycles[index].pairs;
        for (int p = 0; p < conj.pairs; ++p) {
          conj.from[p] = back[cycles[index].from[p]];
          conj.to[p] = back[cycles[index].to[p]];
        }
        MoveIds moves;
        moves.reserve(cycles[index].moves.size() + 2);
        moves.push_back(static_cast<uint8_t>(m));
        moves.insert(moves.end(), cycles[index].moves.begin(), cycles[index].moves.end());
        moves.push_back(static_cast<uint8_t>(inverse(m)));
        conj.moves = simplify(moves);
        const int before = static_cast<int>(cycles.size());
        if (offer(std::move(conj))) next.push_back(before);
      }
    }
    frontier.swap(next);
    ++depth;
  }
}

const Library& libraryFor(int n) {
  if (n < kMinSize || n > kMaxSize) throw std::invalid_argument("unsupported size");
  static std::array<std::unique_ptr<Library>, kMaxSize + 1> cache;
  static std::once_flag once[kMaxSize + 1];
  std::call_once(once[n], [n] { cache[n] = std::make_unique<Library>(n); });
  return *cache[n];
}

// ---------------------------------------------------------------------------
// Solving

std::string groupedAlgorithm(int n, const std::string& alg) {
  // Tokens use 4x4x4 names: r/l = inner block, Rw/Lw/Uw = outer half.
  const int h = n / 2;
  const std::string inner = h == 2 ? "2" : "2-" + std::to_string(h);
  const std::string wide = h == 2 ? "" : std::to_string(h);
  std::string out;
  size_t i = 0;
  while (i < alg.size()) {
    const char c = alg[i];
    if ((c == 'r' || c == 'l') && (i + 1 >= alg.size() || alg[i + 1] != 'w')) {
      const char face = c == 'r' ? 'R' : 'L';
      out += h == 2 ? inner + face : inner + face + "w";
      ++i;
    } else if ((c == 'R' || c == 'L' || c == 'U') && i + 1 < alg.size() && alg[i + 1] == 'w') {
      out += wide + c + "w";
      i += 2;
    } else {
      out += c;
      ++i;
    }
  }
  return out;
}

struct Builder {
  const Library& lib;
  FaceletCube cube;
  std::vector<SolveStep> steps;

  void apply(const Perm& p) {
    std::string next(cube.f.size(), '?');
    for (size_t i = 0; i < cube.f.size(); ++i) next[p[i]] = cube.f[i];
    cube.f.swap(next);
  }

  void emit(const MoveIds& ids, const char* phase, const char* explanation, const std::string& piece,
            const std::vector<Vec3>& highlight) {
    for (uint8_t id : ids) {
      SolveStep step;
      step.move = moveName(lib.layerMove(id), lib.n);
      step.phase = phase;
      step.explanation = explanation;
      step.piece = piece;
      step.highlight = highlight;
      steps.push_back(std::move(step));
      apply(lib.perms[id]);
    }
  }

  bool emitAlgorithm(const std::string& alg, const char* phase, const char* explanation,
                     const std::vector<Vec3>& highlight) {
    std::vector<LayerMove> moves;
    std::vector<std::string> tokens;
    if (!parseSequence(alg, lib.n, moves, &tokens)) return false;
    const CubeGeometry& g = CubeGeometry::get(lib.n);
    for (size_t i = 0; i < moves.size(); ++i) {
      SolveStep step;
      step.move = tokens[i];
      step.phase = phase;
      step.explanation = explanation;
      step.highlight = highlight;
      steps.push_back(std::move(step));
      cube.apply(g.permutation(moves[i]));
    }
    return true;
  }
};

/// How much closer to [target] a cycle brings the cube: whole pieces put
/// in place weigh most (that guarantees progress), single stickers break
/// ties. Wing cycles list their facelet moves grouped by destination piece.
int cycleGain(const Cycle& c, const std::string& f, const std::string& target) {
  int stickers = 0;
  for (int p = 0; p < c.pairs; ++p) {
    const int d = c.to[p];
    stickers += (f[c.from[p]] == target[d]) - (f[d] == target[d]);
  }
  if (c.pairs == 3) return 4 * stickers;
  int pieces = 0;
  for (int p = 0; p < 6; p += 2) {
    const int d0 = c.to[p];
    const int d1 = c.to[p + 1];
    const bool before = f[d0] == target[d0] && f[d1] == target[d1];
    const bool after = f[c.from[p]] == target[d0] && f[c.from[p + 1]] == target[d1];
    pieces += static_cast<int>(after) - static_cast<int>(before);
  }
  return 4 * pieces + stickers;
}

std::vector<Vec3> cycleHighlight(const Library& lib, const Cycle& c) {
  const CubeGeometry& g = CubeGeometry::get(lib.n);
  std::vector<Vec3> out;
  for (int p = 0; p < c.pairs; ++p) {
    const Vec3& pos = g.cubiePosition(c.from[p]);
    if (std::find(out.begin(), out.end(), pos) == out.end()) out.push_back(pos);
  }
  return out;
}

/// Runs the best 3-cycles of the given kind until every facelet of that
/// kind shows its target color.
bool solveWithCycles(Builder& b, bool wings, const std::string& target, const char* phase,
                     const char* explanation) {
  const Library& lib = b.lib;
  for (int guard = 0; guard < 1000; ++guard) {
    bool done = true;
    for (size_t i = 0; i < target.size() && done; ++i) {
      const Kind k = lib.kind[i];
      if ((wings ? k == Kind::kWing : k == Kind::kCenter) && b.cube.f[i] != target[i]) done = false;
    }
    if (done) return true;
    const Cycle* best = nullptr;
    double bestScore = 0;
    int bestGain = 0;
    for (const Cycle& c : lib.cycles) {
      if (lib.orbits[c.orbit].wing != wings) continue;
      const int gain = cycleGain(c, b.cube.f, target);
      if (gain <= 0) continue;
      const double score = gain / (c.moves.size() + 4.0);
      if (score > bestScore || (score == bestScore && gain > bestGain)) {
        best = &c;
        bestScore = score;
        bestGain = gain;
      }
    }
    if (best == nullptr) return false;
    // Name the piece this cycle puts in place.
    std::string piece;
    for (int p = 0; p < best->pairs && piece.empty(); ++p) {
      if (b.cube.f[best->from[p]] != target[best->to[p]]) continue;
      if (!wings) {
        piece = std::string(1, b.cube.f[best->from[p]]);
      } else {
        const std::array<int, 2>& el =
            lib.orbits[best->orbit].elements[lib.localOf[best->from[p]]];
        piece = {b.cube.f[el[0]], b.cube.f[el[1]]};
      }
    }
    b.emit(best->moves, phase, explanation, piece, cycleHighlight(lib, *best));
  }
  return false;
}

/// Free opening: slice turns (never middle slices or outer layers) that put
/// many center stickers in place at once, while nothing needs preserving.
void centerOpening(Builder& b, const std::string& target) {
  const Library& lib = b.lib;
  std::vector<int> centers;
  for (size_t i = 0; i < target.size(); ++i) {
    if (lib.kind[i] == Kind::kCenter) centers.push_back(static_cast<int>(i));
  }
  std::vector<int> moves;
  for (int id = 0; id < lib.moveCount; ++id) {
    if (!lib.isMiddle(id) && !lib.isOuter(id)) moves.push_back(id);
  }
  auto correctAfter = [&](const Perm* first, const Perm* second) {
    int count = 0;
    for (int i : centers) {
      int d = (*first)[i];
      if (second != nullptr) d = (*second)[d];
      count += b.cube.f[i] == target[d];
    }
    return count;
  };
  for (int guard = 0; guard < 30; ++guard) {
    int current = 0;
    for (int i : centers) current += b.cube.f[i] == target[i];
    int bestGain = 0;
    MoveIds best;
    for (int a : moves) {
      const int one = correctAfter(&lib.perms[a], nullptr) - current;
      if (one >= 4 && one > 2 * bestGain) {
        bestGain = one;
        best = {static_cast<uint8_t>(a)};
      }
      for (int c : moves) {
        if (c / 3 == a / 3) continue;
        const int two = correctAfter(&lib.perms[a], &lib.perms[c]) - current;
        if (two >= 7 && two > bestGain + 3 && (best.size() != 1 || two > 2 * bestGain)) {
          bestGain = two;
          best = {static_cast<uint8_t>(a), static_cast<uint8_t>(c)};
        }
      }
    }
    if (best.empty()) return;
    b.emit(best, "reductionCenters", "reductionCenterBlock", "", {});
  }
}

int wingKey(char onA, char onB, const Vec3& pos, const Vec3& normalA, const Vec3& normalB) {
  const bool aLow = onA < onB;
  const Vec3 low = aLow ? normalA : normalB;
  const Vec3 high = aLow ? normalB : normalA;
  const int hand = dot(cross(low, high), pos) > 0 ? 1 : 0;
  const unsigned lo = static_cast<unsigned char>(aLow ? onA : onB);
  const unsigned hi = static_cast<unsigned char>(aLow ? onB : onA);
  return static_cast<int>((lo << 9) | (hi << 1) | static_cast<unsigned>(hand));
}

/// Parity of the permutation taking the wings of [orbit] to their targets;
/// -1 when the wings do not match the targets (impossible cube).
int wingParity(const Library& lib, int orbit, const std::string& f, const std::string& target) {
  const CubeGeometry& g = CubeGeometry::get(lib.n);
  const Orbit& o = lib.orbits[orbit];
  std::map<int, int> home;
  for (int e = 0; e < kOrbitSize; ++e) {
    const auto& el = o.elements[e];
    const int key = wingKey(target[el[0]], target[el[1]], g.cubiePosition(el[0]), g.normal(el[0]),
                            g.normal(el[1]));
    if (!home.emplace(key, e).second) return -1;
  }
  std::array<int, kOrbitSize> sigma{};
  for (int e = 0; e < kOrbitSize; ++e) {
    const auto& el = o.elements[e];
    const auto it = home.find(
        wingKey(f[el[0]], f[el[1]], g.cubiePosition(el[0]), g.normal(el[0]), g.normal(el[1])));
    if (it == home.end()) return -1;
    sigma[e] = it->second;
  }
  std::array<bool, kOrbitSize> seen{};
  int parity = 0;
  for (int e = 0; e < kOrbitSize; ++e) {
    if (seen[e]) continue;
    int length = 0;
    for (int x = e; !seen[x]; x = sigma[x]) {
      seen[x] = true;
      ++length;
    }
    parity ^= (length + 1) & 1;
  }
  for (int e = 0; e < kOrbitSize; ++e) {
    if (!seen[e]) return -1;
  }
  return parity;
}

/// Even cubes: the face colors implied by the corners, in the orientation
/// that already has the most center stickers in place.
bool cornerScheme(const Library& lib, const std::string& f, std::array<char, 6>& scheme) {
  const CubieFacelets& cf = cubieFacelets(lib.n);
  const CubeGeometry& g = CubeGeometry::get(lib.n);
  // Colors that share a corner are never opposite.
  std::map<char, std::array<int, 256>> together;
  std::string colors;
  for (const auto& corner : cf.corner) {
    for (int a = 0; a < 3; ++a) {
      const char ca = f[corner[a]];
      if (colors.find(ca) == std::string::npos) colors += ca;
      auto& row = together[ca];
      for (int b = 0; b < 3; ++b) row[static_cast<unsigned char>(f[corner[b]])] = 1;
    }
  }
  if (colors.size() != 6) return false;
  std::map<char, char> opposite;
  for (char c : colors) {
    for (char d : colors) {
      if (d != c && !together[c][static_cast<unsigned char>(d)]) {
        if (opposite.count(c) != 0) return false;
        opposite[c] = d;
      }
    }
    if (opposite.count(c) == 0) return false;
  }
  std::array<int, 3> slotFaces{};
  for (int i = 0; i < 3; ++i) slotFaces[i] = g.face(cf.corner[0][i]);
  int bestScore = -1;
  for (const auto& corner : cf.corner) {
    for (int r = 0; r < 3; ++r) {
      std::array<char, 6> s{};
      for (int i = 0; i < 3; ++i) {
        const int face = slotFaces[i];
        s[face] = f[corner[(i + r) % 3]];
        s[(face + 3) % 6] = opposite[s[face]];
      }
      int score = 0;
      for (size_t i = 0; i < f.size(); ++i) {
        if (lib.kind[i] == Kind::kCenter && f[i] == s[g.face(static_cast<int>(i))]) ++score;
      }
      if (score > bestScore) {
        bestScore = score;
        scheme = s;
      }
    }
  }
  return true;
}

/// The reduced cube as 3x3x3 facelets (centers from the scheme).
std::string reducedFacelets(int n, const std::string& f, const std::array<char, 6>& scheme) {
  std::string out(54, '?');
  auto index = [n](int i3) { return i3 == 0 ? 0 : (i3 == 2 ? n - 1 : n / 2); };
  for (int face = 0; face < 6; ++face) {
    for (int r = 0; r < 3; ++r) {
      for (int c = 0; c < 3; ++c) {
        out[face * 9 + r * 3 + c] = (r == 1 && c == 1)
                                        ? scheme[face]
                                        : f[face * n * n + index(r) * n + index(c)];
      }
    }
  }
  return out;
}

/// Positions of the n x n x n cubies covering a 3x3x3 cubie position.
std::vector<Vec3> liftHighlight(int n, const std::vector<Vec3>& positions) {
  std::vector<Vec3> out;
  auto expand = [n](int c) {
    std::vector<int> values;
    if (c > 0) {
      values.push_back(n - 1);
    } else if (c < 0) {
      values.push_back(-(n - 1));
    } else {
      for (int v = -(n - 3); v <= n - 3; v += 2) values.push_back(v);
    }
    return values;
  };
  for (const Vec3& p : positions) {
    for (int x : expand(p.x)) {
      for (int y : expand(p.y)) {
        for (int z : expand(p.z)) out.push_back({x, y, z});
      }
    }
  }
  return out;
}

/// Merges consecutive turns of the same layers (e.g. a cycle ending with
/// the move the next one starts with).
void mergeSteps(int n, std::vector<SolveStep>& steps) {
  std::vector<SolveStep> out;
  std::vector<LayerMove> moves;
  for (SolveStep& step : steps) {
    LayerMove m;
    if (!parseMove(step.move, n, m)) {
      out.push_back(std::move(step));
      moves.push_back({-1, 0, 0, 0});
      continue;
    }
    if (!moves.empty() && moves.back().axis == m.axis && moves.back().fromLayer == m.fromLayer &&
        moves.back().toLayer == m.toLayer && out.back().phase == step.phase) {
      LayerMove merged = moves.back();
      merged.quarterTurns = (merged.quarterTurns + m.quarterTurns) % 4;
      SolveStep kept = std::move(out.back());
      out.pop_back();
      moves.pop_back();
      if (merged.quarterTurns != 0) {
        kept.move = moveName(merged, n);
        out.push_back(std::move(kept));
        moves.push_back(merged);
      }
      continue;
    }
    out.push_back(std::move(step));
    moves.push_back(m);
  }
  steps.swap(out);
}

double millisSince(Clock::time_point start) {
  return std::chrono::duration<double, std::milli>(Clock::now() - start).count();
}

SolveResult fail(const char* error) {
  SolveResult r;
  r.error = error;
  return r;
}

}  // namespace

void ReductionSolver::prepare(int n) {
  libraryFor(n);
  KociembaSolver::prepare();
}

ReductionSolver::Coverage ReductionSolver::coverage(int n) {
  const Library& lib = libraryFor(n);
  Coverage c;
  for (const Orbit& o : lib.orbits) (o.wing ? c.wingOrbits : c.centerOrbits)++;
  c.cycles = static_cast<int>(lib.cycles.size());
  c.possible = lib.possible;
  return c;
}

std::string ReductionSolver::ollParityAlgorithm(int n) {
  return groupedAlgorithm(n, "Rw U2 x Rw U2 Rw U2 Rw' U2 Lw U2 Rw' U2 Rw U2 Rw' U2 Rw'");
}

std::string ReductionSolver::pllParityAlgorithm(int n) {
  return groupedAlgorithm(n, "r2 U2 r2 Uw2 r2 Uw2");
}

SolveResult ReductionSolver::solve(int n, const std::string& facelets, SolveMethod method) {
  const auto start = Clock::now();
  if (n < kMinSize || n > kMaxSize) return fail("unsupported");
  if (static_cast<int>(facelets.size()) != 6 * n * n) return fail("badLength");
  {
    std::map<char, int> counts;
    for (char c : facelets) ++counts[c];
    if (counts.size() != 6) return fail("badColors");
    for (const auto& entry : counts) {
      if (entry.second != n * n) return fail("badColors");
    }
  }
  const Library& lib = libraryFor(n);
  const CubeGeometry& g = CubeGeometry::get(n);
  Builder b{lib, FaceletCube{n, facelets}, {}};

  // Face colors: the fixed centers of odd cubes, the corners of even ones.
  std::array<char, 6> scheme{};
  if (n % 2 == 1) {
    for (int face = 0; face < 6; ++face) scheme[face] = facelets[face * n * n + (n * n) / 2];
    std::string distinct(scheme.begin(), scheme.end());
    std::sort(distinct.begin(), distinct.end());
    if (std::unique(distinct.begin(), distinct.end()) != distinct.end()) return fail("badColors");
  } else if (!cornerScheme(lib, facelets, scheme)) {
    return fail("badPieces");
  }

  // 1. Centers.
  std::string target(facelets.size(), '\0');
  for (int i = 0; i < g.faceletCount(); ++i) {
    if (lib.kind[i] == Kind::kCenter) target[i] = scheme[g.face(i)];
  }
  centerOpening(b, target);
  if (!solveWithCycles(b, false, target, "reductionCenters", "reductionCenterCycle")) {
    return fail("badPieces");
  }

  // 2. Edge pairing: choose what each edge slot should hold.
  struct SlotTarget {
    char a = 0;
    char b = 0;
  };
  std::array<SlotTarget, 12> slotTarget{};
  const CubieFacelets& cf3 = cubieFacelets(3);
  const CubeGeometry& g3 = CubeGeometry::get(3);
  if (n % 2 == 1) {
    for (int s = 0; s < 12; ++s) {
      slotTarget[s] = {b.cube.f[lib.slots[s].midge[0]], b.cube.f[lib.slots[s].midge[1]]};
    }
  } else {
    // Assign the 12 edges (in either orientation) to the slots that already
    // show most of their wing stickers.
    auto colorsOf = [&](int e, int flip) {
      const char c0 = scheme[g3.face(cf3.edge[e][0])];
      const char c1 = scheme[g3.face(cf3.edge[e][1])];
      return flip == 0 ? SlotTarget{c0, c1} : SlotTarget{c1, c0};
    };
    auto score = [&](int s, SlotTarget t) {
      int count = 0;
      for (const auto& w : lib.slots[s].wings) {
        count += (b.cube.f[w[0]] == t.a) + (b.cube.f[w[1]] == t.b);
      }
      return count;
    };
    std::vector<double> cost(144);
    std::array<std::array<int, 12>, 12> flipOf{};
    for (int s = 0; s < 12; ++s) {
      for (int e = 0; e < 12; ++e) {
        const int s0 = score(s, colorsOf(e, 0));
        const int s1 = score(s, colorsOf(e, 1));
        flipOf[s][e] = s1 > s0 ? 1 : 0;
        cost[s * 12 + e] = -std::max(s0, s1);
      }
    }
    const std::vector<int> assignment = vision::solveAssignment(cost, 12, 12);
    for (int s = 0; s < 12; ++s) slotTarget[s] = colorsOf(assignment[s], flipOf[s][assignment[s]]);

    // When every wing orbit is odd, flipping one target dedge fixes them all
    // at once (the reduced 3x3 then shows OLL parity, solved later).
    std::string wingTarget(facelets.size(), '\0');
    auto fillWingTargets = [&]() {
      std::fill(wingTarget.begin(), wingTarget.end(), '\0');
      for (int s = 0; s < 12; ++s) {
        for (const auto& w : lib.slots[s].wings) {
          wingTarget[w[0]] = slotTarget[s].a;
          wingTarget[w[1]] = slotTarget[s].b;
        }
      }
    };
    fillWingTargets();
    bool allOdd = true;
    for (int o = 0; o < static_cast<int>(lib.orbits.size()); ++o) {
      if (!lib.orbits[o].wing) continue;
      const int parity = wingParity(lib, o, b.cube.f, wingTarget);
      if (parity < 0) return fail("badPieces");
      allOdd &= parity == 1;
    }
    if (allOdd) {
      int bestSlot = 0;
      int bestLoss = 1 << 30;
      for (int s = 0; s < 12; ++s) {
        const SlotTarget flipped{slotTarget[s].b, slotTarget[s].a};
        const int loss = score(s, slotTarget[s]) - score(s, flipped);
        if (loss < bestLoss) {
          bestLoss = loss;
          bestSlot = s;
        }
      }
      std::swap(slotTarget[bestSlot].a, slotTarget[bestSlot].b);
    }
  }
  for (int s = 0; s < 12; ++s) {
    for (const auto& w : lib.slots[s].wings) {
      target[w[0]] = slotTarget[s].a;
      target[w[1]] = slotTarget[s].b;
    }
  }

  // Wing orbits with odd parity: one inner-slice quarter turn each, then
  // the centers it disturbed are rebuilt.
  bool sliced = false;
  for (int o = 0; o < static_cast<int>(lib.orbits.size()); ++o) {
    if (!lib.orbits[o].wing) continue;
    const int parity = wingParity(lib, o, b.cube.f, target);
    if (parity < 0) return fail("badPieces");
    if (parity == 0) continue;
    const int layer = lib.orbits[o].layer;
    int bestMove = -1;
    int bestCorrect = -1;
    for (int axis = 0; axis < 3; ++axis) {
      for (int l : {layer, n - 1 - layer}) {
        for (int q : {1, 3}) {
          const int id = lib.moveId(axis, l, q);
          int correct = 0;
          for (int i = 0; i < g.faceletCount(); ++i) {
            if (lib.kind[i] == Kind::kCenter) correct += b.cube.f[i] == target[lib.perms[id][i]];
          }
          if (correct > bestCorrect) {
            bestCorrect = correct;
            bestMove = id;
          }
        }
      }
    }
    b.emit({static_cast<uint8_t>(bestMove)}, "reductionEdgeParity", "reductionEdgeParity", "", {});
    sliced = true;
  }
  if (sliced &&
      !solveWithCycles(b, false, target, "reductionEdgeParity", "reductionParityCenters")) {
    return fail("badPieces");
  }
  if (!solveWithCycles(b, true, target, "reductionEdges", "reductionEdgeCycle")) {
    return fail("badPieces");
  }

  // 3. Parity of the reduced 3x3x3 (even cubes only).
  std::string reduced;
  for (int attempt = 0;; ++attempt) {
    reduced = reducedFacelets(n, b.cube.f, scheme);
    CubieCube cubie;
    const CubeError error = toCubie(reduced, 3, scheme, cubie);
    if (error == CubeError::kNone) break;
    if (n % 2 == 1 || attempt >= 3) return fail(cubeErrorName(error));
    const std::vector<Vec3> uf = liftHighlight(n, {{0, 2, 2}});
    if (error == CubeError::kFlip) {
      b.emitAlgorithm(ollParityAlgorithm(n), "reductionOllParity", "reductionOllParity", uf);
    } else if (error == CubeError::kParity) {
      std::vector<Vec3> pair = liftHighlight(n, {{0, 2, 2}, {0, 2, -2}});
      b.emitAlgorithm(pllParityAlgorithm(n), "reductionPllParity", "reductionPllParity", pair);
    } else {
      return fail(cubeErrorName(error));
    }
  }
  mergeSteps(n, b.steps);

  // 4. The reduced cube as a 3x3x3.
  const SolveResult stage = method == SolveMethod::kLayerByLayer ? LblSolver::solve(reduced)
                                                                 : KociembaSolver::solve(reduced);
  if (!stage.ok) return fail(stage.error.empty() ? "internal" : stage.error.c_str());
  for (const SolveStep& s : stage.steps) {
    SolveStep step = s;
    step.cubeState.clear();
    step.highlight = liftHighlight(n, s.highlight);
    b.steps.push_back(std::move(step));
  }

  SolveResult result;
  result.ok = true;
  result.method = method == SolveMethod::kLayerByLayer ? "reductionLbl" : "reduction";
  result.steps = std::move(b.steps);
  result.millis = millisSince(start);
  return result;
}

}  // namespace cm
