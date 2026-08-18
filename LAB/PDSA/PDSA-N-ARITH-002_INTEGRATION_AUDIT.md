# PDSA-N-ARITH-002 — N-Arithmetic Integration Audit

**CycleID:** `PDSA-N-ARITH-002`  
**Date:** 2026-08-18  
**Status:** **CLOSED — PASS / NAA-01..17 SATISFIED**

## Research question

Do accepted addition, multiplication, and order form one mutually compatible, traceable Stage-One arithmetic package over the already accepted N-Core, with all branch/reconvergence and commitment obligations exposed?

## Inputs

```text
N-BLOCK-007 — accepted N-Core
BOMA-N-ARITH-ACCEPT-001 v1.0
N-ADD-BLOCK-003 / N-ADD-J-001
N-MUL-BLOCK-003 / N-MUL-J-001
N-ORD-BLOCK-003 / N-ORD-BLOCK-004 / N-ORD-J-001
addition V5 run 32164861155
multiplication V5 run 32165318266
order/integrated arithmetic V5 run 32165691581
```

---

# 1. NAA matrix

| Obligation | Evidence | Result |
|---|---|---|
| NAA-01 total addition | `N-ADD-BR-007` | PASS |
| NAA-02 addition recursion provenance | dual Route R/L records | PASS |
| NAA-03 addition defining equations | `N-ADD-BR-002/004/005/009` | PASS |
| NAA-04 addition route convergence | `N-ADD-J-001` | PASS |
| NAA-05 addition laws/cancellation | `N-ADD-BLOCK-003` | PASS |
| NAA-06 total multiplication | `N-MUL-BR-007` | PASS |
| NAA-07 multiplication equations | `N-MUL-BR-002/004/005/009` | PASS |
| NAA-08 multiplication route convergence | `N-MUL-J-001` | PASS |
| NAA-09 multiplication laws | `N-MUL-BLOCK-003` | PASS |
| NAA-10 explicit order construction | `N-ORD-BLOCK-001/002` | PASS — two routes |
| NAA-11 order laws | `N-ORD-BLOCK-003` | PASS |
| NAA-12 arithmetic/order compatibility | `N-ORD-BLOCK-004` | PASS |
| NAA-13 structural algebra package | exact interface below | PASS |
| NAA-14 dependency/commitment ledger | section 4 | PASS |
| NAA-15 branch/reconvergence record | section 5 | PASS |
| NAA-16 formal verification | three pinned V5 runs | PASS |
| NAA-17 arithmetic integration gate | sections 2–7 | PASS |

NAA-18 is deliberately excluded from this table because it is the separate closure decision after this integration PASS.

---

# 2. Exact algebraic interface — NAA-13

The package exports these verified operations and constants:

```text
z       : N_BOMA
one     : N_BOMA := s z
add     : N_BOMA → N_BOMA → N_BOMA
mul     : N_BOMA → N_BOMA → N_BOMA
LE      : N_BOMA → N_BOMA → Prop
```

Verified additive laws:

```text
z is left/right additive identity
addition is associative
addition is commutative
left/right addition cancellation
successor compatibility on both arguments
```

Verified multiplicative laws:

```text
z is left/right absorbing
one is left/right multiplicative identity
multiplication is associative
multiplication is commutative
left/right distributivity over addition
successor multiplication equations on both arguments
```

Verified order laws:

```text
reflexive
transitive
antisymmetric
total
z least
no successor ≤ z
s a ≤ s b ↔ a ≤ b
```

Verified compatibility:

```text
addition monotone on both sides
multiplication monotone on both sides
```

This exact exported law set is authoritative. The project does not rely on an ambiguous external label such as “semiring” or “ordered semiring” to smuggle conventions that were not independently verified.

---

# 3. Dependency / non-circularity audit

Canonical dependency direction:

```text
accepted N-Core
     ↓
addition
     ↓
multiplication

accepted N-Core ─────────► structural order route
addition ────────────────► additive-witness order route
          both routes ───► order convergence

addition + multiplication + canonical order
     ↓
arithmetic/order compatibility
```

No circularity was found:

- addition does not depend on multiplication or order;
- multiplication depends on addition but not order;
- the inductive order route depends only on N-Core;
- the additive order route depends on addition but not multiplication;
- order convergence does not define addition or multiplication;
- multiplication monotonicity uses already accepted multiplication and order; it is downstream compatibility, not a premise of either construction.

---

