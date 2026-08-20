# N_ARITH_CLAIM_CLOSURE_AUDIT_001 — PDSA-ARCH-002 Declared-Closure Map

**Status:** DECLARED-CLOSURE COMPLETE / FORMAL-CLOSURE COMPARISON NOT YET AUTOMATED  
**Date:** 2026-08-20  
**Target:** `N-ARITH-BLOCK-001 — Accepted Natural-Number Arithmetic Interface`  
**Acceptance:** `NAA-18 = ACCEPT`  
**Program:** `PDSA-ARCH-002`

## 1. Purpose

Map the accepted natural arithmetic package into explicit claim families while preserving the branch/reconvergence topology of addition, multiplication, and order.

## 2. Construction topology

```text
accepted N-BLOCK-007
  ├─ Addition Route R ─┐
  │                    ├─ N-ADD-J-001 → canonical addition/laws
  ├─ Addition Route L ─┘
  │
  ├─ Multiplication Route R ─┐
  │                          ├─ N-MUL-J-001 → canonical multiplication/laws
  ├─ Multiplication Route L ─┘
  │
  ├─ Additive-witness order ─┐
  │                          ├─ N-ORD-J-001 → canonical order/laws
  └─ Independent inductive order ─┘

canonical add/mul/order packages
  ↓
N-ARITH-J-001
  ↓
N-ARITH-BLOCK-001 / NAA-18
```

## 3. Acceptance-level claim families

### NAR-CL-ADDDEF-001 — Dual addition definitions

**Statement/scope:** `addR` is defined by recursion on the second argument; `addL` is independently defined by recursion on the first argument, each with its own computation equations.  
**Producers:** `N-ADD-BLOCK-001`, `N-ADD-BLOCK-002`.  
**Classification:** `CONSTRUCTED / ALTERNATIVE PRODUCER ROUTES`, not yet canonical merely by definition.

### NAR-CL-ADDCONV-001 — Addition route convergence

**Statement/scope:**

```text
∀ a b, addL a b = addR a b
```

with opposite-side recursion equations derived as part of the convergence proof.  
**Producer:** `N-ADD-BR-005`, `N-ADD-BR-006` → `N-ADD-J-001`.  
**Classification:** `MATHEMATICAL_CLAIM / RECONVERGENCE CERTIFICATE`.  
**Evidence:** addition V5 `32164861155`.

### NAR-CL-ADD-001 — Canonical addition and laws

**Statement/scope:** canonical `add := addR` after verified convergence, with:

```text
zero identities left/right
successor compatibility left/right
associativity
commutativity
cancellation left/right
```

**Producer:** `N-ADD-BLOCK-003` from `N-ADD-BR-007..012`.  
**Classification:** `MATHEMATICAL_CLAIM`; selecting `addR` as canonical executable spelling after convergence is a methodological representation choice, not rejection of `addL`.  
**Evidence:** addition V5 `32164861155`.

### NAR-CL-MULDEF-001 — Dual multiplication definitions

**Statement/scope:** `mulR` and `mulL` are independently defined by recursion on opposite arguments with their own computation equations.  
**Producers:** `N-MUL-BLOCK-001`, `N-MUL-BLOCK-002`.  
**Classification:** `CONSTRUCTED / ALTERNATIVE PRODUCER ROUTES`.

### NAR-CL-MULCONV-001 — Multiplication route convergence

**Statement/scope:**

```text
∀ a b, mulL a b = mulR a b
```

with the necessary cross-side recursion equations.  
**Producer:** `N-MUL-BR-005`, `N-MUL-BR-006` → `N-MUL-J-001`.  
**Classification:** `MATHEMATICAL_CLAIM / RECONVERGENCE CERTIFICATE`.  
**Evidence:** multiplication V5 `32165318266`.

### NAR-CL-MUL-001 — Canonical multiplication and laws

**Statement/scope:** canonical multiplication with:

```text
zero absorption left/right
one identities left/right
successor equations left/right
associativity
commutativity
distributivity left/right over addition
```

