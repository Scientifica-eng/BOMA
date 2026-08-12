# EXTERNAL-INTERPRETATION-007 — Isomorphism-Level Determination

## Status

Provisional experimental result.

## Question

Does the framework-neutral core, once supplemented by a formal completeness principle and a canonicity criterion, determine a mathematical structure uniquely up to isomorphism? Or is further structural information required?

## Experimental target

We distinguish three claims:

1. **Compatibility** — a candidate framework can represent the observed construction.
2. **Canonicality within a framework** — the chosen formal specification determines its intended object up to isomorphism (or the framework's corresponding notion of unique representation).
3. **Framework uniqueness** — the pre-formal construction itself forces one mathematical framework.

The project should not conflate these claims.

## Result

The present core can support claim (1) for several candidate interpretations, and suitable framework-specific universal or induction principles can support claim (2). The experiments do **not** establish claim (3).

In particular, an isomorphism result is normally relative to a formal specification. Once the domain, operations, distinguished initial role, and relevant universal/induction principle are fixed, uniqueness up to isomorphism may follow within that framework. But that does not mean the pre-formal construction uniquely selected that specification before formalization.

## Consequence

The missing information is not merely a name for the structure. The project must decide which **structural specification** is intended to be canonical at the formal boundary.

The remaining possibilities are therefore:

```text
pre-formal core
    ↓
framework-specific specification
    ↓
canonical object within that framework
    ↓
unique up to isomorphism
```

rather than:

```text
pre-formal core
    ↓
forced unique framework
```

## Methodological finding

The phrase “unique up to isomorphism” cannot be used as a substitute for a missing formalization choice. It is a result about formally specified structures, not by itself a route from the pre-formal core to one framework.

## Plan position

Stage 8 — External mathematical interpretation.

Next: compare the exact structural specifications needed by the candidate interpretations and identify which components are already supplied by the project and which remain genuine choices.
