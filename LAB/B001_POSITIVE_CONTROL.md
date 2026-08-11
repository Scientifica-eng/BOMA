# B-001 — Positive Control for Brick Identity

**Cycle:** PDCA-001  
**Status:** Experimental test  
**Purpose:** test whether dependency on a prior Brick is compatible with independent Brick identity.

## 1. Hypothesis

A candidate does not cease to qualify as an independent Brick merely because it depends on an earlier Brick.

The relevant distinction is:

```text
dependency ≠ lack of independent identity
```

## 2. Positive Control Candidate

We use the following deliberately minimal candidate:

> **C-POS-001 — Successor Extension**

Assume a prior Brick `P` provides a minimal pointed object domain:

```text
P
├── carrier/domain
└── initial
```

The candidate extension introduces a new structural commitment:

```text
S : P → P
```

interpreted as a successor-forming operation on the objects supplied by `P`.

This is a **control candidate**, not yet an adopted BOMA Brick. It is not added to `BRICKS/`.

## 3. Criterion A — Identifiability

Question:

> Can the extension be identified without redefining the content of its prerequisite Brick?

Yes. The candidate's subject is the introduction of a successor structure over the already specified object domain of `P`.

The candidate therefore has a distinct architectural subject even though its type refers to `P`.

**Result: PASS.**

## 4. Criterion B — Self-contained intended meaning

The extension has a complete intended meaning once `P` is supplied:

```text
Given the object domain established by P,
introduce a successor operation on that domain.
```

It does not require reintroducing `initial` as part of its own content. Its dependency is explicit rather than semantically incomplete.

**Result: PASS, conditional on P.**

## 5. Criterion C — Traceable dependency

The dependency is explicit:

```text
C-POS-001
      │
      └── depends on P
```

This is a normal dependency relation rather than evidence against Brick identity.

**Result: PASS.**

## 6. Criterion D — Non-artificiality

The separation is not merely syntactic. The candidate introduces a new kind of structure—successor formation—while leaving the prerequisite domain/initial commitment unchanged.

A later construction can therefore depend on `P` without inheriting responsibility for defining `P` again.

**Result: PASS provisionally.**

## 7. Positive Control Result

| Criterion | C-POS-001 |
|---|---|
| Identifiable independently | PASS |
| Self-contained intended meaning | PASS, conditional on P |
| Dependencies traceable | PASS |
| Non-artificial separation | PASS provisional |
| Independent Brick candidate | **YES, provisionally** |

## 8. Contrast With the Negative Control

The previous negative control was:

```text
C-CTRL-001: successor : X → X
```

with no independently specified carrier/domain. It failed because its intended BOMA meaning was incomplete.

The positive control instead has:

```text
P = established prerequisite domain
S = new successor commitment
```

The dependency is explicit and sufficient to complete the candidate's meaning.

Therefore:

```text
missing prerequisite meaning  → not an independent Brick
explicit prerequisite + new complete commitment → may be an independent Brick
```

## 9. Evidence — E-010

**E-010 — Positive control for dependency**

The provisional Brick identity criterion accepts a candidate that depends on a prior unit when the candidate has a distinct, complete intended commitment relative to that prerequisite.

Status: **Provisional / conceptual evidence**.

No new Brick has been created from this control.

## 10. Architectural Finding

The combined negative and positive controls support the following provisional distinction:

```text
A Brick may depend on another Brick.

What disqualifies Brick status is not dependency itself,
but absence of an independently meaningful architectural commitment.
```

This is stronger than the earlier rule and should remain provisional until tested on further cases.

## 11. Consequence for B-001

The evidence now supports the possibility of decomposing the original candidate as:

```text
B-001a — Minimal Pointed Object Domain
B-001b — Successor Structure

B-001b depends on B-001a.
```

This is still a candidate architecture. It is **not yet an adopted BOMA decomposition**.

The next decision should compare the candidate decomposition against the actual BOMA definition of Brick and the project's intended notion of construction order, rather than adding records merely because the controls passed.
