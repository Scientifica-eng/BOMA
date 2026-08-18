# PDSA-R-010 — Real Multiplicative Inverse

**CycleID:** `PDSA-R-010`  
**Status:** **ACTIVE — R-DP-006 OPEN**  
**Date:** 2026-08-18  
**ParentCycles/LearningInputs:** `PDSA-R-009`, `PDSA-R-006`, `PDSA-R-008`, accepted Q inverse interface  
**Decision Point:** `R-DP-006`  
**Primary acceptance target:** `RA-08`

## ResearchQuestion

What is the smallest transparent construction that gives every nonzero selected real a multiplicative inverse while preserving the explicit dependency and logical provenance of the BOMA construction?

## PLAN

Compare two routes.

### Route A — direct positive Dedekind reciprocal

1. Prove the Q inverse-order interface needed for reciprocal cuts.
2. Define a positive reciprocal lower cut from positive rational outside witnesses.
3. Prove LowerCut validity and CutEquiv/proof-parameter independence.
4. Prove preservation on positive principal rational cuts.
5. Prove positive inverse-product = one, explicitly identifying any use of `CutBracketApprox`.
6. Extend to arbitrary nonzero signed reals using the stabilized sign/quadrant infrastructure.

### Route B — completeness-level inverse

1. Define an approximating family below the reciprocal condition at the `RBOMA` level.
2. Prove the family nonempty and bounded.
3. Take its supremum via `R-COMP-BLOCK-001`.
4. Establish the multiplication/supremum interface needed to prove product = one.
5. Compare the resulting dependency graph with Route A.

## DO — first probe

Start with Route A only far enough to answer the first architectural question:

```text
Can the direct positive reciprocal predicate be packaged as a valid LowerCut
using only accepted Q order/inverse structure plus an explicit positive-inside
witness for the source cut?
```

Do not yet claim an inverse law.

In parallel, record Route B prerequisites rather than assuming completeness automatically supplies inversion.

## Observations

The ordered-ring cycle deliberately ended before inverse construction. This prevents the field inverse from being hidden inside the multiplication-law proof stack.

The direct reciprocal route is expected to expose a new asymmetry similar to negation:

```text
definition/validity may require only local order + Q inverse structure;
product = one may require fine boundary approximation.
```

This expectation must be tested rather than assumed.

## STUDY questions

1. Can positive reciprocal LowerCut validity be proved without `CutBracketApprox`?
2. Which direction of `A * recip(A) ≈ 1` first consumes fine bracketing?
3. Can Q reciprocal preservation be proved from Q density and inverse antitonicity alone?
4. Does Route B require a new multiplication-continuity/supremum theorem?
5. Is any use of classical logic witness-selection, sign-identification, or merely proposition reasoning?
6. Which inverse contribution is more reusable across a future Cauchy completion branch?

## ErrorsDetected

None yet in this cycle.

## Successes

The ordered commutative-ring layer is already independently certified, so any failure here can be localized to inversion rather than multiplication itself.

## HiddenAssumptions

Forbidden unless explicitly reconstructed and recorded:

```text
standard Real reciprocal;
preexisting real-field instance;
choice of a canonical cut boundary;
continuity of multiplication at suprema;
existence of a positive rational inside a positive real cut without proof.
```

## HumanContributions

The requirement to perform reverse engineering before canonical C means the inverse architecture must remain a visible decision node. In particular, route-specific cut machinery must not be collapsed into a generic “field axiom”.

## AIContributions

The AI separated the inverse from the ordered-ring cycle and proposed comparing a direct cut reciprocal with a completeness-level construction, with explicit tests for route dependence and approximation reuse.

## VerificationEvidence

Pending Route A validity probe and Route B prerequisite analysis.

## ACT candidates

```text
A  select direct cut reciprocal if validity/product proofs remain localized and auditable;
B  select completeness-level inverse if it gives a materially cleaner higher-level dependency path;
C  retain both if both pass with useful Stage-II branch contrast;
D  revise the inverse interface if either route reveals a missing ordered-ring/completeness obligation.
```

## ConstructionGraphEffects

Current frontier:

```text
R-MUL-BLOCK-001
  ↓
R-DP-006
  ├── Route A direct reciprocal
  └── Route B completeness inverse
        ↓
RA-08
```

## LearningGraphEffects

```text
ordered commutative ring accepted
  ↓
field claim intentionally withheld
  ↓
new inverse architecture decision isolated
  ↓
route comparison begins
```

## Reverse-engineering note

All Route A/B dependencies and negative results must be preserved for `RE-R-001`; this decision is expected to be one of the highest-value Stage-II branch points in the real construction.

## NextCycleInputs

Construct the minimal Q reciprocal-order lemmas and the Route-A positive reciprocal LowerCut validity probe. Do not attempt the signed inverse until the positive route is independently stable.
