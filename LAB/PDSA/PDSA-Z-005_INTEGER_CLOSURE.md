# PDSA-Z-005 — Stage-One Integer Closure

**CycleID:** `PDSA-Z-005`  
**Status:** **CLOSED — ZA-21 ACCEPT**  
**Date:** 2026-08-18

## PLAN

Decide whether the Stage-One BOMA integer package may be accepted after `Z-J-002` has integrated ZA-01 through ZA-20.

This is an acceptance/Act decision, not a new theorem-production cycle.

## Inputs

```text
BOMA-Z-ACCEPT-001 v1.1
Z-J-001 PASS
Z-DP-001 RESOLVED
Z-ARITH-J-001 PASS
Z-ARITH-BLOCK-003 V5 PASS
Z-ORD-J-001 PASS
Z-ORD-BLOCK-001 V5 PASS
PDSA-Z-004 ZA-01..20 audit PASS
Z-J-002 PASS
```

## STUDY

### Mathematical package

The selected signed carrier has:

```text
explicit equality/normal form
zero / one
faithful N embedding
negation
commutative additive group
commutative multiplication
distributivity
natural-difference generation
total order
N-order extension
ordered-arithmetic compatibility
```

### Representation robustness

A non-selected difference-pair route remains active and independently certifies the carrier identity, arithmetic semantics, and order semantics.

Thus acceptance does not rest on a single representation history.

### Verification

Required machine-relevant claims have pinned Lean 4.32.1 evidence across five successful route/law runs.

### Commitment transparency

The integer stage introduces a fresh signed representation and explicit pair relation/normalization choices but does not require:

```text
built-in Int
quotient carrier formation
Classical
choice
sorry
new axioms
```

### Characterization scope

The project deliberately does not overstate a group-completion universal property. The accepted Stage-One characterization is the exact certificate documented in ZA-17.

## ACT — ZA-21

All prerequisites are satisfied.

Therefore:

```text
ZA-21 = ACCEPT
```

and the project may classify the constructed ordered commutative-ring package as:

> **BOMA Stage-One Integer Domain — ACCEPTED**

relative to the inherited R-B formal regime and the declared representation choices.

## Canonical downstream export

Create/use:

`LAB/10_CONSTRUCTION/blocks/Z-BLOCK-002/UNIT.md`

as the accepted integer interface.

Earlier signed/pair/arithmetic/order Blocks and Junctions remain provenance and must not be flattened away.

## Immediate mandatory next action

Per `BOMA-Z-ACCEPT-001 v1.1`, acceptance of Z triggers the **post-Z reverse-engineering experiment before rational construction is promoted**:

```text
accepted Z
   ↓
reverse-engineer N_from_Z
   ↓
compare against accepted bottom-up N
   ↓
dedicated reconvergence/comparison Junction
```

This experiment is epistemic/architectural and may expose information loss even if the recovered carrier is isomorphic to `N_BOMA`.

The rational-number stage remains paused until this mandated comparison has at least produced its Study result and Act classification.
