# N-ARITHMETIC DAG — Stage-One Arithmetic

**Document ID:** `BOMA-N-ARITH-DAG-001`  
**Version:** `0.2`  
**Status:** ACTIVE — ADDITION ACCEPTED / MULTIPLICATION NEXT

```text
N-BLOCK-007  Accepted N-Core
      │
      ├────────► N-ADD-BLOCK-001  Right-Recursive Addition — PASS
      │
      └────────► N-ADD-BLOCK-002  Left-Recursive Addition  — PASS
                         │
N-ADD-BLOCK-001 ─────────┤
                         ▼
                    N-ADD-J-001
                    PASS / V4+V5
                         │
                         ▼
                 N-ADD-BLOCK-003
              Canonical Addition + Laws
                    ACTIVE / PASS
                         │
                         ▼
                Multiplication — NEXT
                         │
                         ▼
                    Order — later
                         │
                         ▼
            N-Arithmetic Integration Gate
```

The two addition histories remain distinct even after their outputs reconverge. Canonical spelling uses Route R only after pointwise equivalence is established.
