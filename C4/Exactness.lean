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

/-! ### S147 scratch: transport local exactness through all three integer-object casts -/

/-- The actual positive `sc'` is the local periodic short complex up to
three explicit equalities of its nonnegative regular module objects. -/
noncomputable def positiveIntegerShortComplexIso (m : ℕ) :
    positiveShortComplex m ≅
      integerResolution.sc' ((m : ℤ) + 2) ((m : ℤ) + 1) (m : ℤ) := by
  let e₂ : integerObject ((m : ℤ) + 2) = ModuleCat.of B B :=
    integerObject_nonnegative _ (by omega)
  let e₁ : integerObject ((m : ℤ) + 1) = ModuleCat.of B B :=
    integerObject_nonnegative _ (by omega)
  let e₀ : integerObject (m : ℤ) = ModuleCat.of B B :=
    integerObject_nonnegative _ (by omega)
  refine ShortComplex.isoMk (eqToIso e₂.symm) (eqToIso e₁.symm)
    (eqToIso e₀.symm) ?_ ?_
  · dsimp [positiveShortComplex, integerResolution]
    simp [ChainComplex.of_d, integerDifferential,
      show (0 : ℤ) ≤ (m : ℤ) + 1 by omega,
      show (0 : ℤ) ≤ (m : ℤ) + 2 by omega,
      show ((m : ℤ) + 1).toNat = m + 1 by omega,
      Category.assoc]
  · dsimp [positiveShortComplex, integerResolution]
    simp [ChainComplex.of_d, integerDifferential,
      show (0 : ℤ) ≤ (m : ℤ) by omega,
      show (0 : ℤ) ≤ (m : ℤ) + 1 by omega,
      show ((m : ℤ)).toNat = m by omega,
      Category.assoc]

/-- Actual positive integer exactness, conditional only on the proven local result. -/
theorem integerResolution_exactAt_positive (n : ℤ) (hn : 0 < n) :
    integerResolution.ExactAt n := by
  obtain ⟨m, rfl⟩ : ∃ m : ℕ, n = (m : ℤ) + 1 := by
    refine ⟨(n - 1).toNat, ?_⟩
    omega
  apply (integerResolution.exactAt_iff'
    (i := ((m : ℤ) + 2)) (j := ((m : ℤ) + 1)) (k := (m : ℤ))
    (by simp [ChainComplex.prev]) (by simp [ChainComplex.next])).2
  exact ShortComplex.exact_of_iso
    (positiveIntegerShortComplexIso m) (positiveShortComplex_exact m)

/-- Actual positive-degree Mathlib homology vanishes in all positive integers. -/
theorem integerResolution_homology_isZero_positive (n : ℤ) (hn : 0 < n) :
    Limits.IsZero (integerResolution.homology n) :=
  (integerResolution_exactAt_positive n hn).isZero_homology


end C4
