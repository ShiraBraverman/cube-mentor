import 'package:flutter/scheduler.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/ui_kit.dart';
import '../patterns/patterns.dart';
import '../solver_3d/render/cube_geometry.dart';
import '../solver_3d/widgets/cube_preview.dart';

/// The pattern shown for each cube size on the intro's Patterns page: the
/// most eye-catching look of each size.
const List<(int, String)> kOnboardingPatterns = [
  (2, 'cubeInCube'),
  (3, 'cubeInCubeInCube'),
  (4, 'framedCenter'),
  (5, 'bullsEye'),
  (6, 'blockCheckerboard'),
];

/// Live pattern showcase for the first-launch intro: a large spinning cube
/// the user can drag around, cycling through one pattern per size, above a
/// row of small cubes (2x2 to 6x6) that pick the size directly. The cycle
/// stops once the user touches either.
class OnboardingPatternShowcase extends StatefulWidget {
  const OnboardingPatternShowcase({super.key});

  @override
  State<OnboardingPatternShowcase> createState() =>
      _OnboardingPatternShowcaseState();
}

class _OnboardingPatternShowcaseState extends State<OnboardingPatternShowcase>
    with SingleTickerProviderStateMixin {
  /// Time each size stays on the large cube while cycling.
  static const _dwell = Duration(milliseconds: 3200);

  /// Idle spin speed, radians per second.
  static const _spinSpeed = 0.5;

  /// Drag sensitivity, radians per logical pixel.
  static const _dragSpeed = 0.012;

  late final List<CubeState> _cubes = [
    for (final (size, id) in kOnboardingPatterns)
      kPatterns.firstWhere((p) => p.id == id).stateFor(size),
  ];
  final ValueNotifier<CubeOrientation> _orbit = ValueNotifier(
    CubeOrientation.initial,
  );
  late final Ticker _ticker = createTicker(_onTick);
  Duration _lastTick = Duration.zero;
  Duration _shown = Duration.zero;
  int _index = 0;
  bool _dragging = false;
  bool _userDriven = false;

  @override
  void initState() {
    super.initState();
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _orbit.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final dt = elapsed - _lastTick;
    _lastTick = elapsed;
    if (!_dragging) {
      final seconds = dt.inMicroseconds / Duration.microsecondsPerSecond;
      _orbit.value = _orbit.value.rotatedOnScreen(seconds * _spinSpeed, 0);
    }
    if (_userDriven || _dragging) return;
    _shown += dt;
    if (_shown >= _dwell) {
      _shown = Duration.zero;
      setState(() => _index = (_index + 1) % kOnboardingPatterns.length);
    }
  }

  void _select(int index) {
    setState(() {
      _userDriven = true;
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final (size, id) = kOnboardingPatterns[_index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          key: const ValueKey('onboarding-patterns-hero'),
          behavior: HitTestBehavior.opaque,
          onPanStart: (_) => setState(() {
            _dragging = true;
            _userDriven = true;
          }),
          onPanUpdate: (details) => _orbit.value = _orbit.value.rotatedOnScreen(
            details.delta.dx * _dragSpeed,
            details.delta.dy * _dragSpeed,
          ),
          onPanEnd: (_) => setState(() => _dragging = false),
          onPanCancel: () => setState(() => _dragging = false),
          child: Container(
            width: 224,
            height: 224,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accentWarm.withValues(alpha: 0.22),
                  AppColors.accentWarm.withValues(alpha: 0),
                ],
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              switchInCurve: Curves.easeOutBack,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween(begin: 0.8, end: 1.0).animate(animation),
                  child: child,
                ),
              ),
              child: CubePreview(
                key: ValueKey('onboarding-pattern-cube-$size'),
                size: size,
                cube: _cubes[_index],
                orbit: _orbit,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpace.xs),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: AppSpace.xs,
          runSpacing: AppSpace.xxs,
          children: [
            AppPill(
              label: l10n.cubeSizeLabel(size),
              color: AppColors.accentWarm,
              filled: true,
            ),
            Text(
              patternName(l10n, id),
              key: const ValueKey('onboarding-pattern-name'),
              style: textTheme.titleSmall,
            ),
          ],
        ),
        const SizedBox(height: AppSpace.md),
        Row(
          children: [
            for (final (i, (n, patternId)) in kOnboardingPatterns.indexed)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: _MiniPattern(
                    key: ValueKey('onboarding-pattern-$n'),
                    label:
                        '${l10n.cubeSizeLabel(n)} '
                        '${patternName(l10n, patternId)}',
                    sizeLabel: l10n.cubeSizeLabel(n),
                    size: n,
                    cube: _cubes[i],
                    selected: i == _index,
                    onTap: () => _select(i),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

/// One size in the picker row: a still 3D render of its pattern and the
/// size under it.
class _MiniPattern extends StatelessWidget {
  const _MiniPattern({
    super.key,
    required this.label,
    required this.sizeLabel,
    required this.size,
    required this.cube,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String sizeLabel;
  final int size;
  final CubeState cube;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics(
      label: label,
      button: true,
      selected: selected,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            color: selected
                ? AppColors.accentWarm.withValues(alpha: 0.16)
                : AppColors.glassFill,
            border: Border.all(
              color: selected ? AppColors.accentWarm : AppColors.glassBorder,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CubePreview(size: size, cube: cube),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  sizeLabel,
                  style: textTheme.labelSmall?.copyWith(
                    color: selected
                        ? AppColors.accentWarm
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
