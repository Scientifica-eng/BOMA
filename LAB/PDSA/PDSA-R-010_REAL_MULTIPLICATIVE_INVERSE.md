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

## DO — current state

### Route A validity probe

A Q-level theorem has been written for strict antitonicity of existential inverse witnesses on positive rationals.

The direct reciprocal lower predicate is:

```text
q ∈ recip(A)
  iff
q < 0
  or
∃ r>0 outside A, ∃rinv,
  QInvRel r rinv ∧ q<rinv.
```

The positivity proof for the source cut is used only to prove properness; it is absent from the lower predicate itself.

The first V5 run reached unavailable helper names (`qNeg_zero`, `qle_lt_trans`) before it could test the mathematical properness argument. Both references were replaced by local derivations so the validity probe remains independent of later helper layers. A corrected rerun is active.

### Route B prerequisite audit

The accepted completeness interface was inspected directly.

It supplies:

```text
rDedekind_lub_exists:
  nonempty + bounded family of RBOMA
  → existence of a least upper bound.
```

It does **not** currently supply a theorem such as:

```text
x * sup(F) = sup(x*F)
```

or an equivalent multiplication-continuity/order-supremum interface.

A reciprocal approximant family such as

```text
{q ≥ 0 | q*x < 1}
```

also needs a nontrivial boundedness proof. At the higher `RBOMA` level, the natural proof requires a positive rational lower witness below positive `x`, so Route B tends to consume the rational-density-in-R interface earlier than the current canonical schedule.

Route B is therefore **not rejected**, but its visible prerequisite surface is materially larger than the bare LUB theorem.

## Observations

1. The ordered-ring cycle deliberately ended before inverse construction, so inversion failures remain local to this cycle.
2. Route A separates reciprocal-object validity from the harder inverse-product theorem.
3. The first Route-A V5 failure was proof/API engineering, not a counterexample.
4. Route B currently exposes at least two missing interfaces beyond `R-COMP-BLOCK-001`:

```text
boundedness of reciprocal approximants;
multiplication/supremum interaction or an equivalent continuity argument.
```

5. Route B may also require earlier closure/use of the rational-density acceptance item.

## STUDY questions

1. Can positive reciprocal LowerCut validity be proved without `CutBracketApprox`?
2. Which direction of `A * recip(A) ≈ 1` first consumes fine bracketing?
3. Can Q reciprocal preservation be proved from Q density and inverse antitonicity alone?
4. Can Route B avoid a new multiplication-continuity/supremum theorem, or is it genuinely necessary?
5. Can Route B prove boundedness without first extracting a positive rational lower witness for `x`?
6. Is any use of classical logic witness-selection, sign-identification, or merely proposition reasoning?
7. Which inverse contribution is more reusable across a future Cauchy completion branch?

## ErrorsDetected

Current Route-A proof-engineering errors:

```text
unavailable qNeg_zero helper name;
unavailable qle_lt_trans helper name at this dependency level.
```

Both were replaced locally; no theorem statement changed.

## Successes

The ordered commutative-ring layer is independently certified.

The Route-B audit prevents an implicit assumption that LUB existence alone implies multiplicative inversion.

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

The AI separated the inverse from the ordered-ring cycle, proposed the direct-cut/completeness comparison, constructed the first Route-A validity probe, and identified the concrete missing interfaces in the completeness-level route.

## VerificationEvidence

```text
Route A first reciprocal-validity V5 32193084014 — FAIL_OR_INCOMPLETE / API-level
Route A corrected rerun                         — PENDING
Route B completeness prerequisite audit         — completed against accepted interface
```

## ACT candidates

```text
A  select direct cut reciprocal if validity/product proofs remain localized and auditable;
B  select completeness-level inverse if it gives a materially cleaner higher-level dependency path after its missing interfaces are built;
C  retain both if both pass with useful Stage-II branch contrast;
D  revise the inverse interface if either route reveals a missing ordered-ring/completeness obligation.
```

## ConstructionGraphEffects

Current frontier:

```text
R-MUL-BLOCK-001
  ↓
R-DP-006
  ├── Route A direct reciprocal — validity probe active
  └── Route B completeness inverse — prerequisite gap identified
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
  ├── Route A validity/API probe
  └── Route B LUB-interface audit
```

## Reverse-engineering note

All Route A/B dependencies and negative results must be preserved for `RE-R-001`. In particular, the audit must distinguish:

```text
cut-level reciprocal syntax;
Q inverse-order structure;
fine boundary approximation;
RBOMA rational-density requirements;
LUB existence;
multiplication/supremum interaction;
proof-engineering-only helper-name failures.
```

## NextCycleInputs

1. close the corrected Route-A reciprocal validity V5;
2. if PASS, prove positive principal-rational reciprocal preservation;
3. then attack the positive inverse-product theorem and identify its exact approximation dependency;
4. only after that compare the measured Route-A cost with the explicit Route-B prerequisite gap.

Do not attempt signed nonzero inversion until the positive route is independently stable.
