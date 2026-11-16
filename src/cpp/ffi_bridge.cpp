// extern "C" entry points of the native core.
#include "ffi_bridge.h"

#include <cstring>
#include <exception>
#include <string>

#include "solver/solver.hpp"

extern "C" {

CM_API const char* cm_version(void) { return "1.0.0"; }

CM_API int32_t cm_prepare(int32_t size) {
  if (size != 2 && size != 3) return -1;
  try {
    cm::prepareSolvers(size);
  } catch (const std::exception&) {
    return -1;
  }
  return 0;
}

CM_API int32_t cm_solve(int32_t size, int32_t method, const char* facelets, char* out,
                        int32_t capacity) {
  std::string json;
  try {
    if (facelets == nullptr) {
      json = R"({"ok":false,"error":"badLength"})";
    } else {
      const cm::SolveResult result =
          cm::solveCube(size, static_cast<cm::SolveMethod>(method), std::string(facelets));
      json = cm::toJson(result);
    }
  } catch (const std::exception&) {
    json = R"({"ok":false,"error":"internal"})";
  }
  const int32_t length = static_cast<int32_t>(json.size());
  if (out != nullptr && length < capacity) std::memcpy(out, json.c_str(), json.size() + 1);
  return length;
}

}  // extern "C"
