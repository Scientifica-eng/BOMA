# PDSA-N-MUL-001 — Written Multiplication Convergence Audit 001

**Status:** **PASS — WRITTEN V4 / V5 PENDING**

## 1. Independent production routes

The accepted N-Core recursor and accepted canonical addition are the only shared mathematical inputs.

### Route R

```text
mulR(a,b) := fold z (x ↦ x + a) b
```

Recursive argument: second.

Defining equations:

```text
mulR(a,z)   = z
mulR(a,s b) = mulR(a,b) + a
```

### Route L

```text
mulL(a,b) := fold z (x ↦ x + b) a
```

Recursive argument: first.

Defining equations:

```text
mulL(z,b)   = z
mulL(s a,b) = mulL(a,b) + b
```

Neither route consumes the other in its definition.

## 2. Opposite-side equations for Route R

### Left zero

For every `b`:

```text
mulR(z,b)=z.
```

Proof: induction on `b`.

Base is definitional. In the step:

```text
mulR(z,s b)
 = mulR(z,b)+z
 = z+z
 = z.
```

### Left successor

For every `a,b`:

```text
mulR(s a,b)=mulR(a,b)+b.
```

Proof: induction on `b`.

The base is immediate. In the step, after the induction hypothesis:

```text
mulR(s a,s b)
 = mulR(s a,b) + s a
 = (mulR(a,b)+b) + s a.
```

Using the accepted addition package:

```text
x + s a = s(x+a)
addition associativity
addition commutativity
```

this becomes:

```text
(mulR(a,b)+a) + s b
 = mulR(a,s b) + s b.
```

No multiplication commutativity is used.

## 3. Route convergence

Target:

```text
∀a b, mulL(a,b)=mulR(a,b).
```

Fix `b` and induct on `a`.

Base:

```text
mulL(z,b)=z=mulR(z,b).
```

Step, using the induction hypothesis and the derived left-successor equation for Route R:

```text
mulL(s a,b)
 = mulL(a,b)+b
 = mulR(a,b)+b
 = mulR(s a,b).
```

Thus the two multiplication routes converge pointwise.

## 4. Provenance consequence

The equality of routes does not erase their different production histories:

```text
Route R = repeated addition of the first factor, indexed by the second construction argument
Route L = repeated addition of the second factor, indexed by the first construction argument
```

Their equality is a theorem requiring the accepted addition laws and induction.

## 5. Canonical multiplication

After route convergence one may choose:

```text
mul := mulR
```

as the canonical spelling. This is an export/representation choice after equivalence, not a theorem that Route R was uniquely forced.

## 6. Commutativity from reconvergence

Definitionally, after swapping arguments:

```text
mulL(b,a)=mulR(a,b).
```

Route convergence at `(b,a)` gives:

```text
mulL(b,a)=mulR(b,a).
```

Therefore:

```text
mulR(a,b)=mulR(b,a).
```

So multiplication commutativity again has direct branch-reconvergence provenance rather than being imported as a familiar arithmetic fact.

## 7. Zero and one

Define structurally:

```text
one := s(z).
```

Zero absorption follows from the two recursive-side zero equations.

Right one:

```text
mul(a,one)
 = mul(a,s z)
 = mul(a,z)+a
 = z+a
 = a.
```

Left one follows by multiplication commutativity.

## 8. Distributivity

Right distributivity:

```text
mul(a,b+c)=mul(a,b)+mul(a,c)
```

is proved by induction on `c`, using the recursive multiplication equation and addition associativity.

Left distributivity follows from multiplication commutativity plus right distributivity.

## 9. Associativity

For:

```text
mul(mul(a,b),c)=mul(a,mul(b,c))
```

induct on `c`.

The step reduces the left side using multiplication recursion and the right side using right distributivity; the induction hypothesis then identifies the remaining recursive terms.

## 10. Written verdict

```text
Route R independent construction       PASS
Route L independent construction       PASS
opposite-side Route-R equations         PASS
route equivalence                       PASS
provenance separation                   PASS
zero absorption                         PASS
one identities                          PASS
commutativity                           PASS
distributivity left/right               PASS
associativity                           PASS
written cross-path level                V4 PASS
formal V5                               PENDING OBSERVATION
```

## 11. Act condition

`N-MUL-J-001` may be classified **CONDITIONAL PASS — WRITTEN V4 / V5 PENDING**.

Canonical multiplication and laws may be treated as a written-pass candidate but must not be promoted to accepted arithmetic contributions until the dedicated claim-level V5 run succeeds and is mapped to the owning units.
