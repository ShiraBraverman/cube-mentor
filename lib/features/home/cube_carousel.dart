import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/ui_kit.dart';
import '../solver_3d/interaction/eager_pan.dart';
import '../solver_3d/render/cube_painter.dart';
import '../solver_3d/widgets/cube_preview.dart';
import 'home_controller.dart';

/// Number of carousel items: every cube size plus the "coming soon" cube.
const int kCarouselItems = 6;

/// Index of the "coming soon" mystery cube in the carousel.
const int kMysteryItem = 5;

/// Cube size of carousel [item], or null for the mystery cube.
int? carouselSize(int item) =>
    item < kCubeSizes.length ? kCubeSizes[item] : null;

/// The home hero: an endless carousel `2x2 -> ... -> 6x6 -> ? -> 2x2` on a
/// slowly turning glowing stage.
///
/// One gesture layer covers the whole hero, so a drag works wherever the
/// finger lands, on the cube or beside it. A drag that starts sideways slides
/// the carousel (following the finger, settling on the nearest cube); one
/// that starts up, down or diagonally orbits the cube freely in 360 degrees
/// for the rest of that touch. Chevrons and the dots below switch with one
/// tap.
class CubeCarousel extends ConsumerStatefulWidget {
  const CubeCarousel({super.key, this.height = 280});

  final double height;

  @override
  ConsumerState<CubeCarousel> createState() => _CubeCarouselState();
}

enum _DragMode { undecided, page, orbit }

