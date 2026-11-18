import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import '../../../core/vision/color_science.dart';

/// Pixel layouts delivered by the camera image stream.
enum FrameFormat {
  /// Three planes Y, U, V (Android YUV_420_888; chroma may be interleaved,
  /// see [FramePlane.pixelStride]).
  yuv420,

  /// Two planes: Y and interleaved V/U (Android NV21).
  nv21,

  /// One plane of B, G, R, A bytes (iOS).
  bgra8888,
}

class FramePlane {
  const FramePlane({
    required this.bytes,
    required this.rowStride,
    this.pixelStride = 1,
  });

  final Uint8List bytes;
  final int rowStride;
  final int pixelStride;
}

/// One camera frame, independent of the camera plugin (so it can be tested).
class CameraFrame {
  const CameraFrame({
    required this.width,
    required this.height,
    required this.format,
    required this.planes,
  });

  final int width;
  final int height;
  final FrameFormat format;
  final List<FramePlane> planes;

  /// sRGB color of the pixel at ([x], [y]) in sensor coordinates.
  Rgb pixel(int x, int y) {
    switch (format) {
      case FrameFormat.bgra8888:
        final p = planes[0];
        final i = y * p.rowStride + x * 4;
        return (r: p.bytes[i + 2], g: p.bytes[i + 1], b: p.bytes[i]);
      case FrameFormat.nv21:
        final luma = planes[0];
        final chroma = planes[1];
        final c = (y ~/ 2) * chroma.rowStride + (x ~/ 2) * 2;
        return _yuvToRgb(
          luma.bytes[y * luma.rowStride + x],
          chroma.bytes[c + 1],
          chroma.bytes[c],
        );
      case FrameFormat.yuv420:
        final luma = planes[0];
        final u = planes[1];
        final v = planes[2];
        final cx = x ~/ 2;
        final cy = y ~/ 2;
        return _yuvToRgb(
          luma.bytes[y * luma.rowStride + x],
          u.bytes[cy * u.rowStride + cx * u.pixelStride],
          v.bytes[cy * v.rowStride + cx * v.pixelStride],
        );
    }
  }

  /// BT.601 full-range YUV to RGB (the camera's JPEG / YUV convention).
  static Rgb _yuvToRgb(int y, int u, int v) {
    final d = u - 128;
    final e = v - 128;
    int clamp(double value) => value.round().clamp(0, 255);
    return (
      r: clamp(y + 1.402 * e),
      g: clamp(y - 0.344136 * d - 0.714136 * e),
      b: clamp(y + 1.772 * d),
    );
  }
}

/// Averaged color of one grid cell plus the share of it that is specular
/// glare (see [isSpecular]).
typedef CellSample = ({Rgb color, double glare});

enum LightingHint { ok, tooDark, glare }

/// CIELAB thresholds of a specular highlight: almost maximal lightness L*
/// with almost no chroma C*, i.e. the light source reflected instead of the
/// sticker color. A white sticker lit normally stays well below this.
const double kGlareMinL = 93;
const double kGlareMaxChroma = 9;

/// Cells darker than this mean L* make colors unreliable.
const double kDimMaxMeanL = 24;

/// Share of a cell covered by glare before it is reported.
const double kGlareCellShare = 0.3;

/// Whether one pixel is a specular reflection (washed out by glare).
bool isSpecular(Rgb p) {
  if (p.r >= 250 && p.g >= 250 && p.b >= 250) return true;
  // Cheap reject before the Lab conversion: highlights are bright.
  if (p.r + p.g + p.b < 3 * 215) return false;
  final lab = labOf(p);
  final chroma = math.sqrt(lab.a * lab.a + lab.b * lab.b);
  return lab.l >= kGlareMinL && chroma <= kGlareMaxChroma;
}

/// Square alignment grid inside a preview of [size]: 80% of the shorter
/// side, centered. Returned in normalized (0..1) preview coordinates.
Rect gridRect(Size size) {
  final side = 0.8 * math.min(size.width, size.height);
  return Rect.fromLTWH(
    (size.width - side) / 2 / size.width,
    (size.height - side) / 2 / size.height,
    side / size.width,
    side / size.height,
  );
}

