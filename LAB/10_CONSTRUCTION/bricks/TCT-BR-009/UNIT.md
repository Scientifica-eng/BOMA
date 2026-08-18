# TCT-BR-009 — Terminal Interface Preservation

## Canonical Identity

- **Unit ID:** `TCT-BR-009`
- **Type:** Brick
- **Layer:** `L1 — explicit constructed structure`
- **Operational Status:** **ACTIVE**
- **Current-path Epistemic Status:** **DERIVED UNDER TCT-BR-010**

## Purpose

Record the structural condition/theorem required for last-step recovery to be invariant under the declared structural equivalence `≈`.

## Incoming dependencies

```text
TCT-BLOCK-002
TCT-BR-010
```

## Derived condition

For selected normal-form presentations:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U
A ≈ B
```

then the recovered terminal role corresponds and:

```text
P ≈ Q.
```

The base selected presentation `U` has meta-level predecessor record `ε`.

The symbols `≡` record selected-presentation identity; no independent bare object-level equality is assumed.

## Current derivability result

`PDSA-TCT-004` proved terminal predecessor cancellation under the **exact restricted generated relation** of `TCT-BR-010`.

The proof uses a permitted external ordered trace `τ` of the presented syntax and establishes:

```text
A ≈ B  ⇒  τ(A) ≡ τ(B)
```

for every explicit BR-010 derivation witness.

On the refined selected normal-form grammar, the trace is injective. Therefore:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q.
```

The proof also shows that reassociation preserves the structurally terminal position, so the distinguished terminal `U` role is preserved.

Verification evidence:

`LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md`

## Historical epistemic state

This Brick was originally introduced after the first derivability audit with status:

```text
DECLARED CHOICE — ADDITIONAL CONSTRAINT
```

That result was correct relative to the **then-incomplete specification of `≈`**.

The historical state is not erased.

The progression is:

```text
incomplete ≈
    ↓
terminal preservation not derivable from stated premises
    ↓
BR-009 recorded as DECLARED ADDITIONAL CONSTRAINT
    ↓
PDSA-TCT-003 defines restricted BR-010 relation
    ↓
PDSA-TCT-004 retests derivability
    ↓
BR-009 DERIVED UNDER TCT-BR-010 on current path
```

This is a PDSA learning result: strengthened and clarified premises changed the epistemic classification without invalidating the earlier Study.

## Scope boundary

The theorem is scoped to:

- the current single elementary block `U`;
- the current empty definitional convention;
- the refined selected normal-form grammar;
- the exact SE-1 through SE-4 definition of BR-010;
- the present compatible composition discipline.

It does not automatically transfer to branches with additional generators, commutativity, collapse laws, alternative equivalences, or richer interface systems.

## Counterexample boundary

A generic congruence does not imply this theorem.

For example, adding:

```text
U ⊙ U ≈ U
```

can destroy right cancellation.

Therefore the derived status depends essentially on the restricted BR-010 generation rules.

## What this Brick does not introduce

```text
0
1
2
n
cardinality
addition
successor
induction
ordered-pair objects
completed quotient carrier
```

The result is structural only.

## Consequence for TCT-J-001

The missing canonicality condition has now been derived under the selected current-path structural equivalence.

Accordingly `TCT-J-001` may be marked PASS/RESOLVED with the PDSA-TCT-004 proof as evidence.

This does not by itself construct `TCT-BLOCK-003`; that Block remains a separate next construction step.

## Sensitivity

A change to this Brick's premises or to the definition of `≈` requires rechecking:

```text
TCT-J-001
TCT-BLOCK-003
TCT-BLOCK-004
TCT-BLOCK-005
TCT-BLOCK-006
```

## Provenance

Historical discovery:

`LAB/10_CONSTRUCTION/experiments/TCT-J-001-VERIFICATION-001.md`

Historical negative derivability audit:

`LAB/10_CONSTRUCTION/experiments/TCT-BR-009-DERIVABILITY-001.md`

Current-path derivation:

```text
PDSA-TCT-003
PDSA-TCT-004
LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md
```