class _CubeCarouselState extends ConsumerState<CubeCarousel>
    with SingleTickerProviderStateMixin {
  /// Far from zero so the user can swipe back "forever".
  static const int _base = kCarouselItems * 1000;

  /// Idle turntable spin (rad/s) and finger orbit sensitivity (rad/px).
  static const double _spinSpeed = 0.35;
  static const double _orbitPerPixel = 0.012;

  late final PageController _pages;
  late int _page;
  late final Ticker _ticker;
  final ValueNotifier<CubeOrientation> _orbit = ValueNotifier(
    CubeOrientation.initial,
  );
  Duration _lastTick = Duration.zero;
  Offset _inertia = Offset.zero;

  _DragMode _mode = _DragMode.undecided;
  Offset _dragTotal = Offset.zero;
  int _dragStartPage = 0;

  /// Page an animation is heading to; pages passed on the way are not
  /// selected.
  int? _targetPage;

  int get _item => _page % kCarouselItems;

  @override
  void initState() {
    super.initState();
    final size = ref.read(selectedCubeSizeProvider);
    _page = _base + kCubeSizes.indexOf(size);
    _pages = PageController(initialPage: _page);
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _pages.dispose();
    _orbit.dispose();
    super.dispose();
  }

  /// Turntable spin while idle; finger flings coast and fade out.
  void _onTick(Duration elapsed) {
    final dt = ((elapsed - _lastTick).inMicroseconds / 1e6).clamp(0.0, 0.05);
    _lastTick = elapsed;
    if (_mode == _DragMode.orbit) return;
    _orbit.value = _orbit.value.rotatedOnScreen(
      _spinSpeed * dt + _inertia.dx * dt,
      _inertia.dy * dt,
    );
    _inertia *= math.pow(0.04, dt).toDouble();
    if (_inertia.distance < 0.01) _inertia = Offset.zero;
  }

  void _onPageChanged(int page) {
    setState(() => _page = page);
    final target = _targetPage;
    if (target != null) {
      if (page != target) return;
      _targetPage = null;
    }
    final size = carouselSize(_item);
    if (size != null) ref.read(selectedCubeSizeProvider.notifier).select(size);
  }

  /// Animates to the nearest page showing [item], in either direction.
  void _goToItem(int item) {
    final current = _pages.hasClients
        ? (_pages.page ?? _page.toDouble()).round()
        : _page;
    var delta = (item - current % kCarouselItems) % kCarouselItems;
    if (delta > kCarouselItems ~/ 2) delta -= kCarouselItems;
    if (delta == 0) return;
    _animateTo(current + delta);
  }

  /// A dot tap: a size is selected at once (the carousel follows), the
  /// mystery cube is just shown.
  void _selectItem(int item) {
    final size = carouselSize(item);
    if (size == null) {
      _goToItem(item);
    } else {
      ref.read(selectedCubeSizeProvider.notifier).select(size);
    }
  }

  void _animateTo(int page) {
    if (!_pages.hasClients) return;
    _targetPage = page;
    _pages.animateToPage(
      page,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  void _step(int by) {
    final current = _pages.hasClients
        ? (_pages.page ?? _page.toDouble()).round()
        : _page;
    _animateTo(current + by);
  }

  // ---- One gesture layer: slide pages or orbit the cube ----

  /// Sideways finger travel in "page" direction: positive moves toward the
  /// next cube (leftward in LTR, rightward in RTL).
  double _forward(double dx) =>
      Directionality.of(context) == TextDirection.rtl ? dx : -dx;

  void _onDragStart(DragStartDetails details) {
    _targetPage = null;
    _mode = _DragMode.undecided;
    _dragTotal = Offset.zero;
    _inertia = Offset.zero;
    _dragStartPage = (_pages.page ?? _page.toDouble()).round();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _dragTotal += details.delta;
    if (_mode == _DragMode.undecided) {
      if (_dragTotal.distance < 4) return;
      _mode = _dragTotal.dx.abs() > _dragTotal.dy.abs() * 1.2
          ? _DragMode.page
          : _DragMode.orbit;
      // Apply the travel that decided the mode too.
      _apply(_dragTotal);
      return;
    }
    _apply(details.delta);
  }

  void _apply(Offset delta) {
    switch (_mode) {
      case _DragMode.page:
        if (!_pages.hasClients) return;
        final position = _pages.position;
        position.jumpTo(position.pixels + _forward(delta.dx));
      case _DragMode.orbit:
        _orbit.value = _orbit.value.rotatedOnScreen(
          delta.dx * _orbitPerPixel,
          delta.dy * _orbitPerPixel,
        );
      case _DragMode.undecided:
        break;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond;
    switch (_mode) {
      case _DragMode.page:
        final page = _pages.page ?? _page.toDouble();
        final forward = _forward(velocity.dx);
        var target = page.round();
        if (forward > 300) target = page.ceil();
        if (forward < -300) target = page.floor();
        // A swipe moves one cube at most.
        target = target.clamp(_dragStartPage - 1, _dragStartPage + 1);
        _animateTo(target);
      case _DragMode.orbit:
        _inertia = velocity * _orbitPerPixel * 0.6;
      case _DragMode.undecided:
        break;
    }
    _mode = _DragMode.undecided;
  }

  void _onDragCancel() {
    if (_mode == _DragMode.page) _animateTo((_pages.page ?? 0).round());
    _mode = _DragMode.undecided;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Selecting a size elsewhere (the dots) brings its cube into view.
    ref.listen(selectedCubeSizeProvider, (_, size) {
      if (carouselSize(_item) != size) _goToItem(kCubeSizes.indexOf(size));
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              const Positioned.fill(child: RotatingCubeStage()),
              Positioned.fill(
                top: AppSpace.xl,
                bottom: AppSpace.md,
                child: RawGestureDetector(
                  key: const ValueKey('cube-carousel'),
                  behavior: HitTestBehavior.opaque,
                  gestures: {
                    EagerPanGestureRecognizer:
                        GestureRecognizerFactoryWithHandlers<
                          EagerPanGestureRecognizer
                        >(EagerPanGestureRecognizer.new, (r) {
                          r
                            ..onStart = _onDragStart
                            ..onUpdate = _onDragUpdate
                            ..onEnd = _onDragEnd
                            ..onCancel = _onDragCancel;
                        }),
                  },
                  child: PageView.builder(
                    controller: _pages,
                    // Every drag goes through the recognizer above.
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, page) {
                      final item = page % kCarouselItems;
                      final size = carouselSize(item);
                      return size == null
                          ? _MysteryCube(orbit: _orbit)
                          : CubePreview(
                              key: ValueKey('carousel-cube-$size'),
                              size: size,
                              orbit: _orbit,
                            );
                    },
                  ),
                ),
              ),
              PositionedDirectional(
                top: 0,
                start: 0,
                end: 0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _Title(
                    key: ValueKey('hero-title-$_item'),
                    item: _item,
                  ),
                ),
              ),
              PositionedDirectional(
                start: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _Chevron(
                    key: const ValueKey('carousel-prev'),
                    icon: Icons.chevron_left_rounded,
                    tooltip: l10n.carouselPrevious,
                    onTap: () => _step(-1),
                  ),
                ),
              ),
              PositionedDirectional(
                end: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _Chevron(
                    key: const ValueKey('carousel-next'),
                    icon: Icons.chevron_right_rounded,
                    tooltip: l10n.carouselNext,
                    onTap: () => _step(1),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpace.xs),
        _Dots(active: _item, onSelect: _selectItem),
      ],
    );
  }
}

/// Frosted gray silhouette of a cube with a "?" badge.
class _MysteryCube extends StatelessWidget {
  const _MysteryCube({required this.orbit});

  final ValueNotifier<CubeOrientation> orbit;

  static final CubeState _cube = CubeState.solved(3);
  static final Set<int> _allPieces = {for (final c in _cube.cubies) c.id};

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: const ValueKey('carousel-mystery'),
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Opacity(
              opacity: 0.75,
              child: CubePreview(
                size: 3,
                cube: _cube,
                orbit: orbit,
                muted: _allPieces,
              ),
            ),
          ),
        ),
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: 72,
              height: 72,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.glassFillStrong,
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.7),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.45),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: const Text(
                '?',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// "3×3  Classic" or "?  New cube coming soon" above the cube.
class _Title extends StatelessWidget {
  const _Title({super.key, required this.item});

  final int item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = carouselSize(item);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          size == null ? '?' : l10n.cubeSizeLabel(size),
          key: const ValueKey('hero-size'),
          textDirection: TextDirection.ltr,
          style: textTheme.headlineLarge,
        ),
        const SizedBox(width: AppSpace.sm),
        Flexible(
          child: Text(
            size == null ? l10n.cubeComingSoon : cubeLevelName(l10n, size),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              color: size == null ? AppColors.accent : AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _Chevron extends StatelessWidget {
  const _Chevron({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Container(
            width: AppSpace.touch,
            height: AppSpace.touch,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.glassFill,
              border: Border.all(color: AppColors.glassBorder),
            ),
            // Chevron icons mirror themselves in right-to-left locales.
            child: Icon(icon, color: AppColors.textPrimary),
          ),
        ),
      ),
    );
  }
}

