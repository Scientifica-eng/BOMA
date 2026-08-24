# STAGE_TWO_BRANCH_ORIGIN_LEDGER_001 — Architectural Branch Attachment

**Document ID:** `BOMA-ST2-ORIGIN-LEDGER-001`  
**Status:** `FOUR CLOSED EXPERIMENTS / ST2-EXP-011 PASS / NO ACTIVE EXPERIMENT / 011 ARCHITECTURE INTEGRATION REQUIRED`  
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

`C-COMPARE-BLOCK-001` is the existing representation-neutral comparison Block
supporting `C-CL-COMPARE-001`. `C-J-001` is the separate canonical accepted
same-carrier integration Junction. A generic interface shared by multiple
producers is not automatically a Junction.

## 3. Closed experiment attachment matrix

| Attribute | ST2-EXP-001 | ST2-EXP-002 | ST2-EXP-003 | ST2-EXP-011 |
| --- | --- | --- | --- | --- |
| Attachment kind | `DEPENDENCY_EDGE` | `DECISION_POINT` | `DECISION_POINT` | `BLOCK` |
| Exact origin | `BOMA-C-R-DEP-001` | `C-DP-001` | `R-DP-001` | `C-COMPARE-BLOCK-001` |
| Common/upstream accepted unit | `R-BLOCK-001` | `R-BLOCK-001` | `Q-BLOCK-002` | `R-BLOCK-001` plus selected `C-BLOCK-001` comparison baseline |
| Unchanged accepted export | `C-BLOCK-002 / CA-20` | `C-BLOCK-002 / CA-20` | `R-BLOCK-001` and downstream `C-BLOCK-002 / CA-20` | `C-BLOCK-002 / CA-20` |
| First changed object | R→C interface package | C carrier/identity realization | R completion carrier/identity | comparison scalar carrier/operation hard-wiring |
| Experimental alternative | explicit 16-field production interface | expression-normalization quotient field | rational Cauchy completion field | generic scalar operations + explicit coordinate laws |
| Reconvergence / compatibility | same selected carrier/Claims | explicit inverse R-field isomorphism | explicit Dedekind/Cauchy isomorphism + research Junction | same generic comparison interface; **not a Junction** |
| Research Junction | none | `ST2-EXP-002-PQ-J-001` | `ST2-EXP-003-R-J-001` | none |
| Canonical-acceptance change | none | none | none | none |
| Frozen Git origin | `b473d236...` | `878a52c3...` | `ea920b6b...` | `b49826e5...` |
| Frozen Plan commit | historical Plan authority | historical Plan authority | `70dd2f30...` | `5cc05ef1...` |
| Exact final/pre-closure evidence | run `32593045224` | run `32597346281` | runs `32727267231 / 32727267177 / 32727267183` | head `ef116405...`, run `32753140129` |
| Result | `CLOSED / PASS` | `CLOSED / PASS` | `CLOSED / PASS` | `CLOSED / PASS` |

Current Stage-Two lifecycle frontier:

```text
ACTIVE EXPERIMENT = NONE
NEXT REQUIRED ACT = ST2-EXP-011 LEARNING-TO-CONSTRUCTION INTEGRATION
NEXT OWNER-SEQUENCED EXPERIMENT AFTER SYNCHRONIZED MAIN = ST2-EXP-004
ST2-EXP-004 = NOT ACTIVE / NO FROZEN PLAN
```

## 4. ST2-EXP-001 — dependency-edge experiment

Architectural attachment:

```text
R-BLOCK-001
   -- BOMA-C-R-DEP-001 / accepted-real interface packaging -->
C-BLOCK-001 / selected Route P
   --> C-BLOCK-002 / unchanged accepted export
```

The alternative consumes sixteen explicitly supplied accepted-real properties
instead of the entire accepted integration package. It retains the selected
complex carrier, operations, and nine Claim meanings. Its origin is the
consumer-side packaging of an existing dependency edge; no Brick or Junction
was fabricated.

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

Route Q and its Junction are permanent verified non-selected/non-acceptance
architecture. They do not alter `C-DP-001 SELECTS C-ROUTE-P`, `C-J-001`, or
`CA-20`.

Two historical governance failures exposed during this experiment remain
recorded in the machine ledger: research-Junction identifier classification and
accepted-manifest freshness boundaries. Neither was erased by later integration.

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

