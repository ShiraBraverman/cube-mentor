import 'dart:io';

import 'package:camera/camera.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/vision/color_science.dart';
import '../widgets/lighting_tip.dart';
import 'frame_sampler.dart';

/// Live camera preview with an `n x n` alignment grid. Every grid cell shows
/// the color it currently sees, smoothed over a few frames, and
/// [onCapture] receives the averaged colors (row-major) when the user taps
/// the shutter.
class CameraScanView extends StatefulWidget {
  const CameraScanView({
    super.key,
    required this.size,
    required this.onCapture,
    required this.onUnavailable,
    this.footer,
  });

  final int size;
  final ValueChanged<List<Rgb>> onCapture;

  /// Called with a message key when no usable camera exists.
  final ValueChanged<CameraProblem> onUnavailable;

  /// Shown under the preview, next to the shutter button.
  final Widget? footer;

  /// The camera plugin's image stream is available on phones only.
  static bool get supported => Platform.isAndroid || Platform.isIOS;

  @override
  State<CameraScanView> createState() => _CameraScanViewState();
}

enum CameraProblem { missing, denied, failed }

class _CameraScanViewState extends State<CameraScanView>
    with WidgetsBindingObserver {
  CameraController? _controller;
  int _sensorOrientation = 90;
  bool _busy = false;
  DateTime _lastFrame = DateTime.fromMillisecondsSinceEpoch(0);

  /// Exponential moving average of each cell's color (r, g, b).
  List<List<double>>? _smoothed;
  final LightingMonitor _monitor = LightingMonitor();
  LightingHint _lighting = LightingHint.ok;

  /// Cells currently washed out by glare, outlined on the grid.
  Set<int> _glare = const {};

  bool _torch = false;
  bool _hasTorch = true;

  static const _frameInterval = Duration(milliseconds: 110);
  static const _smoothing = 0.45;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _start();
  }

  @override
  void didUpdateWidget(CameraScanView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.size != widget.size) _smoothed = null;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _stop();
    } else if (state == AppLifecycleState.resumed && _controller == null) {
      _start();
    }
  }

  Future<void> _start() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        widget.onUnavailable(CameraProblem.missing);
        return;
      }
      final camera = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: Platform.isIOS
            ? ImageFormatGroup.bgra8888
            : ImageFormatGroup.yuv420,
      );
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      _sensorOrientation = camera.sensorOrientation;
      await controller.startImageStream(_onFrame);
      setState(() => _controller = controller);
    } on CameraException catch (error) {
      if (!mounted) return;
      widget.onUnavailable(
        error.code.contains('Denied') || error.code.contains('denied')
            ? CameraProblem.denied
            : CameraProblem.failed,
      );
    }
  }

  Future<void> _toggleTorch() async {
    final controller = _controller;
    if (controller == null) return;
    final on = !_torch;
    try {
      await controller.setFlashMode(on ? FlashMode.torch : FlashMode.off);
      if (mounted) setState(() => _torch = on);
    } on CameraException {
      // No flash unit (front cameras, some tablets): hide the button.
      if (mounted) setState(() => _hasTorch = false);
    }
  }

  void _stop() {
    final controller = _controller;
    _controller = null;
    _torch = false;
    if (controller == null) return;
    if (controller.value.isStreamingImages) {
      controller.stopImageStream().catchError((_) {});
    }
    controller.dispose();
  }

  void _onFrame(CameraImage image) {
    final now = DateTime.now();
    if (_busy || now.difference(_lastFrame) < _frameInterval || !mounted) {
      return;
    }
    _busy = true;
    _lastFrame = now;
    try {
      final frame = _toFrame(image);
      if (frame == null) return;
      final n = widget.size;
      final preview = _controller?.value.previewSize;
      if (preview == null) return;
      // The preview is shown upright (portrait): width/height swap.
      final upright = Size(preview.height, preview.width);
      final cells = sampleGrid(
        frame,
        n,
        gridRect(upright),
        sensorOrientation: _sensorOrientation,
      );
      final smoothed = _smoothed;
      final next = [
        for (var i = 0; i < cells.length; i++)
          () {
            final c = cells[i].color;
            final sample = [c.r.toDouble(), c.g.toDouble(), c.b.toDouble()];
            if (smoothed == null || smoothed.length != cells.length) {
              return sample;
            }
            return [
              for (var k = 0; k < 3; k++)
                smoothed[i][k] + _smoothing * (sample[k] - smoothed[i][k]),
            ];
          }(),
      ];
      final lighting = _monitor.add(assessLighting(cells));
      setState(() {
        _smoothed = next;
        _lighting = lighting;
        _glare = lighting == LightingHint.glare ? glareCells(cells) : const {};
      });
    } finally {
      _busy = false;
    }
  }

  CameraFrame? _toFrame(CameraImage image) {
    final planes = [
      for (final p in image.planes)
        FramePlane(
          bytes: p.bytes,
          rowStride: p.bytesPerRow,
          pixelStride: p.bytesPerPixel ?? 1,
        ),
    ];
    final format = switch (image.format.group) {
      ImageFormatGroup.bgra8888 => FrameFormat.bgra8888,
      ImageFormatGroup.nv21 => FrameFormat.nv21,
      ImageFormatGroup.yuv420 when planes.length >= 3 => FrameFormat.yuv420,
      ImageFormatGroup.yuv420 when planes.length == 2 => FrameFormat.nv21,
      _ => null,
    };
    if (format == null) return null;
    return CameraFrame(
      width: image.width,
      height: image.height,
      format: format,
      planes: planes,
    );
  }

  List<Rgb>? get _currentColors => _smoothed
      ?.map((c) => (r: c[0].round(), g: c[1].round(), b: c[2].round()))
      .toList();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final controller = _controller;
    final colors = _currentColors;
    return Column(
      children: [
        Expanded(
          child: Center(
            child: controller == null || !controller.value.isInitialized
                ? const CircularProgressIndicator()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CameraPreview(
                      controller,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: _GridOverlay(
                              n: widget.size,
                              colors: colors,
                              glare: _glare,
                            ),
                          ),
                          // Non-intrusive: above the grid, never over it.
                          PositionedDirectional(
                            top: 8,
                            start: 8,
                            end: 8,
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                child: LightingTip(
                                  key: ValueKey(_lighting),
                                  hint: _lighting,
                                  torchOn: _torch,
                                  onTorch: _hasTorch ? _toggleTorch : null,
                                ),
                              ),
                            ),
                          ),
                          if (_hasTorch)
                            PositionedDirectional(
                              bottom: 8,
                              end: 8,
                              child: IconButton.filledTonal(
                                key: const ValueKey('scan-torch-toggle'),
                                tooltip: l10n.scanTorch,
                                onPressed: _toggleTorch,
                                icon: Icon(
                                  _torch
                                      ? Icons.flashlight_off_rounded
                                      : Icons.flashlight_on_rounded,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: widget.footer ?? const SizedBox.shrink()),
            const SizedBox(width: 12),
            FloatingActionButton.large(
              key: const ValueKey('scan-capture'),
              tooltip: l10n.scanCapture,
              onPressed: colors == null
                  ? null
                  : () => widget.onCapture(List.unmodifiable(colors)),
              child: const Icon(Icons.camera_rounded, size: 40),
            ),
          ],
        ),
      ],
    );
  }
}

