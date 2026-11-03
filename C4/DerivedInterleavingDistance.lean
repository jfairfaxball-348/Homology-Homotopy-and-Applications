module
public import C4.HomologyInterleavingDistance
public import Mathlib.CategoryTheory.Localization.Predicate
public import Mathlib.Algebra.Homology.DerivedCategory.Basic

@[expose] public section

/-!
# The derived interleaving distance of whole real diagrams

`Ho(M^ℝ)` is modelled by an ARBITRARY localisation functor
`L : (ℝ ⥤ C4Complex) ⥤ D` at the objectwise quasi-isomorphisms of entire real
diagrams. Translation of whole diagrams inverts these, so it lifts to `D`
(`Localization.lift`); a derived `ε`-interleaving consists of morphisms in `D`
whose composites, formed with the lifted translations, are the images of the
natural two-step translation maps. The distance is the `ℝ≥0∞` infimum.

Proved here: the lower bound `1 ≤ dIHC(F, 0)` in every such localisation, by
evaluation at `0` into `D(B)`: for `2ε < 1` the image of the identity of
`P` would vanish, and for `1 ≤ 2ε < 2` the image of the nonzero class `[x]`
would vanish; both are reflected to chain homotopies by the K-projectivity of
the original resolution.

The upper bound is reduced (`derivedInterleaving_one_of_twoShift`) to the
single statement that the whole-diagram two-unit shift of `F` and zero become
equal after localisation. That statement is NOT proved here and no headline
depends on it.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open scoped ENNReal

/-- Objectwise quasi-isomorphisms of entire real diagrams. -/
def objectwiseQuasiIsoOver (R : Type) [Ring R] :
    MorphismProperty (ℝ ⥤ ChainComplex (ModuleCat R) ℤ) :=
  fun _ _ w => ∀ t : ℝ, QuasiIso (w.app t)

abbrev objectwiseQuasiIso := objectwiseQuasiIsoOver B

section Coefficients

variable {R : Type} [Ring R]

/-- Translation of entire real diagrams, as a functor. -/
def translateFunctor (δ : ℝ) : (ℝ ⥤ ChainComplex (ModuleCat R) ℤ) ⥤ (ℝ ⥤ ChainComplex (ModuleCat R) ℤ) :=
  (Functor.whiskeringLeft ℝ ℝ (ChainComplex (ModuleCat R) ℤ)).obj (realTranslation δ)

theorem objectwiseQuasiIso_translate (δ : ℝ) {X Y : ℝ ⥤ ChainComplex (ModuleCat R) ℤ} (w : X ⟶ Y)
    (hw : objectwiseQuasiIsoOver R w) : objectwiseQuasiIsoOver R ((translateFunctor δ).map w) :=
  fun t => hw (t + δ)

/-- The natural two-step translation `X ⟶ (X^ε)^ε` of an entire real diagram. -/
def twoShift (X : ℝ ⥤ ChainComplex (ModuleCat R) ℤ) (ε : ℝ) (hε : 0 ≤ ε) :
    X ⟶ translateDiagram (translateDiagram X ε) ε where
  app u := X.map (homOfLE (show u ≤ (u + ε) + ε by linarith))
  naturality u v f := by
    dsimp [translateDiagram, realTranslation]
    rw [← X.map_comp, ← X.map_comp]
    congr 1

section Localization

