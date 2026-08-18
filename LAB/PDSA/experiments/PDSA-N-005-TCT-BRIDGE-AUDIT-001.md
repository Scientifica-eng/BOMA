# PDSA-N-005-TCT-BRIDGE-AUDIT-001

**Parent cycle:** `PDSA-N-005`  
**Date:** 2026-08-18  
**Status:** **PASS AT ARCHITECTURAL / WRITTEN-PROOF LEVEL — V5 PENDING**

## Purpose

Audit whether the post-boundary backend datatype `TCTNF` faithfully represents the canonical selected TCT normal-form layer and whether the realization into `N_BOMA` preserves and reflects the structural distinctions required by NAC-06 / RB-B01..RB-B05.

Preferred unified payload:

`LAB/payloads/lean/NCore/NCoreRB001.lean`

---

# 1. Layer separation

The audit distinguishes three layers:

```text
LAYER A — CANONICAL TCT
pre-numerical selected presentations and verified structural contributions

LAYER B — BACKEND REPRESENTATION
TCTNF / TCTNFPlus introduced after the formalization boundary

LAYER C — FORMAL N-CORE CANDIDATE
N_BOMA with z and s
```

Classification:

```text
TCTNF REPRESENTS selected TCT NF
TCTNF IS NOT the canonical pre-numerical carrier
N_BOMA REALIZES the selected ancestry under R-B
```

**Layer-separation audit: PASS.**

---

# 2. Grammar representation

Canonical selected grammar:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

Backend grammar:

```text
TCTNFPlus ::= unit | ext(TCTNFPlus)
TCTNF     ::= eps | nonempty(TCTNFPlus)
```

Representation correspondence:

```text
ε                  ↔ eps
U                  ↔ nonempty unit
P ⊙ U              ↔ nonempty (ext p)
```

The backend representation deliberately contains no constructor corresponding to the removed duplicate `ε ⊙ U` selected presentation.

It therefore matches the calibrated canonical selected grammar rather than the historical redundant grammar.

**Grammar representation: PASS.**

---

# 3. RB-B01 — Base preservation

Backend definition:

```text
realize(eps) = z
```

This is the exact formal counterpart of:

```text
ε ↦ z.
```

**RB-B01: PASS at specification/written level; V5 pending.**

---

# 4. RB-B02 — Extension preservation

Backend theorem candidate:

```text
realize(extU(a)) = s(realize(a)).
```

This mirrors:

```text
ExtU(A) ↦ s(ρ(A)).
```

The theorem is definitional/case-structural in the backend and adds no arithmetic interpretation.

**RB-B02: PASS at specification/written level; V5 pending.**

---

# 5. RB-B03 — Structural-equivalence preservation

## Canonical TCT theorem used

PDSA-TCT-004 established on selected normal forms under BR-010:

```text
A ≈ B  ⇒  A ≡ B.
```

BR-010 SE-1 supplies the converse:

```text
A ≡ B  ⇒  A ≈ B.
```

Hence in the selected-NF scope:

```text
A ≈ B  ⇔  A ≡ B.
```

## Backend consequence

`TCTNF` equality represents selected-presentation identity. Therefore the backend theorem:

```text
a = b → realize(a) = realize(b)
```

discharges the representation-level preservation obligation.

### Important limitation

This does **not** redefine global BR-010 structural equivalence as Lean equality on arbitrary TCT construction syntax.

It uses an independently proved canonical-normal-form theorem to justify equality as the backend representation of `≈` only after normalization to the selected NF scope.

**RB-B03: PASS at architectural/written level; V5 pending.**

---

# 6. RB-B04 — Identity reflection / faithfulness

The unified backend defines:

```text
reify : N_BOMA → TCTNF
```

and proof candidates:

```text
realize(reify(n)) = n
reify(realize(a)) = a.
```

Therefore:

```text
realize(a) = realize(b)
    ↓ congrArg reify
reify(realize(a)) = reify(realize(b))
    ↓ inverse laws
a = b.
```

Since backend equality on selected NF represents `≈`, this gives the selected-scope faithfulness target:

```text
ρ(A)=ρ(B)  ⇒  A≈B.
```

No quotient type is used.

**RB-B04: PASS at written-proof level; V5 pending.**

---

# 7. B5 — Representation inverse / no junk at bridge level

