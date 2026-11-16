# CubeMentor native core (C++17)

| Path | Contents |
| --- | --- |
| `core/` | Facelet geometry (same conventions as the Dart model), notation, cubie model and validation |
| `solver/solver_2x2.*` | Optimal 2x2 solver: full BFS distance table (3.67M states), greedy descent |
| `solver/kociemba.*` | Kociemba two-phase 3x3 solver, three orientations searched in parallel |
| `solver/lbl.*` | Pedagogical layer-by-layer 3x3 solver emitting `SolveStep` metadata |
| `solver/solver.*` | Dispatch and JSON serialization |
| `ffi_bridge.*` | `extern "C"` API used by Dart FFI (`lib/core/ffi/`) |
| `vision/` | Computer vision pipeline (Milestone 3) |

Builds: Android via `android/app/build.gradle.kts` (externalNativeBuild),
Windows via `windows/CMakeLists.txt`, tests via `test/cpp/CMakeLists.txt`:

```
cmake -S test/cpp -B build/cpp
cmake --build build/cpp --config Release
ctest --test-dir build/cpp -C Release --output-on-failure
```

The test build also produces `build/cpp/native/Release/cubementor.dll`, which
the Dart integration tests (`test/flutter/native_solver_test.dart`) load.
