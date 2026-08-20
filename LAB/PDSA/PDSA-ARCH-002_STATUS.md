# PDSA-ARCH-002 STATUS — Claim Transparency and Closure Program

**Status:** ACTIVE — Q/R MACHINE TRANSPARENCY CALIBRATED; Z→N STAGE CERTIFICATION PENDING  
**Date:** 2026-08-20  
**Branch:** `architecture/claim-transparency-001`  
**Baseline:** `main@6bb10f16fba3caf171bebd1731a4d209832ae35b`  
**Mathematical frontier:** UNCHANGED  
**C:** `NOT STARTED — USER HOLD`

## Phase status

| Phase | Status | Result |
|---|---|---|
| A — Claim vocabulary / Trusted Base / Registry | **COMPLETE** | claim architecture, dependency classes, Trusted Base, project registry created |
| B — accepted claim closures N→R | **COMPLETE** | declared human-readable claim closure mapped for N-Core, N-Arithmetic, Z, Q, R |
| C — Declared vs Actual formal closure | **Q/R COMPLETE / Z→N PENDING** | Q and R theorem-level extraction, boundary classification, Claim/producer ancestry comparison PASS with zero residuals |
| D — granularity normalization | **ACTIVE / FIRST DEFECT RESOLVED** | provisional `TCT-BR-001..008` candidate identities normalized to internal components; historical labels preserved |
| E — Block/Junction/Decision mapping | **INITIAL MAP COMPLETE** | Block→Claim map, Junction Ledger, Decision Ledger created |
| F — machine-readable manifests / CI gates | **Q/R THEOREM-LEVEL GATES IMPLEMENTED; SOURCE-SURFACE GATE CROSS-STAGE** | Q/R full closure gates record machine evidence; Z/N producer policies/gates remain to be added |
| G — generated visualizations | **NOT STARTED** | waits for stable multi-stage machine-readable graph data rather than visualizing only partial certification |

## Current accepted-claim state

```text
N-Core        ACCEPTED / declared Claim closure COMPLETE
N-Arithmetic  ACCEPTED / declared Claim closure COMPLETE
Z             ACCEPTED / declared Claim closure COMPLETE
Q             ACCEPTED / declared Claim closure COMPLETE
R             ACCEPTED / declared Claim closure COMPLETE
```

Mathematical acceptance remains exactly where it was before this architecture program. Transparency work has not reopened `QA-23` or `RA-22`.

## Current machine-transparency state

```text
N-Core        STAGE-ROOT TRANSPARENCY PENDING
N-Arithmetic  STAGE-ROOT TRANSPARENCY PENDING
Z             STAGE-ROOT TRANSPARENCY PENDING
Q             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
R             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
```

Certification records:

```text
LAB/20_FORMALIZATION/Q_STAGE/Q_TRANSPARENCY_CERTIFICATION_001.md
LAB/20_FORMALIZATION/R_STAGE/R_TRANSPARENCY_CERTIFICATION_001.md
```

Learning/study records:

```text
LAB/PDSA/experiments/PDSA-ARCH-002-Q-FORMAL-CLOSURE-STUDY-001.md
LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-STUDY-001.md
```

## R machine evidence

Calibrated R comparison after generic-tool regression verification:

```text
workflow run      32415977469
audited source    db827c7de13275e55bbe2dcbd320c409f2a1c9ee
Lean              4.32.1
extractor          PROTOTYPE_PASS
boundary policy    CLASSIFICATION_PASS
claim/producer     CLAIM_PRODUCER_PASS
```

Measured R formal closure:

```text
R registry Claim IDs                         12
R producer-policy Claim IDs                  12
declared producers                           29
internal declarations                       606
owned internal declarations                 606
unowned internal declarations                 0
target direct internal dependencies          27
undeclared target direct dependencies         0
formal boundary residuals                     0
Claim/producer residual groups                0
```

R formal boundary classes:

```text
TRUSTED_METATHEORY                          65
TRUSTED_FORMALIZATION_INFRASTRUCTURE         9
DECLARED_LOGICAL_COMMITMENT                  2
UNCLASSIFIED                                 0
```

The two declared R logical boundary leaves are:

