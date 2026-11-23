import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import 'cube_carousel.dart';
import 'home_actions.dart';
import 'language_sheet.dart';
import 'settings_sheet.dart';

/// The home screen: the endless cube carousel as the hero size selector
/// and, below it, four action cards (Scan & Solve, Academy, Cool Patterns,
/// Timer & Daily Challenge) that all open on the selected size.
/// Everything fits above the fold; very short screens scroll as a fallback.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

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
                  AppSpace.md,
                );
                final top = [
                  const HomeHeader(),
                  SectionHeader(title: l10n.chooseCubeSize, top: AppSpace.sm),
                ];
                const actions = [
                  SizedBox(height: AppSpace.sm),
                  HomeActionGrid(),
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
                        ...actions,
                      ],
                    ),
                  );
                }
                // Otherwise the hero takes whatever the header and the
                // action cards leave: no scrolling.
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
                                380.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ...actions,
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

/// Below this height the home screen scrolls instead of fitting the fold.
const double _kMinFoldHeight = 600;

/// Smallest comfortable hero (cube and stage) height.
const double _kMinHeroHeight = 200;

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
