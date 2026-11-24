import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads/app_banner_ad.dart';
import '../../core/ads/interstitial_pacer.dart';
import '../../core/ads/reward_prompt.dart';
import '../../core/cube/cube_state.dart';
import '../../core/feedback/feedback_service.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/clock.dart';
import '../../core/settings/intro_preference.dart';
import '../../core/settings/solve_preference.dart';
import '../../core/solver/cube_solver.dart';
import '../../core/solver/solve_step.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../../shared/widgets/cube_icons/cube_icons.dart';
import '../academy/widgets/lesson_intro.dart';
import '../timer/model/timer_stats.dart';
import 'model/cube_session.dart';
import 'model/guide_script.dart';
import 'widgets/cube_viewport.dart';
import 'widgets/double_turn_badge.dart';
import 'widgets/move_pad.dart';
import 'widgets/solve_banner.dart';

/// 3D playground: a full-bleed touch-driven cube under context-aware
/// controls. Free play shows the Scramble / Solve / Undo / Reset bar; while
/// a solution or guide is loaded only the step dock and a compact
/// Previous / Play / Next / Exit row remain. The notation pad opens as a
/// bottom sheet from the app bar so it never pushes the cube up.
class Solver3DScreen extends ConsumerStatefulWidget {
  const Solver3DScreen({
    super.key,
    required this.size,
    this.initialCube,
    this.autoSolve,
    this.guide,
    this.title,
    this.onSolved,
    this.challenge = false,
    this.onTimedSolve,
    this.guideDoneAction,
    this.practiceBanner,
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

  /// Called once when the user turns [initialCube] into a solved cube,
  /// with the number of turns it took.
  final ValueChanged<int>? onSolved;

  /// A timed challenge on [initialCube] (the daily scramble): a running
  /// clock replaces the status pill, and the bottom bar keeps only Undo and
  /// Reset, which returns to [initialCube] (not a solved cube) and restarts
  /// the clock. No Scramble or Solve.
  final bool challenge;

  /// Called with the solve time (milliseconds) when a [challenge] is
  /// solved.
  final ValueChanged<int>? onTimedSolve;

  /// Shown under a finished guide, e.g. "solve it now" buttons after the
  /// daily scramble guide.
  final Widget? guideDoneAction;

  /// The goal of a free-practice session opened from a finished lesson
  /// ("solve the cube up through ..."), shown above the cube.
  final String? practiceBanner;

  @override
  ConsumerState<Solver3DScreen> createState() => _Solver3DScreenState();
}

class _Solver3DScreenState extends ConsumerState<Solver3DScreen> {
  bool _reportedSolved = false;

  /// Challenge clock: when it started, and the time once solved.
  late DateTime _challengeStart = ref.read(clockProvider)();
  int? _challengeMillis;

  /// Challenge Reset: back to the starting scramble, clock from zero.
  void _restartChallenge() {
    final cube = widget.initialCube;
    if (cube == null) return;
    ref.read(cubeSessionProvider(widget.size).notifier).load(cube);
    setState(() {
      _challengeStart = ref.read(clockProvider)();
      _challengeMillis = null;
      _reportedSolved = false;
      _turns = 0;
    });
  }

  /// Turns applied to the cube since the screen opened (undo counts too).
  int _turns = 0;

  /// Short message floating under the app bar (e.g. "already solved"),
  /// never over the controls; null while hidden.
  String? _notice;
  Timer? _noticeTimer;

  void _showNotice(String message) {
    _noticeTimer?.cancel();
    setState(() => _notice = message);
    _noticeTimer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _notice = null);
    });
  }

  @override
  void dispose() {
    _noticeTimer?.cancel();
    super.dispose();
  }

  /// A 2x2 / 3x3 solver solution was played to the end and the user has
  /// not left it yet.
  bool _quickSolveFinished = false;

  /// The user leaves a finished quick solve (Exit, back, scan the next
  /// cube): the frequency-capped interstitial may show now, never before
  /// or during a solve.
  void _leaveFinishedSolve() {
    if (!_quickSolveFinished) return;
    _quickSolveFinished = false;
    unawaited(ref.read(interstitialPacerProvider.notifier).maybeShow());
  }

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
      if (!ref.read(subStepIntroAutoProvider)) return;
      final step = current.currentStep!;
      showSubStepIntro(context, crown: step.crown, subStep: step.subStep);
    });

    // A scrambled cube became solved (by hand or playback, not by Reset):
    // the warm success chime.
    ref.listen(
      cubeSessionProvider(size)
          .select((s) => (s.epoch, s.isIdle && s.cube.isSolved)),
      (previous, next) {
        if (previous == null || previous.$1 != next.$1) return;
        if (!previous.$2 && next.$2) ref.read(feedbackProvider).success();
      },
    );

    // Counts every applied turn, for the solve's move count.
    ref.listen(cubeSessionProvider(size).select((s) => (s.epoch, s.cube)), (
      previous,
      next,
    ) {
      if (previous != null &&
          previous.$1 == next.$1 &&
          !identical(previous.$2, next.$2)) {
        _turns++;
      }
    });

    // The user solved the cube they started from (e.g. the daily scramble).
    ref.listen(
      cubeSessionProvider(size).select((s) => s.isIdle && s.cube.isSolved),
      (previous, next) {
        final onSolved = widget.onSolved;
        if (onSolved == null || _reportedSolved) return;
        if (previous == false && next) {
          _reportedSolved = true;
          onSolved(_turns);
        }
      },
    );

    // A quick (2x2 / 3x3) solver solution played to the end counts toward
    // the next interstitial.
    ref.listen(
      cubeSessionProvider(size)
          .select((s) => s.isComplete && s.solvedWith != null),
      (previous, next) {
        if (size > 3 || previous != false || !next) return;
        _quickSolveFinished = true;
        unawaited(ref.read(interstitialPacerProvider.notifier).recordSolve());
      },
    );

    // A timed challenge stops its clock once solved.
    ref.listen(
      cubeSessionProvider(size).select((s) => s.isIdle && s.cube.isSolved),
      (previous, next) {
        if (!widget.challenge || _challengeMillis != null) return;
        if (previous == false && next) {
          final millis = ref
              .read(clockProvider)()
              .difference(_challengeStart)
              .inMilliseconds;
          setState(() => _challengeMillis = millis);
          widget.onTimedSolve?.call(millis);
        }
      },
    );

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) _leaveFinishedSolve();
      },
      child: GlassBackground(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title ?? l10n.playgroundTitle(size)),
            actions: [
              if (widget.challenge)
                _ChallengeClock(
                  start: _challengeStart,
                  finishedMillis: _challengeMillis,
                )
              else
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
                icon: const Icon(Icons.keyboard_outlined),
                onPressed: () => showNotationSheet(context, size),
              ),
              const SizedBox(width: 4),
            ],
          ),
          // The banner (when one loaded) sits below the playback controls and
          // keeps the system navigation inset under it.
          bottomNavigationBar: const SafeArea(top: false, child: AppBannerAd()),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                if (widget.practiceBanner case final banner?)
                  _PracticeBanner(message: banner),
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
                      // A half turn is called out right above the cube.
                      PositionedDirectional(
                        top: AppSpace.xs,
                        start: AppSpace.md,
                        end: AppSpace.md,
                        child: Center(child: DoubleTurnBadge(size: size)),
                      ),
                      // Non-blocking notice under the app bar.
                      PositionedDirectional(
                        top: AppSpace.xs,
                        start: AppSpace.lg,
                        end: AppSpace.lg,
                        child: IgnorePointer(
                          child: Center(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween(
                                        begin: const Offset(0, -0.4),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  ),
                              child: _notice == null
                                  ? const SizedBox.shrink()
                                  : _NoticePill(
                                      key: const ValueKey('solve-notice'),
                                      message: _notice!,
                                    ),
                            ),
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
                          // A solution or guide: the step dock under the cube
                          // (never over it) and the playback dock only.
                          if (session.hasPlayback) ...[
                            if (session.steps.isNotEmpty)
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: AppSpace.xs,
                                ),
                                child: SolveBanner(
                                  size: size,
                                  guideDoneAction: widget.guideDoneAction,
                                ),
                              ),
                            _GuideDock(
                              size: size,
                              // Pattern and scramble guides were opened for
                              // the guide alone: exiting leaves the screen.
                              onExit: widget.guide != null
                                  ? () => Navigator.of(context).maybePop()
                                  : () {
                                      controller.clearSolution();
                                      _leaveFinishedSolve();
                                    },
                            ),
                          ] else if (widget.challenge)
                            _ChallengeBar(
                              size: size,
                              onReset: _restartChallenge,
                            )
                          else
                            _ActionBar(size: size, onNotice: _showNotice),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Guide-only controls: Previous, Play / Pause, Next and Exit. Progress is
