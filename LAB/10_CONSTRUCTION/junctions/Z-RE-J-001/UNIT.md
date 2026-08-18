# Z-RE-J-001 — Reverse N-from-Z / Bottom-Up N Comparison Junction

- **Operational Status:** **PASS / RESOLVED**
- **Epistemic Classification:** **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**
- **PDSA:** `PDSA-Z-RE-001`
- **Incoming reverse routes:** `Z-RE-BLOCK-001`, `Z-RE-BLOCK-002`
- **Reference route:** `N-BLOCK-007`, `N-ARITH-BLOCK-001`

## Question

Does the natural-number structure reconstructed after accepting Z reconverge with the original bottom-up BOMA natural-number construction, and if so, at what level?

## Reverse products established before comparison

From accepted Z alone:

```text
N_Cone(Z) := {x | 0 ≤ x}
coneZero
coneSucc(x) := x+1
coneAdd
coneMul
coneLE
ReachZ generated from 0 by +1
ReachZ(x) → 0 ≤ x
proposition-valued induction on ReachZ derivations
```

These passed the independent Z-only V5 gate `32170817620`.

## Comparison evidence

After the reverse candidates existed independently, the frozen bottom-up N was reintroduced only as a reference layer.

The comparison constructs:

```text
coneEncodeN : N_BOMA → N_Cone(Z)
coneDecodeN : N_Cone(Z) → N_BOMA
```

with exact round trips in the selected Stage-One signed representation and preservation of:

```text
zero
successor
addition
multiplication
order
```

Final comparison V5:

```text
workflow run:    32171528363
verified commit: 335ad9780d8cfee45624998f59dae264c1057be1
Lean:            4.32.1
result:          PASS
```

Evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_TO_N_COMPARISON_V5_LATEST.md`

## Critical representation boundary

`coneDecodeN` is **representation-aware**: it inspects the selected `ZSigned` constructors and reads the retained `BOMANat` magnitude carried by `pos n`.

Therefore:

> exact cone↔`BOMANat` recovery is a valid result for the selected Stage-One representation, but it is not reclassified as an abstract theorem saying that any ordered-ring realization of integers exposes the original natural carrier in this form.

## Autonomous versus assisted recovery

### Z-only

```text
nonnegative cone construction
successor/add/mul/order closure
ReachZ generatedness predicate
ReachZ → nonnegative
Prop-valued ReachZ induction
```

### representation/comparison-assisted

```text
nonnegative → ReachZ in the current proof
exact cone↔BOMANat decoding
successor no-confusion/injectivity on the cone in the current proof
Type-valued recursor transport
```

### not recovered from Z extensional interface

```text
pre-numerical TCT provenance
N-DP-001 / N-DP-002 decision history
original N initiality derivation history
independent no-confusion branch history
N-Arithmetic branch/reconvergence history
PDSA human–AI learning graph
```

## Junction result

```text
EXTENSIONAL CARRIER COMPARISON      PASS
0 / SUCCESSOR                      PASS
ADDITION / MULTIPLICATION          PASS
ORDER                              PASS
EXACT ROUND TRIPS                  PASS IN SELECTED SIGNED REPRESENTATION
Z-ONLY REVERSE CORE                PASS
ORIGINAL FOUNDATIONAL PROVENANCE   DOES NOT RECONVERGE
ABSTRACT-Z-ONLY TYPE RECURSION     NOT ESTABLISHED
ORIGINAL INITIALITY PROVENANCE     NOT RECOVERED
```

Hence:

> **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**

## Exported learning

This Junction establishes a reusable BOMA principle:

```text
extensional mathematical equivalence
        does not imply
constructional equivalence
        and does not imply
epistemic/provenance equivalence.
```

Passing through a richer accepted domain can preserve enough structure to reconstruct a prior interface while compressing or hiding the derivational history that produced it.

## Detailed comparison

`LAB/PDSA/experiments/PDSA-Z-RE-001_BOTTOM_UP_VS_REVERSE_COMPARISON.md`

## Act effect

The mandatory post-Z reverse experiment is now scientifically classified and closed. The project may proceed to the rational-number stage without erasing this divergence result.
