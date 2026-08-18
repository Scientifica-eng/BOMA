# R-DP-001 — Stage-One Real Completion Route

- **Operational Status:** **RESOLVED — ROUTE D SELECTED FOR STAGE ONE**
- **Epistemic Status:** **METHODOLOGICAL / MATHEMATICAL CONSTRUCTION DECISION POINT**
- **Input:** `Q-BLOCK-002`
- **Target:** `BOMA-R-ACCEPT-001`
- **Selected route:** **D — Dedekind-style lower cuts**
- **Retained route:** **C — Cauchy completion / first-class later branch**

## Decision question

Which completion route should provide the canonical Stage-One `R_BOMA` construction while keeping all new mathematical and formalization commitments explicit?

## Evidence before decision

### Shared representation probes

V5 `32179389952`:

```text
qLT / qPos / qClose gateway        PASS
Dedekind LowerCut / CutEquiv       PASS
Cauchy QSeq / CauchyEquiv          PASS
```

### Shared rational density gateway

V5 `32179943679`:

```text
strict translation
nonzero multiplicative cancellation
positive half construction
internal Q order density
```

all PASS.

### Rational embedding probes

V5 `32180417291`:

```text
Cauchy constant-sequence embedding            PASS
Dedekind principal-cut embedding              PASS
Dedekind CutEquiv equality reflection         PASS
```

The Dedekind principal-cut route explicitly consumes the independently verified Q-density theorem for roundedness.

### Dedekind completeness skeleton

V5 `32180113386`:

```text
union of a nonempty bounded family of LowerCuts is a LowerCut
all family members are below the union cut
the union cut is below every common upper bound
```

PASS.

This is a direct representation-level least-upper-bound certificate.

## Candidate D — Dedekind-style lower cuts

Representation:

```text
lower : Q_BOMA → Prop
nonempty
proper
downward closed
rounded / no greatest element
```

Identity probe:

```text
CutEquiv A B := ∀q, A.lower q ↔ B.lower q
```

### Observed strengths

```text
representation probe PASS
principal Q embedding PASS
Q equality reflection PASS
principal-cut order reflection constructed
shared Q density dependency explicit and PASS
least-upper-bound-by-union skeleton PASS
completion theorem architecture appears structurally direct
```

### Remaining costs

```text
formal real identity realization still to choose
cut addition / negation
sign-sensitive multiplication
nonzero inverse
lifting inclusion/order to formal carrier
full ordered-field package
Archimedean characterization
final completeness theorem at formal carrier level
```

## Candidate C — Cauchy completion

Representation:

```text
seq : N_BOMA → Q_BOMA
Cauchy(seq)
```

with asymptotic epsilon identity.

### Observed strengths

```text
representation probe PASS
constant-rational embedding PASS
entry does not require Q density
natural interface with later sequence analysis
```

### Remaining unbuilt costs

```text
prove CauchyEquiv equivalence laws
formal identity carrier
pointwise multiplication is Cauchy
order on equivalence classes
nonzero inverse via eventual separation or equivalent theorem
complete the quotient via a diagonal/approximation construction
relate resulting completeness to the accepted R contract
```

These are forward costs, not negative theorems against Route C.

## ACT — selection

Stage One selects:

```text
Route D — Dedekind-style lower cuts
```

because the defining new R obligation is a transparent completeness theorem and Route D already has a verified direct least-upper-bound construction skeleton while also supporting a verified faithful rational principal-cut embedding.

This is a **construction-strategy choice**, not a mathematical claim that Dedekind cuts are uniquely necessary, more fundamental, or the only valid realization of the real numbers.

## Retained branch

Route C is retained as a first-class later branch:

```text
ALTERNATIVE_TO Route D
status: RETAINED / NOT REJECTED
```

High-value future comparison targets include:

```text
formal carrier equivalence
ordered-field isomorphism
Dedekind completeness ↔ Cauchy completeness under explicit assumptions
proof/commitment cost
N-dependency propagation
representation identity cost
formal-verification robustness
```

## Next mandatory subdecision

Selecting Dedekind syntax does **not** yet select formal real equality.

The next Decision Point must choose between at least:

```text
R-DP-002-A  Quotient LowerCut by CutEquiv
R-DP-002-B  retain LowerCut syntax with external CutEquiv as real identity
```

Raw structure equality must not be adopted merely because `LowerCut` is a Lean structure: its predicate field makes extensional identity a substantive commitment.

No real carrier is accepted yet.
