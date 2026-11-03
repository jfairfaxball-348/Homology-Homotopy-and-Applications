module
public import C4.DirectDefiningSystem

@[expose] public section

/-! # The direct contradiction, with adjacent residues derived from actual homotopies

The replacement producer must supply the stated comparison and adjacent
compatibility data. No unit-residue or higher-filler equation is assumed.
-/
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true
namespace C4
open CategoryTheory

/-- The first regular constant coefficient of a nullhomotopic adjacent map is zero. -/
theorem globalAdjacent_constant_null (s : ℤ)
    (f : integerShiftResolution s ⟶ integerShiftResolution (s+1))
    (h : Homotopy f 0) :
    (regularEval (positiveGlobalComponent s (s+1) (s+1)
      (by omega) (by omega) f)).c0 = 0 := by
  have hd0 : (s+1-1-s).toNat=0 := by omega
  have hd1 : (s+1-(s+1)).toNat=0 := by omega
  rw [regularize_primary s (s+1) (s+1) (by omega) (by omega) h]
  simp [regularEval_add, regularEval_comp, regularEval_coefficient,
    hd0, hd1, Periodic.d, mul_is_truncated_convolution,
    add_is_coordinate_add, C4.mul, C4.add, C4.t]

/-- Adjacent constant residues depend only on the actual chain-homotopy class. -/
theorem globalAdjacent_constant_homotopy (s : ℤ)
    (f g : integerShiftResolution s ⟶ integerShiftResolution (s+1))
    (h : Homotopy f g) :
    (regularEval (positiveGlobalComponent s (s+1) (s+1)
      (by omega) (by omega) f)).c0 =
    (regularEval (positiveGlobalComponent s (s+1) (s+1)
      (by omega) (by omega) g)).c0 := by
  have hgg : g+g=0 := by
    apply HomologicalComplex.Hom.ext
    funext n
    change g.f n + g.f n = 0
    exact moduleHom_add_self_zero (g.f n)
  have hz := globalAdjacent_constant_null s (f+g)
    ((h.add (Homotopy.refl g)).trans (Homotopy.ofEq hgg))
  have he : positiveGlobalComponent s (s+1) (s+1) (by omega) (by omega) (f+g) =
      positiveGlobalComponent s (s+1) (s+1) (by omega) (by omega) f +
        positiveGlobalComponent s (s+1) (s+1) (by omega) (by omega) g := by
    simp [positiveGlobalComponent, HomologicalComplex.add_f_apply,
      Preadditive.comp_add, Preadditive.add_comp]
  rw [he, regularEval_add] at hz
  have hbin : ∀ a b : ZMod 2, a+b=0 → a=b := by decide
  exact hbin _ _ hz

/-- The same class invariance with an explicit target shift. -/
theorem globalAdjacent_constant_homotopy_of_shift (s t : ℤ) (ht : t=s+1)
    (f g : integerShiftResolution s ⟶ integerShiftResolution t) (h : Homotopy f g) :
    (regularEval (positiveGlobalComponent s t t (by omega) (by omega) f)).c0 =
      (regularEval (positiveGlobalComponent s t t (by omega) (by omega) g)).c0 := by
  subst t
  exact globalAdjacent_constant_homotopy s f g h

/-- An actual square-zero comparison to the original five resolutions cannot
have the original adjacent homotopy classes. The tertiary filler and all
four unit residues are DERIVED in this proof, rather than input fields. -/
theorem StrictZeroComparison.no_original_adjacent_classes (s : ℤ)
    (q : StrictZeroComparison (integerShiftResolution s) (integerShiftResolution (s+1))
      (integerShiftResolution (s+2)) (integerShiftResolution (s+3)) (integerShiftResolution (s+4)))
    (h01 : Homotopy q.cochainData.x01 (canonicalGlobalFourfold s).x01)
    (h12 : Homotopy q.cochainData.x12 (canonicalGlobalFourfold s).x12)
    (h23 : Homotopy q.cochainData.x23 (canonicalGlobalFourfold s).x23)
    (h34 : Homotopy q.cochainData.x34 (canonicalGlobalFourfold s).x34) : False := by
  let a := q.cochainData
  let b := a.secondary
  let g : GlobalFourfoldDefiningSystem s := {
    x01 := a.x01
    x12 := a.x12
    x23 := a.x23
    x34 := a.x34
    x01_unit := (globalAdjacent_constant_homotopy_of_shift s (s+1) (by omega)
      _ _ h01).trans (canonicalGlobalFourfold s).x01_unit
    x12_unit := (globalAdjacent_constant_homotopy_of_shift (s+1) (s+2) (by omega)
      _ _ h12).trans (canonicalGlobalFourfold s).x12_unit
    x23_unit := (globalAdjacent_constant_homotopy_of_shift (s+2) (s+3) (by omega)
      _ _ h23).trans (canonicalGlobalFourfold s).x23_unit
    x34_unit := (globalAdjacent_constant_homotopy_of_shift (s+3) (s+4) (by omega)
      _ _ h34).trans (canonicalGlobalFourfold s).x34_unit
    h02 := b.primary.h02
    h13 := b.primary.h13
    h24 := b.primary.h24
    z03 := b.z03
    z14 := b.z14
    z03_zero := b.z03_zero
    z14_zero := b.z14_zero
    z03_coherence := b.z03_coherence
    z14_coherence := b.z14_coherence }
  exact g.no_tertiary_filler ⟨q.tertiary⟩