universe w' w
variable {D : Type w} [Category.{w'} D] (L : (ℝ ⥤ ChainComplex (ModuleCat R) ℤ) ⥤ D)
  [L.IsLocalization (objectwiseQuasiIsoOver R)]

theorem translateFunctor_comp_inverts (δ : ℝ) :
    (objectwiseQuasiIsoOver R).IsInvertedBy (translateFunctor δ ⋙ L) := fun _ _ w hw =>
  Localization.inverts L (objectwiseQuasiIsoOver R) _ (objectwiseQuasiIso_translate δ w hw)

/-- The translation functor of the localised category. -/
noncomputable def derivedTranslate (δ : ℝ) : D ⥤ D :=
  Localization.lift (translateFunctor δ ⋙ L) (translateFunctor_comp_inverts L δ) L

noncomputable def derivedTranslateIso (δ : ℝ) :
    L ⋙ derivedTranslate L δ ≅ translateFunctor δ ⋙ L :=
  Localization.fac _ _ _

/-- Translate a morphism of the localised category between images of diagrams. -/
noncomputable def derivedTranslateMap (δ : ℝ) {X Y : ℝ ⥤ ChainComplex (ModuleCat R) ℤ}
    (ψ : L.obj X ⟶ L.obj Y) :
    L.obj (translateDiagram X δ) ⟶ L.obj (translateDiagram Y δ) :=
  (derivedTranslateIso L δ).inv.app X ≫ (derivedTranslate L δ).map ψ ≫
    (derivedTranslateIso L δ).hom.app Y

theorem derivedTranslateMap_map (δ : ℝ) {X Y : ℝ ⥤ ChainComplex (ModuleCat R) ℤ} (f : X ⟶ Y) :
    derivedTranslateMap L δ (L.map f) = L.map ((translateFunctor δ).map f) := by
  have h := (derivedTranslateIso L δ).hom.naturality f
  simp only [Functor.comp_map] at h
  rw [derivedTranslateMap, h, Iso.inv_hom_id_app_assoc]

/-- A derived `ε`-interleaving of entire real diagrams in the localisation. -/
structure DerivedRealInterleaving (X Y : ℝ ⥤ ChainComplex (ModuleCat R) ℤ) (ε : ℝ) (hε : 0 ≤ ε) where
  forward : L.obj X ⟶ L.obj (translateDiagram Y ε)
  backward : L.obj Y ⟶ L.obj (translateDiagram X ε)
  forward_backward : forward ≫ derivedTranslateMap L ε backward = L.map (twoShift X ε hε)
  backward_forward : backward ≫ derivedTranslateMap L ε forward = L.map (twoShift Y ε hε)

/-- The derived interleaving distance in `[0, ∞]`. -/
noncomputable def derivedInterleavingDistance (X Y : ℝ ⥤ ChainComplex (ModuleCat R) ℤ) : ℝ≥0∞ :=
  ⨅ ε ∈ {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (DerivedRealInterleaving L X Y ε hε)},
    ENNReal.ofReal ε

end Localization

end Coefficients

section

universe w' w
variable {D : Type w} [Category.{w'} D] (L : (ℝ ⥤ C4Complex) ⥤ D)
  [L.IsLocalization objectwiseQuasiIso]

/-- **Reduction of the upper bound.** If the whole-diagram two-unit shift of
`F` and the zero map become equal in the localisation, then `F` and zero are
derived `1`-interleaved. (The hypothesis is the remaining C2 obligation.) -/
noncomputable def derivedInterleaving_one_of_twoShift
    (h : L.map (twoShift realDiagram 1 (by norm_num)) = L.map 0) :
    DerivedRealInterleaving L realDiagram zeroDiagram 1 (by norm_num) where
  forward := L.map 0
  backward := L.map 0
  forward_backward := by
    rw [derivedTranslateMap_map, ← L.map_comp, h, zero_comp]
  backward_forward := by
    rw [derivedTranslateMap_map, ← L.map_comp]
    congr 1
    apply NatTrans.ext
    funext u
    exact (HomologicalComplex.isZero_zero).eq_of_src _ _

end

/-! ### The lower bound by evaluation at `0` -/

/-- Reversal as a functor to cochain complexes. -/
def reverseFunctor : C4Complex ⥤ CochainComplex (ModuleCat B) ℤ where
  obj := reverseComplex
  map := reverseMap
  map_id _ := rfl
  map_comp _ _ := rfl

theorem reverseComplex_zero_isZero : IsZero (reverseComplex zeroComplex) := by
  rw [IsZero.iff_id_eq_zero]
  apply HomologicalComplex.hom_ext
  intro i
  exact (isZero_zero (ModuleCat B)).eq_of_src _ _

section Evaluation

variable [hD : HasDerivedCategory (ModuleCat.{0} B)]
include hD

/-- Evaluation at the real time `0`, followed by the derived category of `B`. -/
noncomputable def evalZeroDerived : (ℝ ⥤ C4Complex) ⥤ DerivedCategory (ModuleCat B) :=
  (evaluation ℝ C4Complex).obj 0 ⋙ reverseFunctor ⋙ DerivedCategory.Q

theorem evalZeroDerived_inverts : objectwiseQuasiIso.IsInvertedBy evalZeroDerived := by
  intro X Y w hw
  have := hw 0
  change IsIso (DerivedCategory.Q.map (reverseMap (w.app 0)))
  infer_instance

universe w' w
variable {D : Type w} [Category.{w'} D] (L : (ℝ ⥤ C4Complex) ⥤ D)
  [L.IsLocalization objectwiseQuasiIso]

/-- A derived interleaving with zero forces the evaluated two-step map to vanish
in `D(B)`. -/
theorem derivedInterleaving_zero_eval {X : ℝ ⥤ C4Complex} {ε : ℝ} {hε : 0 ≤ ε}
    (I : DerivedRealInterleaving L X zeroDiagram ε hε) :
    DerivedCategory.Q.map (reverseMap
      (X.map (homOfLE (show (0 : ℝ) ≤ (0 + ε) + ε by linarith)))) = 0 := by
  let G' := Localization.lift evalZeroDerived evalZeroDerived_inverts L
  let e : L ⋙ G' ≅ evalZeroDerived := Localization.fac _ _ _
  have hZ : IsZero (G'.obj (L.obj (translateDiagram zeroDiagram ε))) :=
    IsZero.of_iso (Functor.map_isZero DerivedCategory.Q reverseComplex_zero_isZero)
      (e.app _)
  have h1 := congrArg G'.map I.forward_backward
  rw [G'.map_comp, show G'.map I.forward = 0 from hZ.eq_of_tgt _ _, zero_comp] at h1
  have h2 := e.hom.naturality (twoShift X ε hε)
  simp only [Functor.comp_map] at h2
  rw [← h1, zero_comp] at h2
  have h3 : evalZeroDerived.map (twoShift X ε hε) = 0 := by
    rw [← cancel_epi (e.hom.app X), comp_zero, ← h2]
  exact h3

/-- Every K-projective comparison: a vanishing derived image of a map out of an
original resolution is a nullhomotopy. -/
theorem homotopy_zero_of_Q_map_eq_zero (s : ℤ) {Y : C4Complex}
    (f : integerShiftResolution s ⟶ Y)
    (hf : DerivedCategory.Q.map (reverseMap f) = 0) : Nonempty (Homotopy f 0) :=
  ⟨originalMapHomotopyOfDerivedEq s f 0 (by rw [hf, reverseMap_zero, Functor.map_zero])⟩

/-- For `0 ≤ t < 2`, the evaluated structure map `F(0) → F(t)` survives in `D(B)`. -/
theorem realDiagram_Q_map_ne_zero {t : ℝ} (h0 : 0 ≤ t) (h2 : t < 2) :
    DerivedCategory.Q.map (reverseMap (realDiagram.map (homOfLE h0))) ≠ 0 := by
  intro hz
  have ha : realStage 0 = 1 := by
    rw [realStage_on_interval (0 : Fin 5) 0 (by norm_num) (by norm_num)]
    rfl
  let e : integerShiftResolution 0 ⟶ realDiagram.obj 0 :=
    eqToHom (congrArg c4Stages.obj ha).symm
  have hze : DerivedCategory.Q.map (reverseMap (e ≫ realDiagram.map (homOfLE h0))) = 0 := by
    rw [reverseMap_comp, Functor.map_comp, hz, comp_zero]
  obtain ⟨H⟩ := homotopy_zero_of_Q_map_eq_zero 0 _ hze
  by_cases h1 : t < 1
  · have hb : realStage t = 1 := by
      rw [realStage_on_interval (0 : Fin 5) t (by simpa using h0) (by simpa using h1)]
      rfl
    have hiso : IsIso (e ≫ realDiagram.map (homOfLE h0)) := by
      have := realDiagram_map_first_stage_isIso h0 h1
      infer_instance
    have hm := H.homologyMap_eq 0
    rw [HomologicalComplex.homologyMap_zero] at hm
    have hzero : IsZero ((integerShiftResolution 0).homology 0) := by
      rw [IsZero.iff_id_eq_zero]
      have e1 := IsIso.hom_inv_id (HomologicalComplex.homologyMap
        (e ≫ realDiagram.map (homOfLE h0)) 0)
      have e2 := congrArg (fun g => g ≫ inv (HomologicalComplex.homologyMap
        (e ≫ realDiagram.map (homOfLE h0)) 0)) hm
      simp only [zero_comp] at e2
      rw [← e1, e2]
    have hex := (HomologicalComplex.exactAt_iff_isZero_homology _ _).2 hzero
    rw [integerShiftResolution_exactAt_iff_ne] at hex
    exact hex rfl
  · have hb : realStage t = 2 := by
      rw [realStage_on_interval (1 : Fin 5) t (by simp; linarith) (by norm_num; linarith)]
      rfl
    have hmap := realDiagram_map_eq_stage h0 (show (1 : Fin 7) ≤ 2 by decide) ha hb
    have hx : e ≫ realDiagram.map (homOfLE h0) =
        globalXChainMap 0 ≫ eqToHom (congrArg c4Stages.obj hb).symm := by
      rw [hmap]
      simp only [e, eqToHom_trans_assoc, eqToHom_refl, Category.id_comp]
      rfl
    rw [hx] at H
    have H' : Homotopy (globalXChainMap 0) 0 :=
      (Homotopy.ofEq (by simp)).trans
        ((H.compRight (eqToHom (congrArg c4Stages.obj hb))).trans (Homotopy.ofEq (by simp)))
    exact globalAdjacent_nonnull 0 _ (globalXChainMap_first_residue_unit 0) ⟨H'⟩

/-- **No derived interleaving of `F` with zero below `1`.** -/
theorem derivedInterleaving_ge_one {ε : ℝ} {hε : 0 ≤ ε}
    (I : DerivedRealInterleaving L realDiagram zeroDiagram ε hε) : 1 ≤ ε := by
  by_contra hlt
  replace hlt : ε < 1 := not_le.mp hlt
  exact realDiagram_Q_map_ne_zero (t := (0 + ε) + ε) (by linarith) (by linarith)
    (derivedInterleaving_zero_eval L I)

end Evaluation

universe w' w

/-- `1 ≤ dIHC(F, 0)`, in EVERY localisation of whole real diagrams at objectwise
quasi-isomorphisms. -/
theorem one_le_derivedInterleavingDistance {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ C4Complex) ⥤ D) [L.IsLocalization objectwiseQuasiIso] :
    ENNReal.ofReal 1 ≤ derivedInterleavingDistance L realDiagram zeroDiagram := by
  letI := HasDerivedCategory.standard (ModuleCat.{0} B)
  exact le_iInf₂ fun _ ⟨_, ⟨I⟩⟩ =>
    ENNReal.ofReal_le_ofReal (derivedInterleaving_ge_one L I)

#print axioms one_le_derivedInterleavingDistance
#print axioms derivedInterleaving_one_of_twoShift

end C4