/// One dot per carousel item; the current one stretches into a pill.
class _Dots extends StatelessWidget {
  const _Dots({required this.active, required this.onSelect});

  final int active;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var item = 0; item < kCarouselItems; item++)
          Semantics(
            button: true,
            selected: item == active,
            label: switch (carouselSize(item)) {
              final size? =>
                '${l10n.cubeSizeLabel(size)} ${cubeLevelName(l10n, size)}',
              null => l10n.cubeComingSoon,
            },
            child: InkWell(
              key: ValueKey(switch (carouselSize(item)) {
                final size? => 'size-$size',
                null => 'size-soon',
              }),
              borderRadius: BorderRadius.circular(12),
              onTap: () => onSelect(item),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  width: item == active ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: item == active
                        ? (item == kMysteryItem
                              ? AppColors.accentSecondary
                              : AppColors.accent)
                        : AppColors.glassBorder,
                    boxShadow: item == active
                        ? [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.5),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Short name of a cube size's level ("Classic", "Master"...).
String cubeLevelName(AppLocalizations l10n, int size) => switch (size) {
  2 => l10n.cubeLevel2,
  3 => l10n.cubeLevel3,
  4 => l10n.cubeLevel4,
  5 => l10n.cubeLevel5,
  _ => l10n.cubeLevel6,
};
