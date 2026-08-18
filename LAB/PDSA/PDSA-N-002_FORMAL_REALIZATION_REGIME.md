# PDSA-N-002 — Formal Natural-Number Realization Regime Comparison

**CycleID:** `PDSA-N-002`  
**Track:** Natural Numbers / Formalization Boundary  
**Date opened:** 2026-08-18  
**Date closed:** 2026-08-18  
**Status:** **CLOSED — R-B SELECTED FOR STAGE ONE**

## Inputs

```text
BOMA-N-ACCEPT-001 v1.0
PDSA-N-001 stress-test learning
calibrated TCT path through TCT-BLOCK-005
historical Phase 9 framework comparisons
existing Lean backend infrastructure as implementation context only
```

---

# PLAN

Compare candidate realization regimes against the N-Core acceptance specification without assuming framework equivalence.

Candidates:

```text
R-A  set-theoretic / Peano-style
R-B  inductive type with unary initial-algebra reading
R-C  NNO / categorical
R-D  free-monoid-derived
```

---

# DO

Created:

`LAB/PDSA/experiments/PDSA-N-002-REGIME-COMPARISON-001.md`

The comparison evaluated TCT fidelity, formal commitments, generatedness, induction, recursion, uniqueness, formal-verification suitability, and branch comparability.

A second architectural result emerged: the canonical architecture lacked an explicit `Decision Point` unit type even though BOMA's source theory treats decisions/branches as first-class architectural information.

Therefore `LAB/00_ARCHITECTURE/ARCHITECTURE.md` was revised to distinguish:

```text
Junction       = compatibility / convergence gate
Decision Point = explicit non-derived selection among admissible alternatives
```

and to admit:

```text
BRANCHES_TO
SELECTS
```

as explicit decision relations.

Created canonical Decision Point:

`N-DP-001 — Formal Natural-Number Realization Regime`.

---

# STUDY

## S1 — R-A set-theoretic / Peano-style

Viable and conventional, but requires a larger ambient ontology and carries a high risk that familiar set-theoretic completion/existence assumptions become invisible.

It remains a preserved alternative.

## S2 — R-B inductive-type regime

Best current Stage-One fit because:

- `ε` and terminal extension map directly to constructor roles;
- inductive formation makes the new globality commitment explicit;
- induction/elimination and recursion have direct routes;
- generatedness is expressed through inductive formation/elimination rather than circular step-count language;
- formal verification is naturally supported without making the backend definition authoritative;
- the route keeps the formalization commitment concentrated and auditable.

Important precision:

> The selected regime is an inductive dependent-type realization. Its nondependent recursion may be compared with unary initial-algebra behavior where justified. BOMA does not claim that ordinary initiality in every category automatically yields dependent induction.

## S3 — R-C NNO

Strong universal characterization and valuable future branch, but category-relative generatedness/induction requires explicit ambient categorical assumptions.

Preserved alternative.

## S4 — R-D free monoid

Excellent structural model for TCT concatenation/history, but the monoid universal property alone does not discharge the complete induction/recursion/standardness acceptance package.

Preserved structural alternative.

## S5 — Architectural learning

A formalization choice is neither a theorem nor a Junction compatibility result.

The project therefore needed a genuine canonical `Decision Point` type. This is a significant recovery of an original BOMA architectural concept at the moment it became operationally necessary.

---

# ACT

## Decision A — select R-B for the first canonical route

```text
N-DP-001 --SELECTS--> R-B
```

Epistemic status:

```text
METHODOLOGICAL CHOICE / FORMALIZATION-DEPENDENT
```

not `DERIVED`.

## Decision B — preserve alternatives

```text
R-A  PRESERVED ALTERNATIVE
R-C  PRESERVED ALTERNATIVE
R-D  PRESERVED STRUCTURAL ALTERNATIVE
```

## Decision C — keep TCT-BLOCK-006 reserved

Selecting a regime does not construct its carrier.

## Decision D — next cycle

Open:

```text
PDSA-N-003 — R-B Formalization Boundary Contract
```

Required questions:

```text
exact dependent-type-theoretic commitments
fresh BOMA carrier versus built-in Nat
formal equality discipline
induction/eliminator scope
TCT realization bridge
role of Lean/backend verification
which NAC obligations are primitive, derived, or still open
```

---

# LearningGraphEffects

```text
L-N-002-01  Formalization choice must be a first-class Decision Point, not hidden prose.
L-N-002-02  Junction and Decision Point are distinct architectural unit types.
L-N-002-03  Inductive-type realization best matches the first canonical route, but is not uniquely necessary.
L-N-002-04  Ordinary initial-algebra recursion and dependent induction must not be conflated.
L-N-002-05  Free-monoid similarity to TCT does not automatically satisfy N-Core acceptance.
L-N-002-06  Non-selected formal regimes should be preserved as future branch assets.
```

---

# Closure conclusion

**PDSA-N-002 CLOSED.**

R-B is selected as the Stage-One canonical formal-realization route through explicit Decision Point `N-DP-001`. The project must now define the exact formalization-boundary contract before constructing any formal natural-number carrier.
