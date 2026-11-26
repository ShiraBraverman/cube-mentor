// Renders every key CubeMentor screen to a PNG in docs/screens/ for the
// UX screen map (docs/ux_screen_map.html).
//
// Skipped in normal test runs. Regenerate the screenshots with:
//
//   flutter test test/screenshots/ux_screen_map_test.dart --update-goldens
//
// Screens are rendered at 360 x 780 dp (a Galaxy A16-class phone) at 2x,
// with the bundled Roboto + Material Icons fonts so text is readable, and
// with fakes for the native solver, ads, scrambler and clock so every shot
// is deterministic. The camera preview has no plugin in tests, so the
// scanner's capture shot draws a simulated cube under the real grid overlay.
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:cube_mentor/core/ads/ad_service.dart';
import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/scramble/scrambler.dart';
import 'package:cube_mentor/core/settings/clock.dart';
import 'package:cube_mentor/core/settings/preferences.dart';
import 'package:cube_mentor/core/solver/cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/core/vision/color_science.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:cube_mentor/features/academy/academy_screen.dart';
import 'package:cube_mentor/features/academy/lesson_screen.dart';
import 'package:cube_mentor/features/academy/model/lesson_catalog.dart';
import 'package:cube_mentor/features/daily/daily_screen.dart';
import 'package:cube_mentor/core/theme/glass.dart';
import 'package:cube_mentor/features/home/onboarding_screen.dart';
import 'package:cube_mentor/features/home/privacy_policy_screen.dart';
import 'package:cube_mentor/features/home/root_shell.dart';
import 'package:cube_mentor/features/patterns/patterns.dart';
import 'package:cube_mentor/features/patterns/patterns_screen.dart';
import 'package:cube_mentor/features/scanner/camera/camera_scan_view.dart';
import 'package:cube_mentor/features/scanner/model/scan_session.dart';
import 'package:cube_mentor/features/scanner/scanner_screen.dart';
import 'package:cube_mentor/features/scanner/widgets/scan_layout.dart';
import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:cube_mentor/features/solver_3d/model/guide_script.dart';
import 'package:cube_mentor/features/solver_3d/solver_3d_screen.dart';
import 'package:cube_mentor/features/timer/timer_screen.dart';
import 'package:cube_mentor/features/train/train_screen.dart';
import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter/fake_ad_service.dart';
import '../flutter/fake_cube_solver.dart';
import '../flutter/fake_scan_analyzer.dart';
import '../flutter/fake_scrambler.dart';
import '../flutter/scanner_test.dart' show faceSamples, scrambledFacelets;
import '../flutter/test_app.dart' show testApp;

const _shotKey = ValueKey('ux-shot');

/// Output folder, relative to the package root (the test's working
/// directory).
const _out = 'docs/screens';

Future<void> _loadFonts() async {
  final root =
      Platform.environment['FLUTTER_ROOT'] ??
      File(Platform.resolvedExecutable).parent.parent.parent.parent.parent.path;
  final fonts = '$root/bin/cache/artifacts/material_fonts';
  Future<void> load(String family, List<String> files) async {
    final loader = FontLoader(family);
    for (final f in files) {
      final bytes = File('$fonts/$f').readAsBytesSync();
      loader.addFont(Future.value(ByteData.sublistView(bytes)));
    }
    await loader.load();
  }

  await load('Roboto', [
    'roboto-thin.ttf',
    'roboto-light.ttf',
    'roboto-regular.ttf',
    'roboto-medium.ttf',
    'roboto-bold.ttf',
    'roboto-black.ttf',
  ]);
  await load('MaterialIcons', ['materialicons-regular.otf']);
  // Native language names (Hebrew, Arabic, Hindi, CJK, Burmese...) on the
  // language sheet: Windows script fonts, when present, as fallbacks.
  for (final (family, file) in [
    ('FallbackUnicode', 'ARIALUNI.TTF'),
    ('FallbackMyanmar', 'mmrtext.ttf'),
  ]) {
    final font = File(
      '${Platform.environment['WINDIR'] ?? r'C:\Windows'}/Fonts/$file',
    );
    if (font.existsSync()) {
      final loader = FontLoader(family)
        ..addFont(Future.value(ByteData.sublistView(font.readAsBytesSync())));
      await loader.load();
    }
  }
}

