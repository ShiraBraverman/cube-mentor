import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/l10n/generated/app_localizations.dart';
import 'core/settings/locale_controller.dart';
import 'core/theme/app_theme.dart';
import 'features/home/home_screen.dart';

/// Root widget. Locale changes rebuild [MaterialApp], which flips text
/// direction automatically (Hebrew -> RTL).
class CubeMentorApp extends ConsumerWidget {
  const CubeMentorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      locale: locale,
      supportedLocales: kSupportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      home: const HomeScreen(),
    );
  }
}
