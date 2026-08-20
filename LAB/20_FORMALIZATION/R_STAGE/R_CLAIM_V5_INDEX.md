# R_CLAIM_V5_INDEX — Canonical Stage-One Real Claim Evidence Map

**Status:** **ACTIVE / AUDITED — RA-20 PASS AT ACCEPTANCE-CLAIM LEVEL**  
**Date:** 2026-08-20  
**Toolchain:** `leanprover/lean4:v4.32.1`

## Purpose

Map each promoted Stage-I real-number claim to V5 evidence at its actual dependency level. Evidence files are authoritative for run ID, verified commit, toolchain, and outcome.

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
| formal `RBOMA` LUB theorem for nonempty bounded families | `evidence/R_DEDEKIND_COMPLETENESS_V5_LATEST.md` | `32182056311` | PASS |

Scope is Dedekind least-upper-bound completeness only. No Cauchy/metric/sequential completeness claim is promoted.

## Addition, zero, negation, additive inverse

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| representative-independent real addition | `evidence/R_DEDEKIND_ADDITION_V5_LATEST.md` | `32183597094` | PASS |
| Q-addition preservation | `evidence/R_DEDEKIND_ADDITION_EMBEDDING_V5_LATEST.md` | `32183864915` | PASS |
| addition commutativity/associativity/zero identities | `evidence/R_DEDEKIND_ADDITION_LAWS_V5_LATEST.md` | `32184188077` | PASS |
| quotient negation + Q-negation preservation | `evidence/R_DEDEKIND_NEGATION_CANDIDATE_V5_LATEST.md` | `32184767097` | PASS |
| additive inverse/cancellation/involutive negation | `evidence/R_DEDEKIND_ADDITIVE_INVERSE_V5_LATEST.md` | `32186543211` | PASS |

## Multiplication and ordered-ring structure

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| signed multiplication candidate + Q multiplication preservation | `evidence/R_DEDEKIND_SIGNED_MUL_CANDIDATE_V5_LATEST.md` | `32189753112` | PASS |
| commutativity, zero annihilation, one identities | `evidence/R_DEDEKIND_SIGNED_MUL_BASIC_LAWS_V5_LATEST.md` | `32191203164` | PASS |
| associativity | `evidence/R_DEDEKIND_SIGNED_MUL_ASSOCIATIVITY_V5_LATEST.md` | `32191975377` | PASS |
| order/addition monotonicity and sign closure | `evidence/R_DEDEKIND_ORDER_ADDITIVE_V5_LATEST.md` | `32192220694` | PASS |
| full left/right distributivity | `evidence/R_DEDEKIND_SIGNED_MUL_DISTRIBUTIVITY_V5_LATEST.md` | `32192506728` | PASS |
| ordered-ring compatibility / nonnegative-factor monotonicity | `evidence/R_DEDEKIND_ORDERED_RING_V5_LATEST.md` | `32192653931` | PASS |

## Multiplicative inverse / field closure

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| positive inverse product | `evidence/R_DEDEKIND_POSITIVE_INVERSE_PRODUCT_004_V5_LATEST.md` | `32355681924` | PASS |
| positive quotient inverse relation + Q inverse preservation | `evidence/R_DEDEKIND_POSITIVE_INVERSE_RELATION_003_V5_LATEST.md` | `32356254961` | PASS |
| every nonzero real has unique left/right inverse witness | `evidence/R_DEDEKIND_NONZERO_INVERSE_004_V5_LATEST.md` | `32356513408` | PASS |

### Explicit RA-09 closure

The final closure audit required specifically named ordered-field consequences to be machine-visible rather than inferred from the phrase “ordered field.” They are encoded in:

`LAB/payloads/lean/RStage/RDedekindOrderedFieldClosure.lean`

and consumed by the final integration certificate.

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| `rZero ≠ rOne` derived through Q strict order | `evidence/R_INTEGRATION_002_V5_LATEST.md` | `32374868448` | PASS |
| addition translation invariance `x+c ≤ y+c ↔ x≤y` | same | `32374868448` | PASS |
| negation reverses order | same | `32374868448` | PASS |
| any inverse witness of a strictly positive real is strictly positive | same | `32374868448` | PASS |

The widened integration certificate passed without introducing a global inverse selector.

## Density and Archimedean characterization

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| Q image is strictly order-dense in `RBOMA` | `evidence/R_RATIONAL_DENSITY_001_V5_LATEST.md` | `32359834460` | PASS |
| every `RBOMA` lies strictly below an embedded `N_BOMA` | `evidence/R_ARCHIMEDEAN_001_V5_LATEST.md` | `32359869558` | PASS |

## Final integration

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| same-carrier acceptance-strength integration, including explicit ordered-field closure | `evidence/R_INTEGRATION_002_V5_LATEST.md` | `32374868448` | PASS |

Verified commit: `f07363c22b049a3fae028a927df74d4fb28a0680`.

## Acceptance-obligation map

```text
RA-01  carrier                    quotient-identity evidence
RA-02  identity                   quotient-identity evidence
RA-03  Q embedding                quotient-identity evidence
RA-04  zero/one                   definitions + basic multiplication + final nontriviality
RA-05  negation                   negation + additive-inverse evidence
RA-06  addition                   addition + laws evidence
RA-07  multiplication             signed multiplication + ring-law evidence
RA-08  nonzero inverse            nonzero-inverse 004 evidence
RA-09  ordered-field laws         order split + ring + explicit final closure + inverse evidence
RA-10  Q preservation             identity/order + addition + negation + multiplication + positive Q inverse evidence
RA-11  selected completeness      formal Dedekind completeness evidence
RA-12  rational density           rational-density 001 evidence
RA-13  Archimedean                Archimedean 001 evidence
RA-20  claim-level verification   this index + authoritative evidence files
RA-21  final integration          integration 002 evidence
```

RA-14, RA-16, RA-17, RA-18, and RA-19 are architecture/source-audit obligations recorded in `R_STAGE_ACCEPTANCE_AUDIT_001.md` and the final closure cycle.

## Provenance corrections / Study results

The audit corrected a stale completeness run number in `R-COMP-BLOCK-001`; canonical evidence is `32182056311 PASS`.

The final RA-09 closure also exposed that one-way addition monotonicity should not be documented as full translation invariance without the reverse implication. Rather than weaken the acceptance wording, explicit derived theorems for translation equivalence, negation reversal, and positive inverse behavior were added and verified in the final integration run.

Historical FAIL/FAIL_OR_INCOMPLETE records remain in the Learning Graph and are classified separately from mathematical counterexamples.

## RA-20 result

Every Stage-I acceptance-level mathematical theorem family now has a canonical V5 PASS, and the acceptance-strength full assembly passes as well.

```text
RA-20 = PASS
RA-21 = PASS
```
