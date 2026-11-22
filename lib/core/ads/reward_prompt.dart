import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/glass.dart';
import '../theme/ui_kit.dart';
import 'ad_config.dart';
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

/// Green open padlock (free or unlocked) or gold closed padlock (needs a
/// rewarded video), in a small round chip.
class LockBadge extends StatelessWidget {
  const LockBadge({super.key, required this.open, this.size = 16});

  final bool open;
  final double size;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final color = open ? AppColors.accentSecondary : AppColors.gold;
    return Semantics(
      label: open ? l10n.unlockedLabel : l10n.lockedLabel,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.18),
          border: Border.all(color: color.withValues(alpha: 0.65)),
        ),
        child: Icon(
          open ? Icons.lock_open_rounded : Icons.lock_rounded,
          size: size,
          color: color,
        ),
      ),
    );
  }
}

/// "23 hours left" / "12 minutes left" for a timed unlock, rounded up so
/// a fresh unlock reads "24 hours left".
String unlockTimeLeftLabel(AppLocalizations l10n, Duration left) {
  final minutes = (left.inSeconds + 59) ~/ 60;
  if (minutes < 60) return l10n.unlockMinutesLeft(minutes < 1 ? 1 : minutes);
  return l10n.unlockHoursLeft((minutes + 59) ~/ 60);
}

/// Bottom sheet offering one rewarded video for a timed unlock, with an
/// optional [preview] (e.g. the locked pattern on a 3D cube). Resolves to
/// true when the user chose "Watch Video".
Future<bool?> showRewardUnlockSheet(
  BuildContext context, {
  required String title,
  required String body,
  Widget? preview,
  Key? key,
}) => showModalBottomSheet<bool>(
  context: context,
  backgroundColor: Colors.transparent,
  isScrollControlled: true,
  builder: (_) =>
      RewardUnlockSheet(key: key, title: title, body: body, preview: preview),
);

/// Content of [showRewardUnlockSheet].
class RewardUnlockSheet extends StatelessWidget {
  const RewardUnlockSheet({
    super.key,
    required this.title,
    required this.body,
    this.preview,
  });

  final String title;
  final String body;
  final Widget? preview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final previewSize = (MediaQuery.sizeOf(context).height * 0.26).clamp(
      120.0,
      220.0,
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
        child: GlassCard(
          key: const ValueKey('reward-unlock-sheet'),
          blur: 28,
          selected: true,
          accent: AppColors.gold,
          borderRadius: AppRadius.lg,
          padding: const EdgeInsetsDirectional.fromSTEB(
            AppSpace.gutter,
            AppSpace.lg,
            AppSpace.gutter,
            AppSpace.sm,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (preview case final preview?)
                  SizedBox(
                    height: previewSize,
                    child: Stack(
                      children: [
                        Positioned.fill(child: preview),
                        const PositionedDirectional(
                          top: 0,
                          end: 0,
                          child: LockBadge(open: false, size: 20),
                        ),
                      ],
                    ),
                  )
                else
                  const Center(
                    child: AccentIcon(
                      icon: Icons.lock_rounded,
                      color: AppColors.gold,
                      size: 52,
                    ),
                  ),
                const SizedBox(height: AppSpace.md),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpace.lg),
                FilledButton.icon(
                  key: const ValueKey('reward-sheet-watch'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.onAccent,
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  icon: const Icon(Icons.ondemand_video_rounded),
                  label: Text(l10n.patternsWatchVideo),
                ),
                const SizedBox(height: AppSpace.xxs),
                TextButton(
                  key: const ValueKey('reward-sheet-not-now'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(l10n.patternsNotNow),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Lets a 4x4-6x6 solve start: the first one is free, later ones need the
/// 24-hour rewarded unlock (offered in a sheet first). 2x2 and 3x3 solves
/// are never gated. Returns whether the solve may run.
Future<bool> ensureBigCubeSolve(
  BuildContext context,
  WidgetRef ref,
  int size,
) async {
  if (size < 4) return true;
  final gate = ref.read(rewardGateProvider.notifier);
  if (gate.isUnlocked(RewardFeature.bigCubeSolver)) return true;
  if (await gate.takeFreeBigCubeSolve()) return true;
  if (!context.mounted) return false;
  final l10n = AppLocalizations.of(context);
  final watch = await showRewardUnlockSheet(
    context,
    title: l10n.bigCubeUnlockTitle,
    body: l10n.bigCubeUnlockBody(AdConfig.itemUnlockDuration.inHours),
  );
  if (watch != true || !context.mounted) return false;
  return unlockWithFeedback(context, ref, RewardFeature.bigCubeSolver);
}
