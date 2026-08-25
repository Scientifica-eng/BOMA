# ST2-EXP-004 Gate E — Downstream C Sensitivity 001

**Experiment:** `ST2-EXP-004`  
**Gate:** `E — downstream C sensitivity`  
**Disposition:** `PASS / NINE C CLAIM FAMILIES CLASSIFIED / GATE F NEXT`  
**Frozen accepted reference:** `50f3031b8d2657cbe0710e73e5935d997d40e49b`  
**Frozen Plan commit:** `89c9dc9154e7ca469e5c94c177be223205ee9dbd`  
**Verified exact head:** `cf16d0e8f0285c69bc3b8af3da7659efe50f4ac6`

## 1. Alternative interface

Gate E defined a research interface containing exactly the ST2-EXP-001 sixteen-property C-production surface minus only:

```text
orderTotal
```

All other fifteen properties remain. No accepted source or accepted manifest was edited.

## 2. Exact evidence

```text
head      cf16d0e8f0285c69bc3b8af3da7659efe50f4ac6
run       32834398515
job       97759935428
artifact  9558047502
sha256    a6c206d597aadba6905551239b978bf89fa9480ef1b98ec6ba02dbe4f1a384f9
result    SUCCESS / GATE_E_PASS
```

Alternative survivor closure:

```text
internal declarations       498
external boundary            74
dependency edges           5302
unresolved                    0
unmapped internal ranges      0
internal axioms               0
```

ST2-EXP-001 baseline field/integration audit:

```text
internal declarations       778
external boundary            76
dependency edges           9248
unresolved                    0
unmapped internal ranges      0
internal axioms               0
```

## 3. Nine-family matrix

| C Claim family | Uses `orderTotal` directly/transitively | Survives 15-field interface | Another removed property? |
|---|---|---|---|
| `C-CL-CARRIER-001` | NO | YES | NO |
| `C-CL-REMBED-001` | NO | YES | NO |
| `C-CL-FIELD-001` | YES / transitive | NO | NO |
| `C-CL-I-001` | NO | YES | NO |
| `C-CL-GEN-001` | NO | YES | NO |
| `C-CL-COORDUNIQ-001` | NO | YES | NO |
| `C-CL-NONREAL-001` | NO | YES | NO |
| `C-CL-COMPARE-001` | NO | YES | NO |
| `C-CL-INTEGRATION-001` | YES / transitive | NO | NO |

Thus seven of nine accepted C Claim families are robust to removing this one logical provider from the production interface.

## 4. Field/integration sensitivity

The verified ST2-EXP-001 proof closure contains the projection:

```text
BOMA.C.StageTwo.NarrowRInterface001.NarrowROrderedFieldCertificate.orderTotal
```

for the square-nonnegative / pair-field / integration path. The critical branch is the familiar sign split used to establish nonnegativity of real squares, which feeds the pair norm and inverse witness argument.

This does not prove that no alternative field proof could ever avoid totality. It establishes that the current accepted/narrow proof architecture does not survive the interface with `orderTotal` removed.

## 5. Comparison negative control

`C-CL-COMPARE-001` survives. The Gate-E local pair presentation instantiates the ST2-EXP-011 generic comparison contract using only scalar operations and coordinate laws; no order field is required.

Therefore:

```text
C production field closure needs orderTotal in current proof architecture
!=
C comparison semantics needs orderTotal
```

This preserves the distinction learned in ST2-EXP-011.

## 6. Final disposition

**Gate E final disposition:** `PASS / NINE C CLAIM FAMILIES CLASSIFIED / GATE F NEXT`.

Gate F must now consolidate logical-cost evidence: selected F-04 presence/absence, other classical commitments, quotient/propositional extensionality costs, explicit hypotheses, and internal-axiom status.