import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/ads/ad_config.dart';
import 'package:cube_mentor/core/ads/ad_service.dart';
import 'package:cube_mentor/core/ads/reward_gate.dart';
import 'package:cube_mentor/core/celebration/celebration.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/nickname.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/home/settings_sheet.dart';
import 'package:cube_mentor/features/patterns/patterns.dart';
import 'package:cube_mentor/features/patterns/patterns_screen.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/solver_3d/widgets/solve_banner.dart';
import 'package:cube_mentor/features/timer/timer_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_ad_service.dart';
import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';
import 'fake_scrambler.dart';
import 'test_app.dart';

Future<SharedPreferences> _prefs([Map<String, Object> values = const {}]) {
  SharedPreferences.setMockInitialValues(values);
  return SharedPreferences.getInstance();
}

Future<void> _advance(WidgetTester tester, [int frames = 10]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void _phone(WidgetTester tester) {
  tester.view.physicalSize = const Size(1080, 2340);
  tester.view.devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
}

Future<void> _pumpApp(WidgetTester tester, SharedPreferences prefs) async {
  _phone(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
        scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
        clockProvider.overrideWithValue(() => DateTime(2026, 11, 20, 8)),
      ],
      child: const CubeMentorApp(),
    ),
  );
  await _advance(tester, 6);
}

