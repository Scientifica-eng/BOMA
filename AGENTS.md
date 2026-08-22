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
LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md
LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md
LAB/00_ARCHITECTURE/TRUSTED_BASE.md
LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
LAB/00_ARCHITECTURE/views/
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
```

Then read the DAG, acceptance specification, closure/PDSA record, Claim register, and V5 index relevant to the affected stage.

For the current R→C frontier, this includes at least:

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
LAB/PDSA/PDSA-ARCH-002_CLOSURE_2026-08-21.md
LAB/PDSA/PDSA-ARCH-002_STATUS.md
LAB/00_ARCHITECTURE/C_ACCEPTANCE_SPECIFICATION.md
LAB/00_ARCHITECTURE/C_R_DEPENDENCY_CONTRACT.md
LAB/00_ARCHITECTURE/C_DAG.md
LAB/10_CONSTRUCTION/decisions/C-DP-001/UNIT.md
LAB/20_FORMALIZATION/C_STAGE/C_CLAIM_REGISTER_001.md
LAB/PDSA/PDSA-C-001_EX_ANTE_ACCEPTANCE_DISCRIMINANT.md
LAB/PDSA/PDSA-C-002_R_INTERFACE_SUFFICIENCY_PROBE.md
LAB/PDSA/PDSA-C-003_COMPARABLE_QUADRATIC_ROUTE_PROBES.md
LAB/PDSA/PDSA-C-004_SELECTED_PAIR_CARRIER_AND_RING_CORE.md
LAB/PDSA/PDSA-C-005_CONJUGATE_NORM_AND_WITNESS_FIELD_CLOSURE.md
LAB/PDSA/PDSA-C-006_REPRESENTATION_NEUTRAL_QUADRATIC_COMPARISON.md
LAB/PDSA/PDSA-C-007_FINAL_INTEGRATION_AND_CLAIM_TRANSPARENCY.md
LAB/PDSA/PDSA-C-008_FINAL_COMPLEX_ACCEPTANCE.md
LAB/PDSA/PDSA-C-009_COMPLEX_STAGE_REVERSE_ENGINEERING.md
LAB/PDSA/PDSA-STAGE1-001_GLOBAL_REVERSE_ENGINEERING.md
LAB/20_FORMALIZATION/C_STAGE/C_CLAIM_V5_INDEX.md
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
C                     ACCEPTED — CA-20 / C-BLOCK-002
```

Current C state:

```text
BOMA-C-ACCEPT-001  ACTIVE
BOMA-C-R-DEP-001   ACTIVE
PDSA-C-001         CLOSED
PDSA-C-002         CLOSED — V5 32564789630 PASS / C-RQ-001 CLOSED
PDSA-C-003         CLOSED — V5 32565335033 PASS / both routes verified
PDSA-C-004         CLOSED — selected pair ring core V5 32574270735 PASS
PDSA-C-005         CLOSED — witness field + inherited-axiom V5 32574920935 PASS
PDSA-C-006         CLOSED — quadratic comparison V5 32575465002 PASS
PDSA-C-007         CLOSED — final integration / nine-Claim V5 32585583815 PASS
PDSA-C-008         CLOSED — CA-20 ACCEPT / six-stage run 32586145793 PASS
PDSA-C-009         CLOSED — RE-C-001 complete / exact dependency classification
PDSA-STAGE1-001    CLOSED — global RE-STAGE1-001 COMPLETE
STAGE-TWO-LAB      ACTIVE — ST2-EXP-001 CLOSED PASS / ST2-EXP-002 selected
C-DP-001           RESOLVED — C-ROUTE-P selected / C-ROUTE-Q retained
C carrier           CBOMA — selected pair record / V5 PASS
C Brick / Block     C-BLOCK-001 producer / C-BLOCK-002 ACCEPTED
C Junction          C-J-001 PASS / formal closure + producer ownership
accepted C export   C-BLOCK-002 / CA-20 ACCEPT
```

The previous C hold recorded in the 2026-08-20 checkpoint and older documents was explicitly lifted by the user on 2026-08-21. Preserve those documents as historical provenance; do not continue enforcing their old hold against the later synchronized frontier.

## C acceptance-first rule

Do **not** select a C carrier or representation before the ex-ante acceptance contract and Decision evidence justify it.

The current Stage-One semantic core is:

```text
faithful accepted-R embedding
commutative-field-strength behavior
distinguished I
I² = -1
every z has an expression a+bI with a,b in accepted R
that expression is unique
route-neutral comparison adequacy
```

Do not silently strengthen this to algebraic closure, FTA, analytic completeness, a total order on C, or equivalence with a built-in Complex carrier.

In particular, never infer:

```text
C = R×R because coordinates are convenient
C = polynomial quotient because X²+1 presents the extension
selected route = mathematically necessary route
Lean identity = mathematical identity
standard notation a+bi = carrier definition
```

`C-DP-001` is RESOLVED by explicit user ratification on 2026-08-22. `C-ROUTE-P` is the selected Stage-One producer; `C-ROUTE-Q` remains a retained verified alternative. The selected Route P is now promoted to the verified `C-BLOCK-001` witness-based field; it is not yet an accepted C export. Route options remain:

```text
C-ROUTE-P  ordered-pair / explicit rank-two coordinate candidate
C-ROUTE-Q  polynomial-adjunction / quotient candidate
C-ROUTE-A  only if genuinely independent
```

The `SELECTS → C-ROUTE-P` edge is justified by symmetric V5 run `32565335033` plus explicit user ratification. Treat it as a methodological choice, never mathematical necessity.

## R→C dependency rule

