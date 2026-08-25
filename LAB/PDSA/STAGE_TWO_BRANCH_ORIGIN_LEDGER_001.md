# STAGE_TWO_BRANCH_ORIGIN_LEDGER_001 — Architectural Branch Attachment

**Document ID:** `BOMA-ST2-ORIGIN-LEDGER-001`  
**Status:** `FOUR CLOSED EXPERIMENTS / VERIFIED LESSONS INTEGRATED / ST2-EXP-004 ACTIVE / PLAN FROZEN`  
**Date:** `2026-08-25`  
**Machine-readable authority:** `LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json`

## 1. Git ancestry is not mathematical attachment

A frozen Git source commit identifies the historical repository state from
which an experiment was opened. It does not identify the architectural unit
or dependency edge whose choice changes.

Every controlled experiment therefore records both:

```text
Git origin           = exact frozen accepted commit + immutable PDSA Plan
architectural origin = typed Brick / Block / Decision / dependency edge / Claim
```

A dependency-edge experiment must not be relabeled as a Brick. A completed
research producer must not be silently promoted to an accepted canonical
Block. Historical Plans remain immutable; this ledger is an additive,
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
   -- BOMA-C-R-DEP-001 / 16-property production surface -->
C-DP-001
   -- SELECTS / C-ROUTE-P -->
C-BLOCK-001
   --> C-COMPARE-BLOCK-001 / comparison Claim
   --> C-J-001 / accepted same-carrier integration
   --> C-BLOCK-002 / CA-20 ACCEPT
```

`C-COMPARE-BLOCK-001` is the existing comparison Block supporting
`C-CL-COMPARE-001`. `C-J-001` is the separate canonical accepted integration
Junction. A generic interface shared by multiple producers is not automatically
a Junction.

`ST2-EXP-004` does not alter this accepted baseline by becoming active.

## 3. Experiment attachment matrix

| Attribute | ST2-EXP-001 | ST2-EXP-002 | ST2-EXP-003 | ST2-EXP-011 | ST2-EXP-004 |
| --- | --- | --- | --- | --- | --- |
| Attachment kind | `DEPENDENCY_EDGE` | `DECISION_POINT` | `DECISION_POINT` | `BLOCK` | `DECISION_POINT` |
| Exact origin | `BOMA-C-R-DEP-001` | `C-DP-001` | `R-DP-001` | `C-COMPARE-BLOCK-001` | `R-DP-003` |
| Frozen accepted reference | historical | historical | `ea920b6b...` | `b49826e5...` | `50f3031b...` |
| Frozen Plan commit | historical | historical | `70dd2f30...` | `5cc05ef1...` | `89c9dc91...` |
| First changed object | R→C interface package | C carrier/identity realization | R completion carrier/identity | comparison scalar hard-wiring | F-04 total-comparability logical provider |
| Accepted carrier/operations changed? | no | research alternative carrier only | research alternative carrier only | no | **no** |
| Canonical-acceptance change | none | none | none | none | none while active |
| Result | `CLOSED / PASS` | `CLOSED / PASS` | `CLOSED / PASS` | `CLOSED / PASS` | `ACTIVE / NO RESULT YET` |
| Learning integration | `INTEGRATED-001` | `INTEGRATED-001` | `INTEGRATED-001` | `INTEGRATED-002` | not applicable yet |

Current Stage-Two lifecycle frontier:

```text
ACTIVE EXPERIMENT = ST2-EXP-004
ST2-EXP-001..003 + ST2-EXP-011 = CLOSED / PASS / LESSONS INTEGRATED
ST2-EXP-004 Frozen Plan = 89c9dc9154e7ca469e5c94c177be223205ee9dbd
ST2-EXP-004 origin = DECISION_POINT / R-DP-003
CURRENT GATE = GATE A — EXACT F-04 DEPENDENCY MAP
```

## 4. ST2-EXP-001 — dependency-edge experiment

Architectural attachment:

```text
R-BLOCK-001
   -- BOMA-C-R-DEP-001 / accepted-real production interface -->
C-BLOCK-001 / selected Route P
   --> C-BLOCK-002 / unchanged accepted export
```

The experiment established the exact sixteen-property mathematical production
surface. It retained the selected complex carrier, operations, and accepted
Claim meanings. No Brick, Block, or Junction was fabricated.

## 5. ST2-EXP-002 — decision-point experiment

Architectural attachment:

```text
R-BLOCK-001
   -- BOMA-C-R-DEP-001 -->
C-DP-001
   |-- selected accepted C-ROUTE-P / C-BLOCK-001
   '-- retained C-ROUTE-Q / independent quotient field
             |
   ST2-EXP-002-PQ-J-001 / verified research R-field isomorphism
```

Route Q and its Junction are permanent verified non-selected/non-acceptance
architecture. They do not alter `C-DP-001 SELECTS C-ROUTE-P`, `C-J-001`, or
`CA-20`.

## 6. ST2-EXP-003 — closed independent real-completion decision experiment

Architectural attachment:

```text
Q-BLOCK-002
   --> R-DP-001
       |-- SELECTS Dedekind / R-BLOCK-001 ACCEPTED
       '-- R-ROUTE-C / Cauchy VERIFIED ALTERNATIVE
                 |
                 +-- H5 Dedekind/Cauchy field isomorphism
                 +-- ST2-EXP-003-R-J-001 research Junction
                 '-- H6 Cauchy-native complex-core rebuild
