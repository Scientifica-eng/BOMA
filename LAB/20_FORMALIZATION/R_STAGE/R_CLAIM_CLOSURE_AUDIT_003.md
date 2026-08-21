# R_CLAIM_CLOSURE_AUDIT_003 — PDSA-ARCH-002 Declared-Closure Calibration

**Status:** DECLARED-CLOSURE COMPLETE / FORMAL-CLOSURE COMPARISON PARTIAL  
**Date:** 2026-08-20  
**Target:** `R-BLOCK-001 — Accepted Stage-One Real Interface`  
**Program:** `PDSA-ARCH-002`  
**Schema:** `BOMA-ARCH-CLAIMS-001`  
**Registry:** `BOMA-CLAIM-REGISTRY-001`

## 1. Purpose

Calibrate the new Claim Architecture against the already accepted and reverse-audited R stage.

This audit does not re-prove R and does not change `RA-22 = ACCEPT`. It asks a different question:

> Can every acceptance-level R claim and every known material dependency class be located in the declared assertion/construction/evidence graph without leaving a known hidden or implicit mathematical commitment?

## 2. Baseline evidence

Current branch baseline was created from:

```text
main@6bb10f16fba3caf171bebd1731a4d209832ae35b
```

The latest canonical integration evidence at that baseline records:

```text
Status          PASS
Verified source af0a03d83245b1e15e9903df00db89edf3317042
Workflow run    32385379288
Lean            leanprover/lean4:v4.32.1
```

The integration assembly manifest is:

```text
LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt
```

and the current repository Lake manifest records no external Lake packages.

## 3. Acceptance-level Claim closure

The project-level registry now exposes these R acceptance claims:

```text
R-CL-CARRIER-001
R-CL-QEMBED-001
R-CL-ORDER-001
R-CL-NONTRIV-001
R-CL-ADD-001
R-CL-MUL-001
R-CL-INV-001
R-CL-FIELD-001
R-CL-COMP-001
R-CL-DENSITY-001
R-CL-ARCH-001
R-CL-INTEGRATION-001
```

Together they cover the promoted mathematical content of:

```text
RA-01..13
RA-20
RA-21
RA-22 acceptance decision
```

while architecture/source/governance obligations remain in the existing acceptance audits and PDSA closure records.

## 4. Declared dependency classification matrix

| Claim | Main mathematical producers | Route/representation dependency | Logical commitment | Formalization / verification dependency | Declared result |
|---|---|---|---|---|---|
| `R-CL-CARRIER-001` | Dedekind carrier/identity layer | `LowerCut`, `CutEquiv` | none required merely to define carrier | `Quotient cutSetoid`, Lean quotient infrastructure | COMPLETE |
| `R-CL-QEMBED-001` | principal-cut Q embedding | Dedekind principal cuts | none globally assigned | quotient lift/equality | COMPLETE |
| `R-CL-ORDER-001` | constructive `rLE` core + `R-LOGIC-BR-001` | cut inclusion | localized `Classical.em` for total comparability | quotient order lift | COMPLETE |
| `R-CL-NONTRIV-001` | Q strict order + faithful embedding | current Q→Dedekind embedding | no additional commitment | final closure/integration | COMPLETE |
| `R-CL-ADD-001` | add/neg/Q-approx/additive-group Blocks | Dedekind cut add/neg/bracketing | localized finite membership search in fine bracketing | quotient lifts | COMPLETE |
| `R-CL-MUL-001` | `R-MUL-BLOCK-001` | positive envelope/kernel + signed decomposition | proof-level sign classification consumes totality | quotient operation stack | COMPLETE |
| `R-CL-INV-001` | direct reciprocal chain + `R-FIELD-BLOCK-001` | positive Dedekind reciprocal/bracketing | localized witness/sign steps | quotient representative independence | COMPLETE |
| `R-CL-FIELD-001` | additive group + ordered ring + inverse witness + closure | inherits only consumed route-specific inputs | inherits only consumed logical inputs | `RDedekindOrderedFieldClosure.lean` + integration | COMPLETE |
| `R-CL-COMP-001` | `R-COMP-BLOCK-001` | witness-union Dedekind LUB | does not consume total-comparability witness | quotient family/representative interface | COMPLETE |
| `R-CL-DENSITY-001` | `R-DENSITY-BLOCK-001` | rounded cuts + principal-cut sandwich | localized strict-inclusion witness extraction | quotient strict order | COMPLETE |
| `R-CL-ARCH-001` | `R-ARCH-BLOCK-001` | proper/downward cuts + principal cut | no fine-membership-search inheritance | quotient strict order | COMPLETE |
| `R-CL-INTEGRATION-001` | `R-J-002` integration certificate | all selected current producers | all material logical commitments only through consumed claims | source manifest + workflow + Lean 4.32.1 | COMPLETE |

