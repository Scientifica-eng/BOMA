# PDSA STATUS — Current Research Cycle Index

**Status:** `ST2-EXP-001..003 CLOSED PASS / ST2-EXP-011 CLOSED PASS / NO ACTIVE EXPERIMENT / 011 ARCHITECTURE INTEGRATION REQUIRED`  
**Current status date:** `2026-08-24`  
**Governing method:** **PDSA — Plan → Do → Study → Act**  
**Historical `PDCA` names:** provenance only  
**Latest completed architecture Act:** `LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`  
**Current program frontier:** `ST2-EXP-011 CLOSED / SEPARATE LEARNING-TO-CONSTRUCTION INTEGRATION NEXT / ST2-EXP-004 OWNER-SEQUENCED AFTER SYNCHRONIZED MAIN BUT NOT ACTIVE`.

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
BOMA-C-R-DEP-001                        exact sixteen-property mathematical R→C production surface
        ↓
C-DP-001 SELECTS C-ROUTE-P
        ↓
C-BLOCK-001 → C-J-001 → C-BLOCK-002
        ↓
CA-20                                   ACCEPTED C
```

Accepted exports and selected routes are unchanged by `ST2-EXP-011`.

## 2. Permanent verified alternative architecture before ST2-EXP-011 integration

```text
R-DP-001
   ├── SELECTS R-ROUTE-D / Dedekind → R-BLOCK-001 ACCEPTED
   └── R-ROUTE-C / Cauchy → VERIFIED ALTERNATIVE R PRODUCER
                              ↓
                       ST2-EXP-003-R-J-001
                       R-FIELD-ISOMORPHISM / NON-ACCEPTANCE

C-DP-001
   ├── SELECTS C-ROUTE-P → C-BLOCK-001 → C-J-001 → C-BLOCK-002 ACCEPTED
   └── C-ROUTE-Q → VERIFIED ALTERNATIVE C PRODUCER
                     ↓
              ST2-EXP-002-PQ-J-001
              R-FIELD-ISOMORPHISM / NON-ACCEPTANCE
```

Permanent visibility does not change `SELECTS` or acceptance.

## 3. ST2-EXP-001 lesson already integrated into `BOMA-C-R-DEP-001`

The canonical mathematical **production** R→C dependency surface is exactly:

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

This was verified by `ST2-EXP-001 / CLOSED / PASS / V5 32593045224`.

The accepted C Lean implementation may still carry a larger bundled R package in
formal ancestry. That excess is formalization/provenance over-bundling, not
mathematical necessity.

## 4. ST2-EXP-011 closed mathematical result

`ST2-EXP-011` was explicitly selected by the owner on 2026-08-24 and frozen from
accepted `main` commit:

`b49826e58261a71634cd12756e8afda28920088f`.

Immutable Frozen Plan commit:

`5cc05ef1bea8e88787041c3bc30dd0aecf5412d4`.

Typed origin:

```text
BLOCK / C-COMPARE-BLOCK-001
first divergence = scalar carrier/operation hard-wiring inside comparison presentation/relation
```

Direct affected Claim: `C-CL-COMPARE-001`.  
Secondary audit Claim: `C-CL-INTEGRATION-001`.

Final mathematical Study/Act:

`LAB/PDSA/experiments/ST2-EXP-011_FINAL_STUDY_ACT_001.md`.

Lifecycle closure:

`LAB/PDSA/experiments/ST2-EXP-011_LIFECYCLE_CLOSURE_001.md`.

The exact green pre-closure verification head is:

`ef116405c08475ec8702d9177a5106d7d0bfe525`.

Exact custom evidence on that head:

```text
run       32753140129
artifact  9529812715
sha256    f7ec7a6d1fb88a8c59dbcc8ce04bd8d6c389a3b3d77bb6ed3c1f22dc629dd9b1
result    SUCCESS
```

All eight related historical/accepted regression workflows also passed on the
same SHA. The lifecycle-CI compatibility defect exposed after Study/Act is
preserved separately and was corrected without weakening mathematical gates.

The closed result is:

```text
ST2-EXP-011 MATHEMATICAL RESULT       PASS
ST2-EXP-011 LIFECYCLE                 CLOSED
generic comparison interface          VERIFIED RESEARCH EVIDENCE
accepted RBOMA instance               VERIFIED / old Related semantics definitionally preserved
native RCBOMA/H6 instance             VERIFIED
H5/Dedekind native dependency         NOT REQUIRED
global selector / Classical.choose    NOT INTRODUCED BY GENERIC LAYER
accepted R/C                          UNCHANGED
new Block / Decision / Junction       NOT JUSTIFIED
```

The generic comparison roots themselves are axiom-free. Native H6 comparison
roots use `[propext, Quot.sound]`; accepted-RBOMA adapter roots inherit
`[propext, Classical.choice, Quot.sound]` from accepted formal ancestry. This
separates generic mathematical/interface necessity from accepted formal provenance.

The experiment establishes a **comparison scalar surface** narrower than both
the whole accepted R certificate and the sixteen-property production R→C
surface: comparison requires scalar `zero/one/neg/add/mul` plus explicit
quadratic coordinate existence/uniqueness/preservation laws.

This durable lesson is still Learning-Graph evidence at this closure point. It
must become a Construction-DAG current-state fact only through the separate
Learning-to-Construction integration Act required next.

## 5. Stage-Two experiment status

```text
ST2-EXP-001  CLOSED / PASS / LESSON INTEGRATED
ST2-EXP-002  CLOSED / PASS / PERMANENT VERIFIED ALTERNATIVE + JUNCTION INTEGRATED
ST2-EXP-003  CLOSED / PASS / H1-H6 EXACT / PERMANENT VERIFIED ALTERNATIVE + JUNCTION INTEGRATED
ST2-EXP-011  CLOSED / PASS / DURABLE LESSON AWAITS SEPARATE ARCHITECTURE INTEGRATION
```

`ST2-EXP-011` experimental Lean sources remain research-only. PASS and closure
are not an automatic accepted refactor or producer promotion.

## 6. Current sequence frontier

The owner explicitly fixed the sequence:

```text
ST2-EXP-011 lifecycle CLOSED
  ↓
