# CAL-EXP-002 — Audit of B-005 through B-008

**Cycle:** `CAL-001`  
**Scope:** `B-005`–`B-008`  
**Status:** Provisional audit

## 1. Intention / Goal

Determine whether aggregation, multiplicity, extension, and especially the phrase "one new token" introduce numerical structure before the natural numbers have been constructed.

## 2. Experiment

Audit the operational content of each Brick separately from the language used to describe it.

### B-005 — Common Aggregation

`G` combines previously referable constructional results into a common constructional context.

The existence of two inputs is not by itself a numerical theorem. The two inputs are distinguished by provenance established earlier. However, saying "two" as a cardinality claim would be numerical shorthand.

**Classification:** `P/D`, with numerical language treated as `L`.

The operation is currently not required by the main path and should be regarded as an exploratory branch until a later construction uses it.

### B-006 — Conservative Extension

The extension operation preserves the previously constructed content and introduces a new constructional result.

The preservation condition is structural. No numerical concept is required merely to state that prior content remains available.

**Classification:** `D` relative to earlier persistence/referability commitments.

### B-007 — One New Provenance-Distinguished Token

This is the critical case.

The original formulation uses "exactly one new token." If "exactly one" is interpreted as an independently meaningful cardinality statement, then the Brick contains a hidden numerical commitment.

However, the operation can instead be understood as an explicit primitive specification:

> each extension event is stipulated to have one designated new output and no second output of the same designated role within that event.

Under this reading, the uniqueness is not derived from a prior number system; it is part of the chosen operational rule.

**Classification:** `P`, provided the uniqueness is explicitly declared as part of the primitive extension protocol. Otherwise `N`.

This is a methodological repair, not a proof that the original wording was non-numerical.

### B-008 — Cumulative Extension

Repeated application of the extension operation generates a growing constructional history.

The notion of repetition here must be interpreted operationally: apply the same permitted operation again to the resulting state. It does not require assigning a numerical index to the repetition.

**Classification:** `D/P`.

The phrase "one extension, then another" is temporal/operational shorthand, not yet arithmetic.

## 3. Result

The audit identifies a real vulnerability in `B-007`, but also a viable repair.

The vulnerability is:

```text
"exactly one"
      ↓
cardinality claim
      ↓
possible hidden number
```

The repair is:

```text
chosen extension protocol
      ↓
designated new output
      ↓
structural uniqueness of that role
```

The repair must be explicitly recorded as a primitive choice. We should not claim that the uniqueness itself was derived from the pre-numerical context.

## 4. Decision

1. Keep B-005 through B-008 provisionally.
2. Mark B-005 as an exploratory branch, not a necessary step in the current natural-number path.
3. Reclassify the uniqueness in B-007 as an explicit primitive/design choice if retained.
4. Avoid the phrase "exactly one" in later derived arguments unless it is explicitly referring back to this primitive protocol.
5. Do not yet modify the historical Brick files; first complete the calibration cycle and then issue a controlled repair if required.

## 5. Calibration Finding

The numerical danger is not the existence of a unique extension output itself. The danger is treating that uniqueness as if it had been mathematically derived from a number-free base.

Thus the correct methodological distinction is:

> **A primitive can contain structure chosen by us; it cannot be presented as a theorem forced by a weaker base if it was not.**

## 6. Next

Proceed to `CAL-EXP-003`: replace numerical comparison of constructional depths with structural equivalence of finite construction histories.
