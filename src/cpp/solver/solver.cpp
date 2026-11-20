#include "solver.hpp"

#include <cstdio>

#include "../core/notation.hpp"
#include "kociemba.hpp"
#include "lbl.hpp"
#include "reduction.hpp"
#include "solver_2x2.hpp"

namespace cm {

namespace {

// Fills in missing before-move states by replaying the moves.
bool fillStates(SolveResult& result, int size, const std::string& facelets) {
  FaceletCube cube;
  cube.n = size;
  cube.f = facelets;
  for (SolveStep& step : result.steps) {
    if (step.cubeState.empty()) step.cubeState = cube.f;
    LayerMove move;
    if (!parseMove(step.move, size, move)) return false;
    cube.apply(move);
  }
  return cube.isSolved();
}

void appendEscaped(std::string& out, const std::string& text) {
  out += '"';
  for (char c : text) {
    if (c == '"' || c == '\\') {
      out += '\\';
      out += c;
    } else if (static_cast<unsigned char>(c) < 0x20) {
      char buffer[8];
      std::snprintf(buffer, sizeof(buffer), "\\u%04x", c);
      out += buffer;
    } else {
      out += c;
    }
  }
  out += '"';
}

}  // namespace

void prepareSolvers(int size) {
  if (size == 2) Solver2x2::prepare();
  if (size == 3) KociembaSolver::prepare();
  if (size >= 4 && size <= 6) ReductionSolver::prepare(size);
}

SolveResult solveCube(int size, SolveMethod method, const std::string& facelets) {
  SolveResult result;
  if (static_cast<int>(facelets.size()) != 6 * size * size) {
    result.error = "badLength";
    return result;
  }
  if (size == 2) {
    result = method == SolveMethod::kLayerByLayer ? Solver2x2::solveGuided(facelets)
                                                  : Solver2x2::solve(facelets);
  } else if (size == 3) {
    result = method == SolveMethod::kLayerByLayer ? LblSolver::solve(facelets)
                                                  : KociembaSolver::solve(facelets);
  } else if (size >= 4 && size <= 6) {
    result = ReductionSolver::solve(size, facelets, method);
  } else {
    result.error = "unsupported";
    return result;
  }
  if (result.ok && !fillStates(result, size, facelets)) {
    result.ok = false;
    result.error = "internal";
    result.steps.clear();
  }
  return result;
}

std::string toJson(const SolveResult& result) {
  std::string out;
  out.reserve(256 + result.steps.size() * 128);
  if (!result.ok) {
    out += "{\"ok\":false,\"error\":";
    appendEscaped(out, result.error.empty() ? "unknown" : result.error);
    out += '}';
    return out;
  }
  char millis[32];
  std::snprintf(millis, sizeof(millis), "%.3f", result.millis);
  out += "{\"ok\":true,\"method\":";
  appendEscaped(out, result.method);
  out += ",\"millis\":";
  out += millis;
  out += ",\"steps\":[";
  for (size_t i = 0; i < result.steps.size(); ++i) {
    const SolveStep& s = result.steps[i];
    if (i > 0) out += ',';
    out += "{\"move\":";
    appendEscaped(out, s.move);
    out += ",\"state\":";
    appendEscaped(out, s.cubeState);
    out += ",\"phase\":";
    appendEscaped(out, s.phase);
    out += ",\"explanation\":";
    appendEscaped(out, s.explanation);
    out += ",\"piece\":";
    appendEscaped(out, s.piece);
    if (s.crown > 0) {
      out += ",\"crown\":" + std::to_string(s.crown) + ",\"subStep\":" + std::to_string(s.subStep);
    }
    out += ",\"highlight\":[";
    for (size_t h = 0; h < s.highlight.size(); ++h) {
      if (h > 0) out += ',';
      const Vec3& p = s.highlight[h];
      out += '[' + std::to_string(p.x) + ',' + std::to_string(p.y) + ',' + std::to_string(p.z) + ']';
    }
    out += "]}";
  }
  out += "]}";
  return out;
}

}  // namespace cm
