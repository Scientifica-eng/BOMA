# Z-to-N Reverse / Bottom-Up Comparison V5 Evidence
**Status:** FAIL_OR_INCOMPLETE  
**Verified commit:** `287228f2ffaedcd5d9c7934cec752d4c4fcff7db`  
**Workflow run ID:** `32171206179`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`

| Target | Outcome |
|---|---|
| Lean setup | success |
| encode/decode, arithmetic/order preservation, reachability comparison, comparison-assisted recursion | failure |

A PASS certifies the comparison layer. It does not reclassify representation-aware recovery as abstract Z-only recovery.
