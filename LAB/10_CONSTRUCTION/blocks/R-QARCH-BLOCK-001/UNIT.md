# R-QARCH-BLOCK-001 — Reusable Rational Archimedean Approximation for R

- **Operational Status:** **PASS / ACTIVE**
- **Epistemic Status:** **DERIVED + VERIFIED WITH ISOLATED LOGICAL SUBDEPENDENCY**
- **Stage:** `R_STAGE`
- **Decision:** `R-DP-004 — Route A selected`
- **Primary targets:** `RG-01`, `RA-05`
- **Expected future reuse:** `RA-12`, `RA-13`, `RE-R-001`

## Certified contribution chain

### 1. Natural upper bound

```text
∀q : QBOMA,
  ∃n : N_BOMA,
    q ≤ qOfN(n)
```

Derived directly from the explicit fraction carrier and structural positivity of denominators.

V5:

```text
32185265579 PASS
```

### 2. Archimedean scaling

```text
∀ gap delta : QBOMA,
  0 < delta →
  ∃ n : N_BOMA,
    gap ≤ qOfN(n) * delta
```

The accepted rational inverse is consumed as an existential witness only.

V5:

```text
32185547400 PASS
```

### 3. Finite rational grid crossing

```text
qGrid(a,delta,n) := a + qOfN(n)*delta
```

A positive-step grid eventually reaches beyond any known rational point outside a proper lower cut.

This is an arithmetic consequence of the scaling theorem and does not require deciding arbitrary cut membership.

### 4. Finite membership exit search

For an inside base and a finite endpoint outside, an adjacent inside/outside grid pair exists.

The only explicit nonconstructive step in the block is here:

```text
Classical.em (A.lower (qGrid ... n))
```

V5:

```text
32186080453 PASS
```

### 5. Arbitrarily fine cut bracketing

For every lower cut and every positive rational epsilon:

```text
∃ b r,
  b ∈ A ∧
  r ∉ A ∧
  0 < r-b ∧
  r-b < eps.
```

Concrete theorem:

```text
cut_bracket_approx
```

V5:

```text
32186209544 PASS
```

## Logical classification

Do not propagate the local classical search requirement to the arithmetic contributions.

```text
Q natural upper bound        CONSTRUCTIVE PROOF REGION
Q Archimedean scaling        CONSTRUCTIVE PROOF REGION
Q grid crossing              CONSTRUCTIVE PROOF REGION
finite LowerCut exit search  LOCAL CLASSICAL PROOF PROVENANCE
cut bracket theorem          CONSUMES BOTH REGIONS
```

## Forbidden-shortcut audit

This block does not use:

```text
built-in Rat
built-in Real
prepackaged Archimedean instance
prepackaged floor/ceiling
Choice-based global cut boundary
```

## Reuse contract

Downstream units should consume the narrow theorem they need rather than reimplement the fraction-level proof.

In particular:

```text
RA-05 additive inverse
```

should consume `cut_bracket_approx` explicitly.

Future RA-12 / RA-13 proofs may consume the arithmetic subinterfaces directly if cut membership is irrelevant.

## Reverse-engineering note

`RE-R-001` must classify separately:

```text
fraction-level natural upper bound
Archimedean scaling
finite grid arithmetic
Dedekind predicate-membership search
```

because only the last of these is clearly specific to the current arbitrary-predicate LowerCut realization and its logical regime.
