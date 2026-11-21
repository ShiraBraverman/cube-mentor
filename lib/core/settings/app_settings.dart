import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cube/color_scheme.dart';
import 'preferences.dart';

/// Slowest and fastest cube animation speed (multiplier of the base turn).
const double kMinAnimationSpeed = 0.25;
const double kMaxAnimationSpeed = 3;

/// Speed a fresh install starts with: a calm pace that is easy to follow
/// while learning.
const double kDefaultAnimationSpeed = 0.75;

/// App-wide preferences edited in the Settings sheet.
@immutable
class AppSettings {
  const AppSettings({
    this.soundHaptics = true,
    this.animationSpeed = kDefaultAnimationSpeed,
    this.colorScheme = CubeColorScheme.western,
  });

  /// Clicks and vibrations on cube turns and the timer.
  final bool soundHaptics;

  /// Speed every new 3D cube starts with (the solver's slider still
  /// changes it per session).
  final double animationSpeed;

  /// Color layout of the user's physical cube: drives sticker colors on
  /// screen, color names and how scanned colors are read.
  final CubeColorScheme colorScheme;

  AppSettings copyWith({
    bool? soundHaptics,
    double? animationSpeed,
    CubeColorScheme? colorScheme,
  }) => AppSettings(
    soundHaptics: soundHaptics ?? this.soundHaptics,
    animationSpeed: animationSpeed ?? this.animationSpeed,
    colorScheme: colorScheme ?? this.colorScheme,
  );
}

class AppSettingsController extends Notifier<AppSettings> {
  static const _hapticsKey = 'settings_sound_haptics';
  static const _speedKey = 'settings_animation_speed';
  static const _colorSchemeKey = 'settings_color_scheme';

  SharedPreferences? _prefs;

  @override
  AppSettings build() {
    try {
      _prefs = ref.watch(sharedPreferencesProvider);
    } catch (_) {
      // Isolated model tests run without stored preferences: use defaults.
      _prefs = null;
      return const AppSettings();
    }
    final prefs = _prefs!;
    return AppSettings(
      soundHaptics: prefs.getBool(_hapticsKey) ?? true,
      animationSpeed: (prefs.getDouble(_speedKey) ?? kDefaultAnimationSpeed)
          .clamp(kMinAnimationSpeed, kMaxAnimationSpeed),
      colorScheme: CubeColorScheme.fromName(prefs.getString(_colorSchemeKey)),
    );
  }

  Future<void> setSoundHaptics(bool on) async {
    state = state.copyWith(soundHaptics: on);
    await _prefs?.setBool(_hapticsKey, on);
  }

  Future<void> setAnimationSpeed(double speed) async {
    final value = speed.clamp(kMinAnimationSpeed, kMaxAnimationSpeed);
    state = state.copyWith(animationSpeed: value);
    await _prefs?.setDouble(_speedKey, value);
  }

  Future<void> setColorScheme(CubeColorScheme scheme) async {
    state = state.copyWith(colorScheme: scheme);
    await _prefs?.setString(_colorSchemeKey, scheme.name);
  }
}

/// The user's cube color scheme (Western unless changed in Settings).
final cubeColorSchemeProvider = Provider<CubeColorScheme>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.colorScheme)),
);

final appSettingsProvider =
    NotifierProvider<AppSettingsController, AppSettings>(
      AppSettingsController.new,
    );
