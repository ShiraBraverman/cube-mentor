import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:vector_math/vector_math_64.dart'
    show Matrix3, Quaternion, Vector3;

import '../../../core/cube/cube_state.dart';
import '../../../core/theme/app_colors.dart';
import '../model/scan_turns.dart';

/// Compact 3D scan guide: the faces scanned so far in their colors, the
/// others gray with an "x". When [face] changes it turns, a quarter turn at
/// a time with an arrow, the way the physical cube has to be turned, until
/// [face] is in front. Tapping a visible face calls [onFaceTap].
class MiniCube extends StatefulWidget {
  const MiniCube({
    super.key,
    required this.size,
    required this.stickers,
    required this.face,
    this.turnFrom,
    this.onFaceTap,
    this.semanticLabel,
  });

  final int size;

  /// Facelet-order colors (URFDLB, `6 * size * size`); null = not scanned.
  final List<StickerColor?> stickers;

  /// Face to show in front.
  final int face;

  /// Face the user is turning from; the guide animates that turn. Without
  /// it, the cube simply shows [face].
  final int? turnFrom;

  final ValueChanged<int>? onFaceTap;
  final String? semanticLabel;

  /// Time for one quarter turn.
  static const Duration quarterTurn = Duration(milliseconds: 650);

  @override
  State<MiniCube> createState() => _MiniCubeState();
}

