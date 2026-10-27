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
instance residueModule : Module B (ZMod 2) := residueHom.toModule

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

/-- The augmentation is a morphism of B-modules. -/
def residueMorphism :
    ModuleCat.of B B ⟶ ModuleCat.of B (ZMod 2) :=
  ModuleCat.ofHom residueLinear

/-- The first differential followed by the augmentation is zero in ModuleCat B. -/
theorem firstDifferential_augmentation_zero :
    differential 0 ≫ residueMorphism = 0 := by
  apply ModuleCat.hom_ext
  apply LinearMap.ext
  intro a
  change residueHom (C4.t * a) = 0
  exact residueHom_t_mul a


/-- A genuine integer-indexed complex concentrated in degree zero in the
residue B-module.  All its differential maps are zero. -/
def residueObject (n : ℤ) : ModuleCat B :=
  if n = 0 then ModuleCat.of B (ZMod 2) else ModuleCat.of B (Fin 0 → B)

def residueComplex : ChainComplex (ModuleCat B) ℤ :=
  ChainComplex.of residueObject (fun _ => 0) (by intro n; simp)

/-- Components of the augmentation from the actual integer resolution. -/
def augmentationComponent (n : ℤ) :
    integerResolution.X n ⟶ residueComplex.X n := by
  by_cases hn : n = 0
  · subst n
    simpa [integerResolution, residueComplex, integerObject, residueObject] using
      residueMorphism
  · exact 0

theorem augmentationComponent_comm (n : ℤ) :
    augmentationComponent (n + 1) ≫ residueComplex.d (n + 1) n =
      integerResolution.d (n + 1) n ≫ augmentationComponent n := by
  have hd : residueComplex.d (n + 1) n = 0 := by
    simp [residueComplex, ChainComplex.of_d]
  have hp : integerResolution.d (n + 1) n = integerDifferential n := by
    simp [integerResolution, ChainComplex.of_d]
  rw [hd, Category.comp_zero, hp]
  by_cases hn : n = 0
  · subst n
    simpa [augmentationComponent, integerResolution, residueComplex,
      integerDifferential, integerObject, residueObject] using
        firstDifferential_augmentation_zero.symm
  · have hz : augmentationComponent n = 0 := by
      simp [augmentationComponent, hn]
    rw [hz, Category.comp_zero]

/-- Actual map of integer-indexed complexes from the free chain complex
to the residue B-module concentrated in degree zero. -/
def augmentationChainMap : integerResolution ⟶ residueComplex :=
  ChainComplex.ofHom augmentationComponent augmentationComponent_comm

end C4
