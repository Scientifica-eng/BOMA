# R-BLOCK-001 — Accepted Stage-One Real Interface

- **Operational Status:** **ACTIVE — ACCEPTED**
- **Epistemic Status:** **MIXED FORMALIZATION CHOICE + DERIVED CERTIFIED PACKAGE**
- **Acceptance:** `RA-22 = ACCEPT`
- **Depends on:** selected Dedekind route, `R-J-002`, `PDSA-R-014`
- **Post-acceptance audit:** `PDSA-R-015 / RE-R-001 CLOSED`
- **Input domain:** `Q-BLOCK-002 — Accepted Stage-One Rational Interface`
- **Next-family status:** **C NOT STARTED — USER HOLD**

## Purpose

Provide the canonical downstream interface for the accepted BOMA Stage-One real domain while preserving the Dedekind/Cauchy route decision, quotient-identity choice, logical boundaries, proof-engineering lineage, narrower construction Blocks, and post-acceptance reverse classification.

## Carrier / identity

Selected raw representation:

```text
LowerCut over QBOMA
  nonempty
  proper
  downward closed
  rounded / no greatest member
```

Extensional identity:

```text
CutEquiv A B := ∀q, A.lower q ↔ B.lower q
```

Formal carrier:

```text
RBOMA := Quotient cutSetoid
```

This quotient choice is the selected Stage-One formalization route, not a necessity theorem about all real constructions.

## Rational embedding

```text
rOfQ : QBOMA → RBOMA
```

is injective and exactly preserves/reflects the accepted rational order. The embedding also preserves the accepted Q constants and operations through the separately certified addition, negation, multiplication, and positive-inverse interfaces.

## Constants and algebra

```text
rZero
rOne
rNeg
rAdd
rMulCandidate
```

with certified:

```text
rZero != rOne
additive commutative-group laws
multiplicative commutativity / associativity / one
zero absorption
left/right distributivity
unique multiplicative-inverse witnesses for every nonzero real
```

The inverse interface is witness-based. Stage One does not introduce a global Choice-backed inverse selector solely to satisfy field closure.

## Order

```text
rLE
rLT
```

with certified:

```text
reflexivity
transitivity
antisymmetry
totality
strict irreflexivity
exact extension of QBOMA order
addition translation invariance
negation order reversal
multiplication monotonicity for nonnegative factors
positive inverse behavior
```

The reflexive/transitive/antisymmetric order core is separated from the explicit localized classical witness used for total cut comparability.

## Completeness

Accepted completeness is exactly:

```text
Dedekind least-upper-bound completeness:
every nonempty bounded family F : RBOMA → Prop has a least upper bound in RBOMA.
```

The construction is based on witness-driven union of lower regions and does not choose one representative globally for every family member.

This export does **not** automatically claim Cauchy, metric, sequential, or other equivalent completeness notions.

## Density and Archimedean properties

Certified:

```text
x < y
  → ∃q : QBOMA, x < rOfQ q < y
```

and:

```text
∀x : RBOMA,
  ∃n : N_BOMA,
    x < rOfQ (qOfN n).
```

Thus the accepted rational image is strictly order-dense and the accepted real domain satisfies the declared Archimedean upper-bound characterization.

## Final verification

Acceptance-strength integration:

```text
R-J-002
run                 32374868448
verified commit     f07363c22b049a3fae028a927df74d4fb28a0680
Lean                4.32.1
result              PASS
```

The final certificate explicitly checks, on the same carrier and operations:

```text
identity / Q embedding / order
nontriviality
additive group
translation invariance / negation reversal
commutative field algebra at the inverse-witness interface
nonnegative-factor monotonicity
positive inverse behavior
Dedekind LUB completeness
Q density
Archimedean characterization
```

## Formal/logical commitment scope

The accepted route explicitly records:

```text
predicate-valued Dedekind cuts
quotient formation for real identity
localized Classical.em for cut total comparability
localized classical finite membership search in fine bracketing
localized Classical.byContradiction in positive representative extraction
localized classical witness extraction in strict rational density
no global representative selector required for completeness
no global inverse selector required by the accepted field interface
Lean 4.32.1 / GitHub V5 as meta-level verification infrastructure
```

The active verified build has zero external Lake packages; no standard-library real carrier/completeness theorem is used as the definition or construction of `RBOMA`.

## Preserved alternatives

Stage One selected Dedekind lower cuts through `R-DP-001` while retaining the Cauchy route as a first-class later branch.

Other retained questions include:

```text
quotient identity versus external CutEquiv identity
Dedekind versus Cauchy completion
localized classical totality versus constructive locatedness/order regimes
sign-free multiplication versus retained alternative multiplication architectures
direct Dedekind reciprocal versus completeness/supremum inverse
reusable Q approximation components versus route-specific Dedekind proof machinery
strict order as rLE+inequality versus an explicit strict-inclusion witness interface
```

No convergence theorem between two independently completed real carriers is claimed in Stage One.

## Acceptance matrix

```text
RA-01..15   PASS, with RA-15 RESOLVED
RA-16       NOT TRIGGERED — correctly discharged
RA-17..20   PASS
RA-21       PASS / R-J-002 RESOLVED
RA-22       ACCEPT
```

Closure records:

```text
LAB/PDSA/PDSA-R-014_STAGE_ONE_REAL_CLOSURE.md
LAB/20_FORMALIZATION/R_STAGE/R_STAGE_ACCEPTANCE_CLOSURE_AUDIT_002.md
```

## Post-acceptance reverse engineering

`RE-R-001` has now been executed and closed through `PDSA-R-015`.

Canonical reverse matrix:

`LAB/PDSA/experiments/PDSA-R-015-RE-R-001-DEPENDENCY-CLASSIFICATION.md`

The principal result is that the accepted R interface must not be confused with the necessity of its selected realization:

```text
acceptance-required properties
+
Dedekind-specific construction choices
+
formal quotient identity choice
+
localized logical commitments
+
reusable Q-level contributions
+
verification infrastructure
+
retained branch candidates
```

In particular, Stage-One acceptance does not make the Dedekind route, quotient identity, current classical comparability proof, multiplication architecture, or direct reciprocal route universally necessary.

```text
RE-R-001 = CLOSED / COMPLETE
```

No accepted R theorem was weakened or revoked by the reverse audit.

## Downstream status

The governance prerequisite that required RE-R-001 before any canonical complex-number stage is satisfied.

However, **eligibility is not authorization**. The user has explicitly instructed:

```text
DO NOT START C UNTIL A NEW EXPLICIT USER ORDER IS GIVEN.
```

Therefore the current downstream state is:

```text
R-BLOCK-001  ACTIVE — ACCEPTED
RE-R-001     CLOSED / COMPLETE
C            NOT STARTED — USER HOLD
```

No C acceptance specification, Decision Point, Brick, Block, Lean payload, workflow, or PDSA construction cycle is authorized or opened by this R export.