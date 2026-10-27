module
public import C4.Ring

@[expose] public section

/-!
# S140: actual module morphisms for the positive-degree C4 resolution

A natural-indexed ChainComplex is the bounded-below core of the intended
unbounded integer-indexed periodic resolution. This does NOT establish the
actual unbounded Ch(B) object, augmentation or global dg fourfold.
-/

namespace C4

open CategoryTheory

/-- Multiplication by a concrete cyclic-four coefficient is a B-linear map. -/
def coefficientLinear (b : B) : B →ₗ[B] B where
  toFun a := b * a
  map_add' := by
    intro a c
    exact mul_add b a c
  map_smul' := by
    intro a c
    change b * (a * c) = a * (b * c)
    calc
      b * (a * c) = (b * a) * c := (mul_assoc ..).symm
      _ = (a * b) * c := by rw [mul_comm b a]
      _ = a * (b * c) := mul_assoc ..

/-- Honest B-module differential, not an untyped coefficient function. -/
def differential (n : ℕ) : ModuleCat.of B B ⟶ ModuleCat.of B B :=
  ModuleCat.ofHom (coefficientLinear (Periodic.d n))

theorem differential_square (n : ℕ) :
    differential (n+1) ≫ differential n = 0 := by
  apply ModuleCat.hom_ext
  apply LinearMap.ext
  intro a
  change Periodic.d n * (Periodic.d (n+1) * a) = 0
  have hz : Periodic.d n * Periodic.d (n+1) = (0 : B) := by
    simpa only [mul_is_truncated_convolution, zero_is_coordinate_zero] using
      Periodic.d_squared n
  rw [← mul_assoc, hz, zero_mul]

/-- Natural-degree module-valued chain complex of the periodic resolution. -/
def positiveResolution : ChainComplex (ModuleCat B) ℕ :=
  ChainComplex.of (fun _ => ModuleCat.of B B)
    differential differential_square

end C4
