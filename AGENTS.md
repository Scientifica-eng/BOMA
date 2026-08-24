# AGENTS.md — BOMA continuation rules

Mandatory for AI agents and other automated collaborators.

## 1. Read current state before acting

Read, in order:

```text
README.md
LAB/PDSA/STATUS.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/experiments/ST2-EXP-003_LIFECYCLE_CLOSURE_001.md
LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md
LAB/PDSA/candidates/README.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md
LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md
LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md
LAB/00_ARCHITECTURE/TRUSTED_BASE.md
LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
```

Then read the DAG, acceptance specification, closure/PDSA record, Claim
register, and V5 index relevant to the requested stage.

Historical records are valid provenance for the state they captured. They do
not override later synchronized current-state authorities.

## 2. Current canonical state

```text
Pre-numerical layer   CALIBRATED
N-Core                ACCEPTED
N-Arithmetic          ACCEPTED
Z                     ACCEPTED
post-Z reverse N      CLOSED / COMPLETE
Q                     ACCEPTED
R                     ACCEPTED — R-BLOCK-001 / R-DP-001 selects Dedekind
RE-R-001              CLOSED / COMPLETE
C                     ACCEPTED — C-ROUTE-P / C-BLOCK-002 / CA-20
RE-C-001              CLOSED / COMPLETE
RE-STAGE1-001         CLOSED / COMPLETE
ST2-EXP-001           CLOSED / PASS
ST2-EXP-002           CLOSED / PASS
ST2-EXP-003           CLOSED / PASS / H1-H6 EXACT PASS
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT  OPEN / OWNER SELECTION REQUIRED
```

Canonical acceptance is unchanged by Stage-Two research:

```text
accepted R route       R-ROUTE-D / DEDEKIND
accepted R export      R-BLOCK-001
accepted C route       C-ROUTE-P
selected C producer    C-BLOCK-001
accepted C export      C-BLOCK-002 / CA-20 ACCEPT
```

Retained research alternatives remain noncanonical:

```text
C-ROUTE-Q
  VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN ACCEPTED EXPORT
  research Junction ST2-EXP-002-PQ-J-001

R-ROUTE-C / CAUCHY
  VERIFIED INDEPENDENT COMPLETE CAUCHY REAL FIELD
  NOT AN ACCEPTED REAL EXPORT
  research Junction ST2-EXP-003-DEDEKIND-CAUCHY-R-JUNCTION-001

H6 Cauchy-native C core
  VERIFIED RESEARCH EVIDENCE / NOT AN ACCEPTED EXPORT
```

## 3. Stage-Two lifecycle rule

All three owner-approved Stage-Two experiments are closed. There is
`NO ACTIVE EXPERIMENT`.

Do not start `ST2-EXP-004`, `ST2-EXP-011`, or any other candidate merely
because it is registered, high priority, or has a transferable dossier.

A new experiment requires, in order:

```text
explicit owner selection
→ current-main baseline confirmation
→ exact typed architectural origin
→ single changed factor and fixed controls
→ affected Claim cone
→ immutable new Frozen PDSA Plan
→ separate feature/research branch
→ independent Do / exact V5 evidence
→ Study / Act
→ separate lifecycle and merge decisions
```

Candidate documentation is not authorization.

## 4. ST2-EXP-003 closed-state facts

Architectural origin:

```text
Q-BLOCK-002
  → R-DP-001
      selected canonical route: R-ROUTE-D / DEDEKIND / R-BLOCK-001
      retained research route:  R-ROUTE-C / CAUCHY
```

Final exact-verified branch head:

`3d4ed58e5d88b2a0bd84b3958cac2c8572385152`.

Critical exact-head V5 evidence:

```text
Independent Cauchy Real Route
  run      32727267231
  artifact 9520001887
  sha256   e7c8e9959445e182eab133a11f7352fbf4a9a6ae270d7b81037b2008b663de8c

Dedekind-Cauchy Comparison / Research R Junction
  run      32727267177
  artifact 9520005288
  sha256   3ecf85142656442bad312ace22e62266a15de534fd228c106075247367cdbf34

Cauchy Quadratic Rebuild
  run      32727267183
  artifact 9520002118
  sha256   72475d7c6bc489bf532480f5075699f91304c4128b52e446275855e6a31555fa
```

PR #8 merged that exact-verified tree into `main` as
`5431ac81e7327f5bf4b06b3ab7fdb2bcb5b69efd`. The owner then explicitly
authorized lifecycle closure on 2026-08-24.

Closure authority:

`LAB/PDSA/experiments/ST2-EXP-003_LIFECYCLE_CLOSURE_001.md`.

Do not reinterpret closure as promotion of the Cauchy route or H6 C.

## 5. C acceptance-first rule

The accepted Stage-One semantic core is the unique quadratic real-coordinate
field presentation:

```text
faithful accepted-R embedding
commutative-field-strength behavior
distinguished I
I² = -1
every z has an expression a+bI with a,b in accepted R
that expression is unique
route-neutral comparison adequacy
```

