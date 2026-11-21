import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/settings/nickname.dart';
import '../../../core/settings/preferences.dart';
import '../daily_controller.dart';
import 'daily_leaderboard.dart';

/// A solve to put on a day's board.
@immutable
class LeaderboardSubmission {
  const LeaderboardSubmission({
    required this.dayKey,
    required this.millis,
    this.moves = 0,
    this.nickname = '',
  });

  factory LeaderboardSubmission.fromJson(Map<String, dynamic> json) =>
      LeaderboardSubmission(
        dayKey: json['day'] as String,
        millis: json['ms'] as int,
        moves: (json['moves'] as int?) ?? 0,
        nickname: (json['nick'] as String?) ?? '',
      );

  /// UTC challenge day, "YYYY-MM-DD".
  final String dayKey;
  final int millis;
  final int moves;

  /// Empty when the user skipped the nickname (shown as "Anonymous").
  final String nickname;

  Map<String, Object> toJson() => {
    'day': dayKey,
    'ms': millis,
    'moves': moves,
    'nick': nickname,
  };
}

/// The rankings cannot be reached (offline, Firebase missing, signed out).
class LeaderboardUnavailableException implements Exception {
  const LeaderboardUnavailableException([this.cause]);

  final Object? cause;

  @override
  String toString() => 'LeaderboardUnavailableException($cause)';
}

/// The server refused a record for good (e.g. it already holds a faster
/// time); retrying would not help.
class LeaderboardRejectedException implements Exception {
  const LeaderboardRejectedException([this.cause]);

  final Object? cause;

  @override
  String toString() => 'LeaderboardRejectedException($cause)';
}

/// The live daily rankings. The app uses Cloud Firestore
/// ([FirestoreLeaderboardService]); tests use an in-memory fake, so no test
/// ever reaches the network.
abstract class LeaderboardService {
  /// Whether a backend is configured at all (false without Firebase).
  bool get isAvailable;

  /// Signs in (anonymously) if needed; returns the player's id.
  Future<String> ensureSignedIn();

  /// Today's board of [dayKey], updated in real time. Emits
  /// [LeaderboardUnavailableException] errors while the rankings cannot be
  /// fetched, and recovers by itself once they can.
  Stream<LeaderboardPage> watch(String dayKey);

  /// Stores [submission] as the player's record of its day (replacing a
  /// slower one). Throws [LeaderboardUnavailableException] when offline and
  /// [LeaderboardRejectedException] when the server refuses it.
  Future<void> submit(LeaderboardSubmission submission);
}

/// No backend (desktop builds, Firebase not initialized): the board shows
/// its offline notice and solves stay queued on the device.
class OfflineLeaderboardService implements LeaderboardService {
  const OfflineLeaderboardService();

  @override
  bool get isAvailable => false;

  @override
  Future<String> ensureSignedIn() =>
      Future.error(const LeaderboardUnavailableException());

  @override
  Stream<LeaderboardPage> watch(String dayKey) =>
      Stream.error(const LeaderboardUnavailableException());

  @override
  Future<void> submit(LeaderboardSubmission submission) =>
      Future.error(const LeaderboardUnavailableException());
}

/// The leaderboard backend; `main.dart` installs Firestore once Firebase
/// started.
final leaderboardServiceProvider = Provider<LeaderboardService>(
  (ref) => const OfflineLeaderboardService(),
);

/// Queues the user's best daily solve on the device until the server has
/// it: survives restarts and offline days, retried with backoff.
class LeaderboardSyncController extends Notifier<LeaderboardSubmission?> {
  static const _pendingKey = 'leaderboard_pending';

  /// Retry delays after failed uploads (the last one repeats).
  static const retryDelays = [
    Duration(seconds: 15),
    Duration(seconds: 45),
    Duration(minutes: 2),
    Duration(minutes: 5),
  ];

  Timer? _retry;
  var _attempt = 0;
  Future<bool>? _inFlight;

  @override
  LeaderboardSubmission? build() {
    ref.onDispose(() => _retry?.cancel());
    try {
      final raw = ref.watch(sharedPreferencesProvider).getString(_pendingKey);
      if (raw == null) return null;
      return LeaderboardSubmission.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      // No stored preferences (isolated tests) or an unreadable entry.
      return null;
    }
  }

