# CubeMentor

Offline-first 2x2 to 6x6 cube solver and interactive academy (Flutter, Android-first). See `CLAUDE.md` for the full product spec and milestones.

## Status

- [x] Milestone 1: skeleton, dark glassmorphic theme, EN/HE (RTL) localization, home screen, interactive NxNxN 3D cube renderer
- [x] Milestone 2: C++ FFI bridge, optimal 2x2, Kociemba and LBL 3x3 solvers, guided playback (see src/cpp/README.md)
- [x] Milestone 3: camera scanner + color classifier
- [x] Milestone 4: 4x4-6x6 reduction solver, academy, speed timer, daily challenge, pattern library
- [x] Languages: 21 (22 locales: en default, he, es, pt/pt_BR, id, hi, fil, ar, fr, de, ru, pl, tr, ja, ko, zh/zh_TW, vi, my, bn, tt) with a searchable language sheet; ARB files in `lib/core/l10n/`
- [x] Cube color scheme setting: Western (white opposite yellow, default) or Japanese (white opposite blue); drives 3D stickers, pattern previews, color names and scanner color mapping
- [ ] Milestone 5: AdMob + release build

## Development

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d windows   # or a USB-connected Android device
```