/// A banner placeholder that reads as an ad slot in the screenshots.
class _ShotAdService extends FakeAdService {
  @override
  Future<BannerSlot?> loadBanner(int width) async => _ShotBanner();
}

class _ShotBanner implements BannerSlot {
  @override
  double get height => 50;

  @override
  Widget build() => Container(
    color: const Color(0xFF151A26),
    alignment: Alignment.center,
    child: const Text(
      'AdMob adaptive banner',
      style: TextStyle(color: Color(0xFF6B7489), fontSize: 12),
    ),
  );

  @override
  void dispose() {}
}

/// A guided (3 crowns) plan: a daisy petal (a double turn), lining it up
/// and dropping it onto the white center.
final _guidedSolver = FakeCubeSolver(
  plan: const SolvePlan(
    method: 'lbl',
    steps: [
      SolveStep(
        cubeState: '',
        phaseName: 'lblCross',
        moveNotation: 'R2',
        explanationKey: 'lblDaisyPetal',
        pieceColors: 'WR',
        crown: 1,
        subStep: 1,
      ),
      SolveStep(
        cubeState: '',
        phaseName: 'lblCross',
        moveNotation: "U'",
        explanationKey: 'lblDaisyAlign',
        pieceColors: 'WB',
        crown: 1,
        subStep: 1,
      ),
      SolveStep(
        cubeState: '',
        phaseName: 'lblCross',
        moveNotation: 'F2',
        explanationKey: 'lblDaisyDrop',
        pieceColors: 'WB',
        crown: 1,
        subStep: 1,
      ),
      SolveStep(
        cubeState: '',
        phaseName: 'lblCorners',
        moveNotation: 'R',
        explanationKey: 'lblCornerInsert',
        pieceColors: 'WRB',
        crown: 1,
        subStep: 2,
      ),
    ],
  ),
);

/// A Fast (Kociemba) 3x3 solution of 17 moves that opens on a half turn,
/// so the shot shows the live "Move 1 / 17" counter and the ×2 label on
/// the 3D arrow. Guided requests still get the 3 crowns plan.
class _FastOrGuidedSolver extends FakeCubeSolver {
  _FastOrGuidedSolver() : super(plan: _guidedSolver.plan);

  static const _moves = [
    'R2',
    "U'",
    'F',
    'L2',
    'D',
    "B'",
    'R',
    'U2',
    "F'",
    'D2',
    'L',
    "U'",
    'R2',
    'F2',
    'U',
    'B2',
    "D'",
  ];

  @override
  Future<SolvePlan> solve(CubeState cube, SolveMethod method) async {
    if (method != SolveMethod.fast) return super.solve(cube, method);
    calls.add(method);
    return SolvePlan(
      method: 'kociemba',
      steps: [
        for (final move in _moves)
          SolveStep(
            cubeState: '',
            phaseName: 'kociembaPhase2',
            moveNotation: move,
            explanationKey: 'kociembaPhase2Explain',
          ),
      ],
    );
  }
}

Future<void> _advance(WidgetTester tester, [int frames = 12]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

late SharedPreferences _prefs;

/// Pumps [screen] in a fresh app on a 360 x 780 dp phone.
Future<void> _show(
  WidgetTester tester,
  Widget screen, {
  CubeSolver? solver,
  bool root = false,
}) async {
  tester.view.physicalSize = const Size(720, 1560);
  tester.view.devicePixelRatio = 2;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    RepaintBoundary(
      key: _shotKey,
      child: ProviderScope(
        key: UniqueKey(),
        overrides: [
          sharedPreferencesProvider.overrideWithValue(_prefs),
          scramblerProvider.overrideWithValue(FakeScrambler()),
          cubeSolverProvider.overrideWithValue(solver ?? _guidedSolver),
          clockProvider.overrideWithValue(() => DateTime.utc(2026, 11, 24, 9)),
          scanAnalyzerProvider.overrideWithValue(FakeScanAnalyzer()),
          ...adsOnOverrides(_ShotAdService()),
        ],
        child: _app(screen, root: root),
      ),
    ),
  );
  await _advance(tester, 16);
}