class _MiniCubeState extends State<MiniCube>
    with SingleTickerProviderStateMixin {
  late final AnimationController _turn = AnimationController(vsync: this);

  /// Orientations visited (first = start) and the turn into each one.
  List<Quaternion> _keys = [];
  List<ScanTurn> _turns = [];

  @override
  void initState() {
    super.initState();
    _plan();
  }

  @override
  void didUpdateWidget(MiniCube oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.face != widget.face ||
        oldWidget.turnFrom != widget.turnFrom) {
      _plan();
    }
  }

  void _plan() {
    final from = widget.turnFrom;
    final path = from == null
        ? const <({ScanTurn turn, int face})>[]
        : scanTurns(from, widget.face);
    _keys = [
      scanFaceOrientation(path.isEmpty ? widget.face : from!),
      for (final step in path) scanFaceOrientation(step.face),
    ];
    _turns = [for (final step in path) step.turn];
    _turn.stop();
    if (_turns.isEmpty) {
      _turn.value = 0;
      return;
    }
    // Hold the old view a moment so the turn is easy to follow.
    _turn
      ..duration =
          MiniCube.quarterTurn * _turns.length +
          const Duration(milliseconds: 250)
      ..forward(from: 0);
  }

  @override
  void dispose() {
    _turn.dispose();
    super.dispose();
  }

  ({Quaternion orientation, ScanTurn? turn, double arrow}) _at(double t) {
    if (_turns.isEmpty) {
      return (orientation: _keys.first, turn: null, arrow: 0);
    }
    final total = _turn.duration!.inMilliseconds;
    final hold = 250 / total;
    final progress = ((t - hold) / (1 - hold)).clamp(0.0, 1.0) * _turns.length;
    final index = math.min(progress.floor(), _turns.length - 1);
    final local = Curves.easeInOutCubic.transform(progress - index);
    return (
      orientation: _slerp(_keys[index], _keys[index + 1], local),
      turn: _turns[index],
      arrow: 1,
    );
  }

  static Quaternion _slerp(Quaternion a, Quaternion b, double t) {
    var dot = a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
    var target = b;
    if (dot < 0) {
      dot = -dot;
      // Same rotation, other hemisphere.
      target = Quaternion(-b.x, -b.y, -b.z, -b.w);
    }
    final theta = math.acos(dot.clamp(-1.0, 1.0));
    if (theta < 1e-4) return a;
    final s = math.sin(theta);
    final wa = math.sin((1 - t) * theta) / s;
    final wb = math.sin(t * theta) / s;
    return Quaternion(
      a.x * wa + target.x * wb,
      a.y * wa + target.y * wb,
      a.z * wa + target.z * wb,
      a.w * wa + target.w * wb,
    )..normalize();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      child: AnimatedBuilder(
        animation: _turn,
        builder: (context, _) {
          final state = _at(_turn.value);
          final scene = MiniCubeScene(
            size: widget.size,
            stickers: widget.stickers,
            orientation: state.orientation,
            highlight: widget.face,
          );
          return LayoutBuilder(
            builder: (context, constraints) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: widget.onFaceTap == null
                  ? null
                  : (details) {
                      final face = scene.faceAt(
                        details.localPosition,
                        constraints.biggest,
                      );
                      if (face != null) widget.onFaceTap!(face);
                    },
              child: CustomPaint(
                size: Size.infinite,
                painter: _MiniCubePainter(scene, state.turn),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// One visible face of the mini-cube, projected to the widget.
class MiniCubeFace {
  const MiniCubeFace(this.face, this.outline, this.stickers, this.depth);

  final int face;
  final List<Offset> outline;
  final List<({List<Offset> quad, StickerColor? color})> stickers;
  final double depth;
}

/// Projection of the mini-cube for one orientation (shared by painting and
/// hit testing).
class MiniCubeScene {
  MiniCubeScene({
    required this.size,
    required this.stickers,
    required this.orientation,
    required this.highlight,
  });

  final int size;
  final List<StickerColor?> stickers;
  final Quaternion orientation;
  final int highlight;

  /// A fixed three-quarter view: a little from the right and from above,
  /// so the front face reads clearly and two neighbours show.
  static final Matrix3 _tilt =
      Matrix3.rotationX(0.42) * Matrix3.rotationY(-0.5) as Matrix3;

  /// Cube half-size in widget units, relative to the shorter side.
  static double scale(Size s) => math.min(s.width, s.height) * 0.26;

  List<MiniCubeFace> project(Size widget) {
    final view = _tilt * orientation.asRotationMatrix() as Matrix3;
    final center = Offset(widget.width / 2, widget.height / 2);
    final k = scale(widget);
    Offset toScreen(Vector3 p) {
      final v = view.transformed(p);
      return center + Offset(v.x, -v.y) * k;
    }

    Vector3 vec(({int x, int y, int z}) v) =>
        Vector3(v.x.toDouble(), v.y.toDouble(), v.z.toDouble());

    final n = size;
    final faces = <MiniCubeFace>[];
    for (var face = 0; face < 6; face++) {
      final frame = kScanFaceFrames[face]!;
      final normal = vec(frame.normal);
      final depth = view.transformed(normal).z;
      if (depth <= 0.02) continue;
      final up = vec(frame.up);
      final right = vec(frame.right);
      Vector3 point(double u, double v) =>
          normal + right * (2 * u - 1) + up * (1 - 2 * v);
      final cells = <({List<Offset> quad, StickerColor? color})>[];
      for (var row = 0; row < n; row++) {
        for (var col = 0; col < n; col++) {
          final u0 = col / n, u1 = (col + 1) / n;
          final v0 = row / n, v1 = (row + 1) / n;
          cells.add((
            quad: [
              toScreen(point(u0, v0)),
              toScreen(point(u1, v0)),
              toScreen(point(u1, v1)),
              toScreen(point(u0, v1)),
            ],
            color: stickers[face * n * n + row * n + col],
          ));
        }
      }
      faces.add(
        MiniCubeFace(
          face,
          [
            toScreen(point(0, 0)),
            toScreen(point(1, 0)),
            toScreen(point(1, 1)),
            toScreen(point(0, 1)),
          ],
          cells,
          depth,
        ),
      );
    }
    faces.sort((a, b) => a.depth.compareTo(b.depth));
    return faces;
  }

  /// The visible face under [point], nearest to the viewer first.
  int? faceAt(Offset point, Size widget) {
    for (final face in project(widget).reversed) {
      if (_polygon(face.outline).contains(point)) return face.face;
    }
    return null;
  }

  static Path _polygon(List<Offset> pts) => Path()..addPolygon(pts, true);
}

class _MiniCubePainter extends CustomPainter {
  _MiniCubePainter(this.scene, this.turn);

  final MiniCubeScene scene;
  final ScanTurn? turn;

  static const Color _blank = Color(0xFF4A5068);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;
    final fill = Paint()..isAntiAlias = true;
    final stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (final face in scene.project(size)) {
      // Faces turned away are darker, like the main viewport.
      final shade = 0.55 + 0.45 * face.depth.clamp(0.0, 1.0);
      fill.color = AppColors.cubeBody;
      canvas.drawPath(MiniCubeScene._polygon(face.outline), fill);
      for (final cell in face.stickers) {
        final quad = _inset(cell.quad, 0.8);
        final color = cell.color;
        fill.color = _shade(
          color == null ? _blank : AppColors.stickers[color]!,
          shade,
        );
        canvas.drawPath(MiniCubeScene._polygon(quad), fill);
        if (color == null) {
          // Not scanned yet: a faint "x".
          final mark = _inset(quad, 0.45);
          stroke
            ..color = Colors.white.withValues(alpha: 0.35 * shade)
            ..strokeWidth = math.max(1, scene.size <= 3 ? 1.6 : 1.1);
          canvas
            ..drawLine(mark[0], mark[2], stroke)
            ..drawLine(mark[1], mark[3], stroke);
        }
      }
      if (face.face == scene.highlight && face.depth > 0.6) {
        stroke
          ..color = AppColors.accent
          ..strokeWidth = 2.4;
        canvas.drawPath(MiniCubeScene._polygon(face.outline), stroke);
      }
    }
    final turn = this.turn;
    if (turn != null) _paintArrow(canvas, size, turn);
  }

  /// A curved arrow next to the cube showing which way to turn it.
  void _paintArrow(Canvas canvas, Size size, ScanTurn turn) {
    final c = Offset(size.width / 2, size.height / 2);
    final k = MiniCubeScene.scale(size);
    final (Offset start, Offset control, Offset end) = switch (turn) {
      ScanTurn.left => (
        c + Offset(1.15 * k, 1.45 * k),
        c + Offset(0, 2.05 * k),
        c + Offset(-1.15 * k, 1.45 * k),
      ),
      ScanTurn.right => (
        c + Offset(-1.15 * k, 1.45 * k),
        c + Offset(0, 2.05 * k),
        c + Offset(1.15 * k, 1.45 * k),
      ),
      ScanTurn.tipTop => (
        c + Offset(1.55 * k, -1.1 * k),
        c + Offset(2.1 * k, 0),
        c + Offset(1.55 * k, 1.1 * k),
      ),
      ScanTurn.tipBottom => (
        c + Offset(1.55 * k, 1.1 * k),
        c + Offset(2.1 * k, 0),
        c + Offset(1.55 * k, -1.1 * k),
      ),
    };
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = math.max(2.5, k * 0.13)
      ..color = AppColors.accentWarm;
    canvas.drawPath(
      Path()
        ..moveTo(start.dx, start.dy)
        ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy),
      paint,
    );
    final direction = end - control;
    final unit = direction / direction.distance;
    final head = k * 0.42;
    Offset rotate(Offset v, double a) => Offset(
      v.dx * math.cos(a) - v.dy * math.sin(a),
      v.dx * math.sin(a) + v.dy * math.cos(a),
    );
    canvas.drawPath(
      Path()
        ..moveTo(
          (end - rotate(unit, 0.5) * head).dx,
          (end - rotate(unit, 0.5) * head).dy,
        )
        ..lineTo(end.dx, end.dy)
        ..lineTo(
          (end - rotate(unit, -0.5) * head).dx,
          (end - rotate(unit, -0.5) * head).dy,
        ),
      paint,
    );
  }

  static List<Offset> _inset(List<Offset> quad, double factor) {
    final center = (quad[0] + quad[1] + quad[2] + quad[3]) / 4;
    return [for (final q in quad) center + (q - center) * factor];
  }

  static Color _shade(Color color, double shade) => Color.from(
    alpha: color.a,
    red: color.r * shade,
    green: color.g * shade,
    blue: color.b * shade,
  );

  @override
  bool shouldRepaint(_MiniCubePainter old) =>
      old.scene.orientation != scene.orientation ||
      old.scene.stickers != scene.stickers ||
      old.scene.highlight != scene.highlight ||
      old.turn != turn;
}
