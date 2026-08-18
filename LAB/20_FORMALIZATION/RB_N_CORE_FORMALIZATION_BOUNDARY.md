# R-B N-CORE FORMALIZATION BOUNDARY

**Document ID:** `BOMA-RB-FORMAL-001`  
**Version:** `0.1-draft`  
**Date:** 2026-08-18  
**Status:** DRAFT — under `PDSA-N-003`  
**Selected by:** `N-DP-001`, option R-B

---

## 1. Purpose

Specify the minimal normative formal commitments permitted for the first BOMA N-Core realization under the selected R-B route.

This contract is defined **before** constructing the carrier `N_BOMA`.

It separates:

```text
PRE-NUMERICAL TCT CONTRIBUTIONS
already constructed / verified

FORMAL REGIME COMMITMENTS
new commitments admitted at the boundary

N-CORE THEOREM OBLIGATIONS
results that must be derived or verified after the carrier is introduced

BACKEND IMPLEMENTATION
Lean or another prover used to encode/verify the formal construction
```

---

# 2. Normative regime

The Stage-One R-B route uses a **minimal dependent type-theoretic inductive regime** sufficient to form a fresh unary inductive carrier and reason by its eliminator.

The contract is architectural/mathematical. It is not defined as “whatever Lean happens to provide.”

## RB-F01 — Type formation

The regime must provide a type/sort level sufficient to form a fresh carrier:

```text
N_BOMA : Type
```

The exact universe hierarchy belongs to the backend/regime declaration and must be recorded if it affects the construction.

## RB-F02 — Dependent function formation

The regime must support dependent function / Π-types sufficient to state an induction motive and eliminator:

```text
P : N_BOMA → Type
```

and dependent functions over `N_BOMA`.

## RB-F03 — Identity/equality

The regime must provide an explicit formal identity/equality notion for inhabitants of `N_BOMA`, with the substitution/congruence reasoning needed by the proofs.

For the first canonical route, no quotient equality is introduced.

The realization record must distinguish:

```text
TCT ≡
TCT ≈
formal N_BOMA equality
```

## RB-F04 — Fresh inductive formation rule

The regime must admit a **fresh BOMA-specific inductive type** with constructor signature schematically:

```text
z : N_BOMA
s : N_BOMA → N_BOMA
```

This inductive formation is a **DECLARED FORMALIZATION COMMITMENT**.

It is not claimed to be derived from the pre-numerical TCT layer.

The backend must record any positivity/termination/universe conditions required for this inductive declaration.

## RB-F05 — Dependent eliminator / induction rule

The inductive regime must provide an eliminator of the form:

```text
for P : N_BOMA → Type,
base : P(z),
step : Π n : N_BOMA, P(n) → P(s n),
produce:
ind_N : Π n : N_BOMA, P(n)
```

with the regime-appropriate computation rules at `z` and `s`.

This is the normative source of induction adequacy for R-B.

## RB-F06 — Nondependent recursion

A nondependent recursor must be derivable from RB-F05 by a constant motive or provided as a justified consequence of the inductive package.

Schematic form:

```text
rec_N : X → (X → X) → N_BOMA → X
```

with expected base/step computation behavior.

The contract does not assume a separate primitive recursion axiom when the eliminator already supplies it.

---

# 3. Principles not required by the current N-Core contract

The following are **not admitted as hidden defaults** and are not currently required for the core plan:

```text
law of excluded middle
axiom of choice
quotient types
univalence
proof irrelevance
propositional truncation
classical indefinite description
set-theoretic membership ontology
numeric cardinality primitives
```

If a later proof uses one of these, the contract must be revised or the proof must be redesigned.

## Function extensionality

The first N-Core route does **not** require function extensionality as a primitive commitment if uniqueness is stated pointwise:

```text
∀n, h(n) = k(n)
```

rather than by asserting formal equality of functions `h = k`.

If a later universal-property packaging requires equality of functions, either:

```text
pointwise uniqueness remains the canonical statement
```

or function extensionality must be introduced explicitly as a new commitment.

This is a deliberate minimality choice.

---

# 4. Carrier construction is next, not part of this contract

This contract authorizes a future cycle to introduce:

```text
N_BOMA
z
s
```

using RB-F01 through RB-F05.

It does **not** itself assert that the carrier has already been created.

`TCT-BLOCK-006` remains RESERVED until the construction and acceptance obligations are discharged.

---

# 5. TCT realization bridge discipline

The current TCT selected presentations are not yet a completed object-level carrier.

Therefore the first realization bridge is a **schema/certificate over explicitly supplied TCT presentations**, not automatically a global function from a TCT set/type.

## RB-B01 — Base correspondence

```text
ε  ↦  z
```

## RB-B02 — Extension correspondence

For an explicitly supplied selected presentation `A`:

```text
ExtU(A)  ↦  s(ρ(A))
```

## RB-B03 — Structural-equivalence preservation

The realization must prove/certify:

```text
A ≈ B  ⇒  ρ(A) = ρ(B)
```

for the relevant supplied selected presentations.

## RB-B04 — Faithfulness / reflection

The current Stage-One route also requires:

```text
ρ(A) = ρ(B)  ⇒  A ≈ B
```

