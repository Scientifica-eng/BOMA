# E-007 — Trunk / Branch Admissibility

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Source record:** `LAB/TRUNK_BRANCH_ADMISSIBILITY_PROBE_001.md`  
**Epistemic status:** `HYPOTHESIS`

## Question

Can the same Brick be admissible in one context and inadmissible in another without contradiction, particularly when the contexts use different logical regimes or policies?

## Minimal setup

Let the trunk provide an intuitionistic baseline:

```text
T = intuitionistic context
```

Let a branch explicitly extend that context:

```text
B = T + explicit classical principle
```

Use the control commitment:

```text
C: P ∨ ¬P
```

This formula is only a logical control case. It is not being asserted as a definition of a BOMA Brick.

## Test cases

### Case A — C in the intuitionistic trunk

```text
Context: T
Logic regime: intuitionistic
Brick: C
Requirement: classical
```

`C` is not rejected because it is contradictory. Rather, it requires a logical strengthening not provided by the ordinary intuitionistic trunk.

**Provisional status:** not admissible under the current trunk policy.

### Case B — C in an explicitly strengthened branch

```text
Context: B
Logic regime: classical-strengthened
Brick: C
Requirement: classical
```

`C` is compatible with the branch's declared logical context.

**Provisional status:** admissible.

### Case C — explicit branch-forming event

The strengthening can be represented as a contextual event:

```text
T
│
├── trunk: intuitionistic
│
└── branch-1:
      explicit logical strengthening
      ↓
      C
```

The branch can contain `C` without silently changing the original trunk.

### Case D — branch returns to trunk

A branch containing `C` cannot automatically be merged back into the intuitionistic trunk while erasing the additional logical commitment.

Possible resolutions include:

1. keep the strengthening branch-local;
2. prove that the final merged result does not require the strengthening;
3. explicitly promote the strengthening into the trunk under the exceptional-use policy.

Therefore branch convergence does not imply permission to erase branch-specific logical requirements.

## Key distinction

The probe supports:

```text
Brick identity
    ≠
Brick admissibility
```

and provisionally models admissibility as context-sensitive:

```text
Admissible(Brick, Context, LogicRegime, Policy)
```

The same Brick can therefore have different admissibility statuses in different contexts without contradiction.

## Branch membership is not intrinsic Brick identity

A Brick should not become intrinsically classical merely because it was developed in a classical branch.

A more precise record is:

```text
Brick C
requires: classical

Branch B
provides: classical context
```

Compatibility between requirement and context explains admissibility.

## Trunk policy implication

The experiment supports a conservative interpretation of the intuitionistic trunk:

> A Brick requiring a logical strengthening absent from the trunk should not enter the trunk silently merely because it is valid in another branch.

This remains a policy hypothesis, not a normative BOMA rule.

## Negative control

Use an intuitionistically admissible control:

```text
D: P → P
```

Then:

```text
D in trunk  → admissible
D in branch → admissible
```

The existence of branches therefore does not itself alter Brick admissibility.

## Convergence test

Suppose:

```text
A ∈ trunk
C ∈ classical branch
M depends on A and C
```

Then the convergence point `M` inherits a requirement question from `C`. Direct graph dependencies alone may therefore be insufficient to determine admissibility.

A candidate relation is:

```text
Requirements(M)
    ⊇
requirements of relevant dependencies
```

Whether this propagation is semantic, syntactic, or computed by a dedicated analysis remains open.

## Findings

```text
Same Brick can differ in admissibility by context       SUPPORTED
Branch membership is not intrinsic Brick identity       SUPPORTED
Branch validity implies trunk admissibility             REJECTED
Logical strengthening can be branch-local               SUPPORTED PROVISIONALLY
Branch convergence erases requirements automatically    REJECTED
```

## Provisional layered model

The experiment suggests distinguishing:

```text
Brick layer
  What is the Brick?

Context layer
  What commitments are active here?

Policy layer
  What may enter this context?
```

The logical regime is part of contextual evaluation rather than necessarily an intrinsic property of the Brick.

## Relation to previous experiments

```text
E-003 → compatibility is distinct from dependency
E-004 → admissibility can be logic-relative
E-005 → logical requirements benefit from declaration + inference
E-006 → requirement mismatches need layered diagnosis
E-007 → admissibility is additionally context/branch/policy relative
```

## Limitations

This is a conceptual probe. It is not a formal Lean/Coq/Agda/Isabelle verification and does not establish a normative BOMA rule.

## Open questions

1. Is a branch a first-class BOMA object or a contextual graph state?
2. Should a branch explicitly record the logical strengthening that created it?
3. Can a branch merge into the trunk if its final result is independently intuitionistic?
4. How should transitive logical requirements be computed?
5. Is policy part of admissibility or governance only?
6. How should classical, paraconsistent, modal, linear, relevant, and other logical regimes be represented without reducing them to a binary classical/intuitionistic choice?

## Epistemic status

```text
Supported: context-relative admissibility
Supported: branch ≠ intrinsic Brick property
Provisional: branch-local logical strengthening
Open: formal branch object
Open: merge semantics
Open: transitive requirement propagation
Open: policy representation
```

No normative BOMA rule is established by this probe.

## Migration note

This is a standalone PDCA record derived from the original probe. The original record remains preserved during migration and is not silently deleted or rewritten.
