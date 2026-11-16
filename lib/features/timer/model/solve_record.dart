import 'package:flutter/foundation.dart';

/// WCA penalties.
enum Penalty { none, plus2, dnf }

/// One timed solve.
@immutable
class SolveRecord {
  const SolveRecord({
    required this.millis,
    required this.scramble,
    required this.at,
    this.penalty = Penalty.none,
  });

  factory SolveRecord.fromJson(Map<String, dynamic> json) => SolveRecord(
    millis: json['ms'] as int,
    scramble: (json['s'] as String?) ?? '',
    at: DateTime.fromMillisecondsSinceEpoch(json['at'] as int),
    penalty: Penalty.values[(json['p'] as int?) ?? 0],
  );

  /// Raw time on the clock.
  final int millis;
  final String scramble;
  final DateTime at;
  final Penalty penalty;

  /// Time that counts (with +2), or null for a DNF.
  int? get result => switch (penalty) {
    Penalty.none => millis,
    Penalty.plus2 => millis + 2000,
    Penalty.dnf => null,
  };

  SolveRecord withPenalty(Penalty value) =>
      SolveRecord(millis: millis, scramble: scramble, at: at, penalty: value);

  Map<String, Object> toJson() => {
    'ms': millis,
    's': scramble,
    'at': at.millisecondsSinceEpoch,
    'p': penalty.index,
  };
}