The common independent input is `Q-BLOCK-002`. The accepted Dedekind producer
is a baseline, not a mathematical dependency of the independent Cauchy
producer. All twelve R and nine C Claim families remain the recorded impact
cone.

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

Lifecycle authority remains:

`LAB/PDSA/experiments/ST2-EXP-003_LIFECYCLE_CLOSURE_001.md`.

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
does not create a new Block: it changes the scalar abstraction inside the
comparison machinery. It also creates no Junction because compatibility through
a common interface is not itself a proved reconvergence object.

Frozen accepted Git origin:

`b49826e58261a71634cd12756e8afda28920088f`.

Immutable Plan commit:

`5cc05ef1bea8e88787041c3bc30dd0aecf5412d4`.

Direct affected Claim: `C-CL-COMPARE-001`.  
Secondary audit Claim: `C-CL-INTEGRATION-001`.

### 7.1 Closure-derived interface

The comparison proof closure needs scalar:

```text
zero / one / neg / add / mul
```

plus explicit coordinate constructor, generation, uniqueness, and preservation
laws for zero, one, scalars, I, negation, addition, and multiplication.

It does not directly need scalar order, completeness, density, Archimedean
properties, field-law bundles, or inverse-existence/uniqueness fields.
Inverse-witness preservation transports a supplied witness rather than selecting
an inverse.

### 7.2 Accepted and native instances

The accepted RBOMA adapter preserves the old `Related` semantics definitionally
(`related_iff_accepted` by `rfl`).

The native H6 adapter uses `RCBOMA` and the H6 pair carrier directly. Its
mathematical assembly excludes H5 `cToD` transport and selected Dedekind/RBOMA
implementation sources.

Logical cost:

```text
generic comparison roots    no axioms
native H6 roots              [propext, Quot.sound]
accepted adapter roots       [propext, Classical.choice, Quot.sound]
```

The difference is inherited formal provenance, not generic-interface necessity.

### 7.3 Relation/function boundary

Totality and single-valuedness remain relation-level facts. Functional maps are
available only from explicit `CoordinateExtractor` data. No global coordinate or
inverse selector was introduced for convenience.

### 7.4 Final exact verification

Final green pre-closure head after preserving and correcting lifecycle-CI
compatibility failures:

`ef116405c08475ec8702d9177a5106d7d0bfe525`.

```text
ST2-EXP-011 workflow
  run      32753140129
  artifact 9529812715
  sha256   f7ec7a6d1fb88a8c59dbcc8ce04bd8d6c389a3b3d77bb6ed3c1f22dc629dd9b1
```

The same head passed the accepted C regressions and historical 002/003
preservation matrix. Preserved failures are documented in:

```text
LAB/PDSA/experiments/ST2-EXP-011_FAILURE_001_SOURCE_BOUNDARY_COMMENT_FALSE_POSITIVE.md
LAB/PDSA/experiments/ST2-EXP-011_FAILURE_002_HISTORICAL_LIFECYCLE_CI_SCOPE.md
```

Final Study/Act:

`LAB/PDSA/experiments/ST2-EXP-011_FINAL_STUDY_ACT_001.md`.

Lifecycle closure:

`LAB/PDSA/experiments/ST2-EXP-011_LIFECYCLE_CLOSURE_001.md`.

Final lifecycle status:

```text
ST2-EXP-011 = CLOSED / PASS
experimental generic layer = VERIFIED RESEARCH / NOT ACCEPTED REFACTOR
durable architecture lesson = YES / INTEGRATION REQUIRED
accepted R/C and SELECTS = UNCHANGED
new Block / Decision / Junction = NONE
```

## 8. Historical closure versus current frontier

ST2-EXP-011 exposed a governance distinction that is now explicit:

```text
historical experiment closure = monotone evidence
current active/frontier state  = time-varying program state
```

The strict 001--003 no-active closed-frontier audit remains reproducible for its
historical epoch. Later experiments verify preservation through
`stage_two_historical_closure_audit.py` instead of reinterpreting a closed
experiment as requiring an empty global frontier forever.

This is governance knowledge, not a mathematical change to 001--003 or 011.

## 9. Required fields for future controlled branches

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

The single-active slot is currently empty. The next required action is the
separate ST2-EXP-011 Learning-to-Construction integration. Only after that Act
is merged and `main` is synchronized/re-read may owner-sequenced `ST2-EXP-004`
receive its own Frozen Plan and independent branch.
