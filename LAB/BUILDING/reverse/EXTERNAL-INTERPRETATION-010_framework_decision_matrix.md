# EXTERNAL-INTERPRETATION-010 — Framework Decision Matrix

## Status

Phase 8 — External mathematical interpretation.

## Question

Can the candidate mathematical readings be compared using one unified decision matrix based on the project's actual findings, rather than on the number of axioms or familiarity of the framework?

## Decision criteria

The comparison uses four dimensions:

1. **Operational fidelity** — how directly the framework preserves the constructional meaning already observed.
2. **Completion mechanism** — what the framework adds to pass from finite construction to a formal total domain.
3. **Canonicity mechanism** — what makes the interpreted structure determinate within that framework.
4. **External semantic load** — how much framework-specific machinery must be imported beyond the neutral core.

These are qualitative comparative criteria, not a proof-theoretic ranking.

## Candidate matrix

| Candidate | Operational fidelity | Completion mechanism | Canonicity mechanism | External semantic load |
|---|---|---|---|---|
| Free monoid on one generator | Very high: history composition is central | Formal carrier + associative composition + identity | Freeness / universal property | Medium |
| Peano-style successor structure | High: initial role + elementary extension | Formal domain + closure/induction principle | Induction and successor-based characterization | Medium |
| Initial algebra | Very high: base + constructor + recursive decomposition | Initiality of the generated algebra | Initiality / universal property | Medium–high |
| Natural-number object | High: structure and maps are separated cleanly | Categorical existence of the NNO | Universal property | High |

## Result

No single framework wins on all four criteria.

- **Free monoid** has the strongest direct fit to history composition and additive composition.
- **Peano** has the strongest direct fit to initial-plus-successor language, but its completion burden mirrors the closure problem exposed by the CLOSURE-CORE series.
- **Initial algebra** has particularly strong fidelity to the generative and decompositional character of the construction, but its notion of initiality is already framework-specific.
- **Natural-number object** cleanly expresses canonicity through a universal property, but it carries the largest amount of external categorical infrastructure relative to the current project.

## Important conclusion

The matrix does **not** justify choosing a framework by a simple score.

The most important common finding is that every interpretation requires some framework-specific mechanism that turns the observed finite construction core into a formally governed object. The project therefore has not discovered a framework-free proof that uniquely forces one of these mathematical formalisms.

The strongest current conclusion is narrower:

> The reverse-engineered construction has a robust framework-neutral core, while the passage from that core to a complete and canonical mathematical object remains interpretation-dependent.

## Consequence for Phase 9

Phase 9 should therefore not ask merely whether the resulting object can be called ℕ. It should test, under each explicit formalization, whether the resulting object satisfies the intended natural-number characterization and what additional assumptions were required to obtain that result.

## Plan position

Stage 8 — External mathematical interpretation.

Current substage: unified framework comparison completed.

Next: Phase 9 — formal matching against the natural-number target under explicitly declared frameworks.
