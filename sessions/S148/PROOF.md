# S148 PROOF — real H₀ and induced augmentation quasi-isomorphism

Entry pinned live remote `main` `23729d785d66f1a34f3bbb8a9fae74e89f32b3ef`, tree `f93d2e550e44f6021b6acd5a927be80fcdea5717`; S147 ordinary two-parent merge PR #178 parent SHAs `a6009d405f07fb374bea289e3cbf375468563f83` and `27a39e76a1484c7484ec804760300e016ddd5127`. Main independently passed Lean #40590419160 and integrity #40590418891. Toolchain Lean4 v4.35.0-rc2; Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55; dependencies unchanged.

## Genuine typed results — source `c22d3890b77b753476f5731cc393edc9f1baf7e5`

1. The actual degree-zero `integerResolution.sc' 1 0 (-1)` differential is identified with `differential 0` by category-morphism extensionality, linear-map extensionality and definitional reduction `rfl`; this directly resolves the S147 `eqToHom` blocker without dependent-index rewrites.
2. `integerResolution_homology_zero_iso` composes Mathlib `homologyIsoSc'`, `asIsoHomologyι`, and the universal cokernel uniqueness supplied by `residueModule_cokernel`. This is the actual `integerResolution.homology 0 ≅ residueModuleObject`.
3. `residueComplex_exactAt_nonzero` uses the actual zero object at all n≠0. `augmentationChainMap_quasiIsoAt_nonzero` uses Mathlib `quasiIsoAt_iff_exactAt'` to prove the genuine induced-map property with S146 negative and S147 positive exactness for all n≠0.
4. `augmentationChainMap_quasiIsoAt_zero` invokes the actual `sc'` comparison `quasiIsoAt_iff'` and `ShortComplex.quasiIso_iff_of_zeros'`. The middle three-term sequence is `augmentationShortComplex_exact` and the augmentation component is epic by `residueModuleMorphism_epi`.
5. `augmentationChainMap_quasiIso` is explicitly `QuasiIso augmentationChainMap` at **all n : ℤ**, not merely a family of objectwise homology identifications.

All declarations above compiled in pinned Lean #40657026979 SUCCESS; static integrity #40657026873 SUCCESS. Earlier scratch #40656381151 FAILED because `rw [ChainComplex.of_d]` cannot rewrite the casted 1→0 equality under implicit transparency; it is not reused as a certificate. No sorry/admit/axiom or dependency changes.

**Not certified:** global shifted P[0]..P[4], B-linear dg x/h/z maps/homotopies and universal all-choice fourfold; entire-real derived (L2) and strict two-lane metric (L3). These remain mathematical/documentary work only.
