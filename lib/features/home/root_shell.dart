import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads/app_banner_ad.dart';
import '../../core/feedback/feedback_service.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../shared/widgets/cube_icons/cube_icons.dart';
import '../academy/academy_screen.dart';
import '../academy/model/academy_progress.dart';
import '../academy/model/lesson_catalog.dart';
import '../scanner/scanner_screen.dart';
import '../train/train_screen.dart';
import 'home_controller.dart';
import 'home_screen.dart';

/// The app's root: four tabs (Solve, Scan, Academy, Train) under a floating
/// glass dock. Solve, Academy and Train keep their state while hidden; the
/// scanner exists only while its tab is shown, so the camera is released as
/// soon as the user switches away.
class RootShell extends ConsumerWidget {
  const RootShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(currentTabProvider);
    final size = ref.watch(selectedCubeSizeProvider);

    Widget page(AppTab of, Widget child) => TickerMode(
      // Hidden tabs stop animating (the carousel spins forever).
      enabled: tab == of,
      child: child,
    );

    return PopScope(
      // Back from another tab returns to Solve before leaving the app.
      canPop: tab == AppTab.solve,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          ref.read(currentTabProvider.notifier).select(AppTab.solve);
        }
      },
      child: GlassBackground(
        child: Scaffold(
          body: IndexedStack(
            index: tab.index,
            children: [
              page(AppTab.solve, const HomeScreen()),
              page(
                AppTab.scan,
                tab == AppTab.scan
                    ? ScannerScreen(
                        key: ValueKey('scan-tab-$size'),
                        size: size,
                        embedded: true,
                      )
                    : const SizedBox.shrink(),
              ),
              page(AppTab.academy, const AcademyScreen()),
              page(AppTab.train, const TrainScreen()),
            ],
          ),
          // The banner sits between the page and the dock, never over the
          // content; it is hidden while the camera preview is on screen.
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBannerAd(visible: tab != AppTab.scan),
              const GlassDock(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Frosted obsidian navigation dock: icon and short label per tab, the
/// active one lit with the accent. Order follows the reading direction.
class GlassDock extends ConsumerWidget {
  const GlassDock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final tab = ref.watch(currentTabProvider);
    final done = ref.watch(
      academyProgressProvider.select((p) => p.completedCount),
    );

    void select(AppTab to) {
      if (to != tab) ref.read(feedbackProvider).tap();
      ref.read(currentTabProvider.notifier).select(to);
    }

    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: AppSpace.xs),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          AppSpace.sm,
          AppSpace.xxs,
          AppSpace.sm,
          AppSpace.xxs,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: const [
              BoxShadow(
                color: Color(0x66000000),
                blurRadius: 24,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: Container(
                key: const ValueKey('glass-dock'),
                height: 68,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.glassFillStrong,
                      AppColors.glassHighlight,
                    ],
                  ),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Row(
                  children: [
                    _DockItem(
                      tab: AppTab.solve,
                      icon: AnimatedSolveCubeIcon.new,
                      label: l10n.tabSolve,
                      selected: tab == AppTab.solve,
                      onTap: select,
                    ),
                    _DockItem(
                      tab: AppTab.scan,
                      icon: AnimatedScannerCubeIcon.new,
                      label: l10n.tabScan,
                      selected: tab == AppTab.scan,
                      onTap: select,
                    ),
                    _DockItem(
                      tab: AppTab.academy,
                      icon: AnimatedAcademyCubeIcon.new,
                      label: l10n.tabAcademy,
                      selected: tab == AppTab.academy,
                      onTap: select,
                      badge: l10n.progressFraction(done, kLessons.length),
                    ),
                    _DockItem(
                      tab: AppTab.train,
                      icon: AnimatedTimerCubeIcon.new,
                      label: l10n.tabTrain,
                      selected: tab == AppTab.train,
                      onTap: select,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DockItem extends StatelessWidget {
  const _DockItem({
    required this.tab,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  final AppTab tab;

  /// Builds the tab's mini-cube icon; only the selected tab animates.
  final AnimatedCubeIcon Function({
    Key? key,
    double size,
    bool animate,
    String? semanticLabel,
  })
  icon;
  final String label;
  final bool selected;
  final ValueChanged<AppTab> onTap;

  /// Small progress badge on the icon, e.g. "1/29".
  final String? badge;

  static const _muted = ColorFilter.matrix([
    0.55, 0.36, 0.05, 0, 0, //
    0.15, 0.76, 0.05, 0, 0, //
    0.15, 0.36, 0.45, 0, 0, //
    0, 0, 0, 0.6, 0,
  ]);

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.accent : AppColors.textSecondary;
    Widget glyph = icon(size: 26, animate: selected);
    if (!selected) {
      // Resting tabs are muted (partly desaturated and dimmed) so the
      // active, animated one stands out.
      glyph = ColorFiltered(colorFilter: _muted, child: glyph);
    }
    if (badge != null) {
      glyph = Badge(
        key: ValueKey('tab-${tab.name}-badge'),
        backgroundColor: AppColors.gold,
        textColor: AppColors.onAccent,
        offset: const Offset(14, -6),
        // Digits and the slash read left to right in every language.
        label: Text(badge!, textDirection: TextDirection.ltr),
        child: glyph,
      );
    }
    return Expanded(
      child: Semantics(
        selected: selected,
        button: true,
        label: label,
        excludeSemantics: true,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            key: ValueKey('tab-${tab.name}'),
            borderRadius: BorderRadius.circular(AppRadius.md),
            onTap: () => onTap(tab),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                    color: selected
                        ? AppColors.accent.withValues(alpha: 0.16)
                        : Colors.transparent,
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.25),
                              blurRadius: 14,
                              spreadRadius: -4,
                            ),
                          ]
                        : const [],
                  ),
                  child: glyph,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: color,
                        fontWeight: selected
                            ? FontWeight.w800
                            : FontWeight.w600,
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
