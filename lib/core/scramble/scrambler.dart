import 'dart:isolate';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ffi/cubementor_bindings.dart';

/// Produces offline scrambles: random-state for 2x2 and 3x3 (a random
/// position, solved and inverted, like WCA scrambles) and random-move for
/// bigger cubes. The same seed always yields the same scramble, which makes
/// the daily challenge identical for everyone on a given day.
abstract interface class Scrambler {
  /// A space-separated scramble for a cube of [size].
  Future<String> scramble(int size, {int? seed});
}

/// [Scrambler] backed by the native core (`cm_scramble`), run on a
/// background isolate. Falls back to Dart random moves when the native
/// library is missing.
class NativeScrambler implements Scrambler {
  NativeScrambler({Random? random}) : _random = random ?? Random();

  final Random _random;

  @override
  Future<String> scramble(int size, {int? seed}) async {
    final s = seed ?? _random.nextInt(1 << 31);
    try {
      final text = await Isolate.run(
        () => CubeMentorBindings.instance.scramble(size, s),
      );
      if (text.isNotEmpty) return text;
    } on ArgumentError {
      // Missing library (e.g. a desktop build without it): Dart fallback.
    }
    return randomMoveScramble(size, Random(s));
  }
}

/// Random face and wide turns, never the same axis twice in a row.
String randomMoveScramble(int size, Random random) {
  const faces = ['U', 'D', 'R', 'L', 'F', 'B'];
  const suffixes = ['', "'", '2'];
  final length = switch (size) {
    2 => 11,
    3 => 20,
    4 => 40,
    5 => 60,
    _ => 80,
  };
  final tokens = <String>[];
  var lastAxis = -1;
  while (tokens.length < length) {
    final face = random.nextInt(6);
    if (face ~/ 2 == lastAxis) continue;
    lastAxis = face ~/ 2;
    final depth = size < 4 ? 1 : 1 + random.nextInt(size ~/ 2);
    final name = switch (depth) {
      1 => faces[face],
      2 => '${faces[face]}w',
      _ => '$depth${faces[face]}w',
    };
    tokens.add('$name${suffixes[random.nextInt(3)]}');
  }
  return tokens.join(' ');
}

final scramblerProvider = Provider<Scrambler>((ref) => NativeScrambler());
