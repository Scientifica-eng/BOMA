# ST2-EXP-014 — Lifecycle Closure 001

**Experiment:** `ST2-EXP-014 / Cauchy-Native Full C Closure`  
**Program:** `ST2-RP-001 — Compositionality and Minimality of the R→C Boundary`  
**Date:** `2026-08-25`  
**Architectural origin:** `DEPENDENCY_EDGE / BOMA-C-R-DEP-001`  
**Frozen accepted reference:** `fff2400b65b2c9a260fb28defd907ce24387cb80`  
**Immutable Frozen Plan commit:** `788ae14649f3245fd8d6ccd43f90038ffba7762b`  
**Verified mathematical/recovery head:** `57fcc2797ae7670725d6c9ffd8659c9034a47d32`  
**Verified Final Study/Act head:** `1e08cb127fc6aa5483706a913d24932f4d6a1f31`  
**Final Study/Act:** `LAB/PDSA/experiments/ST2-EXP-014_FINAL_STUDY_ACT_001.md`  
**Closure classification:** `CLOSED / PASS` **only when the exact commit containing this record passes the required exact-head V5 and PR regressions**  
**Machine phase while that verification is pending:** `CLOSING`  
**Acceptance effect:** `NONE`.

## 1. Closure rule

This document is the immutable lifecycle-closure record for `ST2-EXP-014`.
Because exact-head evidence cannot be transferred from an ancestor to a new
commit, merely committing this file does not by itself close the lifecycle.

The lifecycle becomes `CLOSED / PASS` only if all of the following are true for
the exact commit containing this record and the synchronized current-state
updates committed with it:

```text
exact 014 V5 head == checked-out head
Frozen Plan remains byte-identical to commit 788ae146...
accepted Q/R/C controls remain frozen
native nine-Claim Cauchy full-C proof still elaborates
native dependency closure still excludes H5/Dedekind implementation transport
relation/function selector firewall still passes
program and architecture regressions pass
PR-wide required control workflows pass
no unresolved deviation exists
no OWNER_REQUIRED condition exists
```

If any of those conditions fails, this file records an attempted closure but the
lifecycle remains open and the failure must be classified under the immutable
Frozen Plan. No later text in this document overrides that fail-closed rule.

## 2. Frozen scientific boundary preserved

The experiment changed exactly one scientific factor:

```text
C Route-P scalar producer
  accepted control: Dedekind RBOMA
  experimental:     Cauchy RCBOMA
```

The following remained fixed controls:

```text
C Route-P carrier/operation meaning
all nine accepted C Claim meanings as the target surface
R-DP-001 SELECTS R-ROUTE-D
C-DP-001 SELECTS C-ROUTE-P
R-BLOCK-001 accepted export
C-BLOCK-002 / CA-20 accepted export
accepted Q/R/C manifests and manifest-listed mathematical sources
witness-only inversion semantics
relation-level comparison != functional comparison
a functional comparison requires explicit CoordinateExtractor data
no hidden global scalar/coordinate/inverse selector
```

No Frozen-Plan edit, Claim-cone expansion, second scientific factor, new
foundational principle, or new logical principle was required.

## 3. Scientific result carried into closure

The verified Final Study/Act classifies the experiment as `PASS`.

The exact nine-Claim decomposition is:

```text
H6 / ST2-EXP-003 already verified
  C-CL-CARRIER-001
  C-CL-REMBED-001
  C-CL-FIELD-001
  C-CL-I-001
  C-CL-GEN-001
  C-CL-COORDUNIQ-001
  C-CL-NONREAL-001

ST2-EXP-011 already verified
  C-CL-COMPARE-001

ST2-EXP-014 integration packaging only
  C-CL-INTEGRATION-001
```

Therefore all nine accepted C Claim meanings are reproducible at the tested
research surface over `RCBOMA/Cauchy` with C Route P fixed. Seven mathematical
families are inherited from H6, comparison is inherited from 011, and 014 adds
only the explicit full-C integration/package root.

This is a compositionality/producer-substitutability result. It is not an
acceptance promotion.

## 4. Native provenance boundary

The 014 native mathematical implementation excludes:

```text
ST2Exp003DedekindCauchyFieldIsomorphism.lean
H5 cToD / dToC implementation transport
RStageIntegration002.lean
selected Dedekind implementation sources
accepted-RBOMA comparison adapter
```

The successful exact verification at the mathematical and Study/Act heads
passed the native manifest/declaration-closure audit and selector firewall.
H5/003 therefore remains an external reconvergence/control oracle, not a native
implementation dependency of the 014 certificate.

## 5. Preserved technical recovery provenance

The first exact-head V5 attempt failed before the Lean mathematical proof at the
Gate-A Claim-ID audit:

```text
failed head  d343296bbec4b29551c5fff50460e1448d20e495
run          32868716783
job          97870289875
artifact     9571153627
sha256       a24e38d5fcc0cea44914b77145060b7776c4e397c1870ab4219d808d5dbe846b
```

The defect was a verification-harness root mismatch: `C-CL-*` identifiers were
looked up in `C_ACCEPTANCE_SPECIFICATION.md` instead of the canonical
`CLAIM_REGISTRY.md` Claim-ID index.

