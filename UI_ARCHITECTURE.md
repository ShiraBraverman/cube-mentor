# CubeMentor — UI Architecture Review

> Snapshot of the UI as it is built today (branch `claude/ui-architecture-doc-e0d1a5`, based on commit `aabe7ae`).
> Audit only: no code changed. All labels below are the **English** strings from `lib/core/l10n/app_en.arb`.
> Use this file to review and refine each screen one at a time before any code change.

---

## 0. Global shell

| Topic | Today |
|---|---|
| Entry point | `lib/main.dart` -> `CubeMentorApp` (`lib/app.dart`) -> `MaterialApp(home: HomeScreen)` |
| Router | **None.** No named routes, no `go_router`. Every screen is pushed with `Navigator.push(MaterialPageRoute)`; back is the system back / AppBar back arrow. |
| Bottom navigation / tabs | **None.** Home is a hub; every feature is one push deep (some two). |
| Ad banner slot | **Not built and no space reserved.** `google_mobile_ads` is not in `pubspec.yaml`. The only ad-related code is `RewardGate` (`lib/core/ads/reward_gate.dart`), currently `OpenRewardGate` = everything unlocked. |
| Settings / Stats screen | **None.** Language lives on the Home header; the Guided/Fast preference lives only inside the solve dock; timer stats live inside the Timer. |
| Theme | Dark only. `GlassBackground` (obsidian gradient + two faint glows) wraps every screen; panels are `GlassCard` (blur, translucent fill, hairline border, `selected` = accent glow). |
| Tokens | `AppColors` — accent `#6E8BFF` (cobalt), accentSecondary `#3EE6B0` (mint), accentWarm `#FF9A4D` (ember), gold `#FFD15C`, danger `#FF5D6C`. `AppSpace` 4-pt grid (4/8/12/16/24/32/48, gutter 20, touch 56, maxWidth 680). `AppRadius` 14/20/28/pill. |
| Shared UI kit | `lib/core/theme/ui_kit.dart`: `PageFrame`, `SectionHeader`, `AccentIcon`, `AppPill`, `GlowProgressBar`, `CubeStage` / `RotatingCubeStage` (lit floor under every 3D cube). |
| Transient feedback | SnackBars only (solver errors, "Follow the highlighted arrow", "The cube is already solved."). No dialogs anywhere. |

### Navigation map

```text
                               +--------------------+
                               |       HOME         |
                               +--------------------+
   [Language button] ----------> (Language sheet) --pick--> back to Home (app re-renders, LTR/RTL)
   [Continue learning card] ---> LESSON VIEW (next lesson)  | or ACADEMY HUB when all done
   [3D Playground] ------------> 3D SOLVER (Playground, selected size)
   [Scan & Solve] -------------> SCANNER (selected size)
                                    | [Learn step by step] / [Solve] / [Fast solve] / [Open in 3D]
                                    +--pushReplacement--> 3D SOLVER (scanned cube, auto-solve)
   [Academy] ------------------> ACADEMY HUB ---tile---> LESSON VIEW
                                                           | [Next lesson: ...] --pushReplacement--> LESSON VIEW
                                                           | [Back to the Academy] --pop--> ACADEMY HUB
   [Daily challenge] ----------> DAILY CHALLENGE
                                    | [3D scramble guide] ---> 3D SOLVER (guide script, "Scramble guide")
                                    | [Solve on the 3D cube] -> 3D SOLVER (daily cube, "Daily challenge")
                                    | [Time it on your cube] -> SPEED TIMER (fixed scramble, 3x3)
   [Speed timer] --------------> SPEED TIMER (selected size) --[History]--> (History sheet)
   [Pattern library] ----------> PATTERN LIBRARY ---card---> 3D SOLVER (pattern guide)

 3D SOLVER (guided 3x3 / big-cube crowns) --auto on each new sub-step, or [flag]--> (Sub-step goal sheet)
 SCANNER review --long-press sticker--> (Color palette sheet)
```

Modals / bottom sheets in the app: **Language sheet**, **Sub-step goal sheet**, **Color palette sheet**, **Timer history sheet**. That is all.

---

## 1. Home

`lib/features/home/home_screen.dart`, `cube_carousel.dart`, `home_controller.dart`

### 1.1 Navigation flow
- **Enters from:** app launch (it is `MaterialApp.home`); every other screen pops back to it.
- **Leads to:** Language sheet, Lesson View / Academy Hub, 3D Solver, Scanner, Academy Hub, Daily Challenge, Speed Timer, Pattern Library (see map). The carousel's selected size (`selectedCubeSizeProvider`, default 3) is passed to Playground, Scan, Timer and Patterns; Academy and Daily ignore it.

### 1.2 Wireframe (single scrolling column)

```text
+------------------------------------------+
| CubeMentor                      [文A EN] |  <- Header: title + Language button
| Scan, solve and master every cube        |
| from 2×2 to 6×6.                         |
|                                          |
| Choose your cube                         |  <- SectionHeader
| 3×3  Classic                             |  <- hero title (switches per item)
|  (<)        [ spinning 3D cube ]     (>) |  <- CENTER STAGE: carousel, 280 dp,
|           ~~~ glowing stage ring ~~~     |     rotating stage ring underneath
|           o  ===  o  o  o  o             |  <- 6 dots (2,3,4,5,6,?)
|                                          |
| +--------------------------------------+ |
| | (trophy) Start learning         (>)  | |  <- Continue learning card (gold glow)
| |          Meet the cube               | |
| | [=========-------------------------] | |
| | Lesson 1 of 29                       | |
| +--------------------------------------+ |
|                                          |
| What do you want to do?                  |  <- SectionHeader
| +-----------------+ +------------------+ |
| | (cube)          | | (camera)         | |  <- two primary tiles
| | 3D Playground   | | Scan & Solve     | |
| | Turn layers...  | | Scan your cube...| |
| +-----------------+ +------------------+ |
| | (cap) Academy                     >  | |  <- mode rows
| | (fire) Daily challenge [2-day str] > | |
| | (timer) Speed timer               >  | |
| | (grid) Pattern library            >  | |
|                                          |
|  (no bottom nav, no ad banner)           |
+------------------------------------------+
```

### 1.3 Inventory

