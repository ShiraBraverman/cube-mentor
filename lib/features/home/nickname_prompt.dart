import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/nickname.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';

/// Shows the nickname prompt once, on top of [child], the first time the
/// app opens (after the splash). Answering or skipping never shows it
/// again; Settings keeps the name editable.
class NicknameOnboarding extends ConsumerStatefulWidget {
  const NicknameOnboarding({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<NicknameOnboarding> createState() => _NicknameOnboardingState();
}

class _NicknameOnboardingState extends ConsumerState<NicknameOnboarding> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || ref.read(nicknameProvider).prompted) return;
      showNicknamePrompt(context);
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

/// Asks "What should we call you?". The first-launch version offers
/// "Let's Go" and "Skip" (closing it counts as Skip); from Settings
/// ([onboarding] false) it edits the saved name with Save and Cancel.
Future<void> showNicknamePrompt(
  BuildContext context, {
  bool onboarding = true,
}) async {
  final container = ProviderScope.containerOf(context, listen: false);
  final saved = await showDialog<bool>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (_) => NicknameDialog(onboarding: onboarding),
  );
  // Tapping outside the first-launch prompt is a skip.
  if (onboarding &&
      saved == null &&
      !container.read(nicknameProvider).prompted) {
    await container.read(nicknameProvider.notifier).skip();
  }
}

/// The nickname dialog itself (see [showNicknamePrompt]).
class NicknameDialog extends ConsumerStatefulWidget {
  const NicknameDialog({super.key, required this.onboarding});

  final bool onboarding;

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

  Future<void> _skip() async {
    final navigator = Navigator.of(context);
    if (widget.onboarding) await ref.read(nicknameProvider.notifier).skip();
    if (navigator.mounted) navigator.pop(false);
  }

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
                  autofocus: !widget.onboarding,
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
                  key: const ValueKey('nickname-go'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                  onPressed: _save,
                  icon: Icon(
                    widget.onboarding
                        ? Icons.arrow_forward_rounded
                        : Icons.check_rounded,
                  ),
                  label: Text(
                    widget.onboarding ? l10n.nicknameGo : l10n.nicknameSave,
                  ),
                ),
                const SizedBox(height: AppSpace.xxs),
                TextButton(
                  key: const ValueKey('nickname-skip'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                  ),
                  onPressed: _skip,
                  child: Text(
                    widget.onboarding ? l10n.nicknameSkip : l10n.cancel,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
