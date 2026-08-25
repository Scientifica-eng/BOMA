#!/usr/bin/env python3
"""Fail-closed consistency audit for BOMA autonomous research-program governance."""

from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
POLICY_PATH = ROOT / "LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_POLICY_001.json"
STATE_PATH = ROOT / "LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_STATE_001.json"
AGENTS_PATH = ROOT / "AGENTS.md"
STATUS_PATH = ROOT / "LAB/PDSA/STATUS.md"

errors: list[str] = []


def require(condition: bool, message: str) -> None:
    if not condition:
        errors.append(message)


def load_json(path: Path) -> dict:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception as exc:  # fail closed
        errors.append(f"cannot parse {path.relative_to(ROOT)}: {exc}")
        return {}


policy = load_json(POLICY_PATH)
state = load_json(STATE_PATH)
agents = AGENTS_PATH.read_text(encoding="utf-8")
status = STATUS_PATH.read_text(encoding="utf-8")

require(policy.get("schema") == "BOMA-AUTONOMOUS-RESEARCH-PROGRAM-POLICY-001", "unexpected policy schema")
require(policy.get("default_posture") == "FAIL_CLOSED", "policy must remain FAIL_CLOSED")
require(policy.get("program_authorization_required") is True, "program authorization must be required")
require(policy.get("active_program_created_by_policy") is False, "policy must not activate a program implicitly")

allowed_states = policy.get("allowed_states")
require(isinstance(allowed_states, list) and len(allowed_states) > 0, "allowed_states must be a non-empty list")
current_state = state.get("state")
require(current_state in (allowed_states or []), f"state {current_state!r} is not policy-authorized")
require(state.get("safety", {}).get("fail_closed") is True, "state must preserve fail_closed=true")
require(state.get("safety", {}).get("ambiguous_authority_means") == "OWNER_REQUIRED", "ambiguous authority must mean OWNER_REQUIRED")
require(state.get("safety", {}).get("main_research_writes_allowed") is False, "autonomous research writes to main must remain false")
require(isinstance(state.get("routine_merge_authorized"), bool), "routine_merge_authorized must be boolean")

if current_state == "NO_ACTIVE_PROGRAM":
    require(state.get("active_program_id") is None, "NO_ACTIVE_PROGRAM cannot have active_program_id")
    require(state.get("owner_authorization_record") is None, "NO_ACTIVE_PROGRAM cannot have owner authorization")
    require(state.get("program_baseline_main_sha") is None, "NO_ACTIVE_PROGRAM cannot have baseline sha")
    require(state.get("authorized_experiment_queue") == [], "NO_ACTIVE_PROGRAM queue must be empty")
    require(state.get("active_experiment") is None, "NO_ACTIVE_PROGRAM cannot have active experiment")
    require(state.get("routine_merge_authorized") is False, "NO_ACTIVE_PROGRAM cannot authorize routine merge")
else:
    require(bool(state.get("active_program_id")), "active state requires active_program_id")
    require(bool(state.get("owner_authorization_record")), "active state requires owner authorization record")
    baseline = state.get("program_baseline_main_sha")
    require(isinstance(baseline, str) and re.fullmatch(r"[0-9a-f]{40}", baseline) is not None, "active state requires exact 40-hex baseline main sha")
    queue = state.get("authorized_experiment_queue")
    require(isinstance(queue, list) and len(queue) > 0, "active state requires non-empty authorized experiment queue")

if current_state == "OWNER_REQUIRED":
    require(bool(state.get("owner_required_reason")), "OWNER_REQUIRED must record a reason")

required_agent_markers = [
    "AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md",
    "AUTONOMOUS_RESEARCH_PROGRAM_POLICY_001.json",
    "AUTONOMOUS_RESEARCH_PROGRAM_STATE_001.json",
    "AMBIGUOUS AUTHORITY",
    "OWNER_REQUIRED",
]
for marker in required_agent_markers:
    require(marker in agents, f"AGENTS.md missing autonomous-governance marker: {marker}")

required_status_markers = [
    "AUTONOMOUS RESEARCH PROGRAM",
    "NO_ACTIVE_PROGRAM",
    "ST2-EXP-004",
]
for marker in required_status_markers:
    require(marker in status, f"STATUS.md missing autonomous-governance marker: {marker}")

if errors:
    print("BOMA autonomous research-program audit: FAIL")
    for error in errors:
        print(f"- {error}")
    raise SystemExit(1)

print("BOMA autonomous research-program audit: PASS")
print(f"state={current_state}")
print(f"active_program_id={state.get('active_program_id')}")
print(f"queue_size={len(state.get('authorized_experiment_queue', []))}")
print(f"routine_merge_authorized={state.get('routine_merge_authorized')}")
