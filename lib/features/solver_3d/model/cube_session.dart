import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/solver/cube_solver.dart';
import '../../../core/solver/solve_step.dart';

/// A move waiting to be animated. [fast] moves (e.g. scrambles) use a
/// shortened animation.
@immutable
class QueuedMove {
  const QueuedMove(this.move, {this.fast = false});

  final CubeMove move;
  final bool fast;
}

/// Immutable state of an interactive 3D cube session.
@immutable
class CubeSession {
  const CubeSession({
    required this.cube,
    this.queue = const [],
    this.log = const [],
    this.playback = const [],
    this.playbackIndex = 0,
    this.isPlaying = false,
    this.speed = 1.0,
    this.xray = false,
    this.epoch = 0,
    this.steps = const [],
    this.isSolving = false,
    this.solveError,
  });

  /// State with every animation already committed.
  final CubeState cube;

  /// Moves waiting to be animated, head first.
  final List<QueuedMove> queue;

  /// All moves applied (or queued) since the cube was last solved/reset.
  final List<CubeMove> log;

  /// A step-by-step solution for the playback controls.
  final List<CubeMove> playback;

  /// Pedagogical metadata of each [playback] move (same length).
  final List<SolveStep> steps;

  /// A solve request is running on the native core.
  final bool isSolving;

  /// Error key of the last failed solve request, if any.
  final String? solveError;
  final int playbackIndex;
  final bool isPlaying;

  /// Animation speed multiplier.
  final double speed;
  final bool xray;

  /// Increments on hard resets so the animator can drop in-flight moves.
  final int epoch;

  int get size => cube.size;

  bool get isIdle => queue.isEmpty;

  bool get hasPlayback => playback.isNotEmpty;

  bool get canStepForward => playbackIndex < playback.length;

  bool get canStepBack => playbackIndex > 0;

  /// The step to explain right now: the one being animated, or the next one
  /// when idle. Null without a solution or once it is complete.
  SolveStep? get currentStep {
    final index = isIdle ? playbackIndex : playbackIndex - 1;
    return index >= 0 && index < steps.length ? steps[index] : null;
  }

  /// Base duration of a quarter turn at speed 1.0.
  static const Duration baseQuarterTurn = Duration(milliseconds: 320);
  static const Duration fastQuarterTurn = Duration(milliseconds: 90);

  Duration durationFor(QueuedMove queued) {
    final base = queued.fast ? fastQuarterTurn : baseQuarterTurn;
    final factor = queued.move.isHalfTurn ? 1.5 : 1.0;
    return base * (factor / speed);
  }

  CubeSession copyWith({
    CubeState? cube,
    List<QueuedMove>? queue,
    List<CubeMove>? log,
    List<CubeMove>? playback,
    int? playbackIndex,
    bool? isPlaying,
    double? speed,
    bool? xray,
    int? epoch,
    List<SolveStep>? steps,
    bool? isSolving,
    String? solveError,
    bool clearSolveError = false,
  }) => CubeSession(
    cube: cube ?? this.cube,
    queue: queue ?? this.queue,
    log: log ?? this.log,
    playback: playback ?? this.playback,
    playbackIndex: playbackIndex ?? this.playbackIndex,
    isPlaying: isPlaying ?? this.isPlaying,
    speed: speed ?? this.speed,
    xray: xray ?? this.xray,
    epoch: epoch ?? this.epoch,
    steps: steps ?? this.steps,
    isSolving: isSolving ?? this.isSolving,
    solveError: clearSolveError ? null : (solveError ?? this.solveError),
  );
}

/// Drives a cube session: queues moves, undo, scramble and playback.
///
/// The viewport animates `queue.first` and calls [commitHead] when the
/// animation finishes, keeping logic and rendering decoupled.
class CubeSessionController extends Notifier<CubeSession> {
  CubeSessionController(this.size, {this.random});

  final int size;

  /// Optional seeded RNG for deterministic scrambles (tests).
  final Random? random;

  @override
  CubeSession build() => CubeSession(cube: CubeState.solved(size));

  /// Performs a user move. Clears any playback sequence since the cube no
  /// longer matches it.
  void turn(CubeMove move) {
    state = state.copyWith(
      queue: [...state.queue, QueuedMove(move)],
      log: [...state.log, move],
      playback: const [],
      steps: const [],
      playbackIndex: 0,
      isPlaying: false,
    );
  }

