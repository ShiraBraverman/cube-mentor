import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/solve_preference.dart';
import '../../core/solver/cube_solver.dart';
import '../../core/solver/solve_step.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../academy/widgets/lesson_intro.dart';
import 'model/cube_session.dart';
import 'model/guide_script.dart';
import 'widgets/cube_viewport.dart';
import 'widgets/move_pad.dart';
import 'widgets/solve_banner.dart';

/// 3D playground: a full-bleed touch-driven cube, a slim glass action bar,
/// and an optional collapsible notation pad.
class Solver3DScreen extends ConsumerStatefulWidget {
  const Solver3DScreen({
    super.key,
    required this.size,
    this.initialCube,
    this.autoSolve,
    this.guide,
    this.title,
    this.onSolved,
  });

  final int size;

  /// Cube to start from (e.g. a scanned one) instead of the current session.
  final CubeState? initialCube;

  /// Solve [initialCube] right away with this method.
  final SolveMethod? autoSolve;

  /// Moves to guide through from the start (e.g. a pattern), with the
  /// playback controls and arrows of a solution.
  final GuideScript? guide;

  /// App bar title; defaults to the playground title.
  final String? title;

  /// Called once when the user turns [initialCube] into a solved cube.
  final VoidCallback? onSolved;

  @override
  ConsumerState<Solver3DScreen> createState() => _Solver3DScreenState();
}

class _Solver3DScreenState extends ConsumerState<Solver3DScreen> {
  bool _showPad = false;
  bool _reportedSolved = false;

  /// Sub-steps of the loaded guided solution whose goal card was shown.
  final Set<String> _introsShown = {};
  List<SolveStep>? _introSteps;

  /// The 3-crown sub-step waiting for the user's hand, e.g. `2.1`; null
  /// while nothing guided waits (auto-play, animations, other methods).
  static String? _waitingSubStep(CubeSession s) {
    if (!s.isGuiding || s.isPlaying || !s.isIdle || s.isHandTurning) {
      return null;
    }
    final step = s.currentStep;
    if (step == null || !step.hasCrown) return null;
    return step.subStepLabel;
  }

