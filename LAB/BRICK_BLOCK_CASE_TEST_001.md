# Brick / Block — Case Test 001

**Cycle:** `PDCA-001`  
**Status:** Experimental result  
**Definition under test:** `LAB/BRICK_BLOCK_DEFINITION_001.md`

## 1. Test matrix

| Case | Description | Expected | Result |
|---|---|---|---|
| P-BRICK-001 | Successor commitment over established prerequisite P | Brick = YES | PASS provisionally |
| N-BRICK-001 | `successor : X → X` without specified carrier/domain | Brick = NO | PASS provisionally |
| P-BLOCK-001 | Composition of Bricks with added architectural commitment | Block = YES | PASS provisionally |
| N-BLOCK-001 | Arbitrary unrelated collection | Block = NO | PASS provisionally |

## 2. P-BRICK-001 — Dependent but independently meaningful

```text
P = established prerequisite
S = successor-forming commitment over P
```

S has:

- explicit identity;
- explicit dependency on P;
- a distinct semantic commitment;
- a complete intended meaning relative to P.

**Result: PASS provisionally.**

This reinforces:

```text
dependency ≠ non-Brick
```

## 3. N-BRICK-001 — Backend-separable but semantically incomplete

```text
successor : X → X
```

with no independently specified carrier/domain.

The term can be represented in a backend, but its BOMA-level intended commitment is not independently complete.

**Result: PASS provisionally.**

This reinforces:

```text
backend separability ≠ Brick identity
```

## 4. P-BLOCK-001 — Composition with added commitment

Construct:

```text
A = Brick
B = Brick
C = composition(A, B)
```

The composition is treated as a Block only when it adds an explicit architectural purpose or exported commitment beyond merely placing A and B together.

**Result: PASS provisionally.**

This prevents `Block` from becoming a synonym for a directory or arbitrary collection.

## 5. N-BLOCK-001 — Arbitrary collection

```text
C = {A, B}
```

with no composition purpose, no added commitment, and no architectural relation.

**Result: PASS provisionally — not a Block.**

## 6. What the test establishes

The provisional terminology can distinguish four cases:

```text
                     Independent meaning?
                         │
              ┌──────────┴──────────┐
              │                     │
             YES                    NO
              │                     │
       candidate Brick        not a Brick
              │
       composition with
       added commitment?
              │
        ┌─────┴─────┐
       YES          NO
        │             │
      Block       standalone Brick
```

## 7. What it does NOT establish

This experiment does not prove that the terminology is the only possible architecture, nor that it is formally equivalent to BOMA I/II.

It only shows that the provisional definitions are internally discriminating on the selected cases and remain compatible with the evidence accumulated in PDCA-001.

## 8. Evidence

New evidence:

```text
E-013 — Brick/Block provisional definition and case test
```

Status: **Provisional / observed**.

## 9. Next gate

Re-evaluate `B-001` under the tested terminology. In particular, determine whether:

```text
B-001
  ├── domain + initial
  └── successor structure
```

contains two independently meaningful Bricks or one Brick with an internal component.

Do not create official `B-001a` / `B-001b` until that analysis is recorded.
