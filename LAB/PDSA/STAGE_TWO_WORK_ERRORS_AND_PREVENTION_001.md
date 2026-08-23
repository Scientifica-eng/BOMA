# STAGE_TWO_WORK_ERRORS_AND_PREVENTION_001 — Retained Failures and Controls

**Document ID:** `BOMA-ST2-ERROR-PREVENTION-001`  
**Status:** `ACTIVE / APPLIES TO FUTURE STAGE-TWO CYCLES`  
**Date:** `2026-08-23`  
**Scope:** closed `ST2-EXP-001`, closed `ST2-EXP-002`, active
`ST2-EXP-003`, current-state architecture synchronization, and exact-head
verification discipline.

This is a lessons-learned record, not a retroactive amendment to either
frozen PDSA Plan. Historical statements remain historical; only
current-state authorities are synchronized.

## 1. Observed errors, evidence, correction, and preventive control

| ID | Observed error | Evidence / manifestation | Actual cause | Correction | Future preventive control |
| --- | --- | --- | --- | --- | --- |
| `ERR-ST2-001` | Frozen Git commit treated as sufficient architectural branch identity | Neither frozen Plan supplied a standardized origin-unit or origin-edge record | Repository ancestry and constructional topology were conflated | Add typed architectural-origin JSON + human-readable ledger | Require `origin_kind`, `origin_id`, upstream/target units, affected cone, frozen commit, and immutable Plan |
| `ERR-ST2-002` | Interface experiment had no explicit source Block or dependency-edge attachment | ST2-EXP-001 described only the C ← R packaging boundary | A dependency-edge mutation was not represented as an architectural object | Attach it to `R-BLOCK-001 -- BOMA-C-R-DEP-001 --> C-BLOCK-001` | Accept `DEPENDENCY_EDGE` as a first-class branch origin; never invent a Brick |
| `ERR-ST2-003` | Decision experiment lacked a complete source-to-export attachment chain | ST2-EXP-002 named `C-DP-001` but omitted the upstream Block and accepted producer in one common record | Decision identity, baseline producer, and downstream export lived in separate files | Record `R-BLOCK-001`, `C-DP-001`, `C-BLOCK-001`, and `C-BLOCK-002` together | Check every origin ID against its actual construction-unit source |
| `ERR-ST2-004` | Canonical Junction ledger contradicted already accepted C | It simultaneously indexed `C-J-001` but described C decisions/routes/Junctions as open, unbuilt, and absent | New inventory rows were added while an older “current boundary” block was not synchronized | Update current boundary and distinguish accepted integration from research reconvergence | Governance audit rejects stale OPEN / UNBUILT / NONE assertions in active current-state records |
| `ERR-ST2-005` | Completed Route Q continued to be called a probe only | C DAG, selected Block records, route decision, maps, graph, and registry retained pre-experiment wording | Route verification strength changed without updating all active architectural consumers | Declare `VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN ACCEPTED EXPORT` consistently | Require both positive verified strength and negative canonical-acceptance boundary |
| `ERR-ST2-006` | Completed research Junction was absent from the central convergence inventory | Combined Lean certificate existed but the ledger described representation reconvergence as impossible | Research Junction indexing was incorrectly treated as equivalent to canonical acceptance | Register `ST2-EXP-002-PQ-J-001` as an `R-FIELD-ISOMORPHISM` research Junction | Never conflate accepted `C-J-001` with research representation-reconvergence evidence |
| `ERR-ST2-007` | README and status documents contradicted selected and accepted C | Current instructions asserted no selected representation, pending C acceptance, an obsolete feature branch, or pending completed reverse audit | Historical descriptions were retained inside sections explicitly claiming to represent current state | Preserve dated historical records; repair current operational, state, and handoff sections | Audit a bounded set of current-state files for prohibited stale assertions |
| `ERR-ST2-008` | Previous-experiment proof normalization initially missed original operation wrappers | ST2-EXP-001 failed exact V5 `32592959836` | Copied proof normalization did not unfold accepted `cMul` / `cAdd` aliases reused by the branch | Add the existing wrappers to the local simplification proof set | Check definitional wrappers when a branch intentionally reuses an accepted carrier/operations |
| `ERR-ST2-009` | Q quotient-coordinate rewriting left unsolved real-certificate goals | ST2-EXP-002 failed exact V5 `32596872373` | The explicit `RStageIntegrationCertificate` argument is not inferable from the rewrite conclusion; quotient projections/encoders were not unfolded | Supply the unchanged R argument and unfold local coordinate definitions | Test quotient extractor/encoder lemmas separately and pass noninferable interface parameters explicitly |
| `ERR-ST2-010` | A rewrite solved its goal before a redundant tactic ran | ST2-EXP-002 failed exact V5 `32596968581` with “No goals to be solved” | The proof script assumed a rewrite leaves a goal after definitional record equality | Remove the redundant follow-up tactic | Treat proof scripts as exact goal-state programs; avoid unconditional tactics after goal-closing rewrites |
| `ERR-ST2-011` | Prior-experiment protection incorrectly rejected an unrelated Junction | ST2-EXP-002 failed exact V5 `32597282848` | Broad `ST2*EXP*001*` matched an experiment-002 document whose Junction sequence ended `001` | Restrict guards to exact experiment-ID prefixes `ST2-EXP-001`, `ST2_EXP_001`, `ST2Exp001`, and `PDSA-ST2-EXP-001` | Include one positive and one unrelated negative path example in identity-sensitive guard checks |
| `ERR-ST2-012` | Expression quotient could be overstated as a complete formal polynomial ring | Historical candidate terminology said “polynomial adjunction / quotient” | Intended mathematical analogy was mistaken for the exact implemented object | Specify “formal-expression normalization quotient”; explicitly state no independent full `R[X]` implementation | Record the actual implemented carrier and prohibit claims exceeding the verified construction |
| `ERR-ST2-013` | Identical kernel axioms could conceal a changed formalization placement | Both routes inherited `[propext, Classical.choice, Quot.sound]` from accepted R | An axiom list alone does not identify the C-stage direct consumers of quotient infrastructure | Retain branch-only exact-source quotient policy and classify direct eliminator / Setoid / Quotient use | Compare both kernel axioms and source-attributed declaration closures |
| `ERR-ST2-014` | Earlier successful evidence could be incorrectly attached to a later documentation head | First proof PASS was run `32597030998`; the later complete head passed `32597346281` | Verification identity belongs to an exact Git commit, not to a mutable branch name | Preserve both historical proof-source evidence and independent exact-head final verification | Pin checkout to event head, print actual SHA, and require every modified final head to pass again |
| `ERR-ST2-015` | Repository-wide unit audit misclassified an explicitly indexed research Junction as a missing accepted unit | Six-stage exact-head V5 failed in run `32599546288` although all six stage proofs passed | `ST2-EXP-002-PQ-J-001` matches canonical identifier syntax, and the previous audit inferred canonical ownership from spelling alone | Read explicitly typed research Junctions from the origin ledger, require their actual research source and explicit nonaccepted status, and exclude only validated research IDs from canonical-unit coverage | Cross-stage audits must distinguish identifier syntax, recorded artifact scope, filesystem unit ownership, and canonical acceptance; reject an undeclared exemption or a research/canonical identity collision |
| `ERR-ST2-016` | The first post-merge `main` audit rejected unchanged accepted C evidence because research files shared its source directory | Main architecture audit execution `#26` failed on merge commit `c5981ef8e6bdd092edd0bb8dd7a6258007636fce` | Stage C freshness was scoped to the entire `CStage` directory, so twelve research-only sources were falsely classified as modifications to accepted C inputs | Resolve freshness from every C source explicitly listed in the unchanged `C_ACCEPTED_INPUTS.txt`, and keep that manifest itself under freshness protection | Compare research additions against the exact accepted-input manifest; test both false-positive research additions and real accepted-source modifications; monitor `push/main` checks independently from pull-request-only run listings |
| `ERR-ST2-017` | Stage-Two governance was hard-coded to exactly two closed experiments and C-only attachment endpoints | ST2-EXP-003 preflight rejected the valid real origin before any Lean verification | The previous auditor treated historical examples as the complete experiment universe and required a verified run before an active build could begin | Preserve exact historical origin/run checks while validating the third typed Q-to-R origin, active lifecycle, twelve R plus nine C Claims, and absent-yet-honest verification evidence | Derive status-sensitive required evidence from explicit typed origin records; test closed and active records together without weakening protected historical assertions |
| `ERR-ST2-018` | Accepted-real freshness repeated the previously fixed shared-directory mistake at a new stage | ST2-EXP-003 preflight found both R and downstream C still watched the entire `RStage` directory | The CStage manifest fix was localized and not propagated to research files appearing under RStage | Scope RStage freshness to `R_INTEGRATION_002_INPUTS.txt` for R and `C_ACCEPTED_INPUTS.txt` for downstream C while retaining both accepted manifests as protected inputs | Apply accepted-source ownership independently at every inherited stage boundary; test research additions and actual accepted-source changes for each scoped directory |
| `ERR-ST2-019` | The active real DAG still asserted that C had not started and remained under an owner hold after C acceptance | ST2-EXP-003 preflight found `R_DAG.md` current-frontier blocks contradicting accepted `C-BLOCK-002 / CA-20` | Prior synchronization audited C-facing records but omitted the upstream real DAG from current-state checks | Synchronize the R DAG with accepted C and the approved real-route experiment; include it in bounded stale-state governance checks | Reopen every directly affected upstream DAG when its downstream acceptance or branch state changes; preserve actual dated historical records instead of stale present-tense prohibitions |
| `ERR-ST2-020` | Bare quotient soundness failed to infer the hidden Cauchy Setoid through a local carrier injection | ST2-EXP-003 exact V5 run `32630769132` failed at `rCmk_eq_iff` on source `aa8bdd8770832bc298339c72fc5992dd6b1b6182` | `exact Quotient.sound` exposes an unapplied polymorphic function before Lean can infer the relation hidden behind `rCmk` | Introduce the concrete `CauchyEquiv` witness and apply `Quotient.sound huv`; distinguish transient error-recovery `sorryAx` from any successful axiom report | Pass explicit quotient relation witnesses through definitional carrier wrappers; record exact source/run, then compare corrected successful axiom reports rather than treating failed declarations as proved |