  @override
  void initState() {
    super.initState();
    // Build the solver tables in the background while the user plays.
    ref.read(cubeSolverProvider).prepare(widget.size);
    final cube = widget.initialCube;
    if (cube != null) {
      // Providers cannot change while the tree builds: load right after.
      Future.microtask(() {
        if (!mounted) return;
        final controller = ref.read(cubeSessionProvider(widget.size).notifier)
          ..load(cube);
        final method = widget.autoSolve;
        if (method != null && !cube.isSolved) controller.solve(method);
      });
    }
    final guide = widget.guide;
    if (guide != null) {
      Future.microtask(() {
        if (!mounted) return;
        ref
            .read(cubeSessionProvider(widget.size).notifier)
            .loadGuide(
              guide.start,
              guide.moves,
              phase: guide.phase,
              explanation: guide.explanation,
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = widget.size;
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final solved = session.isIdle && session.cube.isSolved;

    ref.listen(cubeSessionProvider(size).select((s) => s.solveError), (
      _,
      error,
    ) {
      if (error == null) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(solveErrorText(l10n, error, size))),
        );
      controller.clearSolveError();
    });

    // A manual move that does not follow the guided solution.
    ref.listen(cubeSessionProvider(size).select((s) => s.rejectedMoves), (
      previous,
      next,
    ) {
      if (previous == null || next <= previous) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            key: const ValueKey('guide-wrong-move'),
            content: Text(l10n.guideWrongMove),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
    });

    // Each new sub-step of a guided solve opens with its goal card.
    ref.listen(cubeSessionProvider(size).select(_waitingSubStep), (_, label) {
      if (label == null) return;
      final current = ref.read(cubeSessionProvider(size));
      if (!identical(current.steps, _introSteps)) {
        _introSteps = current.steps;
        _introsShown.clear();
      }
      if (!_introsShown.add(label)) return;
      final step = current.currentStep!;
      showSubStepIntro(context, crown: step.crown, subStep: step.subStep);
    });

    // The user solved the cube they started from (e.g. the daily scramble).
    ref.listen(
      cubeSessionProvider(size).select((s) => s.isIdle && s.cube.isSolved),
      (previous, next) {
        final onSolved = widget.onSolved;
        if (onSolved == null || _reportedSolved) return;
        if (previous == false && next) {
          _reportedSolved = true;
          onSolved();
        }
      },
    );

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? l10n.playgroundTitle(size)),
          actions: [
            _StatusPill(
              label: solved ? l10n.solved : l10n.scrambled,
              positive: solved,
            ),
            IconButton(
              tooltip: l10n.xray,
              isSelected: session.xray,
              icon: const Icon(Icons.visibility_outlined),
              selectedIcon: const Icon(
                Icons.visibility,
                color: AppColors.accentSecondary,
              ),
              onPressed: controller.toggleXray,
            ),
            IconButton(
              key: const ValueKey('toggle-notation'),
              tooltip: l10n.notationPad,
              isSelected: _showPad,
              icon: const Icon(Icons.keyboard_outlined),
              selectedIcon: const Icon(
                Icons.keyboard,
                color: AppColors.accentSecondary,
              ),
              onPressed: () => setState(() => _showPad = !_showPad),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const Positioned.fill(child: CubeStage(intensity: 0.8)),
                    Positioned.fill(
                      child: CubeViewport(
                        size: size,
                        highlighted: solveHighlights(session),
                        focus: solveFocus(session),
                      ),
                    ),
                    PositionedDirectional(
                      top: AppSpace.xs,
                      start: AppSpace.md,
                      end: AppSpace.md,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 560),
                          child: SolveBanner(size: size),
                        ),
                      ),
                    ),
                    if (session.steps.isEmpty)
                      PositionedDirectional(
                        bottom: AppSpace.xs,
                        start: AppSpace.lg,
                        end: AppSpace.lg,
                        child: IgnorePointer(
                          child: Text(
                            l10n.orbitHint,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      AppSpace.md,
                      AppSpace.xs,
                      AppSpace.md,
                      AppSpace.md,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSize(
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeOutCubic,
                          alignment: Alignment.bottomCenter,
                          child: _showPad
                              ? Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    bottom: 8,
                                  ),
                                  child: _NotationPanel(size: size),
                                )
                              : const SizedBox(width: double.infinity),
                        ),
                        _ActionBar(size: size),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Slim glass bar: scramble / undo / reset, plus playback when available.
class _ActionBar extends ConsumerWidget {
  const _ActionBar({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    // Playback waits while a layer is held under the finger.
    final free = !session.isHandTurning;
    final canUndo = session.hasPlayback
        ? session.canStepBack
        : session.log.isNotEmpty;

    return GlassCard(
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.all(AppSpace.sm - 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            child: !session.hasPlayback
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          // Media controls keep LTR order in every locale,
                          // following Material's bidirectionality guidelines.
                          textDirection: TextDirection.ltr,
                          children: [
                            IconButton(
                              key: const ValueKey('playback-prev'),
                              tooltip: l10n.previousMove,
                              onPressed: free && session.canStepBack
                                  ? controller.stepBack
                                  : null,
                              icon: const Icon(Icons.skip_previous_rounded),
                            ),
                            IconButton.filledTonal(
                              tooltip: session.isPlaying
                                  ? l10n.pause
                                  : l10n.play,
                              onPressed: session.isPlaying
                                  ? controller.pause
                                  : (free && session.canStepForward
                                        ? controller.play
                                        : null),
                              icon: Icon(
                                session.isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                              ),
                            ),
                            IconButton(
                              key: const ValueKey('playback-next'),
                              tooltip: l10n.nextMove,
                              onPressed: free && session.canStepForward
                                  ? controller.stepForward
                                  : null,
                              icon: const Icon(Icons.skip_next_rounded),
                            ),
                            IconButton(
                              tooltip: l10n.replayStep,
                              onPressed: free && session.isIdle
                                  ? controller.replayStep
                                  : null,
                              icon: const Icon(Icons.replay_rounded),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GlowProgressBar(
                                value:
                                    session.playbackIndex /
                                    session.playback.length,
                                height: 6,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        _SpeedSlider(size: size),
                      ],
                    ),
                  ),
          ),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.shuffle_rounded,
                  label: l10n.scramble,
                  onTap: free ? controller.scramble : null,
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: _ActionButton(
                  key: const ValueKey('solve'),
                  icon: Icons.auto_fix_high_rounded,
                  label: session.isSolving ? l10n.solving : l10n.solve,
                  busy: session.isSolving,
                  primary: true,
                  onTap: session.isSolving || !session.isIdle || !free
                      ? null
                      : () => _solve(context, ref),
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: _ActionButton(
                  icon: Icons.undo_rounded,
                  label: l10n.undo,
                  onTap: free && canUndo ? controller.undo : null,
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: _ActionButton(
                  icon: Icons.restart_alt_rounded,
                  label: l10n.reset,
                  onTap: controller.reset,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension on _ActionBar {
  Future<void> _solve(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final session = ref.read(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final solver = ref.read(cubeSolverProvider);
    final messenger = ScaffoldMessenger.of(context);
    void say(String message) => messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));

    if (session.cube.isSolved) {
      say(l10n.solveAlreadySolved);
      return;
    }
    if (!solver.supports(size, SolveMethod.fast)) {
      say(l10n.solveUnavailable(size));
      return;
    }
    // The guided 3-crown method by default; the banner toggles to fast.
    final method = solver.supports(size, SolveMethod.layerByLayer)
        ? ref.read(solvePreferenceProvider)
        : SolveMethod.fast;
    await controller.solve(method);
  }
}

/// Animation speed of queued moves and solution playback.
class _SpeedSlider extends ConsumerWidget {
  const _SpeedSlider({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final speed = ref.watch(cubeSessionProvider(size).select((s) => s.speed));
    return Row(
      children: [
        const SizedBox(width: 8),
        const Icon(
          Icons.speed_rounded,
          size: 18,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 6),
        Text(l10n.speed, style: Theme.of(context).textTheme.bodySmall),
        Expanded(
          child: Slider(
            value: speed,
            min: 0.25,
            max: 3,
            divisions: 11,
            label: '${speed.toStringAsFixed(2)}×',
            onChanged: ref.read(cubeSessionProvider(size).notifier).setSpeed,
          ),
        ),
      ],
    );
  }
}

/// Collapsible advanced controls: notation buttons and animation speed.
class _NotationPanel extends ConsumerWidget {
  const _NotationPanel({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);

    return GlassCard(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MovePad(size: size, onMove: controller.turnNotation),
          // Shown here only while the playback bar (with its own slider) is
          // hidden.
          if (!session.hasPlayback) _SpeedSlider(size: size),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.primary = false,
    this.busy = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool primary;

  /// Shows a spinner instead of the icon.
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final style = primary
        ? FilledButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: AppColors.onAccent,
            shadowColor: AppColors.accent,
            elevation: onTap == null ? 0 : 6,
          )
        : FilledButton.styleFrom(
            backgroundColor: AppColors.glassFillStrong,
            foregroundColor: AppColors.textPrimary,
          );
    return FilledButton(
      style: style.copyWith(
        minimumSize: const WidgetStatePropertyAll(Size(0, 64)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSpace.xxs, vertical: AppSpace.xs),
        ),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          busy
              ? const SizedBox.square(
                  dimension: 22,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                )
              : Icon(icon, size: 22),
          const SizedBox(height: AppSpace.xxs),
          FittedBox(child: Text(label, maxLines: 1)),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.positive});

  final String label;
  final bool positive;

  @override
  Widget build(BuildContext context) => AppPill(
    label: label,
    color: positive ? AppColors.accentSecondary : AppColors.accentWarm,
    icon: positive ? Icons.check_circle_rounded : Icons.shuffle_rounded,
  );
}
