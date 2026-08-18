# PDSA-N-001-ACCEPTANCE-STRESS-001

**Parent cycle:** `PDSA-N-001`  
**Date:** 2026-08-18  
**Status:** COMPLETE — draft acceptance specification is viable with clarifications

## Purpose

Stress-test `BOMA-N-ACCEPT-001` against candidate structures and realization styles so that the specification does not accept a merely successor-shaped structure or silently privilege one foundational framework.

---

## 1. Test A — Current pre-numerical TCT core

### Candidate

Current construction through `TCT-BLOCK-005`.

### Available

```text
ε base role
successor-like ExtU schema
injectivity modulo ≈
empty exclusion
canonical predecessor
structural iteration history
explicit meta-finite-chain acyclicity
```

### Missing relative to acceptance specification

```text
NAC-02 formal global carrier
NAC-03 carrier identity regime
NAC-05 global object-level successor function
NAC-08 formal generatedness of a carrier
NAC-09 induction adequacy
NAC-10 recursion/universal mapping adequacy
NAC-11 formal natural-number characterization
NAC-12 uniqueness certificate
```

### Result

```text
REJECT AS N-CORE
ACCEPT AS PRE-NUMERICAL INPUT TO FORMALIZATION
```

### Learning

The acceptance specification correctly prevents the current TCT achievement from being renamed ℕ prematurely.

---

## 2. Test B — Cyclic successor structure

### Candidate

A formal carrier with an initial-labelled element and a successor operation that eventually returns to an earlier element.

### Failure

A cycle violates the intended no-confusion / generated successor behavior and conflicts with the current TCT acyclicity preservation requirement.

Depending on exact presentation, it fails one or more of:

```text
NAC-06 faithful TCT bridge
NAC-07 no-confusion adequacy
NAC-11 characterization
```

### Result

```text
REJECT
```

---

## 3. Test C — Integers with successor x ↦ x+1 and distinguished 0

### Candidate

```text
carrier = ℤ
0_N = 0
S_N(x) = x + 1
```

### Failure

`0` is in the successor image because a predecessor exists in the integer structure.

Thus:

```text
NAC-07 fails: 0_N is not outside the image of S_N.
```

The carrier also contains elements not generated forward from `0` by the intended natural-number ancestry.

### Result

```text
REJECT
```

### Learning

Injective successor alone is far too weak.

---

## 4. Test D — Natural-number-like chain plus an additional disconnected element/component

### Candidate

A carrier contains a standard-looking `0,S(0),S(S(0)),...` component plus at least one extra element not generated from that initial role.

### Failure

Local successor/no-confusion properties can hold on the intended component while the whole carrier contains additional unrelated structure.

This is detected by:

```text
NAC-08 generatedness / absence of additional elements
NAC-11 adequacy characterization
```

### Result

```text
REJECT
```

### Learning

Generatedness is an independent global obligation and cannot be replaced by local successor properties.

---

## 5. Test E — Collapsing / idempotent successor-like structure

### Candidate

A structure with a point `a` such that:

```text
S(a) = a
```

or with distinct `a,b` for which:

```text
S(a) = S(b).
```

### Failure

Fails the no-confusion package:

```text
successor injectivity
and/or
TCT-preserving realization
```

### Result

```text
REJECT
```

---

## 6. Test F — First-order Peano-style axiomatization considered only model-theoretically

### Candidate

A first-order theory with zero, successor, arithmetic axioms, and first-order induction schema.

### Observation

Such an axiomatization may admit non-isomorphic nonstandard models under ordinary first-order semantics.

Therefore first-order Peano-style axioms **by themselves** do not discharge the BOMA acceptance requirement:

```text
NAC-12 uniqueness / comparison certificate
```

if N-Core acceptance is intended to identify a specific natural-number structure up to the selected regime's appropriate isomorphism/equivalence.

### Result

```text
INSUFFICIENT AS A COMPLETE BOMA N-CORE CERTIFICATE BY ITSELF
```

### Learning

“Peano axioms” must not be used as an ambiguous label. The realization record must state logical order/semantics and what uniqueness theorem is actually available.

---

## 7. Test G — Set-theoretic standard natural-number realization

### Candidate style

A set-theoretic carrier generated from an initial object with a standard successor definition, together with the ambient theory's induction and recursion theorems.

### Required evidence

The realization must still record:

```text
ambient set theory / logic
carrier equality
construction/completion of N
TCT realization bridge
no-confusion proof
induction theorem
recursion theorem
uniqueness/characterization certificate
new-commitment ledger
```

### Result

```text
CAN PASS if all NAC obligations are explicitly discharged
```

