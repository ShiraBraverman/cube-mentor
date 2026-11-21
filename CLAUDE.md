# Project: CubeMentor (2x2 to 6x6 Cube Solver & Interactive Academy)

## 1. Product Vision & Scope
An offline-first, high-performance mobile application (Android-first via Flutter) that scans physical twisty puzzles (2x2, 3x3, 4x4, 5x5, 6x6) via the device camera, solves them rapidly, and provides an interactive 3D visual guide and step-by-step beginner/advanced academy.
- **No Accounts / No Backend:** 100% offline execution for core features. Zero user registration/login, zero subscriptions.
- **Localization (i18n):** 21 languages (22 locales) in a single app binary using `flutter_localizations` / `intl`, with **English (`en`) as the default and fallback**: English, Hebrew (RTL), Spanish, Portuguese (`pt_BR` Brazil + `pt` Portugal), Indonesian, Hindi, Filipino (`fil`), Arabic (RTL), French, German, Russian, Japanese, Korean, Simplified Chinese (`zh`), Traditional Chinese (`zh_TW`), Vietnamese (`vi`), Burmese (`my`), Polish (`pl`), Turkish (`tr`), Bengali (`bn`) and Tatar (`tt`; Flutter has no Material strings for Tatar, so `lib/core/l10n/app_delegates.dart` falls back to English Material/Cupertino strings). Users pick a language from the searchable Language sheet on the Home header (native names; LTR/RTL switches automatically); the choice is persisted, and first launch follows the device language when it is supported (Chinese devices in TW/HK/MO or with the Hant script get `zh_TW`). Tall scripts get extra line height via `AppTheme.minLineHeightFor` (Burmese the most).
- **Cube color scheme:** Settings toggles Western (white opposite yellow, default) or Japanese (white opposite blue, yellow opposite green). The model, solvers and lessons always use logical Western-layout colors; `CubeColorScheme` maps them to what the physical cube shows via `StickerPalette` (3D cube, pattern previews, hold swatches, color names) and maps scanned colors back to logical ones before validation.
- **Monetization:** Google AdMob (`google_mobile_ads`):
  - Bottom adaptive Banner ad (never overlapping the 3D canvas).
  - Rewarded Video ads gating 4x4, 5x5, and 6x6 solvers and advanced academy lessons (use official Google Test Ad Unit IDs during development).
- **Future AI Coach Readiness:** Every pedagogical `SolveStep` struct must carry structured metadata (`cubeState`, `phaseName`, `moveNotation`, `explanationKey`, `highlightedCubies`) so an optional LLM-based "Personal AI Coach" module (`lib/features/ai_coach/`) can be plugged in later without refactoring the core solver.

---

## 2. Tech Stack & Architecture
- **Frontend & UI:** Flutter (Stable, Impeller rendering engine) + Dart.
- **State Management:** Riverpod (`flutter_riverpod`) for clean, reactive state separation.
- **3D Rendering Engine:** Hardware-accelerated 3D cube rendering (`thermion` / Google Filament PBR or high-FPS custom 3D scene) supporting:
  - Dynamic $N \times N \times N$ cube generation ($N \in \{2, 3, 4, 5, 6\}$).
  - Smooth 60fps slice/layer rotation animations (including wide moves like `Rw`, `Uw`, and inner slice moves).
  - Touch gestures to orbit/rotate the cube + step-by-step playback controls (Play/Pause, Next, Prev, Speed slider, X-ray/transparency toggle).
  - Visual highlighting of active pieces for pedagogical steps.
- **Native Core Engine (C++ via Dart FFI):**
  - Compiled via CMake / Android NDK (`src/cpp/`) and invoked via `dart:ffi`.
  - **Solvers:**
    - `2x2`: Optimal BFS/IDA* solver (< 1ms).
    - `3x3 Fast`: Kociemba Two-Phase Algorithm (< 5ms).
    - `3x3 Academy`: Pedagogical Layer-by-Layer (LBL) / CFOP state machine returning structured `SolveStep` objects. The LBL method follows the classic **3 crowns / 7 sub-steps** (1.1 white cross, 1.2 first-crown corners, 2.1 middle-layer edges, 3.1 yellow cross, 3.2 align yellow cross edges, 3.3 position yellow corners, 3.4 orient yellow corners); every step carries `crown` and `subStep`, it is the default guided method (Fast/Kociemba is a toggle), and the Academy beginner track has one lesson per sub-step.
    - `4x4, 5x5, 6x6`: Reduction Method engine (Centers -> Edge Pairing -> 3x3 reduction -> OLL/PLL Parity resolution).
  - **Computer Vision Pipeline (OpenCV C++):**
    - Real-time camera frame processing (`camera` plugin buffer) with a dynamic $N \times N$ screen overlay grid.
    - Convert sampled grid patches to **CIELAB** color space to decouple luminance from chromaticity.
    - Run **K-Means Clustering (K=6)** across all 6 scanned faces (54 to 216 stickers) using the fixed center pieces (or relative clustering for even cubes) to achieve lighting-invariant color classification.
    - Cube state validator + manual tap-to-fix color override in UI.
