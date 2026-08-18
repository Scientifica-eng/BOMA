# Z-to-N Reverse / Bottom-Up Comparison V5 Evidence
**Status:** FAIL_OR_INCOMPLETE  
**Verified commit:** `72b420bc290423f58291cb2ab9ada455453c46f5`  
**Workflow run ID:** `32171046927`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`

| Target | Outcome |
|---|---|
| Lean setup | success |
| encode/decode, arithmetic/order preservation, reachability comparison, comparison-assisted recursion | failure |

A PASS certifies the comparison layer. It does not reclassify representation-aware recovery as abstract Z-only recovery.
