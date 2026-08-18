# N-DP-001 — Formal Natural-Number Realization Regime

## Canonical Identity

- **Unit ID:** `N-DP-001`
- **Type:** Decision Point
- **Layer:** `L2 — formalization boundary`
- **Operational Status:** **RESOLVED / SELECTED FOR STAGE ONE**
- **Epistemic Status:** **METHODOLOGICAL CHOICE / FORMALIZATION-DEPENDENT**
- **PDSA origin:** `PDSA-N-002`

## Purpose

Record explicitly which formal realization regime is selected for the first canonical Stage-One N-Core attempt and preserve the non-selected alternatives as legitimate future branches.

The selection is **not** a theorem that the chosen regime is uniquely necessary.

## Incoming dependencies

```text
TCT-BLOCK-005
PDSA-TCT-008 calibration PASS
BOMA-N-ACCEPT-001 v1.0
PDSA-N-002 regime comparison
```

## Decision question

Which formal realization regime should be used for the first canonical N-Core construction while maximizing:

```text
faithfulness to TCT ancestry
visibility of new formal commitments
generatedness clarity
induction adequacy
recursion adequacy
uniqueness route
formal-verification suitability
later branch comparability
```

## Options

### R-A — Set-theoretic / Peano-style standard realization

**Status:** PRESERVED ALTERNATIVE.

Strengths: conventional, strong standard arithmetic route, induction/recursion available when proved.

Main cost: larger ambient set-theoretic ontology and risk that familiar existence/completion assumptions become invisible.

### R-B — BOMA-specific inductive-type realization

**Status:** **SELECTED FOR STAGE ONE**.

Use a fresh inductive carrier in an explicitly declared dependent type-theoretic regime with constructors schematically:

```text
z : N_BOMA
s : N_BOMA → N_BOMA
```

and the corresponding elimination/induction structure.

At the nondependent recursion level, compare the result to the unary initial-algebra structure where justified.

Important: the project does not claim that ordinary initiality in every category automatically gives dependent induction.

### R-C — Natural Numbers Object / categorical realization

**Status:** PRESERVED ALTERNATIVE.

Strong category-relative universal characterization; requires explicit category, NNO existence, and whatever subobject/logical structure is needed for induction/generatedness claims.

### R-D — Free-monoid-derived realization

**Status:** PRESERVED STRUCTURAL ALTERNATIVE.

Very close to the TCT concatenation/history core. The free-monoid universal property alone does not automatically satisfy the full N-Core induction/recursion/standardness acceptance package.

## Alternative relations

```text
R-A ALTERNATIVE_TO R-B
R-B ALTERNATIVE_TO R-C
R-C ALTERNATIVE_TO R-D
R-D ALTERNATIVE_TO R-A
```

The displayed cycle is shorthand for pairwise architectural alternative status; it is not an ordering or preference theorem.

## Selection

```text
N-DP-001 --SELECTS--> R-B
N-DP-001 --BRANCHES_TO--> R-A
N-DP-001 --BRANCHES_TO--> R-B
N-DP-001 --BRANCHES_TO--> R-C
N-DP-001 --BRANCHES_TO--> R-D
```

## Rationale

R-B is selected for the first canonical route because:

1. `ε` and terminal extension map directly to constructor roles;
2. the global completion commitment is concentrated visibly in inductive-type formation rather than dispersed across a larger ambient ontology;
3. generatedness and induction have a direct eliminator-based route;
4. recursion has a direct recursor/eliminator route;
5. constructor no-confusion aligns naturally with the verified TCT successor-like package;
6. the route is well suited to a reproducible proof-assistant backend while allowing the mathematical regime/backend distinction to remain explicit;
7. the other regimes remain available for later branch comparison rather than being rejected.

## New commitments introduced by selecting R-B

The selection authorizes investigation of, but does not yet construct, a formal regime containing at least:

```text
dependent type-theoretic ambient rules
fresh inductive type formation
constructors z and s
induction/elimination principle
formal equality/identity
function formation
```

Each commitment must be specified in the next formalization-boundary contract.

## What this Decision Point does not establish

```text
N_BOMA exists already
TCT-BLOCK-006 is constructed
Lean built-in Nat is BOMA's N-Core
R-B is uniquely necessary
R-A/R-C/R-D are mathematically inferior
all realization regimes are equivalent
NAC-01..14 are already discharged
```

## Verification / evidence

Primary comparison:

`LAB/PDSA/experiments/PDSA-N-002-REGIME-COMPARISON-001.md`

Acceptance target:

`LAB/00_ARCHITECTURE/NATURAL_NUMBER_ACCEPTANCE_SPECIFICATION.md`

## Downstream

The selected route must next pass a dedicated formalization-boundary contract defining the exact regime and the role of the proof-assistant backend.

Only after that contract is accepted may a formal N-Core candidate be constructed.

## Reopening conditions

Reopen this Decision Point if:

```text
R-B cannot discharge a mandatory NAC obligation
formal verification exposes an incompatible equality/induction assumption
the TCT realization bridge cannot be made faithful
another regime demonstrably reduces commitments while preserving all required guarantees
the project intentionally begins a branch comparison
```

## Stage-Two preservation

R-A, R-C, and R-D are intentionally retained as future branch candidates. Their non-selection in Stage One is not rejection.
