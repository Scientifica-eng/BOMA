# PDSA-TCT-003-EQ-AUDIT-001 — Equality / Identity Audit

**Parent cycle:** `PDSA-TCT-003`  
**Date:** 2026-08-18  
**Status:** COMPLETE — feeds Study of PDSA-TCT-003

## Purpose

Audit the active and inherited TCT uses of `=`, `≡`, and `≈` before selecting a canonical definition of structural equivalence.

The audit applies the meta/object firewall established by `BOMA-META-TCT-001`.

---

## 1. Identity layers used by the project

The audit adopts the following separation:

```text
DOCUMENTARY IDENTITY
repository path / UnitID / commit / cycle identity

META-DEFINITIONAL IDENTITY   ≡
same presentation under an explicitly declared syntactic or definitional convention

OBJECT-LEVEL STRUCTURAL EQUIVALENCE   ≈
the TCT relation identifying constructional presentations as the same relevant structure
```

Bare mathematical `=` is therefore considered ambiguous in the current pre-numerical TCT layer unless a record explicitly defines what equality it denotes.

### Audit rule

New canonical pre-numerical records should avoid unqualified `=` when either `≡` or `≈` is intended.

Historical records are preserved unchanged unless separately migrated; their notation is interpreted through this audit.

---

## 2. Audit of the construction labels

Historical source uses statements such as:

```text
ε = empty configuration
U = one elementary block
```

### Classification

These are not derived object-level equations.

They are **naming/definition declarations**.

Preferred future form:

```text
ε  denotes the declared empty configuration
U  denotes the declared elementary block
```

or, where a symbol is introduced definitionally:

```text
ε ≔ <declared empty configuration>
U ≔ <declared elementary block>
```

### Learning

Definition/naming must not be mistaken for mathematical equality between independently constructed objects.

---

## 3. Audit of empty behavior

Historical TCT-001 states:

```text
ε ⊙ A = A
A ⊙ ε = A
```

and calls these constructional specifications of the empty configuration.

### Possible readings

```text
E1  strict object-level equality theorem
E2  structural equivalence law
E3  definitional reduction / construction convention
```

### Audit result

**E3 is the weakest and cleanest interpretation for the current canonical path.**

The project already declares `ε` to be the result of no construction and declares `⊙` constructionally. Therefore composition with `ε` can be specified by the operation definition itself:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A
```

whenever the corresponding composition is admitted.

This is not a theorem derived from prior structure. It is a **declared definitional convention** governing the empty configuration and concatenation.

### Consequence

The project does not need to introduce a stronger object-level equality relation merely to state empty behavior.

It also need not add empty laws as generators of `≈` if they are already eliminated by definitional normalization `≡`.

### Epistemic classification

```text
empty behavior = DECLARED / DEFINITIONAL
not DERIVED
```

---

## 4. Audit of parenthesization / associativity

Historical TCT-001 states:

```text
(A ⊙ B) ⊙ C ≈ A ⊙ (B ⊙ C)
```

and marks it as a target rather than a strict equality.

### Audit result

This must remain separate from `≡`.

Different parenthesized construction presentations are not, under the current syntax, definitionally identical.

The active PDSA cycle must decide whether reassociation is:

```text
A  a declared generator of structural equivalence;
B  derived from a deeper interface/semantic definition of ≈;
C  rejected for some representations.
```

The equality audit does not decide that question; it only rejects interpreting reassociation as bare syntactic identity.

---

## 5. Audit of recovery definitions

The verification record uses:

```text
recover(U)     = (ε, U)
recover(P ⊙ U) = (P, U)
```

### Hidden ambiguity

If read object-level, this notation could silently introduce:

- ordered pairs as constructed mathematical objects;
- an equality relation on those pairs;
- a domain/codomain for `recover` stronger than currently declared.

### Audit result

`recover` is currently a **meta-level inspection procedure on selected normal-form syntax**, not yet an object-level function into a constructed ordered-pair domain.

Preferred interpretation:

```text
recover(U)     ≔ meta-record { predecessor: ε, terminal-role: U }
recover(P ⊙ U) ≔ meta-record { predecessor: P, terminal-role: U }
```

The braces/fields are documentary/meta-level notation only.

### Consequence

The canonical Junction should not require a bare statement:

```text
recover(A) ≈ recover(B)
```

because `≈` has not been defined on recovery records.

The intended condition should instead be decomposed explicitly.

If:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U
A ≈ B
```

