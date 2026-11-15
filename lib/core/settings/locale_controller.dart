import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences.dart';

/// Locales shipped in the single app binary. English is the default.
const List<Locale> kSupportedLocales = [Locale('en'), Locale('he')];

/// Persists and exposes the user's chosen app language.
class LocaleController extends Notifier<Locale> {
  static const _key = 'app_locale';

  @override
  Locale build() {
    final code = ref.watch(sharedPreferencesProvider).getString(_key);
    return kSupportedLocales.firstWhere(
      (l) => l.languageCode == code,
      orElse: () => kSupportedLocales.first,
    );
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_key, locale.languageCode);
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale>(
  LocaleController.new,
);
