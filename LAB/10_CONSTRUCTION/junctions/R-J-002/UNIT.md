# R-J-002 — Stage-One Real Integration Gate

- **Operational Status:** **PASS / RESOLVED**
- **Epistemic Status:** **DERIVED ARCHITECTURAL INTEGRATION**
- **PDSA:** `PDSA-R-013`
- **Acceptance obligation:** `RA-21`
- **Carrier:** `RBOMA := Quotient cutSetoid`

## Incoming

```text
selected Dedekind LowerCut representation
CutEquiv quotient identity
rOfQ rational embedding
constructive rLE core + isolated classical totality witness
rLT derived strict order
rAdd / rNeg / additive-group laws
rMulCandidate / ordered commutative-ring laws
witness-based nonzero multiplicative inverse + uniqueness
formal Dedekind LUB completeness
strict rational-image density
Archimedean natural upper bound
R_STAGE_ACCEPTANCE_AUDIT_001.md
R_CLAIM_V5_INDEX.md
RStageIntegration002.lean
```

## Question

Do the independently verified Stage-One R components coexist on one and the same formal carrier, equality, order, zero/one, addition, negation, multiplication, rational embedding, and inverse relation, while preserving the declared Dedekind-completeness scope and logical commitments?

## Integrated certificate

`LAB/payloads/lean/RStage/RStageIntegration002.lean` packages a single certificate over the existing `RBOMA` containing:

```text
injective Q embedding
exact Q-order embedding
rLE reflexivity / transitivity / antisymmetry / totality
rLT irreflexivity
0_R != 1_R
additive commutative-group interface
multiplicative commutativity / associativity / one
full distributivity
nonnegative-factor order compatibility
nonzero inverse existence + uniqueness witnesses
Dedekind least-upper-bound theorem
Q-image density
Archimedean upper-bound characterization
```

No new carrier, arithmetic operation, inverse selector, completeness notion, or axiom is introduced by the certificate.

## V5 evidence

Authoritative evidence:

`LAB/20_FORMALIZATION/R_STAGE/evidence/R_INTEGRATION_002_V5_LATEST.md`

Stabilized run:

```text
run                 32373914836
verified commit     67f6eef4ce46504b3648cb3effd22784f07d79c2
Lean                4.32.1
result              PASS
```

## Study retained: first run

The first integration run:

```text
32373666593  FAIL_OR_INCOMPLETE
```

reached the new integration payload after elaborating the long accepted dependency assembly, then failed only because `qzero_lt_one` was referenced without opening its actual namespace `BOMA.R.Gateway001`.

The correction:

```text
open BOMA.R.Gateway001
```

plus changing a proposition-valued `def` to `theorem` for linter clarity did not weaken or remove any integration obligation.

Therefore the first failure is classified as:

```text
Lean name-resolution / provenance defect
NOT a mathematical counterexample
NOT a carrier incompatibility
NOT a missing ordered-field theorem
```

This failure remains part of the Learning Graph.

## Scope preserved

`R-J-002` verifies compatibility of the accepted Stage-One route. It does **not** extend the mathematical claim to:

```text
Cauchy completeness
metric completeness
Dedekind <-> Cauchy carrier equivalence
uniqueness of complete ordered fields
standard-library Real equivalence
transcendental analysis
```

The inverse interface remains witness-based; no global inverse function requiring Choice is introduced merely for integration.

## RA-21 result

```text
RA-21 = PASS
```

The integration gate found no circularity or same-name/same-carrier conflict after the namespace repair.

## Export effect

`R-J-002` makes `RA-22` eligible for a **separate closure decision**.

It does not itself accept the real stage. The final closure must audit `RA-01..RA-21` against `BOMA-R-ACCEPT-001` before exporting an accepted downstream R block.

## Reopening conditions

Reopen if any material part changes:

```text
LowerCut / CutEquiv / RBOMA
rOfQ
rLE / rLT / totality witness
rAdd / rNeg
rMulCandidate
nonzero inverse relation
Dedekind LUB contract
rational density or Archimedean theorem
formal commitment interpretation
V5 toolchain or evidence policy
```
