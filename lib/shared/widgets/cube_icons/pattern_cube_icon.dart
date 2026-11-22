import 'package:material_ui/material_ui.dart';

import '../../../core/cube/cube_state.dart';
import 'cube_icon_base.dart';
import 'mini_cube.dart';

/// A mini-cube morphing between classic decorative patterns: checkerboard,
/// center dot, then a diagonal stripe.
class AnimatedPatternCubeIcon extends AnimatedCubeIcon {
  const AnimatedPatternCubeIcon({
    super.key,
    super.size,
    super.animate,
    super.semanticLabel,
  });

  @override
  Duration get period => const Duration(milliseconds: 4800);

  /// The checkerboard.
  @override
  double get restingValue => 0.1;

  @override
  CubeIconPainter createPainter(
    Animation<double> progress,
    Map<StickerColor, Color> palette,
    TextDirection textDirection,
  ) => PatternCubePainter(progress: progress, palette: palette);
}

typedef _Faces = ({
  List<StickerColor> front,
  List<StickerColor> top,
  List<StickerColor> side,
});

class PatternCubePainter extends CubeIconPainter {
  PatternCubePainter({required super.progress, required super.palette});

  static const _w = StickerColor.white, _y = StickerColor.yellow;
  static const _g = StickerColor.green, _b = StickerColor.blue;
  static const _r = StickerColor.red, _o = StickerColor.orange;

  /// Each face: [own] everywhere, [other] where [mark] is true.
  static List<StickerColor> _face(
    StickerColor own,
    StickerColor other,
    bool Function(int col, int row) mark,
  ) => [for (var i = 0; i < 9; i++) mark(i % 3, i ~/ 3) ? other : own];

  static _Faces _pattern(bool Function(int col, int row) mark) => (
    front: _face(_g, _b, mark),
    top: _face(_w, _y, mark),
    side: _face(_r, _o, mark),
  );

  static final List<_Faces> _patterns = [
    _pattern((c, r) => (c + r).isOdd), // Checkerboard.
    _pattern((c, r) => c == 1 && r == 1), // Center dot.
    _pattern((c, r) => c == r), // Diagonal stripe.
  ];

  @override
  void paintIcon(Canvas canvas, double t, double side) {
    final count = _patterns.length;
    final index = (t * count).floor() % count;
    final local = t * count - (t * count).floor();
    final from = _patterns[index];
    final to = _patterns[(index + 1) % count];

    // Hold, then a diagonal wave of stickers morphs into the next pattern.
    double morphAt(int col, int row) {
      final start = 0.5 + (col + row) * 0.05;
      return easeInOut(phaseOf(local, start, start + 0.25));
    }

    List<Color> mix(List<StickerColor> a, List<StickerColor> b) => [
      for (var i = 0; i < 9; i++)
        Color.lerp(sticker(a[i]), sticker(b[i]), morphAt(i % 3, i ~/ 3))!,
    ];

    final cube = MiniCube(const Rect.fromLTWH(0.16, 0.16, 0.68, 0.68));
    cube.paintBody(canvas);
    cube.paintTop(canvas, mix(from.top, to.top));
    cube.paintSide(canvas, mix(from.side, to.side));
    final front = mix(from.front, to.front);
    for (var i = 0; i < 9; i++) {
      final col = i % 3, row = i ~/ 3;
      final pop = bump(morphAt(col, row));
      cube.paintTile(
        canvas,
        col.toDouble(),
        row.toDouble(),
        front[i],
        scale: 1 - 0.2 * pop,
        glow: 0.5 * pop,
      );
    }
  }
}
