# PDSA-ARCH-002 STATUS — Claim Transparency and Closure Program

**Status:** ACTIVE — R MACHINE TRANSPARENCY CALIBRATED; Q→N STAGE CERTIFICATION PENDING  
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
| C — Declared vs Actual formal closure | **R COMPLETE / Q→N PENDING** | R theorem-level extraction, boundary classification, Claim/producer ancestry comparison all PASS with zero residuals |
| D — granularity normalization | **ACTIVE / FIRST DEFECT RESOLVED** | provisional `TCT-BR-001..008` candidate identities normalized to internal components; historical labels preserved |
| E — Block/Junction/Decision mapping | **INITIAL MAP COMPLETE** | Block→Claim map, Junction Ledger, Decision Ledger created |
| F — machine-readable manifests / CI gates | **R THEOREM-LEVEL GATE IMPLEMENTED; SOURCE-SURFACE GATE CROSS-STAGE** | R full closure gate records machine evidence; stage-specific Q/Z/N producer policies remain to be added |
| G — generated visualizations | **NOT STARTED** | waits for stable multi-stage machine-readable graph data rather than visualizing only R |

## Current accepted-claim state

```text
N-Core        ACCEPTED / declared Claim closure COMPLETE
N-Arithmetic  ACCEPTED / declared Claim closure COMPLETE
Z             ACCEPTED / declared Claim closure COMPLETE
Q             ACCEPTED / declared Claim closure COMPLETE
R             ACCEPTED / declared Claim closure COMPLETE
```

Mathematical acceptance remains exactly where it was before this architecture program. R transparency work did not reopen or strengthen `RA-22`.

## Current machine-transparency state

```text
N-Core        STAGE-ROOT TRANSPARENCY PENDING
N-Arithmetic  STAGE-ROOT TRANSPARENCY PENDING
Z             STAGE-ROOT TRANSPARENCY PENDING
Q             STAGE-ROOT TRANSPARENCY PENDING
R             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
```

R certification record:

```text
LAB/20_FORMALIZATION/R_STAGE/R_TRANSPARENCY_CERTIFICATION_001.md
```

R learning/study record:

```text
LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-STUDY-001.md
```

## R machine evidence

Latest full R transparency comparison:

```text
workflow run      32415451960
audited source    6044629aba7b827070c334e274ef14ec4a95e009
Lean              4.32.1
extractor          PROTOTYPE_PASS
boundary policy    CLASSIFICATION_PASS
claim/producer     CLAIM_PRODUCER_PASS
```

Measured formal closure:

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

Formal boundary leaves:

```text
TRUSTED_METATHEORY                          65
TRUSTED_FORMALIZATION_INFRASTRUCTURE         9
DECLARED_LOGICAL_COMMITMENT                  2
UNCLASSIFIED                                 0
```

The two declared logical boundary leaves are:

```text
Classical.em
Classical.byContradiction
```

No `propext`, `Classical.propDecidable`, internal axiom, unresolved declaration, or unmapped generated declaration remains as a residual in the certified R closure.

## Learning result preserved

The clean R closure was reached through observed defects rather than assumed from the source surface.

The preserved sequence includes:

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

The intermediate failures are not deleted or retroactively rewritten as successes.

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

```text
LAB/00_ARCHITECTURE/FORMAL_DEPENDENCY_POLICY.json
LAB/00_ARCHITECTURE/R_FORMAL_CLAIM_PRODUCER_POLICY.json
LAB/00_ARCHITECTURE/tools/LeanDependencyExtractor.lean
LAB/00_ARCHITECTURE/tools/lean_dependency_audit.py
LAB/00_ARCHITECTURE/tools/formal_dependency_classify.py
LAB/00_ARCHITECTURE/tools/formal_claim_producer_compare.py
.github/workflows/boma-r-formal-dependency-audit-prototype.yml
```

The R workflow deliberately separates:

```text
accepted assembly compilation
  ↓
actual dependency extraction
  ↓
formal boundary classification
  ↓
Claim Registry ↔ producer ↔ internal ancestry comparison
  ↓
provenance-guarded evidence recording
```

The integration Claim cannot claim transitive ownership of the whole graph. Every direct theorem dependency of the R certificate must be explicitly assigned to a Claim producer or be integration-local packaging.

## Historical V5 evidence remains historical

Canonical R integration evidence on the program baseline remains:

```text
run             32385379288 PASS
verified source af0a03d83245b1e15e9903df00db89edf3317042
Lean            4.32.1
```

The earlier acceptance-closing evidence also remains preserved:

```text
run             32374868448 PASS
verified source f07363c22b049a3fae028a927df74d4fb28a0680
```

The later transparency workflow compiles the current branch accepted assembly under the same pinned Lean toolchain before auditing it. It is a different evidence question and does not retroactively relabel historical V5 runs.

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

The R calibration establishes, for its selected integration root:

```text
Actual Formal Dependency Closure
  ⊆
Declared R Claim-producer closure
+ transitive supporting ancestry
+ explicit logical/formalization commitments
+ Trusted Base
```

with zero residuals.

This is sufficient for branch-local `R TRANSPARENCY PASS` under the criteria of Phase C.

It is **not** sufficient to promote Q, Z, N-Arithmetic, or N-Core automatically. The fact that R's transitive closure traverses upstream declarations proves those declarations are accounted for as support of R Claims; it does not replace an independent stage-root certification against each stage's own Claim Registry subset and accepted integration target.

## Next technical actions

Proceed in reverse accepted-stage order:

1. generalize the Claim/producer comparator so stage Claim prefixes/registry sections are policy-driven rather than R-hardcoded;
2. identify the exact accepted Q stage-root theorem/certificate and define the Q producer policy;
3. run Q extraction → boundary classification → Claim/producer comparison to zero residuals;
4. repeat for Z;
5. repeat for N-Arithmetic;
6. finish with N-Core, using its existing detailed theorem-ownership record;
7. only after stable multi-stage graph data, generate the planned visual views.

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
