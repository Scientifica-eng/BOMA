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
7. `LAB/00_ARCHITECTURE/Z_ACCEPTANCE_SPECIFICATION.md`
8. `LAB/00_ARCHITECTURE/REGISTRY.md`
9. `LAB/00_ARCHITECTURE/GRAPH.md`
10. `LAB/PDSA/PDSA-Z-RE-001_REVERSE_ENGINEER_N_FROM_Z.md`

## Do not linearize BOMA

The canonical construction is a DAG. Valid topology includes vertical dependency, horizontal independence, parallel contributors, Decision Point branches, and split → independent development → verified reconvergence.

Reconvergence never erases branch provenance.

## Accepted natural-number stage

```text
NAC-15 = ACCEPT
N-BLOCK-007 = accepted N-Core
NAA-18 = ACCEPT
N-ARITH-BLOCK-001 = accepted N-Arithmetic
```

Key reconvergence experiments:

```text
addition       right recursion ↔ left recursion
multiplication right recursion ↔ left recursion
order          additive witness ↔ independent inductive order
```

## Accepted integer stage

Two integer representations were constructed and reconverged:

```text
signed canonical normal forms
        ↕
difference pairs + explicit equivalence
```

`Z-DP-001` selected signed normal forms as the Stage-One export while retaining the pair route.

Arithmetic and order each underwent independent dual-route reconvergence before promotion.

Acceptance:

```text
ZA-01..20 PASS
Z-J-002 PASS
ZA-21 ACCEPT
Z-BLOCK-002 = Accepted Stage-One Integer Interface
```

Verification:

```text
representation           32168105466
arithmetic convergence   32169328837
ring laws                32169564747
order convergence        32169832933
ordered-ring laws        32170144944
Lean                     4.32.1
```

No quotient carrier or Lean built-in `Int` was required for the accepted Stage-One construction.

## Mandatory post-Z reverse experiment — completed

After Z acceptance, BOMA executed the required reverse-engineering experiment before opening the rational stage.

### Reverse construction from Z only

```text
N_Cone(Z) := {x : Z_BOMA | 0 ≤ x}
ReachZ generated from 0 by +1
```

The Z-only reverse core passed V5 in run `32170817620`.

### Comparison against the original bottom-up N

Only after the reverse candidates existed was `N_BOMA` reintroduced as a frozen comparison reference.

Final comparison:

```text
run:             32171528363
verified commit: 335ad9780d8cfee45624998f59dae264c1057be1
result:          PASS
```

`Z-RE-J-001` classification:

> **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**

The reverse cone reconverges with the accepted natural interface on:

```text
0
successor
addition
multiplication
order
```

but the original pre-numerical/TCT/formalization/PDSA construction history is not recoverable from Z as an extensional mathematical object. Exact decoding in the current comparison is representation-aware because selected `ZSigned` retains `BOMANat` magnitudes.

Detailed comparison:

`LAB/PDSA/experiments/PDSA-Z-RE-001_BOTTOM_UP_VS_REVERSE_COMPARISON.md`

## Current frontier

> **Rational-number stage — NEXT.**

No rational carrier is yet constructed or accepted.

The next action is a representation-neutral Q acceptance specification before choosing fraction syntax, equivalence/normalization, field operations, order, or a canonical representation.
