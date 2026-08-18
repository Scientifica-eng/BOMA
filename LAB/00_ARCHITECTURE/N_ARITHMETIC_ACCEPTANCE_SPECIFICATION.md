# N-ARITHMETIC ACCEPTANCE SPECIFICATION

**Document ID:** `BOMA-N-ARITH-ACCEPT-001`  
**Version:** `1.0`  
**Status:** **ACTIVE — TARGET SPECIFICATION**  
**Depends on:** `N-BLOCK-007 — Accepted Natural-Number Core Interface`

## Purpose

Define what must be constructed and verified before BOMA may classify its accepted natural-number core as equipped with the intended Stage-One arithmetic package.

This specification does not construct arithmetic by declaration. It defines the acceptance target before the operations are promoted.

## Separation invariant

```text
accepted N-Core
    ≠
accepted N-Arithmetic package
```

The carrier `N_BOMA`, `z`, `s`, induction, recursion, and TCT ancestry are already accepted. Addition, multiplication, and order must now be constructed as downstream contributions.

---

# Addition obligations

## NAA-01 — Total binary addition

Construct an explicit operation:

```text
add : N_BOMA → N_BOMA → N_BOMA
```

without changing the accepted carrier.

## NAA-02 — Recursion provenance

Record exactly which N-Core recursion interface constructs the operation and which argument is recursive.

If multiple recursive orientations are constructed, preserve them as distinct production routes.

## NAA-03 — Defining equations

For the canonical addition interface establish at least:

```text
a + z     = a
a + s(b)  = s(a + b)
```

and establish the corresponding left-side equations as derived results or as a verified convergent route:

```text
z + b     = b
s(a) + b  = s(a + b)
```

## NAA-04 — Route convergence

When both left-recursive and right-recursive constructions are retained, prove that they define the same binary operation pointwise before exporting one canonical interface.

## NAA-05 — Addition laws

At minimum:

```text
left/right zero identity
commutativity
associativity
successor compatibility on both arguments
cancellation sufficient for downstream order/integer work
```

Each law must have explicit Brick ownership and verification evidence.

---

# Multiplication obligations

## NAA-06 — Total binary multiplication

Construct:

```text
mul : N_BOMA → N_BOMA → N_BOMA
```

using accepted N-Core recursion and the accepted addition contribution.

## NAA-07 — Multiplication defining equations

At minimum:

```text
a * z     = z
a * s(b)  = (a * b) + a
```

with corresponding left-side equations derived or independently constructed/converged.

## NAA-08 — Multiplication route convergence

If both recursive orientations are constructed, preserve and compare them rather than silently replacing one with the other.

## NAA-09 — Multiplicative laws

At minimum:

```text
zero absorption
one identity, with one explicitly derived as s(z)
commutativity
associativity
left/right distributivity over addition
```

---

# Order obligations

## NAA-10 — Explicit order construction

Construct an order relation rather than importing a built-in order on an external Nat type.

Candidate routes may include, for example:

```text
additive-witness order:  a ≤ b iff there exists k with a + k = b
inductive order relation
```

If more than one route is developed, preserve the distinct definitions and require an explicit equivalence Junction.

## NAA-11 — Order laws

Establish:

```text
reflexivity
transitivity
antisymmetry
totality
z least
successor monotonicity / compatibility
```

## NAA-12 — Arithmetic/order compatibility

At minimum establish the compatibility needed downstream:

```text
addition monotonicity
multiplication monotonicity in the nonnegative natural-number setting
successor/order correspondence as appropriate to the selected order interface
```

---

# Integrated arithmetic obligations

## NAA-13 — Structural algebra package

Record the resulting algebraic package explicitly. Do not simply label it “semiring” unless all required laws for the adopted interface have been proved and the exact convention is declared.

## NAA-14 — Dependency and commitment ledger

Classify for every arithmetic contribution:

```text
DERIVED FROM ACCEPTED N-CORE
DERIVED FROM EARLIER ARITHMETIC BLOCK
DECLARED REPRESENTATIONAL CHOICE
METHODOLOGICAL CHOICE
BACKEND-ONLY REPRESENTATION
```

No arithmetic law may become “obvious” by silently appealing to Lean built-in `Nat`.

## NAA-15 — Branch/reconvergence record

For each deliberately parallel construction record:

```text
branch-specific definitions
branch-specific assumptions
convergence theorem/interface
what reusable contribution is exported after convergence
what provenance is preserved
```

## NAA-16 — Formal verification

Machine-relevant claims must be checked under a pinned/reproducible backend and mapped to canonical Bricks/Blocks/Junctions.

Formal checking is evidence, not the architecture itself.

## NAA-17 — Arithmetic integration gate

A final Junction must verify that accepted addition, multiplication, order, algebraic laws, and commitment records are mutually compatible.

## NAA-18 — Arithmetic closure

Only after NAA-01 through NAA-17 pass may the project classify the intended Stage-One **N-Arithmetic Package** as accepted and promote the transition to integers.

---

# Initial topology preference

The first arithmetic experiment intentionally uses a split/reconvergence pattern:

```text
N-BLOCK-007
   ├── right-recursive addition
   └── left-recursive addition
             ↓
      addition convergence Junction
             ↓
       canonical addition
```

This is a parallel construction experiment, not a Decision Point requiring one route to be discarded.

The same topology should be considered for multiplication and for alternative order constructions when scientifically useful.

## Guardrail

Passing `NAC-15` did not make any of NAA-01..18 true automatically.
