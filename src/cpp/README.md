# CubeMentor native core (C++17)

| Path | Contents |
| --- | --- |
| `core/` | Facelet geometry (same conventions as the Dart model), notation, cubie model and validation |
| `solver/solver_2x2.*` | Optimal 2x2 solver: full BFS distance table (3.67M states), greedy descent |
| `solver/kociemba.*` | Kociemba two-phase 3x3 solver, three orientations searched in parallel |
| `solver/lbl.*` | Pedagogical layer-by-layer 3x3 solver emitting `SolveStep` metadata, tagged with the beginner's method crown (1-3) and sub-step (`kLblStages`: 1.1 1.2 2.1 3.1 3.2 3.3 3.4) |
| `solver/reduction.*` | 4x4-6x6 reduction: centers and edge pairing with pure 3-cycles (a commutator library found by search, covering every center and wing orbit), edge parity by a slice turn, OLL / PLL parity algorithms, then the 3x3 stage with Kociemba or LBL |
| `solver/scramble.*` | Seeded scrambles: random-state 2x2/3x3, random-move 4x4+ (timer, daily challenge) |
| `solver/solver.*` | Dispatch and JSON serialization |
| `ffi_bridge.*` | `extern "C"` API used by Dart FFI (`lib/core/ffi/`) |
| `vision/` | CIELAB + K-Means color classifier and cube validator (Milestone 3) |

Builds: Android via `android/app/build.gradle.kts` (externalNativeBuild),
Windows via `windows/CMakeLists.txt`, tests via `test/cpp/CMakeLists.txt`:

```
cmake -S test/cpp -B build/cpp
cmake --build build/cpp --config Release
ctest --test-dir build/cpp -C Release --output-on-failure
```

The test build also produces `build/cpp/native/Release/cubementor.dll`, which
the Dart integration tests (`test/flutter/native_solver_test.dart`) load.