```

Frozen reference: `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`.  
Frozen Plan commit: `70dd2f307eba69d7309a90cc36ae6f49741abddd`.  
Final mathematical head: `3d4ed58e5d88b2a0bd84b3958cac2c8572385152`.  
Merged experiment commit: `5431ac81e7327f5bf4b06b3ab7fdb2bcb5b69efd`.  
Merge tree: `d515a2812e621af68406c30866ac9ece5460b1f9`.

Final exact critical evidence:

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

`R-DP-001` still SELECTS Dedekind; Cauchy/H5/H6 remain nonaccepted verified
research provenance.

## 7. ST2-EXP-011 — closed comparison-interface Block experiment

Architectural attachment:

```text
accepted R-BLOCK-001 / selected C-BLOCK-001
        ↓
C-COMPARE-BLOCK-001
        |
        | first divergence inside comparison presentation/relation:
        | RBOMA-hard-wired scalar boundary
        v
generic scalar operations + explicit quadratic-coordinate laws
        |\
        | \-- accepted RBOMA adapter / same Related semantics
        '-- native RCBOMA + H6 adapter / no H5 transport dependency
```

The typed origin is the existing **Block** `C-COMPARE-BLOCK-001`. The experiment
does not create a new Block and creates no Junction.

Frozen accepted Git origin:
`b49826e58261a71634cd12756e8afda28920088f`.

Immutable Plan commit:
`5cc05ef1bea8e88787041c3bc30dd0aecf5412d4`.

Direct affected Claim: `C-CL-COMPARE-001`.  
Secondary audit Claim: `C-CL-INTEGRATION-001`.

### 7.1 Closure-derived comparison interface

The direct comparison proof closure needs scalar:

```text
zero / one / neg / add / mul
```

plus explicit coordinate constructor, generation, uniqueness, and preservation
laws. This comparison surface is distinct from the sixteen-property
**production** surface of `BOMA-C-R-DEP-001`.

### 7.2 Final lifecycle evidence and merge

Preserved pre-closure checkpoint:

```text
head      ef116405c08475ec8702d9177a5106d7d0bfe525
run       32753140129
artifact  9529812715
sha256    f7ec7a6d1fb88a8c59dbcc8ce04bd8d6c389a3b3d77bb6ed3c1f22dc629dd9b1
```

Final lifecycle-closed evidence:

```text
head      632a7134f26daf9dd781e3546804941f429a4246
run       32754345656
artifact  9530261359
sha256    d93c6f1ec34858f6cbc1556e92b86a241f6399e6a3cf894204608a51d63de2e5
```

Research/lifecycle merge:

```text
merge commit 72394878854aa69e865d17567959bec1daa70e6d
parent 1     b49826e58261a71634cd12756e8afda28920088f
parent 2     632a7134f26daf9dd781e3546804941f429a4246
merge tree   168fc1267313810e622c2206fa8a91f24decb4b7
content drift from verified head = NONE
```

Learning-to-Construction authority:
`LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md`.

Permanent classification:

```text
ST2-EXP-011 = CLOSED / PASS / LESSON INTEGRATED
accepted Related semantics = unchanged
experimental generic Lean layer = research-only
accepted CQuadraticComparison001 = unchanged
accepted R/C and SELECTS = unchanged
new Block / Decision / Junction = none
```

## 8. ST2-EXP-004 — active R-DP-003 logical-regime experiment

Exact attachment:

```text
R-DP-002 / accepted quotient identity
        ↓
constructive rLE core
        ↓
R-DP-003
   baseline: localized F-04 classical CutComparability provider
   experiment: remove only that provider from the alternative assembly
        ↓
measure exact R/C dependency cone
```

Frozen authority:

```text
accepted reference  50f3031b8d2657cbe0710e73e5935d997d40e49b
accepted tree       e4842acdf2b08c8db54b45d0798c36ee7565f351
candidate dossier   fd51041857d07cbf8e489c8683a907ea29866b17
Frozen Plan commit  89c9dc9154e7ca469e5c94c177be223205ee9dbd
Frozen Plan path    LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
```

Single changed factor:

```text
remove only:
  BOMA.R.DedekindOrderClassical001.cutComparability_classical
  BOMA.R.DedekindOrderClassical001.rLE_total_classical

preserve:
  LowerCut / CutEquiv / cutSetoid / RBOMA
  CutLE / rLE
  constructive rLE_refl / rLE_trans / rLE_antisymm
  accepted operation definitions
  all accepted Q/R/C source manifests
  F-05 / F-06 / F-07 localized classical providers as controls
```

Known direct consumers before Gate A:

```text
RStageIntegrationCertificate.orderTotal
rPosNeg_decomposition
ST2-EXP-001 NarrowROrderedFieldCertificate.orderTotal
```

These are hypotheses/known direct references, not a substitute for the required
Gate-A declaration-closure matrix.

Current state:

```text
ST2-EXP-004 = ACTIVE / PLAN FROZEN
mathematical result = NONE YET
current gate = GATE A — EXACT F-04 DEPENDENCY MAP
accepted R/C = UNCHANGED
```

## 9. Historical closure versus current frontier

The repository explicitly distinguishes:

```text
historical experiment closure = monotone evidence
current active/frontier state  = time-varying program state
```

The 011 lifecycle audit now preserves every frozen, final-closed, merge, and
integration fact while permitting one later independently frozen active cycle.
A later active experiment must never mutate the historical closure records.

## 10. Required fields for controlled branches

Before a cycle leaves Plan, record:

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

## 11. Current sequence boundary

The single-active slot is occupied by `ST2-EXP-004`. No other Stage-Two
experiment may become active until 004 leaves the active state through an
explicit lifecycle disposition.

The next required action is exactly:

```text
ST2-EXP-004 GATE A — EXACT F-04 DEPENDENCY MAP
```