| # | Element | Exact label / content | Tap / gesture result |
|---|---|---|---|
| 1 | Title text | `CubeMentor` | — |
| 2 | Language button (glass chip, translate icon) | current badge, e.g. `EN`; tooltip `Language` | Opens **Language sheet** |
| 3 | Tagline | `Scan, solve and master every cube from 2×2 to 6×6.` | — |
| 4 | Section header | `Choose your cube` | — |
| 5 | Hero title | `{N}×{N}` + level: `Beginner` (2), `Classic` (3), `Advanced` (4), `Expert` (5), `Master` (6); mystery: `?` + `New cube coming soon` | — |
| 6 | Carousel gesture layer | 3D cube preview (idle turntable spin) | Horizontal drag: slide to prev/next cube (selects size). Vertical/diagonal drag: free 360° orbit with inertia. Endless loop 2→…→6→?→2 |
| 7 | Chevron left | tooltip `Previous cube` | Previous carousel item |
| 8 | Chevron right | tooltip `Next cube` | Next carousel item |
| 9 | Dots ×6 | a11y: `2×2 Beginner` … `6×6 Master`, `New cube coming soon` | Selects that size (mystery dot just scrolls to the "?" cube) |
| 10 | Mystery "?" cube | blurred gray cube + `?` badge | Not selectable; size stays at the last real cube |
| 11 | Continue learning card | `Start learning` (0 done) / `Continue learning`; next lesson title or `Every lesson completed!`; gold progress bar; `Lesson {i} of {total}`; play icon | Opens next **Lesson View** (through reward gate if advanced); if all done opens **Academy Hub** |
| 12 | Section header | `What do you want to do?` | — |
| 13 | Primary tile | `3D Playground` / `Turn layers, scramble and replay moves in 3D.` | **3D Solver** (Playground) at selected size |
| 14 | Primary tile | `Scan & Solve` / `Scan your cube with the camera and get a solution.` | **Scanner** at selected size |
| 15 | Mode row | `Academy` / `Learn step by step with interactive lessons.` | **Academy Hub** |
| 16 | Mode row | `Daily challenge` / `A new scramble every day. Keep your streak alive.` + streak pill `{n}-day streak` when > 0 | **Daily Challenge** |
| 17 | Mode row | `Speed timer` / `Scrambles, inspection, averages and personal bests.` | **Speed Timer** at selected size |
| 18 | Mode row | `Pattern library` / `Checkerboards, superflip and more, played in 3D.` | **Pattern Library** starting on selected size |

### 1.4 Clutter & UX critique
- **Three heroes competing:** the 280 dp carousel, the gold glowing *Continue learning* card and the two big primary tiles all claim "start here". Pick one hero (carousel) and demote the other two.
- **Academy appears twice** (Continue learning card + Academy row). Consider folding the Academy row into the card (card tap = continue, small "All lessons" link = hub).
- **Seven destinations in one scroll** (2 tiles + 4 rows + card). On a 360 dp phone the last rows sit below the fold. Candidate for a bottom nav (Play / Learn / Train) or a grouped "Training" row for Daily + Timer + Patterns.
- **Three ways to change size** (swipe, chevrons, dots) — acceptable, but the chevrons overlap the cube area on narrow screens; the dots alone may be enough.
- **Size selection is silently ignored** by Academy and Daily (always 3×3). Users may pick 5×5 and then get a 3×3 daily — consider labeling or scoping the carousel to the actions it affects.
- **Mystery "?" cube** is an extra dead-end stop in the loop; low value in the main selector.
- Tagline duplicates what the carousel already says ("2×2 to 6×6"); could go.
- No Settings entry point at all (see §11).

---

## 2. Language Picker (bottom sheet)

`lib/features/home/language_sheet.dart`

### 2.1 Navigation flow
- **Enters from:** Home header Language button only.
- **Leads to:** picking a language closes the sheet and re-renders the whole app in that locale (direction flips for Hebrew/Arabic). Swipe down / tap scrim dismisses without change.

### 2.2 Wireframe

```text
+------------------------------------------+
|              (Home dimmed)               |
| +--------------------------------------+ |
| | Language                             | |  <- title
| | [(search) Search languages        ]  | |  <- TextField
| | +----------------------------------+ | |
| | | [EN] English                 (✓) | | |  <- selected tile (accent glow)
| | | [HE] עברית                       | | |
| | |      Hebrew                      | | |
| | | [ES] Español / Spanish           | | |
| | | ... 15 rows, scrolls, max 80% h  | | |
| | +----------------------------------+ | |
| +--------------------------------------+ |
+------------------------------------------+
```

### 2.3 Inventory

| # | Element | Label | Result |
|---|---|---|---|
| 1 | Title | `Language` | — |
| 2 | Search field | hint `Search languages` | Filters by native name, English name or badge |
| 3 | Empty state | `No language matches your search.` | — |
| 4 | Language tile ×15 | badge (`EN`, `HE`, `PT-BR`…), native name, English name below if different; check icon on current | Sets locale (persisted), closes sheet |

### 2.4 Clutter & UX critique
- Clean. Only note: with 15 rows the search field is arguably unnecessary, but it is harmless and helps on small screens.
- It is the only "setting" in the app; if a Settings screen is added, this sheet should be reachable from there too.

---

## 3. 3D Solver / Guided Playback

`lib/features/solver_3d/solver_3d_screen.dart` + `widgets/solve_banner.dart`, `stage_header.dart`, `crown_tracker.dart`, `move_instruction.dart`, `move_pad.dart`, `cube_viewport.dart`

One screen, five entry contexts:

| Context | Opened from | AppBar title | Starts with |
|---|---|---|---|
| Playground | Home `3D Playground` | `{N}×{N} Playground` | current session cube for that size |
| Scan result | Scanner solve buttons (`pushReplacement`) | `{N}×{N} Playground` | scanned cube, auto-solve (Guided or Fast) |
| Daily virtual solve | Daily `Solve on the 3D cube` | `Daily challenge` | today's scrambled cube; solving it marks the daily done |
| Daily scramble guide | Daily `3D scramble guide` | `Scramble guide` | solved cube + the scramble loaded as a guide |
| Pattern | Pattern card | `{name} · {N}×{N}` | solved cube + pattern moves loaded as a guide |

### 3.1 Navigation flow
- **Leads to:** back (pop) to its opener; **Sub-step goal sheet** (auto at each new guided sub-step, or via the flag button). Nothing else is pushed.

### 3.2 Wireframe — free play (no solution loaded)

