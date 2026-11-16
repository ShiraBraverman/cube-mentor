#include "vision/scanner.hpp"

#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdio>
#include <limits>
#include <numeric>

#include "vision/kmeans.hpp"

namespace cm::vision {

namespace {

/// Names clusters after the standard colors: the one-to-one mapping with
/// the smallest total distance (6! = 720 candidates).
std::array<int, kClusters> nameClusters(const std::array<Lab, kClusters>& centroids) {
  std::array<Lab, 6> reference{};
  for (int k = 0; k < 6; ++k) reference[k] = rgbToLab(referenceColors()[k]);
  std::array<int, kClusters> perm{};
  std::iota(perm.begin(), perm.end(), 0);
  std::array<int, kClusters> best = perm;
  double bestCost = std::numeric_limits<double>::max();
  do {
    double cost = 0;
    for (int c = 0; c < kClusters; ++c) cost += std::sqrt(clusterDistance2(centroids[c], reference[perm[c]]));
    if (cost < bestCost) {
      bestCost = cost;
      best = perm;
    }
  } while (std::next_permutation(perm.begin(), perm.end()));
  return best;  // cluster -> index into kColorLetters
}

constexpr int kLightingRounds = 4;

double channel(const LinearRgb& c, int k) { return k == 0 ? c.r : (k == 1 ? c.g : c.b); }

double& channel(LinearRgb& c, int k) { return k == 0 ? c.r : (k == 1 ? c.g : c.b); }

/// Clusters the stickers while estimating each face's illumination. Every
/// face is captured separately, so auto exposure and white balance differ
/// between faces. Model each face as a per-channel gain on linear light
/// (von Kries): cluster, measure every face's median ratio to its clusters'
/// mean colors, undo those gains and cluster again until labels settle.
Clustering clusterWithLighting(int n, const std::vector<LinearRgb>& linear,
                               const std::vector<int>& seeds) {
  const int perFace = n * n;
  const int count = static_cast<int>(linear.size());
  std::array<LinearRgb, 6> gain;
  gain.fill({1, 1, 1});
  std::vector<Lab> points(count);
  Clustering clustering;
  for (int round = 0; round < kLightingRounds; ++round) {
    for (int i = 0; i < count; ++i) {
      const LinearRgb& g = gain[i / perFace];
      points[i] = linearToLab({linear[i].r / g.r, linear[i].g / g.g, linear[i].b / g.b});
    }
    Clustering next = clusterStickers(points, perFace, seeds);
    const bool stable = round > 0 && next.label == clustering.label;
    clustering = std::move(next);
    if (stable || round == kLightingRounds - 1) break;

    // Mean corrected color of every cluster.
    std::array<LinearRgb, kClusters> mean{};
    std::array<int, kClusters> members{};
    for (int i = 0; i < count; ++i) {
      const LinearRgb& g = gain[i / perFace];
      LinearRgb& m = mean[clustering.label[i]];
      m.r += linear[i].r / g.r;
      m.g += linear[i].g / g.g;
      m.b += linear[i].b / g.b;
      ++members[clustering.label[i]];
    }
    for (int c = 0; c < kClusters; ++c) {
      for (int k = 0; k < 3; ++k) channel(mean[c], k) /= std::max(1, members[c]);
    }
    // Each face's gain: median sticker / cluster-mean ratio per channel,
    // skipping channels too dark to measure (e.g. red in blue stickers).
    for (int face = 0; face < 6; ++face) {
      for (int k = 0; k < 3; ++k) {
        std::vector<double> ratios;
        for (int i = face * perFace; i < (face + 1) * perFace; ++i) {
          const double reference = channel(mean[clustering.label[i]], k);
          if (reference > 0.03) ratios.push_back(channel(linear[i], k) / reference);
        }
        if (ratios.empty()) continue;
        std::nth_element(ratios.begin(), ratios.begin() + ratios.size() / 2, ratios.end());
        channel(gain[face], k) = std::max(0.02, ratios[ratios.size() / 2]);
      }
    }
    // Only relative gains matter: keep their geometric mean at 1.
    for (int k = 0; k < 3; ++k) {
      double logSum = 0;
      for (const LinearRgb& g : gain) logSum += std::log(channel(g, k));
      const double scale = std::exp(logSum / 6);
      for (LinearRgb& g : gain) channel(g, k) /= scale;
    }
  }
  return clustering;
}

void appendValidation(std::string& out, const Validation& v) {
  out += "\"ok\":";
  out += v.ok() ? "true" : "false";
  out += ",\"error\":\"";
  out += scanErrorName(v.error);
  out += "\",\"scheme\":\"";
  if (v.hasScheme) out.append(v.scheme.begin(), v.scheme.end());
  out += "\"";
  auto list = [&out](const char* key, const std::vector<int>& values) {
    out += ",\"";
    out += key;
    out += "\":[";
    for (size_t i = 0; i < values.size(); ++i) {
      if (i > 0) out += ',';
      out += std::to_string(values[i]);
    }
    out += ']';
  };
  list("invalid", v.invalid);
  list("uncertain", v.uncertain);
}

}  // namespace

ScanResult classifyScan(int n, const std::vector<Rgb>& stickers) {
  const auto start = std::chrono::steady_clock::now();
  ScanResult result;
  const int count = 6 * n * n;
  if (n < 2 || n > 7 || static_cast<int>(stickers.size()) != count) {
    result.validation.error = ScanError::kBadLength;
    return result;
  }
  std::vector<LinearRgb> linear(count);
  for (int i = 0; i < count; ++i) linear[i] = toLinear(stickers[i]);

  std::vector<int> seeds;
  if (n % 2 == 1) {
    for (int face = 0; face < 6; ++face) seeds.push_back(face * n * n + (n / 2) * n + n / 2);
  }
  const Clustering clustering = clusterWithLighting(n, linear, seeds);
  const std::array<int, kClusters> names = nameClusters(clustering.centroids);

  result.facelets.resize(count);
  for (int i = 0; i < count; ++i) result.facelets[i] = kColorLetters[names[clustering.label[i]]];
  result.confidence = clustering.confidence;
  for (int c = 0; c < kClusters; ++c) result.palette[names[c]] = labToRgb(clustering.centroids[c]);
  result.validation = validateCube(n, result.facelets, result.confidence);
  result.millis =
      std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count();
  return result;
}

std::string toJson(const ScanResult& result) {
  std::string out = "{";
  appendValidation(out, result.validation);
  out += ",\"facelets\":\"" + result.facelets + "\",\"confidence\":[";
  char buffer[32];
  for (size_t i = 0; i < result.confidence.size(); ++i) {
    if (i > 0) out += ',';
    std::snprintf(buffer, sizeof(buffer), "%.3f", result.confidence[i]);
    out += buffer;
  }
  out += "],\"palette\":[";
  for (int k = 0; k < 6; ++k) {
    if (k > 0) out += ',';
    const Rgb& c = result.palette[k];
    std::snprintf(buffer, sizeof(buffer), "[%d,%d,%d]", c.r, c.g, c.b);
    out += buffer;
  }
  std::snprintf(buffer, sizeof(buffer), "%.3f", result.millis);
  out += "],\"millis\":";
  out += buffer;
  out += '}';
  return out;
}

std::string toJson(const Validation& validation) {
  std::string out = "{";
  appendValidation(out, validation);
  out += '}';
  return out;
}

}  // namespace cm::vision
