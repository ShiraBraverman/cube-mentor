import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/l10n/app_delegates.dart';
import 'core/l10n/generated/app_localizations.dart';
import 'core/settings/app_settings.dart';
import 'core/settings/locale_controller.dart';
import 'core/settings/onboarding.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/sticker_palette.dart';
import 'features/home/onboarding_screen.dart';
import 'features/home/root_shell.dart';

/// Root widget. Locale changes rebuild [MaterialApp], which flips text
/// direction automatically (Hebrew and Arabic -> RTL).
class CubeMentorApp extends ConsumerWidget {
  const CubeMentorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    // Extra line height for tall scripts (Arabic, Hebrew, Bengali, Hindi,
    // Vietnamese and, most of all, Burmese).
    final theme = AppTheme.dark(languageCode: locale.languageCode);
    final colorScheme = ref.watch(cubeColorSchemeProvider);
    // The three-page intro on first launch only; then the home screen.
    final onboarded = ref.watch(onboardingSeenProvider);
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: theme,
      themeMode: ThemeMode.dark,
      locale: locale,
      supportedLocales: kSupportedLocales,
      localizationsDelegates: kAppLocalizationsDelegates,
      // Every route, sheet and dialog paints stickers in the user's scheme.
      builder: (context, child) =>
          StickerPalette(scheme: colorScheme, child: child!),
      home: onboarded ? const RootShell() : const OnboardingScreen(),
    );
  }
}
