# PDSA-TCT-005 — Canonical Decomposition Block

**CycleID:** `PDSA-TCT-005`  
**Track:** TCT  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — PLAN / DO**  
**Cycle type:** Construction + verification + contribution-interface cycle

## ParentCycles / LearningInputs

```text
PDSA-TCT-002  metatheory firewall
PDSA-TCT-003  structural equivalence BR-010
PDSA-TCT-004  terminal recovery theorem / J-001 PASS
```

Primary canonical inputs:

```text
TCT-BLOCK-002
TCT-BR-010
TCT-BR-009
TCT-J-001
```

---

# PLAN

## ResearchQuestion

What exactly can `TCT-BLOCK-003 — Canonical Decomposition` construct/export now that terminal recovery has been proved invariant under the selected structural equivalence?

The Block must provide a reusable downstream guarantee without silently introducing:

```text
a global predecessor function
a quotient set/type of ≈-classes
ordered-pair objects
numerical depth
successor
natural numbers
```

## Intended output

A schematic **canonical decomposition guarantee** for any explicitly supplied non-empty selected normal-form presentation.

Required components:

1. terminal decomposition exists at the selected presentation level;
2. terminal role is the distinguished `U` role;
3. predecessor presentation is deterministic inside selected normal form;
4. predecessor result is invariant modulo `≈` across equivalent presentations;
5. the guarantee is exportable without constructing equivalence classes.

## Proposed decomposition judgment

Use a meta-structural judgment, not an object-level ordered pair:

```text
P ◁U A
```

read:

> `P` is the recovered predecessor presentation of the non-empty selected normal-form presentation `A` relative to terminal role `U`.

Formation of the judgment:

```text
ε ◁U U

P ◁U (P ⊙ U)     for P ∈ NF+
```

The notation is proof/document infrastructure for the certified guarantee; it is not a new object-level relation unless a later unit explicitly promotes it.

## Acceptance criteria

The Block may become ACTIVE only if a verification record establishes:

```text
EXISTENCE
DETERMINISM ON SELECTED NF
INVARIANCE MODULO ≈
NO HIDDEN QUOTIENT
NO HIDDEN ORDERED PAIR
NO NUMERICAL DEPENDENCE
EXPLICIT SENSITIVITY
```

---

# DO — initial architecture

## D1 — Canonicality meaning

In this Block:

> **canonical** means that the recovered predecessor contribution is independent, up to the declared structural equivalence, of the equivalent presentation used.

It does not mean that a quotient object has already been constructed.

## D2 — Separate procedure from guarantee

```text
recover
```

remains a meta-level syntax inspection procedure supplied by TCT-BLOCK-002.

The new mathematical/architectural output is the **verified invariance guarantee**, not the procedure itself.

This applies the earlier project learning:

```text
Construction Unit ≠ Reusable Certified Contribution
```

The Block is the construction unit; its downstream export is the certified decomposition guarantee.

## D3 — Verification dependency

The key theorem is already available from `PDSA-TCT-004` / `TCT-J-001`.

The present cycle must package it without strengthening its scope.

---

# STUDY

OPEN — dedicated Block verification follows.

# ACT

PENDING — `TCT-BLOCK-003` remains RESERVED until verification completes.
