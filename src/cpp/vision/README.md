# vision

Color pipeline of the scanner (Milestone 3), exposed through
`cm_scan_classify` / `cm_scan_validate` in `ffi_bridge.h`.

- `color.*`: sRGB <-> CIELAB (D65) and a lighting-tolerant distance that
  weights lightness less than chroma.
- `kmeans.*`: global K-Means (K = 6) over every sticker of all six faces,
  k-means++ restarts (seeded at the centers on odd cubes), then a balanced
  Hungarian assignment (exactly n^2 stickers per color) and per-sticker
  confidence.
- `scanner.*`: per-face illumination correction (von Kries gains estimated
  from the clusters, re-clustered until stable), cluster naming, JSON.
- `validator.*`: color counts, distinct centers, scheme inference (centers on
  odd cubes; corners, then dominant face colors on even cubes), impossible or
  duplicate pieces, twist / flip / parity, with the exact stickers to fix.

Tests: `test/cpp/test_vision.cpp` (warm, cool, dim, bright and mixed
per-face lighting, off-brand schemes, validator edge cases).