/// [testApp] with script fallbacks for the native language names. Unless
/// [root], [home] is pushed over a blank first route, as every screen but
/// the home screen is in the app, so its back arrow shows.
Widget _app(Widget home, {bool root = false}) {
  final app = testApp(home) as MaterialApp;
  final theme = app.theme!;
  const fallback = ['FallbackUnicode', 'FallbackMyanmar'];
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: theme.copyWith(
      textTheme: theme.textTheme.apply(fontFamilyFallback: fallback),
      primaryTextTheme: theme.primaryTextTheme.apply(
        fontFamilyFallback: fallback,
      ),
    ),
    locale: app.locale,
    supportedLocales: app.supportedLocales,
    localizationsDelegates: app.localizationsDelegates,
    initialRoute: '/screen',
    onGenerateRoute: (_) => MaterialPageRoute<void>(builder: (_) => home),
    onGenerateInitialRoutes: (_) => [
      if (!root) MaterialPageRoute<void>(builder: (_) => const Scaffold()),
      MaterialPageRoute<void>(builder: (_) => home),
    ],
  );
}

/// Writes the app at 2x (720 x 1560 px) so text stays crisp when the
/// board shows a screen full size.
Future<void> _snap(WidgetTester tester, String name) async {
  final boundary = tester.renderObject<RenderRepaintBoundary>(
    find.byKey(_shotKey),
  );
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 2);
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    File('$_out/$name.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(png!.buffer.asUint8List());
  });
}

Future<void> _tap(WidgetTester tester, String key, [int frames = 12]) async {
  final finder = find.byKey(ValueKey(key));
  await tester.ensureVisible(finder.first);
  await tester.pump();
  await tester.tap(finder.first);
  await _advance(tester, frames);
}

