// Synthesizes the app's feedback sounds into tiny mono WAV files under
// assets/sounds/. Run from the project root after changing a recipe:
//
//   dart run tool/generate_feedback_sounds.dart
//
// Every sound is short, soft and free of sharp attacks: a few decaying sine
// partials (marimba / chime timbres) with a 2-4 ms fade-in so nothing clicks
// harshly, and peak levels well below full scale.

import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

const int kSampleRate = 22050;

/// One decaying sine partial.
class Partial {
  const Partial(
    this.freq,
    this.gain,
    this.decay, {
    this.delay = 0,
    this.glideTo,
  });

  /// Start frequency in Hz.
  final double freq;
  final double gain;

  /// Exponential decay time constant in seconds.
  final double decay;

  /// Onset in seconds from the start of the sound.
  final double delay;

  /// Optional end frequency (linear glide over the decay), for soft thuds.
  final double? glideTo;
}

Float64List render(
  List<Partial> partials, {
  required double seconds,
  double noise = 0,
  double noiseDecay = 0.004,
  double attack = 0.003,
  double peak = 0.5,
}) {
  final n = (seconds * kSampleRate).round();
  final out = Float64List(n);
  final rng = math.Random(7);
  for (final p in partials) {
    final start = (p.delay * kSampleRate).round();
    var phase = 0.0;
    for (var i = start; i < n; i++) {
      final t = (i - start) / kSampleRate;
      final glide = p.glideTo == null
          ? p.freq
          : p.freq + (p.glideTo! - p.freq) * math.min(1, t / (p.decay * 3));
      phase += 2 * math.pi * glide / kSampleRate;
      final env = math.exp(-t / p.decay) * math.min(1, t / attack);
      out[i] += p.gain * env * math.sin(phase);
    }
  }
  if (noise > 0) {
    // A short, low-passed noise tick gives turns their tactile "clack".
    var lp = 0.0;
    for (var i = 0; i < n; i++) {
      final t = i / kSampleRate;
      lp += 0.35 * ((rng.nextDouble() * 2 - 1) - lp);
      out[i] +=
          noise * lp * math.exp(-t / noiseDecay) * math.min(1, t / 0.0008);
    }
  }
  // Fade the tail to silence and normalize to [peak].
  final fade = (0.02 * kSampleRate).round();
  for (var i = 0; i < fade && i < n; i++) {
    out[n - 1 - i] *= i / fade;
  }
  var max = 0.0;
  for (final s in out) {
    max = math.max(max, s.abs());
  }
  if (max > 0) {
    for (var i = 0; i < n; i++) {
      out[i] = out[i] / max * peak;
    }
  }
  return out;
}

Uint8List wav(Float64List samples) {
  final data = ByteData(44 + samples.length * 2);
  void ascii(int offset, String s) {
    for (var i = 0; i < s.length; i++) {
      data.setUint8(offset + i, s.codeUnitAt(i));
    }
  }

  ascii(0, 'RIFF');
  data.setUint32(4, 36 + samples.length * 2, Endian.little);
  ascii(8, 'WAVE');
  ascii(12, 'fmt ');
  data.setUint32(16, 16, Endian.little);
  data.setUint16(20, 1, Endian.little); // PCM
  data.setUint16(22, 1, Endian.little); // mono
  data.setUint32(24, kSampleRate, Endian.little);
  data.setUint32(28, kSampleRate * 2, Endian.little);
  data.setUint16(32, 2, Endian.little);
  data.setUint16(34, 16, Endian.little);
  ascii(36, 'data');
  data.setUint32(40, samples.length * 2, Endian.little);
  for (var i = 0; i < samples.length; i++) {
    final v = (samples[i].clamp(-1.0, 1.0) * 32767).round();
    data.setInt16(44 + i * 2, v, Endian.little);
  }
  return data.buffer.asUint8List();
}

Map<String, Float64List> recipes() => {
  // Layer turn: a soft wood-marimba pop with a tiny mechanical clack.
  'turn': render(
    const [
      Partial(880, 1, 0.028),
      Partial(3520, 0.25, 0.008),
      Partial(440, 0.35, 0.02),
    ],
    seconds: 0.09,
    noise: 0.5,
    noiseDecay: 0.003,
    peak: 0.42,
  ),
  // Step complete / next move: a gentle marimba tick (E6).
  'step': render(
    const [
      Partial(1318.5, 1, 0.07),
      Partial(5274, 0.12, 0.015),
      Partial(2637, 0.18, 0.03),
    ],
    seconds: 0.22,
    peak: 0.38,
  ),
  // Wrong move: a very soft, low thud that glides down slightly.
  'wrong': render(
    const [
      Partial(180, 1, 0.06, glideTo: 120),
      Partial(360, 0.2, 0.03, glideTo: 240),
      Partial(170, 0.6, 0.05, delay: 0.09, glideTo: 115),
    ],
    seconds: 0.26,
    attack: 0.006,
    peak: 0.4,
  ),
  // Solved / lesson complete / new PB: warm ascending C-E-G chime with a
  // soft octave shimmer on each note.
  'success': render(
    const [
      Partial(523.25, 1, 0.35),
      Partial(1046.5, 0.22, 0.18),
      Partial(659.25, 0.95, 0.38, delay: 0.11),
      Partial(1318.5, 0.2, 0.18, delay: 0.11),
      Partial(783.99, 0.95, 0.55, delay: 0.22),
      Partial(1567.98, 0.22, 0.25, delay: 0.22),
      Partial(2093, 0.06, 0.3, delay: 0.22),
    ],
    seconds: 1.3,
    attack: 0.004,
    peak: 0.45,
  ),
  // Button taps / tab switches: a crisp, quiet micro-tick.
  'tap': render(
    const [Partial(2400, 1, 0.009), Partial(4800, 0.2, 0.004)],
    seconds: 0.045,
    attack: 0.0015,
    peak: 0.28,
  ),
};

void main() {
  final dir = Directory('assets/sounds')..createSync(recursive: true);
  recipes().forEach((name, samples) {
    final file = File('${dir.path}/$name.wav')..writeAsBytesSync(wav(samples));
    stdout.writeln('${file.path}: ${file.lengthSync()} bytes');
  });
}
