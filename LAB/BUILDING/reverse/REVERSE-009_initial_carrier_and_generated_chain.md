# REVERSE-009 — Initial Carrier and Generated Chain

**Status:** Provisional result  
**Path:** Reverse engineering

## 1. Intention / Goal

Test whether the initial stage and the generated chain can be characterized entirely from the construction protocol, without importing an independent ordering relation.

## 2. Experiment

Take a referable carrier `c` and the extension operation `E`.

A carrier is **initial** relative to the protocol when its recorded origin is not itself the result of an earlier application of `E` within that protocol.

Applying `E` yields:

```text
c₀ ──E──► c₁ ──E──► c₂ ──E──► ...
```

The transition itself supplies the local predecessor-to-next relation.

## 3. Result

The construction protocol can distinguish an initial carrier from carriers produced by an earlier extension occurrence. Thus initiality can be characterized from construction history rather than imported as an independent order-theoretic primitive.

Likewise, the successor-like local relation is inherited from `E`; no separate `<` relation is required to state the immediate transition.

However, the protocol alone does not establish that the generated chain is the entire mathematical domain. It gives a **generated chain of admissible carriers**, not yet a completed domain with an independently stated global closure principle.

## 4. Decision

Accept the following as provisional structural consequences:

1. an initial carrier can be characterized by absence of a prior extension in its recorded origin;
2. the immediate successor-like relation can be derived from `E`;
3. the generated chain can be described without importing an external order relation.

Do not yet identify the generated chain with `N` or with any completed mathematical domain.

## 5. Next Question

Determine whether the collection of generated carriers can be treated as a coherent domain by using only a **selection/acceptance rule** for admissible carriers, rather than a ready-made set-theoretic membership relation.

This is the next candidate point at which an explicit foundational choice may enter.
