# ST2-EXP-014 — Final Study / Act 001

**Experiment:** `ST2-EXP-014 / Cauchy-Native Full C Closure`  
**Program:** `ST2-RP-001 — Compositionality and Minimality of the R→C Boundary`  
**Date:** `2026-08-25`  
**Architectural origin:** `DEPENDENCY_EDGE / BOMA-C-R-DEP-001`  
**Frozen accepted reference:** `fff2400b65b2c9a260fb28defd907ce24387cb80`  
**Immutable Frozen Plan commit:** `788ae14649f3245fd8d6ccd43f90038ffba7762b`  
**Exact mathematical verification head:** `57fcc2797ae7670725d6c9ffd8659c9034a47d32`  
**Single changed factor:** selected C Route-P scalar producer `RBOMA / Dedekind` → independently verified `RCBOMA / Cauchy`  
**Mathematical result:** `PASS`  
**Disposition:** `DURABLE PROGRAM KNOWLEDGE / RESEARCH-ONLY / NO ACCEPTANCE PROMOTION`

## 1. Question studied

`ST2-EXP-014` asks whether all nine accepted C Claim meanings can be reproduced
natively over the independently verified Cauchy real producer `RCBOMA` while
holding the selected C Route-P quadratic meaning fixed.

The experiment changes only the scalar producer supplied to that fixed
quadratic construction:

```text
accepted control
  Dedekind RBOMA + C Route P

experimental factor
  Cauchy RCBOMA + the same C Route-P meaning
```

The following remain controls throughout the experiment:

```text
C Route-P carrier/operation meaning
the nine accepted C Claim meanings
accepted Q/R/C sources and manifests
R-DP-001 SELECTS R-ROUTE-D
C-DP-001 SELECTS C-ROUTE-P
R-BLOCK-001 / C-BLOCK-002 / CA-20
witness-only inversion semantics
relation comparison != functional comparison
no hidden global scalar/coordinate/inverse selector
```

The answer is **yes at the exact tested research surface**.

## 2. Gate A — exact nine-Claim inventory

The pre-CI source inventory classified the nine target Claim families as:

```text
7 Claim families  H6_ALREADY_VERIFIED
1 Claim family    011_ALREADY_VERIFIED
1 Claim family    014_INTEGRATION_ONLY
```

The exact mapping is:

| Claim | Native source/root | Verified role in 014 |
| --- | --- | --- |
| `C-CL-CARRIER-001` | `CCBOMA` | H6 already verified |
| `C-CL-REMBED-001` | `ccOfR`, `cc_ofR_injective`, H6 embedding laws | H6 already verified |
| `C-CL-FIELD-001` | `cauchyQuadraticFieldCertificate` | H6 already verified |
| `C-CL-I-001` | `ccI`, `cc_i_squared` | H6 already verified |
| `C-CL-GEN-001` | `cc_generation` | H6 already verified |
| `C-CL-COORDUNIQ-001` | `cc_coordinate_unique` | H6 already verified |
| `C-CL-NONREAL-001` | `cc_i_not_real` | H6 already verified |
| `C-CL-COMPARE-001` | `ComparisonInterface011.NativeCauchy` + generic `quadraticComparison` | 011 already verified |
| `C-CL-INTEGRATION-001` | `CauchyNativeFullC014.cauchyNativeFullCCertificate` | 014 integration packaging only |

The successful exact-head workflow independently verified the Gate-A inventory,
accepted-source immutability, Frozen-Plan immutability, and native source
elaboration. It did not expose a tenth Claim obligation, a new scalar law, a new
selector, or a second mathematical construction.

## 3. Native full-nine-Claim integration

Research source:

`LAB/payloads/lean/CStage/ST2Exp014CauchyNativeFullC.lean`.

The 014 source does not rebuild H6 mathematics. It packages the already verified
H6 Cauchy quadratic field content together with the already verified
ST2-EXP-011 native comparison interface.

The full research root is:

```text
BOMA.C.StageTwo.CauchyNativeFullC014.cauchyNativeFullCCertificate
```

Its package includes:

