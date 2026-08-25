# R-DP-003 — Dedekind Real Total-Order Logical Regime

- **Operational Status:** **RESOLVED — LOCALIZED CLASSICAL COMPARABILITY SELECTED FOR STAGE I**
- **Epistemic Status:** **LOGICAL / METHODOLOGICAL DECISION POINT**
- **Input:** `R-DP-002 — RBOMA quotient identity selected`
- **Target:** `BOMA-R-ACCEPT-001 / RA-09 / RA-19`
- **PDSA:** `PDSA-R-003`
- **Reverse classification:** `PDSA-R-015 / RE-R-001`
- **Learning integration:** `ST2-EXP-004 CLOSED / PASS / BOMA-ST2-LEARNING-INTEGRATION-003`

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

Authoritative Stage-One evidence:

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

Retained as a possible future research direction. It would require a stronger constructive cut specification, witness-carrying strict order, or a revised acceptance contract. It is not a silent implementation change and was outside the frozen single-factor boundary of `ST2-EXP-004`.

## ACT — selected Stage-One regime

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

The selected logical cost is explicit and localized. `ST2-EXP-004` did not replace this selection.

## ST2-EXP-004 integrated boundary — same carrier and same order

`ST2-EXP-004` removed only the selected F-04 provider in research assemblies while preserving the accepted `LowerCut / CutEquiv / cutSetoid / RBOMA / CutLE / rLE` representation and accepted operation definitions.

On that unchanged representation, Gate D established:

```text
RTotality ↔ CutComparability
```

with:

```text
RTotality := ∀ x y : RBOMA, rLE x y ∨ rLE y x
CutComparability := ∀ A B : LowerCut, CutLE A B ∨ CutLE B A
```

This is permanent Construction-DAG knowledge. It sharpens the boundary around the selected decision without changing the decision.

No unconditional constructive inhabitant of `CutComparability` was recovered from the frozen `LowerCut` fields. A conditional theorem from an explicit `hComp : CutComparability` is therefore an interface theorem, not a constructive recovery of comparability.

## Exact F-04 impact classification

Gate A measured current declaration closures as:

```text
F04_DIRECT             8
F04_TRANSITIVE         7
F04_FREE              22
OTHER_CLASSICAL_ONLY  18
unresolved             0
internal axioms        0
```

Gate B separately retained `77 / 88` accepted-manifest R source files in a research-only whole-source no-F04 survivor assembly.

These are exact measurements of the current proof/package architecture. They must not be upgraded into claims of mathematical necessity:

```text
declaration dependency ≠ whole-source elaboration dependency
formal provenance       ≠ mathematical necessity
```

## Other localized logical commitments remain independent

Only F-04 was the changed factor. The experiment retained as controls:

```text
F-05  finite membership / finite cut bracketing provider
F-06  positive representative extraction provider
F-07  rational-density provider
```

Therefore:

```text
NO F-04 dependency ≠ fully constructive R
```

Removing or replacing F-04 alone does not classify F-05/F-06/F-07 away.

## Downstream sensitivity learned from orderTotal

Gate E removed exactly `orderTotal` from the sixteen-property `ST2-EXP-001` production interface used to test selected C mathematics.

Seven accepted C Claim families survived the measured alternative:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
C-CL-COMPARE-001
```

The current proof closures for `C-CL-FIELD-001` and `C-CL-INTEGRATION-001` did not survive; the measured dependence is transitive through the current square/nonnegative → norm → field path. This is not a theorem that every construction of those meanings mathematically requires total order.

`C-CL-COMPARE-001` remains governed by the separately integrated `ST2-EXP-011` scalar/coordinate comparison boundary.

## Reverse-engineering result

`RE-R-001` classifies the comparability witness as:

```text
LOGICAL COMMITMENT
ALTERNATIVE / BRANCH CANDIDATE
```

It is required by the **current proof route** to discharge RA-09 totality and sign-dependent closure, but it is not part of the definitions of `LowerCut`, `CutEquiv`, `RBOMA`, or the constructive `rLE` core and is not claimed necessary to every construction of the reals.

`ST2-EXP-004` refines this statement: on the current same-carrier interface, totality and `CutComparability` are equivalent, but an unconditional constructive comparability proof was not recovered. A representation-changing locatedness redesign remains a separately authorized future candidate, not an implicit change to this Decision Point.

## Acceptance and ontology firewall

This learning integration changes no selected route, accepted source, accepted manifest, accepted export, or acceptance Junction. It creates no new Block, Decision Point, or Junction.

```text
R-DP-001 SELECTS R-ROUTE-D / Dedekind
R-DP-003 SELECTS localized classical comparability for Stage I
R-BLOCK-001 remains accepted R
BOMA-C-R-DEP-001 remains the exact sixteen-property C-production surface
C-DP-001 SELECTS C-ROUTE-P
C-J-001 and C-BLOCK-002 / CA-20 remain accepted
```

Integration authority:

```text
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_003.md
```

## Metatheory compatibility

`BOMA-META-TCT-001` permits materially classical proof steps when explicitly declared in the relevant PDSA/verification record. This Decision Point records that boundary rather than treating Classical reasoning as invisible background.