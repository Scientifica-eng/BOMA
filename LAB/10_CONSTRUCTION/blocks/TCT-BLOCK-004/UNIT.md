# TCT-BLOCK-004 — Structural Iteration History

## Canonical Identity

- **Unit ID:** `TCT-BLOCK-004`
- **Type:** Block
- **Layer:** `L1 — explicit constructed structure`
- **Operational Status:** **ACTIVE**
- **Epistemic Status:** **DERIVED STRUCTURAL VIEW / VERIFIED INVARIANT**
- **PDSA origin:** `PDSA-TCT-006`

## Purpose

Expose the repeated canonical-decomposition structure of a selected TCT configuration as a pre-numerical iteration history without assigning any numerical depth, length, stage number, or cardinality.

This Block is the repaired successor to the historical numerical-depth attempt audited by CAL-001.

## Inputs

```text
TCT-BLOCK-003  Canonical Decomposition Guarantee
TCT-BLOCK-002  selected normal-form grammar
TCT-BR-010     structural equivalence ≈
CAL-001        hidden-numerical learning
```

## Selected normal-form environment

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

## Decomposition History Witness

For an explicitly supplied selected normal-form presentation, construct a meta-finite history witness recursively.

### H-EMPTY

```text
Hist(ε)
  ≔ halt-at-ε
```

### H-UNIT

```text
Hist(U)
  ≔ recovery-record[ U ↘ ε ]
     followed by halt-at-ε
```

### H-STEP

For `P ∈ NF+`:

```text
Hist(P ⊙ U)
  ≔ recovery-record[ P ⊙ U ↘ P ]
     followed by Hist(P)
```

The recovery arrow is licensed by `TCT-BLOCK-003`.

The history witness is a meta-structural proof/construction record. It is not a natural number and is not a member of a completed global history carrier.

## Structural history correspondence

Use a meta-level correspondence relation `~H` on history witnesses.

The base halts correspond:

```text
halt-at-ε ~H halt-at-ε.
```

Recovery nodes correspond when:

```text
current configurations are ≈
recovered predecessors are ≈
terminal roles correspond
history tails correspond.
```

## Derived results

### SI-1 — History witness existence

Every explicitly supplied selected NF presentation admits a history witness by structural recursion over its meta-finite presentation.

### SI-2 — Determinism on selected NF

The selected normal form and canonical decomposition judgment determine the history witness presentation.

### SI-3 — Invariance under structural equivalence

If selected presentations satisfy:

```text
A ≈ B
```

then:

```text
Hist(A) ~H Hist(B).
```

This follows from the BR-010 ordered-trace result and/or recursively from the TCT-BLOCK-003 canonical decomposition guarantee.

### SI-4 — Extension-tail structure

For selected `A`:

```text
Hist(A ⊙ U)
```

is formed by prefixing the canonical recovery record:

```text
A ⊙ U ↘ A
```

before `Hist(A)`.

Thus the predecessor history is the canonical tail of the extended history.

This is the current pre-numerical iteration relation.

### SI-5 — Reconstruction

A valid current-path history witness reconstructs the selected NF presentation recursively.

Therefore the history is a derived structural view of the existing construction, not a newly introduced magnitude.

## Reusable certified contribution

The Block exports:

> **Structural Iteration History Guarantee:** Every explicitly supplied selected TCT normal-form presentation has a canonical decomposition-history witness; equivalent selected presentations have corresponding histories; and extension by terminal `U` prefixes the predecessor history by the canonical recovery record.

This contribution carries constructional ancestry without assigning a number to it.

## Anti-circularity rule

The following are not statements of this Block:

```text
depth(A) = n
depth(A ⊙ U) = depth(A) + 1
|A| = n
there are n U blocks
history length is a natural number inside TCT
```

Such statements require a later numerical realization/interpretation.

## Why the Block is not named “Construction Depth”

The earlier registry/planning label `Construction Depth` risked suggesting that a numerical magnitude had already been constructed.

Following CAL-001 and PDSA-TCT-006, the canonical role is:

```text
Structural Iteration History
```

`construction depth` may later become an interpretation after a numerical domain has been legitimately introduced.

## What this Block does not construct

```text
a completed set/type of all histories
a quotient of history shapes
a numerical depth function
successor on a formal carrier
natural numbers
addition
order
object-level induction over ℕ
```

## Verification evidence

Primary:

`LAB/PDSA/experiments/PDSA-TCT-006-STRUCTURAL-HISTORY-001.md`

Inherited:

```text
LAB/PDSA/experiments/PDSA-TCT-005-CANONICAL-DECOMPOSITION-VERIFICATION-001.md
LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md
```

## Acceptance result

```text
HISTORY WITNESS EXISTS                   PASS
HISTORY DETERMINISTIC ON SELECTED NF     PASS
HISTORY CORRESPONDENCE UNDER ≈           PASS
EXTENSION-TAIL RELATION                  PASS
RECONSTRUCTION TO SELECTED NF            PASS
NO NUMERICAL DEPTH                       PASS
NO GLOBAL HISTORY CARRIER                PASS
```

**Block result: ACTIVE / VERIFIED on the current path.**

## Current downstream state

```text
TCT-BLOCK-005  ACTIVE — Successor-Like Extension Structure
```

The next project boundary is the PDSA-TCT-008 whole-path calibration before formal natural-number realization.

## Sensitivity

Reopen/retest if any of the following changes:

```text
TCT-BLOCK-003 decomposition guarantee
TCT-BR-010 equivalence
selected normal-form grammar
terminal U role
recovery interpretation
kernel generator set
history correspondence definition
```

Alternative branches may have non-linear histories, multiple terminal roles, or non-cancellative equivalence and must receive separate analysis.

## Provenance

Historical warning/source learning:

```text
CAL-001
B-013 / B-014 depth attempt
structural-equivalence repair
```

Current construction:

```text
PDSA-TCT-004
PDSA-TCT-005
PDSA-TCT-006
```

Downstream state synchronized during `PDSA-TCT-008`.
