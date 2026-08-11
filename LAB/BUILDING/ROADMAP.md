# Construction Roadmap

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional

## Mission

Build the known number systems from the simplest viable pre-numerical foundation, using the construction itself as the primary experiment.

## Stage 0 — Orientation and tools

**Purpose:** prevent loss of state, hidden assumptions, and untraceable decisions.

Exit gate:

- building kit exists;
- current objective is explicit;
- calibration procedure exists;
- every foundational choice can be recorded independently.

## Stage 1 — Pre-numerical foundation

**Goal:** construct the minimum structure needed before numbers can legitimately be introduced.

Questions:

- What is the chosen starting point?
- What is primitive and what is constructed?
- What notion of identity/equality is needed?
- What structure is required to support a successor-like operation?
- Which assumptions are unavoidable, and which are merely convenient?

Exit gate:

> A precise candidate foundation exists from which the natural-number construction can be stated without importing the natural numbers under another name.

The exit gate is a research judgment, not a theorem schema.

## Stage 2 — Natural numbers

**Goal:** construct the natural numbers from Stage 1.

Minimum targets:

- zero or its chosen foundational analogue;
- successor;
- natural-number universe/type;
- induction principle or an equivalent constructive principle;
- basic equality properties;
- addition;
- multiplication;
- order, only after the preceding structure supports it.

Exit gate:

> A coherent natural-number structure has been constructed and its core properties have been verified under the active logical regime.

## Stage 3 — Later number systems

Deferred. Do not design the later construction in detail before Stage 2 exposes its actual interfaces and limitations.

Possible future sequence:

```text
Natural numbers
→ Integers
→ Rationals
→ Reals
→ Complex numbers
```

This sequence is provisional and may change.

## Construction loop

For each candidate Brick:

```text
Plan
→ Construct
→ Verify
→ Record observation
→ Diagnose failure if any
→ Correct
→ Calibrate when needed
→ Continue
```

## Gate discipline

Do not advance a stage merely because a document exists. Advance only when the exit condition has been tested against the actual mathematical construction.

## Logical policy

The trunk is intuitionistic by default. If construction becomes genuinely impossible or insufficient under that regime:

```text
obstacle
→ investigate alternatives
→ identify exact logical strengthening
→ establish minimality
→ record necessity
→ decide explicitly
```

A backend limitation or convenience is not, by itself, a logical necessity.

## Choice discipline

At the beginning of a stage, distinguish:

```text
Chosen starting point
from
Mathematically forced starting point
```

The first is a project choice unless the construction later demonstrates otherwise.

## Anti-drift rule

If a proposed next step is motivated only by the fact that it is theoretically interesting, but is not required by the current construction goal, defer it.

The active target remains:

```text
pre-numerical foundation → natural numbers
```