  /// Puts [millis] on the board of [dayKey] (the caller passes only the
  /// day's best), queued first so it is never lost.
  Future<bool> submit({
    required String dayKey,
    required int millis,
    int moves = 0,
  }) async {
    if (millis < kLeaderboardMinMillis) return false;
    final nickname = leaderboardNickname(ref.read(nicknameProvider).name);
    final pending = state;
    if (pending != null &&
        pending.dayKey == dayKey &&
        pending.millis <= millis &&
        pending.nickname == nickname) {
      return sync();
    }
    await _store(
      LeaderboardSubmission(
        dayKey: dayKey,
        millis: millis,
        moves: moves,
        nickname: nickname,
      ),
    );
    _attempt = 0;
    return sync();
  }

  /// Uploads the queued solve, if any. True once the server has it (or
  /// nothing is queued).
  Future<bool> sync() => _inFlight ??= _sync().whenComplete(() {
    _inFlight = null;
  });

  Future<bool> _sync() async {
    final pending = state;
    if (pending == null) return true;
    final service = ref.read(leaderboardServiceProvider);
    if (!service.isAvailable) return false;
    _retry?.cancel();
    try {
      await service.submit(pending);
    } on LeaderboardRejectedException {
      // The server keeps a faster time: nothing left to send.
    } catch (_) {
      if (ref.mounted) _scheduleRetry();
      return false;
    }
    if (ref.mounted && identical(state, pending)) await _store(null);
    _attempt = 0;
    return true;
  }

  void _scheduleRetry() {
    final delay = retryDelays[_attempt.clamp(0, retryDelays.length - 1)];
    _attempt++;
    _retry?.cancel();
    _retry = Timer(delay, () {
      if (ref.mounted) unawaited(sync());
    });
  }

  Future<void> _store(LeaderboardSubmission? value) async {
    state = value;
    try {
      final prefs = ref.read(sharedPreferencesProvider);
      if (value == null) {
        await prefs.remove(_pendingKey);
      } else {
        await prefs.setString(_pendingKey, jsonEncode(value.toJson()));
      }
    } catch (_) {
      // Isolated tests run without stored preferences.
    }
  }
}

final leaderboardSyncProvider =
    NotifierProvider<LeaderboardSyncController, LeaderboardSubmission?>(
      LeaderboardSyncController.new,
    );

/// Today's server board, live. Errors mean "offline right now"; the
/// service recovers by itself, so Riverpod does not retry on top of it.
final leaderboardPageProvider = StreamProvider.autoDispose<LeaderboardPage>((
  ref,
) {
  final day = dayKey(ref.watch(dailyProvider.select((d) => d.date)));
  return ref.watch(leaderboardServiceProvider).watch(day);
}, retry: (_, _) => null);

/// What the leaderboard widgets show.
@immutable
class LeaderboardView {
  const LeaderboardView({
    this.board,
    this.loading = false,
    this.offline = false,
    this.pendingSync = false,
    this.localMillis,
  });

  /// The ranked board; null while loading or when offline with no cache.
  final DailyLeaderboard? board;
  final bool loading;

  /// The live rankings cannot be fetched right now.
  final bool offline;

  /// The user's solve waits on the device for the server.
  final bool pendingSync;

  /// The user's best time today, from the device.
  final int? localMillis;
}

final leaderboardViewProvider = Provider.autoDispose<LeaderboardView>((ref) {
  final page = ref.watch(leaderboardPageProvider);
  final daily = ref.watch(dailyProvider);
  final pending = ref.watch(leaderboardSyncProvider);
  final nickname = leaderboardNickname(
    ref.watch(nicknameProvider.select((n) => n.name)),
  );
  final localMillis = daily.doneToday ? daily.todayMillis : null;
  final today = dayKey(daily.date);
  final value = page.value;
  return LeaderboardView(
    board: value == null
        ? null
        : DailyLeaderboard.fromPage(
            value,
            localMillis: localMillis,
            localNickname: nickname,
          ),
    loading: page.isLoading && !page.hasValue && !page.hasError,
    offline: page.hasError || (value?.fromCache ?? false),
    pendingSync: pending != null && pending.dayKey == today,
    localMillis: localMillis,
  );
});
