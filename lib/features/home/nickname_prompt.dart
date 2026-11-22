import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/nickname.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';

/// Asks "What should we call you?" (opened from Settings) and saves the
/// name the celebration cards use, with Save and Cancel.
Future<void> showNicknamePrompt(BuildContext context) => showDialog<bool>(
  context: context,
  barrierColor: Colors.black.withValues(alpha: 0.55),
  builder: (_) => const NicknameDialog(),
);

/// The nickname dialog itself (see [showNicknamePrompt]).
class NicknameDialog extends ConsumerStatefulWidget {
  const NicknameDialog({super.key});

  @override
  ConsumerState<NicknameDialog> createState() => _NicknameDialogState();
}

class _NicknameDialogState extends ConsumerState<NicknameDialog> {
  late final TextEditingController _text = TextEditingController(
    text: ref.read(nicknameProvider).name ?? '',
  );

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final navigator = Navigator.of(context);
    await ref.read(nicknameProvider.notifier).save(_text.text);
    if (navigator.mounted) navigator.pop(true);
  }

  void _cancel() => Navigator.of(context).pop(false);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Dialog(
      key: const ValueKey('nickname-prompt'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSpace.md,
        vertical: AppSpace.lg,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: GlassCard(
          blur: 28,
          selected: true,
          borderRadius: AppRadius.lg,
          padding: const EdgeInsetsDirectional.fromSTEB(
            AppSpace.gutter,
            AppSpace.lg,
            AppSpace.gutter,
            AppSpace.md,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: AccentIcon(
                    icon: Icons.waving_hand_rounded,
                    color: AppColors.gold,
                    size: 56,
                  ),
                ),
                const SizedBox(height: AppSpace.md),
                Text(
                  l10n.nicknamePromptTitle,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  l10n.nicknamePromptBody,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpace.lg),
                TextField(
                  key: const ValueKey('nickname-field'),
                  controller: _text,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  maxLength: kNicknameMaxLength,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(kNicknameMaxLength),
                  ],
                  onSubmitted: (_) => _save(),
                  decoration: InputDecoration(
                    hintText: l10n.nicknameHint,
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                    counterText: '',
                  ),
                ),
                const SizedBox(height: AppSpace.md),
                FilledButton.icon(
                  key: const ValueKey('nickname-save'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                  onPressed: _save,
                  icon: const Icon(Icons.check_rounded),
                  label: Text(l10n.nicknameSave),
                ),
                const SizedBox(height: AppSpace.xxs),
                TextButton(
                  key: const ValueKey('nickname-cancel'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                  ),
                  onPressed: _cancel,
                  child: Text(l10n.cancel),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
