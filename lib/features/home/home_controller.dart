import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Cube sizes supported by the app.
const List<int> kCubeSizes = [2, 3, 4, 5, 6];

/// The cube size currently selected on the home screen.
class SelectedCubeSize extends Notifier<int> {
  @override
  int build() => 3;

  void select(int size) {
    assert(kCubeSizes.contains(size));
    state = size;
  }
}

final selectedCubeSizeProvider = NotifierProvider<SelectedCubeSize, int>(
  SelectedCubeSize.new,
);
