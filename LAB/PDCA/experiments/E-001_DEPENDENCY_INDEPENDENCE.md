# E-001 — Dependency Independence

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Source record:** `LAB/DEPENDENCY_INDEPENDENCE_PROBE_001.md`  
**Epistemic status:** `HYPOTHESIS`

## Question

Does a Brick need to depend on a previous Brick in order to qualify as a Brick?

## Trigger

The previous working formulation suggested that a Brick could be characterized by an independent commitment relative to a prior Brick. Discussion exposed a possible architectural overconstraint: requiring a new Brick to depend on an earlier Brick may force an artificial linearization of a naturally branching construction.

## Initial hypothesis

A Brick does **not** need to depend on a previous Brick in order to be a Brick.

A candidate Brick may have:

```text
depends on {}
depends on {A}
depends on {A, B}
```

Dependency is therefore treated as a relation of a Brick, not a necessary condition for Brickhood.

## Candidate non-conflict condition

A second hypothesis was introduced:

> A candidate Brick must not conflict with commitments already established in the structure on which it is being introduced.

This is a candidate validity condition, not a formally defined BOMA criterion.

The experiment distinguishes:

```text
no dependency
      ≠
conflict
```

An independent Brick may remain compatible with earlier commitments.

## Why the question matters

A construction may have a non-linear dependency structure:

```text
       A       B
        \     /
          C
         / \
        D   E
         \ /
          F
```

If Brickhood required dependency on the immediately preceding Brick, the same construction might be artificially represented as:

```text
A → B → C → D → E → F
```

which can falsely encode construction order as semantic dependency.

## Relations that must remain distinct

### Construction order

When a Brick is introduced or verified.

### Dependency

Which prior commitments are required for its intended meaning or verification.

### Compatibility / non-conflict

Whether its commitments are jointly admissible with the commitments already in scope.

### Necessity

Whether the Brick is required for a particular target construction, branch, or later convergence.

These relations should not be collapsed.

## Candidate relation model

```text
Brick A
  ├── Depends_on → {…}
  ├── Compatible_with → {…}
  ├── Necessary_for → {…}
  └── Introduced_at → construction point
```

The exact representation remains open.

## Open issue: trunk and branches

If independent Bricks are necessary for a later convergence, must they belong to the trunk, or may they remain in separate branches with a later shared/convergence structure?

Candidate test case:

```text
Trunk
 ├── A ───┐
 └── B ───┼──→ C
          │
          └── convergence
```

No answer is adopted here.

## Relation to BOMA source

The original probe notes that BOMA I's formal architecture distinguishes dependency from other architectural notions and defines Atomic Block in terms of dependency. This project experiment does not overwrite that source definition. It explores whether the project's finer-grained `Brick` vocabulary should treat dependency as a relation rather than a Brickhood requirement.

Source terminology and project terminology must remain distinct.

## Observed / recorded result

The conceptual analysis supports rejecting **dependency on a previous Brick as a necessary condition** for Brickhood. It does not yet establish a formal Brick definition.

The analysis also supports preserving a separate non-conflict/compatibility question, while leaving its formal definition open.

## Learning

```text
dependency ≠ non-atomicity
dependency ≠ construction order
dependency ≠ compatibility
compatibility ≠ necessity
```

A dependency-free Brick remains a legitimate candidate if it has independent identity and commitment.

## Limitations

This record is a conceptual architectural probe. It is not a Lean/Coq/Agda/Isabelle backend experiment and provides no formal verification of the proposed criterion.

## Open questions

1. What is the minimal formal criterion for Brick identity?
2. How should conflict be defined relative to a logical regime?
3. How should branching and convergence be represented?
4. Can a Brick be necessary for a later construction without depending on the immediately preceding Brick?
5. How does this hypothesis relate exactly to the authoritative BOMA/BOMA II definitions?

## Migration note

This document is a standalone PDCA experiment record. The original source record is intentionally preserved during the migration and must not be silently deleted or rewritten.