```text
Cauchy quadratic field certificate
I² = -1
real-coordinate generation
coordinate uniqueness
I not real
relation-level quadratic comparison
functional comparison only from explicit CoordinateExtractor data
```

Explicit Claim-root aliases keep the semantic audit independent of incidental
structure projection names.

The successful exact-head workflow proved that the native full-C certificate
elaborates under the pinned Stage-Two Lean toolchain and that its declaration
closure satisfies the experiment's source/provenance audits.

## 4. H5 / Dedekind implementation independence

The native 014 mathematical manifest forbids implementation dependence on:

```text
ST2Exp003DedekindCauchyFieldIsomorphism.lean
H5 cToD / dToC transport
RStageIntegration002.lean
selected Dedekind implementation sources
accepted-RBOMA comparison adapter
```

The exact V5 workflow passed the native-manifest separation and declaration
closure checks. Therefore no mathematical root newly introduced by 014 requires
H5 transport or selected Dedekind implementation provenance.

This does **not** assert that Dedekind and Cauchy have identical provenance.
H5/003 remains valid external reconvergence evidence; it is not a native
implementation dependency of the 014 result.

## 5. Relation/function and witness firewalls

The native relation-level comparison remains distinct from a chosen global map.
The 014 functional comparison has the form:

```text
(B : QuadraticPresentation cauchyScalarOps)
(E : CoordinateExtractor B)
→ ConstructiveQuadraticIsomorphism h6Presentation B
```

Thus existence/uniqueness is not silently converted into a global selected
coordinate function. Functional comparison requires explicit extractor data.

The exact workflow also passed the selector firewall. No new hidden
`Classical.choose`, global coordinate selector, or inverse selector is introduced
by the 014 experimental source.

Field inversion remains witness-oriented through the already verified H6 field
certificate; 014 does not change that semantic boundary.

## 6. Preserved technical failure provenance

The first exact-head V5 attempt failed at:

```text
failed head  d343296bbec4b29551c5fff50460e1448d20e495
run          32868716783
job          97870289875
artifact     9571153627
sha256       a24e38d5fcc0cea44914b77145060b7776c4e397c1870ab4219d808d5dbe846b
```

The failure occurred in the Gate-A audit harness because it searched for
`C-CL-*` identifiers in `C_ACCEPTANCE_SPECIFICATION.md`, while the repository's
canonical Claim-ID index is `CLAIM_REGISTRY.md`.

Exact-head, Frozen-Plan, authority, and accepted-source immutability checks had
already passed before that harness failure; the Lean mathematical proof had not
yet run.

The correction at `57fcc2797ae7670725d6c9ffd8659c9034a47d32` changed only the
audit root: the acceptance specification remains an immutable accepted control,
while Claim-ID membership is checked against `CLAIM_REGISTRY.md` and the frozen
014 Gate-A inventory. The Frozen Plan, scientific factor, Claim cone, accepted
architecture, and logical regime were unchanged.

The failed provenance remains preserved in:

`LAB/PDSA/experiments/ST2-EXP-014_FAILURE_001_GATE_A_CLAIM_REGISTRY_AUDIT.md`.

## 7. Exact successful evidence

### 7.1 Push exact-head V5

```text
head      57fcc2797ae7670725d6c9ffd8659c9034a47d32
workflow  BOMA ST2-EXP-014 Cauchy-Native Full C — V5
run       32871967220
job       97880895470
artifact  9572405158
sha256    752c40fe676374d69dc2b0ddbd9ddc0b41c34de4f05124dd04fbbf1b9cd48264
result    SUCCESS
```

### 7.2 Pull-request exact-head V5

```text
PR        #20
head      57fcc2797ae7670725d6c9ffd8659c9034a47d32
run       32871997517
job       97880997127
artifact  9572419736
sha256    83da30e2bff76459959ee36676618203769c50f90470c6f608836b16f2574417
result    SUCCESS
```

Both exact-head jobs passed:

```text
exact checkout / head equality
frozen baseline ancestry
Frozen Plan ancestry and byte immutability
owner program authority and active experiment state
accepted Q/R/C manifest/source immutability
Gate-A nine-Claim inventory
native manifest separation
relation/function selector firewall
pinned Lean setup
native nine-Claim Cauchy full-C certificate
native declaration closure
program and architecture regressions
artifact preservation
```

