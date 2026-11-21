import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cube/cube_state.dart';
import '../../core/feedback/feedback_service.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/solver/cube_solver.dart';
import '../../core/solver/solve_step.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/sticker_palette.dart';
import '../../core/theme/ui_kit.dart';
import '../../core/vision/scan_analyzer.dart';
import '../solver_3d/solver_3d_screen.dart';
import 'camera/camera_scan_view.dart';
import 'model/scan_session.dart';
import 'model/scan_turns.dart';
import 'widgets/cube_net.dart';
import 'widgets/mini_cube.dart';
import 'widgets/scan_layout.dart';

/// Scan & Solve: capture the six faces with the camera (or enter them by
/// hand), fix any flagged sticker on the net, then solve in the 3D viewport.
class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({
    super.key,
    required this.size,
    this.cameraOverride,
    this.embedded = false,
  });

  final int size;

  /// Hosted in the Scan tab of the root shell: the solver opens on top
  /// instead of replacing this screen, and the scan restarts on return.
  final bool embedded;

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

  Future<void> _open(CubeState cube, SolveMethod? method) async {
    final route = MaterialPageRoute<void>(
      builder: (_) =>
          Solver3DScreen(size: size, initialCube: cube, autoSolve: method),
    );
    if (!widget.embedded) {
      await Navigator.of(context).pushReplacement(route);
      return;
    }
    // The camera is already off in review, where the solver is opened.
    await Navigator.of(context).push(route);
    if (!mounted) return;
    if (widget.cameraSupported) {
      _controller.restart();
    } else {
      _controller.startManual();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(scanSessionProvider(size));
    if (session.phase == ScanPhase.capture) {
      // Full bleed: the camera fills the screen under compact overlays.
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: _captureBody(l10n, session),
        ),
      );
    }
    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.scanTitle(size)),
          actions: [
            if (!session.manual)
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
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppSpace.gutter,
              AppSpace.xxs,
              AppSpace.gutter,
              AppSpace.md,
            ),
            child: _ReviewBody(
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
    final rescanning = session.isCaptured && session.stickers.isNotEmpty;
    void rescan(int face) {
      if (face != session.face && session.samples.containsKey(face)) {
        _controller.rescanFace(face);
      }
    }

    Widget header(Widget? torch) => _CaptureHeader(
      session: session,
      showBack: !widget.embedded && Navigator.of(context).canPop(),
      torch: torch,
      onFaceTap: rescan,
    );

    Widget footer(Widget? shutter) => _CaptureFooter(
      session: session,
      shutter: shutter,
      onPillTap: rescan,
      onManual: _controller.startManual,
      onCancelRescan: rescanning ? _controller.cancelRescan : null,
    );

    if (_problem != null || !widget.cameraSupported) {
      return ScanLayout(
        background: const GlassBackground(child: SizedBox.expand()),
        header: header(null),
        footer: footer(null),
        fillCenter: true,
        grid: _CameraProblemView(
          problem: _problem ?? CameraProblem.missing,
          onManual: _controller.startManual,
        ),
      );
    }
    return CameraScanView(
      key: ValueKey('camera-${session.face}'),
      size: size,
      onCapture: (cells) {
        // A soft shutter tick for each captured face.
        ref.read(feedbackProvider).step();
        _controller.capture(cells);
      },
      onUnavailable: (problem) => setState(() => _problem = problem),
      headerBuilder: (_, torch) => header(torch),
      footerBuilder: (_, shutter) => footer(shutter),
    );
  }
}

/// Top overlay while capturing: back, which face and the flashlight on one
/// compact row, then the turn guide (mini cube + what to do) under it.
class _CaptureHeader extends StatelessWidget {
  const _CaptureHeader({
    required this.session,
    required this.showBack,
    required this.torch,
    required this.onFaceTap,
  });

