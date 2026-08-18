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

Current evidence-producing workflow:

`.github/workflows/boma-ncore-rb-005-evidence.yml`

Automated evidence sink:

`LAB/20_FORMALIZATION/N_CORE/evidence/V5_CLAIM_LEVEL_LATEST.md`

Earlier workflows `boma-ncore-rb-003.yml` and `boma-ncore-rb-004.yml` remain provenance of the monolithic and first claim-level verification stages.

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

## D5 — First claim-level workflow

`.github/workflows/boma-ncore-rb-004.yml` checks each claim-owning unit separately, but the connected session could not observe its push-triggered Actions result directly.

## D6 — Repository-resident evidence production

To remove dependence on the Actions UI, `.github/workflows/boma-ncore-rb-005-evidence.yml` was added.

It:

1. runs the producer and each claim-level verification step independently;
2. uses `continue-on-error` so all branch outcomes can be recorded in one run;
3. writes a repository evidence record containing the triggering SHA, pinned toolchain, and each step outcome;
4. pushes only the evidence record back to `main`;
5. then fails the workflow unless every required verification step succeeded.

The evidence file is:

`LAB/20_FORMALIZATION/N_CORE/evidence/V5_CLAIM_LEVEL_LATEST.md`

This workflow has **contents-write permission only to produce evidence**. It does not modify canonical mathematical statuses, Registry, Junction status, or NAC decisions.

Primary experiment record:

`LAB/PDSA/experiments/PDSA-N-007-CLAIM-LEVEL-V5-001.md`

---

# STUDY

## S1 — Evidence observability limitation

The connected GitHub interface returns no commit-status entries for the earlier workflow-triggering commit, and its commit-workflow-run action exposes pull-request-triggered runs only. Direct workflow-page retrieval is unsupported in this session.

Therefore:

```text
no visible status ≠ PASS
no visible status ≠ FAIL
```

## S2 — Architectural response to observability

Rather than weaken the evidence requirement, the project now makes CI emit a repository-resident evidence record. This turns verification output into an auditable BOMA artifact independent of UI observability.

The evidence artifact is still epistemically subordinate to the canonical unit graph: it records checker outcomes; humans/PDSA decide status promotion after Study.

## S3 — Architectural improvement already obtained

Even before checker evidence is observed, V5 preparation improved traceability:

- theorem ownership is claim-level;
- generatedness is no longer implicit;
- history/ancestry correspondence has an explicit backend witness;
- N-J-001 Route-B independence is machine-testable;
- CI failure can be localized to a DAG branch rather than a monolithic file;
- CI evidence can now persist in the repository rather than only in an external UI.

---

# ACT

Current action until the evidence sink records an actual run:

```text
KEEP V5 = PENDING OBSERVED CHECKER EVIDENCE
KEEP N-J-001 = CONDITIONAL PASS
KEEP N-J-002 = BLOCKED
KEEP NAC-15 = NOT ELIGIBLE
```

`PDSA-N-010` prepares the NAC-01..NAC-14 integration matrix in parallel without promoting `N-J-002`.

Arithmetic remains blocked.
