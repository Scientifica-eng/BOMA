# Brick B-008 — General Finite Extension Schema

**Status:** Provisional
**Type:** Generalized chosen constructional rule
**Previous Brick:** `B-007`
**Experiment:** `EXP-029`

## Definition

For any already completed finite constructional stage `S` produced under the current rules, the extension operation `E` specifies a further stage `S⁺` such that:

1. all referable tokens available in `S` remain available in `S⁺`;
2. exactly one new provenance-distinguished referable token is added;
3. the new token is associated with the new extension occurrence.

Schematic form:

```text
S ──E──► S⁺
```

## Why this Brick was chosen

`EXP-028` demonstrated the pattern for the first tested stages. `EXP-029` promotes that observed pattern to an explicit rule schema applicable to any completed finite stage.

This is a deliberate generalization, not a theorem derived from the earlier finite observations.

## Current commitments

1. The extension rule is applicable to any completed finite stage within the construction.
2. Extension preserves all previously available referable tokens.
3. Extension adds exactly one new provenance-distinguished token.
4. The rule is finite-stage based.
5. No completed infinite object is assumed.
6. No natural-number labels are assumed.
7. No induction principle is assumed.
8. No successor function is assumed, although a successor-like relation may emerge from the rule.

## What the Brick gives us

A general growth schema:

```text
S₀ → S₁ → S₂ → S₃ → ...
```

where each arrow is justified by the chosen extension rule when the preceding stage has been constructed.

The ellipsis is schematic. It does not assert the existence of an infinite completed object.

## What remains open

We must investigate whether the stages can themselves be treated as referable constructional results and whether each extension canonically relates a stage to its immediate predecessor.

If so, a successor-like relation may emerge as a derived structural pattern. Whether that pattern can support the natural numbers remains to be tested.

## Epistemic status

**Provisional / generalized chosen rule.**
