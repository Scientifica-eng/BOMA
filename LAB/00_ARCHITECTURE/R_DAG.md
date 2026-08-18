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

`R-DP-003` therefore does **not** classify the whole R route as classical. The first explicit classical boundary is the disjunctive comparability theorem for arbitrary lower cuts under the current cut specification.

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

## Current algebra frontier

A candidate Dedekind addition has been defined in:

`LAB/payloads/lean/RStage/RDedekindAddition.lean`

Architecture:

```text
LowerCut × LowerCut
      │
      ▼
cutAdd
q ∈ A+B iff ∃a∈A, b∈B, q < a+b
      │
      ▼
CutEquiv respect
      │
      ▼
quotient lift rAdd : RBOMA → RBOMA → RBOMA
```

The first V5 exposed a proof-engineering rewrite-direction error in a strict-order helper. The helper was corrected without changing `cutAdd`, its intended semantics, or the quotient lift.

**Do not promote real addition until the corrected V5 evidence is observed as PASS.**

## Verification evidence so far

```text
R representation D/C probes             32179389952 PASS
shared Q-density gateway                 32179943679 PASS
Dedekind raw LUB skeleton                32180113386 PASS
D/C rational embedding probes            32180417291 PASS
Dedekind quotient identity               32180783725 PASS
Dedekind order-logic split               32181726522 PASS
formal RBOMA Dedekind completeness       32182124371 PASS
Dedekind addition                         RECHECK PENDING
Lean                                      4.32.1
```

## Current acceptance status

```text
RA-01 explicit carrier             CONSTRUCTED candidate
RA-02 formal identity              PASS / R-DP-002 RESOLVED
RA-03 Q embedding                  PASS at identity/order interface
RA-04 zero / one                   candidate spellings exist
RA-05 negation                     NOT BUILT
RA-06 addition                     ACTIVE / V5 RECHECK
RA-07 multiplication               NOT BUILT
RA-08 nonzero inverse              NOT BUILT
RA-09 ordered-field laws           PARTIAL — total-order logic resolved, field not built
RA-10 Q structure preservation     PARTIAL — order/identity proven; field preservation pending
RA-11 selected completeness        PASS
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
1. observe corrected addition V5;
2. if PASS, prove rOfQ addition preservation and additive laws;
3. construct real negation as a separate gate;
4. only then proceed to sign-sensitive multiplication/inverse;
5. preserve the explicit logical and representation branches throughout.
```

No complex-number construction is permitted before `RA-22 ACCEPT`.
