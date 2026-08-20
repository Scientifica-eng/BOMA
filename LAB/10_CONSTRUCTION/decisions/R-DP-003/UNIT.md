# R-DP-003 — Dedekind Real Total-Order Logical Regime

- **Operational Status:** **RESOLVED — LOCALIZED CLASSICAL COMPARABILITY SELECTED FOR STAGE I**
- **Epistemic Status:** **LOGICAL / METHODOLOGICAL DECISION POINT**
- **Input:** `R-DP-002 — RBOMA quotient identity selected`
- **Target:** `BOMA-R-ACCEPT-001 / RA-09 / RA-19`
- **PDSA:** `PDSA-R-003`
- **Reverse classification:** `PDSA-R-015 / RE-R-001`

## Decision question

What explicit logical commitment is required to promote representative-invariant cut inclusion from a constructive partial order to the Stage-One total real order required by `RA-09`?

## Verified split

The selected representation provides:

```text
LowerCut
CutEquiv
CutLE := lower-set inclusion
RBOMA := LowerCut / CutEquiv
rLE := quotient inclusion interface
```

V5 verifies without a global classical declaration:

```text
rLE reflexivity
rLE transitivity
rLE antisymmetry
CutComparability -> rLE totality
```

A separate theorem then supplies the missing comparability witness with localized classical reasoning:

```text
CutComparability := ∀ A B : LowerCut, CutLE A B ∨ CutLE B A
```

Authoritative evidence:

```text
R_DEDEKIND_ORDER_LOGIC_SPLIT_V5_LATEST.md
run 32181726522
Lean 4.32.1
PASS
```

## Candidates studied

### Candidate A — explicit localized Classical derivation — SELECTED

Use classical reasoning only to witness `CutComparability`, then derive quotient totality through the narrow interface.

This preserves the constructive partial-order core and prevents ad hoc downstream `classical` declarations from being mistaken for independent mathematical assumptions.

### Candidate B — declare narrow comparability principle

Retained as a logical/formalization branch. Architecturally this exposes only `CutComparability`, but the current verified witness remains classical; BOMA does not relabel that provenance as constructive.

### Candidate C — constructive locatedness / revised order regime

Retained as a high-value Stage-II branch. It would require a stronger constructive cut specification, witness-carrying strict order, or a revised acceptance contract. It is not a silent implementation change.

## ACT

Stage One selects:

```text
constructive partial-order core
+
localized classical witness of CutComparability
+
constructive totality-from-CutComparability bridge
```

Therefore:

```text
R-DP-003 = RESOLVED
```

The selected logical cost is explicit and localized.

## Reverse-engineering result

`RE-R-001` classifies the comparability witness as:

```text
LOGICAL COMMITMENT
ALTERNATIVE / BRANCH CANDIDATE
```

It is required by the **current proof route** to discharge RA-09 totality and sign-dependent closure, but it is not part of the definitions of `LowerCut`, `CutEquiv`, `RBOMA`, or the constructive `rLE` core and is not claimed necessary to every construction of the reals.

Removing it without replacement would invalidate the current RA-09/RA-22 package; replacing it by a constructive totality route is a legitimate later branch experiment.

## Metatheory compatibility

`BOMA-META-TCT-001` permits materially classical proof steps when explicitly declared in the relevant PDSA/verification record. This Decision Point records that boundary rather than treating Classical reasoning as invisible background.
