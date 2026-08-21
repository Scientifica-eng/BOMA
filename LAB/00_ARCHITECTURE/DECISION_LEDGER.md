# DECISION LEDGER — Selected Routes and Preserved Alternatives

**Document ID:** `BOMA-DECISION-LEDGER-001`  
**Status:** ACTIVE / SYNCHRONIZED THROUGH ACCEPTED R  
**Date:** 2026-08-20  
**Program:** `PDSA-ARCH-002`

## 1. Purpose

Provide one auditable index of all currently canonical Decision Points in the accepted N→Z→Q→R construction, while preserving the distinction:

```text
SELECTED ≠ DERIVED NECESSITY
```

The authoritative detailed rationale remains each Decision Point's `UNIT.md`. This ledger prevents downstream documents or visualizations from silently forgetting non-selected alternatives.

## 2. Decision inventory

| Decision | Question | Selected Stage-One option | Preserved alternatives | Epistemic class |
|---|---|---|---|---|
| `N-DP-001` | formal N realization regime | R-B — fresh BOMA-specific inductive unary carrier | R-A set/Peano-style; R-C categorical NNO; R-D free-monoid-derived | methodological / formalization-dependent |
| `N-DP-002` | eliminator and universe scope | Sort-polymorphic eliminator + target-Type-polymorphic fold + same-universe pointwise initiality; Stage-One `bomaAlg` at `Type 0` | Type-only eliminator rejected for current acceptance; heterogeneous cross-universe initiality retained as later strengthening | formalization-dependent / methodological |
| `Z-DP-001` | canonical integer representation after route convergence | signed canonical normal forms | difference pairs + explicit equivalence retained; quotient-of-pairs not required | methodological / formalization choice |
| `Q-DP-001` | formal rational identity realization | explicit `Quotient fracSetoid` carrier | canonical reduced fractions; raw syntax + external `FracEquiv` | methodological / formalization choice |
| `R-DP-001` | real completion route | Dedekind lower cuts | Cauchy completion retained as first-class branch | mathematical construction / methodological choice |
| `R-DP-002` | formal identity for selected Dedekind syntax | `RBOMA := Quotient cutSetoid` | raw LowerCut syntax + external `CutEquiv`; raw structure equality not selected | formalization / methodological choice |
| `R-DP-003` | logical regime for total order | constructive partial-order core + localized classical `CutComparability` witness | narrow explicit comparability principle; constructive locatedness/strengthened-cut regime | logical / methodological choice |
| `R-DP-004` | approximation route needed for additive inverse | reusable Q Archimedean approximation gateway + isolated finite cut search | direct one-off Dedekind bracketing route | mathematical route choice |
| `R-DP-005` | signed real multiplication architecture | positive/negative-part decomposition over nonnegative kernel | direct sign-case multiplication; shift-to-positive multiplication | mathematical / architectural choice |
| `R-DP-006` | nonzero real inverse architecture | direct positive Dedekind reciprocal + signed extension | completeness/supremum inverse route | methodological choice + verified route |

## 3. Decision-specific transparency notes

### `N-DP-001`

The selected R-B route concentrates the global-completion commitment visibly in fresh inductive-type formation. The selection does not claim TCT already contained the completed carrier and does not rank R-A/R-C/R-D as mathematically inferior.

### `N-DP-002`

This Decision Point exists because the first V5 attempt exposed under-specified motive/universe scope. The final scope is therefore an explicit Act result, not an inference silently supplied by Lean.

### `Z-DP-001`

Signed normal forms are selected after `Z-J-001` proves representation convergence. The retained pair route remains an independent witness for natural-difference generation, representation independence, and later group-completion study.

### `Q-DP-001`

This is the first accepted number-stage decision that intentionally introduces a quotient/setoid carrier commitment. The availability of Lean quotient infrastructure does not make quotient identity mathematically necessary.

### `R-DP-001`

Dedekind was selected because the Stage-One completeness target had a direct verified LUB-by-union construction path. Cauchy was not disproved or rejected.

### `R-DP-002`

Quotient identity is selected to make formal equality reflect `CutEquiv` and avoid raw predicate-field equality. External `CutEquiv` remains a valid branch target.

### `R-DP-003`

The classical cost is isolated at total comparability. It is not part of `LowerCut`, `CutEquiv`, `RBOMA`, or the constructive partial-order core.

### `R-DP-004`

The selected route deliberately separates reusable Q arithmetic from the localized classical finite search over arbitrary cut membership.

### `R-DP-005`

The selected multiplication definition avoids a proposition-valued sign selector in the operation itself. Sign classification remains proof-level, making its logical provenance auditable.

### `R-DP-006`

The selected inverse route does not require a global inverse selector. Existence + uniqueness witnesses close the accepted interface; the completeness-level inverse remains unbuilt and therefore has no reconvergence claim.

## 4. Decision integrity rules

For every downstream Claim Record that consumes a selected Decision Point:

1. record the Decision ID;
2. distinguish the accepted **property** from the selected **producer route**;
3. do not inherit branch-local assumptions into unrelated claims;
4. preserve non-selected options unless a documented rejection supersedes them;
5. reopen the Decision if its declared sensitivity condition is triggered;
6. do not draw a selected arrow as though it were a derivation theorem.

## 5. Current boundary

No `C-DP-*` exists or is authorized.

```text
C NOT STARTED — USER HOLD
```

This ledger must not be extended into C until a new explicit user order authorizes that stage.
