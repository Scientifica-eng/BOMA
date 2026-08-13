# CAL-EXP-003 — Structural Equivalence of Finite Construction Histories

**Cycle:** `CAL-001`  
**Scope:** `B-009`–`B-012`  
**Status:** Provisional result

## 1. Intention / Goal

Test whether the comparison previously expressed as equality of numerical depths can be reformulated without using an already constructed notion of natural number.

## 2. Problem under Audit

The earlier formulation compared histories by their number of extension steps:

```text
length(H₁) = length(H₂)
```

This risks circularity because the equality of lengths can itself be interpreted as a numerical comparison.

## 3. Alternative Construction

Consider two construction histories:

```text
H₁: s₀ → s₁ → ... → S
H₂: t₀ → t₁ → ... → T
```

Instead of counting their steps, ask whether there exists a structure-preserving correspondence between their stages that:

1. maps the initial stage of `H₁` to the initial stage of `H₂`;
2. maps each extension-related stage to the corresponding extension-related stage;
3. preserves the predecessor/extension relation throughout the histories;
4. is reversible on the stages occurring in the two histories.

Schematically:

```text
H₁: s₀ → s₁ → s₂ → ... → S
     ↕    ↕    ↕          ↕
H₂: t₀ → t₁ → t₂ → ... → T
```

The correspondence is judged by structural preservation, not by a pre-existing numerical measure.

## 4. Result

For finite histories generated solely by the initial-stage rule and the extension rule, structural correspondence provides a non-numerical way to identify histories of the same constructional form.

The key point is that the comparison can be made locally and relationally: initial corresponds to initial, and an extension corresponds to an extension. No numerical label needs to be assigned to the stages.

This does **not** yet prove that structural equivalence has all the formal properties required of an equivalence relation in a fully developed mathematical framework. Those properties must be treated as a subsequent formalization step.

It also does not yet construct a number. It only removes one source of circularity from the route toward abstraction.

## 5. Important Limitation

The phrase "finite history" still needs careful handling. At this stage it means a history actually produced by the finite application of the chosen construction protocol, not an independently defined set-theoretic class of all finite sequences.

Thus we must not import formal sequence theory, cardinality, or induction merely by using the word "finite".

## 6. Decision

Accept structural equivalence of construction histories as the preferred candidate replacement for numerical equality of depths.

Suspend the numerical formulation of `B-013`/`B-014` pending reformulation.

The next task is to determine whether the extension operation respects this structural equivalence and therefore induces a well-defined operation on the resulting abstract classes.

## 7. Epistemic Status

**Provisional structural repair.**

The repair removes the most direct numerical comparison from the argument, but the underlying formal notion of finite construction history remains to be developed without importing set-theoretic machinery prematurely.
