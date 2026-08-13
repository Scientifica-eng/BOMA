# L-018 — Transitive Logical Requirement Learning

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional

## Question

If `B` depends on `A`, and `A` requires a stronger logical regime, must `B` inherit that requirement?

## Test

Compare:

1. B consumes evidence from A whose validity genuinely depends on the stronger logic.
2. B consumes an independently certified result of A that is available under the weaker logic.
3. A contains stronger commitments that are irrelevant to the interface consumed by B.
4. A's internal proof uses stronger logic, but the exported result has an independent weaker certificate.

## Result

The naive propagation rule is too strong:

```text
Requirements(B) = union(Requirements(all dependencies(B)))
```

is **rejected as a universal rule**.

A structural dependency does not by itself imply logical-requirement inheritance.

The more precise provisional principle is:

```text
B inherits a logical requirement from A
only when the evidence/guarantee actually consumed by B
requires that logical strength, or B's own content requires it.
```

## Important distinction

```text
Structural dependency
        ≠
Logical dependency
```

This adds a second distinction:

```text
A's global requirements
        ≠
Requirements of the specific interface/evidence consumed by B
```

## Consequence for branches

A Brick developed inside a classical branch can expose a result that is independently certified intuitionistically. A downstream Brick consuming only that certificate need not inherit the branch's classical requirement.

Therefore:

```text
classical branch history
        ≠
classical requirement of every descendant
```

This is important for eventual branch convergence into the intuitionistic trunk.

## Provisional architectural consequence

BOMA may eventually need to represent not only:

```text
depends_on: A
```

but also what is actually consumed from A:

```text
uses:
  provider: A
  commitment: X
  evidence/certificate: E
```

No concrete schema is adopted yet.

## Learning

Logical requirements should propagate through **evidence and semantic use**, not mechanically through the dependency graph.

This preserves modularity and avoids contaminating an intuitionistically valid result merely because its provider Brick contains unrelated classical material.

## Open questions

- What is a BOMA-level certificate of logical independence?
- Can individual commitments exported by a Brick carry separate logical requirements?
- How much of this can be inferred automatically from Lean/Coq/Agda/Isabelle artifacts?
- How should opaque external results be handled?
- Does this imply that a Brick has a public logical interface?

## Evidence

`LAB/TRANSITIVE_LOGICAL_REQUIREMENT_PROBE_001.md`

## Epistemic status

```text
Naive transitive union       REJECTED
Dependency ≠ requirement     SUPPORTED
Evidence-sensitive flow      SUPPORTED PROVISIONALLY
Certificate model             OPEN
Final Brick schema            OPEN
```
