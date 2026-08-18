# PDSA-N-MUL-001 — Dual-Recursion Multiplication

**Status:** ACTIVE — PLAN / DO

## Question
Can multiplication be constructed independently by repeated canonical addition on either argument and reconverge?

```text
Route R: mulR(a,b)=fold z (x ↦ x+a) b
Route L: mulL(a,b)=fold z (x ↦ x+b) a
```

Both routes depend on accepted `N-ADD-BLOCK-003` but not on each other.

Convergence target:
```text
∀a b, mulL(a,b)=mulR(a,b)
```

After convergence derive canonical multiplication, zero/one laws, commutativity, distributivity, and associativity.
