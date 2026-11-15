import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import 'model/cube_session.dart';
import 'widgets/cube_viewport.dart';
import 'widgets/move_pad.dart';

/// 3D playground: interactive cube viewport plus move and playback controls.
class Solver3DScreen extends ConsumerWidget {
  const Solver3DScreen({super.key, required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final solved = session.isIdle && session.cube.isSolved;

    final viewport = Stack(
      children: [
        Positioned.fill(child: CubeViewport(size: size)),
        PositionedDirectional(
          bottom: 8,
          start: 0,
          end: 0,
          child: IgnorePointer(
            child: Text(
              l10n.orbitHint,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ],
    );

    final controls = _ControlPanel(size: size);

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
            const SizedBox(width: 4),
          ],
        ),
        body: SafeArea(
          top: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > constraints.maxHeight * 1.1;
              if (wide) {
                return Row(
                  children: [
                    Expanded(flex: 3, child: viewport),
                    SizedBox(
                      width: 400,
                      child: SingleChildScrollView(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0, 8, 16, 16),
                        child: controls,
                      ),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  Expanded(child: viewport),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * 0.52,
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        12, 4, 12, 12),
                      child: controls,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ControlPanel extends ConsumerWidget {
  const _ControlPanel({required this.size});

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(cubeSessionProvider(size));
    final controller = ref.read(cubeSessionProvider(size).notifier);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GlassCard(
          padding: const EdgeInsetsDirectional.all(12),
          child: Row(
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
        ),
        const SizedBox(height: 10),
        GlassCard(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(l10n.playbackTitle, style: textTheme.titleSmall),
                  const Spacer(),
                  Text(
                    session.hasPlayback
                        ? l10n.playbackProgress(
                            session.playbackIndex, session.playback.length)
                        : l10n.moveCount(session.log.length),
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              if (!session.hasPlayback)
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 6),
                  child: Text(
                    l10n.playbackEmpty,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                )
              else ...[
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: session.playbackIndex / session.playback.length,
                    minHeight: 4,
                    backgroundColor: AppColors.glassBorder,
                  ),
                ),
                const SizedBox(height: 4),
                // Media controls keep LTR order in every locale, following
                // Material's bidirectionality guidelines.
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      tooltip: l10n.previousStep,
                      onPressed:
                          session.canStepBack ? controller.stepBack : null,
                      icon: const Icon(Icons.skip_previous_rounded),
                    ),
                    IconButton.filledTonal(
                      tooltip: session.isPlaying ? l10n.pause : l10n.play,
                      iconSize: 32,
                      onPressed: session.isPlaying
                          ? controller.pause
                          : (session.canStepForward ? controller.play : null),
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
                  ],
                ),
              ],
              Row(
                children: [
                  const Icon(
                    Icons.speed_rounded,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(l10n.speed, style: textTheme.bodySmall),
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
        ),
        const SizedBox(height: 10),
        GlassCard(
          padding: const EdgeInsetsDirectional.all(12),
          child: MovePad(size: size, onMove: controller.turnNotation),
        ),
      ],
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
