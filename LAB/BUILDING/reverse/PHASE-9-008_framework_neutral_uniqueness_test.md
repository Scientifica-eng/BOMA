# PHASE-9-008 — Framework-Neutral Uniqueness Test

## Status

Phase 9 — Formal matching against the natural-number target.

## Purpose

Test whether the common structural core identified across the Peano-style, free-monoid, initial-algebra, and natural-number-object interpretations can determine a unique mathematical object under a framework-neutral notion of equivalence.

## Candidate neutral equivalence

The weakest useful notion considered here is behavioral equivalence of the finite generative core: two formal realizations are treated as equivalent when they preserve the same distinguished initial role, one elementary extension role, finite generation, finite decomposition, construction depth, and coherent finite composition behavior.

This criterion is intentionally weaker than a formal isomorphism because an isomorphism presupposes a formal ontology and identity relation supplied by a framework.

## Test

The question is whether behavioral equivalence alone forces all admissible formal completions to collapse to one object up to this weak equivalence.

## Result

The test does not yield framework-neutral uniqueness.

The four formalizations agree strongly on the finite generative behavior, but the mechanisms that turn that behavior into a complete object remain different:

- Peano uses a formal carrier, initial element, successor, and closure/induction.
- Free monoid uses a monoid carrier, identity, composition, generator, and freeness.
- Initial algebra uses a formal signature, algebraic setting, generation, and initiality.
- NNO uses categorical infrastructure, zero/successor maps, and a universal property.

A weak behavioral equivalence can identify the finite construction pattern shared by these interpretations, but it cannot by itself determine the formal domain, identity, completion mechanism, or universal property.

## Counter-pressure

Any attempt to strengthen the neutral equivalence until it distinguishes one of these frameworks must introduce additional structure. Once that happens, the criterion is no longer fully framework-neutral.

Thus there is a tradeoff:

```text
weaker equivalence
    -> stronger framework neutrality
    -> weaker uniqueness

stronger equivalence
    -> weaker framework neutrality
    -> stronger uniqueness within a chosen formal setting
```

## Main conclusion

The common pre-formal core does not currently determine a unique complete mathematical object by itself.

The strongest defensible claim is narrower:

> The project identifies a common finite generative behavior that is representable in several formal frameworks, while uniqueness of the completed mathematical object requires an additional framework-level specification.

This means that framework choice is not merely a presentation detail. It is part of the formal completion of the construction.

## What remains unresolved

- Whether a still stronger but genuinely neutral notion of equivalence exists.
- Whether the target can be characterized neutrally by a universal property without importing a specific framework.
- Whether the project should treat the framework choice as an explicit final constitutive decision.
- Whether the natural-number target should be identified directly, or only as an equivalence class of formal realizations under a declared framework.

## Rule for Phase 9

No framework-specific identity, equality, isomorphism, universal property, or closure principle is promoted to a pre-formal fact.

## Plan position

Stage 9 — Formal matching against the natural-number target.
Substage 008 — Framework-neutral uniqueness test completed.

Next: determine whether the remaining ambiguity can be reduced by adding a minimal target specification, or whether the framework choice is an irreducible constitutive choice of the final formalization.