/// shown once, by stage, in the step dock above (never a move count).
class _GuideDock extends ConsumerWidget {
  const _GuideDock({required this.size, required this.onExit});

  final int size;
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    // Playback waits while a layer is held under the finger.
    final free = !session.isHandTurning;

    return GlassCard(
      key: const ValueKey('guide-dock'),
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppSpace.xs,
        vertical: 2,
      ),
      child: Row(
        // Media controls keep LTR order in every locale, following
        // Material's bidirectionality guidelines.
        textDirection: TextDirection.ltr,
        children: [
          // Previous and Next share the room left and right of Play, with
          // their labels spelled out so new users know which way they go.
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: _StepButton(
                key: const ValueKey('playback-prev'),
                tooltip: l10n.previousMove,
                label: l10n.playbackPrevious,
                icon: Icons.skip_previous_rounded,
                onPressed: free && session.canStepBack
                    ? () {
                        ref.read(feedbackProvider).step();
                        controller.stepBack();
                      }
                    : null,
              ),
            ),
          ),
          const SizedBox(width: AppSpace.xxs),
          IconButton.filled(
            key: const ValueKey('playback-play'),
            tooltip: session.isPlaying ? l10n.pause : l10n.play,
            iconSize: 30,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: AppColors.onAccent,
              minimumSize: const Size.square(52),
            ),
            onPressed: session.isPlaying
                ? () {
                    ref.read(feedbackProvider).tap();
                    controller.pause();
                  }
                : (free && session.canStepForward
                      ? () {
                          ref.read(feedbackProvider).tap();
                          controller.play();
                        }
                      : null),
            icon: Icon(
              session.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
            ),
          ),
          const SizedBox(width: AppSpace.xxs),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: _StepButton(
                key: const ValueKey('playback-next'),
                tooltip: l10n.nextMove,
                label: l10n.playbackNext,
                icon: Icons.skip_next_rounded,
                iconAfter: true,
                onPressed: free && session.canStepForward
                    ? () {
                        ref.read(feedbackProvider).step();
                        controller.stepForward();
                      }
                    : null,
              ),
            ),
          ),
          IconButton(
            key: const ValueKey('guide-exit'),
            tooltip: l10n.guideExit,
            onPressed: onExit,
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }
}

