# PDSA-R-010 — Real Multiplicative Inverse

**CycleID:** `PDSA-R-010`  
**Status:** **CLOSED — ROUTE A SELECTED / RA-08 PASS**  
**Date:** 2026-08-18 → 2026-08-20  
**ParentCycles/LearningInputs:** `PDSA-R-009`, `PDSA-R-006`, `PDSA-R-008`, accepted Q inverse interface  
**Decision Point:** `R-DP-006 — CLOSED / RESOLVED`  
**Primary acceptance target:** `RA-08`

## ResearchQuestion

What is the smallest transparent construction that gives every nonzero selected real a multiplicative inverse while preserving the explicit dependency and logical provenance of the BOMA construction?

## PLAN

Compare two routes.

### Route A — direct positive Dedekind reciprocal

1. prove the Q inverse-order interface;
2. define a positive reciprocal lower cut from positive rational outside witnesses;
3. prove LowerCut validity and CutEquiv/proof-parameter independence;
4. prove preservation on positive principal rational cuts;
5. prove positive inverse-product = one and identify exactly where fine bracketing is consumed;
6. lift to a representative-independent positive inverse relation;
7. extend to arbitrary nonzero signed reals;
8. prove left inverse and witness uniqueness.

### Route B — completeness-level inverse

1. define a reciprocal approximating family at the `RBOMA` level;
2. prove nonempty/bounded;
3. take a supremum via `R-COMP-BLOCK-001`;
4. prove enough multiplication/supremum interaction to obtain product one;
5. compare the dependency cost with Route A.

## DO

### Route A — completed chain

The selected positive reciprocal predicate is:

```text
q ∈ recip(A)
  iff
q < 0
  or
∃ r>0 outside A, ∃rinv,
  QInvRel r rinv ∧ q<rinv.
```

The positivity witness for `A` is used to certify properness.  It is not part of the extensional lower predicate.

The verified chain is:

```text
Q inverse-order structure
  ↓
positive reciprocal LowerCut validity / proof independence
  ↓
positive principal-Q reciprocal preservation
  ↓
anchored fine cut bracketing
  ↓
Q reciprocal-gap estimate 004
  ↓
A * recip(A) ≈ principalCut(1)
  ↓
representative-independent RPositiveInvRel
  ↓
nonzero signed extension
  ↓
right inverse + left inverse + uniqueness
```

No global function `RBOMA → RBOMA` was introduced through Choice.  The accepted interface is existential/unique-witness based.

### Route B — prerequisite audit

The accepted completeness theorem supplies:

```text
nonempty bounded family
  →
least upper bound exists.
```

It does not currently supply:

```text
x * sup(F) = sup(x*F)
```

or an equivalent multiplication-continuity/order-supremum transport theorem.

A reciprocal approximant family also requires a nontrivial boundedness proof and earlier use of positive rational witnesses below positive reals.  Route B therefore exposes a materially larger immediate prerequisite surface.

Route B is retained for Stage-II branch comparison; it is not mathematically rejected.

## Observations

1. Reciprocal-object validity is much cheaper than the inverse-product theorem.
2. Positive principal-Q reciprocal preservation also does **not** require fine bracketing.
3. Fine bracketing enters only in the hard reverse inclusion of:

```text
A * recip(A) ≈ principalCut(1).
```

4. The signed extension introduces no new analytic approximation.  It consumes the already-isolated total-order/sign interface plus additive negation and signed multiplication laws.
5. A representative-independent relation is sufficient for field acceptance; a global inverse selector is unnecessary.
6. Route B confirms that LUB existence alone is not a slogan from which inversion may be imported.

## STUDY

### Mathematical learning

The successful dependency decomposition is:

```text
Q inverse/order algebra
  ↓
Dedekind reciprocal syntax
  ↓
extensionality / quotient transport
  ↓
local boundary approximation only for product-one surjectivity
  ↓
proof-level sign extension
```

This is significantly more informative than an undifferentiated field axiom.

### Logical learning

Classical reasoning is localized.  It is used where the project identifies sign / extracts proposition-level witnesses from an arbitrary cut predicate.  It is not embedded into the reciprocal lower-predicate definition and no global Choice selector is introduced.

### Route comparison

Route A has now produced the complete accepted inverse contribution.  Route B would require at least:

```text
bounded reciprocal-approximant family;
positive rational witness extraction at the higher level;
multiplication/supremum interaction or an equivalent continuity theorem.
```

Therefore Route A has the smaller verified Stage-I dependency surface while Route B remains valuable as a Stage-II branch.

