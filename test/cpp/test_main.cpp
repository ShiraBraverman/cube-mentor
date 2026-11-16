#include <chrono>
#include <cstdio>
#include <cstring>

#include "test_framework.hpp"

int main(int argc, char** argv) {
  const char* filter = argc > 1 ? argv[1] : nullptr;
  int ran = 0;
  for (const auto& test : cmtest::registry()) {
    if (filter != nullptr && std::strstr(test.name, filter) == nullptr) continue;
    const int before = cmtest::failures();
    const auto start = std::chrono::steady_clock::now();
    std::printf("[ RUN  ] %s\n", test.name);
    test.body();
    const double ms =
        std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count();
    std::printf("[ %s ] %s (%.0f ms)\n", cmtest::failures() == before ? " OK " : "FAIL", test.name, ms);
    ++ran;
  }
  std::printf("\n%d tests, %d failed checks\n", ran, cmtest::failures());
  return cmtest::failures() == 0 ? 0 : 1;
}
