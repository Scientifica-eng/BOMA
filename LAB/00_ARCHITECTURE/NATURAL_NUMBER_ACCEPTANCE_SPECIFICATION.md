# NATURAL-NUMBER ACCEPTANCE SPECIFICATION

**Document ID:** `BOMA-N-ACCEPT-001`  
**Version:** `0.1-draft`  
**Date:** 2026-08-18  
**Status:** DRAFT — under `PDSA-N-001`  
**Scope:** acceptance conditions for the first formal natural-number core; arithmetic extensions are outside this core specification.

---

## 1. Purpose

This document defines what a future formal realization must establish before BOMA may classify it as an accepted realization of the natural-number core.

It is deliberately written **before** constructing the formal carrier.

The specification separates:

```text
N-CORE
formal natural-number carrier and its constitutive/characterizing structure

N-ARITHMETIC PACKAGE
addition, multiplication, order, and later arithmetic constructions
```

Passing N-CORE does not by itself complete all arithmetic work over natural numbers.

---

## 2. Governing principle

The current TCT path has constructed a calibrated pre-numerical core through:

```text
ε
U
⊙
selected generated presentations
structural equivalence ≈
canonical decomposition
structural iteration history
successor-like extension
```

A formal natural-number realization must **realize this constructional ancestry** rather than silently replace it with an unrelated familiar model of natural numbers.

At the same time, the TCT layer has intentionally not constructed a completed global carrier, global equality, induction, or recursion principle.

Those are formalization-boundary obligations and must be visible as such.

---

# PART I — REQUIRED DECLARATIONS

## NAC-01 — Formal realization regime

A candidate must declare the formal regime in which it exists.

The declaration must state at least:

```text
ambient logic / proof discipline
carrier ontology (set, type, object, algebra, etc.)
identity/equality notion on the carrier
meaning of function/morphism
meaning of subobject/predicate used for induction/generatedness
available existence/completion principles
```

### Classification

```text
FORMALIZATION-DEPENDENT / DECLARED
```

No framework may be treated as invisible background.

---

## NAC-02 — Formal carrier

The candidate must provide a formally specified carrier, written schematically as:

```text
N
```

appropriate to the declared realization regime.

The carrier is a **new global/formal commitment** relative to the pre-numerical TCT layer.

The specification must state what it means for an object to belong to / be an element or point of `N` in the selected regime.

### Classification

```text
FORMALIZATION-DEPENDENT / NEW COMMITMENT
```

---

## NAC-03 — Carrier identity

The candidate must provide the equality/identity relation appropriate to `N` and state its relation to any representation equality used by the realization.

The project must not silently identify:

```text
TCT selected-presentation identity ≡
TCT structural equivalence ≈
formal carrier equality
```

A realization theorem must explicitly connect them where required.

---

# PART II — DISTINGUISHED STRUCTURE

## NAC-04 — Initial element

The candidate must provide a distinguished element/object:

```text
0_N
```

serving as the formal realization of the TCT empty/base role `ε`.

This does not claim that the glyph `0` existed in the pre-numerical layer.

---

## NAC-05 — Successor operation

The candidate must provide an object-level total operation/morphism:

```text
S_N : N → N
```

or the regime-appropriate equivalent.

This is stronger than the pre-numerical selected-presentation schema `ExtU`; global totality belongs to the formal realization layer.

---

# PART III — TCT REALIZATION BRIDGE

## NAC-06 — Local realization correspondence

For every explicitly supplied selected TCT presentation `A`, the realization must provide a corresponding formal element/object of `N`, written schematically:

```text
ρ(A) ∈ N
```

This notation may be implemented as a function only if the selected formal regime legitimately provides the required source/target objects. Otherwise it is a realization schema/correspondence.

Required compatibility:

```text
ρ(ε) = 0_N
ρ(ExtU(A)) = S_N(ρ(A))
A ≈ B  ⇒  ρ(A) = ρ(B)
```

