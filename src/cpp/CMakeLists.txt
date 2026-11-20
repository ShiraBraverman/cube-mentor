# CubeMentor native core.
#
# Builds:
#   cubementor_core  static library with the cube model, solvers and vision
#   cubementor       shared library exposing the extern "C" API (Dart FFI)
#
# Used by Android (android/app/build.gradle.kts, externalNativeBuild),
# Windows desktop (windows/CMakeLists.txt) and the C++ tests (test/cpp).
cmake_minimum_required(VERSION 3.18)
project(cubementor_native LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(cubementor_core STATIC
  core/geometry.cpp
  core/notation.cpp
  core/cubie.cpp
  solver/solver_2x2.cpp
  solver/kociemba.cpp
  solver/lbl.cpp
  solver/reduction.cpp
  solver/scramble.cpp
  solver/solver.cpp
  vision/color.cpp
  vision/kmeans.cpp
  vision/validator.cpp
  vision/scanner.cpp
)
target_include_directories(cubementor_core PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
set_target_properties(cubementor_core PROPERTIES POSITION_INDEPENDENT_CODE ON)

# The solvers build lookup tables and run deep searches: keep them optimized
# even in debug app builds.
if(MSVC)
  # /O2 cannot be combined with the default /RTC1 of debug configurations.
  string(REPLACE "/RTC1" "" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
  target_compile_options(cubementor_core PRIVATE /W4 /EHsc "$<$<CONFIG:Debug>:/O2;/Ob2>")
else()
  target_compile_options(cubementor_core PRIVATE -Wall -Wextra -O2)
endif()

add_library(cubementor SHARED ffi_bridge.cpp)
target_link_libraries(cubementor PRIVATE cubementor_core)
target_compile_definitions(cubementor PRIVATE CUBEMENTOR_SHARED)
set_target_properties(cubementor PROPERTIES CXX_VISIBILITY_PRESET hidden)

if(ANDROID)
  # Smaller binaries and 16 KB page alignment for Android 15+ devices with
  # 16 KB memory pages (Google Play requirement). NDK r27+ with
  # ANDROID_SUPPORT_FLEXIBLE_PAGE_SIZES=ON (set in android/app/build.gradle.kts)
  # aligns by default; the explicit flags keep older NDKs compliant too.
  target_link_options(cubementor PRIVATE
    -Wl,--gc-sections
    -Wl,-z,max-page-size=16384
    -Wl,-z,common-page-size=16384)
endif()