or an explicitly justified equivalent faithfulness certificate.

## RB-B05 — History correspondence

The structural iteration history of a supplied TCT presentation must correspond to constructor ancestry in `N_BOMA` without introducing a numerical depth measure as the definition of that correspondence.

---

# 6. Required theorem obligations after carrier construction

The following are **not** built into the BOMA acceptance record merely by writing an inductive declaration. They require formal evidence in the selected regime/backend.

## RB-O01 — Constructor disjointness

Prove:

```text
s(n) ≠ z
```

for all `n`.

## RB-O02 — Constructor injectivity

Prove:

```text
s(a) = s(b)  ⇒  a = b.
```

These discharge the formal no-confusion counterpart of TCT successor-like results.

## RB-O03 — Induction adequacy

Record the exact eliminator and show it discharges NAC-09 for the declared class of motives/properties.

## RB-O04 — Recursion adequacy

Derive/verify the nondependent recursor and its computation equations.

## RB-O05 — Pointwise recursion uniqueness

For any two candidate recursive maps satisfying the same base/step equations, prove:

```text
∀n : N_BOMA, h(n) = k(n).
```

This target is intentionally pointwise so that function extensionality is not required merely for N-Core acceptance.

## RB-O06 — Generatedness certificate

Use the inductive elimination principle or a separately justified theorem to discharge NAC-08 without introducing the circular phrase “after finitely many successor steps.”

## RB-O07 — TCT bridge preservation

Discharge RB-B01 through RB-B05 with explicit provenance.

## RB-O08 — N-Core uniqueness / standardness certificate

Given another candidate satisfying the accepted R-B N-Core interface, construct appropriate structure-preserving maps in both directions and prove the regime-appropriate pointwise inverse laws / equivalence certificate.

The exact packaging must be stated explicitly.

## RB-O09 — Commitment ledger

Produce NAC-13/NAC-14 records classifying:

```text
inherited TCT contributions
new formal commitments
derived formal theorems
backend-only representations
```

---

# 7. Initial-algebra interpretation boundary

At the nondependent recursion level, the future structure may be compared to an initial algebra for the unary signature/functor schematically represented by:

```text
1 + X
```

However:

> **ordinary initial-algebra recursion is not silently identified with the dependent induction eliminator.**

Any theorem connecting these formulations must state its ambient assumptions and proof.

This prevents a category-level universal property from being used as an undeclared substitute for dependent induction.

---

# 8. Lean / proof-assistant role

## RB-L01 — Backend, not definition

Lean may be used as a reproducible formal-verification backend.

The canonical mathematical/formalization contract is this BOMA record, not Lean's built-in `Nat`.

## RB-L02 — Fresh carrier requirement

The first backend realization should define a fresh BOMA-specific inductive type, schematically:

```text
inductive BOMANat where
  | z
  | s : BOMANat → BOMANat
```

rather than using Lean's built-in `Nat` as the carrier definition.

Built-in natural numbers may later be used as an **external comparison target** only after a separate equivalence/isomorphism theorem is formulated and proved.

## RB-L03 — Backend feature ledger

The formalization record must identify which Lean/kernel/library features are used for each proof obligation.

No theorem may be classified as framework-neutral merely because Lean verifies it.

## RB-L04 — Backend representation separation

Any auxiliary Lean datatype encoding TCT selected syntax must be marked:

```text
REPRESENTS TCT presentations
```

and must not silently replace the canonical pre-numerical construction.

---

# 9. NAC mapping

| Acceptance obligation | R-B planned discharge |
|---|---|
| NAC-01 formal regime | this contract RB-F01..F06 |
| NAC-02 carrier | next carrier-construction cycle |
| NAC-03 identity | RB-F03 + realization record |
| NAC-04 initial element | constructor `z` |
| NAC-05 successor | constructor operation `s` |
| NAC-06 TCT bridge | RB-B01..B05 |
| NAC-07 no-confusion | RB-O01..O02 |
| NAC-08 generatedness | RB-O06 |
| NAC-09 induction | RB-F05 / RB-O03 |
| NAC-10 recursion | RB-F06 / RB-O04..O05 |
| NAC-11 characterization | combined R-B interface proof |
| NAC-12 uniqueness | RB-O08 |
| NAC-13 preservation | RB-O07/RB-O09 |
| NAC-14 commitment ledger | RB-O09 |

NAC-15 closure is a later acceptance decision after all obligations pass.

NAC-16 arithmetic remains downstream.

---

# 10. Failure / revision conditions

Revise this contract if:

```text
an obligation requires an undeclared logical principle
the backend cannot express the normative eliminator faithfully
function extensionality becomes materially necessary
TCT faithfulness cannot be established under the proposed equality
constructor no-confusion needs an additional commitment not recorded here
generatedness/uniqueness cannot be discharged from the declared regime
a more minimal regime is found that preserves all required capabilities
```

---

# 11. Draft conclusion

The selected R-B route can be specified without making classical logic, choice, quotient types, function extensionality, or built-in natural numbers part of the initial N-Core commitment.

The central new formalization commitment is the **fresh inductive type formation/elimination regime** itself.

This draft must be audited before it becomes the active boundary contract.