The correction changed only that audit root and preserved the same nine-Claim
gap matrix, accepted specification as frozen control, Frozen Plan, scientific
factor, Claim cone, accepted architecture, and logical regime.

Failure provenance is preserved in:

`LAB/PDSA/experiments/ST2-EXP-014_FAILURE_001_GATE_A_CLAIM_REGISTRY_AUDIT.md`.

## 6. Verified evidence before closure commit

### Mathematical/recovery head

```text
head      57fcc2797ae7670725d6c9ffd8659c9034a47d32
push V5   run 32871967220
job       97880895470
artifact  9572405158
sha256    752c40fe676374d69dc2b0ddbd9ddc0b41c34de4f05124dd04fbbf1b9cd48264
result    SUCCESS

PR #20 exact-head V5
run       32871997517
job       97880997127
artifact  9572419736
sha256    83da30e2bff76459959ee36676618203769c50f90470c6f608836b16f2574417
result    SUCCESS
```

### Final Study/Act head

```text
head      1e08cb127fc6aa5483706a913d24932f4d6a1f31
push V5   run 32873847016
job       97886976028
artifact  9573108354
sha256    31259ff1547842f165be99ee8c913453df002b64eb49c34ae99561ad3fb92e73
result    SUCCESS
```

The Study/Act head also had no observed failing or still-running PR control
workflow at the closure decision point.

These ancestor results establish readiness to attempt lifecycle closure. They do
not substitute for exact verification of the commit containing this closure
record.

## 7. Study obligations — closure disposition

The seven Frozen-Plan Study obligations close as follows:

```text
1. all nine accepted C Claim meanings reproducible over RCBOMA       YES
2. root ownership H6 / 011 / 014 classified                         YES
3. native mathematical 014 root requires H5/Dedekind transport      NO
4. H6 seven-Claim result strengthened to full nine-Claim surface     YES / BOUNDED
5. mathematical vs packaging vs external-comparison roles separated YES
6. coherent Cauchy Route-P baseline exists for ST2-EXP-015          YES
7. sequence-critical prerequisite discovered before 015             NO
```

The predeclared `F14` stop condition is therefore not triggered by 014 evidence.

## 8. Acceptance and canonical-selection firewall

Closure explicitly does **not** authorize:

```text
selecting R-ROUTE-C
accepting R-ROUTE-C
replacing R-BLOCK-001
changing R-DP-001 SELECTS
changing C-DP-001 SELECTS
selecting C-ROUTE-Q
replacing C-BLOCK-002 / CA-20
changing the C acceptance contract
promoting the 014 research certificate to an accepted producer
```

Successful research evidence remains research evidence until a separate
canonical/acceptance authority says otherwise.

## 9. Durable program knowledge

Subject to exact closure-head verification, the durable bounded lesson is:

```text
With C Route-P meaning fixed, the complete accepted nine-Claim C semantic
surface is reproducible over independently verified Cauchy RCBOMA without
H5/Dedekind implementation transport. Seven Claim families come from H6, the
comparison family comes from ST2-EXP-011, and only the integration package is
new in ST2-EXP-014.
```

This knowledge may be integrated into program/Construction-DAG explanatory
records under `ST2-RP-001` routine authority, provided selected routes, accepted
exports, and acceptance contracts remain unchanged.

## 10. 014 → 015 transition assessment

The program manifest requires before 015:

```text
LIFECYCLE_CLOSED
EXACT_EVIDENCE_COMPLETE
CAUCHY_SCALAR_QUADRATIC_BASELINE_REMAINS_COHERENT_FOR_P_TO_Q_SINGLE_FACTOR_TEST
NO_SEQUENCE_CRITICAL_PREREQUISITE_DISCOVERED
```

At the moment this closure record is committed, the latter two scientific
conditions are satisfied by Study/Act, while the first two become satisfied only
when the exact closure head completes the required CI and the routine merge is
performed without invalidating the baseline.

Therefore:

```text
014 scientific transition premise      PASS
014 closure exact-head verification     REQUIRED / PENDING AT COMMIT TIME
014 routine merge                       ALLOWED ONLY AFTER FINAL EXACT PASS
015 activation                          NOT YET
015 Plan freeze                         NOT YET
```

After a successful exact closure-head verification and routine merge, the agent
must re-read synchronized `main` and evaluate the transition gate again. Only
then may it create an independent 015 branch and Frozen Plan.

## 11. Closure decision

If the exact commit containing this record passes every required closure gate:

```text
ST2-EXP-014 LIFECYCLE:                    CLOSED / PASS
SCIENTIFIC RESULT:                        PASS
RESEARCH EVIDENCE RETAINED:               YES
ACCEPTANCE PROMOTION:                     NONE
SELECTS CHANGE:                           NONE
ACCEPTED EXPORT/CONTRACT CHANGE:           NONE
UNRESOLVED DEVIATION:                     NONE
OWNER_REQUIRED:                           NO
F14:                                      NOT TRIGGERED
NEXT PROGRAM ACTION:                      ROUTINE MERGE EXACT VERIFIED HEAD
POST-MERGE ACTION:                        RE-READ MAIN → 014→015 TRANSITION GATE
```

Until that exact verification succeeds, the machine state remains `CLOSING` and
no claim that the exact closure head is verified is permitted.
