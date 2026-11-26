import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import 'settings_sheet.dart' show kFeedbackEmail;

/// The in-app privacy policy, readable offline: what stays on the device,
/// how the camera is used, what the ads do, and how to reach us.
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final sections = [
      (
        Icons.phone_android_rounded,
        l10n.privacyDataTitle,
        l10n.privacyDataBody,
      ),
      (
        Icons.photo_camera_rounded,
        l10n.privacyCameraTitle,
        l10n.privacyCameraBody,
      ),
      (Icons.campaign_rounded, l10n.privacyAdsTitle, l10n.privacyAdsBody),
      (
        Icons.mail_outline_rounded,
        l10n.privacyContactTitle,
        l10n.privacyContactBody(kFeedbackEmail),
      ),
    ];
    return GlassBackground(
      child: Scaffold(
        key: const ValueKey('privacy-policy'),
        appBar: AppBar(title: Text(l10n.privacyPolicyTitle)),
        body: SafeArea(
          top: false,
          child: PageFrame(
            child: ListView(
              padding: kPagePadding,
              children: [
                Text(
                  l10n.privacyIntro,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpace.md),
                for (final (icon, title, body) in sections) ...[
                  GlassCard(
                    padding: const EdgeInsetsDirectional.all(AppSpace.md),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccentIcon(
                          icon: icon,
                          color: AppColors.accent,
                          size: 40,
                        ),
                        const SizedBox(width: AppSpace.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: textTheme.titleMedium),
                              const SizedBox(height: AppSpace.xxs),
                              Text(body, style: textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpace.sm),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
