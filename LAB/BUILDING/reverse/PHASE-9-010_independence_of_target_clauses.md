# PHASE-9-010 — Independence of Minimal Target Clauses

## Status

Phase 9 — formal matching against the natural-number target.

## Purpose

Test whether the four behavioral clauses proposed in PHASE-9-009 add genuinely independent information, or whether some are already supplied by the reverse-engineered construction and should not be counted as new commitments.

## Clauses under test

1. **No-cycle behavior** — repeated elementary extension does not return to an earlier stage of the same finite history.
2. **Unique finite predecessor** — every non-initial finite stage has one immediate predecessor inside its generated chain.
3. **Generation completeness** — every admitted stage is generated from the distinguished initial role by finitely many elementary extensions.
4. **Indefinite extendability** — every admitted stage can be extended by the same elementary transition.

## Independence analysis

### No-cycle behavior

The earlier construction already treats extension as producing a provenance-distinguished continuation and records recoverable construction depth. This gives strong evidence against cycles inside a single finite history, but it does not automatically establish a formal global acyclicity principle. Therefore the clause is **partly supported, not fully derived**.

### Unique finite predecessor

The decomposition and reverse-step procedures in the preceding construction provide a strong local predecessor pattern for generated finite histories. However, a formal statement that every non-initial admitted stage has exactly one predecessor requires a formal identity relation and a formal domain. Therefore the clause is **strongly motivated by the construction, but not framework-independently proved**.

### Generation completeness

This is not merely a local construction fact. It says that the formal domain contains no stages other than those generated from the initial role by finitely many extensions. This is a **genuinely global completion commitment** and is not derived by the finite construction alone.

### Indefinite extendability

The project has repeatedly distinguished actual finite construction from the possibility of further extension. Therefore indefinite extendability is supported as a continuation capability, but the statement that every member of a completed domain admits another member under the same operation is a **global formal commitment**.

## Minimality result

The four clauses are therefore not equally new.

```text
Local / constructionally supported:
    no-cycle       ← strong evidence, not formal global theorem
    predecessor    ← strong local support

Global / completion-sensitive:
    generation completeness
    indefinite extendability
```

The main reduction is that the real unresolved burden is concentrated in the last two clauses. The first two mostly expose properties already implicit in the finite construction, although their formal versions still require a declared identity/domain.

## Consequence

PHASE-9-009 should not be interpreted as introducing four independent axioms. The current evidence supports treating the behavioral target as:

```text
initial role
+
repeatable extension
+
finite generation/decomposition behavior
+
acyclic/predecessor regularity
+
GLOBAL COMPLETION CONDITIONS
```

where the final global conditions remain the genuine formalization boundary.

## Remaining question

Can the two global conditions themselves be replaced by a single weaker universal or closure principle that is common to all four formal interpretations?

## Rule for Phase 9

A clause is not promoted to an independent foundational commitment merely because it was stated explicitly; its derivability from previously established constructional behavior must be tested first.

## Plan position

Stage 9 — Formal matching against the natural-number target.
Substage 010 — Independence analysis of minimal target specification.
