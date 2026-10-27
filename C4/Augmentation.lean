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

end C4
