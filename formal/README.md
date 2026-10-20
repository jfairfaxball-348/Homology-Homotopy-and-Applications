# Formal verification — Option D incremental Lean (S125 checkpoint, 20 October 2026)

Pinned Lean `leanprover/lean4:v4.35.0-rc2` and Mathlib SHA `065356127b1dc0016f66b7283ce0ce2c4055aa55`; root `lake build OptionD` includes the entire chain.

D1 **now compiled in required dimension N−1**, no sorry/admit/custom axioms, all N≥2, all symmetric finite graphs. `OptionD/MinimalPoints.lean` proves `d1_factor_row_sum_zero`, `d1_exists_minimal_gram_points` and `d1_exists_minimal_rips_flag`: positive symmetric square root B, rows and columns zero on constants, Euclidean columns in hyperplane, exact orthogonal complement isometry onto `EuclideanSpace ℝ (Fin (N−1))`, Gram entries G, squared norms D and strict radius-one Rips-clique equivalence for every finite subset. The imported `FullPoints` and `RealizedFlag` files contain tiny exported cross-module coordinate/constructor APIs. Pinned hosted proof scratch #39399818371 SUCCESS, integrity #39399818207 SUCCESS; final PR/main checks require separate observation.

D2 Boolean two-height births and native ℝ³ filtration are still OPEN. Universal coherent attaching theorem D6, Hopf application D7 and stability D8 are still OPEN for Lean, and no complete Option D proof has been kernel-checked. G2 originality/HHA remains owner-deferred. No Palomar Challenge/Solution/comparator/preflight/registration, no manuscript or publication.

Read `sessions/S125/`, `formal/OPTION_D_FORMALIZATION_PLAN.md`, and the binding FUTURE S126 `authoritative/NEXT_SESSION_PROMPT.md`.

## S126 checkpoint (20 October 2026)
`OptionD/BirthGrades.lean` is now pinned-Lean certified (scratch #39418834637 SUCCESS; integrity #39418834532 SUCCESS). It proves B₂ birth-label order, minimal grades, exact selected vertex-set meets, face closure, grade/radius monotonicity and ALL-grade radius-one induced strict Rips clique equality on actual Euclidean R^(N−1) points. `RealizedFlag.lean` exports the strict-Rips constructor/eliminator across module boundaries. Genuine real-indexed ℝ³ filtration and exact a/b endpoints are S127 targets, NOT already certified. D6/D7/D8 remain unformalised, G2 owner-deferred; no Palomar or publication.
