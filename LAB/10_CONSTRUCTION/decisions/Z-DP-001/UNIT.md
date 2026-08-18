# Z-DP-001 — Canonical Integer Representation

- **Operational Status:** **RESOLVED — SIGNED NORMAL FORM SELECTED**
- **Epistemic Status:** **METHODOLOGICAL / FORMALIZATION CHOICE**
- **Triggered by:** `Z-J-001 PASS / RESOLVED`
- **Selected Stage-One carrier:** signed canonical normal forms
- **Retained alternative:** difference pairs with explicit equivalence

## Decision question

Which representation should serve as the canonical Stage-One integer carrier/export after the two representation routes have been shown to converge?

## Candidates studied

### Candidate S — signed canonical normal forms

```text
zero
pos n   -- represents +(s n)
neg n   -- represents -(s n)
```

where `n : N_BOMA` and the syntax excludes duplicate signed zero forms.

### Candidate D — difference pairs

```text
(a,b)
```

with explicit relation:

```text
(a,b) ~ (c,d) ↔ a+d = c+b.
```

A quotient/equivalence-class carrier could be formed from this route, but no such quotient commitment is required merely to retain the mathematical route.

## Convergence evidence

`Z-J-001` establishes:

```text
signed normal forms ↔ pair-equivalence classes
```

through exact signed round-trip, pair round-trip up to `~`, and:

```text
p ~ q ↔ normalizePair(p) = normalizePair(q).
```

V5 run `32168105466` passed both routes and the convergence certificate under Lean 4.32.1.

## Selection criteria

| Criterion | Signed normal form | Difference-pair quotient route |
|---|---|---|
| explicit carrier identity | strong | quotient-dependent |
| normalization transparency | strong | via equivalence/quotient |
| extra quotient commitment | none required | required for quotient carrier |
| natural embedding visibility | direct | direct as `(n,0)` |
| negation visibility | direct sign swap | coordinate swap |
| natural-difference characterization | via retained pair route | intrinsic |
| group-completion interpretation | indirect / via pair route | strong |
| later branch comparison | strong | strong |
| backend equality simplicity | strong | requires quotient or representative discipline |

## Decision

Select **signed canonical normal forms** as the Stage-One canonical integer carrier/export.

This choice is justified by:

```text
explicit identity
no additional quotient-type commitment
canonical normal form
transparent sign structure
straightforward natural embedding
clean downstream interface
```

## Non-selected route status

The difference-pair route is **RETAINED**, not rejected.

It remains first-class evidence for:

```text
natural-difference generation
group-completion intuition / later universal-property work
representation independence
pair-mediated arithmetic construction
future Stage-Two branching
```

## Arithmetic plan after selection

Integer operations will not be accepted from one representation route alone.

The next construction deliberately uses two production routes:

```text
Route DS — direct signed arithmetic on the selected carrier
Route PM — pair-mediated arithmetic followed by normalization
```

They must reconverge before the corresponding operation package is promoted.

## Reopening conditions

Reopen this Decision Point if:

```text
signed normalization ceases to be canonical
pair route exposes a strictly weaker commitment profile than currently recorded
a downstream stage reveals a material obstruction unique to signed export
a formalization change materially alters equality/quotient costs
```

Selection does not assert that signed integers are mathematically more fundamental than difference-pair integers.
