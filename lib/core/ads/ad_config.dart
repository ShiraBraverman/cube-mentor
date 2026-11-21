import 'package:flutter/foundation.dart';

/// AdMob identifiers in one place.
///
/// Every value below is one of Google's official **sample / test** IDs
/// (https://developers.google.com/admob/android/test-ads and
/// https://developers.google.com/admob/ios/test-ads). Test ads never pay
/// out and can be clicked safely during development.
///
/// The app IDs themselves live in the platform manifests:
/// `android/app/src/main/AndroidManifest.xml`
/// (`com.google.android.gms.ads.APPLICATION_ID`) and `ios/Runner/Info.plist`
/// (`GADApplicationIdentifier`).
abstract final class AdConfig {
  /// Google's sample AdMob app ID for Android.
  // TODO(milestone-6): replace with the production Android app ID (and in
  // AndroidManifest.xml).
  static const String androidAppId = 'ca-app-pub-3940256099942544~3347511713';

  /// Google's sample AdMob app ID for iOS.
  // TODO(milestone-6): replace with the production iOS app ID (and in
  // Info.plist).
  static const String iosAppId = 'ca-app-pub-3940256099942544~1458002511';

  // TODO(milestone-6): replace the four test ad unit IDs below with the
  // production ad units created in the AdMob console.
  static const String _androidBanner = 'ca-app-pub-3940256099942544/9214589741';
  static const String _iosBanner = 'ca-app-pub-3940256099942544/2435281174';
  static const String _androidRewarded =
      'ca-app-pub-3940256099942544/5224354917';
  static const String _iosRewarded = 'ca-app-pub-3940256099942544/1712485313';

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

  /// Tallest banner the layout reserves room for (dp).
  static const double maxBannerHeight = 60;

  /// How long a gated feature waits for a rewarded ad to load before it
  /// falls back to unlocking for free.
  static const Duration rewardedLoadTimeout = Duration(seconds: 6);

  /// How long a 4x4-6x6 solver unlock lasts after one rewarded ad.
  static const Duration bigCubeUnlockDuration = Duration(hours: 24);

  /// How long the 4x4-6x6 Pattern Library stays open after one rewarded ad.
  static const Duration patternsUnlockDuration = Duration(minutes: 20);
}
