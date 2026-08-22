# C_CLAIM_V5_INDEX — Complex-Stage Verification and Evidence Map

**Status:** ACTIVE — BOUNDARY + COMPARABLE ROUTE PROBES VERIFIED / NO ACCEPTED C CLAIM  
**Date:** 2026-08-22  
**Current acceptance contract:** `BOMA-C-ACCEPT-001`  
**Representation Decision:** `C-DP-001 RESOLVED / USER-SELECTED C-ROUTE-P`

## Evidence classification

A supporting theorem is not automatically a canonical Brick, construction Block, accepted Claim, or acceptance Junction.

| Evidence ID | Question / family | Producer | Exact run | Verified source | Outcome |
|---|---|---|---|---|---|
| `C-V5-R-INTERFACE-001` | `C-RQ-001`; `C-RL-001/002` supporting theorems | `CRInterfaceNoSquareProbe001.lean` | `32564789630` | `a6c894e62c48919712341cea1c0ea588590f9e5f` | PASS — supporting source assembly |
| `C-V5-ROUTE-PROBE-001` | `PDSA-C-003`; noncanonical Route P rubric | `CRoutePairProbe001.lean` | `32565335033` / job `97013042899` | `3f670372a022d1eb95109d36cde255b3504dda12` | PASS — independent route assembly |
| `C-V5-ROUTE-Q-PROBE-001` | `PDSA-C-003`; noncanonical Route Q rubric | `CRouteQuadraticQuotientProbe001.lean` | `32565335033` / job `97013042973` | `3f670372a022d1eb95109d36cde255b3504dda12` | PASS — independent route assembly |

Detailed manifest, job, declaration, and provenance mappings:

```text
LAB/20_FORMALIZATION/C_STAGE/C_R_INTERFACE_PROBE_001_V5_EVIDENCE.md
LAB/20_FORMALIZATION/C_STAGE/C_ROUTE_PROBES_001_V5_EVIDENCE.md
```

## Supporting theorem mapping

```text
C-RL-001
  abstract producer  square_nonnegative_of_interface
  accepted instance  square_nonnegative_from_accepted_R
  evidence           C-V5-R-INTERFACE-001 PASS

C-RL-002
  abstract producer  minus_one_not_square_of_interface
  accepted instance  minus_one_not_square_from_accepted_R
  evidence           C-V5-R-INTERFACE-001 PASS
```

The remaining nine declarations in the same source are supporting equational/order lemmas. The run verifies all 13 declarations; it does not assert independent extracted dependency closure for each theorem.

## Current C acceptance state

```text
accepted C Claims          NONE
canonical C carrier         NONE
selected C representation   C-ROUTE-P — user-ratified; C-ROUTE-Q retained
C integration Junction      NONE
CA-20 acceptance            NOT ELIGIBLE
```

A later changed source, inherited R assembly, workflow semantics, or pinned toolchain requires fresh exact verification evidence.
