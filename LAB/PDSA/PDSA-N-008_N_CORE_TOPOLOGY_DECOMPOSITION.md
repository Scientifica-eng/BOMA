# PDSA-N-008 — Topology-Aware N-Core Decomposition

**CycleID:** `PDSA-N-008`  
**Status:** **CLOSED — DAG EXTRACTED / VERIFICATION NOT PROMOTED**  
**Date:** 2026-08-18

## PLAN

Question: can the monolithic R-B candidate be decomposed into the natural BOMA DAG without inventing artificial Bricks or losing proof provenance?

Acceptance criteria:

- distinguish declared formalization commitments from derived results;
- expose horizontal/parallel work where dependencies allow it;
- preserve TCT ancestry as an independent incoming path;
- identify at least one scientifically meaningful split/reconvergence test;
- keep the unified Lean payload as backend evidence, not canonical identity;
- do not promote V5 or N-Core acceptance.

## DO

The candidate was decomposed into:

```text
20 N-Bricks
6 N-Blocks
2 N-Junctions
```

with canonical topology in `LAB/00_ARCHITECTURE/N_CORE_DAG.md`.

The kernel is deliberately not split into one Brick per Lean constructor. `N-BR-001` records the fresh unary inductive declaration as one formalization commitment because the selected regime introduces the carrier and constructor signature as one inductive formation act.

Four parallel contribution tracks were extracted after the kernel:

```text
internal no-confusion
induction/generatedness
recursion/initiality
TCT realization bridge
```

A cross-path reconvergence target was created as `N-J-001`.

## STUDY

The earlier monolithic candidate was useful as a PDSA feasibility probe, but it hid the architecture in three ways:

1. independent obligations appeared sequential because they lived in one document/file;
2. TCT ancestry looked like a downstream appendix rather than an independent incoming path;
3. internal and ancestry-based proofs of the same contribution were not exposed as a convergence experiment.

The decomposition also showed that a Brick is not a source-code declaration. Some Lean declarations belong to one semantic commitment, while one semantic result may require several backend declarations.

## ACT

- adopt `BOMA-N-DAG-001` as canonical N-Core topology;
- retain `N-RB-CAND-001` and `NCoreRB001.lean` as producer/evidence artifacts;
- treat former `TCT-BLOCK-006` monolithic view as an aggregate historical/provisional view, not the canonical N architecture;
- open `PDSA-N-009` for the first deliberate branch-reconvergence test at `N-J-001`;
- keep PDSA-N-007 as a V5 verification subgate, now mapped to individual units rather than to monolithic acceptance.
