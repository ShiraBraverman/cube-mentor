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
