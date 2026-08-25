# STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001 — Controlled Research Laboratory

**Status:** `ST2-EXP-001..004 + ST2-EXP-011 + ST2-EXP-014 CLOSED / PASS / LESSONS INTEGRATED / ST2-RP-001 OWNER_AUTHORIZED / ST2-EXP-015 GATE C EXACT PASS / WAITING_CI FOR DURABLE SYNC / GATE D NOT STARTED`  
**Prerequisites:** `CA-20 ACCEPT`, `RE-C-001 COMPLETE`, `RE-STAGE1-001 COMPLETE`  
**Frozen-reference discipline:** every experiment freezes its accepted baseline independently; historical Plans/Study/Act/failure/closure records are immutable.  
**Current program authority:** `LAB/PDSA/RESEARCH_PROGRAM_ST2_RP_001_R_C_COMPOSITIONALITY_MINIMALITY.md`.

---

## Current execution state

```text
AUTONOMOUS RESEARCH PROGRAM: ST2-RP-001 / OWNER_AUTHORIZED
AUTHORIZED QUEUE: ST2-EXP-014 → ST2-EXP-015 → ST2-EXP-016 → ST2-EXP-017
ACTIVE EXPERIMENT: ST2-EXP-015
ACTIVE STATE: WAITING_CI
QUEUE CURSOR: 1 / ST2-EXP-015
SYNCHRONIZED MAIN BASELINE: 2a6c38af70e596c840ef2db4733421bde38f3ee5
FROZEN PLAN: LAB/PDSA/PDSA-ST2-EXP-015_CAUCHY_ROUTE_COMPOSITION_SQUARE.md
FROZEN PLAN COMMIT: 1accee613630ae876b6ca9dcf820737ab89a168c
RESEARCH BRANCH: feature/stage-two-st2-exp-015-cauchy-route-composition-square
ORIGIN: DECISION_POINT / C-DP-001
GATE A: RECORDED
GATE B: EXACT PASS
GATE C: EXACT PASS
GATE-C VERIFIED HEAD: 8b8d8413a3638eb8f4f4d738d3cf1a2a12c866bd
STATE-SYNC VERIFIED HEAD: 19da18d02a5b5a8620671bdd39de1be8d149ec15
DURABLE REGISTER/LEDGER SYNC: PRESENT IN CURRENT COMMIT / EXACT CI PENDING
GATE D: NOT STARTED
PREVIOUS TRANSITION: 014 → 015 / AUTO_CONTINUE PASS
NEXT EXPERIMENT: ST2-EXP-016 / AUTHORIZED / QUEUED / WAITING 015 TRANSITION GATE
ROUTINE MERGE AUTHORITY: TRUE WITHIN EXACT PROGRAM-SCOPE GATES
REQUIRED NEXT ACT: exact-verify this Gate-C durable synchronization head; begin Gate D only if clean
```

`ST2-EXP-014` is closed `PASS`, exact-verified, merged, and integrated as bounded
producer-substitutability knowledge. No accepted or selected architecture changed.

`ST2-EXP-015` has an immutable Frozen Plan and Do is active. Gate A is recorded;
Gate B and Gate C are exact-verified `PASS`. Gate C established the independent
Cauchy Route-Q field closure on exact head
`8b8d8413a3638eb8f4f4d738d3cf1a2a12c866bd`. The current action is governance
synchronization only: this register and the permanent origin ledger now record
that exact result, but Gate D remains blocked until the synchronization head
itself passes exact-head V5. The single scientific factor remains fixed Cauchy
`RCBOMA` with C realization Route P → Q.

### Immutable historical ST2-EXP-004 final sentinel

The following literals describe the closed 004 lifecycle's own final frontier.
Historical read-only 004 audits may match them; they do **not** override the
later owner-authorized current program and active 015 state:

```text
NEXT EXPERIMENT: NOT AUTHORIZED
STOP BEFORE NEW EXPERIMENT
AUTONOMOUS RESEARCH PROGRAM = NO_ACTIVE_PROGRAM
```

---

## Experiment register — completed experiments

