# R-BLOCK-001 — Accepted Stage-One Real Interface

- **Operational Status:** **ACTIVE — ACCEPTED**
- **Epistemic Status:** **MIXED FORMALIZATION CHOICE + DERIVED CERTIFIED PACKAGE**
- **Acceptance:** `RA-22 = ACCEPT`
- **Depends on:** selected Dedekind route, `R-J-002`, `PDSA-R-014`
- **Input domain:** `Q-BLOCK-002 — Accepted Stage-One Rational Interface`

## Purpose

Provide the canonical downstream interface for the accepted BOMA Stage-One real domain while preserving the Dedekind/Cauchy route decision, quotient-identity choice, logical boundaries, proof-engineering lineage, and narrower construction Blocks.

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

The active build has zero external Lake packages; no standard-library real carrier/completeness theorem is used as the definition or construction of `RBOMA`.

## Preserved alternatives

Stage One selected Dedekind lower cuts through `R-DP-001` while retaining the Cauchy route as a first-class later branch.

Other retained questions include:

```text
quotient identity versus alternative identity realizations
Dedekind versus Cauchy completion
sign-free multiplication versus retained alternative multiplication architectures
reusable Q approximation components versus route-specific Dedekind proof machinery
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

Closure record:

`LAB/PDSA/PDSA-R-014_STAGE_ONE_REAL_CLOSURE.md`

## Downstream permission

`R-BLOCK-001` is the accepted Stage-One R export.

However, it does **not** yet permit canonical complex-number construction. Governance requires:

```text
R-BLOCK-001 accepted
   ↓
RE-R-001 local real-stage reverse engineering
   ↓
RE-R-001 closure
   ↓
canonical C stage may open
```

This preserves the scheduled reverse-engineering gate before R-stage commitments propagate into C.