/// A Previous / Next playback button: icon and spelled-out label. The
/// icon always sits on the outer side (media controls stay LTR).
class _StepButton extends StatelessWidget {
  const _StepButton({
    super.key,
    required this.tooltip,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.iconAfter = false,
  });

  final String tooltip;
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  /// Puts the icon after the label (Next).
  final bool iconAfter;

  @override
  Widget build(BuildContext context) {
    final glyph = Icon(icon, size: 26);
    final text = Flexible(
      child: FittedBox(fit: BoxFit.scaleDown, child: Text(label, maxLines: 1)),
    );
    return Tooltip(
      message: tooltip,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
          textStyle: Theme.of(context).textTheme.labelLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.ltr,
          children: iconAfter
              ? [text, const SizedBox(width: 4), glyph]
              : [glyph, const SizedBox(width: 4), text],
        ),
      ),
    );
  }
}

/// The free-practice goal above the cube (never over it).
class _PracticeBanner extends StatelessWidget {
  const _PracticeBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(
      AppSpace.md,
      AppSpace.xs,
      AppSpace.md,
      0,
    ),
    child: GlassCard(
      key: const ValueKey('practice-banner'),
      selected: true,
      accent: AppColors.accentSecondary,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.sm,
        AppSpace.xs,
        AppSpace.sm,
        AppSpace.xs,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.flag_rounded,
            size: 20,
            color: AppColors.accentSecondary,
          ),
          const SizedBox(width: AppSpace.xs),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

/// Floating pill under the app bar for short, non-blocking notices.
class _NoticePill extends StatelessWidget {
  const _NoticePill({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpace.md,
      vertical: AppSpace.xs,
    ),
    decoration: BoxDecoration(
      color: AppColors.surfaceRaised.withValues(alpha: 0.92),
      borderRadius: BorderRadius.circular(AppRadius.pill),
      border: Border.all(
        color: AppColors.accentSecondary.withValues(alpha: 0.5),
      ),
      boxShadow: const [
        BoxShadow(color: Colors.black38, blurRadius: 16, spreadRadius: -4),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.info_outline_rounded,
          size: 18,
          color: AppColors.accentSecondary,
        ),
        const SizedBox(width: AppSpace.xs),
        Flexible(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

/// Timed challenge: Undo and Reset (back to the challenge scramble) only.
class _ChallengeBar extends ConsumerWidget {
  const _ChallengeBar({required this.size, required this.onReset});

  final int size;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final free = !session.isHandTurning;
    return GlassCard(
      key: const ValueKey('challenge-bar'),
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.all(AppSpace.sm - 2),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              key: const ValueKey('challenge-undo'),
              icon: Icons.undo_rounded,
              label: l10n.undo,
              onTap: free && session.log.isNotEmpty ? controller.undo : null,
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          Expanded(
            child: _ActionButton(
              key: const ValueKey('challenge-reset'),
              icon: Icons.restart_alt_rounded,
              label: l10n.reset,
              onTap: free ? onReset : null,
            ),
          ),
        ],
      ),
    );
  }
}

/// The running clock of a timed challenge in the app bar; it freezes on
/// the final time once solved.
class _ChallengeClock extends ConsumerStatefulWidget {
  const _ChallengeClock({required this.start, required this.finishedMillis});

