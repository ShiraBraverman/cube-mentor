import 'dart:isolate';

import '../cube/cube_state.dart';
import '../cube/facelets.dart';
import '../solver/cube_solver.dart';
import '../solver/solve_step.dart';
import 'cubementor_bindings.dart';

/// [CubeSolver] backed by the C++ core through Dart FFI. Native calls run on
/// a short-lived background isolate so table building and searches never
/// block the UI; the tables themselves live in the native library and are
/// shared by every isolate of the process.
class NativeCubeSolver implements CubeSolver {
  @override
  bool supports(int size, SolveMethod method) => switch (size) {
    2 => method == SolveMethod.fast,
    3 || 4 || 5 || 6 => true,
    _ => false,
  };

  @override
  Future<void> prepare(int size) async {
    if (!supports(size, SolveMethod.fast)) return;
    try {
      await Isolate.run(() => CubeMentorBindings.instance.prepare(size));
    } on ArgumentError {
      // Missing library: reported by solve().
    }
  }

  @override
  Future<SolvePlan> solve(CubeState cube, SolveMethod method) async {
    if (!supports(cube.size, method)) {
      throw const SolveException('unsupported');
    }
    final size = cube.size;
    final facelets = cube.toFacelets();
    final String json;
    try {
      json = await Isolate.run(
        () =>
            CubeMentorBindings.instance.solveJson(size, method.code, facelets),
      );
    } on ArgumentError {
      throw const SolveException('unavailable');
    }
    return SolvePlan.fromJson(json);
  }
}
