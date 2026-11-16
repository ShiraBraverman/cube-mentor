import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/solver/cube_solver.dart';
import '../../core/solver/solve_step.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
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
                    Positioned.fill(
                      child: CubeViewport(
                        size: size,
                        highlighted: solveHighlights(session),
                        focus: solveFocus(session),
                      ),
                    ),
                    PositionedDirectional(
                      top: 8,
                      start: 12,
                      end: 12,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 560),
                          child: SolveBanner(size: size),
                        ),
                      ),
                    ),
                    if (session.steps.isEmpty)
                      PositionedDirectional(
                        bottom: 6,
                        start: 16,
                        end: 16,
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
                      12,
                      6,
                      12,
                      12,
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
      borderRadius: 24,
      padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
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
                              tooltip: l10n.previousStep,
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
                              tooltip: l10n.nextStep,
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value:
                                      session.playbackIndex /
                                      session.playback.length,
                                  minHeight: 4,
                                  backgroundColor: AppColors.glassBorder,
                                ),
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
              const SizedBox(width: 8),
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
              const SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  icon: Icons.undo_rounded,
                  label: l10n.undo,
                  onTap: free && canUndo ? controller.undo : null,
                ),
              ),
              const SizedBox(width: 8),
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
    var method = SolveMethod.fast;
    if (solver.supports(size, SolveMethod.layerByLayer)) {
      final choice = await showModalBottomSheet<SolveMethod>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => _SolveMethodSheet(size: size),
      );
      if (choice == null) return;
      method = choice;
    }
    await controller.solve(method);
  }
}

/// Lets the user pick between the fast solver and the guided method.
class _SolveMethodSheet extends StatelessWidget {
  const _SolveMethodSheet({required this.size});

  final int size;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    Widget option(
      Key key,
      IconData icon,
      String title,
      String description,
      SolveMethod method,
      Color accent,
    ) => GlassCard(
      key: key,
      onTap: () => Navigator.of(context).pop(method),
      child: Row(
        children: [
          Icon(icon, color: accent, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
        child: GlassCard(
          padding: const EdgeInsetsDirectional.fromSTEB(14, 16, 14, 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.solveChooseMethod, style: textTheme.titleLarge),
              const SizedBox(height: 12),
              option(
                const ValueKey('solve-fast'),
                Icons.bolt_rounded,
                l10n.solveFast,
                size >= 4 ? l10n.solveFastBigDesc : l10n.solveFastDesc,
                SolveMethod.fast,
                AppColors.accent,
              ),
              const SizedBox(height: 10),
              option(
                const ValueKey('solve-learn'),
                Icons.school_rounded,
                l10n.solveLearn,
                size >= 4 ? l10n.solveLearnBigDesc : l10n.solveLearnDesc,
                SolveMethod.layerByLayer,
                AppColors.accentSecondary,
              ),
            ],
          ),
        ),
      ),
    );
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
            foregroundColor: AppColors.backgroundBottom,
          )
        : FilledButton.styleFrom(
            backgroundColor: AppColors.glassFillStrong,
            foregroundColor: AppColors.textPrimary,
          );
    return FilledButton.icon(
      style: style.copyWith(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        ),
      ),
      onPressed: onTap,
      icon: busy
          ? const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(icon, size: 18),
      label: FittedBox(child: Text(label)),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.positive});

  final String label;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    final color = positive ? AppColors.accentSecondary : AppColors.accentWarm;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color.withValues(alpha: 0.6)),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