The acceptance specification therefore permits but does not silently privilege a set-theoretic route.

---

## 8. Test H — Initial algebra for the unary natural-number signature

### Candidate style

An initial algebra for a formal signature corresponding schematically to:

```text
1 + X
```

with initial/base injection and successor injection/constructor.

### Strength

The initiality/universal property can directly support recursion and often provides a strong no-additional-elements / generatedness characterization within the selected formal regime.

### Required evidence

BOMA still requires:

```text
formal regime declaration
identity/equality
TCT bridge
no-confusion details if not automatic in the ambient regime
induction adequacy or its derivation
uniqueness certificate
commitment ledger
```

### Result

```text
CAN PASS if regime-specific obligations are verified
```

### Learning

The acceptance specification is compatible with universal-property routes without requiring them as the only route.

---

## 9. Test I — Natural Numbers Object (NNO) style realization

### Candidate style

A categorical object with zero and successor satisfying the appropriate NNO universal property in the chosen category.

### Strength

The universal property naturally addresses recursion/universal mapping in a category-relative sense.

### Required evidence

The record must still specify:

```text
category / ambient logic
meaning of equality/morphism/subobject
TCT realization correspondence
available induction/generatedness theorem and its assumptions
category-relative uniqueness
```

### Result

```text
CAN PASS if the declared category supplies the required adequacy results
```

### Learning

NNO acceptance is explicitly category-relative; BOMA does not turn category-relative theorems into unrestricted framework-neutral theorems.

---

## 10. Test J — Free monoid on one generator considered only through the monoid universal property

### Candidate style

Empty word, one generator, concatenation.

### Observation

This closely matches much of the finite constructional TCT core.

However the **monoid universal property alone** classifies morphisms into monoids and does not automatically state the full arbitrary recursion principle expected of an N-Core in every target regime.

### Result

```text
EXCELLENT STRUCTURAL REALIZATION / COMPARISON MODEL
BUT NOT AUTOMATICALLY A COMPLETE N-CORE CERTIFICATE
```

unless additional theorems/structure establish NAC-08 through NAC-12 in the selected formal regime.

### Learning

This confirms the historical distinction between a framework-neutral finite constructional core and the stronger commitments required for a natural-number domain.

---

# 11. Cross-test findings

## F1 — Local successor properties are insufficient

Tests B–E show the need for both:

```text
no-confusion
and
global generatedness / completeness of generation
```

## F2 — Induction alone must be scoped

An induction statement is meaningful only relative to:

```text
admissible predicates/subobjects
ambient logic
carrier semantics
```

The acceptance spec correctly requires regime declaration.

## F3 — Recursion is a core adequacy requirement

A candidate that merely forms a chain but lacks the expected recursion/universal mapping behavior should not yet be treated as a complete N-Core.

## F4 — Uniqueness is necessary to prevent ambiguous “looks like naturals” acceptance

The first-order Peano stress test shows that an axiom list may not uniquely characterize the intended structure in the relevant semantics.

The specification should retain NAC-12.

## F5 — Framework-neutral does not mean formula-identical

Set-theoretic, initial-algebra, and NNO routes can all potentially satisfy the acceptance specification through different proof obligations.

BOMA should compare the **certified contributions** rather than force them to use identical internal definitions.

## F6 — Arithmetic should remain downstream

None of the stress tests requires addition/multiplication to decide whether the core natural-number object is adequately characterized. Keeping N-Core distinct from N-Arithmetic is methodologically sound.

---

# 12. Required clarifications to draft specification

The draft is viable with the following clarifications:

1. NAC-12 must remain mandatory for the Stage-One canonical N-Core; first-order axioms alone are insufficient unless supplemented by an appropriate uniqueness/standardness certificate.
2. NAC-10 requires recursion/universal mapping **adequacy**, not one fixed syntactic formulation.
3. NAC-08 generatedness must be formulated without the circular phrase “after finitely many steps” unless finiteness has already been formalized in the chosen regime independently of the candidate N being defined.
4. The TCT realization bridge should distinguish local schematic correspondence from the formal global completion used to build `N`.
5. A free-monoid realization is not automatically equivalent to a complete N-Core merely because its elements are words in one generator.
6. Arithmetic remains a separate package after N-Core acceptance.

---

# 13. Verdict

```text
BOMA-N-ACCEPT-001 v0.1-draft
    → PASS STRESS TEST WITH CLARIFICATIONS
```

Recommended Act:

- incorporate the clarifications;
- promote the acceptance specification to ACTIVE v1.0;
- close PDSA-N-001;
- keep TCT-BLOCK-006 RESERVED;
- next open a formalization-regime Decision Point/Junction rather than selecting a realization silently.