/// The alignment grid drawn over the preview, with each cell's live color.
class _GridOverlay extends StatelessWidget {
  const _GridOverlay({
    required this.n,
    required this.colors,
    this.glare = const {},
  });

  final int n;
  final List<Rgb>? colors;

  /// Cells to outline as washed out by glare.
  final Set<int> glare;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        final rect = gridRect(size);
        final grid = Rect.fromLTWH(
          rect.left * size.width,
          rect.top * size.height,
          rect.width * size.width,
          rect.height * size.height,
        );
        final cell = grid.width / n;
        return Stack(
          children: [
            for (var row = 0; row < n; row++)
              for (var col = 0; col < n; col++)
                Positioned(
                  left: grid.left + col * cell,
                  top: grid.top + row * cell,
                  width: cell,
                  height: cell,
                  child: _Cell(
                    color: colors?[row * n + col],
                    glare: glare.contains(row * n + col),
                  ),
                ),
          ],
        );
      },
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({required this.color, this.glare = false});

  final Rgb? color;
  final bool glare;

  @override
  Widget build(BuildContext context) {
    final sample = color;
    final guess = sample == null
        ? null
        : AppColors.stickers[nearestStickerColor(sample)];
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: glare
              ? AppColors.accentWarm
              : Colors.white.withValues(alpha: 0.85),
          width: glare ? 3 : 2,
        ),
      ),
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(4),
      child: guess == null
          ? null
          : Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: guess,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black54),
              ),
            ),
    );
  }
}

/// Mid-capture sticker color guess for one face (used by the scan guide).
List<StickerColor> previewColors(List<Rgb> samples) => [
  for (final s in samples) nearestStickerColor(s),
];
