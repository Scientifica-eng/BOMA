# C_CLAIM_REGISTER_001 — Ex-Ante Stage-One Complex Claim Register

**Status:** **ACTIVE — PROVISIONAL / EX-ANTE / NO C CLAIM ACCEPTED YET**  
**Date:** 2026-08-21  
**Stage:** `C`  
**Governing specification:** `BOMA-C-ACCEPT-001`  
**Input export:** `R-BLOCK-001`  
**Representation Decision:** `C-DP-001 RESOLVED — USER-SELECTED C-ROUTE-P / C-ROUTE-Q RETAINED`  
**Schema:** `LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md`

## 1. Purpose

Open the C Claim layer **before** a carrier or Lean representation is selected.

The records below describe the mathematical assertions that an accepted Stage-One C package must eventually certify. They intentionally leave producer, representation, Lean declaration, source file, and V5 evidence unresolved where no construction yet exists.

This is not an acceptance certificate.

```text
registered acceptance target
≠
constructed theorem
≠
verified theorem
≠
accepted export
```

No placeholder dependency may later be hidden as `OTHER`, `IMPLICIT`, or `UNKNOWN`; unresolved items remain explicitly `TBD / OPEN` until classified into the canonical dependency vocabulary.

---

## 2. Status vocabulary for this register

```text
EX-ANTE REQUIRED
  the Claim statement belongs to the governing acceptance contract but has no accepted producer yet.

DERIVED-REQUIRED
  the property must be certified before acceptance but is expected to follow from stronger core Claims rather than be primitive.

INTEGRATION-REQUIRED
  final compatibility/closure Claim; producer does not exist until actual construction units exist.

DEFERRED / NON-CLAIM
  scientifically relevant strengthening explicitly outside Stage-One acceptance.
```

---

# 3. Initial Claim records

## C-CL-CARRIER-001 — Explicit C carrier and identity

- **Stage:** C
- **Acceptance obligations:** `CA-01`, `CA-02`
- **Operational status:** `PRODUCED / V5 PASS / PENDING FINAL ACCEPTANCE`
- **Epistemic status:** `DERIVED / V5 VERIFIED / PENDING STAGE ACCEPTANCE`
- **Statement / scope:** an explicit `C_BOMA` carrier exists with an explicit accepted equality/identity regime; no built-in complex carrier is silently identified as BOMA C.
- **Producer unit(s):** `C-BLOCK-001 / PDSA-C-004 selected Route P ring-core producer`.
- **Consumes mathematical Claims:** accepted `R-BLOCK-001` only at the level required by the selected construction; exact C-side ancestry `TBD`.
- **Logical commitments:** none forced by the statement.
- **Representation commitments:** `C-DP-001 / C-ROUTE-P`: explicit two-field record and Lean record equality.
- **Formalization commitments:** `TBD`.
- **Supporting lemmas / proof interfaces:** `TBD`.
- **Lean theorem/declaration:** `CBOMA`, `c_ext`.
- **Lean source:** `LAB/payloads/lean/CStage/CPairCore001.lean`.
- **Verification evidence:** `C-V5-PAIR-CORE-001 / run 32574270735 / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb / PASS`.
- **Alternative producer / branch:** ordered-pair/rank-two, polynomial-adjunction/quotient, other adequate quadratic-adjunction route.
- **Necessity classification:** **ACCEPTANCE-REQUIRED PROPERTY; PRODUCER REPRESENTATION BRANCHABLE**.
- **Sensitivity:** any carrier or identity change reopens all C Claims consuming equality/operations.

## C-CL-REMBED-001 — Faithful real embedding

