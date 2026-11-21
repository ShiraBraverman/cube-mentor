# ads

Google AdMob (banner + rewarded video) and Google UMP consent.

| File | Role |
| --- | --- |
| `ad_config.dart` | All ad IDs (Google **test** IDs until Milestone 6, see the `TODO(milestone-6)` markers) and ad limits. |
| `ad_service.dart` | `AdService` interface, `NoAdService` (desktop/tests), `adServiceProvider`, and `adsProvider` (consent state: can request ads, privacy options required). |
| `admob_service.dart` | `AdMobService`: UMP consent flow, SDK start, inline adaptive banners (max 60 dp), rewarded ad preloading. Swapped in by `main()` on Android/iOS only. |
| `app_banner_ad.dart` | `AppBannerAd` slot: zero height until an ad loads, `visible: false` hides it instantly while keeping the ad. Used above the dock (hidden on the Scan tab), under the 3D solver, and on the Speed Timer (idle only). |
| `reward_gate.dart` | `AdMobRewardGate` (`rewardGateProvider`): advanced lessons unlock for good, daily hints for the day, 4x4-6x6 solvers for 24 h, 4x4-6x6 patterns (past the first free one per size) for 20 min with a live countdown and an expiry re-offer in the Pattern Library. No ad available = free pass for the session. |
| `reward_prompt.dart` | `unlockWithFeedback`: loading dialog + snack bars around the gate. |

Tests never touch the SDK: `adServiceProvider` defaults to `NoAdService`,
and `test/flutter/fake_ad_service.dart` provides a scriptable fake.
