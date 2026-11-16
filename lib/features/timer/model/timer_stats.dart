import 'solve_record.dart';

/// Result of an average: a time, or DNF.
typedef AverageResult = ({bool dnf, int millis});

/// WCA-style average of the last [count] solves ("ao5", "ao12", "ao100"):
/// the best and worst 5% (at least one each) are dropped and the rest are
/// averaged. A DNF counts as the worst time; more DNFs than can be dropped
/// make the whole average a DNF. Null with fewer than [count] solves.
AverageResult? averageOf(List<SolveRecord> solves, int count) {
  if (solves.length < count) return null;
  final trim = count < 20 ? 1 : (count * 0.05).ceil();
  final last = solves.sublist(solves.length - count);
  final dnfs = last.where((s) => s.result == null).length;
  if (dnfs > trim) return (dnf: true, millis: 0);
  final times = [for (final s in last) s.result ?? 1 << 50]..sort();
  final kept = times.sublist(trim, count - trim);
  final sum = kept.fold<int>(0, (a, b) => a + b);
  return (dnf: false, millis: (sum / kept.length).round());
}

/// Best single result (personal best), or null without a finished solve.
int? bestSingle(List<SolveRecord> solves) {
  int? best;
  for (final s in solves) {
    final r = s.result;
    if (r != null && (best == null || r < best)) best = r;
  }
  return best;
}

/// Best rolling average of [count] over the whole history.
AverageResult? bestAverage(List<SolveRecord> solves, int count) {
  AverageResult? best;
  for (var end = count; end <= solves.length; end++) {
    final avg = averageOf(solves.sublist(0, end), count);
    if (avg == null || avg.dnf) continue;
    if (best == null || avg.millis < best.millis) best = avg;
  }
  return best;
}

/// "12.34", "1:05.20" (minutes when needed), or "DNF".
String formatTime(int? millis) {
  if (millis == null) return 'DNF';
  final centis = (millis / 10).floor();
  final seconds = centis ~/ 100;
  final hundredths = (centis % 100).toString().padLeft(2, '0');
  if (seconds < 60) return '$seconds.$hundredths';
  final minutes = seconds ~/ 60;
  final rest = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$rest.$hundredths';
}

/// Formats a solve, e.g. "14.20+" for a +2 penalty.
String formatSolve(SolveRecord solve) => switch (solve.penalty) {
  Penalty.dnf => 'DNF',
  Penalty.plus2 => '${formatTime(solve.result)}+',
  Penalty.none => formatTime(solve.result),
};

String formatAverage(AverageResult? avg) =>
    avg == null ? '–' : (avg.dnf ? 'DNF' : formatTime(avg.millis));
