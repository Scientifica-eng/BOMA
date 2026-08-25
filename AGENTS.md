# AGENTS.md — BOMA continuation rules

Mandatory for AI agents and other automated collaborators.

## 1. Read current state before acting

Read, in order:

```text
README.md
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
LAB/00_ARCHITECTURE/TRUSTED_BASE.md
LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md
```

Then read stage-specific acceptance, Claim, closure, PDSA, and V5 records.
Historical records preserve provenance; they do not override later synchronized authorities.

## 2. Current structural state

```text
Pre-numerical layer   CALIBRATED
N-Core                N-BLOCK-007 ACCEPTED
N-Arithmetic          N-ARITH-BLOCK-001 ACCEPTED
Z                     Z-BLOCK-002 ACCEPTED
Q                     Q-BLOCK-002 ACCEPTED
R                     R-DP-001 SELECTS Dedekind / R-BLOCK-001 ACCEPTED
R alternative         R-ROUTE-C / Cauchy PERMANENT VERIFIED / NON-SELECTED
R alt Junction        ST2-EXP-003-R-J-001 / NON-ACCEPTANCE
C production R→C      BOMA-C-R-DEP-001 / exact sixteen-property surface
C                     C-DP-001 SELECTS C-ROUTE-P / C-BLOCK-002 / CA-20 ACCEPTED
C comparison          C-COMPARE-BLOCK-001 / five scalar ops + coordinate laws
C alternative         C-ROUTE-Q PERMANENT VERIFIED / NON-SELECTED
C alt Junction        ST2-EXP-002-PQ-J-001 / NON-ACCEPTANCE
ST2-EXP-001..003+011  CLOSED / PASS / VERIFIED LESSONS INTEGRATED
ACTIVE EXPERIMENT     ST2-EXP-004
004 PLAN              FROZEN / 89c9dc9154e7ca469e5c94c177be223205ee9dbd
004 ORIGIN            DECISION_POINT / R-DP-003
004 CURRENT GATE      GATE A — EXACT F-04 DEPENDENCY MAP
```

## 3. Learning-to-Construction rule

A successful experiment may, after Study/Act, lifecycle closure, and explicit
owner authorization, be integrated into the permanent Construction DAG as
**verified knowledge**.

Allowed integration includes:

```text
refine dependency contract
refine an existing Block's dependency classification
retain permanent verified alternative branch
retain permanent verified non-acceptance Junction
expose representation-independent invariant
record sensitivity/genericity condition
```

Never infer:

```text
permanent DAG visibility = SELECTS
permanent DAG visibility = accepted export
verified alternative = canonical producer
successful experiment = automatic promotion
integrated dependency knowledge = accepted implementation refactor
shared generic interface = Junction
```

The Learning Graph must continue to preserve Frozen Plans, failed/superseded
attempts, exact evidence, Study/Act, lifecycle, merge, and integration decisions.

## 4. Exact C-production R→C mathematical dependency rule

`ST2-EXP-001` proved that selected C production meaning survives over exactly
these sixteen R properties:

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

This is the canonical **production** mathematical surface of
`BOMA-C-R-DEP-001`.

Formal witness:

```text
BOMA.C.StageTwo.NarrowRInterface001.NarrowROrderedFieldCertificate
BOMA.C.StageTwo.NarrowRInterface001.narrowRFromAcceptedProducers
```

The accepted C Lean source may still inherit a larger
`RStageIntegrationCertificate` bundle. Do not confuse that formal/provenance
over-bundling with mathematical necessity.

## 5. Exact C comparison dependency rule — ST2-EXP-011

Do **not** conflate the production surface above with the direct mathematical
closure of `C-COMPARE-BLOCK-001 / C-CL-COMPARE-001`.

The integrated comparison scalar operations are:

```text
zero
one
neg
add
mul
```

with explicit quadratic coordinate laws:

```text
coord
coordinateGeneration
coordinateUnique
coordinateZero
coordinateOne
coordinateReal
coordinateImag
coordinateNeg
coordinateAdd
coordinateMul
```

The comparison proof does not directly require scalar order, completeness,
density, Archimedean structure, a general field-law bundle, or
inverse-existence/uniqueness fields.

Do not infer from this narrower surface that the **whole C producer** needs only
five scalar operations. The 16-property production contract remains canonical.

The accepted RBOMA adapter preserves old `Related` semantics definitionally.
The native RCBOMA/H6 adapter verifies instantiability without H5 `cToD` or
selected Dedekind implementation transport.

