# S126 BUILD — observed hosted Lean evidence
- Entry main 0b9b97276585de2ecb512940acfbc07359d704b2, tree 54d3a5cd29f796b2f61b6d54227d7c7970acff71; preflight independent cold-main Lean #39400816592 SUCCESS and integrity #39400816605 SUCCESS.
- Pinned leanprover/lean4:v4.35.0-rc2, Mathlib SHA 065356127b1dc0016f66b7283ce0ce2c4055aa55; unchanged manifest, command lake build OptionD.
- Scratch branch scratch/S126-boolean-flag-build: initial module-import build #39418577781 FAILURE due malformed comment, abstract imported d1 strict Rips predicate, and per-vertex meet-projection syntax; see FAILURE_AND_LESSON_LEDGER.
- Exact repaired scratch source SHA 5b10b2589aab51d34ba3c4b728b86272418d3e95: pinned hosted Option D Lean #39418834637 SUCCESS, repository integrity #39418834532 SUCCESS. Source scan excludes sorry/admit/custom axioms.
- No local Lean/Lake compiler was available; do not assert local cold build or Palomar preflight.
- Final S126 authored PR checks and post-merge main checks MUST be verified independently during actual PR integration; scratch proof does not substitute for them.
