import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/facelets.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/solver/solve_step.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass.dart';
import '../model/cube_session.dart';

/// Glass banner above the cube explaining the current solution step: the
/// phase and progress, what this move achieves, the move itself and how to
/// make it. Stays up until the cube is solved, then celebrates.
class SolveBanner extends ConsumerWidget {
  const SolveBanner({super.key, required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    if (session.steps.isEmpty) return const SizedBox.shrink();
    final textTheme = Theme.of(context).textTheme;
    final step = session.currentStep;
    final index = session.currentStepIndex;
    final total = session.steps.length;
    final complete = step == null && index >= total;
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final secondary = textTheme.bodySmall?.copyWith(
      color: AppColors.textSecondary,
    );

    final Widget content;
    if (complete) {
      content = Row(
        key: const ValueKey('solve-complete'),
        children: [
          const Icon(
            Icons.celebration_rounded,
            color: AppColors.accentSecondary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.solveComplete,
                  style: textTheme.titleMedium?.copyWith(
                    color: AppColors.accentSecondary,
                  ),
                ),
                Text(l10n.solveSummary(total), style: secondary),
              ],
            ),
          ),
        ],
      );
    } else if (step == null) {
      return const SizedBox.shrink();
    } else {
      final move = session.playback[index];
      final wholeCube = move.fromLayer == 0 && move.toLayer == size - 1;
      content = Row(
        key: ValueKey('solve-step-$index-${step.explanationKey}'),
        children: [
          _MoveChip(notation: step.moveNotation, tooltip: l10n.nextMove),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        solvePhaseTitle(l10n, step.phaseName),
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.playbackProgress(index + 1, total),
                      key: const ValueKey('solve-progress'),
                      style: secondary,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  solveExplanation(l10n, step),
                  style: textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  wholeCube ? l10n.guideRotateHint : l10n.guideSwipeHint,
                  style: secondary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return GlassCard(
      borderRadius: 18,
      padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 4, 10),
      child: Row(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: content,
            ),
          ),
          IconButton(
            key: const ValueKey('guide-exit'),
            tooltip: l10n.guideExit,
            visualDensity: VisualDensity.compact,
            onPressed: controller.clearSolution,
            icon: const Icon(Icons.close_rounded, size: 20),
          ),
        ],
      ),
    );
  }
}

class _MoveChip extends StatelessWidget {
  const _MoveChip({required this.notation, required this.tooltip});

  final String notation;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        constraints: const BoxConstraints(minWidth: 52),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.accent.withValues(alpha: 0.18),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.6)),
        ),
        child: Text(
          notation,
          textAlign: TextAlign.center,
          // Notation always reads left to right.
          textDirection: TextDirection.ltr,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
    );
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
  final move = session.playback[session.currentStepIndex];
  if (move.fromLayer == 0 && move.toLayer == session.size - 1) return const {};
  return {
    for (final cubie in session.cube.cubies)
      if (session.cube.isAffected(cubie, move)) cubie.id,
  };
}

/// Localized title of a solver phase key.
String solvePhaseTitle(AppLocalizations l10n, String phase) => switch (phase) {
  'optimal2x2' => l10n.phaseOptimal2x2,
  'kociembaPhase1' => l10n.phaseKociemba1,
  'kociembaPhase2' => l10n.phaseKociemba2,
  'lblOrient' => l10n.phaseLblOrient,
  'lblCross' => l10n.phaseLblCross,
  'lblCorners' => l10n.phaseLblCorners,
  'lblMiddle' => l10n.phaseLblMiddle,
  'lblYellowCross' => l10n.phaseLblYellowCross,
  'lblYellowEdges' => l10n.phaseLblYellowEdges,
  'lblYellowCorners' => l10n.phaseLblYellowCorners,
  'lblYellowCornersOrient' => l10n.phaseLblYellowCornersOrient,
  _ => phase,
};

/// Localized explanation of a step's sub-goal.
String solveExplanation(AppLocalizations l10n, SolveStep step) {
  final piece = pieceName(l10n, step.pieceColors);
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
    _ => '',
  };
}

/// Localized piece name from color letters, e.g. "WR" -> "white-red".
String pieceName(AppLocalizations l10n, String letters) => [
  for (final letter in letters.split(''))
    switch (stickerColorOf(letter)) {
      StickerColor.white => l10n.colorWhite,
      StickerColor.yellow => l10n.colorYellow,
      StickerColor.green => l10n.colorGreen,
      StickerColor.blue => l10n.colorBlue,
      StickerColor.red => l10n.colorRed,
      StickerColor.orange => l10n.colorOrange,
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
