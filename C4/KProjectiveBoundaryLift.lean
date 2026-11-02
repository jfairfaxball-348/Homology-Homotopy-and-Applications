module
public import C4.DirectObstruction
public import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
public import C4.InterleavingTransfer

@[expose] public noncomputable section

/-! # Boundary lifting using only source K-projectivity

This tests the weaker-data route: a quasi-isomorphism on the target
induces the boundary-lifting operation needed for coherent transfer.
No K-projectivity or homotopy inverse of the arbitrary target is assumed.
-/
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true
namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex CochainComplex.HomComplex

variable [hDerived : HasDerivedCategory (ModuleCat B)]
include hDerived

/-- The derived category reflects equality of maps from a K-projective source. -/
def cochainHomotopyOfDerivedEq
    {K L : CochainComplex (ModuleCat B) ℤ} [K.IsKProjective]
    (f g : K ⟶ L) (he : DerivedCategory.Q.map f = DerivedCategory.Q.map g) : Homotopy f g := by
  let e := DerivedCategory.quotientCompQhIso (ModuleCat B)
  have hh : (HomotopyCategory.quotient (ModuleCat B) (.up ℤ)).map f =
      (HomotopyCategory.quotient (ModuleCat B) (.up ℤ)).map g := by
    apply (CochainComplex.IsKProjective.Qh_map_bijective K
      ((HomotopyCategory.quotient (ModuleCat B) (.up ℤ)).obj L)).injective
    apply (cancel_mono (e.hom.app L)).1
    change ((HomotopyCategory.quotient (ModuleCat B) (.up ℤ) ⋙ DerivedCategory.Qh).map f) ≫ _ =
      ((HomotopyCategory.quotient (ModuleCat B) (.up ℤ) ⋙ DerivedCategory.Qh).map g) ≫ _
    rw [e.hom.naturality f, e.hom.naturality g, he]
  exact HomotopyCategory.homotopyOfEq f g hh

/-- Every cocycle into a derived-zero target is an actual boundary when its source is K-projective. -/
theorem cochain_boundary_of_derived_zero
    {K L : CochainComplex (ModuleCat B) ℤ} [K.IsKProjective]
    (hL : IsZero (DerivedCategory.Q.obj L)) (n m : ℤ) (hm : m+1=n) (z : Cochain K L n)
    (hz : δ n (n+1) z = 0) :
    ∃ b : Cochain K L m, δ m n b = z := by
  let α : Cocycle K L n := Cocycle.mk z (n+1) rfl hz
  let f : K ⟶ L⟦n⟧ := Cocycle.equivHomShift.symm α
  have hs : IsZero (DerivedCategory.Q.obj (L⟦n⟧)) :=
    ((DerivedCategory.Q.commShiftIso n).app L).isZero_iff.mpr
      ((CategoryTheory.shiftFunctor (DerivedCategory (ModuleCat B)) n).map_isZero hL)
  have he : DerivedCategory.Q.map f = DerivedCategory.Q.map (0 : K ⟶ L⟦n⟧) := by
    exact hs.eq_of_tgt _ _
  let h := cochainHomotopyOfDerivedEq f 0 he
  have hc : CohomologyClass.toHom (CohomologyClass.mk α) = 0 := by
    rw [CohomologyClass.toHom_mk]
    exact (HomotopyCategory.quotient_map_eq_zero_iff f).2 ⟨h⟩
  have hb := (CohomologyClass.toHom_mk_eq_zero_iff α).mp hc
  obtain ⟨b, hb⟩ := (mem_coboundaries_iff α m hm).mp hb
  exact ⟨b, hb⟩

/-- A quasi-isomorphism has a derived-zero mapping cone. -/
theorem mappingCone_derived_zero
    {P Q : CochainComplex (ModuleCat B) ℤ} (u : P ⟶ Q) [QuasiIso u] :
    IsZero (DerivedCategory.Q.obj (CochainComplex.mappingCone u)) := by
  exact Pretriangulated.Triangle.isZero₃_of_isIso₁ _ (DerivedCategory.mappingCone_triangle_distinguished u)
    (by change IsIso (DerivedCategory.Q.map u); infer_instance)

omit hDerived in
/-- The exact lifting operation for the direct coherent-transfer recursion.
An original-side obstruction and a replacement-side nullhomotopy lift to
an original filler plus its next comparison correction. Only K is K-projective.

The earlier mapping-cone elaboration of this statement timed out. It is now
derived from `kProjective_relative_lift`, which uses the colocality of
K-projective complexes in the homotopy category and needs no derived category. -/
theorem lift_coherent_boundary
    {K P Q : CochainComplex (ModuleCat B) ℤ} [K.IsKProjective]
    (u : P ⟶ Q) [QuasiIso u] (n m l : ℤ) (hm : n+1=m) (hl : l+1=n)
    (α : Cocycle K P m) (β : Cochain K Q n)
    (hβ : δ n m β = α.1.comp (Cochain.ofHom u) (add_zero m)) :
    ∃ (t : Cochain K P n) (a : Cochain K Q l),
      δ n m t = α.1 ∧
        δ l n a = β + t.comp (Cochain.ofHom u) (add_zero n) := by
  obtain ⟨t, a, ht, ha⟩ := kProjective_relative_lift u n m l hm hl (m + 1) rfl
    α.1 (Cocycle.δ_eq_zero α (m + 1)) β hβ
  exact ⟨t, a, ht, char2_isolate cochain_add_self_zero ha⟩

#print axioms cochain_boundary_of_derived_zero
#print axioms lift_coherent_boundary
end C4
