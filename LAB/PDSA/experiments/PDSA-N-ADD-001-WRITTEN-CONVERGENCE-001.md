# PDSA-N-ADD-001 — Written Addition Convergence Audit 001

**Status:** **PASS — WRITTEN V4 / V5 PENDING**

## 1. Route independence

Route R is defined only from the accepted recursor:

```text
addR(a,b) := fold a s b
```

and therefore immediately has:

```text
addR(a,z)   = a
addR(a,sb)  = s(addR(a,b)).
```

Route L is independently defined:

```text
addL(a,b) := fold b s a
```

with:

```text
addL(z,b)   = b
addL(sa,b)  = s(addL(a,b)).
```

Neither definition consumes the other route.

## 2. Opposite-side equations for Route R

### Zero on the left

Claim:

```text
addR(z,b)=b.
```

Proof by induction on `b`.

Base:

```text
addR(z,z)=z.
```

Step:

```text
addR(z,sb)
 = s(addR(z,b))
 = s(b).
```

### Successor on the left

Claim:

```text
addR(sa,b)=s(addR(a,b)).
```

Again induct on `b`.

Base follows from the defining zero equation. In the successor case both sides acquire one outer `s`, and the induction hypothesis identifies their predecessors.

These results are derived properties of Route R; they were not built into its definition.

## 3. Route convergence

Target:

```text
∀a b, addL(a,b)=addR(a,b).
```

Fix `b` and induct on `a`.

### Base

```text
addL(z,b)=b=addR(z,b).
```

The first equality is definitional for Route L; the second is the derived Route-R left-zero theorem.

### Step

Assume:

```text
addL(a,b)=addR(a,b).
```

Then:

```text
addL(sa,b)
 = s(addL(a,b))
 = s(addR(a,b))
 = addR(sa,b).
```

Thus the routes converge pointwise.

## 4. Provenance comparison

The convergence theorem is not evidence that the two routes had the same construction history:

```text
Route R recursive argument = second
Route L recursive argument = first
```

Their equality is a theorem requiring induction plus the opposite-side equations. The Junction must preserve both witnesses.

## 5. Canonical addition after convergence

After convergence one may choose a canonical spelling:

```text
add := addR
```

This is a representation/export choice after proved equivalence, not a claim that Route R was uniquely forced.

## 6. Commutativity from convergence

Observe definitionally:

```text
addL(b,a) = addR(a,b).
```

Applying route convergence to `(b,a)` gives:

```text
addL(b,a)=addR(b,a).
```

Hence:

```text
addR(a,b)=addR(b,a),
```

so canonical addition is commutative.

This is a significant learning result: commutativity is connected directly to the reconvergence of the two recursion orientations.

## 7. Associativity

For canonical `add=addR`, induct on the third argument `c`.

Base:

```text
(add(a,b))+z = add(a,b) = add(a,add(b,z)).
```

Step follows because both sides acquire one outer successor and the induction hypothesis identifies the predecessors.

## 8. Cancellation

Right cancellation:

```text
add(a,c)=add(b,c) ⇒ a=b
```

is proved by induction on `c`; the successor case reduces with `s` injectivity from the accepted N-Core no-confusion package.

Left cancellation follows from commutativity plus right cancellation.

## 9. Written verdict

```text
Route R independent construction      PASS
Route L independent construction      PASS
route equivalence                     PASS
provenance separation                 PASS
zero identities                       PASS
successor compatibility               PASS
commutativity                         PASS
associativity                         PASS
cancellation                          PASS
written cross-path level              V4 PASS
formal V5                             PENDING OBSERVATION
```

## 10. Act condition

`N-ADD-J-001` may be classified **CONDITIONAL PASS — WRITTEN V4 / V5 PENDING**.

`N-ADD-BLOCK-003` may be classified written-pass candidate but cannot become fully accepted until claim-level V5 succeeds and the evidence is mapped to the owning Bricks.
