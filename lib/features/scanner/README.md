# scanner

Scan & Solve (Milestone 3).

- `model/scan_session.dart`: state machine (capture F R B L U D, rescan any
  face, classify all six together, tap-to-fix review, manual entry).
- `camera/`: camera preview with the NxN grid and live colors
  (`camera_scan_view.dart`), pure frame sampling and lighting checks
  (`frame_sampler.dart`).
- `widgets/cube_net.dart`: cross-shaped net, pulsing invalid stickers.
- `scanner_screen.dart`: the flow; a valid cube opens in the 3D viewport and
  solves right away.

Classification and validation run in C++ (`src/cpp/vision/`) through
`lib/core/vision/scan_analyzer.dart`.
