# LEAN FORMAL DEPENDENCY AUDIT DESIGN

**Document ID:** `BOMA-ARCH-LEAN-DEPS-001`  
**Status:** PROTOTYPE DESIGN / PDSA-ARCH-002 PHASE C  
**Date:** 2026-08-20

## 1. Purpose

Define a technically conservative path from declared Claim closure to an **actual transitive Lean declaration closure** for accepted integration certificates.

The target is not merely source-token scanning. The target is:

```text
selected accepted certificate theorem(s)
  ↓
actual constants occurring in their types/proof bodies
  ↓
actual constants occurring in those declarations
  ↓
...
  ↓
accepted-assembly declarations + explicit external boundary leaves
```

The result can then be compared against the declared Claim/Supporting/Commitment graph and Trusted Base.

## 2. Critical separation: verification environment versus audit environment

The accepted mathematical assembly must not acquire metaprogramming imports merely because it is being audited.

Therefore the prototype uses two compilation stages.

### Stage A — accepted assembly module

```text
accepted source manifest
  ↓ concatenate in declared order
BOMAAudit<Stage>Accepted.lean
  ↓
lake env lean -o ...olean
```

No `import Lean` is injected into this source. It is elaborated as the accepted direct assembly itself.

### Stage B — audit module

```text
import Lean
import BOMAAudit<Stage>Accepted

LeanDependencyExtractor
#boma_dependency_closure <accepted certificate theorem>
```

The metaprogramming environment therefore observes a compiled accepted environment rather than participating in construction/elaboration of that accepted environment.

This distinction is mandatory for any future transparency certification.

## 3. Why proof bodies must be included

Looking only at theorem **types** cannot reveal theorem dependencies used exclusively in the proof term.

The prototype explicitly combines:

```text
ConstantInfo.type.getUsedConstants
+
ConstantInfo.value? true
  → proof/definition body getUsedConstants
```

The `true` argument is essential because theorem and opaque declaration values are otherwise intentionally hidden by the ordinary reduction-facing API.

## 4. Closure boundary

The prototype recursively expands declarations owned by the compiled accepted assembly module.

It stops at constants owned by other imported modules and records them as external leaves.

This is preferable to a name-prefix rule such as `BOMA.*` because Lean may generate:

```text
private declarations
matcher declarations
recursor-related declarations
auxiliary implementation names
```

whose textual names do not preserve a convenient project prefix even though they belong to the accepted assembly module.

Thus:

```text
module ownership
```

is the closure criterion.

## 5. Output classes

The Lean extractor emits:

```text
BOMA_INTERNAL
  declaration belongs to the accepted compiled assembly module

BOMA_EXTERNAL
  declaration is a dependency boundary leaf owned by another module

BOMA_UNRESOLVED
  a referenced constant could not be found in the environment
```

Internal records also include declaration kind and source range where available.

## 6. Source mapping

The Python orchestrator builds the accepted assembly while recording the exact line interval contributed by every manifest source file.

For each internal declaration it uses Lean's saved declaration range to map:

```text
Lean declaration
  → concatenated assembly position
  → accepted manifest source file
```

Declarations with no stored range remain visible as `unmapped_internal_ranges`; they are not silently discarded. Generated declarations may legitimately fall into this category and require explicit classification.

## 7. Immediate hard failures in the prototype

The first theorem-level prototype fails if it detects:

```text
an unresolved constant
an internal axiom declaration
failure to compile the accepted assembly
failure to load/run the dependency extractor
```

It does not yet fail merely because an external boundary module has not been semantically classified against `TRUSTED_BASE.md`; that is the next normalization step.

## 8. What PROTOTYPE_PASS means

`PROTOTYPE_PASS` means only:

```text
accepted assembly compiled;
transitive declaration traversal completed;
no unresolved dependency was encountered;
no axiom declaration was found inside the accepted assembly closure.
```

It does **not** yet mean:

```text
TRANSPARENCY PASS
```

because the following comparison remains:

```text
actual internal declarations
  ↔ declared Claim / Supporting Lemma producers

external boundary leaves
  ↔ explicit Trusted Base categories
```

with zero unclassified residuals.

## 9. Initial target

The first target is R because it has:

```text
R_INTEGRATION_002_INPUTS.txt
RStageIntegration002.rStageIntegrationCertificate
R Claim Registry / closure audit
RE-R-001 dependency classification
```

The root declaration is:

```text
BOMA.R.StageIntegration002.rStageIntegrationCertificate
```

The integration certificate explicitly packages the same-carrier acceptance surface used by `R-J-002`.

## 10. Planned progression after R prototype

If R extraction is stable:

```text
R  → classify actual closure → compare to R Claim closure
Q  → use Q integration theorem family as multiple roots
Z  → identify/standardize final integration root theorem family
N-Arithmetic → final accepted law/package roots
N-Core → compare against existing V5_THEOREM_OWNERSHIP mapping
```

N-Core is expected to be especially valuable for calibration because theorem→Brick/Junction ownership already exists independently.

## 11. Trusted Base normalization

External leaves must eventually be assigned to explicit categories such as:

```text
Lean/Init type-theoretic primitives
formal equality infrastructure
inductive/recursor infrastructure
Quotient infrastructure where selected
basic host data/proposition infrastructure
```

A declaration is not accepted merely because it came from a module outside the BOMA assembly. External-module status is a **boundary observation**, not automatic trust authorization.

## 12. Certification target

The final Phase-C invariant remains:

```text
ActualFormalClosure(E)
  ⊆
DeclaredClosure(E) ∪ ExplicitTrustedBase
```

with no unclassified actual dependency.

Only after the semantic mapping and residual check pass may an accepted export be promoted to:

```text
TRANSPARENCY PASS
```

## 13. Non-effects

This audit mechanism:

```text
does not add a mathematical assumption;
does not reopen an accepted stage;
does not make Lean metaprogramming part of the accepted proof;
does not change accepted theorem statements;
does not authorize C.
```
