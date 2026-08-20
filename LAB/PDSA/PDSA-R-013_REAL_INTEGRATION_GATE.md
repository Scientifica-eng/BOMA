# PDSA-R-013 — Stage-One Real Integration Gate

- **Status:** **CLOSED — PASS**
- **Primary obligation:** `RA-21`
- **Junction:** `R-J-002`
- **Toolchain:** `leanprover/lean4:v4.32.1`

## Plan

Construct a final machine-checkable integration surface after the claim-level R theorem families had independently passed V5.

The gate must test that the following are simultaneously available on the same formal `RBOMA`:

```text
carrier and quotient identity
Q embedding
non-strict and strict order
nontrivial zero/one
additive group
ordered commutative-ring multiplication
nonzero inverse witnesses + uniqueness
Dedekind LUB completeness
rational density
Archimedean characterization
```

Constraints:

```text
no new carrier;
no new mathematical operation;
no global inverse selector;
no broader completeness notion;
no standard Real shortcut;
do not weaken the certificate merely to obtain V5 PASS.
```

## Do

Created:

`LAB/payloads/lean/RStage/RStageIntegration002.lean`

and workflow:

`.github/workflows/boma-r-integration-002.yml`

The workflow concatenates the accepted N -> Z -> Q -> R dependency chain and ends with one `RStageIntegrationCertificate` theorem.

The certificate explicitly includes `rZero != rOne`, derived from accepted rational strict order through the faithful principal-cut embedding rather than postulated at R.

## Study — run 1

Run:

```text
32373666593
verified commit caf738d06e0d8ce5c254c7c3edff7fae9610da84
result FAIL_OR_INCOMPLETE
```

Lean setup succeeded. The long dependency chain elaborated through the integration payload. The decisive error was:

```text
Unknown identifier `qzero_lt_one`
```

Source inspection showed that the theorem exists in:

```text
namespace BOMA.R.Gateway001
```

The integration payload had opened Q order namespaces but not this gateway namespace.

Classification:

```text
name-resolution / provenance defect
not a mathematical counterexample
not an ordered-field incompatibility
not a missing nontriviality theorem
```

Learning: a final integration Junction can reveal provenance/name-resolution assumptions that remain invisible when theorem families are verified in separate assemblies. This is a genuine integration finding even when all mathematical components are already valid.

## Act — repair

Updated `RStageIntegration002.lean` by:

```text
open BOMA.R.Gateway001
```

and changed the proposition-valued certificate declaration from `def` to `theorem` for linter clarity.

No certificate field or mathematical obligation was removed or weakened.

Repair commit:

```text
67f6eef4ce46504b3648cb3effd22784f07d79c2
```

## Study — run 2

Authoritative evidence:

`LAB/20_FORMALIZATION/R_STAGE/evidence/R_INTEGRATION_002_V5_LATEST.md`

Run:

```text
32373914836
verified commit 67f6eef4ce46504b3648cb3effd22784f07d79c2
Lean 4.32.1
result PASS
```

Verified integrated target:

```text
same-carrier identity/order/Q embedding
additive group
field inverse witness interface
Dedekind LUB completeness
rational density
Archimedean characterization
```

## Act — closure

Register `R-J-002` as:

```text
PASS / RESOLVED
RA-21 = PASS
```

Preserve the first failed run as Learning Graph evidence.

This cycle does **not** set `RA-22 = ACCEPT`; it only makes the final Stage-One R closure audit eligible.

## Learning exported

1. Claim-level V5 is necessary but not identical to integration-level V5.
2. Namespace/name-resolution defects are provenance defects when the mathematical theorem exists and is already in the accepted dependency closure.
3. Integration certificates should include boundary properties such as `0 != 1`, not rely on the informal phrase “field behavior.”
4. A witness-based inverse interface can satisfy integration without introducing Choice-backed global inverse selection.
5. Completeness scope must remain attached to the integrated certificate; here it remains Dedekind LUB completeness only.
