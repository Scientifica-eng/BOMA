# TCT-BLOCK-006 — Historical/Provisional N-Core Aggregate View

## Canonical Identity

- **Unit ID:** `TCT-BLOCK-006`
- **Type:** Block record retained for provenance
- **Layer:** L2 formalization transition
- **Operational Status:** **DECOMPOSED / RETAINED AS AGGREGATE VIEW — NOT THE CANONICAL N TOPOLOGY**
- **Epistemic Status:** **FORMALIZATION-DEPENDENT / PROVISIONAL AGGREGATE**
- **Original PDSA origin:** `PDSA-N-004`
- **Topology correction:** `PDSA-N-008`

## Purpose

This record preserves the earlier stage at which the fresh R-B N-Core candidate was packaged as one provisional Block.

That packaging was useful as a feasibility experiment but is no longer the canonical architecture of the N-Core construction.

The authoritative N-Core topology is now:

`LAB/00_ARCHITECTURE/N_CORE_DAG.md`

with canonical units:

```text
N-BLOCK-001 .. N-BLOCK-006
N-BR-001 .. N-BR-020
N-J-001 .. N-J-002
N-DP-001
```

## Preserved historical contribution

The aggregate candidate introduced/collected:

```text
N_BOMA
z
s
no-confusion candidates
induction/generatedness route
recursion/initiality route
TCT bridge route
standardness route
```

These are now assigned to separate Brick/Block identities according to actual dependency topology.

## Backend relation

`N-RB-CAND-001` and `LAB/payloads/lean/NCore/NCoreRB001.lean` remain producer/evidence artifacts. They are not the canonical unit decomposition.

## Current rule

Do not use `TCT-BLOCK-006` as a parent node to bypass the N-DAG.

```text
TCT-BLOCK-006 aggregate view
        ≠
canonical N-Core construction Block
```

No N-Core acceptance is implied by this record.
