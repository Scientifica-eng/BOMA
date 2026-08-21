# N_CORE_TRANSPARENCY_CERTIFICATION_001 — Machine-Checked Claim Transparency

**Status:** `TRANSPARENCY PASS — BRANCH-LOCAL`  
**Date:** 2026-08-21  
**Stage:** `N-BLOCK-007`  
**Mathematical acceptance:** `NAC-15 = ACCEPT` — unchanged  
**Program:** `PDSA-ARCH-002`  
**Branch:** `architecture/claim-transparency-001`  
**C:** `NOT STARTED — USER HOLD`

## 1. Certification statement

The accepted R-B N-Core Claim surface has been machine-compared with its actual Lean declaration closure. Every reached internal declaration has Claim-producer ancestry and every reached external boundary dependency is classified under the explicit formal dependency policy.

Result:

```text
formal residuals                   0
unowned internal declarations      0
Claim/producer residual groups     0
```

This certification is branch-local and does not retroactively alter the historical NAC-15 acceptance process or its V5 evidence.

## 2. Boundary discipline preserved

The certification retains the central N-Core epistemic distinction:

```text
calibrated pre-numerical TCT layer
  ≠
backend TCTNF verification representation
  ≠
fresh global R-B formal carrier BOMANat
```

The formal carrier, formal equality, dependent eliminator scope, global recursion/function formation, and selected universe scope remain explicit formalization commitments. They are not reinterpreted as facts already present in the pre-numerical object layer.

## 3. Root strategy

N-Core does not expose one synthetic final theorem containing all NAC-15 claims. The audit therefore uses:

```text
root_mode = producer_union
```

The root set contains existing named formal interfaces and theorems from:

```text
NCoreRB001.lean
Verify_N_BLOCK_003.lean        -- named Generated/all_generated witness
Verify_N_J_001_RouteB.lean    -- independent constructional no-confusion route
```

Verification-only `example` and `#check` commands are not promoted into canonical Claim identities.

Where an accepted property is definitional rather than represented by a standalone named theorem—for example the structural ancestry step encoded by `reify`—the relevant definition is used as the formal producer rather than inventing a theorem solely for auditing.

## 4. Certified execution

```text
workflow run       32455061955
audited source     ad9ec2850373cdd2a94d584d4c6035352d57ec75
Lean               leanprover/lean4:v4.32.1
manifest           LAB/20_FORMALIZATION/N_CORE/N_CORE_ACCEPTED_INPUTS.txt
extractor          PROTOTYPE_PASS
boundary           CLASSIFICATION_PASS
claim/producer     CLAIM_PRODUCER_PASS
```

Machine evidence:

```text
LAB/20_FORMALIZATION/N_CORE/evidence/N_CORE_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/N_CORE/evidence/N_CORE_FORMAL_DEPENDENCY_CLASSIFICATION_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/N_CORE/evidence/N_CORE_FORMAL_CLAIM_PRODUCER_COMPARISON_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/N_CORE/evidence/N_CORE_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.md
```

Producer policy:

```text
LAB/00_ARCHITECTURE/N_CORE_FORMAL_CLAIM_PRODUCER_POLICY.json
```

## 5. Claim/producer closure

```text
registry Claim IDs                20
producer-policy Claim IDs         20
declared producers                34
audit targets                     21
internal declarations             97
owned internal declarations       97
unowned internal declarations      0
Claim/producer residual groups     0
```

All internal declarations in this audited closure are sourced from N-Core accepted inputs.

## 6. Formal boundary

```text
external boundary leaves          40
classified external leaves        40
formal residuals                    0
classification:
  TRUSTED_METATHEORY               40
```

No N-Core-specific classical logical commitment, Choice commitment, or quotient identity was exposed by the audited closure.

This does not mean Lean's metatheory is proved by BOMA; it means the actual reached external leaves are explicitly accounted for as Trusted Base rather than silently folded into constructed mathematics.

## 7. Certified Claim families

```text
N-CL-CARRIER-001
N-CL-ID-001
N-CL-ELIM-001
N-CL-NOCONF-A-001
N-CL-IND-001
N-CL-GEN-001
N-CL-REC-001
N-CL-RECUNIQ-001
N-CL-INITIAL-001
N-CL-TCTBASE-001
N-CL-TCTEXT-001
N-CL-TCTPRES-001
N-CL-TCTREFL-001
N-CL-TCTCOVER-001
N-CL-HIST-001
N-CL-NOCONF-B-001
N-CL-NOCONF-CONV-001
N-CL-COMPARE-001
N-CL-STANDARD-001
N-CL-INTEGRATION-001
```

## 8. Independent Route-B provenance

The machine closure explicitly contains the constructional no-confusion witnesses:

```text
BOMA.NCore.V5.NJ001RouteB.constructional_s_ne_z
BOMA.NCore.V5.NJ001RouteB.constructional_s_injective
```

alongside the internal formal Route-A witnesses:

```text
BOMA.NCore.RB001.s_ne_z
BOMA.NCore.RB001.s_injective
```

`N-CL-NOCONF-CONV-001` therefore records reconvergence of two preserved production histories rather than treating Route B as documentary decoration.

## 9. Backend representation qualification

`Generated`, `TCTNF`, `TCTNFPlus`, and the `Verify_*` fragments remain backend/formal verification artifacts at their declared scope.

The certification does not promote them into a new canonical pre-numerical ontology and does not claim that object-level numerical depth was introduced into TCT.

## 10. First-pass learning result

The first theorem-level N-Core comparison reached zero residuals.

The earlier R/Q/Z calibration influenced the root-policy design in two important ways:

1. accepted definitional interfaces were rooted explicitly when no downstream theorem reference would otherwise certify their presence;
2. named backend witnesses were included only when the human Claim/V5 ownership records already treated them as evidence of an accepted claim.

Thus the first-pass success is a result of accumulated Learning Graph information, not evidence that the transparency problem was trivial.

## 11. Historical V5 evidence remains separate

Historical N-Core claim-level V5 evidence remains:

```text
run               32163771789
verified source   5fb03a48e243697f49f1cbde30be986d73f2ff68
Lean              4.32.1
result            PASS
```

The detailed historical ownership record remains:

```text
LAB/20_FORMALIZATION/N_CORE/V5_THEOREM_OWNERSHIP.md
```

Historical failed runs that exposed universe/scope and assembly defects remain scientifically relevant and are not rewritten by this later transparency certification.

## 12. Scope of PASS

The valid branch-local statement is:

```text
N-BLOCK-007
  MATHEMATICALLY ACCEPTED — NAC-15
  DECLARED CLAIM CLOSURE COMPLETE
  MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
```

This certification does not claim arithmetic operations, necessity of the R-B inductive regime, necessity of the selected universe scope, or any construction of C.
