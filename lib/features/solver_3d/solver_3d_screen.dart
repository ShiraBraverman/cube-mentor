import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import 'model/cube_session.dart';
import 'widgets/cube_viewport.dart';
import 'widgets/move_pad.dart';

/// 3D playground: a full-bleed touch-driven cube, a slim glass action bar,
/// and an optional collapsible notation pad.
class Solver3DScreen extends ConsumerStatefulWidget {
  const Solver3DScreen({super.key, required this.size});

  final int size;

  @override
  ConsumerState<Solver3DScreen> createState() => _Solver3DScreenState();
}

class _Solver3DScreenState extends ConsumerState<Solver3DScreen> {
  bool _showPad = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = widget.size;
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final solved = session.isIdle && session.cube.isSolved;

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.playgroundTitle(size)),
          actions: [
            _StatusPill(
              label: solved ? l10n.solved : l10n.scrambled,
              positive: solved,
            ),
            IconButton(
              tooltip: l10n.xray,
              isSelected: session.xray,
              icon: const Icon(Icons.visibility_outlined),
              selectedIcon: const Icon(
                Icons.visibility,
                color: AppColors.accentSecondary,
              ),
              onPressed: controller.toggleXray,
            ),
            IconButton(
              key: const ValueKey('toggle-notation'),
              tooltip: l10n.notationPad,
              isSelected: _showPad,
              icon: const Icon(Icons.keyboard_outlined),
              selectedIcon: const Icon(
                Icons.keyboard,
                color: AppColors.accentSecondary,
              ),
              onPressed: () => setState(() => _showPad = !_showPad),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(child: CubeViewport(size: size)),
                    PositionedDirectional(
                      bottom: 6,
                      start: 16,
                      end: 16,
                      child: IgnorePointer(
                        child: Text(
                          l10n.orbitHint,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 6, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSize(
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeOutCubic,
                          alignment: Alignment.bottomCenter,
                          child: _showPad
                              ? Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    bottom: 8,
                                  ),
                                  child: _NotationPanel(size: size),
                                )
                              : const SizedBox(width: double.infinity),
                        ),
                        _ActionBar(size: size),
                      ],
                    ),
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

/// Slim glass bar: scramble / undo / reset, plus playback when available.
class _ActionBar extends ConsumerWidget {
  const _ActionBar({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final textTheme = Theme.of(context).textTheme;

    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            child: !session.hasPlayback
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 4),
                    child: Row(
                      // Media controls keep LTR order in every locale,
                      // following Material's bidirectionality guidelines.
                      textDirection: TextDirection.ltr,
                      children: [
                        IconButton(
                          tooltip: l10n.previousStep,
                          onPressed:
                              session.canStepBack ? controller.stepBack : null,
                          icon: const Icon(Icons.skip_previous_rounded),
                        ),
                        IconButton.filledTonal(
                          tooltip: session.isPlaying ? l10n.pause : l10n.play,
                          onPressed: session.isPlaying
                              ? controller.pause
                              : (session.canStepForward
                                    ? controller.play
                                    : null),
                          icon: Icon(
                            session.isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                          ),
                        ),
                        IconButton(
                          tooltip: l10n.nextStep,
                          onPressed: session.canStepForward
                              ? controller.stepForward
                              : null,
                          icon: const Icon(Icons.skip_next_rounded),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.playbackProgress(
                                  session.playbackIndex,
                                  session.playback.length,
                                ),
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: session.playbackIndex /
                                      session.playback.length,
                                  minHeight: 4,
                                  backgroundColor: AppColors.glassBorder,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
          ),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.shuffle_rounded,
                  label: l10n.scramble,
                  onTap: controller.scramble,
                  primary: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  icon: Icons.undo_rounded,
                  label: l10n.undo,
                  onTap: session.log.isEmpty ? null : controller.undo,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  icon: Icons.restart_alt_rounded,
                  label: l10n.reset,
                  onTap: controller.reset,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Collapsible advanced controls: notation buttons and animation speed.
class _NotationPanel extends ConsumerWidget {
  const _NotationPanel({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);

    return GlassCard(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MovePad(size: size, onMove: controller.turnNotation),
          Row(
            children: [
              const Icon(
                Icons.speed_rounded,
                size: 18,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(l10n.speed, style: Theme.of(context).textTheme.bodySmall),
              Expanded(
                child: Slider(
                  value: session.speed,
                  min: 0.25,
                  max: 3,
                  divisions: 11,
                  label: '${session.speed.toStringAsFixed(2)}×',
                  onChanged: controller.setSpeed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.primary = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final style = primary
        ? FilledButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: AppColors.backgroundBottom,
          )
        : FilledButton.styleFrom(
            backgroundColor: AppColors.glassFillStrong,
            foregroundColor: AppColors.textPrimary,
          );
    return FilledButton.icon(
      style: style.copyWith(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        ),
      ),
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: FittedBox(child: Text(label)),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.positive});

  final String label;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    final color = positive ? AppColors.accentSecondary : AppColors.accentWarm;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color.withValues(alpha: 0.6)),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
