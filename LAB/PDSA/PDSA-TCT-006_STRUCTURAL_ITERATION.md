# PDSA-TCT-006 — Structural Iteration / Pre-Numerical Depth

**CycleID:** `PDSA-TCT-006`  
**Track:** TCT  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — PLAN / HISTORICAL LEARNING INTAKE**  
**Cycle type:** Constructional-invariant / anti-circularity cycle

## ParentCycles / LearningInputs

```text
PDSA-TCT-002  pre-numerical metatheory firewall
PDSA-TCT-004  ordered-trace invariant / terminal cancellation
PDSA-TCT-005  canonical decomposition guarantee
```

Mandatory historical learning inputs:

```text
CAL-001 hidden numerical commitments audit
CAL-001 closure
historical B-013 / B-014 numerical-depth attempt
historical replacement by structural equivalence of construction histories
```

Primary current input:

`TCT-BLOCK-003 — Canonical Decomposition`.

---

# PLAN

## ResearchQuestion

What structural invariant can be constructed from **repeated canonical decomposition** before any numerical interpretation of depth, length, stage, or number of steps is introduced?

The cycle must not begin by defining:

```text
depth(A) = n
|A|
number of U blocks
number of recovery steps
```

because this would reproduce the hidden-numerical failure mode identified by CAL-001.

## Historical warning inherited from CAL-001

The earlier path learned that terms such as:

```text
finite
exactly one
depth
stage
```

can carry numerical commitments when they are used as object-level structure before number has been constructed.

CAL-001 preferred:

```text
concrete construction history
        ↓
structural form of history
        ↓
constructional equivalence
```

instead of:

```text
history
  ↓
count steps
  ↓
numerical depth
```

This cycle adopts that learning as a hard constraint.

## Candidate object of study

### Decomposition History Witness

For an explicitly supplied selected normal-form presentation, construct a meta-finite recovery history using the canonical decomposition guarantee.

Use no numerical indices in the mathematical content.

Schematic history forms:

```text
H-EMPTY
halt at ε

H-UNIT
U  ↘  ε

H-STEP
A  ↘  P
followed by a history beginning at P
```

where each `↘` is licensed by the canonical decomposition judgment of TCT-BLOCK-003.

The history witness is initially meta-level proof/construction infrastructure.

## Candidate structural invariant

The first target is **history shape**, not numerical depth.

Two supplied configurations should have the same current-path structural iteration profile when their canonical recovery histories correspond step-by-step modulo `≈` and terminate in the same empty base role.

No quotient object of history shapes is assumed.

## Required theorem candidate

If:

```text
A ≈ B
```

then their canonical decomposition histories should correspond recursively:

```text
A ≈ B
  ↓ canonical decomposition
P ≈ Q
  ↓ canonical decomposition
...
  ↓
ε corresponds to ε
```

The theorem must be stated/proved through structural history witnesses, not through equality of natural-number-valued depths.

## Acceptance outcomes

```text
PASS — canonical structural history invariant constructed
REVISE — decomposition guarantee insufficient; add explicit history structure
FAIL — hidden numerical/global assumptions unavoidable under proposal
BRANCH — multiple materially different iteration notions appear
```

`TCT-BLOCK-004` remains RESERVED until this cycle produces and verifies a precise structural output.

---

# INITIAL DO — learning translation

## D1 — What the old depth attempt got wrong

The issue was not that a finite construction history cannot be discussed externally.

The issue was treating a numerical measure of that history as though it had already been constructed internally.

The repaired question is therefore:

> What information can the history itself carry before we map its shape to a number?

## D2 — Candidate separation

The cycle will distinguish:

```text
HISTORY WITNESS
an explicit meta-finite chain of canonical decomposition records

HISTORY EQUIVALENCE / CORRESPONDENCE
structural relation between such witnesses

NUMERICAL INTERPRETATION
future mapping of history structure into a formal number domain
```

Only the first two are currently in scope.

## D3 — Expected relation to future ℕ

A later stage may prove that these linear history shapes admit a characterization equivalent/isomorphic to a natural-number structure.

That future identification must not be used as the current construction recipe.

This preserves the CAL-001 rule:

```text
construct C first
analyze C independently
then test/realize C as ℕ
```

---

# Initial STUDY questions

1. Is a decomposition history merely meta-level evidence, or does some aspect need promotion to an object-level constructional structure?
2. What is the weakest equivalence/correspondence on histories compatible with BR-010?
3. Can history correspondence be proved recursively from TCT-BLOCK-003 without numerical counting?
4. Is termination at `ε` a meta-finite presentation fact only, or does the downstream theorem require an object-level closure principle?
5. Does calling the future Block “Construction Depth” create avoidable semantic drift, and should its canonical role be renamed “Structural Iteration Profile” until numerical interpretation exists?
6. Which information from the ordered trace proof is reusable, and which would circularly duplicate a future numerical interpretation?

---

# ACT

PENDING.

No `depth`, successor, or natural-number object is introduced by opening this cycle.
