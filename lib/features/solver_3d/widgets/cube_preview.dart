import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../render/cube_painter.dart';

/// Lightweight non-interactive cube render, optionally spinning slowly.
class CubePreview extends StatefulWidget {
  const CubePreview({super.key, required this.size, this.spin = false});

  final int size;
  final bool spin;

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
  late CubeState _cube = CubeState.solved(widget.size);

  @override
  void initState() {
    super.initState();
    if (widget.spin) _spin.repeat();
  }

  @override
  void didUpdateWidget(CubePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.size != widget.size) _cube = CubeState.solved(widget.size);
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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _spin,
        builder: (context, _) => CustomPaint(
          size: Size.infinite,
          painter: CubePainter(
            frame: CubeFrame(
              cube: _cube,
              orbit: CubeOrientation.fromYawPitch(
                yaw: _initialYaw + _spin.value * 6.283185307179586,
                pitch: _initialPitch,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
