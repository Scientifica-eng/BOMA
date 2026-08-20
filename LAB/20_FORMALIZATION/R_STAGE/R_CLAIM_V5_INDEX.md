# R_CLAIM_V5_INDEX — Canonical Stage-One Real Claim Evidence Map

**Status:** **ACTIVE / AUDITED — RA-20 PASS AT ACCEPTANCE-CLAIM LEVEL**  
**Date:** 2026-08-20  
**Toolchain:** `leanprover/lean4:v4.32.1`

## Purpose

Map each promoted Stage-I real-number claim to the V5 evidence that verifies it at its actual dependency level.

This index is not a substitute for the evidence files. The evidence files are authoritative for run ID, verified commit, toolchain, and PASS/FAIL status.

## Carrier, identity, Q embedding, and order

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| `CutEquiv` Setoid + `RBOMA := Quotient cutSetoid` | `evidence/R_DEDEKIND_QUOTIENT_IDENTITY_V5_LATEST.md` | `32180783725` | PASS |
| equality reflection `rmk A = rmk B ↔ CutEquiv A B` | same | `32180783725` | PASS |
| injective/order-reflecting `rOfQ` | same | `32180783725` | PASS |
| constructive `rLE` core | `evidence/R_DEDEKIND_ORDER_LOGIC_SPLIT_V5_LATEST.md` | `32181726522` | PASS |
| isolated classical total comparability witness | same | `32181726522` | PASS |

## Completeness

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| formal `RBOMA` least-upper-bound theorem for nonempty bounded families | `evidence/R_DEDEKIND_COMPLETENESS_V5_LATEST.md` | `32182056311` | PASS |

Scope: this is Dedekind LUB completeness only. No Cauchy-completeness claim is indexed because none is promoted in Stage I.

## Addition, zero, negation, additive inverse

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| representative-independent real addition | `evidence/R_DEDEKIND_ADDITION_V5_LATEST.md` | `32183597094` | PASS |
| Q-addition preservation | `evidence/R_DEDEKIND_ADDITION_EMBEDDING_V5_LATEST.md` | `32183864915` | PASS |
| addition commutativity/associativity/zero identities | `evidence/R_DEDEKIND_ADDITION_LAWS_V5_LATEST.md` | `32184188077` | PASS |
| valid quotient negation + Q-negation preservation | `evidence/R_DEDEKIND_NEGATION_CANDIDATE_V5_LATEST.md` | `32184767097` | PASS |
| additive inverse/cancellation/involutive negation | `evidence/R_DEDEKIND_ADDITIVE_INVERSE_V5_LATEST.md` | `32186543211` | PASS |

## Multiplication and ordered-ring structure

| Claim | Canonical evidence / accepted block | V5 run | Status |
|---|---|---:|---|
| signed multiplication candidate + Q multiplication preservation across all signs | `evidence/R_DEDEKIND_SIGNED_MUL_CANDIDATE_V5_LATEST.md` | `32189753112` | PASS |
| commutativity, zero annihilation, one identities | `evidence/R_DEDEKIND_SIGNED_MUL_BASIC_LAWS_V5_LATEST.md` | `32191203164` | PASS |
| associativity | `evidence/R_DEDEKIND_SIGNED_MUL_ASSOCIATIVITY_V5_LATEST.md` | `32191975377` | PASS |
| order/addition monotonicity and sign closure | `evidence/R_DEDEKIND_ORDER_ADDITIVE_V5_LATEST.md` | `32192220694` | PASS |
| full left/right distributivity | `evidence/R_DEDEKIND_SIGNED_MUL_DISTRIBUTIVITY_V5_LATEST.md` | `32192506728` | PASS |
| ordered-ring compatibility / nonnegative-factor monotonicity | `evidence/R_DEDEKIND_ORDERED_RING_V5_LATEST.md` | `32192653931` | PASS |

Additional nonnegative-kernel and approximation subclaims remain recorded in `R-MUL-BLOCK-001`; they are dependencies of these promoted laws rather than replacements for them.

## Multiplicative inverse / field closure

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| positive inverse product `A * recip(A) ≈ 1` | `evidence/R_DEDEKIND_POSITIVE_INVERSE_PRODUCT_004_V5_LATEST.md` | `32355681924` | PASS |
| positive quotient-level inverse relation: existence, representative independence, product one, positive Q inverse preservation | `evidence/R_DEDEKIND_POSITIVE_INVERSE_RELATION_003_V5_LATEST.md` | `32356254961` | PASS |
| every nonzero real has right/left inverse witness; witness unique | `evidence/R_DEDEKIND_NONZERO_INVERSE_004_V5_LATEST.md` | `32356513408` | PASS |

## Density and Archimedean characterization

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| Q image is strictly order-dense in `RBOMA` | `evidence/R_RATIONAL_DENSITY_001_V5_LATEST.md` | `32359834460` | PASS |
| every `RBOMA` lies strictly below an embedded `N_BOMA` | `evidence/R_ARCHIMEDEAN_001_V5_LATEST.md` | `32359869558` | PASS |

## Acceptance-obligation map

```text
RA-01  carrier                    quotient-identity evidence
RA-02  identity                   quotient-identity evidence
RA-03  Q embedding                quotient-identity evidence
RA-04  zero/one                   addition/basic multiplication evidence
RA-05  negation                   negation + additive-inverse evidence
RA-06  addition                   addition + laws evidence
RA-07  multiplication             signed multiplication + ring-law evidence
RA-08  nonzero inverse            nonzero-inverse 004 evidence
RA-09  ordered-field laws         order split + additive/order + ring + inverse evidence
RA-10  Q preservation             identity/order + addition embedding + negation + signed multiplication evidence
RA-11  selected completeness      formal Dedekind completeness evidence
RA-12  rational density           rational-density 001 evidence
RA-13  Archimedean                Archimedean 001 evidence
RA-20  claim-level verification   this index + authoritative evidence files
```

RA-14, RA-17, RA-18, and RA-19 are architecture/source-audit obligations rather than standalone mathematical theorem claims; their evidence is recorded in `R_STAGE_ACCEPTANCE_AUDIT_001.md`.

## Provenance corrections detected by this audit

`R-COMP-BLOCK-001` previously listed a noncanonical run number. The authoritative completeness evidence file records:

```text
V5 run 32182056311
verified commit fca34d837b5c78b540ac2ff50648a8cc531018a5
PASS
```

The Block metadata was corrected on 2026-08-20 without changing the theorem or its status.

## Failure classification rule

Historical FAIL/FAIL_OR_INCOMPLETE records remain in the Learning Graph. They are not overwritten.

For acceptance, failures are classified as one of:

```text
mathematical counterexample / invalid theorem;
missing mathematical dependency;
Lean proof-engineering defect;
workflow/CI dependency-DAG defect;
metadata/provenance defect.
```

The latest canonical PASS does not erase earlier failures; it identifies the stabilized claim after Study/Act correction.

## RA-20 result

At the Stage-I acceptance-claim level currently promoted into canonical R Blocks, each mathematical theorem family has a V5 PASS tied to the actual BOMA dependency assembly.

Therefore:

```text
RA-20 = PASS
```

subject to the final `R-J-002` integration gate confirming that the independently verified interfaces coexist without circularity or namespace/assembly conflict.
