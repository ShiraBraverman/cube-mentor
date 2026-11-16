// Small coordinate helpers: permutation ranking (Lehmer code).
#pragma once

#include <cstdint>

namespace cm {

/// Rank of a permutation of 0..N-1 in [0, N!), identity -> 0.
template <int N, typename T>
int permRank(const T* p) {
  int rank = 0;
  for (int i = 0; i < N; ++i) {
    int smaller = 0;
    for (int j = i + 1; j < N; ++j) smaller += p[j] < p[i] ? 1 : 0;
    rank = rank * (N - i) + smaller;
  }
  return rank;
}

/// Inverse of [permRank].
template <int N, typename T>
void permUnrank(int rank, T* p) {
  int digits[N];
  for (int i = N - 1; i >= 0; --i) {
    digits[i] = rank % (N - i);
    rank /= (N - i);
  }
  bool used[N] = {};
  for (int i = 0; i < N; ++i) {
    int skip = digits[i];
    for (int v = 0; v < N; ++v) {
      if (used[v]) continue;
      if (skip-- == 0) {
        p[i] = static_cast<T>(v);
        used[v] = true;
        break;
      }
    }
  }
}

}  // namespace cm
