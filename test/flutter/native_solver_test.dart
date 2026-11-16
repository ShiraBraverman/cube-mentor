// Integration tests of the Dart FFI layer against the real C++ core.
//
// They need the native library built by the C++ test project:
//   cmake -S test/cpp -B build/cpp && cmake --build build/cpp --config Release
// and are skipped (with a message) when it is missing.
import 'dart:math';

import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/cube/cube_state.dart';
import 'package:cube_mentor/core/cube/facelets.dart';
import 'package:cube_mentor/core/ffi/cubementor_bindings.dart';
import 'package:cube_mentor/core/ffi/native_cube_solver.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/core/vision/color_science.dart';
import 'package:cube_mentor/core/vision/scan_analyzer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CubeMentorBindings? bindings;
  String? missing;
  try {
    bindings = CubeMentorBindings.instance;
  } on ArgumentError catch (error) {
    missing = 'native library not built: $error';
  }

  SolvePlan solve(CubeState cube, SolveMethod method) => SolvePlan.fromJson(
    bindings!.solveJson(cube.size, method.code, cube.toFacelets()),
  );

  /// Replays [plan] in Dart, checking every step's recorded state against the
  /// Dart model so both geometries are proven identical.
  void expectSolves(CubeState start, SolvePlan plan) {
    var cube = start;
    for (final step in plan.steps) {
      expect(step.cubeState, cube.toFacelets(), reason: step.moveNotation);
      for (final position in step.highlightedCubies) {
        expect(cube.cubieIdAt(position), isNotNull);
      }
      cube = cube.apply(MoveNotation.parse(step.moveNotation, cube.size));
    }
    expect(cube.isSolved, isTrue);
  }

  CubeState scrambled(int size, Random random) =>
      CubeState.solved(size)
          .applyAll(CubeState.randomScramble(size, random: random));

  test('reports its version', () {
    expect(bindings!.version, '1.1.0');
    expect(bindings.prepare(3), isTrue);
    expect(bindings.prepare(4), isTrue);
    expect(bindings.prepare(7), isFalse);
  }, skip: missing);

  test('2x2 optimal solutions from Dart scrambles', () {
    final random = Random(3);
    for (var i = 0; i < 50; i++) {
      final cube = scrambled(2, random);
      final plan = solve(cube, SolveMethod.fast);
      expect(plan.method, 'optimal2x2');
      expect(plan.steps.length, lessThanOrEqualTo(11));
      expectSolves(cube, plan);
    }
  }, skip: missing);

  test('3x3 Kociemba solutions from Dart scrambles', () {
    final random = Random(4);
    for (var i = 0; i < 50; i++) {
      final cube = scrambled(3, random);
      final plan = solve(cube, SolveMethod.fast);
      expect(plan.method, 'kociemba');
      expect(plan.steps.length, lessThanOrEqualTo(30));
      expect(plan.steps.first.phaseName, 'kociembaPhase1');
      expectSolves(cube, plan);
    }
  }, skip: missing);

  test('3x3 layer-by-layer solutions carry full metadata', () {
    final random = Random(5);
    for (var i = 0; i < 50; i++) {
      final cube = scrambled(3, random);
      final plan = solve(cube, SolveMethod.layerByLayer);
      expect(plan.method, 'lbl');
      expectSolves(cube, plan);
      final phases = plan.steps.map((s) => s.phaseName).toSet();
      expect(phases, containsAll(['lblCross', 'lblCorners', 'lblMiddle']));
      // White starts on top in the app's color scheme, so the solution
      // begins by turning the cube over.
      expect(plan.steps.first.moveNotation, 'x2');
      final cross = plan.steps.firstWhere((s) => s.phaseName == 'lblCross');
      expect(cross.pieceColors, startsWith('W'));
      expect(cross.highlightedCubies, hasLength(1));
      // Round-trips through the AI Coach JSON shape.
      expect(SolveStep.fromJson(cross.toJson()).toJson(), cross.toJson());
    }
  }, skip: missing);

  test('handles rotated cubes and slice moves', () {
    final cube = CubeState.solved(3)
        .applyAll(MoveNotation.parseSequence("M E S x y' R U2 F' z", 3));
    expectSolves(cube, solve(cube, SolveMethod.fast));
    expectSolves(cube, solve(cube, SolveMethod.layerByLayer));
    final two = CubeState.solved(2)
        .applyAll(MoveNotation.parseSequence("x R U' y F2 z' R", 2));
    expectSolves(two, solve(two, SolveMethod.fast));
  }, skip: missing);

  test('solved cubes give empty plans and bad input is rejected', () {
    expect(solve(CubeState.solved(3), SolveMethod.fast).steps, isEmpty);
    expect(solve(CubeState.solved(2), SolveMethod.fast).steps, isEmpty);
    expect(
      () => SolvePlan.fromJson(bindings!.solveJson(3, 1, 'WWW')),
      throwsA(isA<SolveException>().having((e) => e.code, 'code', 'badLength')),
    );
    // Two swapped stickers of one edge: a flipped edge.
    final f = CubeState.solved(3).toFacelets().split('');
    final upBack = f[1];
    f[1] = f[46];
    f[46] = upBack;
    expect(
      () => SolvePlan.fromJson(bindings!.solveJson(3, 1, f.join())),
      throwsA(isA<SolveException>().having((e) => e.code, 'code', 'flip')),
    );
  }, skip: missing);

  test('NativeCubeSolver solves on a background isolate', () async {
    final solver = NativeCubeSolver();
    await solver.prepare(3);
    final cube = scrambled(3, Random(6));
    final plan = await solver.solve(cube, SolveMethod.layerByLayer);
    expectSolves(cube, plan);
    expect(
      () => solver.solve(CubeState.solved(7), SolveMethod.fast),
      throwsA(isA<SolveException>()),
    );
  }, skip: missing);

  test('4x4-6x6 reduction solutions replay in Dart with metadata', () {
    final random = Random(44);
    for (final size in [4, 5, 6]) {
      for (final method in SolveMethod.values) {
        final cube = scrambled(size, random);
        final plan = solve(cube, method);
        expect(
          plan.method,
          method == SolveMethod.fast ? 'reduction' : 'reductionLbl',
        );
        expectSolves(cube, plan);
        final phases = plan.steps.map((s) => s.phaseName).toSet();
        expect(phases, containsAll(['reductionCenters', 'reductionEdges']));
        for (final step in plan.steps) {
          expect(step.explanationKey, isNotEmpty);
        }
      }
    }
  }, skip: missing);

  test('NativeCubeSolver solves a 4x4 on a background isolate', () async {
    final solver = NativeCubeSolver();
    expect(solver.supports(6, SolveMethod.layerByLayer), isTrue);
    await solver.prepare(4);
    final cube = scrambled(4, Random(8));
    expectSolves(cube, await solver.solve(cube, SolveMethod.fast));
  }, skip: missing);

  test('scrambles are seeded and valid for every size', () {
    for (final size in [2, 3, 4, 5, 6]) {
      final a = bindings!.scramble(size, 20261116);
      expect(a, bindings.scramble(size, 20261116));
      expect(a, isNot(bindings.scramble(size, 20261117)));
      final cube = CubeState.solved(size)
          .applyAll(MoveNotation.parseSequence(a, size));
      expect(cube.isSolved, isFalse);
      if (size <= 3) expectSolves(cube, solve(cube, SolveMethod.fast));
    }
    expect(bindings!.scramble(9, 1), isEmpty);
  }, skip: missing);

  test('scan pipeline: classifies warm-lit stickers and flags bad ones', () {
    final analyzer = NativeScanAnalyzer();
    final random = Random(12);
    for (final size in [2, 3, 4]) {
      final facelets = scrambled(size, random).toFacelets();
      // Warm light: blue channel down, a little noise.
      final samples = [
        for (final letter in facelets.split(''))
          () {
            final c = kReferenceStickerRgb[stickerColorOf(letter)!]!;
            int jitter(int v) => (v + random.nextInt(9) - 4).clamp(0, 255);
            return (
              r: jitter(c.r),
              g: jitter((c.g * 0.9).round()),
              b: jitter((c.b * 0.7).round()),
            );
          }(),
      ];
      final analysis = analyzer.classify(size, samples);
      expect(analysis.isValid, isTrue, reason: '${size}x$size');
      expect(analysis.facelets, facelets);
      expect(analysis.confidence, hasLength(facelets.length));

      // One sticker changed by hand: the validator points at it.
      final broken = facelets.replaceRange(
        size * size,
        size * size + 1,
        facelets[size * size] == 'W' ? 'Y' : 'W',
      );
      final confidence = List<double>.filled(facelets.length, 0.9)
        ..[size * size] = 0.05;
      final check = analyzer.validate(size, broken, confidence: confidence);
      expect(check.issue, ScanIssue.badColors);
      expect(check.invalid.first, size * size);
    }
  }, skip: missing);
}
