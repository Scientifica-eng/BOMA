# PDSA-Z-RE-001 — Reverse Engineer N from Accepted Z

**CycleID:** `PDSA-Z-RE-001`  
**Status:** **ACTIVE — POST-Z REVERSE EXPERIMENT**  
**Opened after:** `ZA-21 ACCEPT`  
**Source:** `Z-BLOCK-002`  
**Reference target for later comparison:** `N-BLOCK-007`, `N-ARITH-BLOCK-001`

## Governing constraint

The reverse construction phase must **not** define its carrier as `N_BOMA` and must not use `embedN` as the definition of the candidate.

`N_BOMA` is frozen as a comparison reference until the reverse candidate has been independently specified from accepted Z structure.

---

# PLAN

## Research question

What natural-number structure can be reconstructed from the accepted integer domain itself, and what information from the original bottom-up path is no longer recoverable without inspecting representation/provenance?

## Route C — nonnegative cone

Construct from accepted Z only:

```text
N_Cone(Z) := { z : Z_BOMA | 0 ≤ z }
```

with inherited/restricted:

```text
zero
one
successor x ↦ x+1
addition
multiplication
order
```

The construction must first prove closure using the accepted ordered-ring interface.

## Route G — generated reachability

Independently define the proposition:

```text
Reach_Z(0)
Reach_Z(x) → Reach_Z(x+1)
```

This tests whether “generated from zero by successor” is recoverable as a Z-internal notion independently of the nonnegative-cone definition.

## First Junction question

Does Z alone prove:

```text
Reach_Z(x) ↔ 0 ≤ x ?
```

without importing the already accepted N carrier or using the signed payload as the proof of completeness?

A failure to prove the converse is a legitimate reverse-engineering result.

---

# Comparison phase — only after reverse candidates exist

Then permit the known embedding only as **comparison evidence**:

```text
encode : N_BOMA → N_Cone(Z)
```

and, because the selected Stage-One Z representation is signed, test a representation-aware decoder:

```text
decode : N_Cone(Z) → N_BOMA.
```

The experiment must record whether decoding is:

```text
recoverable from abstract ordered-ring interface
or
possible only because ZSigned literally retains a BOMANat magnitude payload.
```

---

# Required bottom-up versus reverse comparison

Compare:

```text
BOTTOM-UP
pre-numerical TCT
  → N-Core
  → N-Arithmetic
  → Z
```

against:

```text
REVERSE
accepted Z
  → nonnegative cone / reachability
  → N_from_Z candidate
```

Dimensions:

```text
carrier / identity
zero / successor
successor no-confusion
successor injectivity
generatedness
induction
recursion / initiality
addition / multiplication / order
formal commitments
logical strength consumed
dependency topology
construction provenance
information lost/compressed through Z
information retained accidentally/by representation choice
```

---

# Hypotheses to test, not assume

### H1
The nonnegative cone reconstructs the natural semiring/order interface.

### H2
The abstract accepted ordered-ring interface alone does **not** automatically recover the original induction/recursion provenance.

### H3
The selected signed representation permits exact decoding because its positive/negative constructors retain `BOMANat` magnitudes; such decoding may therefore be representation-sensitive rather than an abstract theorem about every integer realization.

### H4
Bottom-up and reverse routes can reconverge extensionally while remaining irreducibly different in construction history and epistemic content.

---

# Acceptance discipline

No outcome is forced.

Possible ACT results include:

```text
FULL RECONVERGENCE
INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE
CONDITIONAL RECONVERGENCE REQUIRING REPRESENTATION ACCESS
PARTIAL RECOVERY
NEGATIVE RESULT
BRANCH REQUIRED
```

The rational stage is paused until this experiment records its Study result and comparison Junction classification.
