# R-ADD-GROUP-BLOCK-001 — Accepted Stage-One Real Additive Group

- **Operational Status:** **PASS / ACTIVE**
- **Epistemic Status:** **CONSTRUCTED + VERIFIED**
- **Stage:** `R_STAGE`
- **Inputs:** `R-ADD-BLOCK-001`, `R-NEG-CANDIDATE-BLOCK-001`, `R-QARCH-BLOCK-001`
- **Acceptance obligations:** `RA-05`, `RA-06`, additive part of `RA-09`, additive/negation part of `RA-10`

## Formal operations

```text
rZero : RBOMA
rAdd  : RBOMA → RBOMA → RBOMA
rNeg  : RBOMA → RBOMA
```

## Verified additive laws

```text
rAdd x y = rAdd y x
rAdd (rAdd x y) z = rAdd x (rAdd y z)
rAdd rZero x = x
rAdd x rZero = x
rAdd x (rNeg x) = rZero
rAdd (rNeg x) x = rZero
```

Derived interface:

```text
additive cancellation
uniqueness of additive inverse
rNeg(rNeg x)=x
```

## Additive-inverse dependency split

Raw inclusion:

```text
A + (-A) ⊆ principalCut(0)
```

is proved from lower-set/order structure without Archimedean bracketing.

Reverse inclusion:

```text
principalCut(0) ⊆ A + (-A)
```

consumes the explicit `cut_bracket_approx` interface from `R-QARCH-BLOCK-001`.

Thus the Archimedean contribution is attached only to the half of the inverse proof that needs arbitrary boundary precision.

## Verification

```text
addition construction / quotient lift      32183597094 PASS
Q embedding preserves addition             32183864915 PASS
commutative-monoid laws                     32184188077 PASS
negation candidate / Q preservation         32184767097 PASS
fine cut bracketing                         32186209544 PASS
additive inverse / cancellation / involution 32186543211 PASS
```

## Acceptance effect

```text
RA-05 Negation / additive inverse = PASS
RA-06 Addition                    = PASS
RA-10 Q preserves negation/addition = PASS
```

`RA-09` remains only partially discharged because multiplication, distributivity, multiplicative inverse, and full order compatibility are not yet complete.

## Reverse-engineering note

`RE-R-001` must retain the asymmetry between the two directions of the inverse theorem. It is evidence that the fine-approximation gateway is not needed merely to define negation or prove one containment; it is consumed specifically by existence of sufficiently tight witnesses for the reverse containment.
