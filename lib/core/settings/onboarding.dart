import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences.dart';

/// Whether the first-launch intro (three short pages) was finished or
/// skipped. Persisted, so the intro shows only once.
class OnboardingSeen extends Notifier<bool> {
  static const key = 'onboarding_done';

  @override
  bool build() => ref.watch(sharedPreferencesProvider).getBool(key) ?? false;

  Future<void> markSeen() async {
    state = true;
    await ref.read(sharedPreferencesProvider).setBool(key, true);
  }
}

final onboardingSeenProvider = NotifierProvider<OnboardingSeen, bool>(
  OnboardingSeen.new,
);
