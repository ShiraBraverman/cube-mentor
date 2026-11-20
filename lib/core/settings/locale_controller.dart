import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences.dart';

/// One language the app ships, shown in the language picker.
class AppLanguage {
  const AppLanguage(this.locale, this.nativeName, this.englishName);

  final Locale locale;

  /// The name in its own script ("עברית", "Deutsch").
  final String nativeName;

  /// English name, also matched by the picker's search.
  final String englishName;

  /// Stable storage tag: "en", "pt_BR".
  String get tag => locale.toString();

  /// Short badge shown next to the name: "EN", "PT-BR".
  String get badge => locale.toLanguageTag().toUpperCase();

  bool get isRtl => const {'ar', 'he'}.contains(locale.languageCode);
}

/// Every language in the single app binary. English is first and is the
/// fallback for anything the device asks for that is not listed here.
const List<AppLanguage> kAppLanguages = [
  AppLanguage(Locale('en'), 'English', 'English'),
  AppLanguage(Locale('he'), 'עברית', 'Hebrew'),
  AppLanguage(Locale('es'), 'Español', 'Spanish'),
  AppLanguage(Locale('pt', 'BR'), 'Português (Brasil)', 'Portuguese (Brazil)'),
  AppLanguage(Locale('pt'), 'Português (Portugal)', 'Portuguese (Portugal)'),
  AppLanguage(Locale('id'), 'Bahasa Indonesia', 'Indonesian'),
  AppLanguage(Locale('hi'), 'हिन्दी', 'Hindi'),
  AppLanguage(Locale('fil'), 'Filipino', 'Filipino (Tagalog)'),
  AppLanguage(Locale('ar'), 'العربية', 'Arabic'),
  AppLanguage(Locale('fr'), 'Français', 'French'),
  AppLanguage(Locale('de'), 'Deutsch', 'German'),
  AppLanguage(Locale('ru'), 'Русский', 'Russian'),
  AppLanguage(Locale('ja'), '日本語', 'Japanese'),
  AppLanguage(Locale('ko'), '한국어', 'Korean'),
  AppLanguage(Locale('zh'), '简体中文', 'Chinese (Simplified)'),
  AppLanguage(Locale('bn'), 'বাংলা', 'Bengali'),
  AppLanguage(Locale('tt'), 'Татарча', 'Tatar'),
];

/// Locales handed to [MaterialApp].
final List<Locale> kSupportedLocales = [
  for (final language in kAppLanguages) language.locale,
];

/// The language stored under [tag], if it is one we ship.
AppLanguage? languageForTag(String? tag) {
  for (final language in kAppLanguages) {
    if (language.tag == tag) return language;
  }
  return null;
}

/// Best shipped language for a device locale, or null when none fits.
AppLanguage? matchDeviceLocale(Locale device) {
  // Android still reports a few legacy ISO 639 codes.
  final code = switch (device.languageCode) {
    'iw' => 'he',
    'in' => 'id',
    'tl' => 'fil',
    final other => other,
  };
  if (code == 'pt') {
    // European Portuguese only for Portugal; every other region, including
    // no region at all, reads Brazilian Portuguese.
    return languageForTag(device.countryCode == 'PT' ? 'pt' : 'pt_BR');
  }
  return languageForTag(code);
}

/// The device's preferred locales, most preferred first. Overridden in tests.
final deviceLocalesProvider = Provider<List<Locale>>(
  (ref) => PlatformDispatcher.instance.locales,
);

/// Persists and exposes the user's chosen app language. Before the user picks
/// one, the device language is used when we ship it, else English.
class LocaleController extends Notifier<Locale> {
  static const _key = 'app_locale';

  @override
  Locale build() {
    final saved = languageForTag(
      ref.watch(sharedPreferencesProvider).getString(_key),
    );
    if (saved != null) return saved.locale;
    for (final device in ref.watch(deviceLocalesProvider)) {
      final match = matchDeviceLocale(device);
      if (match != null) return match.locale;
    }
    return kAppLanguages.first.locale;
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_key, locale.toString());
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale>(
  LocaleController.new,
);
