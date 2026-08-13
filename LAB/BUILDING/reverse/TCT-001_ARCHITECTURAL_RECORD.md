# TCT-001 — Architectural Unit Record

## Unit identity

- **ID:** `TCT-001`
- **Type:** Block
- **Layer:** `L1 — explicit constructed structure`
- **Parent:** `TCT-BLOCK-000`
- **Source document:** `TCT-001_CONSTRUCTION_KERNEL.md`
- **Graph position:** root construction block after declared starting choice

## Role

TCT-001 establishes the smallest explicit construction interface currently admitted:

```text
ε  empty configuration
U  elementary repeatable block
⊙  compatible concatenation
```

It is a **kernel block**, not a complete model of the natural numbers.

## Input

The input is the project's declared constitutive starting choice: one elementary block with designated interfaces and an empty configuration.

## Output

A reusable construction interface consisting of:

1. empty configuration `ε`;
2. elementary block `U`;
3. partial concatenation operation `⊙`;
4. structural-equivalence target `≈` for later verification.

## Internal Bricks

```text
TCT-001-BRICK-01  empty configuration
TCT-001-BRICK-02  elementary block
TCT-001-BRICK-03  interface compatibility
TCT-001-BRICK-04  concatenation
```

These are architectural subdivisions. The existing TCT-001 document remains the substantive source until separate Brick documents are created.

## Dependencies

```text
REORIENTATION-001
        ↓
TCT-001
```

## Outgoing dependencies

```text
TCT-001
   └── DEPENDS_ON → TCT-002
```

## Invariants

- `ε` remains the empty construction.
- `U` remains a repeatable unit configuration.
- concatenation preserves designated boundary interfaces when compatible.

## Assumptions added

- choice of `U`;
- choice of `ε`;
- choice of interface geometry;
- choice that `⊙` is the relevant composition operation.

These are **declared choices**, not derived theorems.

## Verification status

- repeatable unit: **accepted as constructional specification**;
- compatible concatenation: **accepted as constructional specification**;
- empty behavior: **specified**;
- associativity: **pending later verification**;
- natural-number indexing: **not used**.

## Sensitivity / perturbation test

### Change U

Expected impact:

```text
U representation changes
   ↓
TCT-002 formation changes
   ↓
normal forms and decomposition must be retested
   ↓
depth/successor construction downstream must be retested
```

### Change ε

Expected impact:

```text
empty-history behavior changes
   ↓
composition interface changes
   ↓
TCT-002 and all identity-related downstream units require retest
```

### Change ⊙

This is a high-impact change. It potentially affects every downstream block because formation, decomposition, composition, depth, and later arithmetic interpretations depend on the composition interface.

## Failure conditions

Reject or revise TCT-001 if:

1. the geometry requires hidden numerical measurement;
2. compatibility cannot be stated without importing a prior numerical structure;
3. structural equivalence `≈` turns out to conceal the target arithmetic;
4. the empty configuration cannot be represented independently of numerical identity.

## Architectural decision

TCT-001 is the current **root Block** of the transparent construction track. Its job is to expose the construction interface, not to solve the natural-number problem inside itself.

## Plan position

Transparent Construction Track — TCT-001 architectural record.
