# Multi-Producer Contribution Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test whether one reusable Contribution may be jointly produced by multiple Bricks, and whether Contributions may depend on other Contributions without forcing an artificial Brick-to-Brick dependency.

## 1. Question

The previous probe separated construction from reuse:

```text
Brick = construction unit
Contribution = reusable unit
```

The present experiment tests two stronger cases:

1. Can a single Contribution have multiple producing Bricks?
2. Can one Contribution depend on another Contribution while avoiding an unnecessary direct Brick-to-Brick dependency?

## 2. Test A — One producer, one contribution

```text
A ──produces──→ C
B ──uses──────→ C
```

**Result:** This is the baseline case and remains straightforward.

The consumer B depends semantically on C, while A remains the provenance source.

## 3. Test B — Multiple producers, jointly required

Construct:

```text
A ──produces──→ C_A
B ──produces──→ C_B
```

and define a reusable result `C_AB` whose validity depends on both:

```text
C_A + C_B ──supports──→ C_AB
```

**Result:** `C_AB` can be represented as a derived Contribution whose evidence/provenance names both source Contributions.

The natural dependency is therefore:

```text
C_AB
├── uses C_A
└── uses C_B
```

rather than requiring an artificial:

```text
A ──depends_on──→ B
```

or:

```text
B ──depends_on──→ A
```

when neither Brick structurally depends on the other.

**Learning:** Joint provenance does not require a single producer and does not require imposing a false ordering between producers.

## 4. Test C — Multiple Bricks jointly produce one Contribution

A stronger formulation is:

```text
A ─┐
   ├── jointly establish → C
B ─┘
```

Here `C` is not merely derived from two already-exported Contributions; the evidence itself is jointly constructed from A and B.

**Result:** The model can represent multiple provenance sources for C.

However, this raises an important distinction:

```text
multiple producers
        ≠
multiple independent certificates
```

The exact semantics of "jointly produced" remain open.

**Provisional conclusion:** A Contribution should be able to record a provenance set rather than requiring exactly one producer.

## 5. Test D — Contribution depends on Contribution

Consider:

```text
A ──produces──→ C_A
C_A ──supports──→ C_B
B ──consumes──→ C_B
```

where B does not otherwise need any structural feature of A.

**Result:** The dependency can be represented entirely at the Contribution layer.

This avoids asserting:

```text
B depends_on A
```

when B's actual semantic requirement is only the certified result C_B.

**Learning:**

```text
Contribution dependency
        ≠
Brick dependency
```

This is consistent with the previous evidence-sensitive logical requirement model.

## 6. Test E — Contribution chain

Construct:

```text
A → C₁ → C₂ → C₃
```

where each arrow is a certified reuse relation.

**Result:** The contribution graph remains a DAG provided that no Contribution eventually depends on itself.

A consumer of C₃ need not import A merely because A is an ancestor in the provenance graph.

However, provenance remains traceable:

```text
C₃
 ↓
C₂
 ↓
C₁
 ↓
A
```

**Learning:** Reuse can form its own dependency graph independently of the construction graph.

## 7. Test F — Mixed Brick and Contribution dependencies

Consider:

```text
A ──produces──→ C_A
B ──depends_on──→ A
B ──consumes──→ C_A
C ──consumes──→ C_A
```

The structural relation B→A and the semantic relation C→C_A coexist without being equivalent.

**Result:** The model can represent both relations without collapsing them.

This supports maintaining at least two graph types:

```text
Construction graph
Brick → Brick

Contribution graph
Contribution → Contribution

Provenance links
Brick → Contribution
```

## 8. Test G — Independent convergence of Contributions

Suppose:

```text
A ──produces──→ C_A
B ──produces──→ C_B
C_A + C_B ──supports──→ C_M
```

Then a consumer D uses C_M.

```text
       A       B
        \     /
         C_A C_B
           \ /
           C_M
             |
             ↓
             D
```

**Result:** The convergence occurs at the Contribution layer. No structural dependency between A and B is necessary.

This is a strong argument against defining every semantic reuse relation as `Brick depends_on Brick`.

## 9. Test H — Negative control: circular Contribution dependency

Construct:

```text
C₁ → C₂
C₂ → C₁
```

**Result:** This cannot be accepted as an ordinary acyclic certification chain without an additional fixed-point semantics.

The contribution graph therefore needs a cycle policy.

For the present project, the conservative experimental rule is:

```text
Certified Contribution dependency should be acyclic
unless an explicit future mechanism authorizes cyclic/fixed-point reasoning.
```

This is a provisional laboratory rule, not a BOMA axiom.

## 10. Test I — One Contribution with incompatible consumers

