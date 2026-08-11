# Dependency Independence Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** record and test a correction to the emerging Brick criterion.

## 1. Trigger

The previous working formulation suggested that a Brick could be characterized by an independent commitment relative to a prior Brick. During discussion, this exposed a possible architectural overconstraint: requiring a new Brick to depend on an earlier Brick may force an artificial linearization of a naturally branching construction.

This document records the correction as a hypothesis under test, not as a final BOMA rule.

## 2. New hypothesis

A Brick does **not** need to depend on a previous Brick in order to be a Brick.

Instead:

> A Brick is a constructionally intentional semantic unit with its own identity and commitment, whether its dependency set is empty or non-empty.

Thus all of the following remain possible:

```text
depends on {}
depends on {A}
depends on {A, B}
```

Dependency is a relation of a Brick, not a necessary condition for Brickhood.

## 3. Additional condition — non-conflict

The user-proposed correction is recorded as an important candidate requirement:

> A candidate Brick must not conflict with the commitments already established in the structure on which it is being introduced.

For the current experiment, `non-conflict` is treated as a **candidate validity condition**, not yet as a formally defined theorem or universal criterion.

We must distinguish:

```text
no dependency
      ≠
conflict
```

A Brick may be independent of earlier Bricks while remaining compatible with them.

## 4. Why this matters

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

or may contain independent necessary units that only become jointly relevant at a later construction point.

If Brickhood required dependency on the immediately preceding Brick, the architecture would be forced into a sequence such as:

```text
A → B → C → D → E → F
```

which may falsely encode construction order as semantic dependency.

## 5. Distinctions to preserve

### Construction order

When a Brick is introduced or verified.

### Dependency

What prior commitments are required for its intended meaning or verification.

### Compatibility / non-conflict

Whether its commitments are jointly admissible with the commitments already in scope.

### Necessity

Whether the Brick is required for a particular target construction, branch, or later convergence.

These four relations must not be collapsed.

## 6. Candidate relation model

The current experiment therefore considers at least these independent relations:

```text
Brick A
  ├── Depends_on → {…}
  ├── Compatible_with → {…}
  ├── Necessary_for → {…}
  └── Introduced_at → construction point
```

The exact representation is intentionally open.

## 7. Open issue: trunk and branches

The hypothesis raises a deeper question:

> If independent Bricks are necessary for a later convergence, must they belong to the trunk, or may they remain in separate branches with a later shared/convergence structure?

No answer is adopted here.

A useful test case is:

```text
Trunk
 ├── A ───┐
 └── B ───┼──→ C
          │
          └── convergence
```

where `A` and `B` are mutually independent but both become prerequisites for `C`.

The next experiment should determine whether this can be represented without artificial linearization.

## 8. Relation to BOMA source

BOMA I's formal architecture distinguishes dependency from other architectural notions and defines Atomic Block in terms of dependency. This project probe does not overwrite that source definition. It explores whether the project's finer-grained `Brick` vocabulary should treat dependency as a relation rather than a Brickhood requirement.

The distinction between source terminology and project terminology remains mandatory.

## 9. Epistemic status

```text
Observation:        dependency-as-requirement may overconstrain branching
Hypothesis:         Brickhood does not require dependency
Hypothesis:         non-conflict is a necessary validity condition
Open:               formal definition of conflict
Open:               trunk/branch/convergence semantics
Open:               DAG representation
```

Nothing in this document is normative BOMA specification.