## 5. Explicit non-hidden boundaries

The following formerly easy-to-conflate dependencies are now explicitly separated in the claim closure:

### 5.1 Total order versus Dedekind carrier

```text
LowerCut / CutEquiv / RBOMA
```

do not silently contain total comparability. Totality is traced through `R-LOGIC-BR-001` and its localized classical proof.

### 5.2 Completeness versus classical totality

`R-CL-COMP-001` does not consume the total-comparability witness merely because both are accepted R properties.

### 5.3 Negation operation versus additive-inverse theorem

The cut/quotient negation construction is cheaper than the full additive inverse theorem; the hard reverse containment consumes fine cut bracketing.

### 5.4 Q arithmetic approximation versus Dedekind membership search

Q natural upper bounds and Archimedean scaling are not assigned the local classical cost of searching arbitrary `LowerCut` membership.

### 5.5 Multiplication versus inverse

`R-MUL-BLOCK-001` remains an ordered-ring contribution. Nonzero inverse is a distinct producer chain through `R-FIELD-BLOCK-001`.

### 5.6 Completeness versus inverse

The accepted inverse is not silently produced by LUB completeness. The selected direct reciprocal route is independently declared; the completeness/supremum inverse remains an unbuilt alternative.

### 5.7 Accepted property versus selected realization

The registry explicitly distinguishes acceptance-required properties from:

```text
Dedekind representation
quotient identity
current classical totality proof
current multiplication architecture
direct reciprocal route
```

None of those selected producers is promoted to universal mathematical necessity by this audit.

## 6. Known logical commitments captured

At the current R audit granularity the declared graph includes the known material localized classical boundaries already isolated by R construction/reverse audit:

```text
Classical.em for cut total comparability
Classical.em for finite cut-membership search in fine bracketing
Classical.byContradiction / localized extraction in positive-representative work
localized classical witness extraction in strict rational density
```

This audit does not infer that every theorem in R inherits all four. Each Claim Record carries only the logical dependencies relevant to its current producer path.

## 7. Trusted/formal boundary captured

The new Trusted Base record distinguishes:

```text
Lean dependent type-theoretic/checker environment
inductive/eliminator infrastructure
formal equality/universe infrastructure
Quotient availability
Lake/checker invocation
Git/GitHub provenance
GitHub Actions execution
source assembly manifests
```

from BOMA's own representation/formalization decisions.

In particular:

```text
Lean provides Quotient infrastructure
```

does not imply:

```text
QBOMA or RBOMA had to be quotient carriers.
```

## 8. Formal-closure comparison performed in this cycle

The following actual verification boundary is already inspectable and declared:

```text
R_INTEGRATION_002_INPUTS.txt
  → ordered explicit source assembly
  → RStageIntegration002.lean certificate
  → lake env lean under v4.32.1
  → evidence record tied to verified GITHUB_SHA
```

The hardened workflow validates that every manifest path exists and refuses evidence promotion when verification inputs drift between the verified source and the main head used for evidence recording.

Therefore the **file-level acceptance assembly closure** is explicit and guarded.

## 9. What is not yet certified by this audit

This cycle has **not yet** produced a machine-derived theorem-level dependency graph from the Lean elaborated environment and compared every transitive declaration used by the acceptance certificate against the Claim Registry.

Accordingly the correct status is:

```text
DECLARED-CLOSURE COMPLETE
FILE-ASSEMBLY CLOSURE EXPLICIT
FORMAL THEOREM-LEVEL CLOSURE COMPARISON PARTIAL / NOT YET AUTOMATED
TRANSPARENCY PASS NOT YET PROMOTED AS A MACHINE-CHECKED PROPERTY
```

This distinction is intentional. The audit does not claim an absolute proof that no undiscovered dependency exists merely because the human-readable closure is now complete.

## 10. Residual work before R Transparency PASS

Required next work under `PDSA-ARCH-002`:

1. define a machine-readable representation of R Claim Records and dependency classes;
2. identify a stable extraction method for actual formal dependencies of the final integration certificate;
3. normalize generated/internal Lean declarations so they map either to declared supporting interfaces or Trusted Base rather than creating meaningless claim noise;
4. compare actual closure against declared closure;
5. fail on any unclassified residual dependency;
6. only then promote `R TRANSPARENCY PASS`.

## 11. Audit result

No **known** acceptance-level mathematical claim, selected representation commitment, material logical commitment, or current formal identity commitment found in the existing R acceptance/reverse records remains unrepresented in the new declared Claim closure.

This supports:

```text
R DECLARED CLAIM CLOSURE = COMPLETE at current audit granularity
```

It does **not** yet support the stronger statement:

```text
machine-proved absence of every possible hidden transitive formal dependency
```

No accepted R theorem is changed, weakened, or reopened by this result.
