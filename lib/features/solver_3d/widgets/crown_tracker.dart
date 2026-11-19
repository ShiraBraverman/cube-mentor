import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/crown_words.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/settings/solve_preference.dart';
import '../../../core/solver/cube_solver.dart';
import '../../../core/solver/solve_step.dart';
import '../../../core/theme/app_colors.dart';
import '../model/cube_session.dart';

/// Three crown badges: finished crowns get a check, the [active] one is lit,
/// later ones are dim. [active] greater than 3 marks all three finished.
class CrownTracker extends StatelessWidget {
  const CrownTracker({super.key, required this.active});

  final int active;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var crown = 1; crown <= kCrowns; crown++) ...[
          if (crown > 1)
            Container(
              width: 10,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: crown <= active ? AppColors.gold : AppColors.glassBorder,
              ),
            ),
          _CrownBadge(
            key: ValueKey('crown-$crown'),
            crown: crown,
            state: crown < active
                ? _CrownState.done
                : (crown == active ? _CrownState.active : _CrownState.pending),
          ),
        ],
      ],
    );
  }
}

enum _CrownState { done, active, pending }

class _CrownBadge extends StatelessWidget {
  const _CrownBadge({super.key, required this.crown, required this.state});

  final int crown;
  final _CrownState state;

  @override
  Widget build(BuildContext context) {
    final (Color fill, Color border, Color ink) = switch (state) {
      _CrownState.done => (AppColors.gold, AppColors.gold, AppColors.onAccent),
      _CrownState.active => (
        AppColors.gold.withValues(alpha: 0.18),
        AppColors.gold,
        AppColors.gold,
      ),
      _CrownState.pending => (
        Colors.transparent,
        AppColors.glassBorder,
        AppColors.textSecondary,
      ),
    };
    return Semantics(
      label: '$crown',
      selected: state == _CrownState.active,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fill,
          border: Border.all(color: border, width: 1.5),
          boxShadow: state == _CrownState.pending
              ? null
              : [
                  BoxShadow(
                    color: AppColors.gold.withValues(alpha: 0.4),
                    blurRadius: 12,
                    spreadRadius: -3,
                  ),
                ],
        ),
        alignment: Alignment.center,
        child: state == _CrownState.done
            ? Icon(Icons.check_rounded, size: 16, color: ink)
            : CustomPaint(
                size: const Size(16, 13),
                painter: _CrownPainter(ink, '$crown'),
              ),
      ),
    );
  }
}

/// A small crown glyph with the crown number under it.
class _CrownPainter extends CustomPainter {
  _CrownPainter(this.color, this.label);

  final Color color;
  final String label;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final crown = Path()
      ..moveTo(0, h * 0.38)
      ..lineTo(w * 0.25, h * 0.55)
      ..lineTo(w * 0.5, 0)
      ..lineTo(w * 0.75, h * 0.55)
      ..lineTo(w, h * 0.38)
      ..lineTo(w * 0.86, h * 0.72)
      ..lineTo(w * 0.14, h * 0.72)
      ..close();
    canvas.drawPath(crown, Paint()..color = color.withValues(alpha: 0.9));
    final text = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: color,
          fontSize: 7,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    text.paint(canvas, Offset((w - text.width) / 2, h * 0.76));
  }

  @override
  bool shouldRepaint(_CrownPainter old) =>
      old.color != color || old.label != label;
}

/// Pill switching the loaded solution between the guided 3-crown method and
/// the fast solver. Shown only for solver results on cube sizes with both.
class SolveMethodToggle extends ConsumerWidget {
  const SolveMethodToggle({super.key, required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final current = session.solvedWith;
    final solver = ref.watch(cubeSolverProvider);
    if (current == null ||
        !session.hasPlayback ||
        !solver.supports(size, SolveMethod.layerByLayer) ||
        !solver.supports(size, SolveMethod.fast)) {
      return const SizedBox.shrink();
    }
    final busy = !session.isIdle || session.isSolving;

    Widget option(SolveMethod method, IconData icon, String label, Key key) {
      final selected = current == method;
      return Expanded(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            key: key,
            borderRadius: BorderRadius.circular(14),
            onTap: selected || busy
                ? null
                : () {
                    ref.read(solvePreferenceProvider.notifier).set(method);
                    ref
                        .read(cubeSessionProvider(size).notifier)
                        .resolveWith(method);
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              constraints: const BoxConstraints(minHeight: 40),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: selected
                    ? AppColors.accent.withValues(alpha: 0.3)
                    : Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 15,
                    color: selected ? Colors.white : AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: selected
                            ? Colors.white
                            : AppColors.textSecondary,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w500,
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

    return Container(
      key: const ValueKey('solve-mode'),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.glassFill,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          option(
            SolveMethod.layerByLayer,
            Icons.school_rounded,
            l10n.solveModeGuided,
            const ValueKey('solve-mode-guided'),
          ),
          option(
            SolveMethod.fast,
            Icons.bolt_rounded,
            l10n.solveModeFast,
            const ValueKey('solve-mode-fast'),
          ),
        ],
      ),
    );
  }
}
