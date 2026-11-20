import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/app_settings.dart';
import '../../core/settings/locale_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../academy/model/academy_progress.dart';
import '../daily/daily_controller.dart';
import 'language_sheet.dart';

/// Compact gear button in the header; opens [SettingsSheet].
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Tooltip(
      message: l10n.settings,
      child: Semantics(
        button: true,
        label: l10n.settings,
        child: GlassCard(
          key: const ValueKey('settings-button'),
          borderRadius: AppRadius.sm,
          padding: const EdgeInsetsDirectional.all(12),
          onTap: () => showSettingsSheet(context),
          child: const Icon(Icons.settings_rounded, size: 20),
        ),
      ),
    );
  }
}

Future<void> showSettingsSheet(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SettingsSheet(),
    );

/// Language, sound & haptics, default animation speed, progress reset and
/// (from Milestone 5) privacy & ad consent.
class SettingsSheet extends ConsumerWidget {
  const SettingsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final settings = ref.watch(appSettingsProvider);
    final controller = ref.read(appSettingsProvider.notifier);
    final locale = ref.watch(localeProvider);
    final language = languageForTag(locale.toString()) ?? kAppLanguages.first;
    final media = MediaQuery.of(context);

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: media.size.height * 0.85),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
          child: GlassCard(
            blur: 28,
            borderRadius: AppRadius.lg,
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppSpace.gutter,
              AppSpace.gutter,
              AppSpace.gutter,
              AppSpace.sm,
            ),
            child: SingleChildScrollView(
              key: const ValueKey('settings-sheet'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.settings, style: textTheme.titleLarge),
                  const SizedBox(height: AppSpace.md),
                  _SettingsRow(
                    key: const ValueKey('settings-language'),
                    icon: Icons.translate_rounded,
                    title: l10n.language,
                    // The language name in its own script and direction.
                    subtitle: Text(
                      language.nativeName,
                      textDirection: language.isRtl
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      style: textTheme.bodySmall,
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textTertiary,
                    ),
                    onTap: () {
                      final navigator = Navigator.of(context);
                      final host = navigator.context;
                      navigator.pop();
                      showLanguageSheet(host);
                    },
                  ),
                  _SettingsRow(
                    icon: Icons.vibration_rounded,
                    title: l10n.settingsSoundHaptics,
                    subtitle: Text(
                      l10n.settingsSoundHapticsDesc,
                      style: textTheme.bodySmall,
                    ),
                    trailing: Switch(
                      key: const ValueKey('settings-haptics'),
                      value: settings.soundHaptics,
                      onChanged: controller.setSoundHaptics,
                    ),
                    onTap: () =>
                        controller.setSoundHaptics(!settings.soundHaptics),
                  ),
                  _SettingsRow(
                    icon: Icons.speed_rounded,
                    title: l10n.settingsAnimationSpeed,
                    subtitle: Text(
                      l10n.settingsAnimationSpeedDesc,
                      style: textTheme.bodySmall,
                    ),
                    trailing: Text(
                      // Numbers and "×" read left to right in every language.
                      '${settings.animationSpeed.toStringAsFixed(2)}×',
                      textDirection: TextDirection.ltr,
                      style: textTheme.labelLarge?.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                    below: Slider(
                      key: const ValueKey('settings-speed'),
                      value: settings.animationSpeed,
                      min: kMinAnimationSpeed,
                      max: kMaxAnimationSpeed,
                      divisions: 11,
                      label: '${settings.animationSpeed.toStringAsFixed(2)}×',
                      onChanged: controller.setAnimationSpeed,
                    ),
                  ),
                  _SettingsRow(
                    key: const ValueKey('settings-reset'),
                    icon: Icons.restart_alt_rounded,
                    accent: AppColors.danger,
                    title: l10n.settingsResetProgress,
                    subtitle: Text(
                      l10n.settingsResetProgressDesc,
                      style: textTheme.bodySmall,
                    ),
                    onTap: () => _confirmReset(context, ref),
                  ),
                  _SettingsRow(
                    key: const ValueKey('settings-privacy'),
                    icon: Icons.privacy_tip_outlined,
                    title: l10n.settingsPrivacyAds,
                    subtitle: Text(
                      l10n.settingsPrivacyAdsDesc,
                      style: textTheme.bodySmall,
                    ),
                    below: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 52,
                        top: AppSpace.xs,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: AppPill(label: l10n.settingsComingSoon),
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

  Future<void> _confirmReset(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        key: const ValueKey('reset-dialog'),
        title: Text(l10n.resetProgressTitle),
        content: Text(l10n.resetProgressBody),
        actions: [
          TextButton(
            key: const ValueKey('reset-cancel'),
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            key: const ValueKey('reset-confirm'),
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.reset),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(academyProgressProvider.notifier).reset();
    await ref.read(dailyProvider.notifier).resetStreak();
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(context)
        ?.showSnackBar(SnackBar(content: Text(l10n.resetProgressDone)));
  }
}

/// One settings entry: icon, title, supporting line, an optional control at
/// the end and an optional full-width control below.
class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.below,
    this.onTap,
    this.accent = AppColors.accent,
  });

  final IconData icon;
  final String title;
  final Widget subtitle;
  final Widget? trailing;
  final Widget? below;
  final VoidCallback? onTap;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpace.xs),
      child: GlassCard(
        blur: 0,
        borderRadius: AppRadius.sm,
        onTap: onTap,
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                AccentIcon(icon: icon, color: accent, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: textTheme.titleMedium),
                      const SizedBox(height: 2),
                      subtitle,
                    ],
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: AppSpace.xs),
                  trailing!,
                ],
              ],
            ),
            ?below,
          ],
        ),
      ),
    );
  }
}
