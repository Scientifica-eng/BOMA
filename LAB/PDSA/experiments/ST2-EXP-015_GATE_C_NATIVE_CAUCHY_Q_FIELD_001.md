# ST2-EXP-015 Gate C — Native Cauchy Route-Q Field Closure

**Experiment:** `ST2-EXP-015`  
**Program:** `ST2-RP-001`  
**Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-015_CAUCHY_ROUTE_COMPOSITION_SQUARE.md`  
**Frozen Plan commit:** `1accee613630ae876b6ca9dcf820737ab89a168c`  
**Frozen main reference:** `2a6c38af70e596c840ef2db4733421bde38f3ee5`  
**Gate-C exact result:** `PASS`  
**Exact verified head:** `8b8d8413a3638eb8f4f4d738d3cf1a2a12c866bd`  
**V5 run:** `32890748451`  
**V5 job:** `97941857655`  
**Artifact:** `9579342082`  
**Artifact SHA-256:** `f393c585bbbc0ff438010b6d6d1dad2da434d3ad39a7676b0b7a2f67540b690e`.

---

## Frozen scientific factor

Gate C continued the one frozen 015 factor only:

```text
fixed scalar producer      RCBOMA / Cauchy
control C realization      C-ROUTE-P
experimental realization   C-ROUTE-Q
```

No scalar, quotient identity, target Claim meaning, route selection, accepted
export, acceptance contract, logical regime, or queue position changed.

---

## Independent native field result

Gate-C source:

```text
LAB/payloads/lean/CStage/ST2Exp015CauchyQField.lean
```

Independent field manifest:

```text
LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_015_CAUCHY_Q_FIELD_INPUTS.txt
```

The field manifest is exactly the verified Gate-B independent manifest followed
by the Gate-C field source. The exact-head V5 verified that it excludes
Dedekind, ST2-EXP-002, H5, H6/CCBOMA, ST2-EXP-011, and ST2-EXP-014
implementation producers.

Pinned Lean verified the native Route-Q package over the Gate-B
`CauchyQBOMA` quotient, including:

```text
commutative additive laws
commutative multiplicative laws
associativity and distributivity
zero/one and additive inverse laws
faithful scalar embedding and preservation of zero/one/neg/add/mul
I² = -1
generation
coordinate uniqueness
I not real
canonical conjugation and real norm
norm nonnegativity
nonzero norm from a nonzero Q value
witness-only nonzero inverse existence
inverse-witness uniqueness
CauchyQRingCertificate
CauchyQFieldCertificate
```

Inverse existence is derived from the fixed Cauchy scalar's
`rC_inverse_exists` applied to the canonical norm. No Route-P↔Q transport was
used to manufacture field closure and no global inverse selector was defined.

---

## Selector / logical provenance classification

The new ST2-EXP-015 Route-Q sources contain no literal `Classical.choose` and no
direct 015 declaration edge to `Classical.choose` or `Classical.choose_spec`.

The full transitive closure necessarily exposes historical choice provenance
inside the fixed, independently verified RCBOMA producer. Exact audit classified
those inherited edges inside the already frozen Cauchy modules:

```text
BOMA.R.StageTwo.CauchyApproximation003
BOMA.R.StageTwo.CauchyInverse003
BOMA.R.StageTwo.CauchyLUBSequence003
BOMA.R.StageTwo.CauchyScale003
```

This is inherited scalar implementation provenance, not a new 015 quotient
representative, coordinate, or inverse selector. The recovery and distinction
are preserved in:

```text
ST2-EXP-015_FAILURE_002_GATE_C_INHERITED_CHOICE_AUDIT_FALSE_POSITIVE.md
```

The earlier proof-script failure is separately preserved in:

```text
ST2-EXP-015_FAILURE_001_GATE_C_DUPLICATE_REWRITE.md
```

---

## Exact-head V5 result

On head `8b8d8413a3638eb8f4f4d738d3cf1a2a12c866bd` all workflow stages passed:

```text
exact head / baseline / Frozen Plan identity             PASS
owner-program authority and active 015 state             PASS
accepted Q/R/C manifest/source immutability              PASS
Gate A inventory                                         PASS
Gate B source/manifest firewall                          PASS
Gate B Lean + declaration closure                        PASS
Gate C source/manifest firewall                          PASS
Gate C native ring/field Lean elaboration                PASS
Gate C independent declaration closure                   PASS
new/direct 015 Classical.choose edge                     NONE
inherited frozen RCBOMA choice provenance                CLASSIFIED
program-governance regression                            PASS
architecture-consistency regression                      PASS
```

Therefore Gate C is `EXACT PASS` at its frozen scope.

This result proves independent native Route-Q field-strength closure over the
fixed Cauchy RCBOMA scalar producer. It does **not** establish the complete
nine-Claim Gate-D package, the Cauchy P↔Q Gate-E reconvergence, or the final
four-corner square classification; those remain later frozen gates.

No acceptance promotion follows from this result.