| ID | Architectural origin | Frozen Plan | Final state | Acceptance effect |
| --- | --- | --- | --- | --- |
| `ST2-EXP-001` | `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` | `PDSA-ST2-EXP-001_NARROW_R_INTERFACE.md` | `CLOSED / PASS / INTEGRATED` | none; sixteen-property R→C production lesson integrated |
| `ST2-EXP-002` | `DECISION_POINT / C-DP-001` | `PDSA-ST2-EXP-002_INDEPENDENT_QUOTIENT_ROUTE.md` | `CLOSED / PASS / INTEGRATED` | none; Route P remains selected, Route Q remains research-only |
| `ST2-EXP-003` | `DECISION_POINT / R-DP-001` | `PDSA-ST2-EXP-003_INDEPENDENT_CAUCHY_REAL_ROUTE.md` | `CLOSED / PASS / INTEGRATED` | none; Dedekind remains selected, Cauchy evidence remains research-only |
| `ST2-EXP-011` | `BLOCK / C-COMPARE-BLOCK-001` | `PDSA-ST2-EXP-011_C_COMPARISON_INTERFACE_GENERALIZATION.md` | `CLOSED / PASS / INTEGRATED` | no accepted refactor; comparison-interface lesson integrated |
| `ST2-EXP-004` | `DECISION_POINT / R-DP-003` | `PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md` | `CLOSED / PASS / ARCHITECTURE LESSON INTEGRATED` | none; Stage-I localized classical totality provider retained |
| `ST2-EXP-014` | `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` | `PDSA-ST2-EXP-014_CAUCHY_NATIVE_FULL_C.md` | `CLOSED / PASS / INTEGRATED` | none; full C target reproduced over Cauchy with Route P fixed |

---

## ST2-RP-001 — owner-authorized experiment queue

The identifiers `ST2-EXP-005..013` belong to the historical candidate inventory
opened with Stage Two at commit `b473d236309770762e102517ef8a79c628cb43ed`.
They were suggestions, not approved experiments. Their historical meanings are
preserved and their IDs are not reused.

| Order | ID | Architectural origin | Intended single change | State |
| ---: | --- | --- | --- | --- |
| 1 | `ST2-EXP-014` | `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` | selected C Route-P scalar producer `RBOMA/Dedekind` → independently verified `RCBOMA/Cauchy`; C Route-P meaning fixed | `CLOSED / PASS / MERGED / INTEGRATED` |
| 2 | `ST2-EXP-015` | `DECISION_POINT / C-DP-001` | with Cauchy scalar producer fixed, C realization Route P → Route Q | `ACTIVE / GATE C EXACT PASS / DURABLE SYNC CI PENDING / GATE D NOT STARTED` |
| 3 | `ST2-EXP-016` | `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` | production `orderTotal` → one exact frozen non-order algebraic nondegeneracy condition | `OWNER_AUTHORIZED / QUEUED / WAITING 015 TRANSITION` |
| 4 | `ST2-EXP-017` | `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` | concrete real scalar specialization → abstract field `K` satisfying exactly the interface verified by 016 | `OWNER_AUTHORIZED / QUEUED / WAITING TRANSITION` |

The exact objectives, controls, transition dependencies, merge authority, stop
conditions, and completion rule are governed by the immutable program
authorization record.

---

## ST2-EXP-015 authority — Gate-C exact PASS, durable synchronization pending exact CI

```text
origin                         DECISION_POINT / C-DP-001
synchronized main baseline     2a6c38af70e596c840ef2db4733421bde38f3ee5
transition record              LAB/PDSA/experiments/ST2-RP-001_TRANSITION_014_TO_015_001.md
origin record                  LAB/PDSA/experiments/ST2-EXP-015_BRANCH_ORIGIN_RECORD_001.json
research branch                feature/stage-two-st2-exp-015-cauchy-route-composition-square
changed factor                 C realization over fixed Cauchy RCBOMA: Route P → Route Q
fixed scalar producer          RCBOMA / Cauchy
accepted control               C-DP-001 selected Route P / accepted C unchanged
Frozen Plan                    LAB/PDSA/PDSA-ST2-EXP-015_CAUCHY_ROUTE_COMPOSITION_SQUARE.md
Frozen Plan commit             1accee613630ae876b6ca9dcf820737ab89a168c
Do                             STARTED
Gate A                         RECORDED
Gate B                         EXACT PASS
Gate-B verified head           5282e9fcb9f5996d24e315ca71821bd812331622
Gate-B V5 run                  32877801503
Gate-B V5 job                  97899880320
Gate-B artifact                9574581421
Gate-B artifact sha256         b441b5f37d2d608111f362926aaf1cf243f05045601896e21a58ea17b0797d02
Gate C                         EXACT PASS
Gate-C verified head           8b8d8413a3638eb8f4f4d738d3cf1a2a12c866bd
Gate-C V5 run                  32890748451
Gate-C V5 job                  97941857655
Gate-C artifact                9579342082
Gate-C artifact sha256         f393c585bbbc0ff438010b6d6d1dad2da434d3ad39a7676b0b7a2f67540b690e
Gate-C state-sync head         19da18d02a5b5a8620671bdd39de1be8d149ec15
Gate-C state-sync V5 run       32894420292
Gate-C state-sync V5 job       97953582697
Gate-C state-sync artifact     9580672508
Gate-C state-sync sha256       1e236121ed9ffc0e35b4300ba0649f82ab00a8bdb28f63290d57016b62852950
Gate D                         NOT STARTED / BLOCKED PENDING DURABLE-SYNC EXACT CI
accepted promotion             NONE / NOT AUTHORIZED
```

