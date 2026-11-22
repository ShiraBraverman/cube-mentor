import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/celebration/celebration.dart';
import '../../../core/cube/color_scheme.dart';
import '../../../core/cube/facelets.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/l10n/move_words.dart';
import '../../../core/solver/cube_solver.dart';
import '../../../core/solver/solve_stages.dart';
import '../../../core/solver/solve_step.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass.dart';
import '../../../core/theme/sticker_palette.dart';
import '../model/cube_session.dart';
import '../../../core/l10n/crown_words.dart';
import '../../academy/widgets/lesson_intro.dart';
import 'crown_tracker.dart';
import 'move_instruction.dart';
import 'stage_header.dart';

/// Dock under the cube explaining the current solution step: an arrow and
/// plain words for the move ("Right side — Up"), then (expandable) the
/// phase and progress, what this move achieves and how to make it. It never
/// covers the cube. Collapsing it only hides the details: the solution stays
/// loaded until Exit in the playback dock. Celebrates once the cube is
/// solved.
class SolveBanner extends ConsumerStatefulWidget {
  const SolveBanner({super.key, required this.size, this.guideDoneAction});

  final int size;

  /// What to do next once a guide (pattern or scramble) is played through,
  /// e.g. "now solve it" buttons after the daily scramble guide.
  final Widget? guideDoneAction;

  @override
  ConsumerState<SolveBanner> createState() => _SolveBannerState();
}

