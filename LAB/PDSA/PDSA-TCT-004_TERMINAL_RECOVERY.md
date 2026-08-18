# PDSA-TCT-004 — Terminal Recovery Theorem / Countermodel

**CycleID:** `PDSA-TCT-004`  
**Track:** TCT  
**Date opened:** 2026-08-18  
**Date closed:** 2026-08-18  
**Status:** **CLOSED — PASS / TERMINAL RECOVERY DERIVED**  
**Cycle type:** Mathematical verification cycle

## ParentCycles / LearningInputs

```text
PDSA-TCT-001  Baseline stabilization
PDSA-TCT-002  Pre-numerical metatheory contract
PDSA-TCT-003  Structural equivalence ≈
```

Primary inputs:

```text
TCT-BLOCK-002
TCT-BR-010
TCT-BR-009
TCT-J-001
PDSA-TCT-003 equality audit
PDSA-TCT-003 candidate comparison
```

---

# PLAN

## ResearchQuestion

Under **exactly** the structural-equivalence relation defined by `TCT-BR-010`, is terminal predecessor recovery invariant?

Core form:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

with the base non-empty configuration `U` handled by predecessor `ε` in the meta-level recovery procedure.

## Required discipline

Attempt both proof and counterexample search without assuming:

```text
natural-number length
cardinality
object-level counting
successor
induction over ℕ
a completed quotient carrier
```

---

# DO

## D1 — Normal-form audit

The historical grammar:

```text
NF ::= ε | U | (NF ⊙ U)
```

was found to contain a definitional duplicate because:

```text
ε ⊙ U ≡ U.
```

The canonical selected grammar was refined to:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

This is a presentation refinement only; it adds no numerical structure.

## D2 — Exact proof experiment

Created:

`LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md`

### Meta-resource used

A host-level finite ordered trace/list:

```text
τ(ε)     ≔ []
τ(U)     ≔ [•]
τ(A ⊙ B) ≔ τ(A) ++ τ(B)
```

with:

```text
OBJECT-LEVEL EXPORT: NONE
```

## D3 — Trace invariance

The experiment proved that each exact BR-010 rule preserves `τ`:

```text
SE-1  definitional identity
SE-2  reassociation
SE-3  equivalence closure
SE-4  compatible contextual closure
```

Therefore:

```text
A ≈ B  ⇒  τ(A) ≡ τ(B).
```

## D4 — Normal-form trace injectivity

Using the refined canonical grammar and host-level structural induction/case analysis, the experiment proved:

```text
τ(P) ≡ τ(Q)  ⇒  P ≡ Q
```

for selected normal forms.

No object-level count is constructed or used.

## D5 — Terminal cancellation theorem

For extension forms:

```text
P ⊙ U ≈ Q ⊙ U
```

trace invariance gives:

```text
τ(P) ++ [•] ≡ τ(Q) ++ [•].
```

Host-level right cancellation gives:

```text
τ(P) ≡ τ(Q).
```

Normal-form trace injectivity gives:

```text
P ≡ Q,
```

hence by BR-010 SE-1:

```text
P ≈ Q.
```

The `U` base case returns predecessor `ε` on both sides.

Base/extension cross-equivalence is impossible because the traces have different constructor shapes.

## D6 — Terminal role

The same trace invariant preserves ordered leaf position. Reassociation changes bracketing but never permutes the frontier.

Therefore the structurally final `U` role is preserved on the current selected normal-form family.

## D7 — Counterexample search

The earlier idempotent-collapse model remains a valid warning against generic congruence reasoning, but it is **not** a countermodel to exact BR-010 because it adds the extra equation:

```text
U ⊙ U ≈ U.
```

Any counterexample under exact BR-010 would violate the proved trace invariant.

Result:

```text
NO COUNTEREXAMPLE WITHIN THE EXACT CURRENT SPECIFICATION
```

by invariant proof.

---

# STUDY

## S1 — The historical BR-009 result was not an error

The earlier derivability audit correctly found that terminal preservation did not follow from the **incomplete** specification of `≈` then available.

PDSA-TCT-003 changed the premises by defining a restrictive generated relation.

PDSA-TCT-004 then showed that the new relation derives the missing property.

Thus the epistemic progression is:

```text
UNKNOWN / UNDERSPECIFIED
→ DECLARED ADDITIONAL CONSTRAINT
→ explicit identity specification
→ DERIVED UNDER THAT SPECIFICATION
```

This is exactly the type of cumulative learning PDSA is intended to preserve.

## S2 — A structural invariant replaced numerical counting

