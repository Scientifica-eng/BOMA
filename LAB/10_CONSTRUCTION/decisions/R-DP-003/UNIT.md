# R-DP-003 — Dedekind Real Total-Order Logical Regime

- **Operational Status:** **OPEN — LOGICAL SENSITIVITY PROBE REQUIRED**
- **Epistemic Status:** **LOGICAL / METHODOLOGICAL DECISION POINT**
- **Input:** `R-DP-002 — RBOMA quotient identity selected`
- **Target:** `BOMA-R-ACCEPT-001 / RA-09 / RA-19`

## Decision question

What explicit logical commitment, if any, is required to promote cut inclusion from a representative-invariant partial order to the Stage-One **total** real order required by `RA-09`?

## Current facts

The selected representation provides:

```text
LowerCut
CutEquiv
CutLE := lower-set inclusion
RBOMA := LowerCut / CutEquiv
rLE := quotient inclusion interface
```

The current `LowerCut` syntax does not silently contain excluded middle, a total-comparability axiom, or a separate locatedness field.

## Candidate A — explicit Classical derivation

Use classical reasoning only to establish cut comparability:

```text
CutComparability := ∀ A B : LowerCut, CutLE A B ∨ CutLE B A
```

Then derive quotient totality from that interface.

This route must demonstrate that:

```text
reflexivity/transitivity/antisymmetry remain constructive;
Classical is localized to CutComparability;
field/order proofs downstream consume the comparability theorem rather than reintroducing classical reasoning ad hoc.
```

## Candidate B — declare narrow cut-comparability principle

Treat `CutComparability` itself as an explicit logical/formalization commitment without exporting unrestricted `Classical` into the object-level interface.

This is logically narrower at the architectural interface, but the project must not pretend it has been constructively derived if its only current witness uses classical reasoning.

## Candidate C — revise toward a constructive real-order contract

Strengthen or alter the cut/order specification and weaken/adjust the acceptance notion of totality if a genuinely constructive Stage-One real domain is desired.

This would be a substantive acceptance-specification revision and may require revisiting standard Stage-One goals. It is not a silent implementation choice.

## Metatheory compatibility

`BOMA-META-TCT-001` states that a materially classical step is permitted at the meta/proof level when explicitly declared in the relevant PDSA/verification record; it must not be treated as invisible background.

Thus an explicit classical Stage-One R decision is permissible if scientifically justified and locally recorded.

## Decision lock

Before resolving this Decision Point, V5 must distinguish:

```text
constructive partial-order laws on rLE
CutComparability as a separate proposition/interface
rLE totality derived from CutComparability
Classical derivation of CutComparability in an isolated theorem
```

No downstream file may simply write `classical` to obtain real totality before this gate closes.