```text
Classical.em
Classical.byContradiction
```

No `propext`, `Classical.propDecidable`, internal axiom, unresolved declaration, or unmapped generated declaration remains as a residual in the certified R closure.

## Q machine evidence

Latest successful Q comparison:

```text
workflow run      32416694028
audited source    87b635a15cb057a517e201f8fbf99b54296533b8
Lean              4.32.1
extractor          PROTOTYPE_PASS
boundary policy    CLASSIFICATION_PASS
claim/producer     CLAIM_PRODUCER_PASS
```

Measured Q formal closure:

```text
Q registry Claim IDs                         10
Q producer-policy Claim IDs                  10
declared producers                           49
audit roots                                  20
internal declarations                       338
owned internal declarations                 338
unowned internal declarations                 0
formal boundary residuals                     0
Claim/producer residual groups                0
```

Q internal source-stage distribution:

```text
N-Core          19
N-Arithmetic    59
Z              111
Q              149
TOTAL          338
```

Q formal boundary classes:

```text
TRUSTED_METATHEORY                          63
TRUSTED_FORMALIZATION_INFRASTRUCTURE         9
DECLARED_LOGICAL_COMMITMENT                  0
UNCLASSIFIED                                 0
```

This independently confirms that the selected accepted Q theorem surface introduces no Q-specific classical formal leaf under the active boundary policy.

## Learning results preserved

### R sequence

```text
workspace/package-root execution defect
5 semantic residuals
  ↓
2 residuals after generated/metatheory provenance classification
  ↓
1 residual after explicit localization of classical proposition decision
  ↓
0 residuals after removing proposition-extensionality proof artifacts
  ↓
Claim/producer ancestry comparison PASS
```

### Q sequence

```text
formal boundary clean on first run
  ↓
1 Claim/producer residual: zMul_ne_zero over-declared as acceptance producer
  ↓
actual graph showed zMul_right_cancel_nonzero is the consumed gateway
  ↓
producer policy corrected without deleting the unused helper theorem
  ↓
0 residuals / CLAIM_PRODUCER_PASS
```

The Q result adds an important ownership lesson: a theorem can be valid and retained without being an actual producer of the accepted Claim closure.

Intermediate failures are preserved rather than rewritten retroactively.

## Source-surface automation

Cross-stage source-surface gate:

```text
LAB/00_ARCHITECTURE/CLAIM_SURFACE_POLICY.json
LAB/00_ARCHITECTURE/tools/claim_surface_audit.py
.github/workflows/boma-claim-surface-audit-001.yml
```

It checks:

```text
required architecture/audit records exist
accepted-source manifests exist and contain no duplicate/unsafe paths
manifest-listed Lean source exists
integration Claim IDs are registered
sorry / axiom are absent from accepted source surface
Quotient is rejected in N-Core/N-Arithmetic/Z and explicitly allowed in Q/R
Classical usage is rejected everywhere except explicitly whitelisted R source files
stale Classical whitelist entries are rejected
```

Current R source-surface classical whitelist:

```text
RPreCompletionGateway.lean
RDedekindOrderClassicalWitness.lean
RDedekindFiniteExitSearch.lean
RDedekindPositiveRepresentativeWitness002.lean
RDedekindRationalDensity.lean
```

`RPreCompletionGateway.lean` was added deliberately after theorem-level closure exposed an implicit `Classical.propDecidable` dependency in rational strict-order trichotomy. The proof was normalized to an explicit localized `Classical.em` site, making the commitment visible instead of hiding it in typeclass synthesis.

## Theorem-level automation now available

Shared machinery:

```text
LAB/00_ARCHITECTURE/FORMAL_DEPENDENCY_POLICY.json
LAB/00_ARCHITECTURE/tools/LeanDependencyExtractor.lean
LAB/00_ARCHITECTURE/tools/lean_dependency_audit.py
LAB/00_ARCHITECTURE/tools/formal_dependency_classify.py
LAB/00_ARCHITECTURE/tools/formal_claim_producer_compare.py
```

Stage policies/gates:

