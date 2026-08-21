# BOMA GENERATED ARCHITECTURE VIEWS

**Status:** ACTIVE DERIVED VIEW INDEX  
**Date:** 2026-08-21  
**Program:** `PDSA-ARCH-002`

These files are separate projections of canonical architecture records. They are deliberately not merged into one diagram because construction, assertions, decisions, trust, and learning answer different questions.

| View | Question answered | File |
|---|---|---|
| Construction DAG | What is the current accepted construction topology? | `CONSTRUCTION_DAG_VIEW.md` |
| Claim Dependency Graph | What accepted assertion families depend/package into which others? | `CLAIM_DEPENDENCY_GRAPH_VIEW.md` |
| Decision / Branch / Junction | Which routes were selected, retained, or reconverged, and with what strength? | `DECISION_BRANCH_JUNCTION_VIEW.md` |
| Logic and Trust | Which dependencies are mathematics, formalization choices, logical commitments, trusted metatheory, or verification infrastructure? | `LOGIC_TRUST_VIEW.md` |
| Learning Graph | How did failures, diagnoses, corrections, alternatives, and reverse studies lead to the current state? | `LEARNING_GRAPH_VIEW.md` |

## Authority rule

```text
derived view < canonical UNIT / Ledger / Claim audit / evidence record
```

A view may summarize; it may not silently change membership, convergence strength, Decision status, logical cost, or historical provenance.

## Current boundary

All views stop at the currently accepted R frontier and may show C only as a hold marker.

```text
C NOT STARTED — USER HOLD
```
