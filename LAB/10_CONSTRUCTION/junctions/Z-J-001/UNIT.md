# Z-J-001 — Integer Representation Convergence

- **Operational Status:** **CONDITIONAL PASS — WRITTEN V4; V5 RECHECK ACTIVE**
- **Epistemic Status:** **CROSS-REPRESENTATION AGREEMENT WRITTEN; MACHINE CONVERGENCE NOT YET PROMOTED**
- **Depends on:** signed-normal-form route, difference-pair route, accepted N-Arithmetic

## Incoming routes

```text
Route S — signed canonical normal forms
Route D — difference pairs + explicit equivalence ~
```

The two routes are independently meaningful constructions. Neither is to be selected as canonical merely because it is easier for the backend.

## Required convergence interface

PASS requires:

```text
1. signed route verified independently;
2. difference-pair route verified independently;
3. exact signed round trip;
4. pair round trip up to ~;
5. p ~ q ↔ normalize(p)=normalize(q);
6. explicit provenance / commitment comparison;
7. pinned-toolchain evidence for the convergence certificate.
```

## Written V4 result

The mathematical audit establishes:

```text
normalizePair(pairOfSigned(z)) = z
pairOfSigned(normalizePair(p)) ~ p
p ~ q ↔ normalizePair(p) = normalizePair(q)
```

Thus the two representations agree extensionally at the written proof level.

## First V5 result

Workflow run `32166470482` under Lean 4.32.1 produced:

```text
Signed route                 PASS
Difference-pair route        PASS
Representation convergence  FAIL
```

Study localized the failure to equality transport inside the convergence proof:

```text
Dependent elimination failed
```

This is not evidence against either representation. The failing proof step attempted dependent elimination on equality of normal forms. It has been replaced by explicit rewriting before applying equivalence reflexivity.

The corrected convergence certificate must receive a fresh successful V5 run before this Junction becomes unqualified PASS.

## Decision-point lock

`Z-DP-001 — Canonical Integer Representation` remains BLOCKED while this Junction is conditional.

No canonical integer representation may be selected before V4 and V5 convergence both pass.

## Reopening conditions after PASS

Reopen if any of the following changes materially:

```text
signed normal-form syntax
normalization algorithm
pair equivalence relation
accepted N addition laws used in pair equivalence
formal equality interface
translation functions between the two routes
```
