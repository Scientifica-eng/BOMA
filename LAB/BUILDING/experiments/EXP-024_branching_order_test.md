# EXP-024 — Parallel Ordered and Unordered Grouping Test

**Context:** `B-005` / `EXP-023`  
**Status:** Provisional

## 1. Intention / Goal

Test both legitimate extensions left open by `EXP-023` rather than choosing between them prematurely. The aim is to determine whether the construction of finite multiplicity itself favors ordered or order-insensitive grouping.

## 2. Experiment

Construct two provisional branches from `B-005`:

**Branch O — ordered grouping**

```text
G(r₁,r₂)  and  G(r₂,r₁)
```

are retained as potentially distinct constructions.

**Branch U — order-insensitive grouping**

```text
G(r₁,r₂) = G(r₂,r₁)
```

is adopted as an explicit convention.

We then ask whether either branch is required merely to represent the existing two-token multiplicity.

## 3. Result

Both branches can represent the two-token situation. Neither branch is forced merely by the existence of two referable tokens.

However, the branches encode different information:

- Branch O preserves provenance/order information.
- Branch U deliberately forgets that information at the grouping level.

Therefore the project goal of reaching natural numbers does not yet justify eliminating either branch. In particular, **counting two things does not itself require deciding whether the grouping operation is ordered**.

The experiment also suggests that ordering and counting should be separated conceptually. A natural-number construction may eventually require a notion of progression or iteration without requiring ordered grouping of arbitrary finite collections.

## 4. Decision

Do not create a permanent Brick for either branch yet. Keep `B-005` as the common predecessor and record the two grouping interpretations as provisional branches.

For the main construction path, prioritize the weakest structure shared by both branches. Investigate whether a notion of **repeatable extension of an existing construction** can be built without resolving the order question.

## 5. Epistemic Status

`Provisional / branching experiment`

## 6. Next Cycle

Test whether one existing referable token can be extended by one newly produced token in a way that preserves the earlier token and records the extension. This targets the possibility of an incremental construction without presupposing a successor function or ordered pair.
