# R-COMP-BLOCK-001 — Formal Dedekind Least-Upper-Bound Completeness

- **Operational Status:** **ACTIVE — V5 PASS**
- **Epistemic Status:** **DERIVED / FORMAL-CARRIER COMPLETENESS**
- **Carrier:** `RBOMA := Quotient cutSetoid`
- **Depends on:** selected Dedekind representation, quotient identity, cut inclusion order
- **Does not depend on:** real addition, multiplication, inverse, or total-order Classical witness

## Statement

For every predicate family:

```text
F : RBOMA → Prop
```

if:

```text
∃x, F x
```

and there exists an explicit upper bound:

```text
U : RBOMA
RUpperBound F U
```

then there exists:

```text
s : RBOMA
```

such that:

```text
∀x, F x → rLE x s
```

and for every common upper bound `B`:

```text
RUpperBound F B → rLE s B.
```

This is the Stage-One Dedekind least-upper-bound contract required by `RA-11`.

## Construction

The proof does not choose one representative cut for each family element.

Instead the raw supremum cut is defined by witness membership:

```text
q ∈ sup(F)
iff
∃x : RBOMA,
  F x ∧
  ∃A : LowerCut,
    x = rmk A ∧ A.lower q.
```

An explicit representative of one upper bound is used only to prove properness of the resulting lower cut.

## Why this matters

This makes the selected Dedekind completion structurally transparent:

```text
family of formal reals
      ↓
witness-based union of all representative lower regions
      ↓
valid LowerCut
      ↓
formal quotient class
      ↓
least upper bound
```

No global representative selector is introduced merely to define the supremum.

## Verification

Payload:

`LAB/payloads/lean/RStage/RDedekindCompleteness.lean`

Canonical evidence file:

`LAB/20_FORMALIZATION/R_STAGE/evidence/R_DEDEKIND_COMPLETENESS_V5_LATEST.md`

V5:

```text
run 32182056311
verified commit fca34d837b5c78b540ac2ff50648a8cc531018a5
Lean 4.32.1
result PASS
```

The verified target is the formal `RBOMA` least-upper-bound theorem, not only the earlier raw `LowerCut` union probe.

### Provenance metadata correction — 2026-08-20

An earlier version of this Block listed run `32182124371`. Audit against the canonical evidence file established that the correct formal-completeness run is `32182056311`. This correction changes provenance metadata only; the theorem statement and PASS result are unchanged.

## Logical scope

The theorem does not consume `R-LOGIC-BR-001` / disjunctive cut comparability.

Thus the current provenance separates:

```text
Dedekind LUB completeness  DERIVED without the totality Classical witness
real total-order disjunction  DERIVED through R-LOGIC-BR-001 / Classical.em provenance
```

This distinction must be preserved in downstream logical-dependency audits.

## Acceptance effect

`RA-11` is now **PASS at the selected Dedekind completeness contract**.

This unit alone does not discharge:

```text
RA-04..09 field operations / ordered-field laws
RA-12 rational density in RBOMA
RA-13 Archimedean characterization
RA-19 final commitment ledger
RA-21 integration
RA-22 acceptance
```
