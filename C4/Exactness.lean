module
public import C4.Augmentation
public import Mathlib.Algebra.Homology.ShortComplex.ModuleCat

@[expose] public section

/-!
# Typed categorical exactness for the periodic C4 resolution
-/

namespace C4

open CategoryTheory

/-- The actual ModuleCat short complex at each positive periodic degree. -/
def positiveShortComplex (n : ℕ) : ShortComplex (ModuleCat B) :=
  ShortComplex.mk (differential (n + 1)) (differential n) (differential_square n)

/-- The positive short complex is categorically exact at every natural degree. -/
theorem positiveShortComplex_exact (n : ℕ) :
    (positiveShortComplex n).Exact := by
  apply (ShortComplex.moduleCat_exact_iff_range_eq_ker _).2
  change LinearMap.range (coefficientLinear (Periodic.d (n + 1))) =
    LinearMap.ker (coefficientLinear (Periodic.d n))
  exact (positiveLinear_ker_eq_range n).symm

/-- Actual augmentation short complex in the category of B-modules. -/
def augmentationShortComplex : ShortComplex (ModuleCat B) :=
  ShortComplex.mk (differential 0) residueModuleMorphism
    differential_residueModuleMorphism

/-- Categorical exactness of the first boundary followed by the residue map. -/
theorem augmentationShortComplex_exact : augmentationShortComplex.Exact := by
  apply (ShortComplex.moduleCat_exact_iff_range_eq_ker _).2
  change LinearMap.range (coefficientLinear (Periodic.d 0)) =
    LinearMap.ker residueLinear
  exact residueLinear_ker_eq_range.symm

/-! ### S146: honest integer-indexed negative homology boundary -/

/-- Every actual negative-degree object is the zero B-module. -/
theorem integerObject_isZero_negative (n : ℤ) (hn : n < 0) :
    Limits.IsZero (integerObject n) := by
  rw [integerObject_negative n hn]
  exact ModuleCat.isZero_of_subsingleton _

/-- The complete integer-indexed complex is exact at each negative degree,
including degree -1, since those are actual zero objects. -/
theorem integerResolution_exactAt_negative (n : ℤ) (hn : n < 0) :
    integerResolution.ExactAt n := by
  apply HomologicalComplex.ExactAt.of_isZero
  change Limits.IsZero (integerObject n)
  exact integerObject_isZero_negative n hn

/-- Actual Mathlib homology of the integer complex vanishes at each negative degree. -/
theorem integerResolution_homology_isZero_negative (n : ℤ) (hn : n < 0) :
    Limits.IsZero (integerResolution.homology n) :=
  (integerResolution_exactAt_negative n hn).isZero_homology

end C4
