import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/solver/cube_solver.dart';
import '../../core/solver/solve_step.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/vision/scan_analyzer.dart';
import '../solver_3d/solver_3d_screen.dart';
import 'camera/camera_scan_view.dart';
import 'model/scan_session.dart';
import 'widgets/cube_net.dart';

/// Scan & Solve: capture the six faces with the camera (or enter them by
/// hand), fix any flagged sticker on the net, then solve in the 3D viewport.
class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key, required this.size, this.cameraOverride});

  final int size;

  /// Forces camera support on or off (tests); by default phones only.
  final bool? cameraOverride;

  bool get cameraSupported => cameraOverride ?? CameraScanView.supported;

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  CameraProblem? _problem;

  int get size => widget.size;

  @override
  void initState() {
    super.initState();
    // The alignment grid maps to the sensor assuming an upright phone.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    if (!widget.cameraSupported) {
      Future.microtask(() {
        if (mounted) _controller.startManual();
      });
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(const []);
    super.dispose();
  }

  ScanSessionController get _controller =>
      ref.read(scanSessionProvider(size).notifier);

  void _open(CubeState cube, SolveMethod? method) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) =>
            Solver3DScreen(size: size, initialCube: cube, autoSolve: method),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(scanSessionProvider(size));
    final capturing = session.phase == ScanPhase.capture;
    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.scanTitle(size)),
          actions: [
            if (capturing || !session.manual)
              IconButton(
                key: const ValueKey('scan-manual'),
                tooltip: l10n.scanManualInput,
                icon: const Icon(Icons.edit_rounded),
                onPressed: _controller.startManual,
              )
            else if (widget.cameraSupported)
              IconButton(
                key: const ValueKey('scan-use-camera'),
                tooltip: l10n.scanUseCamera,
                icon: const Icon(Icons.photo_camera_rounded),
                onPressed: () {
                  setState(() => _problem = null);
                  _controller.restart();
                },
              ),
            const SizedBox(width: 4),
          ],
        ),
        body: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: capturing
                ? _captureBody(l10n, session)
                : _ReviewBody(
                    session: session,
                    controller: _controller,
                    onOpen: _open,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _captureBody(AppLocalizations l10n, ScanSession session) {
    final textTheme = Theme.of(context).textTheme;
    final rescanning = session.isCaptured && session.stickers.isNotEmpty;
    final progress = CubeNet(
      size: size,
      stickers: [
        for (var face = 0; face < 6; face++)
          ...switch (session.samples[face]) {
            final samples? => previewColors(samples),
            null => List<StickerColor?>.filled(session.perFace, null),
          },
      ],
      currentFace: session.face,
      faceKeyPrefix: 'scan-face',
      onFaceTap: (face) {
        if (session.samples.containsKey(face)) _controller.rescanFace(face);
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GlassCard(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.scanFaceProgress(session.captureStep, 6),
                key: const ValueKey('scan-step'),
                style: textTheme.labelLarge?.copyWith(color: AppColors.accent),
              ),
              const SizedBox(height: 2),
              Text(
                faceName(l10n, session.face),
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(faceHint(l10n, session.face), style: textTheme.bodyMedium),
              const SizedBox(height: 4),
              Text(
                session.samples.isEmpty
                    ? l10n.scanAlignHint
                    : l10n.scanTapToRescan,
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              if (rescanning)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    key: const ValueKey('scan-cancel-rescan'),
                    onPressed: _controller.cancelRescan,
                    child: Text(l10n.scanCancelRescan),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: _problem != null || !widget.cameraSupported
              ? _CameraProblemView(
                  problem: _problem ?? CameraProblem.missing,
                  onManual: _controller.startManual,
                )
              : CameraScanView(
                  key: ValueKey('camera-${session.face}'),
                  size: size,
                  onCapture: _controller.capture,
                  onUnavailable: (problem) =>
                      setState(() => _problem = problem),
                  footer: SizedBox(height: 96, child: progress),
                ),
        ),
      ],
    );
  }
}

class _CameraProblemView extends StatelessWidget {
  const _CameraProblemView({required this.problem, required this.onManual});

  final CameraProblem problem;
  final VoidCallback onManual;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.no_photography_rounded,
            size: 48,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 12),
          Text(switch (problem) {
            CameraProblem.denied => l10n.scanCameraDenied,
            CameraProblem.failed => l10n.scanCameraFailed,
            CameraProblem.missing => l10n.scanCameraMissing,
          }, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: onManual,
            icon: const Icon(Icons.edit_rounded),
            label: Text(l10n.scanManualInput),
          ),
        ],
      ),
    );
  }
}

class _ReviewBody extends ConsumerWidget {
  const _ReviewBody({
    required this.session,
    required this.controller,
    required this.onOpen,
  });