```text
+------------------------------------------+
| <-  3×3 Playground  [✓ Solved] (eye)(kbd)|  <- AppBar: title, status pill, X-ray, Notation pad
|                                          |
|                                          |
|            [   3D CUBE VIEWPORT  ]       |  <- CENTER STAGE (Expanded), CubeStage glow
|            ~~~~ stage ring ~~~~          |
|  Drag a row to turn it · Drag the        |  <- orbit hint (only with no solution)
|  background to orbit                     |
| +--------------------------------------+ |
| | (Notation pad — only when toggled)   | |  <- optional panel
| | [Prime][Wide][Layer 1][Layer 2]      | |
| | [R][L][U][D][F][B]                   | |
| | [M][E][S][x][y][z]                   | |
| | (speed) Speed  ----o---------        | |
| +--------------------------------------+ |
| +--------------------------------------+ |
| | [shuffle] [ ★ wand ] [undo ] [reset] | |  <- Action bar, 4 × 64 dp buttons
| | Scramble    Solve     Undo    Reset  | |
| +--------------------------------------+ |
|  (no ad banner)                          |
+------------------------------------------+
```

### 3.3 Wireframe — guided solve in progress

```text
+------------------------------------------+
| <-  3×3 Playground [⟲ Scrambled](eye)(kbd)|
|            [ 3D CUBE + pulsing arrow ]   |  <- CENTER STAGE (shrinks)
| +--------------------------------------+ |
| | [↑] Right side            (flag)(v)  | |  <- SOLVE DOCK header: move tile, goal, collapse
| |     Up                               | |
| | (1)(2)(3) Crown 1 • Stage 1 of 7:    | |  <- StageHeader (crown tracker + headline)
| |           White cross                | |
| | [===========---------------]         | |  <- stage progress
| | Bring the white-red edge ...         | |  <- explanation (scrolls, max 16% h)
| | Swipe the glowing layer the way...   | |  <- hint
| | [Guided (3 crowns)|Fast (optimal)] [⇥ Exit guide] |
| +--------------------------------------+ |
| +--------------------------------------+ |
| | |<  (>)  >|  ⟲  [=====-------------] | |  <- playback row + move progress bar
| | (speed) Speed ------o--------        | |  <- speed slider
| | [Scramble] [Solve] [Undo] [Reset]    | |  <- action bar
| +--------------------------------------+ |
+------------------------------------------+
```

Completion state replaces the dock with: `(party) (✓✓✓) Solved! Great job. / Every stage complete. Well done!  (x)`.

### 3.4 Inventory

**AppBar**

| Element | Label | Result |
|---|---|---|
| Back arrow | — | Pop |
| Title | see context table | — |
| Status pill | `Solved` (mint, check) / `Scrambled` (ember, shuffle) | Display only |
| X-ray toggle (eye icon) | tooltip `X-ray` | Toggles transparency of the cube |
| Notation pad toggle (keyboard icon) | tooltip `Notation pad` | Shows/hides the Notation pad panel |

**Center stage (CubeViewport)**

| Gesture | Result |
|---|---|
| Drag on background | Orbit with inertia |
| Double-tap | Reset view orientation |
| Drag a sticker along a row/column | Turns that layer under the finger, snaps to quarter turn with haptic. In a guide, a matching turn advances; a wrong turn springs back with shake + SnackBar `Follow the highlighted arrow` |
| Hint text | `Drag a row to turn it · Drag the background to orbit` (only with no solution) |

**Solve dock (`SolveBanner`, only while a solution/guide is loaded)**

| Element | Label | Result |
|---|---|---|
| Move instruction tile | arrow badge (+`2×` for doubles) + layer (`Right side`, `Top row`, `Middle slice`, `Whole cube`, `{face}, layer {d}`…) + direction (`Up`, `Clockwise`, `Double turn (180°)`…) | Display |
| Stage ring (collapsed only) | circular progress | Display |
| Flag button (crown steps only) | tooltip `Show the goal` | Opens **Sub-step goal sheet** |
| Collapse chevron | tooltip `Hide details` / `Show details` | Folds/unfolds details |
| Stage header | crown tracker + `Crown {c} • Stage {n} of {t}: {title}` or `Stage {n} of {t}: {title}`; for big cubes a sub-step line `2.1 …`; stage progress bar | Display |
| Phase title (patterns/daily/lessons) | e.g. `Pattern`, `Daily scramble` + progress bar | Display |
| Explanation | e.g. piece-specific sentence | Display |
| Hint | `Swipe the glowing layer the way the arrow points, or tap Next.` / `Turn the whole cube as the arrow shows: tap Next.` / mid-move encouragement (`Nice, halfway there!…`, `Great! Now swipe the inner…`) | Display |
| Guided / Fast toggle (2×2, 3x3 solver results only) | `Guided (3 crowns)` · `Fast (optimal)` | Re-solves with the other method and remembers the choice |
| Exit guide | `Exit guide` | Clears the solution (cube stays as is) |
| Completion card | `Solved! Great job.` / `Every stage complete. Well done!` + close (x) tooltip `Exit guide` | Clears the solution |

**Playback row (only while a solution/guide is loaded; fixed LTR)**

| Element | Tooltip | Result |
|---|---|---|
| Skip previous | `Previous move` | Step back one move |
| Play/Pause (tonal) | `Play` / `Pause` | Auto-play the remaining moves |
| Skip next | `Next move` | Step forward one move |
| Replay | `Replay step` | Re-animates the current step |
| Progress bar | — | Move index / total moves |
| Speed slider | `Speed` (0.25×–3×, label `1.00×`) | Animation speed |

**Notation pad (toggled; LTR)**

| Element | Label | Result |
|---|---|---|
| Toggle chip | `Prime` | Adds `'` to every button |
| Toggle chip (N ≥ 3) | `Wide` | Makes face buttons wide (`Rw`) |
| Depth chips (N ≥ 4) | `Layer 1` … `Layer {N/2}` | Chooses layer depth (`2R`, `3Rw`) |
| Face buttons ×6 | `R L U D F B` (live token, e.g. `3Rw'`) | Queues that move |
| Slice buttons (odd N) | `M E S` | Queues slice move |
| Rotation buttons | `x y z`, tooltip `Rotations` | Queues whole-cube rotation |
| Speed slider | `Speed` (only when playback row is hidden) | Animation speed |

**Action bar (always)**

