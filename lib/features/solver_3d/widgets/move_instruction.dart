import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_move.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/l10n/move_words.dart';
import '../../../core/theme/app_colors.dart';

/// A bold arrow in a glowing tile showing which way a move goes; a "2×"
/// badge marks a double (180°) turn.
class MoveArrowBadge extends StatelessWidget {
  const MoveArrowBadge({
    super.key,
    required this.instruction,
    this.size = 52,
    this.color = AppColors.accent,
  });

  final MoveInstruction instruction;
  final double size;
  final Color color;

  static IconData iconOf(MoveArrow arrow) => switch (arrow) {
    MoveArrow.up => Icons.arrow_upward_rounded,
    MoveArrow.down => Icons.arrow_downward_rounded,
    MoveArrow.left => Icons.arrow_back_rounded,
    MoveArrow.right => Icons.arrow_forward_rounded,
    MoveArrow.clockwise => Icons.rotate_right_rounded,
    MoveArrow.counterClockwise => Icons.rotate_left_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: ValueKey('move-arrow-${instruction.arrow.name}'),
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size * 0.28),
                color: color.withValues(alpha: 0.18),
                border: Border.all(color: color.withValues(alpha: 0.7)),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 12,
                    spreadRadius: -4,
                  ),
                ],
              ),
              // Left and right are physical directions: never mirrored.
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  iconOf(instruction.arrow),
                  size: size * 0.6,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          if (instruction.half)
            PositionedDirectional(
              top: -6,
              end: -6,
              child: Container(
                key: const ValueKey('move-arrow-double'),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.accentSecondary,
                ),
                child: const Text(
                  '2×',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: AppColors.cubeBody,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Arrow badge plus "Right side — Up" in two lines (layer, then direction).
class MoveInstructionTile extends StatelessWidget {
  const MoveInstructionTile({
    super.key,
    required this.move,
    required this.size,
    this.badgeSize = 52,
    this.dense = false,
    this.leading,
  });

  final CubeMove move;

  /// Cube size.
  final int size;
  final double badgeSize;

  /// One line ("Right side — Up") instead of two.
  final bool dense;

  /// Optional widget before the badge (e.g. a step number).
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final instruction = moveInstruction(l10n, move, size);
    return Semantics(
      label: instruction.text(l10n),
      excludeSemantics: true,
      child: Row(
        children: [
          ?leading,
          MoveArrowBadge(instruction: instruction, size: badgeSize),
          SizedBox(width: dense ? 10 : 12),
          Expanded(
            child: dense
                ? Text(
                    instruction.text(l10n),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        instruction.layer,
                        key: const ValueKey('move-layer'),
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        instruction.direction,
                        key: const ValueKey('move-direction'),
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.accentSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
