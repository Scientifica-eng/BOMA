# BOMA-R-ACCEPT-001 — Stage-One Real-Number Acceptance Specification

**Status:** **ACTIVE — GOVERNING SPECIFICATION / FULFILLED BY RA-22 ACCEPT**  
**Original ex-ante specification date:** 2026-08-18  
**Closure status synchronized:** 2026-08-20  
**Input:** `Q-BLOCK-002 — Accepted Stage-One Rational Interface`  
**Accepted export:** `R-BLOCK-001`  
**Closure:** `PDSA-R-014`  
**Post-acceptance reverse audit:** `PDSA-R-015 / RE-R-001 CLOSED`

## Purpose

This specification was intentionally written **before** selecting Dedekind cuts, Cauchy sequences, interval completion, or any other realization. It remains the governing record of what BOMA required before the Stage-One real domain could be accepted.

The specification separates:

```text
accepted rational ordered-field input
completion notion
real carrier / identity
ordered-field structure
Q embedding
completeness proof
Archimedean / density characterization
formalization commitments
branch / convergence claims
```

No standard `Real` carrier may be used as the BOMA real definition merely to discharge these obligations.

### Post-closure status note

The ex-ante obligations below are now discharged as recorded by the canonical closure artifacts:

```text
RA-01..15   PASS, with RA-15 RESOLVED
RA-16       NOT TRIGGERED — correctly discharged
RA-17..20   PASS
RA-21       PASS / R-J-002 RESOLVED
RA-22       ACCEPT
```

The accepted realization is `R-BLOCK-001`, built through the selected Dedekind route. `RE-R-001` subsequently classified which dependencies are acceptance-required versus Dedekind-specific, logical, formalization-specific, reusable, or retained branch candidates. That reverse audit does not rewrite the ex-ante acceptance obligations below.

---

# Pre-real gateways

## RG-01 — Rational ordered-field adequacy

The real stage may consume only the accepted `Q-BLOCK-002` interface and explicitly proved additional rational lemmas.

At minimum, the selected completion route must identify which of the following it needs and prove them before use:

```text
ordered-field laws already accepted
absolute-value or distance interface, if used
positive rational control, if used
Archimedean approximation lemmas, if used
rational density lemmas, if used
countable / sequential structure, if used
bounded-set / upper-bound structure, if used
```

No route may silently import a stronger rational analysis package.

## RG-02 — Completion contract

Before constructing `R_BOMA`, the project must state which completeness notion the selected route realizes.

Candidate contracts include:

```text
Dedekind completeness:
  every nonempty subset bounded above has a least upper bound

Cauchy completeness:
  every Cauchy sequence converges

nested-interval / equivalent completion:
  only if its relation to the accepted real interface is made explicit
```

Stage One may select one completion contract without proving all classical equivalences between completeness notions. Any unproved equivalence must remain outside the acceptance claim.

Selected Stage-One contract after `R-DP-001`:

```text
Dedekind least-upper-bound completeness.
```

No equivalence with Cauchy/metric/sequential completeness is silently promoted.

---

# Real acceptance obligations

## RA-01 — Explicit real carrier

A concrete `R_BOMA` carrier must be constructed from accepted earlier material.

The carrier may not be identified with a built-in real-number type merely by declaration.

## RA-02 — Explicit formal identity

State exactly when two real representatives are equal.

If identity uses:

```text
quotient equivalence
extensional equality of cuts
sequence equivalence
interval equivalence
normalization
```

that commitment must be separately visible.

## RA-03 — Rational embedding

Construct:

```text
iQ : Q_BOMA → R_BOMA
```

and prove injectivity.

## RA-04 — Zero and one

Construct real zero and one and prove compatibility with `iQ`.

## RA-05 — Negation

Construct real additive inverse and prove compatibility with the rational embedding.

## RA-06 — Addition

Construct real addition and prove representative independence / well-definedness before promotion.

## RA-07 — Multiplication

Construct real multiplication and prove representative independence / well-definedness before promotion.

## RA-08 — Nonzero inverse

For every nonzero real, construct or certify a multiplicative inverse in a form sufficient for the accepted field interface.

If a global selector requires Choice, that fact must be explicit; a unique-witness interface may be used instead if sufficient.

## RA-09 — Ordered-field laws

Prove at the accepted carrier/equality level:

```text
nontrivial commutative field behavior
total order
addition translation invariance
negation order reversal
multiplication monotonicity for nonnegative factors
positive inverse behavior
```

## RA-10 — Rational embedding preservation

Prove `iQ` preserves the accepted Q structure required downstream:

```text
0
1
negation
addition
multiplication
order
```

## RA-11 — Selected completeness theorem

Prove the completion theorem promised by `RG-02` for `R_BOMA`.

This is the defining new mathematical obligation of the real stage and cannot be replaced by a representation slogan.

## RA-12 — Rational density