- **Stage:** C
- **Acceptance obligations:** `CA-03`, `CA-05`
- **Operational status:** `PRODUCED / V5 PASS / PENDING FINAL ACCEPTANCE`
- **Epistemic status:** `DERIVED / V5 VERIFIED / PENDING STAGE ACCEPTANCE`
- **Statement / scope:** construct `ιR : R_BOMA → C_BOMA`, prove injectivity, and prove preservation of `0,1,-,+,*`.
- **Producer unit(s):** `C-BLOCK-001 / PDSA-C-004 selected Route P ring-core producer`.
- **Consumes mathematical Claims:** `R-CL-NONTRIV-001`, `R-CL-ADD-001`, `R-CL-MUL-001`, `R-CL-FIELD-001` or their accepted integration export; exact minimal closure to be measured.
- **Logical commitments:** none forced by the Claim statement.
- **Representation commitments:** selected coordinate embedding `a ↦ (a,0)`.
- **Formalization commitments:** `TBD`.
- **Supporting lemmas:** route-specific preservation lemmas `TBD`.
- **Lean theorem/declaration:** `cOfR`, `c_ofR_injective`, `c_ofR_zero`, `c_ofR_one`, `c_ofR_neg`, `c_ofR_add`, `c_ofR_mul`.
- **Lean source:** `LAB/payloads/lean/CStage/CPairCore001.lean`.
- **Verification evidence:** `C-V5-PAIR-CORE-001 / run 32574270735 / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb / PASS`.
- **Alternative producer / branch:** all candidate C routes must independently supply this Claim.
- **Necessity classification:** **ACCEPTANCE-REQUIRED MATHEMATICAL CLAIM**.
- **Sensitivity:** changing the accepted R operation interface or selected C equality requires retest.

## C-CL-FIELD-001 — Commutative-field-strength complex algebra

- **Stage:** C
- **Acceptance obligation:** `CA-04`
- **Operational status:** `PRODUCED / V5 PASS / PENDING FINAL ACCEPTANCE`
- **Epistemic status:** `DERIVED / V5 VERIFIED / PENDING STAGE ACCEPTANCE`
- **Statement / scope:** the accepted C carrier has nontrivial commutative field behavior, including nonzero inverse existence at an explicitly declared interface scope.
- **Producer unit(s):** `C-BLOCK-001 / PDSA-C-005 selected Route P witness-field producer`.
- **Consumes mathematical Claims:** at minimum accepted R field/nontriviality Claims plus C arithmetic definitions; precise producer route `TBD`.
- **Logical commitments:** none forced by the abstract field Claim; witness-selection choices must be declared if introduced by a producer.
- **Representation commitments:** selected Route P coordinate field; conjugate-scaled inverse witnesses, no global selector.
- **Formalization commitments:** no global inverse function is forced; a witness-based interface is permitted.
- **Supporting lemmas:** expected nonzero norm/denominator or route-equivalent machinery; `TBD`.
- **Lean theorem/declaration:** `c_norm_nonzero`, `c_inverse_exists`, `c_inverse_unique`, `CPairFieldCertificate`, `cPairFieldCertificateFromAcceptedR`.
- **Lean source:** `LAB/payloads/lean/CStage/CPairNormInverse001.lean`.
- **Verification evidence:** `C-V5-PAIR-FIELD-001 / run 32574920935 / source ccf41e062b37ab39f46dc18a1cbbbf90728807ff / PASS`.
- **Alternative producer / branch:** coordinate norm route; quotient/polynomial field route; other route proving the same interface.
- **Necessity classification:** **ACCEPTANCE-REQUIRED PROPERTY; CONSTRUCTION FORMULA NOT NECESSARY**.
- **Sensitivity:** any arithmetic or equality change reopens this Claim and final integration.

## C-CL-I-001 — Distinguished imaginary generator

