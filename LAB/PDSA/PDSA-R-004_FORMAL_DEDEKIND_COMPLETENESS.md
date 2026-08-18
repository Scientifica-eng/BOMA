# PDSA-R-004 — Formal Dedekind Completeness

**CycleID:** `PDSA-R-004`  
**Status:** **CLOSED — RA-11 PASS**  
**Date:** 2026-08-18  
**Input:** selected Dedekind `LowerCut`, `RBOMA` quotient identity  
**Output:** `R-COMP-BLOCK-001`

## PLAN

Lift the previously verified raw lower-cut supremum-by-union construction to the formal `RBOMA` carrier without introducing a global representative selector.

Target:

```text
nonempty F : RBOMA → Prop
+ explicit upper bound
→ least upper bound in RBOMA
```

## DO

`RDedekindCompleteness.lean` defines a raw supremum cut by witness membership:

```text
q ∈ sup(F)
iff
∃x : RBOMA,
  F x ∧
  ∃A : LowerCut,
    x = rmk A ∧ A.lower q.
```

An explicit representative of one upper bound is used only inside quotient induction to prove properness.

No function choosing one representative for every family element is constructed.

## STUDY

### Result

V5:

```text
run 32182124371
Lean 4.32.1
PASS
```

The formal theorem proves existence and leastness of an upper bound at `RBOMA`, not merely at raw `LowerCut` syntax.

### Logical dependency result

The theorem does not consume `R-LOGIC-BR-001` / `CutComparability`.

Therefore:

```text
Dedekind LUB completeness
```

is currently in the constructive proof region of the selected route, while:

```text
disjunctive totality of arbitrary cuts
```

has explicit Classical.em provenance.

This prevents full logical-strength inheritance from a sibling theorem that the completeness proof does not use.

### Representation result

Witness-based quotient reasoning again avoids a Choice-based representative selector. This mirrors the project’s earlier use of witness-based relations in Q.

## ACT

```text
RA-11                    PASS
R-COMP-BLOCK-001         ACTIVE / V5 PASS
formal completeness       STABILIZED
```

No field operation is inferred from this result.

## Next cycle

`PDSA-R-005` begins real addition:

```text
LowerCut addition
→ CutEquiv respect
→ quotient rAdd
→ rational embedding preservation
→ additive laws
```

Negation and multiplication remain separate later gates.
