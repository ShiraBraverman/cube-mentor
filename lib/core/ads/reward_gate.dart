import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/clock.dart';
import '../settings/preferences.dart';
import 'ad_config.dart';
import 'ad_service.dart';

/// Features gated behind a rewarded video ad.
enum RewardFeature {
  /// The 4x4 to 6x6 solvers: the first solve is free, then one ad unlocks
  /// them for [AdConfig.itemUnlockDuration].
  bigCubeSolver,

  /// One Academy lesson (item = lesson id) past the free ones, unlocked
  /// for [AdConfig.itemUnlockDuration] per ad.
  lesson,

  /// Hints for the daily challenge (unlocked for the rest of the day).
  dailyHint,

  /// One Pattern Library pattern (item = [patternItem]) past the free first
  /// one of its size, unlocked for [AdConfig.itemUnlockDuration] per ad.
  pattern,
}

/// The reward-gate item of the pattern [id] on the [size] page: every size
/// unlocks on its own.
String patternItem(int size, String id) => '$size:$id';

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
    this.itemsUntil = const {},
    this.legacyLessons = const {},
    this.bigCubeUntil,
    this.bigCubeFreeUsed = false,
    this.hintDay,
    this.sessionPasses = const {},
  });

  /// When each timed per-item unlock (lessons, patterns) expires, keyed by
  /// `feature:item`.
  final Map<String, DateTime> itemsUntil;

  /// Lessons unlocked for good by an older version of the app (before
  /// lessons switched to 24-hour unlocks); they stay open.
  final Set<String> legacyLessons;

  /// When the 4x4-6x6 solver unlock expires.
  final DateTime? bigCubeUntil;

  /// The one free 4x4-6x6 solve has been used.
  final bool bigCubeFreeUsed;

  /// The day (yyyy-mm-dd) daily hints are unlocked for.
  final String? hintDay;

  /// Free passes granted when no ad was available, for this session only.
  final Set<String> sessionPasses;

  RewardUnlocks copyWith({
    Map<String, DateTime>? itemsUntil,
    DateTime? bigCubeUntil,
    bool? bigCubeFreeUsed,
    String? hintDay,
    Set<String>? sessionPasses,
  }) => RewardUnlocks(
    itemsUntil: itemsUntil ?? this.itemsUntil,
    legacyLessons: legacyLessons,
    bigCubeUntil: bigCubeUntil ?? this.bigCubeUntil,
    bigCubeFreeUsed: bigCubeFreeUsed ?? this.bigCubeFreeUsed,
    hintDay: hintDay ?? this.hintDay,
    sessionPasses: sessionPasses ?? this.sessionPasses,
  );
}

/// [RewardGate] backed by AdMob rewarded video ads (through
/// [adServiceProvider]). Unlocks persist in shared preferences with their
/// expiry; where the platform has no ads (desktop) everything is open.
class AdMobRewardGate extends Notifier<RewardUnlocks> implements RewardGate {
  /// Timed item unlocks, stored as `feature:item|expiryMillis` entries.
  static const _itemsKey = 'reward.itemsUntil';

  /// Permanent lesson unlocks from older versions (read only).
  static const _legacyLessonsKey = 'reward.lessons';
  static const _bigCubeKey = 'reward.bigCubeUntil';
  static const _bigCubeFreeKey = 'reward.bigCubeFreeUsed';
  static const _hintDayKey = 'reward.hintDay';

  @override
  RewardUnlocks build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final until = prefs.getInt(_bigCubeKey);
    final now = _now;
    final items = <String, DateTime>{};
    for (final entry in prefs.getStringList(_itemsKey) ?? const <String>[]) {
      final split = entry.lastIndexOf('|');
      if (split <= 0) continue;
      final millis = int.tryParse(entry.substring(split + 1));
      if (millis == null) continue;
      final expiry = DateTime.fromMillisecondsSinceEpoch(millis);
      // Expired unlocks are dropped on the next write.
      if (expiry.isAfter(now)) items[entry.substring(0, split)] = expiry;
    }
    return RewardUnlocks(
      itemsUntil: items,
      legacyLessons: (prefs.getStringList(_legacyLessonsKey) ?? const [])
          .toSet(),
      bigCubeUntil: until == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(until),
      bigCubeFreeUsed: prefs.getBool(_bigCubeFreeKey) ?? false,
      hintDay: prefs.getString(_hintDayKey),
    );
  }

  DateTime get _now => ref.read(clockProvider)();

  static String _day(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  static String _key(RewardFeature feature, String? item) =>
      '${feature.name}:${item ?? ''}';

  /// When the timed unlock of [feature] / [item] expires; null for
  /// features that are not timed or were never unlocked.
  DateTime? _until(RewardFeature feature, String? item) => switch (feature) {
    RewardFeature.bigCubeSolver => state.bigCubeUntil,
    RewardFeature.lesson ||
    RewardFeature.pattern => state.itemsUntil[_key(feature, item)],
    RewardFeature.dailyHint => null,
  };

  @override
  bool isUnlocked(RewardFeature feature, {String? item}) {
    if (ref.read(adsTestingBypassProvider)) return true;
    if (!ref.read(adServiceProvider).supported) return true;
    if (state.sessionPasses.contains(_key(feature, item))) return true;
    if (feature == RewardFeature.lesson && state.legacyLessons.contains(item)) {
      return true;
    }
    if (feature == RewardFeature.dailyHint) {
      return state.hintDay == _day(_now);
    }
    final until = _until(feature, item);
    return until != null && _now.isBefore(until);
  }

  /// Time left on the timed unlock of [feature] / [item]; null when none is
  /// running (never watched, expired, a free pass, or no ads here).
  Duration? timeLeft(RewardFeature feature, {String? item}) {
    if (ref.read(adsTestingBypassProvider)) return null;
    if (!ref.read(adServiceProvider).supported) return null;
    final until = _until(feature, item);
    if (until == null) return null;
    final left = until.difference(_now);
    return left > Duration.zero ? left : null;
  }

  /// Uses the one free 4x4-6x6 solve. Returns false when it was already
  /// used (the solve then needs the rewarded unlock).
  Future<bool> takeFreeBigCubeSolve() async {
    if (state.bigCubeFreeUsed) return false;
    state = state.copyWith(bigCubeFreeUsed: true);
    await ref.read(sharedPreferencesProvider).setBool(_bigCubeFreeKey, true);
    return true;
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
          sessionPasses: {...state.sessionPasses, _key(feature, item)},
        );
        return outcome == RewardOutcome.unsupported
            ? UnlockResult.alreadyUnlocked
            : UnlockResult.freePass;
    }
  }

  Future<void> _grant(RewardFeature feature, String? item) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final until = _now.add(AdConfig.itemUnlockDuration);
    switch (feature) {
      case RewardFeature.lesson:
      case RewardFeature.pattern:
        if (item == null) return;
        final now = _now;
        final items = {
          for (final MapEntry(:key, :value) in state.itemsUntil.entries)
            if (value.isAfter(now)) key: value,
          _key(feature, item): until,
        };
        state = state.copyWith(itemsUntil: items);
        await prefs.setStringList(_itemsKey, [
          for (final MapEntry(:key, :value) in items.entries)
            '$key|${value.millisecondsSinceEpoch}',
        ]);
      case RewardFeature.bigCubeSolver:
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
