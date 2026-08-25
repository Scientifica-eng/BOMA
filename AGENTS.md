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
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_003.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
LAB/PDSA/experiments/ST2-EXP-004_FINAL_STUDY_ACT_001.md
LAB/PDSA/experiments/ST2-EXP-004_LIFECYCLE_CLOSURE_001.md
LAB/00_ARCHITECTURE/GRAPH.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/R_DAG.md
LAB/10_CONSTRUCTION/decisions/R-DP-003/UNIT.md
LAB/00_ARCHITECTURE/C_R_DEPENDENCY_CONTRACT.md
LAB/10_CONSTRUCTION/blocks/C-COMPARE-BLOCK-001/UNIT.md
LAB/00_ARCHITECTURE/views/CONSTRUCTION_DAG_VIEW.md
LAB/00_ARCHITECTURE/views/LEARNING_GRAPH_VIEW.md
```

Historical records preserve provenance; they do not override later synchronized current-state authorities.

## 2. Current structural state

```text
Pre-numerical layer   CALIBRATED
N-Core                N-BLOCK-007 ACCEPTED
N-Arithmetic          N-ARITH-BLOCK-001 ACCEPTED
Z                     Z-BLOCK-002 ACCEPTED
Q                     Q-BLOCK-002 ACCEPTED
R                     R-DP-001 SELECTS Dedekind / R-BLOCK-001 ACCEPTED
R logical regime      R-DP-003 SELECTS localized classical CutComparability
R learned boundary    RTotality ↔ CutComparability / ST2-EXP-004 INTEGRATED
R alternative         R-ROUTE-C / Cauchy PERMANENT VERIFIED / NON-SELECTED
R alt Junction        ST2-EXP-003-R-J-001 / NON-ACCEPTANCE
C production R→C      BOMA-C-R-DEP-001 / exact sixteen-property surface
C                     C-DP-001 SELECTS C-ROUTE-P / C-BLOCK-002 / CA-20 ACCEPTED
C comparison          C-COMPARE-BLOCK-001 / five scalar ops + coordinate laws
C alternative         C-ROUTE-Q PERMANENT VERIFIED / NON-SELECTED
C alt Junction        ST2-EXP-002-PQ-J-001 / NON-ACCEPTANCE
ST2-EXP-001..004+011  CLOSED / PASS / VERIFIED LESSONS INTEGRATED
ACTIVE EXPERIMENT     NONE
AUTONOMOUS PROGRAM    NONE / NO_ACTIVE_PROGRAM
NEXT EXPERIMENT       NOT AUTHORIZED
REQUIRED NEXT ACT     STOP / OWNER AUTHORIZATION REQUIRED
```

## 3. Authority distinction and fail-closed posture

Two execution-authority mechanisms exist and must not be conflated:

```text
A. specific direct owner authorization for an experiment or bounded maintenance Act
B. exact scope of an OWNER_AUTHORIZED autonomous research program
```

The current autonomous-program machine state is:

```text
state = NO_ACTIVE_PROGRAM
active_program_id = null
authorized_experiment_queue = []
routine_merge_authorized = false
```

The autonomous program policy remains fail-closed:

```text
AMBIGUOUS AUTHORITY => OWNER_REQUIRED
```

No new experiment, candidate activation, research branch, or Frozen Plan is authorized by the completed ST2-EXP-004 sequence.

## 4. Learning-to-Construction rule

A successful experiment may, after Study/Act and lifecycle closure, and only under applicable owner authority, be integrated into the permanent Construction DAG as **verified knowledge**.

Allowed integration includes:

```text
refine dependency contract
refine an existing Block or Decision Point's dependency/logical classification
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
formal proof ancestry = mathematical necessity
```

## 5. Exact C-production R→C mathematical dependency rule

`ST2-EXP-001` established the canonical **production** mathematical surface of `BOMA-C-R-DEP-001`:

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

This comparison closure is not the whole C-production closure. The accepted `CQuadraticComparison001` source has not been replaced by the experimental generic source.

## 7. Relation/function firewall

For quadratic comparison:

```text
relation totality + uniqueness
!=
chosen functional comparison
```

An actual comparison function requires explicit `CoordinateExtractor` data. Never introduce a global coordinate selector or inverse selector merely for convenience.

## 8. R-DP-003 logical-regime rule — ST2-EXP-004 integrated

`R-DP-003` remains resolved and selected as:

```text
constructive rLE partial-order core
+
localized classical F-04 witness of CutComparability
+
constructive totality-from-CutComparability bridge
```

The exact ST2-EXP-004 frozen authority remains historical and immutable:

```text
accepted reference  50f3031b8d2657cbe0710e73e5935d997d40e49b
accepted tree       e4842acdf2b08c8db54b45d0798c36ee7565f351
Frozen Plan commit  89c9dc9154e7ca469e5c94c177be223205ee9dbd
Frozen Plan blob    1bd97aebb7e36ed5f7647ce29461c9c24b3cc9ba
Final Study/Act      6779d028c49f73757ea838c163d3968a982559fe
exact closed head   1fe760de811ad2b176ead6f420b80ca1aab5ce46
research merge      61adb8589c803e95e1b96ef38902320c8aa5df19
integration         BOMA-ST2-LEARNING-INTEGRATION-003
```

The integrated same-carrier boundary is:

```text
RTotality ↔ CutComparability
```

No unconditional constructive `CutComparability` was recovered from the frozen `LowerCut` fields.

The current measured F-04 declaration impact is:

```text
F04_DIRECT             8
F04_TRANSITIVE         7
F04_FREE              22
OTHER_CLASSICAL_ONLY  18
```

Gate B's `77 / 88` result is whole-source survivor/packaging evidence, not a theorem of mathematical necessity.

Independent controls remain:

```text
F-05 finite membership / bracketing
F-06 positive representative extraction
F-07 rational density
```

Therefore always preserve:

```text
NO F-04 dependency ≠ fully constructive R
conditional CutComparability ≠ constructive recovery
failure to recover totality ≠ impossibility theorem
formal declaration ancestry ≠ mathematical necessity
whole-source elaboration dependency ≠ theorem dependency
```

A located-cut redesign changes the representation and is only a possible separately authorized future candidate.

## 9. ST2-EXP-004 downstream C sensitivity rule

Gate E removed exactly `orderTotal` from the ST2-EXP-001 sixteen-property production interface.

Surviving accepted C Claim families:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
C-CL-COMPARE-001
```

