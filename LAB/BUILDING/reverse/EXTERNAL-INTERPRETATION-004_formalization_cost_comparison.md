# EXTERNAL-INTERPRETATION-004 — Formalization Cost Comparison

## Status

Phase 8 — External mathematical interpretation.

## Question

What additional commitments are introduced when the framework-neutral structural core is interpreted in candidate mathematical frameworks?

## Framework-neutral core

The preceding construction supplies, provisionally:

- a distinguished initial structural role;
- an elementary extension/transition role;
- finite construction histories;
- composition of histories;
- operational associativity of sequential composition;
- a candidate empty history as identity, when explicitly admitted;
- construction depth;
- finite decomposition into elementary extensions;
- local referenceability without a prior global domain.

These observations do not by themselves introduce sets, formal equality, induction, universal properties, or a completed natural-number domain.

## Candidate A — Free monoid on one generator

### Additional commitments

1. Treat the relevant finite histories as elements of a formal carrier.
2. Treat history composition as a formal binary operation on that carrier.
3. Treat the empty history as a formal identity element.
4. Prove associativity formally.
5. Establish that one elementary step generates the carrier.
6. If the word **free** is retained, add the appropriate universal property.

### Cost profile

The algebraic overhead is substantial but closely aligned with the already observed composition behavior. The universal/free property is the largest added commitment and is not required merely to identify a monoid.

## Candidate B — Peano-style successor structure

### Additional commitments

1. Treat the finite stages as elements of a formal domain.
2. Promote the initial structural role to a distinguished formal element.
3. Promote elementary extension to a formal successor operation.
4. Establish successor-specific structural properties, such as non-origin and injectivity, in the chosen formulation.
5. Add induction or another completeness/closure principle sufficient to identify the intended totality.

### Cost profile

The successor layer fits the construction directly. The major added commitment is global closure/completeness.

## Candidate C — Initial algebra / inductive datatype

### Additional commitments

1. Specify a formal signature containing the initial constructor and successor-like constructor.
2. Form an algebra for that signature.
3. Require initiality (or the corresponding recursion/elimination principle).
4. Obtain the generated finite structure as the canonical initial solution.

### Cost profile

The local constructor picture fits strongly, but initiality itself is a global mathematical criterion. This framework packages generation and recursion particularly efficiently, at the cost of more categorical/algebraic infrastructure.

## Candidate D — Natural-number object

### Additional commitments

1. Introduce a formal ambient category with a terminal object and finite-product structure sufficient for the definition.
2. Introduce zero and successor maps.
3. Require the natural-number-object universal property.
4. Derive the expected recursion/induction behavior from that property.

### Cost profile

Conceptually powerful but comparatively heavy for the present project. It supplies a framework-level explanation of uniqueness and recursion rather than merely formalizing the observed finite pattern.

## Comparative table

| Candidate | Main added commitment | Relative conceptual cost | Closest fit |
|---|---|---|---|
| Free monoid | formal monoid + freeness | medium | history composition |
| Peano | formal domain + induction/closure | medium | initial + successor |
| Initial algebra | initiality / recursion principle | medium-high | generation + decomposition |
| Natural-number object | categorical infrastructure + universal property | high | universal characterization |

## Decision

No framework is selected on the basis of raw commitment count alone. The project distinguishes:

- **descriptive cost** — machinery needed to name the observed structure;
- **closure cost** — machinery needed to turn the finite horizon into a total domain;
- **uniqueness cost** — machinery needed to identify one canonical formal interpretation.

The evidence so far suggests that the strongest common burden across candidate frameworks is not the local successor/extension behavior. It is the **global mechanism that turns finitely generated behavior into one formally governed domain**.

Therefore the next Phase-8 test should isolate the uniqueness/canonicity question from the closure question.

## Plan position

Stage 8 — External mathematical interpretation.