Prove the accepted rational image is order-dense in the real domain, unless the selected completion contract itself supplies an explicitly equivalent characterization and the omission is justified in the integration audit.

Preferred statement:

```text
x < y → ∃q : Q_BOMA, x < iQ(q) ∧ iQ(q) < y.
```

A non-strict reformulation is acceptable if strict order is not primitive, provided equivalence is explicit.

## RA-13 — Archimedean characterization

Prove the accepted real ordered field is Archimedean in an explicit BOMA formulation, or prove a stronger route-specific theorem from which the intended Archimedean property is derived.

This prevents accidental admission of a non-Archimedean complete-looking extension under a weakened completion contract.

## RA-14 — Representation adequacy

State what the chosen representation classifies.

Examples:

```text
Dedekind cuts satisfying the declared cut axioms
Cauchy sequences modulo null difference
nested rational interval histories
```

Do not claim a stronger universal property unless it is constructed.

## RA-15 — Completion-route Decision Point

`R-DP-001` must compare at least:

```text
Route D — Dedekind-style completion
Route C — Cauchy-style completion
```

and may include additional routes.

The decision must record:

```text
new mathematical infrastructure
new logical/formal commitments
identity/equality cost
ordered-field proof burden
completeness proof burden
rational embedding transparency
formal-verification robustness
future Stage-II branch value
```

## RA-16 — Multiple-route convergence discipline

If more than one formal real carrier is actually built in Stage One, their relationship must be tested explicitly before one is called canonical.

Possible outcomes:

```text
isomorphism / order-field equivalence
conditional convergence
partial interface convergence
non-convergence
branch retained
```

If only one formal carrier is built, this gate must be marked **NOT TRIGGERED**, not falsely recorded as reconvergence.

Stage-One outcome:

```text
RA-16 = NOT TRIGGERED
```

because only the Dedekind route was completed to a formal accepted real carrier; the Cauchy route remains retained branch material.

## RA-17 — Completion-notion scope

Record exactly which completeness criterion is proved.

For example, a Dedekind-complete construction must not automatically be labeled Cauchy complete unless the implication is proved in the accepted BOMA environment.

## RA-18 — No hidden standard-real dependency

Audit the active R payloads for accidental use of a built-in real carrier, imported real completeness theorem, or equivalent hidden shortcut.

Any comparison to a standard backend real type must be downstream validation only, never the BOMA definition.

## RA-19 — Formal commitment ledger

Record every new principle actually introduced, including as applicable:

```text
quotient formation
predicate/function extensionality
proposition extensionality
Classical / Choice
countable sequence machinery
powers / absolute value / metric structure
set-comprehension or bounded-subset machinery
```

Absence claims must be source-audited.

## RA-20 — Claim-level formal verification

Each promoted real theorem must have V5 evidence at its actual dependency level.

Failures due proof engineering, missing imports, or CI assembly must be distinguished from mathematical counterexamples in the Study record.

Canonical evidence map:

```text
LAB/20_FORMALIZATION/R_STAGE/R_CLAIM_V5_INDEX.md
```

## RA-21 — Real integration gate

A final `R-J-002` must verify that carrier, equality, ordered-field laws, Q embedding, completeness, density/Archimedean characterization, commitments, and V5 evidence are mutually compatible and non-circular.

Stage-One outcome:

```text
RA-21 = PASS
final acceptance-strength V5 = 32374868448 PASS
```

## RA-22 — Stage-One real acceptance

Only after RA-01 through RA-21 are discharged may:

```text
RA-22 = ACCEPT
```

and an accepted downstream real Block be exported.

Stage-One outcome:

```text
RA-22 = ACCEPT
R-BLOCK-001 = ACTIVE — ACCEPTED
```

---

# Non-goals unless separately built

Stage-One R acceptance does not automatically claim:

```text
all completeness notions have been proved equivalent
uniqueness of complete ordered fields up to unique isomorphism
Dedekind ↔ Cauchy carrier isomorphism
all classical analysis theorems
transcendental functions
measure theory
complex-number construction
```

These require their own construction and verification lineage.

---

# Stage-II branch value

The Q→R transition remains a primary future branching laboratory.

`RE-R-001` refined high-value controlled comparisons to include:

```text
Dedekind cuts ↔ full Cauchy completion
quotient identity ↔ external CutEquiv identity
localized classical comparability ↔ constructive locatedness/order regime
positive/negative decomposition ↔ alternative multiplication architectures
direct Dedekind reciprocal ↔ completeness/supremum inverse
reusable Q approximation ↔ direct cut-bracketing route
rLE+inequality strict order ↔ explicit strict-inclusion witness
```

These are retained branch candidates only; none is opened by the accepted Stage-One R closure or by RE-R-001.

## Current transition status

```text
R        ACCEPTED
RE-R-001 CLOSED / COMPLETE
C        NOT STARTED — USER HOLD
```

No C-stage construction is authorized until a new explicit user order.