/// Maps a normalized point of the upright preview to normalized sensor
/// coordinates, given the sensor's clockwise rotation relative to the
/// upright (portrait) display.
Offset displayToSensor(Offset p, int sensorOrientation) =>
    switch (sensorOrientation % 360) {
      90 => Offset(p.dy, 1 - p.dx),
      180 => Offset(1 - p.dx, 1 - p.dy),
      270 => Offset(1 - p.dy, p.dx),
      _ => p,
    };

/// Samples an `n x n` grid laid over [grid] (normalized preview rect):
/// averages a 5 x 5 lattice over the middle half of every cell (stickers
/// have dark borders and rounded corners). Cells come row-major as seen on
/// screen.
List<CellSample> sampleGrid(
  CameraFrame frame,
  int n,
  Rect grid, {
  required int sensorOrientation,
}) {
  const lattice = 5;
  final cell = grid.width / n;
  final cellH = grid.height / n;
  return [
    for (var row = 0; row < n; row++)
      for (var col = 0; col < n; col++)
        () {
          var r = 0, g = 0, b = 0, glare = 0;
          for (var i = 0; i < lattice; i++) {
            for (var j = 0; j < lattice; j++) {
              final u =
                  grid.left + (col + 0.25 + 0.5 * (j + 0.5) / lattice) * cell;
              final v =
                  grid.top + (row + 0.25 + 0.5 * (i + 0.5) / lattice) * cellH;
              final s = displayToSensor(Offset(u, v), sensorOrientation);
              final x = (s.dx * frame.width).floor().clamp(0, frame.width - 1);
              final y = (s.dy * frame.height).floor().clamp(
                0,
                frame.height - 1,
              );
              final p = frame.pixel(x, y);
              r += p.r;
              g += p.g;
              b += p.b;
              if (isSpecular(p)) glare++;
            }
          }
          const count = lattice * lattice;
          return (
            color: (
              r: (r / count).round(),
              g: (g / count).round(),
              b: (b / count).round(),
            ),
            glare: glare / count,
          );
        }(),
  ];
}

/// Grid cells (row-major) whose stickers are washed out by glare.
Set<int> glareCells(List<CellSample> cells) => {
  for (var i = 0; i < cells.length; i++)
    if (cells[i].glare >= kGlareCellShare) i,
};

/// Warns about lighting that makes colors unreliable: specular glare on any
/// sticker, or a frame too dim to tell colors apart (mean L*).
LightingHint assessLighting(List<CellSample> cells) {
  if (cells.isEmpty) return LightingHint.ok;
  if (glareCells(cells).isNotEmpty) return LightingHint.glare;
  final meanL =
      cells.map((c) => labOf(c.color).l).reduce((a, b) => a + b) / cells.length;
  return meanL < kDimMaxMeanL ? LightingHint.tooDark : LightingHint.ok;
}

/// Smooths per-frame lighting readings so the tip neither flickers nor
/// lingers: a problem must be seen in [showAfter] frames in a row to
/// appear, and good light in [hideAfter] frames in a row to clear it.
class LightingMonitor {
  LightingMonitor({this.showAfter = 3, this.hideAfter = 6});

  final int showAfter;
  final int hideAfter;

  LightingHint _shown = LightingHint.ok;
  LightingHint _candidate = LightingHint.ok;
  int _streak = 0;

  LightingHint get hint => _shown;

  /// Feeds one frame's reading; returns the hint to show.
  LightingHint add(LightingHint reading) {
    if (reading == _shown) {
      _streak = 0;
      _candidate = reading;
      return _shown;
    }
    if (reading == _candidate) {
      _streak++;
    } else {
      _candidate = reading;
      _streak = 1;
    }
    final needed = reading == LightingHint.ok ? hideAfter : showAfter;
    if (_streak >= needed) {
      _shown = reading;
      _streak = 0;
    }
    return _shown;
  }
}
