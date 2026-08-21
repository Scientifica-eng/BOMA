# Z_TRANSPARENCY_CERTIFICATION_001 — Machine-Checked Claim Transparency

**Status:** `TRANSPARENCY PASS — BRANCH-LOCAL`  
**Date:** 2026-08-21  
**Stage:** `Z-BLOCK-002`  
**Mathematical acceptance:** `ZA-21 = ACCEPT` — unchanged  
**Program:** `PDSA-ARCH-002`  
**Branch:** `architecture/claim-transparency-001`  
**C:** `NOT STARTED — USER HOLD`

## 1. Certification statement

For the accepted Stage-One integer interface, the machine-derived Lean dependency closure of the explicit ZA-21 acceptance-root set has been compared against:

```text
Z Claim Registry records
+ explicit Z Claim producers
+ transitive supporting BOMA ancestry
+ explicit formal/trust boundary policy
```

and the comparison contains **zero unclassified residual dependencies** and **zero internal declarations without Claim-producer ancestry**.

This is a branch-local architectural transparency certification. It does not replace or retroactively relabel the historical V5 evidence that originally established mathematical acceptance.

## 2. Why Z uses producer-union roots

The accepted Z architecture deliberately preserves multiple reconvergent histories and does not package every accepted property inside one final synthetic theorem:

```text
signed representation ↔ difference pairs

direct arithmetic ↔ pair-mediated arithmetic

direct order ↔ pair cross-sum order
```

Creating a new all-in-one theorem only to simplify this audit would alter the formal architecture for tooling convenience.

Therefore:

```text
root_mode = producer_union
```

and the audited roots are existing acceptance-level representation, convergence, ring, embedding, generation, and order theorems.

## 3. Certified execution

```text
workflow run       32454713809
audited source     8558fb5bf50a0cef07b3124bf882df03f56141e0
Lean               leanprover/lean4:v4.32.1
manifest           LAB/20_FORMALIZATION/Z_STAGE/Z_ACCEPTED_INPUTS.txt
extractor          PROTOTYPE_PASS
boundary           CLASSIFICATION_PASS
claim/producer     CLAIM_PRODUCER_PASS
```

Canonical machine evidence:

```text
LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_FORMAL_DEPENDENCY_CLASSIFICATION_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_FORMAL_CLAIM_PRODUCER_COMPARISON_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.md
```

Machine-readable producer policy:

```text
LAB/00_ARCHITECTURE/Z_FORMAL_CLAIM_PRODUCER_POLICY.json
```

## 4. Claim closure result

```text
registry Claim IDs                11
producer-policy Claim IDs         11
declared producers                48
audit targets                     29
internal declarations            203
owned internal declarations      203
unowned internal declarations      0
Claim/producer residual groups     0
```

Internal closure by source stage:

```text
N-Core          18
N-Arithmetic    59
Z              126
```

The presence of upstream N declarations is expected: Z consumes the accepted N carrier/arithmetic interfaces. Their occurrence here does not replace independent N-stage transparency certification.

## 5. Formal boundary result

```text
external boundary leaves          60
classified external leaves        60
formal residuals                    0
```

Classification:

```text
TRUSTED_METATHEORY                 60
```

No Z-specific `DECLARED_LOGICAL_COMMITMENT` boundary leaf was required by the audited closure.

In particular this certification does not introduce a claim that Lean's metatheory is absent; it states that all external leaves actually reached by the accepted Z roots are accounted for by the explicit trust policy.

## 6. Claim families covered

The certified machine comparison covers exactly the registered Z Claim families:

```text
Z-CL-REP-001
Z-CL-ALTREP-001
Z-CL-REPCONV-001
Z-CL-CARRIER-001
Z-CL-ARITHCONV-001
Z-CL-RING-001
Z-CL-EMBED-001
Z-CL-GEN-001
Z-CL-ORDERCONV-001
Z-CL-ORDER-001
Z-CL-INTEGRATION-001
```

These preserve the difference between accepted exported properties and the selected/retained production routes.

## 7. Preserved alternatives and reconvergence

`TRANSPARENCY PASS` does **not** mean that the selected signed representation was proved necessary.

The certification retains:

```text
signed normal forms
  ↔ difference-pair representation / ZEquiv

zaddD / zmulD
  ↔ zaddP / zmulP

zLEd
  ↔ pairLE / zLEp
```

The route-convergence theorems are formal dependencies of the accepted closure; the historical distinction between routes remains part of the Learning Graph.

## 8. Learning qualification

The first Z formal comparison was not a pass:

```text
run               32454624498
source            4e68b81039b3b5f7e6c56ace4a1f56bf475a2a28
boundary          CLASSIFICATION_PASS
claim/producer    REVIEW_REQUIRED
residuals         3
```

The residuals were explicit accepted properties omitted from the initial root set:

```text
signed_roundtrip
embedN_zero
embedN_one
```

They were added as acceptance roots rather than deleted from the producer policy.

Full learning record:

```text
LAB/PDSA/experiments/PDSA-ARCH-002-Z-FORMAL-CLOSURE-STUDY-001.md
```

## 9. Historical evidence remains separate

Historical Z verification evidence remains tied to the original accepted construction sequence, including:

```text
representation convergence       32168105466
arithmetic convergence           32169328837
ring laws                        32169564747
order convergence                32169832933
ordered ring                     32170144944
```

Those runs answer whether the mathematical construction passed its acceptance checks at those source states.

This certification answers a different question: whether the current architecture branch can account mechanically for the actual formal dependencies of the accepted Z Claim surface.

The two evidence layers must not be conflated.

## 10. Scope of the PASS

The certification establishes, for the selected Z audit roots:

```text
ActualFormalClosure(Z)
  ⊆
Declared Z Claim-producer closure
+ transitive accepted supporting ancestry
+ Explicit Trusted Base
```

with zero residuals under the current machine policy.

It does not establish:

```text
necessity of the signed route;
group-completion universal property;
recovery of historical TCT/PDSA provenance from Z;
transparency certification for N-Arithmetic or N-Core;
any C construction.
```

## 11. Certification effect

The valid current-state statement on this branch is:

```text
Z-BLOCK-002
  MATHEMATICALLY ACCEPTED — ZA-21
  DECLARED CLAIM CLOSURE COMPLETE
  MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
```

No mathematical frontier changed.