**Producer:** `N-MUL-BLOCK-003` from `N-MUL-BR-007..012`.  
**Dependencies:** accepted canonical addition.  
**Classification:** `MATHEMATICAL_CLAIM`.  
**Evidence:** multiplication V5 `32165318266`.

### NAR-CL-ORDERDEF-001 — Two independent order routes

**Statement/scope:**

Route A:

```text
LEAdd(a,b) ↔ ∃k, add a k = b
```

Route B: independently generated inductive structural order not defined through addition.  
**Producers:** `N-ORD-BLOCK-001`, `N-ORD-BLOCK-002`.  
**Classification:** `CONSTRUCTED / ALTERNATIVE PRODUCER ROUTES`; Route B's independence is part of the branch design and must not be erased.

### NAR-CL-ORDERCONV-001 — Order route equivalence

**Statement/scope:** additive-witness order and independent inductive order coincide extensionally on `N_BOMA`.  
**Producer:** `N-ORD-BR-005..007` → `N-ORD-J-001`.  
**Classification:** `MATHEMATICAL_CLAIM / RECONVERGENCE CERTIFICATE`.  
**Evidence:** order/full-stack V5 `32165691581`.

### NAR-CL-ORDER-001 — Canonical natural order and laws

**Statement/scope:** accepted `LE` satisfies:

```text
reflexive
transitive
antisymmetric
total
zero least
successor inversion/compatibility
```

**Producer:** `N-ORD-BLOCK-003` from `N-ORD-BR-008..010`.  
**Classification:** `MATHEMATICAL_CLAIM`.  
**Evidence:** order/full-stack V5 `32165691581`.

### NAR-CL-ORDERARITH-001 — Arithmetic/order compatibility

**Statement/scope:**

```text
addition monotone left/right
multiplication monotone left/right
```

for the accepted natural order.  
**Producer:** `N-ORD-BLOCK-004` from `N-ORD-BR-011..012`.  
**Dependencies:** canonical addition/multiplication/order packages.  
**Classification:** `MATHEMATICAL_CLAIM`.  
**Evidence:** order/full-stack V5 `32165691581`.

### NAR-CL-INTEGRATION-001 — Accepted N-Arithmetic integration

**Statement/scope:**

```text
N_BOMA
z
one := s z
s
add
mul
LE
```

and all accepted law families above coexist on the accepted N-Core carrier while retaining the independent route/Junction production histories.  
**Producer:** accepted arithmetic Blocks/Junctions → `N-ARITH-J-001` → `N-ARITH-BLOCK-001`.  
**Acceptance:** `NAA-18 = ACCEPT`.  
**Classification:** `MATHEMATICAL_CLAIM / ACCEPTANCE GOVERNANCE`.  
**Evidence:** addition `32164861155`, multiplication `32165318266`, order/full stack `32165691581`.

## 4. Dependency and commitment boundary

N-Arithmetic consumes the accepted `N-BLOCK-007` carrier/identity/recursion/induction interface. It does not retroactively prove that the selected N-Core formalization regime was mathematically forced.

Thus:

```text
accepted arithmetic laws                         MATHEMATICAL_CLAIMS
right/left recursive producer spellings           REPRESENTATION / CONSTRUCTION ROUTES
R-B N-Core global inductive formal carrier         inherited FORMALIZATION COMMITMENT
Lean induction/recursion checker infrastructure    TRUSTED_METATHEORY / VERIFICATION INFRASTRUCTURE
```

No arithmetic branch is erased merely because a canonical spelling is exported after reconvergence.

## 5. Important non-claims

The accepted N-Arithmetic closure does not claim:

```text
negative integers
additive inverses on N
integer carrier
rational/real/complex structure
necessity of recurse-right rather than recurse-left definitions
necessity of additive-witness rather than inductive order
```

## 6. Transparency status

At the current claim-audit granularity:

```text
N-ARITHMETIC DECLARED CLAIM CLOSURE = COMPLETE
```

A machine-derived theorem-level actual dependency closure has not yet been compared against the declared closure; therefore no automated `N-ARITHMETIC TRANSPARENCY PASS` is promoted yet.
