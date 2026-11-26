# academy

Interactive, localized lessons (Milestone 4).

- `model/lesson.dart`: lessons and steps. Each step pairs a plain-language
  explanation and a "hold the cube with ___ on top" prompt with a 3D
  demonstration: the cube starts at `setup + inverse(demo)`, so playing the
  demo always shows exactly what the algorithm fixes.
- `model/lesson_catalog.dart`: the catalogue (beginner 3x3, intro to CFOP,
  2x2 beginner/Ortega, big-cube reduction and parity) and its text lookups.
  Texts live in the ARB files.
- `model/academy_progress.dart`: completed lessons and the last one opened
  (shared preferences); powers the Home "Continue learning" card.
- Stage 1 of every lesson is a Goal / How to hold it / How / Why it works
  card (`introGoalText`, `introHoldText`, `introHowText`, `introWhyText`).
  Texts follow `CubeMentor_Master_Curriculum_Localization_Reference.md`:
  "layer" (never "crown", except French *couronne*), one 2x2 finish route
  (Sune, then T-perm or Y-perm), a single 5x5 edge parity, and every
  algorithm named in a text matches the lesson's 3D demonstration.
- `lesson_screen.dart`: plays a lesson on the shared 3D session with the
  guided-playback arrows; "Show me" animates the demo, swipes follow it.

The first two lessons are open (green open padlock). Every later lesson
goes through `RewardGate` (`lib/core/ads/reward_gate.dart`): a sheet offers
one rewarded video that opens that lesson alone for 24 hours. A `×2` pill
(`solver_3d/widgets/double_turn_badge.dart`) sits above the cube on every
half-turn step.
