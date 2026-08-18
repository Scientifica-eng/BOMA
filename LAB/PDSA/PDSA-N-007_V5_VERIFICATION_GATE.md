# PDSA-N-007 — V5 Formal Verification Gate

**CycleID:** `PDSA-N-007`  
**Track:** Natural Numbers / R-B Formal Verification  
**Date opened:** 2026-08-18  
**Status:** **CLOSED — PASS WITH SCOPE CORRECTION**

## Research question

Do the formal claims owned by the canonical N-Bricks/Blocks/Junctions elaborate and check under the repository-pinned Lean environment without requiring undeclared commitments?

## Final evidence

Successful claim-level run:

```text
workflow run:     32163771789
verified commit:  5fb03a48e243697f49f1cbde30be986d73f2ff68
pinned toolchain: leanprover/lean4:v4.32.1
job conclusion:   success
```

Repository evidence:

`LAB/20_FORMALIZATION/N_CORE/evidence/V5_CLAIM_LEVEL_LATEST.md`

Ownership manifest:

`LAB/20_FORMALIZATION/N_CORE/V5_THEOREM_OWNERSHIP.md`

The run passed:

```text
unified producer payload
N-BLOCK-001
N-BLOCK-002
N-BLOCK-003
N-BLOCK-004
N-BLOCK-005
N-BLOCK-006
N-J-001 independent Route B
N-J-001 convergence interface
```

## PLAN outcome

The verification-granularity invariant was preserved:

```text
backend file PASS ≠ whole project PASS
Block V5 PASS      ≠ N-J-002 PASS
N-J-001 PASS       ≠ NAC-15 closure
```

## DO history

The cycle created:

```text
NCoreRB001.lean
Verify_N_BLOCK_001.lean .. Verify_N_BLOCK_006.lean
Verify_N_J_001_RouteB.lean
Verify_N_J_001.lean
V5_THEOREM_OWNERSHIP.md
boma-ncore-rb-005-evidence.yml
```

It also made previously implicit verification claims explicit, especially:

```text
N-BR-007 generatedness/no-junk
N-BR-017 history ↔ constructor ancestry
N-BR-018 independent constructional no-confusion transfer
```

## STUDY — failure lineage

The successful result was preceded by scientifically useful failed runs.

Primary failure Study:

`LAB/PDSA/experiments/PDSA-N-007-V5-FAILURE-001.md`

The first run exposed:

```text
Type vs Prop eliminator-scope ambiguity
universe ambiguity in pointwise initiality/standardness
verification-wrapper module-root assumption
```

The second partial run established that the corrected producer and all six N-Blocks passed, isolating the remaining failure to a local Route-B proof tactic.

That proof was corrected without adding a new mathematical premise.

## STUDY — formalization scope learned

The cycle forced an explicit scope decision rather than leaving Lean inference authoritative.

Decision:

`N-DP-002 — Stage-One Eliminator and Universe Scope`

Correction:

`BOMA-RB-FORMAL-CORR-001`

Active scope:

```text
eliminator               Sort-polymorphic
fold                     Type-u target polymorphic
bomaAlg pointwise initiality  Type-0 unary-algebra scope
standardness comparison      same-universe polymorphic
```

This is a formalization-dependent Stage-One scope, not a cross-framework theorem.

## ACT

The V5 gate is closed with PASS for the claims mapped in `V5_THEOREM_OWNERSHIP.md`.

Consequences:

```text
N-BLOCK-001..006  machine-relevant mapped claims may record V5 PASS
N-J-001           eligible for and promoted to PASS / RESOLVED
N-J-002           remains blocked pending post-V5 integration audits
NAC-15            remains NOT YET DECIDED
N-Arithmetic       remains BLOCKED
```

Next mandatory work:

1. post-V5 NAC-13 preservation audit;
2. post-V5 NAC-14 commitment audit incorporating N-DP-002;
3. confirm N-J-002 compatibility / NAC-01..NAC-14 sufficiency;
4. only if N-J-002 passes, perform the separate NAC-15 closure decision.

## Learning output

1. Failed formal verification can improve the mathematical architecture by exposing hidden scope decisions.
2. Claim-level DAG verification prevents a local failure from falsely contaminating independent branches.
3. Verification evidence should persist in the repository, not only in an external CI UI.
4. A checker PASS is evidence for explicitly mapped claims under an explicit formal regime; it is never a substitute for architectural acceptance.