- **Local Storage:** `shared_preferences` or `hive` for saving language preference, completed tutorial modules, and unlocked rewarded states.

---

## 3. Directory Structure
```text
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── ffi/              # Dart FFI bindings to C++ native library
│   │   ├── l10n/             # ARB files: app_en.arb (template) + 21 translations
│   │   ├── theme/            # Dark glassmorphic theme, colors, typography
│   │   └── ads/              # AdMob service wrapper (Banner & Rewarded)
│   ├── features/
│   │   ├── home/             # Cube size selector (2x2 - 6x6) & mode selection
│   │   ├── scanner/          # Camera overlay, real-time color preview, manual edit
│   │   ├── solver_3d/        # 3D cube viewport, move animator, playback controls
│   │   ├── academy/          # Interactive step-by-step lessons & drills
│   │   └── ai_coach/         # Placeholder/interface for future AI Coach integration
├── src/
│   └── cpp/
│       ├── CMakeLists.txt
│       ├── solver/           # 2x2, Kociemba 3x3, LBL pedagogical, 4x4-6x6 Reduction
│       ├── vision/           # CIELAB conversion, K-Means clustering, state validator
│       └── ffi_bridge.cpp    # extern "C" API exposed to Dart
└── test/
    ├── cpp/                  # C++ unit tests for solvers and state validation
    └── flutter/              # Dart widget & solver integration tests
```

---

## 4. Coding & Workflow Rules for Claude Code
1. **Language Policy:** All source code, variable/function names, commit messages, and **all inline code comments MUST be written strictly in English**. Never write Hebrew comments inside code files.
2. **Low-Resource Development Environment:**
   - Do **NOT** launch an Android Emulator (heavy RAM usage).
   - Verify changes using lightweight CLI checks: `flutter analyze`, `flutter test`, and C++ unit tests via CMake/CTest.
   - Target physical Android devices via USB (`flutter run`) or Windows desktop (`flutter run -d windows`) when testing UI.
3. **Incremental Milestones (Do NOT build everything at once):**
   - **Milestone 1:** Project skeleton, dark glassmorphic theme, EN/HE localization (with RTL support), home screen (cube selector 2x2–6x6), and interactive $N \times N \times N$ 3D cube renderer with smooth move animations.
   - **Milestone 2:** C++ FFI bridge + 2x2 & 3x3 solvers (Kociemba + LBL pedagogical engine) + full unit test coverage.
   - **Milestone 3:** Camera scanner UI with $N \times N$ grid overlay, CIELAB + K-Means color classifier, state validator, and tap-to-correct UI.
   - **Milestone 4:** 4x4, 5x5, and 6x6 Reduction solver in C++ + Academy lessons module.
   - **Milestone 5:** AdMob integration (Banner + Rewarded Video) and release build (`flutter build appbundle`).
4. **Algorithmic Integrity:** Implement proven group-theory tables/pruning for Kociemba and standard Reduction phases for big cubes, verified against automated scramble-and-solve tests (1,000+ random scrambles per cube size).
5. **Context Hygiene:** Keep modules decoupled and concise. Propose `/compact` after completing each milestone or major feature.
6. **Localization Rule (all languages, every feature):** Any user-visible string added or changed in any milestone (Big Cubes 4x4-6x6, Academy lessons, Speed Timer, Daily Challenge, Pattern Library, AdMob/Milestone 5 and later) MUST:
   - be added as a key to `app_en.arb` (with `@key` placeholder metadata) **and** to every other ARB file in the same change: `he`, `es`, `pt`, `pt_BR`, `id`, `hi`, `fil`, `ar`, `fr`, `de`, `ru`, `pl`, `tr`, `ja`, `ko`, `zh`, `zh_TW`, `vi`, `my`, `bn`, `tt`, with natural native-quality translations (correct cubing terminology; each language's ICU plural categories, e.g. `one/few/many` in Russian and Polish and `two/few/many` in Arabic);
   - never be hard-coded in Dart; cube notation inside RTL strings (`he`, `ar`) is wrapped in U+2066 ... U+2069 so it reads left to right;
   - pass `flutter gen-l10n` with no untranslated messages, the ARB parity smoke test `test/flutter/arb_files_test.dart`, and the per-locale layout test `test/flutter/l10n_test.dart` (no overflow on a 360 dp phone in any language). New screens are added to that test.
