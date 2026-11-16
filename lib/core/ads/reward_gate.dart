import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Features that Milestone 5 gates behind a rewarded video ad.
enum RewardFeature {
  /// The 4x4 to 6x6 solvers (unlocked for 24 hours per ad).
  bigCubeSolver,

  /// An advanced Academy lesson (unlocked permanently per ad).
  advancedLesson,

  /// A hint for the daily challenge.
  dailyHint,
}

/// Decides whether a gated feature may be used and runs the unlock flow.
///
/// Milestone 4 ships [OpenRewardGate] (everything unlocked); Milestone 5
/// replaces it with the AdMob rewarded flow without touching the features.
abstract interface class RewardGate {
  /// Whether [feature] (optionally a specific item such as a lesson id) is
  /// unlocked right now.
  bool isUnlocked(RewardFeature feature, {String? item});

  /// Asks to unlock [feature]; completes with true when it may be used.
  Future<bool> unlock(RewardFeature feature, {String? item});
}

/// Everything unlocked: used until rewarded ads arrive.
class OpenRewardGate implements RewardGate {
  const OpenRewardGate();

  @override
  bool isUnlocked(RewardFeature feature, {String? item}) => true;

  @override
  Future<bool> unlock(RewardFeature feature, {String? item}) async => true;
}

final rewardGateProvider = Provider<RewardGate>(
  (ref) => const OpenRewardGate(),
);
