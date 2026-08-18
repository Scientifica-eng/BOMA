# R-B N-CORE CANDIDATE 001

**Candidate ID:** `N-RB-CAND-001`  
**Date:** 2026-08-18  
**Status:** **PROVISIONAL — CONSTRUCTED SPECIFICATION / FORMAL VERIFICATION PENDING**  
**PDSA origin:** `PDSA-N-004`  
**Regime:** `BOMA-RB-FORMAL-001 v1.0`

---

## 1. Purpose

Construct the first fresh formal N-Core candidate under the selected R-B inductive-type regime.

This candidate is not yet an accepted natural-number core.

It is assessed against:

```text
BOMA-N-ACCEPT-001 v1.0
BOMA-RB-FORMAL-001 v1.0
```

---

## 2. New formal carrier commitment

Declare a fresh inductive carrier:

```text
N_BOMA : Type
```

with constructors:

```text
z : N_BOMA
s : N_BOMA → N_BOMA
```

### Epistemic classification

```text
N_BOMA formation     DECLARED FORMALIZATION COMMITMENT / CONSTRUCTED IN R-B
z                     CONSTRUCTOR / FORMAL REALIZATION OF ε ROLE
s                     CONSTRUCTOR / FORMAL REALIZATION OF ExtU ROLE
```

The carrier is not claimed to be derived from TCT.

The claim is instead:

> TCT provides the calibrated constructional ancestry that the new formal carrier must faithfully realize.

---

## 3. Intended induction/elimination structure

The R-B regime supplies a dependent eliminator associated with the fresh inductive carrier:

```text
P    : N_BOMA → Type
base : P(z)
step : Π n : N_BOMA, P(n) → P(s n)
-----------------------------------
ind_N : Π n : N_BOMA, P(n)
```

This is the formal source for induction/generatedness adequacy.

It is a formal-regime commitment, not a theorem of the pre-numerical layer.

---

## 4. Candidate local theorem obligations

### C4 / RB-O01 — constructor disjointness

Target:

```text
∀n, s(n) ≠ z
```

**Status:** proof candidate written in backend payload; V5 verification pending.

### C5 / RB-O02 — constructor injectivity

Target:

```text
s(a) = s(b) → a = b
```

**Status:** proof candidate written in backend payload; V5 verification pending.

### C6 / RB-O03 — induction adequacy

Target:

```text
P(z)
(∀n, P(n) → P(s n))
--------------------
∀n, P(n)
```

for the motive/property class admitted by the selected type theory.

**Status:** supplied by inductive eliminator in the formal regime; backend demonstration pending verification.

### C7 / RB-O04 — recursion

Define/derive a nondependent fold/recursor:

```text
fold : X → (X → X) → N_BOMA → X
```

with:

```text
fold x₀ f z       = x₀
fold x₀ f (s n)   = f (fold x₀ f n)
```

**Status:** backend definition written; V5 verification pending.

### C8 / RB-O05 — pointwise recursion uniqueness

If `h : N_BOMA → X` satisfies the same base and step equations as `fold`, prove:

```text
∀n, h(n) = fold x₀ f n.
```

No function extensionality is required for this statement.

**Status:** backend proof candidate written; V5 verification pending.

### C9 / RB-O06 — generatedness

Generatedness is certified through the eliminator/induction principle, not by asserting a natural-number count of construction steps.

**Status:** formal-regime route specified; backend induction theorem candidate written; V5 verification pending.

---

## 5. TCT realization bridge — not yet closed

Planned correspondence:

```text
ε          ↦ z
ExtU(A)    ↦ s(ρ(A))
```

Required later:

```text
A ≈ B → ρ(A)=ρ(B)
ρ(A)=ρ(B) → A≈B      or equivalent faithfulness certificate
history correspondence
```

### Current status

```text
ARCHITECTURAL CORRESPONDENCE: SPECIFIED
MACHINE-CHECKED BRIDGE: PENDING
```

The bridge is intentionally not declared complete in this candidate record.

---

## 6. Standardness / uniqueness — pending

The candidate has not yet discharged NAC-12 / RB-O08.

A later cycle must construct a regime-appropriate uniqueness/standardness certificate.

Potential route:

```text
recursion-based maps between accepted R-B candidates
+ induction-based pointwise inverse proofs
```

A built-in natural-number type may be used later as an external comparison target, but not as the definition of this candidate.

---

## 7. Arithmetic — absent by design

The candidate does not yet introduce:

```text
addition
multiplication
order
numeric depth
```

These belong to the later N-Arithmetic package after N-Core acceptance.

---

## 8. Commitment ledger

### New formal commitments

```text
dependent type-theoretic ambient regime
fresh inductive type formation
dependent eliminator / induction
formal equality
function formation
```

### TCT-anchored intended correspondences

```text
ε role                    → z
ExtU role                 → s
empty exclusion           → constructor disjointness
extension injectivity     → constructor injectivity
structural history        → constructor ancestry
```

### Not required initially

```text
classical logic
choice
quotient types
function extensionality
built-in Nat as carrier
```

---

## 9. Backend payload

Initial Lean representation/proof candidate:

`LAB/payloads/lean/NCore/BOMANat.lean`

The payload:

```text
REPRESENTS / IMPLEMENTS N-RB-CAND-001
```

It is not the canonical definition independently of the formalization contract.

No V5 claim is made until the file is checked by the pinned/reproducible Lean environment.

---

## 10. Candidate status matrix

| Obligation | Status |
|---|---|
| NAC-01 formal regime | PASS — contract active |
| NAC-02 formal carrier | PROVISIONALLY CONSTRUCTED |
| NAC-03 formal identity | REGIME DECLARED; local proofs pending checker |
| NAC-04 initial element | CONSTRUCTED as `z` |
| NAC-05 successor | CONSTRUCTED as `s` |
| NAC-06 TCT bridge | PENDING |
| NAC-07 no-confusion | PROOF CANDIDATES / V5 PENDING |
| NAC-08 generatedness | INDUCTION ROUTE / V5 PENDING |
| NAC-09 induction | REGIME PROVIDED / V5 DEMONSTRATION PENDING |
| NAC-10 recursion | PROOF/DEFINITION CANDIDATE / V5 PENDING |
| NAC-11 characterization | PENDING |
| NAC-12 uniqueness | PENDING |
| NAC-13 preservation certificate | PARTIAL / PENDING BRIDGE |
| NAC-14 new-commitment ledger | PASS at candidate level |
| NAC-15 N-Core closure | NOT ELIGIBLE YET |

---

## 11. Conclusion

A fresh formal carrier candidate now exists at the specification level under R-B.

This advances the project beyond a reserved placeholder but does **not** justify calling the candidate an accepted `N-Core` or ℕ.

The next work is verification of the local R-B obligations followed by the TCT bridge and standardness obligations.
