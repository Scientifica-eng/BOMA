# N-ARITHMETIC DAG — Stage-One Arithmetic

**Document ID:** `BOMA-N-ARITH-DAG-001`  
**Version:** `1.0`  
**Status:** **ACTIVE — N-ARITHMETIC ACCEPTED**

```text
N-BLOCK-007 Accepted N-Core
   ├─ dual addition routes ──► N-ADD-J-001 PASS ──► N-ADD-BLOCK-003 PASS
   │                                                  │
   │                              dual multiplication routes
   │                                                  ▼
   │                                             N-MUL-J-001 PASS
   │                                                  ▼
   │                                             N-MUL-BLOCK-003 PASS
   │
   ├──────────────────────────────► N-ORD-BLOCK-002 Structural Order PASS
   │
N-ADD-BLOCK-003 ─────────────────► N-ORD-BLOCK-001 Additive Order PASS
                                        \         /
                                         ▼       ▼
                                      N-ORD-J-001 PASS
                                           │
                                           ▼
                                      N-ORD-BLOCK-003 PASS
                                           │
                             N-MUL-BLOCK-003
                                           │
                                           ▼
                                      N-ORD-BLOCK-004 PASS
                                           │
                                           ▼
                                     N-ARITH-J-001 PASS
                                           │
                                           ▼
                                      NAA-18 ACCEPT
                                           │
                                           ▼
                                   N-ARITH-BLOCK-001
                              Accepted N-Arithmetic Interface
                                           │
                                           ▼
                                   Integer stage — NEXT
```

## Verification lineage

```text
N-Core             run 32163771789
Addition           run 32164861155
Multiplication     run 32165318266
Order/full stack   run 32165691581
Toolchain          Lean 4.32.1
```

## Reconvergence record

1. Addition: right-recursive / left-recursive routes reconverge.
2. Multiplication: right-recursive / left-recursive routes reconverge.
3. Order: additive-witness and N-Core-only inductive routes reconverge.

The order experiment establishes convergence across materially different dependency layers.

## Acceptance

```text
NAA-01..17 = PASS
N-ARITH-J-001 = PASS / RESOLVED
NAA-18 = ACCEPT
```

Canonical downstream interface:

`LAB/10_CONSTRUCTION/blocks/N-ARITH-BLOCK-001/UNIT.md`

This accepted package does not construct integers; it makes integer work eligible to begin.
