# S175 closeout — full C4 Lean certificate over the group algebra

The owner invoked S175 on 3 November 2026. The frozen first-paper formalisation is complete.

`C4.c4_distance_separation_groupAlgebra` proves `dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4 ≤ dHI(F,0) ≤ 5/2` over `MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))`. It applies to every localisation of whole real diagrams at objectwise quasi-isomorphisms. The strict homotopy metric allows arbitrary whole-diagram replacement zigzags of both lanes, including nonzero acyclic replacements of zero.

`C4.groupAlgebraEquiv` identifies the truncated presentation with the literal group algebra. The generator goes to `1 + g` and the cube goes to the norm element. The module equivalence carries the entire real diagram and its zero lane to the new coefficients. It preserves the canonical underlying 𝔽₂ homology, compares the lifted translations, and carries all replacement zigzags in both directions. The manuscript and crosswalk use the same certified proof routes and definitions.

| Evidence | Value |
|---|---|
| Entry main | `956859c22a4af7754e58eb562f7cdd5abb10b75e` |
| Proof pull request | [PR #217](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/pull/217) |
| Exact proof head and tree | `cb033fb883905bd2be921c2ccd9f4320df91c4d1`, `4367f835b2b42543be88c6a78471d7ff7dcbfd6d` |
| Exact-head PR CI | Lean #41596661062 and repository integrity #41596661058 succeeded |
| Ordinary merge | `274216e07e1bceda8c31945beb71921f342bb566` with parents `956859c22a4af7754e58eb562f7cdd5abb10b75e` and `cb033fb883905bd2be921c2ccd9f4320df91c4d1`, and proof tree `4367f835b2b42543be88c6a78471d7ff7dcbfd6d` |
| Independent merged-main CI | Lean #41597179634 and repository integrity #41597179773 succeeded |
| Full local check | Pinned `lake build`, C4 and preserved OptionD, 9017 jobs. Source scan, repository and handoff validators, and ten regression tests passed. |
| Printed axioms | `[propext, Classical.choice, Quot.sound]` for the ring equivalence, its two identities and the full group-algebra theorem |

## NEXT_SESSION_HANDOFF

- Next session is S176 (FUTURE, UNEXECUTED).
- Canonical prompt is authoritative/NEXT_SESSION_PROMPT.md.
- The frozen first-paper formalisation is complete. A separate owner instruction sets the scope of S176.
