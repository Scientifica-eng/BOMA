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
| `ERR-ST2-021` | The first additive Cauchy assembly could not resolve accepted rational negation distributivity | ST2-EXP-003 exact V5 run `32631916749` failed on source `5ce11de5f09c9d6d837f73bcc3e3f741f1d2bd00` with unknown identifier `qNeg_add` | The theorem lives in `BOMA.Q.OrderedField001`, but opening that namespace in an earlier source file does not export the open command into the new namespace/file | Open the accepted ordered-field namespace explicitly in the additive source, preserving the same manifest and mathematical dependency | Treat `open` as file/namespace-local elaboration context; every new independently assembled source must declare the exact accepted namespaces whose unqualified theorems it consumes |
| `ERR-ST2-022` | The additive closeness proof rewrote the already normalized hypothesis instead of the still unnormalized goal | ST2-EXP-003 exact V5 run `32631997598` failed on source `037b684e4ee697953e96428ad21b0eee05129258` because the `q_difference_sum` pattern was absent from the helper hypothesis | `qAdd_mono` already produced a sum-of-differences bound; only the target still contained the difference of sums | Keep epsilon-negation normalization on the helper hypothesis, rewrite `q_difference_sum` in the goal, then close with the helper bound | Before `rw ... at h`, inspect which expression actually retains the redex; encode direction and target explicitly when transporting inequalities through algebraic normal forms |
| `ERR-ST2-023` | The additive integration target did not consume the already verified faithful Q embedding | ST2-EXP-003 exact V5 run `32632080736` on source `b43cc942a5707bf8b5d4699f7495e4107c8235ee` compiled all Lean proofs and extracted 389 declarations with zero Dedekind dependencies, but the comparison gate found `rCOfQ_injective` absent from the target closure | The certificate packaged additive laws and Q operation preservation but omitted Q embedding injectivity, so dependency extraction correctly excluded an unconsumed theorem | Add faithful Q embedding as an explicit field of the additive integration certificate and retain the strict closure requirement | Integration certificates must consume every invariant claimed by their milestone; do not weaken a dependency gate merely because a theorem compiled elsewhere in the same manifest |
| `ERR-ST2-024` | The first eventual-boundedness assembly confused the post-substitution inequality and normalized only one double negation | ST2-EXP-003 exact V5 run `32632711528` failed on source `c7998c1b9755c9ce50df1d41c13684a522d3577e`; Lean found `B ≤ 0` where the proof supplied it as `1 ≤ 0`, and left `-(-B)` unnormalized | After assuming `B+1=0`, monotonicity gives `B≤0`, which must first combine with `0≤B`; separately, `rw` rewrote only its first matching occurrence | Derive `B=0`, substitute it into the contradictory equality, and use `simpa only [qNeg_neg]` to normalize both order endpoints | Write the intermediate inequality after every substitution and use whole-expression normalization when the same redex occurs more than once |
| `ERR-ST2-025` | The first product-bound assembly opened two namespaces that export `qNeg_zero` | ST2-EXP-003 exact V5 run `32633098730` failed on source `6379633ab68fbbf092208b2102cd6f85c50282c0` before the new interval-product proofs were evaluated | The existing Cauchy probe and the later boundedness source both provide the same zero-negation fact; unqualified lookup became ambiguous only in the combined new namespace | Keep both provenance-bearing declarations and qualify the intended boundedness theorem at its two uses | Treat independently assembled namespaces as collision-prone; qualify shared algebra lemmas when more than one opened producer exports the same short name |
| `ERR-ST2-026` | The first total-order source used `by_contra`, which is unavailable in the pinned core Lean environment | ST2-EXP-003 exact V5 run `32633963578` failed on source `6b2645093fade72739a73ba080d8e0bee86f1e9a` at the negated-universal witness theorem | The draft assumed a tactic normally supplied by a broader tactic environment rather than the repository's minimal pinned Lean toolchain | Rewrite every contradiction step as an explicit `by_cases` branch and construct the relevant existential/universal counter-witnesses directly | Treat tactic availability as part of the formalization boundary; prefer core term/case constructions for foundational sources |
| `ERR-ST2-027` | The total-order source omitted the accepted rational ordered-field and Cauchy-quotient namespace opens | The same run `32633963578` reported unknown `qadd_mono_right` and interpreted `RCBOMA` as a fresh type variable, cascading into invalid quotient and certificate errors | Namespace context from previous concatenated files is not inherited into a newly declared namespace | Open `BOMA.Q.OrderedField001` and `BOMA.R.StageTwo.CauchyQuotient003` explicitly in the new source | Each source must state the namespaces owning every unqualified operation and carrier; cascading type errors after an unknown carrier should be diagnosed from the first lookup failure |
| `ERR-ST2-028` | Automated congruence misidentified the algebraic subterms in the first reciprocal-difference factorization | ST2-EXP-003 exact V5 run `32637335056` on source `5b0aa06ecad92ae750cbc63cedf43189ab8ea031` failed inside `q_reciprocal_difference` after distributivity | A broad `congr` step asked Lean to infer correspondence between nested commutative products instead of stating the two intended equalities | Prove the positive and negative distributed terms separately as `hfirst` and `hsecond`, then rewrite both explicitly | For quotient-field algebra with reordered products, prefer named intermediate equalities over automated congruence when the target has multiple structurally similar subterms |
| `ERR-ST2-029` | The first ordered-field closure omitted the declared nonzero-gap certificate wrapper even though its theorem was reachable | ST2-EXP-003 run `32637512588` on source `bf3efe665d2131770ac7e312c21ea3c678b062b0` passed Lean and extracted 511 declarations with zero selected Dedekind declarations, but the strict comparison gate reported `CauchyNonzeroGap003.cauchyNonzeroGapCertificate` missing | The inverse proof consumed `nonzero_eventually_sign_separated` directly, so theorem reachability did not imply certificate-level milestone ownership | Add `nonzeroGapCertificate : CauchyNonzeroGapCertificate` to the final ordered-field certificate and keep the comparator strict | Distinguish theorem reachability from declared integration ownership; every milestone certificate claimed as part of the final invariant must be explicitly consumed by the final certificate rather than inferred from nearby reachable lemmas |
| `ERR-ST2-030` | The first completion-core assembly mixed a missing positivity namespace with a misoriented additive monotonicity reuse | ST2-EXP-003 exact V5 run `32638074040` on source head `954de1dd58b4c55eaa199efe17ff0525f6c0f6bc` could not resolve `qPos` and could not match the desired right-added radius order | The new file omitted `BOMA.R.Gateway001`, and `rcle_add_right` produced addition in the opposite syntactic order from `rCClose_mono` | Open the exact positivity namespace and make the two commutativity rewrites explicit before applying transitivity | Treat namespace ownership and operation orientation as separate proof obligations; inspect the exact output shape of reused monotonicity lemmas instead of assuming commutative normalization |
| `ERR-ST2-031` | Quotient induction made a wrapper-level density rewrite brittle | ST2-EXP-003 exact V5 run `32640562655` on head `9d9d5b7a57352bb7661f0d88ee52c046c0b2065c` failed in the second half of `rational_approximation_exists` because `rw [rCAdd_mk]` did not match | After quotient induction the goal exposed `Quotient.mk` directly, while the rewrite theorem was stated through the local `rCmk` wrapper | Replace the wrapper rewrite by an explicit `change` to the representative-level `rCLE (rCmk ...) (rCmk ...)` goal | Under quotient induction, prefer an explicit representation change when the kernel exposes the quotient constructor; do not rely on wrapper spelling surviving elaboration |
| `ERR-ST2-032` | The first full completeness source omitted the accepted rational-order namespace | ST2-EXP-003 exact V5 run `32640838804` on source head `5965aeca240ffd1b681c10ebdd795142b524c734` reached the final completion file but reported unknown `qLE` and `qle_trans` | Namespace opens are source-local; earlier density and approximation files opening `BOMA.Q.Order001` did not export that elaboration context into the completion source | Open `BOMA.Q.Order001` explicitly in `ST2Exp003CauchyCompletion.lean` without changing the completeness statement or error budget | Every new foundational source must open the namespace owning each unqualified relation and transitivity law it consumes; a successful predecessor file is not namespace context for its successor |

