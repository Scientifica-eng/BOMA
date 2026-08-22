# PDSA-C-004 — Selected Pair Carrier and Commutative-Ring Core

**Cycle ID:** `PDSA-C-004`  
**Status:** CLOSED — SELECTED PAIR RING CORE V5 PASS / FIELD CLOSURE OPENED  
**Plan date:** 2026-08-22  
**Parent:** `PDSA-C-003 — CLOSED / run 32565335033 PASS`  
**Decision:** `C-DP-001 — RESOLVED / USER-RATIFIED C-ROUTE-P`  
**Acceptance contract:** `BOMA-C-ACCEPT-001`

## Research question

Can the user-selected rank-two Route P be promoted into an explicitly owned canonical complex carrier and a verified commutative-ring-strength core using only the accepted real integration certificate, the verified C real-boundary support, and the already verified Route P producer?

# PLAN — FROZEN

## Input boundary

```text
R-BLOCK-001 accepted real interface
RStageIntegrationCertificate
PDSA-C-002 verified C-R boundary support
PDSA-C-003 verified Route P source
C-DP-001 user-ratified C-ROUTE-P selection
BOMA-C-ACCEPT-001 unchanged
BOMA-C-R-DEP-001 unchanged
C-ROUTE-Q retained and excluded from canonical selected-route assembly
```

No accepted N/Z/Q/R source, accepted theorem, real representation internal, frozen earlier PDSA PLAN, standard Complex carrier, new axiom, `sorry`, or new explicit classical/Choice principle may be introduced.

## Construction scope

Create exactly the selected-route producer and evidence surfaces:

```text
LAB/payloads/lean/CStage/CPairCore001.lean
LAB/20_FORMALIZATION/C_STAGE/C_PAIR_CORE_001_INPUTS.txt
.github/workflows/boma-c-pair-core-001.yml
LAB/10_CONSTRUCTION/blocks/C-BLOCK-001/UNIT.md
```

The canonical carrier may transparently reuse the exact previously verified Route P record; reuse must be declared rather than presented as a fresh independent carrier.

## Frozen mathematical targets

```text
C4-01  selected canonical carrier and explicit record/equality commitment
C4-02  zero, one, negation, addition, multiplication and faithful R embedding
C4-03  complex zero/one nontriviality
C4-04  additive associativity, commutativity, zero, and additive inverse
C4-05  multiplicative associativity, commutativity, and one
C4-06  multiplication distributivity and zero annihilation
C4-07  R embedding preserves zero, one, negation, addition, and multiplication
C4-08  distinguished I, I²=-1, generation, coordinate uniqueness, non-real collapse
C4-09  exact read-only V5 verification of R + C-boundary + Route P + core
C4-10  truthful Claim mapping: commutative-ring core is not yet full field closure
```

## Explicit exclusions

```text
nonzero complex inverse
full C field acceptance
Route P ↔ Route Q field isomorphism/Junction
algebraic closure or FTA
new global real inverse selector
CA-20 acceptance
merge to main
```

These require later separately frozen cycles.

## Failure classes

```text
F1  missing ordinary lemma derivable from accepted R certificate
F2  genuine missing mathematical strength in accepted R interface
F3  route contamination or hidden Dedekind implementation dependency
F4  commutative-ring proof engineering / equational normalization failure
F5  verification assembly, checkout provenance, or workflow observability failure
F6  hidden extra logical/formalization commitment
```

A failure is recorded in DO/STUDY. The PLAN is never edited after freeze.

## Exit condition

Close only after the selected-route source passes an exact retrievable V5 run, the selected producer/Claim status is synchronized without claiming an inverse or accepted C export, and the ACT decision identifies the separate norm/inverse cycle.

# DO — ACTIVE / FIRST FORMAL VERIFICATION PENDING

## D1 — Promote the user-selected, previously verified Route P carrier

Created the selected canonical carrier as an explicitly declared alias of the independently verified `RoutePairProbe001.PairCandidate` record. Added canonical zero, one, negation, addition, multiplication, faithful accepted-real embedding, distinguished generator, additive/multiplicative laws, real-embedding preservation, generation, coordinate uniqueness, and non-real collapse targets.

