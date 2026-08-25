# ST2-EXP-004 — Gate A Dependency Map 001

**Experiment:** `ST2-EXP-004`  
**Origin:** `DECISION_POINT / R-DP-003`  
**Gate:** `A — Dependency Map`  
**Disposition:** `PASS / MEASUREMENT COMPLETE / GATE B MAY BEGIN`  
**Date:** `2026-08-25`

## 1. Frozen authority

This record is subordinate to the immutable Frozen Plan:

- accepted reference: `50f3031b8d2657cbe0710e73e5935d997d40e49b`;
- accepted tree: `e4842acdf2b08c8db54b45d0798c36ee7565f351`;
- candidate dossier commit: `fd51041857d07cbf8e489c8683a907ea29866b17`;
- Frozen Plan commit: `89c9dc9154e7ca469e5c94c177be223205ee9dbd`;
- Frozen Plan blob: `1bd97aebb7e36ed5f7647ce29461c9c24b3cc9ba`;
- single changed factor: removal, in a separate research assembly only, of the selected F-04 total-comparability provider `cutComparability_classical / rLE_total_classical`.

F-05/F-06/F-07 and all accepted Q/R/C definitions, manifests, selected routes, exports, and acceptance contracts remain controls.

## 2. Exact-head evidence

Gate A was measured on exact head:

```text
head      0cc785c6a5b1b00c3c004796a23f82d6c1af1f0d
run       32828815533
job       97742703857
artifact  9555962479
sha256    7a04de96adbd1ee2aa2b1dd846850d7a372a7447aab508b516931057178b0bbe
result    SUCCESS
```

The workflow verified before measurement that:

1. the exact checked-out head matched the PR head;
2. the accepted reference and Frozen Plan are ancestors;
3. the Frozen Plan file is byte-identical to the frozen commit;
4. Q/R/C accepted manifests and every manifest-listed accepted source are unchanged from the frozen accepted reference;
5. the protected R order sources, R integration source, ST2-EXP-001 narrow interface, ST2-EXP-011 generic comparison source, `BOMA-C-R-DEP-001`, and `R-DP-003` are unchanged;
6. `ST2-EXP-004` is the single active Stage-Two experiment and points to the independent Frozen Plan above;
7. the target manifest covers every current formal producer in the R and C Claim producer policies, plus the required positive-decomposition, narrow-interface, and generic-comparison controls.

All ten pull-request workflows triggered on this exact head completed without failure; the Gate-A workflow itself completed every step successfully.

## 3. Measurement method

The measurement reuses the repository's existing Lean declaration-closure machinery:

- `LAB/00_ARCHITECTURE/tools/LeanDependencyExtractor.lean`;
- `LAB/00_ARCHITECTURE/tools/lean_dependency_audit.py`.

Target authority:

`LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_004_GATE_A_TARGETS.tsv`.

Each target received an independent transitive declaration closure. The two F-04 roots are exactly:

```text
BOMA.R.DedekindOrderClassical001.cutComparability_classical
BOMA.R.DedekindOrderClassical001.rLE_total_classical
```

Allowed classifications:

- `F04_DIRECT` — target is an F-04 root or directly references one;
- `F04_TRANSITIVE` — target reaches F-04 through other declarations;
- `F04_FREE` — closure contains neither F-04 root nor another detected `Classical.*` declaration;
- `OTHER_CLASSICAL_ONLY` — closure is F-04-free but contains another detected `Classical.*` declaration.

`OTHER_CLASSICAL_ONLY` therefore means **not F-04-dependent**; it does not mean constructive.

## 4. Matrix result

```text
rows                 55
unique targets       50
unresolved rows       0
internal axiom rows   0

F04_DIRECT            8
F04_TRANSITIVE        7
F04_FREE             22
OTHER_CLASSICAL_ONLY 18
```

All required sanity controls passed:

```text
accepted rLE_total_classical       F04_DIRECT
rPosNeg_decomposition              F04_DIRECT
ST2-EXP-001 narrow R interface     F04_DIRECT
ST2-EXP-011 generic comparison     F04_FREE
```

The only non-F-04 `Classical.*` declarations detected across the measured closures were `Classical.em` and `Classical.byContradiction`; these remain outside the changed factor unless a later, separately authorized experiment studies them.

## 5. R Claim-family sensitivity

### F-04-sensitive R Claim families

`R-CL-ORDER-001` is mixed: constructive `rLE_refl`, `rLE_trans`, `rLE_antisymm`, and `rlt_irrefl` are F-04-free, while the accepted totality producer `rLE_total_classical` is `F04_DIRECT`.

`R-CL-MUL-001` is materially F-04-sensitive:

```text
rMulCandidate_assoc
  → rLE_total_classical                                      F04_DIRECT

rMulCandidate_one_left
  → rPosNeg_decomposition
  → rLE_total_classical                                      F04_TRANSITIVE

rMulCandidate_add_right
  → rLE_total_classical                                      F04_DIRECT

rMulCandidate_order_compatible
  → rMulCandidate_mono_right_nonneg
  → rMulCandidate_mono_left_nonneg
  → rMulCandidate_add_right
  → rLE_total_classical                                      F04_TRANSITIVE

rPosNeg_decomposition
  → rLE_total_classical                                      F04_DIRECT
```

