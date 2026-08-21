# PDSA-ARCH-002 STATUS — Claim Transparency and Closure Program

**Status:** ACTIVE — THEOREM-LEVEL TRANSPARENCY CLOSED N-CORE→R; VIEW/GRAPH COMPLETION PENDING  
**Date:** 2026-08-21  
**Branch:** `architecture/claim-transparency-001`  
**Baseline:** `main@6bb10f16fba3caf171bebd1731a4d209832ae35b`  
**Mathematical frontier:** UNCHANGED  
**C:** `NOT STARTED — USER HOLD`

## Phase status

| Phase | Status | Result |
|---|---|---|
| A — Claim vocabulary / Trusted Base / Registry | **COMPLETE** | canonical Claim architecture, dependency classes, Trusted Base, project registry |
| B — accepted claim closures N→R | **COMPLETE** | human-readable accepted Claim closures independently mapped for N-Core, N-Arithmetic, Z, Q, R |
| C — Declared vs Actual formal closure | **COMPLETE FOR ALL CURRENTLY ACCEPTED EXPORTS** | independent theorem-level extraction, boundary classification, and Claim/producer ancestry comparison PASS with zero residuals for N-Core→R |
| D — granularity normalization | **ACTIVE / CALIBRATED** | provisional TCT pseudo-Brick defect corrected; promotion rule established; no symmetry-driven Brick fabrication authorized |
| E — Block/Junction/Decision mapping | **INITIAL CANONICAL MAP COMPLETE / FURTHER NORMALIZATION NON-BLOCKING** | Block→Claim map, Junction Ledger, Decision Ledger available; historical route provenance retained |
| F — machine-readable manifests / CI gates | **COMPLETE FOR N-CORE→R TRANSPARENCY** | shared extractor/classifier/comparator plus independent stage producer policies and CI evidence gates implemented |
| G — generated views | **PENDING** | machine-readable multi-stage closure is now stable enough to generate separate Construction, Claim, Decision/Junction, Logic/Trust, and Learning views |

The program is therefore **not yet marked CLOSED** solely because Phase G and final program-level closure reconciliation remain pending. The core theorem-level transparency objective is complete.

## Current mathematical state

```text
N-Core        ACCEPTED — NAC-15
N-Arithmetic  ACCEPTED — NAA-18
Z             ACCEPTED — ZA-21
post-Z reverse N  CLOSED
Q             ACCEPTED — QA-23
R             ACCEPTED — RA-22
RE-R-001      CLOSED / COMPLETE

C             NOT STARTED — USER HOLD
```

No mathematical stage was reopened or strengthened by `PDSA-ARCH-002`.

## Current machine-transparency state

```text
N-Core        MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
N-Arithmetic  MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
Z             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
Q             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
R             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
```

Certification records:

```text
LAB/20_FORMALIZATION/N_CORE/N_CORE_TRANSPARENCY_CERTIFICATION_001.md
LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_TRANSPARENCY_CERTIFICATION_001.md
LAB/20_FORMALIZATION/Z_STAGE/Z_TRANSPARENCY_CERTIFICATION_001.md
LAB/20_FORMALIZATION/Q_STAGE/Q_TRANSPARENCY_CERTIFICATION_001.md
LAB/20_FORMALIZATION/R_STAGE/R_TRANSPARENCY_CERTIFICATION_001.md
```

## Cross-stage machine evidence summary

| Stage | Root mode | Claims | Producers | Roots | Internal / owned | External boundary | Formal residuals | Claim residuals |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| N-Core | `producer_union` | 20 | 34 | 21 | 97 / 97 | 40 | 0 | 0 |
| N-Arithmetic | `producer_union` | 11 | 56 | 40 | 97 / 97 | 40 | 0 | 0 |
| Z | `producer_union` | 11 | 48 | 29 | 203 / 203 | 60 | 0 | 0 |
| Q | `producer_union` | 10 | 49 | 20 | 338 / 338 | 72 | 0 | 0 |
| R | `single_target` | 12 | 29 | 1 | 606 / 606 | 76 | 0 | 0 |

The root modes are intentionally not uniform. Tooling follows accepted architecture rather than changing the mathematics to force one packaging pattern.

## N-Core machine evidence

```text
workflow run      32455061955
audited source    ad9ec2850373cdd2a94d584d4c6035352d57ec75
Lean              4.32.1
extractor         PROTOTYPE_PASS
boundary          CLASSIFICATION_PASS
claim/producer    CLAIM_PRODUCER_PASS
```

Boundary:

