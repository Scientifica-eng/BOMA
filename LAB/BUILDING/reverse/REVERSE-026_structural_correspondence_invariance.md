# REVERSE-026 — Structural Correspondence as Source of Order-Invariant Counting

**Status:** Experiment completed — provisional result  
**Purpose:** Test whether order-invariant counting behavior can be derived from structural correspondence rather than imposed as an independent numerical rule.

## 1. Intention / Goal

Investigate whether different processing orders over the same distinguishable plurality can be shown to produce the same final structural pattern using only the neutral pattern chain and a structure-preserving correspondence.

The target is not yet a number. The target is an invariant result under reordering.

## 2. Experimental Setup

Let the neutral chain be represented schematically as:

```text
P₀ → P₁ → P₂ → P₃ → ...
```

Let an external plurality be represented only as a collection of distinguishable sources, without assuming cardinality.

A processing protocol assigns each source to an available chain position while preserving the chain transition rule.

We compare two processing orders over the same sources.

## 3. Test

### Order A

```text
x → P₀
 y → P₁
 z → P₂
```

### Order B

```text
z → P₀
 x → P₁
 y → P₂
```

The raw positional assignments differ. Therefore position-by-position equality cannot be the invariant.

The relevant question is whether the two assignments preserve the same **structural pattern**: same number of used positions in the chain, same initial-to-terminal span, and same transition depth in the neutral pattern language.

## 4. Result

The experiment supports a conditional result:

> If the correspondence protocol is required to preserve the structural organization of the chain and to ignore the incidental order in which external sources are processed, then reordering the same sources preserves the resulting structural pattern.

However, this invariance does **not** arise from the chain alone. It depends on an additional protocol requirement:

> the correspondence must be invariant under permutation of processing order.

Thus structural correspondence can explain order-invariant counting behavior, but only after order-invariance has been made part of the correspondence protocol.

## 5. Critical Finding

We have not derived permutation-invariance from the pre-mathematical chain itself.

The dependency is:

```text
neutral chain
    ↓
structural correspondence
    ↓
[order-invariance requirement]
    ↓
stable structural result
```

Therefore we must not claim that order-invariance is already contained in the notion of correspondence.

## 6. Consequence for the Emerging Number Concept

The emerging picture is now:

```text
neutral pattern chain
        ↓
correspondence
        ↓
order-independent structural invariant
        ↓
count-like magnitude
        ↓
(possibly) number object
```

This strengthens the hypothesis that a numerical magnitude may arise as an invariant of structural correspondence rather than being attached to a chain position from the beginning.

But the invariant has not yet been formalized as a mathematical object.

## 7. Decision

1. Accept structural correspondence as a viable mechanism for explaining order-independent counting behavior.
2. Do not claim that order-invariance is derived automatically.
3. Treat order-invariance as a candidate additional structural principle whose own preconditions must be investigated.
4. Preserve the distinction between a stable invariant and a numerical object.
5. Continue the reverse path by asking whether the order-invariance requirement can itself be decomposed into weaker, non-numerical conditions.

## 8. Next Experiment

**REVERSE-027:** Decompose order-invariance. Test whether it follows from more primitive requirements such as reindexing neutrality, preservation of source distinction, and preservation of the chain's transition structure, or whether order-invariance is itself an independent choice.
