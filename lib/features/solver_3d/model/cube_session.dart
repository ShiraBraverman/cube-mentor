import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/cube/facelets.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/solver/cube_solver.dart';
import '../../../core/solver/solve_step.dart';

/// A move waiting to be animated. [fast] moves (e.g. scrambles) use a
/// shortened animation.
@immutable
class QueuedMove {
  const QueuedMove(
    this.move, {
    this.fast = false,
    this.step,
    this.preview = false,
  });

  final CubeMove move;
  final bool fast;

  /// Index of the solution step this animation belongs to, if any; the
  /// banner explains that step while the move is on screen.
  final int? step;

  /// Part of a "show me again" preview that leaves the cube unchanged.
  final bool preview;
}

/// How a manual move relates to the step a guided solution expects.
enum GuidedMove {
  /// No guided solution is in progress: the move is applied freely.
  free,

  /// Exactly the expected move: the solution advances.
  expected,

  /// Part of the expected move: one quarter of a half turn (`R` toward
  /// `R2`) or one layer of a wide turn (`R` or `r` toward `Rw`). Accepted;
  /// the step stays open until the rest is swiped.
  partial,

  /// Anything else: rejected so the cube keeps matching the solution.
  wrong,
}

/// What is still missing from a step made partly by hand.
enum StepHint {
  /// A half turn is halfway: one more quarter turn the same way.
  halfway,

  /// A wide turn still needs its inner layer.
  wideInner,

  /// A wide turn still needs its outer layer.
  wideOuter,

  /// A wide turn still needs several layers.
  wideMore,
}

/// Quarter turns already made on each layer of [expected] by [done].
Map<int, int> _layerProgress(CubeMove expected, List<CubeMove> done) => {
  for (var layer = expected.fromLayer; layer <= expected.toLayer; layer++)
    layer:
        done
            .where((m) => m.affectsLayer(layer))
            .fold(0, (sum, m) => sum + m.quarterTurns) %
        4,
};

/// Whether turning a layer from [before] to [after] quarter turns moves it
/// toward [target] without overshooting: a quarter turn needs its exact
/// direction, a half turn can start either way but must continue that way.
bool _advances(int before, int after, int target) {
  if (before == target) return false;
  if (target == 2) return before == 0 || after == 2;
  return before == 0 && after == target;
}

