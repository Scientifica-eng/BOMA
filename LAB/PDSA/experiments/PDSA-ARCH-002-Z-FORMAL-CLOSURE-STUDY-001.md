# PDSA-ARCH-002 — Z Formal Closure Study 001

**Status:** CLOSED — ZERO RESIDUALS REACHED  
**Date:** 2026-08-21  
**Stage:** `Z`  
**Branch:** `architecture/claim-transparency-001`  
**Mathematical frontier:** UNCHANGED  
**Acceptance baseline:** `ZA-21 = ACCEPT` / `Z-BLOCK-002`  
**C:** `NOT STARTED — USER HOLD`

## 1. Purpose

Preserve the learning sequence by which the declared Z Claim closure was compared with the actual theorem-level Lean dependency closure.

This record is intentionally separate from the current-state transparency certificate. The first failed comparison is part of BOMA's Learning Graph and is not rewritten as if the correct audit-root set had been known in advance.

## 2. Audit architecture

Z has no synthetic final theorem that packages every ZA-21 property. The accepted architecture instead retains several independent convergence and law families:

```text
signed representation       ↔ difference-pair representation
          ↓ representation convergence

direct signed arithmetic    ↔ pair-mediated arithmetic
          ↓ arithmetic convergence

canonical ring + N embedding + generation

direct signed order         ↔ pair cross-sum order
          ↓ order convergence
          ↓ ordered-ring laws
```

Accordingly the formal audit uses:

```text
root_mode = producer_union
```

rather than inventing a new mathematical certificate merely for transparency tooling.

## 3. First execution

```text
workflow run       32454624498
audited source     4e68b81039b3b5f7e6c56ace4a1f56bf475a2a28
extractor          PROTOTYPE_PASS
boundary           CLASSIFICATION_PASS
claim/producer     CLAIM_PRODUCER_REVIEW_REQUIRED
```

The formal boundary itself was already clean. The comparison found exactly three producer residuals:

```text
BOMA.Z.Rep001.signed_roundtrip
BOMA.Z.Arithmetic001.embedN_zero
BOMA.Z.Arithmetic001.embedN_one
```

All three were real accepted claims, not incidental helper lemmas.

## 4. Diagnosis

The defect was **audit-root undercoverage**, not a hidden mathematical premise and not a Trusted-Base defect.

### `signed_roundtrip`

The declared representation-convergence claim explicitly includes exact signed round-trip behavior. Therefore this theorem belongs directly on the acceptance audit surface even if later ring/order roots do not consume it.

### `embedN_zero` and `embedN_one`

`Z-CL-EMBED-001` explicitly claims that the accepted natural embedding preserves `0`, `1`, addition, multiplication, and order. The first root set included the nontrivial preservation theorems for addition/multiplication/order but omitted the definitional/rfl-level zero and one laws.

Their proof simplicity does not remove them from the accepted Claim surface.

## 5. Act

The producer policy was corrected by **adding the three explicit acceptance theorems to `audit_targets`**.

No theorem was weakened, deleted, or reclassified merely to obtain a pass.

In particular this differs from the earlier Q study:

```text
Q residual `zmul_ne_zero`
  = valid helper theorem, but not consumed by / required as an acceptance producer
  → removed from Claim producer policy

Z residuals here
  = properties explicitly stated by accepted Claim records
  → added to the audit-root surface
```

That distinction is part of the retained learning result.

## 6. Second execution

```text
workflow run       32454713809
audited source     8558fb5bf50a0cef07b3124bf882df03f56141e0
Lean               leanprover/lean4:v4.32.1
extractor           PROTOTYPE_PASS
boundary            CLASSIFICATION_PASS
claim/producer      CLAIM_PRODUCER_PASS
residuals           0
```

Measured Claim/producer closure:

```text
registry Claim IDs                11
policy Claim IDs                  11
declared producers                48
audit targets                     29
internal declarations            203
owned internal declarations      203
unowned internal declarations      0
Claim/producer residual groups     0
```

Source-stage distribution inside the audited internal closure:

```text
N-Core          18
N-Arithmetic    59
Z              126
```

Formal boundary:

```text
external boundary leaves          60
classified external leaves        60
TRUSTED_METATHEORY                 60
formal residuals                    0
```

No Z-specific classical logical commitment was exposed by this closure.

## 7. Learning conclusion

The Z transparency audit demonstrated a distinct failure mode:

```text
Declared Claim set correct
+ producer names correct
+ formal boundary clean
+ root set incomplete
= transparency comparison failure
```

Therefore a producer-union audit must not infer that a theorem is irrelevant merely because downstream selected exports happen not to consume it. If the accepted Claim itself states the property, the property remains part of the stage-root surface.

## 8. Provenance preservation

This study does not erase or rewrite:

- signed vs difference-pair representation history;
- direct vs pair-mediated arithmetic history;
- direct vs pair order history;
- the first failed Z transparency run;
- historical ZA-21 V5 evidence.

The current clean closure is a later architectural result layered on top of those histories.

## 9. Non-effects

This study did not:

```text
reopen ZA-21;
change Z theorem statements;
turn signed normal forms into a mathematical necessity;
delete the retained difference-pair route;
introduce a quotient integer carrier;
merge the architecture branch into main;
open C.
```
