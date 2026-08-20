# PDSA-ARCH-002 — R Formal Closure Study 001

**Status:** CLOSED — RESIDUAL SET REDUCED TO ZERO  
**Date:** 2026-08-20  
**Branch:** `architecture/claim-transparency-001`  
**Program:** `PDSA-ARCH-002`  
**Scope:** theorem-level dependency transparency for the accepted R integration certificate  
**Mathematical frontier:** unchanged  
**C:** `NOT STARTED — USER HOLD`

## 1. Question

Can the actual Lean declaration closure of

```text
BOMA.R.StageIntegration002.rStageIntegrationCertificate
```

be reduced to:

```text
accepted Claim producers
+ transitive supporting declarations
+ declared logical/formalization commitments
+ explicit Trusted Base
```

with no unclassified residual dependency?

## 2. Method

The study used the accepted ordered source assembly:

```text
LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt
```

under:

```text
leanprover/lean4:v4.32.1
```

The accepted assembly is compiled first without importing Lean metaprogramming support. A separate audit module then imports the compiled assembly plus the dependency extractor. This prevents the audit machinery itself from changing the elaboration environment of the accepted mathematical payload.

The extractor records:

```text
internal declarations
external boundary leaves
direct consumer -> dependency edges
source attribution
generated/private declaration provenance
```

The boundary classifier then applies `FORMAL_DEPENDENCY_POLICY.json`. The final Claim/producer comparator applies `R_FORMAL_CLAIM_PRODUCER_POLICY.json` against the R section of `CLAIM_REGISTRY.md`.

## 3. Learning sequence

This study intentionally preserves the non-linear discovery sequence rather than rewriting it as an error-free final design.

### 3.1 Initial execution defect

The first prototype attempted to compile a temporary accepted assembly outside the Lake package root. Lean rejected that workspace arrangement.

This was a proof-engineering/assembly defect, not a mathematical R defect. It is preserved separately in:

```text
PDSA-ARCH-002-R-FORMAL-CLOSURE-PROTOTYPE-FAILURE-001.md
```

The audit workspace was moved under the repository root and stderr capture was hardened.

### 3.2 First semantic residual set — five residuals

Run `32403672749` exposed five unresolved audit items after successful extraction:

```text
Classical.propDecidable
propext
Nat
noConfusion_of_Nat
BOMA.NCore.RB001.ind.match_1
```

The important result was that source-surface greps had not been sufficient to expose all proof-term dependencies.

### 3.3 Generated/metatheory classification — five to two

The audit was extended with generated-prefix source inference and direct edge provenance.

The following were demonstrated to be formal host/generated infrastructure rather than hidden object-level mathematics:

```text
Nat
noConfusion_of_Nat
BOMA.NCore.RB001.ind.match_1
```

`Nat` occurred through generated constructor-index infrastructure, not as the BOMA N carrier. `noConfusion_of_Nat` occurred as host inductive discrimination support. `ind.match_1` was a range-less generated declaration whose source could be attributed through its parent declaration prefix.

Run `32404264808` therefore reduced the residual set to:

```text
Classical.propDecidable
propext
```

without treating either sensitive dependency as Trusted Base by default.

### 3.4 Hidden proposition decidability — two to one

Direct-edge provenance located `Classical.propDecidable` in three accepted R proof consumers:

```text
qlt_trichotomy
principalLE_iff_qLE
cutNeg_principal
```

The proof architecture was normalized so that the actual classical split is explicit in `qlt_trichotomy` through localized `Classical.em`, while the downstream principal-cut and negation proofs reuse that theorem instead of introducing their own implicit proposition-decidability instances.

This did not change theorem statements or the selected mathematical route. It made the existing logical commitment explicit and localized.

Run `32404741133` reduced the residual set to one:

```text
propext
```

### 3.5 Proposition extensionality artifact — one to zero

`propext` was traced to proof-engineering use of proposition-level rewriting, first in Q/R and finally in generated `simp` helpers for two Z order proofs.

The affected proofs were reformulated using direct `Iff` introduction/elimination and explicit case proofs rather than proposition equality rewriting. No acceptance theorem statement, carrier, operation, representation selection, or mathematical claim was strengthened.

Run `32405080337` produced:

```text
PROTOTYPE_PASS
CLASSIFICATION_PASS
external residuals = 0
internal residuals = 0
```

The final boundary classification contains 76 external leaves, all classified:

```text
65 TRUSTED_METATHEORY
9  TRUSTED_FORMALIZATION_INFRASTRUCTURE
2  DECLARED_LOGICAL_COMMITMENT
0  residual
```

The two logical leaves are the already explicit localized classical commitments:

```text
Classical.em
Classical.byContradiction
```

## 4. Claim/producer closure comparison

A machine-readable R Claim producer policy was then introduced. It does not allow `R-CL-INTEGRATION-001` to claim the entire transitive graph, because that would make the comparison vacuous.

Instead the comparator requires:

```text
R Claim IDs in registry == R Claim IDs in producer policy
all declared producers occur in actual internal closure
all declared producers are reachable from the accepted target
every direct internal dependency of the target is explicitly a Claim producer or integration-local packaging
every internal declaration has ancestry from at least one declared producer
boundary classification already PASS
```

Run `32415451960`, audited source commit

```text
6044629aba7b827070c334e274ef14ec4a95e009
```

produced:

```text
PROTOTYPE_PASS
CLASSIFICATION_PASS
CLAIM_PRODUCER_PASS
```

Measured closure:

```text
registry Claim IDs                         12
policy Claim IDs                           12
declared producers                         29
internal declarations                     606
owned internal declarations               606
unowned internal declarations               0
target direct internal dependencies        27
undeclared target direct dependencies       0
residual groups                             0
```

Internal source-stage distribution:

```text
N-Core          19
N-Arithmetic    59
Z              113
Q              136
R              279
TOTAL          606
```

Multiple Claim ownership is expected for shared lower-stage and shared R support; it records reuse rather than duplicating theorems.

## 5. Study result

For the audited R integration certificate at commit `6044629aba7b827070c334e274ef14ec4a95e009` under Lean 4.32.1:

```text
ActualFormalClosure(R certificate)
  subset-of
Declared R Claim-producer closure
+ declared supporting ancestry
+ explicit logical/formalization commitments
+ Trusted Base
```

with:

```text
unclassified residual dependencies = 0
unowned internal declarations       = 0
undeclared direct producer edges     = 0
```

This satisfies the R-stage Phase-C transparency criterion of `PDSA-ARCH-002` on the architecture branch.

## 6. What this does not prove

This result does not claim:

```text
the Trusted Base is proved by BOMA;
all historical R alternatives have the same closure;
Dedekind/quotient/classical choices are mathematically necessary;
the current result applies retroactively to every historical commit;
N-Core, N-Arithmetic, Z, or Q already have independent stage-root transparency certificates;
C has started.
```

The R audit necessarily traverses upstream N/Z/Q declarations because R consumes them, but separate stage-level transparency certification for those accepted exports still requires their own selected root targets and Claim/producer policies.

## 7. Act

Current justified action:

```text
R — eligible for MACHINE-CHECKED TRANSPARENCY PASS on this architecture branch
```

while:

```text
N-Core        stage-level transparency certification pending
N-Arithmetic  stage-level transparency certification pending
Z             stage-level transparency certification pending
Q             stage-level transparency certification pending
PDSA-ARCH-002 remains ACTIVE
C             NOT STARTED — USER HOLD
```

No historical failure or intermediate residual result is to be deleted; each is part of the Learning Graph that led to the final clean closure.