```text
LAB/00_ARCHITECTURE/R_FORMAL_CLAIM_PRODUCER_POLICY.json
.github/workflows/boma-r-formal-dependency-audit-prototype.yml

LAB/00_ARCHITECTURE/Q_FORMAL_CLAIM_PRODUCER_POLICY.json
.github/workflows/boma-q-formal-dependency-audit-prototype.yml
```

The comparator now supports:

```text
single_target   — used by R's accepted final integration certificate
producer_union  — used by Q's existing integration/law acceptance surface
```

The multi-target extractor unions and deduplicates theorem closures, so a stage need not fabricate a synthetic theorem merely to satisfy the audit architecture.

## Evidence-write concurrency correction

After Q certification was added to the Claim Registry, Q and R audits were triggered by the same Registry commit. Both initially used exact-HEAD evidence guards while writing their latest evidence to the same feature branch.

Observed risk:

```text
stage A verifies commit H
stage B verifies commit H
stage A writes evidence commit H+1
stage B sees branch != H and refuses otherwise-valid evidence
```

This is an evidence-promotion race, not a mathematical dependency defect.

Q/R transparency workflows were therefore changed to:

```text
one shared transparency-evidence concurrency group
cancel-in-progress = false
```

and evidence promotion now checks:

```text
diff(audited SHA, current branch head) restricted to that stage's verification inputs
```

If a payload, manifest, Claim Registry, policy, audit tool, toolchain, or the stage's own workflow changed, evidence is rejected as stale. If only evidence/status/non-input documentation moved, the run may record evidence explicitly tied to the SHA it actually audited.

This mirrors the provenance principle already used in the hardened canonical R integration workflow and permits multiple stage audits to coexist without weakening verification-input integrity.

## Historical V5 evidence remains historical

Canonical R integration evidence on the program baseline remains:

```text
run             32385379288 PASS
verified source af0a03d83245b1e15e9903df00db89edf3317042
Lean            4.32.1
```

Earlier R acceptance-closing evidence remains:

```text
run             32374868448 PASS
verified source f07363c22b049a3fae028a927df74d4fb28a0680
```

Canonical Q integration evidence remains:

```text
run             32178326013 PASS
```

The later transparency workflows compile current branch accepted assemblies before auditing them. These are different evidence questions and do not retroactively relabel historical V5 runs.

## Granularity correction retained

`TCT-BLOCK-001` and `TCT-BLOCK-002` previously contained provisional labels `TCT-BR-001..008` described as candidate Brick IDs, but no corresponding canonical Brick `UNIT.md` records exist.

PDSA-ARCH-002 classifies those roles as **declared internal Block components**, preserving the provisional labels only as historical provenance.

Canonical TCT Bricks remain actual recorded units such as:

```text
TCT-BR-009
TCT-BR-010
```

No mathematical TCT content changed.

## Current Study result

R establishes, for its single accepted integration root:

```text
Actual Formal Dependency Closure(R)
  ⊆
Declared R Claim-producer closure
+ transitive supporting ancestry
+ explicit logical/formalization commitments
+ Trusted Base
```

Q establishes, for its existing accepted multi-root theorem surface:

```text
Actual Formal Dependency Closure(Q)
  ⊆
Declared Q Claim-producer closure
+ transitive supporting ancestry
+ explicit formalization infrastructure
+ Trusted Base
```

Both have zero residuals.

This is sufficient for branch-local Q/R `TRANSPARENCY PASS` under Phase C. It does **not** automatically promote Z or N, which still require stage-specific accepted root surfaces and producer policies.

## Next technical actions

Proceed in reverse accepted-stage order:

1. define the exact accepted Z theorem surface and `Z_FORMAL_CLAIM_PRODUCER_POLICY.json` without inventing a synthetic Z certificate;
2. add Z extraction → boundary → Claim/producer gate and drive residuals to zero;
3. certify Z branch-locally if and only if both classifiers pass;
4. repeat for N-Arithmetic;
5. finish with N-Core, using its existing detailed theorem-ownership record;
6. only after stable multi-stage graph data, generate the planned visual views.

## Non-effects

This program has not:

```text
reopened an accepted mathematical stage;
changed the mathematical frontier;
made Dedekind/quotient/classical choices necessary rather than selected;
deleted historical learning evidence;
merged the architecture branch into main;
opened C.
```