  final DateTime start;
  final int? finishedMillis;

  @override
  ConsumerState<_ChallengeClock> createState() => _ChallengeClockState();
}

class _ChallengeClockState extends ConsumerState<_ChallengeClock>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker((_) => setState(() {}));

  @override
  void initState() {
    super.initState();
    _sync();
  }

  @override
  void didUpdateWidget(_ChallengeClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sync();
  }

  void _sync() {
    final running = widget.finishedMillis == null;
    if (running && !_ticker.isActive) {
      _ticker.start();
    } else if (!running && _ticker.isActive) {
      _ticker.stop();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final finished = widget.finishedMillis;
    final millis =
        finished ??
        ref.read(clockProvider)().difference(widget.start).inMilliseconds;
    final color = finished == null
        ? AppColors.textPrimary
        : AppColors.accentSecondary;
    return Container(
      key: const ValueKey('challenge-clock'),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        color: color.withValues(alpha: 0.12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.ltr,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            formatTime(millis < 0 ? 0 : millis),
            key: const ValueKey('challenge-clock-time'),
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

/// Free play: Scramble / Solve / Undo / Reset.
class _ActionBar extends ConsumerWidget {
  const _ActionBar({required this.size, required this.onNotice});

  final int size;

  /// Shows a short message in the floating pill under the app bar.
  final ValueChanged<String> onNotice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final free = !session.isHandTurning;

    return GlassCard(
      key: const ValueKey('action-bar'),
      borderRadius: AppRadius.lg,
      padding: const EdgeInsetsDirectional.all(AppSpace.sm - 2),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              icon: Icons.shuffle_rounded,
              cube: AnimatedScrambleCubeIcon.new,
              label: l10n.scramble,
              onTap: free ? controller.scramble : null,
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          Expanded(
            child: _ActionButton(
              key: const ValueKey('solve'),
              icon: Icons.auto_fix_high_rounded,
              cube: AnimatedSolveCubeIcon.new,
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
              onTap: free && session.log.isNotEmpty ? controller.undo : null,
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
    );
  }
}

extension on _ActionBar {
  Future<void> _solve(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final session = ref.read(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final solver = ref.read(cubeSolverProvider);
    if (session.cube.isSolved) {
      onNotice(l10n.solveAlreadySolved);
      return;
    }
    final guided = solver.supports(size, SolveMethod.layerByLayer);
    final fast = solver.supports(size, SolveMethod.fast);
    if (!guided && !fast) {
      onNotice(l10n.solveUnavailable(size));
      return;
    }
    // Guided by default. Only sizes with both modes (2x2, 3x3) follow the
    // remembered Guided / Fast choice; bigger cubes are always guided.
    final method = guided && fast
        ? ref.read(solvePreferenceProvider)
        : (guided ? SolveMethod.layerByLayer : SolveMethod.fast);
    // 4x4-6x6: the first solve is free, then a rewarded video unlocks 24 h.
    if (!await ensureBigCubeSolve(context, ref, size)) return;
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

/// Opens the notation pad (move buttons and animation speed) as a glass
/// bottom sheet over the controls, leaving the cube where it is.
Future<void> showNotationSheet(BuildContext context, int size) {
  final l10n = AppLocalizations.of(context);
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black26,
    builder: (context) => SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
          maxWidth: 560,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpace.xs),
          child: GlassCard(
            key: const ValueKey('notation-sheet'),
            borderRadius: AppRadius.lg,
            padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 4),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.glassBorder,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpace.xs),
                  Row(
                    children: [
                      const Icon(
                        Icons.keyboard_rounded,
                        size: 18,
                        color: AppColors.accentSecondary,
                      ),
                      const SizedBox(width: AppSpace.xs),
                      Expanded(
                        child: Text(
                          l10n.notationPad,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpace.xs),
                  Consumer(
                    builder: (context, ref, _) => MovePad(
                      size: size,
                      onMove: ref
                          .read(cubeSessionProvider(size).notifier)
                          .turnNotation,
                    ),
                  ),
                  _SpeedSlider(size: size),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.primary = false,
    this.busy = false,
    this.cube,
  });

  final IconData icon;

  /// Animated mini-cube shown instead of [icon]; it rests while disabled.
  final AnimatedCubeIcon Function({
    Key? key,
    double size,
    bool animate,
    String? semanticLabel,
  })?
  cube;
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
      onPressed: onTap == null
          ? null
          : () {
              playFeedback(context, FeedbackCue.tap);
              onTap!();
            },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          busy
              ? const SizedBox.square(
                  dimension: 22,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                )
              : cube != null
              ? Opacity(
                  opacity: onTap == null ? 0.45 : 1,
                  child: cube!(size: 26, animate: onTap != null),
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
