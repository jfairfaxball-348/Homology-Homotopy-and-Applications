module
public import C4.Augmentation
public import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
public import Mathlib.Algebra.Homology.QuasiIso

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
  · change (eqToHom e₂.symm) ≫
      (ChainComplex.of.d integerObject integerDifferential ((m : ℤ) + 2) ((m : ℤ) + 1)) =
        differential (m + 1) ≫ (eqToHom e₁.symm)
    simp [ChainComplex.of.d,
      show ((m : ℤ) + 2) = ((m : ℤ) + 1) + 1 by omega,
      integerDifferential,
      show (0 : ℤ) ≤ (m : ℤ) + 1 by omega,
      show (0 : ℤ) ≤ (m : ℤ) + 2 by omega,
      show ((m : ℤ) + 1).toNat = m + 1 by omega,
      Category.assoc, e₂, e₁]
  · change (eqToHom e₁.symm) ≫
      (ChainComplex.of.d integerObject integerDifferential ((m : ℤ) + 1) (m : ℤ)) =
        differential m ≫ (eqToHom e₀.symm)
    rw [ChainComplex.of_d]
    simp [integerDifferential,
      show (0 : ℤ) ≤ (m : ℤ) by omega,
      show (0 : ℤ) ≤ (m : ℤ) + 1 by omega,
      show ((m : ℤ)).toNat = m by omega,
      Category.assoc, e₁, e₀]

/-- Actual positive integer exactness, conditional only on the proven local result. -/
theorem integerResolution_exactAt_positive (n : ℤ) (hn : 0 < n) :
    integerResolution.ExactAt n := by
  obtain ⟨m, rfl⟩ : ∃ m : ℕ, n = (m : ℤ) + 1 := by
    refine ⟨(n - 1).toNat, ?_⟩
    omega
  apply (integerResolution.exactAt_iff'
    (i := ((m : ℤ) + 2)) (j := ((m : ℤ) + 1)) (k := (m : ℤ))
    (by simp only [ChainComplex.prev]; omega)
    (by simp only [ChainComplex.next]; omega)).2
  exact ShortComplex.exact_of_iso
    (positiveIntegerShortComplexIso m) (positiveShortComplex_exact m)

/-- Actual positive-degree Mathlib homology vanishes in all positive integers. -/
theorem integerResolution_homology_isZero_positive (n : ℤ) (hn : 0 < n) :
    Limits.IsZero (integerResolution.homology n) :=
  (integerResolution_exactAt_positive n hn).isZero_homology


/-! ### S147: actual categorical cokernel of the first periodic boundary -/

/-- Surjectivity of the residue B-linear map is categorical epicness. -/
theorem residueModuleMorphism_epi : Epi residueModuleMorphism := by
  apply (ModuleCat.epi_iff_surjective _).2
  exact residueLinear_surjective

/-- The genuine residue object, not only a coefficient quotient, is the
categorical cokernel of the first periodic differential. -/
noncomputable def residueModule_cokernel :
    Limits.IsColimit (Limits.CokernelCofork.ofπ residueModuleMorphism
      differential_residueModuleMorphism) := by
  haveI : Epi augmentationShortComplex.g := by
    change Epi residueModuleMorphism
    exact residueModuleMorphism_epi
  exact augmentationShortComplex_exact.gIsCokernel

