# PDSA-R-001 — Real Completion Route Probes

**CycleID:** `PDSA-R-001`  
**Status:** **ACTIVE — D/C PROBES UNDER V5**  
**Date:** 2026-08-18  
**Input:** `Q-BLOCK-002`  
**Decision Point:** `R-DP-001`

## PLAN

Before constructing a real carrier, compare Dedekind and Cauchy routes using actual formal representation probes over accepted BOMA N/Q infrastructure.

Research question:

> Which route should be the canonical Stage-One completion path, and which costs are mathematical versus merely representational/backend costs?

Shared requirements:

```text
strict rational order qLT derived from accepted qLE
positive rational predicate
no built-in Real carrier
no assumed equivalence between completeness notions
no canonical route before both probes type-check
```

## DO

### Shared gateway

`RPreCompletionGateway.lean` defines:

```text
qLT
qPos
qClose
```

and basic strict-order facts from accepted Q total order.

### Route D probe

`RDedekindProbe.lean` defines:

```text
LowerCut
  lower : QBOMA → Prop
  nonempty
  proper
  downward
  rounded

CutEquiv A B := ∀q, A.lower q ↔ B.lower q
```

Important: the probe keeps extensional cut identity external. It does not silently assume function or proposition extensionality.

### Route C probe

`RCauchyProbe.lean` defines:

```text
QSeq := BOMANat → QBOMA
IsCauchy
CauchySeq
CauchyEquiv
```

The Cauchy predicate uses positive rational epsilon and accepted N order, without introducing a primitive metric or absolute-value carrier.

## Hypotheses to test

### H-D1
Dedekind representation has a higher predicate/identity cost but a lower direct completeness-proof cost because supremum can be represented through cut membership union/existential structure.

### H-D2
The principal rational-cut embedding will require an explicit Q density theorem to satisfy roundedness.

### H-C1
Cauchy representation has a direct sequence syntax and pointwise algebra route, but its equivalence and completeness proof will require substantial epsilon/index machinery.

### H-C2
Nonzero inverse on the Cauchy quotient will require eventual separation from zero or equivalent structure, creating a nontrivial downstream proof gate.

### H-C3
The Cauchy route may reuse the accepted N carrier more heavily than Dedekind, which is relevant to dependency topology and Stage-II comparison.

## Verification

Workflow:

`.github/workflows/boma-r-completion-probes-001.yml`

Evidence:

`LAB/20_FORMALIZATION/R_STAGE/evidence/R_COMPLETION_PROBES_V5_LATEST.md`

The workflow checks the shared gateway, Dedekind probe, and Cauchy probe as separate V5 targets.

## STUDY lock

Do not resolve `R-DP-001` until the V5 evidence is read and the comparison records actual dependency burdens exposed by the probes.

A probe PASS means only that the representation layer is coherent enough to type-check. It does **not** mean:

```text
field operations are complete
completeness is proved
Q embedding is constructed
the route is canonical
R is accepted
```

## ACT candidates

```text
select D for Stage One / retain C
select C for Stage One / retain D
build one deeper experiment on each before selection
open an interval route if both expose unacceptable hidden commitments
```
