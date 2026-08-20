# AGENTS.md — BOMA continuation rules

Mandatory for AI agents and other automated collaborators.

## Before canonical work

Read, in order:

```text
README.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md
LAB/PDSA/STATUS.md
LAB/PDSA/CHECKPOINT_2026-08-20_PROJECT_TAKEOVER.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
```

Then read the DAG, acceptance specification, closure record, and V5 index for the stage affected by the requested work.

For the current R frontier, this includes at least:

```text
LAB/00_ARCHITECTURE/R_ACCEPTANCE_SPECIFICATION.md
LAB/00_ARCHITECTURE/R_DAG.md
LAB/10_CONSTRUCTION/blocks/R-BLOCK-001/UNIT.md
LAB/10_CONSTRUCTION/junctions/R-J-002/UNIT.md
LAB/20_FORMALIZATION/R_STAGE/R_CLAIM_V5_INDEX.md
LAB/20_FORMALIZATION/R_STAGE/R_STAGE_ACCEPTANCE_CLOSURE_AUDIT_002.md
LAB/PDSA/PDSA-R-014_STAGE_ONE_REAL_CLOSURE.md
LAB/PDSA/PDSA-R-015_REAL_STAGE_REVERSE_ENGINEERING.md
LAB/PDSA/experiments/PDSA-R-015-RE-R-001-DEPENDENCY-CLASSIFICATION.md
```

## Current canonical state

```text
Pre-numerical layer   CALIBRATED
N-Core                ACCEPTED
N-Arithmetic          ACCEPTED
Z                     ACCEPTED
post-Z reverse N      CLOSED
Q                     ACCEPTED
R                     ACCEPTED — RA-22
RE-R-001              CLOSED / COMPLETE
C                     NOT STARTED — USER HOLD
```

Do **not** start C until a new explicit user order authorizes it. Do not create a C acceptance specification, Decision Point, Brick, Block, Lean payload, workflow, or PDSA construction cycle under the existing hold.

## Status authority

When status documents conflict, prefer the later synchronized canonical records in this order:

```text
LAB/PDSA/STATUS.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
relevant current DAG / acceptance / closure records
claim-level V5 evidence
README.md / AGENTS.md
historical checkpoints and PDSA records
```

Historical records are not errors merely because their then-current status is older. Preserve them as provenance, but never use an older historical frontier to override a later synchronized status.

## Method

Use **PDSA — Plan, Do, Study, Act**. `PDCA` names are legacy provenance only.

Each new canonical research cycle must identify its question, inputs, construction units affected, evidence, Study result, Act decision, graph effects, and inherited next-cycle constraints.

## Topology rules

Do not assume a linear chain. Classify forks as parallel dependency, Decision Point branch, or exploratory PDSA branch. A Junction requires an explicit compatibility/convergence question and evidence.

Reconvergence must preserve route-specific assumptions and provenance. Never infer:

```text
same contribution ⇒ same history
selected route ⇒ universal necessity
visual meeting ⇒ verified convergence
```

## Accepted-stage discipline

An accepted Block or stage may be modified only with explicit impact analysis against its governing acceptance contract and V5 lineage. Do not silently weaken, strengthen, reinterpret, or broaden an accepted claim.

For R in particular:

```text
accepted carrier     RBOMA := Quotient cutSetoid
selected route       Dedekind lower cuts
accepted completeness Dedekind LUB completeness
inverse interface    existence + uniqueness witnesses
final gate           R-J-002 PASS
acceptance            RA-22 ACCEPT
```

Do not silently claim Cauchy/metric/sequential completeness, uniqueness of complete ordered fields, or Dedekind↔Cauchy equivalence unless separately constructed and verified.

## Logical-commitment discipline

Do not collapse the R construction into a blanket label such as “constructive” or “classical.” The accepted path contains a constructive partial-order core plus localized classical commitments recorded in the R audit and reverse-engineering matrix.

If replacing one of those commitments, treat that as a branch/reconstruction problem with explicit downstream acceptance impact, not as documentary cleanup.

## N-Core provenance rule

Do not treat `TCT-BLOCK-006`, `N-RB-CAND-001`, or `NCoreRB001.lean` as the canonical N architecture. They are aggregate/producer/evidence records.

Canonical N units are `N-BR-*`, `N-BLOCK-*`, `N-J-*`, and the relevant Decision Points as mapped by `N_CORE_DAG.md`.

## Verification rules

V5 results must be mapped theorem-by-theorem/unit-by-unit. A type-checking monolithic payload does not automatically PASS an acceptance Junction or acceptance matrix.

Before promoting evidence:

```text
verify the actual dependency closure
verify the intended commit/source state
record the exact toolchain and workflow run
preserve failures and superseded attempts as provenance when scientifically material
avoid attributing evidence to a source state that was not actually checked
```

The current pinned toolchain is:

```text
leanprover/lean4:v4.32.1
```

The current Lake manifest has no external packages.

## Cleanup rule

Repository cleanup must distinguish operational debris from research provenance. Do not delete historical failed experiments, retained alternatives, superseded evidence, or old PDSA records merely because a later route succeeded. Remove or archive only material whose deletion cannot erase scientifically relevant dependency, decision, failure, or learning history.
