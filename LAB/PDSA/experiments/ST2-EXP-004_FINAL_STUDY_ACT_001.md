# ST2-EXP-004 — Final Study / Act 001

**Experiment:** `ST2-EXP-004 / R Total-Order Logical Regime`  
**Architectural origin:** `DECISION_POINT / R-DP-003`  
**Immutable Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md`  
**Frozen Plan commit:** `89c9dc9154e7ca469e5c94c177be223205ee9dbd`  
**Frozen accepted reference:** `50f3031b8d2657cbe0710e73e5935d997d40e49b`  
**Changed factor:** remove only selected F-04 `cutComparability_classical / rLE_total_classical` provider from the alternative assembly  
**Mathematical result:** `PASS / EXACT F-04 IMPACT CLASSIFIED`  
**Same-carrier totality recovery:** `NOT RECOVERED WITH CURRENT FROZEN CUT INTERFACE`  
**Canonical acceptance conclusion:** `RETAIN R-DP-003 LOCALIZED CLASSICAL COMPARABILITY FOR STAGE I`  
**Accepted-source modification:** `NO`

This immutable Study/Act records the result of Gates A–F. It does not modify
the Frozen Plan, does not replace the selected real route, and does not change
accepted Q/R/C sources, manifests, `SELECTS`, or `CA-20`.

# 1. Exact evidence chain

| Gate | Exact head | Run | Result |
| --- | --- | ---: | --- |
| A — declaration dependency map | `dc710af7562df620b010c90418685d56cb86bf4d` | `32829479257` | PASS |
| B — no-F04 R survivor assembly | `8cae5a858a50d3d374670a722a8b6e11c8d93d0e` | `32832661497` | PASS |
| C — explicit conditional comparability | `b03419c300e8ffce62a0dfec62faed54923781d4` | `32833676190` | PASS |
| D — same-carrier totality boundary | `7b5057b798bfe1bd5fe3e188a90bf50931021f8c` | `32833979623` | PASS |
| E — C sensitivity without `orderTotal` | `cf16d0e8f0285c69bc3b8af3da7659efe50f4ac6` | `32834398515` | PASS |
| F — consolidated logical cost | `79d58471566df7a11ab73b2436fdd85a007ee87c` | `32834768942` | PASS |

Gate-F artifact:

```text
artifact 9558205572
sha256   eb568cf04971351b80954ee93245bcb9034408477c2cb0e9102e3ebc6db7f543
```

Every decisive gate preserved the Frozen Plan, the frozen accepted Q/R/C
manifests and manifest-listed accepted sources, and the accepted `R-DP-003`
selection.

# 2. Gate A — exact dependency result

The measured declaration matrix contains 55 rows / 50 unique targets:

```text
F04_DIRECT            8
F04_TRANSITIVE        7
F04_FREE             22
OTHER_CLASSICAL_ONLY 18
unresolved            0
internal axioms       0
```

This distinguishes the selected total-order logical commitment from unrelated
or independently inherited classical commitments F-05/F-06/F-07 and from
kernel quotient/propositional extensionality ancestry.

The main directly exposed F-04 sites are the selected total-order witness and
consumers such as positive decomposition and integration packaging. A large
part of the accepted R Claim surface is declaration-level F-04-free.

# 3. Gate B — R survivor assembly

Removing the selected F-04 witness source from a separate whole-source assembly
leaves 77 of 88 accepted-manifest files executable. Sixteen measured accepted R
roots survive that assembly and eighteen do not.

Robust survivors include the carrier/quotient identity, accepted-Q embedding,
partial-order laws, strict-order irrefl, a substantial additive core,
completeness, rational density, and Archimedean material.

Non-survival clusters around selected positive decomposition, signed
multiplication packaging, inverse/ordered-field closure, and final integration.
The experiment explicitly records that whole-source non-survival mixes theorem
dependence with source packaging/co-location and therefore cannot be read as a
mathematical impossibility result.

# 4. Gate C — narrow conditional interface

With an explicit hypothesis

```text
hComp : CutComparability
```

and without the selected F-04 witness, the experiment kernel-checks:

- real totality;
- the accepted sign-decomposition shape;
- a conditional comparison certificate.

This proves that the logical boundary can be represented as an explicit narrow
interface. It does not prove that the interface is constructively inhabited.

# 5. Gate D — same-carrier recovery boundary

On the unchanged accepted representation, Gate D proves constructively:

```text
(∀ x y : RBOMA, rLE x y ∨ rLE y x)
  ↔
CutComparability
```

No new axiom, `Classical.em`, `Classical.byContradiction`, `Classical.choose`,
or abstract comparability hypothesis is used in that equivalence theorem.

The frozen `LowerCut` structure contains only `lower`, `nonempty`, `proper`,
`downward`, and `rounded`; it contains no locatedness/comparability field.
ST2-EXP-004 did not derive an unconditional `CutComparability` inhabitant from
those frozen fields without the selected provider.

Therefore the strong outcome is **not** full constructive totality recovery.
The precise result is:

`NOT_RECOVERED_WITH_CURRENT_CUT_INTERFACE`.

Adding locatedness or changing `LowerCut`, `CutEquiv`, `RBOMA`, or the accepted
order statement would violate the frozen single-factor boundary. Such a design
may only be a separately authorized future candidate.

# 6. Gate E — downstream C impact

ST2-EXP-001 established a sixteen-property mathematical production surface
from R to C. Removing only `orderTotal` leaves a fifteen-property interface.
Gate E measures all nine accepted C Claim families against that exact change.

Seven survive in the tested alternative:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
C-CL-COMPARE-001
```

