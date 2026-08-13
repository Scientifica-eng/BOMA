# TCT-BR-009 Derivability Test 001 — Can Terminal Preservation Be Derived?

## Purpose

Determine whether `TCT-BR-009 — Terminal Interface Preservation` follows from the structural-equivalence relation already declared by the construction track, or whether it must remain an additional explicit constraint.

## Input units

- `TCT-BLOCK-001`
- `TCT-BLOCK-002`
- `TCT-J-001`
- `TCT-BR-009`

## Question

Can the following property be derived without adding a new structural assumption?

```text
A = P ⊙ U
B = Q ⊙ U
A ≈ B
        ↓
P ≈ Q
```

with preservation of the distinguished terminal role of `U`.

## Audit of the current definition

The current construction documents use `≈` as a structural-equivalence target, but do not yet provide a complete formal definition that states which interfaces, boundaries, or terminal roles must be preserved by `≈`.

TCT-001 explicitly marks associativity up to `≈` as a verification target. TCT-002 adopts a normal-form convention and exposes a terminal `U`. TCT-J-001 then requires recovery to descend to structural-equivalence classes.

However, none of these statements alone establishes that `≈` preserves the distinguished terminal interface.

## Derivability result

**The terminal-interface preservation property is NOT DERIVED from the currently specified definition of `≈`.**

The reason is structural rather than numerical:

1. `≈` has been introduced as an equivalence of resulting configurations.
2. The project has not yet specified that an equivalence must preserve boundary/interface data.
3. Therefore preservation of the terminal role cannot be inferred without an additional condition or a stronger definition of `≈`.

## Decision

`TCT-BR-009` therefore has epistemic status:

```text
DECLARED ADDITIONAL CONSTRAINT
```

It is not a theorem of the present kernel.

## Consequence for TCT-J-001

The Junction cannot be promoted to unconditional `PASS` on the basis of the current definitions.

The admissible route is:

```text
TCT-BR-009
    ↓
explicitly strengthen the admissibility of ≈
    ↓
terminal interface is invariant under ≈
    ↓
TCT-J-001 can pass conditionally on this declared constraint
```

This keeps the assumption visible instead of importing it silently into decomposition.

## What remains independent

This result does NOT imply that numerical concepts are needed.

The added condition is structural only. It does not introduce:

```text
0, 1, 2, n
cardinality
addition
successor
induction
```

## Reversal test

A future alternative definition of `≈` may make terminal preservation derivable. Such a definition must then be recorded as an explicit alternative unit or revision, and the present `TCT-BR-009` status must be updated accordingly.

## Current status

```text
TCT-BR-009 = DECLARED ADDITIONAL CONSTRAINT
TCT-J-001   = CONDITIONAL / PENDING
TCT-BLOCK-003 = RESERVED / NOT BUILT
```

## Audit conclusion

The project has reached a genuine architectural boundary: canonical decomposition requires more information than the currently stated structural-equivalence relation provides.

That information is now explicit and independently locatable as `TCT-BR-009`.
