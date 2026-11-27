import 'dart:async';
import 'dart:io';

import 'package:cube_mentor/app.dart';
import 'package:cube_mentor/core/ads/ad_config.dart';
import 'package:cube_mentor/core/ads/ad_service.dart';
import 'package:cube_mentor/core/ads/app_banner_ad.dart';
import 'package:cube_mentor/core/ads/interstitial_pacer.dart';
import 'package:cube_mentor/core/ads/reward_gate.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/cube_move.dart';
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
  SharedPreferences.setMockInitialValues({'onboarding_done': true, ...values});
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
      adsTestingBypassProvider.overrideWithValue(false),
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
        adsTestingBypassProvider.overrideWithValue(false),
        ...overrides,
      ],
      child: const CubeMentorApp(),
    ),
  );
  final container = ProviderScope.containerOf(
    tester.element(find.byKey(const ValueKey('root-shell'))),
  );
  await container.read(adsProvider.notifier).start();
  await _advance(tester, 4);
  return container;
}

void main() {
  group('AdConfig', () {
    test('debug builds request Google sample ad units only', () {
      const sample = 'ca-app-pub-3940256099942544';
      expect(AdConfig.useTestAdUnits, isTrue);
      for (final id in [
        AdConfig.iosAppId,
        AdConfig.bannerUnitId,
        AdConfig.rewardedUnitId,
        AdConfig.interstitialUnitId,
      ]) {
        expect(id, startsWith(sample));
      }
      expect(AdConfig.maxBannerHeight, inInclusiveRange(50, 60));
    });

    test('Android production IDs belong to the CubeMentor publisher', () {
      const publisher = 'ca-app-pub-7616557370268924';
      expect(AdConfig.androidAppId, startsWith('$publisher~'));
      for (final id in [
        AdConfig.androidBannerProduction,
        AdConfig.androidInterstitialProduction,
        AdConfig.androidRewardedProduction,
      ]) {
        expect(id, startsWith('$publisher/'));
      }
      final manifest = File('android/app/src/main/AndroidManifest.xml')
          .readAsStringSync();
      expect(manifest, contains(AdConfig.androidAppId));
    });

    test('the default ad service never touches the network', () async {
      final ads = ProviderContainer().read(adServiceProvider);
      expect(ads, isA<NoAdService>());
      expect(ads.supported, isFalse);
      expect(await ads.loadBanner(360), isNull);
      expect(await ads.showRewarded(), RewardOutcome.unsupported);
      expect(await ads.showInterstitial(), isFalse);
    });
  });

  group('ad-free testing switch', () {
    ProviderContainer bypassed(SharedPreferences prefs, FakeAdService ads) {
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          adServiceProvider.overrideWithValue(ads),
          adsTestingBypassProvider.overrideWithValue(true),
        ],
      );
      addTearDown(c.dispose);
      return c;
    }

    test('defaults to the kDisableAdsForTesting flag', () {
      final c = ProviderContainer();
      addTearDown(c.dispose);
      expect(c.read(adsTestingBypassProvider), kDisableAdsForTesting);
    });

    test('opens every rewarded lock without a video', () async {
      final ads = FakeAdService();
      final c = bypassed(await _prefs(), ads);
      final gate = c.read(rewardGateProvider.notifier);
      for (final feature in RewardFeature.values) {
        expect(gate.isUnlocked(feature, item: 'oll'), isTrue);
        expect(gate.timeLeft(feature, item: 'oll'), isNull);
        expect(
          await gate.unlock(feature, item: 'oll'),
          UnlockResult.alreadyUnlocked,
        );
      }
      expect(ads.rewardedShown, 0);
    });

    test('skips interstitials and the consent flow', () async {
      final ads = FakeAdService();
      final c = bypassed(await _prefs(), ads);
      final pacer = c.read(interstitialPacerProvider.notifier);
      for (var i = 0; i < AdConfig.solvesPerInterstitial * 2; i++) {
        await pacer.recordSolve();
      }
      expect(await pacer.maybeShow(), isFalse);
      expect(ads.interstitialsShown, 0);
      await c.read(adsProvider.notifier).start();
      expect(ads.initializeCalls, 0);
    });

    testWidgets('hides the banner', (tester) async {
      final ads = FakeAdService();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            adServiceProvider.overrideWithValue(ads),
            adsProvider.overrideWith(
              () => PresetAdsController(const AdConsent(canRequestAds: true)),
            ),
            adsTestingBypassProvider.overrideWithValue(true),
          ],
          child: testApp(const Scaffold(body: AppBannerAd())),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const ValueKey('fake-banner')), findsNothing);
      expect(ads.bannersLoaded, 0);
    });
  });

  group('AdMobRewardGate', () {
    test('an earned reward unlocks one lesson for 24 hours', () async {
      final prefs = await _prefs();
      final ads = FakeAdService();
      var now = DateTime(2026, 11, 20, 9);
      final c = _container(prefs, ads, clock: () => now);
      final gate = c.read(rewardGateProvider.notifier);

      expect(gate.isUnlocked(RewardFeature.lesson, item: 'oll'), false);
      final result = await gate.unlock(RewardFeature.lesson, item: 'oll');
      expect(result, UnlockResult.rewarded);
      expect(ads.rewardedShown, 1);
      expect(gate.isUnlocked(RewardFeature.lesson, item: 'oll'), true);
      expect(
        gate.timeLeft(RewardFeature.lesson, item: 'oll'),
        const Duration(hours: 24),
      );
      // Other lessons stay locked.
      expect(gate.isUnlocked(RewardFeature.lesson, item: 'pll'), false);

      // Already unlocked: no second ad.
      expect(
        await gate.unlock(RewardFeature.lesson, item: 'oll'),
        UnlockResult.alreadyUnlocked,
      );
      expect(ads.rewardedShown, 1);

      // A new launch remembers it, until the 24 hours are up.
      final again = _container(
        prefs,
        ads,
        clock: () => now,
      ).read(rewardGateProvider.notifier);
      now = DateTime(2026, 11, 21, 8, 59);
      expect(again.isUnlocked(RewardFeature.lesson, item: 'oll'), true);
      expect(
        again.timeLeft(RewardFeature.lesson, item: 'oll'),
        const Duration(minutes: 1),
      );
      now = DateTime(2026, 11, 21, 9);
      expect(again.isUnlocked(RewardFeature.lesson, item: 'oll'), false);
      expect(again.timeLeft(RewardFeature.lesson, item: 'oll'), isNull);
    });

    test('patterns unlock one by one, per size', () async {
      final prefs = await _prefs();
      final ads = FakeAdService();
      final gate = _container(prefs, ads).read(rewardGateProvider.notifier);
      final item = patternItem(4, 'cubeInCube');
      await gate.unlock(RewardFeature.pattern, item: item);
      expect(gate.isUnlocked(RewardFeature.pattern, item: item), isTrue);
      expect(
        gate.isUnlocked(
          RewardFeature.pattern,
          item: patternItem(3, 'cubeInCube'),
        ),
        isFalse,
      );
      // A lesson with the same id is a different item.
      expect(gate.isUnlocked(RewardFeature.lesson, item: item), isFalse);
    });

    test('lessons unlocked for good by older versions stay open', () async {
      final prefs = await _prefs({
        'reward.lessons': ['oll'],
      });
      final gate = _container(
        prefs,
        FakeAdService(),
      ).read(rewardGateProvider.notifier);
      expect(gate.isUnlocked(RewardFeature.lesson, item: 'oll'), isTrue);
      expect(gate.isUnlocked(RewardFeature.lesson, item: 'pll'), isFalse);
    });

    test('closing the video early keeps the lesson locked', () async {
      final prefs = await _prefs();
      final ads = FakeAdService(outcome: RewardOutcome.dismissed);
      final gate = _container(prefs, ads).read(rewardGateProvider.notifier);
      final result = await gate.unlock(RewardFeature.lesson, item: 'f2l');
      expect(result, UnlockResult.declined);
      expect(result.granted, isFalse);
      expect(gate.isUnlocked(RewardFeature.lesson, item: 'f2l'), false);
      expect(prefs.getStringList('reward.itemsUntil'), isNull);
    });

    test('no ad available (offline) unlocks for this session only', () async {
      final prefs = await _prefs();
      final ads = FakeAdService(outcome: RewardOutcome.unavailable);
      final gate = _container(prefs, ads).read(rewardGateProvider.notifier);
      final result = await gate.unlock(RewardFeature.lesson, item: 'pll');
      expect(result, UnlockResult.freePass);
      expect(result.granted, isTrue);
      expect(gate.isUnlocked(RewardFeature.lesson, item: 'pll'), true);
      // Not persisted: the next launch offers the ad again.
      expect(prefs.getStringList('reward.itemsUntil'), isNull);
      final next = _container(prefs, ads).read(rewardGateProvider.notifier);
      expect(next.isUnlocked(RewardFeature.lesson, item: 'pll'), false);
    });

    test('the first big-cube solve is free, once', () async {
      final prefs = await _prefs();
      final gate = _container(
        prefs,
        FakeAdService(),
      ).read(rewardGateProvider.notifier);
      expect(await gate.takeFreeBigCubeSolve(), isTrue);
      expect(await gate.takeFreeBigCubeSolve(), isFalse);
      final next = _container(
        prefs,
        FakeAdService(),
      ).read(rewardGateProvider.notifier);
      expect(await next.takeFreeBigCubeSolve(), isFalse);
    });

    test('an interstitial at most once every 3 finished solves', () async {
      final prefs = await _prefs();
      final ads = FakeAdService();
      final c = _container(prefs, ads);
      final pacer = c.read(interstitialPacerProvider.notifier);
      for (var solve = 1; solve <= 2; solve++) {
        await pacer.recordSolve();
        expect(await pacer.maybeShow(), isFalse);
      }
      await pacer.recordSolve();
      // No ad ready: the count is kept for the next exit.
      ads.interstitialReady = false;
      expect(await pacer.maybeShow(), isFalse);
      ads.interstitialReady = true;
      expect(await pacer.maybeShow(), isTrue);
      expect(ads.interstitialsShown, 1);
      // Counting starts over.
      expect(await pacer.maybeShow(), isFalse);
      expect(prefs.getInt('ads.solvesSinceInterstitial'), 0);
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
    testWidgets('shows below the home cards, never over them', (tester) async {
      final ads = FakeAdService();
      await _pumpApp(tester, await _prefs(), ads);
      final banner = find.byKey(const ValueKey('fake-banner'));
      expect(banner, findsOneWidget);
      final slot = tester.getRect(banner);
      expect(slot.height, 50);
      final card = tester.getRect(find.byKey(const ValueKey('home-practice')));
      expect(card.bottom, lessThanOrEqualTo(slot.top));
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

    /// Taps a locked lesson and chooses "Watch Video" in the unlock sheet.
    Future<void> tapLesson(WidgetTester tester, String id) async {
      final tile = find.byKey(ValueKey('lesson-$id'));
      await reveal(tester, tile);
      await tester.tap(tile);
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('reward-unlock-sheet')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('reward-sheet-watch')));
      await _advance(tester, 8);
    }

    testWidgets('only the first two lessons are open', (tester) async {
      await pumpAcademy(tester, FakeAdService());
      // The first two lessons: a green open padlock, no ad badge.
      for (final id in ['basics', 'cross']) {
        await reveal(tester, find.byKey(ValueKey('lesson-$id')));
        expect(
          find.byKey(ValueKey('lesson-$id-open'), skipOffstage: false),
          findsOneWidget,
        );
        expect(
          find.byKey(ValueKey('lesson-$id-ad-badge'), skipOffstage: false),
          findsNothing,
        );
      }
      // Every later lesson, beginner or advanced, is locked.
      for (final id in ['corners', 'oll']) {
        final badge = find.byKey(ValueKey('lesson-$id-ad-badge'));
        await reveal(tester, badge);
        expect(badge, findsOneWidget);
      }
      expect(find.text('Watch ad'), findsWidgets);
      expect(find.text('Free'), findsNothing);
    });

    testWidgets('"Not Now" in the unlock sheet shows no ad', (tester) async {
      final ads = await pumpAcademy(tester, FakeAdService());
      final tile = find.byKey(const ValueKey('lesson-corners'));
      await reveal(tester, tile);
      await tester.tap(tile);
      await _advance(tester, 8);
      await tester.tap(find.byKey(const ValueKey('reward-sheet-not-now')));
      await _advance(tester, 8);
      expect(ads.rewardedShown, 0);
      expect(find.byType(LessonScreen), findsNothing);
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
      // Open for 24 hours, with the time left.
      expect(find.text('24 hours left', skipOffstage: false), findsOneWidget);
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

  group('big-cube solves', () {
    testWidgets('the first 4x4 solve is free, then a video unlocks 24 h', (
      tester,
    ) async {
      _phone(tester);
      final ads = FakeAdService();
      final solver = FakeCubeSolver(
        bigCubes: true,
        plan: const SolvePlan(
          method: 'reduction',
          steps: [
            SolveStep(
              cubeState: '',
              phaseName: 'centers',
              moveNotation: 'R',
              explanationKey: 'centers',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(await _prefs()),
            cubeSolverProvider.overrideWithValue(solver),
            ...adsOnOverrides(ads),
          ],
          child: testApp(
            Solver3DScreen(
              size: 4,
              initialCube: CubeState.solved(4)
                  .applyAll(MoveNotation.parseSequence("R U R' U'", 4)),
            ),
          ),
        ),
      );
      await _advance(tester, 4);

      // Free solve: no sheet, no ad.
      await tester.tap(find.byKey(const ValueKey('solve')));
      await _advance(tester, 8);
      expect(solver.calls, hasLength(1));
      expect(find.byKey(const ValueKey('reward-unlock-sheet')), findsNothing);
      expect(ads.rewardedShown, 0);

      // Back to free play on a scrambled cube; the next solve asks first.
      await tester.tap(find.byKey(const ValueKey('guide-exit')));
      await _advance(tester, 8);
      await tester.tap(find.byKey(const ValueKey('solve')));
      await _advance(tester, 8);
      expect(find.byKey(const ValueKey('reward-unlock-sheet')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('reward-sheet-not-now')));
      await _advance(tester, 8);
      expect(solver.calls, hasLength(1));

      await tester.tap(find.byKey(const ValueKey('solve')));
      await _advance(tester, 8);
      await tester.tap(find.byKey(const ValueKey('reward-sheet-watch')));
      await _advance(tester, 8);
      expect(ads.rewardedShown, 1);
      expect(solver.calls, hasLength(2));
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
      for (final code in ['he', 'ar', 'bn', 'hi', 'vi', 'my']) {
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
