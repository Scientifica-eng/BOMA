# NATURAL-NUMBER ACCEPTANCE SPECIFICATION

**Document ID:** `BOMA-N-ACCEPT-001`  
**Version:** `1.0`  
**Date:** 2026-08-18  
**Status:** **ACTIVE — Stage-One N-Core acceptance specification**  
**PDSA origin:** `PDSA-N-001`  
**Scope:** acceptance conditions for a formal natural-number core. Addition, multiplication, order, and later arithmetic belong to a separate N-Arithmetic package.

---

## 1. Purpose

This specification defines what a future formal realization must establish before BOMA may classify it as an accepted **natural-number core (N-Core)**.

It is defined before the formal carrier is constructed.

The current TCT path supplies a calibrated pre-numerical constructional core:

```text
ε
U
⊙
Generated Selected Configurations
structural equivalence ≈
canonical decomposition
structural iteration history
successor-like extension
```

A formal N-Core must realize this ancestry rather than silently replace it with a familiar but unrelated model of natural numbers.

---

# 2. Required formal declarations

## NAC-01 — Formal realization regime

The candidate must declare:

```text
ambient logic / proof discipline
carrier ontology (set, type, object, algebra, etc.)
carrier equality/identity
meaning of function/morphism
meaning of predicate/subobject used for generatedness/induction
existence/completion principles used
```

**Epistemic class:** `FORMALIZATION-DEPENDENT / DECLARED`.

No framework may remain invisible background.

## NAC-02 — Formal carrier

The candidate must provide a formally specified global carrier, schematically:

```text
N
```

with its existence and globality justified in the declared regime.

This is a **new formal commitment** relative to TCT.

## NAC-03 — Carrier identity

The candidate must define formal identity/equality on `N` and explicitly relate it, where relevant, to:

```text
TCT presentation identity ≡
TCT structural equivalence ≈
formal representation equality
```

These notions must not be silently conflated.

---

# 3. Distinguished natural-number structure

## NAC-04 — Initial element

Provide a distinguished formal element/object:

```text
0_N
```

realizing the TCT base/empty role `ε`.

## NAC-05 — Global successor

Provide a regime-appropriate total operation/morphism:

```text
S_N : N → N
```

This is stronger than the TCT selected-presentation schema `ExtU`; global totality belongs to the formal layer.

---

# 4. TCT realization bridge

## NAC-06 — Local realization correspondence

For each explicitly supplied selected TCT presentation `A`, provide a formal realization value/correspondent, schematically `ρ(A)`, with:

```text
ρ(ε) = 0_N
ρ(ExtU(A)) = S_N(ρ(A))
A ≈ B  ⇒  ρ(A) = ρ(B)
```

where `=` is formal carrier identity.

If the selected regime does not yet possess a legitimate object that can serve as the source of a global function `ρ`, the bridge must remain an explicit **realization schema/correspondence** until that source object is constructed.

### Faithfulness target

For the current Stage-One canonical route, the bridge must also establish identity reflection or an explicitly justified equivalent faithfulness condition:

```text
ρ(A) = ρ(B)  ⇒  A ≈ B.
```

This prevents formalization from collapsing distinctions that the calibrated TCT path preserves.

## NAC-07 — No-confusion adequacy

The formal candidate must validate at least:

```text
S_N(x) = S_N(y)  ⇒  x = y
0_N is not in the image of S_N
```

The record must state whether these are inherited through the realization bridge, derived internally, or added as formal commitments.

---

# 5. Global generatedness

## NAC-08 — Generatedness / no additional elements

The carrier must be exhausted by the structure generated from `0_N` under `S_N`, in a precise form appropriate to the declared regime.

Acceptable routes may include, when justified:

```text
least S_N-closed subobject containing 0_N
induction strong enough to establish generatedness
initial/universal characterization
another explicitly proved regime-specific equivalent
```

The project must state what is primitive and what is derived.

The phrase:

```text
“every element is reached after finitely many steps”
```

is not an acceptable primitive explanation unless its meaning has been independently formalized without circular dependence on the candidate natural numbers.

Generatedness is a genuinely global obligation; local successor properties do not replace it.

---

# 6. Induction and recursion adequacy

## NAC-09 — Induction adequacy

The accepted N-Core must support a regime-appropriate induction principle, schematically:

```text
P(0_N)
∀x, P(x) → P(S_N(x))
-----------------------
∀x ∈ N, P(x)
```

The admissible predicates/subobjects and logical interpretation must be declared.

Induction need not be primitive if it is derived from the selected universal/generatedness characterization; provenance must make that derivation explicit.

## NAC-10 — Recursion / universal mapping adequacy

The accepted N-Core must support the expected recursion behavior in the selected regime.

Schematic target:

for admissible `X`, base datum `x₀`, and step operation `f`, provide an appropriate unique map/morphism `h` with:

```text
h(0_N) = x₀
h(S_N(n)) = f(h(n)).
```

The exact class of targets and morphisms is regime-dependent.

Different realization styles may produce this guarantee differently:

```text
set-theoretic / Peano-style route → recursion theorem
initial-algebra route             → initiality/universal mapping
NNO route                         → category-relative NNO universal property
```

These production routes must remain distinct in provenance even when their exported guarantees correspond.

---

# 7. Characterization and identification

## NAC-11 — Adequacy characterization

The candidate must prove an explicit natural-number characterization strong enough, in the selected regime, to exclude:

```text
extra unrelated carrier elements
collapsed successor structure
cyclic successor behavior
initial element occurring as a successor
```

Resemblance to ordinary natural numbers is not evidence.

