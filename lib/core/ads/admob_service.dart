import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_config.dart';
import 'ad_service.dart';

/// [AdService] backed by Google Mobile Ads and Google's User Messaging
/// Platform (UMP) for GDPR / US-state consent.
///
/// Only constructed on Android and iOS (see `main()`); tests use fakes.
class AdMobService implements AdService {
  bool _sdkStarted = false;
  RewardedAd? _rewarded;
  Future<RewardedAd?>? _rewardedLoading;

  @override
  bool get supported => true;

  @override
  bool get rewardedReady => _rewarded != null;

  @override
  Future<AdConsent> initialize() async {
    // Consent from a previous launch lets ads start in parallel with the
    // (network-bound) consent refresh.
    if (await ConsentInformation.instance.canRequestAds()) {
      await _startSdk();
    }
    try {
      await _requestConsentUpdate();
      await _loadAndShowFormIfRequired();
    } catch (_) {
      // Offline or misconfigured: keep whatever consent we already had.
    }
    final consent = await _currentConsent();
    if (consent.canRequestAds) await _startSdk();
    return consent;
  }

  @override
  Future<AdConsent> showPrivacyOptions() async {
    final done = Completer<FormError?>();
    await ConsentForm.showPrivacyOptionsForm(done.complete);
    final error = await done.future;
    if (error != null) throw StateError(error.message);
    final consent = await _currentConsent();
    if (consent.canRequestAds) await _startSdk();
    return consent;
  }

  @override
  Future<BannerSlot?> loadBanner(int width) async {
    if (!_sdkStarted || width <= 0) return null;
    // An inline adaptive banner capped at the height the layout reserves.
    final size = AdSize.getInlineAdaptiveBannerAdSize(
      width,
      AdConfig.maxBannerHeight.toInt(),
    );
    final loaded = Completer<BannerAd?>();
    final banner = BannerAd(
      adUnitId: AdConfig.bannerUnitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => loaded.complete(ad as BannerAd),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          loaded.complete(null);
        },
      ),
    );
    await banner.load();
    final ad = await loaded.future;
    if (ad == null) return null;
    final platformSize = await ad.getPlatformAdSize();
    final height = (platformSize?.height ?? size.height).toDouble();
    return _AdMobBannerSlot(ad, height.clamp(1, AdConfig.maxBannerHeight));
  }

  @override
  Future<RewardOutcome> showRewarded() async {
    if (!_sdkStarted) return RewardOutcome.unavailable;
    final ad =
        _rewarded ??
        await _loadRewarded().timeout(
          AdConfig.rewardedLoadTimeout,
          onTimeout: () => null,
        );
    _rewarded = null;
    if (ad == null) {
      _preloadRewarded();
      return RewardOutcome.unavailable;
    }

    final result = Completer<RewardOutcome>();
    var earned = false;
    ad.fullScreenContentCallback = FullScreenContentCallback<RewardedAd>(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        if (!result.isCompleted) {
          result.complete(
            earned ? RewardOutcome.earned : RewardOutcome.dismissed,
          );
        }
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        if (!result.isCompleted) result.complete(RewardOutcome.unavailable);
      },
    );
    await ad.show(onUserEarnedReward: (_, _) => earned = true);
    final outcome = await result.future;
    // Have the next one ready for the next gated feature.
    _preloadRewarded();
    return outcome;
  }

  Future<void> _requestConsentUpdate() {
    final done = Completer<void>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(),
      done.complete,
      (error) => done.completeError(StateError(error.message)),
    );
    return done.future;
  }

  Future<void> _loadAndShowFormIfRequired() async {
    final done = Completer<void>();
    await ConsentForm.loadAndShowConsentFormIfRequired((_) => done.complete());
    return done.future;
  }

  Future<AdConsent> _currentConsent() async {
    final info = ConsentInformation.instance;
    final required =
        await info.getPrivacyOptionsRequirementStatus() ==
        PrivacyOptionsRequirementStatus.required;
    return AdConsent(
      canRequestAds: await info.canRequestAds(),
      privacyOptionsRequired: required,
    );
  }

  Future<void> _startSdk() async {
    if (_sdkStarted) return;
    _sdkStarted = true;
    await MobileAds.instance.initialize();
    _preloadRewarded();
  }

  void _preloadRewarded() {
    if (_rewarded != null) return;
    unawaited(
      _loadRewarded().then((ad) {
        if (ad != null && _rewarded == null) _rewarded = ad;
      }),
    );
  }

  /// Loads one rewarded ad; concurrent callers share the same request.
  Future<RewardedAd?> _loadRewarded() {
    return _rewardedLoading ??= () async {
      final done = Completer<RewardedAd?>();
      await RewardedAd.load(
        adUnitId: AdConfig.rewardedUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: done.complete,
          onAdFailedToLoad: (_) => done.complete(null),
        ),
      );
      try {
        return await done.future;
      } finally {
        _rewardedLoading = null;
      }
    }();
  }
}

class _AdMobBannerSlot implements BannerSlot {
  _AdMobBannerSlot(this._ad, this.height);

  final BannerAd _ad;

  @override
  final double height;

  @override
  Widget build() => AdWidget(ad: _ad);

  @override
  void dispose() => _ad.dispose();
}