- **Stage:** C
- **Acceptance obligations:** `CA-06`, `CA-07`
- **Operational status:** `PRODUCED / V5 PASS / PENDING FINAL ACCEPTANCE`
- **Epistemic status:** `DERIVED / V5 VERIFIED / PENDING STAGE ACCEPTANCE`
- **Statement / scope:** there is a distinguished `I : C_BOMA` satisfying `I * I = -1_C`.
- **Producer unit(s):** `C-BLOCK-001 / PDSA-C-004 selected Route P ring-core producer`.
- **Consumes mathematical Claims:** `C-CL-CARRIER-001`, `C-CL-FIELD-001`, `C-CL-REMBED-001` for the interpretation of `-1_C`.
- **Logical commitments:** none forced by the statement.
- **Representation commitments:** selected generator `(0,1)`; claim remains representation-neutral.
- **Formalization commitments:** `TBD`.
- **Supporting lemmas:** `TBD`.
- **Lean theorem/declaration:** `cI`, `c_i_squared`.
- **Lean source:** `LAB/payloads/lean/CStage/CPairCore001.lean`.
- **Verification evidence:** `C-V5-PAIR-CORE-001 / run 32574270735 / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb / PASS`.
- **Alternative producer / branch:** all adequate routes.
- **Necessity classification:** **ACCEPTANCE-REQUIRED MATHEMATICAL CLAIM**.
- **Sensitivity:** changing multiplication, negation/unit, identity, or generator representation requires retest.

## C-CL-GEN-001 — Real-plus-imaginary generation

- **Stage:** C
- **Acceptance obligation:** `CA-08`
- **Operational status:** `PRODUCED / V5 PASS / PENDING FINAL ACCEPTANCE`
- **Epistemic status:** `DERIVED / V5 VERIFIED / PENDING STAGE ACCEPTANCE`
- **Statement / scope:** every `z : C_BOMA` is expressible as `ιR(a) + ιR(b) * I` for some `a,b : R_BOMA`.
- **Producer unit(s):** `C-BLOCK-001 / PDSA-C-004 selected Route P ring-core producer`.
- **Consumes mathematical Claims:** `C-CL-CARRIER-001`, `C-CL-REMBED-001`, `C-CL-FIELD-001`, `C-CL-I-001`.
- **Logical commitments:** none forced by the mathematical statement; constructive witness production versus classical existence must be recorded by the producer.
- **Representation commitments:** constructive selected-coordinate projection; claim remains representation-neutral.
- **Formalization commitments:** `TBD`.
- **Supporting lemmas:** route-specific decomposition theorem `TBD`.
- **Lean theorem/declaration:** `c_generation`.
- **Lean source:** `LAB/payloads/lean/CStage/CPairCore001.lean`.
- **Verification evidence:** `C-V5-PAIR-CORE-001 / run 32574270735 / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb / PASS`.
- **Alternative producer / branch:** coordinate projection; polynomial reduction; generator-normalization route.
- **Necessity classification:** **ACCEPTANCE-REQUIRED MATHEMATICAL CLAIM**.
- **Sensitivity:** a carrier/identity/embedding/generator change requires reproof.

## C-CL-COORDUNIQ-001 — Uniqueness of real/imaginary coordinates

- **Stage:** C
- **Acceptance obligation:** `CA-09`
- **Operational status:** `PRODUCED / V5 PASS / PENDING FINAL ACCEPTANCE`
- **Epistemic status:** `DERIVED / V5 VERIFIED / PENDING STAGE ACCEPTANCE`
- **Statement / scope:** if two `a+bI` expressions represent the same C value, the corresponding real coefficients are equal.
- **Producer unit(s):** `C-BLOCK-001 / PDSA-C-004 selected Route P ring-core producer`.
- **Consumes mathematical Claims:** `C-CL-REMBED-001`, `C-CL-I-001`, `C-CL-FIELD-001`; may additionally consume the R fact that `-1` is not a real square or another route-equivalent independence lemma.
- **Logical commitments:** `TBD after proof route`.
- **Representation commitments:** selected record coordinate equality; claim remains representation-neutral.
- **Formalization commitments:** `TBD`.
- **Supporting lemmas:** `C-RQ-001` dependency question in `C_R_DEPENDENCY_CONTRACT.md` is relevant.
- **Lean theorem/declaration:** `c_coordinate_unique`.
- **Lean source:** `LAB/payloads/lean/CStage/CPairCore001.lean`.
- **Verification evidence:** `C-V5-PAIR-CORE-001 / run 32574270735 / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb / PASS`.
- **Alternative producer / branch:** direct coordinate equality; quotient normal-form uniqueness; abstract linear-independence proof.
- **Necessity classification:** **ACCEPTANCE-REQUIRED MATHEMATICAL CLAIM; PROOF ROUTE BRANCHABLE**.
- **Sensitivity:** if the identity regime or real-independence lemma changes, reopen.

