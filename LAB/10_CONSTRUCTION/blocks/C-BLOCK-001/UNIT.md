# C-BLOCK-001 — Selected Route P Complex Core

- **Operational status:** **ACTIVE — V5-VERIFIED COMMUTATIVE-RING CORE / NOT ACCEPTED**
- **Epistemic status:** **USER-RATIFIED REPRESENTATION CHOICE + DERIVED CORE**
- **Decision:** `C-DP-001 — C-ROUTE-P SELECTED`
- **Verified core cycle:** `PDSA-C-004 — CLOSED / run 32574270735 PASS`
- **Current cycle:** `PDSA-C-005 — witness-based field closure PLAN FROZEN`
- **Input domain:** `R-BLOCK-001 — Accepted Stage-One Real Interface`
- **Alternative:** `C-ROUTE-Q — VERIFIED NONCANONICAL PROBE / RETAINED`
- **Acceptance:** `CA-20 = NOT ELIGIBLE`
- **Verification:** `SELECTED RING CORE V5 32574270735 PASS / source a6c8e2518dfb8da42367d6282b1a3f958b8c9ceb`

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

## Verified ring-core scope

```text
nontrivial commutative-ring laws
faithful real embedding and preservation of 0, 1, -, +, *
distinguished I and I² = -1
existence and uniqueness of real-plus-imaginary coordinates
I outside the embedded real image
```

The producer file is:

```text
LAB/payloads/lean/CStage/CPairCore001.lean
```

Its formal integration surface is `CPairRingCoreCertificate`. The name and
field list intentionally state **ring core**, not field closure.

## Explicitly unproduced

```text
nonzero complex norm theorem
nonzero complex multiplicative inverse witness
full complex-field certificate
representation-neutral comparison theorem / Junction
final C integration and dependency audit
accepted C export
CA-20 acceptance
```

No merge into `main` is authorized by this partial construction.
