# REBUILD-EXP-002 — Referability Without Primitive Identity

**Cycle:** `REBUILD-001`  
**Context:** Rebuilt `B-001`  
**Status:** Provisional result

## 1. Intention / Goal

Determine the minimal additional structure required to refer again to a constructional trace `r` without importing a ready-made identity or equality relation.

## 2. Experiment

Start with the constructional trace produced by `δ`:

```text
registerable difference → δ → r
```

Test three candidate mechanisms for subsequent reference:

### A — Re-identification by equality

Require a pre-existing relation of the form `r = x`.

**Result:** rejected for the repaired path. This would import a formal identity/equality mechanism before it has been constructed.

### B — Reproduction without identity

Apply the same construction again and try to treat its output as a new occurrence of the earlier trace merely because the producing operation is the same.

**Result:** insufficient. Repetition of an operation does not by itself justify identifying the two outcomes.

### C — Retained constructional address / provenance

Allow the construction protocol to retain a reference to the trace produced at the earlier event, so that a later instruction can point back to that recorded trace without asserting a general identity relation.

This is operationally different from proving `r = r`. It is a rule of access to the construction history.

## 3. Result

Mechanism C provides the weakest workable route found in this experiment.

The project can distinguish:

> **reaching an already recorded trace**

from

> **proving an abstract identity relation between two objects**.

A retained constructional address acts as a pointer into the history. It allows subsequent construction to target the earlier trace without introducing equality as an independent primitive.

This does not solve general identity. It only establishes a narrower capability:

```text
construction trace r
       ↓
retained address α(r)
       ↓
later construction can target r
```

## 4. Decision

Accept retained constructional address/provenance as the provisional mechanism for referability.

Do not create a general equality relation yet.

The resulting referability mechanism is therefore **history-relative**, not an unrestricted mathematical identity theory.

## 5. Epistemic Status

`Provisional structural result`

## 6. Next Cycle

Test whether two retained addresses can themselves be compared, copied, or used to preserve a constructional target under extension, without introducing equality or numerical multiplicity.