## NAC-12 — Uniqueness / comparison certificate

For the Stage-One canonical N-Core, the selected regime must provide an appropriate uniqueness/standardness certificate, normally uniqueness up to a structure-preserving isomorphism/equivalence in that regime.

The certificate must preserve at least:

```text
0_N
S_N
carrier identity/equivalence
```

### Stress-test clarification

A first-order Peano-style axiom system considered only under ordinary first-order model theory is **not by itself** sufficient for NAC-12, because non-isomorphic nonstandard models may satisfy the same first-order theory.

Any Peano-style realization must state the logical/semantic strength and the actual standardness/uniqueness result it uses.

Cross-framework uniqueness is not assumed automatically.

---

# 8. Preservation and commitment accounting

## NAC-13 — TCT preservation certificate

The formalization must classify each relevant TCT contribution as:

```text
PRESERVED DIRECTLY
REPRESENTED / TRANSLATED
DERIVED AGAIN FORMALLY
STRENGTHENED BY NEW FORMAL COMMITMENT
NOT USED
```

At minimum account for:

```text
ε base role
ExtU successor-like extension
BR-010 structural equivalence
canonical decomposition
structural iteration history
injectivity / empty exclusion / explicit-chain acyclicity
```

## NAC-14 — New-commitment ledger

Every new formalization commitment must be listed explicitly, including as applicable:

```text
global carrier
formal equality
global successor function
generatedness/completion principle
induction scope
recursion/universal-property scope
ambient logic
existence principles
quotient/type/set/object formation principles
```

Standardness in a familiar foundation does not make a commitment invisible.

---

# 9. N-Core versus arithmetic

## NAC-15 — N-Core closure

A candidate may be classified as an accepted N-Core only after NAC-01 through NAC-14 are discharged or explicitly mapped to justified equivalent obligations.

## NAC-16 — N-Arithmetic package

After N-Core acceptance, later PDSA cycles must separately construct/verify:

```text
addition
multiplication
order
interaction laws
```

preferably using the accepted recursion/universal structure and preserving constructional provenance where scientifically meaningful.

Arithmetic must not be assumed merely to make the N-Core look familiar.

---

# 10. Stress-test results embedded in the specification

The acceptance specification was tested against several candidate families.

## Rejected by the specification

```text
current pre-numerical TCT core by itself
    lacks formal carrier/globality/induction/recursion

cyclic successor structures
    fail required adequacy/no-confusion characterization

ℤ with successor x ↦ x+1 and distinguished 0
    fails because 0 is in successor image and forward generatedness fails

natural-number-like chain plus extra disconnected elements
    fails NAC-08 generatedness

collapsing/fixed-point successor structures
    fail NAC-07 / faithful TCT bridge

first-order Peano axioms alone as a complete certificate
    fail NAC-12 unless supplemented by an appropriate standardness/uniqueness result
```

## Potentially admissible when fully discharged

```text
set-theoretic standard natural-number realization
initial algebra for the unary natural-number signature
Natural Numbers Object in a declared suitable category
other explicitly justified realization regimes
```

## Free-monoid clarification

A free monoid on one generator is a strong realization/comparison model for much of the finite constructional core, but its **monoid universal property alone** does not automatically discharge the full N-Core recursion/induction/standardness obligations.

Additional theorems or structure are required before it can count as a complete N-Core certificate.

---

# 11. Acceptance matrix

| ID | Obligation | Required | Typical epistemic class |
|---|---|---:|---|
| NAC-01 | Formal regime declaration | YES | DECLARED / FORMALIZATION-DEPENDENT |
| NAC-02 | Formal carrier/globality | YES | NEW COMMITMENT |
| NAC-03 | Carrier identity | YES | DECLARED / FORMALIZATION-DEPENDENT |
| NAC-04 | Initial element | YES | REALIZATION / CONSTRUCTION |
| NAC-05 | Global successor | YES | REALIZATION / CONSTRUCTION |
| NAC-06 | Faithful TCT bridge | YES | VERIFIED BRIDGE |
| NAC-07 | No-confusion adequacy | YES | DERIVED / VERIFIED |
| NAC-08 | Generatedness | YES | EXPLICIT FORMAL OBLIGATION |
| NAC-09 | Induction adequacy | YES | DERIVED OR REGIME PRINCIPLE |
| NAC-10 | Recursion/universal adequacy | YES | DERIVED / UNIVERSAL PROPERTY |
| NAC-11 | Natural-number characterization | YES | VERIFIED |
| NAC-12 | Uniqueness/standardness certificate | YES | VERIFIED WITHIN REGIME |
| NAC-13 | TCT preservation certificate | YES | VERIFIED |
| NAC-14 | New-commitment ledger | YES | AUDIT |
| NAC-15 | N-Core closure decision | YES | GOVERNANCE |
| NAC-16 | Arithmetic package | LATER | SEPARATE CONSTRUCTION |

---

# 12. Failure rule

A candidate must remain unaccepted while any required NAC obligation is unresolved or while its evidence depends on a hidden formalization commitment.

In particular:

```text
successor-like resemblance ≠ N-Core
local generation schema ≠ global carrier generatedness
induction label ≠ scoped induction theorem
recursion label ≠ verified universal mapping behavior
axiom list ≠ uniqueness certificate
formal carrier ≠ faithful realization of TCT ancestry
```

---

# 13. Next architectural action

This specification does **not** select a realization regime.

The next PDSA cycle must open an explicit formal-realization Decision Point comparing candidate regimes against NAC-01 through NAC-14 before `TCT-BLOCK-006` is constructed.
