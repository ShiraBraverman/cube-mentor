import 'package:flutter/gestures.dart';

/// A pan that claims the pointer after half the usual touch slop, so it wins
/// over an enclosing vertical scroll view: a finger on a preview cube turns
/// the cube instead of scrolling the page.
class EagerPanGestureRecognizer extends PanGestureRecognizer {
  EagerPanGestureRecognizer({super.debugOwner});

  @override
  bool hasSufficientGlobalDistanceToAccept(
    PointerDeviceKind pointerDeviceKind,
    double? deviceTouchSlop,
  ) =>
      globalDistanceMoved.abs() >
      computeHitSlop(pointerDeviceKind, gestureSettings) / 2;
}
