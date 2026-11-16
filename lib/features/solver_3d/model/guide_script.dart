import 'package:flutter/foundation.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';

/// A scripted sequence to guide through on the 3D cube (a pattern or a
/// lesson demonstration), shown with the solution playback controls.
@immutable
class GuideScript {
  const GuideScript({
    required this.start,
    required this.moves,
    required this.phase,
    required this.explanation,
  });

  final CubeState start;
  final List<CubeMove> moves;

  /// Phase and explanation keys shared by every step (see `SolveBanner`).
  final String phase;
  final String explanation;
}
