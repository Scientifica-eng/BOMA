# BOMA — Project Handoff / START HERE

BOMA builds a transparent, traceable mathematical architecture from a declared pre-numerical constructional layer toward standard number systems.

Governing method: **PDSA — Plan → Do → Study → Act**. Historical `PDCA` identifiers are provenance only.

## Current canonical frontier

As of 2026-08-20, the synchronized project state is:

```text
framework-neutral pre-numerical layer   CALIBRATED
        ↓
N-Core                                  ACCEPTED
        ↓
N-Arithmetic                            ACCEPTED
        ↓
Z                                       ACCEPTED
        ↓
post-Z reverse N                        CLOSED
        ↓
Q                                       ACCEPTED
        ↓
R                                       ACCEPTED
        ↓
RE-R-001                                CLOSED / COMPLETE

C                                       NOT STARTED — USER HOLD
```

The current instruction is explicit:

```text
DO NOT START C UNTIL A NEW EXPLICIT USER ORDER IS GIVEN.
```

Eligibility after R acceptance is not authorization.

## Source-of-truth order

When documents disagree about current status, use this order unless a later explicit governance record supersedes it:

1. `LAB/PDSA/STATUS.md`
2. `LAB/00_ARCHITECTURE/REGISTRY.md`
3. `LAB/00_ARCHITECTURE/GRAPH.md`
4. the relevant current DAG / acceptance / closure records
5. claim-level V5 evidence
6. onboarding summaries such as this README and `AGENTS.md`
7. historical PDSA/checkpoint/branch artifacts for historical provenance

Historical documents remain valid records of their own state at their own date; they do not override a later synchronized canonical status.

## Mandatory reading order

Before canonical work, read:

1. `README.md`
2. `AGENTS.md`
3. `LAB/00_ARCHITECTURE/ARCHITECTURE.md`
4. `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`
5. `LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`
6. `LAB/PDSA/STATUS.md`
7. `LAB/PDSA/CHECKPOINT_2026-08-20_PROJECT_TAKEOVER.md`
8. `LAB/00_ARCHITECTURE/REGISTRY.md`
9. `LAB/00_ARCHITECTURE/GRAPH.md`
10. the DAG, acceptance specification, closure record, and V5 index relevant to the requested stage

For the current closed R frontier, additionally read:

```text
LAB/00_ARCHITECTURE/R_ACCEPTANCE_SPECIFICATION.md
LAB/00_ARCHITECTURE/R_DAG.md
LAB/00_ARCHITECTURE/REVERSE_ENGINEERING_SCHEDULE.md
LAB/10_CONSTRUCTION/blocks/R-BLOCK-001/UNIT.md
LAB/10_CONSTRUCTION/junctions/R-J-002/UNIT.md
LAB/20_FORMALIZATION/R_STAGE/R_CLAIM_V5_INDEX.md
LAB/20_FORMALIZATION/R_STAGE/R_STAGE_ACCEPTANCE_CLOSURE_AUDIT_002.md
LAB/PDSA/PDSA-R-014_STAGE_ONE_REAL_CLOSURE.md
LAB/PDSA/PDSA-R-015_REAL_STAGE_REVERSE_ENGINEERING.md
LAB/PDSA/experiments/PDSA-R-015-RE-R-001-DEPENDENCY-CLASSIFICATION.md
```

## Do not linearize BOMA

The canonical construction is a DAG. Valid topology includes vertical dependency, horizontal independence, parallel contributors, Decision Point branches, and split → independent development → verified reconvergence.

Reconvergence never erases branch provenance. A selected Stage-One route does not become a mathematical necessity merely because it is canonical for that stage.

## Accepted natural-number stages

```text
NAC-15 = ACCEPT
N-BLOCK-007 = accepted N-Core
NAA-18 = ACCEPT
N-ARITH-BLOCK-001 = accepted N-Arithmetic
```

Key reconvergence experiments include:

```text
addition       right recursion ↔ left recursion
multiplication right recursion ↔ left recursion
order          additive witness ↔ independent inductive order
```