```text
TRUSTED_METATHEORY      40
UNCLASSIFIED             0
```

N-Core preserves the distinction:

```text
pre-numerical TCT
  ≠ backend TCTNF / Generated verification representation
  ≠ fresh R-B formal carrier BOMANat
```

and independently retains constructional no-confusion Route B alongside formal datatype Route A.

## N-Arithmetic machine evidence

```text
workflow run      32454880229
audited source    ee082647af0537620716b896d824048a2bca9347
Lean              4.32.1
extractor         PROTOTYPE_PASS
boundary          CLASSIFICATION_PASS
claim/producer    CLAIM_PRODUCER_PASS
```

Boundary:

```text
TRUSTED_METATHEORY      40
UNCLASSIFIED             0
```

The first formal comparison passed with zero residuals. Its root policy deliberately includes computation equations for both recurse-right/recurse-left addition and multiplication routes and both accepted order routes, incorporating lessons from earlier stage calibration.

## Z machine evidence

Final successful comparison:

```text
workflow run      32454713809
audited source    8558fb5bf50a0cef07b3124bf882df03f56141e0
Lean              4.32.1
extractor         PROTOTYPE_PASS
boundary          CLASSIFICATION_PASS
claim/producer    CLAIM_PRODUCER_PASS
```

Boundary:

```text
TRUSTED_METATHEORY      60
UNCLASSIFIED             0
```

The Z audit preserves three reconvergence histories:

```text
signed representation       ↔ difference-pair representation
direct signed arithmetic    ↔ pair-mediated arithmetic
direct signed order         ↔ pair cross-sum order
```

## Q machine evidence

Calibrated successful comparison:

```text
workflow run      32416694028
audited source    87b635a15cb057a517e201f8fbf99b54296533b8
Lean              4.32.1
extractor         PROTOTYPE_PASS
boundary          CLASSIFICATION_PASS
claim/producer    CLAIM_PRODUCER_PASS
```

Later workflow-concurrency regression verification also passed:

```text
workflow run      32417291894
audited source    c4fa19a0d85de0a6f92957315b7e1a1ee565ca2a
```

Q boundary at calibration:

```text
TRUSTED_METATHEORY                      63
TRUSTED_FORMALIZATION_INFRASTRUCTURE     9
DECLARED_LOGICAL_COMMITMENT              0
UNCLASSIFIED                             0
```

## R machine evidence

Calibrated comparison after generic-tool regression verification:

```text
workflow run      32415977469
audited source    db827c7de13275e55bbe2dcbd320c409f2a1c9ee
Lean              4.32.1
extractor         PROTOTYPE_PASS
boundary          CLASSIFICATION_PASS
claim/producer    CLAIM_PRODUCER_PASS
```

Later workflow-concurrency regression verification also passed:

```text
workflow run      32417221728
audited source    2c2926b3567cb11fa93a3a4bea4464fdd86f79ce
```

R boundary at calibration:

```text
TRUSTED_METATHEORY                      65
TRUSTED_FORMALIZATION_INFRASTRUCTURE     9
DECLARED_LOGICAL_COMMITMENT              2
UNCLASSIFIED                             0
```

The two declared logical leaves remain explicit:

```text
Classical.em
Classical.byContradiction
```

## Learning Graph — retained theorem-transparency sequence

The program did not move directly from a declared architecture to a clean machine pass.

### R — hidden formal boundary discovery

```text
workspace/package-root execution defect
  ↓
5 semantic residuals
  ↓
2 residuals after generated/metatheory provenance classification
  ↓
1 residual after explicit localization of proposition decision
  ↓
0 residuals after removing proposition-extensionality proof artifacts
  ↓
Claim/producer ancestry PASS
```

The result made localized classical commitments explicit instead of leaving them hidden in elaboration/typeclass behavior.

### Q — producer over-declaration

```text
formal boundary PASS
  ↓
1 Claim/producer residual: zmul_ne_zero
  ↓
actual graph showed it is a retained helper, not an acceptance producer
  ↓
producer policy corrected without deleting theorem or fabricating consumption
  ↓
0 residuals
```

### Z — root undercoverage

```text
formal boundary PASS
  ↓
3 producer residuals:
  signed_roundtrip
  embedN_zero
  embedN_one
  ↓
all three are explicitly stated accepted properties
  ↓
added to audit-root surface rather than removed from ownership
  ↓
0 residuals
```

This is the opposite correction from Q and is preserved as such.

### N-Arithmetic — first-pass closure

The first comparison passed. Earlier stage lessons led the initial policy to include route computation equations as roots instead of treating only downstream canonical laws as the acceptance surface.

