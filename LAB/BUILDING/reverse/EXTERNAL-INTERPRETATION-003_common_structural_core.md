# EXTERNAL-INTERPRETATION-003 — Common Structural Core

## Status

Phase 8 — External mathematical interpretation.

## Purpose

Identify the structural core shared by the Free-Monoid and Peano-style external readings without importing either framework into the pre-formal construction.

## Common core

The present evidence supports the following shared features:

1. **Distinguished initial role** — a structurally privileged starting configuration.
2. **Elementary extension role** — one repeatable transition/extension pattern.
3. **Finite compositional history** — successive extensions can be treated as a finite history.
4. **Decomposability** — a finite history can be reduced step-by-step toward its initial configuration.
5. **Depth invariant** — finite histories admit a recoverable construction depth.
6. **Compositional behavior** — combining histories produces a longer construction history.
7. **Associative sequential behavior** — regrouping the same sequence of extensions preserves its operational behavior.
8. **Candidate identity behavior** — an empty history can be admitted as a neutral case, but this remains an explicit modeling choice rather than a pre-formal necessity.

## What is deliberately excluded from the common core

The following are not admitted as pre-formal facts merely because one candidate framework uses them:

- a set or totality containing all stages;
- a formal equality relation;
- cardinality;
- induction as a formal axiom;
- a universal/free property;
- categorical initiality;
- a named natural-number object;
- the equation between construction depth and a pre-existing natural number.

## Comparison result

The common core is sufficient to explain why both Free-Monoid and Peano-style interpretations fit the observed construction. It is not sufficient, by itself, to select one interpretation uniquely.

The key difference between the external frameworks is therefore not primarily the local constructional behavior. It is the additional global and formal structure each framework supplies.

```text
PRE-FORMAL COMMON CORE

initial role
    +
repeatable elementary extension
    +
finite histories
    +
decomposition
    +
depth
    +
composition
    +
associative sequential behavior

             ↓

       FORMALIZATION

      /             \
     /               \
Free-Monoid        Peano-style
reading             reading
```

## Methodological conclusion

The project should treat this common core as the **framework-neutral boundary object** of Phase 8.

It is not yet ℕ, not yet a monoid, and not yet a Peano system.

The next task is to determine, for each external interpretation, the smallest additional commitments required to turn this common core into a formally identified mathematical structure.

## Plan position

Stage 8 — External mathematical interpretation.
Next: EXTERNAL-INTERPRETATION-004 — minimal added commitments for each candidate framework.
