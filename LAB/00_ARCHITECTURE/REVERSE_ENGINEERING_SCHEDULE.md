# Reverse Engineering Schedule — Stage One

**Status:** ACTIVE GOVERNANCE SCHEDULE  
**Scope:** Stage-One chain and transition into Stage Two  
**Governing method:** PDSA

## Purpose

Reverse engineering is not an archival afterthought. It is a planned audit mode used after a construction has enough stable structure to make backward dependency analysis meaningful, but before the relevant architectural choices are frozen beyond useful revision.

The reverse path asks, for an accepted mathematical interface:

```text
What had to be present?
What was only one route among alternatives?
Which commitments were logical rather than mathematical?
Which proof artifacts were verification scaffolding rather than object-level structure?
Which intermediate units can be removed, weakened, replaced, or shared across branches?
```

The output belongs to both BOMA products:

```text
Construction Graph effects
Learning Graph effects
```

## Gate RE-R-001 — local reverse engineering of the real-number stage

**Trigger:** immediately after `RA-22 ACCEPT` for the Stage-One real interface and **before construction of the canonical complex-number stage begins**.

Backward traversal:

```text
accepted R export
    ↓
ordered-field interface
    ↓
real algebra operations
    ↓
Dedekind quotient identity
    ↓
completion theorem / order interface
    ↓
Q embedding and Q-density gateway
    ↓
accepted Q export
```

Required classifications for each dependency:

```text
STRUCTURALLY NECESSARY
ROUTE-SPECIFIC — DEDEKIND
LOGICAL COMMITMENT
FORMALIZATION / PROOF-ENGINEERING ONLY
REUSABLE CERTIFIED CONTRIBUTION
ALTERNATIVE / BRANCH CANDIDATE
```

Mandatory Study questions:

1. Which accepted R claims remain if `R-LOGIC-BR-001` is removed and totality is weakened?
2. Which claims depend specifically on Dedekind representation rather than on a completion interface?
3. Which verified contributions could be consumed unchanged by the retained Cauchy branch?
4. Is quotient identity necessary for the exported interface, or merely the selected Stage-One realization?
5. Can any R-stage unit be weakened or eliminated without changing `RA-22`?
6. Which Decision Points should become explicit Stage-Two branch experiments?

`RE-R-001` must not silently revise accepted R. Any discovered alternative or weakening becomes a new Brick/Block/Decision Point/PDSA cycle with provenance preserved.

## Gate RE-STAGE1-001 — global reverse engineering of the completed number-system chain

**Trigger:** immediately after the Stage-One complex-number interface is accepted and **before broad Stage-Two branching experiments begin**.

Backward traversal:

```text
accepted C
  ↓
accepted R
  ↓
accepted Q
  ↓
accepted Z
  ↓
accepted N
  ↓
pre-numerical constructional layer
  ↓
explicit metatheory contract
```

The global audit must produce at least:

```text
1. Minimal dependency spine
2. Route-specific commitments
3. Logical-regime boundaries
4. Representation choices
5. Completion choices
6. Quotient / identity choices
7. Reusable certified contributions
8. Historical dead ends that produced reusable learning
9. Candidate branching points for Stage Two
10. Cross-domain invariants preserved through N → Z → Q → R → C
```

## Stage-Two handoff criterion

Stage Two must not be treated as unconstrained experimentation. Its initial branch set should be selected from the reverse-engineering evidence.

A branch experiment should name:

```text
Target Brick / Block / Junction / Decision Point
Baseline route
Alternative route
Inherited learning
Expected invariant(s)
Expected divergence(s)
Convergence criterion, if any
Verification plan
```

## Timing rule

Do **not** execute `RE-R-001` before `RA-22 ACCEPT`: an unstable forward construction does not yet provide a reliable reverse target.

Do **not** postpone `RE-R-001` until after canonical C is deeply developed: that would reduce its ability to expose R-stage assumptions before they propagate downstream.

Do **not** execute `RE-STAGE1-001` before C acceptance: its purpose is to reverse-engineer the complete Stage-One number-system architecture as a finished chain.

## Current status

```text
RE-R-001        SCHEDULED — waiting for RA-22 ACCEPT
RE-STAGE1-001   SCHEDULED — waiting for Stage-One C acceptance
```

This schedule is part of the canonical architecture and is intended to prevent reverse engineering from being forgotten or applied at a scientifically unhelpful time.
