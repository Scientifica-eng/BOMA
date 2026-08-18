# N-BLOCK-007 — Accepted Natural-Number Core Interface

- **Operational Status:** **ACTIVE — ACCEPTED N-CORE EXPORT**
- **Epistemic Status:** **MIXED — EXPLICIT FORMALIZATION COMMITMENTS + DERIVED CERTIFIED PACKAGE**
- **Acceptance:** `NAC-15 = ACCEPT`
- **PDSA:** `PDSA-N-012`
- **Depends on:** `N-BLOCK-001..006`, `N-J-001`, `N-J-002`, `N-DP-001`, `N-DP-002`

## Purpose

Provide one canonical downstream interface for the accepted Stage-One R-B realization of the natural-number core while preserving the internal Brick/Block/Junction DAG that produced it.

This Block is a packaging/export layer. It does not erase or replace its producers.

## Exported core

```text
carrier                 N_BOMA
base                    z
successor               s
formal identity          R-B / Lean identity interface
dependent elimination   Sort-polymorphic
induction               proposition-valued adequacy
generatedness           no-junk certificate
no-confusion             s(n) ≠ z; s(a)=s(b) ⇒ a=b
recursion                targets Type u
recursion equations      base / successor computation
recursion uniqueness     pointwise
pointwise initiality     Stage-One Type-0 unary-algebra scope
TCT bridge               faithful selected-presentation realization
history correspondence   structural ancestry, non-numerical
standardness             same-universe pointwise-initial comparison
```

## Acceptance evidence

```text
N-J-001       PASS / RESOLVED
N-J-002       PASS / RESOLVED
NAC-01..14    PASS
NAC-15        ACCEPT
V5 run        32163771789
Lean          4.32.1
```

Closure record:

`LAB/PDSA/PDSA-N-012_N_CORE_CLOSURE.md`

## Scope

This Block is accepted **under the Stage-One R-B formalization route** and its explicit universe/sort policy.

It is not asserted that every foundational regime must realize the natural numbers through the same formal commitments.

Alternative regimes remain preserved for later branch comparison.

## Relation to the pre-numerical root

The path remains traceable:

```text
pre-numerical TCT
  → successor-like construction
  → formalization Decision Point
  → formal unary kernel
  → parallel N-Core branches
  → verified reconvergence
  → integration gate
  → accepted N-Core export
```

The global formal carrier is a declared formalization commitment, not a theorem forced by TCT alone.

## Naming

Preferred precise name:

> **BOMA Stage-One R-B Natural-Number Core**

`ℕ_BOMA` may be used as a concise symbol where this scope is declared.

Plain `ℕ` may be used in later mathematical exposition only when the adopted realization scope is clear; it must not imply that addition, multiplication, or order have already been constructed.

## Deliberately absent

This Block does not yet export:

```text
addition
multiplication
order
semiring structure
arithmetic laws dependent on those operations
integers
```

Those are downstream constructions and require their own Bricks/Blocks/PDSA evidence.

## Sensitivity

Reopen acceptance if:

```text
N-DP-001 or N-DP-002 changes materially;
N-J-001 or N-J-002 is reopened;
formal V5 evidence for an owning claim is invalidated;
TCT ancestry/bridge assumptions change;
post-V5 commitment audit discovers a material unrecorded premise.
```
