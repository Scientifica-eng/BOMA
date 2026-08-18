# PDSA-TCT-003-EQUIVALENCE-CANDIDATES-001 — Candidate Comparison

**Parent cycle:** `PDSA-TCT-003`  
**Date:** 2026-08-18  
**Status:** COMPLETE — candidate selected for current canonical path, subject to next-cycle theorem test

## Purpose

Compare explicit candidate definitions of TCT structural equivalence `≈` after the equality/identity audit.

This experiment does **not** prove canonical recovery. Its purpose is to select a transparent identity specification for the current path without building the desired recovery theorem into the definition.

---

# Common presentation environment

Work schematically over any meta-finitely presented admissible TCT construction term built from:

```text
ε
U
A ⊙ B    when the declared interfaces are compatible
```

No completed global carrier is assumed.

The metatheory provides:

```text
≡  meta-level definitional/presentation identity
```

with empty reduction declared definitionally:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A
```

when admitted by the construction specification.

Every candidate below must explicitly respect:

```text
A ≡ B  ⇒  A ≈ B
```

---

# Candidate A — Reassociation-generated structural congruence

## Definition

Let `≈A` be the **least** relation on admissible presented configurations satisfying:

### A1 — definitional inclusion

```text
A ≡ B  ⇒  A ≈A B
```

### A2 — reassociation generator

Whenever the indicated compositions are admissible:

```text
(A ⊙ B) ⊙ C  ≈A  A ⊙ (B ⊙ C)
```

and conversely through symmetry.

This generator is a **declared structural-identity choice**: parenthesization is not treated as relevant structure for the current canonical path.

### A3 — equivalence closure

`≈A` is closed under:

```text
reflexivity
symmetry
transitivity
```

### A4 — compatible contextual closure

If:

```text
A ≈A A'
B ≈A B'
```

and the relevant compositions are admissible, then:

```text
A ⊙ B  ≈A  A' ⊙ B'
```

Equivalent one-sided context instances follow from this rule and reflexivity.

## Explicitly absent generators

`≈A` does **not** include any rule of the forms:

```text
U ⊙ U ≈ U              idempotent collapse
A ⊙ B ≈ B ⊙ A          commutativity
A ⊙ A ≈ A              general contraction
A ≈ A ⊙ U              insertion
A ⊙ U ≈ A              deletion
```

nor any numerical/cardinality criterion.

## Epistemic interpretation

Candidate A does not claim that reassociation was derived from a deeper geometry. It declares that reassociation does not alter the structure relevant to the current TCT identity criterion.

Therefore:

```text
reassociation admissibility = DECLARED CHOICE
```

and not `DERIVED`.

This is intentionally different from silently calling `⊙` strictly associative.

## Strengths

- minimal named non-definitional generator;
- exact provenance of every equivalence step can be recorded;
- no terminal/recovery rule appears in the definition;
- no duplication/deletion/collapse rule appears;
- compatible with the selected normal-form strategy;
- does not require a quotient object to exist;
- relation can be witnessed by a meta-finite derivation of equivalence moves;
- suitable for testing whether terminal preservation is genuinely derivable.

## Risks / open proof obligations

- prove that the generated relation preserves the relevant interface discipline;
- prove or refute right cancellation by terminal `U` on the TCT-generated subfamily;
- distinguish general compatible terms from the narrower right-generated NF family;
- determine whether an associativity generator is sufficient when future kernels have more than one elementary block or richer interfaces.

---

# Candidate B — Interface-preserving equivalence by definition

## Definition family

Define `A ≈B B` when a selected structural observation of `A` and `B` agrees, for example:

```text
external boundary/interface data
ordered composition interface pattern
terminal-role data
other declared observable structure
```

A strong version explicitly requires terminal-role preservation.

## Strengths

- recovery compatibility can become immediate;
- well suited to geometric/interface semantics;
- scales to richer typed-interface systems if the preserved observation is specified carefully.

## Risks

- the identity criterion becomes dependent on a larger primitive observation package;
- if terminal role is included, `TCT-BR-009` is moved into the **definition** rather than derived;
- this can make `TCT-J-001` appear solved by choosing the answer as part of identity;
- defining the preserved observation may require more structure than the present kernel has established;
- may over-identify BOMA's mathematical object with one representation/interface model.

## Epistemic assessment

Candidate B is scientifically legitimate as a future branch, but is **too strong for the current canonical experiment** because the current research question is precisely whether terminal preservation follows from a weaker identity specification.

---

# Candidate C — Congruence with a collapsing law

## Definition family

Start with equivalence/context closure but admit an additional collapse such as:

```text
U ⊙ U ≈C U
```

This is not proposed for the canonical path. It is a controlled stress-test family.

## External countermodel

Use the two-element monoid:

```text
M = {e, u}
e identity
u ⊙ u = u
```

Then:

```text
e ⊙ u = u = u ⊙ u
```

while:

```text
e ≠ u
```

Hence right cancellation fails.

TCT reading:

```text
U        ≈C U ⊙ U
recover(U) predecessor        ε
recover(U ⊙ U) predecessor    U
```

and the model keeps the empty role distinct from `U`.

## Learning

The properties:

```text
equivalence
+ congruence
+ associativity
+ identity
```

are **not enough** to guarantee terminal recovery.

Some non-collapse/cancellation-preserving feature is needed.

This demonstrates why `TCT-BR-009` was a genuine discovery rather than a trivial consequence of saying that `≈` is a congruence.

---

# Comparative matrix

| Criterion | Candidate A | Candidate B | Candidate C |
|---|---|---|---|
| Explicit finite derivation witnesses | YES | DEPENDS | YES |
| `≡` included | YES | REQUIRED | YES |
| Compatible context closure | YES | CAN BE | YES |
| Reassociation | DECLARED GENERATOR | DEPENDS ON OBSERVATION | MAY HOLD |
| Terminal preservation in definition | NO | STRONG VERSION: YES | NO |
| Collapse of repeated `U` | NO | DEPENDS | YES / POSSIBLE |
| Recovery theorem remains nontrivial | YES | OFTEN NO | FAILS IN TEST |
| Hidden numerical requirement | NONE IDENTIFIED | NONE NECESSARY | NONE NECESSARY |
| Global quotient required | NO | NO | NO |
| Current canonical suitability | **BEST** | FUTURE BRANCH | COUNTEREXAMPLE ONLY |

---

# Study

## S1 — Minimality

Candidate A makes the fewest structural identifications needed for the current TCT intention: it ignores parenthesization but does not ignore occurrence, order, interface compatibility, or terminal structure by an explicit collapse law.

## S2 — Transparency

Candidate A is highly auditable because an equivalence claim can be backed by a finite chain of named reassociation/context/definitional steps.

## S3 — Avoiding theorem-by-definition

Candidate B can make terminal recovery invariance definitional. This would be valid if deliberately chosen, but it would weaken the current experiment because the project wants to discover whether the weaker construction already supports recovery.

## S4 — Counterexample learning

Candidate C proves that generic algebraic-sounding properties are insufficient. In particular, `congruence` must never be treated as synonymous with `cancellative congruence`.

## S5 — Associativity reclassification

Selecting Candidate A changes the interpretation of the historical associativity target:

```text
NOT:
strict equality (A ⊙ B) ⊙ C = A ⊙ (B ⊙ C)

NOT CLAIMED:
derived theorem from a deeper geometric semantics

CURRENT CANONICAL READING:
reassociation is a declared generator of structural equivalence ≈
```

This reclassification must be explicit in the canonical unit records.

---

# Act recommendation

Select **Candidate A** for the current canonical path and record it as an explicit structural-equivalence specification unit.

Recommended new unit:

```text
TCT-BR-010 — Reassociation-Generated Structural Equivalence
Operational Status: ACTIVE
Epistemic Status: DECLARED CHOICE — STRUCTURAL IDENTITY SPECIFICATION
```

Do **not** change `TCT-BR-009` to DERIVED yet.

Next cycle:

```text
PDSA-TCT-004
```

must attempt an explicit theorem/countermodel analysis of:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

under **exactly** the Candidate-A definition.

Only a successful proof may reclassify terminal-interface preservation as derived on this path and allow `TCT-J-001` to pass.
