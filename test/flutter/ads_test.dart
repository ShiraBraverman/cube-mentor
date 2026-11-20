import 'dart:async';

import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/ads/ad_config.dart';
import 'package:cube_mentor/core/ads/ad_service.dart';
import 'package:cube_mentor/core/ads/app_banner_ad.dart';
import 'package:cube_mentor/core/ads/reward_gate.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/theme/app_theme.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/academy/academy_screen.dart';
import 'package:cube_mentor/features/academy/lesson_screen.dart';
import 'package:cube_mentor/features/home/settings_sheet.dart';
import 'package:cube_mentor/features/scanner/camera/frame_sampler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_ad_service.dart';
import 'fake_cube_solver.dart';
import 'fake_scan_analyzer.dart';
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

ProviderContainer _container(
  SharedPreferences prefs,
  AdService ads, {
  DateTime Function()? clock,
}) {
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      adServiceProvider.overrideWithValue(ads),
      if (clock != null) clockProvider.overrideWithValue(clock),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

/// The whole app with [ads], after the startup consent flow.
Future<ProviderContainer> _pumpApp(
  WidgetTester tester,
  SharedPreferences prefs,
  FakeAdService ads, {
  List<Override> overrides = const [],
}) async {
  _phone(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
        scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
        clockProvider.overrideWithValue(() => DateTime(2026, 11, 20, 8)),
        adServiceProvider.overrideWithValue(ads),
        ...overrides,
      ],
      child: const CubeMentorApp(),
    ),
  );
  final container = ProviderScope.containerOf(
    tester.element(find.byKey(const ValueKey('glass-dock'))),
  );
  await container.read(adsProvider.notifier).start();
  await _advance(tester, 4);
  return container;
}

