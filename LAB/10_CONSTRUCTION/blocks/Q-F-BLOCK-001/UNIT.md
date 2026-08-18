# Q-F-BLOCK-001 — Positive-Natural-Denominator Fraction Route

- **Operational Status:** **ACTIVE / REPRESENTATION V5 PASS / RAW ARITHMETIC SUBGATE ACTIVE**
- **Epistemic Status:** **DECLARED DENOMINATOR DISCIPLINE + DERIVED EQUIVALENCE**
- **PDSA:** `PDSA-Q-001`
- **Depends on:** `Q-GATE-BLOCK-001`, `Z-BLOCK-002`

## Representation

```text
PosDen := successor-shaped natural denominator
RawFrac := (num : Z_BOMA, den : PosDen)
```

The denominator is positive by syntax rather than by an attached proof field.

## Identity relation

```text
(a,b) ~ (c,d)  iff  a*d = c*b
```

where denominators are interpreted through the accepted `N→Z` embedding.

Verified:

```text
reflexive
symmetric
transitive
```

Transitivity explicitly consumes `Q-GATE-BLOCK-001` nonzero multiplication cancellation.

## Integer embedding at representation level

```text
fracOfZ(a) := a/1
```

and:

```text
fracOfZ(a) ~ fracOfZ(b) → a=b.
```

## Verification

Final representation-equivalence V5:

```text
run:  32172543345
Lean: 4.32.1
PASS
```

The preceding failed run localized only a proof-normalization issue in the `a/1` reflection lemma; fraction transitivity itself had already elaborated successfully.

## Current boundary

No quotient carrier has been created.

The next subgate checks whether raw negation/addition/multiplication respect `~`. Only after that may the project study a formal identity realization such as quotient/setoid carrier versus canonical reduction.