The current proof closures for `C-CL-FIELD-001` and `C-CL-INTEGRATION-001` did not survive; measured dependence is transitive through the current square/nonnegative → norm → field path. Do not state this as mathematical necessity.

`C-CL-COMPARE-001` remains governed by the smaller ST2-EXP-011 comparison interface.

## 10. Decision / alternative discipline

### R

```text
R-DP-001 SELECTS R-ROUTE-D / Dedekind
R-BLOCK-001 is accepted
R-ROUTE-C / Cauchy is permanent verified alternative
ST2-EXP-003-R-J-001 is permanent verified non-acceptance Junction
R-DP-003 SELECTS localized classical comparability for Stage I
ST2-EXP-004 refines R-DP-003 knowledge; it does not replace the Decision Point
```

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

## 11. Stage-Two lifecycle rule

Closed and integrated:

```text
ST2-EXP-001
ST2-EXP-002
ST2-EXP-003
ST2-EXP-011
ST2-EXP-004
```

Current active cycle:

```text
NONE
```

Historical closure is monotone evidence. Never mutate closed Frozen Plan, Study/Act, failure, run, artifact, merge, or lifecycle records.

## 12. Accepted-source firewall

The ST2-EXP-004 Learning-to-Construction Act changes architecture knowledge only.

Do not change without a separate explicit accepted architectural decision:

```text
accepted Q/R/C manifests or their manifest-listed mathematical sources
R-DP-001 selection
R-DP-003 Stage-I logical-regime selection
R-BLOCK-001 accepted export
BOMA-C-R-DEP-001 sixteen-property production surface
C-DP-001 selection
C-J-001
C-BLOCK-002 / CA-20
```

No new Block, Decision Point, or Junction is justified by ST2-EXP-004.

## 13. Status authority

When current-state documents conflict, prefer:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_POLICY_001.json
LAB/PDSA/AUTONOMOUS_RESEARCH_PROGRAM_STATE_001.json for autonomous-program state only
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_003.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
relevant architecture / DAG / Decision / Block / acceptance / Claim records
claim-level exact evidence
README.md / AGENTS.md
historical checkpoints
```

The autonomous state file may govern autonomous-program execution; it may not rewrite mathematical or architectural facts.

## 14. Verification rules

For the completed ST2-EXP-004 sequence:

```text
verify Frozen Plan blob immutability from 89c9dc9154...
verify exact current maintenance head before merge
prove accepted Q/R/C manifests/sources unchanged from 50f3031b...
verify R-DP-003 still selects localized classical comparability
verify historical Gate A-F records and final-run identities without scientific re-execution
verify active_experiment = null and NO_ACTIVE_PROGRAM
verify no new Block / Decision Point / Junction
merge only with exact expected head
then STOP
```

Pinned Lean toolchain for historical experiment evidence:

```text
leanprover/lean4:v4.32.1
Lake packages: none
```

## 15. GitHub continuation rule

Do not conduct experiment work on `main`.

The only authorized branch in the completed ST2-EXP-004 sequence is the bounded maintenance Learning-to-Construction integration branch based on research merge `61adb8589c803e95e1b96ef38902320c8aa5df19`. After exact-head verification and integration merge, stop.

Do not create, activate, freeze, or merge a new experiment without new explicit owner authority. No autonomous routine merge authority is active.