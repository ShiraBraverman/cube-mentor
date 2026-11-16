#include "vision/kmeans.hpp"

#include <algorithm>
#include <cmath>
#include <limits>
#include <random>

namespace cm::vision {

namespace {

constexpr int kRestarts = 10;
constexpr int kMaxIterations = 60;
constexpr int kMaxBalancedRounds = 8;

using Centroids = std::array<Lab, kClusters>;

int nearest(const Lab& p, const Centroids& centroids, double* distance2 = nullptr) {
  int best = 0;
  double bestD = std::numeric_limits<double>::max();
  for (int c = 0; c < kClusters; ++c) {
    const double d = clusterDistance2(p, centroids[c]);
    if (d < bestD) {
      bestD = d;
      best = c;
    }
  }
  if (distance2 != nullptr) *distance2 = bestD;
  return best;
}

/// Means of the labelled points; an empty cluster keeps its old centroid.
void updateCentroids(const std::vector<Lab>& points, const std::vector<int>& label,
                     Centroids& centroids) {
  std::array<Lab, kClusters> sum{};
  std::array<int, kClusters> count{};
  for (size_t i = 0; i < points.size(); ++i) {
    Lab& s = sum[label[i]];
    s.L += points[i].L;
    s.a += points[i].a;
    s.b += points[i].b;
    ++count[label[i]];
  }
  for (int c = 0; c < kClusters; ++c) {
    if (count[c] == 0) continue;
    centroids[c] = {sum[c].L / count[c], sum[c].a / count[c], sum[c].b / count[c]};
  }
}

/// Plain Lloyd iterations; returns the inertia (sum of squared distances).
double lloyd(const std::vector<Lab>& points, Centroids& centroids, std::vector<int>& label) {
  label.assign(points.size(), -1);
  double inertia = 0;
  for (int iteration = 0; iteration < kMaxIterations; ++iteration) {
    bool changed = false;
    inertia = 0;
    std::array<int, kClusters> count{};
    for (size_t i = 0; i < points.size(); ++i) {
      double d = 0;
      const int c = nearest(points[i], centroids, &d);
      inertia += d;
      ++count[c];
      if (label[i] != c) {
        label[i] = c;
        changed = true;
      }
    }
    // Re-seed an empty cluster at the point worst served by its centroid.
    for (int c = 0; c < kClusters; ++c) {
      if (count[c] != 0) continue;
      size_t worst = 0;
      double worstD = -1;
      for (size_t i = 0; i < points.size(); ++i) {
        const double d = clusterDistance2(points[i], centroids[label[i]]);
        if (d > worstD) {
          worstD = d;
          worst = i;
        }
      }
      centroids[c] = points[worst];
      label[worst] = c;
      changed = true;
    }
    if (!changed && iteration > 0) break;
    updateCentroids(points, label, centroids);
  }
  return inertia;
}

Centroids kMeansPlusPlus(const std::vector<Lab>& points, std::mt19937& rng) {
  Centroids centroids{};
  std::uniform_int_distribution<size_t> pick(0, points.size() - 1);
  centroids[0] = points[pick(rng)];
  std::vector<double> d2(points.size());
  for (int c = 1; c < kClusters; ++c) {
    double total = 0;
    for (size_t i = 0; i < points.size(); ++i) {
      double best = std::numeric_limits<double>::max();
      for (int k = 0; k < c; ++k) best = std::min(best, clusterDistance2(points[i], centroids[k]));
      d2[i] = best;
      total += best;
    }
    if (total <= 0) {
      centroids[c] = points[pick(rng)];
      continue;
    }
    std::uniform_real_distribution<double> uniform(0, total);
    double target = uniform(rng);
    size_t chosen = points.size() - 1;
    for (size_t i = 0; i < points.size(); ++i) {
      target -= d2[i];
      if (target <= 0) {
        chosen = i;
        break;
      }
    }
    centroids[c] = points[chosen];
  }
  return centroids;
}

/// Assigns exactly [perCluster] points to every centroid at minimum total
/// distance.
std::vector<int> balancedLabels(const std::vector<Lab>& points, const Centroids& centroids,
                                int perCluster) {
  const int n = static_cast<int>(points.size());
  std::vector<double> cost(static_cast<size_t>(n) * n);
  for (int i = 0; i < n; ++i) {
    for (int c = 0; c < kClusters; ++c) {
      const double d = std::sqrt(clusterDistance2(points[i], centroids[c]));
      for (int s = 0; s < perCluster; ++s) cost[static_cast<size_t>(i) * n + c * perCluster + s] = d;
    }
  }
  std::vector<int> column = solveAssignment(cost, n, n);
  for (int& c : column) c /= perCluster;
  return column;
}

}  // namespace

std::vector<int> solveAssignment(const std::vector<double>& cost, int rows, int cols) {
  // Shortest augmenting path formulation with potentials (1-based helpers).
  const double inf = std::numeric_limits<double>::max() / 4;
  std::vector<double> u(rows + 1, 0), v(cols + 1, 0), minv(cols + 1);
  std::vector<int> p(cols + 1, 0), way(cols + 1, 0);
  std::vector<char> used(cols + 1);
  for (int i = 1; i <= rows; ++i) {
    p[0] = i;
    int j0 = 0;
    std::fill(minv.begin(), minv.end(), inf);
    std::fill(used.begin(), used.end(), char{0});
    do {
      used[j0] = 1;
      const int i0 = p[j0];
      double delta = inf;
      int j1 = 0;
      for (int j = 1; j <= cols; ++j) {
        if (used[j]) continue;
        const double cur = cost[static_cast<size_t>(i0 - 1) * cols + (j - 1)] - u[i0] - v[j];
        if (cur < minv[j]) {
          minv[j] = cur;
          way[j] = j0;
        }
        if (minv[j] < delta) {
          delta = minv[j];
          j1 = j;
        }
      }
      for (int j = 0; j <= cols; ++j) {
        if (used[j]) {
          u[p[j]] += delta;
          v[j] -= delta;
        } else {
          minv[j] -= delta;
        }
      }
      j0 = j1;
    } while (p[j0] != 0);
    do {
      const int j1 = way[j0];
      p[j0] = p[j1];
      j0 = j1;
    } while (j0 != 0);
  }
  std::vector<int> column(rows, -1);
  for (int j = 1; j <= cols; ++j) {
    if (p[j] != 0) column[p[j] - 1] = j - 1;
  }
  return column;
}

Clustering clusterStickers(const std::vector<Lab>& points, int perCluster,
                           const std::vector<int>& seeds) {
  std::mt19937 rng(0x5eed);
  Centroids best{};
  double bestInertia = std::numeric_limits<double>::max();
  std::vector<int> label;

  auto consider = [&](Centroids centroids) {
    const double inertia = lloyd(points, centroids, label);
    if (inertia < bestInertia) {
      bestInertia = inertia;
      best = centroids;
    }
  };

  if (static_cast<int>(seeds.size()) == kClusters) {
    Centroids seeded{};
    for (int c = 0; c < kClusters; ++c) seeded[c] = points[seeds[c]];
    consider(seeded);
  }
  for (int r = 0; r < kRestarts; ++r) consider(kMeansPlusPlus(points, rng));

  // Balanced refinement: assign n^2 points per cluster, move the centroids,
  // repeat until stable.
  Clustering result;
  result.centroids = best;
  for (int round = 0; round < kMaxBalancedRounds; ++round) {
    std::vector<int> next = balancedLabels(points, result.centroids, perCluster);
    const bool stable = next == result.label;
    result.label = std::move(next);
    updateCentroids(points, result.label, result.centroids);
    if (stable) break;
  }

  result.confidence.resize(points.size());
  for (size_t i = 0; i < points.size(); ++i) {
    const int own = result.label[i];
    const double dOwn = std::sqrt(clusterDistance2(points[i], result.centroids[own]));
    double dOther = std::numeric_limits<double>::max();
    for (int c = 0; c < kClusters; ++c) {
      if (c != own) dOther = std::min(dOther, std::sqrt(clusterDistance2(points[i], result.centroids[c])));
    }
    const double margin = dOther + dOwn > 0 ? (dOther - dOwn) / (dOther + dOwn) : 0;
    result.confidence[i] = std::clamp(margin, 0.0, 1.0);
  }
  return result;
}

}  // namespace cm::vision
