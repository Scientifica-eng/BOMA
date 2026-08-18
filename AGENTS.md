# AGENTS.md — BOMA continuation rules

This file is a mandatory handoff entry point for AI agents working in this repository.

Before modifying canonical construction content, read:

1. `README.md`
2. `LAB/00_ARCHITECTURE/ARCHITECTURE.md`
3. `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`
4. `LAB/PDSA/STATUS.md`
5. the latest checkpoint under `LAB/PDSA/`
6. `LAB/00_ARCHITECTURE/REGISTRY.md`
7. `LAB/00_ARCHITECTURE/GRAPH.md`

## Governing method

Use **PDSA — Plan, Do, Study, Act**.

Historical `PDCA` names are legacy provenance only.

Do not silently rewrite historical records to replace those identifiers.

## Critical topology rule

Do **not** assume BOMA is a linear chain.

The canonical construction is a DAG and may contain:

```text
vertical dependencies
horizontal independent Bricks/Blocks
parallel contributors converging into a Block/Junction
Decision Point branches
exploratory PDSA branches
branching followed by verified reconvergence
```

The current Stage-One research emphasis includes **split → independent routes → reconvergence test → shared downstream path if verified**.

Read `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md` before proposing a new graph structure.

## Fork discipline

A fork is not automatically a Decision Point.

Classify it as one of:

```text
parallel dependency fork
Decision Point branch
exploratory PDSA branch
```

Do not use a Junction merely as a label for a meeting point. A Junction requires an explicit compatibility/convergence question and evidence.

## Reconvergence discipline

If two or more paths reconverge:

- preserve each path's provenance;
- preserve branch-specific assumptions;
- state what outputs are compared/translated;
- state the equivalence/isomorphism/interface criterion;
- state what common certified contribution is exported;
- state what would reopen the Junction.

Never infer:

```text
same downstream contribution ⇒ same construction history
```

## Brick / Block discipline

A Brick may be dependency-free, vertically dependent, horizontally independent, or branch-specific.

Graph orientation does not determine Brick status.

A Block is an intentional architectural composition and must preserve member Brick identities and dependencies.

Do not identify a Brick with one Lean declaration or other backend artifact merely for convenience.

## Mathematical / backend separation

Backend representations are verification infrastructure unless explicitly promoted through a declared formalization boundary.

Do not use a proof assistant's built-in natural numbers, lists, sets, types, or other host structures as hidden definitions of earlier BOMA constructional content.

## Epistemic discipline

Keep distinct:

```text
Operational Status
Epistemic Status
Verification Status / Evidence
```

A selected methodological branch is not a theorem.

A property built into a definition is not a derived result.

A formal checker PASS verifies the encoded statement under its declared backend; it does not automatically prove architectural fidelity.

## Research-memory discipline

BOMA has two linked outputs:

```text
Construction Graph
Learning Graph
```

Record failures, rejected routes, hidden assumptions, corrections, and human–AI learning when scientifically relevant.

A failed mathematical route may still be a successful PDSA Study result.

Do not erase negative results merely because a later route succeeds.

## Current natural-number work

Do not assume `N ACCEPTED` merely because a formal candidate or Lean payload exists.

The natural-number construction must emerge from small auditable units/Bricks/Blocks, explicit formalization choices, TCT-realization bridges, Junctions, acceptance obligations, and verification evidence.

The current architecture should be allowed to reveal serial, parallel, and reconvergent dependencies instead of being forced into one long vertical sequence.

## Change rule

If your work materially changes any rule in this file or `CONSTRUCTION_TOPOLOGY.md`, do not silently overwrite it. Open a traceable PDSA architectural revision, record the reason/evidence, update the versioned canonical architecture, and preserve relevant prior history.
