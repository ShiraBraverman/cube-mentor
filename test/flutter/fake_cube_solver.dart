import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';

/// In-memory [CubeSolver] for widget tests: returns a canned plan (native
/// calls run on background isolates, which fake-async widget tests cannot
/// drive).
class FakeCubeSolver implements CubeSolver {
  FakeCubeSolver({this.plan, this.bigCubes = false});

  /// Also solve 4x4-6x6 (guided only, like the app); off by default so
  /// tests can show the "not available" path.

  final bool bigCubes;

  SolvePlan? plan;
  final List<SolveMethod> calls = [];

  @override
  bool supports(int size, SolveMethod method) =>
      (size <= 3 || bigCubes) && solveMethodOffered(size, method);

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
