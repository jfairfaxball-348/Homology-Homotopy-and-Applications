module
public import C4.SecondaryTransferCandidates

@[expose] public section

/-!
# S168: characteristic-two cancellation in genuine B-module morphisms

The dg-Hom differential is unsigned in characteristic two. Establish that
its apparent doubled middle term vanishes on actual ModuleCat B maps
without presupposing a global abstract characteristic-two dg algebra.
-/

namespace C4
open CategoryTheory

theorem B_two_eq_zero : (2 : B) = 0 := by
  calc
    (2 : B) = 1 + 1 := by norm_num
    _ = -(1 : B) + 1 := rfl
    _ = 0 := neg_add_cancel _

/-- Every genuine B-linear module morphism has additive order dividing
two, including morphisms of arbitrary (not necessarily free) B-modules. -/
theorem moduleHom_add_self_zero
    {M N : ModuleCat B} (f : M ⟶ N) : f + f = 0 := by
  apply ModuleCat.hom_ext
  apply LinearMap.ext
  intro x
  change f.hom x + f.hom x = (0 : N)
  calc
    f.hom x + f.hom x = (2 : B) • f.hom x := (two_smul B _).symm
    _ = 0 := by rw [B_two_eq_zero, zero_smul]

/-- A genuine chain map is a degree-zero cycle for the *actual* all-integer
Hom differential. Both terms cancel because the coefficient ring is
characteristic two, rather than from a false strict vanishing assumption. -/
theorem HomogeneousFamily.d_ofChainMap_component
    {P Q : C4Complex} (f : P ⟶ Q) (n : ℤ) :
    ((HomogeneousFamily.ofChainMap f).d).hom n = 0 := by
  have h₁ : (n - 1) + (0 : ℤ) = n - 1 := by omega
  have h₂ : n + (0 : ℤ) = n := by omega
  have h₃ : n + (0 : ℤ) - 1 = n - 1 := by omega
  have h₄ : n + ((0 : ℤ) - 1) = n - 1 := by omega
  simpa [HomogeneousFamily.d, HomogeneousFamily.ofChainMap,
    h₁, h₂, h₃, h₄, f.comm n (n - 1), Category.assoc] using
      (moduleHom_add_self_zero (f.f n ≫ Q.d n (n - 1)))

end C4
