# B-001 — Independent BOMA Identity Analysis

**Status:** Active experimental test  
**Cycle:** PDCA-001

## Question

Does `domain + initial` have an independent BOMA identity sufficient to justify recording it as a Brick, with successor introduced later as a separate extension?

This test is deliberately different from the Lean atomicity probe. Backend separability has already been demonstrated. The present test concerns BOMA semantic identity.

## 1. Candidate

```text
Candidate A
= an object domain D
+ a distinguished object i ∈ D
```

The candidate does not yet include a successor operation.

## 2. Independence Test

A candidate substructure has an independent BOMA identity only if it can be described without silently borrowing the semantic role that belongs to the later extension.

For this experiment we test four conditions:

1. **Identifiability** — it can be named and referenced without mentioning successor.
2. **Self-contained content** — its mathematical commitment can be stated without successor.
3. **Traceable dependency** — later constructions can explicitly depend on it.
4. **Non-artificiality** — recording it separately provides architectural information rather than merely splitting syntax.

These are provisional experimental criteria, not final BOMA law.

## 3. Identifiability

Candidate A can be stated as:

> a domain together with a distinguished initial object.

No reference to successor is required to identify this structure.

**Result: PASS (provisional).**

## 4. Self-contained Content

The candidate commits to:

```text
D = an object domain
initial ∈ D
```

This is a complete statement of the candidate's current content. It does not assert that every object has a successor, nor does it require any iteration mechanism.

**Result: PASS (provisional).**

## 5. Traceable Dependency

A later successor extension can be stated as a dependency on the existing domain:

```text
B-next
  depends_on → Candidate A
  introduces → successor : D → D
```

Thus the candidate provides a possible stable predecessor for a later construction.

**Result: PASS (provisional).**

## 6. Non-artificiality Test

The crucial question is whether separating Candidate A from successor records a real architectural distinction.

There is a meaningful distinction between:

```text
having a domain with a distinguished initial object
```

and:

```text
having a successor operation on that domain
```

The latter adds a new operation and a new closure commitment. The first does not imply the second.

Therefore the decomposition is not merely a syntactic split of one declaration; it separates two different mathematical commitments.

**Result: PASS (provisional).**

## 7. Counterconsideration

The fact that Candidate A is independently meaningful does not force BOMA to represent every meaningful substructure as a separate Brick. BOMA may intentionally choose a larger architectural unit when doing so improves the abstraction boundary.

Therefore:

```text
independent meaning → evidence for separate Brick
independent meaning ⇏ mandatory separate Brick
```

The decision still requires checking whether the project benefits from making the boundary explicit.

## 8. Current Assessment

The evidence now supports the following provisional statement:

> `domain + initial` has an independent semantic identity and can serve as a legitimate candidate Brick boundary.

This is stronger than backend separability, but it is still **not a final architectural decision**.

## 9. Consequence for B-001

The original B-001 candidate may be better represented as two stages:

```text
B-001a — Minimal Pointed Object Domain
          domain + initial

B-001b — Successor Structure
          successor : domain → domain
```

However, these IDs must not be created as official Brick records yet. The experiment must first test whether this decomposition is consistent with the broader BOMA construction protocol and whether the naming/identity model remains stable.

## 10. Evidence

- `E-007` — Lean atomicity probe successfully verified backend separability.
- Current semantic analysis — Candidate A passes the provisional independence criteria.

## 11. Next Gate

Before creating `B-001a` and `B-001b`, test whether the proposed boundary creates a useful dependency graph and whether the same identity criterion can be applied consistently to future Bricks.

**Decision status:** `DECOMPOSITION_SUPPORTED_BUT_NOT_YET_ADOPTED`.