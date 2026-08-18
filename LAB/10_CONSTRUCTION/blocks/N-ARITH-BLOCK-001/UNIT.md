# N-ARITH-BLOCK-001 — Accepted Natural-Number Arithmetic Interface

- **Operational Status:** **ACTIVE — ACCEPTED N-ARITHMETIC EXPORT**
- **Epistemic Status:** **DERIVED CERTIFIED PACKAGE OVER ACCEPTED N-CORE + EXPLICIT REPRESENTATIONAL CHOICES**
- **Acceptance:** `NAA-18 = ACCEPT`
- **PDSA:** `PDSA-N-ARITH-003`
- **Depends on:** `N-BLOCK-007`, accepted addition/multiplication/order Blocks and Junctions, `N-ARITH-J-001`

## Purpose

Provide one canonical downstream arithmetic interface for the accepted natural-number carrier while preserving the complete internal arithmetic DAG and all branch/reconvergence provenance.

## Export

```text
carrier     N_BOMA
zero        z
one         s z
successor   s
addition    add
multiply    mul
order       LE
```

Verified law interface:

```text
addition:
  zero identity left/right
  successor compatibility left/right
  associativity
  commutativity
  cancellation left/right

multiplication:
  zero absorption left/right
  one identity left/right
  successor equations left/right
  associativity
  commutativity
  distributivity left/right over addition

order:
  reflexive
  transitive
  antisymmetric
  total
  zero least
  successor inversion/compatibility
  addition monotone left/right
  multiplication monotone left/right
```

## Acceptance evidence

```text
N-ADD-J-001    PASS / V4+V5
N-MUL-J-001    PASS / V4+V5
N-ORD-J-001    PASS / V4+V5
N-ARITH-J-001  PASS / RESOLVED
NAA-01..17     PASS
NAA-18         ACCEPT
```

Pinned verification:

```text
addition       run 32164861155
multiplication run 32165318266
order/full-stack compatibility run 32165691581
Lean 4.32.1
```

## Provenance invariant

This export does not replace:

```text
addition Route R / Route L
multiplication Route R / Route L
additive order / inductive structural order
```

The accepted interface has multiple preserved production histories.

## Scope

The carrier and formal logic remain those of the accepted Stage-One R-B N-Core. Arithmetic adds downstream definitions and derived laws; it does not retroactively make R-B formalization choices logically necessary.

## Deliberately absent

This Block does not contain:

```text
negative integers
integer additive inverses
integer carrier/quotient/normal form
rational numbers
real numbers
complex numbers
```

These require later domain-specific construction families.

## Sensitivity

Reopen if any accepted arithmetic Junction/Block is invalidated, if the N-Core is reopened, or if formal evidence for a core arithmetic law is superseded by a failure.
