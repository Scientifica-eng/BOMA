# R-DP-001 — Stage-One Real Completion Route

- **Operational Status:** **OPEN — PROBE REQUIRED BEFORE SELECTION**
- **Epistemic Status:** **METHODOLOGICAL / MATHEMATICAL CONSTRUCTION DECISION POINT**
- **Input:** `Q-BLOCK-002`
- **Target:** `BOMA-R-ACCEPT-001`

## Decision question

Which completion route should provide the canonical Stage-One `R_BOMA` construction while keeping all new mathematical and formalization commitments explicit?

## Candidate D — Dedekind-style lower cuts

Candidate representation:

```text
lower : Q_BOMA → Prop
nonempty
proper
downward closed
no greatest element / rounded
```

### Expected strengths

```text
order-completeness theorem is structurally direct
supremum of bounded families can be represented by union/existential membership
order is close to subset inclusion
rational embedding is geometrically transparent once Q density is available
```

### Expected costs to probe

```text
predicate-valued representation
extensional identity / quotient choice
Q-density lemma needed for principal-cut roundedness
addition of cuts
sign-sensitive multiplication
inverse construction
possible extensionality commitments if raw predicate equality is used
```

## Candidate C — Cauchy completion

Candidate representation:

```text
seq : N_BOMA → Q_BOMA
Cauchy(seq)
```

with identity by null difference / eventual ε-closeness.

### Expected strengths

```text
addition and multiplication follow pointwise patterns
rational embedding by constant sequences is direct
construction interfaces naturally with later analysis / sequences
```

### Expected costs to probe

```text
positive ε interface
sequence quantification over accepted N
Cauchy stability under multiplication
nonzero inverse requires eventual separation from zero
quotient identity for null difference
order on equivalence classes
completeness proof requires a diagonal/approximation construction
```

## Candidate I — nested rational intervals

May be studied later if it materially lowers commitment cost. It is not required for the initial D/C comparison.

## Mandatory comparison dimensions

```text
new Q lemmas required
new N machinery required
carrier identity cost
logical/extensionality commitments
field-operation construction burden
ordered-field proof burden
completeness proof burden
rational density / Archimedean proof burden
formal verification modularity
Stage-II branch value
```

## Decision lock

Do not resolve this Decision Point until:

```text
1. a shared pre-real strict-order/positivity gateway is defined;
2. a Dedekind representation probe type-checks independently;
3. a Cauchy representation probe type-checks independently;
4. PDSA Study records actual rather than assumed dependency costs.
```

No real carrier is canonical while this lock is open.
