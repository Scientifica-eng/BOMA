# PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001

**Parent cycle:** `PDSA-TCT-004`  
**Date:** 2026-08-18  
**Status:** **PASS — constructive meta-proof for the selected TCT normal-form family**

## Purpose

Test whether the exact structural-equivalence specification of `TCT-BR-010` derives terminal predecessor recovery without adding `TCT-BR-009` as an independent premise.

Target:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

with the base non-empty normal form `U` handled separately by predecessor `ε`.

---

## 1. Scope

The theorem applies to the current TCT-generated selected normal-form family.

The selected grammar is refined to remove the definitional duplicate `ε ⊙ U ≡ U`:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

The refinement changes presentation discipline only. It does not introduce numerical indexing or a new object-level construction.

The theorem does **not** claim right cancellation for arbitrary future TCT kernels, multiple generators, arbitrary interface systems, or arbitrary alternative definitions of `≈`.

---

## 2. Exact `≈` used

Only `TCT-BR-010` rules are admitted:

```text
SE-1  A ≡ B ⇒ A ≈ B

SE-2  (A ⊙ B) ⊙ C ≈ A ⊙ (B ⊙ C)
      when displayed compositions are admissible

SE-3  reflexive / symmetric / transitive closure

SE-4  compatible contextual closure under ⊙
```

No terminal-preservation, cancellation, insertion, deletion, idempotence, contraction, or commutativity rule is assumed.

Operationally, `A ≈ B` can be read at this stage as the existence of a meta-finite derivation witness built from these rules. No completed quotient object is required.

---

## 3. Meta-resource declaration

```text
META-RESOURCE USED:
finite host-level lists/words, list concatenation, structural induction,
constructor injectivity, and finite derivation induction

ROLE:
define and verify a structural trace invariant for presented TCT syntax

OBJECT-LEVEL EXPORT:
NONE
```

No object-level natural number, cardinality, numerical length, or numerical depth is used.

The proof can be carried out constructively using finite syntax/list case analysis and induction.

---

## 4. Define the external ordered trace

Let `•` be a meta-level marker used only in proof infrastructure.

Define a host-level finite word/list `τ(A)` for an explicitly presented TCT term:

```text
τ(ε)     ≔ []
τ(U)     ≔ [•]
τ(A ⊙ B) ≔ τ(A) ++ τ(B)
```

where `++` is host-level list concatenation.

`τ` is **not** an object-level length or cardinality function. It records ordered construction-leaf presentation externally.

---

## 5. Lemma TR-1 — current definitional identity preserves trace

### Claim

For the active canonical definitional conventions:

```text
A ≡ B  ⇒  τ(A) ≡ τ(B)
```

at the meta level.

### Reason

The material definitional reductions affecting construction syntax are empty reductions:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A.
```

Trace calculation gives:

```text
τ(ε ⊙ A)
≡ [] ++ τ(A)
≡ τ(A)
```

and similarly:

```text
τ(A ⊙ ε)
≡ τ(A) ++ []
≡ τ(A).
```

Pure naming/notation expansion does not change the presented construction frontier.

### Sensitivity

If the definition of `≡` is later broadened by a rule that inserts, deletes, duplicates, reorders, or collapses `U` structure, this lemma and the theorem must be retested.

**TR-1: PASS.**

---

## 6. Lemma TR-2 — reassociation preserves trace

For an SE-2 generator:

```text
(A ⊙ B) ⊙ C
```

has trace:

```text
(τ(A) ++ τ(B)) ++ τ(C).
```

The reassociated presentation:

```text
A ⊙ (B ⊙ C)
```

has trace:

```text
τ(A) ++ (τ(B) ++ τ(C)).
```

Host-level list concatenation is associative, so these are the same meta-level list.

No object-level associativity theorem or natural-number argument is used.

**TR-2: PASS.**

---

## 7. Lemma TR-3 — every BR-010 equivalence preserves trace

### Claim

```text
A ≈ B  ⇒  τ(A) ≡ τ(B)
```

for every explicit BR-010 derivation witness.

### Proof by induction on the equivalence derivation

- `SE-1`: follows from TR-1.
- `SE-2`: follows from TR-2.
- reflexivity: immediate.
- symmetry: equality of traces reverses.
- transitivity: equality of traces composes.
- `SE-4`: if `τ(A) ≡ τ(A')` and `τ(B) ≡ τ(B')`, then:

```text
τ(A ⊙ B)
≡ τ(A) ++ τ(B)
≡ τ(A') ++ τ(B')
≡ τ(A' ⊙ B').
```

Therefore every permitted equivalence step preserves the ordered trace.

**TR-3: PASS.**

---

## 8. Lemma TR-4 — non-empty selected normal forms have non-empty trace

For:

```text
NF+ ::= U | (NF+ ⊙ U)
```

the trace is never `[]`.

### Proof

- Base `U`: trace is `[•]`.
- Extension `P ⊙ U`: trace is `τ(P) ++ [•]`, which has a final marker.

No counting is used; only list constructors are inspected.

**TR-4: PASS.**

---

## 9. Lemma TR-5 — trace is injective on selected normal forms

### Claim

For selected canonical normal forms `P` and `Q`:

```text
τ(P) ≡ τ(Q)  ⇒  P ≡ Q.
```

### Proof sketch

Use structural induction/case analysis on the canonical grammar:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U).
```

