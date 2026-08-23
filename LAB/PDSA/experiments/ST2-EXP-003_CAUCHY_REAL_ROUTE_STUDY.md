# ST2-EXP-003 — Cauchy Real Route Execution / Study Record

**Experiment:** `ST2-EXP-003`  
**Status:** `ACTIVE / INDEPENDENT FOUNDATION V5 PASS / FIELD COMPLETION OPEN`  
**Typed origin:** `DECISION_POINT / R-DP-001`  
**Common upstream accepted unit:** `Q-BLOCK-002`  
**Reference accepted producer/export:** `R-BLOCK-001 / Dedekind`  
**Frozen reference:** `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`  
**Frozen Plan commit:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`  
**Downstream affected export:** `C-BLOCK-002 / CA-20 ACCEPT / UNCHANGED`

## DO — precise initial gap

The retained branch originally supplied only `QSeq`, `IsCauchy`,
`CauchySeq`, the unproved candidate `CauchyEquiv`, constant rational
sequences, and constant self-equivalence. It had no proved setoid,
quotient carrier, faithful rational quotient embedding, operations,
ordered field, completeness theorem, comparison, or downstream C rebuild.
These missing items were forward construction obligations, not evidence
that the Cauchy route is impossible or mathematically inferior.

The first independent assembly adds rational difference symmetry,
epsilon-triangle composition, positive rational halving, separation by
all positive epsilons, Cauchy-equivalence reflexivity/symmetry/
transitivity, an explicit Cauchy quotient carrier, and a faithful
constant-rational quotient embedding. None is promoted to verified status
until its exact-head pinned Lean V5 run passes.

## Governance preflight findings and corrections

`ERR-ST2-017`: the prior Stage-Two governance auditor recognized exactly two
closed, C-facing experiments and could not represent a valid active Q-to-R
decision branch. It now retains exact historical checks while checking
status-sensitive active origin, endpoint, 21-Claim cone, frozen Plan, and
not-yet-available verification evidence.

`ERR-ST2-018`: the previous accepted-C freshness repair did not cover
research sources added under `RStage`. The R stage now scopes that
directory to `R_INTEGRATION_002_INPUTS.txt`; downstream C scopes its
inherited R sources to `C_ACCEPTED_INPUTS.txt`. Both accepted manifests
remain protected and unchanged.

`ERR-ST2-019`: `R_DAG.md` still asserted that C had not started and remained
under an owner hold even though the owner later lifted that hold and C was
accepted. Its present-tense sections now report `C-BLOCK-002 / CA-20` and
the solely approved active Cauchy experiment; dated historical documents
are not rewritten.

## First preserved Lean failure — exact run 32630769132

```text
source commit  aa8bdd8770832bc298339c72fc5992dd6b1b6182
exact run      32630769132
failed gate    independent Cauchy quotient / faithful Q embedding
location       rCmk_eq_iff / reverse quotient-sound direction
mechanism      bare `exact Quotient.sound` cannot infer the hidden Setoid
               through the local `rCmk` abbreviation before an argument exists
correction     introduce `huv : CauchyEquiv u v`; use `Quotient.sound huv`
error class    ERR-ST2-020 / F2 / quotient identity elaboration
```

The failed kernel output also disclosed a substantive logical split:

```text
shared rational `qlt_trichotomy`       [propext, Classical.choice, Quot.sound]
Cauchy asymptotic transitivity         [propext, Quot.sound]
constant rational embedding reflection uses qlt_trichotomy; choice inherited
```

The additional `sorryAx` printed for the unsuccessful embedding declaration
was Lean's error-recovery placeholder after the failed proof, not an accepted
axiom or a successful result. The corrected proof must eliminate it in a
subsequent successful exact-head run. This evidence concerns source-level
route use; equal or inherited kernel axiom names do not justify claiming
identical construction histories.

## Verification and claim boundary

```text
independent Cauchy quotient/embedding V5  PASS / exact run 32630874354
independent ordered-field producer        NOT BUILT
Cauchy completeness theorem               NOT BUILT
Dedekind-LUB equivalence/bridge           NOT BUILT
independent real comparison Junction      NOT BUILT / NOT CLAIMED
downstream C rebuild on Cauchy carrier    NOT BUILT
alternative accepted real export          NO
accepted Dedekind R changed               NO
accepted CA-20 complex export changed     NO
merge to main                             NOT AUTHORIZED
```

## Corrected independent foundation — exact run 32630874354 PASS

```text
verified source commit   557fe02ea0c531aa9c1d7a8b8d83712e10d7eaa1
exact GitHub V5 run      32630874354
formal source assembly   accepted Q + shared rational gateway + Cauchy only
actual declaration count 365
Dedekind declarations    0
downstream C declarations 0
Cauchy equivalence       reflexive / symmetric / transitive / V5 PASS
formal carrier           Quotient cauchySetoid / V5 PASS
rational embedding       constant sequences / faithful / V5 PASS
transitivity axioms      [propext, Quot.sound]
embedding axioms         [propext, Classical.choice, Quot.sound]
transient sorryAx        ABSENT from the corrected successful report
```

`Classical.choice` is inherited specifically through the existing shared
`qlt_trichotomy` used to reflect equality of embedded rational constants;
it is not needed by Cauchy-equivalence transitivity. The first result thus
distinguishes quotient/formalization cost, actual source-level producer
independence, and the location of the inherited classical obligation.

Machine-readable source-bound milestone evidence:

`LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_003_FOUNDATION_VERIFIED_EVIDENCE_RUN_32630874354.json`.

No ordered field, completeness theorem, route equivalence, research Junction,
downstream C rebuild, or new accepted export follows from this milestone.
The experiment remains active until the remaining frozen Plan gates have
their own exact-head proofs and evidence.

## DO — additive quotient milestone in verification

The next independent source defines pointwise addition and negation, proves
that both preserve Cauchy convergence and asymptotic identity, descends them
through the quotient, proves commutativity, associativity, zero, additive
inverse, and preservation of accepted rational addition/negation, then
packages an additive-group-strength certificate. This milestone is not marked
verified until a new exact-head V5 run succeeds and its dependency closure is
inspected.
