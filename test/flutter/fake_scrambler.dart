import 'package:cube_mentor/core/scramble/scrambler.dart';

/// Deterministic in-memory [Scrambler] (native calls run on isolates, which
/// fake-async widget tests cannot drive). Unseeded calls cycle through
/// [random] (separately per cube size); seeded calls (the daily challenge)
/// return [daily].
class FakeScrambler implements Scrambler {
  static const List<String> random = [
    "R U R' U' F2",
    "U2 F R2 D' B",
    "L' D2 R F' U",
  ];
  static const String daily = "F R U' R' U' R U R' F' D2 B";

  final List<({int size, int? seed})> calls = [];

  @override
  Future<String> scramble(int size, {int? seed}) async {
    calls.add((size: size, seed: seed));
    if (seed != null) return daily;
    final count = calls.where((c) => c.seed == null && c.size == size).length;
    return random[(count - 1) % random.length];
  }
}
