import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/feedback/feedback_service.dart';
import '../../../core/theme/sticker_palette.dart';
import '../interaction/layer_drag.dart';
import '../model/cube_session.dart';
import '../render/cube_painter.dart';

/// Whether a cube of [size] is a big cube (4x4 to 6x6): its instruction
/// cards are compact so the 3D cube gets more of the screen.
bool isBigCube(int size) => size >= 4;

/// Interactive 3D viewport bound to a [cubeSessionProvider] session.
///
/// * Drag on the background to orbit (with inertia); double-tap to reset.
/// * Drag a sticker along a row or column to turn that layer under the
///   finger; on release it snaps to the nearest quarter turn with a haptic
///   tick.
/// * Moves queued in the session (buttons, scramble, playback) are animated
///   one at a time.
/// * During a guided solve the next move is shown with a pulsing 3D arrow.
///   A hand turn matching it advances the solution (with a firmer haptic);
///   any other turn springs back with a shake and is not applied.
class CubeViewport extends ConsumerStatefulWidget {
  const CubeViewport({
    super.key,
    required this.size,
    this.highlighted = const {},
    this.focus = const {},
  });

  final int size;

  /// Cubie ids to emphasize.
  final Set<int> highlighted;

  /// Cubie ids of the layer to turn next (kept bright, no outline).
  final Set<int> focus;

  @override
  ConsumerState<CubeViewport> createState() => _CubeViewportState();
}

enum _DragMode { none, orbit, pendingLayer, layer }

