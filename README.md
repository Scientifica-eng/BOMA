# BOMA — Project Handoff / START HERE

BOMA builds a transparent, traceable mathematical architecture from a declared
pre-numerical constructional layer toward standard number systems.

Governing method: **PDSA — Plan → Do → Study → Act**. Historical `PDCA`
identifiers are provenance only.

## Current accepted spine

As of 2026-08-25:

```text
framework-neutral pre-numerical layer   CALIBRATED
        ↓
N-BLOCK-007                             ACCEPTED N-Core
        ↓
N-ARITH-BLOCK-001                       ACCEPTED N-Arithmetic
        ↓
Z-BLOCK-002                             ACCEPTED Z
        ↓
Q-BLOCK-002                             ACCEPTED Q
        ↓
R-DP-001 SELECTS R-ROUTE-D / Dedekind
        ↓
R-BLOCK-001                             ACCEPTED R
        ↓
BOMA-C-R-DEP-001                        exact 16-property C-production boundary
        ↓
C-DP-001 SELECTS C-ROUTE-P
        ↓
C-BLOCK-001
        ↓
C-COMPARE-BLOCK-001                     scalar-generic comparison boundary integrated
        ↓
C-J-001 → C-BLOCK-002
        ↓
CA-20                                   ACCEPTED C
```

The accepted spine is unchanged. `ST2-EXP-004` is an active research cycle and
has not changed any accepted producer, route, Claim, or export.

## Permanent verified alternatives learned through Stage Two

Owner-authorized Learning-to-Construction Acts integrate durable architectural
knowledge into the permanent Construction DAG while preserving all experimental
provenance.

```text
R-DP-001
   ├── SELECTS R-ROUTE-D / Dedekind → R-BLOCK-001 ACCEPTED
   └── R-ROUTE-C / Cauchy → PERMANENT VERIFIED ALTERNATIVE
                              ↓
                       ST2-EXP-003-R-J-001
                       R-FIELD-ISOMORPHISM / NON-ACCEPTANCE

C-DP-001
   ├── SELECTS C-ROUTE-P → C-BLOCK-001 → C-COMPARE-BLOCK-001
   │                      → C-J-001 → C-BLOCK-002 ACCEPTED
   └── C-ROUTE-Q → PERMANENT VERIFIED ALTERNATIVE
                     ↓
              ST2-EXP-002-PQ-J-001
              R-FIELD-ISOMORPHISM / NON-ACCEPTANCE
```

Permanent graph visibility does **not** mean selection or acceptance.

## Two different C←R dependency surfaces

### Production surface — ST2-EXP-001

`ST2-EXP-001` proved that production of the selected C meaning needs exactly a
narrow sixteen-property real interface rather than the entire historical
accepted R integration bundle:

```text
orderTrans
orderAntisymm
orderTotal
nontrivial
addComm
addAssoc
addZeroLeft
addInverseRight
addTranslateOrderIff
negOrderReversing
mulComm
mulAssoc
mulOneLeft
distribRight
orderMulNonneg
inverseExists
```

Authority: `BOMA-C-R-DEP-001`.

Formal witness:

```text
BOMA.C.StageTwo.NarrowRInterface001.NarrowROrderedFieldCertificate
BOMA.C.StageTwo.NarrowRInterface001.narrowRFromAcceptedProducers
```

The accepted C Lean implementation may still carry a larger bundled R ancestry.
That excess is formalization/provenance over-bundling, not mathematical
necessity.

### Comparison surface — ST2-EXP-011

`ST2-EXP-011` studied only the scalar boundary of `C-COMPARE-BLOCK-001` and
proved a smaller direct comparison interface:

```text
scalar operations:
  zero / one / neg / add / mul

quadratic coordinate laws:
  coord
  coordinateGeneration / coordinateUnique
  coordinateZero / coordinateOne / coordinateReal / coordinateImag
  coordinateNeg / coordinateAdd / coordinateMul
```

Authority: `C-COMPARE-BLOCK-001 / C-CL-COMPARE-001`.

This comparison surface is **not** a replacement for the sixteen-property
production surface. They answer different questions.

