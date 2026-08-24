# PDSA STATUS — Current Research Cycle Index

**Status:** `ST2-EXP-001..003 + ST2-EXP-011 CLOSED PASS / VERIFIED LESSONS INTEGRATED / NO ACTIVE EXPERIMENT`  
**Current status date:** `2026-08-24`  
**Governing method:** **PDSA — Plan → Do → Study → Act**  
**Historical `PDCA` names:** provenance only  
**Latest architecture Act:** `LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md`  
**Current program frontier:** `MERGE/VERIFY ST2-EXP-011 ARCHITECTURE ACT → RE-READ SYNCHRONIZED MAIN → FREEZE INDEPENDENT ST2-EXP-004 PLAN; ST2-EXP-004 NOT ACTIVE`.

This is the compact current-state handoff index. Historical run lineages remain
in stage-specific PDSA/evidence/failure records and are not erased by current-state integration.

## 1. Current accepted spine

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
BOMA-C-R-DEP-001                        exact 16-property C-production surface
        ↓
C-DP-001 SELECTS C-ROUTE-P
        ↓
C-BLOCK-001
        ↓
C-COMPARE-BLOCK-001                     comparison surface refined by ST2-EXP-011
        ↓
C-J-001 → C-BLOCK-002
        ↓
CA-20                                   ACCEPTED C
```

Accepted exports, selected routes, accepted Lean inputs, and accepted Claim
meanings are unchanged by `ST2-EXP-011` and by its architecture integration.

## 2. Permanent verified alternative architecture

```text
R-DP-001
   ├── SELECTS R-ROUTE-D / Dedekind → R-BLOCK-001 ACCEPTED
   └── R-ROUTE-C / Cauchy → VERIFIED ALTERNATIVE R PRODUCER
                              ↓
                       ST2-EXP-003-R-J-001
                       R-FIELD-ISOMORPHISM / NON-ACCEPTANCE

C-DP-001
   ├── SELECTS C-ROUTE-P → C-BLOCK-001 → C-COMPARE-BLOCK-001
   │                      → C-J-001 → C-BLOCK-002 ACCEPTED
   └── C-ROUTE-Q → VERIFIED ALTERNATIVE C PRODUCER
                     ↓
              ST2-EXP-002-PQ-J-001
              R-FIELD-ISOMORPHISM / NON-ACCEPTANCE
