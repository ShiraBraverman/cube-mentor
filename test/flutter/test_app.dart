import 'package:cube_mentor/core/l10n/app_delegates.dart';
import 'package:cube_mentor/core/settings/locale_controller.dart';
import 'package:cube_mentor/core/theme/app_theme.dart';
import 'package:material_ui/material_ui.dart';

/// A localized, themed app around a single screen.
Widget testApp(Widget home, {Locale locale = const Locale('en')}) =>
    MaterialApp(
      theme: AppTheme.dark(),
      locale: locale,
      supportedLocales: kSupportedLocales,
      localizationsDelegates: kAppLocalizationsDelegates,
      home: home,
    );
