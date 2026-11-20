import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';

/// Builds notation tokens from face buttons plus prime / wide / depth
/// modifiers, and reports them through [onMove].
class MovePad extends StatefulWidget {
  const MovePad({super.key, required this.size, required this.onMove});

  final int size;
  final ValueChanged<String> onMove;

  @override
  State<MovePad> createState() => _MovePadState();
}

class _MovePadState extends State<MovePad> {
  static const _faces = ['U', 'D', 'L', 'R', 'F', 'B'];

  bool _prime = false;
  bool _wide = false;
  int _depth = 1;

  int get _maxDepth => widget.size ~/ 2;

  /// Builds the token for [face] with the active modifiers, e.g. `3Rw'`.
  String _token(String face) {
    final suffix = _prime ? "'" : '';
    if (_wide) {
      final depth = _depth < 2 ? 2 : _depth;
      return '${depth == 2 ? '' : depth}${face}w$suffix';
    }
    return '${_depth == 1 ? '' : _depth}$face$suffix';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final n = widget.size;
    final showWide = n >= 3;
    final showDepth = n >= 4;
    final showSlices = n.isOdd && n >= 3;

    // Notation is a Latin-script language of its own, so the pad keeps a
    // fixed left-to-right order in every locale.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _ToggleChip(
                label: l10n.prime,
                selected: _prime,
                onTap: () => setState(() => _prime = !_prime),
              ),
              if (showWide)
                _ToggleChip(
                  label: l10n.wide,
                  selected: _wide,
                  onTap: () => setState(() => _wide = !_wide),
                ),
              if (showDepth)
                for (var d = 1; d <= _maxDepth; d++)
                  _ToggleChip(
                    label: l10n.layer(d),
                    selected: _depth == d,
                    onTap: () => setState(() => _depth = d),
                  ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              for (final face in _faces)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: _MoveButton(
                      label: _token(face),
                      onTap: () => widget.onMove(_token(face)),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (showSlices)
                for (final slice in const ['M', 'E', 'S'])
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: _MoveButton(
                        label: '$slice${_prime ? "'" : ''}',
                        subtle: true,
                        onTap: () =>
                            widget.onMove('$slice${_prime ? "'" : ''}'),
                      ),
                    ),
                  ),
              for (final rotation in const ['x', 'y', 'z'])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: _MoveButton(
                      label: '$rotation${_prime ? "'" : ''}',
                      subtle: true,
                      tooltip: l10n.cubeRotations,
                      onTap: () =>
                          widget.onMove('$rotation${_prime ? "'" : ''}'),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MoveButton extends StatelessWidget {
  const _MoveButton({
    required this.label,
    required this.onTap,
    this.subtle = false,
    this.tooltip,
  });

  final String label;
  final VoidCallback onTap;
  final bool subtle;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final button = Material(
      color: subtle ? AppColors.glassFill : AppColors.glassFillStrong,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.glassBorder),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox(
          height: 44,
          child: Center(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: subtle
                        ? AppColors.textSecondary
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return tooltip == null ? button : Tooltip(message: tooltip, child: button);
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: selected
            ? AppColors.accent.withValues(alpha: 0.28)
            : AppColors.glassFill,
        border: Border.all(
          color: selected ? AppColors.accent : AppColors.glassBorder,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
