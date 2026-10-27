# S146 PROOF — actual negative integer homology, positive bridge blocked

## Compiled categorical theorem
In C4/Exactness.lean, `integerObject_isZero_negative n hn` identifies every actual negative integer object with the zero B-module `ModuleCat.of B (Fin 0 → B)`; `integerResolution_exactAt_negative n hn` invokes Mathlib `HomologicalComplex.ExactAt.of_isZero` on the real `integerResolution`; `integerResolution_homology_isZero_negative n hn` invokes `HomologicalComplex.ExactAt.isZero_homology`. The quantifier is ALL n:ℤ with n<0, including -1. No admitted proof.

## Unclosed typed positive bridge
The mathematically exact regular-module short complexes were already certified in S145. Attempts at `integerResolution.ExactAt ((m:ℤ)+1)` on scratch used Mathlib `exactAt_iff'` and expanded `sc'`. The final compiler output on 2c602f0d (hosted Lean #40580404408, FAILED) shows precisely one remaining error at C4/Exactness.lean:77:2:
```
Type mismatch: After simplification, term
  Eq.symm (positiveLinear_ker_eq_range m)
has type
  (coefficientLinear (Periodic.d (m+1))).range =
    (coefficientLinear (Periodic.d m)).ker
but is expected to have type
  (ModuleCat.Hom.hom (differential (m+1)) ∘ₗ ModuleCat.Hom.hom (eqToHom ...)).range =
    (ModuleCat.Hom.hom (differential m) ∘ₗ ModuleCat.Hom.hom (eqToHom ...)).ker
```
Mathematically these are transported along identity casts, but Lean has not accepted a typed transport. The failed variant is NOT merged and NOT called formal proof. Next bridge should explicitly build `ShortComplex.isoMk` using degreewise eqToIso casts and `ShortComplex.exact_of_iso`, avoiding unproved definitional equality. H0, genuine QuasiIso and shifted universal dg remain OPEN.

The frozen full-real both-lane metric remains INTERNAL and not compiled.
