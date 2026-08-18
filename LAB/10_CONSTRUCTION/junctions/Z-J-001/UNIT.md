# Z-J-001 — Integer Representation Convergence

- **Operational Status:** **PASS / RESOLVED**
- **Epistemic Status:** **DERIVED CROSS-REPRESENTATION AGREEMENT**
- **Depends on:** signed-normal-form route, difference-pair route, accepted N-Arithmetic

## Incoming routes

```text
Route S — signed canonical normal forms
Route D — difference pairs + explicit equivalence ~
```

The two routes are independently meaningful constructions. Neither route is erased by convergence or by a later canonical representation choice.

## Convergence interface

The accepted cross-route result is:

```text
normalizePair(pairOfSigned(z)) = z
pairOfSigned(normalizePair(p)) ~ p
p ~ q ↔ normalizePair(p) = normalizePair(q)
```

Thus signed normal forms classify difference-pair equivalence classes without requiring the project to define the Stage-One integer carrier as a quotient type.

## V4 evidence

The written mathematical audit established exact signed round-trip, pair round-trip up to `~`, and the equivalence/normal-form characterization.

## V5 evidence

The first V5 run `32166470482` localized a proof-engineering failure to dependent equality elimination in the convergence certificate. Both independent routes already passed in that run.

The corrected proof replaced dependent elimination by explicit equality rewriting.

Fresh workflow run `32168105466` under Lean 4.32.1 then produced:

```text
Lean setup                   PASS
Signed route                 PASS
Difference-pair route        PASS
Representation convergence  PASS
Workflow enforcement         PASS
```

Repository evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_REP_V5_LATEST.md`

## Export

`Z-J-001` exports a reusable **Integer Representation Convergence Contribution**:

```text
signed normal forms        ↔        difference-pair equivalence classes
```

with both production histories preserved.

## Decision-point effect

`Z-DP-001 — Canonical Integer Representation` is now eligible to resolve.

A later selection is methodological/formalization-specific; it does not convert the non-selected route into a rejected mathematical construction.

## Reopening conditions

Reopen if any of the following changes materially:

```text
signed normal-form syntax
normalization algorithm
pair equivalence relation
accepted N addition laws used in pair equivalence
formal equality interface
translation functions between the two routes
```
