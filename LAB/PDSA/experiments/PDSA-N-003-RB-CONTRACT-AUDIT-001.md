# PDSA-N-003-RB-CONTRACT-AUDIT-001

**Parent cycle:** `PDSA-N-003`  
**Date:** 2026-08-18  
**Status:** **PASS WITH EXPLICIT PROOF OBLIGATIONS**

## Purpose

Audit `BOMA-RB-FORMAL-001 v0.1-draft` for hidden logical commitments, unnecessary axioms, circularity, and backend/canonical-construction conflation.

---

## 1. Inductive formation classification

The proposed future declaration:

```text
N_BOMA : Type
z : N_BOMA
s : N_BOMA → N_BOMA
```

is not derivable from TCT.

It is correctly classified as the principal **new formal completion / carrier commitment** of R-B.

The dependent eliminator is likewise part of the selected formal regime.

**Audit result: PASS.**

---

## 2. Constructor no-confusion

### Target

```text
s(n) ≠ z
s(a) = s(b) → a = b
```

### Audit

These properties must not be inserted as extra axioms merely because constructors are visually distinct.

In the selected inductive dependent-type regime they are intended theorem obligations supported by the inductive/elimination and identity machinery.

The contract correctly keeps them under:

```text
RB-O01
RB-O02
```

rather than listing them as new primitives.

Whether the backend provides generated `noConfusion` machinery or the project proves the results manually is an implementation choice whose provenance must be recorded.

**Audit result: PASS, FORMAL PROOF REQUIRED.**

---

## 3. Generatedness

### Risk

A statement such as:

```text
for every n there exists a natural-number count of successor steps from z to n
```

would be circular at the point where N itself is being accepted.

### R-B route

Use the dependent eliminator/induction principle as the regime-specific generatedness certificate:

for any admissible motive/property containing the base and preserved by successor, it holds for every inhabitant of `N_BOMA`.

This directly expresses absence of an ungenerated component in the inductive carrier without requiring an external numerical step count.

**Audit result: PASS.**

---

## 4. Recursion derivability

Take a constant motive:

```text
P(n) ≔ X
```

in the dependent eliminator.

Given:

```text
x₀ : X
f  : X → X
```

the eliminator yields the nondependent recursive map with expected constructor computation behavior.

Therefore a separate primitive recursion axiom is not required by the planned R-B core.

**Audit result: PASS, FORMAL DERIVATION REQUIRED.**

---

## 5. Recursion uniqueness without function extensionality

### Target

If `h,k : N_BOMA → X` satisfy the same base and step equations, prove:

```text
∀n : N_BOMA, h(n) = k(n).
```

### Proof route

Use induction on `n`:

- base follows from the common base equation;
- step follows from common recursive equations plus the induction hypothesis and congruence of `f`.

This yields **pointwise uniqueness**.

No equality `h = k` of functions is required.

Therefore function extensionality is not needed for the first canonical N-Core acceptance statement.

If a later categorical/universal packaging requires equality of functions, that is a separate commitment or a change of uniqueness formulation.

**Audit result: PASS.**

---

## 6. Classical principles

No current R-B obligation requires as a material primitive:

```text
excluded middle
choice
double-negation elimination
classical description
```

The planned no-confusion, induction, recursion, and pointwise uniqueness proofs are constructive in form.

This is scoped to the proposed N-Core proof plan, not a claim about all later arithmetic.

**Audit result: PASS.**

---

## 7. Quotients and equivalence classes

The R-B carrier is not constructed as a quotient of TCT presentations.

The TCT bridge preserves `≈`, but does not require forming a quotient object of all TCT configurations.

This avoids importing quotient formation merely to pass from presentation invariance to formal carrier identity.

**Audit result: PASS.**

---

## 8. TCT bridge and backend formalization

### Architectural level

TCT selected configurations remain canonical constructional presentations, not a completed source type.

The bridge therefore begins as a schema/certificate:

```text
ε ↦ z
ExtU(A) ↦ s(ρ(A))
A≈B → ρ(A)=ρ(B)
```

### Machine-verification level

A proof assistant cannot quantify over an unencoded external document-level presentation system.

Therefore V5 verification of the bridge may introduce an **auxiliary backend representation type** for selected TCT syntax.

Such a type must be classified:

```text
REPRESENTS TCT selected presentations
```

and never:

```text
IS the pre-numerical TCT mathematical carrier
```

### Important learning

The backend representation may itself look Nat-like because it encodes the recursive selected grammar. That resemblance does not retroactively make the pre-numerical construction dependent on natural numbers; it is introduced only after the formalization boundary as a verification representation.

**Audit result: PASS WITH REPRESENTATION LABEL REQUIRED.**

---

## 9. Built-in natural numbers

Using a proof assistant's built-in natural-number type as the definition of `N_BOMA` would bypass the explicit construction/commitment record.

The contract correctly requires a fresh BOMA-specific inductive carrier for the first canonical realization.

Built-in naturals may later serve as a comparison target in a separate equivalence theorem.

**Audit result: PASS.**

---

## 10. Initial-algebra language

The contract uses initial-algebra language only for nondependent recursion/comparison where justified.

It does not infer dependent induction from ordinary category-level initiality without additional assumptions.

This distinction is necessary and correctly explicit.

**Audit result: PASS.**

---

## 11. Uniqueness / standardness route

The planned R-B standardness certificate should be constructed using the accepted interface rather than asserted from the inductive declaration label.

Recommended route:

1. for any comparison candidate `M` satisfying the selected R-B N-Core interface, use recursion to define a structure-preserving map `f : N_BOMA → M`;
2. use the comparison candidate's recursion/induction structure to construct the reverse map where appropriate;
3. prove pointwise inverse laws by induction;
4. package the result in the weakest regime-appropriate equivalence notion needed by NAC-12.

Exact packaging is a future proof obligation.

**Audit result: VIABLE / OPEN FORMAL PROOF OBLIGATION.**

---

## 12. NAC coverage audit

| NAC | Contract status |
|---|---|
| NAC-01 | COVERED by RB-F01..F06 + backend/regime declaration |
| NAC-02 | AUTHORIZED NEXT, not yet constructed |
| NAC-03 | COVERED in plan by RB-F03 |
| NAC-04 | next carrier constructor `z` |
| NAC-05 | next carrier constructor `s` |
| NAC-06 | COVERED by RB-B01..B05 plan |
| NAC-07 | RB-O01/O02 formal proof obligations |
| NAC-08 | induction/eliminator generatedness route |
| NAC-09 | RB-F05 / RB-O03 |
| NAC-10 | RB-F06 / RB-O04/O05 |
| NAC-11 | future combined adequacy proof |
| NAC-12 | RB-O08 open formal proof |
| NAC-13 | RB-O07/O09 |
| NAC-14 | RB-O09 |

No NAC requirement is silently declared complete by the contract alone.

---

# 13. Verdict

```text
BOMA-RB-FORMAL-001 v0.1-draft
PASS WITH EXPLICIT PROOF OBLIGATIONS
```

No unnecessary classical, quotient, or function-extensionality commitment was found in the planned N-Core regime.

The main new commitment is correctly isolated as:

```text
fresh inductive type formation + dependent eliminator in a declared type-theoretic regime
```

## Recommended Act

1. promote `BOMA-RB-FORMAL-001` to ACTIVE v1.0;
2. close PDSA-N-003;
3. keep `TCT-BLOCK-006` RESERVED until the carrier and all mandatory theorem obligations are constructed/verified;
4. next open a dedicated carrier-construction cycle;
5. treat Lean as backend and require a fresh `BOMANat` carrier rather than built-in `Nat`.
