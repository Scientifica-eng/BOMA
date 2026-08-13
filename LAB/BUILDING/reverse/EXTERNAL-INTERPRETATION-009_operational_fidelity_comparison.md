# EXTERNAL-INTERPRETATION-009 — Operational Fidelity Comparison

## Status
Provisional Phase-8 experimental result.

## Question
Which external mathematical interpretation preserves the meaning of the pre-formal construction with the least semantic re-description?

## Criteria
The comparison is not based on the number of axioms. It asks how directly the framework preserves these observed roles:

1. distinguished initial role;
2. elementary extension role;
3. finite construction history;
4. history composition;
5. operational associativity;
6. construction depth;
7. finite decomposition;
8. local referability before a global domain.

## Results

### Free-monoid reading
Strong operational fidelity for history composition, empty-history identity, repeated elementary extension, and construction depth interpreted as generator occurrences. The main semantic shift is that construction histories become formal algebraic words and the “free” property becomes a universal formal assertion.

### Peano-style reading
Strong operational fidelity for initial role, elementary extension, finite chains, and decomposition. The main semantic shift is that the local transition process is represented by a formal successor on a globally declared natural-number domain, with an induction/closure principle supplying totality.

### Initial-algebra reading
Very strong fidelity to base-plus-extension, finite generation, and recursive decomposition. The main semantic shift is that the construction becomes an algebraic signature together with an initiality/universal property.

### Natural-number-object reading
Strong fidelity to initiality and iteration, but with the largest surrounding formal infrastructure. The construction is embedded in categorical structure and identified by a universal property.

## Comparative judgment

On the present evidence, the **initial-algebra reading** and **free-monoid reading** preserve the operational story most directly, but for different reasons. The Peano-style reading preserves the local successor story most directly while adding the strongest explicit closure/induction commitment. The natural-number-object reading is the most infrastructure-heavy.

This is not a final framework selection. “Operational fidelity” is a new comparison criterion, not a proof of superiority.

## Boundary finding

The construction itself does not determine which semantic vocabulary must be used. It determines a set of behavioral constraints. Different frameworks realize those constraints with different amounts and kinds of reinterpretation.

Therefore Phase 8 should continue to compare **semantic fidelity**, **completion mechanism**, and **canonicity mechanism** separately.

## Prohibited shortcut

Operational similarity is not identity. A framework that preserves the constructional narrative well is not thereby proven to be the unique or correct formalization.

## Plan position
Stage 8 — External mathematical interpretation.
