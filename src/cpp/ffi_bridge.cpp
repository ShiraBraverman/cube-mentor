// extern "C" entry points of the native core.
#include "ffi_bridge.h"

#include <cstring>
#include <exception>
#include <string>
#include <vector>

#include "solver/scramble.hpp"
#include "solver/solver.hpp"
#include "vision/scanner.hpp"

namespace {

/// Copies [json] into [out] when it fits; returns its length either way.
int32_t writeJson(const std::string& json, char* out, int32_t capacity) {
  const int32_t length = static_cast<int32_t>(json.size());
  if (out != nullptr && length < capacity) std::memcpy(out, json.c_str(), json.size() + 1);
  return length;
}

bool scannableSize(int32_t size) { return size >= 2 && size <= 7; }

}  // namespace

extern "C" {

CM_API const char* cm_version(void) { return "1.3.0"; }

CM_API int32_t cm_prepare(int32_t size) {
  if (size < 2 || size > 6) return -1;
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
  return writeJson(json, out, capacity);
}

CM_API int32_t cm_scramble(int32_t size, uint32_t seed, char* out, int32_t capacity) {
  std::string text;
  try {
    text = cm::makeScramble(size, seed);
  } catch (const std::exception&) {
    text.clear();
  }
  return writeJson(text, out, capacity);
}

CM_API int32_t cm_scan_classify(int32_t size, const uint8_t* rgb, char* out, int32_t capacity) {
  std::string json;
  try {
    if (rgb == nullptr || !scannableSize(size)) {
      json = R"({"ok":false,"error":"badLength"})";
    } else {
      std::vector<cm::vision::Rgb> stickers(static_cast<size_t>(6 * size * size));
      for (size_t i = 0; i < stickers.size(); ++i) {
        stickers[i] = {rgb[3 * i], rgb[3 * i + 1], rgb[3 * i + 2]};
      }
      json = cm::vision::toJson(cm::vision::classifyScan(size, stickers));
    }
  } catch (const std::exception&) {
    json = R"({"ok":false,"error":"internal"})";
  }
  return writeJson(json, out, capacity);
}

CM_API int32_t cm_scan_validate(int32_t size, const char* facelets, const float* confidence,
                                char* out, int32_t capacity) {
  std::string json;
  try {
    if (facelets == nullptr || !scannableSize(size)) {
      json = R"({"ok":false,"error":"badLength"})";
    } else {
      const std::string f(facelets);
      std::vector<double> conf;
      if (confidence != nullptr && static_cast<int>(f.size()) == 6 * size * size) {
        conf.assign(confidence, confidence + f.size());
      }
      json = cm::vision::toJson(cm::vision::validateCube(size, f, conf));
    }
  } catch (const std::exception&) {
    json = R"({"ok":false,"error":"internal"})";
  }
  return writeJson(json, out, capacity);
}

}  // extern "C"
