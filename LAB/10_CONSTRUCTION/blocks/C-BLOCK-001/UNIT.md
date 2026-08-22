# C-BLOCK-001 — Selected Route P Complex Core

- **Operational status:** **ACTIVE — VERIFIED PRODUCER OF ACCEPTED C-BLOCK-002 / NOT A SEPARATE EXPORT**
- **Epistemic status:** **USER-RATIFIED REPRESENTATION CHOICE + DERIVED CORE**
- **Decision:** `C-DP-001 — C-ROUTE-P SELECTED`
- **Verified core cycle:** `PDSA-C-004 — CLOSED / run 32574270735 PASS`
- **Verified field cycle:** `PDSA-C-005 — CLOSED / axiom-audited V5 32574920935 PASS`
- **Verified comparison:** `C-COMPARE-BLOCK-001 / run 32575465002 PASS`
- **Current cycle:** `PDSA-C-004/005 CLOSED; C-J-001 PASS; CA-20 ACCEPT; reverse audits CLOSED`
- **Input domain:** `R-BLOCK-001 — Accepted Stage-One Real Interface`
- **Alternative:** `C-ROUTE-Q — VERIFIED NONCANONICAL PROBE / RETAINED`
- **Acceptance:** `CA-20 = ACCEPT / downstream export C-BLOCK-002`
- **Ring verification:** `32574270735 PASS / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb`
- **Field verification:** `32574920935 PASS / source ccf41e062b37ab39f46dc18a1cbbbf90728807ff`

## Selected carrier and identity

```text
CBOMA := RoutePairProbe001.PairCandidate
       = record { re : RBOMA; im : RBOMA }

z = w  iff  z.re = w.re and z.im = w.im
```

This is an explicitly selected formalization and representation commitment. It
is not a theorem that every admissible complex construction must use ordered
pairs. The previously verified Route P record is reused transparently rather
than presented as a fresh independently produced carrier.

## Declared operations

```text
0_C      := (0_R, 0_R)
1_C      := (1_R, 0_R)
ιR(a)    := (a, 0_R)
I        := (0_R, 1_R)
-(a,b)   := (-a, -b)
(a,b)+(c,d) := (a+c, b+d)
(a,b)*(c,d) := (ac-bd, ad+bc)
```

All scalar equational proof inputs are taken from an abstract
`RStageIntegrationCertificate` and the separately verified interface-derived
C-boundary helpers.

## Verified commutative-ring and witness-field scope

```text
nontrivial commutative-ring laws
faithful real embedding and preservation of 0, 1, -, +, *
distinguished I and I² = -1
existence and uniqueness of real-plus-imaginary coordinates
I outside the embedded real image
conjugation and real sum-of-squares norm
constructive nonzero norm for nonzero complex input
existence and uniqueness of multiplicative inverse witnesses
```

The producer file is:

```text
LAB/payloads/lean/CStage/CPairCore001.lean
LAB/payloads/lean/CStage/CPairNormInverse001.lean
```

Its formal surfaces are `CPairRingCoreCertificate` and `CPairFieldCertificate`. The latter provides existential inverse witnesses and uniqueness without a global Choice-backed inverse function. The measured transitive axiom baseline is exactly inherited from accepted R: `[propext, Classical.choice, Quot.sound]`.

## Separate integration, acceptance, and retained exclusions

```text
C-J-001 final integration     PASS / run 32585583815
C-BLOCK-002 accepted export   ACTIVE / CA-20 ACCEPT
six-stage transparency        PASS / 73 claims / 148 canonical units
RE-C-001 / RE-STAGE1-001      BOTH CLOSED / COMPLETE
completed Route Q field       NOT BUILT / RETAINED BRANCH
algebraic closure / FTA       NOT CLAIMED
```

This Block is the actual selected field producer, not a competing accepted
export. No merge into `main` is authorized.
