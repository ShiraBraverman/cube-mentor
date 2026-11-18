# scanner

Scan & Solve (Milestone 3, scan guide and lighting tips added later).

- `model/scan_session.dart`: state machine (capture F R B L U D, rescan any
  face, classify all six together, tap-to-fix review, manual entry). Tracks
  the face just captured (`turnFrom`) so the guide knows which way to turn.
- `model/scan_turns.dart`: how each face is held while scanned, and the
  shortest list of whole-cube quarter turns (left, right, tip top/bottom
  toward you) from one face to another.
- `camera/`: camera preview with the NxN grid, live colors, glare cells
  outlined, lighting tip and flashlight (`camera_scan_view.dart`); pure
  frame sampling and lighting checks (`frame_sampler.dart`): specular glare
  is high CIELAB L* with low C*, dim light a low mean L*, debounced by
  `LightingMonitor`.
- `widgets/mini_cube.dart`: 3D scan guide in the header. Scanned faces in
  their colors, others gray with an "x"; animates each quarter turn with an
  arrow; tap a scanned face to rescan it.
- `widgets/lighting_tip.dart`: glass pill for glare / dim light.
- `widgets/cube_net.dart`: cross-shaped net for the review (tap-to-fix,
  pulsing invalid stickers).
- `scanner_screen.dart`: the flow; header with turn steps, the guide and
  face pills; a valid cube opens in the 3D viewport and solves right away.

Classification and validation run in C++ (`src/cpp/vision/`) through
`lib/core/vision/scan_analyzer.dart`.
