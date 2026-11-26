import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/solver/solve_step.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass.dart';
import '../../../core/theme/ui_kit.dart';
import '../../../shared/widgets/cube_icons/cube_icons.dart';

/// Asks how to solve the playground cube, like the post-scan review: Fast
/// Solve (the primary, highlighted choice) or the guided 3-crown solve.
/// Returns null when dismissed.
Future<SolveMethod?> showSolveChoiceSheet(BuildContext context) =>
    showModalBottomSheet<SolveMethod>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SolveChoiceSheet(),
    );

/// Content of [showSolveChoiceSheet].
class SolveChoiceSheet extends StatelessWidget {
  const SolveChoiceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final navigator = Navigator.of(context);
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.85,
          maxWidth: 560,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
          child: GlassCard(
            key: const ValueKey('solve-choice-sheet'),
            blur: 28,
            borderRadius: AppRadius.lg,
            padding: const EdgeInsetsDirectional.all(AppSpace.gutter),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.solveChoiceTitle, style: textTheme.titleLarge),
                  const SizedBox(height: AppSpace.md),
                  _MethodTile(
                    key: const ValueKey('solve-choice-fast'),
                    primary: true,
                    icon: Icons.bolt_rounded,
                    title: l10n.solveFast,
                    description: l10n.solveChoiceFastDesc,
                    onTap: () => navigator.pop(SolveMethod.fast),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  _MethodTile(
                    key: const ValueKey('solve-choice-guided'),
                    icon: Icons.auto_awesome_motion_rounded,
                    title: l10n.solveLearn,
                    description: l10n.solveChoiceGuidedDesc,
                    onTap: () => navigator.pop(SolveMethod.layerByLayer),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MethodTile extends StatelessWidget {
  const _MethodTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    this.primary = false,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = primary ? AppColors.accent : AppColors.accentSecondary;
    return GlassCard(
      onTap: onTap,
      selected: primary,
      accent: accent,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.md,
        AppSpace.sm,
        AppSpace.md,
      ),
      child: Row(
        children: [
          AccentIcon(icon: icon, color: accent, glow: primary),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(description, style: textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          // Mirrors automatically in RTL (matchTextDirection).
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textTertiary,
          ),
        ],
      ),
    );
  }
}

/// What the user picked on the [GuidedSolvedDialog].
enum GuidedSolvedAction { solveAgain, home }

/// Celebration at the end of a guided (step-by-step) solve: "Solved!",
/// then Solve again (the same cube from its first step) or Back to Home.
class GuidedSolvedDialog extends StatelessWidget {
  const GuidedSolvedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final navigator = Navigator.of(context);
    return Dialog(
      key: const ValueKey('guided-solved'),
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSpace.gutter,
        vertical: AppSpace.lg,
      ),
      child: GlassCard(
        blur: 28,
        selected: true,
        accent: AppColors.gold,
        borderRadius: AppRadius.lg,
        padding: const EdgeInsetsDirectional.fromSTEB(
          AppSpace.gutter,
          AppSpace.lg,
          AppSpace.gutter,
          AppSpace.md,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: CubeIconTile(
                  accent: AppColors.gold,
                  size: 84,
                  glow: true,
                  child: AnimatedSolveCubeIcon(),
                ),
              ),
              const SizedBox(height: AppSpace.md),
              Text(
                l10n.guidedSolvedTitle,
                key: const ValueKey('guided-solved-title'),
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.gold,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSpace.xs),
              Text(
                l10n.guidedSolvedBody,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpace.lg),
              FilledButton.icon(
                key: const ValueKey('guided-solved-again'),
                onPressed: () => navigator.pop(GuidedSolvedAction.solveAgain),
                icon: const Icon(Icons.replay_rounded),
                label: Text(l10n.solveAgain, textAlign: TextAlign.center),
              ),
              const SizedBox(height: AppSpace.xs),
              OutlinedButton.icon(
                key: const ValueKey('guided-solved-home'),
                onPressed: () => navigator.pop(GuidedSolvedAction.home),
                icon: const Icon(Icons.home_rounded),
                label: Text(l10n.backToHome, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
