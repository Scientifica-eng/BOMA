# JUNCTION LEDGER — Convergence Strength and Shared Outputs

**Document ID:** `BOMA-JUNCTION-LEDGER-001`  
**Status:** ACTIVE / SYNCHRONIZED THROUGH ACCEPTED C + PERMANENT VERIFIED ALTERNATIVE JUNCTIONS  
**Date:** 2026-08-24  
**Program lineage:** `PDSA-ARCH-002`; Learning-to-Construction integration under `BOMA-ST2-LEARNING-INTEGRATION-001`.

## 1. Purpose

Index canonical acceptance Junctions and permanent verified alternative-construction Junctions by the **actual strength of convergence** they certify.

A Junction is not inferred from a drawing, and a shared informal name is not convergence evidence.

Strength vocabulary:

```text
EQUALITY
EQUIVALENCE
CLASSIFICATION
SAME-DOWNSTREAM-ADEQUACY
SAME-CARRIER-INTEGRATION
R-FIELD-ISOMORPHISM
CANONICALITY GATE
INTERFACE-RECONVERGENCE / PROVENANCE-DIVERGENCE
```

Acceptance role and convergence strength are independent dimensions. A Junction
may be permanent and fully verified without being an acceptance Junction.

## 2. Junction inventory

| Junction | Incoming routes/contributions | Convergence strength | Architectural role |
|---|---|---|---|
| `TCT-J-001` | selected terminal recovery + `TCT-BR-010` structural identity + derived terminal preservation | `CANONICALITY GATE` | predecessor/terminal recovery well-defined up to `≈` |
| `N-J-001` | internal no-confusion Route A + TCT-constructional Route B | `SAME-DOWNSTREAM-ADEQUACY` | accepted no-confusion contribution without erasing producer histories |
| `N-J-002` | N kernel, no-confusion, induction/generatedness, recursion/initiality, TCT bridge, standardness | `SAME-CARRIER-INTEGRATION` | N-Core acceptance integration |
| `N-ADD-J-001` | right-recursive `addR` + independently left-recursive `addL` | `EQUALITY` | canonical addition eligibility |
| `N-MUL-J-001` | right-recursive `mulR` + independently left-recursive `mulL` | `EQUALITY` | canonical multiplication eligibility |
| `N-ORD-J-001` | additive-gap witness order + independent inductive order | `EQUIVALENCE` | same order relation |
| `N-ARITH-J-001` | accepted addition, multiplication, order packages | `SAME-CARRIER-INTEGRATION` | accepted N-Arithmetic interface |
| `Z-J-001` | signed normal forms + difference pairs/`~` | `EQUIVALENCE + CLASSIFICATION` | exact signed round trip and pair classification |
| `Z-ARITH-J-001` | direct signed arithmetic + pair-mediated arithmetic | `EQUALITY` | pointwise equality before canonical spelling |
| `Z-ORD-J-001` | direct signed order + pair cross-sum order | `EQUIVALENCE` | same accepted integer order |
| `Z-J-002` | carrier/identity, ring, embeddings/generation, order/compatibility | `SAME-CARRIER-INTEGRATION` | `ZA-21` integration |
| `Z-RE-J-001` | Z-only reconstructed N candidates + frozen bottom-up N/N-Arithmetic | `INTERFACE-RECONVERGENCE / PROVENANCE-DIVERGENCE` | reverse-learning Junction; interface reconstruction without original provenance |
| `Q-J-002` | quotient carrier/identity, algebra, inverse witnesses, embeddings, generation, order | `SAME-CARRIER-INTEGRATION` | `QA-23` rational integration |
| `R-J-002` | identity/Q embedding/order, algebra/inverse, completeness, density, Archimedean Claims | `SAME-CARRIER-INTEGRATION` | accepted R integration / `RA-22` eligibility |
| `C-J-001` | selected pair witness field + quadratic comparison + nine-Claim closure | `SAME-CARRIER-INTEGRATION` | accepted C integration / `C-CL-INTEGRATION-001` |
| `ST2-EXP-002-PQ-J-001` | selected Route P field + independently completed Route Q field | `R-FIELD-ISOMORPHISM` | **PERMANENT VERIFIED ALTERNATIVE-CONSTRUCTION JUNCTION / NON-ACCEPTANCE**; preserves embedded R and I |
| `ST2-EXP-003-R-J-001` | selected Dedekind R producer + independently completed Cauchy R producer | `R-FIELD-ISOMORPHISM` | **PERMANENT VERIFIED ALTERNATIVE-CONSTRUCTION JUNCTION / NON-ACCEPTANCE**; preserves rationals/order/field structure |

## 3. Acceptance Junctions versus permanent alternative Junctions

Acceptance Junctions certify the selected forward acceptance path:

```text
R-J-002  accepted selected-R integration
C-J-001  accepted selected-C integration
```

The Stage-Two-derived Junctions certify a different architectural fact:

```text
ST2-EXP-002-PQ-J-001
  selected C Route P ↔ independently completed Route Q

ST2-EXP-003-R-J-001
  selected Dedekind R ↔ independently completed Cauchy R
```

