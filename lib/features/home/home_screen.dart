import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../solver_3d/solver_3d_screen.dart';
import 'cube_carousel.dart';
import 'home_controller.dart';
import 'language_sheet.dart';
import 'settings_sheet.dart';

/// The Solve tab: the endless cube carousel as the hero and one bold call
/// to action that opens the 3D cube and solver for the selected size.
/// Everything fits above the fold; very short screens scroll as a fallback.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return GlassBackground(
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: PageFrame(
            child: LayoutBuilder(
              builder: (context, constraints) {
                const padding = EdgeInsetsDirectional.fromSTEB(
                  AppSpace.gutter,
                  AppSpace.md,
                  AppSpace.gutter,
                  AppSpace.lg,
                );
                final top = [
                  const HomeHeader(),
                  const SizedBox(height: AppSpace.xxs),
                  Text(
                    l10n.homeTagline,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SectionHeader(title: l10n.chooseCubeSize, top: AppSpace.lg),
                ];
                const cta = [
                  SizedBox(height: AppSpace.md),
                  _OpenSolverButton(),
                ];
                // Very short screens (landscape, split screen) scroll.
                if (constraints.maxHeight < _kMinFoldHeight) {
                  return SingleChildScrollView(
                    padding: padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...top,
                        const CubeCarousel(height: _kMinHeroHeight),
                        ...cta,
                      ],
                    ),
                  );
                }
                // Otherwise the hero takes whatever the header and the
                // call to action leave: no scrolling.
                return Padding(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...top,
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, hero) => Align(
                            alignment: Alignment.topCenter,
                            child: CubeCarousel(
                              height: (hero.maxHeight - _kCarouselChrome).clamp(
                                120.0,
                                420.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ...cta,
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Below this height the Solve tab scrolls instead of fitting the fold.
const double _kMinFoldHeight = 560;

/// Smallest comfortable hero (cube and stage) height.
const double _kMinHeroHeight = 240;

/// Height the carousel adds below its hero: the gap and the dots.
const double _kCarouselChrome = 64;

/// App title with the language and settings buttons.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.appTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpace.xs),
        const LanguageButton(),
        const SizedBox(width: AppSpace.xs),
        const SettingsButton(),
      ],
    );
  }
}

/// "Open 3D Cube & Solver" for the size on the carousel; disabled while the
/// "coming soon" cube is shown.
class _OpenSolverButton extends ConsumerWidget {
  const _OpenSolverButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final size = ref.watch(selectedCubeSizeProvider);
    final mystery = ref.watch(showingMysteryProvider);
    return SizedBox(
      height: 60,
      child: FilledButton.icon(
        key: const ValueKey('open-solver'),
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        onPressed: mystery
            ? null
            : () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => Solver3DScreen(size: size),
                ),
              ),
        icon: const Icon(Icons.view_in_ar_rounded, size: 26),
        label: Text(
          l10n.openCubeSolver,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