void main() {
  // Only when asked to write screenshots (--update-goldens).
  final skip = !autoUpdateGoldenFiles;

  setUpAll(() async {
    if (!skip) await _loadFonts();
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'app_locale': 'en',
      'user_nickname': 'Shira',
      // A running streak looks like real use.
      'daily_streak': 6,
      'daily_last_day': '2026-11-23',
      'daily_best_streak': 11,
    });
    _prefs = await SharedPreferences.getInstance();
  });

  void shot(String name, Future<void> Function(WidgetTester) body) =>
      testWidgets(name, (tester) async {
        await body(tester);
        await _snap(tester, name);
      }, skip: skip);

  // Home and its two sheets.
  shot('01_home', (t) => _show(t, const RootShell(), root: true));
  shot('02_scan_solve_sheet', (t) async {
    await _show(t, const RootShell(), root: true);
    await _tap(t, 'home-scan-solve');
  });
  shot('03_settings', (t) async {
    await _show(t, const RootShell(), root: true);
    await _tap(t, 'settings-button');
  });
  shot('04_language', (t) async {
    await _show(t, const RootShell(), root: true);
    await _tap(t, 'language-button');
  });

  // Scan & Solve.
  shot('05_scanner_camera', (t) => _show(t, const _SimulatedCameraScan()));
  // Without a camera the scanner opens straight on manual entry.
  shot(
    '06_scanner_manual',
    (t) => _show(t, const ScannerScreen(size: 3, cameraOverride: false)),
  );
  shot('07_scanner_review', (t) async {
    await _show(t, const ScannerScreen(size: 3, cameraOverride: false));
    final scope = ProviderScope.containerOf(
      t.element(find.byType(ScannerScreen)),
    );
    final scan = scope.read(scanSessionProvider(3).notifier)..restart();
    final truth = scrambledFacelets(3, 6);
    for (var i = 0; i < 6; i++) {
      scan.capture(
        faceSamples(truth, 3, scope.read(scanSessionProvider(3)).face),
      );
    }
    await _advance(t, 30);
  });
  final scrambled = CubeState.solved(3)
      .applyAll(MoveNotation.parseSequence("R2 U F' L D2 B R' U2 F", 3));
  shot('08_solver_goal', (t) async {
    await _show(
      t,
      Solver3DScreen(
        size: 3,
        initialCube: scrambled,
        autoSolve: SolveMethod.layerByLayer,
      ),
    );
    await _advance(t, 20);
  });
  shot('09_solver_step_x2', (t) async {
    await _show(
      t,
      Solver3DScreen(
        size: 3,
        initialCube: scrambled,
        autoSolve: SolveMethod.layerByLayer,
      ),
    );
    await _advance(t, 20);
    if (find.byKey(const ValueKey('intro-start')).evaluate().isNotEmpty) {
      await _tap(t, 'intro-start', 20);
    }
  });
  // The post-scan primary button: the clean Fast Solve card.
  shot('23_solver_fast', (t) async {
    await _show(
      t,
      Solver3DScreen(
        size: 3,
        initialCube: scrambled,
        autoSolve: SolveMethod.fast,
      ),
      solver: _FastOrGuidedSolver(),
    );
    await _advance(t, 20);
  });
  // 4x4-6x6 solving after the free first solve: a 24 h rewarded unlock.
  shot('24_bigcube_unlock', (t) async {
    await _prefs.setBool('reward.bigCubeFreeUsed', true);
    await _show(
      t,
      Solver3DScreen(
        size: 4,
        initialCube: CubeState.solved(4)
            .applyAll(MoveNotation.parseSequence("R U Rw' F2 2U", 4)),
      ),
      solver: FakeCubeSolver(plan: _guidedSolver.plan, bigCubes: true),
    );
    await _tap(t, 'solve', 16);
  });
  shot('10_playground', (t) async {
    await _show(
      t,
      Solver3DScreen(
        size: 3,
        initialCube: CubeState.solved(3)
            .applyAll(MoveNotation.parseSequence("R U R' U'", 3)),
      ),
    );
  });

  // Academy.
  shot('11_academy', (t) => _show(t, const AcademyScreen(initialSize: 3)));
  final lesson = kLessons.firstWhere((l) => l.id == 'cross');
  shot('12_lesson_goal', (t) => _show(t, LessonScreen(lesson: lesson)));
  shot('13_lesson_part', (t) async {
    await _show(t, LessonScreen(lesson: lesson));
    await _tap(t, 'intro-start');
    await _tap(t, 'lesson-next', 20);
  });
  shot('14_lesson_complete', (t) async {
    await _show(t, LessonScreen(lesson: lesson));
    await _tap(t, 'intro-start');
    for (var i = 0; i < 80; i++) {
      if (find.byKey(const ValueKey('lesson-complete')).evaluate().isNotEmpty) {
        break;
      }
      await _tap(t, 'lesson-next', 14);
    }
    await _advance(t, 20);
  });
  // 6x6 parity, stage 1: all 4 wings flipped vs only the 2 inner wings.
  shot('32_lesson_six_wing_rule', (t) async {
    await _show(
      t,
      LessonScreen(lesson: kLessons.firstWhere((l) => l.id == 'sixParity')),
    );
    await _tap(t, 'intro-start', 20);
  });
  // Stage 3: walkthroughs of the whole step, ending on a bonus case.
  shot('25_lesson_walkthrough', (t) async {
    await _show(t, LessonScreen(lesson: lesson));
    await _tap(t, 'intro-start');
    await _tap(t, 'lesson-stage-2', 20);
    for (var i = 0; i < 80; i++) {
      if (find.byKey(const ValueKey('lesson-bonus')).evaluate().isNotEmpty) {
        break;
      }
      await _tap(t, 'lesson-next', 14);
    }
    await _advance(t, 20);
  });
  shot('15_lesson_unlock', (t) async {
    await _show(t, const AcademyScreen(initialSize: 3));
    final locked = find.byKey(const ValueKey('lesson-yellowCorners'));
    await t.scrollUntilVisible(
      locked,
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await t.pump();
    await t.tap(locked);
    await _advance(t, 12);
  });

  // Patterns.
  shot('16_patterns', (t) => _show(t, const PatternsScreen(initialSize: 3)));
  shot('17_pattern_player', (t) async {
    final pattern = kPatterns.firstWhere((p) => p.id == 'checkerboard');
    await _show(
      t,
      Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context);
          return Solver3DScreen(
            size: 3,
            title: l10n.patternTitle(patternName(l10n, pattern.id), 3),
            guide: GuideScript(
              start: CubeState.solved(3),
              moves: pattern.movesFor(3),
              phase: 'pattern',
              explanation: 'patternStep',
            ),
          );
        },
      ),
    );
    await _tap(t, 'playback-next', 20);
  });
  shot('18_pattern_unlock', (t) async {
    await _show(t, const PatternsScreen(initialSize: 4));
    await _tap(t, 'pattern-cubeInCube');
  });

  // Timer & Daily Challenge.
  shot('19_train_hub', (t) => _show(t, const TrainScreen()));
  Future<void> withHistory() async {
    final times = [13420, 15880, 12910, 14230, 16050, 13770, 12480];
    await _prefs.setString(
      'timer_history_3',
      '[${[for (var i = 0; i < times.length; i++) '{"ms":${times[i]},"s":"R U F2","at":${1763900000000 + i * 60000},"p":0}'].join(',')}]',
    );
    await _prefs.setBool('timer_inspection', true);
  }

  shot('20_timer', (t) async {
    await withHistory();
    await _show(t, const TimerScreen(size: 3));
  });
  shot('21_timer_inspection', (t) async {
    await withHistory();
    await _show(t, const TimerScreen(size: 3));
    await t.tap(find.byKey(const ValueKey('timer-pad')));
    await t.pump(const Duration(milliseconds: 1200));
  });
  shot('22_daily', (t) => _show(t, const DailyScreen()));
  // Finishing today's challenge: the completion summary.
  shot(
    '31_daily_complete',
    (t) => _show(
      t,
      const DailyCompleteScreen(
        millis: 48370,
        streak: 7,
        bestStreak: 11,
        bestMillis: 48370,
        newBest: true,
      ),
    ),
  );

  // First launch and Settings extras.
  shot('26_onboarding', (t) => _show(t, const OnboardingScreen(), root: true));
  shot(
    '26b_onboarding_patterns',
    (t) => _show(t, const OnboardingScreen(initialPage: 3), root: true),
  );
  shot('27_privacy', (t) => _show(t, const PrivacyPolicyScreen()));

  // The Playground's Solve: Fast or Guided, then the end of a guided solve.
  shot('28_solve_choice', (t) async {
    await _show(
      t,
      Solver3DScreen(
        size: 3,
        initialCube: CubeState.solved(3)
            .applyAll(MoveNotation.parseSequence("R U R' U'", 3)),
      ),
    );
    await _tap(t, 'solve', 16);
  });
  shot('29_guided_solved', (t) async {
    // No sub-step goal sheets on the way to the end.
    await _prefs.setBool('substep_intro_auto', false);
    await _show(
      t,
      Solver3DScreen(
        size: 3,
        // The inverse of the fake guided plan (R2 U' F2 R): it ends solved.
        initialCube: CubeState.solved(3)
            .applyAll(MoveNotation.parseSequence("R' F2 U R2", 3)),
        autoSolve: SolveMethod.layerByLayer,
      ),
    );
    await _advance(t, 20);
    final scope = ProviderScope.containerOf(
      t.element(find.byType(Solver3DScreen)),
    );
    final controller = scope.read(cubeSessionProvider(3).notifier);
    for (var i = 0; i < 8; i++) {
      if (scope.read(cubeSessionProvider(3)).isComplete) break;
      controller.stepForward();
      await _advance(t, 16);
    }
    await _advance(t, 24);
  });
  // Camera denied: Try again or enter the colors by hand.
  shot('30_camera_problem', (t) => _show(t, const _SimulatedCameraProblem()));
}

