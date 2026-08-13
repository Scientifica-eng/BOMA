# EXP-035 — Depth Compatibility Under Extension

**Context:** `B-013`  
**Status:** Provisional

## 1. Intention / Goal

Test whether the depth abstraction is stable under the chosen extension operation. In particular, determine whether equal-depth histories remain equal-depth after one extension.

## 2. Experiment

Take two finite construction histories with equal depth:

```text
s₀ → s₁ → ... → S
s₀ → t₁ → ... → T
```

with the same number of extension occurrences. Apply one extension to each:

```text
S ──E──► S⁺
T ──E──► T⁺
```

Compare the resulting depths.

## 3. Result

Both extensions add exactly one extension occurrence. Therefore equal-depth histories acquire equal depth after the same extension operation.

Schematically:

```text
same depth
    │ E
    ▼
same new depth
```

Thus the extension operation is compatible with the depth abstraction: it does not depend on the internal token/provenance details that were discarded when passing from a concrete history to its depth class.

The result is stronger than the mere existence of a depth invariant. It shows that the chosen extension operation can descend to the depth abstraction as a well-defined one-step operation.

However, the phrase “increase” remains constructional. We have not yet introduced an abstract numerical addition operation or a formal successor function on a pre-existing number domain.

## 4. Decision

Accept the compatibility result as a provisional structural result.

Promote depth classes to a candidate pre-numerical domain, with a distinguished initial class and a well-defined one-step extension operation.

Do not yet call the resulting objects natural numbers. Do not assign the symbols `0,1,2,...` except as optional temporary labels, and if labels are used they must be explicitly marked as notation rather than identities.

## 5. Epistemic Status

`Provisional structural result / abstraction stabilized`

## 6. Next Cycle

Construct the candidate pre-numerical domain explicitly from finite construction histories modulo equal-depth equivalence, then test whether the initial class and one-step operation satisfy the local structure already observed. This is the point at which we can decide whether a genuine pre-numerical Brick should be introduced.
