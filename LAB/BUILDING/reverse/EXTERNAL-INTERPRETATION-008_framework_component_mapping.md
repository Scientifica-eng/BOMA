# EXTERNAL-INTERPRETATION-008 — Framework Component Mapping

## Status

Phase 8 — External mathematical interpretation.

## Purpose

Map the components required by the candidate external frameworks against what has actually been established on the neutral construction path.

The labels used are:

- **Built** — supported directly by prior constructional work.
- **Candidate** — behaviorally suggested, but not yet established as a formal property.
- **External commitment** — introduced only when a mathematical framework is selected.

## Mapping

| Structural component | Neutral construction status | Free Monoid reading | Peano-style reading | Initial Algebra reading | Natural-number-object reading |
|---|---|---|---|---|---|
| Distinguished initial role | Built | identity/empty-history candidate or derived initial role | distinguished zero-like element | base constructor | zero-like map/object data |
| Elementary extension | Built | generator action | successor-like operation | unary constructor | successor map |
| Finite histories | Built | finite words/compositions | finite successor chains | finite generated terms | finite behavior associated with the structure |
| History composition | Built | formal binary operation candidate | derived/secondary operation | algebraic composition | represented through universal structure |
| Operational associativity | Built at construction level | formal monoid law | not central | algebraic law as appropriate | not primitive |
| Empty history | Candidate | formal identity element | no required central role | may correspond to base behavior, but not automatically identity | depends on chosen categorical formulation |
| Construction depth | Built as structural invariant | generator-occurrence count under formalization | stage/iteration interpretation | finite term depth/constructor count | morphism/recursion interpretation |
| Finite decomposition | Built for finite histories | word decomposition | predecessor/successor decomposition | recursive decomposition | structural recursion interpretation |
| Global domain | Not built | External commitment | External commitment | External commitment | External commitment |
| Formal identity criterion | Not built | External commitment | External commitment | External commitment | External commitment |
| Closure / completeness | Not built | External commitment | induction/completeness-type commitment | initiality / inductive generation commitment | universal property / NNO commitment |
| Freeness / universal property | Not built | External commitment | Not central | External commitment | External commitment |
| Canonical identification | Not forced | Comes from the chosen free characterization | Comes from the chosen formal specification | Comes from initiality | Comes from the universal property |

## Result

The mapping confirms a strict boundary:

```text
neutral construction
    ↓
initial role
extension
finite history
composition
associativity behavior
depth
decomposition

=========== formalization boundary ===========

formal domain
formal identity
formal closure/completeness
framework-specific universal or induction principle
canonical interpretation
```

The strongest conclusion supported by the comparison is therefore not that one framework has already been built, but that a substantial **behavioral core is framework-independent**, while the properties that turn that core into a canonical mathematical object remain external commitments.

## Important limitation

This table compares conceptual requirements, not proof-theoretic strength or logical equivalence of foundations. It must not be read as a theorem that the four frameworks are equally strong or interchangeable.

## Decision

Do not yet select a framework as the project's foundation.

The next question is narrower: which external framework gives the most faithful formalization with the smallest distortion of the already established constructional semantics?

## Plan position

Stage 8 — External mathematical interpretation.
