# AGENTS.md — BOMA continuation rules

Mandatory for AI agents and other automated collaborators.

## 1. Read current state before acting

Read, in order:

```text
README.md
LAB/PDSA/STATUS.md
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
R→C dependency        BOMA-C-R-DEP-001 / exact sixteen-property mathematical surface
C                     C-DP-001 SELECTS C-ROUTE-P / C-BLOCK-002 / CA-20 ACCEPTED
C alternative         C-ROUTE-Q PERMANENT VERIFIED / NON-SELECTED
C alt Junction        ST2-EXP-002-PQ-J-001 / NON-ACCEPTANCE
ST2-EXP-001..003      CLOSED / PASS / VERIFIED LESSONS INTEGRATED
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT  OPEN / OWNER SELECTION REQUIRED
```

## 3. Learning-to-Construction rule

A successful experiment may, after Study/Act and explicit owner authorization,
be integrated into the permanent Construction DAG as **verified knowledge**.

Allowed integration includes:

```text
refine dependency contract
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
```

The Learning Graph must continue to preserve Frozen Plans, failed/superseded
attempts, exact evidence, Study/Act decisions, and the date/authority of integration.

## 4. Exact R→C mathematical dependency rule

`ST2-EXP-001` proved that selected C Claim meaning survives over exactly these
sixteen R properties:

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

This is the canonical mathematical surface of `BOMA-C-R-DEP-001`.

Formal witness:

```text
BOMA.C.StageTwo.NarrowRInterface001.NarrowROrderedFieldCertificate
BOMA.C.StageTwo.NarrowRInterface001.narrowRFromAcceptedProducers
```

The accepted C Lean source may still inherit a larger `RStageIntegrationCertificate`
bundle. Do not confuse that formal/provenance over-bundling with mathematical necessity.

Do not silently use as C mathematical premises:

```text
LowerCut
CutEquiv
cutSetoid identity
Dedekind LUB implementation
cut search/bracketing
selected R multiplication internals
selected Dedekind reciprocal internals
R density / Archimedean machinery unless a new accepted C Claim explicitly requires them
```

## 5. Decision / alternative discipline

### R

```text
R-DP-001 SELECTS R-ROUTE-D / Dedekind
R-BLOCK-001 is accepted
R-ROUTE-C / Cauchy is permanent verified alternative
ST2-EXP-003-R-J-001 is permanent verified non-acceptance Junction
```

Do not reinterpret the Cauchy branch as accepted or delete it from the core DAG because it is non-selected.

### C

```text
C-DP-001 SELECTS C-ROUTE-P
C-BLOCK-001 is selected producer
C-J-001 is accepted integration Junction
C-BLOCK-002 / CA-20 is accepted export
C-ROUTE-Q is permanent verified alternative
ST2-EXP-002-PQ-J-001 is permanent verified non-acceptance Junction
```

Do not conflate `C-J-001` with the P/Q alternative-construction Junction.

## 6. ST2-EXP-001 deliberately has no Junction

`ST2-EXP-001` changed the understanding of a dependency edge. It did not create
two carriers that needed reconciliation.

Correct interpretation:

```text
BOMA-C-R-DEP-001 -- REFINED BY --> exact sixteen-property interface
```

Incorrect interpretation:

```text
invent a new Brick/Block/Junction solely because the experiment passed
```

Use existing architectural types only when their granularity/semantics are actually satisfied.

## 7. Stage-Two lifecycle rule

All three owner-approved Stage-Two experiments are closed and their verified
lessons are integrated. There is `NO ACTIVE EXPERIMENT`.

Do not start `ST2-EXP-004`, `ST2-EXP-011`, or any other candidate merely because
it is registered or well documented.

A new experiment requires:

```text
explicit owner selection
→ verify current main
→ exact typed architectural origin
→ one changed factor / fixed controls
→ affected Claim cone
→ immutable Frozen Plan
→ separate branch
→ independent Do / exact V5 evidence
→ Study / Act
→ separate lifecycle, integration, acceptance, and merge decisions as applicable
```

Candidate documentation is not authorization.

## 8. ST2-EXP-003 historical facts

The permanent Cauchy branch was learned through `ST2-EXP-003`, which remains
`CLOSED / PASS / H1-H6 EXACT PASS`.

Final mathematical exact-verified branch head:

`3d4ed58e5d88b2a0bd84b3958cac2c8572385152`.

Critical final runs:

```text
Independent Cauchy Real Route              32727267231 PASS
Dedekind-Cauchy Comparison / R Junction    32727267177 PASS
Cauchy Quadratic Rebuild                    32727267183 PASS
```

Do not rewrite those historical records to pretend Cauchy was part of the original Stage-One accepted path.

## 9. C acceptance-first rule

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

## 10. Status authority

When current-state documents conflict, prefer:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
relevant DAG / acceptance / Claim records
claim-level V5 evidence
README.md / AGENTS.md
historical checkpoints
```

## 11. Method and topology

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
```

## 12. Brick / Block / Junction / Claim discipline

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

## 13. Accepted-stage discipline

An accepted Block/stage may be modified only with explicit impact analysis
against its acceptance contract and V5 lineage.

Architecture integration of experimental learning does **not** silently weaken,
strengthen, reinterpret, or replace accepted Claims/producers.

## 14. Logical and Claim-transparency discipline

Record localized logical commitments and their actual source provenance.
Absence of a downstream `Classical` token does not prove independence from an upstream classical producer.

For every promoted Claim preserve:

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

## 15. Verification rules

V5 results are theorem/unit specific. A monolithic type-check is not an
acceptance or architectural-promotion gate.

Before merging architecture changes:

```text
verify exact head
run architecture consistency
run affected accepted-stage regressions
preserve immutable Frozen Plans and accepted source/manifests unless change is explicitly in scope
record exact workflow/artifact identity where material
```

Pinned toolchain:

```text
leanprover/lean4:v4.32.1
Lake packages: none
```

## 16. GitHub continuation rule

Do not begin new research directly on `main`. Use a separate branch from a verified current main.

Do not merge changes into `main` without the appropriate explicit user authority and exact-head verification.
