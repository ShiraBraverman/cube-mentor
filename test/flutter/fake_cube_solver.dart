import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';

/// In-memory [CubeSolver] for widget tests: returns a canned plan (native
/// calls run on background isolates, which fake-async widget tests cannot
/// drive).
class FakeCubeSolver implements CubeSolver {
  FakeCubeSolver({this.plan});

  SolvePlan? plan;
  final List<SolveMethod> calls = [];

  @override
  bool supports(int size, SolveMethod method) =>
      size == 3 || (size == 2 && method == SolveMethod.fast);

  @override
  Future<void> prepare(int size) async {}

  @override
  Future<SolvePlan> solve(CubeState cube, SolveMethod method) async {
    calls.add(method);
    final result = plan;
    if (result == null) throw const SolveException('internal');
    return result;
  }
}