class _SolveBannerState extends ConsumerState<SolveBanner> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    if (session.steps.isEmpty) return const SizedBox.shrink();
    final textTheme = Theme.of(context).textTheme;
    final step = session.currentStep;
    final index = session.currentStepIndex;
    final total = session.steps.length;
    final complete = step == null && index >= total;
    // Stages, never move counts: a 6x6 solution has hundreds of moves.
    final plan = StagePlan.forSteps(session.steps, size);
    final stage = plan.stageAt(index);
    final stageProgress = stage?.progressAt(index) ?? index / total;
    final secondary = textTheme.bodySmall?.copyWith(
      color: AppColors.textSecondary,
    );
    // Fast solutions (2x2, 3x3) are short: their move count is the point.
    final fast =
        session.solvedWith == SolveMethod.fast &&
        kFastSolveSizes.contains(size);

    if (complete) {
      final guided = session.steps.any((s) => s.hasCrown);
      // The daily scramble guide ends on a scrambled cube: never "Solved!".
      final scrambleGuide = session.steps.first.phaseName == 'dailyScramble';
      final Widget summary;
      if (fast) {
        summary = FastMoveBadge(size: size, moves: session.playback.length);
      } else if (session.solvedWith == null && stage == null) {
        summary = Padding(
          padding: const EdgeInsets.only(top: 4),
          child: GuideCounterPill(
            phase: session.steps.first.phaseName,
            current: total,
            total: total,
          ),
        );
      } else {
        summary = Text(
          l10n.solveAllStagesDone,
          key: const ValueKey('solve-summary'),
          style: secondary,
        );
      }
      // A solver solution (Guided or Fast) ends in a personal celebration;
      // patterns and scramble guides just say they are done.
      if (session.solvedWith != null) {
        return KeyedSubtree(
          key: const ValueKey('solve-complete'),
          child: CelebrationCard(
            compact: true,
            message: l10n.celebrateCubeSolved,
            icon: Icons.emoji_events_rounded,
            // All three crowns finished.
            trailing: guided ? const CrownTracker(active: kCrowns + 1) : null,
            footer: summary,
          ),
        );
      }
      return GlassCard(
        selected: true,
        accent: AppColors.accentSecondary,
        borderRadius: AppRadius.md,
        padding: const EdgeInsetsDirectional.fromSTEB(
          AppSpace.md,
          AppSpace.sm,
          AppSpace.xxs,
          AppSpace.sm,
        ),
        child: Column(
          key: const ValueKey('solve-complete'),
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  scrambleGuide
                      ? Icons.shuffle_on_rounded
                      : Icons.celebration_rounded,
                  color: AppColors.accentSecondary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        scrambleGuide
                            ? l10n.dailyScrambledTitle
                            : l10n.solveComplete,
                        key: const ValueKey('guide-complete-title'),
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColors.accentSecondary,
                        ),
                      ),
                      summary,
                    ],
                  ),
                ),
              ],
            ),
            if (widget.guideDoneAction case final action?) ...[
              const SizedBox(height: AppSpace.xs),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: AppSpace.xs),
                child: action,
              ),
            ],
          ],
        ),
      );
    }
    if (step == null) return const SizedBox.shrink();

    final move = session.playback[index];
    final wholeCube = move.fromLayer == 0 && move.toLayer == size - 1;
    // Half made by hand: show what is left of the move.
    final shown = session.guideMove ?? move;

    final header = Row(
      children: [
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child: MoveInstructionTile(
              key: ValueKey('solve-move-$index-${shown.notation}'),
              move: shown,
              size: size,
              badgeSize: 46,
            ),
          ),
        ),
        if (!_expanded)
          // Folded: a small ring of this stage's progress.
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 6),
            child: SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                key: const ValueKey('stage-ring'),
                value: stageProgress,
                strokeWidth: 3,
                backgroundColor: AppColors.glassBorder,
                valueColor: const AlwaysStoppedAnimation(
                  AppColors.accentSecondary,
                ),
              ),
            ),
          ),
        if (step.hasCrown)
          IconButton(
            key: const ValueKey('solve-intro-open'),
            tooltip: l10n.introShowGoal,
            visualDensity: VisualDensity.compact,
            onPressed: () => showSubStepIntro(
              context,
              crown: step.crown,
              subStep: step.subStep,
            ),
            icon: const Icon(Icons.flag_circle_outlined, size: 20),
          ),
        IconButton(
          key: const ValueKey('solve-collapse'),
          tooltip: _expanded ? l10n.solveCollapse : l10n.solveExpand,
          visualDensity: VisualDensity.compact,
          onPressed: () => setState(() => _expanded = !_expanded),
          icon: Icon(
            _expanded
                ? Icons.keyboard_arrow_down_rounded
                : Icons.keyboard_arrow_up_rounded,
          ),
        ),
      ],
    );

    final details = Column(
      key: const ValueKey('solve-details'),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: AppSpace.xs),
        if (stage != null)
          StageHeader(
            stage: stage,
            progress: stageProgress,
            // Big cubes: the crown's sub-step under the stage.
            subStepLabel: stage.kind == StageKind.crown
                ? step.subStepLabel
                : null,
            subStepName: stage.kind == StageKind.crown
                ? subStepTitle(l10n, step.crown, step.subStep)
                : null,
          )
        else ...[
          // Patterns, lessons, scramble guides: what it is and how far,
          // with an explicit "Step 10 / 30" counter.
          Row(
            children: [
              Expanded(
                child: Text(
                  solvePhaseTitle(l10n, step.phaseName),
                  key: const ValueKey('stage-title'),
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              GuideCounterPill(
                phase: step.phaseName,
                current: index + 1,
                total: total,
              ),
            ],
          ),
          const SizedBox(height: 6),
          StageProgressBar(value: stageProgress),
        ],
        const SizedBox(height: 2),
        Text(
          solveExplanation(
            l10n,
            step,
            scheme: StickerPalette.schemeOf(context),
          ),
          key: const ValueKey('solve-explanation'),
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 2),
        if (session.stepHint case final hint?)
          StepHintText(hint: hint)
        else
          Text(
            wholeCube ? l10n.guideRotateHint : l10n.guideSwipeHint,
            style: secondary,
          ),
      ],
    );

    // The active step glows.
    return GlassCard(
      key: const ValueKey('solve-dock'),
      selected: true,
      accent: AppColors.accent,
      borderRadius: AppRadius.md,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.sm,
        AppSpace.xs,
        AppSpace.xxs,
        AppSpace.xs,
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (fast)
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 2,
                  bottom: AppSpace.xxs,
                ),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: FastMoveBadge(
                    size: size,
                    moves: session.playback.length,
                  ),
                ),
              ),
            header,
            if (_expanded)
              // Long explanations scroll inside the dock, never over the cube.
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.16,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.only(end: AppSpace.xs),
                  child: details,
                ),
              ),
            // Guided / Fast: solver results on the 2x2 and 3x3 only.
            if (_expanded && kFastSolveSizes.contains(size))
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: AppSpace.xs,
                  end: AppSpace.xs,
                ),
                child: SolveMethodToggle(size: size),
              ),
          ],
        ),
      ),
    );
  }
}

