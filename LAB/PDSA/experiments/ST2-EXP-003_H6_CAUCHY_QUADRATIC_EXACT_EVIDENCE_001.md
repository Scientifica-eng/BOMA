# ST2-EXP-003 — H6 Cauchy-Real Quadratic Rebuild Exact Evidence 001

**Experiment:** `ST2-EXP-003`  
**Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-003_INDEPENDENT_CAUCHY_REAL_ROUTE.md`  
**Frozen Plan commit:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`  
**Accepted baseline:** `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`  
**H6 status:** `EXACT PASS`  
**Acceptance effect:** `NONE / RESEARCH ONLY`

## Purpose

H6 tests the downstream consequence of changing only `R-DP-001`: can the
selected quadratic complex meaning be rebuilt **natively** over the independently
completed Cauchy real carrier `RCBOMA`, without importing the accepted Dedekind
producer or transporting accepted C wholesale through the H5 comparison map?

The mathematical H6 assembly is deliberately restricted to:

```text
ST2_EXP_003_CAUCHY_INDEPENDENT_INPUTS.txt
+
ST2_EXP_003_CAUCHY_QUADRATIC_REBUILD_INPUTS.txt
```

The exact research R Junction is an execution/governance ancestor only. Dedekind
and H5 comparison sources are not mathematical inputs to this downstream C
assembly.

## H6 source and rebuilt meaning

Research source:

`LAB/payloads/lean/CStage/ST2Exp003CauchyQuadraticRebuild.lean`

Research downstream manifest:

`LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_003_CAUCHY_QUADRATIC_REBUILD_INPUTS.txt`

Final root:

```text
BOMA.C.StageTwo.CauchyQuadratic003.cauchyQuadraticFieldCertificate
```

The source constructs a fresh pair carrier

```text
CCBOMA = RCBOMA × RCBOMA
```

at structure level and proves, directly over the alternative real operations:

- faithful real embedding `ccOfR`;
- distinguished imaginary generator `ccI`;
- `ccI² = -1`;
- existence and uniqueness of real/imaginary coordinates;
- non-collapse of `ccI` into the embedded real line;
- commutative-ring laws for the pair operations;
- conjugation and the real-valued norm;
- norm nonnegativity and norm nonzeroness for nonzero complex values;
- witness-only nonzero inversion and inverse-witness uniqueness.

The H6 source introduces no global `ccInv`, no `Classical.choose`, no `sorry`,
and no new source `axiom`. Its final certificate also includes the independent
`CauchyLUBCertificate`, so provenance records that the real coefficients come
from the fully completed H4 alternative rather than merely from a partial ring
fragment.

## Preserved probe failure

The first H6 workflow attempt failed **before Lean**:

```text
run        32719533140
job        97407788903
head       7cf5707e2deb2099d00b3481447aaf172044e713
failed     downstream source-boundary text check
mechanism  the guard rejected the English word "Dedekind" in a comment whose
           purpose was precisely to state that Dedekind/H5 are not dependencies
```

This was not a mathematical or typechecking failure. The correction narrowed
the guard to actual dependency names/namespaces (`BOMA.R.Dedekind`,
`RDedekind`, `RStageIntegration002`, accepted-C producer namespaces), while
retaining the rejection of `Classical.choose`, `sorry`, new `axiom`, and a
selected `ccInv` definition.

Corrected guard/source-probe head:

`26dfa399c9474ea8595fac11b375296663305c4e`

## Successful typecheck probe

```text
head       26dfa399c9474ea8595fac11b375296663305c4e
run        32719591156
job        97407963692
result     TYPECHECK PASS ONLY
artifact   9517227995
SHA256     9876b3a4f35c327f2767eaf89271ebba01d41eb6483d9c393f5d31ed68658f37
```

This run established that the entire H6 source elaborates after the independent
Cauchy real manifest. It was intentionally not called H6 mathematical PASS,
because the official dependency root and final target axiom audit had not yet
been elevated to `cauchyQuadraticFieldCertificate`.

## Exact H6 V5 closure

The final V5 gate was elevated at:

`ea5fdb61fcbafb0ece463910c24ef71183443b19`

and succeeded at exactly that head:

```text
exact head   ea5fdb61fcbafb0ece463910c24ef71183443b19
run          32719705824
job          97408301876
artifact     9517267487
artifact     st2-exp-003-h6-cauchy-quadratic-32719705824
SHA256       cf296c8daf92c9cfe9e54986b93b6101ea225aad79c1c7388ad6d3ae13ae5a0e
result       EXACT PASS
Lean         4.32.1
```

The gate verified:

- exact-head checkout;
- accepted baseline ancestry;
- immutable Frozen Plan ancestry/content;
- exact H4 ancestry;
- exact H5 field-isomorphism ancestry;
- exact research R Junction ancestry;
- prior H6 source typecheck ancestry;
- accepted Q/R/C manifests unchanged;
- accepted R producer unchanged;
- all accepted selected-C producers unchanged;
- independent/combined/downstream manifest separation;
- no actual Dedekind/H5 or accepted-C producer dependency in H6 source;
- no `Classical.choose`, `sorry`, new `axiom`, or `ccInv` selector in H6 source;
- Lean elaboration of the independent-R + H6-C assembly;
- `#print axioms` on key H6 claims and the final certificate;
- Stage-C theorem dependency closure rooted at the final certificate;
- artifact preservation.

## Exact logical surface

Lean reports:

```text
cauchyLUBCertificate              [propext, Classical.choice, Quot.sound]
rC_square_nonnegative             [propext, Classical.choice, Quot.sound]
cc_i_squared                       [propext, Quot.sound]
cc_coordinate_unique               [propext, Quot.sound]
cauchyPairRingCertificate          [propext, Classical.choice, Quot.sound]
cc_inverse_exists                  [propext, Classical.choice, Quot.sound]
cc_inverse_unique                  [propext, Quot.sound]
cauchyQuadraticFieldCertificate    [propext, Classical.choice, Quot.sound]
```

The final H6 root therefore does not enlarge the kernel-axiom surface already
observed for H4, H5, and the research Junction. The C-specific coordinate and
inverse-uniqueness proofs themselves have a smaller surface; the final package
inherits `Classical.choice` through the completed alternative-real route and
its ordered/completeness dependencies, not through a new H6 selector.

## Claim boundary

H6 verifies the Frozen Plan's selected quadratic-field meaning over the
alternative real carrier. It does **not** change or replace:

- accepted `R-BLOCK-001 / R-ROUTE-D`;
- selected accepted `C-ROUTE-P` producer files;
- accepted `C-BLOCK-002 / CA-20`;
- `main`.

The accepted `CQuadraticComparison001` layer remains a separate accepted claim
family whose current type is specialized to `RBOMA/RStageIntegrationCertificate`.
H6 does not claim that this representation-neutral comparison API itself has
already been generalized to arbitrary alternative-real interfaces. That is an
architectural follow-up possibility, not a missing proof of the H6 quadratic
core required by the Frozen Plan.
