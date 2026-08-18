# PDSA-N-005 — Faithful TCT → R-B Formal Bridge

**CycleID:** `PDSA-N-005`  
**Track:** Natural Numbers / R-B Formalization  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — PLAN / DO**

## Inputs

```text
TCT-BLOCK-002  Generated Selected Configurations
TCT-BR-010     structural equivalence ≈
TCT-BLOCK-003  canonical decomposition
TCT-BLOCK-004  structural iteration history
TCT-BLOCK-005  successor-like extension
N-RB-CAND-001  fresh formal candidate
BOMA-RB-FORMAL-001 v1.0
```

## PLAN

Discharge NAC-06 / RB-B01..RB-B05 without pretending that the pre-numerical TCT layer already has a completed formal source carrier.

### Required separation

```text
CANONICAL TCT
constructional selected presentations and certified contributions

BACKEND TCTNF
post-boundary datatype that REPRESENTS selected normal-form syntax

N_BOMA
fresh formal N-Core candidate
```

No identification among these three layers is allowed without an explicit representation/faithfulness theorem.

## Backend representation

Use a post-boundary representation of the selected grammar:

```text
TCTNFPlus ::= unit | ext(TCTNFPlus)
TCTNF     ::= eps | nonempty(TCTNFPlus)
```

This represents exactly the canonical selected grammar:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

## Bridge targets

```text
B1  eps ↦ z
B2  extU(A) ↦ s(realize(A))
B3  selected-presentation identity/equivalence preservation
B4  formal identity reflection / faithfulness
B5  representation inverse / reconstruction
B6  structural-history ↔ constructor-ancestry correspondence
```

## Critical theorem imported from pre-numerical Study

`PDSA-TCT-004` established, on selected normal forms:

```text
A ≈ B  ⇔  A ≡ B
```

within the current BR-010 selected-NF scope.

Therefore backend equality on `TCTNF` may represent `≈` **only in this restricted verified scope**.

This is a theorem-backed representation decision, not a redefinition of BR-010.

## DO

Backend candidates created:

```text
LAB/payloads/lean/NCore/TCTBridgeSelected.lean
LAB/payloads/lean/NCore/NCoreRB001.lean
```

The unified payload is preferred for formal checking because it removes module/import ambiguity from the initial exploratory bridge payloads.

## STUDY

Dedicated bridge audit follows.

## ACT

PENDING.

No N-Core acceptance follows merely from creating the backend representation.
