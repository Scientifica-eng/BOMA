# Z-BLOCK-001 — Selected Integer Carrier / Identity Interface

- **Operational Status:** **ACTIVE — CARRIER SELECTED / ARITHMETIC PENDING**
- **Epistemic Status:** **MIXED — REPRESENTATION CHOICE + DERIVED CROSS-ROUTE CERTIFICATE**
- **Depends on:** `Z-S-BLOCK-001`, `Z-D-BLOCK-001`, `Z-J-001`, `Z-DP-001`

## Purpose

Provide the canonical downstream integer carrier/identity interface after representation convergence and the explicit representation Decision Point.

This Block is intentionally narrower than an accepted integer domain. It does **not** yet export accepted integer addition, multiplication, order, or ring laws.

## Carrier

Selected Stage-One carrier:

```text
Z_BOMA := ZSigned

zero
pos n   -- positive successor magnitude
neg n   -- negative successor magnitude
```

with no duplicate positive/negative zero syntax.

## Current exported structure

```text
zero   : Z_BOMA
embedN : N_BOMA → Z_BOMA
zneg   : Z_BOMA → Z_BOMA
diff   : N_BOMA → N_BOMA → Z_BOMA
```

Certified properties currently include:

```text
embedN injective
zneg involutive
signed normal forms classify difference-pair equivalence
signed round-trip exact
pair round-trip up to ~
```

## Representation provenance

The canonical carrier must retain both construction witnesses:

```text
Route S — signed normal-form construction
Route D — difference-pair / equivalence construction
```

`Z-J-001` proves their convergence. `Z-DP-001` selects Route S only as the canonical export representation.

## Verification

Representation V5:

```text
workflow run: 32168105466
Lean:         4.32.1
result:       PASS
```

## Hard boundary

Do not infer from this Block that:

```text
Z addition is accepted
Z multiplication is accepted
Z is an additive group
Z is a ring
Z has an accepted order
ZA-20 integration has passed
ZA-21 closure has passed
```

Those are separate downstream construction and acceptance obligations.
