import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences.dart';

/// Whether a guided solve opens the sub-step goal sheet by itself at each
/// new sub-step (1.1 ... 3.4). On by default; the sheet's "Don't show
/// automatically again" switch turns it off. The flag button in the solve
/// dock always opens the sheet.
class SubStepIntroAuto extends Notifier<bool> {
  static const _key = 'substep_intro_auto';

  @override
  bool build() => ref.watch(sharedPreferencesProvider).getBool(_key) ?? true;

  Future<void> set(bool value) async {
    state = value;
    await ref.read(sharedPreferencesProvider).setBool(_key, value);
  }
}

final subStepIntroAutoProvider = NotifierProvider<SubStepIntroAuto, bool>(
  SubStepIntroAuto.new,
);