The producer exports `CPairRingCoreCertificate`, deliberately named and scoped as a commutative-ring core rather than a completed field certificate.

## D2 — Stage the exact selected-route V5 assembly

Created:

```text
LAB/payloads/lean/CStage/CPairCore001.lean
LAB/20_FORMALIZATION/C_STAGE/C_PAIR_CORE_001_INPUTS.txt
.github/workflows/boma-c-pair-core-001.yml
LAB/10_CONSTRUCTION/blocks/C-BLOCK-001/UNIT.md
```

The read-only workflow assembles exactly accepted R + verified C-R boundary support + previously verified Route P + the selected pair core. Its selected-source guard excludes Route Q, real representation internals, out-of-contract completeness/density/Archimedean fields, explicit classical invocations, and unproved logical placeholders.

```text
selected ring-core V5   32574270735 PASS / job 97034186851 / first attempt
nonzero inverse         OUTSIDE THIS FROZEN CYCLE
CA-20 acceptance        NOT ELIGIBLE
```

# STUDY — COMPLETE

## S1 — Exact successful first-attempt formal evidence

```text
workflow        BOMA C Selected Pair Ring Core 001 — V5
run             32574270735
job             97034186851
event           pull_request / draft PR #5
source commit   a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb
source blob     ef95f9d9a2b202a4c60f68ecf3c5f282097c52f7
Lean            leanprover/lean4:v4.32.1
permissions     contents: read
result          COMPLETED / SUCCESS
```

The checkout-provenance guard, exact four-manifest assembly, forbidden-dependency guard, and complete Lean compilation all passed on the first attempt. The prior boundary and independent route-probe workflows also passed again on this exact commit.

## S2 — Frozen-target results

```text
C4-01  PASS  CBOMA aliases the verified PairCandidate record; c_ext declares identity
C4-02  PASS  cZero/cOne/cNeg/cAdd/cMul/cOfR and injective real embedding
C4-03  PASS  c_zero_ne_one from accepted real nontriviality
C4-04  PASS  additive commutative-group laws and involutive negation
C4-05  PASS  multiplication associativity, commutativity, left/right identity
C4-06  PASS  both distributivity directions and both zero-annihilation directions
C4-07  PASS  cOfR preserves zero, one, negation, addition, multiplication
C4-08  PASS  cI²=-1, generation, coordinate uniqueness, non-real collapse
C4-09  PASS  exact R + C-boundary + Route P + selected-core assembly
C4-10  PASS  CPairRingCoreCertificate explicitly excludes multiplicative inversion
```

The producer contains 33 Lean theorem declarations and one explicitly scoped ring-core certificate. Scalar helper lemmas are derived from the abstract `RStageIntegrationCertificate`; no Dedekind internals, completeness, density, Archimedean property, Route Q, explicit classical principle, global inverse selector, or new axiom is consumed.

The successful assembled log contains existing upstream linter warnings and 11 non-fatal unused-simp-argument warnings in the new proof-engineering normalizers. These warnings are not proof failures and are recorded without changing an exactly verified source merely for cosmetic cleanup.

## S3 — Precise acceptance boundary

```text
selected carrier / partial C-BLOCK-001    PRODUCED / V5 PASS
faithful embedding / imaginary generator  PRODUCED / V5 PASS
coordinate generation / uniqueness        PRODUCED / V5 PASS
commutative-ring strength                 PRODUCED / V5 PASS
nonzero complex inverse                   NOT PRODUCED
complex field Claim                       PARTIAL / NOT ACCEPTED
representation-neutral comparison         NOT PRODUCED
final C integration / CA-20               NOT ELIGIBLE
```

# ACT — CLOSED / OPEN PDSA-C-005

Freeze a separate `PDSA-C-005` cycle for conjugation, the sum-of-squares norm, constructive denominator nonzeroness, and unique existential inverse witnesses. Do not infer a full field, completed comparison, final C acceptance, or permission to merge from this ring-core run.

```text
C-DP-001    RESOLVED / C-ROUTE-P SELECTED
C-ROUTE-Q   RETAINED
CA-20       NOT ELIGIBLE
```
