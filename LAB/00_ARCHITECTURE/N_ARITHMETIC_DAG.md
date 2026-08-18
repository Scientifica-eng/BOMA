# N-ARITHMETIC DAG — Stage-One Arithmetic

**Document ID:** `BOMA-N-ARITH-DAG-001`  
**Version:** `0.3`  
**Status:** ACTIVE — ADDITION PASS / MULTIPLICATION IN PROGRESS

```text
N-BLOCK-007 Accepted N-Core
      │
      ├─ N-ADD-BLOCK-001 Route R ─┐
      └─ N-ADD-BLOCK-002 Route L ─┤
                                   ▼
                              N-ADD-J-001 PASS
                                   ▼
                              N-ADD-BLOCK-003
                              Canonical Addition PASS
                                   │
                   ┌───────────────┴───────────────┐
                   ▼                               ▼
           N-MUL-BLOCK-001                 N-MUL-BLOCK-002
           Right recursion                  Left recursion
                   └───────────────┬───────────────┘
                                   ▼
                              N-MUL-J-001
                                   ▼
                              N-MUL-BLOCK-003
                                   ▼
                               Order — later
                                   ▼
                       N-Arithmetic Integration Gate
```

Addition retains two verified production witnesses. Multiplication repeats the same controlled split/reconvergence experiment downstream of canonical addition.
