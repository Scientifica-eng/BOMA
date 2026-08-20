# R-J-002 — Stage-One Real Integration Gate

- **Operational Status:** **PASS / RESOLVED**
- **Epistemic Status:** **DERIVED ARCHITECTURAL INTEGRATION**
- **PDSA:** `PDSA-R-013`, closure refinement in `PDSA-R-014`
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
explicit translation-invariance + negation-reversal laws
witness-based nonzero multiplicative inverse + uniqueness
positive-inverse behavior
formal Dedekind LUB completeness
strict rational-image density
Archimedean natural upper bound
R_STAGE_ACCEPTANCE_AUDIT_001.md
R_CLAIM_V5_INDEX.md
RStageIntegration002.lean
```

## Question

Do all acceptance-level Stage-One R interfaces coexist on one and the same formal carrier, equality, order, constants, operations, rational embedding, inverse relation, and declared completeness scope?

## Integrated certificate

`LAB/payloads/lean/RStage/RStageIntegration002.lean` packages one certificate over the existing `RBOMA` containing:

```text
injective Q embedding
exact Q-order embedding
rLE reflexivity / transitivity / antisymmetry / totality
rLT irreflexivity
0_R != 1_R
additive commutative-group interface
addition translation invariance as an iff
negation order reversal
multiplicative commutativity / associativity / one
full distributivity
nonnegative-factor order compatibility
nonzero inverse existence + uniqueness witnesses
positive inverse behavior
Dedekind least-upper-bound theorem
Q-image density
Archimedean upper-bound characterization
```

No new carrier, arithmetic operation, inverse selector, completeness notion, or axiom is introduced by the certificate.

## Final V5 evidence

Authoritative evidence:

`LAB/20_FORMALIZATION/R_STAGE/evidence/R_INTEGRATION_002_V5_LATEST.md`

Final acceptance-strength run:

```text
run                 32374868448
verified commit     f07363c22b049a3fae028a927df74d4fb28a0680
Lean                4.32.1
result              PASS
```

## Study lineage retained

### Initial integration run

```text
32373666593  FAIL_OR_INCOMPLETE
```

The long dependency assembly reached the integration payload, then failed because `qzero_lt_one` was referenced without opening its actual provider namespace `BOMA.R.Gateway001`.

Classification:

```text
name-resolution / provenance defect
not a mathematical counterexample
not a carrier incompatibility
```

After that repair, the narrower certificate passed in run `32373914836`.

### Closure-audit strengthening

The final RA-09 audit refused to treat the phrase “ordered-field laws” as sufficient evidence for three specifically named obligations:

```text
addition translation invariance
negation order reversal
positive inverse behavior
```

`RDedekindOrderedFieldClosure.lean` was therefore added and the integration certificate widened rather than weakened.

Two transient failures were preserved:

```text
32374548008  integration referenced the new closure namespace before the workflow DAG included its source file
32374636592  closure source omitted visibility of qZero/qOne/principalCut provider namespaces
```

Both are proof-engineering / dependency-visibility Study results. The mathematical goals were retained unchanged. The repaired widened certificate then passed in `32374868448`.

## Scope preserved

`R-J-002` verifies compatibility of the selected Stage-One route. It does **not** enlarge the accepted claim to:

```text
Cauchy / metric / sequential completeness
Dedekind <-> Cauchy carrier equivalence
uniqueness of complete ordered fields
standard-library Real equivalence
transcendental analysis
```

The inverse interface remains witness-based; no global Choice-backed inverse function is introduced merely for integration.

## RA-21 result

```text
RA-21 = PASS
```

The final run checks the explicit RA-09 ordered-field closure properties as part of the same-carrier assembly.

## Export effect

`R-J-002` makes `RA-22` eligible for a separate closure decision. It does not itself accept R.

## Reopening conditions

Reopen if any material part changes:

```text
LowerCut / CutEquiv / RBOMA
rOfQ
rLE / rLT / totality witness
rAdd / rNeg / translation-order interface
rMulCandidate / ordered-field closure
nonzero inverse relation
Dedekind LUB contract
rational density or Archimedean theorem
formal commitment interpretation
V5 toolchain or evidence policy
```
