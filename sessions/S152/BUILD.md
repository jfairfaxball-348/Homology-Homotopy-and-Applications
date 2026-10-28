# S152 BUILD — pinned exact-source diagnostics

- Baseline: remote main `de490c270c56820f067a79e6605392bbbb72a0a2`, tree `1681d616d24140d5d8261280c153a08d909527b4`; S151 PR #183 merged with two parents. Main pinned Lean #40683178115 SUCCESS and integrity #40683178221 SUCCESS.
- Scratch `fa481f3e644fb0204fdf38ea01b3d9b87a19ca85`: Lean #40691333015 FAILURE. `ModuleCat.hom_ext` / `LinearMap.ext` alone left the two positive-degree transport goals.
- Scratch `06b7e43303931d155f30f1b7a19219d95b704397`: Lean #40691710480 FAILURE. Rewriting positive `integerObject` branches in term context still left dependent cast applications.
- Scratch `95713fae7dfed8a9d940c22f8485d34db5fb641f`: pinned Lean #40692032018 SUCCESS; repository integrity #40692032025 SUCCESS. Three new cast-coherence lemmas in `C4/ShiftedDG.lean`. Only this genuinely green source is promoted.
- Further exploratory `379f41b2c2876dc688b222e1c3f8d2d6a38f8528`, run #40692341564, is diagnostic only: not a successful certificate on which this session relies.

Pinned toolchain: Lean 4 v4.35.0-rc2 and Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. Source admitted-proof scan, all OptionD targets, C4 targets and repository integrity succeed on the certified scratch. The final PR and merged-main check outcomes require separate live inspection; no future CI result is asserted here.

The actual square still has two transports:
`globalXComponent s (n+1) ≫ (integerShiftResolution (s+1)).d (n+1) n` versus `(integerShiftResolution s).d (n+1) n ≫ globalXComponent s n`, for `n ≥ s+1`. The algebraic core `regularDx_commute` is not the failure; dependent casts are. Whole-real model and metrics remain OPEN.
