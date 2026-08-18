# PDSA-N-007 — V5 Formal Verification Gate

**CycleID:** `PDSA-N-007`  
**Track:** Natural Numbers / R-B Formal Verification  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — CLAIM-LEVEL V5 EVIDENCE GATE**

## Inputs

```text
canonical N-Core DAG
N-RB-CAND-001
BOMA-N-ACCEPT-001 v1.0
BOMA-RB-FORMAL-001 v1.0
PDSA-N-004 local obligations
PDSA-N-005 TCT bridge
PDSA-N-006 characterization / standardness
PDSA-N-008 topology decomposition
PDSA-N-009 no-confusion reconvergence
N-RB-CAND-001 preservation & commitment ledger
```

Preferred producer payload:

`LAB/payloads/lean/NCore/NCoreRB001.lean`

Claim-level ownership manifest:

`LAB/20_FORMALIZATION/N_CORE/V5_THEOREM_OWNERSHIP.md`

Current claim-level workflow:

`.github/workflows/boma-ncore-rb-004.yml`

The earlier `boma-ncore-rb-003.yml` remains provenance of the monolithic verification stage.

---

# PLAN

## Research question

Do the formal claims owned by the canonical N-Bricks/Blocks/Junctions elaborate and check under the repository-pinned Lean environment without requiring undeclared commitments?

## Verification granularity rule

```text
backend file PASS ≠ whole Block PASS by default
Block PASS          ≠ Junction PASS by default
Junction PASS       ≠ N-Core ACCEPTED
```

V5 evidence is assigned through `V5_THEOREM_OWNERSHIP.md`.

## Required checked units

```text
N-BLOCK-001 formal unary kernel interfaces
N-BLOCK-002 internal no-confusion
N-BLOCK-003 induction/generatedness
N-BLOCK-004 recursion/pointwise initiality
N-BLOCK-005 TCT bridge
N-BLOCK-006 pointwise standardness
N-J-001 Route B independent constructional transfer
N-J-001 convergence interface
```

## Toolchain requirement

Use the repository-pinned toolchain from `lean-toolchain` through the reproducible repository environment.

## Failure handling

Every checker failure is Study evidence and is attributed to the smallest affected unit when possible:

```text
SYNTAX / ELABORATION
UNIVERSE / TYPE-SCOPE
MISSING IMPORT / BUILD CONFIG
INVALID PROOF
UNDECLARED FORMAL PRINCIPLE
WORKFLOW / ENVIRONMENT
```

A failure in one parallel branch does not automatically invalidate unrelated branches.

---

# DO

## D1 — Unified producer

`NCoreRB001.lean` remains the preferred consolidated producer payload.

## D2 — Claim-level wrappers

Created:

```text
Verify_N_BLOCK_001.lean
Verify_N_BLOCK_002.lean
Verify_N_BLOCK_003.lean
Verify_N_BLOCK_004.lean
Verify_N_BLOCK_005.lean
Verify_N_BLOCK_006.lean
Verify_N_J_001_RouteB.lean
Verify_N_J_001.lean
```

## D3 — Claims made explicit

Two previously implicit verification obligations now have named witnesses:

```text
N-BR-007 generatedness/no-junk
  → Generated / all_generated

N-BR-017 history ↔ constructor ancestry
  → reify (s n) = extU (reify n)
```

These are backend verification witnesses only; they do not redefine the canonical object layer.

## D4 — N-J-001 Route B

The constructional Route B is encoded without invoking the internal Route-A theorem names `s_ne_z` or `s_injective`.

The route uses selected TCT representation, bridge reflection, coverage/reconstruction, and base/extension realization.

`Verify_N_J_001.lean` checks that Route A and Route B export the same formal no-confusion interface.

## D5 — CI workflow

Created `.github/workflows/boma-ncore-rb-004.yml` with separate checker steps for the producer, each Block wrapper, Route B, and the Junction wrapper.

Primary experiment record:

`LAB/PDSA/experiments/PDSA-N-007-CLAIM-LEVEL-V5-001.md`

---

# STUDY

## S1 — Evidence observability limitation

The connected GitHub interface currently returns no commit-status entries for the workflow-triggering commit, and its available commit-workflow-run action exposes pull-request-triggered runs only. Direct workflow-page retrieval is not supported by the connector route available in this session.

Therefore:

```text
no visible status ≠ PASS
no visible status ≠ FAIL
```

No V5 promotion is made without an observed checker result.

## S2 — Architectural improvement already obtained

Even before checker observation, the V5 preparation improved traceability:

- theorem ownership is claim-level;
- generatedness is no longer implicit;
- history/ancestry correspondence has an explicit backend witness;
- N-J-001 Route-B independence is machine-testable;
- CI failure can be localized to a DAG branch rather than a monolithic file.

---

# ACT

Current action:

```text
KEEP V5 = PENDING OBSERVED CHECKER EVIDENCE
KEEP N-J-001 = CONDITIONAL PASS
KEEP N-J-002 = BLOCKED
KEEP NAC-15 = NOT ELIGIBLE
```

In parallel, prepare the N-J-002 NAC-01..NAC-14 integration matrix without promoting the Junction.

Arithmetic remains blocked.
