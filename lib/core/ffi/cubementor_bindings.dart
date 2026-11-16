import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

typedef _PrepareNative = Int32 Function(Int32 size);
typedef _PrepareDart = int Function(int size);
typedef _SolveNative = Int32 Function(
  Int32 size,
  Int32 method,
  Pointer<Utf8> facelets,
  Pointer<Utf8> out,
  Int32 capacity,
);
typedef _SolveDart = int Function(
  int size,
  int method,
  Pointer<Utf8> facelets,
  Pointer<Utf8> out,
  int capacity,
);
typedef _VersionNative = Pointer<Utf8> Function();

/// Low-level bindings to the C API in `src/cpp/ffi_bridge.h`.
///
/// Calls are synchronous; run them off the UI isolate (see
/// `NativeCubeSolver`).
class CubeMentorBindings {
  CubeMentorBindings(DynamicLibrary library)
    : _prepare = library.lookupFunction<_PrepareNative, _PrepareDart>(
        'cm_prepare',
      ),
      _solve = library.lookupFunction<_SolveNative, _SolveDart>('cm_solve'),
      _version = library.lookupFunction<_VersionNative, _VersionNative>(
        'cm_version',
      );

  final _PrepareDart _prepare;
  final _SolveDart _solve;
  final Pointer<Utf8> Function() _version;

  /// Environment variable that overrides the library location.
  static const String pathVariable = 'CUBEMENTOR_NATIVE_LIB';

  static CubeMentorBindings? _instance;

  /// Bindings for this isolate, opening the library on first use. Throws an
  /// [ArgumentError] when the library cannot be found.
  static CubeMentorBindings get instance =>
      _instance ??= CubeMentorBindings(openLibrary());

  /// Opens the native library: bundled with the app on Android and Windows,
  /// or the CMake test build (`build/cpp`) when running `flutter test`.
  static DynamicLibrary openLibrary() {
    final candidates = <String>[
      ?Platform.environment[pathVariable],
      if (Platform.isAndroid || Platform.isLinux) 'libcubementor.so',
      if (Platform.isWindows) ...[
        'cubementor.dll',
        'build/cpp/native/Release/cubementor.dll',
        'build/cpp/native/Debug/cubementor.dll',
      ],
      if (Platform.isMacOS || Platform.isIOS) 'libcubementor.dylib',
      if (Platform.isLinux || Platform.isMacOS) ...[
        'build/cpp/native/libcubementor.so',
        'build/cpp/native/libcubementor.dylib',
      ],
    ];
    Object? lastError;
    for (final path in candidates) {
      try {
        return DynamicLibrary.open(path);
      } on ArgumentError catch (error) {
        lastError = error;
      }
    }
    throw ArgumentError('CubeMentor native library not found: $lastError');
  }

  String get version => _version().toDartString();

  /// Builds the lookup tables for [size]. Returns false if unsupported.
  bool prepare(int size) => _prepare(size) == 0;

  /// Runs `cm_solve` and returns its JSON result.
  String solveJson(int size, int method, String facelets) {
    final input = facelets.toNativeUtf8();
    var capacity = 64 * 1024;
    try {
      while (true) {
        final out = malloc<Uint8>(capacity);
        try {
          final length = _solve(size, method, input, out.cast(), capacity);
          if (length < capacity) return out.cast<Utf8>().toDartString();
          capacity = length + 1;
        } finally {
          malloc.free(out);
        }
      }
    } finally {
      malloc.free(input);
    }
  }
}