The proof did not ask how many `U` blocks occur.

Instead, it preserved a meta-level ordered construction trace under every allowed equivalence rule.

This is a reusable method for later pre-numerical work:

> when numerical measurement would be circular, search for a construction-preserving structural invariant.

## S3 — “Least generated relation” needs an operational reading

To avoid silently assuming a completed quotient or global relation object, BR-010 was clarified proof-theoretically:

> `A ≈ B` is witnessed by an explicit meta-finite derivation from SE-1 through SE-4.

This fits the pre-numerical metatheory contract better than relying on a completed set of equivalence classes.

## S4 — Normal-form grammar quality matters to theorem statements

The earlier grammar was adequate for informal generation but not ideal for literal presentation injectivity because `ε ⊙ U` and `U` coexisted as candidates.

A theorem forced the representation convention to become more exact.

This is a successful example of verification improving architecture rather than merely checking it.

## S5 — Scope discipline

The theorem is not universal cancellation for every future branch.

It depends on:

```text
single elementary U
current ≡ rules
current selected NF grammar
BR-010 SE-1 ... SE-4
absence of collapse/reorder generators
current interface discipline
```

Every material branch must retest it.

---

# ERRORS / RISKS DETECTED

1. Historical NF grammar admitted a definitional base duplicate.
2. Generic congruence could have been mistaken for cancellative congruence.
3. “Least relation” could have been read as silently requiring a completed quotient/global carrier.
4. A proof based on counting occurrences would have reintroduced the CAL-001 circularity risk.

---

# SUCCESSES

1. A constructive proof of terminal predecessor cancellation was obtained.
2. Terminal-role preservation was derived rather than defined into `≈`.
3. No numerical object-level premise was used.
4. The canonical normal-form grammar was strengthened.
5. `TCT-BR-009` can now be reclassified on the current path.
6. `TCT-J-001` can be resolved with explicit evidence.

---

# HUMAN / AI RESEARCH RECORD

## Human contribution

The human research authority required continued execution through cumulative PDSA cycles and had previously established that errors, successful techniques, and human–AI working knowledge are themselves project outputs.

That governance prevented the cycle from treating the first plausible cancellation argument as sufficient without documenting its assumptions and scope.

## AI contribution

The AI research agent:

- detected the historical normal-form grammar redundancy;
- proposed the ordered-trace invariant;
- constructed the derivation-induction proof;
- separated exact-BR-010 counterexample search from generic congruence countermodels;
- applied the result to canonical status updates.

## Verification status

The proof is a documented mathematical derivation under declared metatheory, not yet machine-formalized.

No claim of Lean/formal proof is made.

Independent review remains possible because the proof resources and each premise are explicit.

---

# ACT

## Decision A — refine selected normal form

Canonical TCT-BLOCK-002 now uses:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U).
```

## Decision B — reclassify BR-009 on current path

```text
TCT-BR-009
Operational Status: ACTIVE
Current-path Epistemic Status: DERIVED UNDER TCT-BR-010
```

Historical declared-constraint provenance is retained.

## Decision C — resolve the Junction

```text
TCT-J-001
Operational Status: PASS / RESOLVED
Epistemic Status: DERIVED / VERIFIED UNDER TCT-BR-010
```

## Decision D — do not auto-create downstream Block

```text
TCT-BLOCK-003
RESERVED — ADMISSIBLE NEXT
NOT YET CONSTRUCTED
```

## Decision E — next cycle

Open:

```text
PDSA-TCT-005 — Canonical Decomposition Block
```

---

# ConstructionGraphEffects

```text
TCT-BR-010
      ↓ derives
TCT-BR-009
      ↓ verifies
TCT-J-001 PASS
      ↓ permits
TCT-BLOCK-003 construction cycle
```

---

# LearningGraphEffects

```text
L-TCT-004-01  Structural trace can replace numerical counting.
L-TCT-004-02  Exact generated congruence differs from generic congruence axioms.
L-TCT-004-03  Verification can expose representation ambiguity before mathematics fails.
L-TCT-004-04  Historical non-derivability can become derivability after premises are clarified.
L-TCT-004-05  Proof-theoretic equivalence witnesses avoid premature quotient/global-carrier commitments.
L-TCT-004-06  Cancellation is branch-sensitive and must be retested after identity-law changes.
```

---

# Closure conclusion

**PDSA-TCT-004 CLOSED — PASS.**

The canonical decomposition gate is resolved on the present path. The project may now construct, as a separate unit and cycle, the canonical decomposition Block that exports the verified recovery guarantee downstream.