| Element | Label | Result |
|---|---|---|
| Button | `Scramble` | Random scramble (animated) |
| Primary button | `Solve` / `Solving…` (spinner) | Solves: Guided by default; 2×2/3×3 follow remembered Guided/Fast; 4–6 always guided. SnackBars: `The cube is already solved.`, `The {N}×{N} solver arrives in a later update.`, errors |
| Button | `Undo` | Undo last hand move, or step back in playback |
| Button | `Reset` | Back to solved, clears everything |

### 3.5 Clutter & UX critique
- **Biggest clutter hotspot in the app.** During a guided solve the stack under the cube is: dock (5–7 lines) + playback row + speed slider + 4 × 64 dp action buttons. On a 360 × 640 dp phone the cube gets well under half the screen — the opposite of "the cube is the hero".
- **Duplicate controls:**
  - `Undo` and `Previous move` do the same thing in playback mode.
  - `Reset`, `Exit guide` (text button) and the completion `(x)` all "leave" the guide in slightly different ways.
  - `Scramble` and `Solve` stay visible during a guide/pattern/daily scramble guide where they make little sense (and Scramble destroys the guide).
  - Speed slider exists in two places (playback panel vs notation pad).
- **Two progress bars that disagree:** the stage bar (by design "stages, never move counts") and the playback bar (`playbackIndex / playback.length` = move count). Keep one.
- **Replay step** (⟲) icon is ambiguous next to Prev/Next; low usage expected.
- **AppBar is crowded** on small phones / long translations: back + title + status pill + 2 icons. The `Solved/Scrambled` pill repeats what the cube itself shows.
- **Guided/Fast toggle** sits inside the dock beside `Exit guide`; it is a mode choice, not a step action — consider moving it next to `Solve` (or a split button).
- **Notation pad** is an expert tool that pushes the action bar up; consider a bottom sheet instead of an inline panel.
- **No reserved ad banner slot** — when Milestone 5 adds the banner under this screen the cube will shrink further unless the dock is simplified first.
- Contexts like Pattern and Daily scramble guide reuse the full Playground chrome; a "guide-only" variant (Prev / Play / Next + Exit) would be much calmer.

---

## 3a. Sub-step Goal sheet (bottom sheet)

`lib/features/academy/widgets/lesson_intro.dart` → `showSubStepIntro`, `LessonIntroCard`, `GoalPreview`

### Navigation flow
- **Enters from:** 3D Solver automatically the first time each guided sub-step (1.1 … 3.4) is waiting for the user, or via the dock's flag button (`Show the goal`).
- **Leads to:** closes back to the solver (button, swipe down, scrim tap).

### Wireframe

```text
+------------------------------------------+
| +--------------------------------------+ |
| | White cross                          | |  <- lesson title for this sub-step
| | +----------------------------------+ | |
| | |  [ mini 3D cube, sways, 160dp ]  | | |  <- GoalPreview (drag to orbit)
| | |             (Goal)               | | |  <- phase pill Start/Goal
| | | [ ⟲ | Start | Goal ]             | | |  <- SegmentedButton
| | | What's the goal?                 | | |
| | |  Make a white plus sign...       | | |
| | | How do we do it?                 | | |
| | |  • Hold yellow on top...         | | |
| | |  • ...                           | | |
| | +----------------------------------+ | |
| | [ ▶ Got it, start step by step     ] | |
| +--------------------------------------+ |
+------------------------------------------+
```

### Inventory

| Element | Label | Result |
|---|---|---|
| Title | lesson title (e.g. `White cross`) | — |
| Goal preview | mini cube, target pieces glow | Drag = orbit |
| Phase pill | `Start` / `Goal` | Display |
| Segmented control (when the lesson morphs) | `⟲` (tooltip `Play from start to goal`) · `Start` · `Goal` | Loop the morph / freeze on start / freeze on goal |
| Headings | `What's the goal?`, `How do we do it?` | — |
| Body | `introGoal…` sentence, `introHow…` bullets | — |
| Primary button | `Got it, start step by step` | Closes sheet |

### Critique
- Good focused moment. Auto-opening at **every** sub-step (7 times on a 3×3) may feel interruptive for returning users; consider "show once per user" or a "Don't show again" toggle stored in preferences.
- The three-way segmented control is a lot of choice for a 160 dp preview; the loop alone (with tap to pause) may be enough.

---

## 4. Camera Scanner + Manual Net Editor

`lib/features/scanner/scanner_screen.dart`, `camera/camera_scan_view.dart`, `widgets/mini_cube.dart`, `widgets/cube_net.dart`, `widgets/lighting_tip.dart`

Two phases on one route: **Capture** (camera) and **Review** (net editor). Devices without a camera (e.g. Windows desktop) jump straight to manual Review.

### 4.1 Navigation flow
- **Enters from:** Home `Scan & Solve` (size = carousel selection). Locks orientation to portrait while open.
- **Leads to:** **3D Solver** via `pushReplacement` (scanner is removed from the stack, so Back from the solver returns to Home); **Color palette sheet** (long-press in Review); switches between Capture ↔ Review in place.

### 4.2 Wireframe — Capture phase

```text
+------------------------------------------+
| <-  Scan 3×3                     (pencil)|  <- AppBar + "Enter colors by hand"
| +--------------------------------------+ |
| | Face 2 of 6                 +------+ | |  <- guide card
| | Right face                  | mini | | |     MiniCube 112dp (tap scanned
| | ↺ Turn the whole cube to    | cube | | |     face = rescan)
| |   the left                  +------+ | |
| | Tap a scanned face to scan it again. | |
| +--------------------------------------+ |
| [✓Front][📷Right][○Back][○Left][○Top]... [Back to the colors] |  <- face pills (scroll) + cancel-rescan
| +--------------------------------------+ |
| | (lighting tip: glare/dim + Flashlight)| |  <- only when lighting is bad
| |                                      | |
| |     CAMERA PREVIEW + N×N GRID        | |  <- CENTER STAGE
| |     (live colors per cell)           | |
| |                         (flashlight) | |  <- torch toggle (if device has one)
| +--------------------------------------+ |
|                                 ( ◉ )    |  <- large capture FAB (left side empty)
+------------------------------------------+
```

### 4.3 Wireframe — Review / Manual net editor

