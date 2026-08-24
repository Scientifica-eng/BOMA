# STAGE_TWO_BRANCH_ORIGIN_LEDGER_001 — Architectural Branch Attachment

**Document ID:** `BOMA-ST2-ORIGIN-LEDGER-001`  
**Status:** `CLOSED FRONTIER / THREE CLOSED EXPERIMENTS / NO ACTIVE EXPERIMENT`  
**Date:** `2026-08-24`  
**Machine-readable authority:**
`LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json`

## 1. Git ancestry is not mathematical attachment

A frozen Git source commit identifies the historical repository state from
which an experiment was opened. It does not identify the architectural unit
or dependency edge whose choice changes.

Every controlled experiment therefore records **both**:

```text
Git origin           = exact frozen accepted commit + immutable PDSA Plan
architectural origin = typed Brick / Block / Decision / dependency edge / Claim
```

A dependency-edge experiment must not be relabeled as a Brick. A completed
research producer must not be silently promoted to an accepted canonical
Block. Historical Plans remain immutable; this ledger is a later,
explicitly dated cross-reference.

Allowed attachment types are:

```text
BRICK
BLOCK
DECISION_POINT
DEPENDENCY_EDGE
CLAIM
SUPPORTING_LEMMA
```

## 2. Shared accepted baseline

```text
R-BLOCK-001
   -- BOMA-C-R-DEP-001 -->
C-DP-001
   -- SELECTS / C-ROUTE-P -->
C-BLOCK-001
   -- accepted same-carrier C-J-001 -->
C-BLOCK-002 / CA-20 ACCEPT
```

`C-J-001` is the canonical accepted same-carrier integration Junction. A
Stage-Two representation-reconvergence Junction is a different **research**
object and must not replace it.

## 3. Closed experiment attachment matrix

| Attribute | ST2-EXP-001 | ST2-EXP-002 | ST2-EXP-003 |
| --- | --- | --- | --- |
| Architectural attachment kind | `DEPENDENCY_EDGE` | `DECISION_POINT` | `DECISION_POINT` |
| Exact changed origin | `BOMA-C-R-DEP-001` | `C-DP-001` | `R-DP-001` |
| Upstream accepted unit | `R-BLOCK-001` | `R-BLOCK-001` | `Q-BLOCK-002` |
| Baseline producer unit | `C-BLOCK-001 / C-ROUTE-P` | `C-BLOCK-001 / C-ROUTE-P` | `R-BLOCK-001 / R-ROUTE-D` |
| Unchanged accepted export | `C-BLOCK-002 / CA-20` | `C-BLOCK-002 / CA-20` | `R-BLOCK-001` and downstream `C-BLOCK-002 / CA-20` |
| First changed object | real-interface package | complex carrier / identity realization | real completion carrier / identity realization |
| Experimental alternative | explicit sixteen-field real interface | independent expression-normalization quotient field | independent rational Cauchy completion field |
| Reconvergence | same selected carrier and same nine Claims | explicit inverse R-field isomorphism | explicit Dedekind/Cauchy field isomorphism + research R Junction |
| Research Junction | no fabricated Junction | `ST2-EXP-002-PQ-J-001` | `ST2-EXP-003-DEDEKIND-CAUCHY-R-JUNCTION-001` |
| Canonical-acceptance change | none | none | none |
| Frozen Git origin | `b473d236309770762e102517ef8a79c628cb43ed` | `878a52c3d833b9db9ea66f1ff4fcd207ca6ab498` | `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d` |
| Exact verification evidence | `32593045224` | `32597346281` | final exact-head critical runs `32727267231 / 32727267177 / 32727267183` |
| Result | `CLOSED / PASS` | `CLOSED / PASS` | `CLOSED / PASS` |

Current Stage-Two lifecycle frontier:

```text
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT = OPEN / OWNER SELECTION REQUIRED
```

## 4. ST2-EXP-001 — dependency-edge experiment

Architectural attachment:

```text
R-BLOCK-001
   -- BOMA-C-R-DEP-001 / accepted-real interface packaging -->
C-BLOCK-001 / selected Route P
   --> C-BLOCK-002 / unchanged accepted export
```

The alternative consumes sixteen explicitly supplied accepted-real fields
instead of the entire twenty-five-field integration package. It retains the
original selected complex carrier, operations, and nine Claim meanings.

