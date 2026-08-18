# AGENTS.md — BOMA continuation rules

Mandatory for AI agents.

Before canonical work read, in order:

```text
README.md
LAB/00_ARCHITECTURE/ARCHITECTURE.md
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
LAB/PDSA/STATUS.md
latest checkpoint
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
```

For N-Core work additionally read:

`LAB/00_ARCHITECTURE/N_CORE_DAG.md`

## Method

Use **PDSA — Plan, Do, Study, Act**. `PDCA` names are legacy provenance only.

## Topology rules

Do not assume a linear chain. Classify forks as parallel dependency, Decision Point branch, or exploratory PDSA branch. A Junction requires an explicit compatibility/convergence question and evidence.

Reconvergence must preserve route-specific assumptions and provenance. Never infer `same contribution ⇒ same history`.

## N-Core rule

Do not treat `TCT-BLOCK-006`, `N-RB-CAND-001`, or `NCoreRB001.lean` as the canonical N architecture. They are aggregate/producer/evidence records.

Canonical N units are `N-BR-*`, `N-BLOCK-*`, `N-J-*`, and `N-DP-001` as mapped by `N_CORE_DAG.md`.

V5 results must be mapped theorem-by-theorem/unit-by-unit. A type-checking monolithic payload does not automatically PASS `N-J-002` or NAC-15.

Current state: `N-J-001` has written V4 conditional PASS; V5, `N-J-002`, and N-Core acceptance remain pending.
