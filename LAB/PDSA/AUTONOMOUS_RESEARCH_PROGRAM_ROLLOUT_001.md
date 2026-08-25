# AUTONOMOUS_RESEARCH_PROGRAM_ROLLOUT_001 — Governance Introduction Record

**Status:** `IN PROGRESS / GOVERNANCE-ONLY / NO RESEARCH ACTIVATED`  
**Date:** `2026-08-25`  
**Branch:** `governance/autonomous-research-program-20260825`

## Scope

Introduce program-level owner authorization and fail-closed autonomous sequential
experiment execution without changing accepted mathematics, starting an
experiment, or authorizing a research queue.

## Introduced controls

```text
AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md
AUTONOMOUS_RESEARCH_PROGRAM_POLICY_001.json
AUTONOMOUS_RESEARCH_PROGRAM_STATE_001.json
RESEARCH_PROGRAM_AUTHORIZATION_TEMPLATE_001.md
autonomous_research_program_audit.py
boma-autonomous-research-program-audit-001.yml
```

Initial machine state remains:

```text
NO_ACTIVE_PROGRAM
ST2-EXP-004 NOT ACTIVE
routine_merge_authorized = false
```

## Preserved implementation error — ERR-ARP-BOOTSTRAP-001

During tool-level branch setup, a temporary file
`LAB/PDSA/README.tmp` was accidentally created on `main` in commit
`b8a4c27cbbee336e334eaa1b1c5f42248b82b07b`.

It contained only `tmp` and was immediately removed from `main` by commit
`b837ac774b057d5811e3fe6b35ae43e2f4283e2b` before the governance branch was
created.

### Cause

A branch-existence probe incorrectly used a write action against `main` rather
than the dedicated branch-creation action.

### Correction

```text
remove accidental file from main
→ create governance branch using create_branch(base_ref=main)
→ perform all governance writes on that branch
```

### Preventive rule

Never probe branch existence with a content write. Branch setup must use branch
read/create primitives only. Before every repository write, explicitly verify
that the target branch argument is the intended non-main branch unless a main
write is itself explicitly authorized.

This error changes no mathematical or architectural content but is retained as
operational provenance because BOMA requires failures and prevention lessons to
remain visible.
