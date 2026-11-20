import 'package:cube_mentor/core/feedback/feedback_service.dart';
import 'package:cube_mentor/core/settings/app_settings.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Records every cue instead of playing audio.
class RecordingSoundPlayer implements SoundPlayer {
  final played = <FeedbackCue>[];

  @override
  void play(FeedbackCue cue) => played.add(cue);

  @override
  void dispose() {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<String> haptics;
  late RecordingSoundPlayer sound;

  Future<ProviderContainer> container({bool on = true}) async {
    SharedPreferences.setMockInitialValues({'settings_sound_haptics': on});
    final prefs = await SharedPreferences.getInstance();
    sound = RecordingSoundPlayer();
    final c = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        soundPlayerProvider.overrideWithValue(sound),
      ],
    );
    addTearDown(c.dispose);
    return c;
  }

  setUp(() {
    haptics = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (call) async {
          if (call.method == 'HapticFeedback.vibrate') {
            haptics.add((call.arguments as String).split('.').last);
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null);
  });

  test('each cue plays its sound and its gentle haptic', () async {
    final feedback = (await container()).read(feedbackProvider);
    feedback.turn();
    feedback.step();
    feedback.success();
    feedback.tap();
    await Future<void>.delayed(Duration.zero);
    expect(sound.played, [
      FeedbackCue.turn,
      FeedbackCue.step,
      FeedbackCue.success,
      FeedbackCue.tap,
    ]);
    expect(haptics, [
      'lightImpact',
      'selectionClick',
      'mediumImpact',
      'selectionClick',
    ]);
  });

  test('a wrong move is a soft double light tap, never a heavy jolt', () async {
    final feedback = (await container()).read(feedbackProvider);
    feedback.wrong();
    await Future<void>.delayed(const Duration(milliseconds: 150));
    expect(sound.played, [FeedbackCue.wrong]);
    expect(haptics, ['lightImpact', 'lightImpact']);
  });

  test('playback turns click without vibrating', () async {
    final feedback = (await container()).read(feedbackProvider);
    feedback.turn(haptic: false);
    await Future<void>.delayed(Duration.zero);
    expect(sound.played, [FeedbackCue.turn]);
    expect(haptics, isEmpty);
  });

  test('rapid repeats are merged into one', () async {
    final feedback = (await container()).read(feedbackProvider);
    for (var i = 0; i < 5; i++) {
      feedback.success();
    }
    expect(sound.played, [FeedbackCue.success]);
  });

  test('the Settings switch silences sound and haptics', () async {
    final c = await container(on: false);
    c.read(feedbackProvider)
      ..turn()
      ..step()
      ..wrong()
      ..success()
      ..tap();
    await Future<void>.delayed(const Duration(milliseconds: 150));
    expect(sound.played, isEmpty);
    expect(haptics, isEmpty);

    await c.read(appSettingsProvider.notifier).setSoundHaptics(true);
    c.read(feedbackProvider).tap();
    expect(sound.played, [FeedbackCue.tap]);
  });

  test('the bundled sounds are tiny', () async {
    // The assets exist and stay small enough to load instantly.
    for (final cue in FeedbackCue.values) {
      final data = await rootBundle.load('assets/sounds/${cue.name}.wav');
      expect(data.lengthInBytes, lessThan(64 * 1024), reason: cue.name);
    }
  });
}