```text
+------------------------------------------+
| <-  Scan 3×3                      (camera)|  <- AppBar: "Scan with the camera" (manual mode)
| +--------------------------------------+ |    or (pencil) when camera-scanned
| | (!) 2 stickers look wrong            | |  <- status card (mint ✓ / red !)
| |     Each color must appear exactly 9 | |
| +--------------------------------------+ |
|              [U]                         |
|          [L][F][R][B]                    |  <- CENTER STAGE: cube net (tap/long-press)
|              [D]                         |
| Tap a sticker to change its color ·      |
| Long-press for the palette               |
| Rescan a face                            |  <- only after a camera scan
| [📷Top][📷Right][📷Front][📷Bottom][📷Left][📷Back] |
| [ ✦ Learn step by step                 ] |  <- primary
|          ⚡ Fast solve                    |  <- text button (2×2/3×3)
+------------------------------------------+
```

### 4.4 Inventory

**AppBar**

| Element | Label | Result |
|---|---|---|
| Title | `Scan {N}×{N}` | — |
| Pencil icon (capture, or after camera scan) | tooltip `Enter colors by hand` | Switches to manual Review |
| Camera icon (manual review on camera devices) | tooltip `Scan with the camera` | Restarts capture from face 1 |

**Capture phase**

| Element | Label | Result |
|---|---|---|
| Step label | `Face {i} of 6` | — |
| Face name | `Top face`, `Right face`, `Front face`, `Bottom face`, `Left face`, `Back face` | — |
| Hold/turn instructions | first face: `Hold the cube with any face toward you…`; later: numbered turn steps `Turn the whole cube to the left/right`, `Tip the top/bottom toward you` | — |
| Helper line | `Fill the grid with the face, then tap the shutter.` / `Tap a scanned face to scan it again.` | — |
| MiniCube (112 dp) | a11y `Scan guide: scanned faces in color…` | Tap a scanned face → rescan it |
| Face pills ×6 | face names with ✓ / 📷 / ○ icon | Tap a scanned (not current) pill → rescan it |
| Cancel rescan (while rescanning) | `Back to the colors` | Returns to Review |
| Camera preview + grid overlay | live colors per cell, glare marks | — |
| Lighting tip (conditional) | `Glare detected: tilt the cube slightly…` / `Too dim: move to brighter light or turn on the flashlight.` + `Flashlight` button (dim only) | Torch on/off |
| Torch icon button (if available) | tooltip `Flashlight` | Torch on/off |
| Capture FAB (large) | tooltip `Capture face` | Captures the current face, advances |
| Camera problem view | `No camera found on this device.` / `Camera access was denied. You can still enter the colors by hand.` / `The camera could not start.` + button `Enter colors by hand` | Manual Review |

**Review phase**

| Element | Label | Result |
|---|---|---|
| Status card | `All stickers look right.` (+ `{n} stickers were hard to read…`) / `{n} stickers look wrong` / `Something doesn't add up` + issue line (`Each color must appear exactly {n} times.`, `Two centers have the same color.`, `One corner is twisted…`, `One edge is flipped…`, `Two pieces look swapped.`…) | Display |
| Cube net stickers | colored cells; invalid = red, uncertain = marked | Tap = cycle color; long-press = **Color palette sheet** |
| Hint | `Tap a sticker to change its color · Long-press for the palette` | — |
| Rescan section (after camera scan) | `Rescan a face` + 6 chips with face names | Rescan that face (back to Capture) |
| Primary button | `Learn step by step` (guided available) / `Solve` (fast only) / `Open in 3D` (no solver) | **3D Solver** (pushReplacement) with auto-solve |
| Text button (both methods available) | `Fast solve` | **3D Solver** with Fast auto-solve |

### 4.5 Color palette sheet

```text
| Pick a color                             |
| (W) (Y) (G) (B) (R) (O)                  |   six 48dp swatches
```

| Element | Label | Result |
|---|---|---|
| Title | `Pick a color` | — |
| Swatch ×6 | white, yellow, green, blue, red, orange (no text) | Sets that sticker, closes |

### 4.6 Clutter & UX critique
- **Three ways to rescan a face** (MiniCube tap, face pills, Review chips). The MiniCube + pills row is redundant in Capture — one of them can go (the MiniCube is the richer one).
- **Two torch buttons** can be visible at once in dim light (Lighting tip `Flashlight` + the corner torch icon).
- **Capture row is lopsided:** the large FAB sits at the end with an empty `footer` slot beside it. Center the shutter or put the face pills there.
- **Guide card is dense** (step, face name, 1–2 turn lines, helper line, MiniCube) and pushes the camera preview down; the camera is the real stage here.
- **AppBar icon flips meaning** (pencil vs camera) depending on mode — easy to miss.
- **Review bottom is crowded:** hint + `Rescan a face` header + 6 chips (wrap to 2 rows) + primary + text button. Consider moving rescan into an overflow / "Rescan" sheet.
- Palette swatches have no text label or a11y name — color-blind users rely on tap-cycling only.

---

## 5. Academy Hub

`lib/features/academy/academy_screen.dart`, `model/lesson_catalog.dart` (29 lessons)

### 5.1 Navigation flow
- **Enters from:** Home `Academy` row; Home Continue card when every lesson is done; pop back from Lesson View.
- **Leads to:** **Lesson View** for any tile (advanced lessons first go through `RewardGate` — currently always unlocked).

### 5.2 Wireframe

```text
+------------------------------------------+
| <-  Academy                              |
| +--------------------------------------+ |
| | (trophy) 3 of 29 lessons completed   | |  <- progress hero (gold)
| | [======-----------------------------] | |
| | (1)-(2)-(3)                          | |  <- crown tracker
| +--------------------------------------+ |
| Beginner 3×3: the 3 crowns               |  <- track header
|  (1)(2)(3) First crown                   |  <- crown section header
|            White face and first layer    |
| +--------------------------------------+ |
| | (✓) Meet the cube                 >  | |  <- lesson tile
| |     description...  [3×3]            | |
| +--------------------------------------+ |
| | (2) White cross                  (▶) | |  <- "next" tile (glow + play)
| +--------------------------------------+ |
|  ... Second crown / Third crown ...      |
| Intro to CFOP                            |
|  ... [3×3] [Advanced] ...                |
| 2×2 beginner & Ortega                    |
| Big cubes: reduction & parity            |
| 5×5 Professor's Cube                     |
| 6×6 cube                                 |
+------------------------------------------+
```

### 5.3 Inventory

