# N-DP-002 — Stage-One Eliminator and Universe Scope

- **Type:** Decision Point
- **Layer:** L2 formal realization
- **Operational Status:** **RESOLVED / SELECTED**
- **Epistemic Status:** **FORMALIZATION-DEPENDENT / METHODOLOGICAL CHOICE**
- **Triggered by:** `PDSA-N-007-V5-FAILURE-001`
- **Depends on:** `N-DP-001`, `BOMA-RB-FORMAL-001`, `N-BLOCK-001`, `N-BLOCK-004`

## Question

What motive-sort and universe scope is required for the Stage-One R-B N-Core claims, without allowing Lean's inference behavior to make that choice implicitly?

## Evidence that forced the decision

The first V5 run exposed two under-specified interfaces:

```text
1. Type-valued eliminator wording did not cover Prop-valued induction.
2. PointwiseInitial did not declare a coherent universe policy for its target algebras.
```

These were classified as formalization-scope defects, not pre-numerical mathematical failures.

## Options considered

### Option A — Type-only eliminator

```text
P : N_BOMA → Type u
```

Rejected for the canonical Stage-One interface because it does not directly subsume the required proposition-valued induction statement.

### Option B — Sort-polymorphic eliminator

```text
P : N_BOMA → Sort u
```

Selected. This explicitly includes:

```text
u = 0        → Prop-valued motives
higher Sort  → Type-valued motives
```

No classical principle follows from this choice.

### Option C — unrestricted heterogeneous-universe initiality

Allow the BOMA source algebra to map to target algebras at arbitrary higher universes through a heterogeneous morphism interface.

Preserved as a possible later strengthening/branch. It is not required for Stage One and would add formal interface complexity.

### Option D — same-universe pointwise initiality

For an algebra `A : UnaryAlgebra.{u}`, quantify over target algebras in the same universe:

```text
∀ B : UnaryAlgebra.{u}, ...
```

Selected as the generic initiality interface.

Because the fresh `BOMANat` carrier inhabits `Type 0`, its canonical Stage-One pointwise-initiality claim is therefore scoped to:

```text
UnaryAlgebra.{0}
```

The nondependent recursor itself remains universe-polymorphic over target types `X : Type u`.

## Selected package

```text
ELIMINATOR
  Sort-polymorphic

FOLD / RECURSION
  target-Type universe polymorphic

POINTWISE INITIALITY OF bomaAlg
  Type-0 unary algebras for Stage One

STANDARDNESS THEOREM
  generic between same-universe pointwise-initial unary algebras
```

## Why this is not a theorem

TCT does not force this universe policy. The decision belongs to the selected formalization route and is therefore preserved as an explicit Decision Point.

## Downstream effect

The following must use this declared scope:

```text
N-BR-003
N-BR-006
N-BR-008..011
N-BLOCK-003
N-BLOCK-004
N-BLOCK-006
NAC-09
NAC-10
NAC-12
```

## Reopening conditions

Reopen if:

```text
a required Stage-One target algebra cannot be represented in Type 0;
a later theorem materially needs heterogeneous cross-universe initiality;
the proof assistant cannot faithfully express the selected Sort-polymorphic eliminator;
a different formalization regime is selected at N-DP-001.
```

Non-selected scope options remain architectural alternatives rather than being erased.
