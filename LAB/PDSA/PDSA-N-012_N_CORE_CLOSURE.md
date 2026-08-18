# PDSA-N-012 — N-Core Closure / NAC-15 Decision

**CycleID:** `PDSA-N-012`  
**Track:** Natural Numbers / N-Core Closure  
**Date:** 2026-08-18  
**Status:** **CLOSED — NAC-15 ACCEPT**

## PLAN

Decide whether the integrated Stage-One R-B construction is now entitled to be classified as an **accepted BOMA natural-number core**.

Acceptance is allowed only if:

```text
NAC-01 through NAC-14 are PASS;
N-J-001 is PASS / RESOLVED;
N-J-002 is PASS / RESOLVED;
formalization scope is explicit;
TCT ancestry remains traceable;
no hidden logical/numerical/set-theoretic commitment remains material to the accepted path;
verification evidence is observed and mapped claim-by-claim.
```

This decision must not silently include arithmetic.

## DO — closure checklist

### NAC obligations

`PDSA-N-010` records:

```text
NAC-01 .. NAC-14 = PASS
```

### Cross-route convergence

`N-J-001`:

```text
PASS / RESOLVED
written V4 cross-path PASS
claim-level V5 PASS
```

### Whole-package integration

`N-J-002`:

```text
PASS / RESOLVED
```

### Formal verification

Observed evidence:

```text
workflow run:     32163771789
verified commit:  5fb03a48e243697f49f1cbde30be986d73f2ff68
Lean:             4.32.1
all mapped producer / Block / Route-B / Junction checks: success
```

### Formalization scope

Explicitly governed by:

```text
N-DP-001 — selects R-B
N-DP-002 — eliminator / universe scope
BOMA-RB-FORMAL-001
BOMA-RB-FORMAL-CORR-001
```

### Preservation and commitment audit

`PDSA-N-011`:

```text
NAC-13 PASS
NAC-14 PASS
```

No material commitment found to be silently imported as:

```text
classical excluded middle
choice
quotient construction
function extensionality
built-in Lean Nat as carrier
numeric depth/cardinality primitive
set-membership ontology
```

## STUDY

### What has actually been constructed

The accepted package contains:

```text
formal carrier N_BOMA
base z
unary successor s
formal identity interface
Sort-polymorphic dependent eliminator
proposition-valued induction adequacy
generatedness / no-junk
constructor no-confusion
universe-polymorphic recursion into Type u
recursor computation equations
pointwise recursion uniqueness
Stage-One Type-0 pointwise initiality
faithful selected-TCT realization bridge
structural-history / constructor-ancestry correspondence
same-universe pointwise standardness certificate
```

### Why this is now more than a candidate

Before closure, the pieces could individually be correct while failing to form one acceptable N-Core. That risk has now been addressed by:

```text
claim-level V5
cross-route reconvergence
post-V5 preservation audit
post-V5 commitment audit
whole-DAG integration at N-J-002
```

### Why this is not “derived from nothing”

The accepted core remains relative to:

```text
declared metatheory
selected R-B formalization regime
explicit global inductive formation commitment
explicit universe/sort policy
```

The pre-numerical TCT path supplies constructional ancestry and certified structural contributions; it does not itself force the global inductive carrier.

### Why arithmetic is excluded from this closure

The current acceptance target intentionally separates:

```text
N-Core
from
N-Arithmetic Package
```

No addition, multiplication, order, semiring laws, or arithmetic comparison theorem is included merely because the carrier has been accepted.

## ACT — NAC-15 decision

```text
NAC-15 = ACCEPT
```

The project may now classify the integrated structure as:

> **BOMA Stage-One R-B Natural-Number Core — ACCEPTED**

A canonical downstream export Block is authorized:

`N-BLOCK-007 — Accepted Natural-Number Core Interface`.

Within documents that declare or inherit this R-B Stage-One scope, the accepted carrier may be denoted `ℕ_BOMA` / the BOMA realization of the natural-number core. Plain `ℕ` should be used only where the scope is unambiguous and should not imply that arithmetic operations have already been constructed.

## Next permitted work

N-Arithmetic may now begin as a new PDSA family, with separate transparent DAG construction for at least:

```text
addition
multiplication
order
arithmetic laws / recursion-derived properties
```

Only after the intended Stage-One natural-number package is stabilized should the transition to integers be promoted.

## Learning

1. Acceptance was an end-stage architectural decision, not a label placed on a monolithic datatype at creation time.
2. The accepted core emerged from parallel Bricks/Blocks plus explicit reconvergence and integration gates.
3. Failed V5 runs improved the final formalization contract and are part of the evidence lineage.
4. A successful backend run was necessary but not sufficient; NAC-13/NAC-14 and N-J-002 remained independent acceptance gates.