| Element | Label | Result |
|---|---|---|
| AppBar title | `Academy` | Back = pop |
| Progress hero | `{done} of {total} lessons completed`, gold bar, crown tracker | Display |
| Track headers ×6 | `Beginner 3×3: the 3 crowns`, `Intro to CFOP`, `2×2 beginner & Ortega`, `Big cubes: reduction & parity`, `5×5 Professor's Cube`, `6×6 cube` | — |
| Crown section headers ×3 (beginner track) | crown tracker + `First crown` / `Second crown` / `Third crown` + goal (`White face and first layer`, `Middle layer`, `Yellow face and last layer`) | — |
| Lesson tiles ×29 | number or ✓ badge, title, description, pill `{N}×{N}`, pill `Advanced` (if advanced), chevron or play icon (next) | **Lesson View** |

### 5.4 Clutter & UX critique
- **Long single list (29 tiles + 6 headers + 3 crown headers).** Collapsible tracks or a horizontal track selector would reduce scrolling.
- **Crown tracker appears 4 times** (hero + 3 crown headers) — the per-crown headers could show a single crown badge instead.
- **`{N}×{N}` pill on every tile** repeats the track title; keep only `Advanced`.
- **No lock state** is visible for advanced lessons; when rewarded ads arrive, a lock/"watch ad" affordance is needed here, not just a gate on tap.

---

## 6. Lesson View

`lib/features/academy/lesson_screen.dart`, `widgets/lesson_intro.dart`, `widgets/hold_prompt.dart`

Three states on one route: **Intro** (goal card) → **Playing** (parts) → **Completed**.

### 6.1 Navigation flow
- **Enters from:** Academy Hub tile, Home Continue card, or the previous lesson's `Next lesson` (pushReplacement).
- **Leads to:** next Lesson View (`pushReplacement`), Academy Hub (`Back to the Academy` = pop), back arrow = pop to opener.

### 6.2 Wireframes

```text
INTRO                                       PLAYING
+-----------------------------------+      +-----------------------------------+
| <-  White cross                   |      | <-  White cross             (flag)|
| +-------------------------------+ |      | Part 1 of 3  [======----------]   |
| | [ goal mini cube, sways ]     | |      | [■top ■front] Hold the cube with  |  <- HoldPrompt
| | [ ⟲ | Start | Goal ]          | |      |  the yellow center on top and...  |
| | What's the goal?              | |      |                                   |
| |  Make a white plus sign...    | |      |       [ 3D CUBE VIEWPORT ]        |  <- CENTER STAGE
| | How do we do it?              | |      |                                   |
| |  • ...                        | |      | +-------------------------------+ |
| +-------------------------------+ |      | | [↑] Right side / Up       (v) | |  <- explanation card
| [ ▶ Got it, start step by step  ] |      | | The goal                      | |
+-----------------------------------+      | | Hold yellow on top. The four..| |
                                           | | Your turn: swipe the layer... | |
COMPLETED                                  | +-------------------------------+ |
+-----------------------------------+      | [|< Previous move][>| Next move] |  <- move stepper
|        (party)                    |      | [<- Back      ][ Next ->       ] |  <- part nav
|     Lesson complete!              |      +-----------------------------------+
|     White cross                   |
| [-> Next lesson: First-crown...]  |
|     Back to the Academy           |
+-----------------------------------+
```

### 6.3 Inventory

| State | Element | Label | Result |
|---|---|---|---|
| All | AppBar title | lesson title | Back = pop |
| Playing | Flag icon | tooltip `Show the goal` | Returns to Intro state |
| Intro | Goal preview + segmented control | `⟲` (`Play from start to goal`) · `Start` · `Goal` | Changes preview mode; drag = orbit |
| Intro | Headings / body | `What's the goal?`, `How do we do it?` | — |
| Intro | Primary button | `Got it, start step by step` | Playing state |
| Playing | Part label + bar | `Part {i} of {n}` | — |
| Playing | Hold prompt | `Hold the cube with the {top} center on top and the {front} center facing you.` + 2 color swatches | — |
| Playing | Cube viewport | same gestures as §3 (orbit, layer swipe, double-tap reset; guided swipe advances) | — |
| Playing | Explanation card | move tile (or `Drag the background to look at the cube from every side.` / `Nice! Tap Next to continue.`), collapse chevron (`Hide details`/`Show details`), step title + body, `Your turn: swipe the layer the arrow shows, or tap Next move.`, mid-move hints | Collapse/expand |
| Playing | Tonal button | `Previous move` | Step back in the demo |
| Playing | Tonal button | `Next move` | Step forward in the demo |
| Playing | Text button | `Back` | Previous part |
| Playing | Filled button | `Next` / `Finish lesson` (last part) | Next part / mark complete → Completed |
| Completed | Headline | `Lesson complete!` + lesson title | — |
| Completed | Filled button | `Next lesson: {title}` | Next lesson (pushReplacement, reward gate if advanced) |
| Completed | Text button | `Back to the Academy` | Pop |

### 6.4 Clutter & UX critique
- **Two stacked Prev/Next pairs** (`Previous move`/`Next move` and `Back`/`Next`) is the main confusion risk: copy even says "tap Next" in one string and "tap Next move" in another. Merge into one smart Next (advance move; at end of demo advance part) or visually separate them more strongly.
- **Four rows of chrome under/over the cube** (part bar, hold prompt, explanation, 2 button rows). The hold prompt could fold into the explanation card or show only when the orientation changes.
- Intro state is clean; the segmented control is optional (see §3a).
- Completed state is clean.

---

## 7. Speed Timer

`lib/features/timer/timer_screen.dart`

### 7.1 Navigation flow
- **Enters from:** Home `Speed timer` (selected size) or Daily `Time it on your cube` (fixed 3×3 scramble, size picker hidden, new-scramble hidden).
- **Leads to:** **History sheet**; back = pop. A finished daily solve marks the daily done.

### 7.2 Wireframe

