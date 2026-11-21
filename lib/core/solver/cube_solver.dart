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

/// Cube sizes with both solve modes, so the Guided / Fast switch shows:
/// the 2x2 (optimal) and the 3x3 (Kociemba). Bigger cubes are always solved
/// stage by stage (reduction, then the three crowns).
const Set<int> kFastSolveSizes = {2, 3};

/// Upper bound shown next to a Fast solution's move count ("17 / 21
/// moves"), in face turns: God's Number for the 2x2 (11, every position is
/// solvable in 11 moves or fewer) and the length the two-phase Kociemba
/// search reliably stays within for the 3x3 (21; God's Number itself is 20).
const Map<int, int> kFastSolveMoveLimit = {2: 11, 3: 21};

/// Which solve modes the app offers for cubes of [size] (2x2 to 6x6).
bool solveMethodOffered(int size, SolveMethod method) {
  if (size < 2 || size > 6) return false;
  return method == SolveMethod.layerByLayer || kFastSolveSizes.contains(size);
}

final cubeSolverProvider = Provider<CubeSolver>((ref) => NativeCubeSolver());
