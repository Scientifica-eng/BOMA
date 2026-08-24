# BOMA — Project Handoff / START HERE

BOMA builds a transparent, traceable mathematical architecture from a declared
pre-numerical constructional layer toward standard number systems.

Governing method: **PDSA — Plan → Do → Study → Act**. Historical `PDCA`
identifiers are provenance only.

## Current accepted spine

As of 2026-08-24:

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

The accepted spine is unchanged by the completed Stage-Two experiments.

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
ACTIVE EXPERIMENT = NONE
NEXT OWNER-SEQUENCED EXPERIMENT = ST2-EXP-004 / NOT ACTIVE / NO FROZEN PLAN
```

`ST2-EXP-004` may begin only after the current architecture Act is merged,
`main` is synchronized and verified, and the current repository is re-read. It
then requires a new immutable Frozen Plan from that exact `main` and an
independent branch.

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
from it by zero files.

## Source-of-truth order

When current-state documents disagree, use this order unless a later explicit
governance record supersedes it:

1. `LAB/PDSA/STATUS.md`
2. `LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md`
3. `LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`
4. `LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json`
5. `LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md`
6. `LAB/00_ARCHITECTURE/ARCHITECTURE.md`
7. `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`
8. `LAB/00_ARCHITECTURE/REGISTRY.md`
9. `LAB/00_ARCHITECTURE/GRAPH.md`
10. `LAB/00_ARCHITECTURE/DECISION_LEDGER.md` / `JUNCTION_LEDGER.md`
11. relevant DAG / Block / acceptance / Claim records and exact V5 evidence
12. onboarding summaries such as this README and `AGENTS.md`
13. dated historical PDSA/checkpoint/branch artifacts for provenance

Historical documents remain valid records of their own state at their own date;
they do not override a later synchronized current-state authority.

## Mandatory reading order

Before canonical or Stage-Two work, read:

```text
README.md
AGENTS.md
LAB/PDSA/STATUS.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md
LAB/PDSA/candidates/README.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/00_ARCHITECTURE/GRAPH.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
LAB/00_ARCHITECTURE/R_DAG.md
LAB/00_ARCHITECTURE/C_R_DEPENDENCY_CONTRACT.md
LAB/00_ARCHITECTURE/C_DAG.md
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
reconvergence with the selected producer.

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

Historical exact evidence and lifecycle records remain indexed through the
experiment register and Stage-Two origin ledger.

## Future experiment candidates

The controlled candidate inventory is maintained in:

`LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md`.

Candidate discoveries follow:

`LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md`.

`ST2-EXP-004` is owner-sequenced next but remains **not active** and has **no
Frozen Plan** until this integration is merged and current `main` is re-read.
Other documented candidates remain unstarted absent separate authorization.

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
preserve accepted C comparison source until a separate accepted-source refactor is authorized
preserve all Frozen Plans, failures, Study/Act, lifecycle, merge, and exact evidence
ACTIVE EXPERIMENT = NONE
finish/verify the current architecture integration
then re-read synchronized main before freezing ST2-EXP-004
```
