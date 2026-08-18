# PDSA-R-005 — Verified Dedekind Real Addition

**CycleID:** `PDSA-R-005`  
**Status:** **CLOSED — RA-06 PASS**  
**Date:** 2026-08-18  
**Parent / Learning Inputs:** `PDSA-R-001`, `PDSA-R-002`, `PDSA-R-004`, accepted `Q-BLOCK-002`, rational-density gateway  
**Construction Effect:** `R-ADD-BLOCK-001`

## ResearchQuestion

Can addition be constructed directly on the selected Dedekind representation, proved independent of representatives, lifted to `RBOMA`, shown to preserve the accepted rational embedding, and given its commutative-monoid laws without importing a built-in real-number carrier or hidden choice?

## PLAN

Build addition in four layers:

```text
1. raw LowerCut operation
2. CutEquiv-respect theorem
3. quotient lift to RBOMA
4. claim-level laws and Q-embedding preservation
```

Acceptance conditions:

```text
valid LowerCut
representative independence
formal RBOMA operation
rOfQ preserves addition
commutativity
associativity
zero identities
V5 at the actual dependency level
```

## DO

Raw operation:

```text
q ∈ cutAdd(A,B)
iff
∃ a b : Q_BOMA,
  a ∈ A ∧ b ∈ B ∧ q < a+b.
```

Constructed:

```text
cutAdd
cutAdd_respects
rAdd : RBOMA → RBOMA → RBOMA
```

Then proved:

```text
cutAdd(principalCut q, principalCut r)
  ≈ principalCut(q+r)

rAdd(rOfQ q, rOfQ r)
  = rOfQ(q+r)
```

and at the formal carrier level:

```text
rAdd x y = rAdd y x
rAdd (rAdd x y) z = rAdd x (rAdd y z)
rAdd rZero x = x
rAdd x rZero = x
```

## Observations

The reverse inclusion in the principal-cut addition theorem is not witness-trivial. From

```text
x < q+r
```

we need witnesses strictly inside both principal cuts whose sum still lies above `x`. The successful construction uses rational density twice, with additive translation between the two density steps.

Associativity at the raw cut level has the same structural feature: witnesses cannot merely be reassociated syntactically because the operation is defined using a strict slack inequality. A new intermediate witness is obtained by rational density.

## STUDY

### Successful mathematical lessons

1. Rational density is a **reusable certified contribution**, not incidental proof machinery. It is consumed materially by:
   - preservation of rational addition under the principal-cut embedding;
   - associativity of Dedekind addition;
   - the zero-identity reverse inclusion.

2. The strict-slack definition

```text
q < a+b
```

is compatible with quotient-independent addition, but laws naturally require fresh density witnesses.

3. Addition does not need the explicit classical cut-comparability witness `R-LOGIC-BR-001`. Hence:

```text
real addition construction ≠ total-order classical boundary
```

### ErrorsDetected

Two V5 failures were proof/formalization errors, not mathematical counterexamples.

#### Error E1 — rewrite orientation

In the helper for strict/non-strict transitivity, an equality `x=z` was rewritten in the wrong direction. The correction was:

```text
rw [← hxz]
```

rather than

```text
rw [hxz]
```

No definition or theorem statement changed.

#### Error E2 — implicit structure argument

`LowerCut.rounded` has the element implicit:

```text
rounded : ∀ {a}, lower a → ∃ b, lower b ∧ a<b
```

The failed call supplied the element explicitly. The correction was:

```text
A.rounded hxA
```

No mathematical argument changed.

### Failure classification

```text
E1 = PROOF-ENGINEERING / REWRITE ORIENTATION
E2 = FORMALIZATION API / IMPLICIT ARGUMENT
```

Neither failure reopens the mathematical construction.

## VerificationEvidence

```text
Dedekind addition validity + CutEquiv respect + quotient lift
  V5 32183597094 PASS

principal-cut addition equivalence + rOfQ addition preservation
  V5 32183864915 PASS

RBOMA commutativity + associativity + zero identities
  V5 32184188077 PASS
```

Pinned Lean toolchain:

```text
leanprover/lean4:v4.32.1
```

## HiddenAssumptions

No built-in `Real` carrier or real arithmetic theorem is consumed.

No Choice principle is introduced by this cycle.

The cycle materially consumes accepted rational order/addition and the separately proved rational-density theorem.

## HumanContributions

The research architecture requires that construction, verification evidence, and learning from failed attempts remain separate and traceable, and that reverse engineering be executed at an architecturally useful stage rather than forgotten as an end-of-project activity.

## AIContributions

The AI proposed and formalized the strict-slack cut operation, separated raw/quotient/embedding/law gates, diagnosed the two V5 failures, and reconstructed the affected proofs without changing the mathematical operation after those failures.

## LessonsLearned

```text
L-R-ADD-001:
Strict-slack completion operations often consume density as a witness-refinement mechanism.

L-R-ADD-002:
A V5 failure after a stable definition must be classified before any mathematical redesign; both failures in this cycle were backend proof-engineering failures.

L-R-ADD-003:
Q-embedding preservation is a separate theorem from quotient well-definedness and must remain independently auditable.
```

## ACT

Promote:

```text
R-ADD-BLOCK-001 = PASS / ACTIVE
RA-06 Addition = PASS
RA-10 Q-preservation = PARTIAL, with addition PASS
```

Do not yet claim additive-group structure because `RA-05` negation/additive inverse remains open.

## ConstructionGraphEffects

```text
Q density gateway
      ↓
Dedekind LowerCut + CutEquiv + RBOMA
      ↓
R-ADD-BLOCK-001
```

No dependency edge from `R-LOGIC-BR-001` is required for this block.

## LearningGraphEffects

```text
strict-slack witness problem
      ↓
rational density reused
      ↓
addition embedding + laws verified
      ↓
proof-engineering failures classified
      ↓
next Study: real negation exposes an Archimedean approximation gateway
```

## OpenQuestions

The natural Dedekind negation candidate can be defined without a new global logical principle, but the additive-inverse theorem appears to require arbitrarily fine rational bracketing of a cut boundary. This is not to be hidden inside `RA-05`.

## NextCycleInputs

Open an explicit Q-Archimedean approximation gate before promoting real negation/additive inverse. This follows `RG-01` of `BOMA-R-ACCEPT-001`, which requires Archimedean approximation lemmas to be proved before use.
