# EXP-018 — Distinguishing a Constructional Output

**Brick / context:** `B-003`  
**Status:** Provisional

## 1. Intention / Goal

Test whether the current construction provides any legitimate basis for treating `κ(r)` as distinct from `r`, without importing a primitive equality/inequality relation or assuming that every construction changes its input.

## 2. Experiment

Consider the operation `κ` introduced in `B-003`. Compare two descriptions:

```text
r
κ(r)
```

Ask what would justify the claim that these are different.

Three possibilities are kept open:

1. the construction rule itself forces a distinction;
2. an additional explicit primitive of distinction/identity is required;
3. no distinction can yet be justified.

## 3. Result

The current construction does not force `κ(r)` to be distinct from `r`. Merely performing a further construction does not logically provide inequality. The earlier distinction-making act `δ` also does not supply a criterion for comparing the input and output of `κ`.

Therefore the experiment does **not** produce a new distinguishable entity.

This is a productive negative result: it shows that reusability of a referable result is weaker than generation of novelty.

## 4. Decision

Do not create a new Brick representing `κ(r)` as a distinct entity.

Record the failed attempt as a constraint on the current path:

> A construction operation does not automatically generate a new distinguishable result.

The next experiment should therefore investigate whether a second distinction-making act can be constructed explicitly, rather than assuming that iteration of `κ` creates novelty.

## 5. Epistemic Status

`Accepted negative result / provisional constraint`

## 6. Next Cycle

Test whether the primitive distinction-making capability `δ` can itself be reapplied or instantiated in a way that yields a second referable result, while making the additional choice explicit.
