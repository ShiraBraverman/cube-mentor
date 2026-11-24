import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../../shared/widgets/cube_icons/cube_icons.dart';
import '../academy/academy_screen.dart';
import '../academy/model/academy_progress.dart';
import '../academy/model/lesson_catalog.dart';
import '../patterns/patterns_screen.dart';
import '../scanner/scanner_screen.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../train/train_screen.dart';
import 'home_controller.dart';

/// The four core experiences as a balanced 2x2 grid of glass cards, each
/// opening on the cube size selected in the carousel above.
class HomeActionGrid extends ConsumerWidget {
  const HomeActionGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final size = ref.watch(selectedCubeSizeProvider);
    // The "coming soon" cube has nothing to scan or solve.
    final mystery = ref.watch(showingMysteryProvider);
    final sizeLabel = l10n.cubeSizeLabel(size);
    final academy = ref.watch(academyProgressProvider);

    void open(Widget screen) =>
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (_) => screen));

    Widget row(Widget a, Widget b) => IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: a),
          const SizedBox(width: AppSpace.sm),
          Expanded(child: b),
        ],
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        row(
          HomeActionCard(
            key: const ValueKey('home-scan-solve'),
            icon: AnimatedScannerCubeIcon(animate: !mystery),
            title: l10n.modeScanSolve,
            badge: sizeLabel,
            accent: AppColors.accent,
            onTap: mystery ? null : () => showScanSolveSheet(context, size),
          ),
          HomeActionCard(
            key: const ValueKey('home-academy'),
            icon: const AnimatedAcademyCubeIcon(),
            title: l10n.homeAcademy,
            subtitle: l10n.homeAcademyProgress(
              academy.completedCount,
              kLessons.length,
            ),
            badge: sizeLabel,
            accent: AppColors.gold,
            onTap: () => open(AcademyScreen(initialSize: size)),
          ),
        ),
        const SizedBox(height: AppSpace.sm),
        row(
          HomeActionCard(
            key: const ValueKey('home-patterns'),
            icon: const AnimatedPatternCubeIcon(),
            title: l10n.homePatterns,
            badge: sizeLabel,
            accent: AppColors.accentSecondary,
            onTap: () => open(PatternsScreen(initialSize: size)),
          ),
          HomeActionCard(
            key: const ValueKey('home-practice'),
            icon: const AnimatedTimerCubeIcon(),
            title: l10n.homePractice,
            badge: sizeLabel,
            accent: AppColors.danger,
            onTap: () => open(TrainScreen(size: size)),
          ),
        ),
      ],
    );
  }
}

/// One home action: animated mini-cube icon on an accent tile, the
/// selected size as a badge, and a short title (up to two lines).
class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.badge,
    required this.accent,
    required this.onTap,
    this.subtitle,
  });

  final Widget icon;
  final String title;

  /// A short status line under the title, e.g. the Academy's progress.
  final String? subtitle;

  /// The selected cube size, e.g. "3×3".
  final String badge;
  final Color accent;

  /// Null disables the card (dimmed).
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: [title, ?subtitle, badge].join(', '),
      excludeSemantics: true,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: onTap == null ? 0.45 : 1,
        child: GlassCard(
          onTap: onTap,
          borderRadius: AppRadius.lg,
          padding: const EdgeInsetsDirectional.fromSTEB(
            AppSpace.sm,
            AppSpace.sm,
            AppSpace.sm,
            AppSpace.sm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CubeIconTile(
                    accent: accent,
                    size: 44,
                    glow: true,
                    child: icon,
                  ),
                  const SizedBox(width: AppSpace.xs),
                  Flexible(
                    child: _SizeBadge(label: badge, color: accent),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.xs),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (subtitle case final line?) ...[
                const SizedBox(height: 2),
                Text(
                  line,
                  key: const ValueKey('home-academy-progress'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Small pill with the selected size. Unlike `AppPill` it has no layout
/// builder, so the grid rows can size the cards to the taller one.
class _SizeBadge extends StatelessWidget {
  const _SizeBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        color: color.withValues(alpha: 0.14),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        // Digits and the times sign read left to right in every language.
        textDirection: TextDirection.ltr,
        style: Theme.of(context).textTheme.labelMedium
            ?.copyWith(color: color, fontWeight: FontWeight.w800),
      ),
    );
  }
}

/// Asks how to start solving a [size] cube: scan the real one with the
/// camera, or open the 3D cube.
Future<void> showScanSolveSheet(BuildContext context, int size) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ScanSolveSheet(size: size),
    );

/// Content of [showScanSolveSheet]: two big choices for the [size] cube.
class ScanSolveSheet extends StatelessWidget {
  const ScanSolveSheet({super.key, required this.size});

  final int size;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final navigator = Navigator.of(context);

    void go(Widget screen) {
      // Close the sheet, then open the screen from the home route.
      navigator
        ..pop()
        ..push(MaterialPageRoute<void>(builder: (_) => screen));
    }

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.85,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
          child: GlassCard(
            key: const ValueKey('scan-solve-sheet'),
            blur: 28,
            borderRadius: AppRadius.lg,
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppSpace.gutter,
              AppSpace.gutter,
              AppSpace.gutter,
              AppSpace.gutter,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.modeScanSolve,
                          style: textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(width: AppSpace.xs),
                      AppPill(
                        label: l10n.cubeSizeLabel(size),
                        color: AppColors.accent,
                        icon: Icons.view_in_ar_rounded,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpace.xxs),
                  Text(
                    l10n.scanChoiceSubtitle,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpace.md),
                  _ChoiceTile(
                    key: const ValueKey('scan-choice-camera'),
                    icon: const AnimatedScannerCubeIcon(),
                    accent: AppColors.accent,
                    title: l10n.scanChoiceCamera,
                    description: l10n.scanChoiceCameraDesc,
                    onTap: () => go(ScannerScreen(size: size)),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  _ChoiceTile(
                    key: const ValueKey('scan-choice-3d'),
                    icon: const AnimatedSolveCubeIcon(),
                    accent: AppColors.accentSecondary,
                    title: l10n.scanChoice3d,
                    description: l10n.scanChoice3dDesc,
                    onTap: () => go(Solver3DScreen(size: size)),
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

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    super.key,
    required this.icon,
    required this.accent,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final Widget icon;
  final Color accent;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.md,
        AppSpace.sm,
        AppSpace.md,
      ),
      child: Row(
        children: [
          CubeIconTile(accent: accent, size: 52, glow: true, child: icon),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleMedium),
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
