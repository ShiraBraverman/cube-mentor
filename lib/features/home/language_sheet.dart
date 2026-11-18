import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/locale_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';

/// Header button showing the current language; opens [LanguageSheet].
class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(localeProvider);
    final language = languageForTag(current.toString()) ?? kAppLanguages.first;
    return Tooltip(
      message: l10n.language,
      child: GlassCard(
        key: const ValueKey('language-button'),
        borderRadius: AppRadius.sm,
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 14, 12),
        onTap: () => showLanguageSheet(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.translate_rounded, size: 18),
            const SizedBox(width: 6),
            Text(language.badge, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}

Future<void> showLanguageSheet(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LanguageSheet(),
    );

/// Searchable list of every shipped language, each in its own script.
/// Picking one switches the app (and its LTR/RTL direction) at once.
class LanguageSheet extends ConsumerStatefulWidget {
  const LanguageSheet({super.key});

  @override
  ConsumerState<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends ConsumerState<LanguageSheet> {
  String _query = '';

  /// The current language's tile, scrolled into view when the sheet opens.
  final _selectedKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final tile = _selectedKey.currentContext;
      if (tile != null && tile.mounted) {
        Scrollable.ensureVisible(tile, alignment: 0.5);
      }
    });
  }

  bool _matches(AppLanguage language) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return language.nativeName.toLowerCase().contains(q) ||
        language.englishName.toLowerCase().contains(q) ||
        language.badge.toLowerCase().contains(q);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final current = ref.watch(localeProvider).toString();
    final languages = kAppLanguages.where(_matches).toList();
    final media = MediaQuery.of(context);

    return Padding(
      // Keep the search field above the keyboard.
      padding: EdgeInsetsDirectional.only(bottom: media.viewInsets.bottom),
      child: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: media.size.height * 0.8),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
            child: GlassCard(
              blur: 28,
              borderRadius: AppRadius.lg,
              padding: const EdgeInsetsDirectional.fromSTEB(
                AppSpace.gutter,
                AppSpace.gutter,
                AppSpace.gutter,
                AppSpace.xs,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.language, style: textTheme.titleLarge),
                  const SizedBox(height: 12),
                  TextField(
                    key: const ValueKey('language-search'),
                    onChanged: (value) => setState(() => _query = value),
                    decoration: InputDecoration(
                      hintText: l10n.languageSearch,
                      prefixIcon: const Icon(Icons.search_rounded),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: languages.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              l10n.languageNoResults,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          )
                        // Fifteen rows: build them all, so the current
                        // one can be scrolled into view.
                        : SingleChildScrollView(
                            key: const ValueKey('language-list'),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                for (final language in languages)
                                  Padding(
                                    key: language.tag == current
                                        ? _selectedKey
                                        : null,
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: _LanguageTile(
                                      language: language,
                                      selected: language.tag == current,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageTile extends ConsumerWidget {
  const _LanguageTile({required this.language, required this.selected});

  final AppLanguage language;
  final bool selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      key: ValueKey('lang-${language.tag}'),
      selected: selected,
      borderRadius: AppRadius.sm,
      blur: 0,
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
      onTap: () {
        ref.read(localeProvider.notifier).setLocale(language.locale);
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Container(
            width: 52,
            padding: const EdgeInsets.symmetric(vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.glassFill,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Text(
              language.badge,
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Each name keeps its own reading direction.
                Text(
                  language.nativeName,
                  textDirection: language.isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  style: textTheme.titleMedium,
                ),
                if (language.englishName != language.nativeName)
                  Text(
                    language.englishName,
                    textDirection: TextDirection.ltr,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          if (selected)
            const Icon(Icons.check_circle_rounded, color: AppColors.accent),
        ],
      ),
    );
  }
}