## 2. Root causes rather than isolated symptoms

The observed defects cluster into four causal families:

1. **Identity-model gap:** Git commit, constructional unit, dependency edge,
   mathematical carrier, and research Junction were not distinguished
   consistently.
2. **State-propagation gap:** a correct new result was added in one document
   while other active current-state records kept stronger obsolete claims.
3. **Proof-elaboration gap:** Lean definitional wrappers, noninferable
   interface arguments, quotient elimination, and solved goals were not
   locally tested before whole-chain verification.
4. **Evidence-boundary gap:** glob patterns, inherited axiom reports, frozen
   Plans, proof-source commits, and later documentation heads were given
   overly broad or ambiguous identities.

The appropriate response is structural controls, not deleting failed runs,
rewriting historical Plans, inventing canonical Blocks, or silently treating a
research field as accepted.

## 3. Mandatory prevention checklist for the next PDSA cycle

Before Plan is frozen:

- Identify exact `origin_kind`, `origin_id`, upstream unit, target unit,
  baseline producer, accepted export, and first divergence.
- State the changed factor and fixed controls separately.
- Classify the alternative as research-only unless independently accepted.
- Specify the actual carrier and avoid unimplemented mathematical shorthand.
- Determine which current-state registries and topology documents will need
  synchronization if the experiment succeeds.