then canonical recovery requires:

```text
terminal-role(A) corresponds to terminal-role(B) as the distinguished U-role
and
P ≈ Q
```

This avoids importing ordered-pair structure.

---

## 6. Audit of decomposition equations in TCT-BR-009

The current Brick uses:

```text
A = P ⊙ U
B = Q ⊙ U
```

### Audit result

These are presentation decompositions, not object-level equality theorems.

Preferred canonical notation:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U
```

when `A` and `B` are the selected normal-form presentations.

Alternatively, prose may say:

> `A` is presented in selected normal form as `P ⊙ U`.

---

## 7. `≡` to `≈` bridge

The metatheory contract correctly forbids an implicit inference between `≡` and `≈`.

However, any usable object-level structural equivalence should satisfy the following explicit compatibility rule:

```text
A ≡ B  ⇒  A ≈ B
```

### Classification

This should be part of the **definition/admissibility specification of `≈`**, not an unstated logical coercion.

Reason: two definitionally identical presentations cannot represent structurally different configurations under the same declared representation convention.

This rule exports no numerical structure.

---

## 8. Counterexample requirement exposed by the audit

Equivalence + congruence + associativity are not by themselves sufficient to guarantee terminal recovery.

A useful external countermodel is the two-element idempotent monoid:

```text
{e, u}

e is identity
u ⊙ u = u
```

Then:

```text
e ⊙ u = u = u ⊙ u
```

but:

```text
e ≠ u
```

Thus right cancellation fails.

In TCT presentation language, an equivalence admitting the collapse:

```text
U ⊙ U ≈ U
```

can identify two non-empty configurations whose recovered predecessors are `U` and `ε`, while keeping `U` and `ε` inequivalent.

### Learning

A generic congruence is too weak for canonical decomposition.

Terminal preservation/right cancellation must either:

- be derived from a more restrictive generated equivalence;
- be built into the identity criterion;
- or remain an explicit independent constraint.

The model is used only as external countermodel evidence under the metatheory contract. It is not adopted as a TCT construction.

---

## 9. Recommended canonical notation discipline

For the active pre-numerical TCT track:

```text
≔  definition / introduction of notation
≡  meta-level definitional or selected-presentation identity
≈  object-level structural equivalence
```

Avoid bare `=` in new canonical mathematical statements until a later formalization layer explicitly introduces an object-level equality relation and states its relation to `≈`.

Documentary status lines may of course continue to use textual `=` as ordinary prose/bookkeeping where no mathematical equality is intended.

---

## 10. Study findings exported to PDSA-TCT-003

1. No independent object-level strict equality is currently required in the pre-numerical TCT kernel.
2. Empty behavior is best treated as definitional normalization:
   `ε ⊙ A ≡ A` and `A ⊙ ε ≡ A`.
3. Reassociation must remain at the structural-equivalence level, not syntactic identity.
4. Recovery is currently a meta-level syntax inspection, not an object-level ordered-pair-valued function.
5. The canonical Junction condition should be stated directly in terms of terminal-role correspondence and predecessor equivalence.
6. Every candidate `≈` should explicitly include definitional identity: `≡ ⊆ ≈`.
7. Generic congruence is insufficient: an idempotent-collapse countermodel defeats right cancellation.
8. Therefore the next comparison must focus on **which generators/structural invariants `≈` admits**, not merely whether it is an equivalence congruence.

---

## 11. Act recommendation

Proceed to an explicit candidate specification in which:

- `ε`-neutrality is definitional (`≡`);
- `≈` contains `≡`;
- `≈` is closed under compatible composition contexts;
- no duplication, deletion, idempotence, absorption, or commutativity generator is admitted;
- reassociation is the only non-definitional structural generator initially considered;
- terminal preservation is **not** included in the definition, so PDSA-TCT-004 can test whether it is genuinely derived.

This candidate should be compared against an interface-preserving alternative and a deliberately collapsing counterexample family before PDSA-TCT-003 closes.
