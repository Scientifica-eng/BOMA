# AGENTS.md — BOMA continuation rules

Mandatory for AI agents and other automated collaborators.

## 1. Read current state before acting

Read, in order:

```text
README.md
LAB/PDSA/STATUS.md
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_POLICY_001.json
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_STATE_001.json
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

If an autonomous research program is active, additionally read its exact owner
authorization record. The current autonomous-program state is
`NO_ACTIVE_PROGRAM`; the active `ST2-EXP-004` cycle is instead governed by its
specific direct owner authority and immutable Frozen Plan.

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
AUTONOMOUS PROGRAM    NONE / NO_ACTIVE_PROGRAM
```

## 3. Authority distinction — direct experiment versus autonomous program

Two execution-authority mechanisms exist and must not be conflated:

```text
A. specific direct owner authorization for an experiment
B. exact scope of an OWNER_AUTHORIZED autonomous research program
```

`ST2-EXP-004` currently uses **A**. The autonomous-program machine state remains:

```text
state = NO_ACTIVE_PROGRAM
active_program_id = null
authorized_experiment_queue = []
routine_merge_authorized = false
```

The autonomous program policy remains fail-closed. For autonomous execution:

```text
AMBIGUOUS AUTHORITY => OWNER_REQUIRED
```

Do not manufacture an autonomous queue or routine merge authority from the
existence of the current experiment. Conversely, `NO_ACTIVE_PROGRAM` does not
erase a separate explicit experiment-specific authorization already recorded in
the Stage-Two ledger and Frozen Plan.

## 4. Learning-to-Construction rule

A successful experiment may, after Study/Act and lifecycle closure, and only
under applicable owner authority, be integrated into the permanent Construction
DAG as **verified knowledge**.

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

## 5. Exact C-production R→C mathematical dependency rule

`ST2-EXP-001` proved that selected C production meaning survives over exactly:

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

Do not confuse accepted-source formal ancestry with mathematical necessity.

## 6. Exact C comparison dependency rule — ST2-EXP-011

The integrated direct comparison scalar operations are:

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

This comparison closure is not the whole C-production closure. The accepted
`CQuadraticComparison001` source has not been replaced by the experimental
generic source.

## 7. Relation/function firewall

For quadratic comparison:

```text
relation totality + uniqueness
!=
chosen functional comparison
```

An actual comparison function requires explicit `CoordinateExtractor` data.
Never introduce a global coordinate selector or inverse selector merely for
convenience.

## 8. Decision / alternative discipline

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

## 9. ST2-EXP-004 immutable experimental boundary

Exact frozen authority:

```text
accepted reference  50f3031b8d2657cbe0710e73e5935d997d40e49b
accepted tree       e4842acdf2b08c8db54b45d0798c36ee7565f351
candidate dossier   fd51041857d07cbf8e489c8683a907ea29866b17
Frozen Plan commit  89c9dc9154e7ca469e5c94c177be223205ee9dbd
Frozen Plan blob    1bd97aebb7e36ed5f7647ce29461c9c24b3cc9ba
Frozen Plan         LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
```

**Never edit the Frozen Plan after its freeze commit.** Later corrections,
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

## 10. Baseline-preservation after governance-only main advance

After the Frozen Plan was created, `main` advanced from `50f3031b...` to
`c26854e551c7e6245ef9c13c01a2424def6bfab5` through autonomous-program
governance work.

Exact comparison shows the advance changes governance/handoff/workflow files
only. It changes no accepted Q/R/C source or manifest and no `R-DP-003` file.
Therefore the frozen mathematical baseline is not invalidated. The active branch
must nevertheless inherit the new governance before Gate A so current execution
rules remain synchronized.

This synchronization must not rewrite the Frozen Plan or relabel `50f3031b...`
as though the Plan had originally been frozen from the later governance commit.

## 11. ST2-EXP-004 Gate discipline

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

Gate A must cover accepted R Claim families, all nine accepted C Claim families,
`narrowRFromAcceptedProducers`, and the ST2-EXP-011 generic comparison root as a
planned F-04-negative control.

Known direct references before measurement include:

```text
RStageIntegrationCertificate.orderTotal
rPosNeg_decomposition
NarrowROrderedFieldCertificate.orderTotal
```

Do not extrapolate from these direct references to unmeasured Claim closures.

## 12. Stage-Two lifecycle rule

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

The single-active Stage-Two slot is occupied. Historical closure is monotone
evidence and later cycles must not mutate closed Plan/Study/Act/run/merge records.

## 13. C acceptance-first rule

Accepted C remains the unique quadratic real-coordinate field presentation at
the declared scope. Do not silently strengthen acceptance to algebraic closure,
FTA, analytic completeness, total order, or built-in Complex identity.

## 14. Status authority

When current-state documents conflict, prefer:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_POLICY_001.json
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_STATE_001.json for autonomous-program state only
LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
relevant architecture / DAG / Block / acceptance / Claim records
claim-level V5 evidence
README.md / AGENTS.md
historical checkpoints
```

The autonomous state file may govern autonomous-program execution; it may not
rewrite mathematical or architectural facts, and `NO_ACTIVE_PROGRAM` is not a
statement that every separately owner-authorized experiment must be inactive.

## 15. Verification rules

For active `ST2-EXP-004`:

```text
verify Frozen Plan blob immutability from 89c9dc9154...
verify exact current head
prove accepted Q/R/C manifests/sources unchanged from 50f3031b...
inherit current governance-only main before Gate A
measure Gate-A declaration closures before Gate-B mathematics
preserve F-05/F-06/F-07 as controls
record exact workflow/artifact identity for each promoted Gate result
```

Pinned toolchain:

```text
leanprover/lean4:v4.32.1
Lake packages: none
```

## 16. GitHub continuation rule

Do not conduct active experiment work on `main`. `ST2-EXP-004` remains on its
separate branch from frozen accepted `main=50f3031b...`, synchronized with later
governance-only `main` through explicit ancestry rather than by rewriting its
Frozen Plan.

Do not merge experiment or architecture changes into `main` without exact owner
authority and exact-head verification. No autonomous routine merge authority is
active.