void main() {
  group('AdConfig', () {
    test('uses Google sample IDs only (safe for development)', () {
      const publisher = 'ca-app-pub-3940256099942544';
      for (final id in [
        AdConfig.androidAppId,
        AdConfig.iosAppId,
        AdConfig.bannerUnitId,
        AdConfig.rewardedUnitId,
      ]) {
        expect(id, startsWith(publisher));
      }
      expect(AdConfig.maxBannerHeight, inInclusiveRange(50, 60));
    });

    test('the default ad service never touches the network', () async {
      final ads = ProviderContainer().read(adServiceProvider);
      expect(ads, isA<NoAdService>());
      expect(ads.supported, isFalse);
      expect(await ads.loadBanner(360), isNull);
      expect(await ads.showRewarded(), RewardOutcome.unsupported);
    });
  });

  group('AdMobRewardGate', () {
    test('an earned reward unlocks a lesson for good', () async {
      final prefs = await _prefs();
      final ads = FakeAdService();
      final c = _container(prefs, ads);
      final gate = c.read(rewardGateProvider.notifier);

      expect(gate.isUnlocked(RewardFeature.advancedLesson, item: 'oll'), false);
      final result = await gate.unlock(
        RewardFeature.advancedLesson,
        item: 'oll',
      );
      expect(result, UnlockResult.rewarded);
      expect(ads.rewardedShown, 1);
      expect(gate.isUnlocked(RewardFeature.advancedLesson, item: 'oll'), true);
      // Other lessons stay locked.
      expect(gate.isUnlocked(RewardFeature.advancedLesson, item: 'pll'), false);
      expect(prefs.getStringList('reward.lessons'), ['oll']);

      // Already unlocked: no second ad.
      expect(
        await gate.unlock(RewardFeature.advancedLesson, item: 'oll'),
        UnlockResult.alreadyUnlocked,
      );
      expect(ads.rewardedShown, 1);

      // A new launch remembers it.
      final again = _container(prefs, ads).read(rewardGateProvider.notifier);
      expect(again.isUnlocked(RewardFeature.advancedLesson, item: 'oll'), true);
    });

    test('closing the video early keeps the lesson locked', () async {
      final prefs = await _prefs();
      final ads = FakeAdService(outcome: RewardOutcome.dismissed);
      final gate = _container(prefs, ads).read(rewardGateProvider.notifier);
      final result = await gate.unlock(
        RewardFeature.advancedLesson,
        item: 'f2l',
      );
      expect(result, UnlockResult.declined);
      expect(result.granted, isFalse);
      expect(gate.isUnlocked(RewardFeature.advancedLesson, item: 'f2l'), false);
      expect(prefs.getStringList('reward.lessons'), isNull);
    });

    test('no ad available (offline) unlocks for this session only', () async {
      final prefs = await _prefs();
      final ads = FakeAdService(outcome: RewardOutcome.unavailable);
      final gate = _container(prefs, ads).read(rewardGateProvider.notifier);
      final result = await gate.unlock(
        RewardFeature.advancedLesson,
        item: 'pll',
      );
      expect(result, UnlockResult.freePass);
      expect(result.granted, isTrue);
      expect(gate.isUnlocked(RewardFeature.advancedLesson, item: 'pll'), true);
      // Not persisted: the next launch offers the ad again.
      expect(prefs.getStringList('reward.lessons'), isNull);
      final next = _container(prefs, ads).read(rewardGateProvider.notifier);
      expect(next.isUnlocked(RewardFeature.advancedLesson, item: 'pll'), false);
    });

    test('platforms without ads have everything unlocked', () async {
      final prefs = await _prefs();
      final gate = _container(
        prefs,
        const NoAdService(),
      ).read(rewardGateProvider.notifier);
      for (final feature in RewardFeature.values) {
        expect(gate.isUnlocked(feature, item: 'x'), isTrue);
      }
    });

    test('big-cube solvers unlock for 24 hours, hints for the day', () async {
      final prefs = await _prefs();
      final ads = FakeAdService();
      var now = DateTime(2026, 11, 20, 9);
      final c = _container(prefs, ads, clock: () => now);
      final gate = c.read(rewardGateProvider.notifier);

      await gate.unlock(RewardFeature.bigCubeSolver);
      await gate.unlock(RewardFeature.dailyHint);
      expect(gate.isUnlocked(RewardFeature.bigCubeSolver), isTrue);
      expect(gate.isUnlocked(RewardFeature.dailyHint), isTrue);

      now = DateTime(2026, 11, 21, 8);
      expect(gate.isUnlocked(RewardFeature.bigCubeSolver), isTrue);
      expect(gate.isUnlocked(RewardFeature.dailyHint), isFalse);

      now = DateTime(2026, 11, 21, 9, 1);
      expect(gate.isUnlocked(RewardFeature.bigCubeSolver), isFalse);
    });
  });

  group('consent', () {
    test('startup runs the consent flow once', () async {
      final prefs = await _prefs();
      final ads = FakeAdService(
        consent: const AdConsent(
          canRequestAds: true,
          privacyOptionsRequired: true,
        ),
      );
      final c = _container(prefs, ads);
      await Future.wait([
        c.read(adsProvider.notifier).start(),
        c.read(adsProvider.notifier).start(),
      ]);
      expect(ads.initializeCalls, 1);
      expect(c.read(adsProvider).canRequestAds, isTrue);
      expect(c.read(adsProvider).privacyOptionsRequired, isTrue);
    });

    Future<FakeAdService> pumpSettings(
      WidgetTester tester, {
      required bool required,
      bool fails = false,
    }) async {
      _phone(tester);
      final ads = FakeAdService(
        consent: AdConsent(
          canRequestAds: true,
          privacyOptionsRequired: required,
        ),
        privacyFails: fails,
      );
      final container = _container(await _prefs(), ads);
      await container.read(adsProvider.notifier).start();
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: testApp(const Scaffold(body: SettingsSheet())),
        ),
      );
      await _advance(tester, 2);
      return ads;
    }

    testWidgets('Settings hides Privacy & ads where it is not required', (
      tester,
    ) async {
      await pumpSettings(tester, required: false);
      expect(find.byKey(const ValueKey('settings-privacy')), findsNothing);
    });

    testWidgets('Settings reopens the privacy options form', (tester) async {
      final ads = await pumpSettings(tester, required: true);
      final row = find.byKey(const ValueKey('settings-privacy'));
      await tester.ensureVisible(row);
      expect(find.text('Privacy & ads'), findsOneWidget);
      await tester.tap(row);
      await _advance(tester, 2);
      expect(ads.privacyCalls, 1);
      expect(find.byKey(const ValueKey('privacy-options-error')), findsNothing);
    });

    testWidgets('a failing privacy form shows a message', (tester) async {
      final ads = await pumpSettings(tester, required: true, fails: true);
      final row = find.byKey(const ValueKey('settings-privacy'));
      await tester.ensureVisible(row);
      await tester.tap(row);
      await _advance(tester, 4);
      expect(ads.privacyCalls, 1);
      expect(
        find.byKey(const ValueKey('privacy-options-error')),
        findsOneWidget,
      );
    });
  });

  group('banner', () {
    testWidgets('shows between the page and the dock, hidden on Scan', (
      tester,
    ) async {
      final ads = FakeAdService();
      await _pumpApp(tester, await _prefs(), ads);
      final banner = find.byKey(const ValueKey('fake-banner'));
      expect(banner, findsOneWidget);
      final dock = tester.getRect(find.byKey(const ValueKey('glass-dock')));
      final slot = tester.getRect(banner);
      expect(slot.height, 50);
      // Directly above the dock, never overlapping it.
      expect(slot.bottom, lessThanOrEqualTo(dock.top));

      await tester.tap(find.byKey(const ValueKey('tab-scan')));
      await _advance(tester, 4);
      expect(banner, findsNothing);

      await tester.tap(find.byKey(const ValueKey('tab-solve')));
      await _advance(tester, 4);
      expect(banner, findsOneWidget);
      // Re-shown without loading a new ad.
      expect(ads.bannersLoaded, 1);
    });

    testWidgets('no fill (offline) leaves no empty box', (tester) async {
      final ads = FakeAdService(bannerHeight: null);
      await _pumpApp(tester, await _prefs(), ads);
      expect(find.byKey(const ValueKey('app-banner-ad')), findsNothing);
      expect(find.byKey(const ValueKey('fake-banner')), findsNothing);
    });

    testWidgets('no banner without ad consent', (tester) async {
      final ads = FakeAdService(consent: const AdConsent());
      await _pumpApp(tester, await _prefs(), ads);
      expect(ads.bannersLoaded, 0);
      expect(find.byKey(const ValueKey('fake-banner')), findsNothing);
    });

    testWidgets('a hidden banner keeps its ad and takes no space', (
      tester,
    ) async {
      final ads = FakeAdService();
      Widget host(bool visible) => ProviderScope(
        overrides: adsOnOverrides(ads),
        child: testApp(
          Scaffold(
            body: Column(
              children: [
                const Expanded(child: SizedBox.expand(key: ValueKey('page'))),
                AppBannerAd(visible: visible),
              ],
            ),
          ),
        ),
      );
      await tester.pumpWidget(host(true));
      await _advance(tester, 2);
      final full = tester.getSize(find.byKey(const ValueKey('page'))).height;
      expect(find.byKey(const ValueKey('fake-banner')), findsOneWidget);

      await tester.pumpWidget(host(false));
      await tester.pump();
      expect(find.byKey(const ValueKey('fake-banner')), findsNothing);
      expect(
        tester.getSize(find.byKey(const ValueKey('page'))).height,
        full + 50,
      );
      expect(ads.bannersLoaded, 1);
      expect(ads.banners.single.disposed, isFalse);

      await tester.pumpWidget(const SizedBox());
      expect(ads.banners.single.disposed, isTrue);
    });
  });

  group('Academy rewarded lessons', () {
    Future<FakeAdService> pumpAcademy(
      WidgetTester tester,
      FakeAdService ads,
    ) async {
      _phone(tester);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(await _prefs()),
            cubeSolverProvider.overrideWithValue(FakeCubeSolver()),
            ...adsOnOverrides(ads),
          ],
          child: testApp(const AcademyScreen()),
        ),
      );
      await _advance(tester, 2);
      return ads;
    }

    Future<void> reveal(WidgetTester tester, Finder target) async {
      // The lesson list is lazy: scroll until the row is built.
      await tester.scrollUntilVisible(
        target,
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pump();
    }

    Future<void> tapLesson(WidgetTester tester, String id) async {
      final tile = find.byKey(ValueKey('lesson-$id'));
      await reveal(tester, tile);
      await tester.tap(tile);
      await _advance(tester, 8);
    }

    testWidgets('advanced lessons carry a "Watch ad" badge', (tester) async {
      await pumpAcademy(tester, FakeAdService());
      final badge = find.byKey(const ValueKey('lesson-oll-ad-badge'));
      await reveal(tester, badge);
      expect(badge, findsOneWidget);
      expect(find.text('Watch ad'), findsWidgets);
      // Beginner lessons are free.
      expect(
        find.byKey(
          const ValueKey('lesson-cross-ad-badge'),
          skipOffstage: false,
        ),
        findsNothing,
      );
    });

    testWidgets('watching the ad opens the lesson and drops the badge', (
      tester,
    ) async {
      final ads = await pumpAcademy(tester, FakeAdService());
      await tapLesson(tester, 'oll');
      expect(ads.rewardedShown, 1);
      expect(find.byType(LessonScreen), findsOneWidget);

      await tester.pageBack();
      await _advance(tester, 8);
      expect(
        find.byKey(const ValueKey('lesson-oll-ad-badge'), skipOffstage: false),
        findsNothing,
      );
    });

    testWidgets('closing the ad early stays on the Academy', (tester) async {
      final ads = await pumpAcademy(
        tester,
        FakeAdService(outcome: RewardOutcome.dismissed),
      );
      await tapLesson(tester, 'pll');
      expect(ads.rewardedShown, 1);
      expect(find.byType(LessonScreen), findsNothing);
      expect(find.byKey(const ValueKey('reward-declined')), findsOneWidget);
    });

    testWidgets('a slow ad shows a loading dialog; offline unlocks free', (
      tester,
    ) async {
      final ads = FakeAdService(rewardedReady: false)
        ..pendingReward = Completer<RewardOutcome>();
      await pumpAcademy(tester, ads);
      await tapLesson(tester, 'f2l');
      expect(find.byKey(const ValueKey('reward-loading')), findsOneWidget);

      ads.pendingReward!.complete(RewardOutcome.unavailable);
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('reward-loading')), findsNothing);
      expect(find.byType(LessonScreen), findsOneWidget);
      // Shown on both scaffolds while the lesson route slides in.
      expect(find.byKey(const ValueKey('reward-free-pass')), findsWidgets);
    });
  });

  group('Android 16 readiness', () {
    test('scan sampling follows the device rotation on large screens', () {
      // Phones: portrait, the sensor's own rotation.
      expect(sensorToDisplayRotation(90, DeviceOrientation.portraitUp), 90);
      // Tablets in landscape need a quarter turn less (or more).
      expect(sensorToDisplayRotation(90, DeviceOrientation.landscapeLeft), 0);
      expect(
        sensorToDisplayRotation(90, DeviceOrientation.landscapeRight),
        180,
      );
      expect(sensorToDisplayRotation(270, DeviceOrientation.portraitDown), 90);
    });

    test('tall scripts get roomier line heights', () {
      for (final code in ['he', 'ar', 'bn', 'hi']) {
        final theme = AppTheme.dark(languageCode: code).textTheme;
        for (final style in [
          theme.headlineLarge,
          theme.titleLarge,
          theme.titleMedium,
          theme.bodySmall,
          theme.labelMedium,
        ]) {
          expect(
            style!.height,
            greaterThanOrEqualTo(AppTheme.tallScriptMinHeight),
            reason: code,
          );
          expect(style.leadingDistribution, TextLeadingDistribution.even);
        }
      }
      // Latin keeps its tighter headline rhythm.
      expect(
        AppTheme.dark(languageCode: 'en').textTheme.headlineLarge!.height,
        1.15,
      );
    });
  });
}