`rMulCandidate_comm` is F-04-free but remains `OTHER_CLASSICAL_ONLY` because its closure contains another classical commitment.

`R-CL-INV-001` is F-04-sensitive:

```text
r_inverse_exists_nonzero
  → rLE_total_classical                                      F04_DIRECT

r_inverse_witness_unique
  → rMulCandidate_assoc
  → rLE_total_classical                                      F04_TRANSITIVE

rInverse_positive_of_positive
  → r_inverse_witness_unique
  → rMulCandidate_assoc
  → rLE_total_classical                                      F04_TRANSITIVE
```

`R-CL-FIELD-001` is mixed. `rInverse_positive_of_positive` is F-04-transitive; the measured nontriviality, additive-order translation, and negation-order producers are F-04-free but `OTHER_CLASSICAL_ONLY`.

`R-CL-INTEGRATION-001` is directly F-04-sensitive:

```text
rStageIntegrationCertificate
  → rLE_total_classical                                      F04_DIRECT
```

### R Claim families with no measured F-04 dependency

- `R-CL-CARRIER-001`: all three measured producers are `F04_FREE`;
- `R-CL-QEMBED-001`: F-04-free, but both producers are `OTHER_CLASSICAL_ONLY`;
- `R-CL-NONTRIV-001`: `OTHER_CLASSICAL_ONLY`;
- `R-CL-ADD-001`: three producers `F04_FREE`, three `OTHER_CLASSICAL_ONLY`, none reaches F-04;
- `R-CL-COMP-001`: `rDedekind_lub_exists` is `F04_FREE`;
- `R-CL-DENSITY-001`: F-04-free but `OTHER_CLASSICAL_ONLY`;
- `R-CL-ARCH-001`: `r_archimedean_strict_upper` is `F04_FREE`.

This is the first formal evidence that removing F-04 does **not** collapse the whole accepted-R Claim graph.

## 6. Downstream C sensitivity

### F-04-sensitive C Claim families

`C-CL-FIELD-001` is F-04-transitive through accepted R integration:

```text
cPairFieldCertificateFromAcceptedR
  → rStageIntegrationCertificate
  → rLE_total_classical
```

`C-CL-INTEGRATION-001` is F-04-sensitive:

```text
cStageIntegrationCertificate
  → rStageIntegrationCertificate
  → rLE_total_classical                                     F04_TRANSITIVE

rStageIntegrationCertificate
  → rLE_total_classical                                     F04_DIRECT

narrowRFromAcceptedProducers
  → rLE_total_classical                                     F04_DIRECT
```

The last line confirms the ST2-EXP-001 production interface result precisely: among its exact sixteen real properties, `orderTotal` is an actual F-04 dependency.

### C Claim families with no measured F-04 dependency

- `C-CL-CARRIER-001`: all measured producers `F04_FREE`;
- `C-CL-REMBED-001`: five producers `F04_FREE`; `c_ofR_mul` is `OTHER_CLASSICAL_ONLY`;
- `C-CL-I-001`: `OTHER_CLASSICAL_ONLY`;
- `C-CL-GEN-001`: `OTHER_CLASSICAL_ONLY`;
- `C-CL-COORDUNIQ-001`: `OTHER_CLASSICAL_ONLY`;
- `C-CL-NONREAL-001`: `F04_FREE`;
- accepted `C-CL-COMPARE-001` roots: all F-04-free but `OTHER_CLASSICAL_ONLY`;
- ST2-EXP-011 generic `quadraticComparison`: `F04_FREE`.

Thus the accepted comparison implementation has wider classical provenance than the generic comparison layer, but neither measured comparison root depends on F-04. This agrees with the already integrated ST2-EXP-011 distinction between C production and C comparison surfaces.

## 7. Gate-A interpretation

Gate A answers only the dependency question.

It establishes:

1. F-04 is localized at the total-order decision but has a real downstream cone through positive decomposition, major multiplication laws, inverse, field packaging, R integration, C field packaging, and C integration.
2. The partial-order core and several independent Claim families survive at declaration-closure level without F-04.
3. F-04 removal alone cannot be described as making all of R constructive because eighteen measured rows are F-04-free yet still have other classical provenance.
4. The C comparison layer is outside the F-04 cone measured here; C production/integration is not.

Gate A does **not** establish that every F-04-free declaration can already be assembled in a source manifest that physically excludes the F-04 witness file. That is the purpose of Gate B.

Gate A also does not prove a constructive total order, does not change `SELECTS`, does not promote any alternative, and does not alter accepted exports.

## 8. Gate B authorization within the Frozen Plan

Because Gate A completed with zero unresolved declarations and a nontrivial F-04-free survivor cone, Gate B may proceed exactly as frozen:

- construct a research-only no-F-04 manifest/assembly;
- exclude the selected F-04 provider from that assembly;
- keep F-05/F-06/F-07 and every accepted definition as controls;
- test the measured survivor roots rather than changing their statements;
- classify each test as `SURVIVES_NO_F04`, `DOES_NOT_SURVIVE_NO_F04`, or `NOT_TESTED_BECAUSE_OTHER_FACTOR_REQUIRED`;
- make no acceptance or promotion claim.

**Gate A final disposition:** `PASS / DEPENDENCY MAP VERIFIED / GATE B NEXT`.
