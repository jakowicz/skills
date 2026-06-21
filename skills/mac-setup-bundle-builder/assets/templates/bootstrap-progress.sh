#!/usr/bin/env bash
#
# Purpose: Shared live-progress logging helpers for long-running machine setup
# scripts. Scripts source this file to write current work, completed steps, and
# dependency-driven extra changes into the generated bundle's reports directory.
# Replace __BUNDLE_DIR__ with the generated bundle directory when copying this
# template into a user's setup bundle.

bootstrap_root() {
  cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd
}

BOOTSTRAP_ROOT="${BOOTSTRAP_ROOT:-$(bootstrap_root)}"
BOOTSTRAP_BUNDLE_DIR="${BOOTSTRAP_BUNDLE_DIR:-__BUNDLE_DIR__}"
BOOTSTRAP_REPORT_DIR="${BOOTSTRAP_REPORT_DIR:-$BOOTSTRAP_ROOT/$BOOTSTRAP_BUNDLE_DIR/reports}"
BOOTSTRAP_LIVE_LOG="${BOOTSTRAP_LIVE_LOG:-$BOOTSTRAP_REPORT_DIR/live-bootstrap-status.log}"
BOOTSTRAP_CHANGES_LOG="${BOOTSTRAP_CHANGES_LOG:-$BOOTSTRAP_REPORT_DIR/additional-changes.log}"

bootstrap_log_init() {
  mkdir -p "$BOOTSTRAP_REPORT_DIR"
  [ -f "$BOOTSTRAP_LIVE_LOG" ] || {
    printf '# Live Mac Bootstrap Status\n'
    printf '# Started: %s\n\n' "$(date)"
  } > "$BOOTSTRAP_LIVE_LOG"
}

bootstrap_log() {
  local status="$1"
  shift
  bootstrap_log_init
  printf '%s | %s | %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$status" "$*" | tee -a "$BOOTSTRAP_LIVE_LOG"
}

bootstrap_step() { bootstrap_log WORKING "$*"; }
bootstrap_done() { bootstrap_log DONE "$*"; }
bootstrap_warn() { bootstrap_log WARN "$*"; }
bootstrap_fail() { bootstrap_log FAILED "$*"; }

bootstrap_change() {
  bootstrap_log_init
  printf '%s | %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*" | tee -a "$BOOTSTRAP_CHANGES_LOG"
}