The accepted RBOMA adapter preserves the existing `Related` meaning
definitionally. A native RCBOMA/H6 adapter is verified without H5 `cToD` or
selected Dedekind implementation transport. Functional comparison still
requires explicit `CoordinateExtractor` data; no global coordinate or inverse
selector is introduced.

The experimental `ST2Exp011*.lean` sources remain research-only. The generic
factoring is a future accepted-source refactor candidate, not an implicit
replacement of accepted `CQuadraticComparison001`.

## Learning-to-Construction rule

A successful experiment may, after Study/Act, lifecycle closure, and explicit
owner authorization, feed verified knowledge into the permanent Construction
DAG by:

```text
refining a dependency contract;
refining an existing Block's dependency classification;
retaining a verified non-selected route;
retaining a verified non-acceptance Junction;
exposing a representation-independent invariant;
recording a sensitivity/genericity condition.
```

But:

```text
permanent DAG visibility ≠ SELECTS
permanent DAG visibility ≠ ACCEPTED EXPORT
successful experiment ≠ automatic acceptance promotion
integrated dependency knowledge ≠ accepted implementation refactor
```

The Learning Graph continues to preserve how every integrated fact was learned.

Integration authorities:

```text
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
```

## Current Stage-Two lifecycle

```text
ST2-EXP-001  CLOSED / PASS / production dependency lesson integrated
ST2-EXP-002  CLOSED / PASS / Route-Q + Junction integrated
ST2-EXP-003  CLOSED / PASS / H1-H6 EXACT / Cauchy + Junction integrated
ST2-EXP-011  CLOSED / PASS / comparison-interface lesson integrated
ST2-EXP-004  ACTIVE / PLAN FROZEN / GATE A NEXT
```

`ST2-EXP-004` exact authority:

```text
accepted reference  50f3031b8d2657cbe0710e73e5935d997d40e49b
accepted tree       e4842acdf2b08c8db54b45d0798c36ee7565f351
candidate dossier   fd51041857d07cbf8e489c8683a907ea29866b17
Frozen Plan commit  89c9dc9154e7ca469e5c94c177be223205ee9dbd
origin              DECISION_POINT / R-DP-003
current gate        GATE A — EXACT F-04 DEPENDENCY MAP
```

The Frozen Plan is immutable. The only changed factor is the F-04 provider of
Dedekind cut comparability/real-order disjunctive totality. Accepted carrier,
identity, `rLE`, operations, Q/R/C manifests, and F-05/F-06/F-07 remain controls.

## ST2-EXP-004 scientific boundary

Baseline F-04 provider:

```text
BOMA.R.DedekindOrderClassical001.cutComparability_classical
BOMA.R.DedekindOrderClassical001.rLE_total_classical
```

The alternative must preserve:

```text
LowerCut / CutEquiv / cutSetoid / RBOMA
CutLE / rLE
rLE_refl / rLE_trans / rLE_antisymm
accepted scalar/field operation definitions
all accepted Q/R/C source manifests
F-05 / F-06 / F-07 as explicit controls
```

Known direct references before Gate A include:

```text
RStageIntegrationCertificate.orderTotal
rPosNeg_decomposition
ST2-EXP-001 NarrowROrderedFieldCertificate.orderTotal
```

These are not yet a complete Claim-impact result. Gate A must compute exact
formal declaration closures before alternative mathematics is written.

Removing F-04 must not be described as making all accepted R constructive;
other localized classical commitments are explicitly outside this experiment's
changed factor.

## Canonical acceptance remains unchanged

```text
R-DP-001 selected route       R-ROUTE-D / DEDEKIND
accepted R integration        R-J-002
accepted R export             R-BLOCK-001
C-DP-001 selected route       C-ROUTE-P
selected C producer           C-BLOCK-001
comparison Claim owner        C-COMPARE-BLOCK-001
accepted C integration        C-J-001
accepted C export             C-BLOCK-002 / CA-20 ACCEPT
```

Permanent alternatives remain non-accepted:

