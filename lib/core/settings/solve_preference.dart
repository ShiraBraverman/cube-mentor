import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../solver/solve_step.dart';
import 'preferences.dart';

/// The solving method the Solve button uses where both exist: the guided
/// 3-crown beginner's method by default, or the fast (near-optimal) solver.
/// Persisted so the choice made on the guide banner sticks.
class SolvePreference extends Notifier<SolveMethod> {
  static const _key = 'solve_method';

  @override
  SolveMethod build() =>
      ref.watch(sharedPreferencesProvider).getString(_key) == 'fast'
      ? SolveMethod.fast
      : SolveMethod.layerByLayer;

  Future<void> set(SolveMethod method) async {
    state = method;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_key, method == SolveMethod.fast ? 'fast' : 'guided');
  }
}

final solvePreferenceProvider = NotifierProvider<SolvePreference, SolveMethod>(
  SolvePreference.new,
);
