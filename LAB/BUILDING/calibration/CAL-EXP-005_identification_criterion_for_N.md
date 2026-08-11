# CAL-EXP-005 — Identification Criterion for the Natural-Number Structure

**Cycle:** `CAL-001`  
**Status:** Provisional result

## 1. Intention / Goal

Determine how the project may legitimately identify a successfully constructed pre-numerical structure with the natural numbers without using the natural numbers as a hidden construction principle.

## 2. Question

There are two distinct claims that must not be conflated:

1. **Construction claim:** the project has generated a structure from its declared primitive choices and derived operations.
2. **Identification claim:** the resulting structure is isomorphic to the standard natural-number structure, under an independently stated characterization.

The second claim may legitimately use an external mathematical characterization as a test, provided that characterization is not used to construct the object in the first place.

## 3. Candidate Identification Method

The preferred criterion is structural equivalence/isomorphism to a standard successor structure characterized by:

- a distinguished initial element;
- a successor operation;
- the relevant separation/injectivity properties;
- generation of the domain from the initial element by finite iteration of successor;
- and the appropriate induction/recursion principle required by the chosen foundational framework.

This is deliberately stated without assigning the labels `0,1,2,...` to the constructed objects.

## 4. Critical Distinction

Using such a characterization does **not** mean that the natural numbers were assumed in the construction.

The logical order is:

```text
chosen primitives
      ↓
constructed structure C
      ↓
independent structural analysis
      ↓
prove C satisfies a characterization of N
      ↓
identify C with N (up to isomorphism)
```

The invalid circular order would be:

```text
assume N
   ↓
construct C using N
   ↓
prove C has the properties of N
```

The project must maintain the first order.

## 5. Important Limitation

The phrase "standard natural-number structure" is itself framework-dependent. Different foundations package the characterization differently. Therefore the project should not prematurely declare one formulation canonical.

In particular, a finite-iteration description alone is insufficient if the intended structure contains all natural numbers; an appropriate closure/induction principle is needed to exclude truncated successor chains.

## 6. Result

A legitimate endpoint criterion has been identified:

> The constructed pre-numerical structure may be identified with the natural numbers only after an independent structural proof establishes the required characterization, with no use of numerical labels or numerical counting in the construction phase.

Thus the external characterization functions as an **identification test**, not as a construction rule.

## 7. Decision

1. Accept structural characterization/isomorphism as the eventual identification criterion.
2. Do not yet declare the constructed domain to be `N`.
3. Do not use Peano axioms merely as a recipe for constructing the next Brick.
4. Before resuming the main construction, explicitly formulate the repaired pre-numerical structure and test which parts of the characterization can already be derived internally.

## 8. Calibration Status

`CAL-001` has produced a workable methodological separation between construction and identification.

However, this does not close the entire calibration cycle. A final cycle-level audit is required to determine whether all earlier commitments are consistent with the repaired route and whether any hidden numerical assumptions remain.
