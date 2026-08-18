# N-ARITHMETIC DAG — Stage-One Arithmetic

**Document ID:** `BOMA-N-ARITH-DAG-001`  
**Version:** `0.4`  
**Status:** ACTIVE — ADDITION PASS / MULTIPLICATION PASS / ORDER NEXT

```text
N-BLOCK-007 Accepted N-Core
   ├─ N-ADD-BLOCK-001 ─┐
   └─ N-ADD-BLOCK-002 ─┤→ N-ADD-J-001 PASS → N-ADD-BLOCK-003 PASS
                                               │
                              ┌────────────────┴────────────────┐
                              ▼                                 ▼
                       N-MUL-BLOCK-001                   N-MUL-BLOCK-002
                              └────────────────┬────────────────┘
                                               ▼
                                          N-MUL-J-001 PASS
                                               ▼
                                          N-MUL-BLOCK-003 PASS
                                               │
                                               ▼
                                          Order — NEXT
                                               │
                                               ▼
                                N-Arithmetic Integration Gate
```

Both addition and multiplication preserve two distinct recursive production witnesses after reconvergence.
