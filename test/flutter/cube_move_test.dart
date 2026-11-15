import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CubeMove p(String token, [int size = 3]) => MoveNotation.parse(token, size);

  group('MoveNotation.parse', () {
    test('outer face turns map to the correct axis, layer and direction', () {
      expect(p('R'), _move(axis: 0, from: 2, to: 2, q: 3));
      expect(p('L'), _move(axis: 0, from: 0, to: 0, q: 1));
      expect(p('U'), _move(axis: 1, from: 2, to: 2, q: 3));
      expect(p('D'), _move(axis: 1, from: 0, to: 0, q: 1));
      expect(p('F'), _move(axis: 2, from: 2, to: 2, q: 3));
      expect(p('B'), _move(axis: 2, from: 0, to: 0, q: 1));
    });

    test('prime and double suffixes', () {
      expect(p("R'").quarterTurns, 1);
      expect(p('R2').quarterTurns, 2);
      expect(p("R2'").quarterTurns, 2);
      expect(p("L'").quarterTurns, 3);
    });

    test('wide moves default to two layers and accept a depth prefix', () {
      expect(p('Rw', 4), _move(axis: 0, from: 2, to: 3, q: 3));
      expect(p('r', 4), p('Rw', 4));
      expect(p('3Rw', 6), _move(axis: 0, from: 3, to: 5, q: 3));
      expect(p('3Lw', 6), _move(axis: 0, from: 0, to: 2, q: 1));
      expect(p("Uw'", 5), _move(axis: 1, from: 3, to: 4, q: 1));
    });

    test('numbered single inner slices', () {
      expect(p('2R', 4), _move(axis: 0, from: 2, to: 2, q: 3));
      expect(p('3U', 6), _move(axis: 1, from: 3, to: 3, q: 3));
      expect(p('2F', 5), _move(axis: 2, from: 3, to: 3, q: 3));
    });

    test('middle slices follow L, D and F', () {
      expect(p('M'), _move(axis: 0, from: 1, to: 1, q: 1));
      expect(p('E'), _move(axis: 1, from: 1, to: 1, q: 1));
      expect(p('S'), _move(axis: 2, from: 1, to: 1, q: 3));
      expect(p('M', 5), _move(axis: 0, from: 2, to: 2, q: 1));
    });

    test('whole-cube rotations cover every layer', () {
      expect(p('x', 4), _move(axis: 0, from: 0, to: 3, q: 3));
      expect(p("y'", 2), _move(axis: 1, from: 0, to: 1, q: 1));
      expect(p('z2', 6), _move(axis: 2, from: 0, to: 5, q: 2));
    });

    test('rejects invalid tokens', () {
      for (final bad in ['', 'Q', 'R3', 'Rww', 'rw', '4R', 'M2x', '2x']) {
        expect(() => p(bad), throwsA(isA<MoveParseException>()), reason: bad);
      }
      expect(() => p('M', 4), throwsA(isA<MoveParseException>()));
      expect(() => p('7Rw', 6), throwsA(isA<MoveParseException>()));
    });

    test('parses sequences', () {
      final moves = MoveNotation.parseSequence("  R U  R' U' ", 3);
      expect(moves.map((m) => m.notation), ['R', 'U', "R'", "U'"]);
    });
  });

  group('MoveNotation.describe', () {
    test('round-trips every single layer, wide block and rotation', () {
      for (final n in [2, 3, 4, 5, 6]) {
        for (var axis = 0; axis < 3; axis++) {
          for (var q = 1; q <= 3; q++) {
            final ranges = [
              for (var l = 0; l < n; l++) (l, l),
              for (var d = 2; d < n; d++) ...[(n - d, n - 1), (0, d - 1)],
              (0, n - 1),
            ];
            for (final (from, to) in ranges) {
              final move = MoveNotation.describe(
                axis: axis,
                fromLayer: from,
                toLayer: to,
                quarterTurns: q,
                size: n,
              );
              expect(
                move,
                _move(axis: axis, from: from, to: to, q: q),
                reason: '${n}x$n axis $axis $from..$to q$q -> ${move.notation}',
              );
              expect(MoveNotation.parse(move.notation, n), move);
            }
          }
        }
      }
    });

    test('uses familiar names', () {
      String name(int axis, int from, int to, int q, [int n = 3]) =>
          MoveNotation.describe(
            axis: axis,
            fromLayer: from,
            toLayer: to,
            quarterTurns: q,
            size: n,
          ).notation;
      expect(name(0, 2, 2, 3), 'R');
      expect(name(0, 0, 0, 3), "L'");
      expect(name(0, 1, 1, 1), 'M');
      expect(name(2, 1, 1, 3), 'S');
      expect(name(1, 0, 2, 2), 'y2');
      expect(name(0, 2, 2, 3, 4), '2R');
      expect(name(0, 1, 1, 1, 4), '2L');
      expect(name(1, 2, 3, 3, 4), 'Uw');
      expect(name(0, 3, 5, 3, 6), '3Rw');
    });

    test('rejects blocks not anchored to a face and full turns', () {
      expect(
        () => MoveNotation.describe(
            axis: 0, fromLayer: 1, toLayer: 2, quarterTurns: 1, size: 5),
        throwsArgumentError,
      );
      expect(
        () => MoveNotation.describe(
            axis: 0, fromLayer: 0, toLayer: 0, quarterTurns: 4, size: 3),
        throwsArgumentError,
      );
    });
  });

  group('CubeMove.inverse', () {
    test('inverts direction and notation', () {
      expect(p('R').inverse, p("R'"));
      expect(p('R').inverse.notation, "R'");
      expect(p("Rw'", 4).inverse.notation, 'Rw');
      expect(p('U2').inverse, p('U2'));
      expect(p('R').inverse.inverse, p('R'));
    });

    test('signed quarter turns animate the short way', () {
      expect(p('R').signedQuarterTurns, -1);
      expect(p("R'").signedQuarterTurns, 1);
      expect(p('R2').signedQuarterTurns, 2);
    });
  });
}

CubeMove _move({
  required int axis,
  required int from,
  required int to,
  required int q,
}) => CubeMove(
  axis: axis,
  fromLayer: from,
  toLayer: to,
  quarterTurns: q,
  notation: '',
);
