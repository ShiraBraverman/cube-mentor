import 'dart:math';

import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:flutter_test/flutter_test.dart';

/// Canonical sticker snapshot used to compare cube states.
List<List<StickerColor>> snapshot(CubeState cube) =>
    [for (final n in kFaceNormals) cube.faceColors(n)];

CubeState run(int size, String sequence) =>
    CubeState.solved(size).applyAll(MoveNotation.parseSequence(sequence, size));

void main() {
  const sizes = [2, 3, 4, 5, 6];
  const W = StickerColor.white;
  const Y = StickerColor.yellow;
  const G = StickerColor.green;
  const R = StickerColor.red;

  group('solved cube', () {
    for (final n in sizes) {
      test('${n}x$n has n^2 uniform stickers per face', () {
        final cube = CubeState.solved(n);
        expect(cube.cubies, hasLength(n * n * n));
        for (final normal in kFaceNormals) {
          final colors = cube.faceColors(normal);
          expect(colors, hasLength(n * n));
          expect(colors.toSet(), {kSolvedColors[normal]});
        }
        expect(cube.isSolved, isTrue);
      });
    }
  });

  group('move direction (sticker level, 3x3)', () {
    test('R brings the D color onto the right column of F', () {
      final front = run(3, 'R').faceColors(kNormalFront);
      expect([front[2], front[5], front[8]], [Y, Y, Y]);
      expect([front[0], front[3], front[6]], [G, G, G]);
      final up = run(3, 'R').faceColors(kNormalUp);
      expect([up[2], up[5], up[8]], [G, G, G]);
    });

    test('U brings the R color onto the top row of F', () {
      final front = run(3, 'U').faceColors(kNormalFront);
      expect(front.sublist(0, 3), [R, R, R]);
      expect(front.sublist(3), everyElement(G));
    });

    test('F turns the bottom row of U to the L color', () {
      final up = run(3, 'F').faceColors(kNormalUp);
      expect(up.sublist(6), everyElement(StickerColor.orange));
      expect(up.sublist(0, 6), everyElement(W));
    });
  });

  group('group identities', () {
    final tokensBySize = {
      2: ['U', 'D', 'L', 'R', 'F', 'B', 'x', 'y', 'z'],
      3: ['U', 'R', 'F', 'D', 'L', 'B', 'M', 'E', 'S', 'Rw', 'x'],
      4: ['U', 'R', 'Rw', '2R', '2U', 'Fw', 'Lw', 'x'],
      5: ['R', 'Rw', '2R', '3R', 'M', 'Uw', 'z'],
      6: ['R', '2R', '3R', 'Rw', '3Rw', '3Uw', '3F', 'y'],
    };

    for (final MapEntry(key: n, value: tokens) in tokensBySize.entries) {
      test('${n}x$n: every move has order 4 and cancels with its inverse', () {
        final solved = snapshot(CubeState.solved(n));
        final start = run(n, n == 2 ? "R U F'" : "R U F' Rw2 D B'");
        final startSnap = snapshot(start);
        for (final token in tokens) {
          final move = MoveNotation.parse(token, n);
          var cube = start;
          for (var i = 0; i < 4; i++) {
            cube = cube.apply(move);
          }
          expect(snapshot(cube), startSnap, reason: '$token x4');
          expect(snapshot(start.apply(move).apply(move.inverse)), startSnap,
              reason: '$token + inverse');
        }
        expect(snapshot(CubeState.solved(n)), solved);
      });
    }

    test('sexy move has order 6 on 3x3', () {
      final once = MoveNotation.parseSequence("R U R' U'", 3);
      final cube = CubeState.solved(3).applyAll([for (var i = 0; i < 6; i++) ...once]);
      expect(cube.isSolved, isTrue);
      expect(CubeState.solved(3).applyAll(once).isSolved, isFalse);
    });

    test('slice and wide moves decompose into face moves', () {
      expect(snapshot(run(3, 'M')), snapshot(run(3, "x' L' R")));
      expect(snapshot(run(4, 'Rw')), snapshot(run(4, 'R 2R')));
      expect(snapshot(run(6, '3Rw')), snapshot(run(6, 'R 2R 3R')));
      expect(snapshot(run(5, 'r')), snapshot(run(5, 'R 2R')));
    });

    test('whole-cube rotations keep a solved cube solved', () {
      for (final n in sizes) {
        expect(run(n, "x y' z2").isSolved, isTrue);
      }
    });
  });

  group('scrambles', () {
    for (final n in sizes) {
      test('${n}x$n: 100 random scrambles are undone by their inverse', () {
        final rng = Random(1000 + n);
        for (var i = 0; i < 100; i++) {
          final scramble = CubeState.randomScramble(n, random: rng);
          final scrambled = CubeState.solved(n).applyAll(scramble);
          expect(scrambled.isSolved, isFalse);
          final restored = scrambled.applyAll(
            [for (final m in scramble.reversed) m.inverse],
          );
          expect(restored.isSolved, isTrue);
        }
      });
    }

    test('never turns the same axis twice in a row', () {
      final rng = Random(7);
      for (final n in sizes) {
        final scramble = CubeState.randomScramble(n, random: rng);
        for (var i = 1; i < scramble.length; i++) {
          expect(scramble[i].axis, isNot(scramble[i - 1].axis));
        }
      }
    });
  });

  test('cubie ids are stable across moves', () {
    final cube = run(4, "R U Rw' 2F");
    expect(cube.cubies.map((c) => c.id).toSet(), hasLength(64));
  });

  test('rejects moves that do not fit the cube', () {
    final move = MoveNotation.parse('3R', 6);
    expect(() => CubeState.solved(3).apply(move), throwsArgumentError);
  });
}
