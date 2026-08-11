# EXP-029 — General Finite Extension Schema

**Context:** `B-007`, `EXP-028`  
**Status:** Provisional

## 1. Intention / Goal

Test whether the observed cumulative-growth pattern can be stated as a general constructional rule for any already completed finite stage, rather than merely being observed for the first few stages.

## 2. Experiment

Let `S` denote any currently completed finite constructional stage whose available referable tokens are preserved. Apply the chosen extension rule `E` once.

The proposed schema is:

```text
S ──E──► S⁺
```

with the requirements:

1. every referable token available in `S` remains available in `S⁺`;
2. exactly one new provenance-distinguished referable token is made available in `S⁺`;
3. the new token is associated with the new extension occurrence.

This is stated as a rule schema, not as an appeal to an already existing natural-number index.

## 3. Result

The schema is internally coherent relative to the choices already made in `B-004` and `B-007`. Nothing in those choices restricts the rule to only the first two extensions. Therefore the constructional pattern can be generalized from the tested cases to an explicit finite-stage extension schema.

This does **not** establish that there exists a completed infinite object containing all stages. It establishes only that, given a completed finite stage under the construction, the chosen rule specifies a further stage.

The distinction is crucial:

```text
for each completed finite stage: another stage can be constructed
```

is not the same claim as:

```text
there exists one completed infinite stage containing all of them.
```

## 4. Decision

Accept the general finite-extension schema as a provisional constructional rule.

Do not create a Brick identifying the stages with natural numbers. Do not introduce infinity, induction, or a completed infinite collection yet.

## 5. Epistemic Status

`Provisional / generalized chosen rule`

## 6. Next Cycle

Test whether the finite stages themselves can be distinguished and organized by their constructional history. In particular, investigate whether each extension occurrence induces a canonical relation between the preceding stage and the newly constructed stage. This may be the point at which a successor-like relation emerges, but it must not be assumed in advance.
