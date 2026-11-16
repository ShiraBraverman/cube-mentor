# C++ unit tests for the native core.
#
#   cmake -S test/cpp -B build/cpp
#   cmake --build build/cpp --config Release
#   ctest --test-dir build/cpp -C Release --output-on-failure
cmake_minimum_required(VERSION 3.18)
project(cubementor_tests LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../src/cpp ${CMAKE_CURRENT_BINARY_DIR}/native)

add_executable(cubementor_tests
  test_main.cpp
  test_cube.cpp
  test_solvers.cpp
  test_vision.cpp
  test_reduction.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../../src/cpp/ffi_bridge.cpp
)
target_link_libraries(cubementor_tests PRIVATE cubementor_core)
if(MSVC)
  target_compile_options(cubementor_tests PRIVATE /EHsc)
endif()

enable_testing()
add_test(NAME cubementor_tests COMMAND cubementor_tests)
