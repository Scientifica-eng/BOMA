# PDSA STATUS — Current Research Cycle Index

**Status:** `SYNCHRONIZED / ST2-EXP-001..003 CLOSED PASS / VERIFIED LESSONS INTEGRATED / NO ACTIVE EXPERIMENT`  
**Current status date:** `2026-08-24`  
**Governing method:** **PDSA — Plan → Do → Study → Act**  
**Historical `PDCA` names:** provenance only  
**Latest architecture Act:** `LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`  
**Current program frontier:** `ACCEPTED N→C SPINE + PERMANENT VERIFIED R/C ALTERNATIVES / NEXT EXPERIMENT SLOT OPEN — OWNER SELECTION REQUIRED`.

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
BOMA-C-R-DEP-001                        exact sixteen-property mathematical R→C surface
        ↓
C-DP-001 SELECTS C-ROUTE-P
        ↓
C-BLOCK-001 → C-J-001 → C-BLOCK-002
        ↓
CA-20                                   ACCEPTED C
```

Accepted exports are unchanged by Stage-Two learning integration.

## 2. Permanent verified alternative architecture

Successful Stage-Two results are now permanently visible in the Construction DAG:

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

## 3. ST2-EXP-001 lesson integrated into `BOMA-C-R-DEP-001`

The canonical mathematical R→C dependency surface is now exactly:

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
formal ancestry. That excess is classified as formalization/provenance
over-bundling, not mathematical necessity.

## 4. Stage-Two closed experiments

```text
ST2-EXP-001
  origin      BOMA-C-R-DEP-001 dependency edge
  result      CLOSED / PASS
  integrated  exact minimal R→C mathematical dependency surface

ST2-EXP-002
  origin      C-DP-001
  result      CLOSED / PASS
  integrated  C-ROUTE-Q permanent verified alternative
              ST2-EXP-002-PQ-J-001 permanent non-acceptance Junction

ST2-EXP-003
  origin      R-DP-001 above Q-BLOCK-002
  result      CLOSED / PASS / H1-H6 EXACT PASS
  integrated  R-ROUTE-C / Cauchy permanent verified alternative
              ST2-EXP-003-R-J-001 permanent non-acceptance Junction
              H6 permanent downstream robustness evidence
```

The experiments remain Learning-Graph provenance: Frozen Plans, exact evidence,
failed runs, Study/Act records, and lifecycle records remain unchanged.

## 5. Accepted versus permanent-alternative distinction

```text
R selected route                 R-ROUTE-D / Dedekind
R accepted integration           R-J-002
R accepted export                R-BLOCK-001
R permanent alternative          R-ROUTE-C / Cauchy
R alternative Junction           ST2-EXP-003-R-J-001

C selected route                 C-ROUTE-P
C selected producer              C-BLOCK-001
C accepted integration           C-J-001
C accepted export                C-BLOCK-002 / CA-20
C permanent alternative          C-ROUTE-Q
C alternative Junction           ST2-EXP-002-PQ-J-001
```

No alternative producer is silently promoted by architecture integration.

## 6. Future frontier

```text
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT = OPEN / OWNER SELECTION REQUIRED
```

Registered candidates remain unstarted. In particular:

`ST2-EXP-011` remains a candidate for genericizing the C comparison scalar/interface boundary so both selected `RBOMA` and Cauchy `RCBOMA` may instantiate it without H5 transport. The Stage-Two integration Act does **not** authorize that experiment.

Candidate authority:

```text
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md
LAB/PDSA/candidates/README.md
```

## 7. Current architectural authorities

Read current state in this order:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
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

The governing invariant is now:

```text
BOMA learns through experiments
→ preserves the experimental history
→ integrates verified durable lessons into the permanent Construction DAG
→ does not confuse integration with acceptance promotion.
```