C consumes the **accepted R interface**, not Dedekind internals by default.

Allowed starting boundary:

```text
accepted R Claim surface
+
downstream lemmas explicitly derived from that surface
+
declared C-stage infrastructure
```

Do not silently use as C mathematical premises:

```text
LowerCut
CutEquiv
cutSetoid identity
principal-cut representation details
Dedekind union LUB implementation
cut membership search/bracketing
selected signed multiplication internals
selected reciprocal internals
```

If C needs a real theorem absent from the accepted export, open an explicit dependency question and classify it as:

```text
derivable downstream from accepted R Claims
requires justified strengthening of R
representation-specific C dependency
new C-stage supporting lemma/infrastructure
```

The closed `PDSA-C-002` probe is written first against an abstract `RStageIntegrationCertificate`, then instantiated on the accepted certificate. Its exact V5 PASS evidence is run `32564789630` at source commit `a6c894e62c48919712341cea1c0ea588590f9e5f`. Do not transfer that evidence to a changed source, changed inherited manifest, a different route probe, or an acceptance-level C Claim.

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

Each new canonical research cycle must identify its question, inputs, construction units affected, evidence, Study result, Act decision, graph effects, Learning Graph effects, and inherited next-cycle constraints.

Do not delete failed experiments with explanatory value. Use `HISTORICAL`, `SUPERSEDED`, `REJECTED`, or the relevant current status while preserving provenance.

## Topology rules

Do not assume a linear chain. Classify forks as parallel dependency, Decision Point branch, or exploratory PDSA branch. A Junction requires an explicit compatibility/convergence question and evidence.

Reconvergence must preserve route-specific assumptions and provenance. Never infer:

```text
same contribution ⇒ same history
selected route ⇒ universal necessity
visual meeting ⇒ verified convergence
```

Do not create a C Junction before actual incoming producers exist.

## Brick / Block / Claim discipline

Keep the architectural types distinct:

```text
Brick         smallest independently reviewable/replaceable/branchable named construction unit
Block         coherent package of Bricks and/or internal components
Junction      verified compatibility/reconvergence result
Decision Point explicit selection among alternatives
Claim         assertion layer independent of Brick/Block granularity
```

Do not manufacture Bricks merely for symmetry. Q and R legitimately used broader Blocks with internal components. The current C boundary lemmas `C-RL-001/002` are supporting lemmas, not automatic `C-BR-*` units.

## Accepted-stage discipline

An accepted Block or stage may be modified only with explicit impact analysis against its governing acceptance contract and V5 lineage. Do not silently weaken, strengthen, reinterpret, or broaden an accepted claim.

For R in particular:

```text
accepted carrier      RBOMA := Quotient cutSetoid
selected route        Dedekind lower cuts
accepted completeness Dedekind LUB completeness
inverse interface     existence + uniqueness witnesses
final gate            R-J-002 PASS
acceptance             RA-22 ACCEPT
```

These are accepted current realization facts. They do not imply that Dedekind representation or quotient identity is required downstream.

## Logical-commitment discipline

Do not collapse the R construction into a blanket label such as “constructive” or “classical.” The accepted path contains a constructive partial-order core plus localized classical commitments recorded in the R audit and reverse-engineering matrix.

If a C theorem consumes the accepted R total-order Claim, record that mathematical dependency and its current producer provenance. Absence of an explicit `Classical` token in downstream C source does not prove independence from the current upstream classical total-comparability route.

If replacing one of those commitments, treat that as a branch/reconstruction problem with explicit downstream acceptance impact, not as documentary cleanup.

## Claim-transparency rule

For every promoted C Claim maintain the `CLAIM_ARCHITECTURE.md` fields:

```text
Claim ID
statement / acceptance role
producer
mathematical dependencies
logical dependencies
representation dependencies
formalization dependencies
supporting lemmas
Lean declaration
source file
verification evidence
alternative producer / branch
necessity classification
sensitivity / reopening condition
```

Use only the canonical dependency vocabulary:

```text
MATHEMATICAL_CLAIM
SUPPORTING_LEMMA
LOGICAL_COMMITMENT
REPRESENTATION_COMMITMENT
FORMALIZATION_COMMITMENT
VERIFICATION_INFRASTRUCTURE
TRUSTED_METATHEORY
```

Do not introduce `OTHER`, `IMPLICIT`, or `UNKNOWN` into certified closure.

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

C-stage verification workflows must remain read-only with respect to `main` under the current transparency policy.

## GitHub continuation rule

Do not work directly on `main` for C. Continue on a C feature branch based on a verified current `main` head.

Do not merge to `main` without an explicit user order.

Preserve research commits and historical branches; do not squash away Learning Graph provenance merely for visual cleanliness.

## Cleanup rule

Repository cleanup must distinguish operational debris from research provenance. Do not delete historical failed experiments, retained alternatives, superseded evidence, or old PDSA records merely because a later route succeeded. Remove or archive only material whose deletion cannot erase scientifically relevant dependency, decision, failure, or learning history.

## Stage-Two handoff after accepted C

`CA-20`, `RE-C-001`, and `RE-STAGE1-001` are complete. The only current research
frontier is the controlled candidate register
`LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md`; owner-approved
`ST2-EXP-001` is CLOSED / PASS in exact run `32593045224`. The owner selected
only `ST2-EXP-002`; follow its separately frozen
`LAB/PDSA/PDSA-ST2-EXP-002_INDEPENDENT_QUOTIENT_ROUTE.md` Plan. Preserve the
accepted N→C baseline, the prior experiment, all eleven unselected
alternatives, and never merge into `main` without separate explicit approval.
