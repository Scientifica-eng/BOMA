# R-DP-006 — Real Multiplicative-Inverse Architecture

- **Operational Status:** **CLOSED / RESOLVED**
- **Epistemic Status:** **METHODOLOGICAL CHOICE + VERIFIED CONSTRUCTION ROUTE**
- **Input:** `R-MUL-BLOCK-001`, `R-COMP-BLOCK-001`, `R-QARCH-BLOCK-001`, accepted Q inverse interface
- **Primary target:** `RA-08`
- **Selected Stage-I route:** **Route A — direct positive Dedekind reciprocal, then signed extension**
- **Retained branch:** **Route B — completeness/supremum inverse**, reserved for Stage-II comparison

## Decision

Stage One selects the direct Dedekind reciprocal route.

For a positive lower cut `A`, reciprocal membership is constructed from positive rational points outside `A` and existential Q inverse witnesses:

```text
q ∈ recip(A)
  iff
q < 0
  or
∃ r>0 outside A, ∃rinv,
  QInvRel r rinv ∧ q<rinv.
```

The resulting reciprocal is not chosen by a global representative selector.  A representative-independent relation on `RBOMA` is certified first, then extended to all nonzero reals by sign.

## Verified Route-A chain

```text
Q inverse-order interface
  ↓
positive reciprocal LowerCut validity / CutEquiv respect
  ↓
positive principal-Q reciprocal preservation
  ↓
anchored fine bracketing
  ↓
Q reciprocal-gap estimate 004
  ↓
A * recip(A) ≈ 1
  ↓
representative-independent positive inverse relation
  ↓
signed nonzero inverse existence + left inverse + uniqueness
```

Key V5 evidence:

```text
32193229000  reciprocal LowerCut validity / proof independence       PASS
32193653985  positive principal-Q reciprocal preservation            PASS
32193755906  anchored fine bracketing                                PASS
32355200375  Q reciprocal-gap estimate 004                           PASS
32355681924  positive Dedekind inverse product 004                    PASS
32356254961  positive inverse relation 003                            PASS
32356513408  nonzero inverse existence/left inverse/uniqueness 004    PASS
```

Therefore:

```text
RA-08 = PASS
```

and the inverse-dependent field portion of `RA-09` is eligible for closure.

## Why Route A is selected

Route A closed the target with already-visible dependencies.  Fine bracketing is required only in the hard reverse inclusion of the product-one proof; it is **not** required to define the reciprocal, prove its LowerCut validity, or prove positive Q reciprocal preservation.

The logical/classical cost is similarly localized:

```text
reciprocal object construction              no global Choice selector
representative independence                 extensional / quotient reasoning
positive product = one                      Q arithmetic + anchored cut bracketing
signed extension                            consumes isolated total-order comparability
positive representative extraction          local classical witness reasoning
```

## Route B — retained, not rejected

The completeness-level route remains a high-value Stage-II branch.  The current accepted completeness interface supplies LUB existence but does not yet supply:

```text
boundedness of reciprocal approximants at the required level;
multiplication/supremum interaction such as x*sup(F)=sup(xF),
or an equivalent continuity theorem.
```

Those are real additional dependencies, so Route B has a materially larger immediate proof surface.  This is a cost comparison, not a mathematical rejection.

## PDSA learning retained

Historical revisions remain valid Learning-Graph evidence:

```text
Q-gap 001 — incorrect endpoint equality in strict/non-strict transitivity proof;
Q-gap 002 — global rewrite polluted the left expression;
Q-gap 003 — accidental use of `<` notation requiring an unavailable LT instance;
Q-gap 004 — explicit qLT chain, PASS;
positive inverse-product 003 — consumed positivity witness name after destructuring;
positive inverse-product 004 — preserved original witness, PASS;
nonzero inverse 003 — ambiguous rNeg_zero provenance;
nonzero inverse 004 — explicit producer-qualified rNeg_zero, PASS;
CI relation/nonzero runs — missing DAG dependencies were classified as assembly defects.
```

None of these failures was a mathematical counterexample to the selected reciprocal architecture.

## Reverse-engineering significance

`R-DP-006` is mandatory input to `RE-R-001`.  The reverse audit must test which accepted contribution is:

```text
intrinsically Dedekind-specific;
reusable Q arithmetic/approximation;
proof-only classical sign/witness selection;
derivable later from higher ordered-complete-field structure;
or replaceable by the retained completeness-level inverse branch.
```

Reconvergence with Route B is **not claimed** in Stage One because Route B was not built to a second full inverse carrier/interface.
