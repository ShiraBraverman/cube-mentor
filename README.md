# CubeMentor

Offline-first 2x2 to 6x6 cube solver and interactive academy (Flutter, Android-first). See `CLAUDE.md` for the full product spec and milestones.

## Status

- [x] Milestone 1: skeleton, dark glassmorphic theme, EN/HE (RTL) localization, home screen, interactive NxNxN 3D cube renderer
- [ ] Milestone 2: C++ FFI bridge + 2x2/3x3 solvers
- [ ] Milestone 3: camera scanner + color classifier
- [ ] Milestone 4: 4x4-6x6 reduction solver + academy
- [ ] Milestone 5: AdMob + release build

## Development

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d windows   # or a USB-connected Android device
```
