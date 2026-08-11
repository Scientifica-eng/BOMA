# Trunk / Branch Admissibility Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test whether the same Brick can be admissible in a branch while being inadmissible in the trunk, without being logically contradictory in either context.

## 1. Question

Can admissibility be context-relative in a way that distinguishes:

```text
Trunk context
Branch context
Logical regime
Declared requirements
Inferred requirements
```

without treating branch membership as an intrinsic property of the Brick?

## 2. Minimal setup

Let the trunk use an intuitionistic baseline:

```text
T = intuitionistic context
```

Let a branch deliberately extend its logical context:

```text
B = T + explicit classical principle
```

Consider a Brick `C` whose commitment requires that classical strengthening.

Conceptually:

```text
C: P ∨ ¬P
```

The experiment is not asserting that this formula alone defines a real BOMA Brick. It is a minimal logical control.

## 3. Test cases

### Case A — C in the intuitionistic trunk

```text
Context: T
Logic regime: intuitionistic
Brick: C
Requirement: classical
```

**Result:** `C` is not rejected because it is contradictory. Rather, it requires an explicit strengthening that the ordinary intuitionistic trunk does not currently provide.

Provisional status:

```text
TRUNK: NOT ADMISSIBLE UNDER CURRENT POLICY
Reason: requires logical strengthening
```

### Case B — C in an explicitly classical branch

```text
Context: B
Logic regime: classical-strengthened
Brick: C
Requirement: classical
```

**Result:** `C` is compatible with the branch's declared logical context.

Provisional status:

```text
BRANCH: ADMISSIBLE
```

### Case C — C as an explicit branch-forming event

Instead of treating `C` as merely a normal Brick, create a branch event:

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

**Result:** The branch can contain `C` without modifying the semantic identity of the original trunk.

### Case D — C returns to the trunk

Attempt to merge the branch containing `C` back into the intuitionistic trunk without carrying the classical commitment.

**Result:** The merge is not automatically admissible. The branch's additional logical commitment must either:

1. remain branch-local;
2. be proven unnecessary for the merged result;
3. be explicitly promoted into the trunk under the exceptional-use policy.

This is important: **branch convergence is not equivalent to permission to erase branch-specific commitments.**

## 4. Key distinction

The experiment supports:

```text
Brick identity
    ≠
Brick admissibility
```

and:

```text
admissibility
    = relation(Brick, Context, LogicRegime, Policy)
```

The same Brick can therefore have different statuses in different contexts without contradiction.

## 5. Branch membership is not a logical property

A Brick should not become intrinsically “classical” merely because it was developed in a classical branch.

More precise records are:

```text
Brick C
requires: classical

Branch B
provides: classical context
```

The compatibility relation is what makes `C` admissible in `B`.

This keeps BOMA language separate from backend configuration and avoids encoding branch history directly into mathematical identity.

## 6. Trunk policy implication

The experiment supports a conservative interpretation of the intuitionistic trunk:

> A Brick that requires a logical strengthening absent from the trunk is not admitted silently into the trunk merely because it is valid in another branch.

A branch can therefore serve as an experimental or specialized context without automatically changing the trunk's logical regime.

## 7. Important negative control

Suppose a Brick `D` is intuitionistically admissible:

```text
D: P → P
```

Then:

```text
D in trunk     → admissible
D in branch    → admissible
```

This demonstrates that branch-specific treatment should not be imposed merely because branches exist.

Branch context matters only when its additional commitments affect the Brick's admissibility.

## 8. Convergence test

Suppose:

```text
A ∈ trunk
C ∈ classical branch
M depends on A and C
```

Then `M` inherits a dependency/requirement question from `C`. The convergence point cannot be classified solely by its direct dependency graph.

A future admissibility calculation may need to account for the logical requirements of transitive dependencies:

```text
Requirements(M)
    ⊇
requirements of relevant dependencies
```

Whether this inclusion should be semantic, syntactic, or computed by a dedicated analysis remains open.

## 9. Findings

```text
Same Brick can differ in admissibility by context       SUPPORTED
Branch membership is not intrinsic Brick identity       SUPPORTED
Branch validity does not imply trunk admissibility      SUPPORTED
Logical strengthening can be branch-local               SUPPORTED PROVISIONALLY
Branch convergence can erase requirements automatically REJECTED
```

## 10. New provisional model

The experiment suggests that BOMA may eventually need to distinguish three layers:

```text
Brick layer
  What is the Brick?

Context layer
  What commitments are active here?

Policy layer
  What is allowed to enter this context?
```

Then:

```text
Admissible(B, C, L, P)
```

where:

```text
B = Brick
C = Context
L = Logic regime
P = construction/admission policy
```

This is a conceptual model only.

## 11. Relation to dependency

The result reinforces the earlier conclusion:

```text
dependency ≠ admissibility
```

A Brick can be independent of the trunk's previous Bricks yet still be inadmissible because its logical requirements are outside trunk policy.

Conversely, a dependent Brick can be admissible if its requirements are satisfied by its context.

## 12. Open questions

1. Is a branch a first-class BOMA object, or merely a contextual graph state?
2. Should a branch explicitly record the logical strengthening that created it?
3. Can a branch be merged into the trunk if its final theorem is independently intuitionistic?
4. How should transitive logical requirements be computed?
5. Is `Policy` part of admissibility or merely part of governance?
6. How should classical, paraconsistent, modal, linear, relevant, or other logical regimes be represented without reducing them to a binary classical/intuitionistic choice?

## 13. Epistemic status

```text
Observed / supported: context-relative admissibility
Observed / supported: branch ≠ intrinsic Brick property
Supported provisionally: branch-local logical strengthening
Open: formal branch object
Open: merge semantics
Open: transitive requirement propagation
Open: policy representation
```

No normative BOMA rule is established by this probe.