Target square:

```text
                    C-ROUTE-P          C-ROUTE-Q
R-ROUTE-D/Dedekind     verified           verified
R-ROUTE-C/Cauchy       verified by 014    native carrier/extractor + independent field exact PASS; nine-Claim Gate-D package pending
```

Gate B verified the independent Cauchy Route-Q carrier/normalization/extractor
surface and its declaration closure without importing Dedekind/H5/002/Route-P
implementation producers. Gate C then verified the native Route-Q ring/field
closure on the same frozen Cauchy scalar producer, with no Route-P transport and
no new ST2-EXP-015 global choice selector. The remaining Gate-D work is the
research-only nine-Claim semantic package prescribed by the Frozen Plan; it may
begin only after the present register/origin-ledger synchronization itself is
exact-verified.

Technical Gate-C failure provenance is preserved in:

```text
LAB/PDSA/experiments/ST2-EXP-015_FAILURE_001_GATE_C_DUPLICATE_REWRITE.md
LAB/PDSA/experiments/ST2-EXP-015_FAILURE_002_GATE_C_INHERITED_CHOICE_AUDIT_FALSE_POSITIVE.md
LAB/PDSA/experiments/ST2-EXP-015_FAILURE_003_GATE_C_STATE_SYNC_STATUS_DRIFT.md
```

None of those failures changed the Frozen Plan, scientific factor, Claim cone,
route selection, accepted export/contract, logical regime, or queue order.

---

## ST2-EXP-014 authority — immutable closed record

```text
origin                         DEPENDENCY_EDGE / BOMA-C-R-DEP-001
frozen accepted reference      fff2400b65b2c9a260fb28defd907ce24387cb80
Frozen Plan commit             788ae14649f3245fd8d6ccd43f90038ffba7762b
Final Study/Act head           1e08cb127fc6aa5483706a913d24932f4d6a1f31
final exact closure head       19cc6541457b3e8c58ea4607198d2474cd293dc9
final V5 run                   32874585252
final V5 job                   97889361868
final artifact                 9573385989
final artifact sha256          a1970dfdb989428d4e6cb95f80bab4a202d7ede123a6c6b3578919d610f5661f
research/lifecycle merge       2a6c38af70e596c840ef2db4733421bde38f3ee5
architecture integration       BOMA-ST2-LEARNING-INTEGRATION-004
mathematical result            PASS / NINE-CLAIM CAUCHY-NATIVE SURFACE
accepted promotion             NONE
```

Verified decomposition:

```text
7 Claim families  H6_ALREADY_VERIFIED
1 Claim family    011_ALREADY_VERIFIED
1 Claim family    014_INTEGRATION_ONLY
```

The integrated lesson is producer substitutability/compositionality at the exact
tested C Claim surface, not a selection or acceptance change.

---

## ST2-EXP-004 authority — immutable historical record

```text
origin                         R-DP-003
frozen accepted reference      50f3031b8d2657cbe0710e73e5935d997d40e49b
frozen accepted tree           e4842acdf2b08c8db54b45d0798c36ee7565f351
candidate dossier commit       fd51041857d07cbf8e489c8683a907ea29866b17
Frozen Plan commit             89c9dc9154e7ca469e5c94c177be223205ee9dbd
Final Study/Act commit         6779d028c49f73757ea838c163d3968a982559fe
final exact closed head        1fe760de811ad2b176ead6f420b80ca1aab5ce46
research merge                 61adb8589c803e95e1b96ef38902320c8aa5df19
architecture integration       BOMA-ST2-LEARNING-INTEGRATION-003
mathematical result            PASS / EXACT F-04 IMPACT CLASSIFIED
same-carrier totality          NOT RECOVERED WITH CURRENT CUT INTERFACE
accepted promotion             NONE
```