# 4. NAA-14 commitment ledger

## Addition

```text
addR / addL definitions       DERIVED FROM ACCEPTED RECURSOR + ORIENTATION CHOICE
route equations               DERIVED / COMPUTATIONAL
route equivalence             DERIVED CROSS-PATH
canonical add := addR         REPRESENTATIONAL CHOICE AFTER EQUIVALENCE
addition laws                 DERIVED
```

No new carrier or foundational axiom is introduced.

## Multiplication

```text
mulR / mulL definitions       DERIVED FROM RECURSOR + ACCEPTED ADDITION + ORIENTATION CHOICE
route equivalence             DERIVED CROSS-PATH
canonical mul := mulR         REPRESENTATIONAL CHOICE AFTER EQUIVALENCE
one := s z                    DERIVED STRUCTURAL DEFINITION
multiplication laws           DERIVED FROM N-CORE + ADDITION + RECURSION/INDUCTION
```

## Order

```text
LEAdd                         CONSTRUCTED DEFINITION FROM ACCEPTED ADDITION
LEInd                         CONSTRUCTED INDUCTIVE RELATION FROM N-CORE ONLY
route translations            DERIVED
route equivalence             DERIVED CROSS-PATH
canonical LE := LEAdd         REPRESENTATIONAL CHOICE AFTER EQUIVALENCE
order laws                    DERIVED; some use structural-route proofs via translation
arithmetic monotonicity       DERIVED DOWNSTREAM COMPATIBILITY
```

`LEInd` is a new defined relation in the selected formal regime, not a new foundational axiom and not an imported built-in order.

## Backend

Lean fragments and workflows remain `BACKEND-ONLY EVIDENCE PRODUCERS`. No Lean built-in `Nat`, built-in natural addition/multiplication, or built-in natural order is used as the canonical definition.

---

# 5. NAA-15 branch/reconvergence ledger

## Addition

```text
Route R — recurse on second argument
Route L — recurse on first argument
N-ADD-J-001 — pointwise convergence PASS
```

Commutativity receives direct provenance from route reconvergence.

## Multiplication

```text
Route R — recurse on second factor using repeated addition of first
Route L — recurse on first factor using repeated addition of second
N-MUL-J-001 — pointwise convergence PASS
```

Multiplication commutativity likewise records reconvergence provenance.

## Order

```text
Route A — additive gap witness; depends on addition
Route B — inductive successor structure; depends only on N-Core
N-ORD-J-001 — logical equivalence PASS
```

This is the strongest dependency-diverse convergence experiment in the arithmetic phase: a structural route and an arithmetic route produce the same order relation.

Reconvergence does not erase any branch identity.

---

# 6. NAA-16 formal verification

Observed pinned-toolchain evidence:

```text
Addition
  run 32164861155
  Lean 4.32.1
  Route R / Route L / convergence / laws = PASS

Multiplication
  run 32165318266
  Lean 4.32.1
  Route R / Route L / convergence / laws = PASS

Order
  run 32165691581
  Lean 4.32.1
  additive route / independent inductive route / convergence / laws+compatibility = PASS
```

The final order workflow's laws step assembles the accepted N-Core, addition, multiplication, both order routes, their convergence, and arithmetic/order compatibility in one checked source. It therefore provides additional whole-stack compatibility evidence while remaining subordinate to the canonical DAG.

---

# 7. Integration conclusion — NAA-17

No unresolved incompatibility, circular dependency, hidden arithmetic import, or unrecorded foundational commitment was found across the accepted arithmetic DAG.

Therefore:

```text
NAA-01..17 = PASS
N-Arithmetic Integration Gate = PASS / RESOLVED
```

This makes the project eligible for the separate NAA-18 closure decision.

It does not itself construct integers.

---

# STUDY

1. Addition and multiplication reconvergence turn commutativity from an imported familiar fact into a theorem with explicit multi-route provenance.
2. Order reconvergence demonstrates a stronger architecture: branches can have different dependency layers and still meet at a verified common contribution.
3. The inductive order route provides an audit against circular arithmetic definitions because it exists without arithmetic imports.
4. The final arithmetic structure grew as a DAG rather than a monolithic algebra declaration.
5. No new foundational commitment beyond the already accepted R-B N-Core regime was required for arithmetic; arithmetic added definitions and derived structure.

# ACT

Create/close `N-ARITH-J-001` as PASS. Then perform NAA-18 as a separate closure decision before any integer construction is promoted.
