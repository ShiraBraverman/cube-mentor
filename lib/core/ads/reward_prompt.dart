import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../l10n/generated/app_localizations.dart';
import 'ad_service.dart';
import 'reward_gate.dart';

/// Runs the reward gate for [feature] with user feedback: a short loading
/// dialog while the rewarded ad loads, and a snack bar when the ad was
/// closed early or no ad was available. Returns whether the feature may be
/// used.
Future<bool> unlockWithFeedback(
  BuildContext context,
  WidgetRef ref,
  RewardFeature feature, {
  String? item,
}) async {
  final gate = ref.read(rewardGateProvider.notifier);
  if (gate.isUnlocked(feature, item: item)) return true;

  final l10n = AppLocalizations.of(context);
  final messenger = ScaffoldMessenger.maybeOf(context);
  final navigator = Navigator.of(context);
  final ads = ref.read(adServiceProvider);

  var dialogShown = false;
  if (ads.supported && !ads.rewardedReady) {
    dialogShown = true;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: AlertDialog(
          key: const ValueKey('reward-loading'),
          content: Row(
            children: [
              const SizedBox.square(
                dimension: 28,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
              const SizedBox(width: 16),
              Expanded(child: Text(l10n.adLoading)),
            ],
          ),
        ),
      ),
    );
  }

  final result = await gate.unlock(feature, item: item);
  if (dialogShown && navigator.mounted) navigator.pop();

  switch (result) {
    case UnlockResult.declined:
      messenger?.showSnackBar(
        SnackBar(
          key: const ValueKey('reward-declined'),
          content: Text(l10n.adRewardNotEarned),
        ),
      );
    case UnlockResult.freePass:
      messenger?.showSnackBar(
        SnackBar(
          key: const ValueKey('reward-free-pass'),
          content: Text(l10n.adUnavailableFreePass),
        ),
      );
    case UnlockResult.alreadyUnlocked:
    case UnlockResult.rewarded:
      break;
  }
  return result.granted;
}