Let C be valid under logical regime L₁, while consumer B operates under a context incompatible with the guarantee of C.

**Result:** C's existence does not make B admissible.

The consumer must still satisfy:

```text
C.guarantee compatible with B.context
```

**Learning:** Reusability is relational. A certified Contribution is not "universally reusable" merely because it is certified.

## 11. Test J — Joint contribution with different logical regimes

Suppose:

```text
C_A : intuitionistic
C_B : classical
```

and C_M consumes both.

**Result:** C_M cannot automatically be classified intuitionistically merely because one input is intuitionistic.

Its guarantee must be analyzed from the actual derivation and requirements of the joint result.

This reinforces:

```text
requirements(C_M)
≠
union mechanically inferred from producer Brick labels
```

but also:

```text
requirements(C_M)
must account for every essential input actually used
```

## 12. Test K — Contribution reused across branches

Let:

```text
Trunk
  └── C_T : intuitionistic

Classical Branch
  └── C_C : classical
```

A new Contribution C_M uses only C_T.

**Result:** The presence of C_C in the branch does not automatically contaminate C_M.

Conversely, if C_M genuinely uses C_C, its classical requirement must remain visible.

This provides a more precise model for branch convergence than branch-wide logical inheritance.

## 13. Resulting provisional graph model

The experiments suggest three distinct relations:

```text
1. Construction
   Brick ──depends_on──→ Brick

2. Reuse / derivation
   Contribution ──uses──→ Contribution

3. Provenance / production
   Brick ──produces──→ Contribution
```

A Contribution may have:

```text
one producer
multiple producers
or a derived provenance chain
```

without requiring the corresponding Bricks to become structurally dependent.

## 14. Important qualification

This does **not** mean that Brick-to-Brick dependency is unnecessary.

If B genuinely requires A's construction-level interface, definitions, declarations, or organizational state, then:

```text
B depends_on A
```

remains appropriate.

The experiment only shows that **semantic reuse alone is insufficient reason to assert structural dependency**.

## 15. Provisional architectural picture

```text
                    Construction layer

                 ┌─────────┐
                 │ Brick A │
                 └────┬────┘
                      │ produces
                      ▼
                    C_A
                      │
                      ├──────────────┐
                      │              │
                      ▼              ▼
                    C_M  ◄──────── C_B
                      ▲              ▲
                      │              │
                 produces        produces
                      │              │
                 ┌────┴────┐    ┌────┴────┐
                 │ Brick C │    │ Brick B │
                 └─────────┘    └─────────┘

                    Reuse layer
```

The diagram is intentionally conceptual. It does not prescribe a data model.

## 16. Findings

```text
One Contribution may have multiple provenance sources      SUPPORTED PROVISIONALLY
Joint production need not impose Brick ordering            SUPPORTED
Contribution→Contribution dependency is meaningful         SUPPORTED PROVISIONALLY
Contribution dependency need not imply Brick dependency    SUPPORTED
Contribution chains are representable                       SUPPORTED
Contribution cycles require explicit policy               SUPPORTED
Reuse is context-sensitive                                 SUPPORTED
Branch contamination is not automatic                       SUPPORTED
Final provenance semantics                                  OPEN
```

## 17. Architectural hypothesis after the experiment

A promising separation is now:

```text
Brick
  → organizes construction

Contribution
  → carries reusable semantic output

Evidence
  → supports the output

Guarantee
  → specifies what consumers may rely upon

Provenance
  → records where the output came from
```

The important point is that these may be **orthogonal dimensions**, not nested synonyms.

## 18. Open questions

1. Is "Contribution" an actual BOMA entity or a view/interface over a Brick?
2. What does it mean formally for multiple Bricks to jointly produce one Contribution?
3. Can two independent Contributions be merged without creating a new Brick?
4. Can a Contribution be consumed directly by a Block?
5. How should contribution versioning and invalidation propagate through the graph?
6. What is the exact relation between Contribution identity and Guarantee identity?
7. Should provenance be immutable?
8. How should a backend certificate represent a contribution chain?
9. How do these concepts map to Lean, Coq, Agda, Isabelle, and informal evidence without conflating BOMA and backend ontologies?

## 19. Epistemic status

```text
Construction graph distinct from reuse graph       SUPPORTED PROVISIONALLY
Contribution-to-Contribution dependency            SUPPORTED PROVISIONALLY
Multiple provenance sources                        SUPPORTED PROVISIONALLY
No forced Brick ordering                           SUPPORTED
Context-sensitive reuse                            SUPPORTED PROVISIONALLY
Contribution as independent ontology               OPEN
Final Brick/Contribution schema                    OPEN
```

No normative BOMA definition is established by this probe.
