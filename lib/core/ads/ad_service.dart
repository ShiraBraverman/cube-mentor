import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ad_config.dart';

/// What the consent flow allows right now.
@immutable
class AdConsent {
  const AdConsent({
    this.canRequestAds = false,
    this.privacyOptionsRequired = false,
  });

  /// Ads may be requested (consent obtained or not required).
  final bool canRequestAds;

  /// The user's region requires a way to reopen the privacy options form
  /// (e.g. GDPR); Settings shows its "Privacy & ads" entry only then.
  final bool privacyOptionsRequired;

  @override
  bool operator ==(Object other) =>
      other is AdConsent &&
      other.canRequestAds == canRequestAds &&
      other.privacyOptionsRequired == privacyOptionsRequired;

  @override
  int get hashCode => Object.hash(canRequestAds, privacyOptionsRequired);
}

/// How a rewarded ad request ended.
enum RewardOutcome {
  /// The user watched the video and earned the reward.
  earned,

  /// The user closed the video before earning the reward.
  dismissed,

  /// No ad could be loaded or shown (offline, no fill, no consent).
  unavailable,

  /// This platform has no ads at all (desktop, tests).
  unsupported,
}

/// A loaded banner, ready to be placed in the tree.
abstract interface class BannerSlot {
  /// Height the banner needs, in logical pixels.
  double get height;

  /// The widget that renders the banner.
  Widget build();

  void dispose();
}

/// Everything the app needs from an ad network. [AdMobService] talks to
/// Google Mobile Ads; [NoAdService] is used on desktop and in tests so
/// nothing touches the network.
abstract interface class AdService {
  /// Runs the consent flow (showing Google's UMP form where required) and
  /// starts the ads SDK once ads may be requested.
  Future<AdConsent> initialize();

  /// Reopens the privacy options form; returns the consent afterwards.
  /// Throws when the form could not be shown.
  Future<AdConsent> showPrivacyOptions();

  /// Loads a banner [width] logical pixels wide; null when none is
  /// available (offline, no fill, no consent).
  Future<BannerSlot?> loadBanner(int width);

  /// Whether a rewarded ad is loaded and can show without waiting.
  bool get rewardedReady;

  /// Whether this platform shows ads at all.
  bool get supported;

  /// Shows a rewarded video, loading one first when none is ready.
  Future<RewardOutcome> showRewarded();

  /// Shows a preloaded interstitial and resolves once it is closed. Never
  /// waits for a load: resolves to false right away when none is ready.
  Future<bool> showInterstitial();
}

/// No ads: desktop builds and tests.
class NoAdService implements AdService {
  const NoAdService();

  @override
  Future<AdConsent> initialize() async => const AdConsent();

  @override
  Future<AdConsent> showPrivacyOptions() async => const AdConsent();

  @override
  Future<BannerSlot?> loadBanner(int width) async => null;

  @override
  bool get rewardedReady => false;

  @override
  bool get supported => false;

  @override
  Future<RewardOutcome> showRewarded() async => RewardOutcome.unsupported;

  @override
  Future<bool> showInterstitial() async => false;
}

/// The ad network. Defaults to [NoAdService]; `main()` swaps in
/// `AdMobService` on Android and iOS.
final adServiceProvider = Provider<AdService>((ref) => const NoAdService());

/// The current consent state, refreshed at startup and after the privacy
/// options form closes.
class AdsController extends Notifier<AdConsent> {
  Future<void>? _starting;

  @override
  AdConsent build() => const AdConsent();

  /// Runs the startup consent flow once.
  Future<void> start() => _starting ??= _start();

  Future<void> _start() async {
    // Ad-free testing: no consent form, no SDK start, no ads.
    if (ref.read(adsTestingBypassProvider)) return;
    try {
      final consent = await ref.read(adServiceProvider).initialize();
      if (ref.mounted) state = consent;
    } catch (_) {
      // Ads are optional: a failed consent request just means no ads.
    }
  }

  /// Reopens the privacy options form. Returns false when it failed.
  Future<bool> openPrivacyOptions() async {
    try {
      final consent = await ref.read(adServiceProvider).showPrivacyOptions();
      if (ref.mounted) state = consent;
      return true;
    } catch (_) {
      return false;
    }
  }
}

final adsProvider = NotifierProvider<AdsController, AdConsent>(
  AdsController.new,
);
