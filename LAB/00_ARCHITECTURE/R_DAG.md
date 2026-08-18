# R DAG — Stage-One Real Construction (Current Frontier)

**Status:** ACTIVE — construction in progress  
**Input:** `Q-BLOCK-002 — Accepted Stage-One Rational Interface`  
**Governing specification:** `BOMA-R-ACCEPT-001`  
**Real domain acceptance:** **NOT YET**

## Route selection

```text
Q-BLOCK-002
      │
      ▼
shared qLT / qPos / qClose gateway
      │
      ├──────────── Route D — Dedekind LowerCut / CutEquiv
      │                         │
      │                         ├── principal Q embedding probe PASS
      │                         ├── Q density dependency explicit / PASS
      │                         └── union/LUB raw completeness skeleton PASS
      │
      └──────────── Route C — CauchySeq / CauchyEquiv
                                └── constant Q embedding probe PASS
```

`R-DP-001`:

```text
Route D selected for Stage One
Route C retained as first-class later branch
```

Selection reason: both representation/embedding probes pass, while Route D additionally has a verified direct least-upper-bound-by-union construction skeleton.

## Formal identity

```text
LowerCut + CutEquiv
        │
        ├──────── external CutEquiv identity ───► RETAINED
        │
        └──────── quotient identity ────────────► SELECTED
                         │
                         ▼
                RBOMA := Quotient cutSetoid
                         │
                         ├── rOfQ injective
                         └── rOfQ order-reflecting
```

`R-DP-002` selected quotient identity after V5 `32180783725` PASS.

No `funext`, `propext`, `Classical`, or `Choice` was needed merely to form the quotient identity / rational embedding interface.

## Order logic boundary

The selected quotient inclusion order has two proof regions:

```text
CONSTRUCTIVE REGION
  rLE reflexive
  rLE transitive
  rLE antisymmetric
  CutComparability → rLE totality

EXPLICIT CLASSICAL BOUNDARY
  R-LOGIC-BR-001
  CutComparability := ∀A B, CutLE A B ∨ CutLE B A
  proof provenance: Classical.em
```

Split V5 `32181726522`:

```text
constructive order core PASS
isolated classical comparability witness PASS
```

`R-DP-003` therefore does **not** classify the whole R route as classical. The explicit classical boundary is the disjunctive comparability theorem for arbitrary lower cuts under the current cut specification.

## Formal completeness

```text
family F : RBOMA → Prop
nonempty + explicit upper bound
          │
          ▼
witness-based union of all representative lower regions
          │
          ▼
valid LowerCut
          │
          ▼
formal quotient class s : RBOMA
          │
          ▼
least-upper-bound theorem
```

`R-COMP-BLOCK-001`:

```text
formal Dedekind LUB completeness
V5 32182124371 PASS
RA-11 PASS
```

Important dependency fact:

```text
R-COMP-BLOCK-001 does NOT consume R-LOGIC-BR-001.
```

Thus formal Dedekind completeness remains in the constructive proof region even though total comparability has explicit classical proof provenance.

## Verified real addition

`R-ADD-BLOCK-001` is now PASS / ACTIVE.

Architecture:

```text
LowerCut × LowerCut
      │
      ▼
cutAdd
q ∈ A+B iff ∃a∈A, b∈B, q < a+b
      │
      ▼
CutEquiv-respect theorem
      │
      ▼
rAdd : RBOMA → RBOMA → RBOMA
      │
      ├── Q embedding preserves addition
      ├── commutative
      ├── associative
      └── rZero left/right identity
```

Verification:

```text
cut validity + representative independence + quotient lift   32183597094 PASS
principal Q addition + rOfQ preservation                     32183864915 PASS
RBOMA commutativity + associativity + zero identities         32184188077 PASS
```

`PDSA-R-005` records two failed intermediate V5 attempts as proof/formalization errors rather than mathematical failures:

```text
rewrite orientation
implicit LowerCut.rounded argument
```

Acceptance effect:

```text
RA-06 = PASS
RA-10 addition preservation = PASS
```

Addition does not consume the classical cut-comparability witness.

## Verified negation candidate — inverse theorem still gated

A separate candidate is verified:

```text
q ∈ cutNeg(A)
iff
∃ r ∉ A, q < -r
      │
      ▼
CutEquiv respect
      │
      ▼
rNeg : RBOMA → RBOMA
      │
      └── rNeg(rOfQ q) = rOfQ(-q)
```

Canonical unit:

```text
R-NEG-CANDIDATE-BLOCK-001
```

V5:

```text
32184767097 PASS
```

Important non-claim:

