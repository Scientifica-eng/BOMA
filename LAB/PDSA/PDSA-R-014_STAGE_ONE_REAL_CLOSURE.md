# PDSA-R-014 — Stage-One Real Closure

**CycleID:** `PDSA-R-014`  
**Status:** **CLOSED — RA-22 ACCEPT**  
**Date:** 2026-08-20  
**Precondition:** acceptance-strength `R-J-002 PASS / RESOLVED`

## PLAN

Make the final Stage-One real closure decision separately from the integration gate.

Question:

> Given the selected Dedekind route, the claim/source audits, and `R-J-002`, does the constructed package satisfy `BOMA-R-ACCEPT-001` strongly enough to become the canonical downstream real interface?

Possible ACT outcomes:

```text
ACCEPT
CONDITIONAL ACCEPT
REVISE
BRANCH
REJECT
```

No canonical complex-number construction is permitted merely because the forward R theorems exist; `RE-R-001` remains mandatory after acceptance.

## DO

Reviewed:

```text
LAB/00_ARCHITECTURE/R_ACCEPTANCE_SPECIFICATION.md
LAB/20_FORMALIZATION/R_STAGE/R_STAGE_ACCEPTANCE_AUDIT_001.md
LAB/20_FORMALIZATION/R_STAGE/R_CLAIM_V5_INDEX.md
LAB/10_CONSTRUCTION/junctions/R-J-002/UNIT.md
LAB/20_FORMALIZATION/R_STAGE/evidence/R_INTEGRATION_002_V5_LATEST.md
```

Final acceptance-strength integration:

```text
run                 32374868448
verified commit     f07363c22b049a3fae028a927df74d4fb28a0680
Lean                4.32.1
result              PASS
```

## STUDY — final obligation audit

### RA-01 — explicit carrier

```text
RBOMA := Quotient cutSetoid
```

with `cutSetoid` formed from extensional `CutEquiv` on project-defined Dedekind `LowerCut` values over accepted `QBOMA`.

**Result:** PASS.

### RA-02 — explicit formal identity

Formal equality of explicit cut representatives is classified by `CutEquiv`; raw Lean structure equality is not silently adopted as real identity.

**Result:** PASS.

### RA-03 — faithful rational embedding

```text
rOfQ : QBOMA -> RBOMA
```

is injective and exactly preserves/reflects accepted Q order.

**Result:** PASS.

### RA-04 — zero and one

```text
rZero := rOfQ qZero
rOne  := rOfQ qOne
```

They interact with accepted addition/multiplication as zero/one, and final integration explicitly proves:

```text
rZero != rOne
```

from accepted Q strict order rather than postulating nontriviality at R.

**Result:** PASS.

### RA-05 — negation

`rNeg` is representative-independent, preserves Q negation, gives additive inverses, is involutive, and its order reversal is explicit in the final ordered-field closure.

**Result:** PASS.

### RA-06 — addition

`rAdd` is representative-independent and satisfies the accepted additive commutative-group laws.

**Result:** PASS.

### RA-07 — multiplication

The selected sign-free positive/negative decomposition multiplication is representative-independent and satisfies commutativity, associativity, unit, zero absorption, and distributivity.

**Result:** PASS.

### RA-08 — nonzero multiplicative inverse

Every `x != rZero` has a multiplicative inverse witness; right/left inverse behavior is certified and witnesses are unique. No global Choice-backed inverse selector is introduced merely for acceptance.

**Result:** PASS.

### RA-09 — ordered-field laws

Final audit required the specifically named laws to be explicit, not hidden under the phrase “ordered field.” Certified package now includes:

```text
nontriviality
total order
addition translation invariance as an iff
negation order reversal
nonnegative-factor multiplication monotonicity
positive inverse behavior
commutative field algebra at the unique-witness inverse interface
```

#### Closure-audit Study finding

The pre-closure package had one-way addition monotonicity but did not expose the reverse translation implication, negation reversal, and arbitrary-witness positive-inverse behavior as explicit final claims.

This was treated as an acceptance-interface gap, not waived. `RDedekindOrderedFieldClosure.lean` was added and `R-J-002` was widened. The widened assembly initially exposed only dependency-visibility defects and finally passed in run `32374868448`.

**Result:** PASS after explicit repair.

### RA-10 — preservation of Q structure

The principal-cut embedding preserves the accepted rational:

```text
0
1
negation
addition
multiplication
order
positive inverse relation
```

and is injective.

**Result:** PASS.

### RA-11 — selected completeness

The selected theorem is exactly Dedekind least-upper-bound completeness:

```text
nonempty bounded F : RBOMA -> Prop
  ->
exists least upper bound in RBOMA.
```

**Result:** PASS.

### RA-12 — rational density

For every `x < y` in `RBOMA`, there exists `q : QBOMA` with:

```text
x < rOfQ q < y.
```

V5 `32359834460` PASS.

**Result:** PASS.

### RA-13 — Archimedean characterization

Every `x : RBOMA` lies strictly below an embedded `N_BOMA` value.

V5 `32359869558` PASS.

**Result:** PASS.

### RA-14 — representation adequacy

Selected raw representations are exactly the declared nonempty/proper/downward/rounded lower cuts over `QBOMA`; identity is extensional `CutEquiv` followed by the selected quotient realization.

No universal classification of all real-number realizations is claimed.

**Result:** PASS.

