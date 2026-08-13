# PHASE-9-007 — Four-Framework Comparison

## Status

Phase 9 — Formal matching against the natural-number target.

## Purpose

Compare the four explicit formal interpretations tested in Phase 9: Peano-style, free monoid on one generator, initial algebra, and natural-number object (NNO). The purpose is to isolate the strongest structure that survives all four interpretations and to distinguish that common structure from framework-specific commitments.

## Four formal matches

### Peano-style

Formal carrier, distinguished initial element, unary successor, and an explicit closure/induction principle sufficient to identify the intended totality.

### Free monoid on one generator

Formal monoid of histories, empty-history identity, associative composition, one distinguished generator, and a freeness/universal-property commitment.

### Initial algebra

Formal algebraic signature with one base constructor and one unary extension constructor, together with a formal algebraic setting and an initiality requirement.

### Natural-number object

Categorical ambient setting, an object equipped with zero-like and successor structure, and the NNO universal property.

## Four-way comparison

| Structural feature | Peano | Free monoid | Initial algebra | NNO |
|---|---|---|---|---|
| Distinguished initial role | Direct | Indirect via empty history/zero correspondence | Direct base constructor | Direct zero-like structure |
| One elementary extension | Successor | Generator | Unary constructor | Successor morphism |
| Finite generation | Yes | Yes | Yes | Yes, under interpretation |
| Finite decomposition | Yes | Yes | Yes | Yes, under interpretation |
| Construction depth | Stage index | Generator-occurrence count | Constructor depth | Finite successor stage |
| History composition | Interpreted | Central operation | Externally represented | Interpreted categorically |
| Empty history | Not central | Explicit identity | Optional constructional identity | Not central |
| Global completion | Closure/induction | Formal monoid carrier; completion depends on chosen presentation | Initiality within formal setting | NNO existence |
| Canonicity | Successor/induction characterization | Freeness | Initiality | Universal property |
| Major external burden | Formal domain + induction/closure | Monoid + identity + freeness | Signature + ambient setting + initiality | Category + NNO universal property |

## Cross-framework invariant core

The following features survive all four formalizations as coherent interpretations of the preceding construction:

1. A distinguished initial structural role.
2. A repeatable elementary extension/transition role.
3. Finite histories generated from the initial role by extension.
4. Recoverability/decomposition of finite histories.
5. A construction-depth invariant for finite histories.
6. A coherent accumulation/composition behavior for finite histories.

These features therefore have the strongest cross-framework status reached in the project so far.

## What does not survive as framework-neutral

The following are not part of the neutral core merely because they appear in one or more formalizations:

- a specific formal carrier or domain;
- a formal equality relation;
- a formal identity element;
- a formal binary operation;
- induction as a logical principle;
- freeness as a universal property;
- initiality as an algebraic or categorical principle;
- existence of an NNO in a categorical ambient setting;
- a globally completed totality of all natural stages.

## Main result

The four formalizations converge strongly on the same finite successor-like generative behavior, but they do not converge on one unique ontology or one unique completion/canonicity mechanism.

Therefore the strongest current result is:

> The reverse-engineered project has identified a robust finite generative core that is independently realizable under four mathematically respectable formal frameworks. The transition from this core to a complete and canonical mathematical object is not fixed by the pre-formal construction alone.

## Consequence for the natural-number target

All four interpretations are compatible with the intended natural-number target under their respective additional assumptions. This demonstrates representability, not framework-free derivability.

In particular, the project has not yet established:

- that the common core alone uniquely determines \(\mathbb N\);
- that any one framework is forced by the neutral construction;
- that the global completion principle can be removed without changing the target;
- that the four interpretations are equivalent under a single framework-neutral notion of equivalence.

## Decision for the project

Phase 9 should not declare a winning framework merely from the four-way comparison. Instead, the next test should target the remaining common ambiguity directly: determine whether a framework-neutral specification can characterize the intended object up to the weakest meaningful equivalence, or whether framework choice is irreducible.

## Rule for Phase 9

No framework-specific theorem is promoted to a pre-formal fact. A result remains conditional on the formal principles used to obtain it.

## Plan position

Stage 9 — Formal matching against the natural-number target.
Substage 007 — Four-framework comparison completed.

Next: test framework-neutral uniqueness at the strongest equivalence level that can be stated without importing a particular mathematical framework.
