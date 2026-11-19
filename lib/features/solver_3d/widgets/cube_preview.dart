import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../render/cube_painter.dart';

/// Lightweight non-interactive cube render, optionally spinning slowly.
class CubePreview extends StatefulWidget {
  const CubePreview({
    super.key,
    required this.size,
    this.spin = false,
    this.cube,
    this.orbit,
    this.muted = const {},
  });

  final int size;
  final bool spin;

  /// State to show (e.g. a pattern); solved when null.
  final CubeState? cube;

  /// Orientation driven from outside (e.g. a finger orbit); replaces the
  /// built-in spin when set.
  final ValueListenable<CubeOrientation>? orbit;

  /// Cubie ids drawn gray (a silhouette).
  final Set<int> muted;

  @override
  State<CubePreview> createState() => _CubePreviewState();
}

class _CubePreviewState extends State<CubePreview>
    with SingleTickerProviderStateMixin {
  static const _fullSpin = Duration(seconds: 14);
  static const _initialYaw = -0.62;
  static const _initialPitch = 0.5;

  late final AnimationController _spin = AnimationController(
    vsync: this,
    duration: _fullSpin,
  );
  late CubeState _cube = widget.cube ?? CubeState.solved(widget.size);

  @override
  void initState() {
    super.initState();
    if (widget.spin) _spin.repeat();
  }

  @override
  void didUpdateWidget(CubePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.size != widget.size || oldWidget.cube != widget.cube) {
      _cube = widget.cube ?? CubeState.solved(widget.size);
    }
    if (widget.spin && !_spin.isAnimating) {
      _spin.repeat();
    } else if (!widget.spin && _spin.isAnimating) {
      _spin.stop();
    }
  }

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orbit = widget.orbit;
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: orbit ?? _spin,
        builder: (context, _) => CustomPaint(
          size: Size.infinite,
          painter: CubePainter(
            frame: CubeFrame(
              cube: _cube,
              orbit:
                  orbit?.value ??
                  CubeOrientation.fromYawPitch(
                    yaw: _initialYaw + _spin.value * 6.283185307179586,
                    pitch: _initialPitch,
                  ),
              muted: widget.muted,
            ),
          ),
        ),
      ),
    );
  }
}