```text
rAdd x (rNeg x) = rZero
```

has **not** yet been certified. Therefore `RA-05` remains open.

## Current mathematical frontier — R-DP-004

Study of the additive-inverse theorem exposed a rational approximation obligation stronger than mere order density.

Required shape:

```text
for every LowerCut A and eps > 0,
find a ∈ A and r ∉ A with
0 < r-a < eps.
```

This is isolated as:

```text
R-DP-004 — Rational Archimedean Approximation Gateway
PDSA-R-006 — ACTIVE
```

Two routes are being compared:

```text
Route A — derive a reusable Archimedean theorem for accepted QBOMA,
          then derive cut bracketing;

Route B — derive cut bracketing directly from the explicit fraction model.
```

The first Route-A probe targets:

```text
∀q : QBOMA, ∃n : N_BOMA, q ≤ qOfN(n).
```

No route is promoted until claim-level V5 passes.

## Reverse-engineering schedule

Reverse engineering is now part of the canonical Stage-One schedule:

`LAB/00_ARCHITECTURE/REVERSE_ENGINEERING_SCHEDULE.md`

### RE-R-001

Trigger:

```text
immediately after RA-22 ACCEPT
and before canonical C construction begins
```

Backward audit:

```text
accepted R
  ↓
ordered-field interface
  ↓
real algebra
  ↓
Dedekind identity / completion / order
  ↓
Q embedding / density / approximation gateways
  ↓
accepted Q
```

Dependencies will be classified as structural, Dedekind-route-specific, logical, proof-engineering-only, reusable, or branch candidates.

### RE-STAGE1-001

Trigger after accepted C and before broad Stage-II branching:

```text
C → R → Q → Z → N → pre-numerical layer → metatheory
```

The resulting reverse evidence will select the initial Stage-II branch experiments.

## Verification evidence so far

```text
R representation D/C probes                    32179389952 PASS
shared Q-density gateway                        32179943679 PASS
Dedekind raw LUB skeleton                       32180113386 PASS
D/C rational embedding probes                   32180417291 PASS
Dedekind quotient identity                      32180783725 PASS
Dedekind order-logic split                      32181726522 PASS
formal RBOMA Dedekind completeness              32182124371 PASS
Dedekind addition                               32183597094 PASS
Q embedding preserves real addition             32183864915 PASS
real additive commutative-monoid laws           32184188077 PASS
Dedekind negation candidate                     32184767097 PASS
Q Archimedean approximation gateway             ACTIVE / PENDING
Lean                                             4.32.1
```

## Current acceptance status

```text
RA-01 explicit carrier             CONSTRUCTED
RA-02 formal identity              PASS / R-DP-002 RESOLVED
RA-03 Q embedding                  PASS at identity/order interface
RA-04 zero / one                   PARTIAL — zero additive role PASS; one awaits multiplication
RA-05 negation                     CANDIDATE VERIFIED; additive inverse PENDING R-DP-004
RA-06 addition                     PASS / R-ADD-BLOCK-001
RA-07 multiplication               NOT BUILT
RA-08 nonzero inverse              NOT BUILT
RA-09 ordered-field laws           PARTIAL
RA-10 Q structure preservation     PARTIAL — order + addition + negation-candidate preservation PASS
RA-11 selected completeness        PASS / R-COMP-BLOCK-001
RA-12 Q density in RBOMA           NOT YET DISCHARGED
RA-13 Archimedean characterization NOT BUILT
RA-14 representation adequacy      PARTIAL
RA-15 completion route             PASS / R-DP-001 RESOLVED
RA-16 multi-route convergence      NOT TRIGGERED AS MULTI-CARRIER GATE SO FAR
RA-17 completion scope             Dedekind LUB contract selected / PASS theorem
RA-18 hidden standard Real audit   ongoing
RA-19 commitment ledger            ongoing
RA-20 claim-level V5               ongoing
RA-21 integration                  NOT ELIGIBLE
RA-22 acceptance                   NOT ELIGIBLE
```

## Next canonical work

```text
1. evaluate Route-A natural-upper-bound probe;
2. build the smallest reusable Archimedean Q interface that yields cut bracketing;
3. use it explicitly to certify rAdd x (rNeg x) = rZero;
4. close RA-05 and the additive-group interface;
5. only then proceed to sign-sensitive multiplication and nonzero inverse;
6. complete RA-12 / RA-13 before final R integration;
7. after RA-22, execute RE-R-001 before constructing canonical C.
```

No complex-number construction is permitted before `RA-22 ACCEPT` and the scheduled `RE-R-001` reverse audit.