```text
R-ROUTE-C / CAUCHY
  PERMANENT VERIFIED ALTERNATIVE / NON-SELECTED / NOT ACCEPTED
  Junction: ST2-EXP-003-R-J-001

C-ROUTE-Q
  PERMANENT VERIFIED ALTERNATIVE / NON-SELECTED / NOT ACCEPTED
  Junction: ST2-EXP-002-PQ-J-001

H6 Cauchy-native C core
  PERMANENT DOWNSTREAM ROBUSTNESS EVIDENCE / NOT ACCEPTED
```

## ST2-EXP-011 exact closure and merge provenance

```text
Frozen accepted main
  b49826e58261a71634cd12756e8afda28920088f

Frozen Plan
  5cc05ef1bea8e88787041c3bc30dd0aecf5412d4

final lifecycle-closed exact head
  632a7134f26daf9dd781e3546804941f429a4246

ST2-EXP-011 final run
  32754345656

artifact
  9530261359

sha256
  d93c6f1ec34858f6cbc1556e92b86a241f6399e6a3cf894204608a51d63de2e5

research/lifecycle merge
  72394878854aa69e865d17567959bec1daa70e6d
```

The merge commit has the exact verified head as its second parent and differs
from it by zero files. A later active 004 cycle does not alter this historical
closure.

## Source-of-truth order

When current-state documents disagree, use this order unless a later explicit
governance record supersedes it:

1. `LAB/PDSA/STATUS.md`
2. `LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md`
3. `LAB/PDSA/candidates/ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME_CANDIDATE.md`
4. `LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json`
5. `LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md`
6. `LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md`
7. `LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`
8. `LAB/00_ARCHITECTURE/ARCHITECTURE.md`
9. `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`
10. `LAB/00_ARCHITECTURE/REGISTRY.md`
11. `LAB/00_ARCHITECTURE/GRAPH.md`
12. `LAB/00_ARCHITECTURE/DECISION_LEDGER.md` / `JUNCTION_LEDGER.md`
13. relevant DAG / Block / acceptance / Claim records and exact V5 evidence
14. onboarding summaries such as this README and `AGENTS.md`
15. dated historical PDSA/checkpoint/branch artifacts for provenance

Historical documents remain valid records of their own state at their own date;
they do not override a later synchronized current-state authority.

## Mandatory reading order

Before canonical or active Stage-Two work, read:

```text
README.md
AGENTS.md
LAB/PDSA/STATUS.md
LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
LAB/PDSA/candidates/ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME_CANDIDATE.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/00_ARCHITECTURE/GRAPH.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
LAB/00_ARCHITECTURE/R_DAG.md
LAB/00_ARCHITECTURE/C_R_DEPENDENCY_CONTRACT.md
LAB/00_ARCHITECTURE/C_DAG.md
LAB/10_CONSTRUCTION/decisions/R-DP-003/UNIT.md
LAB/10_CONSTRUCTION/blocks/C-COMPARE-BLOCK-001/UNIT.md
LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md
LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md
LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md
LAB/00_ARCHITECTURE/TRUSTED_BASE.md
```

## Do not linearize BOMA

The construction is a DAG. Valid topology includes vertical dependency,
horizontal independence, parallel contributors, Decision Point branches,
permanent verified alternatives, and split → independent development → verified
reconvergence.

Key invariants:

```text
fork ≠ Decision Point by default
meeting ≠ verified Junction by default
SELECTS ≠ DERIVES
reconvergence preserves provenance
verified alternative ≠ accepted export
shared generic interface ≠ Junction by default
```

## Accepted stage summary

### Natural numbers and arithmetic

```text
NAC-15 = ACCEPT
N-BLOCK-007 = accepted N-Core
NAA-18 = ACCEPT
N-ARITH-BLOCK-001 = accepted N-Arithmetic
```

### Integers

`Z-DP-001` selected signed canonical normal forms while retaining the difference
pair route. `ZA-21 = ACCEPT`; `Z-BLOCK-002` is the accepted integer interface.

### Rationals

`Q-DP-001` selected `QBOMA := Quotient fracSetoid` as a formalization choice,
not a universal mathematical necessity. `QA-23 = ACCEPT`; `Q-BLOCK-002` is the
accepted rational export.

