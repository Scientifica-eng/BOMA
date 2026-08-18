# Z-to-N Reverse / Bottom-Up Comparison V5 Evidence
**Status:** FAIL_OR_INCOMPLETE  
**Verified commit:** `caf9edd14e8259a7a9a765c27789cd5cf8f54e9a`  
**Workflow run ID:** `32171399638`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`

| Target | Outcome |
|---|---|
| Lean setup | success |
| encode/decode, arithmetic/order preservation, reachability comparison, comparison-assisted recursion | failure |

A PASS certifies the comparison layer. It does not reclassify representation-aware recovery as abstract Z-only recovery.
