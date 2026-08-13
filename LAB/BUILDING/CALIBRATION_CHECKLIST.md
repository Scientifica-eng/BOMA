# Calibration Checklist

**Purpose:** detect hallucination, scope drift, hidden assumptions, and premature formalization during construction.

## A. Goal alignment

- [ ] Are we still building the pre-numerical foundation toward `N`?
- [ ] Is the current step required by the construction, or merely interesting?
- [ ] Have we postponed later-number-system concerns unless they are needed now?

## B. Mathematical discipline

- [ ] What is primitive here?
- [ ] What is constructed here?
- [ ] Have we smuggled in a numerical concept under another name?
- [ ] Have we assumed existence, uniqueness, finiteness, order, or induction without justification?
- [ ] Is the claimed result actually supported by the current context?

## C. Logical discipline

- [ ] Is the active trunk logic intuitionistic?
- [ ] Did any step use a stronger principle?
- [ ] If yes, is the exact principle identified?
- [ ] Was necessity tested against alternatives?
- [ ] Is the strengthening minimal and explicitly recorded?
- [ ] Are backend conveniences being mistaken for logical necessity?

## D. Brick discipline

- [ ] Does this contribution deserve to be a Brick?
- [ ] Are dependencies genuine rather than merely chronological?
- [ ] Is compatibility checked in the correct logical context?
- [ ] Are commitment, evidence, and guarantee distinguished?
- [ ] Are declared and inferred requirements distinguished?

## E. Evidence discipline

- [ ] Is this an observation, derivation, proof, hypothesis, or design choice?
- [ ] Have we overstated a conceptual probe as a formal result?
- [ ] Is the evidence sufficient for the guarantee we export?
- [ ] Are failed attempts preserved?

## F. Architectural discipline

- [ ] Is BOMA serving the mathematics rather than replacing it?
- [ ] Are graph structure and mathematical content kept distinct?
- [ ] Have we introduced a new ontology term only because construction requires it?
- [ ] Could this decision be reversed later?

## G. Anti-hallucination check

Before accepting the next step, answer explicitly:

```text
What do we know?
What do we infer?
What are we assuming?
What remains unknown?
What evidence would change our mind?
```

## Calibration outcome

```text
ON TRACK
MINOR CORRECTION
MAJOR CORRECTION
STOP AND RECONSIDER
```

## Rule

Calibration is not a ceremonial approval. If a checklist item fails, the construction may need to stop before another Brick is added.
