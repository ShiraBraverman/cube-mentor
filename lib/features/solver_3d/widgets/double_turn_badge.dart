import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../model/cube_session.dart';

/// The guided move on screen right now: the one being animated, or the one
/// waiting for the user (what is left of it after a partial hand turn).
/// Null without a guide or once it is finished.
CubeMove? currentGuidedMove(CubeSession session) {
  if (!session.hasPlayback) return null;
  if (session.isIdle) {
    final remaining = session.remainingMoves;
    return remaining.isEmpty ? null : remaining.first;
  }
  final step = session.queue.first.step;
  if (step == null || step < 0 || step >= session.playback.length) return null;
  return session.playback[step];
}

/// High-contrast "×2 Double turn · 180°" pill shown right above the 3D cube
/// whenever the current guided step is a half turn (`U2`, `R2`, `2Rw2`…),
/// so someone looking at the cube, not the instructions, sees it at once.
/// Takes no room (and ignores touches) otherwise.
class DoubleTurnBadge extends ConsumerWidget {
  const DoubleTurnBadge({super.key, required this.size});

  /// Cube size of the session to follow.
  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final half = ref.watch(
      cubeSessionProvider(size)
          .select((s) => currentGuidedMove(s)?.isHalfTurn ?? false),
    );
    return IgnorePointer(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: animation, child: child),
        ),
        child: half ? const _Pill() : const SizedBox.shrink(),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Semantics(
      liveRegion: true,
      label: l10n.doubleTurnBadge,
      child: Container(
        key: const ValueKey('double-turn-badge'),
        padding: const EdgeInsetsDirectional.fromSTEB(6, 5, 14, 5),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.white.withValues(alpha: 0.85)),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.55),
              blurRadius: 18,
              spreadRadius: -2,
            ),
          ],
        ),
        child: ExcludeSemantics(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                  color: AppColors.onAccent,
                  borderRadius: BorderRadius.circular(999),
                ),
                // Notation-like: always reads left to right.
                child: const Text(
                  '×2',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 20,
                    height: 1.2,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  l10n.doubleTurnBadge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleSmall?.copyWith(
                    color: AppColors.onAccent,
                    fontWeight: FontWeight.w800,
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
