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

/// Whether the home carousel currently shows the "coming soon" cube, which
/// has no solver to open.
class ShowingMystery extends Notifier<bool> {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

final showingMysteryProvider = NotifierProvider<ShowingMystery, bool>(
  ShowingMystery.new,
);
