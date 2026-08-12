# REVERSE-016 — Structural Identity from Transition Behavior

**Status:** Provisional result  
**Path:** Reverse engineering

## 1. Intention / Goal

Test whether stable re-identification of abstract carriers can be obtained from preserved structural behavior alone, after provenance has been removed, without importing a ready-made equality relation.

## 2. Experiment

Consider carriers `c` and `d` whose construction provenance has been deliberately forgotten.

Test the following candidate for structural sameness:

> `c ~ d` when the carriers occupy the same structural role in the transition organization and their corresponding transitions remain structurally matched.

Then apply the transition operation:

```text
c ~ d
│   │
E   E
│   │
▼   ▼
E(c) ~ E(d)
```

The comparison is behavioral/structural rather than a primitive equality judgement.

## 3. Result

A stable notion of **structural sameness** can be described operationally, provided that the correspondence preserves the transition role and remains stable under further transition.

This does not yet amount to a formal equality relation. In particular, reflexivity, symmetry, transitivity, substitution, and extensionality have not been imported or proved as a complete mathematical package.

The experiment therefore supports a weaker statement:

> After provenance removal, a carrier may still be re-identified by its invariant structural role within the transition system.

This is stronger than mere referability and weaker than full mathematical identity.

## 4. Important Distinction

The project must keep three notions separate:

```text
provenance identity
    = this carrier by its construction history

structural sameness
    = this carrier occupies the same preserved role

formal equality
    = an explicitly adopted mathematical relation
```

The first can be carried by history. The second can emerge from behavioral invariants. The third remains a potential later commitment.

## 5. Consequence for the Construction

This result weakens the claim that a mathematical equality relation must be the first bridge from pre-mathematics to mathematics.

A possible route is now:

```text
construction history
    ↓
referable carrier
    ↓
provenance removal
    ↓
structural sameness
    ↓
formal abstraction
```

The exact point where `structural sameness` must be upgraded to a formal relation remains unresolved.

## 6. Decision

Accept structural sameness as a provisional intermediate concept.

Do not rename it equality.

Do not impose the standard laws of equality at this stage.

The next experiment should test whether structural sameness supports the minimal compositional operations needed to abstract a whole family of carriers without choosing a particular mathematical foundation.