### N-Core — first-pass closure with epistemic boundary preserved

The first comparison passed. Definitions were used as formal roots for genuinely definitional accepted interfaces; named backend witnesses were used only where historical Claim/V5 ownership already justified them. Anonymous verification `example`s were not promoted into canonical Claim identities.

## Evidence-write concurrency learning

When multiple stage workflows were triggered by the same Claim Registry change, exact-HEAD evidence guards could cause one valid run to reject evidence after another stage wrote an evidence commit.

The transparency workflows now use:

```text
shared concurrency group:
  boma-formal-transparency-evidence-architecture-claim-transparency-001

cancel-in-progress: false
```

and evidence promotion checks only **verification-input drift** between the audited SHA and current branch head.

A run is rejected if stage payloads, manifest, Claim Registry, policy, audit tools, toolchain, or the stage workflow changed. Evidence/status-only movement does not invalidate a mathematically identical verification input set.

This preserves provenance without creating a cross-stage evidence-writing race.

## Machine-readable architecture now available

Shared machinery:

```text
LAB/00_ARCHITECTURE/FORMAL_DEPENDENCY_POLICY.json
LAB/00_ARCHITECTURE/tools/LeanDependencyExtractor.lean
LAB/00_ARCHITECTURE/tools/lean_dependency_audit.py
LAB/00_ARCHITECTURE/tools/formal_dependency_classify.py
LAB/00_ARCHITECTURE/tools/formal_claim_producer_compare.py
```

Stage producer policies:

```text
LAB/00_ARCHITECTURE/N_CORE_FORMAL_CLAIM_PRODUCER_POLICY.json
LAB/00_ARCHITECTURE/N_ARITH_FORMAL_CLAIM_PRODUCER_POLICY.json
LAB/00_ARCHITECTURE/Z_FORMAL_CLAIM_PRODUCER_POLICY.json
LAB/00_ARCHITECTURE/Q_FORMAL_CLAIM_PRODUCER_POLICY.json
LAB/00_ARCHITECTURE/R_FORMAL_CLAIM_PRODUCER_POLICY.json
```

Stage workflows:

```text
.github/workflows/boma-n-core-formal-dependency-audit-prototype.yml
.github/workflows/boma-n-arith-formal-dependency-audit-prototype.yml
.github/workflows/boma-z-formal-dependency-audit-prototype.yml
.github/workflows/boma-q-formal-dependency-audit-prototype.yml
.github/workflows/boma-r-formal-dependency-audit-prototype.yml
```

## Historical acceptance evidence remains historical

Examples of retained historical mathematical evidence:

```text
N-Core             32163771789
N addition         32164861155
N multiplication   32165318266
N order            32165691581
Z representation   32168105466
Z arithmetic       32169328837
Z ring             32169564747
Z order convergence 32169832933
Z ordered ring     32170144944
Q integration      32178326013
R integration      32385379288
```

The new transparency evidence answers a different question: whether the current branch can mechanically account for actual formal dependencies of the accepted Claim surface. It does not rewrite the historical acceptance record.

## Current Study conclusion

For every currently accepted export:

```text
Actual Formal Dependency Closure(stage)
  ⊆
Declared Claim-producer closure(stage)
+ transitive supporting ancestry
+ explicit logical/formalization commitments
+ Trusted Base
```

with:

```text
formal residuals = 0
Claim/producer residuals = 0
unowned internal declarations = 0
```

independently for N-Core, N-Arithmetic, Z, Q, and R.

This closes the central theorem-level target of Phase C and the stage-gate implementation target of Phase F.

## Next technical actions

1. allow the Claim Registry synchronization commit to trigger fresh N-Core→R transparency runs under the shared concurrency protocol;
2. verify the synchronized Registry state does not introduce any new stage residual;
3. implement Phase G as **separate views**, not one overloaded diagram:
   - Construction DAG;
   - Claim Dependency Graph;
   - Decision / Branch / Junction Map;
   - Logic and Trust Map;
   - Learning Graph;
4. create a cross-stage `PDSA-ARCH-002` closure/checkpoint record distinguishing theorem-transparency closure from mathematical Stage-One completion;
5. reconcile the Phase D/E status against the final generated views and only then decide whether `PDSA-ARCH-002` itself is CLOSED.

## Non-effects

This program has not:

```text
reopened an accepted mathematical stage;
changed the mathematical frontier;
turned selected representation/formalization routes into necessities;
deleted failed/superseded learning evidence;
merged the architecture branch into main;
opened C.
```
