# PDSA-Z-003 — Integer Arithmetic / Order Reconvergence

**CycleID:** `PDSA-Z-003`  
**Status:** **CLOSED — PASS WITH RECORDED CORRECTIONS**  
**Date:** 2026-08-18

## PLAN

After `Z-J-001` proved that signed normal forms and difference-pair equivalence classes represent the same integer identities, construct arithmetic and order without allowing the selected signed representation to become the only production history.

Required parallel experiments:

```text
Arithmetic
  DS — direct sign-case arithmetic
  PM — pair arithmetic + normalization

Order
  SD — direct sign/magnitude order
  PD — pair cross-sum order
```

Each pair of routes must develop independently enough to localize failure and then reconverge before canonical promotion.

## DO

### Arithmetic routes

Constructed:

```text
zaddD, zmulD
zaddP, zmulP
```

with pair arithmetic checked for compatibility with `ZEquiv`.

### Arithmetic reconvergence

Established:

```text
∀x y, zaddD x y = zaddP x y
∀x y, zmulD x y = zmulP x y
```

### Canonical ring package

After reconvergence, selected the direct signed functions as the executable spelling and used the pair route as a semantic proof producer.

Verified:

```text
commutative additive group laws
commutative multiplication
one / zero laws
distributivity
N embedding preservation
every integer is a difference of embedded naturals
```

### Order routes

Constructed:

```text
zLEd — direct sign/magnitude order
zLEp — pair cross-sum order
```

and proved:

```text
zLEd x y ↔ zLEp x y.
```

### Canonical ordered-ring package

Derived:

```text
total order
N-order extension
x ≤ y ↔ ∃k : N_BOMA, x + embedN(k) = y
addition translation invariance
negation order reversal
nonnegative multiplication monotonicity
```

## STUDY

### S1 — Representation convergence failure was proof-engineering, not mathematical divergence

The first representation-convergence V5 run passed both independent routes and failed only in equality transport. Replacing dependent elimination with explicit rewriting closed the certificate without modifying either representation.

Learning:

> distinguish route failure from convergence-proof failure.

### S2 — Pair arithmetic first failure localized algebraic proof-normalization defects

The first pair-arithmetic checker run exposed:

```text
orientation error in negation-equivalence proof
orientation error in addition-equivalence proof
summand-order mismatch in multiplication compatibility
insufficient AC normalization for triple products
```

The correction introduced explicit addition/multiplication left-commutativity lemmas and corrected proof directions. No pair operation or equivalence definition changed.

Learning:

> explicit algebraic normalization lemmas are more auditable than relying on tactic guesses about associative/commutative normal forms.

### S3 — Arithmetic convergence exposed only an unexpanded zero embedding

After both arithmetic routes independently passed, convergence failed only on goals of the form:

```text
zero = embedN z
```

Making `embedN` explicit in normalization closed the Junction.

Learning:

> a failed integration checker may indicate representation opacity rather than structural disagreement.

### S4 — Pair representation supplied proof leverage without quotient commitment

The project obtained equivalence-respecting pair arithmetic, ring-law proofs, and pair-order semantics without constructing a quotient carrier.

Learning:

> a non-canonical branch can remain a reusable certified contribution even when its carrier representation is not selected.

### S5 — Derived natural-gap theorem gives a useful bridge

The converged integer order yields:

```text
x ≤ y ↔ ∃k : N_BOMA, x + embedN(k) = y.
```

This theorem became the clean bridge for translation invariance and multiplication by nonnegative factors. It should also be valuable in the mandatory post-Z reverse-engineering experiment.

## V5 evidence

```text
representation convergence   run 32168105466  PASS
arithmetic convergence       run 32169328837  PASS
ring/group/embed/generation  run 32169564747  PASS
order convergence            run 32169832933  PASS
order/ordered-ring laws      run 32170144944  PASS
Lean                         4.32.1
```

## ACT

Promote:

```text
Z-J-001         PASS / RESOLVED
Z-DP-001        signed normal form selected; pair route retained
Z-ARITH-J-001   PASS / RESOLVED
Z-ARITH-BLOCK-003 V5 commutative-ring package
Z-ORD-J-001     PASS / RESOLVED
Z-ORD-BLOCK-001 V5 ordered-integer package
```

Open the final ZA-01..20 integration/commitment audit.

Do **not** open the reverse-engineering experiment until ZA-21 accepts the integer stage.
