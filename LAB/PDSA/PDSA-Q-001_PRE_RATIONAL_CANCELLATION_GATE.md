# PDSA-Q-001 — Pre-Rational Cancellation / Denominator Gateway

**CycleID:** `PDSA-Q-001`  
**Status:** **CLOSED — QG-01 PASS / QG-02 ROUTE-F DISCIPLINE ADOPTED**  
**Date:** 2026-08-18  
**Source:** `Z-BLOCK-002`  
**Target specification:** `BOMA-Q-ACCEPT-001 v1.0`

## PLAN

Before constructing a rational representation, discharge the assumptions normally hidden inside “fractions modulo cross multiplication.”

```text
QG-01  derive nonzero multiplication cancellation in accepted Z
QG-02  choose an explicit denominator discipline for the first fraction route
```

No fraction-equivalence relation was promoted before QG-01 passed.

---

# DO

## D1 — QG-01 cancellation gateway

Created:

`LAB/payloads/lean/QStage/QGatewayCancellation.lean`

Derivation:

```text
N sum-zero characterization
   ↓
N no-zero-divisor multiplication
   ↓
nonzero product of N successors
   ↓
Z no-zero-divisor by selected signed cases
   ↓
Z additive cancellation / inverse uniqueness
   ↓
negation × multiplication compatibility
   ↓
nonzero multiplicative cancellation
```

Export:

```text
a*b=0 → a=0 ∨ b=0

a≠0 ∧ b≠0 → a*b≠0

c≠0 ∧ a*c=b*c → a=b
c≠0 ∧ c*a=c*b → a=b
```

Canonical gateway:

`Q-GATE-BLOCK-001`.

## D2 — QG-01 V5

```text
workflow run: 32172230166
Lean:         4.32.1
result:       PASS
```

## D3 — QG-02 denominator Study

Compared:

```text
D1 positive natural denominator
D2 nonzero natural denominator + attached validity/sign handling
D3 nonzero integer denominator
```

### Selected discipline for experimental Route F

Use a **structurally positive natural denominator**:

```text
PosDen := predecessor payload d
value(PosDen d) := successor(d)
```

This means positivity/nonzeroness is guaranteed by syntax rather than a proof-bearing field.

Consequences:

```text
sign lives only in the Z numerator
denominator-sign duplication is impossible
order cross multiplication has positive orientation
denominator nonzeroness is derived from successor no-confusion
```

This is a route-level representation choice, not yet the canonical rational identity decision.

## D4 — raw fraction representation and equivalence

Created:

`LAB/payloads/lean/QStage/QFractions.lean`

```text
RawFrac := Z_BOMA × PosDen

(a,b) ~ (c,d) ↔ a*d = c*b
```

Established:

```text
reflexivity
symmetry
transitivity
faithful raw embedding a ↦ a/1 modulo ~
```

Transitivity consumes QG-01 explicitly by cancelling the shared nonzero intermediate denominator.

Canonical representation route:

`Q-F-BLOCK-001`.

## D5 — fraction-equivalence V5

First run `32172400560` failed only in the final Z-embedding reflection lemma: the checker retained `a*1=b*1` instead of automatically applying multiplicative identity.

The cross-product relation itself, including transitivity, had already elaborated before that failure.

The reflection proof was replaced by an explicit equality chain; no fraction definition, denominator discipline, or equivalence clause changed.

Final run:

```text
workflow run: 32172543345
Lean:         4.32.1
result:       PASS
```

---

# STUDY

## S1 — cross-product equivalence depends on a real prior theorem

The experiment confirms that transitivity is not “free syntax.” It consumes exactly the integer nonzero cancellation theorem isolated in QG-01.

This justifies the gateway as a separate Construction Graph unit.

## S2 — positive denominators reduce representational burden without deciding rational identity

Using successor-shaped natural denominators removes:

```text
zero-denominator proof fields
signed denominator normalization
duplicate ± denominator representations
```

but does **not** solve duplicate rational representations such as `1/2 ~ 2/4`.

Therefore denominator discipline and formal rational identity remain distinct architectural questions.

## S3 — first V5 failure was proof opacity, not relation failure

The only failed theorem after the equivalence proofs was `a/1` reflection. Replacing implicit simplification by explicit multiplication-by-one equations closed the run.

Learning:

> preserve the mathematical relation when checker failure occurs strictly downstream in an interface lemma.

---

# ACT

```text
QG-01 = PASS
QG-02 Route-F denominator discipline = ADOPTED
Q-F-BLOCK-001 representation/equivalence = V5 PASS
```

Open the next cycle on:

```text
raw neg/add/mul respect for FracEquiv
formal rational identity realization
Q-DP-001: quotient/setoid vs reduced normal form vs scoped setoid
```

No quotient carrier is created by this cycle.
