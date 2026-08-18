# PDSA-N-002-REGIME-COMPARISON-001

**Parent cycle:** `PDSA-N-002`  
**Date:** 2026-08-18  
**Status:** COMPLETE — Stage-One canonical regime recommendation produced

## Purpose

Compare four formal realization styles against `BOMA-N-ACCEPT-001 v1.0` without treating historical framework similarity as equivalence.

---

# 1. Evaluation principles

The comparison prioritizes:

```text
P1  faithful realization of TCT ancestry
P2  explicit new-commitment boundary
P3  generatedness without hidden circular language
P4  induction adequacy
P5  recursion/universal mapping adequacy
P6  uniqueness/standardness evidence
P7  formal-verification suitability
P8  preservation of alternative branches
P9  avoidance of unnecessary structure in N-Core
```

No candidate passes merely because it is a conventional foundation for natural numbers.

---

# 2. R-A — Set-theoretic / Peano-style standard realization

## Formal commitments

Requires an explicit ambient set theory or comparable set-based regime, including whatever existence principles are used to construct the carrier.

Typical commitments include:

```text
set membership/equality
set/object formation principles
an infinity/completion principle adequate to construct N
formal function formation
induction/recursion theorems and their supporting axioms
```

The exact ledger depends on the selected set-theoretic construction.

## TCT bridge

Natural mapping:

```text
ε ↦ 0_N
ExtU(A) ↦ S_N(ρ(A))
```

can be defined recursively at the formal layer.

## Strengths

```text
well-understood standard realization
strong induction/recursion theory available when proved in the ambient theory
straightforward arithmetic continuation
clear model for comparison with conventional mathematics
```

## Risks

```text
large ambient ontology relative to the minimal TCT core
set-theoretic existence/completion commitments can become invisible through familiarity
“Peano” wording can hide first-order/nonstandard-model issues unless semantics are explicit
TCT construction can be overshadowed by importing a ready-made standard N
```

## NAC assessment

Can satisfy NAC-01..14, but only with an explicit set-theoretic commitment ledger and standardness/uniqueness proof.

**Assessment:** VIABLE ALTERNATIVE; not minimal for the current Stage-One canonical route.

---

# 3. R-B — Inductive type with unary initial-algebra reading

## Formal regime

Use a declared dependent type-theoretic regime that admits a fresh inductive carrier with two constructors schematically:

```text
z : N
s : N → N
```

and provides the corresponding induction/elimination principle.

At the nondependent recursion level, this structure may be compared with an initial algebra for the unary signature `1 + X`.

### Important precision

BOMA does **not** claim that an ordinary initial-algebra universal property in every category automatically supplies the full dependent induction principle.

The Stage-One candidate is specifically an **inductive-type realization regime**, with the initial-algebra reading used where justified for recursion/uniqueness comparison.

## New commitments

```text
dependent type-theoretic ambient logic
inductive type formation
constructor rules
elimination/induction rule
formal equality/identity of the type theory
function formation
```

These are explicit formalization commitments, not derivations from TCT.

## TCT bridge

The constructional correspondence is exceptionally direct:

```text
ε              ↦ z
ExtU(A)        ↦ s(ρ(A))
selected history ↦ constructor ancestry
```

TCT no-confusion results align naturally with constructor no-confusion obligations.

## Generatedness

Generatedness is represented through the inductive formation/elimination discipline rather than through the circular phrase “all results after finitely many successors.”

The exact theorem must still be documented in the selected formal regime.

## Induction

The inductive eliminator directly targets NAC-09, with the permitted motive/predicate class determined by the type theory.

## Recursion

The nondependent eliminator/recursor directly targets NAC-10.

## Uniqueness

An accepted uniqueness/equivalence theorem for the selected N-Core must still be proved; it is not merely assumed from the word “inductive.”

However the constructor/eliminator package gives a strong route to such a certificate.

## Formal verification

The repository already has Lean infrastructure. A fresh BOMA-specific inductive carrier could later be encoded there without treating Lean's built-in natural numbers as the definition of BOMA's N-Core.

The mathematical architecture and backend encoding must remain distinct.

## Risks

```text
inductive formation could be treated as “deriving” globality if the commitment ledger is omitted
built-in Nat must not replace the BOMA-specific realization silently
propositional vs definitional equality must remain explicit
initial-algebra and dependent-induction claims must not be conflated
```

## NAC assessment

Provides a direct and auditable route to NAC-02,04,05,08,09,10 and a strong TCT bridge, while keeping the new completion commitment concentrated in an explicit inductive-type formation/elimination regime.

**Assessment:** BEST CURRENT STAGE-ONE CANONICAL CANDIDATE.

---

# 4. R-C — Natural Numbers Object / categorical realization

## Formal regime

Requires an explicitly declared category and the existence of an NNO or corresponding universal object.

The record must state what categorical structure is available and what equality/subobject/predicate notions are used.

## Strengths

```text
elegant universal characterization
strong category-relative recursion/uniqueness
high value as a branch/comparison realization
naturally exposes framework-relative morphism language
```

## Risks

```text
NNO existence is itself a substantial formal commitment
induction/generatedness may require category-specific subobject/logic assumptions
TCT local construction ancestry is less syntactically direct than in an inductive-type realization
category-relative results can be overgeneralized if ambient assumptions are omitted
```