- `ε` is the only selected NF with empty trace, by TR-4.
- `U` has the one-marker constructor shape `[•]`.
- an extension `P ⊙ U` has trace `τ(P) ++ [•]` with a non-empty predecessor trace.
- equality of two extension traces permits host-level right cancellation of the final list marker, yielding equality of predecessor traces;
- apply the induction hypothesis to the predecessors.

The argument uses structural list shape and constructor injectivity, not an object-level statement about the numerical number of markers.

The grammar refinement is essential: the old grammar admitted both `U` and `ε ⊙ U` as syntactic candidates, which would defeat literal presentation injectivity even though they are definitionally identical.

**TR-5: PASS for the refined selected normal form.**

---

## 10. Theorem TR-6 — terminal predecessor cancellation

### Extension-extension case

Assume selected non-empty normal forms:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U
```

with `P,Q ∈ NF+`, and assume:

```text
A ≈ B.
```

By TR-3:

```text
τ(P) ++ [•] ≡ τ(Q) ++ [•].
```

By host-level list right cancellation:

```text
τ(P) ≡ τ(Q).
```

By TR-5:

```text
P ≡ Q.
```

By `SE-1`:

```text
P ≈ Q.
```

### Base-base case

If both selected presentations are `U`, both recovery records return predecessor `ε` and the distinguished terminal role `U`.

Therefore predecessor equivalence is immediate by reflexivity/SE-1.

### Base-extension cross case

Suppose one selected presentation is `U` and the other is `Q ⊙ U` with non-empty `Q`.

Trace preservation would require:

```text
[•] ≡ τ(Q) ++ [•].
```

But TR-4 says `τ(Q)` is non-empty, so the list constructor shapes cannot be identical.

Therefore no BR-010 equivalence derivation can relate these two selected normal forms.

The reverse cross case is symmetric.

### Conclusion

For all non-empty selected normal-form configurations on the present TCT path, BR-010 equivalence preserves recovered predecessor equivalence.

**TR-6: PASS.**

---

## 11. Theorem TR-7 — distinguished terminal role preservation

BR-010 generators preserve ordered trace:

- definitional empty reductions add/remove no marker;
- reassociation changes no marker order;
- contextual closure concatenates traces without permutation;
- equivalence closure preserves trace equality.

Therefore the final marker of a selected non-empty normal form remains the final marker under any equivalent presentation trace.

Since the selected normal-form recovery procedure assigns that final position the distinguished terminal `U` role, equivalent selected normal forms recover corresponding terminal roles.

No identity of individual `U` occurrences as globally labelled objects is assumed; only the structurally terminal role is preserved.

**TR-7: PASS.**

---

## 12. Countermodel / counterexample search

### Historical idempotent countermodel

The relation admitting:

```text
U ⊙ U ≈ U
```

fails cancellation.

However this is **not** a countermodel to BR-010 because the idempotent collapse is an additional generator absent from the exact least generated relation.

It remains useful evidence that generic congruence axioms are insufficient.

### Search under exact BR-010

Any alleged counterexample:

```text
A ≈ B
```

with distinct terminal-predecessor traces would contradict TR-3, because every permitted derivation preserves `τ`.

For selected normal forms, equal traces force identical selected presentations by TR-5.

Therefore the trace invariant excludes a counterexample within the exact current specification.

**Counterexample search result: NONE within BR-010, by invariant proof.**

---

## 13. Epistemic result

For the **current TCT path and refined selected normal-form grammar**:

```text
TCT-BR-009 terminal-interface preservation
```

is no longer required as an independent mathematical premise.

It is:

```text
DERIVED UNDER TCT-BR-010
```

with the derivation relying on the explicit restricted generation of `≈`.

Historical provenance must remain visible:

```text
previous state:
DECLARED ADDITIONAL CONSTRAINT under incomplete ≈

current state after PDSA-TCT-003/004:
DERIVED UNDER TCT-BR-010
```

This is learning from strengthened premises, not a claim that the earlier audit was wrong.

---

## 14. Boundary of the theorem

Reopen the proof if any of the following changes:

```text
normal-form grammar
empty definitional convention
definitional identity ≡
BR-010 generators
composition/interface admissibility
introduction of new elementary blocks
commutativity/collapse/insertion/deletion rules
terminal-role semantics
```

The theorem does not automatically transfer to future branches.

---

## 15. Recommended Act

1. Refine the canonical TCT-BLOCK-002 normal-form grammar to:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

2. Record `TCT-BR-009` as **DERIVED UNDER TCT-BR-010** on the current path while preserving its historical declared-constraint status in provenance.
3. Promote `TCT-J-001` to **PASS** with this proof as verification evidence.
4. Keep `TCT-BLOCK-003` RESERVED until `PDSA-TCT-005` explicitly constructs the canonical decomposition Block.
5. Carry the trace technique into the Learning Graph as a reusable anti-circularity method: structural invariants can replace numerical counting in pre-numerical proofs.