void main() {
  group('nickname', () {
    test('is trimmed, collapsed and capped; blank means none', () {
      expect(normalizeNickname('  Shira  '), 'Shira');
      expect(normalizeNickname('Mary   Ann'), 'Mary Ann');
      expect(normalizeNickname('   '), isNull);
      expect(normalizeNickname(null), isNull);
      expect(normalizeNickname('x' * 40), hasLength(kNicknameMaxLength));
    });

    testWidgets('first launch asks for a name; "Let\'s Go" saves it', (
      tester,
    ) async {
      final prefs = await _prefs();
      await _pumpApp(tester, prefs);
      expect(find.byKey(const ValueKey('nickname-prompt')), findsOneWidget);
      expect(find.text('What should we call you?'), findsOneWidget);

      await tester.enterText(
        find.byKey(const ValueKey('nickname-field')),
        '  Shira ',
      );
      await tester.tap(find.byKey(const ValueKey('nickname-go')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('nickname-prompt')), findsNothing);
      expect(prefs.getString('user_nickname'), 'Shira');
      expect(prefs.getBool('nickname_prompted'), isTrue);

      // Never asked again on the next launch.
      await tester.pumpWidget(const SizedBox());
      await _pumpApp(tester, prefs);
      expect(find.byKey(const ValueKey('nickname-prompt')), findsNothing);
    });

    testWidgets('Skip closes the prompt for good without a name', (
      tester,
    ) async {
      final prefs = await _prefs();
      await _pumpApp(tester, prefs);
      await tester.tap(find.byKey(const ValueKey('nickname-skip')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('nickname-prompt')), findsNothing);
      expect(prefs.getString('user_nickname'), isNull);
      expect(prefs.getBool('nickname_prompted'), isTrue);
    });

    testWidgets('Settings shows and edits the nickname', (tester) async {
      final prefs = await _prefs({
        'nickname_prompted': true,
        'user_nickname': 'Shira',
      });
      _phone(tester);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: testApp(const Scaffold(body: SettingsSheet())),
        ),
      );
      await tester.pump();
      Text value() => tester.widget<Text>(
        find.byKey(const ValueKey('settings-nickname-value')),
      );
      expect(value().data, 'Shira');

      await tester.tap(find.byKey(const ValueKey('settings-nickname')));
      await _advance(tester, 8);
      expect(find.text('Save'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      await tester.enterText(
        find.byKey(const ValueKey('nickname-field')),
        'Noa',
      );
      await tester.tap(find.byKey(const ValueKey('nickname-go')));
      await _advance(tester, 8);
      expect(value().data, 'Noa');
      expect(prefs.getString('user_nickname'), 'Noa');

      // Clearing it falls back to the "not set" line.
      await tester.tap(find.byKey(const ValueKey('settings-nickname')));
      await _advance(tester, 8);
      await tester.enterText(find.byKey(const ValueKey('nickname-field')), '');
      await tester.tap(find.byKey(const ValueKey('nickname-go')));
      await _advance(tester, 8);
      expect(value().data, 'Not set — tap to add one');
      expect(prefs.getString('user_nickname'), isNull);
    });
  });

  group('celebrations', () {
    testWidgets('the card greets the user by name, or generically', (
      tester,
    ) async {
      final named = await _prefs({'user_nickname': 'Shira'});
      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(named)],
          child: testApp(
            const Scaffold(body: CelebrationCard(message: 'Cube solved!')),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Way to go, Shira!'), findsOneWidget);
      expect(find.text('Cube solved!'), findsOneWidget);

      final anonymous = await _prefs();
      await tester.pumpWidget(
        ProviderScope(
          key: UniqueKey(),
          overrides: [sharedPreferencesProvider.overrideWithValue(anonymous)],
          child: testApp(
            const Scaffold(body: CelebrationCard(message: 'Cube solved!')),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Way to go!'), findsOneWidget);
    });

    testWidgets('a new speed-timer PB floats a named celebration', (
      tester,
    ) async {
      final prefs = await _prefs({
        'user_nickname': 'Shira',
        // One earlier 3x3 solve of 20 s.
        'timer_history_3':
            '[{"ms":20000,"s":"","at":${DateTime(2026, 11, 1).millisecondsSinceEpoch},"p":0}]',
      });
      var now = DateTime(2026, 11, 16, 9);
      _phone(tester);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(prefs),
            scramblerProvider.overrideWithValue(FakeScrambler()),
            clockProvider.overrideWithValue(() => now),
          ],
          child: testApp(const TimerScreen(size: 3)),
        ),
      );
      await tester.pump();
      final pad = tester.getCenter(find.byKey(const ValueKey('timer-pad')));
      final start = await tester.startGesture(pad);
      now = now.add(const Duration(milliseconds: 400));
      await tester.pump(const Duration(milliseconds: 16));
      await start.up();
      await tester.pump();
      now = now.add(const Duration(milliseconds: 9000));
      await tester.pump(const Duration(milliseconds: 16));
      final stop = await tester.startGesture(pad);
      await stop.up();
      await _advance(tester, 4);

      expect(find.byKey(const ValueKey('celebration-toast')), findsOneWidget);
      expect(find.text('Way to go, Shira!'), findsOneWidget);
      expect(find.text('New personal best!'), findsWidgets);
      await tester.pump(kCelebrationDuration);
      await _advance(tester, 4);
      expect(find.byKey(const ValueKey('celebration-toast')), findsNothing);
    });
  });

  group('speed timer', () {
    testWidgets('the daily challenge keeps its scramble notation', (
      tester,
    ) async {
      final prefs = await _prefs();
      _phone(tester);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(prefs),
            scramblerProvider.overrideWithValue(FakeScrambler()),
          ],
          child: testApp(const TimerScreen(size: 3, scramble: "R U R' U'")),
        ),
      );
      await _advance(tester, 2);
      expect(find.byKey(const ValueKey('timer-scramble')), findsOneWidget);
      expect(find.text("R U R' U'"), findsOneWidget);
      // No size picker and no "new scramble" button for a fixed scramble.
      expect(find.byKey(const ValueKey('timer-size-4')), findsNothing);
      expect(find.byKey(const ValueKey('timer-new-scramble')), findsNothing);
    });
  });

  group('fast move ratio', () {
    Future<void> pumpBadge(WidgetTester tester, int size, int moves) =>
        tester.pumpWidget(
          testApp(
            Scaffold(
              body: Center(
                child: FastMoveBadge(size: size, moves: moves),
              ),
            ),
          ),
        );

    testWidgets('shows moves against the bound for the cube size', (
      tester,
    ) async {
      expect(kFastSolveMoveLimit, {2: 11, 3: 20});
      await pumpBadge(tester, 3, 17);
      expect(find.text('17 / 20 moves'), findsOneWidget);
      expect(find.byType(Tooltip), findsOneWidget);
      await pumpBadge(tester, 2, 9);
      expect(find.text('9 / 11 moves'), findsOneWidget);
      // Past the bound (never expected): the plain count.
      await pumpBadge(tester, 3, 21);
      expect(find.text('Solved in 21 moves!'), findsOneWidget);
    });

    testWidgets('reads left to right inside Hebrew text', (tester) async {
      await tester.pumpWidget(
        testApp(
          const Scaffold(body: FastMoveBadge(size: 3, moves: 17)),
          locale: const Locale('he'),
        ),
      );
      final text = tester
          .widget<Text>(find.byKey(const ValueKey('fast-move-ratio')))
          .data!;
      // Wrapped in LRI ... PDI isolates.
      final lri = String.fromCharCode(0x2066);
      final pdi = String.fromCharCode(0x2069);
      expect(text, contains('${lri}17 / 20$pdi'));
    });
  });

  group('pattern library unlock', () {
    test('which patterns are free', () {
      // Every 2x2 and 3x3 pattern, and the first of each big cube.
      for (var i = 0; i < 6; i++) {
        expect(patternNeedsUnlock(2, i), isFalse);
        expect(patternNeedsUnlock(3, i), isFalse);
      }
      for (final size in [4, 5, 6]) {
        expect(patternNeedsUnlock(size, 0), isFalse);
        expect(patternNeedsUnlock(size, 1), isTrue);
      }
    });

    test('a rewarded video unlocks big-cube patterns for 20 minutes', () async {
      final prefs = await _prefs();
      var now = DateTime(2026, 11, 20, 8);
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          adServiceProvider.overrideWithValue(FakeAdService()),
          clockProvider.overrideWithValue(() => now),
        ],
      );
      addTearDown(c.dispose);
      final gate = c.read(rewardGateProvider.notifier);
      expect(gate.isUnlocked(RewardFeature.bigCubePatterns), isFalse);
      expect(gate.patternsTimeLeft(), isNull);

      expect(
        await gate.unlock(RewardFeature.bigCubePatterns),
        UnlockResult.rewarded,
      );
      expect(AdConfig.patternsUnlockDuration, const Duration(minutes: 20));
      expect(gate.patternsTimeLeft(), const Duration(minutes: 20));
      expect(
        prefs.getInt('reward.patternsUntil'),
        now.add(const Duration(minutes: 20)).millisecondsSinceEpoch,
      );

      now = now.add(const Duration(minutes: 19, seconds: 30));
      expect(gate.isUnlocked(RewardFeature.bigCubePatterns), isTrue);
      expect(gate.patternsTimeLeft(), const Duration(seconds: 30));
      now = now.add(const Duration(seconds: 30));
      expect(gate.isUnlocked(RewardFeature.bigCubePatterns), isFalse);
      expect(gate.patternsTimeLeft(), isNull);
    });

    test('formats the countdown as m:ss, rounding up', () {
      expect(formatUnlockTime(const Duration(minutes: 20)), '20:00');
      expect(
        formatUnlockTime(
          const Duration(minutes: 19, seconds: 41, milliseconds: 5),
        ),
        '19:42',
      );
      expect(formatUnlockTime(const Duration(milliseconds: 300)), '0:01');
    });

    testWidgets(
      'locked big-cube patterns: watch, count down, re-offer on expiry',
      (tester) async {
        final prefs = await _prefs();
        final ads = FakeAdService();
        var now = DateTime(2026, 11, 20, 8);
        _phone(tester);
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              sharedPreferencesProvider.overrideWithValue(prefs),
              cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
              clockProvider.overrideWithValue(() => now),
              adServiceProvider.overrideWithValue(ads),
            ],
            child: testApp(const PatternsScreen()),
          ),
        );
        await tester.pump();

        // 3x3: everything free, no banner.
        expect(
          find.byKey(const ValueKey('patterns-unlock-banner-3')),
          findsNothing,
        );
        expect(
          find.byKey(const ValueKey('pattern-superflip-locked')),
          findsNothing,
        );

        // 4x4: the first pattern is a free sample, the rest are locked.
        await tester.tap(find.byKey(const ValueKey('patterns-size-4')));
        await _advance(tester, 30);
        expect(
          find.byKey(const ValueKey('patterns-unlock-banner-4')),
          findsOneWidget,
        );
        expect(
          find.text(
            'Watch 1 short video to unlock all patterns for 20 minutes',
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('pattern-cubeInCube-free')),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('pattern-dots-locked')),
          findsOneWidget,
        );

        // Tapping a locked pattern offers the video instead of opening it.
        await tester.tap(find.byKey(const ValueKey('pattern-dots')));
        await _advance(tester, 8);
        expect(find.byType(Solver3DScreen), findsNothing);
        expect(
          find.byKey(const ValueKey('patterns-unlock-sheet')),
          findsOneWidget,
        );
        await tester.tap(find.byKey(const ValueKey('patterns-sheet-not-now')));
        await _advance(tester, 8);
        expect(ads.rewardedShown, 0);

        // Watching from the banner unlocks every pattern for 20 minutes.
        await tester.tap(find.byKey(const ValueKey('patterns-unlock-4')));
        await _advance(tester, 4);
        expect(ads.rewardedShown, 1);
        expect(
          find.byKey(const ValueKey('patterns-unlock-banner-4')),
          findsNothing,
        );
        expect(find.byKey(const ValueKey('pattern-dots-locked')), findsNothing);
        expect(find.text('Unlocked • 20:00 left'), findsOneWidget);

        // The pill counts down live.
        now = now.add(const Duration(minutes: 1, seconds: 18));
        await tester.pump(const Duration(seconds: 1));
        expect(find.text('Unlocked • 18:42 left'), findsOneWidget);

        // Time is up while browsing: the friendly re-offer slides up.
        now = now.add(const Duration(minutes: 19));
        await tester.pump(const Duration(seconds: 1));
        await _advance(tester, 8);
        expect(find.byKey(const ValueKey('patterns-countdown')), findsNothing);
        expect(
          find.byKey(const ValueKey('patterns-expired-sheet')),
          findsOneWidget,
        );
        expect(
          find.text(
            'Watch 1 video to keep all patterns unlocked for another 20 minutes!',
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('pattern-dots-locked')),
          findsOneWidget,
        );

        // "Watch Video" starts another 20 minutes.
        await tester.tap(find.byKey(const ValueKey('patterns-sheet-watch')));
        await _advance(tester, 8);
        expect(ads.rewardedShown, 2);
        expect(find.text('Unlocked • 20:00 left'), findsOneWidget);
        expect(find.byKey(const ValueKey('pattern-dots-locked')), findsNothing);
      },
    );
  });
}
