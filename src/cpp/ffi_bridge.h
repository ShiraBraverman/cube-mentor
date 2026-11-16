/* C API of the CubeMentor native core, consumed by Dart FFI
 * (lib/core/ffi/cubementor_bindings.dart). */
#ifndef CUBEMENTOR_FFI_BRIDGE_H_
#define CUBEMENTOR_FFI_BRIDGE_H_

#include <stdint.h>

#if defined(_WIN32) && defined(CUBEMENTOR_SHARED)
#define CM_API __declspec(dllexport)
#elif defined(CUBEMENTOR_SHARED)
#define CM_API __attribute__((visibility("default")))
#else
#define CM_API
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Solve methods. */
#define CM_METHOD_FAST 1           /* optimal 2x2 / Kociemba 3x3 */
#define CM_METHOD_LAYER_BY_LAYER 2 /* pedagogical 3x3 */

/* Native core version, e.g. "1.0.0". */
CM_API const char* cm_version(void);

/* Builds the lookup tables for a cube size ahead of the first solve.
 * Returns 0 on success, -1 for unsupported sizes. */
CM_API int32_t cm_prepare(int32_t size);

/* Solves a cube given as 6 * size^2 facelet colors in U R F D L B face
 * order (each face row-major as seen from outside, standard net layout).
 * Writes a NUL-terminated JSON result (see solver.hpp) into [out] and
 * returns its length. When the return value is >= capacity nothing useful
 * was written: call again with a buffer of at least return value + 1. */
CM_API int32_t cm_solve(int32_t size, int32_t method, const char* facelets, char* out,
                        int32_t capacity);

#ifdef __cplusplus
}
#endif

#endif /* CUBEMENTOR_FFI_BRIDGE_H_ */