class _CubeViewportState extends ConsumerState<CubeViewport>
    with TickerProviderStateMixin {
  static const double _orbitSensitivity = 0.012;
  static const double _inertiaDecayPerSecond = 0.02;

  // Queued move animation.
  late final AnimationController _turn = AnimationController(vsync: this)
    ..addStatusListener(_onTurnStatus);
  late final CurvedAnimation _eased = CurvedAnimation(
    parent: _turn,
    curve: Curves.easeInOutCubic,
  );
  CubeMove? _activeMove;
  int _epoch = 0;

  // Finger-driven layer turn and its snap animation.
  late final AnimationController _snap = AnimationController(vsync: this)
    ..addListener(_onSnapTick)
    ..addStatusListener(_onSnapStatus);
  final ValueNotifier<LayerTurn?> _dragTurn = ValueNotifier(null);
  _DragMode _mode = _DragMode.none;
  LayerGrab? _grab;
  LayerDrag? _layerDrag;
  Offset _dragTotal = Offset.zero;
  double _snapFrom = 0;
  double _snapTo = 0;
  int _snapQuarterTurns = 0;

  /// The released hand turn broke the guided solution and springs back.
  bool _rejectOnSnap = false;

  // Guide arrow pulse and the "wrong move" shake.
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );
  late final AnimationController _shake = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  );

  // Orbit with inertia (radians per second) and the optional reset target.
  late final Ticker _orbitTicker = createTicker(_onOrbitTick);
  final ValueNotifier<CubeOrientation> _orbit = ValueNotifier(
    CubeOrientation.initial,
  );
  Offset _velocity = Offset.zero;
  CubeOrientation? _orbitTarget;
  Duration _lastOrbitTick = Duration.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeStartNext();
      if (mounted) _syncPulse(_session);
    });
  }

  @override
  void dispose() {
    _eased.dispose();
    _turn.dispose();
    _snap.dispose();
    _pulse.dispose();
    _shake.dispose();
    _dragTurn.dispose();
    _orbitTicker.dispose();
    _orbit.dispose();
    super.dispose();
  }

  CubeSessionController get _controller =>
      ref.read(cubeSessionProvider(widget.size).notifier);

  CubeSession get _session => ref.read(cubeSessionProvider(widget.size));

  bool get _handTurning => _dragTurn.value != null;

  // ---- Queued move animation ----

  void _maybeStartNext() {
    // A layer held (or snapping) under the finger blocks queued moves until
    // it is committed, so the two never fight over the cube.
    if (!mounted || _turn.isAnimating || _handTurning) return;
    final session = _session;
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
    // Animated turns (playback, notation pad) click softly without
    // vibrating on every move.
    ref.read(feedbackProvider).turn(haptic: false);
    _maybeStartNext();
  }

  void _onSessionChanged(CubeSession? previous, CubeSession next) {
    if (next.epoch != _epoch) {
      _epoch = next.epoch;
      _turn.stop();
      _turn.value = 0;
      _cancelHandTurn();
      setState(() => _activeMove = null);
    }
    if (previous != null && next.rejectedMoves != previous.rejectedMoves) {
      _shake.forward(from: 0);
      ref.read(feedbackProvider).wrong();
    }
    _syncPulse(next);
    _maybeStartNext();
  }

  /// Runs the arrow pulse only while an arrow is shown.
  void _syncPulse(CubeSession session) {
    if (session.guideMove != null) {
      if (!_pulse.isAnimating) _pulse.repeat();
    } else if (_pulse.isAnimating) {
      _pulse.stop();
    }
  }

  // ---- Gestures ----

  CubeFrame _frame({LayerTurn? turn}) {
    final session = _session;
    return CubeFrame(
      cube: session.cube,
      orbit: _orbit.value,
      turn: turn,
      highlighted: widget.highlighted,
      focus: widget.focus,
      xray: session.xray,
    );
  }

  void _onPanStart(DragStartDetails details) {
    _orbitTarget = null;
    _velocity = Offset.zero;
    if (_orbitTicker.isActive) _orbitTicker.stop();
    _dragTotal = Offset.zero;
    _grab = null;
    _layerDrag = null;

    // Layers can only be grabbed while nothing else is turning.
    final viewport = context.size;
    final canGrab =
        viewport != null &&
        _session.isIdle &&
        !_turn.isAnimating &&
        !_snap.isAnimating &&
        !_handTurning;
    if (canGrab) {
      final frame = _frame();
      final hit = CubeScene.hitTest(frame, viewport, details.localPosition);
      if (hit != null) {
        _grab = LayerGrab.fromFace(hit, frame, viewport);
        _mode = _DragMode.pendingLayer;
        return;
      }
    }
    _mode = _DragMode.orbit;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _dragTotal += details.delta;
    switch (_mode) {
      case _DragMode.orbit:
        final d = details.delta * _orbitSensitivity;
        _orbit.value = _orbit.value.rotatedOnScreen(d.dx, d.dy);
      case _DragMode.pendingLayer:
        final drag = _grab!.resolve(_dragTotal);
        if (drag == null) return;
        _layerDrag = drag;
        _mode = _DragMode.layer;
        _dragTurn.value = drag.turnAt(drag.angleFor(_dragTotal));
        _controller.beginHandTurn();
      case _DragMode.layer:
        final drag = _layerDrag!;
        _dragTurn.value = drag.turnAt(drag.angleFor(_dragTotal));
      case _DragMode.none:
        break;
    }
  }

  void _onPanEnd(DragEndDetails details) {
    final mode = _mode;
    _mode = _DragMode.none;
    switch (mode) {
      case _DragMode.orbit:
        _velocity = details.velocity.pixelsPerSecond * _orbitSensitivity;
        if (_velocity.distance > 0.05) _startOrbitTicker();
      case _DragMode.layer:
        final drag = _layerDrag!;
        final angle = _dragTurn.value!.angle;
        var quarterTurns = drag.snapQuarterTurns(
          angle,
          details.velocity.pixelsPerSecond,
        );
        final move = drag.moveFor(quarterTurns);
        // A turn that breaks the guided solution springs back.
        _rejectOnSnap =
            move != null && _controller.judge(move) == GuidedMove.wrong;
        if (_rejectOnSnap) quarterTurns = 0;
        _snapQuarterTurns = quarterTurns;
        _startSnap(angle, quarterTurns * math.pi / 2);
      case _DragMode.pendingLayer:
      case _DragMode.none:
        break;
    }
  }

  void _onPanCancel() {
    if (_mode == _DragMode.layer && _dragTurn.value != null) {
      _snapQuarterTurns = 0;
      _rejectOnSnap = false;
      _startSnap(_dragTurn.value!.angle, 0);
    }
    _mode = _DragMode.none;
  }

  void _startSnap(double from, double to) {
    _snapFrom = from;
    _snapTo = to;
    final remaining = (to - from).abs() / (math.pi / 2);
    final speed = _session.speed;
    _snap
      ..duration = Duration(
        milliseconds: ((70 + 200 * remaining.clamp(0.0, 1.0)) / speed).round(),
      )
      ..forward(from: 0);
  }

  void _onSnapTick() {
    final drag = _layerDrag;
    if (drag == null) return;
    final t = Curves.easeOutCubic.transform(_snap.value);
    _dragTurn.value = drag.turnAt(_snapFrom + (_snapTo - _snapFrom) * t);
  }

  void _onSnapStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;
    final move = _layerDrag?.moveFor(_snapQuarterTurns);
    // Commit and clear the hand turn in the same frame: no visible jump.
    _layerDrag = null;
    _grab = null;
    _dragTurn.value = null;
    _snap.value = 0;
    final rejected = _rejectOnSnap;
    _rejectOnSnap = false;
    _controller.endHandTurn();
    if (rejected) {
      _controller.rejectMove();
    } else if (move != null) {
      final verdict = _controller.judge(move);
      _controller.commitDirect(move);
      final feedback = ref.read(feedbackProvider);
      if (verdict == GuidedMove.free) {
        feedback.turn();
      } else {
        // The user made the expected move: a step-complete tick.
        feedback.step();
      }
    }
    _maybeStartNext();
  }

  void _cancelHandTurn() {
    _snap.stop();
    _snap.value = 0;
    _rejectOnSnap = false;
    _mode = _DragMode.none;
    _grab = null;
    _layerDrag = null;
    _dragTurn.value = null;
  }

  void _resetView() {
    _velocity = Offset.zero;
    _orbitTarget = CubeOrientation.initial;
    _startOrbitTicker();
  }

  void _startOrbitTicker() {
    _lastOrbitTick = Duration.zero;
    if (!_orbitTicker.isActive) _orbitTicker.start();
  }

  void _onOrbitTick(Duration elapsed) {
    final dt = ((elapsed - _lastOrbitTick).inMicroseconds / 1e6).clamp(
      0.0,
      0.05,
    );
    _lastOrbitTick = elapsed;
    final current = _orbit.value;

    final target = _orbitTarget;
    if (target != null) {
      // Exponential approach toward the default view along the shortest
      // arc, however many times the cube was tumbled.
      final t = 1 - math.pow(0.0001, dt).toDouble();
      final next = current.lerpTo(target, t);
      if (next.angleTo(target) < 1e-3) {
        _orbit.value = target;
        _orbitTarget = null;
        _orbitTicker.stop();
      } else {
        _orbit.value = next;
      }
      return;
    }

    _orbit.value = current.rotatedOnScreen(
      _velocity.dx * dt,
      _velocity.dy * dt,
    );
    _velocity *= math.pow(_inertiaDecayPerSecond, dt).toDouble();
    if (_velocity.distance < 0.02) _orbitTicker.stop();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(cubeSessionProvider(widget.size), _onSessionChanged);
    final session = ref.watch(cubeSessionProvider(widget.size));
    final guide = session.guideMove;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // Report the touch-down point so the grabbed sticker is the one under
      // the finger, not where the drag slop was exceeded.
      dragStartBehavior: DragStartBehavior.down,
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      onPanCancel: _onPanCancel,
      onDoubleTap: _resetView,
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _eased,
            _orbit,
            _dragTurn,
            _pulse,
            _shake,
          ]),
          builder: (context, _) {
            final active = _activeMove;
            final turn =
                _dragTurn.value ??
                (active == null
                    ? null
                    : LayerTurn.ofMove(active, _eased.value));
            // Damped side-to-side wobble after a rejected move.
            final t = _shake.value;
            final wobble = _shake.isAnimating
                ? math.sin(t * math.pi * 6) * (1 - t) * 10
                : 0.0;
            return Transform.translate(
              offset: Offset(wobble, 0),
              child: CustomPaint(
                size: Size.infinite,
                painter: CubePainter(
                  palette: StickerPalette.of(context),
                  frame: CubeFrame(
                    cube: session.cube,
                    orbit: _orbit.value,
                    turn: turn,
                    highlighted: widget.highlighted,
                    focus: widget.focus,
                    xray: session.xray,
                  ),
                  // Hidden while a layer is held or turning.
                  guide: turn == null ? guide : null,
                  guidePhase: _pulse.value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
