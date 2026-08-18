# N-ARITHMETIC DAG — Stage-One Arithmetic

**Document ID:** `BOMA-N-ARITH-DAG-001`  
**Version:** `0.6`  
**Status:** ACTIVE — ADDITION / MULTIPLICATION / ORDER PASS — INTEGRATION NEXT

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
                                N-Arithmetic Integration Gate — NEXT
```

Three controlled reconvergence experiments now pass: addition, multiplication, and order. The order experiment preserves a branch whose dependencies stop at N-Core.