/-- Equality of derived morphisms from an original resolution is reflected
by an actual chain homotopy. Only source-side K-projectivity is needed. -/
noncomputable def originalMapHomotopyOfDerivedEq [HasDerivedCategory (ModuleCat B)] (s : ℤ)
    {Q : C4Complex} (f g : integerShiftResolution s ⟶ Q)
    (he : DerivedCategory.Q.map (reverseMap f) = DerivedCategory.Q.map (reverseMap g)) :
    Homotopy f g := by
  haveI := reverseResolution_isKProjective s
  let e := DerivedCategory.quotientCompQhIso (ModuleCat B)
  have hh : (HomotopyCategory.quotient (ModuleCat B) (.up ℤ)).map (reverseMap f) =
      (HomotopyCategory.quotient (ModuleCat B) (.up ℤ)).map (reverseMap g) := by
    apply (CochainComplex.IsKProjective.Qh_map_bijective
      (reverseComplex (integerShiftResolution s))
      ((HomotopyCategory.quotient (ModuleCat B) (.up ℤ)).obj (reverseComplex Q))).injective
    apply (cancel_mono (e.hom.app (reverseComplex Q))).1
    change ((HomotopyCategory.quotient (ModuleCat B) (.up ℤ) ⋙ DerivedCategory.Qh).map
        (reverseMap f)) ≫ _ =
      ((HomotopyCategory.quotient (ModuleCat B) (.up ℤ) ⋙ DerivedCategory.Qh).map
        (reverseMap g)) ≫ _
    rw [e.hom.naturality (reverseMap f), e.hom.naturality (reverseMap g), he]
  let h := HomotopyCategory.homotopyOfEq (reverseMap f) (reverseMap g) hh
  exact chainHomotopyOfCochain f g (CochainComplex.HomComplex.Cochain.ofHomotopy h)
    (by simpa only [cochain_sub] using CochainComplex.HomComplex.δ_ofHomotopy h)

/-- The direct contradiction consumes equality of the four derived adjacent
classes. Their unit residues and an original-system tertiary filler are consequences. -/
theorem StrictZeroComparison.no_original_derived_classes
    [HasDerivedCategory (ModuleCat B)] (s : ℤ)
    (q : StrictZeroComparison (integerShiftResolution s) (integerShiftResolution (s+1))
      (integerShiftResolution (s+2)) (integerShiftResolution (s+3)) (integerShiftResolution (s+4)))
    (h01 : DerivedCategory.Q.map (reverseMap q.cochainData.x01) =
      DerivedCategory.Q.map (reverseMap (canonicalGlobalFourfold s).x01))
    (h12 : DerivedCategory.Q.map (reverseMap q.cochainData.x12) =
      DerivedCategory.Q.map (reverseMap (canonicalGlobalFourfold s).x12))
    (h23 : DerivedCategory.Q.map (reverseMap q.cochainData.x23) =
      DerivedCategory.Q.map (reverseMap (canonicalGlobalFourfold s).x23))
    (h34 : DerivedCategory.Q.map (reverseMap q.cochainData.x34) =
      DerivedCategory.Q.map (reverseMap (canonicalGlobalFourfold s).x34)) : False := by
  exact q.no_original_adjacent_classes s
    (originalMapHomotopyOfDerivedEq s _ _ h01)
    (originalMapHomotopyOfDerivedEq (s+1) _ _ h12)
    (originalMapHomotopyOfDerivedEq (s+2) _ _ h23)
    (originalMapHomotopyOfDerivedEq (s+3) _ _ h34)

#print axioms globalAdjacent_constant_homotopy
#print axioms StrictZeroComparison.no_original_adjacent_classes
#print axioms originalMapHomotopyOfDerivedEq
#print axioms StrictZeroComparison.no_original_derived_classes
end C4
