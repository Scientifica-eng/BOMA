# STAGE_TWO_BRANCH_ORIGIN_LEDGER_001 — Architectural Branch Attachment

**Document ID:** `BOMA-ST2-ORIGIN-LEDGER-001`  
**Status:** `ACTIVE / TWO CLOSED EXPERIMENTS / ST2-EXP-003 ACTIVE`  
**Date:** `2026-08-23`  
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

| Attribute | ST2-EXP-001 | ST2-EXP-002 |
| --- | --- | --- |
| Architectural attachment kind | `DEPENDENCY_EDGE` | `DECISION_POINT` |
| Exact changed origin | `BOMA-C-R-DEP-001` | `C-DP-001` |
| Upstream accepted unit | `R-BLOCK-001` | `R-BLOCK-001` |
| Baseline producer unit | `C-BLOCK-001 / C-ROUTE-P` | `C-BLOCK-001 / C-ROUTE-P` |
| Unchanged accepted export | `C-BLOCK-002 / CA-20` | `C-BLOCK-002 / CA-20` |
| First changed object | real-interface package | complex carrier / identity realization |
| Experimental alternative | explicit sixteen-field real interface | independent expression-normalization quotient field |
| Reconvergence | same selected carrier and same nine Claims | explicit inverse R-field isomorphism |
| Research Junction | no fabricated Junction | `ST2-EXP-002-PQ-J-001` |
| Canonical-acceptance change | none | none |
| Frozen Git origin | `b473d236309770762e102517ef8a79c628cb43ed` | `878a52c3d833b9db9ea66f1ff4fcd207ca6ab498` |
| Exact verification evidence | `32593045224` | `32597346281` |
| Result | `CLOSED / PASS` | `CLOSED / PASS` |

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

## 6. ST2-EXP-003 — independent real completion decision

Architectural attachment:

```text
Q-BLOCK-002 / accepted rational ordered field
   --> R-DP-001
       |-- selected accepted Dedekind / R-BLOCK-001
       '-- retained Cauchy / ACTIVE RESEARCH / NOT ACCEPTED
                 |
       downstream affected C-BLOCK-001 / accepted C-BLOCK-002
```

The typed origin is a real **DECISION_POINT**, not a new Brick or Block.
`Q-BLOCK-002` is the common independent input; `R-BLOCK-001` is the
accepted reference to compare against later, never an upstream dependency
for an allegedly independent Cauchy producer. All twelve R and nine C
Claim families form the explicitly recorded affected cone.

Frozen accepted Git origin: `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`.
Immutable Plan commit: `70dd2f307eba69d7309a90cc36ae6f49741abddd`.
Current status: `ACTIVE / NO VERIFIED COMPLETION / NO RESEARCH JUNCTION`.
Independent quotient/faithful rational embedding: exact V5 `32630874354`
at source `557fe02ea0c531aa9c1d7a8b8d83712e10d7eaa1`; 365 internal
declarations and zero selected-Dedekind declarations. This verifies only a
foundation milestone, not an ordered real field or a completeness theorem.
Independent additive quotient: exact V5 `32632176869` at source
`8cfb44c13ba5354baba416bc787eac30fb306577`; 394 declarations, zero
selected-Dedekind declarations, and an explicit faithful-Q field in the
additive certificate. Eventual symmetric boundedness then passed exact V5
`32632806907` at source `34769d190df49dc95bf9050e86bd85f5c6c050bb`;
the extracted closure contains 407 declarations and zero selected-Dedekind
declarations. Multiplication, field, and completeness remain open.
The signed interval-product estimate and exact product-difference identity
passed exact V5 `32633183941` at source
`02cfe95d16d87fabebc885d729d589bbf6ca8498`; its 418-declaration closure
also contains zero selected-Dedekind declarations. It is not yet a quotient
multiplication operation.
The old accepted R and C exports, both prior experiments, and selected
`C-ROUTE-P` are unchanged. No comparison Junction is claimed before
independent Cauchy completion and exact V5 evidence exist.

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
failures, and research-status constraints are in the machine-readable
companion JSON. The governance audit rejects missing or contradictory
attachments.
