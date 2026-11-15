import 'dart:math';

import 'package:cube_mentor/features/solver_3d/model/cube_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        cubeSessionProvider.overrideWith2(
          (size) => CubeSessionController(size, random: Random(42)),
        ),
      ],
    );
  });

  tearDown(() => container.dispose());

  CubeSessionController ctrl(int size) =>
      container.read(cubeSessionProvider(size).notifier);
  CubeSession read(int size) => container.read(cubeSessionProvider(size));

  void drain(int size) {
    while (read(size).queue.isNotEmpty) {
      ctrl(size).commitHead();
    }
  }

  test('turns are queued, then committed one at a time', () {
    final sub = container.listen(cubeSessionProvider(3), (_, _) {});
    ctrl(3)
      ..turnNotation('R')
      ..turnNotation('U');
    expect(read(3).queue, hasLength(2));
    expect(read(3).cube.isSolved, isTrue);
    ctrl(3).commitHead();
    expect(read(3).queue, hasLength(1));
    expect(read(3).cube.isSolved, isFalse);
    drain(3);
    expect(read(3).log.map((m) => m.notation), ['R', 'U']);
    sub.close();
  });

  test('undo reverts the last move and clears it from the log', () {
    final sub = container.listen(cubeSessionProvider(4), (_, _) {});
    ctrl(4)
      ..turnNotation('Rw')
      ..undo();
    drain(4);
    expect(read(4).cube.isSolved, isTrue);
    expect(read(4).log, isEmpty);
    sub.close();
  });

  test('scramble builds a playback that solves the cube', () {
    final sub = container.listen(cubeSessionProvider(3), (_, _) {});
    ctrl(3).scramble();
    expect(read(3).queue.every((q) => q.fast), isTrue);
    drain(3);
    expect(read(3).cube.isSolved, isFalse);
    expect(read(3).playback, hasLength(20));

    ctrl(3).play();
    expect(read(3).isPlaying, isTrue);
    drain(3);
    expect(read(3).playbackIndex, 20);
    expect(read(3).isPlaying, isFalse);
    expect(read(3).cube.isSolved, isTrue);
    sub.close();
  });

  test('step back and forward through the playback', () {
    final sub = container.listen(cubeSessionProvider(2), (_, _) {});
    ctrl(2).scramble();
    drain(2);
    final scrambled = read(2).cube;
    ctrl(2)
      ..stepForward()
      ..stepForward()
      ..stepBack()
      ..stepBack();
    drain(2);
    expect(read(2).playbackIndex, 0);
    expect(read(2).cube.isSolved, scrambled.isSolved);
    expect(read(2).log, hasLength(11));
    sub.close();
  });

  test('a manual turn discards the playback', () {
    final sub = container.listen(cubeSessionProvider(3), (_, _) {});
    ctrl(3).scramble();
    ctrl(3).turnNotation('F');
    expect(read(3).hasPlayback, isFalse);
    sub.close();
  });

  test('reset returns to solved and bumps the epoch', () {
    final sub = container.listen(cubeSessionProvider(5), (_, _) {});
    ctrl(5)
      ..setSpeed(2)
      ..scramble()
      ..reset();
    expect(read(5).cube.isSolved, isTrue);
    expect(read(5).queue, isEmpty);
    expect(read(5).epoch, 1);
    expect(read(5).speed, 2);
    sub.close();
  });

  test('durations scale with speed and half turns', () {
    final sub = container.listen(cubeSessionProvider(3), (_, _) {});
    ctrl(3)
      ..turnNotation('R')
      ..turnNotation('R2');
    final s = read(3);
    expect(s.durationFor(s.queue[0]), CubeSession.baseQuarterTurn);
    expect(s.durationFor(s.queue[1]), CubeSession.baseQuarterTurn * 1.5);
    ctrl(3).setSpeed(2);
    expect(read(3).durationFor(s.queue[0]), CubeSession.baseQuarterTurn * 0.5);
    sub.close();
  });
}
