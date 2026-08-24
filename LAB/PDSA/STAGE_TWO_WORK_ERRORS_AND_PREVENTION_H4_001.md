# STAGE_TWO_WORK_ERRORS_AND_PREVENTION_H4_001 — H4 Continuation

**Document ID:** `BOMA-ST2-ERROR-PREVENTION-H4-001`  
**Status:** `ACTIVE / SUPPLEMENTS BOMA-ST2-ERROR-PREVENTION-001`  
**Date:** `2026-08-23`  
**Scope:** `ST2-EXP-003` H4 independent least-upper-bound construction.

This continuation does not rewrite the earlier retained-failure record. It
adds the three error classes discovered after H3 while deriving the exact
bounded-nonempty-family LUB contract on `RCBOMA`.

| ID | Observed error | Evidence / manifestation | Actual cause | Correction | Future preventive control |
| --- | --- | --- | --- | --- | --- |
| `ERR-ST2-033` | The first H4 rational-bracket proof did not normalize the embedded rational zero to the quotient zero alias | Exact V5 run `32641626366` on commit `ac7345bbbc0fe1e3e2e1804fa603e00214922fe6` failed while reducing `rCAdd x (rCOfQ qZero)` to `rCAdd x rCZero` | The quotient wrapper and the named zero alias are definitionally equal, but the surrounding rewrite did not expose that equality automatically | State the conversion explicitly by definitional `rfl`, leaving the mathematical bracket argument unchanged | When a quotient proof crosses named constant wrappers, isolate and prove the definitional carrier equality instead of assuming a larger rewrite will normalize aliases |
| `ERR-ST2-034` | The first H4 sequence certificate could not recover nonempty/bounded hypotheses from anonymous implication binders | Exact V5 run `32643073959` on commit `927028a3e5bd01b6784381546104bf3e5609fb13` failed only in the certificate field type after `h4Lower_cauchy` itself had elaborated | The field type used unnamed arrows and later attempted implicit-term lookup for `hne` and `hUB` | Name the dependent binders explicitly in `CauchyLUBSequenceCertificate.lowerCauchy` | For certificate fields whose result expression depends on preceding proofs, name all proof binders explicitly; do not rely on anonymous-arrow recovery |
| `ERR-ST2-035` | The first full H4 LUB source relied on a natural common-upper-bound theorem through an undeclared namespace side effect | Exact V5 run `32643253314` on commit `63d1dd5988634676b3a4961cc9a64ee3132b482f` failed at the two order-closure lemmas with unknown `common_upper_bound` | An earlier concatenated source happened to use the theorem, but the new H4 namespace did not own/open the declaration explicitly | Add local `h4_common_upper_bound` directly from accepted `le_total` and `le_refl`, and use it in both closure lemmas | Foundational files must either open the exact theorem owner or provide a small locally owned bridge from already accepted primitives; never depend on concatenation-side namespace leakage |

## H4 prevention additions

- Distinguish quotient alias normalization from mathematical equality; prove the
  wrapper conversion locally.
- Name proof-valued dependent binders in certificate interfaces.
- Treat namespace availability as a source-file contract, even when the CI
  concatenates files into one Lean target.
- Keep finite proposition-level search (`Classical.em`) distinct from countable
  data selection (`Classical.choose`) in provenance records.
- H5 comparison is forbidden unless the H4 evidence root remains
  `BOMA.R.StageTwo.CauchyLUB003.cauchyLUBCertificate`, its closure retains zero
  selected Dedekind declarations, and all three H4 failures remain indexed.