/// The moves still needed to finish [expected] after [done], as few layer
/// blocks as possible, outer layers first.
List<CubeMove> _remainingMoves(
  CubeMove expected,
  List<CubeMove> done,
  int size,
) {
  if (done.isEmpty) return [expected];
  final progress = _layerProgress(expected, done);
  final moves = <CubeMove>[];
  int? from;
  var owed = 0;
  void flush(int to) {
    final start = from;
    if (start == null || owed == 0) return;
    moves.add(
      MoveNotation.describe(
        axis: expected.axis,
        fromLayer: start,
        toLayer: to,
        quarterTurns: owed,
        size: size,
      ),
    );
  }

  for (var layer = expected.fromLayer; layer <= expected.toLayer; layer++) {
    final left = (expected.quarterTurns - progress[layer]! + 4) % 4;
    if (from == null || left != owed) {
      flush(layer - 1);
      from = layer;
      owed = left;
    }
  }
  flush(expected.toLayer);
  int edge(CubeMove m) => min(m.fromLayer, size - 1 - m.toLayer);
  moves.sort((a, b) => edge(a).compareTo(edge(b)));
  return moves;
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
    this.isHandTurning = false,
    this.rejectedMoves = 0,
    this.solvedWith,
    this.partial = const [],
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

  /// A layer is held (or snapping) under the user's finger. Playback
  /// controls wait for it so they never fight over the cube.
  final bool isHandTurning;

  /// Counts manual moves rejected during a guided solve, so the UI can
  /// react (shake, hint) to each one.
  final int rejectedMoves;

  /// Solver method of the loaded solution; null for lesson demonstrations
  /// and patterns (they cannot be re-solved another way).
  final SolveMethod? solvedWith;

  /// Hand moves already made toward the current step without finishing it
  /// (the first quarter of `R2`, one layer of `Rw`). The step still counts
  /// as one; [playbackIndex] advances once the rest is swiped.
  final List<CubeMove> partial;

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

  bool get canStepBack => playbackIndex > 0 || partial.isNotEmpty;

  /// A solution is loaded and not finished: manual moves are checked
  /// against it instead of discarding it.
  bool get isGuiding => hasPlayback && canStepForward;

  /// Every step of the loaded solution has been played.
  bool get isComplete => hasPlayback && !canStepForward;

  /// A "show me again" preview is animating.
  bool get isPreviewing => queue.any((q) => q.preview);

  /// Index of the step to explain right now: the one being animated, or the
  /// next one when idle.
  int get currentStepIndex {
    if (isIdle) return playbackIndex;
    return queue.first.step ?? playbackIndex - 1;
  }

  /// The step to explain right now. Null without a solution or once it is
  /// complete.
  SolveStep? get currentStep {
    final index = currentStepIndex;
    return index >= 0 && index < steps.length ? steps[index] : null;
  }

  /// The move the user should make next, shown with an arrow on the cube.
  /// Only set while the cube is at rest and waiting for the user.
  /// After part of a step was swiped, it points at what is left.
  CubeMove? get guideMove => isGuiding && isIdle && !isPlaying && !isHandTurning
      ? remainingMoves.first
      : null;

  /// What is left of the current step: the whole move, or the layers and
  /// quarter turns not yet swiped. Empty without a step in progress.
  List<CubeMove> get remainingMoves => isGuiding
      ? _remainingMoves(playback[playbackIndex], partial, size)
      : const [];

  /// Encouragement for a step that was made partly by hand, or null.
  StepHint? get stepHint {
    if (partial.isEmpty || !isGuiding) return null;
    final expected = playback[playbackIndex];
    final progress = _layerProgress(expected, partial);
    final target = expected.quarterTurns;
    if (progress.values.any((a) => a != 0 && a != target)) {
      return StepHint.halfway;
    }
    final untouched = [
      for (final MapEntry(key: layer, value: a) in progress.entries)
        if (a == 0) layer,
    ];
    if (untouched.length != 1) return StepHint.wideMore;
    final layer = untouched.single;
    return layer == 0 || layer == size - 1
        ? StepHint.wideOuter
        : StepHint.wideInner;
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
    bool? isHandTurning,
    int? rejectedMoves,
    SolveMethod? solvedWith,
    List<CubeMove>? partial,
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
    isHandTurning: isHandTurning ?? this.isHandTurning,
    rejectedMoves: rejectedMoves ?? this.rejectedMoves,
    solvedWith: solvedWith ?? this.solvedWith,
    // A new solution or step always starts afresh.
    partial:
        partial ??
        (playback != null || playbackIndex != null ? const [] : this.partial),
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
  CubeSession build() => CubeSession(
    cube: CubeState.solved(size),
    speed: ref.read(appSettingsProvider).animationSpeed,
  );

  /// Classifies a manual [move] against the guided solution, if any.
  GuidedMove judge(CubeMove move) {
    final s = state;
    if (!s.isGuiding) return GuidedMove.free;
    final expected = s.playback[s.playbackIndex];
    if (s.partial.isEmpty && move == expected) return GuidedMove.expected;
    // Otherwise the move must turn some of the step's layers further toward
    // the goal: a quarter of a half turn, or one slice of a wide turn, in
    // either order.
    if (move.axis != expected.axis ||
        move.fromLayer < expected.fromLayer ||
        move.toLayer > expected.toLayer) {
      return GuidedMove.wrong;
    }
    final progress = _layerProgress(expected, s.partial);
    final target = expected.quarterTurns;
    var finished = true;
    for (final MapEntry(key: layer, value: before) in progress.entries) {
      var after = before;
      if (move.affectsLayer(layer)) {
        after = (before + move.quarterTurns) % 4;
        if (!_advances(before, after, target)) return GuidedMove.wrong;
      }
      if (after != target) finished = false;
    }
    return finished ? GuidedMove.expected : GuidedMove.partial;
  }

  /// Performs a user move. During a guided solve the move must follow the
  /// solution (it then advances it); otherwise any playback is cleared since
  /// the cube no longer matches it.
  void turn(CubeMove move) {
    if (state.isHandTurning) return;
    if (_guided(move, animate: true) != GuidedMove.free) return;
    state = state.copyWith(
      queue: [...state.queue, QueuedMove(move)],
      log: [..._history, move],
      playback: const [],
      steps: const [],
      playbackIndex: 0,
      isPlaying: false,
    );
  }

  /// Undo history to build on. A finished solution leaves the cube solved,
  /// so its moves are dropped once the user plays on.
  List<CubeMove> get _history =>
      state.isIdle && state.cube.isSolved ? const [] : state.log;

  /// Commits a move the user already animated by hand (a touch drag), so it
  /// is applied instantly instead of being queued for animation. Only valid
  /// while no queued animation is pending.
  void commitDirect(CubeMove move) {
    assert(state.isIdle, 'Direct moves require an idle session');
    if (_guided(move, animate: false) != GuidedMove.free) return;
    final cube = state.cube.apply(move);
    state = state.copyWith(
      cube: cube,
      log: cube.isSolved ? const [] : [..._history, move],
      playback: const [],
      steps: const [],
      playbackIndex: 0,
      isPlaying: false,
    );
  }

  /// Parses and performs a notation token (e.g. `"Rw'"`).
  void turnNotation(String token) => turn(MoveNotation.parse(token, size));

  /// Applies [move] as a step of the guided solution when one is running.
  /// Returns [GuidedMove.free] (doing nothing) when no solution is guided.
  GuidedMove _guided(CubeMove move, {required bool animate}) {
    final verdict = judge(move);
    final s = state;
    switch (verdict) {
      case GuidedMove.free:
        return verdict;
      case GuidedMove.wrong:
        state = s.copyWith(rejectedMoves: s.rejectedMoves + 1);
        return verdict;
      case GuidedMove.expected:
      case GuidedMove.partial:
        // Either way it stays one step: the index moves on only once the
        // whole move is made.
        final index = s.playbackIndex;
        final done = verdict == GuidedMove.expected;
        state = s.copyWith(
          cube: animate ? null : s.cube.apply(move),
          queue: animate ? [...s.queue, QueuedMove(move, step: index)] : null,
          log: [...s.log, move],
          playbackIndex: done ? index + 1 : index,
          partial: done ? const [] : [...s.partial, move],
          isPlaying: false,
        );
        return verdict;
    }
  }

  /// Marks the start of a finger-driven layer turn; pauses auto-play.
  void beginHandTurn() =>
      state = state.copyWith(isHandTurning: true, isPlaying: false);

  /// Marks the end of a finger-driven layer turn.
  void endHandTurn() => state = state.copyWith(isHandTurning: false);

  /// Records a manual move that was refused during a guided solve.
  void rejectMove() =>
      state = state.copyWith(rejectedMoves: state.rejectedMoves + 1);

  /// Leaves the guided solution, keeping the cube as it is.
  void clearSolution() => state = state.copyWith(
    log: _history,
    playback: const [],
    steps: const [],
    playbackIndex: 0,
    isPlaying: false,
  );

  /// Undoes the last move; during a solution, steps back one step instead.
  void undo() {
    if (state.isHandTurning) return;
    if (state.hasPlayback) {
      stepBack();
      return;
    }
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
    if (state.isHandTurning) return;
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
    if (state.isSolving || !state.isIdle || state.isHandTurning) return;
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
      solvedWith: method,
    );
  }

  /// Switches the loaded solution to [method] (guided 3 crowns or fast),
  /// solving again from the cube as it is now. Ignored while a move is
  /// animating or held, or when that method is already loaded.
  Future<void> resolveWith(SolveMethod method) async {
    if (!state.isIdle || state.isHandTurning || state.isSolving) return;
    if (state.hasPlayback && state.solvedWith == method) return;
    clearSolution();
    if (state.cube.isSolved) return;
    await solve(method);
  }

  void clearSolveError() => state = state.copyWith(clearSolveError: true);

  /// Replaces the cube (e.g. with a scanned one), dropping animations,
  /// history and any loaded solution.
  void load(CubeState cube) {
    assert(cube.size == size);
    state = CubeSession(
      cube: cube,
      speed: state.speed,
      xray: state.xray,
      epoch: state.epoch + 1,
    );
  }

  /// Replaces the cube with [start] and loads [moves] as a guided
  /// solution (a lesson demonstration or a pattern): playback, step arrows
  /// and hand-turn checking work exactly as for a solver result. Every step
  /// shares [phase] and [explanation].
  void loadGuide(
    CubeState start,
    List<CubeMove> moves, {
    required String phase,
    required String explanation,
  }) {
    assert(start.size == size);
    var cube = start;
    final steps = <SolveStep>[];
    for (final move in moves) {
      steps.add(
        SolveStep(
          cubeState: cube.toFacelets(),
          phaseName: phase,
          moveNotation: move.notation,
          explanationKey: explanation,
        ),
      );
      cube = cube.apply(move);
    }
    state = CubeSession(
      cube: start,
      speed: state.speed,
      xray: state.xray,
      epoch: state.epoch + 1,
      playback: List.unmodifiable(moves),
      steps: List.unmodifiable(steps),
    );
  }

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
    if (state.isHandTurning || state.isPreviewing) return;
    if (!state.canStepForward) {
      state = state.copyWith(isPlaying: false);
      return;
    }
    // A step made partly by hand is finished with only what is left of it.
    final moves = state.remainingMoves;
    state = state.copyWith(
      queue: [
        ...state.queue,
        for (final move in moves) QueuedMove(move, step: state.playbackIndex),
      ],
      log: [...state.log, ...moves],
      playbackIndex: state.playbackIndex + 1,
    );
  }

  void stepBack() {
    if (state.isHandTurning || state.isPreviewing || !state.canStepBack) {
      return;
    }
    final partial = state.partial;
    if (partial.isNotEmpty) {
      // Unwinds a half-made step back to its start.
      final index = state.playbackIndex;
      state = state.copyWith(
        queue: [
          ...state.queue,
          for (final move in partial.reversed)
            QueuedMove(move.inverse, step: index),
        ],
        log: state.log.sublist(0, max(0, state.log.length - partial.length)),
        partial: const [],
        isPlaying: false,
      );
      return;
    }
    final index = state.playbackIndex - 1;
    final move = state.playback[index];
    state = state.copyWith(
      queue: [
        ...state.queue,
        QueuedMove(move.inverse, step: index),
      ],
      log: state.log.isEmpty
          ? const []
          : state.log.sublist(0, state.log.length - 1),
      playbackIndex: index,
      isPlaying: false,
    );
  }

  /// Shows a step again without changing the cube: the upcoming move is
  /// played and reversed (or, once solved, the last move is undone and
  /// redone).
  void replayStep() {
    final s = state;
    if (!s.hasPlayback || !s.isIdle || s.isHandTurning) return;
    final int index;
    final List<CubeMove> moves;
    if (s.canStepForward) {
      index = s.playbackIndex;
      final left = s.remainingMoves;
      moves = [...left, for (final m in left.reversed) m.inverse];
    } else {
      index = s.playbackIndex - 1;
      moves = [s.playback[index].inverse, s.playback[index]];
    }
    state = s.copyWith(
      queue: [for (final m in moves) QueuedMove(m, step: index, preview: true)],
      isPlaying: false,
    );
  }

  void play() {
    if (state.isHandTurning || !state.canStepForward) return;
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
