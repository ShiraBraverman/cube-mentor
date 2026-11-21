import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/ads/ad_config.dart';
import 'core/ads/ad_service.dart';
import 'core/ads/admob_service.dart';
import 'core/firebase/firebase_bootstrap.dart';
import 'core/settings/preferences.dart';
import 'features/daily/leaderboard/leaderboard_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // Live leaderboard backend; falls back to offline if Firebase fails.
  final leaderboard = await startLeaderboardBackend();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      leaderboardServiceProvider.overrideWithValue(leaderboard),
      // Google Mobile Ads on Android and iOS; no ads on desktop.
      if (AdConfig.isSupported)
        adServiceProvider.overrideWithValue(AdMobService()),
    ],
  );
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const CubeMentorApp(),
    ),
  );
  // Ask for ad consent where required (UMP), then start the ads SDK. The
  // app is fully usable meanwhile; banners appear once ads are allowed.
  unawaited(container.read(adsProvider.notifier).start());
  // Uploads a daily solve that was queued while offline.
  unawaited(container.read(leaderboardSyncProvider.notifier).sync());
}