where `=` denotes the declared formal carrier identity.

The realization must state whether the converse reflection condition is available:

```text
ρ(A) = ρ(B)  ⇒  A ≈ B.
```

For the current canonical Stage-One route, identity reflection is a target requirement unless a formally justified alternative notion of faithful realization is adopted and explicitly recorded.

---

## NAC-07 — No-collapse / no-confusion adequacy

At minimum the formal structure must validate the counterparts of the verified TCT successor-like results:

```text
S_N(x) = S_N(y)  ⇒  x = y
0_N is not in the image of S_N
```

The proof may be inherited through a faithful TCT realization or established independently in the selected formal regime; provenance must state which.

No-confusion properties must not be declared primitive if they were actually derived from other accepted commitments.

---

# PART IV — GLOBAL GENERATEDNESS

## NAC-08 — Generatedness / absence of additional elements

The formal carrier must be exhausted by the initial role and repeated successor generation in the sense appropriate to the selected regime.

The specification must provide a precise regime-specific theorem/principle expressing that `N` contains no elements unrelated to the construction generated from `0_N` by `S_N`.

Acceptable forms may include, when formally justified:

```text
least S_N-closed subobject containing 0_N
an induction principle implying generatedness
an initial/universal characterization implying no extra elements
an equivalent regime-specific generatedness theorem
```

The project must record which formulation is primitive, which is derived, and what logic it requires.

A mere assertion that “every element is reached after finitely many steps” is not acceptable unless the meaning of that statement is independently defined without circular dependence on the natural numbers being constructed.

---

# PART V — INDUCTION AND RECURSION ADEQUACY

## NAC-09 — Induction adequacy

The accepted natural-number core must support an induction principle adequate to the selected formal regime.

Schematic form:

```text
P(0_N)
∀x, P(x) → P(S_N(x))
-----------------------
∀x ∈ N, P(x)
```

The actual class of admissible predicates/properties and the logical meaning of the quantifiers must be declared by the realization regime.

The specification does not assume that induction must be introduced as a primitive axiom. It may be derived from a universal/generatedness characterization, but the derivation must be explicit.

---

## NAC-10 — Recursion / universal mapping adequacy

The accepted core must support the expected recursion behavior of natural numbers in the selected regime.

Schematic target:

for an admissible target `X`, base datum `x₀`, and step operation `f`, there is an appropriate unique map/morphism `h` satisfying:

```text
h(0_N) = x₀
h(S_N(n)) = f(h(n)).
```

The exact scope of targets and morphisms is regime-dependent.

A Peano/set-theoretic realization may prove a recursion theorem; an initial-algebra or NNO-style realization may supply the property universally. BOMA records these as different production routes rather than silently identifying them.

---

# PART VI — CHARACTERIZATION / IDENTIFICATION

## NAC-11 — Adequacy characterization

The candidate must prove that its formal package satisfies an accepted characterization of the natural-number core in the selected regime.

The characterization must be stated explicitly and must be strong enough to exclude structures with extra unrelated elements, collapsed successor behavior, or cyclic successor behavior.

---

## NAC-12 — Uniqueness / comparison certificate

Within the selected formal regime, the project must establish the appropriate uniqueness statement for accepted realizations, typically uniqueness up to a structure-preserving isomorphism/equivalence appropriate to that regime.

The certificate must preserve at least:

```text
0_N
S_N
carrier identity/equivalence
```

and any additional structure included in the chosen core characterization.

BOMA does not assume without proof that uniqueness results transfer unchanged across different foundational regimes.

---

# PART VII — RELATION TO THE PRE-NUMERICAL TCT CORE

## NAC-13 — Preservation certificate

The formalization record must classify every relevant TCT contribution as one of:

```text
PRESERVED DIRECTLY
REPRESENTED / TRANSLATED
DERIVED AGAIN FORMALLY
STRENGTHENED BY NEW FORMAL COMMITMENT
NOT USED
```