- Predict whether a research artifact's identifier can be mistaken for an
  accepted canonical unit by an existing repository-wide audit.
- Identify the accepted-input manifest and distinguish accepted source
  ownership from a shared source-directory location.

During Do:

- Never rewrite a frozen Plan or erase a failed exact-head run.
- Prove an alternative independently before introducing any comparison route.
- Check explicit interface arguments, definitional wrappers, quotient
  eliminators, extractor data, and witness-only inversion.
- Guard exact experiment IDs; test that unrelated experiment names ending in
  `001` are not misclassified.
- Extract actual dependency closures and classify source-level infrastructure
  separately from inherited kernel axioms.

During Study:

- Record each failure's exact commit, workflow run, failed gate, mechanism,
  correction, and resulting preventive rule.
- Distinguish equal mathematical Claims from equal carriers, proof history,
  logical source provenance, and formalization cost.
- Attach successful runs to their exact verified source commits.

During Act:

- Synchronize the experiment register, origin ledger, current architectural
  graph, unit status, Junction ledger, Claim map, and operational documents.
- Preserve canonical acceptance and separately label verified research
  alternatives and Junctions.
- Validate noncanonical research Junctions against their typed origin ledger
  and actual experiment record; never create a canonical `UNIT.md` solely to
  silence a unit-coverage audit.
- Verify post-merge `push/main` guards separately; a pull-request-only
  workflow query is not evidence that main has no checks or that they passed.
- Run the automated Stage-Two governance audit and all relevant exact-head V5
  checks.
- Do not authorize another experiment or merge without the owner's separate
  explicit decision.

## 4. Enforcement

Machine-readable attachment authority:

```text
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
```

Human-readable attachment authority:

```text
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md
```

Automated current-state / origin / exact-ID auditor:

```text
LAB/00_ARCHITECTURE/tools/stage_two_branch_governance_audit.py
LAB/00_ARCHITECTURE/tools/architecture_consistency_audit.py
```

Verification is integrated into the existing exact-head `ST2-EXP-002`
workflow and the dedicated active `ST2-EXP-003` exact-head workflow before
independent Lean verification. This document
supplements the immutable historical PDSA Plans and does not change them.
