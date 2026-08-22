# BOMA GENERATED ARCHITECTURE VIEWS

**Status:** ACTIVE DERIVED VIEW INDEX  
**Date:** 2026-08-21  
**Program:** `PDSA-ARCH-002` architecture + C continuation under `PDSA-C-001/002`

These files are separate projections of canonical architecture records. They are deliberately not merged into one diagram because construction, assertions, decisions, trust, and learning answer different questions.

| View | Question answered | File |
|---|---|---|
| Construction DAG | What is the current accepted construction topology and active unaccepted frontier? | `CONSTRUCTION_DAG_VIEW.md` |
| Claim Dependency Graph | What accepted assertion families depend/package into which others, and what provisional C Claims are currently targeted? | `CLAIM_DEPENDENCY_GRAPH_VIEW.md` |
| Decision / Branch / Junction | Which routes were selected, retained, or reconverged, and which Decision Points remain open? | `DECISION_BRANCH_JUNCTION_VIEW.md` |
| Logic and Trust | Which dependencies are mathematics, formalization choices, logical commitments, trusted metatheory, or verification infrastructure? | `LOGIC_TRUST_VIEW.md` |
| Learning Graph | How did failures, diagnoses, corrections, alternatives, reverse studies, and current C experiments lead to the present state? | `LEARNING_GRAPH_VIEW.md` |

## Authority rule

```text
derived view < canonical UNIT / Ledger / Claim audit / evidence record
```

A view may summarize; it may not silently change membership, convergence strength, Decision status, logical cost, verification status, or historical provenance.

In particular:

```text
provisional C Claim ≠ accepted Claim
candidate C route ≠ Block
open Decision Point ≠ selected route
formal payload exists ≠ V5 PASS
future comparison target ≠ Junction already exists
```

## Current boundary

The accepted-export spine still ends at `R-BLOCK-001`, but the views now continue into the **authorized, unaccepted C frontier** because C construction research began on 2026-08-21.

```text
R-BLOCK-001          ACCEPTED
RE-R-001             CLOSED / COMPLETE
BOMA-C-ACCEPT-001    ACTIVE
BOMA-C-R-DEP-001     ACTIVE
PDSA-C-001           CLOSED
PDSA-C-002           ACTIVE — formal boundary probe staged / V5 not yet certified
C-DP-001             OPEN — SELECTS NONE
C accepted export    NONE
```

The old C hold remains visible only in historical records that accurately describe the pre-authorization state.