Do not silently strengthen this to algebraic closure, FTA, analytic
completeness, a total order on C, or equivalence with a built-in Complex
carrier.

Never infer:

```text
C = R×R because coordinates are convenient
C = polynomial quotient because X²+1 presents the extension
selected route = mathematically necessary route
Lean identity = mathematical identity
standard notation a+bi = carrier definition
```

`C-DP-001` is resolved by explicit user ratification. `C-ROUTE-P` is the
selected `C-BLOCK-001` producer and `C-BLOCK-002 / CA-20` is the accepted
export. Route Q remains research-only.

## 6. R→C dependency rule

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

If C needs a real theorem absent from the accepted export, open an explicit
dependency question and classify it as derivable downstream, justified R
strengthening, representation-specific dependency, or new C-stage support.

## 7. Status authority

When status documents conflict, prefer:

```text
LAB/PDSA/STATUS.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
relevant current DAG / acceptance / closure records
claim-level V5 evidence
README.md / AGENTS.md
historical checkpoints and PDSA records
```

## 8. Method and topology

Use **PDSA — Plan, Do, Study, Act**. `PDCA` names are legacy provenance only.

Do not assume a linear chain. Classify forks as parallel dependency, Decision
Point branch, or exploratory PDSA branch. A Junction requires an explicit
compatibility/reconvergence question and evidence.

Reconvergence preserves route-specific assumptions and provenance. Never infer:

```text
same contribution ⇒ same history
selected route ⇒ universal necessity
visual meeting ⇒ verified convergence
```

## 9. Brick / Block / Claim discipline

Keep architectural types distinct:

```text
Brick          smallest independently reviewable/replaceable/branchable unit
Block          coherent package of Bricks and/or internal components
Junction       verified compatibility/reconvergence result
Decision Point explicit selection among alternatives
Claim          assertion layer independent of Brick/Block granularity
```

Do not manufacture Bricks merely for symmetry.

## 10. Accepted-stage discipline

An accepted Block or stage may be modified only with explicit impact analysis
against its governing acceptance contract and V5 lineage. Do not silently
weaken, strengthen, reinterpret, or broaden an accepted Claim.

For R:

```text
accepted carrier      RBOMA := Quotient cutSetoid
selected route        Dedekind lower cuts
accepted completeness Dedekind LUB completeness
inverse interface     existence + uniqueness witnesses
final gate            R-J-002 PASS
acceptance            RA-22 ACCEPT
```

These are accepted realization facts, not universal necessity claims.

## 11. Logical-commitment discipline

Do not collapse the construction into blanket labels such as “constructive” or
“classical.” Record localized logical commitments and their actual source
provenance.

Absence of a downstream `Classical` token does not prove independence from an
upstream classical producer.

If replacing a logical commitment, treat it as an explicit branch/reconstruction
problem with downstream acceptance impact.

## 12. Claim-transparency rule

For every promoted Claim maintain:

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

Do not introduce vague `OTHER`, `IMPLICIT`, or `UNKNOWN` categories into
certified closure.

## 13. Verification rules

V5 results must be mapped theorem-by-theorem/unit-by-unit. A type-checking
monolithic payload does not automatically PASS an acceptance Junction or matrix.

Before promoting evidence:

```text
verify the actual dependency closure
verify the exact intended commit/source state
record the exact toolchain and workflow run
preserve scientifically material failed/superseded attempts
never attach evidence to a source state that was not actually checked
```

Pinned toolchain:

```text
leanprover/lean4:v4.32.1
Lake packages: none
```

## 14. GitHub continuation rule

Do not begin new research directly on `main`. After explicit owner selection,
open a separate branch from a verified current `main` head and freeze the new
Plan there.

Do not merge research into `main` without an explicit user order.

Preserve research commits and historical branches; do not erase Learning Graph
provenance merely for visual cleanliness.

## 15. Cleanup rule

Distinguish operational debris from research provenance. Do not delete
historical failed experiments, retained alternatives, superseded evidence, old
Frozen Plans, or PDSA records merely because a later route succeeded.

## 16. Mandatory Stage-Two origin and prevention controls

Before proposing or executing another Stage-Two experiment, read:

```text
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_WORK_ERRORS_AND_PREVENTION_001.md
LAB/PDSA/STAGE_TWO_WORK_ERRORS_AND_PREVENTION_H4_001.md
LAB/PDSA/STAGE_TWO_WORK_ERRORS_AND_PREVENTION_POST_H6_001.md
LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md
```

Identify the exact typed origin, upstream and affected units, frozen accepted
baseline, changed factor, fixed controls, affected cone, evidence, and actual
research/acceptance status. Never invent a Brick for an edge, revise a Frozen
Plan, confuse a research Junction with a canonical Junction, treat identical
kernel axioms as identical source commitments, or skip exact-head governance
and Lean verification.

The current operational invariant is:

```text
ST2-EXP-001 CLOSED / PASS
ST2-EXP-002 CLOSED / PASS
ST2-EXP-003 CLOSED / PASS
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT REQUIRES EXPLICIT OWNER SELECTION
```