# EXTERNAL-INTERPRETATION-006 — Completeness and Canonicity Across Frameworks

## Status

Phase 8 — External mathematical interpretation.

## Question

How does each candidate framework make the observed pre-formal structure complete and mathematically determinate, without comparing frameworks merely by counting axioms?

## Common starting point

The framework-neutral core already isolated consists of:

- a distinguished initial role;
- an elementary extension/transition role;
- finite construction histories;
- composition of histories;
- operational associativity of sequential composition;
- a candidate empty history;
- construction depth;
- finite decomposition into elementary extensions.

These are not yet identified with sets, natural numbers, or a formal equality relation.

## Framework comparison

### A — Free monoid on one generator

Completion requires a formal carrier together with an associative binary operation and an identity, plus a generator satisfying the intended generation condition. The word **free** adds a universal property: maps out of the generated structure are determined by the image of the generator.

The main source of canonicity is therefore **universal characterization**, not induction alone.

### B — Peano-style natural-number structure

Completion requires a formal domain containing the distinguished initial element and closed under the successor-like operation. A global induction principle (or an equivalent completeness principle, depending on the logical setting) controls the intended totality and rules out unintended successor-closed substructures for the target reasoning.

The main source of canonicity is therefore **initial element + successor structure + induction/closure**, with the exact strength depending on the logical formulation.

### C — Initial algebra / inductive datatype

Completion is expressed by choosing an algebraic signature (here, a base constructor and unary successor-like constructor) and requiring an **initial algebra** for that signature. The universal property supplies both generation and canonical recursion/fold behavior.

The main source of canonicity is therefore **initiality**.

### D — Category-theoretic natural-number object

Completion occurs inside a category with sufficient structure, by an object equipped with zero-like and successor-like morphisms satisfying the chosen natural-number universal property. The framework provides canonicity up to unique isomorphism in the categorical sense.

The main source of canonicity is therefore **a categorical universal property**, together with the ambient categorical assumptions.

## Comparative finding

The frameworks do not differ merely by the number of extra axioms. They shift the location and nature of the decisive commitment:

| Framework | What makes the structure complete | Main canonicity mechanism |
|---|---|---|
| Free monoid | formal carrier + monoid laws + generation | universal/free property |
| Peano-style | formal domain + successor closure + induction/completeness | induction/closure plus successor structure |
| Initial algebra | formal algebra + initial object | initiality / recursion |
| Natural-number object | categorical ambient + NNO structure | categorical universal property |

## Key result

No candidate is selected as uniquely forced by the pre-formal construction.

What appears common is not a particular axiom schema but a two-part requirement:

1. **Formal completion** — turn the locally constructible structure into an object whose domain and operations are governed formally.
2. **Canonicity criterion** — provide some principle that distinguishes the intended completion from arbitrary alternatives.

The second requirement is especially important. Merely declaring a domain is insufficient to explain why that domain should count as *the* mathematical interpretation of the construction.

## Methodological consequence

The project should not ask which framework has the fewest axioms. It should ask:

> Which framework supplies the required completion and canonicity with the least additional conceptual commitment relative to the construction's own vocabulary?

This remains an external comparison. No framework is imported backward into the pre-formal layer.

## Plan position

Stage 8 — External mathematical interpretation.
