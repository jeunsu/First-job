#!/bin/bash
# SessionStart hook for Claude Code on the web.
# This repo has no build tool, dependency manager, tests or linters, so there is
# nothing to install. The JDK is preinstalled, so this hook verifies the toolchain
# and runs a non-blocking javac compile smoke-check of the Java sources.
set -uo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
cd "$PROJECT_DIR" || exit 1

if ! command -v javac >/dev/null 2>&1; then
  echo "ERROR: javac (JDK) not found on PATH; cannot build this Java project." >&2
  exit 1
fi
echo "Toolchain ready: $(javac -version 2>&1 | grep -v '^Picked up' | head -n1)"

mapfile -t SRC_FILES < <(find StudyJSP/src testProject/src -name '*.java' 2>/dev/null)
if [ "${#SRC_FILES[@]}" -gt 0 ]; then
  BUILD_DIR="$(mktemp -d)"
  LOG="$(mktemp)"
  if javac -d "$BUILD_DIR" "${SRC_FILES[@]}" >"$LOG" 2>&1; then
    echo "Build check: OK - ${#SRC_FILES[@]} Java files compiled."
  else
    echo "Build check: FAILED (not blocking session start):" >&2
    grep -v '^Picked up' "$LOG" >&2 || true
  fi
  rm -rf "$BUILD_DIR" "$LOG"
fi

exit 0
