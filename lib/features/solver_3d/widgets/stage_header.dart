import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/crown_words.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/solver/solve_stages.dart';
import '../../../core/theme/app_colors.dart';
import 'crown_tracker.dart';

/// Localized title of a stage: "White cross", "Build center blocks"...
String stageTitle(AppLocalizations l10n, SolveStage stage) =>
    switch (stage.kind) {
      StageKind.subStep => subStepTitle(l10n, stage.crown, stage.subStep),
      StageKind.centers => l10n.stageCenters,
      StageKind.edges => l10n.stageEdges,
      StageKind.parity => l10n.stageParity,
      StageKind.crown => switch (stage.crown) {
        1 => l10n.stageCrown1,
        2 => l10n.stageCrown2,
        _ => l10n.stageCrown3,
      },
      StageKind.orient => l10n.stageOrient,
      StageKind.finish => l10n.stageFinish,
      StageKind.asThree => l10n.stageAsThree,
      StageKind.twoByTwo => l10n.stageTwoByTwo,
    };

/// "Crown 1 • Stage 1 of 7: White cross" (3x3 beginner's method) or
/// "Stage 2 of 6: Pair outer & inner edges".
String stageHeadline(AppLocalizations l10n, SolveStage stage) =>
    stage.kind == StageKind.subStep
    ? l10n.stageCrownHeader(
        stage.crown,
        stage.number,
        stage.total,
        stageTitle(l10n, stage),
      )
    : l10n.stageHeader(stage.number, stage.total, stageTitle(l10n, stage));

/// Where the learner is: the stage headline, a progress bar for this stage
/// only (never a move count), the crown tracker for crown stages, and the
/// sub-step ("1.2 First crown corners") of a big cube's crown.
class StageHeader extends StatelessWidget {
  const StageHeader({
    super.key,
    required this.stage,
    required this.progress,
    this.subStepLabel,
    this.subStepName,
  });

  final SolveStage stage;

  /// 0..1 within this stage.
  final double progress;

  /// Sub-step of a big cube's crown stage, e.g. "1.2" and its title.
  final String? subStepLabel;
  final String? subStepName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final crowned =
        stage.kind == StageKind.subStep || stage.kind == StageKind.crown;
    return Column(
      key: const ValueKey('stage-header'),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (crowned) ...[
              CrownTracker(active: stage.crown),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                stageHeadline(l10n, stage),
                key: const ValueKey('stage-title'),
                style: textTheme.labelLarge?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (subStepLabel != null && subStepName != null) ...[
          const SizedBox(height: 2),
          Text(
            '$subStepLabel $subStepName',
            key: const ValueKey('stage-substep'),
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        const SizedBox(height: 6),
        StageProgressBar(value: progress),
      ],
    );
  }
}

/// Slim glowing bar animating to [value].
class StageProgressBar extends StatelessWidget {
  const StageProgressBar({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: const ValueKey('stage-progress'),
      tween: Tween(end: value.clamp(0.0, 1.0)),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      builder: (context, v, _) => ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: v,
          minHeight: 6,
          backgroundColor: AppColors.glassBorder,
          valueColor: const AlwaysStoppedAnimation(AppColors.accentSecondary),
        ),
      ),
    );
  }
}