## C-CL-NONREAL-001 — Imaginary generator does not lie on the real image

- **Stage:** C
- **Acceptance obligation:** `CA-10`
- **Operational status:** `PRODUCED / V5 PASS / PENDING FINAL ACCEPTANCE`
- **Epistemic status:** `DERIVED / V5 VERIFIED / PENDING STAGE ACCEPTANCE`
- **Statement / scope:** `¬ ∃ r : R_BOMA, I = ιR(r)` or an explicitly equivalent non-collapse theorem.
- **Producer unit(s):** `C-BLOCK-001 / PDSA-C-004 selected Route P ring-core producer`.
- **Consumes mathematical Claims:** expected from `C-CL-I-001` + `C-CL-COORDUNIQ-001`, or from `C-CL-I-001` + accepted R ordered-field facts.
- **Logical commitments:** none presumed.
- **Representation commitments:** derived from selected-coordinate identity and accepted R nontriviality.
- **Formalization commitments:** none presumed.
- **Supporting lemmas:** route-neutral no-real-square-of-minus-one theorem is a candidate.
- **Lean theorem/declaration:** `c_i_not_real`.
- **Lean source:** `LAB/payloads/lean/CStage/CPairCore001.lean`.
- **Verification evidence:** `C-V5-PAIR-CORE-001 / run 32574270735 / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb / PASS`.
- **Alternative producer / branch:** coordinate uniqueness route; ordered-field nonsquare route.
- **Necessity classification:** **REQUIRED CONSEQUENCE, NOT PRIMITIVE REPRESENTATION DATA**.
- **Sensitivity:** follows the Claims/proof route actually selected.

## C-CL-COMPARE-001 — Representation-neutral comparison adequacy

- **Stage:** C
- **Acceptance obligation:** `CA-11`
- **Operational status:** `EX-ANTE REQUIRED / UNPRODUCED`
- **Epistemic status:** `PENDING`
- **Statement / scope:** candidate realizations satisfying the common accepted interface are related by the canonical coordinate-preserving R-algebra/field isomorphism sending distinguished `I` to distinguished `I`.
- **Producer unit(s):** `TBD`; may be a general comparison theorem and later support a Junction.
- **Consumes mathematical Claims:** `C-CL-REMBED-001`, `C-CL-FIELD-001`, `C-CL-I-001`, `C-CL-GEN-001`, `C-CL-COORDUNIQ-001` for both compared candidates.
- **Logical commitments:** none forced by the intended explicit coordinate map; actual formal proof to be audited.
- **Representation commitments:** deliberately none in statement beyond the two candidate interfaces being compared.
- **Formalization commitments:** theorem packaging `TBD`.
- **Supporting lemmas:** canonical map well-definedness, homomorphism, injectivity, surjectivity.
- **Lean theorem/declaration:** none yet.
- **Lean source:** none yet.
- **Verification evidence:** `UNMAPPED / NO V5 YET`.
- **Alternative producer / branch:** direct universal comparison or pairwise route Junction proofs.
- **Necessity classification:** **ACCEPTANCE-REQUIRED COMPARISON PRINCIPLE; MAY ALSO SERVE RECONVERGENCE**.
- **Sensitivity:** change to the semantic core of `BOMA-C-ACCEPT-001` reopens this Claim.

## C-CL-INTEGRATION-001 — Stage-One C acceptance integration

