# PDSA-N-009-NO-CONFUSION-RECONVERGENCE-001

**Result:** **WRITTEN CROSS-PATH PASS / V5 PENDING**

## Goal

Show that the formal no-confusion contribution can be produced by two genuinely different routes:

```text
NC-0   ∀n, s(n) ≠ z
NC-S   s(a) = s(b) ⇒ a = b
```

Route A is internal constructor reasoning (`N-BLOCK-002`). Route B must use TCT ancestry through `N-BLOCK-005` and must not invoke Route A.

---

## Route B assumptions

For every formal `n : N_BOMA`, bridge coverage/reconstruction provides a selected TCT presentation `A` with:

```text
ρ(A) = n.
```

The bridge also provides:

```text
ρ(ε) = z
ρ(ExtU(A)) = s(ρ(A))
ρ(A) = ρ(B) ⇒ A ≈ B      faithfulness/reflection
A ≈ B ⇒ ρ(A) = ρ(B)      preservation
```

TCT-BLOCK-005 supplies, on the active TCT path:

```text
ExtU(A) ≉ ε
ExtU(A) ≈ ExtU(B) ⇒ A ≈ B.
```

These are constructional predecessor/extension results, not formal constructor no-confusion.

---

# Proof B1 — empty exclusion transfer

Take arbitrary `n : N_BOMA`.

By bridge coverage choose selected presentation `A` such that:

```text
ρ(A) = n.
```

Assume for contradiction:

```text
s(n) = z.
```

Substitute the realization equations:

```text
s(ρ(A)) = ρ(ε).
```

By extension preservation:

```text
ρ(ExtU(A)) = ρ(ε).
```

By bridge faithfulness/reflection:

```text
ExtU(A) ≈ ε.
```

But TCT-BLOCK-005 established:

```text
ExtU(A) ≉ ε.
```

Contradiction. Therefore:

```text
s(n) ≠ z.
```

No constructor-disjointness theorem from Route A was used.

---

# Proof B2 — successor injectivity transfer

Take arbitrary `a,b : N_BOMA` and assume:

```text
s(a) = s(b).
```

By coverage choose selected presentations `A,B` with:

```text
ρ(A) = a
ρ(B) = b.
```

Using extension preservation:

```text
ρ(ExtU(A)) = s(a)
ρ(ExtU(B)) = s(b).
```

Hence:

```text
ρ(ExtU(A)) = ρ(ExtU(B)).
```

By bridge faithfulness:

```text
ExtU(A) ≈ ExtU(B).
```

By TCT terminal-extension injectivity:

```text
A ≈ B.
```

By bridge preservation:

```text
ρ(A) = ρ(B).
```

Therefore:

```text
a = b.
```

No constructor-injectivity theorem from Route A was used.

---

## Independence audit

### Route A requires

```text
R-B inductive constructor behavior
formal equality
constructor discrimination/injectivity reasoning
```

### Route B requires

```text
TCT successor-like empty exclusion
TCT extension injectivity modulo ≈
base/extension realization
bridge preservation
bridge reflection/faithfulness
bridge coverage/reconstruction
formal equality substitution
```

Route B does **not** require the internal formal no-confusion theorems as premises.

The two routes therefore have materially different proof provenance even though they export the same formal interface.

---

## Reconvergence result

The common certified contribution is:

```text
FORMAL NO-CONFUSION INTERFACE
  s(n) ≠ z
  s(a) = s(b) ⇒ a = b
```

At the written mathematical/architectural level, the routes reconverge successfully.

This supports:

```text
N-J-001 = CONDITIONAL PASS — WRITTEN V4 CROSS-PATH
```

The qualification is required because bridge/backend obligations used in Route B still await pinned-toolchain V5 evidence under `PDSA-N-007`.

---

## Learning

1. Reconvergence can verify more than the theorem itself: it tests whether formalization preserves a constructional invariant through a different proof route.
2. Same exported theorem does not imply same assumptions or same history.
3. Coverage/reconstruction is essential. Preservation+faithfulness over only supplied presentations is insufficient to infer a theorem for arbitrary formal inhabitants.
4. The internal route is shorter; the ancestry route is epistemically richer because it certifies continuity with the pre-numerical construction.
5. A future formalization branch may lose one route while preserving the shared contribution through the other; the two production witnesses must therefore remain separate.

## Reopening conditions

Reopen this result if any of these change materially:

```text
TCT-BLOCK-005 extension guarantees
BR-010 structural equivalence
N-BLOCK-005 bridge clauses
coverage/reconstruction scope
formal equality regime
R-B carrier/constructor signature
```
