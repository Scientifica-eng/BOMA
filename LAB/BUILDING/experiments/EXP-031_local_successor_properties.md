# EXP-031 — Local Successor Properties

**Context:** `B-009`  
**Status:** Provisional

## 1. Intention / Goal

Test the local structural properties of the immediate-extension relation between referable finite stages.

## 2. Experiment

For a completed stage `S`, apply the chosen extension schema `E` and record the resulting stage `S⁺`.

Test two questions:

1. Is there one designated next stage produced by the rule?
2. For a non-initial stage `S⁺`, is there one designated immediately preceding stage `S` in its recorded construction history?

## 3. Result

Relative to the chosen constructional rule, the next-stage designation is unique: a given completed stage is extended by one specified application of `E`, producing one designated next stage.

For each non-initial stage produced by this process, the construction history records the immediately preceding stage from which it was obtained.

Thus the relation has the following local form:

```text
s₀ → s₁ → s₂ → s₃ → ...
```

with one designated outgoing extension from each constructed stage and one recorded immediate predecessor for each non-initial stage.

However, these properties are relative to the chosen constructional history. They do not yet establish a global successor function on an independently given domain, nor do they establish that every stage has a successor in a completed infinite domain.

## 4. Decision

Accept the local immediate-extension structure as a provisional structural result and create a Brick recording it.

The relation may now be described as **successor-like**, but the term `successor` remains provisional until the relevant domain and its axioms are explicitly constructed.

## 5. Epistemic Status

`Provisional structural result`

## 6. Next Cycle

Investigate the initial stage. Determine what makes `s₀` initial in the construction and whether its characterization can provide the basis for a zero-like object without simply declaring `s₀ = 0`.