## ErrorsDetected / Learning from failed revisions

All failures below were retained as Learning-Graph evidence; none was a mathematical counterexample.

### Early helper/API failures

```text
unavailable qNeg_zero helper;
unavailable qle_lt_trans helper at the chosen dependency level.
```

These were replaced by local derivations.

### Q reciprocal-gap revisions

```text
001  incorrect endpoint equality in strict/non-strict transitivity helper;
002  global rewrite of hsumA polluted the left expression;
003  accidental use of `<` notation, requiring an unavailable LT instance on QBOMA;
004  explicit qLT chain with local endpoint rewrites — PASS.
```

### Positive inverse-product revisions

```text
003  destructured hApos and then attempted to reuse the consumed proof name;
004  preserved hAposOrig before destructuring — PASS.
```

### Integration / CI failures

```text
positive inverse relation 003 first run:
  missing NonnegativeMulEmbedding / PositiveDecomposition dependencies in CI assembly;
  classified as CI-DAG defect, not theorem failure.

nonzero inverse 003:
  ambiguous rNeg_zero from two preserved producers;
  revision 004 explicitly qualifies the selected producer — PASS.
```

The workflow repairs changed dependency assembly/provenance only; they did not change the mathematical reciprocal architecture.

## Successes / VerificationEvidence

```text
32193229000  positive reciprocal LowerCut validity / proof independence      PASS
32193653985  positive principal-Q reciprocal preservation                   PASS
32193755906  anchored fine cut bracketing                                   PASS
32355200375  Q reciprocal-gap estimate 004                                  PASS
32355681924  positive Dedekind inverse product 004                           PASS
32356254961  positive inverse relation 003                                   PASS
32356513408  nonzero inverse 004: right/left existence + uniqueness          PASS
```

Pinned verifier: `leanprover/lean4:v4.32.1`.

## HiddenAssumptions audit

The accepted route does **not** import:

```text
built-in Real reciprocal;
preexisting real-field instance;
canonical cut boundary selector;
global Choice selecting inverse representatives;
multiplication/supremum continuity theorem;
field inversion as an axiom.
```

The following remain explicit dependencies:

```text
Dedekind cut representation;
Q inverse witnesses/order structure;
anchored fine bracketing for the hard product-one direction;
isolated classical sign/witness reasoning;
quotient identity of RBOMA.
```

## ACT

**Select Route A for Stage One.**

```text
R-DP-006 = CLOSED / RESOLVED
RA-08    = PASS
```

Retain Route B as a Stage-II branch for later convergence/cost comparison.

Create a downstream ordered-field interface rather than modifying `R-MUL-BLOCK-001` into a different semantic object.

## ConstructionGraphEffects

```text
R-MUL-BLOCK-001 — ordered commutative ring PASS
  ↓
R-DP-006 — Route A selected
  ↓
positive reciprocal object
  ↓
positive inverse relation
  ↓
signed nonzero inverse + uniqueness
  ↓
R-FIELD-BLOCK-001 — eligible
```

## LearningGraphEffects

```text
ordered ring
  ↓
inverse architecture comparison
  ├── Route A built and certified
  └── Route B prerequisite gap measured and retained
  ↓
proof failures classified by layer
  ↓
verified field-inverse contribution
```

## HumanContributions

The insistence on reverse engineering and branch provenance prevented the reciprocal from being collapsed into an opaque “field axiom” and required the alternative completeness route to remain visible.

## AIContributions

The AI decomposed the inverse problem, implemented the direct-cut route, isolated fine bracketing to the exact direction where it is needed, repaired proof/CI failures without silent replacement, and compared the measured Route-A surface against Route B.

## Reverse-engineering note

`RE-R-001` must explicitly revisit:

```text
R-DP-006 route choice;
reciprocal LowerCut syntax;
Q inverse-order contribution;
anchored bracketing;
Q reciprocal-gap contribution;
positive representative extraction;
proof-only classical sign handling;
Route-B missing multiplication/supremum interface;
all failed proof-engineering revisions as learning evidence.
```

The reverse audit must distinguish what is intrinsically Dedekind-specific from reusable Q/ordered-field contributions.

## NextCycleInputs

1. export `R-FIELD-BLOCK-001` as the verified ordered-field interface;
2. close RA-12 rational density and RA-13 Archimedean characterization in parallel branches;
3. close RA-14/17/18/19/20 audits;
4. run `R-J-002` integration;
5. only then decide `RA-22`;
6. immediately execute `RE-R-001` before any canonical complex-number construction.