## NAC assessment

Can satisfy NAC-01..14 in a suitable declared category, but several obligations are explicitly category-relative and may require additional structural hypotheses.

**Assessment:** STRONG ALTERNATIVE / FUTURE BRANCH; not selected as the first canonical route.

---

# 5. R-D — Free monoid on one generator

## Formal regime

Formal carrier of finite words in one generator with empty word and concatenation.

## TCT fidelity

Very high for the current finite constructional syntax:

```text
ε          ↔ empty word
U          ↔ generator
⊙          ↔ concatenation
ExtU       ↔ append generator
history    ↔ word ancestry
```

## Strengths

```text
excellent structural model of the pre-numerical TCT core
transparent relation to concatenation
useful for later branch comparison and arithmetic composition interpretation
```

## Limitation

The monoid universal property concerns monoid morphisms into monoids.

By itself it does not automatically supply the full arbitrary recursion/induction package required by NAC-09/NAC-10 for an N-Core in every formal regime.

Additional structure/theorems could bridge that gap, but then the acceptance evidence comes from more than the monoid universal property alone.

## NAC assessment

Strong constructional realization/comparison model, incomplete as an automatic full N-Core certificate.

**Assessment:** PRESERVE AS STRUCTURAL ALTERNATIVE / COMPARISON BRANCH.

---

# 6. Comparative matrix

| Criterion | R-A Set/Peano | R-B Inductive Type | R-C NNO | R-D Free Monoid |
|---|---|---|---|---|
| TCT ancestry fidelity | HIGH | **VERY HIGH** | MEDIUM-HIGH | **VERY HIGH** |
| New commitments easy to isolate | MEDIUM | **HIGH** | HIGH but category-heavy | HIGH |
| Generatedness route | HIGH | **VERY HIGH** | HIGH / category-dependent | MEDIUM without extras |
| Induction adequacy | HIGH if proved | **VERY HIGH via eliminator** | CONDITIONAL on ambient structure | NOT AUTOMATIC |
| Recursion adequacy | HIGH if proved | **VERY HIGH** | **VERY HIGH category-relative** | NARROWER monoid universal property |
| Uniqueness route | HIGH with strong characterization | **HIGH** | **VERY HIGH category-relative** | HIGH as free monoid, not automatically N-Core |
| Minimal extra ontology relative TCT | MEDIUM-LOW | **HIGH** | MEDIUM | HIGH |
| Lean/backend suitability | HIGH | **VERY HIGH** | MEDIUM | HIGH |
| Risk of familiar-framework smuggling | HIGH | MEDIUM | MEDIUM | MEDIUM |
| Recommended Stage-One status | ALTERNATIVE | **CANONICAL CANDIDATE** | ALTERNATIVE | STRUCTURAL ALTERNATIVE |

The table is a research comparison, not a proof that the candidate frameworks are equivalent.

---

# 7. Recommended canonical regime

Select for the first Stage-One formal N-Core attempt:

> **R-B — a fresh BOMA-specific inductive-type realization in an explicitly declared dependent type-theoretic regime, with its nondependent recursion compared to the unary initial-algebra structure where justified.**

This selection is methodological rather than metaphysical.

Reasons:

1. direct structural correspondence with `ε` and terminal extension;
2. generatedness and induction are exposed through the same declared inductive formation/elimination commitment rather than imported piecemeal;
3. recursion has an explicit eliminator/recursor route;
4. the new global commitment is easy to locate at the formalization boundary;
5. it is well suited to reproducible formal verification using the repository's existing Lean backend while preserving backend/definition separation;
6. set-theoretic, NNO, and free-monoid routes remain available as later branch tests.

---

# 8. Commitment ledger preview for R-B

A future realization must explicitly mark at least:

```text
NEW FORMAL COMMITMENTS
- dependent type-theoretic ambient regime
- formation of a fresh inductive type N_BOMA
- constructors z and s
- eliminator / induction principle
- formal equality of the regime
- global function formation

TCT-ANCHORED CORRESPONDENCE
- ε ↦ z
- ExtU ↦ s
- BR-010 equivalence must be respected
- no-confusion results must be preserved/derived
- structural history must correspond to constructor ancestry
```

The commitment ledger prevents the inductive carrier from being presented as if it were forced by the pre-numerical core.

---

# 9. Next verification obligations

Before activating `TCT-BLOCK-006`, a formalization-boundary cycle must specify and verify:

```text
1. exact dependent type-theoretic regime used
2. whether Lean is implementation backend or normative formal regime
3. fresh BOMA carrier definition, not silent use of built-in Nat
4. formal TCT realization correspondence
5. identity reflection / faithfulness
6. no-confusion preservation
7. generatedness certificate
8. induction adequacy
9. recursion adequacy
10. uniqueness/standardness certificate
11. NAC-13 preservation certificate
12. NAC-14 new-commitment ledger
```

---

# 10. Verdict

```text
R-B recommended for Stage-One canonical formal realization.
R-A, R-C, R-D retained as explicit alternatives.
```

This recommendation should be recorded as a Decision Point, not as a theorem that R-B is uniquely necessary.