  /// Commits a move the user already animated by hand (a touch drag), so it
  /// is applied instantly instead of being queued for animation. Only valid
  /// while no queued animation is pending.
  void commitDirect(CubeMove move) {
    assert(state.isIdle, 'Direct moves require an idle session');
    final cube = state.cube.apply(move);
    state = state.copyWith(
      cube: cube,
      log: cube.isSolved ? const [] : [...state.log, move],
      playback: const [],
      steps: const [],
      playbackIndex: 0,
      isPlaying: false,
    );
  }

  /// Parses and performs a notation token (e.g. `"Rw'"`).
  void turnNotation(String token) => turn(MoveNotation.parse(token, size));

  void undo() {
    if (state.log.isEmpty) return;
    final last = state.log.last;
    state = state.copyWith(
      queue: [...state.queue, QueuedMove(last.inverse)],
      log: state.log.sublist(0, state.log.length - 1),
      playback: const [],
      steps: const [],
      playbackIndex: 0,
      isPlaying: false,
    );
  }

  /// Scrambles from the current state.
  void scramble() {
    final moves = CubeState.randomScramble(size, random: random);
    state = state.copyWith(
      queue: [...state.queue, for (final m in moves) QueuedMove(m, fast: true)],
      log: [...state.log, ...moves],
      playback: const [],
      steps: const [],
      playbackIndex: 0,
      isPlaying: false,
    );
  }

  /// Asks the solver for a solution of the current cube and loads it into
  /// the playback controls. Ignored while moves are animating; the result is
  /// dropped if the cube changed in the meantime.
  Future<void> solve(SolveMethod method) async {
    if (state.isSolving || !state.isIdle) return;
    final cube = state.cube;
    final epoch = state.epoch;
    state = state.copyWith(isSolving: true, clearSolveError: true);
    final SolvePlan plan;
    try {
      plan = await ref.read(cubeSolverProvider).solve(cube, method);
    } on SolveException catch (error) {
      if (ref.mounted) {
        state = state.copyWith(isSolving: false, solveError: error.code);
      }
      return;
    }
    if (!ref.mounted) return;
    if (!identical(state.cube, cube) || state.epoch != epoch || !state.isIdle) {
      state = state.copyWith(isSolving: false);
      return;
    }
    state = state.copyWith(
      isSolving: false,
      playback: List.unmodifiable([
        for (final step in plan.steps)
          MoveNotation.parse(step.moveNotation, size),
      ]),
      steps: plan.steps,
      playbackIndex: 0,
      isPlaying: false,
    );
  }

  void clearSolveError() => state = state.copyWith(clearSolveError: true);

  /// Instantly returns to a solved cube, dropping queued animations.
  void reset() {
    state = CubeSession(
      cube: CubeState.solved(size),
      speed: state.speed,
      xray: state.xray,
      epoch: state.epoch + 1,
    );
  }

  void stepForward() {
    if (!state.canStepForward) {
      state = state.copyWith(isPlaying: false);
      return;
    }
    final move = state.playback[state.playbackIndex];
    state = state.copyWith(
      queue: [...state.queue, QueuedMove(move)],
      log: [...state.log, move],
      playbackIndex: state.playbackIndex + 1,
    );
  }

  void stepBack() {
    if (!state.canStepBack) return;
    final index = state.playbackIndex - 1;
    final move = state.playback[index];
    state = state.copyWith(
      queue: [...state.queue, QueuedMove(move.inverse)],
      log: state.log.isEmpty
          ? const []
          : state.log.sublist(0, state.log.length - 1),
      playbackIndex: index,
      isPlaying: false,
    );
  }

  void play() {
    if (!state.canStepForward) return;
    state = state.copyWith(isPlaying: true);
    if (state.isIdle) stepForward();
  }

  void pause() => state = state.copyWith(isPlaying: false);

  void setSpeed(double speed) => state = state.copyWith(speed: speed);

  void toggleXray() => state = state.copyWith(xray: !state.xray);

  /// Called by the animator once `queue.first` finished animating.
  void commitHead() {
    if (state.queue.isEmpty) return;
    final head = state.queue.first;
    final cube = state.cube.apply(head.move);
    final queue = state.queue.sublist(1);
    var log = state.log;
    // Back at solved: the history is no longer meaningful for undo.
    if (queue.isEmpty && cube.isSolved && state.playback.isEmpty) {
      log = const [];
    }
    state = state.copyWith(cube: cube, queue: queue, log: log);
    if (queue.isEmpty && state.isPlaying) {
      if (state.canStepForward) {
        stepForward();
      } else {
        state = state.copyWith(isPlaying: false);
      }
    }
  }
}

final cubeSessionProvider = NotifierProvider.autoDispose
    .family<CubeSessionController, CubeSession, int>(CubeSessionController.new);
