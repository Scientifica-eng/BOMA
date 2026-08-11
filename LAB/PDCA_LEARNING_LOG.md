# PDCA Learning Log

**Cycle:** `PDCA-001`  
**Purpose:** preserve decisions, failed attempts, corrections, and lessons learned while constructing BOMA from zero.

## 1. Why this log exists

This laboratory is deliberately a small PDCA learning cycle. Its objective is not only to obtain a successful artifact, but to learn how BOMA should be constructed.

Therefore the experiment records four classes of events:

1. **Decision** — what we intentionally chose and why;
2. **Result** — what happened after the decision;
3. **Error / mismatch** — where an assumption, implementation, or interpretation proved inadequate;
4. **Correction / learning** — what changed and what should be carried forward.

A failed attempt is evidence. It must not be erased merely because the final implementation succeeds.

## 2. Learning entries

### L-001 — Build from zero

**Decision:** Do not retrofit an existing mathematical development. Construct BOMA incrementally, Brick by Brick.

**Result:** `D-000` was treated as an empty starting state and `B-001` became the first experimental construction target.

**Learning:** The laboratory itself must remain part of the architecture-development process, not merely a test suite for a finished architecture.

---

### L-002 — Use `Brick` as the atomic construction term

**Decision:** Use `Brick` for the smallest BOMA construction unit. A collection of Bricks may later form a `Block` where that abstraction is useful.

**Result:** The experimental records and terminology use `Brick` as the primary unit under investigation.

**Learning:** `Block` must not silently replace `Brick` as the atomic term. Their relationship, if any, must be explicitly defined later.

---

### L-003 — Separate BOMA language from backend language

**Decision:** BOMA concepts and Lean/Coq/Agda/Isabelle concepts must be distinguished internally even when a backend provides an implementation mapping.

**Result:** `B-001` is recorded as a BOMA Brick and `B001.lean` as a Lean artifact, with an `Implemented-by` relation rather than identity.

**Learning:** A successful proof-checker run must not automatically define BOMA semantics.

---

### L-004 — Initial CI failure

**Decision:** Run the Lean verification path through the repository's CI environment.

**Result:** The first CI attempt failed because the required Lake manifest/workspace setup was absent.

**Correction:** Add the minimal Lean/Lake infrastructure required by the declared toolchain.

**Learning:** Infrastructure failures must be recorded separately from mathematical or architectural failures. A green CI result after correction does not erase the fact that the original environment was incomplete.

---

### L-005 — First successful Lean verification

**Decision:** Verify the first B-001 Lean artifact under a pinned Lean environment.

**Result:** The kernel/type-check step succeeded.

**Learning:** This establishes backend verification evidence only. It does not establish BOMA atomicity, semantic canonicity, or normative acceptance.

---

### L-006 — First atomicity assumption challenged

**Initial assumption:** Because B-001 was represented as one Lean inductive declaration, treating it as one Brick was initially convenient.

**Test:** Construct an independent probe for `domain + initial`.

**Result:** The smaller candidate was accepted by Lean.

**Correction:** Do not infer BOMA atomicity from backend syntactic unity.

**Learning:**

```text
backend separability ≠ BOMA decomposability
```

---

### L-007 — Semantic identity test

**Decision:** Test whether `domain + initial` has an identity independent of successor.

**Result:** The candidate provisionally passed identifiability, self-contained content, traceable dependency, and non-artificiality tests.

**Learning:** Backend separability can become architectural evidence, but only after a semantic/architectural test.

---

### L-008 — Negative control

**Decision:** Apply the emerging identity criterion to a related component: `successor : X → X` without an independently specified carrier/domain.

**Result:** It failed independent identity and self-contained meaning despite being syntactically representable.

**Learning:** The criterion is not equivalent to backend separability.

---

### L-009 — Positive control

**Decision:** Test whether dependency on an established prior unit automatically disqualifies Brick status.

**Result:** A successor extension over an already established domain was provisionally accepted as an independent architectural candidate.

**Learning:**

```text
dependency ≠ non-atomicity
```

A Brick may depend on an earlier Brick when it introduces a distinct and complete commitment relative to that prerequisite.

---

### L-010 — Missing authoritative definition discovered

**Decision:** Before promoting the experimental identity criterion into a BOMA rule, compare it with the project's authoritative BOMA/BOMA II definition of Brick.

**Result:** The current repository branch did not expose a file that could safely be treated as that authoritative definition. The visible `README.md` is descriptive but insufficient for this purpose.

**Correction:** Do not manufacture a normative Brick definition from the PDCA evidence. Record the gap and return to the source documents before architectural adoption.

**Learning:** The laboratory may discover candidate principles, but it must distinguish **experimental inference** from **authoritative specification**.

---

### L-011 — Dependency-overconstraint detected

