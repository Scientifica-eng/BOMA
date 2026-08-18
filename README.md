# BOMA — Project Handoff / START HERE

BOMA builds a transparent, traceable mathematical architecture from a declared pre-numerical constructional layer toward standard number systems.

Governing method: **PDSA — Plan → Do → Study → Act**. Historical `PDCA` identifiers are provenance only.

## Mandatory reading order

1. `LAB/00_ARCHITECTURE/ARCHITECTURE.md`
2. `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`
3. `LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`
4. `LAB/PDSA/STATUS.md`
5. `LAB/00_ARCHITECTURE/N_CORE_DAG.md`
6. `LAB/00_ARCHITECTURE/N_ARITHMETIC_DAG.md`
7. `LAB/00_ARCHITECTURE/REGISTRY.md`
8. `LAB/00_ARCHITECTURE/GRAPH.md`

## Do not linearize BOMA

The canonical construction is a DAG. Valid topology includes vertical dependency, horizontal independence, parallel contributors, Decision Point branches, and split → independent development → verified reconvergence.

Reconvergence never erases branch provenance.

## Current accepted natural-number stage

### N-Core

```text
NAC-15 = ACCEPT
N-BLOCK-007 = Accepted Natural-Number Core Interface
V5 run 32163771789 / Lean 4.32.1
```

### N-Arithmetic

```text
addition       dual routes reconverged / PASS
multiplication dual routes reconverged / PASS
order          additive vs structural routes reconverged / PASS
N-ARITH-J-001  PASS
NAA-18         ACCEPT
```

Canonical accepted arithmetic export:

`LAB/10_CONSTRUCTION/blocks/N-ARITH-BLOCK-001/UNIT.md`

Verification lineage:

```text
addition       run 32164861155
multiplication run 32165318266
order/full stack run 32165691581
Lean 4.32.1
```

The order experiment verifies a genuinely different-dependency reconvergence: the inductive order branch compiles from N-Core alone, while the additive-witness branch depends on accepted addition.

## Current frontier

> **Integer stage — specification/architecture next.**

Integers are **not yet constructed or accepted**.

Before creating an integer carrier, define the acceptance target and make explicit the representation/formalization choice: pair differences and equivalence, signed normal forms, quotient versus normalization, embedding of naturals, additive inverse, arithmetic preservation, order extension, and possible branch reconvergence.

Do not infer later number domains from the accepted natural-number arithmetic package.