- **Stage:** C
- **Acceptance obligations:** `CA-17`, `CA-18`, `CA-19`, prerequisite to `CA-20`
- **Operational status:** `INTEGRATION-REQUIRED / NO JUNCTION EXISTS YET`
- **Epistemic status:** `PENDING`
- **Statement / scope:** all promoted C Claims coexist on one selected carrier/equality/operation/embedding/generator package and their declared dependency closure matches the verified formal closure at the governed audit granularity.
- **Producer unit(s):** future C integration Junction + accepted aggregate Block; IDs are not fabricated before incoming producers exist.
- **Consumes mathematical Claims:** all accepted C Claim families above.
- **Logical commitments:** union of actually consumed declared commitments only; no ancestry-wide inflation.
- **Representation commitments:** selected `C-DP-001` route and any later explicit Decisions.
- **Formalization commitments:** selected identity/packaging and verification assembly.
- **Supporting lemmas:** final integration certificate and transparency audit.
- **Lean theorem/declaration:** none yet.
- **Lean source:** none yet.
- **Verification evidence:** `UNMAPPED / NO V5 YET`.
- **Alternative producer / branch:** depends on which candidate route is selected; other completed routes remain comparison inputs.
- **Necessity classification:** **BOMA ACCEPTANCE-GOVERNANCE REQUIREMENT**.
- **Sensitivity:** any accepted C Claim, producer, decision, toolchain, or dependency-policy change can reopen integration.

---

# 4. Initial dependency spine — statements only

The provisional semantic dependency shape is:

```text
R accepted interface
   ↓
C-CL-CARRIER-001
   ↓
C-CL-REMBED-001
   ├──────────────┐
   ↓              │
C-CL-FIELD-001    │
   ↓              │
C-CL-I-001        │
   ↓              │
C-CL-GEN-001      │
   ↓              │
C-CL-COORDUNIQ-001
   ├──► C-CL-NONREAL-001
   └──► C-CL-COMPARE-001
                ↓
       C-CL-INTEGRATION-001
```

This is a Claim-family planning view, not a theorem-level actual dependency extraction. Later evidence may refine arrows; it may not silently erase the original ex-ante target.

---

# 5. Explicit non-Claims / deferred strengthenings

The following are intentionally **not** registered as Stage-One acceptance Claims:

```text
C is algebraically closed
Fundamental Theorem of Algebra
complex metric completeness
complex topology / analysis
polar decomposition
complex exponential / logarithm
standard-library Complex equivalence
```

Conjugation and norm are natural downstream constructions and may become explicit C Claims when built, but they are not currently required to identify the Stage-One quadratic extension.

This register must not invent `C-CL-ACLOSURE-*`, `C-CL-CONJ-*`, or `C-CL-NORM-*` acceptance ownership merely for symmetry.

---

# 6. Current producer/evidence state

```text
C-DP-001                  RESOLVED — C-ROUTE-P USER-SELECTED
selected carrier           Route P record — canonical producer under construction
selected identity          explicit two-coordinate structure equality
C construction Blocks      NONE
C construction Bricks      NONE
C Junctions                NONE
C accepted-Claim declarations NONE
C supporting Lean declarations VERIFIED — PDSA-C-002 / not accepted Claims
C exploratory route probes     BOTH V5 PASS — PDSA-C-003 / noncanonical
C route evidence               32565335033 at 3f670372a022d1eb95109d36cde255b3504dda12
C-DP-001                       RESOLVED — C-ROUTE-P selected; C-ROUTE-Q retained
C accepted-Claim V5 evidence   NONE
accepted C Claims              NONE
accepted C export          NONE
```

The absence of accepted-Claim producers is intentional: transparency began at the **acceptance-Claim layer before representation selection**. The existing `PDSA-C-002` Lean declarations are route-neutral supporting lemmas verified by exact run `32564789630`; they do not select a representation, create a canonical construction unit, or certify an acceptance Claim.