## 2. Root causes rather than isolated symptoms

The observed defects cluster into four causal families:

1. **Identity-model gap:** Git commit, constructional unit, dependency edge,
   mathematical carrier, and research Junction were not distinguished
   consistently.
2. **State-propagation gap:** a correct new result was added in one document
   while other active current-state records kept stronger obsolete claims.
3. **Proof-elaboration gap:** Lean definitional wrappers, noninferable
   interface arguments, quotient elimination, algebraic target matching,
   operation orientation, source-local namespaces, and solved goals were not
   locally tested before whole-chain verification.
4. **Evidence-boundary gap:** glob patterns, inherited axiom reports, frozen
   Plans, proof-source commits, certificate ownership, and later documentation
   heads were given overly broad or ambiguous identities.

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
  eliminators, extractor data, witness-only inversion, and certificate-level
  ownership.
- Guard exact experiment IDs; test that unrelated experiment names ending in
  `001` are not misclassified.
- Extract actual dependency closures and classify source-level infrastructure
  separately from inherited kernel axioms.
- When Choice constructs data rather than merely discharging a proposition,
  record that source-level commitment even if the kernel axiom list was already
  present upstream.
- Treat quotient-induction representation and source-local namespace context as
  explicit elaboration boundaries in completion proofs.

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