/// "Step 10 / 30" (patterns, lessons) or "Move 3 / 15" (the daily scramble
/// guide): where a scripted guide stands, updated on every move.
class GuideCounterPill extends StatelessWidget {
  const GuideCounterPill({
    super.key,
    required this.phase,
    required this.current,
    required this.total,
  });

  final String phase;
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final label = phase == 'dailyScramble'
        ? l10n.guideMoveCounter(current, total)
        : l10n.guideStepCounter(current, total);
    return Container(
      key: const ValueKey('guide-counter'),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        maxLines: 1,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w800,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

/// Headline of a Fast solution as a ratio against the cube's move bound:
/// "17 / 20 moves" (3x3) or "9 / 11 moves" (2x2, always optimal), so it is
/// clear at a glance how short the solution is. Falls back to "Solved in N
/// moves!" in the rare case a solution runs past the bound.
class FastMoveBadge extends StatelessWidget {
  const FastMoveBadge({super.key, required this.size, required this.moves});

  final int size;
  final int moves;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final limit = kFastSolveMoveLimit[size];
    final withinLimit = limit != null && moves <= limit;
    final label = withinLimit
        ? l10n.fastSolveRatio(moves, limit)
        : l10n.fastSolveMoves(moves);
    final badge = Container(
      key: const ValueKey('fast-move-count'),
      padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 12, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        gradient: LinearGradient(
          colors: [
            AppColors.gold.withValues(alpha: 0.28),
            AppColors.accentWarm.withValues(alpha: 0.16),
          ],
        ),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.6)),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withValues(alpha: 0.22),
            blurRadius: 14,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bolt_rounded, size: 18, color: AppColors.gold),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              key: const ValueKey('fast-move-ratio'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.gold,
                fontWeight: FontWeight.w800,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ],
      ),
    );
    if (!withinLimit) return badge;
    return Tooltip(message: l10n.fastSolveRatioTooltip(limit), child: badge);
  }
}

/// Cubie ids to highlight for the current step of [session].
Set<int> solveHighlights(CubeSession session) {
  final step = session.currentStep;
  if (step == null) return const {};
  return {
    for (final position in step.highlightedCubies)
      ?session.cube.cubieIdAt(position),
  };
}

/// Cubie ids of the layer the current step turns, so it stands out on the
/// cube. Empty for whole-cube rotations (nothing to single out).
Set<int> solveFocus(CubeSession session) {
  if (session.currentStep == null) return const {};
  // While a step is half made by hand, only what is left of it glows.
  final moves = session.isIdle && session.partial.isNotEmpty
      ? session.remainingMoves
      : [session.playback[session.currentStepIndex]];
  return {
    for (final move in moves)
      if (move.fromLayer != 0 || move.toLayer != session.size - 1)
        for (final cubie in session.cube.cubies)
          if (session.cube.isAffected(cubie, move)) cubie.id,
  };
}

/// Mid-move encouragement once part of a double or wide turn was swiped.
class StepHintText extends StatelessWidget {
  const StepHintText({super.key, required this.hint});

