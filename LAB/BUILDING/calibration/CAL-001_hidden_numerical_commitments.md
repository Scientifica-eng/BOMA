# CAL-001 — Hidden Numerical Commitments Audit

**Cycle:** Calibration 001  
**Scope:** `B-001` through `B-014`  
**Status:** Open
**Purpose:** Audit the construction for concepts that may presuppose numerical structure before that structure has been constructed.

## 1. Intention / Goal

Determine whether the current construction genuinely postpones numerical concepts, or whether numerical commitments have entered implicitly through terminology, definitions, experiments, or comparisons.

The calibration is not intended to prove that the existing path is correct. It is intended to expose hidden commitments, distinguish harmless descriptive shorthand from structural commitments, and identify the last defensible Brick from which construction should continue.

## 2. Audit Rules

For every Brick and experiment, classify each relevant concept as one of:

- `P` — Primitive/chosen commitment: explicitly stipulated at the start or introduced as a declared constructional choice.
- `D` — Derived: obtained from earlier commitments without adding a new primitive.
- `L` — Linguistic shorthand: external descriptive language used to discuss the construction, with no claim that the concept belongs to the constructed domain.
- `N` — Hidden numerical commitment: a concept whose use requires, or effectively presupposes, numerical structure not yet constructed.
- `U` — Unresolved: status cannot yet be determined and requires a dedicated experiment or reformulation.

A finding of `N` does not automatically invalidate the Brick. It requires us to decide whether the concept was an explicit primitive choice, an illicit import, or merely linguistic shorthand.

## 3. Primary Audit Questions

### A. Initial distinction

Does the initial distinction operation require an already numerical or logical structure, or can it be treated as a primitive experiential/constructive act?

**Preliminary status:** `P/U`.

The project does not claim to start from absolute nothingness. The initial act is a declared choice. The precise minimum content of that choice remains open.

### B. "One new token" in `B-007`

The phrase "exactly one" is potentially numerical.

**Preliminary finding:** `U`, with a strong risk of `N` if interpreted as an arithmetic cardinality statement.

Possible repair: reformulate the rule as a chosen extension event with one designated new output, and treat the uniqueness of that output as part of the primitive specification rather than as a numerical theorem.

This distinction must be made explicit in the Brick record.

### C. Finite reachability in `B-012`

The phrase "finite number of extension occurrences" may be descriptive rather than numerical, but its formal interpretation is not yet fixed.

**Preliminary status:** `U`.

We must avoid silently treating the extension count as an element of `N`.

### D. Depth in `B-013`

The concept of depth can be introduced structurally as a feature of a finite construction history, but comparing depths by saying they are equal may presuppose a numerical comparison.

**Preliminary finding:** `U/N risk`.

Potential repair: replace numerical depth comparison with structural isomorphism/equivalence of finite construction histories, preserving initiality and extension relation.

### E. Compatibility in `B-014`

The claim that equal depths remain equal under extension is only non-circular if "equal depth" has been independently defined without numerical counting.

**Preliminary finding:** `U`.

This Brick should therefore not yet be treated as a secure foundation for a pre-numerical domain.

### F. `G` in `B-005`

The aggregation operation is not currently used in the main path from `B-006` through `B-014`.

**Preliminary finding:** `P/branch`.

It should be marked as an exploratory branch rather than silently treated as a necessary Brick in the natural-number path.

## 4. Current Calibration Hypothesis

The most promising repair is to distinguish:

```text
concrete construction history
        ↓
structural form of the history
        ↓
abstraction by constructional equivalence
```

rather than:

```text
concrete history
        ↓
count its steps using an already available notion of number
        ↓
call the result depth
```

If the first route succeeds, a pre-numerical structure may emerge without importing `N`.

## 5. Decision at Opening

Do not create `B-015` yet.

Suspend the claim that `B-014` has established a secure pre-numerical domain.

Treat `B-013` and `B-014` as provisional candidates requiring recalibration.

Do not delete them: they are experimental evidence and may be repaired rather than discarded.

## 6. Calibration Experiments to Run

1. **CAL-EXP-001:** audit `B-001`–`B-004` for primitive distinction, referability, reuse, and provenance.
2. **CAL-EXP-002:** audit `B-005`–`B-008`, with special attention to "one", uniqueness, and aggregation.
3. **CAL-EXP-003:** replace numerical depth comparison with structural equivalence of finite construction histories.
4. **CAL-EXP-004:** reassess `B-013` and `B-014` after the structural reformulation.
5. **CAL-EXP-005:** determine the criterion by which a successfully constructed pre-numerical structure may legitimately be identified with, or shown equivalent to, the natural numbers.

## 7. Success Criterion for the Calibration Cycle

The cycle succeeds if, after auditing, we can state explicitly:

- which commitments are chosen;
- which structures are genuinely derived;
- which terms are merely descriptive;
- which hidden numerical assumptions must be removed or promoted to explicit primitives;
- and the last Brick that remains methodologically sound.

A failed construction path is an acceptable result. The calibration is part of the construction experiment itself.