The PR-triggered historical/control workflows observed for the exact PR head also
completed successfully, including Stage-Two governance, architecture
consistency, accepted C regression controls, ST2-EXP-003 controls, and
ST2-EXP-011 comparison-interface controls.

## 8. Study obligation 1 — are all nine accepted C Claim meanings reproducible?

**Yes.**

The experiment does not claim accepted status for the Cauchy realization. It
establishes that the exact semantic Claim surface currently accepted for C can
be reproduced on the Cauchy scalar producer under the frozen Route-P meaning.

The result is therefore a producer-substitutability result at the tested C
Claim-meaning boundary, not a canonical-route promotion.

## 9. Study obligation 2 — which roots come from H6, 011, and 014?

The verified decomposition is:

```text
H6 / ST2-EXP-003
  C-CL-CARRIER-001
  C-CL-REMBED-001
  C-CL-FIELD-001
  C-CL-I-001
  C-CL-GEN-001
  C-CL-COORDUNIQ-001
  C-CL-NONREAL-001

ST2-EXP-011
  C-CL-COMPARE-001

ST2-EXP-014
  C-CL-INTEGRATION-001
  = explicit integration/package root over the already verified H6 + 011 roots
```

No additional mathematical Claim family was required.

## 10. Study obligation 3 — does any 014 mathematical root require H5/Dedekind provenance?

**No as an implementation dependency.**

The native manifest/declaration closure excludes H5 transport and selected
Dedekind/RStage implementation producers, and the exact workflow passed that
exclusion audit.

H5/003 may still serve as external comparison/reconvergence evidence. That role
is scientifically different from native construction.

## 11. Study obligation 4 — does 014 strengthen the H6 result?

**Yes, in a precisely bounded sense.**

H6 established seven core C Claim families natively over Cauchy R. 011 later
supplied the compatible native comparison boundary. 014 demonstrates that those
previously separate verified results compose into the complete nine-Claim C
meaning surface without importing the selected Dedekind implementation path.

Thus the evidence strengthens:

```text
H6: seven-Claim native Cauchy rebuild
```

to:

```text
014: full nine-Claim native Cauchy accepted-interface-meaning rebuild
```

It does not strengthen the result into an acceptance or SELECTS decision.

## 12. Study obligation 5 — mathematical dependency vs packaging vs external comparison

The evidence separates the roles as follows:

### Mathematical dependency

```text
independent RCBOMA/Cauchy real route
H6 Cauchy quadratic carrier/field/coordinate mathematics
ST2-EXP-011 generic/native Cauchy comparison interface
```

### Formal packaging in 014

```text
CauchyNativeFullCCertificate
cauchyNativeFullCCertificate
explicit Claim-root aliases / integration surface
```

### External comparison only

```text
H5 Dedekind↔Cauchy field-isomorphism evidence
selected Dedekind-side implementation ancestry
```

The third category is useful for robustness/reconvergence but is not needed to
construct the native 014 certificate.

## 13. Study obligation 6 — is the baseline coherent for ST2-EXP-015?

**Yes.**

014 supplies exactly the prerequisite needed by the owner-authorized next queue
entry: a verified Cauchy scalar/quadratic Route-P baseline with the full nine C
Claim meanings represented.

Therefore 015 can still isolate its own single changed factor:

```text
Cauchy scalar producer fixed
C realization Route P → Route Q
```

without conflating the result with the real-producer substitution already tested
by 014.

## 14. Study obligation 7 — did a sequence-critical prerequisite appear before 015?

**No.**

The exact evidence exposed one technical Gate-A audit-root defect, which was
repaired inside the immutable Frozen Plan and then verified. It exposed no new
scientific prerequisite, no missing mathematical Claim family, no requirement
to change the queue, and no condition requiring a new experiment before 015.

Therefore the predeclared `F14` sequence-critical stop condition is **not
triggered** by the 014 evidence.

This conclusion authorizes only the ordinary 014 lifecycle transition gate after
014 closure. It does not start or freeze 015 in this record.

## 15. Architectural interpretation

### Established

