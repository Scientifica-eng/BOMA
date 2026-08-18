# PDSA-R-006 — Rational Archimedean Approximation Gate

**CycleID:** `PDSA-R-006`  
**Status:** **ACTIVE — R-DP-004 OPEN**  
**Date:** 2026-08-18  
**ParentCycles/LearningInputs:** `PDSA-R-005`, `PDSA-Q-004`, `BOMA-R-ACCEPT-001 / RG-01`  
**Decision Point:** `R-DP-004`

## ResearchQuestion

What is the smallest transparent theorem about the accepted `QBOMA` that supplies arbitrarily fine rational bracketing of an arbitrary Dedekind cut, as required by the real additive-inverse proof, without importing a built-in rational/real Archimedean package?

## PLAN

Run two proof routes against a common acceptance interface.

### Route A — reusable Q Archimedean theorem

Derive a general property of the explicit accepted rational carrier from its N/Z/fraction construction, then derive cut bracketing.

### Route B — direct cut bracketing

Use the explicit fraction representation directly to produce the required inside/outside witnesses at width `< eps`.

Compare the routes on:

```text
new infrastructure
reuse
representation dependence
proof size / robustness
logical commitments
future RA-12 / RA-13 value
```

## DO — current state

No route is yet promoted.

The common target is approximately:

```text
∀ A eps,
  0 < eps →
  ∃ a r,
    A.lower a ∧
    ¬ A.lower r ∧
    0 < r-a ∧
    r-a < eps.
```

The exact theorem statement may be refined if a stronger reusable interface gives a cleaner proof, but any refinement must still discharge the additive-inverse need explicitly.

## Observations

Rational order density already proved in the Q→R gateway is not enough by itself to obtain arbitrarily small boundary brackets in an arbitrary dense ordered abelian group. The missing ingredient is Archimedean in nature.

This distinction was discovered during Study of `RA-05`, before a hidden dependency entered the construction graph.

## STUDY

Questions to answer:

1. Can the accepted fraction representation yield a small positive rational below every positive `eps` in a reusable form?
2. Can repeated rational steps be bounded against an arbitrary rational interval using the accepted N/Z structure?
3. Which route exposes fewer representation-specific details to the R layer?
4. Does the successful contribution later shorten RA-12 and RA-13?
5. Does either route introduce a new logical principle beyond the already recorded quotient/classical-comparability commitments?

## ErrorsDetected

None yet. This cycle was opened because a mathematical dependency was detected before formalization, not because V5 failed.

## Successes

The dependency has been isolated before the real-negation theorem was written, preventing an Archimedean assumption from being smuggled into an apparently local cut proof.

## HiddenAssumptions

The following are forbidden unless explicitly reconstructed and recorded:

```text
built-in Rat Archimedean instance
built-in Real
prepackaged floor/ceiling
untracked Choice-based boundary selection
```

## HumanContributions

The project requires forward construction to remain compatible with later reverse engineering. In this cycle that means the Q→R approximation dependency must be represented as its own gateway so that `RE-R-001` can later classify it as structurally necessary, route-specific, or replaceable.

## AIContributions

The AI identified that the additive-inverse proof needs a stronger approximation principle than mere order density and proposed separating a reusable Q Archimedean route from a direct Dedekind-bracketing route.

## VerificationEvidence

Pending route probes and claim-level V5.

## ACT candidates

```text
A  promote a reusable Q Archimedean approximation block;
B  promote a direct cut-bracketing block;
C  retain both if both pass and differ materially in branch value;
D  revise the negation realization if both routes expose unacceptable commitments.
```

## ConstructionGraphEffects

Pending. No accepted edge is added until a route passes.

## LearningGraphEffects

```text
RA-05 attempted conceptually
  ↓
need for arbitrary boundary precision detected
  ↓
density distinguished from Archimedean approximation
  ↓
R-DP-004 / PDSA-R-006 opened
```

## OpenQuestions

Can the general Q theorem be made sufficiently small that it is clearly superior to a one-off direct proof?

## NextCycleInputs

In parallel, construct and verify the negation **candidate layer** that does not require the approximation theorem: valid `LowerCut`, `CutEquiv` respect, quotient lift, and preservation of rational negation. The additive-inverse theorem remains blocked by this cycle.