The two inverse equations establish, at the backend representation level:

```text
TCTNF  ↔  N_BOMA
```

as mutually reconstructible presentations.

This is stronger than one-way encoding and gives two useful facts:

1. no selected NF distinction is collapsed by realization;
2. every `N_BOMA` constructor ancestry has a selected-NF backend representative.

### Critical interpretation

This is **not** a proof that the pre-numerical TCT layer had already contained a completed global carrier.

`TCTNF` is created after the formalization boundary. The inverse theorem certifies fidelity of the formal representation; it does not retroactively change the ontology of the earlier layer.

**Representation inverse: PASS at written level; V5 pending.**

---

# 8. RB-B05 — Structural history correspondence

Canonical TCT history has the structural clauses:

```text
Hist(ε)       = halt-at-ε
Hist(U)       = [U ↘ ε] + halt
Hist(P ⊙ U)   = [P ⊙ U ↘ P] + Hist(P)
```

Backend constructor ancestry has:

```text
z
s z
s(s z)
...
```

but the audit does not use the ellipsis as a completed global enumeration or numerical index.

Under the bridge:

```text
ε / eps                 ↦ z
U / nonempty unit       ↦ s z
P ⊙ U / ext(p)          ↦ s(realize(P))
```

Each canonical recovery step corresponds to removal of one outer `s` constructor in the formal candidate, and each `ExtU` corresponds to addition of one outer `s` constructor.

Thus the structural ancestry relation is preserved **step structurally**, not via a numerical depth equation.

### Status

```text
architectural structural proof   PASS
explicit dedicated Lean theorem  PENDING
V5                               PENDING
```

**RB-B05: PASS at V3-style architectural level; V5 pending.**

---

# 9. Preservation of TCT certified contributions

| TCT contribution | Formal bridge treatment |
|---|---|
| ε base role | REPRESENTED DIRECTLY by `z` |
| ExtU | REPRESENTED DIRECTLY by `s` under `realize_extU` |
| BR-010 selected-NF equivalence | TRANSLATED to backend equality using PDSA-TCT-004 canonicality theorem |
| terminal injectivity/cancellation | STRENGTHENED/REALIZED as constructor injectivity, proof obligation |
| empty exclusion | STRENGTHENED/REALIZED as constructor disjointness, proof obligation |
| canonical decomposition | REPRESENTED by outer-constructor recovery |
| structural iteration history | REPRESENTED by constructor ancestry |
| explicit meta-finite-chain acyclicity | CONSISTENT with constructor ancestry; dedicated formal certificate remains downstream if required |

This table is the current NAC-13 preservation certificate draft for the bridge scope.

---

# 10. Hidden-commitment audit

The bridge does not require:

```text
quotient formation
function extensionality
classical logic
choice
built-in Nat as the carrier
numeric depth or cardinality
set membership ontology
```

New backend types `TCTNF` and `TCTNFPlus` are explicitly classified as representations and therefore do not masquerade as pre-boundary mathematical objects.

**Hidden-commitment audit: PASS.**

---

# 11. First exploratory bridge payload

An earlier exploratory file:

`LAB/payloads/lean/NCore/TCTBridge.lean`

was written before simplification of the inverse construction.

It is retained as experimental provenance and is not the preferred verification payload.

The preferred candidate is now:

```text
LAB/payloads/lean/NCore/NCoreRB001.lean
```

with `TCTBridgeSelected.lean` as a smaller bridge-only candidate.

This preserves the development path rather than silently deleting the first attempt.

---

# 12. NAC status after bridge audit

```text
NAC-06 faithful TCT bridge     PASS at written/V3 level; V5 pending
NAC-13 preservation certificate SUBSTANTIALLY DISCHARGED; final V5/provenance closure pending
```

This does not discharge:

```text
NAC-11 full N-Core characterization
NAC-12 standardness/uniqueness
NAC-15 final N-Core closure
```

---

# Verdict

```text
FAITHFUL TCT → R-B BRIDGE
PASS AT ARCHITECTURAL / WRITTEN-PROOF LEVEL
V5 MACHINE VERIFICATION PENDING
```

Recommended next Study:

- verify the unified payload with the pinned Lean toolchain;
- separately audit the unary-algebra initiality/standardness proof candidate;
- do not close N-Core merely from bridge bijectivity.
