import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/onboarding.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../../shared/widgets/cube_icons/cube_icons.dart';
import 'onboarding_patterns.dart';

/// First-launch intro: four swipeable pages (what CubeMentor is, scan &
/// solve, the Academy, live patterns and the 3D Playground), page dots,
/// Skip and Next / Get started. Finishing
/// or skipping marks it seen, so it never shows again; [onDone] then opens
/// the app.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key, this.onDone, this.initialPage = 0});

  /// Called after the intro is marked seen; by default nothing (the app
  /// root switches to the home screen by itself).
  final VoidCallback? onDone;

  /// Page shown first (screenshots open a later page directly).
  final int initialPage;

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  static const _pages = 4;
  late final _controller = PageController(initialPage: widget.initialPage);
  late int _page = widget.initialPage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await ref.read(onboardingSeenProvider.notifier).markSeen();
    widget.onDone?.call();
  }

  void _next() {
    if (_page == _pages - 1) {
      _finish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final last = _page == _pages - 1;
    final pages = [
      _OnboardingPage(
        key: const ValueKey('onboarding-page-0'),
        icon: const AnimatedSolveCubeIcon(),
        accent: AppColors.gold,
        title: l10n.onboardingWhatTitle,
        body: l10n.onboardingWhatBody,
        footer: Wrap(
          alignment: WrapAlignment.center,
          spacing: AppSpace.xs,
          runSpacing: AppSpace.xs,
          children: [
            for (var n = 2; n <= 6; n++)
              AppPill(label: l10n.cubeSizeLabel(n), color: AppColors.gold),
          ],
        ),
      ),
      _OnboardingPage(
        key: const ValueKey('onboarding-page-1'),
        icon: const AnimatedScannerCubeIcon(),
        accent: AppColors.accent,
        title: l10n.onboardingScanTitle,
        body: l10n.onboardingScanBody,
      ),
      _OnboardingPage(
        key: const ValueKey('onboarding-page-2'),
        icon: const AnimatedAcademyCubeIcon(),
        accent: AppColors.accentSecondary,
        title: l10n.onboardingLearnTitle,
        body: l10n.onboardingLearnBody,
      ),
      _OnboardingPage(
        key: const ValueKey('onboarding-page-3'),
        hero: const OnboardingPatternShowcase(),
        title: l10n.onboardingPatternsTitle,
        body: l10n.onboardingPatternsBody,
      ),
    ];

    return GlassBackground(
      child: Scaffold(
        key: const ValueKey('onboarding'),
        body: SafeArea(
          child: PageFrame(
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      AppSpace.sm,
                      AppSpace.xs,
                      AppSpace.sm,
                      0,
                    ),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: last ? 0 : 1,
                      child: TextButton(
                        key: const ValueKey('onboarding-skip'),
                        onPressed: last ? null : _finish,
                        child: Text(l10n.onboardingSkip),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (page) => setState(() => _page = page),
                    children: pages,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    AppSpace.gutter,
                    AppSpace.sm,
                    AppSpace.gutter,
                    AppSpace.lg,
                  ),
                  child: Column(
                    children: [
                      _Dots(count: _pages, current: _page),
                      const SizedBox(height: AppSpace.md),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          key: const ValueKey('onboarding-next'),
                          onPressed: _next,
                          child: Text(
                            last ? l10n.onboardingStart : l10n.onboardingNext,
                          ),
                        ),
                      ),
                    ],
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

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    super.key,
    this.icon,
    this.accent = AppColors.accent,
    this.hero,
    required this.title,
    required this.body,
    this.footer,
  });

  final Widget? icon;
  final Color accent;

  /// Replaces the icon tile (the live pattern showcase).
  final Widget? hero;
  final String title;
  final String body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // Short phones and long translations scroll inside the page.
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.gutter),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hero ??
                  CubeIconTile(
                    accent: accent,
                    size: 132,
                    glow: true,
                    child: icon ?? const SizedBox.shrink(),
                  ),
              const SizedBox(height: AppSpace.lg),
              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSpace.sm),
              Text(
                body,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              if (footer case final footer?) ...[
                const SizedBox(height: AppSpace.md),
                footer,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.current});

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: i == current ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: i == current ? AppColors.accent : AppColors.glassBorder,
            ),
          ),
      ],
    );
  }
}
