# R-B N-Core Formalization Boundary — Correction 001

**Document ID:** `BOMA-RB-FORMAL-CORR-001`  
**Date:** 2026-08-18  
**Status:** **ACTIVE — ADDITIVE CORRECTION / CLARIFICATION**  
**Applies to:** `BOMA-RB-FORMAL-001`  
**Decision:** `N-DP-002`  
**Evidence:** `PDSA-N-007-V5-FAILURE-001`

## Purpose

Correct two under-specified formal interfaces exposed by the first pinned Lean V5 run while preserving the original boundary document as historical provenance.

This correction does not alter the selected R-B carrier idea and does not introduce a new pre-numerical theorem.

## C1 — Eliminator motive sort

Where the base contract schematically states:

```text
P : N_BOMA → Type
```

for dependent elimination, the active Stage-One interpretation is refined to:

```text
P : N_BOMA → Sort u
```

so the single declared eliminator interface includes both:

```text
Prop-valued induction
Type-valued dependent elimination
```

The proposition-valued induction theorem is therefore not obtained by silently coercing `Prop` to an unrelated Type-valued motive.

## C2 — Unary-algebra universe policy

The active generic unary-algebra interface is same-universe:

```text
A : UnaryAlgebra.{u}
B : UnaryAlgebra.{u}
Hom A B
PointwiseInitial A := ∀ B : UnaryAlgebra.{u}, ...
```

The fresh BOMA carrier is represented by:

```text
bomaAlg : UnaryAlgebra.{0}
```

Therefore the **canonical Stage-One pointwise-initiality claim for `bomaAlg` is Type-0 scoped**.

This scope is sufficient for the current Stage-One route and is now explicit rather than backend-inferred.

## C3 — Recursion scope remains broader

The correction does not unnecessarily restrict the ordinary recursor:

```text
fold : X → (X → X) → N_BOMA → X
```

which remains polymorphic for `X : Type u`.

Thus:

```text
recursion target scope          = Type-u polymorphic
bomaAlg initiality target scope = UnaryAlgebra.{0}
standardness comparison         = same-universe polymorphic
```

These are distinct claims and must not be collapsed.

## C4 — Heterogeneous cross-universe initiality

A stronger interface allowing source and target unary algebras in different universes is **not currently required**.

It remains a future branch/strengthening option rather than a hidden assumption or an implicitly rejected idea.

## C5 — Epistemic classification

```text
Sort-polymorphic eliminator       FORMALIZATION-DEPENDENT INTERFACE
same-universe initiality          METHODOLOGICAL / FORMALIZATION CHOICE
Type-0 bomaAlg initiality scope   SELECTED STAGE-ONE SCOPE
fold polymorphism                 DERIVED/IMPLEMENTED FORMAL CAPABILITY
```

## C6 — Why this correction exists

The first V5 run failed before the correction with:

```text
Type mismatch between a Type-valued custom eliminator and Prop-valued induction
unresolved/inconsistent universe levels in PointwiseInitial and standardness proofs
```

This demonstrates a BOMA principle:

> verification failures may expose missing architectural distinctions even when the intended mathematics remains viable.

## Authority

For the corrected clauses above, this document plus `N-DP-002` governs the active Stage-One R-B route. The original boundary document remains provenance and must not be silently rewritten to erase the failed formulation.
