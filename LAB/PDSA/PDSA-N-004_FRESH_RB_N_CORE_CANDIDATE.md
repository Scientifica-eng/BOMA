# PDSA-N-004 — Fresh R-B N-Core Candidate Construction

**CycleID:** `PDSA-N-004`  
**Track:** Natural Numbers / R-B Formalization  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — PLAN / CANDIDATE CONSTRUCTION**

## Inputs

```text
N-DP-001 selects R-B
BOMA-N-ACCEPT-001 v1.0
BOMA-RB-FORMAL-001 v1.0
TCT-BLOCK-005 successor-like structural package
```

## PLAN

Construct a fresh formal N-Core candidate under R-B without using a built-in natural-number type as its definition.

Local obligations for this cycle:

```text
C1  fresh carrier N_BOMA
C2  z : N_BOMA
C3  s : N_BOMA → N_BOMA
C4  constructor disjointness
C5  constructor injectivity
C6  induction/eliminator availability
C7  nondependent recursion
C8  pointwise recursion uniqueness
C9  generatedness via induction/elimination
C10 commitment/backend ledger
```

The following may remain for subsequent dedicated verification cycles:

```text
full machine-checked TCT bridge
faithfulness/reflection at backend level
cross-candidate uniqueness/standardness certificate
final NAC-15 N-Core closure
```

## Backend rule

The mathematical candidate and its obligations are canonical BOMA records.

Lean may encode/verify them as a backend, but:

```text
Lean built-in Nat ≠ definition of N_BOMA
```

The first backend encoding must use a fresh inductive type.

## Local environment finding

The current local execution environment does not provide a Lean executable. Therefore no local V5 verification can be claimed from this environment.

Backend code may still be added to the repository and verified through a reproducible CI workflow when executed.

## DO

Candidate construction begins now.

## STUDY

OPEN.

## ACT

PENDING.

`TCT-BLOCK-006` must remain provisional until required proofs and later bridge/standardness obligations close.
