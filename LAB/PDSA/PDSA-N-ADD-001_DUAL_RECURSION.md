# PDSA-N-ADD-001 — Dual-Recursion Addition

**Status:** ACTIVE — PLAN / DO

## Question
Can addition be constructed independently by recursion on either argument and then reconverge to one certified operation?

## Routes
```text
Route R: addR(a,b) = fold a s b
Route L: addL(a,b) = fold b s a
```

Neither route may use the other in its definition.

## Convergence target
```text
∀a b, addL(a,b) = addR(a,b)
```

## Downstream target
Only after convergence export canonical `add`, then derive zero identities, successor equations, commutativity, associativity, and cancellation.

## Verification
Use separate backend fragments for Route R, Route L, convergence, and canonical laws so a failure can be localized to the DAG branch.
