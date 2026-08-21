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

The original acceptance-strength integration that closed `R-J-002` was run `32374868448` at verified commit `f07363c22b049a3fae028a927df74d4fb28a0680`. After the assembly-manifest/provenance hardening was merged, the same accepted verification inputs were rechecked by run `32385379288`, whose canonical latest evidence records verified source commit `af0a03d83245b1e15e9903df00db89edf3317042`.

| Claim | Canonical evidence | Latest integration V5 | Status |
|---|---|---:|---|
| `rZero ≠ rOne` derived through Q strict order | `evidence/R_INTEGRATION_002_V5_LATEST.md` | `32385379288` | PASS |
| addition translation invariance `x+c ≤ y+c ↔ x≤y` | same | `32385379288` | PASS |
| negation reverses order | same | `32385379288` | PASS |
| any inverse witness of a strictly positive real is strictly positive | same | `32385379288` | PASS |

The widened integration certificate passes without introducing a global inverse selector.

## Density and Archimedean characterization

| Claim | Canonical evidence | V5 run | Status |
|---|---|---:|---|
| Q image is strictly order-dense in `RBOMA` | `evidence/R_RATIONAL_DENSITY_001_V5_LATEST.md` | `32359834460` | PASS |
| every `RBOMA` lies strictly below an embedded `N_BOMA` | `evidence/R_ARCHIMEDEAN_001_V5_LATEST.md` | `32359869558` | PASS |

## Final integration

| Claim | Canonical evidence | Latest V5 run | Status |
|---|---|---:|---|
| same-carrier acceptance-strength integration, including explicit ordered-field closure | `evidence/R_INTEGRATION_002_V5_LATEST.md` | `32385379288` | PASS |

Latest verified source commit: `af0a03d83245b1e15e9903df00db89edf3317042`.

Historical acceptance-closing integration:

```text
run             32374868448
verified commit f07363c22b049a3fae028a927df74d4fb28a0680
result          PASS
```

The later run is a post-maintenance re-verification of the hardened assembly/evidence workflow and does not retroactively erase the earlier acceptance evidence.

The canonical ordered source assembly for the R-J-002 workflow is recorded separately in:

`LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt`

This manifest is an operational traceability artifact. Extracting the previously inline source order into the manifest does not revise the accepted theorem set; it makes the integration dependency order independently inspectable and reduces workflow-list drift.

The integration workflow also guards evidence promotion by checking that its verification inputs have not changed between the actually verified `GITHUB_SHA` and the `main` head on which the evidence record would be committed. Documentation-only movement of `main` may coexist with a verified source state; verification-input drift causes evidence promotion to stop rather than misattribute the run.

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

The 2026-08-20 takeover stabilization later hardened source assembly/evidence provenance and triggered the successful re-verification run `32385379288`. Historical FAIL/FAIL_OR_INCOMPLETE records and the earlier successful acceptance run remain in the Learning Graph.

## RA-20 result

Every Stage-I acceptance-level mathematical theorem family has a canonical V5 PASS, and the acceptance-strength full assembly passes as well.

```text
RA-20 = PASS
RA-21 = PASS
```
