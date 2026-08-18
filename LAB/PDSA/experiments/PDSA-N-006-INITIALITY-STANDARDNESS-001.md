# PDSA-N-006-INITIALITY-STANDARDNESS-001

**Parent cycle:** `PDSA-N-006`  
**Date:** 2026-08-18  
**Status:** **PASS AT WRITTEN MATHEMATICAL LEVEL — BACKEND V5 PENDING**

## Purpose

Determine whether `N-RB-CAND-001` has a regime-appropriate characterization strong enough to support NAC-11 and NAC-12 without importing a ready-made standard natural-number model.

---

# 1. Unary-algebra interface

Use a formal unary algebra:

```text
A = (Carrier_A, base_A, step_A)
```

and a homomorphism `h : A → B` satisfying:

```text
h(base_A) = base_B
h(step_A(x)) = step_B(h(x)).
```

No addition, multiplication, order, set membership, or numerical length is part of this interface.

---

# 2. Candidate algebra

View the fresh R-B candidate as:

```text
BOMAAlg = (N_BOMA, z, s).
```

This uses the formal carrier already introduced provisionally by `N-RB-CAND-001`.

---

# 3. Existence of a homomorphism to any admissible unary algebra

Let:

```text
A = (X, x₀, f).
```

Define:

```text
fold_A(z)   ≔ x₀
fold_A(s n) ≔ f(fold_A(n)).
```

The R-B recursor justifies this definition.

By construction:

```text
fold_A(z) = x₀
fold_A(s n) = f(fold_A(n)),
```

so `fold_A` is a unary-algebra homomorphism from `BOMAAlg` to `A`.

**Existence: PASS.**

---

# 4. Pointwise uniqueness of the homomorphism

Let `h : BOMAAlg → A` be any homomorphism.

We prove:

```text
∀n : N_BOMA, h(n) = fold_A(n).
```

by induction on `n`.

## Base

Homomorphism preservation gives:

```text
h(z) = x₀ = fold_A(z).
```

## Step

Assume:

```text
h(n) = fold_A(n).
```

Then:

```text
h(s n)
= f(h(n))                homomorphism law
= f(fold_A(n))           induction hypothesis
= fold_A(s n).           recursion equation
```

Thus the homomorphism is unique **pointwise**.

No function extensionality is required.

**Pointwise uniqueness: PASS.**

---

# 5. Pointwise initiality

Therefore, within the declared admissible target universe/regime:

> `BOMAAlg` has a homomorphism to every unary algebra, and any two such homomorphisms agree pointwise.

Call this:

```text
POINTWISE INITIALITY
```

This is deliberately weaker in packaging than asserting equality of homomorphism records/functions when such equality would require extra extensionality principles.

The exported mathematical content is sufficient for recursion and the standard initial-object uniqueness argument at the pointwise level.

**Pointwise initiality: PASS.**

---

# 6. Uniqueness of pointwise-initial unary algebras

Let `A` and `B` both satisfy pointwise initiality.

By initiality:

```text
f : A → B
g : B → A
```

exist as homomorphisms.

Consider:

```text
g ∘ f : A → A
id_A  : A → A.
```

Both are endomorphism homomorphisms of `A`.

Pointwise initiality of `A` implies:

```text
∀x, (g ∘ f)(x) = id_A(x) = x.
```

Similarly, pointwise initiality of `B` gives:

```text
∀y, (f ∘ g)(y) = y.
```

Hence the two carriers are related by structure-preserving maps with pointwise inverse laws.

This supplies a regime-appropriate uniqueness certificate without asserting function equality or importing function extensionality.

**Initial-object uniqueness: PASS.**

---

# 7. Relation to NAC-11 — characterization

Pointwise initiality alone supplies a strong recursion/universal characterization, but BOMA's accepted R-B N-Core package also includes:

```text
fresh inductive carrier
dependent induction/generatedness
constructor injectivity
constructor disjointness
faithful TCT bridge
```

The combined characterization excludes the main stress-test failures:

### Extra disconnected elements

The inductive elimination/generatedness discipline rules out an ungenerated carrier component within the selected R-B carrier construction.

### Collapsing successor

Constructor injectivity rules out collapse of distinct predecessors under `s`.

### Base as successor

Constructor disjointness rules out `s(n)=z`.

### Cyclic successor ancestry

The TCT bridge and constructor ancestry preserve the calibrated acyclic extension structure; an explicit formal cycle would conflict with the constructor/induction structure and the faithful bridge.

### Recursion insufficiency

Pointwise initiality directly supplies the required recursion universal behavior.

Therefore the intended R-B characterization is not merely:

```text
“has z and s”
```

but the full verified package above.

**NAC-11: PASS at written characterization level; V5 evidence still pending.**

---

# 8. Relation to NAC-12 — uniqueness / standardness

Within the selected R-B unary-algebra characterization scope, any two candidates satisfying the same pointwise-initial interface have structure-preserving maps with pointwise inverse laws.

This is the current proposed **standardness/uniqueness certificate**.

### What it does establish

```text
uniqueness up to structure-preserving pointwise inverse maps
within the declared R-B unary-algebra regime/scope
```

### What it does not establish

```text
cross-framework uniqueness between all foundations
first-order categoricity under arbitrary semantics
definitional equality of carriers
function equality without extensionality
identity with Lean built-in Nat
```

This matches NAC-12's regime-relative requirement.

**NAC-12: PASS at written mathematical level; backend checker evidence pending.**

---

# 9. Initial algebra versus dependent induction

The audit preserves the distinction established in PDSA-N-002/N-003:

```text
POINTWISE INITIALITY
supports nondependent recursion/universal mapping

DEPENDENT ELIMINATOR
supports induction/generatedness over dependent motives
```

The project does not infer dependent induction from ordinary unary-algebra initiality alone.

Both contributions coexist in the selected R-B package and have different provenance.

**Boundary discipline: PASS.**

---

# 10. Universe / target-scope caution

“Every unary algebra” must be read relative to the universe(s) and target types admitted by `BOMA-RB-FORMAL-001` and the concrete backend encoding.

The project must not silently generalize a theorem checked in one universe level to an unrestricted cross-universe categorical theorem.

This is a **scope annotation**, not a defect in the characterization.

A backend proof record should state the actual universe parameters accepted by Lean after elaboration.

---

# 11. Backend proof candidate

`LAB/payloads/lean/NCore/NCoreRB001.lean` contains candidate formalizations of:

```text
UnaryAlgebra
Hom
foldHom
foldHom_unique
PointwiseInitial
boma_pointwise_initial
pointwise_initial_unique
```

The mathematical structure of those proofs matches the derivation above.

Because the current session has not obtained a successful Lean checker result, their status remains:

```text
WRITTEN / CODE CANDIDATE
V5 PENDING
```

---

# 12. Acceptance impact

After this audit:

```text
NAC-10 recursion/universal adequacy     PASS at written level
NAC-11 characterization                PASS at written level
NAC-12 uniqueness/standardness          PASS at written level
```

Still open for final N-Core closure:

```text
V5 backend evidence for the candidate package
final NAC-06/NAC-13 bridge V5 evidence
final NAC-14 commitment ledger consolidation
NAC-15 closure decision
```

---

# Verdict

```text
R-B CHARACTERIZATION / STANDARDNESS ROUTE
PASS AT WRITTEN MATHEMATICAL LEVEL

FORMAL BACKEND V5
PENDING
```

The next step should not add arithmetic. It should consolidate machine-verification evidence and the final preservation/commitment ledger before any N-Core closure decision.
