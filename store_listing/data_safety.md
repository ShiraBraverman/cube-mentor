# Google Play Data Safety: CubeMentor v1.0.0

Privacy policy URL: https://shirabraverman.github.io/cube-mentor/privacy.html
(served from docs/privacy.html once it is on main)

## Data collection and security
- Does your app collect or share any of the required user data types? **Yes** (through the Google Mobile Ads SDK only).
- Is all user data encrypted in transit? **Yes** (the AdMob SDK uses HTTPS).
- Do you provide a way for users to request that their data is deleted? **No** (the developer holds no user data; on-device data is deleted by uninstalling, and Google's ad data is governed by Google's controls).

## Data types to declare (all from the AdMob SDK)
| Category | Data type | Collected | Shared | Optional? | Purposes |
| --- | --- | --- | --- | --- | --- |
| Device or other IDs | Device or other IDs (advertising ID, app set ID) | Yes | Yes | Not optional | Advertising or marketing, Analytics, Fraud prevention, security and compliance |
| Location | Approximate location (derived from IP) | Yes | Yes | Not optional | Advertising or marketing, Analytics, Fraud prevention |
| App activity | App interactions (ad views/clicks) | Yes | Yes | Not optional | Advertising or marketing, Analytics |
| App info and performance | Crash logs, Diagnostics | Yes | No | Not optional | Analytics, Fraud prevention |

Processed ephemerally: No. Collected data is not used for account management or personalization by the developer.

## Do NOT declare
- Photos and videos / camera: frames are processed in memory on the device and never stored or transmitted (on-device processing is not "collection").
- Personal info (name, email, account): none, the app has no accounts.
- App progress, solve times, settings: stored only in SharedPreferences on the device.

## Other Play Console declarations
- Ads: **Yes, my app contains ads.**
- Advertising ID: **Yes**, used for advertising and analytics (the Google Mobile Ads SDK adds the AD_ID permission).
- App access: all functionality available without special access.
- Target audience: 13+ recommended (the privacy policy says the app is not directed at children under 13; choosing under-13 groups would require Families policy ad settings).
- Content rating questionnaire: no violence, user interaction or user-generated content; it shares no location with other users.
- Camera permission: used only for scanning the cube's colors.
