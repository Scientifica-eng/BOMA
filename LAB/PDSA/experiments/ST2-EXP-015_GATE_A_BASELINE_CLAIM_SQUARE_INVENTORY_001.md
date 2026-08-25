# ST2-EXP-015 — Gate A Baseline / Claim / Route-Square Inventory 001

**Status:** `DO EVIDENCE / SOURCE-LEVEL INVENTORY / EXACT V5 VERIFICATION REQUIRED LATER`  
**Program:** `ST2-RP-001`  
**Frozen synchronized main:** `2a6c38af70e596c840ef2db4733421bde38f3ee5`  
**Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-015_CAUCHY_ROUTE_COMPOSITION_SQUARE.md`  
**Frozen Plan commit:** `1accee613630ae876b6ca9dcf820737ab89a168c`  
**Origin:** `DECISION_POINT / C-DP-001`.

## 1. Gate-A purpose

Before any new Lean construction, bind the exact controls required by the
immutable 015 Plan and classify the lower-right square corner without assigning
any premature PASS status to 015 mathematics.

The single changed scientific factor remains:

```text
fixed scalar producer: RCBOMA / Cauchy
control C realization: C-ROUTE-P / pair
experimental realization: C-ROUTE-Q / syntax -> canonical normal form -> quotient
```

No scalar-producer, logical-regime, accepted-target, queue, SELECTS, accepted
export, or acceptance-contract change is present in this inventory.

## 2. Exact frozen baseline

```text
main commit   2a6c38af70e596c840ef2db4733421bde38f3ee5
meaning       post-ST2-EXP-014 routine merge
014 merge     CLOSED / PASS / RESEARCH ONLY
015 plan      1accee613630ae876b6ca9dcf820737ab89a168c
claim index   LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md
claim blob    16570cc8ca6d2b43ef21ed167915cfb5a1eb56bc
```

The accepted architecture at this baseline still has `R-DP-001 SELECTS
R-ROUTE-D` and `C-DP-001 SELECTS C-ROUTE-P`. Route Cauchy and Route Q remain
research alternatives.

## 3. Exact Cauchy Route-P control roots (014 corner C/P)

The fixed C/P control is rooted in the already verified H6/011/014 sources on
the frozen main:

| Role | Path | Frozen-main blob |
| --- | --- | --- |
| Cauchy Route-P field/control | `LAB/payloads/lean/CStage/ST2Exp003CauchyQuadraticRebuild.lean` | `832b27a9d8d542fd72d4ec4c2ccca2106a84d52f` |
| generic comparison infrastructure | `LAB/payloads/lean/CStage/ST2Exp011GenericQuadraticComparison.lean` | `fd6b224be238f27f5566c1ba9e372f0971781f27` |
| native Cauchy P presentation/extractor | `LAB/payloads/lean/CStage/ST2Exp011CauchyH6Comparison.lean` | `72fe0a3e2067d51897661f1893ffc0da91a3097a` |
| full nine-Claim C/P package | `LAB/payloads/lean/CStage/ST2Exp014CauchyNativeFullC.lean` | `c3f3ca2b8d3fd47e6fe7be555acd5ff41e462c3f` |
| 014 native input manifest | `LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_014_CAUCHY_NATIVE_FULL_C_INPUTS.txt` | `3f4dfe5996a7fdd85c889ff21c0c4ed9b891ef8f` |
| 014 lifecycle closure | `LAB/PDSA/experiments/ST2-EXP-014_LIFECYCLE_CLOSURE_001.md` | `b21a1dbe65d4d37837e727bde95c0cbd312c0207` |

014 final exact closure evidence is preserved as run `32874585252`, job
`97889361868`, artifact `9573385989`, SHA-256
`a1970dfdb989428d4e6cb95f80bab4a202d7ede123a6c6b3578919d610f5661f`.
These are controls only; 015 must not use the P field as a shortcut to construct
Q.

## 4. Exact historical Dedekind Route-Q roots (002 corner D/Q)

The following current-main files are historical design/external-control roots,
not 015 implementation producers:

| Path | Frozen-main blob |
| --- | --- |
| `LAB/payloads/lean/CStage/CRouteQuadraticQuotientProbe001.lean` | `56086636bf646eefddce97b90071edd9aada61fa` |
| `LAB/payloads/lean/CStage/ST2Exp002QNormalRoute.lean` | `5a9794781fe8b86181a12d451ee943298b130fe9` |
| `LAB/payloads/lean/CStage/ST2Exp002QNormalCore.lean` | `528d318af243e0d3b0d11f86885032027f97512f` |
| `LAB/payloads/lean/CStage/ST2Exp002QNormalNormInverse.lean` | `2cace6948967a2ec6bee2519ac2c26a175c40af9` |
| `LAB/payloads/lean/CStage/ST2Exp002QQuotientField.lean` | `2e510fb64052ecbe78f30de8cf369227ad963217` |
| `LAB/payloads/lean/CStage/ST2Exp002PQJunction.lean` | `4db11d1629ca102a39f5bfaf021852ed0d477044` |

Historical 002 exact evidence record:

```text
file                  LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_002_VERIFIED_EVIDENCE_RUN_32597030998.json
blob                  6d91b19b6b822046d4297803d5b35f6bcae46872
verified source head  2d8077a5403fca6de930a13add88038b3fe89eec
V5 run                32597030998 / success
artifact              9481837137
```

015 may reuse only the mathematical schema of syntax/normalization/quotient and
the already-declared trusted quotient infrastructure. None of the above Q
producers may occur in the independent 015 Q implementation closure.

## 5. Exact 011 comparison roots

The comparison layer available only after independent Q closure is:

```text
LAB/payloads/lean/CStage/ST2Exp011GenericQuadraticComparison.lean
  blob fd6b224be238f27f5566c1ba9e372f0971781f27

