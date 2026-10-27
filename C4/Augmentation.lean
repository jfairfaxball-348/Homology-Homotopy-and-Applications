module
public import C4.IntegerResolution

@[expose] public section

/-!
# S142: residue augmentation over the concrete cyclic-four ring

The constant coefficient is a surjective ring homomorphism, and the
residue field is now an actual B-module with a B-linear augmentation.
The degree-zero kernel/image identity is independent of categorical
homology and is stated without identifying unproved higher homology.
-/

namespace C4

open CategoryTheory

/-- Reduction modulo the nilpotent generator, as an actual ring hom. -/
def residueHom : B →+* ZMod 2 where
  toFun := B.c0
  map_one' := by rfl
  map_mul' := by intro a b; rfl
  map_zero' := by rfl
  map_add' := by intro a b; rfl

theorem residueHom_surjective : Function.Surjective residueHom := by
  intro v
  refine ⟨⟨v, 0, 0, 0⟩, ?_⟩
  rfl

theorem residueHom_kernel (a : B) :
    residueHom a = 0 ↔ ∃ b : B, a = C4.t * b := by
  change a.c0 = 0 ↔ ∃ b : B, a = C4.mul C4.t b
  exact (ann_t3_coeffs a).symm.trans (ann_t3 a)

/-- Multiplication by t has zero residue, the augmentation identity. -/
theorem residueHom_t_mul (a : B) : residueHom (C4.t * a) = 0 := by
  exact (residueHom_kernel (C4.t * a)).mpr ⟨a, rfl⟩

/-- Genuine residue field as a module over the coefficient ring. -/
instance : Module B (ZMod 2) := residueHom.toModule

/-- The augmentation is an honest B-linear map, not just a function of coordinates. -/
def residueLinear : B →ₗ[B] ZMod 2 where
  toFun := residueHom
  map_add' := by
    intro a b
    exact residueHom.map_add a b
  map_smul' := by
    intro a b
    change residueHom (a * b) = residueHom a * residueHom b
    exact residueHom.map_mul a b

theorem residueLinear_surjective : Function.Surjective residueLinear :=
  residueHom_surjective

/-- Exactness at degree zero for the actual B-linear augmentation. -/
theorem residueLinear_kernel (a : B) :
    residueLinear a = 0 ↔
      ∃ b : B, a = coefficientLinear (Periodic.d 0) b := by
  simpa [residueLinear, coefficientLinear, Periodic.d] using residueHom_kernel a


/-- The kernel of the actual B-linear residue equals the range of the
first B-linear periodic differential; the degree-zero exactness theorem. -/
theorem residueLinear_ker_eq_range :
    LinearMap.ker residueLinear =
      LinearMap.range (coefficientLinear (Periodic.d 0)) := by
  ext a
  constructor
  · intro ha
    obtain ⟨b, hb⟩ := (residueLinear_kernel a).mp ha
    exact ⟨b, hb.symm⟩
  · rintro ⟨b, hb⟩
    exact (residueLinear_kernel a).mpr ⟨b, hb.symm⟩

/-- All positive coefficient differentials form exact B-linear sequences,
expressed as equality of genuine submodules. -/
theorem positiveLinear_ker_eq_range (n : ℕ) :
    LinearMap.ker (coefficientLinear (Periodic.d n)) =
      LinearMap.range (coefficientLinear (Periodic.d (n + 1))) := by
  ext a
  constructor
  · intro ha
    obtain ⟨b, hb⟩ := (positiveDifferential_exact_coeff n a).mp ha
    exact ⟨b, hb.symm⟩
  · rintro ⟨b, hb⟩
    exact (positiveDifferential_exact_coeff n a).mpr ⟨b, hb.symm⟩


/-! ### S143: typed ModuleCat augmentation boundary -/

/-- Explicitly bundled residue B-module. In contrast with `ModuleCat.of`,
this constructor does not ask instance synthesis to rediscover scalar restriction. -/
def residueModuleObject : ModuleCat B where
  carrier := ZMod 2
  isAddCommGroup := inferInstance
  isModule := residueHom.toModule

/-- Actual morphism in the category of modules over B. -/
def residueModuleMorphism : ModuleCat.of B B ⟶ residueModuleObject := by
  exact @ModuleCat.ofHom B _ B (ZMod 2)
    (inferInstance : AddCommGroup B) (inferInstance : Module B B)
    (inferInstance : AddCommGroup (ZMod 2)) residueHom.toModule residueLinear

/-- The first differential vanishes after the categorical augmentation. -/
theorem differential_residueModuleMorphism :
    differential 0 ≫ residueModuleMorphism = 0 := by
  apply ModuleCat.hom_ext
  rw [ModuleCat.hom_comp, ModuleCat.hom_zero]
  apply LinearMap.ext
  intro a
  change residueHom (C4.t * a) = 0
  exact residueHom_t_mul a


/-- A residue module concentrated in degree zero. -/
def residueObjectAt (n : ℤ) : ModuleCat B :=
  if n = 0 then residueModuleObject else ModuleCat.of B (Fin 0 → B)

/-- Every differential of the concentrated residue complex is zero. -/
def residueDifferentialAt (n : ℤ) :
    residueObjectAt (n + 1) ⟶ residueObjectAt n := 0

theorem residueDifferential_square (n : ℤ) :
    residueDifferentialAt (n + 1) ≫ residueDifferentialAt n = 0 := by
  simp [residueDifferentialAt]

/-- The degree-zero residue module as an actual integer-indexed complex. -/
def residueComplex : ChainComplex (ModuleCat B) ℤ :=
  ChainComplex.of residueObjectAt residueDifferentialAt residueDifferential_square

/-- Candidate augmentation component, categorical in every integer degree. -/
def augmentationComponent (n : ℤ) :
    integerObject n ⟶ residueObjectAt n := by
  by_cases h : n = 0
  · subst n
    have ha : integerObject (0 : ℤ) = ModuleCat.of B B :=
      integerObject_nonnegative 0 (by decide)
    have hb : residueModuleObject = residueObjectAt 0 := by
      simp [residueObjectAt]
    exact eqToHom ha ≫ residueModuleMorphism ≫ eqToHom hb
  · exact 0


/-- Compatibility of the integer differential and every augmentation
    component, including the -1 to 0 and 0 to -1 boundary cases. -/
theorem augmentationComponent_commutes (n : ℤ) :
    augmentationComponent (n + 1) ≫ residueDifferentialAt n =
      integerDifferential n ≫ augmentationComponent n := by
  simp only [residueDifferentialAt, comp_zero]
  by_cases hn : n = 0
  · subst n
    simp [integerDifferential, augmentationComponent, Category.assoc,
      differential_residueModuleMorphism]
  · have hzero : augmentationComponent n = 0 := by
      simp [augmentationComponent, hn]
    rw [hzero, comp_zero]


/-- Honest chain morphism from the integer-indexed periodic B-complex
    to the residue B-module complex concentrated in degree zero. -/
def augmentationChainMap : integerResolution ⟶ residueComplex :=
  ChainComplex.ofHom augmentationComponent augmentationComponent_commutes

end C4
