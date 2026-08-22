# C_ROUTE_PROBES_001_V5_EVIDENCE — Comparable Quadratic Route Probes

**Evidence ID:** `C-V5-ROUTE-PROBES-001`  
**Status:** PASS — BOTH INDEPENDENT ROUTE ASSEMBLIES  
**Date:** 2026-08-22  
**Cycle:** `PDSA-C-003`  
**Decision:** `C-DP-001 OPEN — DECISION-READY / NO SELECTS EDGE`

## Exact verification identity

```text
workflow       BOMA C Comparable Quadratic Route Probes 001 — V5
run            32565335033
event          pull_request
PR             #5 — DRAFT / NOT MERGED
source commit  3f670372a022d1eb95109d36cde255b3504dda12
toolchain      leanprover/lean4:v4.32.1
permissions    contents: read
outcome        COMPLETED / SUCCESS
```

The workflow checked out the exact pull-request head SHA and validated candidate independence before invoking Lean.

## Route P

```text
candidate source  LAB/payloads/lean/CStage/CRoutePairProbe001.lean
source blob       a92623570f3568e100dfab8f8f910162a14ecb46
candidate manifest LAB/20_FORMALIZATION/C_STAGE/C_ROUTE_PAIR_PROBE_001_INPUTS.txt
job               97013042899
job conclusion    SUCCESS
```

Independent assembly:

```text
accepted R integration manifest
+ verified C-R boundary-support manifest
+ Route P manifest only
```

The negative namespace guard confirmed that the Route P source does not reference the Route Q namespace.

## Route Q

```text
candidate source  LAB/payloads/lean/CStage/CRouteQuadraticQuotientProbe001.lean
source blob       56086636bf646eefddce97b90071edd9aada61fa
candidate manifest LAB/20_FORMALIZATION/C_STAGE/C_ROUTE_QUADRATIC_QUOTIENT_PROBE_001_INPUTS.txt
job               97013042973
job conclusion    SUCCESS
```

Independent assembly:

```text
accepted R integration manifest
+ verified C-R boundary-support manifest
+ Route Q manifest only
```

The negative namespace guard confirmed that the Route Q source does not reference the Route P namespace.

## Verified probe scope

For each route the successful assembly checks the declared candidate carrier/identity, real embedding and injectivity, distinguished generator, route-local zero/one/negation/addition/multiplication, the relation `I²=-1`, real-plus-imaginary generation, coordinate uniqueness, and non-real collapse.

## Explicit limits

This evidence does **not** certify:

```text
a canonical C carrier
full commutative-field closure
a nonzero complex inverse interface
a Route P ↔ Route Q isomorphism/Junction
an accepted C Claim
C-DP-001 selection
CA-20 acceptance
```

The run is route-comparison evidence only. Any changed source, inherited manifest, workflow semantics, or toolchain requires new evidence.