  final ScanSession session;
  final ScanSessionController controller;
  final void Function(CubeState cube, SolveMethod? method) onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = session.size;
    final solver = ref.watch(cubeSolverProvider);
    final cube = session.cube;
    final canFast = solver.supports(size, SolveMethod.fast);
    final canLearn = solver.supports(size, SolveMethod.layerByLayer);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StatusCard(session: session),
        const SizedBox(height: 12),
        Expanded(
          child: Center(
            child: CubeNet(
              size: size,
              stickers: session.stickers,
              invalid: session.invalid,
              uncertain: session.uncertain,
              stickerKeyPrefix: 'scan-sticker',
              onStickerTap: controller.cycleSticker,
              onStickerLongPress: (index) async {
                final color = await showModalBottomSheet<StickerColor>(
                  context: context,
                  builder: (_) => const _PaletteSheet(),
                );
                if (color != null) controller.setSticker(index, color);
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.scanEditHint,
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
        ),
        if (!session.manual && session.isCaptured) ...[
          const SizedBox(height: 10),
          Text(l10n.scanRescanFace, style: textTheme.labelLarge),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final face in kScanOrder)
                ActionChip(
                  key: ValueKey('scan-rescan-$face'),
                  avatar: const Icon(Icons.photo_camera_rounded, size: 16),
                  label: Text(faceName(l10n, face)),
                  onPressed: () => controller.rescanFace(face),
                ),
            ],
          ),
        ],
        const SizedBox(height: 14),
        Row(
          children: [
            if (canLearn) ...[
              Expanded(
                child: OutlinedButton(
                  key: const ValueKey('scan-learn'),
                  onPressed: cube == null
                      ? null
                      : () => onOpen(cube, SolveMethod.layerByLayer),
                  child: Text(l10n.solveLearn, textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: FilledButton.icon(
                key: const ValueKey('scan-solve'),
                onPressed: cube == null
                    ? null
                    : () => onOpen(cube, canFast ? SolveMethod.fast : null),
                icon: Icon(
                  canFast ? Icons.auto_fix_high_rounded : Icons.view_in_ar,
                ),
                label: Text(
                  canFast
                      ? (canLearn ? l10n.solveFast : l10n.solve)
                      : l10n.scanOpen3d,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.session});

  final ScanSession session;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final analysis = session.analysis;
    final valid = session.isValid;
    final invalid = session.invalid.length;
    final uncertain = session.uncertain.length;
    final title = valid
        ? l10n.scanAllGood
        : (invalid > 0 ? l10n.scanStickersWrong(invalid) : l10n.scanCheckCube);
    final detail = valid
        ? (uncertain > 0 ? l10n.scanUncertain(uncertain) : null)
        : issueText(l10n, analysis?.issue ?? ScanIssue.unavailable, session);
    final color = valid ? AppColors.accentSecondary : const Color(0xFFFF6B6B);
    return GlassCard(
      key: const ValueKey('scan-status'),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Icon(
            valid ? Icons.check_circle_rounded : Icons.error_rounded,
            color: color,
            size: 30,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                if (detail != null) ...[
                  const SizedBox(height: 2),
                  Text(detail, style: textTheme.bodySmall),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaletteSheet extends StatelessWidget {
  const _PaletteSheet();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.scanPaletteTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                for (final color in StickerColor.values)
                  InkWell(
                    key: ValueKey('scan-palette-${color.name}'),
                    customBorder: const CircleBorder(),
                    onTap: () => Navigator.of(context).pop(color),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.stickers[color],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white54, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String faceName(AppLocalizations l10n, int face) => switch (face) {
  kFaceU => l10n.faceUp,
  kFaceR => l10n.faceRight,
  kFaceF => l10n.faceFront,
  kFaceD => l10n.faceDown,
  kFaceL => l10n.faceLeft,
  _ => l10n.faceBack,
};

String faceHint(AppLocalizations l10n, int face) => switch (face) {
  kFaceU => l10n.scanHintUp,
  kFaceR => l10n.scanHintRight,
  kFaceF => l10n.scanHintFront,
  kFaceD => l10n.scanHintDown,
  kFaceL => l10n.scanHintLeft,
  _ => l10n.scanHintBack,
};

String issueText(AppLocalizations l10n, ScanIssue issue, ScanSession session) =>
    switch (issue) {
      ScanIssue.none => '',
      ScanIssue.badColors ||
      ScanIssue.badLength => l10n.scanIssueColors(session.perFace),
      ScanIssue.badCenters => l10n.scanIssueCenters,
      ScanIssue.badPieces => l10n.scanIssuePieces,
      ScanIssue.twist => l10n.scanIssueTwist,
      ScanIssue.flip => l10n.scanIssueFlip,
      ScanIssue.parity => l10n.scanIssueParity,
      ScanIssue.unavailable => l10n.scanIssueUnavailable,
    };
