import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Current time; tests override it to drive timers and dates.
final clockProvider = Provider<DateTime Function()>((ref) => DateTime.now);