They are now permanent objects in the Construction DAG because the convergence
they establish is a durable fact about representation robustness.

They remain **non-acceptance Junctions**:

```text
permanent ≠ selected
verified ≠ accepted export
isomorphic producers ≠ identical production history
```

## 4. `ST2-EXP-002-PQ-J-001`

Current classification:

```text
Convergence strength    R-FIELD-ISOMORPHISM
Graph status            PERMANENT VERIFIED ALTERNATIVE-CONSTRUCTION JUNCTION
Acceptance role         NONE
Selected route          C-ROUTE-P remains selected
Alternative             C-ROUTE-Q remains non-selected
```

The Junction does not replace `C-J-001` and does not alter `CA-20`.

## 5. `ST2-EXP-003-R-J-001`

Current classification:

```text
Convergence strength    R-FIELD-ISOMORPHISM
Graph status            PERMANENT VERIFIED ALTERNATIVE-CONSTRUCTION JUNCTION
Acceptance role         NONE
Selected route          R-ROUTE-D / Dedekind remains selected
Alternative             R-ROUTE-C / Cauchy remains non-selected
```

Exact proof root:

`BOMA.R.StageTwo.DedekindCauchyJunction003.dedekindCauchyResearchJunctionCertificate`.

Historical exact Junction evidence:

```text
source head 7604590e73425b68de5500042d57f0a1c3abcde3
run         32718925270
artifact    9516996491
sha256      0bec7afedf24e52cf8fd4ea04360b42f42c689e28d2fdfb54c52217f0f5f43e0
```

Final synchronized exact-head re-verification before experiment merge:

```text
head        3d4ed58e5d88b2a0bd84b3958cac2c8572385152
run         32727267177
artifact    9520005288
sha256      3ecf85142656442bad312ace22e62266a15de534fd228c106075247367cdbf34
```

The permanent graph classification does not change that evidence or its research provenance.

## 6. ST2-EXP-001 deliberately has no Junction

`ST2-EXP-001` tested `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` by replacing an
over-bundled R package with the exact sixteen-field interface consumed by C.

It did not create two mathematical carriers or producers requiring a convergence
Junction. Its integrated result is a **refined dependency contract**, not a
fabricated Junction.

This distinction is required by:

```text
meeting ≠ Junction
successful experiment ≠ Junction by default
```

## 7. Provenance rule

For every Junction:

```text
reconvergence ≠ retroactive identity of production history
```

The repository retains incoming route identities, route-local assumptions,
route-local evidence, translation/equality/equivalence proof, and reopening conditions.

Permanent integration of a Junction into the Construction DAG adds current-state
visibility; it does not erase its PDSA origin.

## 8. Claim and Learning-Graph linkage

Principal accepted Claim links remain:

```text
N-J-001       → N-CL-NOCONF-CONV-001
N-J-002       → N-CL-INTEGRATION-001
N-ADD-J-001   → NAR-CL-ADDCONV-001
N-MUL-J-001   → NAR-CL-MULCONV-001
N-ORD-J-001   → NAR-CL-ORDERCONV-001
N-ARITH-J-001 → NAR-CL-INTEGRATION-001
Z-J-001       → Z-CL-REPCONV-001
Z-ARITH-J-001 → Z-CL-ARITHCONV-001
Z-ORD-J-001   → Z-CL-ORDERCONV-001
Z-J-002       → Z-CL-INTEGRATION-001
Q-J-002       → Q-CL-INTEGRATION-001
R-J-002       → R-CL-INTEGRATION-001
C-J-001       → C-CL-INTEGRATION-001
```

The permanent alternative-construction Junctions are **not fabricated into
accepted Claim ownership**. Their exact experimental evidence remains linked
through Stage-Two origin and Study/Act records.

## 9. Reopening rule

Retest a Junction if a change affects an incoming producer, the compared output,
the identity/equivalence regime, a route-local assumption used by the proof, the
certificate implementing convergence, or the exact verification assembly.

Changing which route is selected does not erase the existing Junction; it may,
however, change its acceptance relevance and requires Decision review.

## 10. Current boundary

```text
R selected route                    R-ROUTE-D / DEDEKIND
R accepted integration              R-J-002
R accepted export                   R-BLOCK-001
R permanent alternative             R-ROUTE-C / Cauchy
R alternative Junction              ST2-EXP-003-R-J-001
C selected route                    C-ROUTE-P
C selected producer                 C-BLOCK-001
C accepted integration              C-J-001
C accepted export                   C-BLOCK-002 / CA-20
C permanent alternative             C-ROUTE-Q
C alternative Junction              ST2-EXP-002-PQ-J-001
ST2-EXP-001                         CLOSED / PASS / dependency lesson integrated
ST2-EXP-002                         CLOSED / PASS / branch+Junction integrated
ST2-EXP-003                         CLOSED / PASS / branch+Junction integrated
NO ACTIVE EXPERIMENT
```

Architecture integration authority:

`LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`.