/-- The actual integer-indexed degree-zero homology identifies with the
residue module by the universal cokernel of the first genuine differential. -/
noncomputable def integerResolution_homology_zero_iso :
    integerResolution.homology 0 ≅ residueModuleObject := by
  let S := integerResolution.sc' (1 : ℤ) (0 : ℤ) (-1 : ℤ)
  have hi : (ComplexShape.down ℤ).prev 0 = 1 := by
    simp [ChainComplex.prev]
  have hk : (ComplexShape.down ℤ).next 0 = -1 := by
    simp [ChainComplex.next]
  have hf : S.f = differential 0 := by
    apply ModuleCat.hom_ext
    apply LinearMap.ext
    intro a
    rfl
  have hg : S.g = 0 := by
    change ChainComplex.of.d integerObject integerDifferential 0 (-1 : ℤ) = 0
    simp [ChainComplex.of.d, integerDifferential]
  have hcomp : S.f ≫ (residueModuleMorphism : S.X₂ ⟶ residueModuleObject) = 0 := by
    rw [hf]
    exact differential_residueModuleMorphism
  have hc : Limits.IsColimit
      (Limits.CokernelCofork.ofπ
        (residueModuleMorphism : S.X₂ ⟶ residueModuleObject) hcomp) := by
    change Limits.IsColimit
      (Limits.CokernelCofork.ofπ residueModuleMorphism
        differential_residueModuleMorphism)
    exact residueModule_cokernel
  exact (integerResolution.homologyIsoSc' (1 : ℤ) (0 : ℤ) (-1 : ℤ) hi hk) ≪≫
    (S.asIsoHomologyι hg) ≪≫
    (S.opcyclesIsCokernel.coconePointUniqueUpToIso hc)

/-! ### S148: actual nonzero-degree augmentation homology maps -/

/-- All nonzero degrees of the concentrated residue complex are exact
because their actual objects are zero. -/
theorem residueComplex_exactAt_nonzero (n : ℤ) (hn : n ≠ 0) :
    residueComplex.ExactAt n := by
  apply HomologicalComplex.ExactAt.of_isZero
  change Limits.IsZero (residueObjectAt n)
  rw [show residueObjectAt n = ModuleCat.of B (Fin 0 → B) by
    simp [residueObjectAt, hn]]
  exact ModuleCat.isZero_of_subsingleton _

/-- The genuine induced augmentation map is a homology isomorphism in
every nonzero integer degree, not just an abstract object identification. -/
theorem augmentationChainMap_quasiIsoAt_nonzero (n : ℤ) (hn : n ≠ 0) :
    QuasiIsoAt augmentationChainMap n := by
  apply (quasiIsoAt_iff_exactAt' augmentationChainMap n
    (residueComplex_exactAt_nonzero n hn)).2
  rcases lt_trichotomy n 0 with hneg | hzero | hpos
  · exact integerResolution_exactAt_negative n hneg
  · exact False.elim (hn hzero)
  · exact integerResolution_exactAt_positive n hpos

/-- The actual augmentation quasi-isomorphism at degree zero, expressed
using the universal exact-short-complex/epi criterion for the induced map. -/
theorem augmentationChainMap_quasiIsoAt_zero :
    QuasiIsoAt augmentationChainMap (0 : ℤ) := by
  have hg₁ : (integerResolution.sc' (1 : ℤ) 0 (-1 : ℤ)).g = 0 := by
    change ChainComplex.of.d integerObject integerDifferential (0 : ℤ) (-1 : ℤ) = 0
    simp [ChainComplex.of.d, integerDifferential]
  have hf₂ : (residueComplex.sc' (1 : ℤ) 0 (-1 : ℤ)).f = 0 := by
    change ChainComplex.of.d residueObjectAt residueDifferentialAt (1 : ℤ) 0 = 0
    simp [ChainComplex.of.d, residueDifferentialAt]
  have hg₂ : (residueComplex.sc' (1 : ℤ) 0 (-1 : ℤ)).g = 0 := by
    change ChainComplex.of.d residueObjectAt residueDifferentialAt (0 : ℤ) (-1 : ℤ) = 0
    simp [ChainComplex.of.d, residueDifferentialAt]
  apply (quasiIsoAt_iff' augmentationChainMap (1 : ℤ) (0 : ℤ) (-1 : ℤ)
    (by simp [ChainComplex.prev]) (by simp [ChainComplex.next])).2
  exact (ShortComplex.quasiIso_iff_of_zeros' _ hg₁ hf₂ hg₂).2
    ⟨by
       change augmentationShortComplex.Exact
       exact augmentationShortComplex_exact,
     by
       change Epi residueModuleMorphism
       exact residueModuleMorphism_epi⟩

/-- All-degree quasi-isomorphism of the actual augmented integer C4 resolution. -/
theorem augmentationChainMap_quasiIso : QuasiIso augmentationChainMap := by
  apply (quasiIso_iff augmentationChainMap).2
  intro n
  by_cases hn : n = 0
  · subst n
    exact augmentationChainMap_quasiIsoAt_zero
  · exact augmentationChainMap_quasiIsoAt_nonzero n hn

/-! ### S149: globally indexed periodic dg equations, now in actual B-linear morphisms

These are morphism-level identities in the regular B-module, for every
natural periodic index. They are a strict ingredient for the shifted
resolution's eventual all-integer dg families; the latter also need the
degree-boundary, shift and defining-system transports.
-/

/-- Multiplication by a coefficient, as a *categorical* B-linear morphism. -/
def regularCoefficientHom (a : B) :
    ModuleCat.of B B ⟶ ModuleCat.of B B :=
  ModuleCat.ofHom (coefficientLinear a)

/-- The regular B-module is rank one: the coefficient of an arbitrary
B-linear endomorphism is its value at 1. -/
theorem regularHom_determined_by_one
    (f : ModuleCat.of B B ⟶ ModuleCat.of B B) :
    f = regularCoefficientHom (f.hom 1) := by
  apply ModuleCat.hom_ext
  apply LinearMap.ext
  intro a
  change f.hom a = (f.hom 1) * a
  calc
    f.hom a = f.hom (a • (1 : B)) := by simp
    _ = a • f.hom (1 : B) := map_smul f.hom a (1 : B)
    _ = (f.hom 1) * a := by simp [smul_eq_mul, mul_comm]

theorem regularCoefficientHom_comp (a b : B) :
    regularCoefficientHom a ≫ regularCoefficientHom b =
      regularCoefficientHom (b * a) := by
  apply ModuleCat.hom_ext
  apply LinearMap.ext
  intro c
  change b * (a * c) = (b * a) * c
  exact (mul_assoc b a c).symm

theorem regularCoefficientHom_add (a b : B) :
    regularCoefficientHom (a + b) =
      regularCoefficientHom a + regularCoefficientHom b := by
  apply ModuleCat.hom_ext
  rw [ModuleCat.hom_add]
  apply LinearMap.ext
  intro c
  change (a + b) * c = a * c + b * c
  exact add_mul a b c

theorem regularCoefficientHom_zero :
    regularCoefficientHom (0 : B) = 0 := by
  apply ModuleCat.hom_ext
  apply LinearMap.ext
  intro c
  change (0 : B) * c = 0
  exact zero_mul c

theorem regularCoefficientHom_one :
    regularCoefficientHom (1 : B) = 𝟙 (ModuleCat.of B B) := by
  apply ModuleCat.hom_ext
  apply LinearMap.ext
  intro c
  change (1 : B) * c = c
  exact one_mul c

private theorem periodic_Dx_ring (n : ℕ) :
    Periodic.d n * Periodic.x (n + 1) +
      Periodic.x n * Periodic.d (n + 1) = (0 : B) := by
  simpa only [← mul_is_truncated_convolution,
    ← add_is_coordinate_add, ← zero_is_coordinate_zero] using
      Periodic.Dx_zero n

private theorem periodic_Dh_ring (n : ℕ) :
    Periodic.d n * Periodic.h (n + 1) +
      Periodic.h n * Periodic.d (n + 1) =
      Periodic.x n * Periodic.x (n + 1) := by
  simpa only [← mul_is_truncated_convolution,
    ← add_is_coordinate_add] using Periodic.Dh_xx n

private theorem periodic_Dz_ring (n : ℕ) :
    Periodic.d n * Periodic.z (n + 1) +
      Periodic.z n * Periodic.d (n + 1) =
      Periodic.x n * Periodic.h (n + 1) +
      Periodic.h n * Periodic.x (n + 1) := by
  simpa only [← mul_is_truncated_convolution,
    ← add_is_coordinate_add] using Periodic.Dz_xh_hx n

/-- The complete parity-indexed Dx=0 equation in actual B-linear morphisms. -/
theorem regularDx_zero (n : ℕ) :
    regularCoefficientHom (Periodic.x (n + 1)) ≫
      regularCoefficientHom (Periodic.d n) +
    regularCoefficientHom (Periodic.d (n + 1)) ≫
      regularCoefficientHom (Periodic.x n) = 0 := by
  rw [regularCoefficientHom_comp, regularCoefficientHom_comp,
    ← regularCoefficientHom_add, periodic_Dx_ring n,
    regularCoefficientHom_zero]

/-- The all-degree primary equation Dh=x² in actual B-linear morphisms. -/
theorem regularDh_xx (n : ℕ) :
    regularCoefficientHom (Periodic.h (n + 1)) ≫
      regularCoefficientHom (Periodic.d n) +
    regularCoefficientHom (Periodic.d (n + 1)) ≫
      regularCoefficientHom (Periodic.h n) =
    regularCoefficientHom (Periodic.x (n + 1)) ≫
      regularCoefficientHom (Periodic.x n) := by
  rw [regularCoefficientHom_comp, regularCoefficientHom_comp,
    regularCoefficientHom_comp,
    ← regularCoefficientHom_add, periodic_Dh_ring n]

/-- The all-degree secondary equation Dz=xh+hx in actual B-linear morphisms. -/
theorem regularDz_xh_hx (n : ℕ) :
    regularCoefficientHom (Periodic.z (n + 1)) ≫
      regularCoefficientHom (Periodic.d n) +
    regularCoefficientHom (Periodic.d (n + 1)) ≫
      regularCoefficientHom (Periodic.z n) =
    (regularCoefficientHom (Periodic.h (n + 1)) ≫
      regularCoefficientHom (Periodic.x n)) +
    (regularCoefficientHom (Periodic.x (n + 1)) ≫
      regularCoefficientHom (Periodic.h n)) := by
  rw [regularCoefficientHom_comp, regularCoefficientHom_comp,
    regularCoefficientHom_comp, regularCoefficientHom_comp,
    ← regularCoefficientHom_add, ← regularCoefficientHom_add,
    periodic_Dz_ring n]

/-- The selected fourfold terminal is the identity *morphism* in
every positive periodic component, not only a numerical coefficient. -/
theorem regularTerminal_identity (n : ℕ) :
    (regularCoefficientHom (Periodic.z (n + 1)) ≫
      regularCoefficientHom (Periodic.x n)) +
    ((regularCoefficientHom (Periodic.h (n + 1)) ≫
      regularCoefficientHom (Periodic.h n)) +
     (regularCoefficientHom (Periodic.x (n + 1)) ≫
      regularCoefficientHom (Periodic.z n))) =
    𝟙 (ModuleCat.of B B) := by
  rw [regularCoefficientHom_comp, regularCoefficientHom_comp,
    regularCoefficientHom_comp,
    ← regularCoefficientHom_add, ← regularCoefficientHom_add]
  change regularCoefficientHom (Periodic.w n) = 𝟙 (ModuleCat.of B B)
  rw [Periodic.terminal_unit]
  exact regularCoefficientHom_one

/-! ### S149: universal low-degree obstruction in the *category* of B-modules

Every variable below ranges over arbitrary genuine endomorphisms of the
regular B-module, not only preselected coefficients. The equations are the
precise local defining-system constraints transported through evaluation
at 1. The theorem is not yet the global homotopy-equivalence-invariant
fourfold bracket on shifted resolutions.
-/

def regularEval (f : ModuleCat.of B B ⟶ ModuleCat.of B B) : B :=
  f.hom 1

@[simp]
theorem regularEval_coefficient (b : B) :
    regularEval (regularCoefficientHom b) = b := by
  simp [regularEval, regularCoefficientHom, coefficientLinear]

@[simp]
theorem regularEval_zero :
    regularEval (0 : ModuleCat.of B B ⟶ ModuleCat.of B B) = 0 := by
  simp [regularEval, ModuleCat.hom_zero]

@[simp]
theorem regularEval_add (f g : ModuleCat.of B B ⟶ ModuleCat.of B B) :
    regularEval (f + g) = regularEval f + regularEval g := by
  simp [regularEval, ModuleCat.hom_add]

@[simp]
theorem regularEval_comp (f g : ModuleCat.of B B ⟶ ModuleCat.of B B) :
    regularEval (f ≫ g) = regularEval g * regularEval f := by
  have hg := regularHom_determined_by_one g
  rw [hg]
  simp [regularEval, regularCoefficientHom, coefficientLinear, ModuleCat.hom_comp]

/-- Every low-degree defining-system solution in the regular module
category has a nonzero terminal morphism modulo the genuine differential
boundary ideal. There is no assumption that the chosen fillers are the
explicit periodic h and z: all categorical variables are arbitrary. -/
theorem regularAllChoice_terminal_not_boundary
    (a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 f1 f2 :
      ModuleCat.of B B ⟶ ModuleCat.of B B)
    (ha1 : (regularEval a1).c0 = 1)
    (hb : (regularEval b1).c0 = 1)
    (hc : (regularEval c1).c0 = 1)
    (hA :
      a2 ≫ regularCoefficientHom C4.t +
      a1 ≫ regularCoefficientHom C4.t3 = 0)
    (hH :
      h2 ≫ regularCoefficientHom C4.t +
      h1 ≫ regularCoefficientHom C4.t3 = a2 ≫ b1)
    (hJ :
      j2 ≫ regularCoefficientHom C4.t +
      j1 ≫ regularCoefficientHom C4.t3 = a2 ≫ b1)
    (hK :
      k2 ≫ regularCoefficientHom C4.t +
      k1 ≫ regularCoefficientHom C4.t3 =
      h2 ≫ c1 + a2 ≫ j1) :
    (k2 ≫ c1 + (j2 ≫ h1 + a2 ≫ l1)) ≠
      (f2 ≫ regularCoefficientHom C4.t +
       f1 ≫ regularCoefficientHom C4.t3) := by
  have ha : Adjacent (regularEval a1) (regularEval a2) := by
    refine ⟨ha1, ?_⟩
    have hh := congrArg regularEval hA
    simpa only [Adjacent, regularEval_add, regularEval_comp,
      regularEval_coefficient, regularEval_zero,
      mul_is_truncated_convolution, add_is_coordinate_add,
      zero_is_coordinate_zero] using hh
  have hhp : Primary (regularEval b1) (regularEval a2)
      (regularEval h1) (regularEval h2) := by
    have hh := congrArg regularEval hH
    simpa only [Primary, regularEval_add, regularEval_comp,
      regularEval_coefficient, mul_is_truncated_convolution,
      add_is_coordinate_add] using hh
  have hjp : Primary (regularEval b1) (regularEval a2)
      (regularEval j1) (regularEval j2) := by
    have hh := congrArg regularEval hJ
    simpa only [Primary, regularEval_add, regularEval_comp,
      regularEval_coefficient, mul_is_truncated_convolution,
      add_is_coordinate_add] using hh
  have hks : Secondary (regularEval c1) (regularEval h2)
      (regularEval j1) (regularEval a2)
      (regularEval k1) (regularEval k2) := by
    have hh := congrArg regularEval hK
    simpa only [Secondary, regularEval_add, regularEval_comp,
      regularEval_coefficient, mul_is_truncated_convolution,
      add_is_coordinate_add] using hh
  have hne := universal_terminal_not_boundary
    (regularEval a1) (regularEval a2) (regularEval b1) (regularEval c1)
    (regularEval h1) (regularEval h2) (regularEval j1) (regularEval j2)
    (regularEval k1) (regularEval k2) (regularEval l1)
    (regularEval f1) (regularEval f2) ha hb hc hhp hjp hks
  intro heq
  apply hne
  have hh := congrArg regularEval heq
  simpa only [Terminal, regularEval_add, regularEval_comp,
    regularEval_coefficient, mul_is_truncated_convolution,
    add_is_coordinate_add] using hh

/-! ### S149 experimental actual shift on the integer resolution -/

/-- The shifted term is the exact source resolution term, evaluated at n-s.
In particular the negative and degree-zero boundary are not thrown away. -/
def integerShiftObject (s n : ℤ) : ModuleCat B := integerObject (n - s)

/-- The differential of the shifted resolution, transported only along
the arithmetic identity n+1-s=(n-s)+1. -/
def integerShiftDifferential (s n : ℤ) :
    integerShiftObject s (n + 1) ⟶ integerShiftObject s n :=
  (eqToHom (congrArg integerObject
    (show n + 1 - s = (n - s) + 1 by omega))) ≫ integerDifferential (n - s)

/-- Genuine all-integer square-zero law, including shift boundaries. -/
theorem integerShiftDifferential_square (s n : ℤ) :
    integerShiftDifferential s (n + 1) ≫ integerShiftDifferential s n = 0 := by
  have h1 : n + 1 - s = (n - s) + 1 := by omega
  have h2 : (n + 1) + 1 - s = ((n - s) + 1) + 1 := by omega
  simpa [integerShiftDifferential, h1, h2, Category.assoc] using
    integerDifferential_square (n - s)

/-- Every integer shift is a genuine complex in Ch(ModuleCat B). -/
def integerShiftResolution (s : ℤ) : ChainComplex (ModuleCat B) ℤ :=
  ChainComplex.of (integerShiftObject s)
    (integerShiftDifferential s) (integerShiftDifferential_square s)

end C4
