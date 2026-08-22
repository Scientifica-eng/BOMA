# C_CLAIM_V5_INDEX — Complex-Stage Verification and Evidence Map

**Status:** ACTIVE — SUPPORTING BOUNDARY VERIFIED / NO ACCEPTED C CLAIM  
**Date:** 2026-08-22  
**Current acceptance contract:** `BOMA-C-ACCEPT-001`  
**Representation Decision:** `C-DP-001 OPEN`

## Evidence classification

A supporting theorem is not automatically a canonical Brick, construction Block, accepted Claim, or acceptance Junction.

| Evidence ID | Question / family | Producer | Exact run | Verified source | Outcome |
|---|---|---|---|---|---|
| `C-V5-R-INTERFACE-001` | `C-RQ-001`; `C-RL-001/002` supporting theorems | `CRInterfaceNoSquareProbe001.lean` | `32564789630` | `a6c894e62c48919712341cea1c0ea588590f9e5f` | PASS — supporting source assembly |

Detailed manifest, job, declaration, and provenance mapping:

`LAB/20_FORMALIZATION/C_STAGE/C_R_INTERFACE_PROBE_001_V5_EVIDENCE.md`

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
selected C representation   NONE
C integration Junction      NONE
CA-20 acceptance            NOT ELIGIBLE
```

A later changed source, inherited R assembly, workflow semantics, or pinned toolchain requires fresh exact verification evidence.