1. The full tested C Claim-meaning surface is compositionally reproducible over
   the independently verified Cauchy real producer while Route P is fixed.
2. H6's seven core families and 011's comparison family compose without H5 as a
   native implementation path.
3. The ninth integration family requires only an explicit 014 package/root, not
   new C mathematics.
4. The relation/function firewall and witness-only inversion discipline survive
   producer substitution.
5. Producer identity and accepted provenance are not prerequisites for this
   exact research-level C Claim-surface reconstruction.
6. A coherent Cauchy + Route-P baseline exists for the authorized 015 route
   factor experiment.

### Not established

```text
R-ROUTE-C selected                                   NO
R-ROUTE-C accepted                                   NO
R-BLOCK-001 replaced                                 NO
C-ROUTE-P selection changed                          NO
C-ROUTE-Q selected                                   NO
C-BLOCK-002 / CA-20 replaced                         NO
accepted C acceptance contract changed               NO
Dedekind and Cauchy provenance identified            NO
route independence beyond the tested configuration   NO
generic K[i] result                                  NO
```

## 16. ACT

### Mathematical result

`ST2-EXP-014 = PASS`.

### Experimental code disposition

Retain the 014 Cauchy-native full-C source, manifest, Gate records, failure
provenance, workflow, and evidence as **research-only verified evidence**.

Do not substitute them for accepted R or C producers and do not modify any
SELECTS edge or Stage-One acceptance record.

### Durable program knowledge

Integrate the following bounded knowledge under the existing
Learning-to-Construction rules:

```text
With C Route-P meaning fixed, the accepted nine-Claim C semantic surface is
reproducible over independently verified Cauchy RCBOMA without H5/Dedekind
implementation transport. Seven Claim families are inherited from H6, the
comparison family from ST2-EXP-011, and only the integration package is new in
ST2-EXP-014.
```

This knowledge is a compositionality/substitutability fact. It is not an
acceptance promotion and does not justify a new Block, Decision Point, Junction,
or canonical route selection by itself.

### Sequence disposition

After lifecycle closure and exact verification of the closure head, evaluate the
program's `014 → 015` transition gate against synchronized current `main`.

On the evidence available at this Study/Act checkpoint:

```text
coherent Cauchy Route-P baseline             YES
015 remains scientifically meaningful        YES
015 prerequisites remain satisfied           YES
sequence-critical new prerequisite            NO
OWNER_REQUIRED condition                      NO
transition candidate                          AUTO_CONTINUE AFTER 014 CLOSURE
```

No 015 Plan is created or frozen in this Study/Act record.

## Final Study judgment

```text
ST2-EXP-014 MATHEMATICAL RESULT:                 PASS
ALL NINE ACCEPTED C CLAIM MEANINGS:              REPRODUCIBLE NATIVELY OVER RCBOMA
H6 CORE CLAIM FAMILIES:                          7 / VERIFIED REUSED
ST2-EXP-011 COMPARISON FAMILY:                   1 / VERIFIED REUSED
014 NEW MATHEMATICAL CLAIM FAMILY:               0
014 INTEGRATION PACKAGING FAMILY:                1
H5/DEDEKIND NATIVE IMPLEMENTATION DEPENDENCY:    NOT REQUIRED
RELATION/FUNCTION FIREWALL:                      PRESERVED
WITNESS-ONLY INVERSION BOUNDARY:                 PRESERVED
NEW GLOBAL SELECTOR:                             NO
FROZEN PLAN CHANGED:                             NO
SINGLE SCIENTIFIC FACTOR CHANGED:                ONE / AS FROZEN
ACCEPTED Q/R/C SOURCES OR MANIFESTS CHANGED:     NO
SELECTED ROUTES / ACCEPTED EXPORTS CHANGED:      NO
ACCEPTANCE CONTRACT CHANGED:                     NO
F14 SEQUENCE-CRITICAL PREREQUISITE:              NOT TRIGGERED
PERMANENT PROGRAM KNOWLEDGE:                     YES / BOUNDED
AUTOMATIC ACCEPTANCE PROMOTION:                  NO
NEXT EXPERIMENT CANDIDATE:                       ST2-EXP-015 AFTER FULL 014 CLOSURE
```
