# PDSA-Z-002 — Written Integer Representation Convergence Audit 001

**Status:** **PASS — WRITTEN V4 / V5 PENDING**

## 1. Signed normal-form route

Signed syntax has exactly one zero form:

```text
zero
pos(n) = +(s n)
neg(n) = -(s n)
```

Natural embedding:

```text
z   ↦ zero
s n ↦ pos(n)
```

Negation swaps `pos/neg` and fixes zero, so involution is structural.

Structural difference normalization is defined without integer subtraction:

```text
diff(z,z)       = zero
diff(s a,z)     = pos(a)
diff(z,s b)     = neg(b)
diff(s a,s b)   = diff(a,b)
```

It repeatedly cancels a common successor interface.

## 2. Difference-pair route

A pair `(a,b)` represents the intended difference `a-b`.

Representative equivalence is:

```text
(a,b) ~ (c,d) :⇔ a+d=c+b.
```

Reflexivity and symmetry are immediate. Transitivity follows entirely from accepted natural addition laws and cancellation; no quotient carrier is assumed.

## 3. Translations

Signed to pair:

```text
zero  ↦ (0,0)
pos n ↦ (s n,0)
neg n ↦ (0,s n)
```

Pair to signed:

```text
normalize(a,b) := diff(a,b).
```

## 4. Exact signed round trip

Each signed normal form maps to its obvious canonical pair and normalizes back definitionally:

```text
normalize(pairOfSigned(z))=z.
```

Thus signed normal forms are fixed points of the pair-normalization round trip.

## 5. Pair round trip up to equivalence

Target:

```text
pairOfSigned(normalize(p)) ~ p.
```

For pair `(a,b)`, simultaneous successor cancellation reduces `(s a,s b)` to `(a,b)`.

Key invariant:

```text
q ~ (a,b) ⇒ q ~ (s a,s b).
```

because:

```text
q₊ + s b
 = s(q₊+b)
 = s(a+q₋)
 = s a + q₋.
```

Induction on the first coordinate, with case split on the second, proves the round trip up to `~`.

## 6. Canonical signed pairs separate normal forms

The canonical pair images are:

```text
zero  → (0,0)
pos n → (s n,0)
neg n → (0,s n).
```

If two such canonical pairs are equivalent, accepted natural no-confusion/addition laws force the signed forms to be identical:

- zero cannot be equivalent to a positive or negative nonzero form;
- positive/positive equivalence reduces to successor injectivity;
- negative/negative equivalence reduces similarly;
- positive/negative equivalence would force a successor-form sum to equal zero, impossible.

## 7. Equivalence implies equal normal form

Suppose `p~q`.

From pair round trips:

```text
canonical(norm p) ~ p
canonical(norm q) ~ q.
```

By symmetry/transitivity:

```text
canonical(norm p) ~ canonical(norm q).
```

Canonical-pair separation then gives:

```text
norm p = norm q.
```

## 8. Equal normal form implies equivalence

If:

```text
norm p = norm q,
```

then their canonical pair images are literally the same representative. Combining the two round-trip equivalences gives:

```text
p ~ q.
```

## 9. Representation convergence theorem

Therefore:

```text
p ~ q ↔ normalize(p)=normalize(q).
```

This is the key identity result for the integer stage: pair equivalence is exactly equality of signed canonical normal forms.

## 10. Architectural consequence

A quotient type is **not required merely to know what the equivalence classes are**. The signed normalizer already supplies a canonical representative for each difference-pair equivalence class.

This does not prove that quotient-based and signed carriers are identical as formalization choices; it proves that their intended identities can be compared without first adopting quotient types.

## 11. Written verdict

```text
signed route construction                PASS
natural embedding / negation             PASS
structural diff normalizer               PASS
difference-pair relation                 PASS
equivalence laws                         PASS
signed exact round trip                  PASS
pair round trip up to equivalence        PASS
canonical-pair separation                PASS
p~q ↔ normalize(p)=normalize(q)          PASS
written cross-path                       V4 PASS
formal V5                                PENDING
```

## 12. Act condition

`Z-J-001` may be classified **CONDITIONAL PASS — WRITTEN V4 / V5 PENDING**.

Only after V5 may `Z-DP-001` open for canonical representation selection and commitment comparison.