The accepted `CQuadraticComparison001` source has **not** been replaced by the
experimental generic source. Any accepted-source refactor requires a separate
controlled change and accepted-stage regression evidence.

## 6. Relation/function firewall

For quadratic comparison:

```text
relation totality + uniqueness
!=
chosen functional comparison
```

An actual comparison function requires explicit `CoordinateExtractor` data.
Never introduce a global coordinate selector or inverse selector as a
convenience without a separately declared logical commitment and controlled
change.

ST2-EXP-011 exact logical classification:

```text
generic comparison roots   NO AXIOMS
native H6 roots             [propext, Quot.sound]
accepted RBOMA adapter      [propext, Classical.choice, Quot.sound]
```

The accepted-adapter Choice cost is inherited provenance, not generic-interface
necessity.

## 7. Decision / alternative discipline

### R

```text
R-DP-001 SELECTS R-ROUTE-D / Dedekind
R-BLOCK-001 is accepted
R-ROUTE-C / Cauchy is permanent verified alternative
ST2-EXP-003-R-J-001 is permanent verified non-acceptance Junction
R-DP-003 remains the accepted localized-classical total-order decision
```

`ST2-EXP-004` investigates `R-DP-003`; activation does not change the accepted
Decision Point.

### C

```text
C-DP-001 SELECTS C-ROUTE-P
C-BLOCK-001 is selected producer
C-COMPARE-BLOCK-001 owns C-CL-COMPARE-001
C-J-001 is accepted integration Junction
C-BLOCK-002 / CA-20 is accepted export
C-ROUTE-Q is permanent verified alternative
ST2-EXP-002-PQ-J-001 is permanent verified non-acceptance Junction
```

Do not conflate `C-J-001` with the P/Q alternative-construction Junction, and do
not manufacture a Junction merely because multiple producers instantiate a
shared interface.

## 8. ST2-EXP-004 immutable experimental boundary

Exact frozen authority:

```text
accepted reference  50f3031b8d2657cbe0710e73e5935d997d40e49b
accepted tree       e4842acdf2b08c8db54b45d0798c36ee7565f351
candidate dossier   fd51041857d07cbf8e489c8683a907ea29866b17
Frozen Plan commit  89c9dc9154e7ca469e5c94c177be223205ee9dbd
Frozen Plan         LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
```

**Never edit the Frozen Plan file after its freeze commit.** Later corrections,
failures, Gate results, or Study/Act belong in separate files.

Single changed factor:

```text
remove only the selected F-04 provider:
  BOMA.R.DedekindOrderClassical001.cutComparability_classical
  BOMA.R.DedekindOrderClassical001.rLE_total_classical
```

Controls that must remain unchanged:

```text
R-DP-001 / R-DP-002
LowerCut / CutEquiv / cutSetoid / RBOMA
CutLE / rLE definitions
rLE_refl / rLE_trans / rLE_antisymm
rOfQ and accepted R operation definitions
R-DP-004 / R-DP-005 / R-DP-006 architecture
accepted Q/R/C manifests and sources
F-05 finite membership/bracketing classical provider
F-06 positive representative classical provider
F-07 rational-density classical provider
C-DP-001 / C-J-001 / CA-20
```

Therefore:

```text
NO F-04 dependency ≠ fully constructive R
conditional theorem from hComp : CutComparability ≠ constructive recovery
failure to recover totality ≠ impossibility theorem
```

## 9. ST2-EXP-004 Gate discipline

The current gate is **Gate A**. Before any alternative mathematics is written,
measure exact declaration descendants of:

```text
BOMA.R.DedekindOrderClassical001.cutComparability_classical
BOMA.R.DedekindOrderClassical001.rLE_total_classical
```

Required classification vocabulary:

```text
F04_DIRECT
F04_TRANSITIVE
F04_FREE
OTHER_CLASSICAL_ONLY
```

Gate A must cover the accepted R Claim families, all nine accepted C Claim
families, `narrowRFromAcceptedProducers`, and the ST2-EXP-011 generic comparison
root as a planned F-04-negative control.

Known direct references before measurement include:

```text
RStageIntegrationCertificate.orderTotal
rPosNeg_decomposition
NarrowROrderedFieldCertificate.orderTotal
```

Do not extrapolate from those direct references to unmeasured Claim closures.

## 10. Stage-Two lifecycle rule

Closed and integrated:

```text
ST2-EXP-001
ST2-EXP-002
ST2-EXP-003
ST2-EXP-011
```

Current active cycle:

```text
ST2-EXP-004 = ACTIVE / PLAN FROZEN / GATE A
```

The single-active slot is occupied. Do not activate another experiment until an
explicit lifecycle disposition releases 004.

