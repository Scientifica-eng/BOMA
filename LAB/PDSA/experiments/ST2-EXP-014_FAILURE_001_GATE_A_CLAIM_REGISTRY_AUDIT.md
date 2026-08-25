# ST2-EXP-014 — Technical Failure Provenance 001: Gate-A Claim Registry Audit

**Experiment:** `ST2-EXP-014`  
**Program:** `ST2-RP-001`  
**Classification:** `TECHNICAL VERIFICATION HARNESS FAILURE / RECOVERY ALLOWED`  
**Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-014_CAUCHY_NATIVE_FULL_C.md`  
**Frozen Plan commit:** `788ae14649f3245fd8d6ccd43f90038ffba7762b`  
**Frozen accepted reference:** `fff2400b65b2c9a260fb28defd907ce24387cb80`  
**Failed exact head:** `d343296bbec4b29551c5fff50460e1448d20e495`  
**Workflow:** `BOMA ST2-EXP-014 Cauchy-Native Full C — V5`  
**Run:** `32868716783`  
**Failed job:** `97870289875`  
**Artifact:** `9571153627`  
**Artifact digest:** `sha256:a24e38d5fcc0cea44914b77145060b7776c4e397c1870ab4219d808d5dbe846b`

## Observed failure

The exact-head V5 run reached `Gate A — verify exact nine-Claim gap inventory` after the exact-head, Frozen-Plan, program-authority, and accepted-source immutability checks had passed. The Gate-A shell then required every `C-CL-*` identifier to occur literally in:

`LAB/00_ARCHITECTURE/C_ACCEPTANCE_SPECIFICATION.md`

The accepted specification is expressed in `CA-*` acceptance obligations and does not contain those Claim identifiers. The canonical Claim identifiers and their accepted producers/evidence are indexed in:

`LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md`

The branch Gate-A gap record also contains all nine required Claim identifiers.

## Classification

This is a verification-harness/audit-root mismatch. It is not evidence that a C Claim meaning is absent, and it did not reach the Lean mathematical proof or native dependency-closure steps. No hypothesis, single changed factor, target Claim cone, success criterion, accepted route, accepted export, acceptance contract, or logical/foundational commitment needs to change.

Accordingly this failure is recoverable under the immutable 014 Frozen Plan and the autonomous-program technical-recovery rule.

## Narrow correction

Keep `C_ACCEPTANCE_SPECIFICATION.md` as an immutable accepted control, but validate `C-CL-*` identifier membership against `CLAIM_REGISTRY.md`, which is the repository Claim-ID index. Continue validating the same nine identifiers against the frozen Gate-A gap matrix. Do not alter the Frozen Plan or any accepted architecture source.

After this correction, rerun the same exact-head V5 workflow and classify any subsequent failure independently before further action.
