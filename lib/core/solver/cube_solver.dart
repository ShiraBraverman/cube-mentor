import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cube/cube_state.dart';
import '../ffi/native_cube_solver.dart';
import 'solve_step.dart';

/// Solves cube states. The app uses the native C++ core; tests can swap in
/// a fake through [cubeSolverProvider].
abstract interface class CubeSolver {
  /// Whether [method] is available for cubes of [size].
  bool supports(int size, SolveMethod method);

  /// Builds lookup tables ahead of the first solve (optional warm-up).
  Future<void> prepare(int size);

  /// Solves [cube] or throws a [SolveException].
  Future<SolvePlan> solve(CubeState cube, SolveMethod method);
}

final cubeSolverProvider = Provider<CubeSolver>((ref) => NativeCubeSolver());
