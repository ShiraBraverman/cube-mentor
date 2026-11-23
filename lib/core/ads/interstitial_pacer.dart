import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/preferences.dart';
import 'ad_config.dart';
import 'ad_service.dart';

/// Frequency cap for the interstitial after quick (2x2 / 3x3) solves.
///
/// Scanning and solving are never gated: a finished solve is only counted
/// ([recordSolve]), and when the user leaves it (Exit, back, scan the next
/// cube) [maybeShow] plays an interstitial at most once every
/// [AdConfig.solvesPerInterstitial] solves. The state is the number of
/// solves finished since the last interstitial; it survives restarts.
class InterstitialPacer extends Notifier<int> {
  static const _key = 'ads.solvesSinceInterstitial';

  @override
  int build() => ref.watch(sharedPreferencesProvider).getInt(_key) ?? 0;

  /// Counts one finished solve.
  Future<void> recordSolve() async {
    state = state + 1;
    await ref.read(sharedPreferencesProvider).setInt(_key, state);
  }

  /// Shows an interstitial when enough solves were finished since the last
  /// one. Returns whether one was shown. When no ad is ready the count is
  /// kept, so the next exit tries again.
  Future<bool> maybeShow() async {
    if (ref.read(adsTestingBypassProvider)) return false;
    if (state < AdConfig.solvesPerInterstitial) return false;
    final ads = ref.read(adServiceProvider);
    if (!ads.supported) return false;
    final shown = await ads.showInterstitial();
    if (!ref.mounted || !shown) return false;
    state = 0;
    await ref.read(sharedPreferencesProvider).setInt(_key, 0);
    return true;
  }
}

final interstitialPacerProvider = NotifierProvider<InterstitialPacer, int>(
  InterstitialPacer.new,
);
