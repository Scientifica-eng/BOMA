# TCT-BLOCK-006 — Formal Natural-Number N-Core Candidate

## Canonical Identity

- **Unit ID:** `TCT-BLOCK-006`
- **Type:** Block
- **Layer:** `L2 — formalized structure`
- **Operational Status:** **CONDITIONAL / PENDING — FORMAL CANDIDATE EXISTS**
- **Epistemic Status:** **FORMALIZATION-DEPENDENT / PARTIALLY CONSTRUCTED / PENDING ACCEPTANCE**
- **Formal candidate:** `N-RB-CAND-001`
- **PDSA origin:** `PDSA-N-004`

## Purpose

Represent the first fresh formal N-Core candidate constructed under the selected R-B inductive-type regime while keeping its acceptance obligations explicit.

This Block is **not yet an accepted N-Core and not yet identified with `ℕ`**.

## Governing records

```text
BOMA-N-ACCEPT-001 v1.0
BOMA-RB-FORMAL-001 v1.0
N-DP-001 selects R-B
N-RB-CAND-001
```

## Provisional formal carrier

The candidate introduces the fresh formal structure:

```text
N_BOMA : Type
z : N_BOMA
s : N_BOMA → N_BOMA
```

### Epistemic classification

```text
N_BOMA formation  DECLARED FORMALIZATION COMMITMENT / CONSTRUCTED CANDIDATE
z                 FORMAL CONSTRUCTOR / realizes ε role provisionally
s                 FORMAL CONSTRUCTOR / realizes ExtU role provisionally
```

The inductive carrier is a new formalization commitment. It is not derived from the pre-numerical TCT core.

## Backend representation

Initial Lean payload:

`LAB/payloads/lean/NCore/BOMANat.lean`

Classification:

```text
REPRESENTS / IMPLEMENTS N-RB-CAND-001
```

The backend does not define the canonical pre-numerical TCT construction and does not use Lean built-in `Nat` as the candidate carrier.

## Local candidate obligations

Written candidate evidence currently covers:

```text
RB-O01 constructor disjointness           written proof candidate
RB-O02 constructor injectivity             written proof candidate
RB-O03 induction adequacy                  Prop demo + regime eliminator route
RB-O04 nondependent recursion              candidate fold definition
RB-O05 pointwise recursion uniqueness      written proof candidate
RB-O06 generatedness                       inductive elimination route
RB-O09 local commitment/backend ledger     documented
```

Primary audit:

`LAB/PDSA/experiments/PDSA-N-004-LOCAL-OBLIGATIONS-001.md`

## Machine-verification status

```text
V5 FORMAL VERIFICATION: PENDING
```

The current local execution environment did not provide Lean, so no local checker result is claimed.

A repository CI/checker run using the pinned Lean environment is required before the local proof candidates may be classified V5.

## N-Core acceptance obligations still open

### NAC-06 / RB-O07 — TCT realization bridge

Still required:

```text
ε ↦ z
ExtU(A) ↦ s(ρ(A))
A ≈ B  ⇒  ρ(A) = ρ(B)
ρ(A) = ρ(B)  ⇒  A ≈ B
history correspondence
```

The bridge must preserve the distinction between canonical TCT construction and any backend datatype representing TCT syntax.

### NAC-07 — no-confusion

Written proof candidates exist, but V5 checker evidence is pending.

### NAC-08 / NAC-09 / NAC-10

Induction/generatedness/recursion routes are specified and partially encoded; formal checker evidence and final acceptance mapping remain pending.

### NAC-11 — natural-number characterization

PENDING.

### NAC-12 / RB-O08 — uniqueness / standardness

PENDING.

### NAC-13 — TCT preservation certificate

PENDING bridge verification.

### NAC-14 — commitment ledger

PARTIAL PASS at candidate level; must be finalized at N-Core closure.

### NAC-15 — N-Core closure

NOT ELIGIBLE YET.

## Current acceptance matrix

| Obligation | Status |
|---|---|
| formal regime | PASS |
| fresh carrier candidate | CONSTRUCTED / CONDITIONAL |
| base and successor constructors | CONSTRUCTED / CONDITIONAL |
| local no-confusion | WRITTEN PROOF / V5 PENDING |
| induction/generatedness | ROUTE SPECIFIED / V5 PENDING |
| recursion/pointwise uniqueness | WRITTEN CANDIDATE / V5 PENDING |
| faithful TCT bridge | PENDING |
| characterization | PENDING |
| standardness/uniqueness | PENDING |
| final N-Core acceptance | NOT ELIGIBLE |

## What this Block must not be called yet

Do not describe this Block as:

```text
ℕ
accepted natural numbers
completed N-Core
standard natural numbers
a verified formalization
```

The correct current description is:

> **conditional fresh formal N-Core candidate under the selected R-B regime.**

## Downstream

The immediate work sequence is:

```text
1. V5 check of local R-B payload
2. formal/architectural TCT bridge verification
3. N-Core characterization / standardness certificate
4. NAC-13/NAC-14 final audit
5. NAC-15 N-Core closure decision
6. only then begin the N-Arithmetic package
```

## Sensitivity

Reopen or invalidate this candidate if:

```text
N-DP-001 selection changes
BOMA-RB-FORMAL-001 changes materially
Lean/backend checking rejects candidate proofs
the fresh carrier cannot satisfy the faithful TCT bridge
generatedness/induction/recursion obligations fail
standardness cannot be established under the selected acceptance target
an undeclared logical principle becomes necessary
```

## Provenance

```text
PDSA-N-001  acceptance target
PDSA-N-002  R-B Decision Point
PDSA-N-003  R-B formalization boundary
PDSA-N-004  candidate construction
```
