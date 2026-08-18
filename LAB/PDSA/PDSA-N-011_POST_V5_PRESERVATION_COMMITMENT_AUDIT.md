# PDSA-N-011 — Post-V5 Preservation & Commitment Audit

**CycleID:** `PDSA-N-011`  
**Track:** Natural Numbers / N-Core Integration  
**Date:** 2026-08-18  
**Status:** **CLOSED — PASS WITH EXPLICIT SCOPE**

## Research question

After successful claim-level V5 verification, do NAC-13 and NAC-14 remain satisfied once all actual formalization commitments—including the scope correction exposed by failed verification—are made explicit?

## Inputs

```text
BOMA-N-ACCEPT-001 v1.0
calibrated TCT path through TCT-BLOCK-005
BOMA-N-DAG-001
N-DP-001
N-DP-002
BOMA-RB-FORMAL-001
BOMA-RB-FORMAL-CORR-001
V5 run 32163771789
V5_THEOREM_OWNERSHIP.md
N-RB-CAND-001-LEDGER-001
N-J-001 PASS
```

---

# DO — NAC-13 preservation audit

## Preservation matrix

| Pre-numerical TCT contribution | Formal treatment | Class | Evidence / interpretation |
|---|---|---|---|
| `ε` base role | `z` | REPRESENTED / TRANSLATED | `N-BR-012`, V5 `realize_eps` |
| terminal extension `ExtU` | `s` under realization | REPRESENTED + STRENGTHENED | `N-BR-013`; local schema becomes global formal constructor only after new carrier commitment |
| BR-010 structural equivalence `≈` | selected-NF presentation identity in backend scope | REPRESENTED / TRANSLATED | `N-BR-014`, backed by pre-numerical selected-NF theorem; V5 preservation witness |
| equivalence discrimination / faithfulness | formal equality reflects selected presentation identity | DERIVED FORMALLY | `N-BR-015`, V5 |
| canonical decomposition | outer-constructor / reification reconstruction interface | REPRESENTED / DERIVED AGAIN | `N-BR-016`, `reify_realize`, `realize_reify`, V5 |
| structural iteration history | constructor ancestry commuting with `reify` / `extU` | REPRESENTED / TRANSLATED | `N-BR-017`; base is `reify z = eps`, step is `reify (s n)=extU(reify n)`, plus inverse reconstruction; V5 |
| empty exclusion | `s(n) ≠ z` | DERIVED AGAIN FORMALLY + CROSS-PATH VERIFIED | `N-BR-004`, `N-BR-018`, `N-J-001`; V4+V5 |
| extension injectivity | `s(a)=s(b) ⇒ a=b` | DERIVED AGAIN FORMALLY + CROSS-PATH VERIFIED | `N-BR-005`, `N-BR-018`, `N-J-001`; V4+V5 |
| local generated-presentation discipline | global inductive generatedness | STRENGTHENED BY NEW FORMAL COMMITMENT | `N-BR-007`; V5 `Generated/all_generated` |
| no fixed point / explicit meta-finite-chain acyclicity | not imported as an independent N-Core premise | NOT USED AS PRIMITIVE; COMPATIBLE WITH STRONGER FORMAL PACKAGE | formal N-Core acceptance relies on no-confusion + generatedness + inductive ancestry; no claim that the TCT proof itself became a primitive axiom |

## Structural-history scope

The preservation claim is structural, not numerical:

```text
reify(z)   = eps
reify(s n) = extU(reify n)
```

Together with:

```text
realize(reify n) = n
reify(realize A) = A
```

this gives a commuting recursive correspondence between selected TCT construction ancestry and formal constructor ancestry without defining a numeric depth.

## Acyclicity classification

The project does **not** need to re-import TCT explicit-chain acyclicity as a new formal axiom. It is classified `NOT USED AS PRIMITIVE` in the N-Core acceptance route.

This is acceptable under NAC-13 because the obligation is accounting, not forced duplication of every earlier proof. The relevant anti-collapse role is discharged by the stronger verified package:

```text
no-confusion
generatedness
faithful reconstruction
inductive constructor ancestry
```

If later work needs a reusable formal acyclicity theorem as its own contribution, it must receive a separate Brick rather than being claimed implicitly here.

## NAC-13 conclusion

```text
NAC-13 = PASS
```

Reason: every required TCT contribution is explicitly classified, translated or deliberately not used as a primitive, with no silent replacement of the constructional ancestry.

---

# DO — NAC-14 commitment audit

## Active new formal commitments

### C1 — Global carrier

```text
BOMANat : Type
```

New formal/globality commitment.

### C2 — Fresh inductive formation

```text
z : BOMANat
s : BOMANat → BOMANat
```

The inductive declaration is selected at the R-B formalization boundary. It is not derived from TCT.

### C3 — Formal identity

Lean/R-B identity on `BOMANat`, distinct from TCT `≡` and `≈`.

### C4 — Sort-polymorphic dependent elimination

Active correction:

```text
P : BOMANat → Sort u
```

This includes proposition-valued induction and Type-valued dependent elimination. The scope was made explicit through `N-DP-002` after the first failed V5 run.

### C5 — Global function formation

Functions over the completed formal carrier, including `s`, `fold`, realization/reification functions, and homomorphisms.

### C6 — Recursion target scope

`fold` remains polymorphic for target types `X : Type u`.

### C7 — Unary-algebra universe policy

Explicitly selected at `N-DP-002`:

```text
PointwiseInitial A
  quantifies over same-universe UnaryAlgebra.{u}

bomaAlg : UnaryAlgebra.{0}
  hence canonical Stage-One bomaAlg initiality is Type-0 scoped

pointwise_initial_unique
  is same-universe polymorphic
```

Heterogeneous cross-universe initiality is not silently assumed and remains a possible later strengthening branch.

### C8 — Backend verification regime

Pinned Lean 4.32.1 is verification infrastructure, not the mathematical definition. The successful run records the exact toolchain.

## Principles checked and not required by the current proofs

No explicit use was introduced of:

```text
classical excluded middle
choice
quotient types
function extensionality
univalence
propositional truncation
built-in Lean Nat as carrier
numeric depth/cardinality as a primitive
set-membership ontology
```

The producer uses no external mathematical import to obtain these claims; the relevant constructions are expressed in the selected Lean/R-B core environment.

Backend tactics such as `simp_all`, `cases`, and `induction` are proof elaboration mechanisms, not added object-level axioms.

## Commitment discovered through failure

The key new learning is not a new axiom but a previously under-specified **universe/sort policy**. It is now first-class via `N-DP-002` and `BOMA-RB-FORMAL-CORR-001`.

This satisfies the BOMA rule that checker convenience must not silently determine foundational scope.

## NAC-14 conclusion

```text
NAC-14 = PASS
```

All currently material Stage-One formalization commitments identified by the successful proof path are recorded explicitly.

---

# STUDY

1. Formalization preserved constructional ancestry without pretending TCT itself already contained a completed carrier.
2. Some TCT results are **re-derived** in the formal regime rather than logically inherited wholesale; provenance remains separate.
3. The first V5 failure materially improved NAC-14 by exposing the universe/sort choice.
4. “Not used as a primitive” is a legitimate and more precise preservation classification than falsely claiming direct transport.
5. V5 success did not erase the failed runs; the failures are part of the Learning Graph that explains the final scope.

# ACT

```text
NAC-13  PASS
NAC-14  PASS
N-J-001 PASS / RESOLVED
```

`N-J-002` is now eligible to move from pre-audit preparation to a **final integration audit**, but is not automatically PASS.

NAC-15 remains a separate later decision.