```text
IDLE                                        RUNNING (chrome hidden)
+-----------------------------------+      +-----------------------------------+
| <-  Speed timer       (⌛)(history)|      |                                   |
| [2×2][3×3][4×4][5×5][6×6]         |      |                                   |
| +-------------------------------+ |      |            0:12.34                |
| | Hold white on top and green   | |      |                                   |
| | in front, then scramble:  (⟳) | |      |                                   |
| | R U2 F' L D2 B ...            | |      |       Tap anywhere to stop        |
| +-------------------------------+ |      +-----------------------------------+
|      [🏆 New personal best!]       |
|            0:00.00                |  <- CENTER STAGE: whole area = hold pad
|   Hold, then release to start     |
| +-------------------------------+ |
| | Best  ao5  ao12  ao100 Solves | |  <- stats row
| | 0:09  ...  ...   ...    14    | |
| +-------------------------------+ |
|     [+2]  [DNF]  [🗑 Delete]       |  <- last-solve actions
+-----------------------------------+
```

### 7.3 Inventory

| Element | Label | Result |
|---|---|---|
| AppBar title | `Speed timer` (hidden while running) | Back = pop |
| Inspection toggle (hourglass) | tooltip `15 s inspection` | Toggles 15-second WCA inspection |
| History icon | tooltip `History` | Opens **History sheet** |
| Size chips ×5 (not for daily) | `2×2` … `6×6` | Switches timer/session size |
| Scramble card | `Hold white on top and green in front, then scramble:` + scramble (`Generating a scramble…` while loading) | — |
| New scramble icon (not for daily) | tooltip `New scramble` | New scramble |
| Timer pad (entire middle area) | big time; hints `Hold, then release to start`, `Release to start`, `Tap to start the 15-second inspection`, `Inspection: hold, then release to start`; countdown shows `+2`/`DNF` | Press/hold/release state machine; tap while running stops |
| New PB pill | `New personal best!` | — |
| Stats row | `Best`, `ao5`, `ao12`, `ao100`, `Solves` | Display |
| Penalty chips (after a solve) | `+2`, `DNF` | Toggle penalty on last solve |
| Delete chip | `Delete` | Deletes last solve |
| Running hint | `Tap anywhere to stop` | — |

### 7.4 History sheet

| Element | Label | Result |
|---|---|---|
| Title | `History · {N}×{N}` | — |
| Clear button (if any) | `Clear history` | Deletes all solves of that size **immediately, no confirmation** |
| Empty state | `No solves yet. Scramble your cube and go!` | — |
| Rows | `{i}.` time, scramble (1 line), date, (x) tooltip `Delete` | Deletes that solve |

### 7.5 Clutter & UX critique
- Good focus: chrome hides while running.
- **Inspection toggle is an unlabeled hourglass** — low discoverability; a small labeled switch near the scramble would be clearer.
- **Size chips duplicate the Home carousel**; fine here, but the screen opens on the carousel size, so the chips row could be a compact dropdown.
- **`Clear history` has no confirm/undo** — destructive.
- Stats row with 5 columns is tight at 360 dp in long languages (relies on `FittedBox` shrinking).
- `ao100` is rarely useful for casual users; could live in History.

---

## 8. Daily Challenge

`lib/features/daily/daily_screen.dart`, `daily_controller.dart` (`kDailySize = 3`)

### 8.1 Navigation flow
- **Enters from:** Home `Daily challenge` row.
- **Leads to:** 3D Solver (scramble guide), 3D Solver (virtual solve, completes the daily on solve), Speed Timer (fixed scramble, completes the daily on a recorded solve). Hint goes through `RewardGate` (currently open).

### 8.2 Wireframe

```text
+------------------------------------------+
| <-  Daily challenge                      |
| +--------------------------------------+ |
| | (🔥)  Challenge for Nov 20, 2026     | |  <- streak hero (ember glow when lit)
| |       3-day streak                   | |
| |       Best streak: 7                 | |
| +--------------------------------------+ |
| +--------------------------------------+ |
| | (○) Solve today's scramble to keep   | |  <- status
| |     your streak.                     | |
| | Scramble step by step                | |
| | Hold white on top and green in front,| |
| | then scramble:                       | |
| |  1 [↑] Right side — Up               | |  <- ~20 numbered move rows
| |  2 [⟳] Top row — Clockwise           | |
| |  ...                                 | |
| +--------------------------------------+ |
| [ ⇄ 3D scramble guide               ]   |  <- tonal (accent)
| [ ▣ Solve on the 3D cube            ]   |  <- filled (primary)
| [ ⏱ Time it on your cube            ]   |  <- tonal (glass)
| [ 💡 Hint                            ]   |  <- outlined
| +--------------------------------------+ |
| | 💡 Start with the white cross: ...   | |  <- hint card (after Hint)
| +--------------------------------------+ |
+------------------------------------------+
```

### 8.3 Inventory

| Element | Label | Result |
|---|---|---|
| AppBar title | `Daily challenge` | Back = pop |
| Streak hero | `Challenge for {date}`, `{n}-day streak`, `Best streak: {n}` | Display |
| Status line | `Solve today's scramble to keep your streak.` / `Done for today! Come back tomorrow.` | Display |
| Scramble section | `Scramble step by step`, `Hold white on top and green in front, then scramble:`, numbered move tiles (arrow + plain words), `Generating a scramble…` while loading | Display |
| Button (tonal accent) | `3D scramble guide` | **3D Solver** "Scramble guide" |
| Button (filled) | `Solve on the 3D cube` | **3D Solver** "Daily challenge" |
| Button (tonal glass) | `Time it on your cube` | **Speed Timer** with fixed scramble |
| Button (outlined) | `Hint` (disabled after use) | Requests hint → card `Start with the white cross: {moves}` or `No hint is available right now.` |

### 8.4 Clutter & UX critique
- **Four stacked CTAs in four different button styles** — no clear primary. Decide the main path (likely "Solve on the 3D cube" or "Time it on your cube") and group the rest.
- **The full move list pushes every button below the fold** on phones (≈20 rows × 40 dp). The list and `3D scramble guide` serve the same need; collapse the list behind a "Show moves" toggle or drop it.
- Scramble hint string is reused from the Timer (fine), but the status line + section title + hint is three text lines before any content.
- Daily is always 3×3 though Home lets you pick 2–6; consider stating `3×3` on the Home row.

---

## 9. Pattern Library

`lib/features/patterns/patterns_screen.dart`, `patterns.dart`

### 9.1 Navigation flow
- **Enters from:** Home `Pattern library` (starts on the carousel size).
- **Leads to:** **3D Solver** in pattern-guide mode (`{name} · {N}×{N}`).

### 9.2 Wireframe