/// The full-screen capture layout (the real [ScanLayout] and
/// [ScanGridOverlay]) over a drawn cube, standing in for the camera.
class _SimulatedCameraScan extends ConsumerStatefulWidget {
  const _SimulatedCameraScan();

  @override
  ConsumerState<_SimulatedCameraScan> createState() =>
      _SimulatedCameraScanState();
}

class _SimulatedCameraScanState extends ConsumerState<_SimulatedCameraScan> {
  Rect? _grid;

  static const _face = 'GRWBGYOWG';

  List<Rgb> get _colors => [
    for (final c in _face.split(''))
      switch (c) {
        'W' => (r: 236, g: 238, b: 240),
        'Y' => (r: 250, g: 214, b: 40),
        'R' => (r: 205, g: 30, b: 45),
        'O' => (r: 255, g: 120, b: 20),
        'B' => (r: 20, g: 80, b: 200),
        _ => (r: 30, g: 170, b: 80),
      },
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(scanSessionProvider(3));
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScanLayout(
        background: CustomPaint(painter: _CameraPainter(_grid, _colors)),
        header: ScanCaptureHeader(
          session: session,
          showBack: true,
          torch: IconButton(
            onPressed: () {},
            tooltip: l10n.scanTorch,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withValues(alpha: 0.12),
            ),
            icon: const Icon(Icons.flashlight_on_rounded, size: 20),
          ),
          onFaceTap: (_) {},
        ),
        footer: ScanCaptureFooter(
          session: session,
          shutter: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(
              side: BorderSide(color: Colors.white, width: 3),
            ),
            child: const Icon(Icons.camera_rounded, size: 30),
          ),
          onPillTap: (_) {},
          onManual: () {},
        ),
        grid: ScanGridOverlay(n: 3, colors: _colors),
        onGridRect: (grid, _) {
          if (grid != _grid) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() => _grid = grid);
            });
          }
        },
      ),
    );
  }
}

