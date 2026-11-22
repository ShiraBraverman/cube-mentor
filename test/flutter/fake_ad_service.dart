import 'dart:async';

import 'package:cube_mentor/core/ads/ad_service.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:material_ui/material_ui.dart';

/// Deterministic in-memory [AdService]: no SDK, no network.
class FakeAdService implements AdService {
  FakeAdService({
    this.consent = const AdConsent(canRequestAds: true),
    this.outcome = RewardOutcome.earned,
    this.bannerHeight = 50,
    this.rewardedReady = true,
    this.privacyFails = false,
  });

  /// What [initialize] and [showPrivacyOptions] report.
  AdConsent consent;

  /// What the next rewarded video ends with.
  RewardOutcome outcome;

  /// Height of the banners handed out; null means no fill (offline).
  double? bannerHeight;

  /// Whether [showPrivacyOptions] throws (the form failed to show).
  bool privacyFails;

  /// Completes a pending [showRewarded] when set before the call.
  Completer<RewardOutcome>? pendingReward;

  @override
  bool rewardedReady;

  int initializeCalls = 0;
  int privacyCalls = 0;
  int rewardedShown = 0;
  int bannersLoaded = 0;
  int interstitialsShown = 0;

  /// Whether an interstitial is ready to show.
  bool interstitialReady = true;
  final List<FakeBannerSlot> banners = [];

  @override
  bool get supported => true;

  @override
  Future<AdConsent> initialize() async {
    initializeCalls++;
    return consent;
  }

  @override
  Future<AdConsent> showPrivacyOptions() async {
    privacyCalls++;
    if (privacyFails) throw StateError('form unavailable');
    return consent;
  }

  @override
  Future<BannerSlot?> loadBanner(int width) async {
    final height = bannerHeight;
    if (height == null) return null;
    bannersLoaded++;
    final slot = FakeBannerSlot(height);
    banners.add(slot);
    return slot;
  }

  @override
  Future<RewardOutcome> showRewarded() async {
    rewardedShown++;
    final pending = pendingReward;
    if (pending != null) return pending.future;
    return outcome;
  }

  @override
  Future<bool> showInterstitial() async {
    if (!interstitialReady) return false;
    interstitialsShown++;
    return true;
  }
}

class FakeBannerSlot implements BannerSlot {
  FakeBannerSlot(this.height);

  @override
  final double height;

  bool disposed = false;

  @override
  Widget build() => ColoredBox(
    key: const ValueKey('fake-banner'),
    color: const Color(0xFF223344),
    child: SizedBox(height: height),
  );

  @override
  void dispose() => disposed = true;
}

/// An [AdsController] that starts with [preset] (no startup flow needed).
class PresetAdsController extends AdsController {
  PresetAdsController(this.preset);

  final AdConsent preset;

  @override
  AdConsent build() => preset;
}

/// Ads fully on: banners load, advanced content is locked behind ads and
/// the privacy options entry is shown. For layout tests.
List<Override> adsOnOverrides([FakeAdService? service]) => [
  adServiceProvider.overrideWithValue(service ?? FakeAdService()),
  adsProvider.overrideWith(
    () => PresetAdsController(
      const AdConsent(canRequestAds: true, privacyOptionsRequired: true),
    ),
  ),
];
