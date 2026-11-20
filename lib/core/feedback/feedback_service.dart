import 'dart:async';
import 'dart:io' show Platform;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/app_settings.dart';

/// The moments the app gives audible and tactile feedback for.
enum FeedbackCue {
  /// A layer turn or swipe: soft wood-marimba pop + light impact.
  turn,

  /// A step completed / next move: gentle marimba tick + selection click.
  step,

  /// A wrong move in guided mode: very soft low thud + a double light tap.
  wrong,

  /// Cube solved, lesson complete or new PB: ascending C-E-G chime +
  /// medium impact.
  success,

  /// Button taps and tab switches: crisp micro-tick + selection click.
  tap,
}

/// Plays the short sound for a cue. Implementations must never throw.
abstract class SoundPlayer {
  void play(FeedbackCue cue);
  void dispose() {}
}

/// Silent player for tests and platforms without audio.
class SilentSoundPlayer implements SoundPlayer {
  const SilentSoundPlayer();

  @override
  void play(FeedbackCue cue) {}

  @override
  void dispose() {}
}

/// Plays the bundled `assets/sounds/<cue>.wav` clips. Each cue has a small
/// round-robin of preloaded players so quick repeats (fast playback turns)
/// overlap instead of cutting each other off. Players load lazily on first
/// use; any platform error silences sound for the rest of the session
/// instead of surfacing.
class AssetSoundPlayer implements SoundPlayer {
  AssetSoundPlayer();

  static const Map<FeedbackCue, double> _volume = {
    FeedbackCue.turn: 0.55,
    FeedbackCue.step: 0.5,
    FeedbackCue.wrong: 0.5,
    FeedbackCue.success: 0.6,
    FeedbackCue.tap: 0.4,
  };

  final Map<FeedbackCue, List<AudioPlayer>> _players = {};
  final Map<FeedbackCue, int> _next = {};
  Future<void>? _ready;
  bool _failed = false;

  Future<void> _load() async {
    // Mix with the user's music and never take audio focus.
    await AudioPlayer.global.setAudioContext(
      AudioContextConfig(focus: AudioContextConfigFocus.mixWithOthers).build(),
    );
    final lowLatency = !kIsWeb && Platform.isAndroid;
    for (final cue in FeedbackCue.values) {
      final count = cue == FeedbackCue.turn ? 3 : 2;
      final players = <AudioPlayer>[];
      for (var i = 0; i < count; i++) {
        final player = AudioPlayer();
        if (lowLatency) await player.setPlayerMode(PlayerMode.lowLatency);
        await player.setReleaseMode(ReleaseMode.stop);
        await player.setVolume(_volume[cue]!);
        await player.setSource(AssetSource('sounds/${cue.name}.wav'));
        players.add(player);
      }
      _players[cue] = players;
    }
  }

  @override
  void play(FeedbackCue cue) {
    if (_failed) return;
    _ready ??= _load();
    unawaited(_play(cue));
  }

  Future<void> _play(FeedbackCue cue) async {
    try {
      await _ready;
      final players = _players[cue];
      if (players == null || players.isEmpty) return;
      final index = (_next[cue] ?? 0) % players.length;
      _next[cue] = index + 1;
      final player = players[index];
      await player.stop();
      await player.resume();
    } catch (_) {
      _failed = true;
    }
  }

  @override
  void dispose() {
    for (final players in _players.values) {
      for (final player in players) {
        unawaited(player.dispose().catchError((_) {}));
      }
    }
    _players.clear();
  }
}

bool get _isFlutterTest =>
    !kIsWeb && Platform.environment.containsKey('FLUTTER_TEST');

/// The sound backend. Widget tests get the silent player (no audio plugin).
final soundPlayerProvider = Provider<SoundPlayer>((ref) {
  final player = _isFlutterTest
      ? const SilentSoundPlayer()
      : AssetSoundPlayer();
  ref.onDispose(player.dispose);
  return player;
});

/// Subtle, low-latency sound + haptic feedback that respects the Sound &
/// Haptics switch in Settings.
class FeedbackService {
  FeedbackService(this._ref);

  final Ref _ref;
  final Map<FeedbackCue, DateTime> _last = {};

  /// Repeats closer than this are merged, so a burst of turns stays a soft
  /// patter instead of a buzz.
  static const Map<FeedbackCue, Duration> _minGap = {
    FeedbackCue.turn: Duration(milliseconds: 45),
    FeedbackCue.step: Duration(milliseconds: 60),
    FeedbackCue.wrong: Duration(milliseconds: 250),
    FeedbackCue.success: Duration(milliseconds: 800),
    FeedbackCue.tap: Duration(milliseconds: 40),
  };

  bool get enabled => _ref.read(appSettingsProvider).soundHaptics;

  /// Plays [cue]'s sound and haptic. [haptic] false plays the sound alone
  /// (e.g. animated playback turns, where vibrating every move is too much).
  void play(FeedbackCue cue, {bool haptic = true, bool sound = true}) {
    if (!enabled) return;
    final now = DateTime.now();
    final last = _last[cue];
    if (last != null && now.difference(last) < _minGap[cue]!) return;
    _last[cue] = now;
    if (sound) _ref.read(soundPlayerProvider).play(cue);
    if (haptic) _haptic(cue);
  }

  void turn({bool haptic = true}) => play(FeedbackCue.turn, haptic: haptic);
  void step() => play(FeedbackCue.step);
  void wrong() => play(FeedbackCue.wrong);
  void success() => play(FeedbackCue.success);
  void tap() => play(FeedbackCue.tap);

  void _haptic(FeedbackCue cue) {
    switch (cue) {
      case FeedbackCue.turn:
        HapticFeedback.lightImpact();
      case FeedbackCue.step:
      case FeedbackCue.tap:
        HapticFeedback.selectionClick();
      case FeedbackCue.wrong:
        // A gentle double light tap rather than one harsh heavy jolt.
        HapticFeedback.lightImpact();
        Timer(const Duration(milliseconds: 90), HapticFeedback.lightImpact);
      case FeedbackCue.success:
        HapticFeedback.mediumImpact();
    }
  }
}

final feedbackProvider = Provider<FeedbackService>(FeedbackService.new);

/// Plays [cue] from any widget below a [ProviderScope]; a no-op elsewhere
/// (isolated widget tests without a scope).
void playFeedback(BuildContext context, FeedbackCue cue) {
  try {
    ProviderScope.containerOf(
      context,
      listen: false,
    ).read(feedbackProvider).play(cue);
  } catch (_) {
    // No provider scope above this widget: stay silent.
  }
}
