# PHASE-10-004 — Multiplication as Iterated Constructional Addition

## Status

Stage 10 — Integration of the forward construction and reverse-engineering paths.

## Purpose

Test whether formal multiplication can be realized as a second-order repetition of the already integrated constructional addition law, without introducing a new primitive constructional operation.

## Formal setting

The integration remains under the Peano-style realization regime declared in PHASE-10-002 and used in PHASE-10-003:

- formal carrier N;
- distinguished initial element 0;
- successor S;
- declared closure/induction principle;
- addition defined recursively from successor.

Multiplication is introduced formally by recursion over one argument using addition. Its use is therefore framework-specific.

## Constructional interpretation

Let H_a be a finite history of depth a. Repeating the history-composition operation b times produces a history whose depth is the accumulation of b copies of a:

```text
H_a
H_a ∘ H_a
H_a ∘ H_a ∘ H_a
...
```

The resulting depth is the repeated addition:

```text
a + a + ... + a   (b repetitions)
```

The candidate constructional interpretation is therefore:

```text
b-fold composition of an a-step history
        ↔
formal multiplication a × b
```

## Formal mapping

Under the correspondence already established in PHASE-10-003:

```text
H_a              ↔ S^a(0)
b-fold composition ↔ repeated formal addition
resulting depth    ↔ a × b
```

The formal recursion can be represented as:

```text
 a × 0     = 0
 a × S(b)  = (a × b) + a
```

The constructional counterpart is:

```text
Compose(a, 0)    = empty history
Compose(a, S(b)) = Compose(a, b) ∘ H_a
```

Thus the multiplication rule is the formal image of a second-order construction: repeat the already established composition operation.

## Verification

### Base case

Zero repetitions produce the empty continuation. Formally:

```text
 a × 0 = 0
```

This agrees with the depth of the empty result.

### Successor step

Adding one more copy of H_a appends a-step history to the accumulated result. Therefore:

```text
depth(Compose(a, S(b)))
= depth(Compose(a, b)) + a
```

which maps to:

```text
 a × S(b) = (a × b) + a
```

under the declared recursive definition of multiplication.

### Depth preservation

The correspondence preserves constructional depth at every finite repetition step. Hence the numeric value produced by formal multiplication agrees with the measured depth of the repeated construction.

### Order of iteration

This experiment exposes a subtle point: the construction is intrinsically directional because one history is treated as the repeated block and the other as the repetition count. Commutativity of multiplication is not obtained merely from this directional construction rule.

Therefore:

```text
a × b = b × a
```

requires an additional formal proof inside the chosen arithmetic framework; it is not claimed as a pre-formal consequence of the raw construction protocol.

## Hidden-assumption audit

No new primitive constructional operation was introduced beyond:

- finite history;
- sequential composition;
- repeatable extension.

However, the formal experiment adds:

- recursive multiplication;
- formal addition;
- formal equality;
- induction/closure.

These are framework-level resources. In particular, commutativity and distributivity are not imported into the pre-formal layer.

## Main result

**PASS — multiplication is coherently realized as iterated addition of constructional histories.**

The result is significant because multiplication does not require a new pre-formal primitive analogous to the original distinction or elementary extension. It can be interpreted as a higher-order iteration of an operation already integrated at the additive level.

The supported statement is:

> Under the chosen Peano-style formalization, formal multiplication is a faithful realization of repeated constructional composition, with constructional depth corresponding to the product.

This is not a claim that multiplication was independently derived as a pre-formal mathematical operation.

## Structural significance

The integrated hierarchy now reads:

```text
constructional extension
        ↓
finite history
        ↓
history composition
        ↓
formal addition
        ↓
iteration of composition
        ↓
formal multiplication
```

This supports viewing arithmetic as successive formalizations of increasingly higher-order constructional processes.

## Decision

**Integration status: PASS for multiplication as iterated addition on the tested finite fragment.**

**No new primitive constructional axiom required.**

The next experiment should test whether order can be reconstructed from the already integrated successor/addition structure, rather than introduced as an independent primitive.

## Rule for Stage 10

A higher-order formal operation is not promoted to a new pre-formal primitive merely because it has a standard mathematical name. Its constructional provenance must be recorded separately from its formal realization.

## Plan position

Stage 10 — Integration of forward and reverse paths.
Substage 004 — Multiplication integrated as iterated addition.