```

Permanent visibility does not change `SELECTS` or acceptance.

## 3. Two distinct C←R dependency surfaces

### 3.1 C production surface — ST2-EXP-001 integrated

The canonical mathematical **production** R→C dependency is exactly:

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

The accepted C Lean implementation may still carry a larger bundled R package
in formal ancestry. That excess is formalization/provenance over-bundling, not
mathematical necessity.

### 3.2 Quadratic comparison surface — ST2-EXP-011 integrated

The direct scalar operations required by `C-COMPARE-BLOCK-001 /
C-CL-COMPARE-001` are:

```text
zero
one
neg
add
mul
```

plus explicit quadratic coordinate laws:

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

This is a narrower **comparison** dependency, not a replacement for the
sixteen-property production contract.

## 4. ST2-EXP-011 final result and integration

Typed origin:

```text
BLOCK / C-COMPARE-BLOCK-001
first divergence = scalar carrier/operation hard-wiring inside comparison presentation/relation
```

Direct affected Claim: `C-CL-COMPARE-001`.  
Secondary audit Claim: `C-CL-INTEGRATION-001`.

Frozen accepted reference:

`b49826e58261a71634cd12756e8afda28920088f`.

Frozen Plan commit:

`5cc05ef1bea8e88787041c3bc30dd0aecf5412d4`.

Final lifecycle-closed exact verification:

```text
head      632a7134f26daf9dd781e3546804941f429a4246
run       32754345656
artifact  9530261359
sha256    d93c6f1ec34858f6cbc1556e92b86a241f6399e6a3cf894204608a51d63de2e5
result    SUCCESS
```

All nine relevant PR workflows passed on that exact head.

Research/lifecycle merge:

```text
commit    72394878854aa69e865d17567959bec1daa70e6d
parent 1  b49826e58261a71634cd12756e8afda28920088f
parent 2  632a7134f26daf9dd781e3546804941f429a4246
tree      168fc1267313810e622c2206fa8a91f24decb4b7
```

The merge differs from the verified head by zero files: ancestry was added with
no post-verification content drift.

Final mathematical/architectural classification:

```text
ST2-EXP-011 MATHEMATICAL RESULT       PASS
ST2-EXP-011 LIFECYCLE                 CLOSED
generic comparison interface          VERIFIED
accepted RBOMA instance               VERIFIED / Related semantics definitionally preserved
native RCBOMA/H6 instance             VERIFIED
H5/Dedekind native dependency         NOT REQUIRED
relation/function firewall            PRESERVED
global selector                       NOT INTRODUCED
accepted R/C                          UNCHANGED
new Block / Decision / Junction       NONE
permanent comparison knowledge        INTEGRATED
accepted-source refactor              NOT PERFORMED / FUTURE CANDIDATE
```

Integration authority:

`LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md`.

## 5. Relation/function firewall

The permanent comparison boundary preserves:

```text
relation-level totality + uniqueness
!=
chosen functional comparison
```

Functional maps require explicit `CoordinateExtractor` data. The generic
comparison layer introduces no global coordinate or inverse selector.

Logical evidence remains:

```text
generic comparison roots   NO AXIOMS
native H6 roots             [propext, Quot.sound]
accepted RBOMA adapter      [propext, Classical.choice, Quot.sound]
```

The accepted-adapter Choice cost is inherited formal provenance, not generic
comparison necessity.

## 6. Stage-Two experiment status

```text
ST2-EXP-001  CLOSED / PASS / PRODUCTION DEPENDENCY LESSON INTEGRATED
ST2-EXP-002  CLOSED / PASS / ROUTE-Q + NON-ACCEPTANCE JUNCTION INTEGRATED
ST2-EXP-003  CLOSED / PASS / H1-H6 EXACT / CAUCHY + R JUNCTION INTEGRATED
ST2-EXP-011  CLOSED / PASS / COMPARISON-INTERFACE LESSON INTEGRATED
ACTIVE STAGE-TWO EXPERIMENT = NONE
```

Experimental Lean sources remain research-only unless separately promoted by a
controlled accepted-source change.

## 7. Lifecycle-CI governance lesson

ST2-EXP-011 closure exposed and corrected a CI scoping defect. The repository
now distinguishes:

```text
historical experiment closure = monotone evidence
current active/frontier state  = time-varying program state
```

Historical 001–003 workflows can therefore remain reproducible during later
cycles without forcing the global active-experiment pointer to remain empty
forever. The preserved failures remain research/governance provenance.

## 8. Sequence frontier — ST2-EXP-004 is next but not active

The owner-sequenced next experiment is `ST2-EXP-004`, whose intended single
changed factor is the logical regime at `R-DP-003`.

It **must not start from this integration branch** and has **no Frozen Plan yet**.
The required sequence is:

```text
complete and merge BOMA-ST2-LEARNING-INTEGRATION-002
  ↓
synchronize and verify current main
  ↓
re-read current main and current R-DP-003 authorities
  ↓
prepare a new independent ST2-EXP-004 Frozen Plan from that exact main
  ↓
open a separate ST2-EXP-004 branch
  ↓
begin Do only after the Plan is frozen
```

No ST2-EXP-011 Plan, branch state, or experimental implementation becomes the
Plan of ST2-EXP-004.

## 9. Current architectural authorities

Read current state in this order:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
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
LAB/00_ARCHITECTURE/views/CONSTRUCTION_DAG_VIEW.md
LAB/00_ARCHITECTURE/views/DECISION_BRANCH_JUNCTION_VIEW.md
LAB/00_ARCHITECTURE/views/LEARNING_GRAPH_VIEW.md
```

Historical documents remain authoritative for their own dated state but do not
override later synchronized current-state authorities.
