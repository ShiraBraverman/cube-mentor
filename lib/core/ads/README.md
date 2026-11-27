# ads

Google AdMob (banner + rewarded video + frequency-capped interstitial) and Google UMP consent.

**Ad-free testing switch:** `kDisableAdsForTesting` in `ad_config.dart` (read
through `adsTestingBypassProvider`). While it is `true` there are no banners,
no interstitials and no consent form, and every rewarded lock (lessons,
patterns, 4x4-6x6 solving, daily hints) opens on tap. It is `false` (ads on)
for release builds; ad tests override the provider either way.

| File | Role |
| --- | --- |
| `ad_config.dart` | All ad IDs (production Android IDs in release builds, Google **test** ad units in debug builds; iOS still test IDs) and ad limits (24 h per rewarded unlock, one interstitial per 3 quick solves). |
| `ad_service.dart` | `AdService` interface, `NoAdService` (desktop/tests), `adServiceProvider`, and `adsProvider` (consent state: can request ads, privacy options required). |
| `admob_service.dart` | `AdMobService`: UMP consent flow, SDK start, inline adaptive banners (max 60 dp), rewarded and interstitial ad preloading. Swapped in by `main()` on Android/iOS only. |
| `app_banner_ad.dart` | `AppBannerAd` slot: zero height until an ad loads, `visible: false` hides it instantly while keeping the ad. Used under the home screen, under the 3D solver, and on the Speed Timer (idle only). |
| `reward_gate.dart` | `AdMobRewardGate` (`rewardGateProvider`): per-item 24 h unlocks with stored expiry for each Academy lesson past the first two and each pattern past the first of its size; 4x4-6x6 solving (first solve free, then 24 h per ad); daily hints for the day. Lessons unlocked for good by older versions stay open. No ad available = free pass for the session. |
| `interstitial_pacer.dart` | `InterstitialPacer`: counts finished 2x2/3x3 solver solutions and shows an interstitial at most once every 3, only when the user leaves a finished solve. |
| `reward_prompt.dart` | `unlockWithFeedback` (loading dialog + snack bars around the gate), `RewardUnlockSheet` (optional 3D preview + Watch Video / Not Now), `LockBadge` (green open / gold closed padlock), `unlockTimeLeftLabel`, and `ensureBigCubeSolve`. |

Tests never touch the SDK: `adServiceProvider` defaults to `NoAdService`,
and `test/flutter/fake_ad_service.dart` provides a scriptable fake.