Two current proof closures do not:

```text
C-CL-FIELD-001
C-CL-INTEGRATION-001
```

The failure path is transitive through the current nonnegative-square/norm
argument. `C-CL-COMPARE-001` remains robust because ST2-EXP-011 already showed
that quadratic comparison needs only scalar `zero/one/neg/add/mul` plus exact
coordinate data/laws; it does not need scalar order or completeness.

# 7. Gate F — logical-cost comparison

Representative `#print axioms` evidence:

```text
selected accepted rLE_total_classical
  [propext, Classical.choice, Quot.sound]

conditional totality from hComp
  [propext, Quot.sound]

same-carrier totality ↔ CutComparability boundary
  [propext, Quot.sound]

C survivor package without orderTotal
  [propext, Classical.choice, Quot.sound]

ST2-EXP-011 generic quadraticComparison
  no axioms
```

The selected F-04 provider is therefore a real and measurable logical
commitment, but removing it alone does not remove all classical ancestry from
R. In particular F-05/F-06/F-07 remain outside the changed factor and are not
silently reclassified.

# 8. Failure evidence preserved

Six execution failures remain retained as first-class evidence:

1. `ST2-EXP-004_FAILURE_001_GATE_B_PROVENANCE_MARKER_CASE.md`;
2. `ST2-EXP-004_FAILURE_002_GATE_B_STDERR_NOT_CAPTURED.md`;
3. `ST2-EXP-004_FAILURE_003_GATE_B_INTERNALDECL_FIELD_MISMATCH.md`;
4. `ST2-EXP-004_FAILURE_004_GATE_B_DECLARATION_TO_SOURCE_CLOSURE_GAP.md`;
5. `ST2-EXP-004_FAILURE_005_GATE_C_DEPENDENCY_AUDIT_STDERR_NOT_CAPTURED.md`;
6. `ST2-EXP-004_FAILURE_006_GATE_C_LOCAL_NAME_TYPO.md`.

They are tooling/elaboration/provenance-observability failures. None weakens the
frozen mathematical question, and none is rewritten as a mathematical failure.

# 9. STUDY conclusion

ST2-EXP-004 answers its research question with a qualified PASS:

1. F-04 is not a diffuse requirement of the entire accepted R construction;
   large partial-order and completion/density/Archimedean regions are robust
   without the selected provider.
2. The logical interface needed to recover the selected disjunctive totality
   can be isolated exactly as `CutComparability`.
3. On the unchanged carrier/order, real totality is constructively equivalent
   to that cut-comparability proposition.
4. The current frozen `LowerCut` interface did not yield an unconditional
   constructive proof of that proposition in this experiment.
5. Downstream C is substantially robust: seven of nine accepted C Claim
   families survive removal of `orderTotal`; current field/integration proof
   closures do not.
6. The comparison layer is especially robust and confirms the ST2-EXP-011
   separation between production and comparison interfaces.
7. Removing F-04 alone is not equivalent to making R constructive, because
   independent classical commitments remain.

The experiment therefore provides **exact dependency localization and
partial-order robustness**, not a replacement accepted total-order construction.

# 10. ACT

```text
ST2-EXP-004 MATHEMATICAL RESULT:             PASS / EXACT IMPACT CLASSIFIED
FULL SAME-CARRIER CONSTRUCTIVE TOTALITY:      NOT RECOVERED
R-DP-003 SELECTED STAGE-I LOGICAL REGIME:     RETAIN
F-04 SELECTED PROVIDER:                       RETAIN IN ACCEPTED EXPORT
R-BLOCK-001:                                  UNCHANGED
BOMA-C-R-DEP-001 SIXTEEN-PROPERTY SURFACE:    UNCHANGED
C-DP-001 / C-ROUTE-P:                         UNCHANGED
C-BLOCK-001 / C-J-001 / C-BLOCK-002 / CA-20: UNCHANGED
NEW BLOCK / DECISION / JUNCTION:              NO
AUTOMATIC ACCEPTANCE PROMOTION:               NO
```

The durable construction lesson is architectural, not a new accepted theorem
route:

- distinguish the **partial-order core** from the selected **disjunctive
  totality provider** inside the existing `R-DP-003` regime;
- record F-04 as a localized provider rather than as a property implicitly
  required by every R Claim;
- preserve the distinction between ST2-EXP-001's sixteen-property C production
  surface and ST2-EXP-011's much narrower comparison surface;
- record that current C field/integration proofs use `orderTotal` transitively,
  while comparison does not;
- treat any located-cut redesign as a separate future candidate, never as an
  in-place continuation of this experiment.

The owner has instructed completion of the remaining lifecycle and durable
architecture integration, with an explicit stop before any new experiment.
Accordingly the next lifecycle action is closure and merge of ST2-EXP-004;
after a separate Learning-to-Construction integration, the Stage-Two active
slot must be `NONE`. No next experiment is authorized, activated, branched, or
frozen by this Study/Act.