This experiment does not originate at an independently named C Brick, nor
does it create one. Its origin is the consumer-side packaging of an existing
accepted dependency **edge**.

## 5. ST2-EXP-002 — decision-point experiment

Architectural attachment:

```text
R-BLOCK-001
   -- BOMA-C-R-DEP-001 -->
C-DP-001
   |-- selected accepted C-ROUTE-P / C-BLOCK-001
   '-- retained research C-ROUTE-Q / independent quotient field
             |
   ST2-EXP-002-PQ-J-001 / verified research R-field isomorphism
```

Route Q is an independently verified formal-expression normalization
quotient field. It is **not** an independently implemented full polynomial
ring `R[X]`, is **not** the canonical accepted export, and does **not** alter
`CA-20`.

The research Junction preserves zero, one, negation, addition,
multiplication, the accepted-real embedding, and the distinguished
imaginary generator. Its maps are mutually inverse; incoming Route Q was
proved independently before Route P entered the comparison assembly.

The first synchronized architecture head exposed cross-stage failure
`32599546288`: an identifier shaped like a canonical Junction was mistaken
for an actual canonical `UNIT.md`. The repository-wide auditor now resolves
research Junctions through this origin ledger, requires their real experiment
record and explicit nonaccepted scope, and keeps them distinct from accepted
filesystem-grounded units.

The first post-merge `main` architecture run, workflow execution `#26` on
commit `c5981ef8e6bdd092edd0bb8dd7a6258007636fce`, exposed a separate
freshness-boundary error: twelve research Lean sources shared the accepted
`CStage` directory, but none belonged to `C_ACCEPTED_INPUTS.txt`. Accepted C
freshness now follows all six actual manifest-listed C sources while keeping
the manifest itself protected; research sources do not silently become
accepted inputs merely by sharing their directory.

## 6. ST2-EXP-003 — closed independent real-completion decision experiment

Architectural attachment:

```text
Q-BLOCK-002 / accepted rational ordered field
   --> R-DP-001
       |-- selected accepted Dedekind / R-BLOCK-001
       '-- retained Cauchy / VERIFIED RESEARCH / NOT ACCEPTED
                 |
                 +-- H5 verified Dedekind/Cauchy field isomorphism
                 +-- ST2-EXP-003-DEDEKIND-CAUCHY-R-JUNCTION-001
                 '-- H6 Cauchy-native C-BLOCK-001 core rebuild
       downstream accepted C-BLOCK-001 / C-BLOCK-002 remain unchanged
```

The typed origin is a real **DECISION_POINT**, not a new Brick or Block.
`Q-BLOCK-002` is the common independent input. The accepted `R-BLOCK-001`
Dedekind producer is a comparison baseline, not a mathematical dependency of
the independently assembled Cauchy producer. All twelve R and nine C Claim
families remain the recorded impact cone.

Frozen accepted Git origin: `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`.  
Immutable Plan commit: `70dd2f307eba69d7309a90cc36ae6f49741abddd`.  
Final lifecycle status: `CLOSED / PASS / H1-H6 EXACT PASS / MATHEMATICAL PASS`.

The owner authorized lifecycle closure on 2026-08-24 after the exact-verified
experiment tree had been merged to `main`. The machine ledger therefore now
carries a top-level `verified_run`, final verified head, explicit research
Junction ID, merge identity, and lifecycle closure record. The single-active
experiment slot is released; no next experiment is selected by this action.

### 6.1 Independent Cauchy real route

The retained progression reached an independently verified totally ordered
field and Cauchy/Dedekind-style LUB contract. Key exact milestones include:

```text
ordered ring       run 32634312486
ordered field      run 32637591596
Cauchy completion  run 32641010707
LUB H4             run 32643579395
```

H4 exact source head: `0f4a706d94c394b8e8a9eec836859caac772a944`.  
H4 final axiom surface: `[propext, Classical.choice, Quot.sound]`.

### 6.2 H5 Dedekind/Cauchy comparison and research Junction

The two completed real producers are connected by explicit mutually inverse
maps preserving order, rationals, addition, multiplication, and inverse
witness relations.

Field-isomorphism exact evidence:

```text
source head  2a875cdb93ed5b62fe1cc54a189b4c7d2d46eb0b
run          32718253596
artifact     9516753847
sha256       e913d04cf98c305f5f9ac55904d0a2d987c00bc2109b1a5b2b3371e4fac005e6
```

