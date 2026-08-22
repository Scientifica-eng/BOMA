# PDSA-C-005 — Conjugate, Norm, and Witness-Based Complex Field Closure

**Cycle ID:** `PDSA-C-005`  
**Status:** CLOSED — CONSTRUCTIVE WITNESS FIELD V5 PASS / INHERITED AXIOMS AUDITED  
**Plan date:** 2026-08-22  
**Parent:** `PDSA-C-004 — CLOSED / selected ring-core V5 32574270735 PASS`  
**Decision:** `C-DP-001 — RESOLVED / USER-RATIFIED C-ROUTE-P`  
**Acceptance contract:** `BOMA-C-ACCEPT-001`

## Research question

Can the verified selected Route P commutative-ring core be promoted to a
nontrivial commutative-field-strength interface through conjugation, the real
sum-of-squares norm, and **existential inverse witnesses only**, while consuming
only the already accepted real integration certificate and introducing neither
a global inverse selector nor a new classical equality decision?

# PLAN — FROZEN

## Frozen input boundary

```text
R-BLOCK-001 accepted real interface
RStageIntegrationCertificate
PDSA-C-002 verified accepted-R boundary support
PDSA-C-003 verified Route P producer
PDSA-C-004 verified selected pair ring core / run 32574270735 PASS
CPairRingCoreCertificate
C-DP-001 user-ratified C-ROUTE-P
BOMA-C-ACCEPT-001 unchanged
BOMA-C-R-DEP-001 unchanged unless a genuinely new dependency is discovered
C-ROUTE-Q retained and excluded from selected-route verification assembly
```

No accepted N/Z/Q/R source, accepted theorem, frozen earlier PDSA PLAN, real
representation internal, real completeness/density/Archimedean field, built-in
complex type, global inverse selector, new axiom, proof placeholder, or new
explicit classical/Choice principle may be introduced.

## Construction and evidence scope

Create exactly the selected field-closure producer and its verification gate:

```text
LAB/payloads/lean/CStage/CPairNormInverse001.lean
LAB/20_FORMALIZATION/C_STAGE/C_PAIR_NORM_INVERSE_001_INPUTS.txt
.github/workflows/boma-c-pair-norm-inverse-001.yml
```

Update the existing partial `C-BLOCK-001`, C Claim register, V5 evidence index,
PDSA cycle/status, and current architecture/frontier documents only to reflect
actually verified producer scope.

## Frozen mathematical targets

```text
C5-01  conjugation and the real norm a²+b² on the selected carrier
C5-02  conjugation involution and preservation of real embeddings
C5-03  z * conjugate(z) = ιR(norm(z)), including the reverse product
C5-04  norm=0 entails double-negated coordinate/complex zero without equality stability
C5-05  z≠0 entails norm(z)≠0 constructively
C5-06  obtain a real inverse witness exclusively from C.inverseExists
C5-07  construct an explicit complex witness from conjugation and that real witness
C5-08  prove left/right complex inverse equations
C5-09  prove uniqueness of complex inverse witnesses from verified ring laws
C5-10  package selected CPairFieldCertificate without a global inverse selector
C5-11  instantiate the package on the accepted Stage-One real certificate
C5-12  exact read-only V5 assembly: R + C-boundary + Route P + pair core + closure
C5-13  honest producer/Claim mapping; comparison/integration remain unproduced
```

The proof is not required to derive the stronger implication
`norm(z)=0 → z=0`; if that implication needs equality stability, record the
distinction. Double-negated zero is sufficient to contradict the supplied
nonzero hypothesis and therefore establish the denominator's nonzeroness.

## Explicit exclusions

```text
new classical decidability for equality on RBOMA or CBOMA
global Choice-backed inverse function
Route P ↔ Route Q completed field isomorphism/Junction
representation-neutral universal comparison theorem
full C acceptance integration or CA-20 acceptance
algebraic closure, polynomial roots, or FTA
merge into main
```

Each excluded product requires a separate subsequent frozen cycle.

## Predeclared failure classes

```text
F1  ordinary missing lemma derivable from the accepted abstract real interface
F2  genuine absent real order/field strength requiring an explicit dependency question
F3  illicit use of double-negation elimination or implicit decidable equality
F4  sum-of-squares / conjugate equational proof-engineering failure
F5  accidental global real/complex inverse selector or Choice-backed witness
F6  Route Q, Dedekind internals, completeness, density, or Archimedean leakage
F7  workflow, checkout provenance, or exact-assembly observability failure
F8  documentation overclaims field acceptance, comparison, or integration
```

A failure and its repair belong in DO/STUDY. The PLAN is never edited after
freeze. Any actually necessary new logical principle or strengthened R export
must be surfaced rather than introduced silently.

## Exit condition

Close only after a retrievable exact V5 run proves the selected witness-based
field certificate, all promoted producer claims and retained limits are
synchronized, and ACT opens a separately frozen representation-neutral
comparison/integration cycle.

# DO — ACTIVE / FIRST FORMAL VERIFICATION PENDING

## D1 — Stage constructive conjugation, norm, and witness-based inverse

Created:

```text
LAB/payloads/lean/CStage/CPairNormInverse001.lean
LAB/20_FORMALIZATION/C_STAGE/C_PAIR_NORM_INVERSE_001_INPUTS.txt
.github/workflows/boma-c-pair-norm-inverse-001.yml
```