Historical closure is monotone evidence. A later active experiment must not
rewrite closed Plan/Study/Act/run/merge/integration records.

## 11. ST2-EXP-003 historical facts

The permanent Cauchy branch was learned through `ST2-EXP-003`, which remains
`CLOSED / PASS / H1-H6 EXACT PASS`.

```text
final head                                   3d4ed58e5d88b2a0bd84b3958cac2c8572385152
Independent Cauchy Real Route                32727267231 PASS
Dedekind-Cauchy Comparison / R Junction      32727267177 PASS
Cauchy Quadratic Rebuild                      32727267183 PASS
```

Do not rewrite those records to pretend Cauchy was part of the original accepted path.

## 12. ST2-EXP-011 historical facts

```text
Frozen accepted main   b49826e58261a71634cd12756e8afda28920088f
Frozen Plan            5cc05ef1bea8e88787041c3bc30dd0aecf5412d4
final closed head      632a7134f26daf9dd781e3546804941f429a4246
exact run              32754345656 PASS
artifact               9530261359
artifact sha256        d93c6f1ec34858f6cbc1556e92b86a241f6399e6a3cf894204608a51d63de2e5
research merge         72394878854aa69e865d17567959bec1daa70e6d
```

The merge added ancestry with zero file drift. The 011 lifecycle auditor must
continue to prove these identities while 004 is active.

## 13. C acceptance-first rule

Accepted C remains the unique quadratic real-coordinate field presentation at
the declared scope:

```text
faithful selected-R embedding
commutative-field-strength behavior
distinguished I
I² = -1
unique a+bI coordinates
non-real-collapse consequence
comparison adequacy
same-carrier integration
```

Do not silently strengthen acceptance to algebraic closure, FTA, analytic
completeness, total order, or built-in Complex identity.

## 14. Status authority

When current-state documents conflict, prefer:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
LAB/PDSA/candidates/ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME_CANDIDATE.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
relevant DAG / Block / acceptance / Claim records
claim-level V5 evidence
README.md / AGENTS.md
historical checkpoints
```

## 15. Method and topology

Use PDSA. Do not assume a linear chain.

Classify forks as:

```text
parallel dependency
Decision Point branch
exploratory branch
permanent verified alternative branch
```

A Junction requires explicit compatibility/reconvergence evidence.

Never infer:

```text
same contribution ⇒ same history
selected route ⇒ universal necessity
visual meeting ⇒ Junction
permanent verified route ⇒ accepted route
shared interface ⇒ reconvergence Junction
```

## 16. Brick / Block / Junction / Claim discipline

Keep architectural types distinct:

```text
Brick          smallest independently reviewable/replaceable/branchable construction unit
Block          coherent package of Bricks/internal components
Junction       verified compatibility/reconvergence result
Decision Point explicit non-derived route selection
Configuration  constructed object/interface configuration
Claim          assertion layer independent of Brick/Block granularity
```

Do not manufacture units for symmetry or to make a diagram look tidy.

## 17. Accepted-stage discipline

An accepted Block/stage may be modified only with explicit impact analysis
against its acceptance contract and V5 lineage.

An active research experiment does **not** silently weaken, strengthen,
reinterpret, or replace accepted Claims/producers.

## 18. Logical and Claim-transparency discipline

Record localized logical commitments and their actual source provenance.
Absence of a downstream `Classical` token does not prove independence from an upstream classical producer.

For every measured/promoted Claim preserve:

```text
Claim ID
statement / role
producer
mathematical dependencies
logical dependencies
representation dependencies
formalization dependencies
supporting lemmas
Lean declaration/source
verification evidence
alternative producer/branch
necessity classification
sensitivity/reopening condition
```

## 19. Verification rules

V5 results are theorem/unit specific. A monolithic type-check is not an
acceptance or experiment-completion gate.

For active `ST2-EXP-004`:

```text
verify Frozen Plan byte immutability from 89c9dc9154...
verify exact current head
prove accepted manifests/sources unchanged from 50f3031b...
measure Gate-A declaration closures before Gate-B mathematics
preserve F-05/F-06/F-07 as controls
record exact workflow/artifact identity for each promoted Gate result
```

Pinned toolchain:

```text
leanprover/lean4:v4.32.1
Lake packages: none
```

## 20. GitHub continuation rule

Do not conduct active experiment work on `main`. `ST2-EXP-004` remains on its
separate branch from frozen accepted `main=50f3031b...`.

Do not merge experiment or architecture changes into `main` without the
appropriate explicit owner authority and exact-head verification.
