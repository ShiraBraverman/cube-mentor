import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'daily_leaderboard.dart';
import 'leaderboard_service.dart';

/// The live global board in Cloud Firestore:
/// `daily_challenges/{YYYY-MM-DD}/entries/{uid}` holds each player's best
/// solve of that UTC day (`nickname`, `timeMs`, `moves`, `updatedAt`).
/// Players sign in anonymously; `firestore.rules` lets them read every
/// entry and write only their own.
class FirestoreLeaderboardService implements LeaderboardService {
  FirestoreLeaderboardService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  }) : _db = firestore ?? FirebaseFirestore.instance,
       _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  /// Records streamed live, fastest first. Beyond them the board uses
  /// aggregate queries (count, average, the user's rank).
  static const topLimit = 500;

  /// Records loaded on each side of a user ranked beyond [topLimit].
  static const aroundSize = 15;

  /// How often aggregates are refreshed on boards larger than [topLimit]
  /// (new entries beyond the top rows do not trigger a snapshot).
  static const refreshEvery = Duration(seconds: 45);

  /// Wait for the server before declaring an empty cache "offline".
  static const serverGrace = Duration(seconds: 8);

  static const retryAfter = Duration(seconds: 20);
  static const signInTimeout = Duration(seconds: 15);
  static const writeTimeout = Duration(seconds: 20);

  Future<String>? _signIn;

  CollectionReference<Map<String, dynamic>> _entries(String day) =>
      _db.collection('daily_challenges').doc(day).collection('entries');

  @override
  bool get isAvailable => true;

  @override
  Future<String> ensureSignedIn() {
    final user = _auth.currentUser;
    if (user != null) return Future.value(user.uid);
    // One sign-in at a time, so a single anonymous account is created.
    return _signIn ??= _auth
        .signInAnonymously()
        .timeout(signInTimeout)
        .then((cred) => cred.user!.uid)
        .catchError((Object e) {
          _signIn = null;
          throw LeaderboardUnavailableException(e);
        });
  }

  @override
  Future<void> submit(LeaderboardSubmission submission) async {
    final uid = await ensureSignedIn();
    try {
      // Offline, Firestore keeps the write and sends it on reconnect; the
      // timeout only tells the caller to keep its own queue as well.
      await _entries(submission.dayKey)
          .doc(uid)
          .set({
            'nickname': leaderboardNickname(submission.nickname),
            'timeMs': submission.millis,
            'moves': submission.moves,
            'updatedAt': FieldValue.serverTimestamp(),
          })
          .timeout(writeTimeout);
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        // The rules refuse slower updates: the server has a faster time.
        throw LeaderboardRejectedException(e);
      }
      throw LeaderboardUnavailableException(e);
    } on TimeoutException catch (e) {
      throw LeaderboardUnavailableException(e);
    }
  }

  @override
  Stream<LeaderboardPage> watch(String dayKey) {
    late final StreamController<LeaderboardPage> out;
    StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? sub;
    Timer? retry;
    Timer? refresh;
    Timer? grace;
    QuerySnapshot<Map<String, dynamic>>? last;
    var closed = false;
    var generation = 0;
    var uid = '';

    void fail(Object error) {
      if (closed) return;
      out.addError(LeaderboardUnavailableException(error));
    }

    late Future<void> Function() start;

    void restartLater() {
      retry?.cancel();
      retry = Timer(retryAfter, () => unawaited(start()));
    }

    Future<void> publish(QuerySnapshot<Map<String, dynamic>> snap) async {
      final token = ++generation;
      final top = [for (final doc in snap.docs) ?_record(doc.id, doc.data())];
      final fromCache = snap.metadata.isFromCache;
      if (fromCache && snap.docs.isEmpty) {
        // Most likely the cache before the first server answer.
        grace ??= Timer(serverGrace, () {
          if (last?.metadata.isFromCache ?? true) {
            fail('no server answer');
          }
        });
        return;
      }
      grace?.cancel();
      grace = null;
      var page = LeaderboardPage(
        top: top,
        solverCount: top.length,
        averageMillis: averageMillisOf(top),
        userUid: uid,
        fromCache: fromCache,
      );
      if (snap.docs.length >= topLimit && !fromCache) {
        try {
          page = await _beyondTop(dayKey, uid, top);
        } catch (_) {
          // Keep the top rows; aggregates come back on the next refresh.
          page = LeaderboardPage(
            top: top,
            solverCount: top.length,
            averageMillis: averageMillisOf(top),
            userUid: uid,
            fromCache: true,
          );
        }
        refresh?.cancel();
        refresh = Timer(refreshEvery, () {
          final snap = last;
          if (snap != null && !closed) unawaited(publish(snap));
        });
      }
      if (!closed && token == generation) out.add(page);
    }

    start = () async {
      if (closed) return;
      await sub?.cancel();
      sub = null;
      try {
        uid = await ensureSignedIn();
      } catch (e) {
        fail(e);
        restartLater();
        return;
      }
      if (closed) return;
      sub = _entries(dayKey)
          .orderBy('timeMs')
          .limit(topLimit)
          .snapshots(includeMetadataChanges: true)
          .listen(
            (snap) {
              last = snap;
              unawaited(publish(snap));
            },
            onError: (Object e) {
              fail(e);
              unawaited(sub?.cancel());
              sub = null;
              restartLater();
            },
          );
    };

    out = StreamController<LeaderboardPage>(
      onListen: () => unawaited(start()),
      onCancel: () async {
        closed = true;
        retry?.cancel();
        refresh?.cancel();
        grace?.cancel();
        await sub?.cancel();
      },
    );
    return out.stream;
  }

  /// A board larger than [topLimit]: exact count and average by aggregate
  /// queries, plus the user's rank and neighbors when beyond the top rows.
  Future<LeaderboardPage> _beyondTop(
    String dayKey,
    String uid,
    List<LeaderboardRecord> top,
  ) async {
    final entries = _entries(dayKey);
    final stats = await entries.aggregate(count(), average('timeMs')).get();
    final total = stats.count ?? top.length;
    final mean = stats.getAverage('timeMs')?.round() ?? averageMillisOf(top);
    if (top.any((r) => r.uid == uid)) {
      return LeaderboardPage(
        top: top,
        solverCount: total,
        averageMillis: mean,
        userUid: uid,
      );
    }
    final mineDoc = await entries.doc(uid).get();
    final mine = mineDoc.exists ? _record(uid, mineDoc.data()!) : null;
    if (mine == null) {
      return LeaderboardPage(
        top: top,
        solverCount: total,
        averageMillis: mean,
        userUid: uid,
      );
    }
    final faster = entries.where('timeMs', isLessThan: mine.millis);
    final fasterCount = (await faster.count().get()).count ?? 0;
    final above = await faster.orderBy('timeMs').limitToLast(aroundSize).get();
    final below = await entries
        .where('timeMs', isGreaterThanOrEqualTo: mine.millis)
        .orderBy('timeMs')
        .limit(aroundSize + 1)
        .get();
    final around = [
      for (final doc in above.docs) ?_record(doc.id, doc.data()),
      mine,
      for (final doc in below.docs)
        if (doc.id != uid) ?_record(doc.id, doc.data()),
    ];
    return LeaderboardPage(
      top: top,
      solverCount: total,
      averageMillis: mean,
      userUid: uid,
      userRank: fasterCount + 1,
      around: around,
      aroundStartRank: fasterCount - above.docs.length + 1,
    );
  }

  /// A stored entry, or null when it is malformed.
  static LeaderboardRecord? _record(String uid, Map<String, dynamic> data) {
    final millis = data['timeMs'];
    if (millis is! num) return null;
    final moves = data['moves'];
    final nickname = data['nickname'];
    return LeaderboardRecord(
      uid: uid,
      millis: millis.toInt(),
      moves: moves is num ? moves.toInt() : 0,
      nickname: nickname is String ? nickname : '',
    );
  }
}
