# TCT-BR-010 — Reassociation-Generated Structural Equivalence

## Canonical Identity

- **Unit ID:** `TCT-BR-010`
- **Type:** Brick
- **Layer:** `L1 — explicit constructed structure`
- **Operational Status:** **ACTIVE**
- **Epistemic Status:** **DECLARED CHOICE — STRUCTURAL IDENTITY SPECIFICATION**
- **PDSA origin:** `PDSA-TCT-003`

## Purpose

Provide the explicit current-path definition of object-level structural equivalence `≈` for the pre-numerical TCT construction without importing terminal recovery, numerical depth, cardinality, global quotient existence, or a completed natural-number domain.

## Scope

The definition applies schematically to admissible TCT construction presentations supplied with explicit meta-finite derivation witnesses and built from:

```text
ε
U
A ⊙ B    when the declared interfaces are compatible
```

No completed carrier of all such configurations is asserted by this Brick.

## Proof-theoretic operational reading

At the current pre-numerical layer:

> `A ≈ B` means that there exists an explicit meta-finite derivation witness connecting the presented configurations using only `SE-1` through `SE-4`.

This avoids requiring a completed quotient object or globally materialized set of equivalence classes.

The phrase “least generated relation” is understood proof-theoretically through these explicit derivation witnesses.

## Meta-level identity input

The active metatheory contract provides:

```text
≡  meta-level definitional / selected-presentation identity
```

with empty behavior treated definitionally:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A
```

when the relevant composition is admitted.

These are definitional construction conventions, not derived object-level equality theorems.

## Definition of `≈`

`≈` is the least generated structural-equivalence relation satisfying:

### SE-1 — Definitional inclusion

```text
A ≡ B  ⇒  A ≈ B
```

### SE-2 — Reassociation generator

Whenever all displayed compositions are admissible:

```text
(A ⊙ B) ⊙ C  ≈  A ⊙ (B ⊙ C)
```

Parenthesization is declared irrelevant to the structural identity used on the current path.

This is a declared identity criterion, not a theorem derived from a deeper geometric semantics.

### SE-3 — Equivalence closure

`≈` is closed under:

```text
reflexivity
symmetry
transitivity
```

### SE-4 — Compatible contextual closure

If:

```text
A ≈ A'
B ≈ B'
```

and the relevant compositions are admissible, then:

```text
A ⊙ B  ≈  A' ⊙ B'
```

No claim is made about compositions whose interfaces are not admitted.

## Explicit non-generators

The current definition contains no rule permitting:

```text
U ⊙ U ≈ U              idempotent collapse
A ⊙ A ≈ A              contraction
A ≈ A ⊙ U              insertion
A ⊙ U ≈ A              deletion
A ⊙ B ≈ B ⊙ A          commutativity
```

and contains no criterion based on:

```text
number of U occurrences
cardinality
numerical length/depth
natural-number index
```

## What this Brick does not build into the definition

The defining clauses do not include:

```text
terminal-interface preservation
right cancellation
canonical predecessor recovery
unique decomposition modulo ≈
numerical depth
successor
induction
existence of a quotient set/type of equivalence classes
```

Terminal preservation was independently derived for the current selected normal-form family; it remains absent from the definition itself.

## Verification results

### Ordered-trace invariant

`PDSA-TCT-004` defined an external meta-level ordered trace `τ` of presented construction syntax and proved that every SE-1 through SE-4 derivation preserves that trace.

### Terminal predecessor cancellation

For the refined selected normal-form grammar:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

the trace is injective on selected normal forms. Consequently:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

for non-base extension forms, with the `U` base case handled by predecessor `ε`.

The proof uses permitted meta-level list/syntax reasoning and exports no object-level counting structure.

Verification evidence:

`LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md`

## Relationship to TCT-BR-009

`TCT-BR-009 — Terminal Interface Preservation` was historically introduced as a declared additional constraint under an incomplete earlier specification of `≈`.

Under BR-010 and the refined selected normal-form grammar, PDSA-TCT-004 derives terminal predecessor and terminal-role preservation.

Current path:

```text
TCT-BR-009 = DERIVED UNDER TCT-BR-010
```

Historical declared-constraint provenance remains preserved.

## Counterexample boundary

A generic congruence is not sufficient for recovery. Adding a collapse generator such as:

```text
U ⊙ U ≈ U
```

admits non-cancellative models.

Therefore the terminal theorem depends on the specific restricted generation of the present `≈`.

## Dependencies

```text
TCT-BLOCK-001
TCT-BLOCK-002
BOMA-META-TCT-001
PDSA-TCT-003 equality/identity audit
```

## Current downstream state

```text
TCT-BR-009     ACTIVE / DERIVED
TCT-J-001      PASS / RESOLVED
TCT-BLOCK-003  ACTIVE
TCT-BLOCK-004  ACTIVE
TCT-BLOCK-005  ACTIVE
```

## Sensitivity

Changing any generator or closure clause of `≈`, or changing the selected normal-form grammar/definitional identity conventions, requires retesting at least:

```text
TCT-BR-009
TCT-J-001
TCT-BLOCK-003
TCT-BLOCK-004
TCT-BLOCK-005
TCT-BLOCK-006
```

Adding a collapsing, commuting, insertion, deletion, or other generator is a high-impact architectural change and should normally receive a distinct alternative-unit identity.

## Provenance

Selected by:

- `LAB/PDSA/PDSA-TCT-003_STRUCTURAL_EQUIVALENCE.md`
- `LAB/PDSA/experiments/PDSA-TCT-003-EQ-AUDIT-001.md`
- `LAB/PDSA/experiments/PDSA-TCT-003-EQUIVALENCE-CANDIDATES-001.md`

Verified for terminal recovery by:

- `LAB/PDSA/PDSA-TCT-004_TERMINAL_RECOVERY.md`
- `LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md`

Terminology/downstream synchronization audited by `PDSA-TCT-008`.
