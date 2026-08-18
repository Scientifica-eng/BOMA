# R-MUL-BLOCK-001 — Accepted Stage-One Real Ordered Commutative-Ring Multiplication

- **Operational Status:** **PASS / ACTIVE**
- **Epistemic Status:** **CONSTRUCTED + VERIFIED**
- **Stage:** `R_STAGE`
- **Inputs:** `R-ADD-GROUP-BLOCK-001`, `R-DP-005`, Q multiplicative-approximation contribution, selected Dedekind order
- **Acceptance obligations:** `RA-04` multiplicative one, `RA-07`, ring/order portion of `RA-09`, multiplication part of `RA-10`
- **Does not discharge:** `RA-08` nonzero multiplicative inverse

## Selected operation

The canonical Stage-I multiplication is the decomposition route selected by `R-DP-005`:

```text
x⁺ := max(x,0)
x⁻ := max(-x,0)

x * y :=
  x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺
```

Lean interface:

```text
rMulCandidate : RBOMA → RBOMA → RBOMA
```

The operation definition itself contains no proposition-valued sign `if`. Sign comparison occurs in proof-level identification/quadrant arguments through the already-isolated classical total-order boundary.

## Verified construction layers

### Positive envelope

```text
cutPosPart / rPosPart
```

V5 `32187088594` — PASS.

### Nonnegative multiplication kernel

```text
cutMulNonnegEnvelope / rMulNonnegEnvelope
```

Representative-invariant and commutative.

V5 `32187257316` — PASS.

### Reusable Q multiplicative approximation

Strict positive multiplication, cancellation through existential inverse witnesses, and interior product witnesses.

V5 `32187796232` — PASS.

### Q preservation

```text
nonnegative Q preservation  32187981163 PASS
all-sign Q preservation     32189753112 PASS
```

## Verified kernel laws

```text
K(0,x)=0
K(x,0)=0
K(1,x)=x⁺
K(x,1)=x⁺
K(K(x,y),z)=K(x,K(y,z))
```

V5 `32190372037` — PASS.

Kernel distributivity on nonnegative right inputs:

```text
K(A,B+C)=K(A,B)+K(A,C)   when B,C ≥ 0
```

V5 `32191468468` — PASS.

No new Archimedean approximation gateway was needed for this distributive interface; Q density, cut roundedness, rational distributivity, and the existing strict-order/product interface sufficed.

## Signed decomposition and sign laws

Positive/negative reconstruction:

```text
x = x⁺ - x⁻
```

V5 `32190664688` — PASS.

Basic signed laws:

```text
x*y = y*x
0*x = 0 = x*0
1*x = x = x*1
```

V5 `32191203164` — PASS.

Quadrant reductions:

```text
(+,+) → K
(+,-) → -K
(-,+) → -K
(-,-) → K on negated inputs
```

and arbitrary nonpositive-factor annihilation for the nonnegative kernel.

V5 `32191828021` — PASS.

## Verified ring laws

Associativity:

```text
(x*y)*z = x*(y*z)
```

V5 `32191975377` — PASS.

Derived additive-group identities used by distributivity:

```text
-(a+b)=(-a)+(-b)
additive cancellation/rearrangement identities
```

V5 `32192550245` — PASS.

Full signed distributivity:

```text
x*(y+z)=x*y+x*z
(x+y)*z=x*z+y*z
```

V5 `32192506728` — PASS.

## Ordered-ring compatibility

The formal order/addition interface first establishes:

```text
x≤x' and y≤y'  →  x+y≤x'+y'
```

with closure of nonnegative/nonpositive reals under addition.

V5 `32192220694` — PASS.

Then the multiplication/order layer proves:

```text
x≤y  ↔  0≤y-x
0≤x and 0≤y  →  0≤x*y
x*(-y)=-(x*y)
(-x)*y=-(x*y)
0≤c and x≤y  →  c*x≤c*y
0≤c and x≤y  →  x*c≤y*c
```

V5 `32192653931` — PASS.

## Acceptance effect

This block certifies the selected multiplication as an **ordered commutative-ring multiplication** over `RBOMA`.

Current effects:

```text
RA-04 zero/one                         PASS at ring level
RA-07 multiplication                   PASS at ordered-ring level
RA-09 ordered-field laws               PARTIAL — ordered-ring part PASS; field inverse pending
RA-10 Q structure preservation         multiplication PASS
```

It does **not** justify calling the Stage-One real carrier a field yet. `RA-08` remains a separate required gate:

```text
x ≠ 0  →  ∃ y, x*y = 1
```

with representative invariance and compatibility with the selected ordered-ring structure.

## Logical provenance

```text
operation definitions                    no sign-case selector
kernel witness algebra                   constructive relative to declared metatheory/interfaces
signed decomposition/quadrant proofs     consume isolated classical real-order comparability
signed distributivity                    localized sign classification + certified K3 + additive-group algebra
ordered-ring monotonicity                derived algebraically from difference nonnegativity + distributivity
```

## Reverse-engineering note

`RE-R-001` must preserve at least these distinct dependencies:

```text
positive-envelope construction;
nonnegative kernel;
Q inner-product approximation reused by K1/K2;
Q density + roundedness used by K3;
signed decomposition;
proof-only classical sign classification;
additive order compatibility;
ordered-ring monotonicity derived from S5 rather than direct cut witness reconstruction;
proof-engineering failures versus mathematical dependencies.
```

This block is therefore an especially important reverse-engineering junction before the field-inverse construction is analyzed.
