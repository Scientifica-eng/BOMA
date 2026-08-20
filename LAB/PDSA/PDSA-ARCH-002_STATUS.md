# PDSA-ARCH-002 STATUS — Claim Transparency and Closure Program

**Status:** ACTIVE / MAJOR ARCHITECTURAL PHASES IMPLEMENTED  
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
| C — Declared vs Actual formal closure | **ACTIVE / PARTIAL** | accepted source manifests created; source-surface audit implemented; theorem-level transitive Lean dependency extraction not yet implemented |
| D — granularity normalization | **ACTIVE / FIRST DEFECT RESOLVED** | provisional `TCT-BR-001..008` candidate identities normalized to internal components; historical labels preserved |
| E — Block/Junction/Decision mapping | **INITIAL MAP COMPLETE** | Block→Claim map, Junction Ledger, Decision Ledger created |
| F — machine-readable manifests / CI gates | **IMPLEMENTED AT SOURCE-SURFACE LEVEL / EXECUTION EVIDENCE PENDING** | JSON policy, Python audit, GitHub Actions gate created; not yet promoted as theorem-level transparency certification |
| G — generated visualizations | **NOT STARTED** | intentionally waits for stable machine-readable graph data |

## Completed artifacts

### Governing program and schema

```text
LAB/PDSA/PDSA-ARCH-002_CLAIM_TRANSPARENCY_AND_CLOSURE_PROGRAM.md
LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md
LAB/00_ARCHITECTURE/TRUSTED_BASE.md
LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md
```

### Stage claim closure audits

```text
LAB/20_FORMALIZATION/N_CORE/N_CORE_CLAIM_CLOSURE_AUDIT_001.md
LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_CLAIM_CLOSURE_AUDIT_001.md
LAB/20_FORMALIZATION/Z_STAGE/Z_CLAIM_CLOSURE_AUDIT_001.md
LAB/20_FORMALIZATION/Q_STAGE/Q_CLAIM_CLOSURE_AUDIT_001.md
LAB/20_FORMALIZATION/R_STAGE/R_CLAIM_CLOSURE_AUDIT_003.md
```

Current declared-closure result:

```text
N-Core        COMPLETE
N-Arithmetic  COMPLETE
Z             COMPLETE
Q             COMPLETE
R             COMPLETE
```

`COMPLETE` here does not mean machine-proved theorem-level absence of hidden dependencies.

### Accepted-source manifests

```text
LAB/20_FORMALIZATION/N_CORE/N_CORE_ACCEPTED_INPUTS.txt
LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_ACCEPTED_INPUTS.txt
LAB/20_FORMALIZATION/Z_STAGE/Z_ACCEPTED_INPUTS.txt
LAB/20_FORMALIZATION/Q_STAGE/Q_ACCEPTED_INPUTS.txt
LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt
```

The N-Arithmetic/Z/Q manifests expose the cumulative canonical source spine used downstream; the N-Core manifest records the producer plus claim-level verification fragments used by its evidence workflow. R retains its already-hardened final integration assembly manifest.

### Architecture views

```text
LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md
LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md
LAB/00_ARCHITECTURE/DECISION_LEDGER.md
```

### Source-surface automation

```text
LAB/00_ARCHITECTURE/CLAIM_SURFACE_POLICY.json
LAB/00_ARCHITECTURE/tools/claim_surface_audit.py
.github/workflows/boma-claim-surface-audit-001.yml
```

The audit currently checks:

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

## R logical whitelist currently encoded

The accepted R source surface currently permits direct code-level `Classical` usage only in:

```text
RDedekindOrderClassicalWitness.lean
RDedekindFiniteExitSearch.lean
RDedekindPositiveRepresentativeWitness002.lean
RDedekindRationalDensity.lean
```

These correspond respectively to already-declared logical commitments involving:

```text
total cut comparability
finite arbitrary-cut membership search
positive representative extraction
strict rational-density witness extraction
```

The whitelist is deliberately file-exact rather than stage-wide.

## Granularity correction

`TCT-BLOCK-001` and `TCT-BLOCK-002` previously contained provisional labels `TCT-BR-001..008` described as candidate Brick IDs, but no corresponding canonical Brick `UNIT.md` records exist.

PDSA-ARCH-002 now classifies those roles as **declared internal Block components**, preserving the provisional labels only as historical provenance.

Canonical TCT Bricks remain actual recorded units such as:

```text
TCT-BR-009
TCT-BR-010
```

No mathematical TCT content changed.

## Evidence synchronization correction

`R_CLAIM_V5_INDEX.md` was synchronized with the successful post-maintenance R integration re-verification:

```text
latest run       32385379288 PASS
verified source  af0a03d83245b1e15e9903df00db89edf3317042
Lean             4.32.1
```

The earlier acceptance-closing run:

```text
32374868448 PASS
f07363c22b049a3fae028a927df74d4fb28a0680
```

remains explicit historical evidence and was not erased.

## Current Study result

At the present granularity, no known accepted N/Z/Q/R mathematical claim or material selected representation/formalization/logical commitment remains absent from the **declared** Claim closure.

However the stronger invariant:

```text
Actual transitive Lean declaration closure
  ⊆
Declared claim/support/commitment closure + Trusted Base
```

has not yet been mechanically established.

Accordingly the project must continue to say:

```text
DECLARED CLAIM CLOSURE COMPLETE
```

and must **not yet** say:

```text
MACHINE-CHECKED TRANSPARENCY PASS
```

for any accepted stage solely on the basis of the new source-surface gate.

## Next technical actions

1. obtain execution evidence for `boma-claim-surface-audit-001.yml` and fix any source-surface policy mismatch it finds;
2. design a stable Lean declaration-dependency extractor for final integration/claim theorems;
3. classify generated declarations and core/prelude dependencies against `TRUSTED_BASE.md` rather than polluting Claim IDs;
4. compare theorem-level actual closure against the registered declared closure;
5. only after zero unclassified residual dependencies, promote stage-level `TRANSPARENCY PASS`;
6. once machine-readable graph data stabilizes, generate the five planned visual views.

## Non-effects

This program has not:

```text
reopened an accepted mathematical stage;
changed an accepted theorem statement;
weakened R acceptance;
selected a previously retained mathematical branch;
deleted historical learning evidence;
opened C.
```
