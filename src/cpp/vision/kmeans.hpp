// Global K-Means over every scanned sticker (all six faces at once), with a
// balanced final assignment: a cube has exactly n^2 stickers of each color,
// which settles close calls such as red vs. orange under warm light.
#pragma once

#include <array>
#include <vector>

#include "vision/color.hpp"

namespace cm::vision {

constexpr int kClusters = 6;

struct Clustering {
  /// Cluster of every point, each cluster holding exactly `perCluster`.
  std::vector<int> label;
  std::array<Lab, kClusters> centroids{};
  /// Per-point confidence in [0, 1]: how much closer the point is to its own
  /// centroid than to the nearest other one (0 = a coin flip).
  std::vector<double> confidence;
};

/// Clusters [points] (6 * perCluster of them) into 6 balanced clusters.
/// [seeds], when it holds 6 indices, seeds one cluster at each of those
/// points (the face centers of odd cubes); k-means++ restarts run as well
/// and the tightest clustering wins.
Clustering clusterStickers(const std::vector<Lab>& points, int perCluster,
                           const std::vector<int>& seeds);

/// Minimum-cost assignment of `rows` workers to distinct columns
/// (rows <= cols) for a row-major cost matrix. Returns the column of each
/// row (Hungarian algorithm, O(rows^2 * cols)).
std::vector<int> solveAssignment(const std::vector<double>& cost, int rows, int cols);

}  // namespace cm::vision