perform required separate Learning-to-Construction integration
  ↓
synchronize and verify main
  ↓
re-read current main
  ↓
ST2-EXP-004 with a new independent Frozen Plan and branch
```

Therefore:

```text
ACTIVE STAGE-TWO EXPERIMENT = NONE
NEXT REQUIRED ACT = ST2-EXP-011 LEARNING-TO-CONSTRUCTION INTEGRATION
NEXT OWNER-SEQUENCED EXPERIMENT AFTER THAT = ST2-EXP-004
ST2-EXP-004 IS NOT ACTIVE AND HAS NO FROZEN PLAN YET
```

Its single changed factor will be the logical regime at `R-DP-003`, not the C
comparison abstraction changed by 011.

## 7. Historical lifecycle CI rule learned during closure

The post-Study transition exposed a CI scoping defect: historical workflows for
closed 001--003 conflated experiment-local closure with a permanently empty
global Stage-Two frontier.

The retained failure record is:

`LAB/PDSA/experiments/ST2-EXP-011_FAILURE_002_HISTORICAL_LIFECYCLE_CI_SCOPE.md`.

The repository now distinguishes:

```text
historical experiment closure = monotone evidence
current active/frontier state  = time-varying program state
```

The strict historical closed-frontier audit remains reproducible, while later
cycles use explicit historical-closure preservation checks. This changes CI
governance semantics only; it does not change the mathematical result of any
closed experiment.

## 8. Current architectural authorities

Read current state in this order:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/00_ARCHITECTURE/GRAPH.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
LAB/00_ARCHITECTURE/R_DAG.md
LAB/00_ARCHITECTURE/C_R_DEPENDENCY_CONTRACT.md
LAB/00_ARCHITECTURE/C_DAG.md
LAB/00_ARCHITECTURE/views/CONSTRUCTION_DAG_VIEW.md
LAB/00_ARCHITECTURE/views/DECISION_BRANCH_JUNCTION_VIEW.md
LAB/00_ARCHITECTURE/views/LEARNING_GRAPH_VIEW.md
```

Until the separate post-closure architecture Act for 011 is merged, the
Construction DAG continues to show the previously integrated 001–003 facts.
The closed 011 Study/Act and lifecycle record are Learning-Graph provenance,
not an implicit canonical rewrite.