### Reals

`R-DP-001` selects Dedekind for the accepted route. `R-BLOCK-001` remains the
accepted export. The independently completed Cauchy route is a permanent
verified alternative, and `ST2-EXP-003-R-J-001` records explicit field/order
reconvergence with the selected producer. `ST2-EXP-004` studies only the
logical-regime choice at `R-DP-003`; it does not change the selected R route.

### Complex numbers

`C-DP-001` selects `C-ROUTE-P`; `C-BLOCK-001` is the selected producer,
`C-COMPARE-BLOCK-001` owns the accepted comparison Claim, `C-J-001` is the
accepted same-carrier integration Junction, and `C-BLOCK-002 / CA-20` is
accepted. Independently completed `C-ROUTE-Q` is a permanent verified
alternative with `ST2-EXP-002-PQ-J-001`.

## Stage-Two completed experiments

### ST2-EXP-001 — narrow accepted-R production interface

Origin: `DEPENDENCY_EDGE / BOMA-C-R-DEP-001`.  
Result: `CLOSED / PASS`.  
Exact V5: `32593045224`.  
Integrated result: canonical C-production R→C dependency is the exact sixteen-field interface.

### ST2-EXP-002 — independent C representation

Origin: `C-DP-001`.  
Result: `CLOSED / PASS`.  
Final exact V5: `32597346281`.  
Integrated result: `C-ROUTE-Q` and `ST2-EXP-002-PQ-J-001` are permanent verified
alternative architecture; Route P remains selected.

### ST2-EXP-003 — independent Cauchy real completion

Origin: `R-DP-001` above accepted `Q-BLOCK-002`.  
Result: `CLOSED / PASS / H1-H6 EXACT / MATHEMATICAL PASS`.  
Integrated result: Cauchy R and `ST2-EXP-003-R-J-001` are permanent verified
alternative architecture; H6 is permanent downstream robustness evidence;
Dedekind remains selected.

### ST2-EXP-011 — C comparison scalar/interface generalization

Origin: `BLOCK / C-COMPARE-BLOCK-001`.  
Result: `CLOSED / PASS`.  
Integrated result: the direct comparison dependency is scalar
`zero/one/neg/add/mul` plus explicit quadratic coordinate laws; accepted
`Related` semantics are preserved; a native RCBOMA/H6 instance works without H5
transport; relation/function separation remains explicit. No accepted source or
selected route was promoted.

## Active Stage-Two experiment

### ST2-EXP-004 — R total-order logical regime

Origin: `DECISION_POINT / R-DP-003`.  
Status: `ACTIVE / PLAN FROZEN`.  
Frozen reference: `50f3031b8d2657cbe0710e73e5935d997d40e49b`.  
Frozen Plan commit: `89c9dc9154e7ca469e5c94c177be223205ee9dbd`.  
Current gate: `GATE A — EXACT F-04 DEPENDENCY MAP`.

No mathematical result is claimed yet.

## Future experiment candidates

The controlled candidate inventory is maintained in:

`LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md`.

Candidate discoveries follow:

`LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md`.

The single-active slot is occupied by `ST2-EXP-004`. Other documented
candidates remain inactive absent separate authorization and lifecycle release.

## Verification environment

```text
Lean toolchain       leanprover/lean4:v4.32.1
Lake packages        none
fixed toolchain      true
```

V5 workflows verify explicit dependency assemblies and exact-head evidence. A
monolithic type-check alone is not an acceptance or experiment-completion gate.

## Current operational instruction

```text
preserve accepted N → C spine
preserve permanent verified alternatives and their non-selected status
preserve exact 16-property C-production R→C contract
preserve scalar-generic C comparison contract and relation/function firewall
preserve all completed Frozen Plans, failures, Study/Act, lifecycle, merge, and exact evidence
ST2-EXP-004 = ACTIVE / PLAN FROZEN
DO NOT EDIT PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
execute GATE A before writing alternative mathematics
measure F-04 descendants; do not infer full constructivity from F-04 removal
```