LAB/payloads/lean/CStage/ST2Exp011CauchyH6Comparison.lean
  blob 72fe0a3e2067d51897661f1893ffc0da91a3097a

LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_011_CAUCHY_H6_COMPARISON_INPUTS.txt
  blob 8759d497c427603bcbbfdf2bc662563fbaf6962b
```

Role boundary:

```text
independent Q construction   MUST NOT depend on h6Presentation/h6Extractor
post-completion comparison   MAY use 011 generic layer + h6Presentation/h6Extractor
functional P<->Q map         REQUIRES explicit Q extractor; no relation-to-function shortcut
```

## 6. Nine-Claim target inventory

All nine identifiers are present in the canonical frozen-main
`CLAIM_REGISTRY.md` and remain accepted under their existing producers.
015 treats them only as semantic targets.

| Claim | 015 role before Lean evidence | Required new 015 content? |
| --- | --- | --- |
| `C-CL-CARRIER-001` | `NATIVE_Q_MATHEMATICS / UNVERIFIED` | genuine quotient/syntax carrier and equality |
| `C-CL-REMBED-001` | `NATIVE_Q_MATHEMATICS / UNVERIFIED` | faithful `RCBOMA` embedding and preservation |
| `C-CL-FIELD-001` | `NATIVE_Q_MATHEMATICS / UNVERIFIED` | native ring/field and witness-only inverse closure |
| `C-CL-I-001` | `NATIVE_Q_MATHEMATICS / UNVERIFIED` | native Q generator with `I^2=-1` |
| `C-CL-GEN-001` | `NATIVE_Q_MATHEMATICS / UNVERIFIED` | Q coordinate generation |
| `C-CL-COORDUNIQ-001` | `NATIVE_Q_MATHEMATICS / UNVERIFIED` | Q coordinate uniqueness |
| `C-CL-NONREAL-001` | `NATIVE_Q_MATHEMATICS / UNVERIFIED` | Q generator non-reality |
| `C-CL-COMPARE-001` | `015_Q_ADAPTER + 011_INFRASTRUCTURE / UNVERIFIED` | native Q presentation/extractor, then 011 comparison |
| `C-CL-INTEGRATION-001` | `015_RESEARCH_PACKAGING / UNVERIFIED` | research-only nine-Claim/full-C package |

No row above is a 015 PASS at Gate A.

## 7. Four-corner square inventory

| Corner | Scalar route | C route | Evidence status at Gate A |
| --- | --- | --- | --- |
| D/P | `R-ROUTE-D / Dedekind` | `C-ROUTE-P` | `ACCEPTED CONTROL / CA-20` |
| D/Q | `R-ROUTE-D / Dedekind` | `C-ROUTE-Q` | `ST2-EXP-002 VERIFIED RESEARCH CONTROL` |
| C/P | `R-ROUTE-C / Cauchy` | `C-ROUTE-P` | `ST2-EXP-014 VERIFIED RESEARCH CONTROL` |
| C/Q | `R-ROUTE-C / Cauchy` | `C-ROUTE-Q` | `ST2-EXP-015 TARGET / UNVERIFIED` |

Current square classification:

```text
OPEN_LOWER_RIGHT_CORNER_UNVERIFIED
```

This is the planned starting state, not a failure.

## 8. Gate-A dependency and sequence classification

Source inspection finds no need to change:

```text
RCBOMA scalar producer
quadratic target meaning
logical/foundational regime
witness-only inversion semantics
relation/function firewall
program queue 014 -> 015 -> 016 -> 017
accepted/selected architecture
```

The quotient/setoid infrastructure required by the frozen Route-Q representation
was already classified as trusted formalization infrastructure in 002; reusing
that infrastructure does not add a new object-level principle.

No sequence-critical prerequisite is identified by Gate A. Therefore the next
legal scientific action is Gate B: construct the independent Cauchy-native
Route-Q carrier/normalization/quotient using RCBOMA sources only, while preserving
the Frozen Plan and all exclusion firewalls.

## 9. Verification posture

This record is source-level Do evidence. Final Gate-A PASS and all later Claim
PASS classifications require the exact-head 015 V5 workflow required by Gate G.
Any later discovery that native C/Q needs Dedekind/002 implementation transport,
H5 transport, Route-P field transport, a changed scalar factor, or a new logical
principle must be classified under the immutable predeclared failure classes
rather than repaired by changing this Plan.
