import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../home/home_controller.dart';
import '../solver_3d/model/guide_script.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../solver_3d/widgets/cube_preview.dart';
import 'patterns.dart';

/// Gallery of classic patterns, one page per cube size: tap a size chip or
/// swipe sideways anywhere to switch. Opening one plays it on the 3D cube
/// step by step (follow along on a real cube), and the Solve button brings
/// it back to normal.
class PatternsScreen extends ConsumerStatefulWidget {
  /// Always opens on the 3x3, the size most people own.
  const PatternsScreen({super.key, this.initialSize = 3});

  final int initialSize;

  @override
  ConsumerState<PatternsScreen> createState() => _PatternsScreenState();
}

class _PatternsScreenState extends ConsumerState<PatternsScreen> {
  static const _pageDuration = Duration(milliseconds: 300);

  late int _page = max(0, kCubeSizes.indexOf(widget.initialSize));
  late final PageController _pages = PageController(initialPage: _page);

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    if (page < 0 || page >= kCubeSizes.length) return;
    setState(() => _page = page);
    _pages.animateToPage(
      page,
      duration: _pageDuration,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.patternsTitle)),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // The header swipes too, so a sideways swipe anywhere on
                  // the screen changes the size.
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onHorizontalDragEnd: (details) {
                      final v = details.primaryVelocity ?? 0;
                      if (v.abs() < 200) return;
                      // Swiping toward the reading start shows the next size.
                      final forward = rtl ? v > 0 : v < 0;
                      _goTo(_page + (forward ? 1 : -1));
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        AppSpace.gutter,
                        AppSpace.xxs,
                        AppSpace.gutter,
                        AppSpace.md,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.patternsHint,
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppSpace.md),
                          Wrap(
                            spacing: AppSpace.xs,
                            runSpacing: AppSpace.xs,
                            children: [
                              for (final (i, size) in kCubeSizes.indexed)
                                ChoiceChip(
                                  key: ValueKey('patterns-size-$size'),
                                  label: Text(l10n.cubeSizeLabel(size)),
                                  selected: i == _page,
                                  onSelected: (_) => _goTo(i),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      key: const ValueKey('patterns-pages'),
                      controller: _pages,
                      itemCount: kCubeSizes.length,
                      onPageChanged: (page) => setState(() => _page = page),
                      itemBuilder: (context, i) =>
                          _PatternGrid(size: kCubeSizes[i]),
                    ),
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

/// The patterns of one cube size.
class _PatternGrid extends StatelessWidget {
  const _PatternGrid({required this.size});

  final int size;

  @override
  Widget build(BuildContext context) {
    final patterns = [
      for (final p in kPatterns)
        if (p.supports(size)) p,
    ];
    return GridView.builder(
      key: PageStorageKey('patterns-grid-$size'),
      padding: kPagePadding,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        mainAxisSpacing: AppSpace.sm,
        crossAxisSpacing: AppSpace.sm,
        childAspectRatio: 0.82,
      ),
      itemCount: patterns.length,
      itemBuilder: (context, i) =>
          _PatternCard(pattern: patterns[i], size: size),
    );
  }
}

class _PatternCard extends StatelessWidget {
  const _PatternCard({required this.pattern, required this.size});

  final CubePattern pattern;
  final int size;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final moves = pattern.movesFor(size);
    final name = patternName(l10n, pattern.id);
    return GlassCard(
      key: ValueKey('pattern-${pattern.id}'),
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.sm,
        AppSpace.sm,
        AppSpace.sm,
        AppSpace.md,
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => Solver3DScreen(
            size: size,
            title: l10n.patternTitle(name, size),
            guide: GuideScript(
              start: CubeState.solved(size),
              moves: moves,
              phase: 'pattern',
              explanation: 'patternStep',
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: CubePreview(size: size, cube: pattern.stateFor(size)),
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            name,
            style: textTheme.titleSmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            l10n.solveSummary(moves.length),
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