At minimum the record must account for:

```text
ε base role
ExtU successor-like extension
BR-010 structural equivalence
canonical predecessor/decomposition
structural iteration history
injectivity / empty exclusion / acyclicity results
```

This prevents formalization from erasing the constructional provenance.

---

## NAC-14 — New-commitment ledger

Every property not inherited from the pre-numerical core must be listed explicitly.

Expected new-commitment candidates include:

```text
global carrier
formal carrier equality
global total successor operation
formal generatedness/completion
induction scope
recursion/universal mapping scope
ambient formal logic
existence principles required by the realization
```

Nothing becomes “obvious” merely because it is standard in a familiar foundation.

---

# PART VIII — N-CORE VERSUS ARITHMETIC PACKAGE

## NAC-15 — N-Core completion

A formal candidate may be classified as an accepted **N-Core** only after NAC-01 through NAC-14 have been discharged or explicitly mapped to a justified equivalent obligation.

N-Core acceptance does not yet assert that addition, multiplication, or order have been constructed.

---

## NAC-16 — N-Arithmetic package

After N-Core acceptance, later PDSA cycles should construct and verify, rather than assume:

```text
addition
multiplication
order
interaction laws
```

preferably through the accepted recursion/universal structure and with provenance back to the constructional composition/history where scientifically meaningful.

Stage-One natural-number work is not complete until the required arithmetic package is separately accepted, but arithmetic is not allowed to contaminate the criterion for whether the underlying formal natural-number core exists.

---

# PART IX — ACCEPTANCE MATRIX

A candidate N-Core must provide evidence for:

| ID | Obligation | Required | Typical epistemic class |
|---|---|---:|---|
| NAC-01 | Formal regime declaration | YES | DECLARED / FORMALIZATION-DEPENDENT |
| NAC-02 | Formal carrier | YES | NEW COMMITMENT |
| NAC-03 | Carrier identity | YES | DECLARED / FORMALIZATION-DEPENDENT |
| NAC-04 | Initial element | YES | REALIZATION / CONSTRUCTION |
| NAC-05 | Global successor operation | YES | REALIZATION / CONSTRUCTION |
| NAC-06 | TCT realization correspondence | YES | VERIFIED BRIDGE |
| NAC-07 | No-confusion adequacy | YES | DERIVED / VERIFIED |
| NAC-08 | Generatedness | YES | DERIVED OR DECLARED FORMAL COMPLETION, explicit provenance |
| NAC-09 | Induction adequacy | YES | DERIVED OR REGIME PRINCIPLE, explicit provenance |
| NAC-10 | Recursion/universal mapping adequacy | YES | DERIVED / UNIVERSAL PROPERTY |
| NAC-11 | Natural-number characterization | YES | VERIFIED |
| NAC-12 | Uniqueness/comparison certificate | YES | VERIFIED within regime |
| NAC-13 | TCT preservation certificate | YES | VERIFIED |
| NAC-14 | New-commitment ledger | YES | AUDIT |
| NAC-15 | N-Core closure decision | YES | GOVERNANCE |
| NAC-16 | Arithmetic package | LATER | SEPARATE CONSTRUCTION |

---

# PART X — FAILURE CONDITIONS

A candidate must not be accepted as N-Core if any of the following remains unaddressed:

```text
formal carrier not explicit
carrier equality hidden
TCT bridge absent
successor collapses distinct predecessor roles
initial element appears as a successor
additional carrier elements are not excluded/generatedness is unresolved
induction adequacy is absent
recursion/universal behavior is absent
realization regime is implicit
identification is based only on resemblance to familiar ℕ
formalization erases which commitments were newly introduced
```

---

# PART XI — STATUS

This version is a draft produced in the DO phase of `PDSA-N-001`.

It must be stress-tested against multiple realization styles and deliberately defective candidate structures before it may become authoritative.
