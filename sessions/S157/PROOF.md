# S157 PROOF — genuine all-integer shifted h/z component equations

Entry main 5f50dce56d60426016aafc6fd625b3bb8c2461dc, tree da5b18623d757b56c25b8c2eaf572269fffae1ae; S156 ordinary two-parent PR #188 merged; pinned main checks green.

1. C4.globalHComponent_identity (s n : ℤ): actual shifted ModuleCat B degree-one h component identity Dh=x² at all integers (positive regular case via regularCastTwoPathsExtra and regularDh_xx, boundary via S155).
2. C4.shiftedDifferential_regular_indices (s i j : ℤ) (hij : i=j+1) (hj:s≤j): genuine general adjacent-index shifted differential as coefficient d with source and target regular-object casts.
3. C4.regularCastFourPathsExtra: transports four actual categorical additive paths across nine regular-module identifications and three final nondefinitional integer-shift equalities.
4. C4.globalZComponent_identity (s n : ℤ): actual degree-two secondary z identity Dz=xh+hx at all integers (positive via regularDz_xh_hx and generic four-path transports; truncation boundary via S155).

Exact successful scratch commit 67c2b68eb119a1e961fe94782c9474006338cb88; pinned OptionD+C4 Lean #40883221948 SUCCESS and integrity #40883221471 SUCCESS. No admitted proofs. These are genuine component identities but not yet full Mathlib Homotopy packages or the arbitrary global fourfold and entire-real quantitative metric theorem.