/// The scanner's recovery state when camera access was denied, inside the
/// real capture overlays.
class _SimulatedCameraProblem extends ConsumerWidget {
  const _SimulatedCameraProblem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(scanSessionProvider(3));
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScanLayout(
        background: const GlassBackground(child: SizedBox.expand()),
        header: ScanCaptureHeader(
          session: session,
          showBack: true,
          torch: null,
          onFaceTap: (_) {},
        ),
        footer: ScanCaptureFooter(
          session: session,
          shutter: null,
          onPillTap: (_) {},
          onManual: () {},
        ),
        fillCenter: true,
        grid: CameraProblemView(
          problem: CameraProblem.denied,
          onManual: () {},
          onRetry: () {},
        ),
      ),
    );
  }
}

class _CameraPainter extends CustomPainter {
  _CameraPainter(this.grid, this.colors);

  final Rect? grid;
  final List<Rgb> colors;

  @override
  void paint(Canvas canvas, Size size) {
    // A dim desk under warm room light.
    canvas.drawRect(
      Offset.zero & size,
      Paint()
        ..shader = const RadialGradient(
          center: Alignment(0, -0.1),
          radius: 0.9,
          colors: [Color(0xFF4A4038), Color(0xFF1C1814), Color(0xFF0B0A09)],
        ).createShader(Offset.zero & size),
    );
    final g = grid;
    if (g == null) return;
    // The cube body, slightly larger than the grid and a touch rotated.
    canvas.save();
    canvas.translate(g.center.dx, g.center.dy);
    canvas.rotate(-0.025);
    canvas.translate(-g.center.dx, -g.center.dy);
    final body = g.inflate(10);
    canvas.drawShadow(
      Path()
        ..addRRect(RRect.fromRectAndRadius(body, const Radius.circular(18))),
      Colors.black,
      18,
      false,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(body, const Radius.circular(18)),
      Paint()..color = const Color(0xFF111111),
    );
    final cell = g.width / 3;
    for (var i = 0; i < 9; i++) {
      final c = colors[i];
      final r = Rect.fromLTWH(
        g.left + (i % 3) * cell,
        g.top + (i ~/ 3) * cell,
        cell,
        cell,
      ).deflate(5);
      final base = Color.fromARGB(255, c.r, c.g, c.b);
      canvas.drawRRect(
        RRect.fromRectAndRadius(r, const Radius.circular(8)),
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(base, Colors.white, 0.18)!,
              Color.lerp(base, Colors.black, 0.22)!,
            ],
          ).createShader(r),
      );
    }
    canvas.restore();
    // Soft vignette.
    canvas.drawRect(
      Offset.zero & size,
      Paint()
        ..shader = RadialGradient(
          radius: math.sqrt2 * 0.75,
          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.55)],
        ).createShader(Offset.zero & size),
    );
  }

  @override
  bool shouldRepaint(_CameraPainter old) => old.grid != grid;
}
