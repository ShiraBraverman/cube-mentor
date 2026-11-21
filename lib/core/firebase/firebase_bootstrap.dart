import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../../features/daily/leaderboard/firestore_leaderboard_service.dart';
import '../../features/daily/leaderboard/leaderboard_service.dart';

/// Starts Firebase for the live daily leaderboard. Android and iOS read
/// their config from `google-services.json` / `GoogleService-Info.plist`;
/// other platforms (desktop) and any startup failure leave the app on the
/// [OfflineLeaderboardService]. Never throws, so the app always launches.
Future<LeaderboardService> startLeaderboardBackend() async {
  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return const OfflineLeaderboardService();
  }
  try {
    await Firebase.initializeApp().timeout(const Duration(seconds: 10));
    final service = FirestoreLeaderboardService();
    // Anonymous sign-in in the background: offline it simply fails and is
    // retried when the leaderboard is opened or a solve is uploaded.
    unawaited(service.ensureSignedIn().then((_) {}, onError: (_) {}));
    return service;
  } catch (e) {
    debugPrint('Firebase unavailable, leaderboard offline: $e');
    return const OfflineLeaderboardService();
  }
}
