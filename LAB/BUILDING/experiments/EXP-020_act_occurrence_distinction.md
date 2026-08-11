# EXP-020 — Distinguishing Constructional Occurrences

**Brick / context:** `B-001`, `B-002`  
**Status:** Provisional

## 1. Intention / Goal

Test whether the construction can distinguish two occurrences of the primitive act `δ` before assuming that their outputs are distinct.

## 2. Experiment

Instead of writing two anonymous copies of `δ` and treating them as distinct by notation, explicitly introduce an occurrence distinction at the level of the construction history:

```text
δ₁   δ₂
```

The subscripts are initially labels for two recorded occurrences, not a claim that the occurrences are unequal objects.

The experiment asks whether the construction history itself provides enough information to keep the occurrences apart.

## 3. Result

The construction history can record two positions/events at which the chosen act was performed. This is weaker than constructing two distinct objects, but stronger than treating the repetitions as indistinguishable occurrences in a single undifferentiated description.

However, the distinction between `δ₁` and `δ₂` is currently supplied by the act of recording them as separate occurrences. We have therefore not discovered a new primitive notion of act identity; we have made an explicit choice to retain occurrence information in the construction history.

This produces a useful intermediate structure:

```text
occurrence(δ₁)   occurrence(δ₂)
        │               │
        └── recorded separately ──┘
```

It still does not justify:

```text
r ≠ s
```

for their outputs.

## 4. Decision

Accept **distinguishable recorded occurrences of constructional acts** as a provisional constructional capability, but do not yet promote it to a general identity theory.

No new Brick representing a second object is created. The result remains a property of the construction history.

## 5. Epistemic Status

`Provisional`

## 6. Next Cycle

Test the weakest explicit rule connecting separately recorded constructional occurrences with separately referable outputs. If such a rule is chosen, mark it as a new primitive and examine whether it genuinely yields multiplicity.
