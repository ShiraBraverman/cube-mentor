import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Ad-free testing switch (`false` for release builds).
///
/// While `true` no banner is shown, no interstitial plays, the consent
/// form is skipped and every rewarded lock (Academy lessons, Pattern
/// Library patterns, 4x4-6x6 solving, daily hints) opens on tap without a
/// video. The lock bookkeeping and UI stay in place, so flipping it only
/// switches the ad flows on or off.
const bool kDisableAdsForTesting = false;

/// Whether ads are bypassed ([kDisableAdsForTesting]); tests override it
/// to exercise the real ad flows.
final adsTestingBypassProvider = Provider<bool>((ref) => kDisableAdsForTesting);

/// AdMob identifiers in one place.
///
/// Android uses the production CubeMentor AdMob app and ad units. Debug
/// builds (`flutter run`, `flutter test`) request Google's official
/// **sample / test** ad units instead
/// (https://developers.google.com/admob/android/test-ads), so development
/// never generates invalid traffic on the real ad units. iOS is not
/// released yet and keeps Google's sample IDs.
///
/// The app IDs themselves live in the platform manifests:
/// `android/app/src/main/AndroidManifest.xml`
/// (`com.google.android.gms.ads.APPLICATION_ID`) and `ios/Runner/Info.plist`
/// (`GADApplicationIdentifier`).
abstract final class AdConfig {
  /// Production AdMob app ID for Android (also in AndroidManifest.xml).
  static const String androidAppId = 'ca-app-pub-7616557370268924~2327279738';

  /// Google's sample AdMob app ID for iOS.
  // TODO(ios-release): replace with the production iOS app ID (and in
  // Info.plist).
  static const String iosAppId = 'ca-app-pub-3940256099942544~1458002511';

  /// Production Android ad units.
  static const String androidBannerProduction =
      'ca-app-pub-7616557370268924/6701639013';
  static const String androidInterstitialProduction =
      'ca-app-pub-7616557370268924/7929805255';
  static const String androidRewardedProduction =
      'ca-app-pub-7616557370268924/1705956496';

  /// Whether ad requests use Google's sample ad units (debug builds).
  static const bool useTestAdUnits = kDebugMode;

  static const String _androidBanner = useTestAdUnits
      ? 'ca-app-pub-3940256099942544/9214589741'
      : androidBannerProduction;
  static const String _androidRewarded = useTestAdUnits
      ? 'ca-app-pub-3940256099942544/5224354917'
      : androidRewardedProduction;
  static const String _androidInterstitial = useTestAdUnits
      ? 'ca-app-pub-3940256099942544/1033173712'
      : androidInterstitialProduction;

  // TODO(ios-release): production iOS ad units.
  static const String _iosBanner = 'ca-app-pub-3940256099942544/2435281174';
  static const String _iosRewarded = 'ca-app-pub-3940256099942544/1712485313';
  static const String _iosInterstitial =
      'ca-app-pub-3940256099942544/4411468910';

  /// Whether the Google Mobile Ads SDK runs on this platform (Android and
  /// iOS only; desktop and web builds show no ads).
  static bool get isSupported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  /// The adaptive banner ad unit for this platform.
  static String get bannerUnitId =>
      defaultTargetPlatform == TargetPlatform.iOS ? _iosBanner : _androidBanner;

  /// The rewarded video ad unit for this platform.
  static String get rewardedUnitId =>
      defaultTargetPlatform == TargetPlatform.iOS
      ? _iosRewarded
      : _androidRewarded;

  /// The interstitial ad unit for this platform.
  static String get interstitialUnitId =>
      defaultTargetPlatform == TargetPlatform.iOS
      ? _iosInterstitial
      : _androidInterstitial;

  /// Tallest banner the layout reserves room for (dp).
  static const double maxBannerHeight = 60;

  /// How long a gated feature waits for a rewarded ad to load before it
  /// falls back to unlocking for free.
  static const Duration rewardedLoadTimeout = Duration(seconds: 6);

  /// How long one rewarded ad unlocks a gated item: a single lesson, a
  /// single pattern, or 4x4-6x6 solving.
  static const Duration itemUnlockDuration = Duration(hours: 24);

  /// Completed 2x2 / 3x3 solves per interstitial: at most one interstitial
  /// every this many solves, shown only after the user leaves a finished
  /// solve (never before or during one).
  static const int solvesPerInterstitial = 3;
}
