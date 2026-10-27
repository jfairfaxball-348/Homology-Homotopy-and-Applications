# S145 PROOF — genuinely categorical augmented exactness

`C4.positiveShortComplex (n : ℕ)` is a real `ShortComplex (ModuleCat B)` built from `differential (n+1)` and `differential n`. `C4.positiveShortComplex_exact n` proves its Mathlib `.Exact` universally, by `ShortComplex.moduleCat_exact_iff_range_eq_ker` and the existing compiled `positiveLinear_ker_eq_range n`. Pinned scratch source `515129075c0bbbb444d233fc716391924912858b`, Lean #40575179311 SUCCESS.

`C4.augmentationShortComplex` is the honest `ShortComplex` with `differential 0` followed by `residueModuleMorphism`; `differential_residueModuleMorphism` is the zero-composite certificate. `C4.augmentationShortComplex_exact` uses the categorical iff and `residueLinear_ker_eq_range`. Pinned scratch `85386ec4eeca4f6cf94bfb608a6bd28e12a01f64`, Lean #40575347270 SUCCESS, integrity #40575347115 SUCCESS.

**Not certified:** exactness of the explicit *integer-indexed* complex in Mathlib `ExactAt`, categorical H₀/Hₙ, `QuasiIso augmentationChainMap`, globally shifted dg all-choice fourfold or any whole-ℝ distance. The frozen written theorem is not silently promoted.
