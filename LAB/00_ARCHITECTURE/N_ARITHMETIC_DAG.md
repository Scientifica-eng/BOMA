# N-ARITHMETIC DAG — Stage-One Arithmetic

**Document ID:** `BOMA-N-ARITH-DAG-001`  
**Version:** `0.5`  
**Status:** ACTIVE — ADDITION PASS / MULTIPLICATION PASS / ORDER IN PROGRESS

```text
N-BLOCK-007 Accepted N-Core
   ├─ dual addition routes → N-ADD-J-001 PASS → N-ADD-BLOCK-003 PASS
   │                                            │
   │                              dual multiplication routes
   │                                            ▼
   │                                       N-MUL-J-001 PASS
   │                                            ▼
   │                                       N-MUL-BLOCK-003 PASS
   │
   ├──────────────────────────────► N-ORD-BLOCK-002
   │                                Inductive Structural Order
   │
N-ADD-BLOCK-003 ─────────────────► N-ORD-BLOCK-001
                                    Additive-Witness Order
                                        \       /
                                         \     /
                                          ▼   ▼
                                      N-ORD-J-001
                                          │
                                          ▼
                                      N-ORD-BLOCK-003
                                    Canonical Order + Laws
                                          │
                              N-MUL-BLOCK-003
                                          │
                                          ▼
                                      N-ORD-BLOCK-004
                                  Arithmetic Compatibility
                                          │
                                          ▼
                               N-Arithmetic Integration Gate
```

The order experiment intentionally compares branches with materially different dependency sets.