  final StepHint hint;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      key: ValueKey('step-hint-${hint.name}'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.only(top: 1, end: 4),
          child: Icon(
            Icons.thumb_up_alt_rounded,
            size: 14,
            color: AppColors.accentSecondary,
          ),
        ),
        Expanded(
          child: Text(
            switch (hint) {
              StepHint.halfway => l10n.halfTurnHalfway,
              StepHint.wideInner => l10n.wideTurnInner,
              StepHint.wideOuter => l10n.wideTurnOuter,
              StepHint.wideMore => l10n.wideTurnMore,
            },
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.accentSecondary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Localized title of a solver phase key.
String solvePhaseTitle(AppLocalizations l10n, String phase) => switch (phase) {
  'optimal2x2' => l10n.phaseOptimal2x2,
  'kociembaPhase1' => l10n.phaseKociemba1,
  'kociembaPhase2' => l10n.phaseKociemba2,
  'lblCross' => l10n.phaseLblCross,
  'lblCorners' => l10n.phaseLblCorners,
  'lblMiddle' => l10n.phaseLblMiddle,
  'lblYellowCross' => l10n.phaseLblYellowCross,
  'lblYellowEdges' => l10n.phaseLblYellowEdges,
  'lblYellowCorners' => l10n.phaseLblYellowCorners,
  'lblYellowCornersOrient' => l10n.phaseLblYellowCornersOrient,
  'reductionCenters' => l10n.phaseReductionCenters,
  'reductionEdges' => l10n.phaseReductionEdges,
  'reductionEdgeParity' => l10n.phaseReductionEdgeParity,
  'reductionOllParity' => l10n.phaseReductionOllParity,
  'reductionPllParity' => l10n.phaseReductionPllParity,
  'pattern' => l10n.phasePattern,
  'dailyScramble' => l10n.phaseDailyScramble,
  'twoFirstLayer' => l10n.stageTwoFirstLayer,
  'twoTopColor' => l10n.stageTwoTopColor,
  'twoFinish' => l10n.stageTwoFinish,
  _ => phase,
};

/// Localized explanation of a step's sub-goal.
String solveExplanation(
  AppLocalizations l10n,
  SolveStep step, {
  CubeColorScheme scheme = CubeColorScheme.western,
}) {
  final piece = pieceName(l10n, step.pieceColors, scheme: scheme);
  return switch (step.explanationKey) {
    'optimal2x2Explain' => l10n.explainOptimal2x2,
    'kociembaPhase1Explain' => l10n.explainKociemba1,
    'kociembaPhase2Explain' => l10n.explainKociemba2,
    'lblOrientExplain' => l10n.explainLblOrient,
    'lblCrossEdge' => l10n.explainLblCrossEdge(piece),
    'lblCornerExtract' => l10n.explainLblCornerExtract(piece),
    'lblCornerAlign' => l10n.explainLblCornerAlign(piece),
    'lblCornerInsert' => l10n.explainLblCornerInsert(piece),
    'lblMiddleExtract' => l10n.explainLblMiddleExtract(piece),
    'lblMiddleAlign' => l10n.explainLblMiddleAlign(piece),
    'lblMiddleRight' => l10n.explainLblMiddleRight(piece),
    'lblMiddleLeft' => l10n.explainLblMiddleLeft(piece),
    'lblYellowCrossAlign' => l10n.explainLblYellowCrossAlign,
    'lblYellowCrossAlg' => l10n.explainLblYellowCrossAlg,
    'lblYellowEdgesAlign' => l10n.explainLblYellowEdgesAlign,
    'lblYellowEdgesAlg' => l10n.explainLblYellowEdgesAlg,
    'lblYellowCornersAlg' => l10n.explainLblYellowCornersAlg,
    'lblNextCorner' => l10n.explainLblNextCorner,
    'lblCornerTwist' => l10n.explainLblCornerTwist,
    'lblFinalAlign' => l10n.explainLblFinalAlign,
    'reductionCenterBlock' => l10n.explainReductionCenterBlock,
    'reductionCenterCycle' => l10n.explainReductionCenterCycle(piece),
    'reductionParityCenters' => l10n.explainReductionParityCenters,
    'reductionEdgeCycle' => l10n.explainReductionEdgeCycle(piece),
    'reductionEdgeParity' => l10n.explainReductionEdgeParity,
    'reductionOllParity' => l10n.explainReductionOllParity,
    'reductionPllParity' => l10n.explainReductionPllParity,
    'patternStep' => l10n.explainPatternStep,
    'dailyScrambleStep' => l10n.explainDailyScramble,
    'twoFirstLayerExplain' => l10n.explainTwoFirstLayer,
    'twoTopColorExplain' => l10n.explainTwoTopColor,
    'twoFinishExplain' => l10n.explainTwoFinish,
    _ => '',
  };
}

/// Localized piece name from logical color letters, e.g. "WR" ->
/// "white-red", named as the colors show under [scheme].
String pieceName(
  AppLocalizations l10n,
  String letters, {
  CubeColorScheme scheme = CubeColorScheme.western,
}) => [
  for (final letter in letters.split(''))
    switch (stickerColorOf(letter)) {
      final color? => colorName(l10n, color, scheme: scheme),
      null => letter,
    },
].join('-');

/// Localized message for a solver error key.
String solveErrorText(AppLocalizations l10n, String code, int size) =>
    switch (code) {
      'unsupported' => l10n.solveUnavailable(size),
      'unavailable' => l10n.solveEngineMissing,
      _ => l10n.solveFailed(code),
    };