The producer constructs selected-coordinate conjugation and the real sum-of-squares norm, derives zero summands from nonnegative order, and proves only double-negated coordinate/complex equality when the norm is zero. Combining that weaker result with the supplied nonzero complex hypothesis makes the norm nonzero without deciding equality or eliminating double negation. Accepted real `inverseExists` then supplies an existential denominator witness; conjugation and verified ring laws construct the complex witness and prove uniqueness.

The source exposes `CPairFieldCertificate` with existential inversion only. Exact verification assembles accepted R + C-boundary support + verified Route P + verified pair ring core + the new norm/inverse producer. The workflow prints theorem axiom dependencies for both the abstract-interface theorem and accepted-real instantiation.

```text
selected witness-field V5   32574812227 PASS / expanded inherited-axiom audit pending
new equality decidability   NONE
new global inverse          NONE
CA-20 acceptance            NOT ELIGIBLE
```

## D2 — Preserve the first successful field run and extend inherited-axiom audit

```text
first field run      32574812227
job                  97035471002
source commit        f5207e944d1c10f5459b1855af3504639d6f4a37
formal result        COMPLETED / SUCCESS on the first attempt
reported axioms      [propext, Classical.choice, Quot.sound]
classification       INHERITED VERSUS INTRODUCED — NOT YET ESTABLISHED
```

The source contains no explicit classical invocation, equality case split, global inverse selector, or new axiom. Nevertheless, its transitive Lean declaration reports `Classical.choice`, `propext`, and `Quot.sound`; source-token absence is insufficient evidence that these commitments are absent. Extend the same frozen verification workflow to print exact axiom baselines for accepted R, C boundary, Route P, ring core, each new constructive proof layer, and both field certificates. Do not claim that the new field proof is axiom-free until those actual cones are compared.

# STUDY — COMPLETE

## S1 — Exact successful field and axiom-audit evidence

```text
first field run        32574812227 / job 97035471002 / PASS
first source commit    f5207e944d1c10f5459b1855af3504639d6f4a37
expanded audit run     32574920935 / job 97035726339 / PASS
verified source        ccf41e062b37ab39f46dc18a1cbbbf90728807ff
field source blob      d20bd40edb5bf9366951dd215dc34dbb892531b0
Lean                   leanprover/lean4:v4.32.1
event                  pull_request / draft PR #5
permissions            contents: read
```

The field producer passed on its first formal attempt. The second successful run added explicit theorem-level axiom-baseline comparisons without changing the field source.

## S2 — Constructive proof result and exact logical scope

A zero sum of nonnegative squares gives zero for each **square**. The accepted real inverse interface then proves only:

```text
a² = 0  →  ¬¬(a = 0)
norm(z) = 0  →  ¬¬(z = 0)
z ≠ 0  →  norm(z) ≠ 0
```

The last implication follows by applying the double-negated equality to the already supplied nonzero hypothesis. No equality decidability, double-negation elimination, explicit classical case split, or global inverse selector is used in the C proof. A real inverse **witness** for `norm(z)` yields the complex witness `ιR(t) * conjugate(z)`; ring associativity proves inverse uniqueness.

## S3 — Actual transitive axiom comparison

Every printed declaration has exactly the same Lean axiom set:

```text
accepted rStageIntegrationCertificate             [propext, Classical.choice, Quot.sound]
C square_nonnegative_of_interface                 [propext, Classical.choice, Quot.sound]
Route P imag_squared                              [propext, Classical.choice, Quot.sound]
selected cPairRingCoreCertificate                 [propext, Classical.choice, Quot.sound]
r_square_zero_not_nonzero                         [propext, Classical.choice, Quot.sound]
c_norm_zero_not_nonzero                           [propext, Classical.choice, Quot.sound]
c_inverse_exists                                  [propext, Classical.choice, Quot.sound]
cPairFieldCertificate                             [propext, Classical.choice, Quot.sound]
cPairFieldCertificateFromAcceptedR                [propext, Classical.choice, Quot.sound]
```

Therefore the construction is **not globally axiom-free or globally constructive**: accepted R already carries proof extensionality, quotient soundness, and classical choice. The new C witness-field proof introduces **no additional axiom beyond that measured upstream baseline** and adds no new explicit classical/Choice use.

## S4 — Frozen-target results

```text
C5-01  PASS  cConj and real-valued cNorm
C5-02  PASS  conjugation involution / real embedding / addition
C5-03  PASS  both conjugate-product directions
C5-04  PASS  zero norm implies only double-negated complex zero
C5-05  PASS  supplied nonzero z constructively makes norm(z) nonzero
C5-06  PASS  accepted abstract C.inverseExists produces real norm witness
C5-07  PASS  explicit conjugate-scaled complex witness
C5-08  PASS  left and right inverse equations
C5-09  PASS  uniqueness from the already verified ring laws
C5-10  PASS  CPairFieldCertificate without a global inverse function
C5-11  PASS  accepted-real instantiation
C5-12  PASS  exact five-manifest read-only V5 assembly
C5-13  PASS  field producer verified; comparison/integration still open
```

# ACT — CLOSED / OPEN PDSA-C-006

Freeze `PDSA-C-006` for the representation-neutral comparison gate. Separate a universal total/functional algebra-equivalence graph from actual inverse functions that require explicitly supplied constructive coordinate-extraction data. Keep Route Q retained/probe-only and do not fabricate a field reconvergence Junction or final C acceptance.

```text
C-DP-001    RESOLVED / C-ROUTE-P SELECTED
C-ROUTE-Q   RETAINED
CA-20       NOT ELIGIBLE
```