  final ScanSession session;
  final bool showBack;
  final Widget? torch;
  final ValueChanged<int> onFaceTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final turnFrom = session.turnFrom;
    final turns = turnFrom == null
        ? const <({ScanTurn turn, int face})>[]
        : scanTurns(turnFrom, session.face);
    // Tall scripts (Burmese) and long hints: the guide text scrolls inside
    // a capped height so the grid keeps the middle of the screen.
    final guideMax = math.max(64.0, MediaQuery.sizeOf(context).height * 0.2);
    return ScanOverlayBar(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 2, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (showBack)
                  const BackButton(color: Colors.white)
                else
                  const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.scanFaceProgress(session.captureStep, 6),
                        key: const ValueKey('scan-step'),
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        faceName(l10n, session.face),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                ?torch,
              ],
            ),
            const SizedBox(height: 4),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: guideMax),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: MiniCube(
                      key: const ValueKey('scan-minicube'),
                      size: session.size,
                      face: session.face,
                      turnFrom: turnFrom,
                      semanticLabel: l10n.scanGuideLabel,
                      stickers: [
                        for (var face = 0; face < 6; face++)
                          ...switch (session.samples[face]) {
                            final samples? => previewColors(samples),
                            null => List<StickerColor?>.filled(
                              session.perFace,
                              null,
                            ),
                          },
                      ],
                      onFaceTap: onFaceTap,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      key: const ValueKey('scan-guide-text'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (turns.isEmpty)
                            Text(
                              faceHint(l10n, session.face),
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                              ),
                            )
                          else
                            for (var i = 0; i < turns.length; i++)
                              _TurnStep(
                                key: ValueKey('scan-turn-$i'),
                                turn: turns[i].turn,
                                number: turns.length > 1 ? i + 1 : null,
                              ),
                          const SizedBox(height: 2),
                          Text(
                            session.samples.isEmpty
                                ? l10n.scanAlignHint
                                : l10n.scanTapToRescan,
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom overlay while capturing: the captured-faces strip, then manual
/// entry beside the shutter.
class _CaptureFooter extends StatelessWidget {
  const _CaptureFooter({
    required this.session,
    required this.shutter,
    required this.onPillTap,
    required this.onManual,
    this.onCancelRescan,
  });

  final ScanSession session;

  /// Null when there is no camera (the manual button is the way on).
  final Widget? shutter;
  final ValueChanged<int> onPillTap;
  final VoidCallback onManual;
  final VoidCallback? onCancelRescan;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final small = Theme.of(context).textTheme.labelSmall
        ?.copyWith(color: Colors.white);
    final cancel = onCancelRescan;
    return ScanOverlayBar(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _FacePills(
              current: session.face,
              scanned: session.samples.keys.toSet(),
              onTap: onPillTap,
              trailing: cancel == null
                  ? null
                  : TextButton(
                      key: const ValueKey('scan-cancel-rescan'),
                      onPressed: cancel,
                      child: Text(l10n.scanCancelRescan, style: small),
                    ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton.icon(
                      key: const ValueKey('scan-manual'),
                      onPressed: onManual,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        visualDensity: VisualDensity.compact,
                      ),
                      icon: const Icon(Icons.edit_rounded, size: 16),
                      label: Text(
                        l10n.scanManualInput,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: small,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ?shutter,
                const SizedBox(width: 8),
                // Balances the manual button so the shutter stays centered.
                const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// One quarter turn of the physical cube, with a matching arrow icon.
class _TurnStep extends StatelessWidget {
  const _TurnStep({super.key, required this.turn, this.number});

  final ScanTurn turn;

  /// Position in a multi-step turn (1, 2), shown before the icon.
  final int? number;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final (IconData icon, String text) = switch (turn) {
      ScanTurn.left => (Icons.rotate_left_rounded, l10n.scanTurnLeft),
      ScanTurn.right => (Icons.rotate_right_rounded, l10n.scanTurnRight),
      ScanTurn.tipTop => (Icons.arrow_downward_rounded, l10n.scanTipTop),
      ScanTurn.tipBottom => (Icons.arrow_upward_rounded, l10n.scanTipBottom),
    };
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          if (number != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 4),
              child: Text(
                '$number',
                style: Theme.of(context).textTheme.labelLarge
                    ?.copyWith(color: AppColors.accentWarm),
              ),
            ),
          Icon(icon, size: 16, color: AppColors.accentWarm),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

/// One pill per face in scan order: scanned ones can be tapped to rescan.
class _FacePills extends StatelessWidget {
  const _FacePills({
    required this.current,
    required this.scanned,
    required this.onTap,
    this.trailing,
  });

  final int current;
  final Set<int> scanned;
  final ValueChanged<int> onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    // The pills scroll; the cancel button stays in reach at the end.
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final face in kScanOrder) ...[
                  _pill(face, l10n, textTheme),
                  const SizedBox(width: 6),
                ],
              ],
            ),
          ),
        ),
        ?trailing,
      ],
    );
  }

  Widget _pill(int face, AppLocalizations l10n, TextTheme textTheme) {
    final isCurrent = face == current;
    final done = scanned.contains(face);
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        key: ValueKey('scan-pill-$face'),
        borderRadius: BorderRadius.circular(16),
        onTap: done && !isCurrent ? () => onTap(face) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isCurrent
                ? AppColors.accent.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.35),
            border: Border.all(
              color: isCurrent ? AppColors.accent : AppColors.glassBorder,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                done
                    ? Icons.check_circle_rounded
                    : (isCurrent
                          ? Icons.photo_camera_rounded
                          : Icons.radio_button_unchecked_rounded),
                size: 12,
                color: done
                    ? AppColors.accentSecondary
                    : AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                faceName(l10n, face),
                style: textTheme.labelSmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
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
    // Scrolls when the space left under the scan guide is short (small
    // phones, long translations).
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AccentIcon(
                  icon: Icons.no_photography_rounded,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(height: AppSpace.sm),
                Text(switch (problem) {
                  CameraProblem.denied => l10n.scanCameraDenied,
                  CameraProblem.failed => l10n.scanCameraFailed,
                  CameraProblem.missing => l10n.scanCameraMissing,
                }, textAlign: TextAlign.center),
                const SizedBox(height: AppSpace.md),
                FilledButton.icon(
                  onPressed: onManual,
                  icon: const Icon(Icons.edit_rounded),
                  label: Text(l10n.scanManualInput),
                ),
              ],
            ),
          ),
        ),
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
        // Straight into the stage-by-stage guided solve (fast stays one
        // tap away, here or in the solver's Guided / Fast switch).
        FilledButton.icon(
          key: const ValueKey('scan-solve'),
          onPressed: cube == null
              ? null
              : () => onOpen(
                  cube,
                  canLearn
                      ? SolveMethod.layerByLayer
                      : (canFast ? SolveMethod.fast : null),
                ),
          icon: Icon(
            canLearn || canFast
                ? Icons.auto_awesome_motion_rounded
                : Icons.view_in_ar,
          ),
          label: Text(
            canLearn
                ? l10n.solveLearn
                : (canFast ? l10n.solve : l10n.scanOpen3d),
            textAlign: TextAlign.center,
          ),
        ),
        if (canLearn && canFast) ...[
          const SizedBox(height: 6),
          TextButton.icon(
            key: const ValueKey('scan-fast'),
            onPressed: cube == null
                ? null
                : () => onOpen(cube, SolveMethod.fast),
            icon: const Icon(Icons.bolt_rounded, size: 18),
            label: Text(l10n.solveFast),
          ),
        ],
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
    final color = valid ? AppColors.accentSecondary : AppColors.danger;
    return GlassCard(
      key: const ValueKey('scan-status'),
      padding: const EdgeInsets.all(AppSpace.md),
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
                        color: StickerPalette.of(context)[color],
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