**Initial assumption:** A Brick's independent commitment might be characterized relative to a prior Brick.

**Challenge:** This formulation risks making dependency on a previous Brick an implicit condition of Brickhood. That can force an artificial linear construction order and make naturally branching structures appear sequential.

**Correction:** Dependency is a relation of a Brick, not a necessary condition for Brickhood.

**New hypothesis:** A Brick may have zero, one, or multiple dependencies. A dependency-free Brick is legitimate if it has its own identity and commitment.

**Additional candidate condition:** A Brick introduced into an existing context should not conflict with commitments already in scope. This is a hypothesis under test, not yet a formal definition of consistency or compatibility.

**Learning:** Keep these relations distinct:

```text
construction order
≠ dependency
≠ compatibility / non-conflict
≠ necessity
```

**Open question:** How should trunk, branch, convergence, and shared/reusable structure be represented without imposing artificial linearization?

Analysis record:

`LAB/DEPENDENCY_INDEPENDENCE_PROBE_001.md`

---

### L-012 — DAG convergence validated provisionally

**Test:** Use independent Bricks `A` and `B`, then a convergence Brick `C` with `C.depends_on = {A, B}`.

**Result:** The graph is representable without inventing `A → B` or `B → A`. Construction order can vary while the semantic dependency graph remains unchanged.

**Learning:** A branching/converging dependency structure should be permitted. Construction sequence must not be silently encoded as semantic dependency.

Analysis record:

`LAB/DAG_CONVERGENCE_PROBE_001.md`

---

### L-013 — Minimal conflict/compatibility probe

**Question:** If dependency is optional, what prevents an independent Brick from introducing an incompatible commitment?

**Test:** Use a deliberately tiny commitment language:

```text
A: P
B: Q
C: ¬P
```

**Results:**

```text
P + Q       compatible
P + ¬P      conflict
P + (P→Q)   compatible in the toy model
```

Dependency did not determine compatibility in either direction.

**Correction / learning:** The condition suggested earlier should be retained, but carefully scoped:

> A candidate Brick must be compatible with the commitments in its declared context.

This is stronger than “does not depend on previous Bricks” and weaker than a complete global consistency theory.

**Critical limitation:** The toy model does not define BOMA conflict generally. In particular, conflict may concern definitions, axioms, typing constraints, logical commitments, or architectural commitments. The experiment only demonstrates the conceptual distinction.

Analysis record:

`LAB/CONFLICT_COMPATIBILITY_PROBE_001.md`

---

## 3. Current lessons

### Lesson A — Preserve failures

A failed CI setup, rejected decomposition, or abandoned assumption is part of the experiment's knowledge base.

### Lesson B — Preserve decision provenance

Every architectural change should answer:

```text
What did we believe?
What did we test?
What happened?
What changed?
Why did the conclusion change?
```

### Lesson C — Separate evidence from interpretation

A successful Lean check is evidence about Lean acceptance. It becomes evidence about BOMA only through an explicit interpretation step.

### Lesson D — Do not prematurely normalize

An experimental pattern should remain marked `provisional` until it survives cross-case tests and is reconciled with the project's authoritative documents.

### Lesson E — The laboratory is itself a learning artifact

The output of PDCA-001 is not only `B-001`. It includes the construction method, the failure history, the evidence chain, and the corrections that will inform the next cycle.

### Lesson F — Do not confuse the record with the law

The learning log is a memory and reasoning aid for the experiment. Its entries are not automatically BOMA specification. A hypothesis may later be rejected, refined, or promoted only through explicit justification.

### Lesson G — Keep dependency and compatibility separate

A Brick can be independent of another Brick and still be compatible with it. A Brick can depend on another Brick and still conflict with an existing commitment. Neither relation determines the other.

## 4. Required record discipline

For future entries, use this structure:

```text
ID
Decision / assumption
Action or test
Observed result
Error or mismatch (if any)
Correction
Learning
Impact on BOMA
Evidence reference
```

No failed experiment should be deleted merely because a later attempt succeeds. If an earlier record is wrong, append a correction with provenance instead of silently rewriting history.

## 5. Current status

```text
PDCA-001
├── Decisions recorded          ✓
├── Results recorded            ✓
├── Failures recorded           ✓
├── Corrections recorded        ✓
├── Lessons extracted           ✓
├── Brick criterion             PROVISIONAL
├── Dependency requirement      REJECTED AS A NECESSARY CONDITION
├── DAG/convergence model       SUPPORTED PROVISIONALLY
├── Non-conflict condition      SUPPORTED AS CANDIDATE / OPEN
├── Conflict calculus           OPEN
├── Trunk/branch semantics      OPEN
├── B-001 decomposition         SUPPORTED / NOT ADOPTED
└── Authoritative definition    SOURCE AUDITED
```
