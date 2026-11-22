import 'dart:io';

import 'package:camera/camera.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/vision/color_science.dart';
import '../widgets/lighting_tip.dart';
import '../widgets/scan_layout.dart';
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
    required this.headerBuilder,
    required this.footerBuilder,
  });

  final int size;
  final ValueChanged<List<Rgb>> onCapture;

  /// Called with a message key when no usable camera exists.
  final ValueChanged<CameraProblem> onUnavailable;

  /// The top overlay; gets the flashlight toggle (null without a torch).
  final Widget Function(BuildContext context, Widget? torch) headerBuilder;

  /// The bottom overlay; gets the shutter button to place.
  final Widget Function(BuildContext context, Widget shutter) footerBuilder;

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

  /// Where [ScanLayout] put the grid on screen, and the full screen size:
  /// frames are sampled exactly under it. Written during layout only.
  Rect? _screenGrid;
  Size? _viewport;

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
      final value = _controller?.value;
      final upright = _uprightPreview();
      if (value == null || upright == null) return;
      final rotation = _rotation(value);
      final screenGrid = _screenGrid;
      final viewport = _viewport;
      // The preview covers the whole screen: sample what the on-screen
      // grid actually frames (the centered default before first layout).
      final grid = screenGrid == null || viewport == null || viewport.isEmpty
          ? gridRect(upright)
          : previewGridRect(
              viewport: viewport,
              grid: screenGrid,
              preview: upright,
            );
      final cells = sampleGrid(frame, n, grid, sensorOrientation: rotation);
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

  // Portrait on phones; tablets and foldables may run in landscape.
  int _rotation(CameraValue value) =>
      sensorToDisplayRotation(_sensorOrientation, value.deviceOrientation);

  /// The preview size as shown on screen (a quarter turn swaps the
  /// sensor's width and height).
  Size? _uprightPreview() {
    final value = _controller?.value;
    final preview = value?.previewSize;
    if (value == null || preview == null) return null;
    return _rotation(value) % 180 == 0
        ? preview
        : Size(preview.height, preview.width);
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
    final upright = _uprightPreview();
    final ready =
        controller != null && controller.value.isInitialized && upright != null;
    final torch = ready && _hasTorch
        ? IconButton(
            key: const ValueKey('scan-torch-toggle'),
            tooltip: l10n.scanTorch,
            onPressed: _toggleTorch,
            style: IconButton.styleFrom(
              backgroundColor: _torch
                  ? AppColors.accentWarm.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.12),
            ),
            icon: Icon(
              _torch
                  ? Icons.flashlight_off_rounded
                  : Icons.flashlight_on_rounded,
              size: 20,
            ),
          )
        : null;
    final shutter = FloatingActionButton(
      key: const ValueKey('scan-capture'),
      tooltip: l10n.scanCapture,
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white, width: 3),
      ),
      onPressed: colors == null
          ? null
          : () => widget.onCapture(List.unmodifiable(colors)),
      child: const Icon(Icons.camera_rounded, size: 30),
    );
    return ScanLayout(
      background: ColoredBox(
        color: Colors.black,
        child: ready
            // Full bleed: the preview covers the screen, cropping the
            // overflow; sampling maps the grid through the same crop.
            ? FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: SizedBox.fromSize(
                  size: upright,
                  child: CameraPreview(controller),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      header: widget.headerBuilder(context, torch),
      footer: widget.footerBuilder(context, shutter),
      grid: ScanGridOverlay(n: widget.size, colors: colors, glare: _glare),
      // Under the grid, never over it, and it never blocks a capture.
      tip: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: LightingTip(
          key: ValueKey(_lighting),
          hint: _lighting,
          torchOn: _torch,
          onTorch: _hasTorch ? _toggleTorch : null,
        ),
      ),
      onGridRect: (grid, viewport) {
        _screenGrid = grid;
        _viewport = viewport;
      },
    );
  }
}

/// The alignment grid drawn over the preview, with each cell's live color.
/// Cell `row * n + col` is always drawn at physical column `col` counted
/// from the left, in every locale: it sits over the camera pixels it
/// samples, so an RTL layout must never mirror it.
class ScanGridOverlay extends StatelessWidget {
  const ScanGridOverlay({
    super.key,
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
    // ScanLayout hands this a square exactly the size of the grid.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          for (var row = 0; row < n; row++)
            Expanded(
              child: Row(
                children: [
                  for (var col = 0; col < n; col++)
                    Expanded(
                      child: _Cell(
                        key: ValueKey('scan-cell-${row * n + col}'),
                        color: colors?[row * n + col],
                        glare: glare.contains(row * n + col),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({super.key, required this.color, this.glare = false});

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