## Accepted integer stage

Two integer representations were constructed and compared:

```text
signed canonical normal forms
        ↕
difference pairs + explicit equivalence
```

`Z-DP-001` selected signed normal forms as the Stage-One export while retaining the pair route.

```text
ZA-01..20 PASS
Z-J-002 PASS
ZA-21 ACCEPT
Z-BLOCK-002 = Accepted Stage-One Integer Interface
```

The mandatory post-Z reverse experiment is also closed. `Z-RE-J-001` classified the comparison as:

> **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**

The reverse route recovers substantial N-like interface structure but not the bottom-up construction/PDSA provenance.

## Accepted rational stage

Stage One constructs Q from accepted Z through explicit cancellation, fraction equivalence, quotient identity, field/order structure, and embedding/generation packages.

`Q-DP-001` selected:

```text
QBOMA := Quotient fracSetoid
```

as a **methodological/formalization choice**, not a claim that rationals must mathematically be quotient objects.

Final integration:

```text
Q-J-002   PASS / RESOLVED
QA-23     ACCEPT
Q-BLOCK-002 ACTIVE — ACCEPTED
run       32178326013 PASS
Lean      4.32.1
```

Retained Q alternatives remain Stage-II branch candidates and are not erased by the selected quotient route.

## Accepted real stage

The Stage-One R acceptance specification was written before selecting a completion representation. `R-DP-001` compared completion routes and selected Dedekind lower cuts while retaining the Cauchy route as a later branch candidate.

The accepted formal identity is:

```text
LowerCut over QBOMA
CutEquiv A B := ∀q, A.lower q ↔ B.lower q
RBOMA := Quotient cutSetoid
```

The accepted `R-BLOCK-001` package includes:

```text
faithful/order-exact Q embedding
0_R, 1_R, negation, addition, multiplication
nontrivial commutative field behavior at unique-witness inverse scope
total order
addition translation invariance
negation order reversal
nonnegative-factor multiplication monotonicity
positive inverse behavior
Dedekind least-upper-bound completeness
strict Q-image density
BOMA-natural Archimedean upper-bound characterization
```

The inverse interface is witness-based; no global Choice-backed inverse selector is required by the accepted contract.

Final acceptance evidence:

```text
R-J-002                 PASS / RESOLVED
RA-22                   ACCEPT
R-BLOCK-001             ACTIVE — ACCEPTED
workflow run            32374868448 PASS
verified commit         f07363c22b049a3fae028a927df74d4fb28a0680
Lean                    4.32.1
```

The accepted completeness scope is **Dedekind least-upper-bound completeness**. Stage One does not silently promote this to Cauchy, metric, sequential, or every other standard completeness notion.

## Post-R reverse engineering — closed

`PDSA-R-015 / RE-R-001` is `CLOSED / COMPLETE`.

Its central conclusion is that accepted R factors into:

```text
acceptance-required interface properties
+
selected Dedekind construction choices
+
explicit formal identity choice
+
localized logical commitments
+
reusable Q-level certified contributions
+
verification infrastructure
+
retained alternative branches
```

Acceptance certifies the selected realization and its exported properties; it does not turn the Dedekind route, quotient identity, localized classical comparability proof, multiplication architecture, or direct reciprocal route into universal mathematical necessities.

## Verification environment

The canonical verification environment is deliberately small:

```text
Lean toolchain       leanprover/lean4:v4.32.1
Lake packages        none
fixed toolchain      true
```

V5 workflows verify explicit dependency assemblies and record claim-level evidence. A monolithic type-check alone is not a substitute for the relevant acceptance gate or theorem-by-theorem evidence map.

## Current operational instruction

The project is handed over at a **closed R frontier**. Synchronization and provenance maintenance may proceed without changing the mathematical frontier. No C acceptance specification, Decision Point, Brick, Block, Lean payload, workflow, or PDSA construction cycle is authorized until a new explicit user order is given.
