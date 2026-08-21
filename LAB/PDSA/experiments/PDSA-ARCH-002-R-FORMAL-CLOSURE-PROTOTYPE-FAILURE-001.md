# PDSA-ARCH-002 — R Formal Closure Prototype Failure 001

**Status:** CLOSED / DIAGNOSED — proof-engineering defect, not mathematical failure  
**Date:** 2026-08-20  
**Program:** `PDSA-ARCH-002_CLAIM_TRANSPARENCY_AND_CLOSURE_PROGRAM.md`  
**Workflow:** `.github/workflows/boma-r-formal-dependency-audit-prototype.yml`  
**Run:** `32399253014`  
**Audited source commit:** `92b8afac54a219473a40174d35556b4ad1e9e0da`  
**Lean:** `leanprover/lean4:v4.32.1`

## Plan

Prototype theorem-level dependency closure for the accepted R integration certificate without changing the elaboration environment of the accepted mathematical assembly.

The intended separation was:

```text
accepted R manifest
  ↓
compile unchanged concatenated accepted source to .olean
  ↓
separate metaprogramming runner imports Lean + accepted .olean
  ↓
walk transitive declaration dependencies from
BOMA.R.StageIntegration002.rStageIntegrationCertificate
```

## Do

The orchestration script created the temporary accepted assembly under the operating-system temporary directory and invoked:

```text
lake env lean -o /tmp/.../BOMAAuditRAccepted.olean /tmp/.../BOMAAuditRAccepted.lean
```

Lean setup itself succeeded.

## Study

The extraction step failed before dependency traversal began. The job log reported:

```text
input file '/tmp/.../BOMAAuditRAccepted.lean'
must be contained in root directory (.../BOMA/)
```

Classification:

```text
MATHEMATICAL COUNTEREXAMPLE                 NO
ACCEPTED R PAYLOAD FAILURE                  NO
TRUSTED-BASE DISCOVERY                      NO
DEPENDENCY-EXTRACTOR SEMANTIC FAILURE       NOT REACHED
WORKSPACE / ASSEMBLY LOCATION DEFECT        YES
```

The defect is caused by Lake/Lean project-root containment rules, not by any accepted R theorem or the dependency-closure design itself.

The workflow correctly preserved a `PROTOTYPE_FAIL` evidence record instead of promoting the run to a transparency claim.

## Act

Move the temporary audit workspace inside the repository root while keeping it transient and untracked:

```text
repo-root/.boma-lean-deps-*/
```

This preserves the key separation invariant:

```text
accepted assembly is still compiled before `import Lean` is introduced by the audit runner
```

Only the filesystem location changes.

After the correction, rerun the prototype and classify any subsequent failure independently. Do not erase or rewrite run `32399253014`; it is retained as Learning-Graph evidence that the first theorem-closure automation attempt exposed a project-root integration constraint.

## Non-effects

This failure and correction do not:

```text
change an accepted theorem;
change the accepted R manifest;
weaken or reopen RA-22;
change the mathematical frontier;
authorize C;
prove or disprove theorem-level transparency.
```
