import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_move.dart';
import '../model/cube_session.dart';
import '../render/cube_painter.dart';

/// Interactive 3D viewport bound to a [cubeSessionProvider] session.
///
/// * Animates queued moves one at a time with an eased layer rotation.
/// * Drag to orbit (with inertia), double-tap to return to the default view.
class CubeViewport extends ConsumerStatefulWidget {
  const CubeViewport({super.key, required this.size, this.highlighted = const {}});

  final int size;

  /// Cubie ids to emphasize.
  final Set<int> highlighted;

  @override
  ConsumerState<CubeViewport> createState() => _CubeViewportState();
}

class _CubeViewportState extends ConsumerState<CubeViewport>
    with TickerProviderStateMixin {
  static const double _dragSensitivity = 0.012;
  static const double _inertiaDecayPerSecond = 0.02;

  late final AnimationController _turn = AnimationController(vsync: this)
    ..addStatusListener(_onTurnStatus);
  late final CurvedAnimation _eased = CurvedAnimation(
    parent: _turn,
    curve: Curves.easeInOutCubic,
  );
  late final Ticker _orbitTicker = createTicker(_onOrbitTick);
  final ValueNotifier<OrbitAngles> _orbit = ValueNotifier(OrbitAngles.initial);

  CubeMove? _activeMove;
  int _epoch = 0;

  // Orbit inertia (radians per second) and the optional reset target.
  Offset _velocity = Offset.zero;
  OrbitAngles? _orbitTarget;
  Duration _lastOrbitTick = Duration.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeStartNext());
  }

  @override
  void dispose() {
    _eased.dispose();
    _turn.dispose();
    _orbitTicker.dispose();
    _orbit.dispose();
    super.dispose();
  }

  CubeSessionController get _controller =>
      ref.read(cubeSessionProvider(widget.size).notifier);

  void _maybeStartNext() {
    if (!mounted || _turn.isAnimating) return;
    final session = ref.read(cubeSessionProvider(widget.size));
    if (session.queue.isEmpty) {
      if (_activeMove != null) setState(() => _activeMove = null);
      return;
    }
    final head = session.queue.first;
    setState(() => _activeMove = head.move);
    _turn
      ..duration = session.durationFor(head)
      ..forward(from: 0);
  }

  void _onTurnStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;
    // Clear the animation and commit the move synchronously, so the next
    // paint shows the committed state with no visible jump. Committing may
    // synchronously start the next queued move via the session listener.
    _activeMove = null;
    _turn.value = 0;
    _controller.commitHead();
    _maybeStartNext();
  }

  void _onSessionChanged(CubeSession? previous, CubeSession next) {
    if (next.epoch != _epoch) {
      _epoch = next.epoch;
      _turn.stop();
      _turn.value = 0;
      setState(() => _activeMove = null);
    }
    _maybeStartNext();
  }

  // ---- Orbit gestures ----

  void _onPanStart(DragStartDetails details) {
    _orbitTarget = null;
    _velocity = Offset.zero;
    if (_orbitTicker.isActive) _orbitTicker.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final d = details.delta * _dragSensitivity;
    _orbit.value = _orbit.value.rotatedBy(d.dx, d.dy);
  }

  void _onPanEnd(DragEndDetails details) {
    _velocity = details.velocity.pixelsPerSecond * _dragSensitivity;
    if (_velocity.distance > 0.05) _startOrbitTicker();
  }

  void _resetView() {
    _velocity = Offset.zero;
    _orbitTarget = OrbitAngles.initial;
    _startOrbitTicker();
  }

  void _startOrbitTicker() {
    _lastOrbitTick = Duration.zero;
    if (!_orbitTicker.isActive) _orbitTicker.start();
  }

  void _onOrbitTick(Duration elapsed) {
    final dt =
        ((elapsed - _lastOrbitTick).inMicroseconds / 1e6).clamp(0.0, 0.05);
    _lastOrbitTick = elapsed;
    final current = _orbit.value;

    final target = _orbitTarget;
    if (target != null) {
      // Critically damped approach toward the default view.
      final t = 1 - _pow(0.0001, dt);
      final next = OrbitAngles(
        yaw: current.yaw + (_nearestYaw(current.yaw, target.yaw) - current.yaw) * t,
        pitch: current.pitch + (target.pitch - current.pitch) * t,
      );
      _orbit.value = next;
      if ((next.yaw - _nearestYaw(next.yaw, target.yaw)).abs() < 1e-3 &&
          (next.pitch - target.pitch).abs() < 1e-3) {
        _orbit.value = target;
        _orbitTarget = null;
        _orbitTicker.stop();
      }
      return;
    }

    _orbit.value = current.rotatedBy(_velocity.dx * dt, _velocity.dy * dt);
    _velocity *= _pow(_inertiaDecayPerSecond, dt);
    if (_velocity.distance < 0.02) _orbitTicker.stop();
  }

  /// Target yaw equivalent to [target] that is closest to [current], so the
  /// reset animation never spins around more than half a turn.
  static double _nearestYaw(double current, double target) {
    const fullTurn = 6.283185307179586;
    final turns = ((current - target) / fullTurn).roundToDouble();
    return target + turns * fullTurn;
  }

  static double _pow(double base, double exponent) =>
      math.pow(base, exponent).toDouble();

  @override
  Widget build(BuildContext context) {
    ref.listen(cubeSessionProvider(widget.size), _onSessionChanged);
    final session = ref.watch(cubeSessionProvider(widget.size));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      onDoubleTap: _resetView,
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: Listenable.merge([_eased, _orbit]),
          builder: (context, _) => CustomPaint(
            size: Size.infinite,
            painter: CubePainter(
              frame: CubeFrame(
                cube: session.cube,
                orbit: _orbit.value,
                activeMove: _activeMove,
                progress: _activeMove == null ? 0 : _eased.value,
                highlighted: widget.highlighted,
                xray: session.xray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
