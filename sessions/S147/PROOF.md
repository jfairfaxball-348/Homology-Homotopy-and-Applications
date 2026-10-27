# S147 PROOF — integer sc' isomorphism and genuine cokernel

Entry base `a6009d405f07fb374bea289e3cbf375468563f83`; verified original two-parent S146 merge, main Lean #40581364381 and integrity #40581364662 SUCCESS.

## Fully certified proof (source `e9898c401a25037a8d3862f88ef27bbb4e347bb5`)

1. For arbitrary `m : ℕ`, three actual `integerObject_nonnegative` equalities (`m+2`, `m+1`, `m`) give an `eqToIso` on each object. `positiveIntegerShortComplexIso` constructs a **genuine** `ShortComplex.isoMk` between the local periodic sequence and `integerResolution.sc' ((m:ℤ)+2) ((m:ℤ)+1) (m:ℤ)`. The morphism equations normalize `ChainComplex.of.d` without dependent-index rewrites; the two `eqToHom` conjugations match precisely.

2. `integerResolution_exactAt_positive (n : ℤ) (hn : 0 < n)` writes `n=(m:ℤ)+1`, invokes Mathlib `exactAt_iff'` with actual adjacent integer objects, and transports S145 `positiveShortComplex_exact m` through `ShortComplex.exact_of_iso`. `integerResolution_homology_isZero_positive` invokes `ExactAt.isZero_homology` on actual Mathlib homology. S146's `integerResolution_exactAt_negative` and `integerResolution_homology_isZero_negative` remain preserved, including -1.

3. `residueModuleMorphism_epi` derives category `Epi` from `residueLinear_surjective`; `residueModule_cokernel` applies the *actual* augmentation short-complex exactness `augmentationShortComplex_exact.gIsCokernel` with the explicit epi of `augmentationShortComplex.g`. This is a genuine colimit/cokernel universal-property certificate.

## The unclosed exact H₀ goal

Scratch `f7b59c0a53b9d5ad6ecfd4a779f2a6db40a5885c` pinned Lean run #40589338567 FAILED **only** at `C4/Exactness.lean:140:36` while attempting `integerResolution_homology_zero_iso`. The precise remaining goal after simplification:
```lean
⊢ eqToHom ⋯ ≫ eqToHom ⋯ ≫ differential 0 = differential 0
```
The two morphisms transport `integerObject 1` and `integerObject 0` to the regular B-module at concrete degree zero. Do not revive this scratch as a certificate. Mathlib `ShortComplex.asIsoHomologyι`, `opcyclesIsCokernel`, `IsColimit.coconePointUniqueUpToIso`, and `HomologicalComplex.homologyIsoSc'` were used in the failed fully typed downstream draft; only the displayed `hf` equation blocked its elaboration. Consequently neither genuine H₀ nor `QuasiIso augmentationChainMap` is installed in the green source. No proof by rebranding abstract B-linear kernel/range equality as homology is allowed.

No shifted dg maps/homotopies or full-real bounds were attempted without the prerequisite entire homology/QuasiIso, consistent with owner order. No sorry, admit, axiom, dependency change or weakened quantifier.
