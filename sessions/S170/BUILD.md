# S170 BUILD — pinned reproducibility

Entry main: `c7e770215939d1efb764dd35d0e62cc2c1fb405c` (S169 merged). Source commit `a7b98bac3eee9513ce1b3381af0bf91bb54af0b2`; branch `s170-critical-acyclic-lane`; PR #204. Pinned Lean 4.35.0-rc2 / pinned Mathlib revision from committed manifest.

- PR pinned full Lean build (Option D and C4): GitHub workflow run `41058091750` — **PASS** on source commit.
- Repository integrity: GitHub workflow run `41058091795` — **PASS** on source commit.
- Several earlier compiler-feedback builds failed on dependent index/type reductions; their results have not been misreported as passing.
- The S170 handoff/docs commit and the final merged main SHA receive separate checks. A branch or PR alone is not proof of a verified merge.

Certifies only the statements in `C4/NonzeroAcyclicRealLane.lean`, not the manuscript's full metric theorem.
