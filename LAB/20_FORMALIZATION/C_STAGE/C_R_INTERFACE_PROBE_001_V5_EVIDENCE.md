# C_R_INTERFACE_PROBE_001 — Exact V5 Evidence

**Evidence ID:** `C-V5-R-INTERFACE-001`  
**Status:** PASS — SUPPORTING THEOREMS ONLY / NO ACCEPTED C CLAIM  
**Recorded:** 2026-08-22  
**PDSA cycle:** `PDSA-C-002 — CLOSED`  
**Dependency question:** `C-RQ-001 — CLOSED / PASS`

## Exact independently retrievable evidence

```text
repository      Scientifica-eng/BOMA
feature branch  feature/c-stage-acceptance-001
draft PR        #5 — not merged
workflow        BOMA C Accepted-R Interface Probe 001 — V5
workflow file   .github/workflows/boma-c-r-interface-probe-001.yml
run ID          32564789630
job ID          97011737741
event           pull_request
run conclusion  completed / success
verified commit a6c894e62c48919712341cea1c0ea588590f9e5f
source path     LAB/payloads/lean/CStage/CRInterfaceNoSquareProbe001.lean
source blob     0317956f52aa86078948722ccc923bd2bdeb8fa7
toolchain       leanprover/lean4:v4.32.1
Lean release    4.32.1
Lake release    5.0.0-src+f054605
```

Workflow URL:

https://github.com/Scientifica-eng/BOMA/actions/runs/32564789630

The checkout provenance step explicitly compared the actual checkout commit with the pull-request head SHA before verification.

## Exact verification assembly

```text
accepted R manifest:
  LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt
  blob e00bb8d55785b02402b5b2a18d9c94332b5c423a

C-only manifest:
  LAB/20_FORMALIZATION/C_STAGE/C_R_INTERFACE_PROBE_001_INPUTS.txt
  blob 67c6ed0db38b17745065dd0145e5a63eb0f16fa1

command:
  lake env lean /tmp/CRInterfaceNoSquareProbe001.lean
```

Both manifests were validated before the accepted R sources and the single C source were assembled. The job completed successfully. Historical warnings emitted by inherited accepted-stage sources do not constitute C elaboration failures.

## Verified declaration inventory

| Declaration | Role | Acceptance status |
|---|---|---|
| `neg_zero_from_interface` | additive helper | supporting only |
| `add_inverse_unique_from_interface` | additive helper | supporting only |
| `neg_involutive_from_interface` | additive helper | supporting only |
| `mul_zero_right_from_interface` | ring helper | supporting only |
| `mul_zero_left_from_interface` | ring helper | supporting only |
| `mul_neg_right_from_interface` | ring helper | supporting only |
| `mul_neg_left_from_interface` | ring helper | supporting only |
| `mul_neg_neg_same_from_interface` | ring helper | supporting only |
| `square_nonnegative_of_interface` | `C-RL-001`, abstract accepted-R interface | supporting only |
| `zero_le_one_of_interface` | ordered-ring helper | supporting only |
| `minus_one_not_square_of_interface` | `C-RL-002`, abstract accepted-R interface | supporting only |
| `square_nonnegative_from_accepted_R` | `C-RL-001`, accepted certificate instantiation | supporting only |
| `minus_one_not_square_from_accepted_R` | `C-RL-002`, accepted certificate instantiation | supporting only |

All declarations belong to `BOMA.C.RInterfaceNoSquareProbe001`.

## Dependency and claim boundaries

The abstract proof consumes accepted R ordered-ring/nontriviality interface fields. It does not inspect Dedekind representation internals or use the accepted completeness, density, Archimedean, or inverse fields in its proof body.

The current accepted producer of `orderTotal` has localized classical provenance under `R-DP-003`. The C source introduces no new explicit `Classical` or Choice call, but does not erase that upstream producer commitment.

This V5 run verifies source assembly elaboration. It does **not** certify an extracted theorem-level dependency closure, accept a C Claim, resolve `C-DP-001`, construct a C carrier, or establish a representation Junction.