Changed factor was exactly the selected F-04 provider
`cutComparability_classical / rLE_total_classical`. The accepted
`LowerCut/CutEquiv/RBOMA/CutLE/rLE` representation, operations, other localized
logical providers F-05/F-06/F-07, accepted manifests, and accepted exports were
controls.

### Gate closure

| Gate | Result | Scientific role |
| --- | --- | --- |
| A | PASS | exact declaration-level F-04 classification |
| B | PASS | no-F04 R whole-source survivor assembly |
| C | PASS | conditional `CutComparability` interface |
| D | PASS | same-carrier RTotality ↔ CutComparability boundary |
| E | PASS | C sensitivity to removal of only `orderTotal` |
| F | PASS | consolidated logical-cost comparison |

Gate-A classes:

```text
F04_DIRECT 8
F04_TRANSITIVE 7
F04_FREE 22
OTHER_CLASSICAL_ONLY 18
```

Gate B retained `77 / 88` accepted-manifest R files in the research-only
whole-source no-F04 survivor assembly.

Gate D established on the unchanged representation:

```text
RTotality ↔ CutComparability
```

No unconditional constructive `CutComparability` was recovered from the frozen
cut interface.

Gate E confirms seven of nine accepted C Claim families survive the measured
fifteen-property interface; current `C-CL-FIELD-001` and
`C-CL-INTEGRATION-001` proof closures do not. `C-CL-COMPARE-001` survives and
remains governed by the narrow ST2-EXP-011 comparison interface.

### Integrated interpretation

```text
conditional CutComparability ≠ constructive recovery
NO F-04 dependency ≠ fully constructive R
F-05 / F-06 / F-07 remain independent controls
formal declaration ancestry ≠ mathematical necessity
whole-source elaboration dependency ≠ theorem dependency
```

A located-cut redesign changes representation and remains outside `ST2-RP-001`.

### Immutable experiment records

```text
LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md
LAB/PDSA/experiments/ST2-EXP-004_GATE_A_DEPENDENCY_MAP_001.md
LAB/PDSA/experiments/ST2-EXP-004_GATE_B_NO_F04_SURVIVOR_ASSEMBLY_001.md
LAB/PDSA/experiments/ST2-EXP-004_GATE_C_CONDITIONAL_COMPARABILITY_001.md
LAB/PDSA/experiments/ST2-EXP-004_GATE_D_SAME_CARRIER_TOTALITY_001.md
LAB/PDSA/experiments/ST2-EXP-004_GATE_E_C_SENSITIVITY_001.md
LAB/PDSA/experiments/ST2-EXP-004_GATE_F_LOGICAL_COST_001.md
LAB/PDSA/experiments/ST2-EXP-004_FINAL_STUDY_ACT_001.md
LAB/PDSA/experiments/ST2-EXP-004_LIFECYCLE_CLOSURE_001.md
```

Failure records `ST2-EXP-004_FAILURE_001` through `015` remain preserved as
execution/governance evidence. Failures `014` and `015` record post-integration
final-stop schema/literal compatibility defects and do not alter the
mathematical PASS result.

Learning-to-Construction authority:

```text
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_003.md
```

---

## Acceptance firewall

The completed experiments, current program authorization, and program-scope
research must not by themselves promote a research producer or alter the
accepted reference:

```text
R-DP-001 SELECTS R-ROUTE-D
R-DP-003 SELECTS localized classical comparability for Stage I
R-BLOCK-001 accepted export
BOMA-C-R-DEP-001 sixteen-property production surface
C-DP-001 SELECTS C-ROUTE-P
C-J-001
C-BLOCK-002 / CA-20
```

`SELECTS ≠ DERIVES`; verified alternative ≠ accepted export; successful
experiment ≠ promotion. Conditional routine merge authority under `ST2-RP-001`
is limited to exact program-scope research/lifecycle and verified-knowledge
integration that passes the program's declared firewall.

---

## Transition / stop condition

Current transition authority is the exact `ST2-RP-001` queue and its
fail-closed gates:

```text
AUTO_CONTINUE only when prior lifecycle closes, exact evidence passes,
current main is synchronized/re-read, and the next queued experiment remains
scientifically valid with no required insertion/reordering.

Any sequence-critical prerequisite, queue/order change, Frozen-Plan factor
change, out-of-scope assumption, canonical/acceptance decision, or ambiguous
authority => OWNER_REQUIRED / STOP.
```

No experiment outside `ST2-EXP-014..017` is authorized by this program.