### RA-15 — completion Decision Point

`R-DP-001` compared/delimited Dedekind and Cauchy routes and selected Dedekind for Stage I while retaining Cauchy as a first-class later branch.

**Result:** PASS / RESOLVED.

### RA-16 — multiple-complete-carrier convergence discipline

Stage I completed only one formal real carrier. The Cauchy route remains a retained probe/branch and is not mislabeled as a second accepted carrier.

**Result:** NOT TRIGGERED, correctly discharged at declared scope.

### RA-17 — completeness scope

Only Dedekind LUB completeness is promoted. No automatic claim of Cauchy, metric, sequential, nested-interval, or equivalent completeness is made.

**Result:** PASS.

### RA-18 — no hidden standard-real shortcut

Active canonical R carrier/completeness sources use project-defined N/Z/Q/R payloads. Lake manifest has zero external packages, and no standard `Real` carrier/completeness theorem is imported to construct `RBOMA`.

**Result:** PASS at audited active dependency closure.

### RA-19 — formal commitment ledger

Explicitly recorded commitments include:

```text
predicate-valued cuts
quotient formation
localized Classical.em for total cut comparability
localized classical finite membership search for fine bracketing
localized Classical.byContradiction for positive representative extraction
localized classical witness extraction in strict R density
no global representative selector for completeness
no global inverse selector required for field interface
Lean/GitHub V5 as meta-level verification infrastructure
```

**Result:** PASS.

### RA-20 — claim-level V5 traceability

`R_CLAIM_V5_INDEX.md` maps promoted theorem families to authoritative V5 evidence. The final specifically named RA-09 closure claims are now indexed to acceptance-strength integration run `32374868448`.

**Result:** PASS.

### RA-21 — final integration

`R-J-002` verifies all final acceptance-level interfaces on the same `RBOMA` and same operations/order.

Final widened V5:

```text
32374868448 PASS
```

**Result:** PASS / RESOLVED.

## Consolidated matrix

```text
RA-01  PASS
RA-02  PASS
RA-03  PASS
RA-04  PASS
RA-05  PASS
RA-06  PASS
RA-07  PASS
RA-08  PASS
RA-09  PASS
RA-10  PASS
RA-11  PASS
RA-12  PASS
RA-13  PASS
RA-14  PASS
RA-15  PASS / RESOLVED
RA-16  NOT TRIGGERED — correctly discharged
RA-17  PASS
RA-18  PASS
RA-19  PASS
RA-20  PASS
RA-21  PASS / RESOLVED
```

No unresolved acceptance obligation remains in `BOMA-R-ACCEPT-001`.

## STUDY — mathematical product obtained

The Stage-One real package provides one selected formal carrier with:

```text
Dedekind lower-cut quotient realization
faithful ordered Q embedding
nontrivial ordered commutative field behavior
unique nonzero inverse witnesses without a global selector
Dedekind least-upper-bound completeness
strict Q density
Archimedean natural upper bounds
```

This supports the Stage-I use of the name **BOMA real domain** at the declared acceptance scope.

## What is deliberately not claimed

Acceptance does not assert:

```text
Dedekind representation is mathematically necessary
quotient identity is uniquely forced
Cauchy and Dedekind formal carriers have been constructed and proved isomorphic
all classical completeness notions are already equivalent
uniqueness of complete Archimedean ordered fields has been constructed
RBOMA is identified with Lean/Mathlib Real
analysis/transcendental functions have been built
```

## ACT — RA-22

Decision:

```text
RA-22 = ACCEPT
BOMA Stage-One Real Domain = ACCEPTED
```

Canonical downstream export:

```text
R-BLOCK-001 — Accepted Stage-One Real Interface
```

Existing narrower R Blocks remain preserved with their original meanings. They are dependencies/provenance, not silently repurposed by final acceptance.

## Construction Graph effect

```text
Q-BLOCK-002
   ↓
R-DP-001 Dedekind selected / Cauchy retained
   ↓
LowerCut / CutEquiv
   ↓
R-DP-002 quotient identity
   ↓
RBOMA + order + Q embedding
   ↓
R-COMP-BLOCK-001 + R-ADD-GROUP-BLOCK-001
   ↓
R-MUL-BLOCK-001
   ↓
R-FIELD-BLOCK-001
   ↓
R-DENSITY-BLOCK-001 + R-ARCH-BLOCK-001
   ↓
explicit ordered-field closure
   ↓
R-J-002 PASS
   ↓
RA-22 ACCEPT
   ↓
R-BLOCK-001
```

## Learning Graph effect

Reusable learning includes:

```text
completion route and identity are separate Decision Points
constructive order core can be separated from classical totality witness
Dedekind LUB completeness need not choose representatives globally
fine approximation can isolate classical finite membership search
sign-free multiplication can postpone sign splitting to proofs
inverse existence need not force a Choice-backed global inverse selector
claim-level PASS does not substitute for final same-carrier integration
acceptance wording must be audited literally: monotonicity is not automatically documented translation invariance
CI source-order / namespace failures are dependency-provenance Study evidence
```

## Mandatory next gate

Per `REVERSE_ENGINEERING_SCHEDULE.md`:

```text
RA-22 ACCEPT
   ↓
RE-R-001 mandatory local real-stage reverse engineering
   ↓
only after RE-R-001 closure may canonical C construction begin
```

This closure therefore **does not yet authorize canonical C construction**.