Verified research R Junction exact evidence:

```text
source head  7604590e73425b68de5500042d57f0a1c3abcde3
run          32718925270
artifact     9516996491
sha256       0bec7afedf24e52cf8fd4ea04360b42f42c689e28d2fdfb54c52217f0f5f43e0
```

The closed-experiment research Junction ID is
`ST2-EXP-003-DEDEKIND-CAUCHY-R-JUNCTION-001`. It is research evidence only.
It is not `R-BLOCK-001`, does not replace accepted `R-ROUTE-D`, and does not
alter the accepted export.

### 6.3 H6 downstream Cauchy-native C rebuild

H6 rebuilds directly over `RCBOMA`, using the independent Cauchy mathematical
assembly rather than transporting through H5/Dedekind sources. It establishes
the seven selected `C-BLOCK-001` core meanings: carrier, real embedding,
field/witness-field behavior, distinguished `I`, generation, unique real
coordinates, and nonreality of `I`.

Exact H6 evidence:

```text
source head  ea5fdb61fcbafb0ece463910c24ef71183443b19
run          32719705824
artifact     9517267487
sha256       cf296c8daf92c9cfe9e54986b93b6101ea225aad79c1c7388ad6d3ae13ae5a0e
root         BOMA.C.StageTwo.CauchyQuadratic003.cauchyQuadraticFieldCertificate
axioms       [propext, Classical.choice, Quot.sound]
```

H6 does **not** claim that the accepted `CQuadraticComparison001` abstraction
was generalized to an arbitrary real scalar carrier. Accepted
`C-COMPARE-BLOCK-001`, `C-BLOCK-002`, `C-ROUTE-P`, and `CA-20` remain
unchanged. That architecture-genericity opportunity is recorded separately as
future candidate `ST2-EXP-011` and is not authorized for execution.

### 6.4 Final mathematical Study / Act and later owner disposition

`LAB/PDSA/experiments/ST2-EXP-003_FINAL_STUDY_ACT_001.md` historically records
the mathematical conclusion reached before owner merge/lifecycle disposition:

```text
ST2-EXP-003 MATHEMATICAL RESULT:       PASS
RESEARCH R JUNCTION:                   KEEP AS VERIFIED RESEARCH EVIDENCE
CANONICAL R-DP-001 SELECTION:          RETAIN DEDEKIND
ACCEPTED R-BLOCK-001:                  UNCHANGED
CANONICAL C-DP-001 / C-ROUTE-P:        RETAIN
ACCEPTED C-BLOCK-001 / C-BLOCK-002:    UNCHANGED
CA-20:                                 UNCHANGED
PROMOTE CAUCHY R TO ACCEPTED EXPORT:   NO
PROMOTE H6 C TO ACCEPTED EXPORT:       NO
```

The later owner-authorized lifecycle transition is recorded separately in:

`LAB/PDSA/experiments/ST2-EXP-003_LIFECYCLE_CLOSURE_001.md`.

### 6.5 Final exact-head re-verification, merge, and closure

The final synchronized branch head
`3d4ed58e5d88b2a0bd84b3958cac2c8572385152` passed the three critical V5
workflows:

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

The accepted C regression workflows on that same head also passed. PR #8 then
merged that exact tree into `main` as
`5431ac81e7327f5bf4b06b3ab7fdb2bcb5b69efd`; the merge tree is identical to
the verified branch tree.

Owner-authorized lifecycle closure followed. Final state:

```text
ST2-EXP-003 = CLOSED / PASS
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT = OPEN / OWNER SELECTION REQUIRED
```

## 7. Required fields for future controlled branches

Before a new cycle leaves Plan, record:

```text
experiment_id
origin_kind
origin_id
source_unit_id
target_unit_id
baseline_producer_unit_id
accepted_export_unit_id
changed_factor
preserved_controls
first_divergence
affected_cone
frozen_reference_commit
frozen_plan
experimental_product_status
reconvergence strength / Junction only when justified
verified evidence after execution
```

Do not retroactively modify a previously frozen Plan to fill a missing field.
Add an explicitly dated supplementary ledger entry instead.

The exact source-unit paths, frozen Plans, affected Claim IDs, retained
failures, exact H5/H6 evidence, research-status constraints, merge identity,
and lifecycle closure are in the machine-readable companion JSON. The
closure-aware governance audit rejects missing or contradictory attachments.