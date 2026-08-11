# Conflict / Compatibility Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test the proposed non-conflict condition without prematurely defining a full consistency theory.

## 1. Question

If a Brick need not depend on a previous Brick, what does it mean for it to be admissible alongside previously established commitments?

The current hypothesis is:

> A candidate Brick must not introduce a commitment that conflicts with commitments already in scope.

The purpose here is only to find a minimal operational distinction between compatibility and conflict.

## 2. Minimal commitment model

For the probe, represent a Brick by a small set of explicit commitments over named propositions.

Example:

```text
A commits: P
B commits: Q
C commits: ¬P
```

The probe does not claim that all BOMA commitments are reducible to propositions. This is a deliberately small test language.

## 3. Cases

### Case 1 — Independent and compatible

```text
A: P
B: Q
```

No shared proposition receives incompatible commitments.

**Result:** compatible.

### Case 2 — Independent but conflicting

```text
A: P
B: ¬P
```

Neither Brick depends on the other, but their commitments cannot be jointly adopted under the probe's semantics.

**Result:** conflict.

This is the key case: independence does not imply compatibility.

### Case 3 — Dependent and compatible

```text
A: P
C: P → Q
```

C depends on A for the intended construction context and adds a compatible commitment.

**Result:** compatible.

### Case 4 — Dependent and conflicting

```text
A: P
D: ¬P
```

Even if D is declared as depending on A, the dependency relation does not neutralize the contradiction.

**Result:** conflict.

This demonstrates that dependency and compatibility are orthogonal relations.

## 4. Important limitation

The probe uses explicit contradictory commitments as a toy model. It does **not** define BOMA conflict as syntactic negation, nor does it establish a complete consistency calculus.

A mature definition may need to operate at the level of:

```text
axioms
definitions
typing constraints
logical commitments
architectural commitments
```

and may require the selected object logic or meta-logic.

## 5. Consequences for Brickhood

The experiment supports the following provisional structure:

```text
Brick
├── Identity
├── Commitment
├── Depends_on: 0..n
└── Admissibility condition:
       compatible with commitments in scope
```

A dependency-free Brick can therefore be valid if its commitment is compatible with the existing context.

A dependent Brick can be invalid if its new commitment conflicts with the context.

## 6. Consequences for the DAG model

Return to:

```text
A ─────┐
       ├──→ C
B ─────┘
```

If:

```text
A: P
B: Q
```

then A and B can be independent and jointly admissible.

If instead:

```text
A: P
B: ¬P
```

then the DAG is structurally representable but the construction is not jointly admissible under the probe.

This gives us a useful separation:

```text
Graph validity
      ≠
Construction admissibility
```

## 7. New distinction

We should distinguish at least:

```text
Dependency validity
    Is the declared dependency relation sufficient for the intended meaning?

Compatibility
    Can the commitments coexist in the current context?

Construction admissibility
    May the candidate be introduced at this point without violating the relevant rules?
```

These may eventually depend on different mechanisms.

## 8. Findings

```text
Independence implies compatibility       NO
Independence permits compatibility       YES
Dependency implies compatibility        NO
Dependency and compatibility independent YES
Minimal non-conflict test                PASS
Full conflict calculus                   OPEN
```

## 9. Next question

The next useful experiment is no longer to ask whether conflict exists in principle. It is to test whether a Brick can be **locally checked for compatibility using only its declared context**, without requiring global recomputation of the entire construction.

That question matters for incremental construction and for later machine verification.

## 10. Epistemic status

```text
Observed:       independence and compatibility are distinct
Supported:      non-conflict can be treated as an admissibility condition
Hypothesis:     compatibility should be locally checkable where possible
Open:           formal conflict relation
Open:           scope/context definition
Open:           local-vs-global consistency requirements
```

No normative BOMA rule is established by this probe.
