# Contribution vs Brick Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test the hypothesis that `Brick` is the construction unit while a `Certified Contribution` is the reusable unit transferred between Bricks.

## 1. Question

Can we separate:

```text
what is constructed
```

from:

```text
what is safely reused
```

without losing provenance, logical requirements, or compatibility information?

Candidate model:

```text
Brick
  └── produces / exposes → Certified Contribution

Brick B
  └── consumes → Certified Contribution from A
```

This is not adopted as BOMA architecture. It is a testable hypothesis.

## 2. Test A — One Brick, multiple contributions

Construct a Brick `A` containing two commitments:

```text
X — intuitionistically certified
Y — classically certified
```

Export two contributions:

```text
C_X
C_Y
```

**Observation:** A consumer can use `C_X` without necessarily consuming `C_Y`.

**Result:** Treating the entire Brick `A` as the reusable unit would unnecessarily transfer logical information that is irrelevant to the consumer.

**Learning:** A Brick can be a construction boundary while its reusable outputs are finer-grained.

## 3. Test B — Consumer uses one contribution

Let `B` depend structurally on `A`, but consume only `C_X`.

```text
A
├── C_X : intuitionistic
└── C_Y : classical

B ──uses──→ C_X
```

**Result:** B can be evaluated against the requirements of `C_X` rather than inheriting all of A's requirements.

**Conclusion:**

```text
structural dependency on A
        ≠
consumption of every output of A
```

## 4. Test C — Same contribution consumed by multiple Bricks

Let:

```text
B₁ ──uses──→ C_X
B₂ ──uses──→ C_X
```

**Result:** The same certified contribution can support multiple consumers without duplicating its semantic origin.

**Learning:** Reuse is naturally modeled as a relation to a contribution rather than as a new dependency on the entire producing Brick.

This suggests a possible DAG:

```text
        A
       / \
     C_X C_Y
     / \
   B₁   B₂
```

rather than forcing:

```text
A → B₁
A → B₂
```

when the semantic dependency is actually narrower.

## 5. Test D — Contribution without provider import

Suppose `C_X` has:

```text
identity
commitment
certificate/evidence
logical requirement
provenance
```

A consumer can evaluate `C_X` using that exported contract without importing the complete internal structure of `A`.

**Result:** The conceptual model permits a reusable interface independent of the full provider Brick.

**Learning:**

```text
provider Brick
    ≠
consumer-visible contribution
```

The provider remains part of provenance.

## 6. Test E — Contribution invalidated or superseded

Suppose `C_X` is later discovered to have a defective guarantee.

If consumers reference the contribution by identity, the system can identify every consumer of `C_X` without treating every contribution of `A` as defective automatically.

**Result:** Fine-grained provenance and impact analysis become possible.

**Learning:** A contribution-level identity may be useful for change management and PDCA learning.

## 7. Test F — Same mathematical commitment, different certificates

Create:

```text
C₁: X + intuitionistic certificate
C₂: X + classical certificate
```

The commitments may be extensionally the same, but their reusable contracts differ.

**Result:** A contribution cannot be identified solely by its mathematical proposition/statement.

Candidate identity must account for at least:

```text
commitment
certificate/evidence
logical regime / requirements
provenance
```

The exact identity rule remains open.

## 8. Test G — Branch convergence

Consider:

```text
Trunk: intuitionistic

Branch:
  A
  ├── C_X : intuitionistically certified
  └── C_Y : classically certified
```

A convergence Brick `M` consumes only `C_X`.

**Result:** The contribution-level model permits `M` to be evaluated without automatically importing the branch's classical contribution `C_Y`.

This is cleaner than treating the entire branch history as a logical requirement of `M`.

**Important limitation:** This does not prove that `M` is intuitionistically admissible. Its own content and the guarantee of `C_X` must still be verified against the trunk context.

## 9. Negative control — Contribution with missing guarantee

Create:

```text
C_Z:
  commitment Z
  evidence present
  guarantee missing
```

**Result:** C_Z cannot be treated as a fully reusable certified contribution under the proposed model.

It may remain a recorded artifact or provisional contribution, but it lacks the consumer-facing contract required for safe reuse.

**Learning:** Reusability is not synonymous with existence of a proof artifact.

## 10. Negative control — Contribution with incompatible guarantee

Create:

```text
C_W:
  commitment W
  guarantee: intuitionistic
  evidence: actually requires classical principle P
```

**Result:** The contribution is defective even if W itself is mathematically valid in a stronger environment.

Its failure is specifically a **guarantee/evidence mismatch**.

This must remain distinguishable from:

```text
commitment contradiction
missing evidence
logical incompatibility
provenance failure
```

## 11. What the experiment supports

The following distinctions survived the tested cases:

```text
Brick
  = construction / organizational unit

Certified Contribution
  = reusable, consumer-facing unit

Dependency
  = structural relation between construction units

Consumption
  = semantic relation to a particular reusable contribution

Guarantee
  = contract governing safe reuse
```

These are provisional conceptual distinctions, not a final ontology.

## 12. What the experiment does NOT establish

It does not establish that every Brick must export a contribution.

It does not establish that a contribution must be smaller than a Brick in all cases.

It does not establish that contributions are independent mathematical objects.

It does not establish a final schema or identifier format.

It does not establish that backend proof objects should be exposed as BOMA contributions.

## 13. New architectural hypothesis

A promising model is:

```text
                    ┌──────────────┐
                    │    Brick A   │
                    └──────┬───────┘
                           │ produces
                 ┌─────────┴─────────┐
                 ▼                   ▼
              C_X                 C_Y
          certified-I          certified-C
                 │                   │
                 ▼                   ▼
              Brick B             Brick D
```

The graph therefore has two related but distinct layers:

```text
Construction graph
Brick ──depends_on──→ Brick

Contribution graph
Brick ──produces──→ Contribution
Brick ──consumes──→ Contribution
Contribution ──derived_from──→ Evidence
```

The two graphs may overlap, but should not be assumed identical.

## 14. Implication for Block

If a `Block` is later introduced as a grouping of Bricks, the contribution model suggests that a Block should not automatically become the smallest reusable unit.

Possible future role:

```text
Brick = construction unit
Block = grouping / composite construction
Contribution = reusable certified output
```

This preserves the user's original distinction between `Brick` and `Block` while preventing either term from carrying responsibilities it need not carry.

## 15. Open questions

1. Is a Contribution an entity in its own right or merely an interface view of a Brick?
2. Can one Contribution be produced jointly by multiple Bricks?
3. Can a Contribution depend on other Contributions without creating Brick-to-Brick dependency?
4. What is the minimum certificate needed for reuse?
5. How is a Contribution revoked, superseded, or versioned?
6. Can the same Contribution be reused across branches with different logical policies?
7. What exactly constitutes the consumer's "safe use" guarantee?
8. Should Contribution identity be content-based, provenance-based, or both?

## 16. Provisional conclusion

The experiment supports the hypothesis that BOMA may benefit from separating **construction** from **reuse**:

```text
Brick builds.
Contribution travels.
Guarantee governs reuse.
```

This formulation is intentionally provisional and should be challenged by further experiments before any normative definition is written.

## 17. Epistemic status

```text
Brick as construction unit                  SUPPORTED PROVISIONALLY
Contribution as reusable unit               SUPPORTED PROVISIONALLY
Brick dependency ≠ contribution consumption SUPPORTED
Contribution-level provenance               SUPPORTED PROVISIONALLY
Contribution-level logical requirements     SUPPORTED PROVISIONALLY
Block as grouping layer                     OPEN
Final contribution ontology                 OPEN
Final Brick schema                          OPEN
```