```text
+------------------------------------------+
| <-  Pattern library                      |
| Tap a pattern to watch it, then follow   |
| along on your own cube.                  |
| [2×2][3×3][4×4][5×5][6×6]                |  <- size chips
| +-----------------+ +-----------------+  |
| | [cube preview]  | | [cube preview]  |  |  <- grid, max 220dp per card
| |  Checkerboard   | |  Cube in a cube |  |
| |   6 moves       | |   12 moves      |  |
| +-----------------+ +-----------------+  |
| | Superflip       | | Dots            |  |
| | Cross           | | Python          |  |
+------------------------------------------+
```

### 9.3 Inventory

| Element | Label | Result |
|---|---|---|
| AppBar title | `Pattern library` | Back = pop |
| Hint | `Tap a pattern to watch it, then follow along on your own cube.` | — |
| Size chips ×5 | `2×2` … `6×6` | Filters patterns supported by that size |
| Pattern cards | static 3D preview, name (`Checkerboard`, `Cube in a cube`, `Superflip`, `Dots`, `Cross`, `Python`), `{n} moves` | **3D Solver** pattern guide |

### 9.4 Clutter & UX critique
- Clean and spacious. Only issue is downstream: the pattern opens the full Playground chrome (Scramble/Solve/Undo/Reset + notation pad), which is noise for "watch and follow" (see §3.5).
- Card previews are static; a slow idle spin would add life without clutter.

---

## 10. Snackbars & transient messages

| Where | Message |
|---|---|
| 3D Solver | `The cube is already solved.` · `The {N}×{N} solver arrives in a later update.` · `The solving engine isn't available on this device.` · `This cube can't be solved ({reason}).` · `Follow the highlighted arrow` (floating, 2 s) |

---

## 11. Settings / Stats

**Not present.** Implications:
- Language is only reachable from Home.
- The Guided/Fast preference can only be changed while a 2×2/3×3 solution is on screen.
- No way to reset Academy progress, daily streak, or unlocked rewards; no sound/haptics or animation-speed default; no privacy/ads consent entry (needed for AdMob in Milestone 5); no "About / licenses".
- Stats exist only per size inside the Timer.

A small Settings sheet (gear on Home header next to Language) would hold these without adding a tab.

---

## 12. Dead UI strings (defined in ARB, not used by any widget)

`comingSoon`, `comingSoonMessage`, `playbackTitle`, `playbackEmpty`, `playbackProgress`, `crownProgress`, `lessonDone` — leftovers from earlier layouts; candidates for removal from all 15 ARB files once the review is done.

---

## 13. Summary table

### Screens and modals

| # | Screen / modal | Type | File | Entered from | Leads to | Interactive elements* | Clutter level | Top simplification idea |
|---|---|---|---|---|---|---|---|---|
| 1 | Home | Route (root) | `home/home_screen.dart` | App launch | 7 screens + Language sheet | ~16 | Medium-high | One hero (carousel); merge Academy row into Continue card; group training modes |
| 2 | Language Picker | Bottom sheet | `home/language_sheet.dart` | Home header | Home (re-rendered) | 16 | Low | — (keep) |
| 3 | 3D Solver / Guided Playback | Route (5 contexts) | `solver_3d/solver_3d_screen.dart` | Home, Scanner, Daily ×2, Patterns | Sub-step sheet | 25–40 | **High** | Guide-only control set; remove Undo/Prev and dual progress duplication; Notation pad to a sheet |
| 3a | Sub-step Goal sheet | Bottom sheet | `academy/widgets/lesson_intro.dart` | 3D Solver (auto / flag) | 3D Solver | 5 | Low | "Show once" option; simplify segmented control |
| 4 | Scanner — Capture | Route (phase) | `scanner/scanner_screen.dart` | Home | Review, 3D Solver | ~12 | Medium-high | One rescan affordance; one torch button; centered shutter |
| 4b | Scanner — Review / Net editor | Route (phase) | `scanner/scanner_screen.dart` | Capture / no camera | 3D Solver, Palette sheet | 54–216 stickers + ~10 | Medium | Move "Rescan a face" chips into a sheet |
| 4c | Color palette | Bottom sheet | `scanner/scanner_screen.dart` | Review long-press | Review | 6 | Low | Add a11y names |
| 5 | Academy Hub | Route | `academy/academy_screen.dart` | Home | Lesson View | 29 tiles | Medium | Collapsible tracks; one crown tracker; drop size pill |
| 6 | Lesson View | Route (3 states) | `academy/lesson_screen.dart` | Academy, Home card, prev lesson | Next lesson, Academy | ~10 | Medium-high | Merge the two Prev/Next rows |
| 7 | Speed Timer | Route | `timer/timer_screen.dart` | Home, Daily | History sheet | ~14 | Low-medium | Labeled inspection switch; confirm on Clear |
| 7b | Timer History | Bottom sheet | `timer/timer_screen.dart` | Timer | Timer | 1 + rows | Low | Confirm/undo for Clear history |
| 8 | Daily Challenge | Route | `daily/daily_screen.dart` | Home | 3D Solver ×2, Timer | 4 CTAs | Medium-high | One primary CTA; collapse the move list |
| 9 | Pattern Library | Route | `patterns/patterns_screen.dart` | Home | 3D Solver | 5 chips + cards | Low | Lighter solver chrome for patterns |
| 10 | Settings / Stats | — | — | — | — | — | n/a | Add a small Settings sheet (language, solve method, reset progress, ad consent) |

\* Approximate count of distinct tappable/gesture targets on screen at once.

### Navigation tabs

| Tab bar / bottom nav | Status |
|---|---|
| Bottom navigation | **None** — Home is a hub; all screens are pushed routes. |
| Top tabs | **None.** |
| Segmented / chip "tabs" inside screens | Timer size chips, Pattern size chips, Guided/Fast toggle (solve dock), Start/Goal segmented control (goal preview). |
| Ad banner slot | **Not reserved on any screen** (Milestone 5 must budget ~50–60 dp, most critically under the 3D Solver). |

### Suggested review order (most impact first)

1. **3D Solver / Guided Playback** — densest screen, hosts five contexts and the future banner.
2. **Home** — first impression, three competing heroes.
3. **Lesson View** — the double Prev/Next confusion.
4. **Daily Challenge** — four competing CTAs.
5. **Scanner** (Capture → Review).
6. **Academy Hub**, **Speed Timer**, **Pattern Library**, sheets.
7. Decide on a **Settings** sheet and **banner placement** before Milestone 5.
