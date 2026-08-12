# REVERSE-012 — Minimal Boundary from Generated Horizon to Formal Domain

**Path:** `REVERSE-001`  
**Status:** Provisional result

## 1. Intention / Goal

Identify the weakest additional commitment needed to pass from a generated, referable constructional horizon to a formal mathematical domain, without importing the natural numbers themselves.

## 2. Starting Point

The reverse path has reached an organized horizon of referable carriers:

```text
initial carrier
      ↓ E
next carrier
      ↓ E
next carrier
      ↓
...
```

The forward and reverse paths converge at this level.

## 3. Candidate Boundary Commitments

### A — Add membership

Introduce a relation of the form `x ∈ D` and declare a domain `D`.

This immediately creates a set-theoretic layer that was not present in the constructional horizon.

**Assessment:** sufficient for formalization, but stronger than the minimum currently justified.

### B — Add extensional identity/equality

Declare that carriers are mathematical objects with an identity criterion and an equality relation.

This permits substitution and formal reasoning, but it does not by itself determine which carriers constitute the domain.

**Assessment:** necessary for many formal frameworks, but insufficient alone.

### C — Add a domain-selection principle

Declare that the mathematical domain consists exactly of the carriers accepted by a specified formation rule, while leaving the implementation of that domain representation open.

This captures the needed boundary idea without immediately requiring a set-theoretic representation.

**Assessment:** currently the weakest coherent candidate.

## 4. Result

The experiment suggests that the first genuinely new commitment after the generated horizon is not necessarily "set membership" itself. The weaker commitment is a **domain-selection/formation principle** that determines which constructional carriers count as mathematical objects of the intended domain.

In schematic form:

```text
constructional horizon
        ↓
formation/acceptance rule
        ↓
formal domain D
```

The principle must answer two questions:

1. which carriers are admitted;
2. whether admission is stable under the operations/relations that define the intended structure.

This is stronger than merely keeping a construction log, but weaker than choosing a particular set-theoretic encoding.

## 5. Important Limitation

Calling this a "domain" already uses mathematical language. Therefore the experiment does not claim that domainhood has been derived from pre-mathematical material. It identifies the **minimum kind of commitment that appears unavoidable at the boundary** under the current analysis.

Thus the project may have reached a legitimate point of explicit foundational choice:

> choose a formation principle turning an organized generated horizon into the carrier domain of a formal structure.

## 6. Decision

1. Accept **domain formation/selection** as the current leading candidate for the first explicit formalizing commitment.
2. Do not yet commit to set membership as the primitive representation of the domain.
3. Do not yet identify the domain with `N`.
4. Preserve the generated-horizon analysis as pre-domain structure.
5. Investigate whether a weak formation principle can be stated in a way that is invariant under alternative representations (set-theoretic, type-theoretic, categorical, or other).

## 7. Next Experiment

`REVERSE-013` should test whether the same formation principle can define the intended domain without introducing numerical labels, and whether the resulting domain plus the existing initial/transition structure is sufficient to recover a characterization of the natural numbers.
