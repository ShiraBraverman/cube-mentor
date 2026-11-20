import 'package:cupertino_ui/cupertino_ui.dart'
    show CupertinoLocalizations, GlobalCupertinoLocalizations;
import 'package:material_ui/material_ui.dart';

import 'generated/app_localizations.dart';

/// Every localizations delegate the app needs: our own strings, Flutter's
/// Material / Cupertino / Widgets strings and, for app languages Flutter
/// does not translate (Tatar), English Material and Cupertino strings so
/// dialogs and text fields never fail to find their localizations.
const List<LocalizationsDelegate<dynamic>> kAppLocalizationsDelegates = [
  AppLocalizations.delegate,
  ...GlobalMaterialLocalizations.delegates,
  FallbackMaterialLocalizationsDelegate(),
  FallbackCupertinoLocalizationsDelegate(),
];

/// The locale Flutter's own widget strings fall back to.
const Locale _fallback = Locale('en');

/// Whether the app ships [locale] but Flutter has no Material strings for it.
bool _needsFallback(Locale locale) =>
    AppLocalizations.delegate.isSupported(locale) &&
    !GlobalMaterialLocalizations.delegate.isSupported(locale);

/// English Material strings for app languages Flutter does not cover.
class FallbackMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _needsFallback(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      GlobalMaterialLocalizations.delegate.load(_fallback);

  @override
  bool shouldReload(FallbackMaterialLocalizationsDelegate old) => false;
}

/// English Cupertino strings for app languages Flutter does not cover.
class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.delegate.isSupported(locale) &&
      !GlobalCupertinoLocalizations.delegate.isSupported(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      GlobalCupertinoLocalizations.delegate.load(_fallback);

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}

/// Whether some delegate in [kAppLocalizationsDelegates] provides [type]
/// for [locale].
@visibleForTesting
bool appDelegatesSupport(Type type, Locale locale) => kAppLocalizationsDelegates
    .any((d) => d.type == type && d.isSupported(locale));
