import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/clock.dart';
import '../settings/preferences.dart';
import 'ad_config.dart';
import 'ad_service.dart';

/// Features gated behind a rewarded video ad.
enum RewardFeature {
  /// The 4x4 to 6x6 solvers (unlocked for 24 hours per ad).
  bigCubeSolver,

  /// An advanced Academy lesson (unlocked permanently per ad).
  advancedLesson,

  /// Hints for the daily challenge (unlocked for the rest of the day).
  dailyHint,
}

/// How an unlock request ended.
enum UnlockResult {
  /// It was already unlocked; no ad was shown.
  alreadyUnlocked,

  /// The user watched a rewarded ad.
  rewarded,

  /// No ad could be shown (offline, no fill): unlocked for free for this
  /// session so nobody is ever stuck behind a missing ad.
  freePass,

  /// The user closed the ad before earning the reward.
  declined;

  /// Whether the feature may be used now.
  bool get granted => this != declined;
}

/// Decides whether a gated feature may be used and runs the unlock flow.
abstract interface class RewardGate {
  /// Whether [feature] (optionally a specific item such as a lesson id) is
  /// unlocked right now.
  bool isUnlocked(RewardFeature feature, {String? item});

  /// Asks to unlock [feature], showing a rewarded ad when needed.
  Future<UnlockResult> unlock(RewardFeature feature, {String? item});
}

/// Unlock bookkeeping; widgets watch it to refresh lock badges.
@immutable
class RewardUnlocks {
  const RewardUnlocks({
    this.lessons = const {},
    this.bigCubeUntil,
    this.hintDay,
    this.sessionPasses = const {},
  });

  /// Advanced lessons unlocked for good.
  final Set<String> lessons;

  /// When the 4x4-6x6 solver unlock expires.
  final DateTime? bigCubeUntil;

  /// The day (yyyy-mm-dd) daily hints are unlocked for.
  final String? hintDay;

  /// Free passes granted when no ad was available, for this session only.
  final Set<String> sessionPasses;

  RewardUnlocks copyWith({
    Set<String>? lessons,
    DateTime? bigCubeUntil,
    String? hintDay,
    Set<String>? sessionPasses,
  }) => RewardUnlocks(
    lessons: lessons ?? this.lessons,
    bigCubeUntil: bigCubeUntil ?? this.bigCubeUntil,
    hintDay: hintDay ?? this.hintDay,
    sessionPasses: sessionPasses ?? this.sessionPasses,
  );
}

/// [RewardGate] backed by AdMob rewarded video ads (through
/// [adServiceProvider]). Unlocks persist in shared preferences; where the
/// platform has no ads (desktop) everything is open.
class AdMobRewardGate extends Notifier<RewardUnlocks> implements RewardGate {
  static const _lessonsKey = 'reward.lessons';
  static const _bigCubeKey = 'reward.bigCubeUntil';
  static const _hintDayKey = 'reward.hintDay';

  @override
  RewardUnlocks build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final until = prefs.getInt(_bigCubeKey);
    return RewardUnlocks(
      lessons: (prefs.getStringList(_lessonsKey) ?? const []).toSet(),
      bigCubeUntil: until == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(until),
      hintDay: prefs.getString(_hintDayKey),
    );
  }

  DateTime get _now => ref.read(clockProvider)();

  static String _day(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  static String _passKey(RewardFeature feature, String? item) =>
      '${feature.name}:${item ?? ''}';

  @override
  bool isUnlocked(RewardFeature feature, {String? item}) {
    if (!ref.read(adServiceProvider).supported) return true;
    if (state.sessionPasses.contains(_passKey(feature, item))) return true;
    return switch (feature) {
      RewardFeature.advancedLesson => state.lessons.contains(item),
      RewardFeature.bigCubeSolver =>
        state.bigCubeUntil != null && _now.isBefore(state.bigCubeUntil!),
      RewardFeature.dailyHint => state.hintDay == _day(_now),
    };
  }

  @override
  Future<UnlockResult> unlock(RewardFeature feature, {String? item}) async {
    if (isUnlocked(feature, item: item)) return UnlockResult.alreadyUnlocked;
    final outcome = await ref.read(adServiceProvider).showRewarded();
    if (!ref.mounted) return UnlockResult.declined;
    switch (outcome) {
      case RewardOutcome.earned:
        await _grant(feature, item);
        return UnlockResult.rewarded;
      case RewardOutcome.dismissed:
        return UnlockResult.declined;
      case RewardOutcome.unavailable:
      case RewardOutcome.unsupported:
        state = state.copyWith(
          sessionPasses: {...state.sessionPasses, _passKey(feature, item)},
        );
        return outcome == RewardOutcome.unsupported
            ? UnlockResult.alreadyUnlocked
            : UnlockResult.freePass;
    }
  }

  Future<void> _grant(RewardFeature feature, String? item) async {
    final prefs = ref.read(sharedPreferencesProvider);
    switch (feature) {
      case RewardFeature.advancedLesson:
        if (item == null) return;
        final lessons = {...state.lessons, item};
        state = state.copyWith(lessons: lessons);
        await prefs.setStringList(_lessonsKey, lessons.toList()..sort());
      case RewardFeature.bigCubeSolver:
        final until = _now.add(AdConfig.bigCubeUnlockDuration);
        state = state.copyWith(bigCubeUntil: until);
        await prefs.setInt(_bigCubeKey, until.millisecondsSinceEpoch);
      case RewardFeature.dailyHint:
        final day = _day(_now);
        state = state.copyWith(hintDay: day);
        await prefs.setString(_hintDayKey, day);
    }
  }
}

/// The reward gate. Read `rewardGateProvider.notifier` to check or unlock;
/// watch `rewardGateProvider` to rebuild when something gets unlocked.
final rewardGateProvider = NotifierProvider<AdMobRewardGate, RewardUnlocks>(
  AdMobRewardGate.new,
);
